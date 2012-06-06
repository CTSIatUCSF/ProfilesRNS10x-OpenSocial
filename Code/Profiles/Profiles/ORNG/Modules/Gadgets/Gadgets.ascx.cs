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
                DrawProfilesModule();
            }
        }


        public Gadgets() { }
        public Gadgets(XmlDocument pagedata, List<ModuleParams> moduleparams, XmlNamespaceManager pagenamespaces)
        {
            om = new Profiles.ORNG.Utilities.OpenSocialManager(Request.QueryString["Subject"], Page, false);
        }

        public void DrawProfilesModule()
        {
            litGadget.Text = "<div id=\"" + base.GetModuleParamString("DivId") + "\" class=\"gadgets-gadget-parent\"></div>";
        }

    }
}