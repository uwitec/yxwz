<%@ Page Language="C#" MasterPageFile="~/yxwz.master" AutoEventWireup="true" CodeFile="rpt_LQJL.aspx.cs" Inherits="User_rpt_LQJL" Title="Untitled Page" %>

<%@ Register Src="../Controls/UserSelect.ascx" TagName="UserSelect" TagPrefix="uc1" %>
<%@ Register Src="../Controls/DateSelectTextBox.ascx" TagName="DateSelectTextBox"
    TagPrefix="uc2" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=10.2.3600.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
    选择供电所:&nbsp; &nbsp;
    <uc1:UserSelect id="UserSelect1" runat="server">
    </uc1:UserSelect>
    <br />
    &nbsp;选择开始日期:<uc2:DateSelectTextBox ID="DateSelectStart" runat="server" />
    <br />
    选择结束日期:
    <uc2:DateSelectTextBox ID="DateSelectEnd" runat="server" />
                        <br />
    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True"
        Height="50px" ReportSourceID="CrystalReportSourceLQJL" Width="901px" HasCrystalLogo="False" HasGotoPageButton="False" HasToggleGroupTreeButton="False" HasViewList="False" DisplayGroupTree="False" />
    <CR:CrystalReportSource ID="CrystalReportSourceLQJL" runat="server">
        <Report FileName="..\rpt\LQJL.rpt">
            <DataSources>
                <CR:DataSourceRef DataSourceID="ObjectDataSource1" TableName="JL" />
            </DataSources>
        </Report>
    </CR:CrystalReportSource>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetData" TypeName="dataTableAdapters.JLTableAdapter">
        <SelectParameters>
            <asp:ControlParameter ControlID="UserSelect1" DefaultValue="y97523" Name="用户名称" />
            <asp:ControlParameter ControlID="DateSelectStart" Name="开始时间" />
            <asp:ControlParameter ControlID="DateSelectEnd" Name="结束时间" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

