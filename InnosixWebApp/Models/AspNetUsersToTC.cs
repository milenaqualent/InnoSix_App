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
    
    public partial class AspNetUsersToTC
    {
        public long Id { get; set; }
        public long TCid { get; set; }
        public string AspNetUserId { get; set; }
    
        public virtual AspNetUsers AspNetUsers { get; set; }
        public virtual TCBasicInfo TCBasicInfo { get; set; }
    }
}