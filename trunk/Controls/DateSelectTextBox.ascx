﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DateSelectTextBox.ascx.cs" Inherits="Controls_DateSelectTextBox" %>
<asp:TextBox ID="TextBox1" runat="server">2000-1-1</asp:TextBox>
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="^" />
<asp:Calendar ID="Calendar1" runat="server" Visible="False" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>