#region Namespace
using EmployeeDetails.BAL;
using EmployeeDetails.Model;
using System;
using System.Data;
using System.IO;
using System.Net;
using System.Runtime.Serialization.Formatters.Soap;
using System.Text;
using System.Xml;
using System.Xml.Serialization;
using EmployeeDetails_Demo.App_Code;
#endregion

namespace EmployeeDetails_Demo
{
    /// <summary>
    /// EmployeeForm
    /// </summary>
    public partial class EmployeeForm : System.Web.UI.Page
    {
        #region Properties
        IEmployeeBL employeeBL;
        #endregion

        #region Events

        /// <summary>
        /// Page_Load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// ddlEmpID_SelectedIndexChanged
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlEmpID_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadEmployeeDetails();
        }

        /// <summary>
        /// btnAdd_Click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            addEmployeeDetail();
        }

        /// <summary>
        /// btnUpdate_Click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            updateEmployeeDetail();
        }

        #endregion

        #region Methods

        /// <summary>
        /// loadEmployeeDetails
        /// </summary>
        private void loadEmployeeDetails()
        {
            string employeeId = ddlEmpID.SelectedValue;
            string Xmlresponse = SOAPManual(Convert.ToInt32(ddlEmpID.SelectedValue));
            //var v = Serialization.SOAPToObject<Employee>(Xmlresponse);
            //var v1 = DeserializeInnerSoapObject<Employee>(Xmlresponse);

            System.Data.DataSet ds = new System.Data.DataSet();
            StringReader stringReader = new StringReader(Xmlresponse);
            ds.ReadXml(stringReader);
            DataRow dataRow = ds.Tables["GettingEmpDetailsByIDResult"].Rows[0];
            txtEmpName.Text = dataRow["EmpName"].ToString();
            txtEmpDesignation.Text = dataRow["EmpDesignation"].ToString();
            txtEmailID.Text = dataRow["EmailID"].ToString();
            txtAddress.Text = dataRow["EmpAddress"].ToString();
            stringReader.Dispose();
        }

        /// <summary>
        /// addEmployeeDetail
        /// </summary>
        private void addEmployeeDetail()
        {
            employeeBL = new EmployeeBL();
            Employee emp = GetEmployee();
            int row = employeeBL.AddEmpDetails(emp);
            lblMsg.Text = (row > 0) ? "Record Added successfuly" : "Record not Added";
            SessionManagement.SetUserSession(emp);
            Response.Redirect("~/MailDetailsForm.aspx");
        }


        /// <summary>
        /// updateEmployeeDetail
        /// </summary>
        private void updateEmployeeDetail()
        {
            Employee emp = GetEmployee();
            string response = SOAPManualForUpdate(emp);
            System.Data.DataSet ds = new System.Data.DataSet();
            StringReader stringReader = new StringReader(response);
            ds.ReadXml(stringReader);
            stringReader.Dispose();
            int row = Convert.ToInt32(ds.Tables["UpdateEmpDetailsResponse"].Rows[0]["UpdateEmpDetailsResult"].ToString());
            lblMsg.Text = (row > 0) ? "Record Updated successfuly" : "Record not Updated";
        }

        private Employee GetEmployee()
        {
            Employee emp = new Employee();
            if(ddlEmpID.SelectedValue!=string.Empty && ddlEmpID.SelectedValue!=null)
            emp.EmpID = Convert.ToInt32(ddlEmpID.SelectedValue);
            emp.EmpName = txtEmpName.Text;
            emp.EmpDesignation = txtEmpDesignation.Text;
            emp.EmailID = txtEmailID.Text;
            emp.EmpAddress = txtAddress.Text;
            return emp;
        }

        #endregion

        #region Web Service Methods

        public string SOAPManual(int empID)
        {
            string ServiceResult;
            try
            {
                StringBuilder sb = new StringBuilder();
                HttpWebRequest Req = (HttpWebRequest)WebRequest.Create(@"http://localhost:49596/EmployeeWebService.asmx");
                Req.Headers.Add(@"SOAPAction:http://tempuri.org/GettingEmpDetailsByID");
                Req.ContentType = "text/xml;charset=\"utf-8\"";
                Req.Accept = "text/xml";
                Req.Method = "POST";
                XmlDocument SOAPReqBody = new XmlDocument();
                sb.Append("<?xml version='1.0' encoding='utf-8'?>");
                sb.Append("<soap:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'>");
                sb.Append("<soap:Body>");
                sb.Append("<GettingEmpDetailsByID xmlns='http://tempuri.org/'>");
                sb.Append("<empID>" + empID + "</empID>");
                sb.Append("</GettingEmpDetailsByID></soap:Body></soap:Envelope>");
                SOAPReqBody.LoadXml(sb.ToString());

                using (Stream stream = Req.GetRequestStream())
                {
                    SOAPReqBody.Save(stream);
                }
                using (WebResponse Serviceres = Req.GetResponse())
                {
                    using (StreamReader rd = new StreamReader(Serviceres.GetResponseStream()))
                    {
                        //reading stream    
                        ServiceResult = rd.ReadToEnd();
                    }
                }
                return ServiceResult;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public string SOAPManualForUpdate(Employee employee)
        {
            string ServiceResult;
            try
            {
                StringBuilder sb = new StringBuilder();
                HttpWebRequest Req = (HttpWebRequest)WebRequest.Create(@"http://localhost:49596/EmployeeWebService.asmx");
                Req.Headers.Add(@"SOAPAction:http://tempuri.org/UpdateEmpDetails");
                Req.ContentType = "text/xml;charset=\"utf-8\"";
                Req.Accept = "text/xml";
                Req.Method = "POST";
                XmlDocument SOAPReqBody = new XmlDocument();
                sb.Append("<?xml version='1.0' encoding='utf-8'?>");
                sb.Append("<soap:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'>");
                sb.Append("<soap:Body>");
                sb.Append("<UpdateEmpDetails xmlns='http://tempuri.org/'>");
                sb.Append("<empid>" + employee.EmpID + "</empid>");
                sb.Append("<EmpName>" + employee.EmpName + "</EmpName>");
                sb.Append("<empDesignation>" + employee.EmpDesignation + "</empDesignation>");
                sb.Append("<emaillD>" + employee.EmailID + "</emaillD>");
                sb.Append("<empAddress>" + employee.EmpAddress + "</empAddress>");
                sb.Append("</UpdateEmpDetails></soap:Body></soap:Envelope>");
                SOAPReqBody.LoadXml(sb.ToString());

                using (Stream stream = Req.GetRequestStream())
                {
                    SOAPReqBody.Save(stream);
                }
                using (WebResponse Serviceres = Req.GetResponse())
                {
                    using (StreamReader rd = new StreamReader(Serviceres.GetResponseStream()))
                    {
                        //reading stream    
                        ServiceResult = rd.ReadToEnd();
                    }
                }
                return ServiceResult;
            }
            catch (Exception)
            {
                throw;
            }
        }

        #region Testing Methods
        /// <summary>
        /// Helps with serializing an object to XML and back again.
        /// </summary>
        public static class Serialization
        {
            /// Converts a SOAP string to an object
            /// </summary>
            /// <typeparam name="T">Object type</typeparam>
            /// <param name="SOAP">SOAP string</param>
            /// <returns>The object of the specified type</returns>
            public static T SOAPToObject<T>(string SOAP)
            {
                if (string.IsNullOrEmpty(SOAP))
                {
                    throw new ArgumentException("SOAP can not be null/empty");
                }
                try
                {
                    using (MemoryStream Stream = new MemoryStream(UTF8Encoding.UTF8.GetBytes(SOAP)))
                    {
                        SoapFormatter Formatter = new SoapFormatter();
                        return (T)Formatter.Deserialize(Stream);
                    }
                }
                catch { throw; }
            }

        }
        private static T DeserializeInnerSoapObject<T>(string soapResponse)
        {
            XmlDocument xmlDocument = new XmlDocument();
            xmlDocument.LoadXml(soapResponse);

            var soapBody = xmlDocument.GetElementsByTagName("soap:Body")[0];
            string innerObject = soapBody.InnerXml;

            XmlSerializer deserializer = new XmlSerializer(typeof(T));

            using (StringReader reader = new StringReader(innerObject))
            {
                return (T)deserializer.Deserialize(reader);
            }
        }

        #endregion
        #endregion
    }
}