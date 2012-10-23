/*  
 
    Copyright (c) 2008-2010 by the President and Fellows of Harvard College. All rights reserved.  
    Profiles Research Networking Software was developed under the supervision of Griffin M Weber, MD, PhD.,
    and Harvard Catalyst: The Harvard Clinical and Translational Science Center, with support from the 
    National Center for Research Resources and Harvard University.


    Code licensed under a BSD License. 
    For details, see: LICENSE.txt 
  
*/
using System;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using Connects.Profiles.Service.DataContracts;

namespace Connects.Profiles.Service.ServiceContracts
{

    public class PublicationDate
    {
        public string pubDate { get; set; }
    }


    // addedby UCSF
    [ServiceContract(Name = "CustomProfileService")]
    public interface ICustomProfileService
    {
        // added by UCSF
        [OperationContract]
        [WebGet(UriTemplate = "ProfileDetails?InternalUsername={InternalUsername}&FNO={FNO}", BodyStyle = WebMessageBodyStyle.Bare)]
        PersonList ProfileDetails(string InternalUsername, string FNO);

        // added by UCSF
        [OperationContract]
        [WebGet(UriTemplate = "JSONProfileDetails?InternalUsername={InternalUsername}&FNO={FNO}", BodyStyle = WebMessageBodyStyle.Bare, ResponseFormat = WebMessageFormat.Json)]
        PersonList JSONProfileDetails(string InternalUsername, string FNO);

        // added by UCSF
        [OperationContract]
        [WebGet(UriTemplate = "PubDate?MPID={MPID}&PMID={PMID}&PubID={PubID}", BodyStyle = WebMessageBodyStyle.Bare)]
        PublicationDate GetPubDate(string MPID, string PMID, string PubID);

        // added by UCSF
        [OperationContract]
        [WebGet(UriTemplate = "JSONPubDate?MPID={MPID}&PMID={PMID}&PubID={PubID}", BodyStyle = WebMessageBodyStyle.Bare, ResponseFormat = WebMessageFormat.Json)]
        PublicationDate JSONPubDate(string MPID, string PMID, string PubID);
        // added by UCSF
        /*
        [OperationContract(IsTerminating = false, IsInitiating = true, IsOneWay = false,
        AsyncPattern = false, Action = "LegacyJSONProfile")]
        [WebGet(UriTemplate = "LegacyJSONProfile?InternalUsername={InternalUsername}&FNO={FNO}&callback={callback}&mobile={mobile}&publications={publications}", ResponseFormat = WebMessageFormat.Json)]
        string LegacyJSONProfile(string InternalUsername, string FNO, string callback, string mobile, string publications);*/

    }
}