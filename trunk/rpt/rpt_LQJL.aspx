<%@ Page Language="C#" MasterPageFile="~/yxwz.master" AutoEventWireup="true" CodeFile="rpt_LQJL.aspx.cs" Inherits="User_rpt_LQJL" Title="Untitled Page" %>

<%@ Register Src="../Controls/RptFilterBar.ascx" TagName="RptFilterBar" TagPrefix="uc1" %>




<%@ Register Assembly="CrystalDecisions.Web"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
    供电所材料领入报表<br />
    <br />
    <uc1:RptFilterBar ID="RptFilterBar1" runat="server" />
    <br />
    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True"
        Height="1039px" ReportSourceID="CrystalReportSourceLQJL" Width="773px" HasCrystalLogo="False" HasGotoPageButton="False" HasToggleGroupTreeButton="False" HasViewList="False" DisplayGroupTree="False" HasDrillUpButton="False" />
    <CR:CrystalReportSource ID="CrystalReportSourceLQJL" runat="server">
        <Report FileName="..\rpt\LQJL.rpt">
            <DataSources>
                <CR:DataSourceRef DataSourceID="ObjectDataSource1" TableName="领取记录" />
            </DataSources>
        </Report>
    </CR:CrystalReportSource>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetLQJL" TypeName="dataTableAdapters.领取记录TableAdapter" OnDataBinding="ObjectDataSource1_DataBinding"  OnFiltering="ObjectDataSource1_Filtering" OnSelected="ObjectDataSource1_Selected">
        <SelectParameters>
            <asp:ControlParameter ControlID="RptFilterBar1" Name="用户名称" PropertyName="SelectedUser"
                Type="String" />
            <asp:ControlParameter ControlID="RptFilterBar1" Name="开始时间" PropertyName="StartTime"
                Type="DateTime" />
            <asp:ControlParameter ControlID="RptFilterBar1" Name="结束时间" PropertyName="EndTime"
                Type="DateTime" />
            <asp:SessionParameter Name="材料类别" SessionField="当前登录系统id" Type="String" />
        </SelectParameters>
        <FilterParameters>
            <asp:QueryStringParameter Name="clID" QueryStringField="clID" />
        </FilterParameters>
    </asp:ObjectDataSource>
</asp:Content>

