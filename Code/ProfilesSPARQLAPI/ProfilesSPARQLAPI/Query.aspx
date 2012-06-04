<%@ Page Language="C#" AutoEventWireup="true" validateRequest="false" CodeBehind="Query.aspx.cs" Inherits="ProfilesSPARQLAPI.Query" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profiles SPARQL Query Tool</title>
</head>
<form runat="server">
<body>

    
    <div>
        <table>
            <tr>
                <td>
                <b>Query:</b>
                </td>
                <td><asp:TextBox runat="server" ID="txtQuery"  TextMode="MultiLine" Width="500px" Height="300px"></asp:TextBox><br />
             
                </td>
            </tr>            
            
            <tr>
                <td colspan='2' style="padding-left:65px"><asp:Button runat="server" ID="cmdRun" Text="Run" 
                        onclick="cmdRun_Click" />
                </td>                
            </tr>
            <tr>
                <td colspan='2'>&nbsp;
                </td>                
            </tr>
            <tr>
                <td><b>Results:</b>
                </td>
                <td>
                <asp:TextBox runat="server" ID="txtResults" height="300px" Width="500px" TextMode="MultiLine" />
                </td>
            </tr>
        </table>
    </div>
    
</body>
</form>
</html>

