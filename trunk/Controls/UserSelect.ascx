<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserSelect.ascx.cs" Inherits="Controls_UserSelect" %>
<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="users" DataTextField="UserName"
    DataValueField="UserName" >
</asp:DropDownList>
<asp:SqlDataSource ID="users" runat="server" ConnectionString="<%$ ConnectionStrings:Users %>"
    SelectCommand="SELECT vw_aspnet_Users.UserName FROM vw_aspnet_Users INNER JOIN aspnet_UsersInRoles ON vw_aspnet_Users.UserId = aspnet_UsersInRoles.UserId INNER JOIN aspnet_Roles ON aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId WHERE (aspnet_Roles.RoleName = N'供电所')"></asp:SqlDataSource>
