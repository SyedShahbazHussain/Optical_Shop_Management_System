//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class CustomerOrder
    {
        public long OrderId { get; set; }
        public long CustomerID { get; set; }
        public string Particularls { get; set; }
        public System.DateTime OrderDate { get; set; }
        public Nullable<System.DateTime> DeliveryDate { get; set; }
        public string Frame { get; set; }
        public string Lenses { get; set; }
        public string ContactLense { get; set; }
        public Nullable<int> Total { get; set; }
        public Nullable<int> Advance { get; set; }
        public Nullable<int> Balance { get; set; }
        public string Comments { get; set; }
        public string RE_SPH_D { get; set; }
        public string RE_SPH_R { get; set; }
        public string RE_SPH_CL { get; set; }
        public string RE_CYL_D { get; set; }
        public string RE_CYL_R { get; set; }
        public string RE_CYL_CL { get; set; }
        public string RE_AXIS_D { get; set; }
        public string RE_AXIS_R { get; set; }
        public string RE_AXIS_CL { get; set; }
        public string RE_VA_D { get; set; }
        public string RE_VA_R { get; set; }
        public string RE_VA_CL { get; set; }
        public string LE_SPH_D { get; set; }
        public string LE_SPH_R { get; set; }
        public string LE_SPH_CL { get; set; }
        public string LE_CYL_D { get; set; }
        public string LE_CYL_R { get; set; }
        public string LE_CYL_CL { get; set; }
        public string LE_AXIS_D { get; set; }
        public string LE_AXIS_R { get; set; }
        public string LE_AXIS_CL { get; set; }
        public string LE_VA_D { get; set; }
        public string LE_VA_R { get; set; }
        public string LE_VA_CL { get; set; }
        public System.DateTime DateCreated { get; set; }
        public Nullable<System.DateTime> DateUpdated { get; set; }
        public string BookOrderNo { get; set; }
    
        public virtual Customer Customer { get; set; }
    }
}
