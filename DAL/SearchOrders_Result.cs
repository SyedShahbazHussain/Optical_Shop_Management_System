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
    
    public partial class SearchOrders_Result
    {
        public long OrderId { get; set; }
        public long CustomerID { get; set; }
        public string Particularls { get; set; }
        public string OrderDate { get; set; }
        public string DeliveryDate { get; set; }
        public string F_L_C { get; set; }
        public Nullable<int> Total { get; set; }
        public Nullable<int> Advance { get; set; }
        public Nullable<int> Balance { get; set; }
        public string CustomerName { get; set; }
        public string CustomerContact { get; set; }
    }
}