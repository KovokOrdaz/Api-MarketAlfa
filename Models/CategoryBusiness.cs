using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class CategoryBusiness
    {
        public int Id { get; set; }
        public int Category { get; set; }
        public int Business { get; set; }
        public bool Status { get; set; }

        public virtual Business BusinessNavigation { get; set; }
        public virtual Category CategoryNavigation { get; set; }
    }
}
