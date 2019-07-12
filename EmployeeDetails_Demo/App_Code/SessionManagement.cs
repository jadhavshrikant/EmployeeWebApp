using EmployeeDetails.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeeDetails_Demo.App_Code
{
    public static class SessionManagement
    {
        public static bool IsSessionExpired()
        {
            if (HttpContext.Current.Session != null)
            {
                string empName = HttpContext.Current.Session["EmpName"] as string;
                if (string.IsNullOrEmpty(empName))
                {
                    return true;

                }
            }
            return false;
        }

        public static void SetUserSession(Employee employee)
        {
            HttpContext.Current.Session["EmpName"] = employee.EmpName;
            HttpContext.Current.Session["EmpDesignation"] = employee.EmpDesignation;
            HttpContext.Current.Session["EmailID"] = employee.EmailID;
            HttpContext.Current.Session["Address"] = employee.EmpAddress;

        }
        public static void ClearUserSession()
        {
            HttpContext.Current.Session.RemoveAll();
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();
        }
    }
}