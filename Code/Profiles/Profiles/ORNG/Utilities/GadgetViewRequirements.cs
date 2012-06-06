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
        private int closedWidth;
        private int openWidth;
        private bool startClosed;
        private string chromeId;
        private Int32 display_order;

        public GadgetViewRequirements(String page, char viewerReq, char ownerReq, String view, int closedWidth, int openWidth, bool startClosed, string chromeId, Int32 display_order)
        {
            this.page = page;
            this.viewerReq = viewerReq;
            this.ownerReq = ownerReq;
            this.view = view;
            this.closedWidth = closedWidth;
            this.openWidth = openWidth;
            this.startClosed = startClosed;
            this.chromeId = chromeId;
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

        public int GetClosedWidth()
        {
            return closedWidth;
        }

        public int GetOpenWidth()
        {
            return openWidth;
        }

        public bool GetStartClosed()
        {
            return startClosed;
        }

        public string GetChromeId()
        {
            return chromeId;
        }

        internal Int32 GetDisplayOrder()
        {
            return display_order;
        }
    }
}