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

[ControlValueProperty("SelectDate")]
public partial class Controls_DateSelectTextBox : System.Web.UI.UserControl
{
    public DateTime  SelectDate
    {
        get { return DateTime.Parse(TextBox1.Text); }
        set { TextBox1.Text = value.ToLongDateString(); }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Calendar1.SelectedDate = DateTime.Parse(TextBox1.Text);
        Calendar1.Visible = ! Calendar1.Visible;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        TextBox1.Text = Calendar1.SelectedDate.ToLongDateString();
        Calendar1.Visible = false;
    }
}
