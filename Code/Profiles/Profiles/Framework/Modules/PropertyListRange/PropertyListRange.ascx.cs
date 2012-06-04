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

namespace Profiles.Framework.Modules.PropertyListRange
{
    public partial class PropertyListRange : BaseModule
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.PropertyURI = Request.QueryString["predicateuri"].Replace("!","#");

            DrawProfilesModule();
        }

        public PropertyListRange() { }

        public PropertyListRange(XmlDocument pagedata, List<ModuleParams> moduleparams, XmlNamespaceManager pagenamespaces)
            : base(pagedata, moduleparams, pagenamespaces)
        {
        }
        public void DrawProfilesModule()
        {
            Framework.Utilities.DataIO data = new Profiles.Framework.Utilities.DataIO();

            XmlDocument list  = data.GetPropertyRangeList(this.PropertyURI);
            List <GenericListItem> propertylist = new List<GenericListItem>();
            string space = string.Empty;

            foreach (XmlNode property in list.SelectNodes("PropertyRangeList/PropertyRange"))
            {   
                for(int i=0;i< Convert.ToInt16(property.SelectSingleNode("@Depth").Value);i++){
                    space += Server.HtmlDecode("&nbsp;");
                }
                propertylist.Add(new GenericListItem(space + property.SelectSingleNode("@Label").Value, property.SelectSingleNode("@ClassURI").Value));
                space = string.Empty;
            }


            ddlPropertyList.DataSource = propertylist;
            ddlPropertyList.DataTextField = "Text";
            ddlPropertyList.DataValueField = "Value";
            ddlPropertyList.DataBind();
            ddlPropertyList.Items.Insert(0, new ListItem("--- Select ---", ""));
            ddlPropertyList.SelectedValue = "";
            ddlPropertyList.EnableViewState = true;






        }

        private string PropertyURI { get; set; }
    }
}