using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Profiles.ORNG.Utilities
{
    public class GadgetViewRequirements
    {
        private string page;
        private char viewerReq;  // U for User or null for no requirment
        private char ownerReq;   // R for Registered or null for no requirement
        private string view;
        private string chromeId;
        private string optParams;
        private Int32 display_order;

        public GadgetViewRequirements(String page, char viewerReq, char ownerReq, String view, string chromeId, String optParams, Int32 display_order)
        {
            this.page = page;
            this.viewerReq = viewerReq;
            this.ownerReq = ownerReq;
            this.view = view;
            this.chromeId = chromeId;
            this.optParams = optParams;
            this.display_order = display_order;
        }

        public char GetViewerReq()
        {
            return viewerReq;
        }

        public char GetOwnerReq()
        {
            return ownerReq;
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