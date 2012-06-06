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
using System.Web.UI.WebControls;
using System.Xml;
using System.Web.UI.HtmlControls;

using Profiles.Login.Utilities;
using Profiles.Framework.Utilities;

namespace Profiles.ORNG.Modules.Gadgets
{
    public partial class Gadgets : BaseModule
    {

        Profiles.ORNG.Utilities.OpenSocialManager om;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (om.IsVisible())
            {
                DrawGadgetsModule();
            }
        }


        public Gadgets() { }
        public Gadgets(XmlDocument pagedata, List<ModuleParams> moduleparams, XmlNamespaceManager pagenamespaces)
        {
            om = new Profiles.ORNG.Utilities.OpenSocialManager(Request.QueryString["Subject"], Page, false);
            if (om.IsVisible())
            {
                LoadAssets();
            }
        }


        private void LoadAssets()
        {
            HtmlLink gadgetscss = new HtmlLink();
            gadgetscss.Href = Root.Domain + "/ORNG/CSS/gadgets.css";
            gadgetscss.Attributes["rel"] = "stylesheet";
            gadgetscss.Attributes["type"] = "text/css";
            gadgetscss.Attributes["media"] = "all";
            Page.Header.Controls.Add(gadgetscss);

            HtmlGenericControl containerjs = new HtmlGenericControl("script");
            containerjs.Attributes.Add("type", "text/javascript");
            containerjs.Attributes.Add("src", om.GetContainerJavascriptSrc());
            Page.Header.Controls.Add(containerjs);

            HtmlGenericControl gadgetjs = new HtmlGenericControl("script");
            gadgetjs.Attributes.Add("type", "text/javascript");
            gadgetjs.InnerHtml = om.GetGadgetJavascipt();
            gadgetjs.Attributes.Add("src", om.GetContainerJavascriptSrc());
            Page.Header.Controls.Add(gadgetjs);

            HtmlGenericControl shindigjs = new HtmlGenericControl("script");
            shindigjs.Attributes.Add("type", "text/javascript");
            shindigjs.Attributes.Add("src", Root.Domain + "/ORNG/JavaScript/shindig.js");
            Page.Header.Controls.Add(shindigjs);
        }

        public void DrawGadgetsModule()
        {
            litGadget.Text = "<div id=\"" + base.GetModuleParamString("DivId") + "\" class=\"gadgets-gadget-parent\"></div>";
        }

    }
}