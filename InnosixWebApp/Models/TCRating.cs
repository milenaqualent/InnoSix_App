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
    
    public partial class TCRating
    {
        public long TCid { get; set; }
        public decimal Financials { get; set; }
        public decimal Fundamentals { get; set; }
        public decimal Market { get; set; }
        public decimal ManagementAndExecution { get; set; }
        public decimal BML { get; set; }
        public int BMLConfidenceIndex { get; set; }
        public decimal IntellectualProperty { get; set; }
        public decimal Technology { get; set; }
        public decimal TechnologyRisk { get; set; }
        public decimal TML { get; set; }
        public int TMLConfidenceIndex { get; set; }
        public decimal OverallRating { get; set; }
        public int OverallRatingConfidenceIndex { get; set; }
        public System.DateTime RatingDate { get; set; }
    
        public virtual TCBasicInfo TCBasicInfo { get; set; }
    }
}
