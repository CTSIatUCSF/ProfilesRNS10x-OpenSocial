/*
 
    Copyright (c) 2008-2012 by the President and Fellows of Harvard College. All rights reserved.  
    Profiles Research Networking Software was developed under the supervision of Griffin M Weber, MD, PhD.,
    and Harvard Catalyst: The Harvard Clinical and Translational Science Center, with support from the 
    National Center for Research Resources and Harvard University.


    Code licensed under a BSD License. 
    For details, see: LICENSE.txt 
  
*/

using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Web;

namespace Profiles.Profile.Modules.ProfileImage
{
    public class PhotoHandler : IHttpHandler
    {
        static byte[] silhouetteImage = null;

        public void ProcessRequest(HttpContext context)
        {
            // Set up the response settings
            context.Response.ContentType = "image/jpeg";
            context.Response.Cache.SetCacheability(HttpCacheability.Public);
            context.Response.BufferOutput = false;

            Utilities.DataIO data = new Profiles.Profile.Utilities.DataIO();
            Int64 nodeid = -1;
            if (!string.IsNullOrEmpty(context.Request.QueryString["NodeID"]))
            {
                // get the id for the image
                nodeid = Convert.ToInt32(context.Request.QueryString["NodeID"]);
            }
            else if (!string.IsNullOrEmpty(context.Request.QueryString["person"]))
            {
                // UCSF.  Allow old id to work
                nodeid = data.GetNodeID(Convert.ToInt32(context.Request.QueryString["person"].ToString()));
            }

            if (nodeid > 0)
            {
                //Set up the response settings
                context.Response.ContentType = "image/jpeg";
                context.Response.Cache.SetCacheability(HttpCacheability.Public);
                context.Response.BufferOutput = false;                
                
                Stream stream = data.GetUserPhotoList(nodeid);

                // UCSF show silhouette if we have no image and this is in the URL
                // note that if the length is 4 then it is going to be the word "null".  
                if (stream.Length == 4 && "True".Equals(context.Request.QueryString["ShowSilhouetteAsDefault"]))
                {
                    // It's OK that this isn't synchronized even though it would be cleaner if it were
                    if (silhouetteImage == null)
                    {
                        // this method is limited to 2^32 byte files (4.2 GB)
                        FileStream fs = File.OpenRead(AppDomain.CurrentDomain.BaseDirectory + "/Profile/Images/default_img.png");
                        try
                        {
                            silhouetteImage = new byte[fs.Length];
                            fs.Read(silhouetteImage, 0, Convert.ToInt32(fs.Length));
                        }
                        finally
                        {
                            fs.Close();
                        }
                    }
                    // added by UCSF
                    stream = new System.IO.MemoryStream(silhouetteImage);
                }

                // added by UCSF
                context.Response.AddHeader("Content-Length", stream.Length.ToString());

                const int buffersize = 1024 * 16;
                byte[] buffer2 = new byte[buffersize];
                int count = stream.Read(buffer2, 0, buffersize);
                while (count > 0)
                {
                    context.Response.OutputStream.Write(buffer2, 0, count);
                    count = stream.Read(buffer2, 0, buffersize);
                }

            }
        }

        //this is required for using the IHttpHandler interface. 
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
       
    }
}
