<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MailDetailsForm.aspx.cs" Inherits="EmployeeDetails_Demo.MailDetailsForm" EnableViewState="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label4" runat="server" Text="Email has been send to following details"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Employee Name"></asp:Label>
                </td>
                 <td>
                    <asp:Label ID="lblEmpName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Employee Email ID"></asp:Label>
                </td>
                 <td>
                    <asp:Label ID="lblEmpMailID" runat="server"></asp:Label>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Employee Designation"></asp:Label>
                </td>
                 <td>
                    <asp:Label ID="lblEmpDesignation" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnNavigateToHome" runat="server" Text="Navigate To Home Page" OnClick="btnNavigateToHome_Click" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
