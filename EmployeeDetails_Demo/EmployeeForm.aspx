<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeForm.aspx.cs" Inherits="EmployeeDetails_Demo.EmployeeForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td>
                    <label>EmpID [Fetching from Web Service]</label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlEmpID" runat="server" DataSourceID="EmpDataSource" DataTextField="EmpID" DataValueField="EmpID" OnSelectedIndexChanged="ddlEmpID_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                    <asp:SqlDataSource ID="EmpDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:EmpDBConnection %>" SelectCommand="SELECT [EmpID] FROM [tblEmployee]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Employee Name</label></td>
                <td>
                    <asp:TextBox ID="txtEmpName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Employee Designation</label></td>
                <td>
                    <asp:TextBox ID="txtEmpDesignation" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Employee Email ID</label></td>
                <td>
                    <asp:TextBox ID="txtEmailID" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    <label>Employee Address</label></td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnAdd" runat="server" Text="Add Employee" OnClick="btnAdd_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Update via Webservice"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="btnUpdate" runat="server" Text="Update Employee" OnClick="btnUpdate_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
