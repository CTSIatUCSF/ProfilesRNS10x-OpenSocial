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
using System.Web;
using System.Web.Caching;

using Profiles.Profile.Utilities;
using System.IO;
using System.Collections.Specialized;
using System.Diagnostics;
using System.Reflection;

namespace Profiles.Framework.Utilities
{
    /// <summary>
    ///     This class is used for all database IO of the web data layer of profiles.  
    ///     Plus contains generic data base IO methods for building Command Objects, Data Readers ect...
    /// 
    /// </summary>
    public partial class DataIO
    {
        public string _ErrorMsg = "";
        public string _ErrorNumber = "";

        #region "GetPropertyList"

        public XmlDocument GetPropertyList(XmlDocument rdf, XmlDocument presentation, string propertyuri, bool withcounts, bool showall, bool cache)
        {
            string xmlstr = string.Empty;
            XmlDocument xmlrtn = new XmlDocument();
            string key = rdf.InnerXml + presentation.InnerXml + propertyuri + withcounts.ToString() + showall.ToString();
            SessionManagement sm = new SessionManagement();

            if (Framework.Utilities.Cache.Fetch(key) == null || !cache)
            {

                Framework.Utilities.DebugLogging.Log("{CLOUD} DATA BASE start GetPropertyList(XmlDocument rdf, XmlDocument presentation, string propertyuri, bool withcounts, bool showall)");
                string connstr = ConfigurationManager.ConnectionStrings["ProfilesDB"].ConnectionString;

                SqlConnection dbconnection = new SqlConnection(connstr);
                SqlCommand dbcommand = new SqlCommand();

                SqlDataReader dbreader = null;
                try
                {
                    dbconnection.Open();
                    dbcommand.CommandType = CommandType.StoredProcedure;

                    dbcommand.CommandTimeout = this.GetCommandTimeout();

                    dbcommand.CommandText = "[RDF.].GetPropertyList";
                    dbcommand.Parameters.Add(new SqlParameter("@RDFStr", rdf.OuterXml));
                    dbcommand.Parameters.Add(new SqlParameter("@PresentationXML", presentation.OuterXml));
                    dbcommand.Parameters.Add(new SqlParameter("@returnXMLasStr", true));


                    if (withcounts)
                        dbcommand.Parameters.Add(new SqlParameter("@CountsOnly", 1));
                    else
                        dbcommand.Parameters.Add(new SqlParameter("@CountsOnly", 0));

                    if (showall)
                        dbcommand.Parameters.Add(new SqlParameter("@ShowAllProperties", 1));
                    else
                        dbcommand.Parameters.Add(new SqlParameter("@ShowAllProperties", 0));

                    if (propertyuri != string.Empty)
                    {
                        dbcommand.Parameters.Add(new SqlParameter("@PropertyURI", propertyuri));
                    }

                    dbcommand.Connection = dbconnection;

                    dbreader = dbcommand.ExecuteReader(CommandBehavior.CloseConnection);
                    Framework.Utilities.DebugLogging.Log("{CLOUD} DATA BASE end GetPropertyList(XmlDocument rdf, XmlDocument presentation, string propertyuri, bool withcounts, bool showall)");

                    while (dbreader.Read())
                    {
                        xmlstr += dbreader[0].ToString();
                    }

                    xmlrtn.LoadXml(xmlstr);

                    Framework.Utilities.Cache.Set(key, xmlrtn);
                    xmlstr = string.Empty;

                }
                catch (Exception e)
                {
                    Framework.Utilities.DebugLogging.Log(e.Message + e.StackTrace);
                    throw new Exception(e.Message);
                }
                finally
                {
                    if (dbreader != null && !dbreader.IsClosed)
                        dbreader.Close();

                    if (dbcommand.Connection.State != ConnectionState.Closed)
                        dbcommand.Connection.Close();
                }
            }
            else
            {
                Framework.Utilities.DebugLogging.Log("{CLOUD} CACHE start GetPropertyList(XmlDocument rdf, XmlDocument presentation, string propertyuri, bool withcounts, bool showall)");
                xmlrtn = Framework.Utilities.Cache.Fetch(key);
                Framework.Utilities.DebugLogging.Log("{CLOUD} CACHE end GetPropertyList(XmlDocument rdf, XmlDocument presentation, string propertyuri, bool withcounts, bool showall)");
            }

            return xmlrtn;
        }

        public XmlDocument GetPropertyRangeList(string propertyuri)
        {
            string xmlstr = string.Empty;
            XmlDocument xmlrtn = new XmlDocument();
            string key = propertyuri;
            SessionManagement sm = new SessionManagement();

            if (Framework.Utilities.Cache.Fetch(key) == null)
            {
                Framework.Utilities.DebugLogging.Log("{CLOUD} DATA BASE start GetPropertyRangeList(propertyuri)");
                string connstr = ConfigurationManager.ConnectionStrings["ProfilesDB"].ConnectionString;

                SqlConnection dbconnection = new SqlConnection(connstr);
                SqlCommand dbcommand = new SqlCommand();

                SqlDataReader dbreader = null;
                try
                {
                    dbconnection.Open();
                    dbcommand.CommandType = CommandType.StoredProcedure;

                    dbcommand.CommandTimeout = this.GetCommandTimeout();

                    dbcommand.CommandText = "[rdf.].getpropertyrangelist";

                    dbcommand.Parameters.Add(new SqlParameter("@PropertyURI", propertyuri));

                    dbcommand.Connection = dbconnection;

                    dbreader = dbcommand.ExecuteReader(CommandBehavior.CloseConnection);
                    Framework.Utilities.DebugLogging.Log("{CLOUD} DATA BASE end GetPresentationData(rdf, presentation)");

                    while (dbreader.Read())
                    {
                        xmlstr += dbreader[0].ToString();
                    }

                    xmlrtn.LoadXml(xmlstr);

                    Framework.Utilities.Cache.Set(key, xmlrtn);
                    xmlstr = string.Empty;

                }
                catch (Exception e)
                {
                    Framework.Utilities.DebugLogging.Log(e.Message + e.StackTrace);
                    throw new Exception(e.Message);
                }
                finally
                {
                    if (dbreader != null && !dbreader.IsClosed)
                        dbreader.Close();

                    if (dbcommand.Connection.State != ConnectionState.Closed)
                        dbcommand.Connection.Close();
                }
            }
            else
            {
                Framework.Utilities.DebugLogging.Log("{CLOUD} CACHE start GetPresentationData(rdf, presentation)");
                xmlrtn = Framework.Utilities.Cache.Fetch(key);
                Framework.Utilities.DebugLogging.Log("{CLOUD} CACHE end GetPresentationData(rdf, presentation)");
            }

            return xmlrtn;


        }

        #endregion

        #region "RESOLVE"


        /// <summary>
        ///     Method used to resolve the RESTful URL for Entities and Relationships.  The Profiles framwork contains a database stored procedure that is used to process
        ///   the application and 9 URL parameters in the RESTful URL Pattern that is defined in the RegisterRoutes method of the Global.asax file.
        ///   
        /// </summary>
        /// <param name="applicaitonname"> the applictionname is Param0 in the RESTful URL pattern in the Global.asax file.  The default install of Profiles has an application name of "profile"</param>
        /// <param name="param1">Param1 in the RESTful URL pattern in the RegisterRoutes method of the Global.asax file</param>
        /// <param name="param2">Param2 in the RESTful URL pattern in the RegisterRoutes method of the Global.asax file</param>
        /// <param name="param3">Param3 in the RESTful URL pattern in the RegisterRoutes method of the Global.asax file</param>
        /// <param name="param4">Param4 in the RESTful URL pattern in the RegisterRoutes method of the Global.asax file</param>
        /// <param name="param5">Param5 in the RESTful URL pattern in the RegisterRoutes method of the Global.asax file</param>
        /// <param name="param6">Param6 in the RESTful URL pattern in the RegisterRoutes method of the Global.asax file</param>
        /// <param name="param7">Param7 in the RESTful URL pattern in the RegisterRoutes method of the Global.asax file</param>
        /// <param name="param8">Param8 in the RESTful URL pattern in the RegisterRoutes method of the Global.asax file</param>
        /// <param name="param9">Param9 in the RESTful URL pattern in the RegisterRoutes method of the Global.asax file</param>
        /// <param name="sessionid">The Profiles custom SessionID used to track the users navigation and activity that is stored as a Profiles Network.</param>
        /// <returns></returns>
        public URLResolve GetResolvedURL(string applicationname,
                                        string param1,
                                        string param2,
                                        string param3,
                                        string param4,
                                        string param5,
                                        string param6,
                                        string param7,
                                        string param8,
                                        string param9,
                                        string sessionid,
                                        string resturl,
                                        string useragent,
                                        string contenttype)
        {

            //Add the URL from the browser and then the full

            URLResolve rtn = null;

            SqlDataReader dbreader = null;
            try
            {
                SqlParameter[] param = new SqlParameter[14];
                param[0] = new SqlParameter("@ApplicationName", applicationname);
                param[1] = new SqlParameter("@param1", param1);
                param[2] = new SqlParameter("@param2", param2);
                param[3] = new SqlParameter("@param3", param3);
                param[4] = new SqlParameter("@param4", param4);
                param[5] = new SqlParameter("@param5", param5);
                param[6] = new SqlParameter("@param6", param6);
                param[7] = new SqlParameter("@param7", param7);
                param[8] = new SqlParameter("@param8", param8);
                param[9] = new SqlParameter("@param9", param9);
                param[10] = new SqlParameter("@SessionID", sessionid);
                param[11] = new SqlParameter("@resturl", resturl);
                param[12] = new SqlParameter("@useragent", useragent);
                param[13] = new SqlParameter("@ContentType", contenttype);

                dbreader = GetSQLDataReader(GetDBCommand("", "[Framework.].[ResolveURL]", CommandType.StoredProcedure, CommandBehavior.CloseConnection, param));
                dbreader.Read();

                rtn = new URLResolve(Convert.ToBoolean(dbreader["Resolved"]), dbreader["ErrorDescription"].ToString(), dbreader["ResponseURL"].ToString(),
                    dbreader["ResponseContentType"].ToString(), dbreader["ResponseStatusCode"].ToString(), Convert.ToBoolean(dbreader["ResponseRedirect"]), Convert.ToBoolean(dbreader["ResponseIncludePostData"]));

            }
            catch (Exception ex)
            {
                if (rtn == null)
                {
                    rtn = new URLResolve(false, "error with data", "", "", "", false, false);
                }
                Framework.Utilities.DebugLogging.Log(ex.Message + " ++ " + ex.StackTrace);
            }
            finally
            {
                //Always close your readers
                if (dbreader != null && !dbreader.IsClosed)
                    dbreader.Close();

            }

            return rtn;
        }



        #endregion

        #region "REST"

        public SqlDataReader GetRESTApplications()
        {
            // UCSF  Order matter so that Jane.Doe.2 does not get picked up by Jane.Doe
            string sql = "Select * from [Framework.].RestPath with(nolock) order by len(ApplicationName) desc";

            SqlDataReader sqldr = this.GetSQLDataReader("", sql, CommandType.Text, CommandBehavior.CloseConnection, null);

            return sqldr;
        }
        public string GetRESTBasePath()
        {
            string rtn = string.Empty;

            if (Framework.Utilities.Cache.FetchObject("GetRESTBasePath") == null)
            {

                string sql = "select [value] from [Framework.].[parameter] with(nolock) where parameterid = 'basepath'";

                SqlDataReader sqldr = this.GetSQLDataReader("", sql, CommandType.Text, CommandBehavior.CloseConnection, null);

                while (sqldr.Read())
                {
                    rtn = sqldr[0].ToString();
                }

                Framework.Utilities.Cache.Set("GetRESTBasePath", rtn, 10000);
            }
            else
            {
                rtn = (string)Framework.Utilities.Cache.FetchObject("GetRESTBasePath");
            }

            return rtn;
        }

        public string GetRESTBaseURI()
        {
            string rtn = string.Empty;

            if (Framework.Utilities.Cache.FetchObject("GetRESTBaseURI") == null)
            {

                string sql = "select [value] from [Framework.].[parameter] with(nolock) where parameterid = 'baseuri'";

                SqlDataReader sqldr = this.GetSQLDataReader("", sql, CommandType.Text, CommandBehavior.CloseConnection, null);

                while (sqldr.Read())
                {
                    rtn = sqldr[0].ToString();
                }

                Framework.Utilities.Cache.Set("GetRESTBaseURI", rtn, 10000);
            }
            else
            {
                rtn = (string)Framework.Utilities.Cache.FetchObject("GetRESTBaseURI");
            }

            return rtn;
        }
        #endregion

        public Int64 GetSessionSecurityGroup()
        {

            string connstr = ConfigurationManager.ConnectionStrings["ProfilesDB"].ConnectionString;
            SessionManagement sm = new SessionManagement();

            SqlConnection dbconnection = new SqlConnection(connstr);
            Int64 accesscode = 0;

            SqlParameter[] param;

            param = new SqlParameter[4];

            SqlCommand dbcommand = new SqlCommand();

            dbconnection.Open();

            dbcommand.CommandTimeout = this.GetCommandTimeout();

            param[0] = new SqlParameter("@SessionID", sm.Session().SessionID);
            param[1] = new SqlParameter("@securitygroupid", 0);
            param[1].Direction = ParameterDirection.Output;
            param[2] = new SqlParameter("@hasspecialviewaccess", 0);
            param[2].Direction = ParameterDirection.Output;
            param[3] = new SqlParameter("@hasspecialeditaccess", 0);
            param[3].Direction = ParameterDirection.Output;

            dbcommand.Connection = dbconnection;

            try
            {
                //For Output Parameters you need to pass a connection object to the framework so you can close it before reading the output params value.
                ExecuteSQLDataCommand(GetDBCommand(ref dbconnection, "[RDF.Security].[GetSessionSecurityGroup]", CommandType.StoredProcedure, CommandBehavior.CloseConnection, param));


            }
            catch (Exception ex)
            {
            }
            finally
            {
                if (dbcommand.Connection.State != ConnectionState.Closed)
                    dbcommand.Connection.Close();
            }

            if (param[1] != null)
                accesscode = Convert.ToInt64(param[1].Value);

            return accesscode;


        }





        #region "DB SQL.NET Methods"

        /// <summary>
        /// returns sqlconnection object
        /// </summary>
        /// <param name="Connectionstring"></param>
        /// <returns></returns>
        public SqlConnection GetDBConnection(string Connectionstring)
        {
            if (Connectionstring.CompareTo("") == 0)
                Connectionstring = ConfigurationManager.ConnectionStrings["ProfilesDB"].ConnectionString;
            else
            {
                if (Connectionstring.Length < 25)
                    Connectionstring = ConfigurationManager.ConnectionStrings[Connectionstring].ConnectionString;
            }
            SqlConnection dbsqlconnection = new SqlConnection(Connectionstring);
            try
            {
                dbsqlconnection.Open();
            }
            catch (Exception ex)
            {
                Framework.Utilities.DebugLogging.Log(ex.Message);
                Framework.Utilities.DebugLogging.Log(ex.StackTrace);
            }
            return dbsqlconnection;
        }

        public SqlCommand GetDBCommand(SqlConnection sqlcn, String CmdText, CommandType CmdType, CommandBehavior CmdBehavior, SqlParameter[] sqlParam)
        {
            SqlCommand sqlcmd = null;

            try
            {
                sqlcmd = new SqlCommand(CmdText, sqlcn);
                sqlcmd.CommandType = CmdType;

                sqlcmd.CommandTimeout = GetCommandTimeout();

                Framework.Utilities.DebugLogging.Log("CONNECTION STRING " + sqlcn.ConnectionString);
                Framework.Utilities.DebugLogging.Log("COMMAND TEXT " + CmdText);
                Framework.Utilities.DebugLogging.Log("COMMAND TYPE " + CmdType.ToString());
                if (sqlParam != null)
                    Framework.Utilities.DebugLogging.Log("NUMBER OF PARAMS " + sqlParam.Length);

                if (sqlParam != null)
                    AddSQLParameters(sqlcmd, sqlParam);

            }
            catch (Exception ex)
            {
                Framework.Utilities.DebugLogging.Log(ex.Message);
                Framework.Utilities.DebugLogging.Log(ex.StackTrace);
            }
            return sqlcmd;
        }

        public SqlCommand GetDBCommand(string SqlConnectionString, String CmdText, CommandType CmdType, CommandBehavior CmdBehavior, SqlParameter[] sqlParam)
        {

            SqlCommand sqlcmd = null;

            try
            {
                sqlcmd = new SqlCommand(CmdText, GetDBConnection(SqlConnectionString));
                sqlcmd.CommandType = CmdType;
                sqlcmd.CommandTimeout = GetCommandTimeout();
                Framework.Utilities.DebugLogging.Log("CONNECTION STRING " + SqlConnectionString);
                Framework.Utilities.DebugLogging.Log("COMMAND TEXT " + CmdText);
                Framework.Utilities.DebugLogging.Log("COMMAND TYPE " + CmdType.ToString());
                if (sqlParam != null)
                    Framework.Utilities.DebugLogging.Log("NUMBER OF PARAMS " + sqlParam.Length);


                if (sqlParam != null)
                    AddSQLParameters(sqlcmd, sqlParam);


            }
            catch (Exception ex)
            {
                Framework.Utilities.DebugLogging.Log(ex.Message);
                Framework.Utilities.DebugLogging.Log(ex.StackTrace);
            }
            return sqlcmd;
        }

        public SqlCommand GetDBCommand(ref SqlConnection cn, String CmdText, CommandType CmdType, CommandBehavior CmdBehavior, SqlParameter[] sqlParam)
        {

            cn = GetDBConnection("");
            SqlCommand sqlcmd = null;

            try
            {
                sqlcmd = new SqlCommand(CmdText, cn);
                sqlcmd.CommandType = CmdType;
                sqlcmd.CommandTimeout = GetCommandTimeout();
                if (sqlParam != null)
                    AddSQLParameters(sqlcmd, sqlParam);

            }
            catch (Exception ex)
            {
                Framework.Utilities.DebugLogging.Log(ex.Message);
                Framework.Utilities.DebugLogging.Log(ex.StackTrace);
            }

            return sqlcmd;
        }

        public void AddSQLParameters(SqlCommand sqlcmd, SqlParameter[] sqlParam)
        {
            for (int i = 0; i < sqlParam.GetLength(0); i++)
            {
                if (sqlParam[i] == null)
                    break;

                sqlcmd.Parameters.Add(sqlParam[i]);
                sqlcmd.Parameters[i].Direction = sqlParam[i].Direction;

                if (sqlParam[i].Value != "")
                    Framework.Utilities.DebugLogging.Log("SQL PARAM " + i + " : " + sqlParam[i] + " " + sqlParam[i].Value);
            }
        }

        public SqlDataReader GetSQLDataReader(SqlCommand sqlcmd)
        {
            SqlDataReader sqldr = null;
            try
            {

                if (sqlcmd.Connection == null)
                {
                    sqlcmd.Connection = this.GetDBConnection("");
                }
                else if (sqlcmd.Connection.State == ConnectionState.Closed)
                {
                    sqlcmd.Connection = this.GetDBConnection("");
                }

                sqldr = sqlcmd.ExecuteReader(CommandBehavior.CloseConnection);

            }
            catch (Exception ex)
            {
                Framework.Utilities.DebugLogging.Log("ERROR" + ex.Message);
                Framework.Utilities.DebugLogging.Log("ERROR" + ex.StackTrace);
            }
            return sqldr;

        }

        public SqlDataReader GetSQLDataReader(string ConnectionString, String CmdText, CommandType CmdType, CommandBehavior CmdBehavior, SqlParameter[] sqlParam)
        {

            SqlDataReader sqldr = null;
            try
            {

                sqldr = this.GetSQLDataReader(this.GetDBCommand(ConnectionString, CmdText, CmdType, CmdBehavior, sqlParam));


            }
            catch (Exception ex)
            {
                Framework.Utilities.DebugLogging.Log("ERROR" + ex.Message);
                Framework.Utilities.DebugLogging.Log("ERROR" + ex.StackTrace);
            }
            return sqldr;
        }

        public void ExecuteSQLDataCommand(SqlCommand sqlcmd)
        {
            try
            {
                sqlcmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Framework.Utilities.DebugLogging.Log("ERROR" + ex.Message);
                Framework.Utilities.DebugLogging.Log("ERROR" + ex.StackTrace);
                throw ex;

            }
            finally
            {
                sqlcmd.Dispose();
            }
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
            }
            catch (Exception ex)
            {
                //do nothing

            }
            finally
            {
                if (sqlcmd != null && sqlcmd.Connection.State == ConnectionState.Open)
                {
                    sqlcmd.Connection.Close();
                }
            }

        }

        public void ExecuteSQLDataCommand(SqlCommand sqlcmd, object o)
        {

            try
            {
                o = sqlcmd.ExecuteScalar();
            }
            catch (Exception ex)
            {
                Framework.Utilities.DebugLogging.Log("ERROR" + ex.Message);
                Framework.Utilities.DebugLogging.Log("ERROR" + ex.StackTrace);
            }
            finally
            {
                sqlcmd.Dispose();
            }


        }

        public int GetCommandTimeout()
        {
            return Convert.ToInt32(ConfigurationSettings.AppSettings["COMMANDTIMEOUT"]);

        }

        #endregion

        #region "SESSION"
        /// <summary>
        ///     Used to create a custom Profiles Session instance.  This instance is used to track and store user activity as a form of Profiles Network.
        /// </summary>
        /// <param name="session">ref of Framework.Session object that stores the state of a Profiles user session</param>
        public void SessionCreate(ref Session session)
        {
            SqlDataReader dbreader;
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@RequestIP", session.RequestIP);
            param[1] = new SqlParameter("@UserAgent", session.UserAgent);


            dbreader = GetSQLDataReader(GetDBCommand("", "[User.Session].[CreateSession]", CommandType.StoredProcedure, CommandBehavior.CloseConnection, param));
            if (dbreader != null)
            {
                if (dbreader.Read()) //Returns a data ready with one row of user Session Info.  {Profiles Session Info, not IIS}
                {
                    session.SessionID = dbreader["SessionID"].ToString();
                    session.CreateDate = dbreader["CreateDate"].ToString();
                    session.LastUsedDate = Convert.ToDateTime(dbreader["LastUsedDate"].ToString());

                    Utilities.DebugLogging.Log("Session object created:" + session.SessionID + " On " + session.CreateDate);
                }
                //Always close your readers
                if (!dbreader.IsClosed)
                    dbreader.Close();

            }
            else
            {
                session = null;
            }

        }



        /// <summary>
        ///     Used to create a custom Profiles Session instance.  This instance is used to track and store user activity as a form of Profiles Network.
        /// </summary>
        /// <param name="session">ref of Framework.Session object that stores the state of a Profiles user session</param>
        public void SessionUpdate(ref Session session)
        {

            string connstr = ConfigurationManager.ConnectionStrings["ProfilesDB"].ConnectionString;
            SessionManagement sm = new SessionManagement();

            SqlConnection dbconnection = new SqlConnection(connstr);

            SqlParameter[] param;

            param = new SqlParameter[7];

            SqlCommand dbcommand = new SqlCommand();

            dbconnection.Open();

            dbcommand.CommandTimeout = this.GetCommandTimeout();

            param[0] = new SqlParameter("@SessionID", session.SessionID);
            param[1] = new SqlParameter("@UserID", session.UserID);

            param[2] = new SqlParameter("@LastUsedDate", session.LastUsedDate);


            param[3] = new SqlParameter("@SessionPersonNodeID", 0);
            param[3].Direction = ParameterDirection.Output;

            param[4] = new SqlParameter("@SessionPersonURI", SqlDbType.VarChar, 400);
            param[4].Direction = ParameterDirection.Output;

            // UCSF
            param[5] = new SqlParameter("@ShortDisplayName", SqlDbType.VarChar, 400);
            param[5].Direction = ParameterDirection.Output;

            if (session.LogoutDate > DateTime.Now.AddDays(-5))
            {
                param[6] = new SqlParameter("@LogoutDate", session.LogoutDate.ToString());
            }

            dbcommand.Connection = dbconnection;

            try
            {
                //For Output Parameters you need to pass a connection object to the framework so you can close it before reading the output params value.
                ExecuteSQLDataCommand(GetDBCommand(ref dbconnection, "[User.Session].[UpdateSession]", CommandType.StoredProcedure, CommandBehavior.CloseConnection, param));


            }
            catch (Exception ex) { }

            try
            {
                dbcommand.Connection.Close();
                session.NodeID = Convert.ToInt64(param[3].Value);
                session.PersonURI = param[4].Value.ToString();
                session.ShortDisplayName = param[5].Value.ToString();
            }
            catch (Exception ex)
            {


            }


        }



        #endregion

        #region "ActiveNetwork"
        public SqlDataReader GetActiveNetwork(Int64 subject, bool details)
        {
            SqlDataReader dbreader = null;
            SessionManagement sm = new SessionManagement();
            XmlDocument data = new XmlDocument();
            try
            {

                SqlParameter[] param = new SqlParameter[3];
                param[0] = new SqlParameter("@SessionID", sm.Session().SessionID);

                param[1] = new SqlParameter("@Details", details);

                if (subject == 0)
                    param[2] = new SqlParameter("@Subject", DBNull.Value);
                else
                    param[2] = new SqlParameter("@Subject", subject);

                dbreader = GetSQLDataReader(GetDBCommand("", "[user.account].[relationship.getrelationship]", CommandType.StoredProcedure, CommandBehavior.CloseConnection, param));



            }
            catch (Exception ex)
            {
                Framework.Utilities.DebugLogging.Log(ex.Message + " ++ " + ex.StackTrace);
            }


            return dbreader;

        }

        public void SetActiveNetwork(Int64 subject, string relationshiptype, bool settoexists)
        {
            SessionManagement sm = new SessionManagement();

            try
            {

                SqlParameter[] param = new SqlParameter[4];
                param[0] = new SqlParameter("@SessionID", sm.Session().SessionID);
                param[1] = new SqlParameter("@Subject", subject);

                if (relationshiptype == null)
                    param[2] = new SqlParameter("@RelationshipType", DBNull.Value);
                else
                    param[2] = new SqlParameter("@RelationshipType", relationshiptype);

                param[3] = new SqlParameter("@SetToExists", settoexists);


                GetDBCommand("", "[user.account].[relationship.setrelationship]", CommandType.StoredProcedure, CommandBehavior.CloseConnection, param).ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                Framework.Utilities.DebugLogging.Log(ex.Message + " ++ " + ex.StackTrace);
            }



        }


        #endregion

        #region "ERROR MESSAGES"

        /// <summary>
        /// Property: error message
        /// </summary>
        public string ErrorMessage
        {
            get { return _ErrorMsg; }
            set { _ErrorMsg = value; }
        }

        public string ErrorNumber
        {
            get { return _ErrorNumber; }
            set { _ErrorNumber = value; }
        }

        #endregion

        #region "UCSF Activity Log"

        protected void ActivityLog(int personId, string property, string privacyCode)
        {
            ActivityLog(personId, property, privacyCode, null, null);
        }

        protected void ActivityLog(int personId, string property, string privacyCode, string param1, string param2)
        {
            if (Convert.ToBoolean(ConfigurationSettings.AppSettings["ActivityLog"]) == true)
            {
                SqlConnection dbconnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ProfilesDB"].ConnectionString);
                try
                {
                    int userId = new SessionManagement().Session().UserID;
                    int i = 1;
                    string message = null;
                    do
                    {
                        StackFrame frame = new StackFrame(i++);
                        MethodBase method = frame.GetMethod();
                        message = String.Format("{0}.{1}", method.DeclaringType.FullName, method.Name);
                    } while (message.IndexOf("ActivityLog") != -1);

                    // lookup 
                    //Console.WriteLine(message);
                    List<SqlParameter> param = new List<SqlParameter>();
                    if (userId > 0)
                        param.Add(new SqlParameter("@userId", userId));
                    else
                        param.Add(new SqlParameter("@userId", DBNull.Value));
                    if (personId > 0)
                        param.Add(new SqlParameter("@personId", personId));
                    else
                        param.Add(new SqlParameter("@personId", DBNull.Value));
                    param.Add(new SqlParameter("@methodName", message));
                    if (property != null)
                        param.Add(new SqlParameter("@property", property));
                    else
                        param.Add(new SqlParameter("@property", DBNull.Value));
                    if (privacyCode != null)
                        param.Add(new SqlParameter("@privacyCode", Convert.ToInt32(privacyCode)));
                    else
                        param.Add(new SqlParameter("@privacyCode", DBNull.Value));
                    if (param1 != null)
                        param.Add(new SqlParameter("@param1", param1));
                    else
                        param.Add(new SqlParameter("@param1", DBNull.Value));
                    if (param2 != null)
                        param.Add(new SqlParameter("@param2", param2));
                    else
                        param.Add(new SqlParameter("@param2", DBNull.Value));

                    SqlCommand comm = GetDBCommand(ref dbconnection, "[UCSF].[LogActivity]", CommandType.StoredProcedure, CommandBehavior.CloseConnection, param.ToArray());
                    ExecuteSQLDataCommand(comm);
                    comm.Connection.Close();
                }
                catch (Exception ex)
                {

                }
                finally
                {
                    if (dbconnection.State != ConnectionState.Closed)
                        dbconnection.Close();
                }
            }
        }

        public string GetProperty(Int64 predicateId) 
        {
            SessionManagement sm = new SessionManagement();
            string connstr = ConfigurationManager.ConnectionStrings["ProfilesDB"].ConnectionString;

            SqlConnection dbconnection = new SqlConnection(connstr);
            SqlDataReader reader = null;
            string property = null;

            try
            {

                dbconnection.Open();


                //For Output Parameters you need to pass a connection object to the framework so you can close it before reading the output params value.
                reader = GetDBCommand(dbconnection, "select Property FROM [Ontology.].[ClassProperty] where Class = 'http://xmlns.com/foaf/0.1/Person' and _PropertyNode = " + predicateId.ToString(), CommandType.Text, CommandBehavior.CloseConnection, null).ExecuteReader();
                while (reader.Read())
                {
                    property = reader[0].ToString();
                }
            }
            catch (Exception e)
            {
                Framework.Utilities.DebugLogging.Log(e.Message + e.StackTrace);
                throw new Exception(e.Message);
            }
            finally
            {
                if (reader != null && !reader.IsClosed)
                    reader.Close();

                if (dbconnection.State != ConnectionState.Closed)
                    dbconnection.Close();
            }


            return property;
        }

 
        #endregion

        // Other UCSF extension to fix bug with old style redirects
        public Int64 GetNodeID(int personId)
        {
            SessionManagement sm = new SessionManagement();
            string connstr = ConfigurationManager.ConnectionStrings["ProfilesDB"].ConnectionString;

            SqlConnection dbconnection = new SqlConnection(connstr);
            SqlDataReader reader = null;
            Int64 nodeId = 0;

            try
            {

                dbconnection.Open();


                //For Output Parameters you need to pass a connection object to the framework so you can close it before reading the output params value.
                reader = GetDBCommand(dbconnection, "select i.nodeid from [RDF.Stage].internalnodemap i with(nolock) where [class] = 'http://xmlns.com/foaf/0.1/Person' and i.internalid = " + personId, CommandType.Text, CommandBehavior.CloseConnection, null).ExecuteReader();
                while (reader.Read())
                {
                    nodeId = Convert.ToInt64(reader[0]);
                }
            }
            catch (Exception e)
            {
                Framework.Utilities.DebugLogging.Log(e.Message + e.StackTrace);
                throw new Exception(e.Message);
            }
            finally
            {
                if (reader != null && !reader.IsClosed)
                    reader.Close();

                if (dbconnection.State != ConnectionState.Closed)
                    dbconnection.Close();
            }

            return nodeId;
        }

        public string GetPrettyURL(string personId)
        {
            Framework.Utilities.DebugLogging.Log("Getting PrettyURL for Person=" + personId);
            SessionManagement sm = new SessionManagement();
            string connstr = ConfigurationManager.ConnectionStrings["ProfilesDB"].ConnectionString;

            SqlConnection dbconnection = new SqlConnection(connstr);
            SqlDataReader reader = null;
            string prettyURL = null;

            try
            {

                dbconnection.Open();


                //For Output Parameters you need to pass a connection object to the framework so you can close it before reading the output params value.
                //Force the Convert.ToInt64 in order to preven SQL Injection!!!!
                reader = GetDBCommand(dbconnection, "select URL_NAME from cls.dbo.uniqueNames where 2569307 + cast(SUBSTRING(INDIVIDUAL_ID, 2, 7) as numeric) = " + Convert.ToInt64(personId), CommandType.Text, CommandBehavior.CloseConnection, null).ExecuteReader();
                if (reader.Read())
                {
                    prettyURL = reader[0].ToString();
                }
            }
            catch (Exception e)
            {
                Framework.Utilities.DebugLogging.Log(e.Message + e.StackTrace);
                throw new Exception(e.Message);
            }
            finally
            {
                if (reader != null && !reader.IsClosed)
                    reader.Close();

                if (dbconnection.State != ConnectionState.Closed)
                    dbconnection.Close();
            }
            Framework.Utilities.DebugLogging.Log("Returning PrettyURL = " + prettyURL + " for Person=" + personId);

            return prettyURL;
        }

    }
}
