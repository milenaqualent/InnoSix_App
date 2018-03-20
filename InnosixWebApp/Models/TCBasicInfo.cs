//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace InnosixWebApp.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class TCBasicInfo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TCBasicInfo()
        {
            this.AspNetUsersTcClaim = new HashSet<AspNetUsersTcClaim>();
            this.AspNetUsersToTC = new HashSet<AspNetUsersToTC>();
            this.BusinessModelToTC = new HashSet<BusinessModelToTC>();
            this.PortfolioItem = new HashSet<PortfolioItem>();
            this.ProductToTC = new HashSet<ProductToTC>();
            this.ServicesToTC = new HashSet<ServicesToTC>();
            this.TechDomainToTC = new HashSet<TechDomainToTC>();
            this.TechTagToTC = new HashSet<TechTagToTC>();
        }
    
        public long Id { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Address3 { get; set; }
        public string Zip { get; set; }
        public string City { get; set; }
        public int CountryId { get; set; }
        public string CompanyEmail { get; set; }
        public string CompanyName { get; set; }
        public string CompanyPhone { get; set; }
        public string LegalSuffix { get; set; }
        public string CompanyWebsite { get; set; }
        public string LogoUrl { get; set; }
        public string RegistrationNumber { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AspNetUsersTcClaim> AspNetUsersTcClaim { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AspNetUsersToTC> AspNetUsersToTC { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BusinessModelToTC> BusinessModelToTC { get; set; }
        public virtual Country Country { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PortfolioItem> PortfolioItem { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductToTC> ProductToTC { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ServicesToTC> ServicesToTC { get; set; }
        public virtual TCActive TCActive { get; set; }
        public virtual TCAdmin TCAdmin { get; set; }
        public virtual TCBusinessInfo TCBusinessInfo { get; set; }
        public virtual TCContact TCContact { get; set; }
        public virtual TCGeneral TCGeneral { get; set; }
        public virtual TCIdealPartner TCIdealPartner { get; set; }
        public virtual TCRating TCRating { get; set; }
        public virtual TCTechnology TCTechnology { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TechDomainToTC> TechDomainToTC { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TechTagToTC> TechTagToTC { get; set; }
    }
}