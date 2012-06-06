<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PersonalInfo.ascx.cs"
    Inherits="Profiles.Profile.Modules.PersonalInfo.PersonalInfo" %>
<table>
    <tr>
        <td>
            <asp:Literal runat="server" ID="litPersonalInfo"></asp:Literal>
        </td>
        <td style="width:250px;padding-left:25px" align="right" valign="top">
            <asp:Image runat="server" ID="imgPhoto" />
        </td>
    </tr>
</table>
<%-- Profiles OpenSocial Extension by UCSF --%>    
<asp:Panel ID="pnlOpenSocial" runat="server" Visible="false">
    <div id="gadgets-view" class="gadgets-gadget-parent"></div>
</asp:Panel>
