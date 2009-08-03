<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // 在应用程序启动时运行的代码

        //string lastBackupTime = "数据库最后备份日期";
        //Configuration cfg = WebConfigurationManager.OpenWebConfiguration("~");
        //if (DateTime.Now.Date > DateTime.Parse(cfg.AppSettings.Settings[lastBackupTime].Value))
        //{
        //    BackupDB();
        //    cfg.AppSettings.Settings[theKeyName].Value = DateTime.Now.Date().ToString();
        //    cfg.Save();
        //};
       
    }

    private void BackupDB()
    {

        string rarPath = Server.MapPath("~/rar.exe");
        string sourceFolder = Server.MapPath("~/App_Data");
        string targetFolder = Server.MapPath("~/App_DBBAK/");
        string targetFileName = targetFolder + DateTime.Now.ToString().Replace(':', '-') + ".rar";
        string args = string.Format(@"a ""{0}"" ""{1}""", targetFileName, sourceFolder);
        System.Diagnostics.Process.Start(rarPath, args);
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  在应用程序关闭时运行的代码

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // 在出现未处理的错误时运行的代码

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // 在新会话启动时运行的代码

    }

    void Session_End(object sender, EventArgs e) 
    {
        // 在会话结束时运行的代码。 
        // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
        // InProc 时，才会引发 Session_End 事件。如果会话模式设置为 StateServer 
        // 或 SQLServer，则不会引发该事件。

    }
       
</script>
