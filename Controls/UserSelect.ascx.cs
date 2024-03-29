﻿using System;
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

[ControlValueProperty("SelectedUser")]
[Bindable(true)]
public partial class Controls_UserSelect : System.Web.UI.UserControl
{ 
    [Bindable(true,BindingDirection.TwoWay)]
    public string SelectedUser
    {
        get { return DropDownList1.SelectedValue; }
        set { DropDownList1.SelectedValue = value; }
    }

    protected override void OnInit(EventArgs e)
    {
        if (!HttpContext.Current.User.IsInRole("营销部管理员"))
            users.FilterExpression = "UserName = '" + Membership.GetUser().UserName + "'";
        if (!IsPostBack)
        {
            DropDownList1.DataBind();
        }

        base.OnInit(e);
    }
}
