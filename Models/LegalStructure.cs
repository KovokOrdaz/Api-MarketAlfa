using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class LegalStructure
    {
        public LegalStructure()
        {
            Businesses = new HashSet<Business>();
            Distributors = new HashSet<Distributor>();
        }

        public int Id { get; set; }
        public string Name { get; set; }

        public virtual ICollection<Business> Businesses { get; set; }
        public virtual ICollection<Distributor> Distributors { get; set; }
    }
}
