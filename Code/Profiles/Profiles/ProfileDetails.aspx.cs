using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Profiles.Framework.Utilities;

namespace Profiles
{
    public partial class BetaRedirect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["person"] != null)
            {
                // need to convert personid to nodeid
                Response.Redirect(Root.Domain + "/profile/" + new Profiles.Framework.Utilities.DataIO().GetNodeID(Convert.ToInt32(Request.QueryString["person"].ToString())));
            }

            Response.End();

        }
    }
}
