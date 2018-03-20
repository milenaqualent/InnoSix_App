using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using DevExpress.XtraPrinting.Native;
using Microsoft.AspNet.Identity;
using SendGrid;
using SendGrid.Helpers.Mail;

namespace InnosixWebApp.Helpers
{
    public class EmailHelper : IEmailHelper
    {
        public async Task SendSingleEmail(string email, string subject, string plainTextContent, string htmlContent)
        {
            var apiKey = Environment.GetEnvironmentVariable("SendGridApiKey");
            var fromEmail = Environment.GetEnvironmentVariable("SendGridFromEmail");
            var fromName = Environment.GetEnvironmentVariable("SendGridFromName");

            var client = new SendGridClient(apiKey);
            var from = new EmailAddress(fromEmail, fromName);
            var to = new EmailAddress(email);
            var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);
            var response = await client.SendEmailAsync(msg);
        }

        public async Task SendSingleEmailToMultipleRecipients(IEnumerable<string> emails, string subject, string plainTextContent, string htmlContent)
        {
            var apiKey = Environment.GetEnvironmentVariable("SendGridApiKey");
            var fromEmail = Environment.GetEnvironmentVariable("SendGridFromEmail");
            var fromName = Environment.GetEnvironmentVariable("SendGridFromName");

            var client = new SendGridClient(apiKey);
            var from = new EmailAddress(fromEmail, fromName);
            var tos = emails.Select(email => new EmailAddress(email)).ToList();
            var msg = MailHelper.CreateSingleEmailToMultipleRecipients(from, tos, subject, plainTextContent, htmlContent);
            var response = await client.SendEmailAsync(msg);
        }
    }
}