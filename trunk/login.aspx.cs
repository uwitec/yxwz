using System;
using System.Data;
using System.Data.Sql;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        DropDownList drp = (Login1.FindControl("drpSystem") as DropDownList);
        Session["当前登录系统id"] = drp.SelectedValue;
        Session["当前登录系统"] = drp.Items[drp.SelectedIndex].Text;
    }
}
