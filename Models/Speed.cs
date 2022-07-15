using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class Speed
    {
        public int Id { get; set; }
        public int Distributor { get; set; }
        public int Request { get; set; }
        public decimal Fast { get; set; }
    }
}
