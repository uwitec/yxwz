<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="login.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Ӫ����������ϵͳ</title>
    <link href="App_Themes/����1/StyleSheet.css" />
    <style type="text/css">
        .style1
        {
            width: 264px;
        }
        .style2
        {
            width: 147px;
        }
    </style>
</head>
<body background=style="background-repeat:no-repeat" 
    bgcolor="#666666">
    <center >
    <table style="background-image: url('App_Themes/����1/login.jpg'); width: 1024px; height: 1000px; top: 0px; left: 0px; right: 0px; bottom: 0px; background-repeat: no-repeat;">
        <tr >
            <td>
    <div style="position: relative; top: -155px; width: 404px; height: 257px; right: 217px; bottom: 88px; left: -217px;">
        
            <form id="form1" runat="server">
        <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/User/wellcome.aspx" DisplayRememberMe="False" TitleText="�û���¼">
            <TextBoxStyle Width="120px" />
            <LayoutTemplate>
                <table border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse">
                    <tr>
                        <td class="style1">
                            <table border="0" cellpadding="0" align="right" style="width: 383px">
                                <tr>
                                    <td align="center" colspan="2" height="80" 
                                        style="font-family: ����; font-size: 30px; color: #000080;" valign="top">
                                        Ӫ����������ϵͳ</td>
                                </tr>
                                <tr>
                                    <td align="right" class="style2">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">�û���:</asp:Label></td>
                                    <td align="left" height="35">
                                        <asp:TextBox ID="UserName" runat="server" Width="120px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                            ErrorMessage="������д���û�������" ToolTip="������д���û�������" ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="style2">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">����:</asp:Label></td>
                                    <td align="left" height="35">
                                        <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="120px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                            ErrorMessage="������д�����롱��" ToolTip="������д�����롱��" ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                    
                                </tr>
                                <tr>
                                <td align="right" class="style2">
                                        ��¼ϵͳ:</td>
                                    <td align="left" height="35">
                                        <asp:DropDownList ID="DrpSystem" runat="server" DataSourceID="SqlDataSource1" 
                                            DataTextField="�����������" DataValueField="�������id" Width="120px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:wzps %>" 
                                            SelectCommand="SELECT * FROM [�������]"></asp:SqlDataSource>
                                   </td>
                                    </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color: red">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        <br />
                                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="��¼" 
                                            ValidationGroup="Login1" onclick="LoginButton_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:Login>
    </form>
        &nbsp;</div>
            </td>
        </tr>
    </table>
    </center>
    
</body>
</html>
