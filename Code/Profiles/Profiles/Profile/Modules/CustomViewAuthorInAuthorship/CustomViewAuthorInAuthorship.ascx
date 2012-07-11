<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomViewAuthorInAuthorship.ascx.cs"
    Inherits="Profiles.Profile.Modules.CustomViewAuthorInAuthorship" %>
<asp:Repeater ID="rpPublication" runat="server" OnItemDataBound="rpPublication_OnDataBound">
    <HeaderTemplate>
        <div class="sectionHeader">
            Publications</div>
        <ul style="list-style-type: decimal">
    </HeaderTemplate>
    <ItemTemplate>
    
        <div id="publicationListAll" class="publications">
            <li>
                <div>
                    <asp:Label runat="server" ID="lblPublication"></asp:Label>
                </div>
                <div class="viewIn">
                    <asp:Literal runat="server" ID="litViewIn"></asp:Literal>
                </div>
                </div>
    </ItemTemplate>
    <FooterTemplate>
        </ul>
    </FooterTemplate>
</asp:Repeater>

