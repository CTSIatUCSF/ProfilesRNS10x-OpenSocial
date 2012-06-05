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
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Web.UI.HtmlControls;
using System.Configuration;

using Profiles.Login.Utilities;
using Profiles.Framework.Utilities;

namespace Profiles.Login.Modules.ShibLogin
{
    public partial class ShibLogin : System.Web.UI.UserControl
    {
        Framework.Utilities.SessionManagement sm;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Request.QueryString["method"].ToString() == "logout")
                {

                    sm.SessionLogout();
                    sm.SessionDistroy();
                    Response.Redirect(Request.QueryString["redirectto"].ToString());
                }
                else if (Request.QueryString["method"].ToString() == "shibboleth")
                {
                    // added by Eric
                    String employeeID = Request.Headers.Get("employeeNumber"); //"025693078";
                    // new IDP
                    if (employeeID == null || employeeID.Trim().Length == 0)
                    {
                        employeeID = Request.Headers.Get("uid"); //"025693078";
                        if (employeeID != null && employeeID.Trim().Length > 9)
                        {
                            employeeID = employeeID.Substring(0, 9);
                        }
                    }
                    if (employeeID != null && employeeID.Trim().Length > 0)
                    {
                        Profiles.Login.Utilities.DataIO data = new Profiles.Login.Utilities.DataIO();
                        Profiles.Login.Utilities.User user = new Profiles.Login.Utilities.User();

                        user.UserName = employeeID;
                        user.Password = employeeID;
                        if (data.UserLogin(ref user))
                        {
                            if (Request.QueryString["redirectto"] == null && Request.QueryString["edit"] == "true")
                                Response.Redirect(Root.Domain + "/edit/" + sm.Session().NodeID);
                            else
                                Response.Redirect(Request.QueryString["redirectto"].ToString());
                            Response.Redirect(Root.Domain);
                        }
                    }
                }
                else if (Request.QueryString["method"].ToString() == "login")
                {
                    // just clicked the button, send them to shibboleth
                    string redirect = Root.Domain + "/login/default.aspx?method=shibboleth";
                    if (Request.QueryString["redirectto"] == null && Request.QueryString["edit"] == "true")
                        redirect += "&edit=true";
                    else
                        redirect += "&redirectto=" + Request.QueryString["redirectto"].ToString();

                    Response.Redirect(ConfigurationManager.AppSettings["ShibbolethLoginURL"].ToString().Trim() +
                        HttpUtility.UrlEncode(redirect));
                }

            }


        }

        public ShibLogin() { }
        public ShibLogin(XmlDocument pagedata, List<ModuleParams> moduleparams, XmlNamespaceManager pagenamespaces)
        {
            sm = new Profiles.Framework.Utilities.SessionManagement();
        }

    }
}