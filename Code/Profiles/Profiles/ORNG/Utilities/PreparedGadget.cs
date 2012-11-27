using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Profiles.ORNG.Utilities
{

    public class PreparedGadget : IComparable<PreparedGadget>
    {
        private GadgetSpec gadgetSpec;
        private OpenSocialManager helper;
        private int moduleId;
        private string securityToken;

        public PreparedGadget(GadgetSpec gadgetSpec, OpenSocialManager helper, int moduleId, string securityToken)
        {
            this.gadgetSpec = gadgetSpec;
            this.helper = helper;
            this.moduleId = moduleId;
            this.securityToken = securityToken;
        }

        public int CompareTo(PreparedGadget other)
        {
            GadgetViewRequirements gvr1 = this.GetGadgetViewRequirements();
            GadgetViewRequirements gvr2 = other.GetGadgetViewRequirements();
            return ("" + this.GetView() + (gvr1 != null ? gvr1.GetDisplayOrder() : Int32.MaxValue)).CompareTo("" + other.GetView() + (gvr2 != null ? gvr2.GetDisplayOrder() : Int32.MaxValue));
        }

        public GadgetSpec GetGadgetSpec()
        {
            return gadgetSpec;
        }

        public String GetSecurityToken()
        {
            return securityToken;
        }

        public int GetAppId()
        {
            return gadgetSpec.GetAppId();
        }

        public string GetName()
        {
            return gadgetSpec.GetName();
        }

        public int GetModuleId()
        {
            return moduleId;
        }

        public String GetGadgetURL()
        {
            return gadgetSpec.GetGadgetURL();
        }

        GadgetViewRequirements GetGadgetViewRequirements()
        {
            return gadgetSpec.GetGadgetViewRequirements(helper.GetPageName());
        }

        public String GetView()
        {
            GadgetViewRequirements reqs = GetGadgetViewRequirements();
            if (reqs != null)
            {
                return reqs.GetView();
            }
            // default behavior that will get invoked when there is no reqs.  Useful for sandbox gadgets
            else if (helper.GetPageName().Equals("edit/default.aspx"))
            {
                return "home";
            }
            else if (helper.GetPageName().Equals("profile/display.aspx"))
            {
                return "profile";
            }
            else if (helper.GetPageName().Equals("orng/gadgetdetails.aspx"))
            {
                return "canvas";
            }
            else if (gadgetSpec.GetGadgetURL().Contains("Tool"))
            {
                return "small";
            }
            else
            {
                return null;
            }
        }

        public string GetOptParams()
        {
            GadgetViewRequirements reqs = GetGadgetViewRequirements();
            return reqs != null ? reqs.GetOptParams() : "{}";
        }

        public string GetChromeId()
        {
            GadgetViewRequirements reqs = GetGadgetViewRequirements();
            if (reqs != null)
            {
                return reqs.GetChromeId();
            }
            // default behavior that will get invoked when there is no reqs.  Useful for sandbox gadgets
            else if (gadgetSpec.GetGadgetURL().Contains("Tool"))
            {
                return "gadgets-tools";
            }
            else if (helper.GetPageName().Equals("edit/default.aspx"))
            {
                return "gadgets-edit";
            }
            else if (helper.GetPageName().Equals("profile/display.aspx"))
            {
                return "gadgets-view";
            }
            else if (helper.GetPageName().Equals("orng/gadgetdetails.aspx"))
            {
                return "gadgets-detail";
            }
            else if (helper.GetPageName().Equals("search/default.aspx"))
            {
                return "gadgets-search";
            }
            else
            {
                return null;
            }
        }

        public string Name
        {
            get { return gadgetSpec.GetName(); }
        }

        public string CanvasURL
        {
            get { return "~/orng/gadgetdetails.aspx?appId=" + GetAppId() + "&Person=" + HttpUtility.UrlEncode(helper.ownerId); }
        }

        public int AppId
        {
            get { return GetAppId(); }
        }

        public int ModuleId
        {
            get { return GetModuleId(); }
        }

    }

}