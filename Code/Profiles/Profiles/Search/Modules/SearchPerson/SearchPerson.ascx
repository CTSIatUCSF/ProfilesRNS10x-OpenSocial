﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchPerson.ascx.cs"
    Inherits="Profiles.Search.Modules.SearchPerson.SearchPerson" EnableViewState="true" %>

<%@ register src="ComboTreeCheck.ascx" tagname="ComboTreeCheck" tagprefix="uc1" %>

<style type="text/css">
.profiles .profilesContentMain { width: 584px; }
.profiles .profilesContentPassive { margin-right: 20px; }
.profiles .profilesContentMain .pageTitle h2 { display: none; }
</style>


<script type="text/javascript">


    function runScript(e) {
        if (e.keyCode == 13) {
            search();
            return true;
        }
        return false;
    }

    function search() {
        

        var lname = document.getElementById("txtLname").value;
        var fname = document.getElementById("txtFname").value
        var searchfor = document.getElementById("txtSearchFor").value;
        var exactphrase = document.getElementById("exactphrase").checked;

        var institution = "";
        var institutionallexcept = "";

        var department = "";
        var departmentallexcept = "";

        var division = "";
        var divisionallexcept = "";

        if (document.getElementById("institution") != null) {
            institution = document.getElementById("institution").value;
            institutionallexcept = document.getElementById("institutionallexcept").checked;
        }

        if (document.getElementById("department") != null) {
            department = document.getElementById("department").value;
            departmentallexcept = document.getElementById("departmentallexcept").checked;
        }

        if (document.getElementById("division") != null) {
            division = document.getElementById("division").value;
            divisionallexcept = document.getElementById("divisionallexcept").checked;
        }

        var otherfilters = document.getElementById("hdnSelectedText").value;

        var classuri = 'http://xmlns.com/foaf/0.1/Person';

        document.location.href = '<%=GetURLDomain()%>/search/default.aspx?searchtype=people&otherfilters=' + otherfilters +
                                '&lname=' + lname + '&fname=' + fname +
                                '&department=' + department + '&institution=' + institution +
                                '&searchfor=' + searchfor + '&classuri=' + classuri +
                                '&institutionallexcept=' + institutionallexcept + '&departmentallexcept=' + departmentallexcept +
                                '&divisionallexcept=' + divisionallexcept + '&division=' + division +
                                '&exactphrase=' + exactphrase +
                                '&perpage=15&offset=0';
    }
</script>

<div class="content_container">
    <div class="tabContainer" style="margin-top: 0px;">
        <div class="searchForm nonavbar">
            <table onkeypress="JavaScript:runScript(event);"  width="100%">
                <tbody align="left">
                    <tr>
                        <td colspan='3'>
                            <div class='header'>
                                Find People by Name or Research Topic</div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <div class="searchSection" id="divSearchSection">
                                <table width="100%" class='searchForm'>
                                    <tr>
                                        <th style="width: 140px">
                                            Keywords or Name
                                        </th>
                                        <td colspan="2" class="fieldOptions">
                                            <input onkeypress="JavaScript:runScript(event);" type="text" name="txtSearchFor" id="txtSearchFor" class="inputText keywordsName" />
                                            <input type="hidden" id='exactphrase' />
                                        </td>
<!--  NOTE: checkboxes are hidden & name rows are display: none
                                            Search for exact phrase
                                    </tr>
                                    <tr>
                                        <tr>
                                            <th>
                                            </th>
-->
                                            <td style="text-decoration: none" colspan="2">
                                                <div style="float: left; display: inline">
                                                    <a href="JavaScript:search();">
                                                        <img src="<%=GetURLDomain()%>/Search/Images/search.jpg" style="border: 0;" alt="Search" />
                                                    </a>
                                                </div>
                                            </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
            </table>
            <table width="100%" id="searchOptions">
<!--
                <tr>
                    <td colspan='3'>
                        <div class='header'>
                            Find people by name/organization</div>
                    </td>
                </tr>
-->
                <tr>
                    <td colspan='3'>
                        <div class="searchSection" id="div1">
                            <table width="100%" class='searchForm'>

                                <tr style="display:none;">
                                    <th>
                                        Last Name
                                    </th>
                                    <td colspan="2">
                                        <input onkeypress="JavaScript:runScript(event);" type="text" name="txtLname" id="txtLname" class="inputText" />
                                    </td>
                                </tr>
                                <tr style="display:none;">
                                    <th>
                                        First Name
                                    </th>
                                    <td colspan="2">
                                        <input onkeypress="JavaScript:runScript(event);" type="text" name="txtFname" id="txtFname" class="inputText" />
                                    </td>
                                </tr>

                                <tr runat="server" id="trInstitution">
                                    <th style="width: 140px;">
                                        School
                                    </th>
                                    <td colspan="2">
                                        <asp:Literal runat="server" ID="litInstitution"></asp:Literal>
                                        <input type="hidden" id="institutionallexcept" />
<!--
                                        All <b>except</b> the one selected
-->
                                    </td>
                                </tr>
                                <tr runat="server" id="trDepartment">
                                    <th>
                                        Department
                                    </th>
                                    <td colspan="2">
                                        <asp:Literal runat="server" ID="litDepartment"></asp:Literal>
                                        <input type="hidden" id="departmentallexcept" />
<!--
                                        All <b>except</b> the one selected
-->
                                    </td>
                                </tr>
                                <tr runat="server" id="trDivision">
                                    <th>
                                        Division
                                    </th>
                                    <td colspan="2">
                                        <asp:Literal runat="server" ID="litDivision"></asp:Literal>
                                        <input type="checkbox" id="divisionallexcept" />
                                        All <b>except</b> the one selected
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        More Options
                                    </th>
                                    <td colspan='2'>
                                        <input type="hidden" id="hiddenToggle" value="off" />
                                        <select id="selOtherOptions" style="width: 249px">
                                            <option value="">&nbsp;&nbsp;-- Select Options --&nbsp;&nbsp;</option>
                                        </select>
                                        <table>
                                            <tr>
                                                <td>
                                                    <div id="divOtherOptions" style="position:absolute; margin-top:-2px; margin-left:-2px; width:255px; border-right: solid 1px #000000; border-bottom: solid 1px #000000;
                                                        border-left: solid 1px gray; padding-left: 3px; height: 150; width: 243px; overflow: auto;
                                                        background-color: #ffffff;">
                                                        <br />
                                                        <uc1:ComboTreeCheck ID="ctcFirst" runat="server" Width="255px" />
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
<!--
                                <tr>
                                    <th>
                                    </th>
                                    <td colspan="2">
                                        <div style="float: left; display: inline">
                                            <a href="JavaScript:search();">
                                                <img src="<%=GetURLDomain()%>/Search/Images/search.jpg" style="border: 0;" alt="Search" />
                                            </a>
                                        </div>
                                    </td>
                                </tr>
-->
                           
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
<!--
            <p><img src="<%=GetURLDomain()%>/Search/Images/icon_squareArrow.gif" /> <a href="<%=GetURLDomain()%>/search/all">Find articles and other content as well as people</a><br />
-->
            <p><img src="<%=GetURLDomain()%>/Search/Images/icon_squareArrow.gif" /> <a href="<%=GetURLDomain()%>/direct">Search other institutions</a></p>
        </div>
    </div>

