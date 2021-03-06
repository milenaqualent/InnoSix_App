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
    
    public partial class PortfolioItem
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PortfolioItem()
        {
            this.PortfolioToPortfolioItem = new HashSet<PortfolioToPortfolioItem>();
        }
    
        public long Id { get; set; }
        public long TCid { get; set; }
        public Nullable<int> StageId { get; set; }
        public Nullable<int> NextMoveId { get; set; }
        public Nullable<System.DateTime> NextMoveDate { get; set; }
        public string ResponsibleEmail { get; set; }
        public string ResponsibleName { get; set; }
        public Nullable<System.DateTime> OpportunityDate { get; set; }
        public string Comment { get; set; }
    
        public virtual Stage Stage { get; set; }
        public virtual Stage Stage1 { get; set; }
        public virtual TCBasicInfo TCBasicInfo { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PortfolioToPortfolioItem> PortfolioToPortfolioItem { get; set; }
    }
}
