using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class Buy
    {
        public Buy()
        {
            ConceptBuys = new HashSet<ConceptBuy>();
        }

        public int Id { get; set; }
        public DateTime Date { get; set; }
        public string Client { get; set; }
        public int Seller { get; set; }

        public virtual Client ClientNavigation { get; set; }
        public virtual User SellerNavigation { get; set; }
        public virtual ICollection<ConceptBuy> ConceptBuys { get; set; }
    }
}
