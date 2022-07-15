using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class CoinPrice
    {
        public int Id { get; set; }
        public int Coin { get; set; }
        public decimal Value { get; set; }
        public DateTime Date { get; set; }

        public virtual Coin CoinNavigation { get; set; }
    }
}
