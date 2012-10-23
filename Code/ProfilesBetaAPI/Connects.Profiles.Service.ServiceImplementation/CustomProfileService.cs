using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using Connects.Profiles.Service.DataContracts;
using Connects.Profiles.Service.ServiceContracts;

namespace Connects.Profiles.Service.ServiceImplementation
{
    [ServiceBehavior(InstanceContextMode = InstanceContextMode.Single,
                 ConcurrencyMode = ConcurrencyMode.Single,
                 IncludeExceptionDetailInFaults = true)]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class CustomProfileService : ICustomProfileService
    {

        // UCSF
        public PersonList ProfileDetails(string internalUsername, string FNO)
        {
            DataIO data = new DataIO();
            if (internalUsername != null && internalUsername.Trim().Length > 0)
            {
                return new ProfileServiceAdapter().GetPersonFromPersonId(data.GetPersonIdFromInternalUsername(internalUsername));
            }
            else
            {
                return new ProfileServiceAdapter().GetPersonFromPersonId(data.GetPersonIdFromFNO(FNO));
            }
        }

        public PersonList JSONProfileDetails(string internalUsername, string FNO)
        {
            return ProfileDetails(internalUsername, FNO);
        }

        // UCSF
        public PublicationDate GetPubDate(string MPID, string PMID, string PubID)
        {
            DataIO data = new DataIO();
            String pd = "" ;
            if (PMID != null && PMID.Trim().Length > 0)
            {
                pd = data.ProcessDateSQL("select PubDate from [Profile.Data].[Publication.PubMed.General] where PMID = '" + PMID + "';");
            }
            else if (MPID != null && MPID.Trim().Length > 0)
            {
                pd = data.ProcessDateSQL("select publicationdt from [Profile.Data].[Publication.MyPub.General] where mpid = '" + MPID + "';");
            }
            else if (PubID != null && PubID.Trim().Length > 0)
            {
                pd = data.ProcessDateSQL("select isnull(m.publicationdt, p.PubDate) from [Profile.Data].[Publication.Person.Include] i left outer join [Profile.Data].[Publication.MyPub.General] m on i.mpid = m.mpid left outer join " +
                           "[Profile.Data].[Publication.PubMed.General] p on i.pmid = p.pmid where pubid = '" + PubID + "';");
            }
            return new PublicationDate { pubDate = pd };
        }

        public PublicationDate JSONPubDate(string MPID, string PMID, string PubID)
        {
            return GetPubDate(MPID, PMID, PubID);
        }

    }
}
