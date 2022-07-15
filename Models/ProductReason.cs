using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class ProductReason
    {
        public int Id { get; set; }
        public string Product { get; set; }
        public string Reason { get; set; }
        public DateTime Date { get; set; }
        public int UserX { get; set; }

        public virtual Product ProductNavigation { get; set; }
        public virtual User UserXNavigation { get; set; }
    }
}
