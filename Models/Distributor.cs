using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class Distributor
    {
        public Distributor()
        {
            DistributorReasons = new HashSet<DistributorReason>();
            Orders = new HashSet<Order>();
            Requests = new HashSet<Request>();
        }

        public string Rif { get; set; }
        public string Name { get; set; }
        public int Ls { get; set; }
        public decimal Speed { get; set; }
        public decimal Respet { get; set; }
        public int CountD { get; set; }
        public bool Status { get; set; }
        public int RegisteredBy { get; set; }

        public virtual LegalStructure LsNavigation { get; set; }
        public virtual User RegisteredByNavigation { get; set; }
        public virtual ICollection<DistributorReason> DistributorReasons { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
        public virtual ICollection<Request> Requests { get; set; }
    }
}
