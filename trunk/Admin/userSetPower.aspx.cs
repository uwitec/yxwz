using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Admin_userSetPower : System.Web.UI.Page
{
    string theUser;

    protected void Page_Load(object sender, EventArgs e)
    {
        theUser = Request["userName"];
        if (!IsPostBack)
        {
            if (theUser == null)
                return;
            DropDownList obj = DropDownList1;
            obj.DataSource = Roles.GetAllRoles();
            obj.DataBind();
            string[] group = Roles.GetRolesForUser(theUser);
            if(group.Length > 0)
                obj.SelectedValue = group[0];

            Label1.Text = theUser;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        foreach(string role in Roles.GetAllRoles())
            if(Roles.IsUserInRole(theUser,role))
                Roles.RemoveUserFromRole(theUser, role);
        Roles.AddUserToRole(theUser, DropDownList1.SelectedValue);

        Server.Transfer("~/Admin/UserAdmin.aspx");
    }
}
