<%@ Page Language="C#" AutoEventWireup="true" CodeFile="rpt_HZ.aspx.cs" Inherits="Admin_JLHZ"  MasterPageFile="~/yxwz.master"%>

<%@ Register Assembly="CrystalDecisions.Web"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<%@ Register Src="../Controls/RptFilterBar.ascx" TagName="RptFilterBar" TagPrefix="uc2" %>

<%@ Register Src="../Controls/UserSelect.ascx" TagName="UserSelect" TagPrefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <div style="text-align: center">
        汇总报表<br />
        <br />
        <uc2:RptFilterBar ID="RptFilterBar1" runat="server" />
        &nbsp;<br />
        &nbsp;<CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True"
            DisplayGroupTree="False" Height="1039px" ReportSourceID="CrystalReportSourcehz"
            Width="773px" HasCrystalLogo="False" HasDrillUpButton="False" HasGotoPageButton="False" HasToggleGroupTreeButton="False" HasViewList="False" />
        <CR:CrystalReportSource ID="CrystalReportSourcehz" runat="server">
            <Report FileName="..\rpt\hz.rpt">
                <DataSources>
                    <CR:DataSourceRef DataSourceID="ObjectDataSource1" TableName="hz" />
                </DataSources>
                <Parameters>
                    <CR:ControlParameter ControlID="RptFilterBar1" ConvertEmptyStringToNull="False" DefaultValue=""
                        Name="StartTime" PropertyName="StartTime" ReportName="" />
                    <CR:ControlParameter ControlID="RptFilterBar1" ConvertEmptyStringToNull="False" DefaultValue=""
                        Name="EndTime" PropertyName="EndTime" ReportName="" />
                </Parameters>
            </Report>
        </CR:CrystalReportSource>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetHZ" TypeName="dataTableAdapters.HZTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="RptFilterBar1" Name="结束时间" PropertyName="EndTime"
                    Type="DateTime" />
                <asp:ControlParameter ControlID="RptFilterBar1" Name="领取用户" PropertyName="SelectedUser"
                    Type="String" />
                <asp:ControlParameter ControlID="RptFilterBar1" Name="开始时间" PropertyName="StartTime"
                    Type="DateTime" />
                <asp:SessionParameter Name="材料类别" SessionField="当前登录系统id" Type="String" />
                </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
