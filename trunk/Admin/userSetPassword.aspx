<%@ Page Language="C#" MasterPageFile="~/yxwz.master" AutoEventWireup="true" CodeFile="userSetPassword.aspx.cs" Inherits="Admin_SetUserPassword" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
    修改密码<br />
    <br />
    <asp:Label ID="lbUserName" runat="server" Text="Label"></asp:Label><br />
    新的密码
    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPassword"
        ErrorMessage="请输入新密码"></asp:RequiredFieldValidator><br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="修改" /><br />
    <asp:Label ID="lbInfo" runat="server" EnableViewState="False" Text="密码修改成功！" Visible="False"></asp:Label>
</asp:Content>

