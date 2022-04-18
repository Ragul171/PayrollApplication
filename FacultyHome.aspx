<%@ Page Title="" Language="C#" MasterPageFile="~/FacultyMaster.Master" AutoEventWireup="true" CodeBehind="FacultyHome.aspx.cs" Inherits="PayrollApplication.EmployeeHome" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <center>
        <h2 class="m-2">Profile</h2>
    <asp:Table runat="server" ID="tblsalary" class="card-body table table-responsive" BorderWidth="0" >
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Employee Name" CssClass="form-label m-50"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" ID="empName" CssClass="form-label w-50"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Employee Designation" CssClass="form-label m-50"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" ID="empDesg" CssClass="form-label w-50"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Employee Department" CssClass="form-label m-50"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" ID="empDept" CssClass="form-label w-50"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Employee Dob" CssClass="form-label m-50"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" ID="empDob" CssClass="form-label w-50"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Employee Address" CssClass="form-label m-50"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" ID="empAdd" CssClass="form-label w-50"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Employee Email" CssClass="form-label m-50"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" ID="empEmail" CssClass="form-label w-50"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Employee Mobile" CssClass="form-label m-50"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label runat="server" ID="empMobile" CssClass="form-label w-50"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
             
        </asp:Table>
        </center>
</asp:Content>
