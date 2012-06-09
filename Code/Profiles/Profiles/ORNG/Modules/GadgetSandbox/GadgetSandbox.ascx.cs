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
using Profiles.ORNG.Utilities;

namespace Profiles.ORNG.Modules.GadgetSandbox
{
    public partial class GadgetSandbox : System.Web.UI.UserControl
    {
        Framework.Utilities.SessionManagement sm;
        string sandboxPassword = String.Empty;
        OpenSocialManager om;

        protected void Page_Load(object sender, EventArgs e)
        {           

            if (!IsPostBack)
            {
                // don't let them in if the configuration is not set up!  You want it this way in production
                if (sandboxPassword == null || sandboxPassword.Length == 0)
                {
                    Response.Redirect(Root.Domain);
                }
                else
                {
                    string gadgetURLs = "";
                    foreach (PreparedGadget gadget in om.GetVisibleGadgets())
                    {
                        gadgetURLs += gadget.GetGadgetURL() + Environment.NewLine;
                    }
                    txtGadgetURLS.Text = gadgetURLs;
                }
            }

        }

        public GadgetSandbox() { }
        public GadgetSandbox(XmlDocument pagedata, List<ModuleParams> moduleparams, XmlNamespaceManager pagenamespaces)
        {
           sm = new Profiles.Framework.Utilities.SessionManagement();
           sandboxPassword = ConfigurationManager.AppSettings["OpenSocial.SandboxPassword"].ToString().Trim();
           if (sandboxPassword != null && sandboxPassword.Length > 0)
           {
               om = OpenSocialManager.GetOpenSocialManager(null, Page, false);
               LoadAssets();
           }
        }

        protected void cmdSubmit_Click(object sender, EventArgs e)
        {

            Profiles.Login.Utilities.DataIO data = new Profiles.Login.Utilities.DataIO();

            Profiles.Login.Utilities.User user = new Profiles.Login.Utilities.User();
            user.UserName = txtUserName.Text.Trim();
            user.Password = txtUserName.Text.Trim();  // works on dev just now, need to change!

            if (sandboxPassword.Equals(txtPassword.Text.Trim()) && data.UserLogin(ref user))
            {
                // add the gadgets
                Session[OpenSocialManager.OPENSOCIAL_GADGETS] = txtGadgetURLS.Text;
                Session[OpenSocialManager.OPENSOCIAL_DEBUG] = chkDebug.Checked;
                Session[OpenSocialManager.OPENSOCIAL_NOCACHE] = !chkUseCache.Checked; 
                Response.Redirect(Root.Domain);
            }
            else
            {
                lblError.Text = "Login failed, please try again";
                txtPassword.Text = "";
                txtPassword.Focus();
            }

        }

        private void LoadAssets()
        {
            HtmlLink Searchcss = new HtmlLink();
            Searchcss.Href = Root.Domain + "/Search/CSS/search.css";
            Searchcss.Attributes["rel"] = "stylesheet";
            Searchcss.Attributes["type"] = "text/css";
            Searchcss.Attributes["media"] = "all";
            Page.Header.Controls.Add(Searchcss);

            Response.Write("<script>var _path = \"" + Root.Domain + "\";</script>");


        }


    }
}