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
using System.Web.Configuration;

public partial class yxwz : System.Web.UI.MasterPage
{
	
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.MaintainScrollPositionOnPostBack = true;
        topTD.Style.Add("background-image", "url('" + ResolveUrl("~/App_Themes/主题1/lineTop.jpg") + "')");
    }
    protected void TreeView1_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lbTitle.Text = (string)Session["当前登录系统"] + "管理系统";
        }

        if (!Page.User.IsInRole("营销部管理员"))
        {

            TreeView1.Nodes.RemoveAt(3);
        }

        if (DateTime.Now > DateTime.Parse(WebConfigurationManager.AppSettings.Get("初始录入结束时间")))
        {
            TreeView1.Nodes.RemoveAt(0);
        }
        else
        {
            TreeView1.Nodes.RemoveAt(1);
        }
    }
    protected void main_Init(object sender, EventArgs e)
    {

    }
}
