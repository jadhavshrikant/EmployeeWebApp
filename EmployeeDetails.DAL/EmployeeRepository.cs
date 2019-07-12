using EmployeeDetails.DAL.Helper;
using EmployeeDetails.Model;
using System.Configuration;
using System.Data;
using System.Data.Common;

namespace EmployeeDetails.DAL
{
    public class EmployeeRepository : IEmployeeRepository
    {
        private string _connectionstring = "";

        public EmployeeRepository()
        {
            _connectionstring = ConfigurationManager.ConnectionStrings["EmpDBConnection"].ConnectionString;
        }

        public int AddEmpDetails(Employee employee)
        {
            DBHelper dBHelper = CreateConnection();
            dBHelper.AddParameter("@Query", 1);
            dBHelper.AddParameter("@EmpName", employee.EmpName);
            dBHelper.AddParameter("@EmpDesignation", employee.EmpDesignation);
            dBHelper.AddParameter("@EmpEmail", employee.EmailID);
            dBHelper.AddParameter("@EmpAddress", employee.EmpAddress);
            int row = dBHelper.ExecuteNonQuery("Usp_InsertUpdateDelete_Employee1", System.Data.CommandType.StoredProcedure, System.Data.ConnectionState.Connecting);
            return row;

        }

        public Employee GettingEmpDetailsByID(int empID)
        {
            DBHelper dBHelper = CreateConnection();
            dBHelper.AddParameter("@EmpID", empID);
            dBHelper.AddParameter("@EmpName", null);
            dBHelper.AddParameter("@EmpDesignation", null);
            dBHelper.AddParameter("@EmpEmail", null);
            dBHelper.AddParameter("@EmpAddress", null);
            dBHelper.AddParameter("@Query", 5);
            DbDataReader dr = dBHelper.ExecuteReader("Usp_InsertUpdateDelete_Employee1", System.Data.CommandType.StoredProcedure, System.Data.ConnectionState.Open);
            DataTable dt = new DataTable();
            dt.Load(dr);
            DataRow dataRow = dt.Rows[0];
            Employee employee = new Employee();
            employee.convertDatatableToObject(dt);
            return employee;
        }

        public int UpdateEmpDetails(int empid, string EmpName, string empDesignation, string emaillD, string empAddress)
        {
            DBHelper dBHelper = CreateConnection();
            dBHelper.AddParameter("@EmpID", empid);
            dBHelper.AddParameter("@EmpName", EmpName);
            dBHelper.AddParameter("@EmpDesignation", empDesignation);
            dBHelper.AddParameter("@EmpEmail", emaillD);
            dBHelper.AddParameter("@EmpAddress", empAddress);
            dBHelper.AddParameter("@Query", 2);
            int row = dBHelper.ExecuteNonQuery("Usp_InsertUpdateDelete_Employee1", System.Data.CommandType.StoredProcedure, System.Data.ConnectionState.Open);
            return row;
        }

        private DBHelper CreateConnection()
        {
            DBHelper dBHelper = new DBHelper();
            dBHelper.CreateDBObjects(_connectionstring, DBHelper.DbProviders.SqlServer);
            return dBHelper;
        }
    }
}
