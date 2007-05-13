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
        if (!Page.ClientScript.IsClientScriptIncludeRegistered("梅花雨"))
        {
            Page.ClientScript.RegisterClientScriptInclude("梅花雨", "../js/Calendar30.js");
        }
        //Response.Write(string.Format("{0}/{1}/{2}",UserSelect1.SelectUser,DateSelectStart.SelectDate,DateSelectEnd.SelectDate));
    }
    protected void ObjectDataSource1_DataBinding(object sender, EventArgs e)
    {
        //DateSelectEnd.
    }
}
