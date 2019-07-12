using EmployeeDetails_Demo.App_Code;
using System;
using System.Web;

namespace EmployeeDetails_Demo
{
    public partial class MailDetailsForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadEmployeeDetail();
            }
        }

        protected void btnNavigateToHome_Click(object sender, EventArgs e)
        {
            SessionManagement.ClearUserSession();
            Response.Redirect("EmployeeForm.aspx");
        }

        /// <summary>
        /// loadEmployeeDetail
        /// </summary>
        private void loadEmployeeDetail()
        {
            lblEmpName.Text = HttpContext.Current.Session["EmpName"].ToString();
            lblEmpDesignation.Text = HttpContext.Current.Session["EmpDesignation"].ToString();
            lblEmpMailID.Text = HttpContext.Current.Session["EmailID"].ToString();
        }
    }
}