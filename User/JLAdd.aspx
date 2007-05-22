<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JLAdd.aspx.cs" Inherits="Admin_AddJL"  MasterPageFile="~/yxwz.master" %>

<%@ Register Src="../Controls/UserSelect.ascx" TagName="UserSelect" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <div style="text-align: center">
        &nbsp; 供电所入库<br />
        <br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="psjl"
            DefaultMode="Insert" Width="256px" OnLoad="FormView1_Load" OnItemInserting="FormView1_ItemInserting" OnItemInserted="FormView1_ItemInserted">
            <InsertItemTemplate>
                <table>
                    <tr>
                        <td style="height: 68px">
                        </td>
                        <td style="height: 68px" >
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="users" DataTextField="UserName"
                                DataValueField="UserName" SelectedValue='<%# Bind("领取用户") %>'>
                            </asp:DropDownList>&nbsp;
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
                            <asp:DropDownList ID="DrpWZMC" runat="server" SelectedValue='<%# Bind("材料id") %>' DataSourceID="WZ" DataTextField="名称" DataValueField="id">
                            </asp:DropDownList>&nbsp;
        <asp:SqlDataSource ID="WZ" runat="server" ConnectionString="<%$ ConnectionStrings:wzps %>"
            SelectCommand="SELECT id, 材料名称 + 型号 AS 名称 FROM 材料价格"></asp:SqlDataSource>
    
    </td>
                        
                    </tr>
                    <tr>
                        <td style="width: 148px">
                            数量</td>
                        <td>
                            <asp:TextBox ID="TxtSL" runat="server" Text='<%# Bind("领取数量") %>' AutoCompleteType="Disabled"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtSL"
                                ErrorMessage="数字格式不正确" ValidationExpression="-?\d+" Display="None"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtSL"
                                ErrorMessage="必须输入数量" Display="None"></asp:RequiredFieldValidator>
                        </td>
                        
                    </tr>
                    <tr>
                        <td style="width: 148px">
                            领用人：</td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("领用人") %>'></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: center">
                            &nbsp;
                            &nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                Text="保存"></asp:LinkButton>
                            &nbsp; &nbsp;
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                Text="取消"></asp:LinkButton>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                        </td>
                        
                    </tr>
                </table>
            </InsertItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="psjl" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:wzps %>"
            InsertCommand="INSERT INTO 领货记录(领取用户, 领取数量, 材料id, 领取时候单价, 领用人) SELECT @领取用户 AS 领取用户id, @领取数量 AS 领取数量, id, 价格, @领用人 AS Expr1 FROM 材料价格 WHERE (id = @材料id)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [领货记录]" OnInserting="psjl_Inserting">
            <InsertParameters>
                <asp:Parameter Name="领取用户" />
                <asp:Parameter Name="领取数量" />
                <asp:Parameter Name="领用人" />
                <asp:Parameter Name="材料id" />
            </InsertParameters>
        </asp:SqlDataSource>
        &nbsp; &nbsp;&nbsp;
    
    </div>
</asp:Content>
