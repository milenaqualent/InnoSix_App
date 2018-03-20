using System.Collections.Generic;
using System.Web.Mvc;

namespace InnosixWebApp.Models
{
    public class PortfolioItemViewModel
    {
        public TCBasicInfo TcBasicInfo { get; set; }
        public PortfolioItem PortfolioItem { get; set; }
        public IEnumerable<SelectListItem> Stages { get; set; }
    }
}