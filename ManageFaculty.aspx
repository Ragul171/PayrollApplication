<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageFaculty.aspx.cs" Inherits="PayrollApplication.ManageEmployee" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder1" runat="server">
    <div class="m-5">
    <asp:GridView ID="empGrid" runat="server" 
                OnRowEditing="empGrid_RowEditing" OnRowCancelingEdit="empGrid_RowCancelingEdit"
                OnRowUpdating="empGrid_RowUpdating" OnRowDeleting="empGrid_RowDeleting"
                AutoGenerateColumns="false" ShowHeader="true" 
                DataKeyNames="EmpId" CssClass="table table-striped table-responsive" >
                <Columns>
                    <asp:TemplateField HeaderText="Employee Name">
                        <ItemTemplate>
                            <asp:Label ID="lblEmpName" Text='<%# Eval("EmpName") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Employee DOB">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("EmpDob") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Employee Address">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("EmpAddress") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Employee Mobile No.">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("EmpMobile") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEmpMobile" Text='<%# Eval("EmpMobile") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Employee Email">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("EmpEmail") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEmpEmail" Text='<%# Eval("EmpEmail") %>' runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button runat="server" CommandName="Edit" CssClass="btn btn-primary fa" Text="&#xf044;"/>
                            <asp:Button runat="server" CommandName="Delete" CssClass="btn btn-danger fa" Text="&#xf1f8;" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button runat="server" CommandName="Update" CssClass="btn btn-primary fa" Text="&#xf0c7;" />
                            <asp:Button runat="server" CommandName="Cancel" CssClass="btn btn-danger fa" Text="&#xf00d;" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
</asp:Content>
