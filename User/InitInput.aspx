﻿<%@ Page Language="C#" MasterPageFile="~/yxwz.master" AutoEventWireup="true" CodeFile="InitInput.aspx.cs" Inherits="User_InitInput" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
    &nbsp;<asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="psjl"
        DefaultMode="Insert" OnItemInserted="FormView1_ItemInserted" OnItemInserting="FormView1_ItemInserting"
        OnLoad="FormView1_Load" Width="256px">
        <InsertItemTemplate>
            <table>
                <tr>
                    <td style="height: 68px">
                    </td>
                    <td style="height: 68px">
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="users" DataTextField="UserName"
                            DataValueField="UserName" SelectedValue='<%# Bind("领取用户") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="users" runat="server" ConnectionString="<%$ ConnectionStrings:Users %>"
                            OnLoad="users_Load" SelectCommand="SELECT  [UserName] FROM [vw_aspnet_Users]"></asp:SqlDataSource>
                        <br />
                        <asp:Label ID="lbContinue" runat="server" ForeColor="#00C000" Text="添加成功，继续输入下一条"
                            Visible="False"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 148px">
                        物资名称：</td>
                    <td>
                        <asp:DropDownList ID="DrpWZMC" runat="server" DataSourceID="WZ" DataTextField="名称"
                            DataValueField="id" SelectedValue='<%# Bind("材料id") %>'>
                        </asp:DropDownList>&nbsp;
                        <asp:SqlDataSource ID="WZ" runat="server" ConnectionString="<%$ ConnectionStrings:wzps %>"
                            SelectCommand="SELECT id, 材料名称 + 型号 AS 名称 FROM 材料价格"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td style="width: 148px">
                        数量</td>
                    <td>
                        <asp:TextBox ID="TxtSL" runat="server" AutoCompleteType="Disabled" Text='<%# Bind("领取数量") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtSL"
                            Display="None" ErrorMessage="数字格式不正确" ValidationExpression="-?\d+"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtSL"
                            Display="None" ErrorMessage="必须输入数量"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        &nbsp; &nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                            CommandName="Insert" Text="保存"></asp:LinkButton>
                        &nbsp; &nbsp;
                        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消"></asp:LinkButton>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                    </td>
                </tr>
            </table>
        </InsertItemTemplate>
    </asp:FormView>
    &nbsp;<br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
        DataSourceID="psjl">
        <Columns>
            <asp:BoundField DataField="领取用户" HeaderText="领取用户" SortExpression="领取用户" />
            <asp:BoundField DataField="材料名称" HeaderText="材料名称" SortExpression="材料名称" />
            <asp:BoundField DataField="型号" HeaderText="型号" SortExpression="型号" />
            <asp:BoundField DataField="领取数量" HeaderText="领取数量" SortExpression="领取数量" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="psjl" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:wzps %>" InsertCommand="INSERT INTO 领货记录(领取用户, 领取数量, 材料id, 领取时候单价, 领用人) SELECT @领取用户 AS 领取用户id, @领取数量 AS 领取数量, id, 价格, '仓库初始化录入' AS Expr1 FROM 材料价格 WHERE (id = @材料id)"
        OldValuesParameterFormatString="original_{0}" OnInserting="psjl_Inserting" OnLoad="psjl_Load"
        SelectCommand="SELECT 领货记录.领取用户, 领货记录.领取数量, 材料价格.材料名称, 材料价格.型号, 领货记录.id FROM 领货记录 INNER JOIN 材料价格 ON 领货记录.材料id = 材料价格.id">
        <InsertParameters>
            <asp:Parameter Name="领取用户" />
            <asp:Parameter Name="领取数量" />
            <asp:Parameter Name="材料id" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

