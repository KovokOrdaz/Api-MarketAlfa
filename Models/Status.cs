using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class Status
    {
        public Status()
        {
            PayMethods = new HashSet<PayMethod>();
        }

        public int Id { get; set; }
        public string Name { get; set; }

        public virtual ICollection<PayMethod> PayMethods { get; set; }
    }
}
