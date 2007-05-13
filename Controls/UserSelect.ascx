<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserSelect.ascx.cs" Inherits="Controls_UserSelect" %>
<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="users" DataTextField="UserName"
    DataValueField="UserName" >
</asp:DropDownList>
<asp:SqlDataSource ID="users" runat="server" ConnectionString="<%$ ConnectionStrings:Users %>"
    OnLoad="users_Load" SelectCommand="SELECT  [UserName] FROM [vw_aspnet_Users]"></asp:SqlDataSource>
