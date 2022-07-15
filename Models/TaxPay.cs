using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class TaxPay
    {
        public int Id { get; set; }
        public int Tax { get; set; }
        public DateTime Date { get; set; }
        public double Price { get; set; }
        public int Coin { get; set; }

        public virtual Coin CoinNavigation { get; set; }
        public virtual Tax TaxNavigation { get; set; }
    }
}
