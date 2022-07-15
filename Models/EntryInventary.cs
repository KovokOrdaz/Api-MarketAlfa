using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class EntryInventary
    {
        public int Id { get; set; }
        public string Product { get; set; }
        public decimal Amount { get; set; }
        public decimal Price { get; set; }
        public DateTime Date { get; set; }
        public int RegisteredBy { get; set; }
        public DateTime Expiration { get; set; }

        public virtual Product ProductNavigation { get; set; }
        public virtual User RegisteredByNavigation { get; set; }
    }
}
