<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OpticalPointOfSale.Pages.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="../Content/Site.css" rel="stylesheet" />
    <title>Optical Point Of Sale</title>
</head>
<body>
     
    <form id="form1" runat="server">
        <div id="loginDiv2" class="loginDiv">
            <table style="width: 100%;">
                <tr>
                    <td style="text-align: center;">
                <asp:Label ID="lblHeading" runat="server" Text="Login" ForeColor="#228B22" Font-Size="XX-Large"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td><asp:Label ID="Label6" runat="server" Text="User Name"></asp:Label> &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserName" CssClass="field-validation-error" Display="Dynamic" ErrorMessage="RequiredFieldValidator">This field is required</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtUserName" runat="server" MaxLength="30"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td><asp:Label ID="Label7" runat="server" Text="Password"></asp:Label> &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword" CssClass="field-validation-error" Display="Dynamic" ErrorMessage="RequiredFieldValidator">This field is required</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" MaxLength="30" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblError" runat="server" CssClass="error" Font-Size="Medium"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;"><asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="button buttonSubmit" OnClick="btnLogin_Click" /></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
