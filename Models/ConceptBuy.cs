using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class ConceptBuy
    {
        public int Id { get; set; }
        public int Buy { get; set; }
        public string Product { get; set; }
        public decimal Amount { get; set; }
        public decimal Price { get; set; }

        public virtual Buy BuyNavigation { get; set; }
        public virtual Product ProductNavigation { get; set; }
    }
}
