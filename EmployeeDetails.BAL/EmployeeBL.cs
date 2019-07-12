using EmployeeDetails.DAL;
using EmployeeDetails.Model;
using System;
using System.Configuration;
using System.Messaging;

namespace EmployeeDetails.BAL
{
    public class EmployeeBL : IEmployeeBL
    {
        IEmployeeRepository _employeeRepository;
        MessageQueue mq;

        public EmployeeBL()
        {
            _employeeRepository = new EmployeeRepository();
            string messageQueuePath = ConfigurationManager.AppSettings["MessageQueuePath"];
            if (MessageQueue.Exists(messageQueuePath) && messageQueuePath!=null)
                mq = new MessageQueue(messageQueuePath);
            else
                mq = MessageQueue.Create(messageQueuePath);
        }

        public Employee GettingEmpDetailsByID(int empID)
        {
            return _employeeRepository.GettingEmpDetailsByID(empID);
        }

        public int UpdateEmpDetails(int empid, string empName, string empDesignation, string emaillD, string empAddress)
        {
            return _employeeRepository.UpdateEmpDetails(empid, empName, empDesignation, emaillD, empAddress);
        }

        public int AddEmpDetails(Employee employee)
        {
            mq.Send(employee);
            return _employeeRepository.AddEmpDetails(employee);
        }
    }
}
