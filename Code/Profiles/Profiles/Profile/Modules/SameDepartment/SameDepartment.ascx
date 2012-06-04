<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SameDepartment.ascx.cs"
    Inherits="Profiles.Profile.Modules.SameDepartment.SameDepartment" %>
<asp:Repeater ID='rptSameDepartment' runat="server" OnItemDataBound="SameDepartmentItemBound">
    <HeaderTemplate>
        <div class="passiveSectionHead">
            <div style="white-space: nowrap; display: inline">
                Same Department <a href="JavaScript:toggleVisibility('sdDescript');">
                    <asp:Image runat="server" ID="imgQuestion" />
                </a>
            </div>
        </div>
        <div id="sdDescript" class="passiveSectionHeadDescription" style="display: none;">
            People who are also in this person's primary department.
        </div>
        <div class="passiveSectionBody">
            <ul>
    </HeaderTemplate>
    <ItemTemplate>
        <asp:Literal runat="server" ID="litListItem"></asp:Literal>
    </ItemTemplate>
    <FooterTemplate>
        </ul>
        <div class='passiveSectionBodyDetails'>
            <asp:Literal runat="server" ID="litFooter"></asp:Literal>
        </div>
        <div class="passiveSectionLine">
        </div>
        </div>
    </FooterTemplate>
</asp:Repeater>
