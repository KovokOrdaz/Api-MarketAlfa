using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class RequestPay
    {
        public long Id { get; set; }
        public int Request { get; set; }
        public decimal Pay { get; set; }
        public int Coin { get; set; }
        public int Method { get; set; }

        public virtual Coin CoinNavigation { get; set; }
        public virtual PayMethod MethodNavigation { get; set; }
    }
}
