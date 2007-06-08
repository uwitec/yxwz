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

public partial class Admin_ClMagage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btSearch_Click(object sender, EventArgs e)
    {
        cl.SelectCommand = string.Format("SELECT * FROM [材料价格] where charindex('{0}',材料名称) <>0", txtSearch.Text);
        //Response.Write();
    }
    protected void btShowAll_Click(object sender, EventArgs e)
    {
        Server.Transfer("~/Admin/ClManage.aspx");
    }
}
