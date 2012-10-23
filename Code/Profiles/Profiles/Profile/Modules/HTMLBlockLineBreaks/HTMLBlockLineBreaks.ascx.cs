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
using System.Xml.Xsl;
using System.Xml.XPath;

using Profiles.Framework.Utilities;
using Profiles.Profile.Utilities;

namespace Profiles.Profile.Modules.HTMLBlockLineBreaks
{
    public partial class HTMLBlockLineBreaks : BaseModule
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            DrawProfilesModule();
        }

        public HTMLBlockLineBreaks() { }

        public HTMLBlockLineBreaks(XmlDocument pagedata, List<ModuleParams> moduleparams, XmlNamespaceManager pagenamespaces)
            : base(pagedata, moduleparams, pagenamespaces)
        {
        }
        public void DrawProfilesModule()
        {
            string txt = "";
            foreach (XmlNode n in base.BaseData.SelectNodes(base.GetModuleParamString("DataURI"), base.Namespaces))
            {
                txt += "<br />" + n.InnerText.Replace("\n", "<br />");
            }
            lblHTMLBlockLineBreaks.Text = txt;
        }
    }
}