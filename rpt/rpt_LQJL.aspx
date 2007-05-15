<%@ Page Language="C#" MasterPageFile="~/yxwz.master" AutoEventWireup="true" CodeFile="rpt_LQJL.aspx.cs" Inherits="User_rpt_LQJL" Title="Untitled Page" %>

<%@ Register Src="../Controls/RptFilterBar.ascx" TagName="RptFilterBar" TagPrefix="uc1" %>




<%@ Register Assembly="CrystalDecisions.Web, Version=10.2.3600.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
    <uc1:RptFilterBar ID="RptFilterBar1" runat="server" />
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
        SelectMethod="GetLQJL" TypeName="dataTableAdapters.JLTableAdapter" OnDataBinding="ObjectDataSource1_DataBinding">
        <SelectParameters>
            <asp:ControlParameter ControlID="RptFilterBar1" Name="用户名称" PropertyName="SelectedUser"
                Type="String" />
            <asp:ControlParameter ControlID="RptFilterBar1" Name="开始时间" PropertyName="StartTime"
                Type="DateTime" />
            <asp:ControlParameter ControlID="RptFilterBar1" Name="结束时间" PropertyName="EndTime"
                Type="DateTime" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

