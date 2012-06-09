﻿<%@ Control Language="C#" EnableViewState="true" AutoEventWireup="true" CodeBehind="GadgetSandbox.ascx.cs"
    Inherits="Profiles.ORNG.Modules.GadgetSandbox.GadgetSandbox" %>
<%--
    Copyright (c) 2008-2012 by the President and Fellows of Harvard College. All rights reserved.  
    Profiles Research Networking Software was developed under the supervision of Griffin M Weber, MD, PhD.,
    and Harvard Catalyst: The Harvard Clinical and Translational Science Center, with support from the 
    National Center for Research Resources and Harvard University.


    Code licensed under a BSD License. 
    For details, see: LICENSE.txt 
 --%>
<div class="content_container">
    <div class="tabContainer" style="margin-top: 0px;">
        <div class="searchForm">
        </div>
    </div>
</div>
<div class="content_container">
    <div class="tabContainer" style="margin-top: 0px;">
        <div class="searchForm">
            <table width="100%">
                <tr>
                    <td colspan="3">
                        <div class="searchSection" style="text-align: center; margin: 0px auto;">
                            <table class="searchForm" style="display: inline;">
                                <tr>
                                    <td colspan='3'>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Username</b>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtUserName" value="" MaxLength="25" Width="250"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Sandbox Password</b>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" ID="txtPassword" value="" TextMode="Password" MaxLength="25"
                                            Width="250"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        Gadgets</p>
                                        One Per Line
                                    </th>
                                    <td>
                                        <asp:TextBox ID="txtGadgetURLS" runat="server" rows="10" TextMode="multiline" Width="400px" ToolTip="Enter Gadget URLs" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="chkDebug" runat="server" Text="Debug Mode" Checked="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:CheckBox ID="chkUseCache" runat="server" Text="Use Cache" Checked="false" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                       
                                    </td>
                                    <td> <asp:ImageButton ImageUrl="~/login/images/loginButton.jpg" runat="server" ID="cmdSubmit"
                                            Text="Login" OnClick="cmdSubmit_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    
                                    <td colspan='2'>
                                        <asp:Label runat="server" ID="lblError" ForeColor="Red" Font-Bold="true"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
