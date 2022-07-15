using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class Tax
    {
        public Tax()
        {
            TaxPays = new HashSet<TaxPay>();
        }

        public int Idtax { get; set; }
        public string Name { get; set; }
        public int DatePay { get; set; }
        public bool Status { get; set; }

        public virtual PayDate DatePayNavigation { get; set; }
        public virtual ICollection<TaxPay> TaxPays { get; set; }
    }
}
