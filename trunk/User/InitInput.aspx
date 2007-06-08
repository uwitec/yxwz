<%@ Page Language="C#" MasterPageFile="~/yxwz.master" AutoEventWireup="true" CodeFile="InitInput.aspx.cs" Inherits="User_InitInput" Title="Untitled Page" %>

<%@ Register Src="../Controls/WZSelect.ascx" TagName="WZSelect" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" Runat="Server">
    <center >库存初始化录入<br /></center>
    <br />
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="psjl"
        DefaultMode="Insert" OnItemInserted="FormView1_ItemInserted" OnItemInserting="FormView1_ItemInserting"
        OnLoad="FormView1_Load" Width="460px">
        <InsertItemTemplate>
            <table border="1" >
                <tr>
                    <td style="height: 68px; width: 85px;">
                        供电所</td>
                    <td style="height: 68px; width: 423px;">
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
                    <td style="width: 85px">
                        材料名称</td>
                    <td style="width: 423px">
                        <uc1:WZSelect ID="WZSelect1" runat="server" 物资ID='<%# Bind("材料id") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="width: 85px">
                        数量</td>
                    <td style="width: 423px">
                        <asp:TextBox ID="TxtSL" runat="server" AutoCompleteType="Disabled" Text='<%# Bind("领取数量") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtSL"
                            Display="None" ErrorMessage="数字格式不正确" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtSL"
                            Display="None" ErrorMessage="必须输入数量"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        &nbsp; &nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                            CommandName="Insert" Text="添加"></asp:LinkButton>
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
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="psjl" runat="server" ConflictDetection="CompareAllValues"
        ConnectionString="<%$ ConnectionStrings:wzps %>" InsertCommand="INSERT INTO 领货记录(领取用户, 领取数量, 材料id, 领取时候单价, 备注) SELECT @领取用户 AS 领取用户id, @领取数量 AS 领取数量, id as 材料id, 价格 as 领取时候单价, '仓库初始化录入' AS 备注 FROM 材料价格 WHERE (id = @材料id)"
        OldValuesParameterFormatString="original_{0}" OnInserting="psjl_Inserting" OnLoad="psjl_Load"
        SelectCommand="SELECT 领货记录.领取用户, 领货记录.领取数量, 材料价格.材料名称, 材料价格.型号, 领货记录.id FROM 领货记录 INNER JOIN 材料价格 ON 领货记录.材料id = 材料价格.id WHERE (领货记录.备注 = '仓库初始化录入')" DeleteCommand="DELETE FROM 领货记录 WHERE (id = @original_id)">
        <InsertParameters>
            <asp:Parameter Name="领取用户" />
            <asp:Parameter Name="领取数量" />
            <asp:Parameter Name="材料id" />
        </InsertParameters>
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
    </asp:SqlDataSource>
</asp:Content>

