<%@ Page Language="C#" AutoEventWireup="true" CodeFile="rpt_HZ.aspx.cs" Inherits="Admin_JLHZ"  MasterPageFile="~/yxwz.master"%>

<%@ Register Src="../Controls/UserSelect.ascx" TagName="UserSelect" TagPrefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <div>
        ѡ�񹩵���:&nbsp; &nbsp;
        <uc1:UserSelect ID="UserSelect1" runat="server" />
        <br />
        &nbsp;ѡ��ʼ����:
        <br />
        ѡ���������:
        
        <br />
    
    </div>
</asp:Content>
