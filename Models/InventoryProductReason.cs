using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class InventoryProductReason
    {
        public int Id { get; set; }
        public string Product { get; set; }
        public int Lot { get; set; }
        public DateTime Date { get; set; }
        public int RegisterBy { get; set; }
        public string Reason { get; set; }
        public decimal Amount { get; set; }

        public virtual Request LotNavigation { get; set; }
        public virtual Product ProductNavigation { get; set; }
        public virtual User RegisterByNavigation { get; set; }
    }
}
