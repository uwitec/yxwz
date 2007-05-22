<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserAdmin.aspx.cs" Inherits="Admin_UserAdmin"  MasterPageFile="~/yxwz.master"%>


<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <div style="text-align: center">
        用户管理<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" OnRowDataBound="GridView1_RowDataBound" OnRowDeleting="GridView1_RowDeleting">
            <Columns>
                <asp:BoundField DataField="UserName" HeaderText="用户名" ReadOnly="True" SortExpression="UserName" />
                <asp:TemplateField HeaderText="用户组">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server">
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text="未在任何组"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFields="UserName" DataNavigateUrlFormatString="~/Admin/userSetPassword.aspx?userName={0}"
                    Text="修改密码" />
                <asp:HyperLinkField DataNavigateUrlFields="UserName" HeaderText="权限" Text="设置权限" DataNavigateUrlFormatString="~/Admin/userSetPower.aspx?userName={0}" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    
    </div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="DelUser" SelectMethod="GetALLUsers" TypeName="MembershipHelp" ConflictDetection="CompareAllValues">
    </asp:ObjectDataSource>
    <asp:Label ID="LbError" runat="server" EnableViewState="False" ForeColor="Red" Text="Label"
        Visible="False"></asp:Label>
</asp:Content>
