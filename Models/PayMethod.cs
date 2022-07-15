using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class PayMethod
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public double Commission { get; set; }
        public int Status { get; set; }
    }
}
