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

public partial class Admin_AddJL : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void FormView1_Load(object sender, EventArgs e)
    {
        //(HiddenField)(FormView1.FindControl("HdUser"))
    }
    protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        //psjl.InsertParameters["领取用户id"] = 1;
    }
    protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        Server.Transfer("~/User/JLADDManage.aspx");
    }
    protected void psjl_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        //如果加入下边的这句，就会出现string到guid转换错误
        //(e.Command.Parameters["@领取用户id"] as SqlParameter).SqlDbType = SqlDbType.UniqueIdentifier;
    }
    protected void users_Load(object sender, EventArgs e)
    {
        if (!User.IsInRole("营销部管理员"))
            (sender as SqlDataSource).FilterExpression = "UserName = '" + Membership.GetUser().UserName + "'";


    }
}
