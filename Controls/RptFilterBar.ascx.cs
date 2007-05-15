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
        get { return DateSelectStart.Value; }
        set { DateSelectStart.Value = value; }
    }
    public string EndTime
    {
        get { return DateSelectEnd.Value; }
        set { DateSelectEnd.Value = value; }
    }

    protected override void OnLoad(EventArgs e)
    {
        Page.ClientScript.RegisterClientScriptInclude("梅花雨", "../js/Calendar30.js");

        if (!IsPostBack)
        {
            
            DateSelectStart.Value = DateTime.Now.ToShortDateString();
            DateSelectEnd.Value = DateTime.Now.AddDays(1).ToShortDateString();
        }
        base.OnInit(e);
    }
}
