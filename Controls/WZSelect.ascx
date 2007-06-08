<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WZSelect.ascx.cs" Inherits="Controls_WZSelect" %>
筛选<asp:TextBox ID="TextBox1" runat="server" AutoPostBack="True"></asp:TextBox><br />
<asp:DropDownList ID="drpXH" runat="server" DataSourceID="dsXH" DataTextField="材料"
    DataValueField="id">
</asp:DropDownList>
&nbsp;
<asp:SqlDataSource ID="dsXH" runat="server" ConnectionString="<%$ ConnectionStrings:wzps %>"
    SelectCommand="SELECT id, 材料名称 + ISNULL(型号, '') AS 材料 FROM 材料价格 WHERE (CHARINDEX(@keyword, 材料名称 + ISNULL(型号, '')) <> 0) ORDER BY 材料">
    <SelectParameters>
        <asp:ControlParameter ControlID="TextBox1" DefaultValue="''" Name="keyword" PropertyName="Text" />
    </SelectParameters>
</asp:SqlDataSource>
