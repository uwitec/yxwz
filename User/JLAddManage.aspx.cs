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

public partial class User_JLManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (User.IsInRole("营销部管理员"))
            {
                JL.SelectParameters["记录锁定时间"].DefaultValue="2000-1-1";
            }
            else
            {
                //JL.SelectParameters.Add("记录锁定时间", System.TypeCode.DateTime, WebConfigurationManager.AppSettings.Get("记录锁定时间"));
                JL.SelectParameters["记录锁定时间"].DefaultValue = System.DateTime.Now.AddDays(-1).Date.ToString();
                JL.FilterExpression = "领取用户 = '" + Membership.GetUser().UserName + "'";
            }
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType != DataControlRowType.DataRow)
        //    return;

        //if (!User.IsInRole("营销部管理员"))
        //{
        //    //if (Convert.ToDateTime(((data.领货记录Row)e.Row.DataItem).时间) < DateTime.Parse(ConfigurationManager.AppSettings["初始录入结束时间"]))
        //        e.Row.Cells[0].Visible = false;
        //}
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        //base.VerifyRenderingInServerForm(control);
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "GB2312";
        Response.AppendHeader("Content-Disposition", "attachment;filename=AddRec.xls");
        // 如果设置为 GetEncoding("GB2312");导出的文件将会出现乱码！！！
        Response.ContentEncoding = System.Text.Encoding.UTF7;
        Response.ContentType = "application/ms-excel";//设置输出文件类型为excel文件。 
        System.IO.StringWriter oStringWriter = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);

        GridView1.AllowPaging = false;
        DataBind(); 

        GridView1.RenderControl(oHtmlTextWriter); 
        Response.Output.Write(oStringWriter.ToString());
        Response.Flush();
        Response.End();

        GridView1.AllowPaging = true;
        DataBind();
    }
}
