using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;

namespace InnosixWebApp.Helpers
{
    public interface IEmailHelper
    {
        Task SendSingleEmail(string email, string subject, string plainTextContent, string htmlContent);

        Task SendSingleEmailToMultipleRecipients(IEnumerable<string> emails, string subject, string plainTextContent,
            string htmlContent);
    }
}