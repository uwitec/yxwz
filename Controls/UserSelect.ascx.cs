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

[ControlValueProperty("SelectUser")]   
public partial class Controls_UserSelect : System.Web.UI.UserControl
{ 
    public string SelectUser
    {
        get { return DropDownList1.SelectedValue; }
        set { DropDownList1.SelectedValue = value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            DropDownList1.SelectedIndex = 0;
    }

    protected void users_Load(object sender, EventArgs e)
    {
        if (!HttpContext.Current.User.IsInRole("营销部管理员"))
            (sender as SqlDataSource).FilterExpression = "UserName = '" + Membership.GetUser().UserName + "'";


    }
}
