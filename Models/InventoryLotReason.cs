using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class InventoryLotReason
    {
        public int Id { get; set; }
        public int Lot { get; set; }
        public string Reason { get; set; }
        public DateTime Date { get; set; }
        public int UserX { get; set; }

        public virtual InventoryLot LotNavigation { get; set; }
        public virtual User UserXNavigation { get; set; }
    }
}
