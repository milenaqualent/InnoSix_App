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
    
    public partial class TCAdmin
    {
        public long TCid { get; set; }
        public Nullable<int> ClusterRelationId { get; set; }
        public string FreetextNoteField { get; set; }
        public Nullable<int> InnosixAccountManagerId { get; set; }
        public string Source { get; set; }
    
        public virtual AccountManager AccountManager { get; set; }
        public virtual Cluster Cluster { get; set; }
        public virtual TCBasicInfo TCBasicInfo { get; set; }
    }
}