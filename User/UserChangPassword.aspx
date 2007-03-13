<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserChangPassword.aspx.cs" Inherits="Admin_ChangPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ChangePassword ID="ChangePassword1" runat="server" OnChangingPassword="ChangePassword1_ChangingPassword">
        </asp:ChangePassword>
        <asp:SqlDataSource ID="user" runat="server" ConnectionString="<%$ ConnectionStrings:wzps %>"
            SelectCommand="&#13;&#10;" UpdateCommand="UPDATE [用户] SET [密码] = @密码 WHERE (id = @id)">
            <UpdateParameters>
                <asp:Parameter Name="密码" Type="String" />
                <asp:SessionParameter Name="id" SessionField="userid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
