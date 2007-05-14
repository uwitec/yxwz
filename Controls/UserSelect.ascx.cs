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
using System.ComponentModel;

[ControlValueProperty("SelectedUser")]
[Bindable(true)]
public partial class Controls_UserSelect : System.Web.UI.UserControl
{ 
    [Bindable(true,BindingDirection.TwoWay)]
    public string SelectedUser
    {
        get { return DropDownList1.SelectedValue; }
        set { DropDownList1.SelectedValue = value; }
    }

    protected override void OnInit(EventArgs e)
    {
        if (!IsPostBack)
        {
            DataBind();
            DropDownList1.SelectedIndex = 0;
        }
        base.OnInit(e);
    }

    protected void users_Load(object sender, EventArgs e)
    {
        if (!HttpContext.Current.User.IsInRole("营销部管理员"))
            (sender as SqlDataSource).FilterExpression = "UserName = '" + Membership.GetUser().UserName + "'";


    }
}
