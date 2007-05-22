<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JLAddManage.aspx.cs" Inherits="User_JLManage"  MasterPageFile="~/yxwz.master"%>

<asp:Content ContentPlaceHolderID="main" runat=server>
  <script language=javascript type="text/jscript">
    function confirmDel()
    {
        return confirm("真的要删除？");
    }
</script>
  
    <div style="text-align: center">
    <center>    入库记录<br /></center>
        <br />
        <a href="JLAdd.aspx">添加</a><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
            DataSourceID="JL" AllowPaging="True" OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                            Text="更新"></asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                            Text="取消"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="编辑"></asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="删除" OnClientClick="javascript:return confirmDel();"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="时间" SortExpression="时间">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("时间", "{0:D}") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("时间", "{0:D}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="领取用户" HeaderText="领取用户" ReadOnly="True" SortExpression="领取用户" />
                <asp:TemplateField HeaderText="材料id" SortExpression="材料id">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="CL" DataTextField="材料"
                            DataValueField="id" SelectedValue='<%# Bind("材料id") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="CL" runat="server" ConnectionString="<%$ ConnectionStrings:wzps %>"
                            SelectCommand="SELECT  [id],[材料名称] + [型号] as 材料 FROM [材料价格]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="CL" DataTextField="材料"
                            DataValueField="id" Enabled="False" SelectedValue='<%# Bind("材料id") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="CL" runat="server" ConnectionString="<%$ ConnectionStrings:wzps %>"
                            SelectCommand="SELECT  [id],[材料名称] + [型号] as 材料 FROM [材料价格]"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="领取数量" SortExpression="领取数量">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("领取数量") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1"
                            Display="Dynamic" ErrorMessage="必须输入数字" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("领取数量") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="领用人" HeaderText="领用人" SortExpression="领用人" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="JL" runat="server" ConnectionString="<%$ ConnectionStrings:wzps %>"
            DeleteCommand="DELETE FROM [领货记录] WHERE [id] = @original_id"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT id, 时间, 领取用户, 材料id, 领取时候单价, 领取数量, 用途, 领用人, 发料人, 备注 FROM 领货记录 WHERE (备注 <> '仓库初始化录入' OR 备注 IS NULL) AND (领取数量 > 0) AND (时间 > @记录锁定时间) ORDER BY id DESC"
            UpdateCommand="UPDATE 领货记录 SET 材料id = @材料id, 领取数量 = @领取数量, 领用人 = @领用人 WHERE (id = @original_id)">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="材料id" Type="Int32" />
                <asp:Parameter Name="领取数量" Type="Int32" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="领用人" />
            </UpdateParameters>
            <SelectParameters>
                <asp:Parameter Name="记录锁定时间" Type="DateTime" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>
