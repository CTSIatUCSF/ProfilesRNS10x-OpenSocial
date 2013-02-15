﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditPropertyList.ascx.cs"
    Inherits="Profiles.Edit.Modules.EditPropertyList.EditPropertyList" %>


<asp:Literal runat="server" ID="litBackLink"></asp:Literal>
<br />
<!--
<div class='editPage'>
    <h2>Edit UCSF Profile</h2>
</div>
-->
<p style="color:#CC0000;font-weight:bold;margin-top:2px;">Please note that your changes may take up to 15 minutes to show on the public site.</p>
<h3>Basic Components:</h3>
<div id="profile-components">
  <table style="width:100%;margin-bottom:0;">
    <tr style="border-bottom:1px solid #CCC;">
       <td class="padding" id="namedegree">Name and Degrees</td>
       <td colspan="2">
         <span id="public"><img src="Images/icons_lock.gif" />Always Public</span>
         <span id="cls">This info is drawn from the Campus Locator System. 
         Please contact your HR representative for corrections.</span>
       </td>
    </tr>
  </table>
<asp:Repeater runat="server" ID="repPropertyGroups" OnItemDataBound="repPropertyGroups_OnItemDataBound">
    <ItemTemplate>
        <asp:GridView runat="server" ID="grdSecurityGroups" AutoGenerateColumns="false" OnRowDataBound="grdSecurityGroups_OnDataBound"
            Width="100%">
            <HeaderStyle BorderStyle="None" CssClass="EditMenuTopRow" />
            <RowStyle BorderColor="#ccc" Width="1px" VerticalAlign="Middle" />
            <Columns>
                <asp:BoundField HeaderStyle-CssClass="padding" ItemStyle-CssClass="padding" HeaderStyle-HorizontalAlign="Left"
                    ItemStyle-HorizontalAlign="Left" DataField="item" HeaderText="Item" ItemStyle-Width="150px" />
                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Items" ItemStyle-Width="50px">
                    <ItemTemplate>
                        <asp:Image runat="server" ID="imgBlank" Visible="false" ImageUrl="~/Edit/Images/icons_blank.gif" />
                        <asp:Label runat="server" ID="lblItems"></asp:Label>
                        <asp:Image runat="server" ID="imgLock" Visible="false" ImageUrl="~/Edit/Images/icons_lock.gif" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Privacy" ItemStyle-Width="100px">
                    <ItemTemplate>
                    
                        <asp:DropDownList AutoPostBack="true" OnSelectedIndexChanged="updateSecurity" runat="server"
                            ID="ddlPrivacySettings">
                        </asp:DropDownList>
                        <asp:Literal runat="server" ID="litSetting"></asp:Literal>
                        
                        <asp:HiddenField ID="hfPropertyURI" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
    </ItemTemplate>
</asp:Repeater>
</div>
<table id="profile-visibility">
    <tr>
        <td colspan='3'>
            <div class='editPage'>
                <table width="100%">
                    <tr>
                        <td>
                            <h3>Visibility Settings</h3>
                        </td>
                        <td align="right">
                           <%-- <b>Set All</b>&nbsp;
                            <asp:DropDownList runat="server" ID="ddlSetAll" AutoPostBack="true" OnSelectedIndexChanged="ddlSetAll_IndexChanged">
                            </asp:DropDownList>--%>
                        </td>
                    </tr>
                </table>
            </div>
            <div>
                <asp:Literal runat="server" ID="litSecurityKey"></asp:Literal>
            </div>
        </td>
    </tr>
</table>
<div style="clear:left">
  <br />
  <h3>Add-ons:</h3>
</div>
<%-- Profiles OpenSocial Extension by UCSF --%>    
<asp:Panel ID="pnlOpenSocial" runat="server" Visible="false">
    <div id="gadgets-edit" class="gadgets-gadget-parent"></div>
</asp:Panel>
