using System;
using System.Net;
using System.Net.Mail;

namespace EmployeeDetails.Common
{
    public class SendSMTPMail
    {
        public string _server { get; set; }
        public string _username { get; set; }
        public string _password { get; set; }
        public string _fromEmail { get; set; }

        public SendSMTPMail(string server, string username, string password, string fromEmail)
        {
            this._server = server;
            this._username = username;
            this._password = password;
            this._fromEmail = fromEmail;
        }

        /// <summary>
        /// SendEmail
        /// </summary>
        /// <param name="recievermailid"></param>
        /// <param name="subject"></param>
        /// <param name="bodyText"></param>
        public void SendEmail(string recievermailid, string subject, string bodyText)
        {
            try
            {
                SmtpClient client = new SmtpClient(_server, 587);
                client.EnableSsl = true;
                client.Timeout = 100000;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential(_username, _password);
                MailMessage msg = new MailMessage();
                msg.To.Add(recievermailid);
                msg.From = new MailAddress(_fromEmail);
                msg.Subject = subject;
                msg.Body = bodyText;
                client.Send(msg);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}

