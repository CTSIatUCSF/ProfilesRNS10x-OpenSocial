using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;


namespace Profiles.ORNG.Utilities
{
    public class GadgetSpec
    {
        private string openSocialGadgetURL;
        private string name;
        private int appId = 0;
        private List<string> channels = new List<string>();
        private bool fromSandbox = false;
        private Dictionary<string, GadgetViewRequirements> viewRequirements = new Dictionary<string, GadgetViewRequirements>();

        // For preloading
        public GadgetSpec(int appId, string name, string openSocialGadgetURL, string[] channels)
        {
            this.appId = appId;
            this.name = name;
            this.openSocialGadgetURL = openSocialGadgetURL;
            this.channels.AddRange(channels);
        }

        public GadgetSpec(int appId, string name, string openSocialGadgetURL, string channelsStr)
            : this(appId, name, openSocialGadgetURL, channelsStr != null && channelsStr.Length > 0 ? channelsStr.Split(' ') : new string[0])
        {
        }

        public GadgetSpec(int appId, string name, string openSocialGadgetURL, string[] channels, bool fromSandbox)
            : this(appId, name, openSocialGadgetURL, channels)
        {
            this.fromSandbox = fromSandbox;
            // Load gadgets from the DB first
            if (!fromSandbox)
            {
                Profiles.ORNG.Utilities.DataIO data = new Profiles.ORNG.Utilities.DataIO();

                SqlDataReader dr = data.GetGadgetViewRequirements(appId);
                while (dr.Read())
                {
                    viewRequirements.Add(dr[0].ToString(), new GadgetViewRequirements(dr[0].ToString(),
                            dr.IsDBNull(1) ? ' ' : Convert.ToChar(dr[1]),
                            dr.IsDBNull(2) ? ' ' : Convert.ToChar(dr[2]),
                            dr[3].ToString(),
                            dr.IsDBNull(4) ? '0' : Convert.ToInt32(dr[4]),
                            dr.IsDBNull(5) ? '0' : Convert.ToInt32(dr[5]),
                            dr.IsDBNull(6) ? true : Convert.ToBoolean(dr[6]),
                            dr[7].ToString(),
                            dr.IsDBNull(8) ? Int32.MaxValue : Convert.ToInt32(dr[8])));
                }

                if (!dr.IsClosed)
                    dr.Close();
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
            return fromSandbox || channels.Contains(channel);
        }

        public GadgetViewRequirements GetGadgetViewRequirements(String page)
        {
            if (viewRequirements.ContainsKey(page))
            {
                return viewRequirements[page];
            }
            return null;
        }

        public bool Show(string viewerId, string ownerId, String page)
        {
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

        public bool IsRegisteredTo(string personId)
        {
            Int32 count = 0;

            Profiles.ORNG.Utilities.DataIO data = new Profiles.ORNG.Utilities.DataIO();

            SqlDataReader dr = data.GetIsRegisteredTo(GetAppId(), personId);
            if (dr.Read())
            {
                count = dr.GetInt32(0);
            }

            if (!dr.IsClosed)
                dr.Close();

            return (count == 1);
        }

        public bool FromSandbox()
        {
            return fromSandbox;
        }

        // who sees it?  Return the viewerReq for the ProfileDetails page
        public char GetVisibleScope()
        {
            GadgetViewRequirements req = GetGadgetViewRequirements("Profile/Display.aspx");
            return req != null ? req.GetViewerReq() : ' ';
        }
    }
}