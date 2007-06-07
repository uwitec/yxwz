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
using System.ComponentModel;

[ControlValueProperty("物资ID")]
[Bindable(true)]
public partial class Controls_WZSelect : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [Bindable(true)]
    public int 物资ID
    {
        get { return int.Parse(drpXH.SelectedValue); }
        set { }
    }

}
