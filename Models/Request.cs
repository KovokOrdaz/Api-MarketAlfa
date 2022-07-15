using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class Request
    {
        public Request()
        {
            ConceptRequests = new HashSet<ConceptRequest>();
            InventoryLots = new HashSet<InventoryLot>();
            InventoryProductReasons = new HashSet<InventoryProductReason>();
        }

        public int Id { get; set; }
        public string Code { get; set; }
        public string Distributor { get; set; }
        public DateTime Receive { get; set; }
        public int OrderD { get; set; }
        public int ReceivedBy { get; set; }

        public virtual Distributor DistributorNavigation { get; set; }
        public virtual User ReceivedByNavigation { get; set; }
        public virtual ICollection<ConceptRequest> ConceptRequests { get; set; }
        public virtual ICollection<InventoryLot> InventoryLots { get; set; }
        public virtual ICollection<InventoryProductReason> InventoryProductReasons { get; set; }
    }
}
