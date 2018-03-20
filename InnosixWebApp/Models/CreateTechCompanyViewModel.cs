using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace InnosixWebApp.Models
{
    public class CreateTechCompanyViewModel
    {
        public string CompanyName { get; set; }
        public int CountryId { get; set; }
        public string CompanyWebsite { get; set; }
        public string CompanyEmail { get; set; }
        public string CompanyPhone { get; set; }
        public IEnumerable<int> TagIds { get; set; }
        public IEnumerable<int> TechDomainIds { get; set; }
        public string ContactPersonName { get; set; }
        public string ContactPersonEmail { get; set; }
        public string ContactPersonPhone { get; set; }

        public IEnumerable<Country> CountryList { get; set; }
        public IEnumerable<SelectListItem> TagList { get; set; }
        public IEnumerable<TechDomain> TechDomainList { get; set; }
    }
}