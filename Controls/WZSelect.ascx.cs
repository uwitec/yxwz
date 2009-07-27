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
        if(TextBox1.Text == "")
            dsXH.SelectCommand = "SELECT id, 材料名称 + ISNULL(型号, '') + '('+ ISNULL(单位, '') + ')' AS 材料 FROM 材料价格 WHERE (材料价格.材料类别id=@系统类别id) ORDER BY 材料";
        else
            dsXH.SelectCommand = "SELECT id, 材料名称 + ISNULL(型号, '') + '('+ ISNULL(单位, '') + ')' AS 材料 FROM 材料价格 WHERE (材料价格.材料类别id=@系统类别id) and (CHARINDEX(@keyword, 材料名称 + ISNULL(型号, '')) <> 0) ORDER BY 材料";
    }

    [Bindable(true)]
    public int 物资ID
    {
        get { return int.Parse(drpXH.SelectedValue); }
        set { }
    }

}
