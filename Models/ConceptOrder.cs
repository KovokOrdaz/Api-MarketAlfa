using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class ConceptOrder
    {
        public int Id { get; set; }
        public int OrderD { get; set; }
        public string Product { get; set; }
        public decimal Amount { get; set; }

        public virtual Order OrderDNavigation { get; set; }
        public virtual Product ProductNavigation { get; set; }
    }
}
