using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Profiles.ORNG.Utilities
{
    public class GadgetViewRequirements
    {
        private string page;
        private int securityLevel; 
        private string view;
        private string chromeId;
        private string optParams;
        private Int32 display_order;

        public GadgetViewRequirements(String page, int securityLevel, String view, string chromeId, String optParams, Int32 display_order)
        {
            this.page = page;
            this.securityLevel = securityLevel;
            this.view = view;
            this.chromeId = chromeId;
            this.optParams = optParams;
            this.display_order = display_order;
        }
        // -1 public, -20 viewer must be logged in, -21 viewer must be in AppRegistry for this app, 
        // -25 owner must be in AppRegistry for this app and viewer must meet securityGroup requirements defined by by AppRegistry value
        public int GetSecurityLevel()
        {
            return securityLevel;
        }

        public string GetView()
        {
            return view;
        }

        public string GetChromeId()
        {
            return chromeId;
        }

        public string GetOptParams()
        {
            return optParams != null && optParams.Trim().Length > 0 ? optParams : "{}";
        }

        internal Int32 GetDisplayOrder()
        {
            return display_order;
        }
    }
}