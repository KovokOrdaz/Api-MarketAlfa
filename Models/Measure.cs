using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class Measure
    {
        public Measure()
        {
            Products = new HashSet<Product>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Acronym { get; set; }
        public bool Complete { get; set; }
        public bool Status { get; set; }

        public virtual ICollection<Product> Products { get; set; }
    }
}
