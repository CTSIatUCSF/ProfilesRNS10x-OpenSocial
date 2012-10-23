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
using System.Xml;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.UI.HtmlControls;

using Profiles.Framework.Utilities;
using Profiles.Search.Utilities;

namespace Profiles.ORNG
{
    public partial class GadgetDetails : System.Web.UI.Page
    {
        Profiles.Framework.Template masterpage;

        public void Page_Load(object sender, EventArgs e)
        {
            masterpage = (Framework.Template)base.Master;

            LoadPresentationXML();
            this.LoadAssets();
            masterpage.PresentationXML = this.PresentationXML;

        }

        private void LoadAssets()
        {
            HtmlLink UCSFcss = new HtmlLink();
            UCSFcss.Href = Root.Domain + "/ORNG/CSS/UCSF.css";
            UCSFcss.Attributes["rel"] = "stylesheet";
            UCSFcss.Attributes["type"] = "text/css";
            UCSFcss.Attributes["media"] = "all";
            Page.Header.Controls.Add(UCSFcss);

            HtmlGenericControl UCSFjs = new HtmlGenericControl("script");
            UCSFjs.Attributes.Add("type", "text/javascript");
            UCSFjs.Attributes.Add("src", Root.Domain + "/ORNG/JavaScript/UCSF.js");
            Page.Header.Controls.Add(UCSFjs);
        }

        public void LoadPresentationXML()
        {
            string presentationxml = string.Empty;
            
            presentationxml = System.IO.File.ReadAllText(AppDomain.CurrentDomain.BaseDirectory + "/ORNG/PresentationXML/GadgetDetailsPresentation.xml");
            
            this.PresentationXML = new XmlDocument();
            this.PresentationXML.LoadXml(presentationxml);
            Framework.Utilities.DebugLogging.Log(presentationxml);

        }
        public XmlDocument PresentationXML { get; set; }

      
    }



}
