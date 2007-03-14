<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserChangPassword.aspx.cs" Inherits="Admin_ChangPassword"  MasterPageFile="~/yxwz.master"%>


<asp:Content ContentPlaceHolderID="main" runat="server">
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
</asp:Content>
