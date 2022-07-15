using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class DistributorReason
    {
        public int Id { get; set; }
        public string Distributor { get; set; }
        public string Reason { get; set; }
        public DateTime Date { get; set; }
        public int UserX { get; set; }

        public virtual Distributor DistributorNavigation { get; set; }
        public virtual User UserXNavigation { get; set; }
    }
}
