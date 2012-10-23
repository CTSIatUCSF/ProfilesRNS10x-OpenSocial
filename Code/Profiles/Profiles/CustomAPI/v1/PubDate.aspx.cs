using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Common;
using Connects.Profiles.Common;
using Connects.Profiles.Service.DataContracts;
using Connects.Profiles.Utility;
using Connects.Profiles.Service.ServiceContracts;

public partial class PubDate : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string PMID = Request["PMID"];
            string MPID = Request["MPID"];
            string PubID = Request["PubID"];

            PublicationDate pd = new Connects.Profiles.Service.ServiceImplementation.CustomProfileService().GetPubDate(PMID, MPID, PubID);
            Response.Write(pd.pubDate + Environment.NewLine);
        }
        catch (Exception ex)
        {
            Response.Write("ERROR" + Environment.NewLine + ex.Message + Environment.NewLine);
        }
    }

}
