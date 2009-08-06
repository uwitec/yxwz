<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JLAddManage.aspx.cs" Inherits="User_JLManage"  MasterPageFile="~/yxwz.master"%>

<%@ Register Src="../Controls/WZSelect.ascx" TagName="WZSelect" TagPrefix="uc1" %>

<asp:Content ContentPlaceHolderID="main" runat=server>
  <script language=javascript type="text/jscript">
    function confirmDel()
    {
        return confirm("真的要删除？");
    }
</script>
  
    <div style="text-align: center" class="liteTitle">
    <center>    入库记录<br /></center>
        <br />
        <a href="JLAdd.aspx">添加</a><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
            DataSourceID="JL" AllowPaging="True" 
            OnRowDataBound="GridView1_RowDataBound" BackColor="LightGoldenrodYellow" 
            BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" 
            GridLines="None">
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
                        
                            <uc1:WZSelect ID="WZSelect1" runat="server" 物资ID='<%# Bind("材料id") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="CL" DataTextField="材料"
                            DataValueField="id" Enabled="False" SelectedValue='<%# Bind("材料id") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="CL" runat="server" ConnectionString="<%$ ConnectionStrings:wzps %>"
                            SelectCommand="SELECT  [id],材料名称 + ISNULL(型号, '') as 材料 FROM [材料价格]"></asp:SqlDataSource>
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
                <asp:boundfield DataField="备注" HeaderText="备注"></asp:boundfield>
            </Columns>
            <FooterStyle BackColor="Tan" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
        </asp:GridView>
        <asp:SqlDataSource ID="JL" runat="server" ConnectionString="<%$ ConnectionStrings:wzps %>"
            DeleteCommand="DELETE FROM [领货记录] WHERE [id] = @original_id"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT 领货记录.* FROM 领货记录 INNER JOIN 材料价格 ON 领货记录.材料id = 材料价格.id WHERE (材料价格.材料类别ID = @系统类别id) AND (领货记录.备注 &lt;&gt; '仓库初始化录入' OR 领货记录.备注 IS NULL) AND (领货记录.领取数量 &gt; 0) AND (领货记录.时间 &gt; @记录锁定时间) ORDER BY 领货记录.id DESC"
            
            UpdateCommand="UPDATE 领货记录 SET 材料id = @材料id, 领取数量 = @领取数量, 领用人 = @领用人, 备注 = @备注 WHERE (id = @original_id)">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="材料id" Type="Int32" />
                <asp:Parameter Name="领取数量" Type="Int32" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="领用人" />
                <asp:Parameter Name="备注" />
            </UpdateParameters>
            <SelectParameters>
                <asp:Parameter Name="记录锁定时间" Type="DateTime" />
                <asp:SessionParameter DefaultValue="0" Name="系统类别id" 
                    SessionField="当前登录系统id" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>
