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

public partial class Admin_userAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void DrpPower_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DropDownList obj = (sender as DropDownList);
            obj.DataSource = Roles.GetAllRoles();
            obj.DataBind();
        }
    }
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        string user1 = CreateUserWizard1.UserName;
        string role1 = (CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("DrpPower") as DropDownList).SelectedValue;
        Roles.AddUserToRole(user1, role1);
    }
}
