using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

using Profiles.Framework.Utilities;

namespace Profiles.ORNG.Utilities
{
    public class GadgetSpec
    {
        private int appId = 0;
        private string name;
        private string openSocialGadgetURL;
        private List<string> channels = new List<string>();
        private bool enabled;
        private bool sandboxOnly = false;
        private Dictionary<string, GadgetViewRequirements> viewRequirements = new Dictionary<string, GadgetViewRequirements>();

        public GadgetSpec(int appId, string name, string openSocialGadgetURL, string[] channels, bool enabled, bool sandboxOnly)
        {
            this.appId = appId;
            this.name = name;
            this.openSocialGadgetURL = openSocialGadgetURL;
            this.channels.AddRange(channels);
            this.enabled = enabled;
            this.sandboxOnly = sandboxOnly;

            // if it's sandboxOnly, you will not find view requirements in the DB
            if (!sandboxOnly)
            {
                Profiles.ORNG.Utilities.DataIO data = new Profiles.ORNG.Utilities.DataIO();
                using (SqlDataReader dr = data.GetGadgetViewRequirements(appId))
                {
                    while (dr.Read())
                    {
                        viewRequirements.Add(dr[0].ToString().ToLower(), new GadgetViewRequirements(dr[0].ToString().ToLower(),
                                dr.GetInt32(1), dr[2].ToString(), dr[3].ToString(),
                                dr[4].ToString(), dr.IsDBNull(5) ? Int32.MaxValue : dr.GetInt32(5)));
                    }
                }
            }
        }

        public int GetAppId()
        {
            return appId;
        }

        public String GetName()
        {
            return name;
        }

        public String GetGadgetURL()
        {
            return openSocialGadgetURL;
        }

        public string[] GetChannels()
        {
            return channels.ToArray();
        }

        public bool ListensTo(string channel)
        {   // if fromSandbox just say yes, we don't care about performance in this situation
            return sandboxOnly || channels.Contains(channel);
        }

        public GadgetViewRequirements GetGadgetViewRequirements(String page)
        {
            page = page.ToLower();
            if (viewRequirements.ContainsKey(page))
            {
                return viewRequirements[page];
            }
            return null;
        }

        // based on security and securityGroup settings, do we show this?
        public bool Show(string viewerId, string ownerId, String page)
        {
            page = page.ToLower();
            bool show = true;
            // if there are no view requirements, go ahead and show it.  We are likely testing out a new gadget
            // if there are some, turn it off unless this page says its OK to turn it on
            if (viewRequirements.Count > 0)
            {
                show = false;
            }

            if (viewRequirements.ContainsKey(page))
            {
                GadgetViewRequirements req = GetGadgetViewRequirements(page);
                if (req.GetSecurityLevel() == -1)
                {
                    show = true;
                }
                else if (req.GetSecurityLevel() == -20 && viewerId != null)
                {
                    show = true;
                }
                else if (req.GetSecurityLevel() == -21 && GetSecurityGroup(viewerId) != 0) // this only happens on edit pages
                {
                    show = true;
                }
                else if (req.GetSecurityLevel() == -25) 
                {
                    // lower is better
                    int viewerSecurityLevel = (viewerId == null ? -1 : (ownerId != null && ownerId == viewerId ? -50 : -20));
                    int osg = GetSecurityGroup(ownerId);
                    show = osg != 0 && viewerSecurityLevel <= osg;
                }
            }
            return show;
        }

        // Bad idea to cache this
        // -1 means anyone can see it
        // -20 means that only logged in viewers can see it
        // -50 means that only admins, proxys and the profile owner can see it
        // -60 means that no one sees it
        // 0 means that it NEVER shows up for this person, even on their edit page.  
        public int GetSecurityGroup(string personId)
        {
            if (personId == null || personId.Trim().Length == 0)
            {
                return 0;
            }

            Dictionary<int, int> registeredApps = null;//(Dictionary<int, Boolean>)Framework.Utilities.Cache.FetchObject(OpenSocialManager.GADGET_SPEC_KEY + "_registeredApps_" + personId);
            if (registeredApps == null)
            {
                registeredApps = new Dictionary<int, int>();
                Profiles.ORNG.Utilities.DataIO data = new Profiles.ORNG.Utilities.DataIO();

                using (SqlDataReader dr = data.GetRegisteredApps(personId))
                {
                    while (dr.Read())
                    {
                        registeredApps[dr.GetInt32(0)] = dr.GetInt32(1);
                    }
                }

                //Framework.Utilities.Cache.Set(OpenSocialManager.GADGET_SPEC_KEY + "_registeredApps_" + personId, registeredApps);
            }

            return registeredApps.ContainsKey(GetAppId()) ? registeredApps[GetAppId()] : 0;
        }

        public bool FromSandbox()
        {
            return sandboxOnly;
        }

        public bool IsEnabled()
        {
            return enabled;
        }
    }
}