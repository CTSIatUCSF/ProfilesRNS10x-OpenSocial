﻿/*  
 
    Copyright (c) 2008-2012 by the President and Fellows of Harvard College. All rights reserved.  
    Profiles Research Networking Software was developed under the supervision of Griffin M Weber, MD, PhD.,
    and Harvard Catalyst: The Harvard Clinical and Translational Science Center, with support from the 
    National Center for Research Resources and Harvard University.


    Code licensed under a BSD License. 
    For details, see: LICENSE.txt 
  
*/
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Xml;
using System.Configuration;
using System.Web.Script.Serialization;
using Profiles.Framework.Utilities;

namespace Profiles.CustomAPI.Utilities
{

    public class DataIO : Framework.Utilities.DataIO
    {

        static readonly string PERSON = "Person";
        static readonly string DISAMBIGUATION = "Disambiguation";

        public string GetAllAsJSON()
        {
            Dictionary<string, int> stats = new Dictionary<string, int>();
            stats.Add("profiles", GetProfilesCount());
            stats.Add("publications", GetPublicationsCount());
            stats.Add("edited", GetEditedCount());
            stats.Add("links", GetLinksCount());
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            return serializer.Serialize(stats);
        }

        public int GetEditedCount()
        {
            string sql = "select count(*) from (" +
                "select distinct personid from [Profile.Data].[Person.Photo] union " +
                //"select distinct personid from narratives union " +
                //"select distinct personid from awards union " +
                //"select distinct personid from my_pubs_general union " +
                "select distinct personid from [Profile.Data].[Publication.Person.Add] union " +
                "select distinct personid from [Profile.Data].[Publication.Person.Exclude]) as u;";

            return GetCount(sql);
        }

        public int GetProfilesCount()
        {
            return GetCount("select count(*) from [Profile.Data].[Person] where isactive = 1;");
        }

        public int GetPublicationsCount()
        {
            string sql = "select (select count(distinct(PMID)) from [Profile.Data].[Publication.Person.Include] i join [Profile.Data].[Person] p on p.personid = i.personid where PMID is not null and isactive = 1) + " +
                                "(select count(distinct(MPID)) from [Profile.Data].[Publication.Person.Include] i join [Profile.Data].[Person] p on p.personid = i.personid where MPID is not null and isactive = 1);";
            return GetCount(sql);
        }

        public int GetLinksCount()
        {
            return GetAppRegistryCount(103);
        }

        public string GetPublicationInclusionSource(int personId, string PMID)
        {
            if (PMID == null)
            {
                return PERSON;
            }
            return GetCount("select count(*) from  [Profile.Data].[Publication.Person.Add] where personId = " + personId + " and PMID = " + PMID) > 0 ? PERSON : DISAMBIGUATION;
        }

        public string ProcessPMID(string PMID)
        {
            string sql = "select cast(x as varchar(max)) from [Profile.Data].[Publication.PubMed.AllXML] where pmid = '" + PMID + "';";
            SqlDataReader sqldr = this.GetSQLDataReader("ProfilesDB", sql, CommandType.Text, CommandBehavior.CloseConnection, null);

            if (sqldr.Read())
            {
                return sqldr[0].ToString();
            }
            if (!sqldr.IsClosed)
                sqldr.Close();
            return "";
        }

        private int GetAppRegistryCount(int appId)
        {
            Nullable<int> cnt = (Nullable<int>)Framework.Utilities.Cache.FetchObject("ORNG._appRegistryCount_" + appId);
            if (cnt == null) 
            {
                cnt = GetCount("select count(*) from [ORNG].[AppRegistry] where appId = " + appId + ";");
                Framework.Utilities.Cache.Set("ORNG._appRegistryCount_" + appId, (Nullable<int>)cnt);
            }

            return cnt.Value;
        }

        private int GetCount(string sql)
        {
            Int32 cnt = 0;

            SqlDataReader sqldr = this.GetSQLDataReader("ProfilesDB", sql, CommandType.Text, CommandBehavior.CloseConnection, null);

            if (sqldr.Read())
            {
                cnt = Convert.ToInt32(sqldr[0].ToString());
            }

            if (!sqldr.IsClosed)
                sqldr.Close();

            return cnt;
        }


    }
}
