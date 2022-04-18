<%@ Page Title="" Language="C#" MasterPageFile="~/FacultyMaster.Master" AutoEventWireup="true" CodeBehind="ApplyLeave.aspx.cs" Inherits="PayrollApplication.ApplyLeave" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <center>
    <div class="card w-50 m-5">
        <br /><br />
        <asp:Table runat="server" ID="tblsalary" class="card-body table table-responsive" BorderWidth="0" >
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="From Date" CssClass="form-label m-50"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox runat="server" ValidationGroup="avail" ID="txtFromDate" TextMode="Date" CssClass="form-control w-50"></asp:TextBox>
                    
                </asp:TableCell>
                <asp:TableCell>
                    
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="avail" ControlToValidate="txtFromDate" ErrorMessage="*Required" ForeColor="Red" ></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
             <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="To Date" CssClass="form-label m-50"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox runat="server" ValidationGroup="avail" ID="txtToDate" TextMode="Date" CssClass="form-control w-50"></asp:TextBox>
                    
                </asp:TableCell>
                 <asp:TableCell>
                    
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="avail" ControlToValidate="txtToDate" ErrorMessage="*Required" ForeColor="Red" ></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Leave Type" CssClass="form-label m-50"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="drpLeaveTypes" runat="server" ValidationGroup="avail" AutoPostBack="true" CssClass="form-control form-select w-50" OnSelectedIndexChanged="drpLeaveTypes_SelectedIndexChanged"></asp:DropDownList>
                    
                </asp:TableCell>
                <asp:TableCell>
                    
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="avail" ControlToValidate="drpLeaveTypes" ErrorMessage="*Required" ForeColor="Red" ></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
             <asp:TableRow>
                <asp:TableCell>
                    <asp:Label runat="server" Text="Reason for Leave" CssClass="form-label m-50"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox runat="server" ValidationGroup="avail" ID="txtReason" CssClass="form-control w-50"></asp:TextBox>
                    
                </asp:TableCell>
                 <asp:TableCell>
                    
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="avail" ControlToValidate="txtReason" ErrorMessage="*Required" ForeColor="Red" ></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
             
            <asp:TableFooterRow>
                <asp:TableCell colspan="2" class="text-center">
                    <asp:Button runat="server" ValidationGroup="avail" Text="Apply" CssClass="btn btn-primary w-50" OnClick="ApplyLeave_Click"/>
                </asp:TableCell>

            </asp:TableFooterRow>
        </asp:Table>
            
    </div>
        </center>
</asp:Content>
