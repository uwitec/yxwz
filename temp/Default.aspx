<%@ Page Language="C#" MasterPageFile="~/yxwz.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="temp_Default" Title="Untitled Page" %>

<%@ Register Src="../Controls/UserSelect.ascx" TagName="UserSelect" TagPrefix="uc2" %>

<%@ Register Src="../Controls/RptFilterBar.ascx" TagName="RptFilterBar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
    &nbsp;<asp:FormView ID="FormView1" runat="server" DataSourceID="ObjectDataSource1">
        <ItemTemplate>
    <uc2:UserSelect ID="UserSelect1" runat="server" />
        </ItemTemplate>
    </asp:FormView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"></asp:ObjectDataSource>
</asp:Content>

