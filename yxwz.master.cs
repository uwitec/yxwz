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

    }
    protected void TreeView1_Load(object sender, EventArgs e)
    {
        if (DateTime.Now > DateTime.Parse(WebConfigurationManager.AppSettings.Get("初始录入结束时间")))
        {
            TreeView1.Nodes.RemoveAt(0);
        }
        else
        {
            TreeView1.Nodes.RemoveAt(1);
        }
    }
}
