using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class ConceptRequest
    {
        public int Id { get; set; }
        public int Request { get; set; }
        public string Product { get; set; }
        public decimal Amount { get; set; }
        public decimal Price { get; set; }
        public DateTime Expiration { get; set; }

        public virtual Product ProductNavigation { get; set; }
        public virtual Request RequestNavigation { get; set; }
    }
}
