using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// MembershipHelp 的摘要说明
/// </summary>
public class MembershipHelp
{
    public static MembershipUserCollection GetALLUsers()
    {
        return Membership.GetAllUsers();
    }

    public static void SetUserPassword(string userName, string newPassword)
    {
        MembershipUser user = Membership.GetUser(userName);
        string tempPassword = user.ResetPassword();
        user.ChangePassword(tempPassword, newPassword);
    }

    public static void DelUser(string userName)
    {
        Membership.DeleteUser(userName);
    }
}
