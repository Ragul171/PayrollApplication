<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddFaculty.aspx.cs" Inherits="PayrollApplication.AddEmployee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
        <div class="container"><br />
                <table class="table table-responsive m-2">
                    <tr>
                        <td ><asp:Label runat="server" CssClass="form-label" Text="Faculty Name"></asp:Label></td>
                        <td><asp:TextBox ID="txtEmpNameAdd" runat="server" ValidationGroup="avail" CssClass="form-control w-50"/>
                        </td>
                        <td><asp:RequiredFieldValidator runat="server" ValidationGroup="avail" ControlToValidate="txtEmpNameAdd" ErrorMessage="*Required" ForeColor="Red" ></asp:RequiredFieldValidator></td>
                        
                    </tr>
                    <tr>
                        <td ><asp:Label runat="server" CssClass="form-label" Text="Faculty DOB"></asp:Label></td>
                        <td><asp:TextBox ID="txtEmpDobAdd" runat="server" ValidationGroup="avail" TextMode="Date" CssClass="form-control w-50"/>
                        </td>
                        <td><asp:RequiredFieldValidator runat="server" ValidationGroup="avail" ControlToValidate="txtEmpDobAdd" ErrorMessage="*Required" ForeColor="Red" ></asp:RequiredFieldValidator></td>
                        
                    </tr>
                    <tr>
                        <td ><asp:Label runat="server" CssClass="form-label" Text="Faculty Address"></asp:Label></td>
                        <td><asp:TextBox ID="txtEmpAddressAdd" runat="server" ValidationGroup="avail" CssClass="form-control w-50"/></td>
                        <td><asp:RequiredFieldValidator runat="server" ValidationGroup="avail" ControlToValidate="txtEmpAddressAdd" ErrorMessage="*Required" ForeColor="Red" ></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td ><asp:Label runat="server" CssClass="form-label" Text="Faculty Mobile Number"></asp:Label></td>
                        <td ><asp:TextBox ID="txtEmpMobileAdd" runat="server" ValidationGroup="avail" CssClass="form-control w-50"/></td>
                        <td><asp:RequiredFieldValidator runat="server" ValidationGroup="avail" ControlToValidate="txtEmpMobileAdd" ErrorMessage="*Required" ForeColor="Red" ></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td ><asp:Label runat="server" CssClass="form-label" Text="Faculty Email ID"></asp:Label></td>
                        <td ><asp:TextBox ID="txtEmpEmailAdd" runat="server" ValidationGroup="avail" TextMode="Email" CssClass="form-control w-50"/></td>
                        <td><asp:RequiredFieldValidator runat="server" ValidationGroup="avail" ControlToValidate="txtEmpEmailAdd" ErrorMessage="*Required" ForeColor="Red" ></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td ><asp:Label runat="server" CssClass="form-label" Text="Faculty User ID"></asp:Label></td>
                        <td ><asp:TextBox ID="txtEmpUserId" runat="server" ValidationGroup="avail" CssClass="form-control w-50"/></td>
                        <td><asp:RequiredFieldValidator runat="server" ValidationGroup="avail" ControlToValidate="txtEmpUserId" ErrorMessage="*Required" ForeColor="Red" ></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td ><asp:Label runat="server" ValidationGroup="avail" CssClass="form-label" Text="Faculty Department"></asp:Label></td>
                        <td ><asp:DropDownList ID="drpDept" runat="server" ValidationGroup="avail" CssClass="form-control form-select w-50">
                                <asp:ListItem Text="--Select Department--"></asp:ListItem>
                             </asp:DropDownList></td>
                        <td><asp:RequiredFieldValidator runat="server" ValidationGroup="avail" ControlToValidate="drpDept" ErrorMessage="*Required" ForeColor="Red" ></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                         <td ><asp:Label runat="server" ValidationGroup="avail" CssClass="form-label" Text="Faculty Designation"></asp:Label></td>
                        <td ><asp:DropDownList ID="drpDesignation" runat="server" ValidationGroup="avail" CssClass="form-control form-select w-50">
                                <asp:ListItem Text="--Select Designation--"></asp:ListItem>
                             </asp:DropDownList></td>
                        <td><asp:RequiredFieldValidator runat="server" ValidationGroup="avail" ControlToValidate="drpDesignation" ErrorMessage="*Required" ForeColor="Red" ></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-center">
                            <asp:Button runat="server" Text="Add" ValidationGroup="avail" CssClass="btn btn-primary w-50" OnClick="Add_Click"/>
                        </td>
                    </tr>
                </table>

            </div>
    
</asp:Content>

