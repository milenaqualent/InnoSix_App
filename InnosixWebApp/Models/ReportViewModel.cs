using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InnosixWebApp.Models
{
    public class ReportViewModel
    {
        public TCBasicInfo TcBasicInfo { get; set; }
        public PortfolioItem PortfolioItem { get; set; }
        public bool Print { get; set; } = false;
    }
}