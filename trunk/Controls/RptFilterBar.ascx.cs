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

public partial class Controls_RptFilterBar : System.Web.UI.UserControl
{
    public string SelectedUser
    {
        get { return UserSelect1.SelectedUser; }
        set { UserSelect1.SelectedUser = value; }
    }
    public string StartTime
    {
        get { return DateSelectStart.Value + " 00:00:00"; }
        set { DateSelectStart.Value = DateTime.Parse(value).ToShortDateString(); }
    }
    public string EndTime
    {
        get { return DateSelectEnd.Value + " 23:59:59"; }
        set { DateSelectEnd.Value = DateTime.Parse(value).ToShortDateString(); }
    }

    protected override void OnLoad(EventArgs e)
    {
        Page.ClientScript.RegisterClientScriptInclude("梅花雨", "../js/Calendar30.js");

        if (!IsPostBack)
        {
            if(DateSelectStart.Value == "")
            {
            DateTime startTime = DateTime.Now;
            startTime = startTime.AddDays(0-startTime.Day+1);
            DateSelectStart.Value = startTime.ToShortDateString();
            }
            if (DateSelectEnd.Value == "")
            {
            DateSelectEnd.Value = DateTime.Now.ToShortDateString();
            }
        }
        base.OnInit(e);
    }
}
