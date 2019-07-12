using EmployeeDetails.Common;
using EmployeeDetails.Model;
using System;
using System.Messaging;
using System.ServiceProcess;
using System.Configuration;

namespace EmployeeDetails.WS
{
    public partial class EmailWindService : ServiceBase
    {
        public MessageQueue mq;

        public EmailWindService()
        {
            InitializeComponent();
            string messageQueuePath = ConfigurationManager.AppSettings["MessageQueuePath"];
            if (MessageQueue.Exists(messageQueuePath))
                mq = new MessageQueue(messageQueuePath);
            else
                mq = MessageQueue.Create(messageQueuePath);
        }

        protected override void OnStart(string[] args)
        {
            System.Diagnostics.Debugger.Launch();
            try
            {
                mq.Formatter = new XmlMessageFormatter(new Type[] { typeof(Employee) });
                Message myMessage = new Message();
                myMessage = mq.Receive();
                if (myMessage != null && null != myMessage.Body)
                {
                    Employee myEmp = (Employee)myMessage.Body;
                    string bodyText = "Welcome" + " " + myEmp.EmpName;

                    // Send a welcome email to the emailid of employee object
                    string _server = ConfigurationManager.AppSettings["Mail:Server"];
                    string _username = ConfigurationManager.AppSettings["Mail:Username"];
                    string _password = ConfigurationManager.AppSettings["Mail:Password"];
                    string _fromEmail = ConfigurationManager.AppSettings["Mail:FromEmail"];

                    SendSMTPMail sendSMTPMail = new SendSMTPMail(_server, _username, _password, _fromEmail);
                    sendSMTPMail.SendEmail(myEmp.EmailID, "Email Subscription", bodyText);

                }
            }

            catch (Exception ex)
            {
                Logger.Logger.Instance.Error(ex);
            }
            finally
            {
                if (null != mq)
                {
                    mq.Dispose();
                    mq.Close();
                }
            }
        }

        protected override void OnStop()
        {
            //NA
        }
    }
}
