using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class Inventory
    {
        public int Id { get; set; }
        public string Product { get; set; }
        public decimal Price { get; set; }
        public decimal Amount { get; set; }
        public decimal Low { get; set; }
        public decimal Lock { get; set; }

        public virtual Product ProductNavigation { get; set; }
    }
}
