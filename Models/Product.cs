using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class Product
    {
        public Product()
        {
            ConceptBuys = new HashSet<ConceptBuy>();
            ConceptOrders = new HashSet<ConceptOrder>();
            ConceptRequests = new HashSet<ConceptRequest>();
            EntryInventaries = new HashSet<EntryInventary>();
            Inventories = new HashSet<Inventory>();
            InventoryLots = new HashSet<InventoryLot>();
            InventoryProductReasons = new HashSet<InventoryProductReason>();
            ProductReasons = new HashSet<ProductReason>();
        }

        public string Code { get; set; }
        public string Name { get; set; }
        public int Category { get; set; }
        public int Description { get; set; }
        public bool Status { get; set; }
        public int RegisteredBy { get; set; }

        public virtual Category CategoryNavigation { get; set; }
        public virtual Measure DescriptionNavigation { get; set; }
        public virtual User RegisteredByNavigation { get; set; }
        public virtual ICollection<ConceptBuy> ConceptBuys { get; set; }
        public virtual ICollection<ConceptOrder> ConceptOrders { get; set; }
        public virtual ICollection<ConceptRequest> ConceptRequests { get; set; }
        public virtual ICollection<EntryInventary> EntryInventaries { get; set; }
        public virtual ICollection<Inventory> Inventories { get; set; }
        public virtual ICollection<InventoryLot> InventoryLots { get; set; }
        public virtual ICollection<InventoryProductReason> InventoryProductReasons { get; set; }
        public virtual ICollection<ProductReason> ProductReasons { get; set; }
    }
}
