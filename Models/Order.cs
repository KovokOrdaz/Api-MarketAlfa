using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class Order
    {
        public Order()
        {
            ConceptOrders = new HashSet<ConceptOrder>();
        }

        public int Id { get; set; }
        public DateTime Date { get; set; }
        public string Distributor { get; set; }
        public DateTime Receive { get; set; }
        public bool Delivered { get; set; }
        public bool Status { get; set; }
        public int MadeBy { get; set; }

        public virtual Distributor DistributorNavigation { get; set; }
        public virtual User MadeByNavigation { get; set; }
        public virtual ICollection<ConceptOrder> ConceptOrders { get; set; }
    }
}
