<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RptFilterBar.ascx.cs" Inherits="Controls_RptFilterBar" %>
<%@ Register Src="UserSelect.ascx" TagName="UserSelect" TagPrefix="uc1" %>
选择供电所: &nbsp;<uc1:UserSelect ID="UserSelect1" runat="server" />
&nbsp;
选择开始日期:<input id="DateSelectStart" runat="server" onfocus="calendar()" value="2007-1-1" />
选择结束日期:<input id="DateSelectEnd" runat="server" onfocus="calendar()" value="2007-1-1" />
<asp:Button ID="Button1" runat="server" Text="确定" />
