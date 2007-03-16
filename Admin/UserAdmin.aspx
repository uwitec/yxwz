<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserAdmin.aspx.cs" Inherits="Admin_UserAdmin"  MasterPageFile="~/yxwz.master"%>


<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
            <Columns>
                <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" SortExpression="UserName" />
                <asp:BoundField DataField="CreationDate" HeaderText="CreationDate" ReadOnly="True"
                    SortExpression="CreationDate" />
                <asp:BoundField DataField="LastPasswordChangedDate" HeaderText="LastPasswordChangedDate"
                    ReadOnly="True" SortExpression="LastPasswordChangedDate" />
                <asp:HyperLinkField DataNavigateUrlFields="UserName" DataNavigateUrlFormatString="~/Admin/userSetPassword.aspx?userName={0}"
                    Text="修改密码" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    
    </div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="DelUser" SelectMethod="GetALLUsers" TypeName="MembershipHelp">
        <DeleteParameters>
            <asp:Parameter Name="userName" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="userName" Type="String" />
            <asp:Parameter Name="newPassword" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>
