<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JLManage.aspx.cs" Inherits="User_JLManage"  MasterPageFile="~/yxwz.master"%>

<asp:Content ContentPlaceHolderID="main" runat=server>
    <div>
        <a href="JLAdd.aspx">添加</a><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
            DataSourceID="JL">
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
                <asp:TemplateField HeaderText="领取用户id" SortExpression="领取用户id">
                    <EditItemTemplate><asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="User" DataTextField="UserName"
                            DataValueField="UserId" Enabled="False" SelectedValue='<%# Bind("领取用户id") %>'>
                    </asp:DropDownList>
                        <asp:SqlDataSource ID="User" runat="server" ConnectionString="<%$ ConnectionStrings:Users %>"
                            SelectCommand="SELECT [UserId], [UserName] FROM [vw_aspnet_Users]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="User" DataTextField="UserName"
                            DataValueField="UserId" Enabled="False" SelectedValue='<%# Bind("领取用户id") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="User" runat="server" ConnectionString="<%$ ConnectionStrings:Users %>"
                            SelectCommand="SELECT [UserId], [UserName] FROM [vw_aspnet_Users]"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
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
                            Display="Dynamic" ErrorMessage="必须输入数字" ValidationExpression="-?\d+"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("领取数量") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="JL" runat="server" ConnectionString="<%$ ConnectionStrings:wzps %>"
            DeleteCommand="DELETE FROM [领货记录] WHERE [id] = @original_id"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT id, 时间, 领取用户id, 材料id, 领取数量 FROM 领货记录 ORDER BY id DESC"
            UpdateCommand="UPDATE [领货记录] SET [材料id] = @材料id, [领取数量] = @领取数量 WHERE [id] = @original_id">
            <DeleteParameters>
                <asp:Parameter Name="original_id" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="材料id" Type="Int32" />
                <asp:Parameter Name="领取数量" Type="Int32" />
                <asp:Parameter Name="original_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
</asp:Content>
