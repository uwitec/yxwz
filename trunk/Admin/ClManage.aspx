<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ClManage.aspx.cs" Inherits="Admin_ClMagage"  MasterPageFile="~/yxwz.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

<script language=javascript type="text/jscript">
    function confirmDel()
    {
        return confirm("真的要删除？");
    }
</script>
    <div style="text-align: center">
        材料品种管理<br />
        材料名称:<asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
        <asp:Button ID="btSearch" runat="server" OnClick="btSearch_Click" Text="搜索" />
        &nbsp; &nbsp;&nbsp;
        <asp:Button ID="btShowAll" runat="server" OnClick="btShowAll_Click" Text="全部显示" /><br />
        <a href="CLAdd.aspx">添加</a><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
            DataSourceID="cl" AllowPaging="True" PageSize="50">
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
                            OnClientClick="javascript:return confirmDel();" Text="删除"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="材料名称" HeaderText="材料名称" SortExpression="材料名称" />
                <asp:BoundField DataField="型号" HeaderText="型号" SortExpression="型号" />
                <asp:TemplateField HeaderText="价格" SortExpression="价格">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("价格") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1"
                            ErrorMessage="必须输入数字" ValidationExpression="^[0-9]+\.?[0-9]*$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("价格") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="cl" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:wzps %>"
            DeleteCommand="DELETE FROM [材料价格] WHERE [id] = @original_id"
            InsertCommand="INSERT INTO [材料价格] ([材料名称], [型号], [价格]) VALUES (@材料名称, @型号, @价格)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [材料价格] order by id desc"
            UpdateCommand="UPDATE [材料价格] SET [材料名称] = @材料名称, [型号] = @型号, [价格] = @价格 WHERE [id] = @original_id">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_材料名称" Type="String" />
                <asp:Parameter Name="original_型号" Type="String" />
                <asp:Parameter Name="original_价格" Type="Decimal" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="材料名称" Type="String" />
                <asp:Parameter Name="型号" Type="String" />
                <asp:Parameter Name="价格" Type="Decimal" />
                <asp:Parameter Name="original_id" Type="Int32" />
                <asp:Parameter Name="original_材料名称" Type="String" />
                <asp:Parameter Name="original_型号" Type="String" />
                <asp:Parameter Name="original_价格" Type="Decimal" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="材料名称" Type="String" />
                <asp:Parameter Name="型号" Type="String" />
                <asp:Parameter Name="价格" Type="Decimal" />
            </InsertParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>
