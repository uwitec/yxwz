﻿<%@ Page Language="C#" MasterPageFile="~/yxwz.master" AutoEventWireup="true" CodeFile="JLLock.aspx.cs" Inherits="Admin_JLLock" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
<center>
    录入记录锁定日期设置<br />
    <br />
    <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="设定" />
    <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Red"></asp:Label></center>
</asp:Content>

