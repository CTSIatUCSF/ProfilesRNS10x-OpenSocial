/*  
 
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

using Profiles.Framework.Utilities;

namespace Profiles.ORNG.Utilities
{
    public class DataIO : Framework.Utilities.DataIO
    {

        public SqlDataReader GetGadgetViewRequirements(int appId)
        {
            string sql = "select page, viewer_req, owner_req, [view], closed_width, open_width, start_closed, chromeId, display_order from shindig_app_views where appId = " + appId;
            SqlDataReader sqldr = this.GetSQLDataReader("ProfilesDB", sql, CommandType.Text, CommandBehavior.CloseConnection, null);
            return sqldr;
        }

        public SqlDataReader GetIsRegisteredTo(int appId, string personId)
        {
            string sql = "select count(*) from shindig_app_registry where appId = " + appId + " and personId = '" + personId + "';";
            SqlDataReader sqldr = this.GetSQLDataReader("ProfilesDB", sql, CommandType.Text, CommandBehavior.CloseConnection, null);
            return sqldr;
        }

        public SqlDataReader GetGadgets()
        {
            string sql = "select appId, name, url, channels, enabled from shindig_apps";
            SqlDataReader sqldr = this.GetSQLDataReader("ProfilesDB", sql, CommandType.Text, CommandBehavior.CloseConnection, null);
            return sqldr;
        }

        public void ExecuteSQLDataCommand(string sqltext)
        {

            SqlCommand sqlcmd = null;
            try
            {
                sqlcmd = new SqlCommand(sqltext, GetDBConnection(""));
                sqlcmd.CommandType = CommandType.Text;
                sqlcmd.CommandTimeout = GetCommandTimeout();
                sqlcmd.ExecuteNonQuery();

                if (sqlcmd.Connection.State == ConnectionState.Open)
                {
                    sqlcmd.Connection.Close();
                }
            }
            catch (Exception ex)
            {
                //do nothing

            }

        }

    }
}
