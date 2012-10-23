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
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Xml;
using System.Web.UI.WebControls;
using System.IO;

using Profiles.Framework.Utilities;
using System.Web.UI.HtmlControls;

namespace Profiles.Error
{
    public partial class Default : System.Web.UI.Page
    {
        Profiles.Framework.Template masterpage;

        protected void Page_Load(object sender, EventArgs e)
        {
            masterpage = (Framework.Template)base.Master;

            masterpage.Tab = "";
            masterpage.RDFData = null;
            LoadAssets();
            XmlDocument presentationxml = new XmlDocument();
            presentationxml.LoadXml(System.IO.File.ReadAllText(AppDomain.CurrentDomain.BaseDirectory + "/Error/PresentationXML/ErrorPresentation.xml"));
            masterpage.PresentationXML = presentationxml;

        }

        private void LoadAssets()
        {
            HtmlLink UCSFcss = new HtmlLink();
            UCSFcss.Href = Root.Domain + "/Error/CSS/UCSF.css";
            UCSFcss.Attributes["rel"] = "stylesheet";
            UCSFcss.Attributes["type"] = "text/css";
            UCSFcss.Attributes["media"] = "all";
            Page.Header.Controls.Add(UCSFcss);

            HtmlGenericControl UCSFjs = new HtmlGenericControl("script");
            UCSFjs.Attributes.Add("type", "text/javascript");
            UCSFjs.Attributes.Add("src", Root.Domain + "/Error/JavaScript/UCSF.js");
            Page.Header.Controls.Add(UCSFjs);
        }
    }
}
