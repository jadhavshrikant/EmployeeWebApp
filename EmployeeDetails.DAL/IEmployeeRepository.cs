using EmployeeDetails.Model;

namespace EmployeeDetails.DAL
{
    public interface IEmployeeRepository
    {
        Employee GettingEmpDetailsByID(int empID);
        int UpdateEmpDetails(int empid, string EmpName, string empDesignation, string emaillD, string empAddress);
        int AddEmpDetails(Employee employee);

    }
}
