<%@ Page Language="C#" MasterPageFile="~/yxwz.master" AutoEventWireup="true" CodeFile="rpt_LQJL.aspx.cs" Inherits="User_rpt_LQJL" Title="Untitled Page" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=10.2.3600.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
    &nbsp;
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="users" DataTextField="UserName"
                            DataValueField="UserName" SelectedValue='<%# Bind("领取用户") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="users" runat="server" ConnectionString="<%$ ConnectionStrings:Users %>"
                            OnLoad="users_Load" SelectCommand="SELECT  [UserName] FROM [vw_aspnet_Users]"></asp:SqlDataSource>
    <asp:Calendar ID="CalStartTime" runat="server"></asp:Calendar>
    <asp:Calendar ID="CalEndTime" runat="server"></asp:Calendar>
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
            <asp:ControlParameter ControlID="DropDownList1" Name="用户名称" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

