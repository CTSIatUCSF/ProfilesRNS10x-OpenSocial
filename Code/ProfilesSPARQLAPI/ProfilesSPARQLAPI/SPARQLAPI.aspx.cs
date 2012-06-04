/*  
 
    Copyright (c) 2008-2012 by the President and Fellows of Harvard College. All rights reserved.  
    Profiles Research Networking Software was developed under the supervision of Griffin M Weber, MD, PhD.,
    and Harvard Catalyst: The Harvard Clinical and Translational Science Center, with support from the 
    National Center for Research Resources and Harvard University.


    Code licensed under a BSD License. 
    For details, see: LICENSE.txt 
  
*/
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Xml;
using System.Text;
using System.Configuration;

using SemWeb;
using SemWeb.Query;

namespace ProfilesSPARQLAPI
{
    public partial class SPARQLAPI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            SemWeb.Query.Query query = null;

            string q = string.Empty;

            //Process the request
            System.IO.StreamReader requeststream = new System.IO.StreamReader(Request.InputStream, System.Text.Encoding.UTF8, false);

            q = requeststream.ReadToEnd().ToString();
            ProfilesSPARQLAPI.Common.DebugLogging.Log(q);
            
            query = new SparqlEngine(new StringReader(q));
            
            // Load the data from sql server
            SemWeb.Stores.SQLStore store;

            string connstr = ConfigurationManager.ConnectionStrings["SemWebDB"].ConnectionString;
            
            ProfilesSPARQLAPI.Common.DebugLogging.Log(connstr);

            store = (SemWeb.Stores.SQLStore)SemWeb.Store.CreateForInput(connstr);

            //Create a Sink for the results to be writen once the query is run.
            MemoryStream ms = new MemoryStream();
            XmlTextWriter writer = new XmlTextWriter(ms, System.Text.Encoding.UTF8);
            QueryResultSink sink = new SparqlXmlQuerySink(writer);

            // Run the query.
            query.Run(store, sink);

            //flush the writer then  load the memory stream
            writer.Flush();
            ms.Seek(0, SeekOrigin.Begin);

            //Write the memory stream out to the response.
            ASCIIEncoding ascii = new ASCIIEncoding();
            ProfilesSPARQLAPI.Common.DebugLogging.Log(ascii.GetString(ms.ToArray()).Replace("???", ""));
            Response.Write(ascii.GetString(ms.ToArray()).Replace("???", ""));

            writer.Close();
            ProfilesSPARQLAPI.Common.DebugLogging.Log("End of Processing");
            

        }
    }
}
