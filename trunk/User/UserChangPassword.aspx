<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserChangPassword.aspx.cs" Inherits="Admin_ChangPassword"  MasterPageFile="~/yxwz.master"%>


<asp:Content ContentPlaceHolderID="main" runat="server">
    <div style="text-align: center">
        <br />
    
        <asp:ChangePassword ID="ChangePassword1" runat="server" PasswordLabelText="原密码:">
            <SuccessTemplate>
                <table border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse">
                    <tr>
                        <td>
                            <table border="0" cellpadding="0">
                                <tr>
                                    <td align="center" colspan="2">
                                        密码更改完成</td>
                                </tr>
                                <tr>
                                    <td>
                                        您的密码已更改!</td>
                                </tr>
                                <tr>
                                    <td align="right" colspan="2">
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </SuccessTemplate>
        </asp:ChangePassword>
    
    </div>
</asp:Content>
