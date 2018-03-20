using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InnosixWebApp.Models
{
    public class ClaimFormViewModel
    {
        public AspNetUsersTcClaim AspNetUsersTcClaim { get; set; }
        public TCBasicInfo TcBasicInfo { get; set; }
    }
}