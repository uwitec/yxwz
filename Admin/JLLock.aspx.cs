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

public partial class Admin_JLLock : System.Web.UI.Page
{
    const string theKeyName = "记录锁定时间";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Label1.Text = "记录锁定时间" + WebConfigurationManager.AppSettings.Get(theKeyName);
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SetInitInputTime(Calendar1.SelectedDate);
    }

    private void SetInitInputTime(DateTime time)
    {
        Configuration cfg = WebConfigurationManager.OpenWebConfiguration("~");
        cfg.AppSettings.Settings[theKeyName].Value = time.ToString();
        cfg.Save();
        Label1.Text = "记录锁定时间已设置为" + time.ToString();
    }
}
