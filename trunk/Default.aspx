<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp; &nbsp;&nbsp;&nbsp;
    
    </div>
        <table>
            <tr>
                <td style="width: 69px; text-align: right;">
                    用户名</td>
                <td style="width: 128px">
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="user" DataTextField="用户名称"
                        DataValueField="id">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="width: 69px; text-align: right;">
                    密码</td>
                <td style="width: 128px">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="text-align: center;" colspan="2">
                    <asp:Button ID="Button1" runat="server" Text="登录" OnClick="Button1_Click" /></td>
            </tr>
        </table>
        <asp:SqlDataSource ID="user" runat="server" ConnectionString="<%$ ConnectionStrings:wzps %>"
            ProviderName="<%$ ConnectionStrings:wzps.ProviderName %>" SelectCommand="SELECT id, 用户名称, 密码, 用户组 FROM 用户">
        </asp:SqlDataSource>
    </form>
</body>
</html>
