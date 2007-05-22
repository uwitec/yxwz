<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CLAdd.aspx.cs" Inherits="Admin_AddCLPZ"  MasterPageFile="~/yxwz.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <div style="text-align: center">
        材料品种添加<br />
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="id"
            DataSourceID="cl" DefaultMode="Insert" Height="50px" Width="251px" OnItemInserted="DetailsView1_ItemInserted">
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True"
                    SortExpression="id" />
                <asp:BoundField DataField="材料名称" HeaderText="材料名称" SortExpression="材料名称" />
                <asp:BoundField DataField="型号" HeaderText="型号" SortExpression="型号" />
                <asp:TemplateField HeaderText="价格" SortExpression="价格">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("价格") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1"
                            ErrorMessage="必须输入数字" ValidationExpression="^[0-9]+\.?[0-9]*$"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("价格") %>'></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1"
                            ErrorMessage="必须输入数字" ValidationExpression="^[0-9]+\.?[0-9]*$"></asp:RegularExpressionValidator>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("价格") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="cl" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:wzps %>"
            DeleteCommand="DELETE FROM [材料价格] WHERE [id] = @original_id AND [材料名称] = @original_材料名称 AND [型号] = @original_型号 AND [价格] = @original_价格"
            InsertCommand="INSERT INTO [材料价格] ([材料名称], [型号], [价格]) VALUES (@材料名称, @型号, @价格)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [材料价格]"
            UpdateCommand="UPDATE [材料价格] SET [材料名称] = @材料名称, [型号] = @型号, [价格] = @价格 WHERE [id] = @original_id AND [材料名称] = @original_材料名称 AND [型号] = @original_型号 AND [价格] = @original_价格">
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
