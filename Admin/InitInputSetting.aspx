<%@ Page Language="C#" MasterPageFile="~/yxwz.master" AutoEventWireup="true" CodeFile="InitInputSetting.aspx.cs" Inherits="Admin_InitInputSetting" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
<center>
    初始化录入结束时间设置<br />
    <br />
    <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
    &nbsp;
    <asp:Button ID="btSetEndTime" runat="server" Text="设置结束时间" OnClick="btSetEndTime_Click" />&nbsp;
    <asp:Button ID="BtEndInput" runat="server" Text="关闭初始录入" OnClick="BtEndInput_Click" />
    <br />
    <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Label"></asp:Label></center>
</asp:Content>

