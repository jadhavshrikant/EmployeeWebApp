using System;
using System.Data;

namespace EmployeeDetails.Model
{
    public class Employee
    {
        public int EmpID { get; set; }
        public string EmpName { get; set; }

        public string EmpDesignation { get; set; }

        public string EmailID { get; set; }

        public string EmpAddress { get; set; }
        /// <summary>
        /// convertDatatableToObject
        /// </summary>
        /// <param name="dt"></param>
        public void convertDatatableToObject(DataTable dt)
        {
            DataRow dataRow = dt.Rows[0];
            this.EmpID = Convert.ToInt32(Convert.ToString(dataRow["EmpID"]));
            this.EmpName = Convert.ToString(dataRow["EmpName"]);
            this.EmpDesignation = Convert.ToString(dataRow["Designation"]);
            this.EmailID = Convert.ToString(dataRow["EmailID"]);
            this.EmpAddress = Convert.ToString(dataRow["Address"]);
        }
    }
}
