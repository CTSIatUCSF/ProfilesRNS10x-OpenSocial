using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Common;
using System.Globalization;
using System.Text;
using System.Xml;
using System.Xml.Xsl;

using Profiles.Framework.Utilities;
using Profiles.Profile.Utilities;

namespace Profiles.Profile.Modules.PersonalInfo
{
    public partial class PersonalInfo : BaseModule
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DrawProfilesModule();
        }

        public PersonalInfo() : base() { }
        public PersonalInfo(XmlDocument pagedata, List<ModuleParams> moduleparams, XmlNamespaceManager pagenamespaces)
            : base(pagedata, moduleparams, pagenamespaces)
        {
            base.RDFTriple = new RDFTriple(Convert.ToInt64(Request.QueryString["Subject"]));

        }
        private void DrawProfilesModule()
        {

            XsltArgumentList args = new XsltArgumentList();
            XslCompiledTransform xslt = new XslCompiledTransform();
            SessionManagement sm = new SessionManagement();


            Utilities.DataIO data = new Profiles.Profile.Utilities.DataIO();
            string email = string.Empty;
            string imageemailurl = string.Empty;
            if (this.BaseData.SelectSingleNode("rdf:RDF/rdf:Description/prns:emailEncrypted", this.Namespaces) != null &&
                this.BaseData.SelectSingleNode("rdf:RDF/rdf:Description/vivo:email", this.Namespaces) == null)
            {
                email = this.BaseData.SelectSingleNode("rdf:RDF/rdf:Description/prns:emailEncrypted", this.Namespaces).InnerText;
                imageemailurl = string.Format(Root.Domain + "/profile/modules/personalinfo/" + "EmailHandler.ashx?msg={0}", HttpUtility.UrlEncode(email));
            }
            
            args.AddParam("root", "", Root.Domain);
            if (email != string.Empty)
            {
                args.AddParam("email", "", imageemailurl);
            }
            litPersonalInfo.Text = XslHelper.TransformInMemory(Server.MapPath("~/Profile/Modules/PersonalInfo/PersonInfo.xslt"), args, base.BaseData.OuterXml);

            if (base.BaseData.SelectSingleNode("rdf:RDF/rdf:Description/prns:mainImage/@rdf:resource", base.Namespaces) != null)
            {
                string imageurl = base.BaseData.SelectSingleNode("//rdf:RDF/rdf:Description/prns:mainImage/@rdf:resource", base.Namespaces).Value;
                imgPhoto.ImageUrl = imageurl;
            }
            else
            {
                imgPhoto.Visible = false;
            }

            // Profiles OpenSocial Extension by UCSF
            string uri = this.BaseData.SelectSingleNode("rdf:RDF/rdf:Description/@rdf:about", base.Namespaces).Value;
            Profiles.ORNG.Utilities.OpenSocialManager om = 
                new Profiles.ORNG.Utilities.OpenSocialManager(uri, Page, false);
            if (om.IsVisible())
            {
                pnlOpenSocial.Visible = true;
            }

        }

    }
}