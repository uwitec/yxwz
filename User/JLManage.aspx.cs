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

public partial class User_JLManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["userPower"] == "Admin")
        //{
        //    JL.SelectCommand = "SELECT id, 时间, 领取用户id, 材料id, 领取数量 FROM 领货记录 ORDER BY id DESC";
        //}
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ((Calendar)GridView1.SelectedRow.FindControl("Calendar1")).Visible = true;
    }
}
