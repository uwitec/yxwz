<%@ Page Language="C#" MasterPageFile="~/yxwz.master" AutoEventWireup="true" CodeFile="JLDelManage.aspx.cs" Inherits="User_JLDelManage" Title="Untitled Page" %>

<%@ Register Src="../Controls/WZSelect.ascx" TagName="WZSelect" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat=server>
  <script language=javascript type="text/jscript">
    function confirmDel()
    {
        return confirm("真的要删除？");
    }
</script>
  
    <div style="text-align: center" class="liteTitle">
     <center>   材料使用记录<br /></center>
        <br />
        <a href="JLDel.aspx">添加</a><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
            DataSourceID="JL" AllowPaging="True" BackColor="LightGoldenrodYellow" 
            BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" 
            GridLines="None" Width="600px" PageSize="25">
            <RowStyle Wrap="False" Font-Names="宋体" Font-Size="13px" />
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
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="时间" SortExpression="时间">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("时间", "{0:D}") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("时间", "{0:D}") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>
                <asp:BoundField DataField="领取用户" HeaderText="领取用户" ReadOnly="True" 
                    SortExpression="领取用户" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="材料id" SortExpression="材料id">
                    <EditItemTemplate>
                                <uc1:WZSelect ID="WZSelect1" runat="server" 物资ID='<%# Bind("材料id") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("材料名称") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="数量" SortExpression="领取数量">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("领取数量") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1"
                            Display="Dynamic" ErrorMessage="必须输入数字" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("领取数量") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:TemplateField>
                <asp:BoundField DataField="发料人" HeaderText="发料人" SortExpression="发料人" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="领用人" HeaderText="领用人" SortExpression="领用人" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="用途" HeaderText="用途" SortExpression="用途" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
                <asp:BoundField DataField="备注" HeaderText="备注" SortExpression="备注" >
                    <HeaderStyle Wrap="False" />
                    <ItemStyle Wrap="False" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="Tan" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" Font-Names="宋体" 
                Font-Size="13px" Wrap="False" />
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
        </asp:GridView>
        <br />
        <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click">导出电子表格</asp:LinkButton>
        <asp:SqlDataSource ID="JL" runat="server" ConnectionString="<%$ ConnectionStrings:wzps %>"
            DeleteCommand="DELETE FROM [领货记录] WHERE [id] = @original_id"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT 领货记录.id, 领货记录.时间, 领货记录.领取用户, 领货记录.材料id, 领货记录.领取时候单价,  领货记录.用途, 领货记录.领用人, 领货记录.发料人, 领货记录.备注, 0 - 领货记录.领取数量 AS 领取数量,材料价格.材料名称 as 材料名称 FROM 领货记录 INNER JOIN 材料价格 ON 领货记录.材料id = 材料价格.id WHERE (材料价格.材料类别ID = @系统类别id) AND (0 - 领货记录.领取数量 &gt; 0) AND (领货记录.时间 &gt; @记录锁定时间) ORDER BY 领货记录.id DESC"
            
            UpdateCommand="UPDATE [领货记录] SET [材料id] = @材料id, [领取数量] = 0 - @领取数量 WHERE [id] = @original_id" 
            onselecting="JL_Selecting">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="材料id" Type="Int32" />
                <asp:Parameter Name="领取数量" Type="Int32" />
                <asp:Parameter Name="original_id" Type="Int32" />
            </UpdateParameters>
            <SelectParameters>
                <asp:Parameter Name="记录锁定时间" Type="DateTime" />
                <asp:SessionParameter  DefaultValue="0" Name="系统类别id" 
                    SessionField="当前登录系统id" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>


