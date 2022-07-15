using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class InventoryLot
    {
        public InventoryLot()
        {
            InventoryLotReasons = new HashSet<InventoryLotReason>();
        }

        public int Id { get; set; }
        public int Lot { get; set; }
        public string Product { get; set; }
        public decimal Amount { get; set; }
        public decimal Sold { get; set; }
        public DateTime Expiration { get; set; }
        public bool Status { get; set; }
        public int RegisteredBy { get; set; }

        public virtual Request LotNavigation { get; set; }
        public virtual Product ProductNavigation { get; set; }
        public virtual User RegisteredByNavigation { get; set; }
        public virtual ICollection<InventoryLotReason> InventoryLotReasons { get; set; }
    }
}
