using System;
using System.Collections.Generic;
using System.Xml;
using System.Web;
using System.Net;
using System.IO;
using System.Text;
using System.Runtime.Serialization;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProfilesSPARQLAPI
{
    public partial class Query : System.Web.UI.Page
    {        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmdRun_Click(object sender, EventArgs e)
        {
            txtResults.Text = this.QueryAPI(txtQuery.Text.Trim());
        }

        public string QueryAPI(string request)
        {

            string result = string.Empty;
            string _xml = string.Empty;

            XmlDocument resultdata = new XmlDocument();

            try
            {
                _xml = request.Trim();
                HttpWebRequest _request = null;               
                string s = HttpContext.Current.Request.Url.Authority;
                //This needs to be setup so it can read from a config file,, I was using string s, as a way to get the current URL, but if its a sub web, then it breaks.
               // _request = (HttpWebRequest)WebRequest.Create("http://dev.connects.catalyst.harvard.edu/profilesv1service/SPARQLAPI.aspx");
                _request = (HttpWebRequest)WebRequest.Create("http://" + s + "/SPARQLAPI.aspx");

                ProfilesSPARQLAPI.Common.DebugLogging.Log("HttpContext.Current.Request.Url.Authority: " +  s);

                _request.Method = "POST";
                _request.ContentType = "text/xml";
                _request.ContentLength = _xml.Length;

                ProfilesSPARQLAPI.Common.DebugLogging.Log("------ QUERY REQUEST: " + _xml.ToString());


                using (Stream writeStream = _request.GetRequestStream())
                {
                    UTF8Encoding encoding = new UTF8Encoding();
                    byte[] bytes = encoding.GetBytes(_xml);
                    writeStream.Write(bytes, 0, bytes.Length);
                }

                using (HttpWebResponse response = (HttpWebResponse)_request.GetResponse())
                {
                    using (Stream responseStream = response.GetResponseStream())
                    {
                        using (StreamReader readStream = new StreamReader(responseStream, Encoding.UTF8))
                        {
                            result = readStream.ReadToEnd();
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                ProfilesSPARQLAPI.Common.DebugLogging.Log(ex.Message + " " + ex.StackTrace + " " + ex.InnerException.Message);
                
                result = ex.Message;
               
            }

            if (result == string.Empty)
            {
                 result = "<prns:EOF>Check the query syntax " + result + "</prns:EOF>";
            }
            else
            {
                try
                {
                    resultdata.LoadXml(result);
                    result = resultdata.InnerXml;
                }
                catch (Exception ex) {
                    ProfilesSPARQLAPI.Common.DebugLogging.Log(ex.Message + " " + ex.StackTrace + " " + ex.InnerException.Message);
                }
            }


            
            return result;

        }

    }
}
