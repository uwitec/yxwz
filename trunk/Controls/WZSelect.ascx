<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WZSelect.ascx.cs" Inherits="Controls_WZSelect" %>
名称：<asp:DropDownList ID="drpMC" runat="server" AutoPostBack="True" DataSourceID="dsMC"
    DataTextField="材料名称" DataValueField="材料名称">
</asp:DropDownList><br />
型号：
<asp:DropDownList ID="drpXH" runat="server" DataSourceID="dsXH" DataTextField="型号"
    DataValueField="id">
</asp:DropDownList>
<asp:SqlDataSource ID="dsMC" runat="server" ConnectionString="<%$ ConnectionStrings:wzps %>"
    SelectCommand="SELECT DISTINCT [材料名称] FROM [材料价格]"></asp:SqlDataSource>
<asp:SqlDataSource ID="dsXH" runat="server" ConnectionString="<%$ ConnectionStrings:wzps %>"
    SelectCommand="SELECT [id], [型号] FROM [材料价格] WHERE ([材料名称] = @材料名称)">
    <SelectParameters>
        <asp:ControlParameter ControlID="drpMC" Name="材料名称" PropertyName="SelectedValue"
            Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
