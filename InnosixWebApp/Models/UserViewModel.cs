using System.Linq;
using InnosixWebApp.Models;

namespace InnosixWebApp.Models
{
    public class UserViewModel : AspNetUsers
    {
        public string Role { get; set; }

        public UserViewModel() { }

        public UserViewModel(AspNetUsers aspNetUsers)
        {
            Id = aspNetUsers.Id;
            Email = aspNetUsers.Email;
            EmailConfirmed = aspNetUsers.EmailConfirmed;
            PasswordHash = aspNetUsers.PasswordHash;
            SecurityStamp = aspNetUsers.SecurityStamp;
            PhoneNumber = aspNetUsers.PhoneNumber;
            PhoneNumberConfirmed = aspNetUsers.PhoneNumberConfirmed;
            TwoFactorEnabled = aspNetUsers.TwoFactorEnabled;
            LockoutEndDateUtc = aspNetUsers.LockoutEndDateUtc;
            LockoutEnabled = aspNetUsers.LockoutEnabled;
            AccessFailedCount = aspNetUsers.AccessFailedCount;
            UserName = aspNetUsers.UserName;
            Role = aspNetUsers.AspNetRoles.First().Name;
        }
    }
}