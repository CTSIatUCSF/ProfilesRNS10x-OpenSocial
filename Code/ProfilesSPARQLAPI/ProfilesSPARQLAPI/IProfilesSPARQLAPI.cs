using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.IO;
using System.Xml;

namespace Search
{
    // NOTE: If you change the interface name "IProfilesSPARQLAPI" here, you must also update the reference to "IProfilesSPARQLAPI" in Web.config.
    [ServiceContract]
    public interface IProfilesSPARQLAPI
    {
        [OperationContract(Name="Search",IsTerminating = false, IsInitiating = true, IsOneWay = false, AsyncPattern = false, Action = "Search")]
        [WebInvoke(Method = "POST", UriTemplate = "Search",ResponseFormat =WebMessageFormat.Xml)]
         XmlElement Search(queryrequest xml);

    }

}
