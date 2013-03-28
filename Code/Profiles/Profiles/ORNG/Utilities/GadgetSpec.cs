﻿using System;
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
                                dr.IsDBNull(1) ? ' ' : Convert.ToChar(dr[1]),
                                dr.IsDBNull(2) ? ' ' : Convert.ToChar(dr[2]),
                                dr[3].ToString(),
                                dr[4].ToString(),
                                dr[5].ToString(),
                                dr.IsDBNull(6) ? Int32.MaxValue : Convert.ToInt32(dr[6])));
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

        public bool Show(string viewerId, string ownerId, String page)
        {
            page = page.ToLower();
            bool show = true;
            // if there are no view requirements, go ahead and show it.  We are likely testing out a new gadget
            // if there are some, turn it off unless this page is 
            if (viewRequirements.Count > 0)
            {
                show = false;
            }

            if (viewRequirements.ContainsKey(page))
            {
                show = true;
                GadgetViewRequirements req = GetGadgetViewRequirements(page);
                if ('U' == req.GetViewerReq() && viewerId == null)
                {
                    show = false;
                }
                else if ('R' == req.GetViewerReq())
                {
                    show &= IsRegisteredTo(viewerId);
                }
                if ('R' == req.GetOwnerReq())
                {
                    show &= IsRegisteredTo(ownerId);
                }
                else if ('S' == req.GetOwnerReq())
                {
                    show &= (viewerId == ownerId);
                }
            }
            return show;
        }

        // Bad idea to cache this
        public bool IsRegisteredTo(string personId)
        {
            if (personId == null || personId.Trim().Length == 0)
            {
                return false;
            }

            List<int> registeredApps = (List<int>)Framework.Utilities.Cache.FetchObject(OpenSocialManager.GADGET_SPEC_KEY + "_registeredApps_" + personId) ;
            if (registeredApps == null)
            {
                registeredApps = new List<int>();
                Profiles.ORNG.Utilities.DataIO data = new Profiles.ORNG.Utilities.DataIO();

                SqlDataReader dr = data.GetRegisteredApps(personId);
                while (dr.Read())
                {
                    registeredApps.Add(dr.GetInt32(0));
                }

                if (!dr.IsClosed)
                    dr.Close();

                Framework.Utilities.Cache.Set(OpenSocialManager.GADGET_SPEC_KEY + "_registeredApps_" + personId, registeredApps);
            }

            return registeredApps.Contains(GetAppId());
        }

        public bool FromSandbox()
        {
            return sandboxOnly;
        }

        public bool IsEnabled()
        {
            return enabled;
        }

        // who sees it?  Return the viewerReq for the ProfileDetails page
        public char GetVisibleScope()
        {
            GadgetViewRequirements req = GetGadgetViewRequirements("profile/display.aspx");
            return req != null ? req.GetViewerReq() : ' ';
        }
    }
}