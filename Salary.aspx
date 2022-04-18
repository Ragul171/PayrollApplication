<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Salary.aspx.cs" Inherits="PayrollApplication.Salary" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <div class="container" height="300px"><br />
        <asp:Table runat="server" CssClass="table table-responsive m-2">
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Select Employee" CssClass="form-label m-50"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="drpEmployee" runat="server" AutoPostBack="true" CssClass="form-control form-select w-50" OnSelectedIndexChanged="drpEmployee_SelectedIndexChanged"></asp:DropDownList>
                </asp:TableCell>    
            </asp:TableRow>
                    
        </asp:Table>
        <center>
        <asp:Label runat="server" ID="lblMessage"></asp:Label>
        
            
            <asp:Table runat="server" ID="tblsalary" class="table table-responsive w-50" Visible="false">
            <asp:TableHeaderRow class="bg-light">
                <asp:TableHeaderCell>
                    <asp:Label runat="server" Text="Salary Components" CssClass="form-label m-50 fw-bold"></asp:Label>
                </asp:TableHeaderCell>
                <asp:TableHeaderCell>
                    <asp:Label runat="server" Text="Amount" CssClass="form-label m-50 fw-bold "></asp:Label>
                </asp:TableHeaderCell>
            </asp:TableHeaderRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Basic Pay" CssClass="form-label m-50"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox runat="server" ID="txtBasicPay" CssClass="form-control w-50"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
             <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Dearness Allowance" CssClass="form-label m-50"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox runat="server" ID="txtDA" CssClass="form-control w-50"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
             <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="House Rent Allowance" CssClass="form-label m-50"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox runat="server" ID="txtHRA" CssClass="form-control w-50"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
             <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Conveyance Allowance" CssClass="form-label m-50"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox runat="server" ID="txtCA" CssClass="form-control w-50"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Special Allowance" CssClass="form-label m-50"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox runat="server" ID="txtSA" CssClass="form-control w-50"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableFooterRow>
                <asp:TableCell colspan="2" class="text-center">
                    <asp:Button runat="server" Text="Add" CssClass="btn btn-primary w-50" OnClick="AddSalary_Click"/>
                </asp:TableCell>
            </asp:TableFooterRow>
        </asp:Table>
        </center>
        
        
        
    </div>
    

</asp:Content>
