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

public partial class User_JLDelManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (User.IsInRole("营销部管理员"))
            {
                JL.SelectParameters.Clear();
                JL.SelectParameters.Add("记录锁定时间", System.TypeCode.DateTime, "2000-1-1");
            }
            else
            {
                JL.SelectParameters.Clear();
                JL.SelectParameters.Add("记录锁定时间", System.TypeCode.DateTime, WebConfigurationManager.AppSettings.Get("记录锁定时间"));
            }
        }

    }
}
