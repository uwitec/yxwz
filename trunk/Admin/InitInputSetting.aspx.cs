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

public partial class Admin_InitInputSetting : System.Web.UI.Page
{
    const string theKeyName = "初始录入结束时间";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Label1.Text = "初始录入结束时间为" + WebConfigurationManager.AppSettings.Get(theKeyName);
        }
    }
    protected void btSetEndTime_Click(object sender, EventArgs e)
    {
        SetInitInputTime(Calendar1.SelectedDate);
    }

    protected void BtEndInput_Click(object sender, EventArgs e)
    {
        SetInitInputTime(DateTime.Now);
    }

    private void SetInitInputTime(DateTime time)
    {
        Configuration cfg = WebConfigurationManager.OpenWebConfiguration("~");
        cfg.AppSettings.Settings[theKeyName].Value = time.ToString();
        cfg.Save();
        Label1.Text = "初始录入结束时间已设置为" + time.ToString();
    }
}
