using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class Packing
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Acronym { get; set; }
        public int Quantity { get; set; }
        public int Complete { get; set; }
        public int Status { get; set; }

        public virtual Answer CompleteNavigation { get; set; }
        public virtual Status StatusNavigation { get; set; }
    }
}
