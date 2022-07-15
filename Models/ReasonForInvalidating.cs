using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class ReasonForInvalidating
    {
        public int Id { get; set; }
        public string Item { get; set; }
        public string Reason { get; set; }
    }
}
