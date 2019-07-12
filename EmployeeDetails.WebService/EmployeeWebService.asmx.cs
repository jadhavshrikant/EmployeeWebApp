using EmployeeDetails.BAL;
using EmployeeDetails.Model;
using System.Web.Services;

namespace EmployeeDetails.WebService
{
    /// <summary>
    /// Summary description for EmployeeWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]

    public class EmployeeWebService : System.Web.Services.WebService
    {
        IEmployeeBL employeeBL;

        /// <summary>
        /// EmployeeWebService
        /// </summary>
        public EmployeeWebService()
        {
            employeeBL = new EmployeeBL();
        }

        [WebMethod]
        public Employee GettingEmpDetailsByID(int empID)
        {
            Employee employee = employeeBL.GettingEmpDetailsByID(empID);
            return employee;
        }

        [WebMethod]

        public int UpdateEmpDetails(int empid, string EmpName, string empDesignation, string emaillD, string empAddress)
        {
            int row = employeeBL.UpdateEmpDetails(empid, EmpName, empDesignation, emaillD, empAddress);
            return row;
        }
    }
}
