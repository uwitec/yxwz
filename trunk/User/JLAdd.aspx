﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JLAdd.aspx.cs" Inherits="Admin_AddJL"  MasterPageFile="~/yxwz.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <div>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="psjl"
            DefaultMode="Insert" Width="256px" OnLoad="FormView1_Load" OnItemInserting="FormView1_ItemInserting" OnItemInserted="FormView1_ItemInserted">
            <InsertItemTemplate>
                <table>
                    <tr>
                        <td>
                        </td>
                        <td >
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="users" DataTextField="UserName"
                                DataValueField="UserId" SelectedValue='<%# Bind("领取用户id", "{0}") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="users" runat="server" ConnectionString="<%$ ConnectionStrings:Users %>"
                                SelectCommand="SELECT [UserId], [UserName] FROM [vw_aspnet_Users]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 148px">
                            物资名称：</td>
                        <td>
                            <asp:DropDownList ID="DrpWZMC" runat="server" SelectedValue='<%# Bind("材料id") %>' DataSourceID="WZ" DataTextField="名称" DataValueField="id">
                            </asp:DropDownList>
        <asp:SqlDataSource ID="WZ" runat="server" ConnectionString="<%$ ConnectionStrings:wzps %>"
            SelectCommand="SELECT id, 材料名称 + 型号 AS 名称 FROM 材料价格"></asp:SqlDataSource>
    
    </td>
                        
                    </tr>
                    <tr>
                        <td style="width: 148px">
                            数量</td>
                        <td>
                            <asp:TextBox ID="TxtSL" runat="server" Text='<%# Bind("领取数量", "{0}") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtSL"
                                ErrorMessage="数字格式不正确" ValidationExpression="-?\d+" Display="None"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtSL"
                                ErrorMessage="必须输入数量" Display="None"></asp:RequiredFieldValidator>
                        </td>
                        
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
            InsertCommand="INSERT INTO [领货记录] ([领取用户id], [材料id], [领取数量]) VALUES (@领取用户id, @材料id, @领取数量)"
            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [领货记录]">
            <InsertParameters>
                <asp:Parameter Name="领取用户id" Type="Int32" />
                <asp:Parameter Name="材料id" Type="Int32" />
                <asp:Parameter Name="领取数量" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
        &nbsp;
    
    </div>
</asp:Content>