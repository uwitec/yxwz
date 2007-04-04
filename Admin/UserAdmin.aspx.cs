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
using System.Data.SqlClient;

public partial class Admin_UserAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        string[] groups = null;
        if (e.Row.Cells[0].Text != "用户名")
        {
            groups = Roles.GetRolesForUser(e.Row.Cells[0].Text);
            if (groups.Length > 0)
                e.Row.Cells[1].Text = groups[0];
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string userName = e.Values["UserName"].ToString();
        
        //如果用户录入了数据，禁止删除此用户
        string sql = "select count(*) from 领货记录 inter  where 领取用户 = '" + userName +"'";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["wzps"].ConnectionString);
        SqlCommand cmd = new SqlCommand(sql,conn);
        conn.Open();
        int i = (int)cmd.ExecuteScalar();
        conn.Close();
        if (i > 0)
        {
            e.Cancel = true;
            ShowError("此用户已经录入数据，不能删除！");
            return;
        }
        
        //禁止用户删除自身
        if (userName == Membership.GetUser().UserName)
        {
            e.Cancel = true;
            ShowError("无法删除自身用户！");
            return;
        }
    }

    private void ShowError(string msg)
    {
        LbError.Text = msg;
        LbError.Visible = true;
    }
}
