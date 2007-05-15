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

public partial class User_rpt_LQJL : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString.Count > 0)
            {
                RptFilterBar1.StartTime = Request.QueryString["StartTime"];
                RptFilterBar1.EndTime = Request.QueryString["EndTime"];
                RptFilterBar1.SelectedUser = Request.QueryString["user"];
                //ObjectDataSource1.FilterExpression = "材料ID=7";// +Request.QueryString["clID"];
            }
        }
    }
    protected void ObjectDataSource1_DataBinding(object sender, EventArgs e)
    {
        //DateSelectEnd.
    }
}
