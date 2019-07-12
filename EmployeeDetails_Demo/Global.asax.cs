using EmployeeDetails.Logger;
using System;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;

namespace EmployeeDetails_Demo
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
        protected void Application_Error(object sender, EventArgs e)
        {
            Exception ex = Server.GetLastError();
            Logger.Instance.Error(ex);
        }
    }
}