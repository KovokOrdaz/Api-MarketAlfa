using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class Coin
    {
        public Coin()
        {
            BuysPrices = new HashSet<BuysPrice>();
            CoinPrices = new HashSet<CoinPrice>();
            ProductsPrices = new HashSet<ProductsPrice>();
            TaxPays = new HashSet<TaxPay>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Acronym { get; set; }
        public string Region { get; set; }
        public decimal Value { get; set; }
        public bool Status { get; set; }

        public virtual ICollection<BuysPrice> BuysPrices { get; set; }
        public virtual ICollection<CoinPrice> CoinPrices { get; set; }
        public virtual ICollection<ProductsPrice> ProductsPrices { get; set; }
        public virtual ICollection<TaxPay> TaxPays { get; set; }
    }
}
