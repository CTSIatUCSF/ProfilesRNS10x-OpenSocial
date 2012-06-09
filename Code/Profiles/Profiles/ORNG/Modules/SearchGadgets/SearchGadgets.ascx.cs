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
using Profiles.ORNG.Utilities;

namespace Profiles.ORNG.Modules.Gadgets
{
    public partial class SearchGadgets : BaseModule
    {

        OpenSocialManager om;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (om.IsVisible())
            {
                DrawProfilesModule();
            }
        }


        public SearchGadgets() { }
        public SearchGadgets(XmlDocument pagedata, List<ModuleParams> moduleparams, XmlNamespaceManager pagenamespaces)
            : base(pagedata, moduleparams, pagenamespaces)
        {
            om = OpenSocialManager.GetOpenSocialManager(null, Page, false);
            List<string> peopleURIs = new List<string>();
            XmlNodeList people = pagedata.GetElementsByTagName("rdf:object");
            for (int i = 0; i < people.Count; i++)
            {
                peopleURIs.Add(people[i].Attributes["rdf:resource"].Value);
            }
            if (peopleURIs.Count > 0)
            {
                om.SetPubsubData(OpenSocialManager.JSON_PERSONID_CHANNEL, OpenSocialManager.BuildJSONPersonIds(peopleURIs, "" + peopleURIs.Count + " people found"));
            }
        }

        public string GetKeyword()
        {
            string searchfor = string.Empty;
            if (Request.QueryString["searchfor"] != null)
                searchfor = Request.QueryString["searchfor"];

            if (Request.Form["txtSearchFor"] != null)
            {
                searchfor = Request.Form["txtSearchFor"];
            }

            return searchfor;
        }

        public void DrawProfilesModule()
        {
            om.LoadAssets();
            pnlOpenSocial.Visible = true;
        }

    }
}