//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProDelivery.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Consignment
    {
        public string Shipper_Name { get; set; }
        public string Shipper_Phone { get; set; }
        public Nullable<decimal> Total_Weight { get; set; }
        public string Category { get; set; }
        public int No_Of_Items { get; set; }
        public string Description { get; set; }
        public string Branch_Name { get; set; }
        public string Branch_Address { get; set; }
        public string Rec_Name { get; set; }
        public string Rec_Address { get; set; }
        public int Branch_Id { get; set; }
        public int Rec_Id { get; set; }
        public string Req_Status { get; set; }
        public string Status { get; set; }
    
        public virtual Branch Branch { get; set; }
        public virtual Receiver Receiver { get; set; }
    }
}
