<%@ Page Language="C#" AutoEventWireup="true" CodeFile="rpt_HZ.aspx.cs" Inherits="Admin_JLHZ"  MasterPageFile="~/yxwz.master"%>

<%@ Register Src="../Controls/UserSelect.ascx" TagName="UserSelect" TagPrefix="uc1" %>
<%@ Register Src="../Controls/DateSelectTextBox.ascx" TagName="DateSelectTextBox"
    TagPrefix="uc2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <div>
        选择供电所:&nbsp; &nbsp;
        <uc1:UserSelect ID="UserSelect1" runat="server" />
        <br />
        &nbsp;选择开始日期:<uc2:dateselecttextbox id="DateSelectStart" runat="server"></uc2:dateselecttextbox>
        <br />
        选择结束日期:
        <uc2:dateselecttextbox id="DateSelectEnd" runat="server"></uc2:dateselecttextbox>
        <br />
    
    </div>
</asp:Content>
