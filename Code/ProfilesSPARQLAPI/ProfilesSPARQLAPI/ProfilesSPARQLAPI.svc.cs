using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Configuration;
using System.IO;
using System.Xml;

using SemWeb;
using SemWeb.Query;
using Search.Common;

namespace Search
{
    // NOTE: If you change the class name "ProfilesSPARQLAPI" here, you must also update the reference to "ProfilesSPARQLAPI" in Web.config.
    public class ProfilesSPARQLAPI : IProfilesSPARQLAPI
    {
        public XmlElement Search(queryrequest xml)
        {
            SemWeb.Query.Query query = null;

            string q = string.Empty;

            query = new SparqlEngine(new StringReader(xml.query));

            // Load the data from sql server
            SemWeb.Stores.SQLStore store;

            string connstr = ConfigurationManager.ConnectionStrings["SemWebDB"].ConnectionString;

            DebugLogging.Log(connstr);

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
            DebugLogging.Log(ascii.GetString(ms.ToArray()).Replace("???", ""));
            writer.Close();

            DebugLogging.Log("End of Processing");

            Type type = typeof(sparql);

            //sparql qr;
            //qr = SerializeXML.DeserializeObject(ascii.GetString(ms.ToArray()).Replace("???", ""), type) as sparql;     
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.LoadXml(ascii.GetString(ms.ToArray()).Replace("???", ""));

            XmlElement doc = xmlDoc.DocumentElement;
            
            return doc;
            
        }
     
    }
}

