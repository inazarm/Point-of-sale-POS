//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PointOfSale.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {
        public Product()
        {
            this.ProductQuantities = new HashSet<ProductQuantity>();
        }
    
        public int ProductId { get; set; }
        public string Name { get; set; }
        public Nullable<int> CategoryId { get; set; }
        public Nullable<int> Status { get; set; }
    
        public virtual Category Category { get; set; }
        public virtual ICollection<ProductQuantity> ProductQuantities { get; set; }
    }
}
