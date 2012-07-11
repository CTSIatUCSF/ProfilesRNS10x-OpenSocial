﻿/*  
 
    Copyright (c) 2008-2012 by the President and Fellows of Harvard College. All rights reserved.  
    Profiles Research Networking Software was developed under the supervision of Griffin M Weber, MD, PhD.,
    and Harvard Catalyst: The Harvard Clinical and Translational Science Center, with support from the 
    National Center for Research Resources and Harvard University.


    Code licensed under a BSD License. 
    For details, see: LICENSE.txt 
  
*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Xsl;
using System.Web.UI.HtmlControls;
using System.Configuration;

using Profiles.Framework.Utilities;
using Profiles.Search.Utilities;

namespace Profiles.Search.Modules.SearchResults
{
    public partial class SearchResults : BaseModule
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            DrawProfilesModule();
        }
        public SearchResults() { }
        public SearchResults(XmlDocument pagedata, List<ModuleParams> moduleparams, XmlNamespaceManager pagenamespaces)
            : base(pagedata, moduleparams, pagenamespaces)
        {
            Utilities.DataIO data = new Profiles.Search.Utilities.DataIO();

           
            this.SearchData = pagedata;
        }

        public XmlDocument SearchData { get; set; }


        private void DrawProfilesModule()
        {

            XsltArgumentList args = new XsltArgumentList();
            long offset = 0;
            long perpage = 0;
            long totalcount = 0;
            long totalpageremainder = 0;
            long totalpages = 0;
            long startrecord = 0;
            long page = 0;
            string searchfor = "";
            string classgroupuri = "";
            string classuri = "";

            string fname = "";
            string lname = "";
            string institution = "";
            string department = "";
            string sort = "";
            string sortdirection = "";
            string searchrequest = "";
            XmlDocument xmlsearchrequest;
            xmlsearchrequest = new XmlDocument();
            
            Int16 showcolumns = 0;

            string otherfilters = "";
            string institutionallexcept = string.Empty;
            string departmentallexcept = string.Empty;
            string exactphrase = string.Empty;

            string division = string.Empty;
            string divisionallexcept = string.Empty;

            string searchtype = "";

            Search.Utilities.DataIO data = new Profiles.Search.Utilities.DataIO();

            if (Request.QueryString["searchrequest"] != null)
            {
                searchrequest = data.DecryptRequest(Request.QueryString["searchrequest"]);
                xmlsearchrequest.LoadXml(searchrequest);
            }

            

            if (Request.QueryString["searchtype"] != null)
            {
                searchtype = Request.QueryString["searchtype"];
            }
            else if (Request.Form["searchtype"] != null)
            {
                searchtype = Request.Form["searchtype"];

            }


            if (Request.QueryString["searchfor"] != null)
            {
                searchfor = Request.QueryString["searchfor"];
            }
            else if(Request.Form["txtSearchFor"] !=null)
            {
                searchfor = Request.Form["txtSearchFor"];

            }
            else if (xmlsearchrequest.ChildNodes.Count > 0)
            {
                searchfor = xmlsearchrequest.SelectSingleNode("SearchOptions/MatchOptions/SearchString").InnerText;
            }



            if (searchfor == null)
                searchfor = string.Empty;

            if (Request.QueryString["lname"] != null)
                lname = Request.QueryString["lname"];
            else
                lname = Request.Form["txtLname"];

            if (lname == null)
                lname = string.Empty;

            if (Request.QueryString["fname"] != null)
                fname = Request.QueryString["fname"];
            else
                fname = Request.Form["txtFname"];

            if (fname == null)
                fname = string.Empty;

            if (Request.QueryString["institution"] != null)
                institution = Request.QueryString["institution"];

            if (Request.QueryString["department"] != null)
                department = Request.QueryString["department"];
            

            if (Request.QueryString["perpage"] != null)
            {
                if (Request.QueryString["perpage"] != string.Empty)
                    perpage = Convert.ToInt64(Request.QueryString["perpage"]);
                else
                    perpage = 15;
            }
            else
            {
                perpage = 15; //default
            }

            if (Request.QueryString["offset"] != null)
            {
                if (Request.QueryString["offset"] != string.Empty)
                    offset = Convert.ToInt64(Request.QueryString["offset"]);
                else
                    offset = 0;
            }
            else
            {
                offset = 0;
            }

            if (Request.QueryString["page"] != null)
            {
                if (Request.QueryString["page"] != string.Empty)
                    page = Convert.ToInt64(Request.QueryString["page"]);
                else
                    page = 1;
            }
            else
            {
                page = 1;
            }


            if (Request.QueryString["classgroupuri"] != null)
                classgroupuri = HttpUtility.UrlDecode(Request.QueryString["classgroupuri"]);
            else
                classgroupuri = HttpUtility.UrlDecode(Request.Form["classgroupuri"]);

            if (classgroupuri != null)
            {
                if (classgroupuri.Contains("!"))
                    classgroupuri = classgroupuri.Replace('!', '#');
            }
            else
            {
                classgroupuri = string.Empty;
            }

            if (Request.QueryString["classuri"] != null)
                classuri = HttpUtility.UrlDecode(Request.QueryString["classuri"]);
            else
                classuri = HttpUtility.UrlDecode(Request.Form["classuri"]);

            if (classuri != null)
            {
                if (classuri.Contains("!"))
                    classuri = classuri.Replace('!', '#');
            }
            else
            {
                classuri = string.Empty;
            }


            if (Request.QueryString["sortby"] != null)
                sort = Request.QueryString["sortby"];

            if (Request.QueryString["sortdirection"] != null)
                sortdirection = Request.QueryString["sortdirection"];


            if (Request.QueryString["showcolumns"] != null)
            {
                showcolumns = Convert.ToInt16(Request.QueryString["showcolumns"]);
            }
            else
            {
                showcolumns = 1;
            }



            if (Request.QueryString["otherfilters"] != null)
            {
                otherfilters = Request.QueryString["otherfilters"];

            }

            if (Request.QueryString["institutionallexcept"] != null)
            {
                institutionallexcept = Request.QueryString["institutionallexcept"];

            }


            if (Request.QueryString["departmentallexcept"] != null)
            {
                departmentallexcept = Request.QueryString["departmentallexcept"];

            }


            if (Request.QueryString["exactphrase"] != null)
            {
                exactphrase = Request.QueryString["exactphrase"];

            }


            if (Request.QueryString["division"] != null)
            {
                division = Request.QueryString["division"];
            }
            
            if (Request.QueryString["divisionallexcept"] != null)
            {
                divisionallexcept = Request.QueryString["divisionallexcept"];
            }

            try
            {

                totalcount = data.GetTotalSearchConnections(this.SearchData, base.Namespaces);
                
                if (page < 0)
                {
                    page = 1;
                }

         
                totalpages = Math.DivRem(totalcount, Convert.ToInt64(perpage), out totalpageremainder);

                if (totalpageremainder > 0) { totalpages = totalpages + 1; }

                if (page > totalpages)
                    page = totalpages;

                startrecord = ((Convert.ToInt32(page) * Convert.ToInt32(perpage)) + 1) - Convert.ToInt32(perpage);

                if(searchrequest.Trim() != string.Empty)
                searchrequest = data.EncryptRequest(searchrequest);


                switch (searchtype.ToLower())
                {
                    case "everything":
                       
                            xmlsearchrequest = data.SearchRequest(searchfor, classgroupuri, classuri, perpage.ToString(), (startrecord - 1).ToString());
                        break;
                    default:                       
                            xmlsearchrequest = data.SearchRequest(searchfor, exactphrase, fname, lname, institution, institutionallexcept, department, departmentallexcept, division, divisionallexcept, "http://xmlns.com/foaf/0.1/Person", perpage.ToString(), (startrecord - 1).ToString(), sort, sortdirection, otherfilters, ref searchrequest);                    
                        break;
                }

                this.SearchData = data.Search(xmlsearchrequest,false);

                this.SearchRequest = data.EncryptRequest(xmlsearchrequest.OuterXml);
            }
            catch (Exception ex)
            {
                ex = ex;
                //for now just flip it back to the defaults. This is if someone keys some funky divide by zero stuff in the URL
                // to try and break the system.
                startrecord = 1;
                perpage = 15;
            }

            args.AddParam("root", "", Root.Domain);
            args.AddParam("perpage", "", perpage);
            args.AddParam("offset", "", offset);
            args.AddParam("totalpages", "", totalpages);
            args.AddParam("page", "", page);
            args.AddParam("searchfor", "", searchfor);
            args.AddParam("classGrpURIpassedin", "", classgroupuri);
            args.AddParam("classURIpassedin", "", classuri);
            args.AddParam("searchrequest", "", this.SearchRequest);

            switch (searchtype.ToLower())
            {
                case "everything":
                    litEverythingResults.Text = XslHelper.TransformInMemory(Server.MapPath("~/Search/Modules/SearchResults/EverythingResults.xslt"), args, this.SearchData.OuterXml);
                    break;
                case "people":

                    args.AddParam("showcolumns", "", showcolumns.ToString());


                    if ((showcolumns & 1) == 1)
                    {
                        args.AddParam("institution", "", "true");
                    }
                    else
                    {
                        args.AddParam("institution", "", "false");
                    }

                    if ((showcolumns & 2) == 2)
                    {
                        args.AddParam("department", "", "true");
                    }
                    else
                    {
                        args.AddParam("department", "", "false");
                    }

                    if ((showcolumns & 4) == 4)
                    {
                        args.AddParam("division", "", "true");
                    }
                    else
                    {
                        args.AddParam("division", "", "false");
                    }


                    if ((showcolumns & 8) == 8)
                    {
                        args.AddParam("facrank", "", "true");
                    }
                    else
                    {
                        args.AddParam("facrank", "", "false");
                    }



                    //Profiles.Search.Utilities.DataIO dropdowns = new Profiles.Search.Utilities.DataIO();
                    if (Convert.ToBoolean(ConfigurationSettings.AppSettings["ShowInstitutions"]) == true)
                    {

                        args.AddParam("ShowInstitutions", "", "true");
                    }
                    else
                    {
                        args.AddParam("ShowInstitutions", "", "false");
                    }


                    if (Convert.ToBoolean(ConfigurationSettings.AppSettings["ShowDepartments"]) == true)
                    {
                        args.AddParam("ShowDepartments", "", "true");
                    }
                    else
                    {
                        args.AddParam("ShowDepartments", "", "false");
                    }

                    if (Convert.ToBoolean(ConfigurationSettings.AppSettings["ShowDivisions"]) == true)
                    {
                        args.AddParam("ShowDivisions", "", "true");
                    }
                    else
                    {
                        args.AddParam("ShowDivisions", "", "false");
                    }

                    //Faculty Rank always shows
                    args.AddParam("ShowFacRank", "", "true");


                    args.AddParam("currentsort", "", sort);
                    args.AddParam("currentsortdirection", "", sortdirection);

                    if (base.BaseData.SelectNodes("rdf:RDF/rdf:Description/vivo:overview/SearchDetails/SearchPhraseList", base.Namespaces).Count > 0)
                        args.AddParam("why", "", true);
                    else
                        args.AddParam("why", "", false);

                    litEverythingResults.Text = XslHelper.TransformInMemory(Server.MapPath("~/Search/Modules/SearchResults/PeopleResults.xslt"), args, this.SearchData.OuterXml);
                    break;
            }
        }


        private string SearchRequest { get; set; }


    }
}