<%@ Page Language="C#" MasterPageFile="~/yxwz.master" AutoEventWireup="true" CodeFile="userSetPassword.aspx.cs" Inherits="Admin_SetUserPassword" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
    �޸�����<br />
    <br />
    <asp:Label ID="lbUserName" runat="server" Text="Label"></asp:Label><br />
    �µ�����
    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPassword"
        ErrorMessage="������������"></asp:RequiredFieldValidator><br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="�޸�" /><br />
    <asp:Label ID="lbInfo" runat="server" EnableViewState="False" Text="�����޸ĳɹ���" Visible="False"></asp:Label>
</asp:Content>

