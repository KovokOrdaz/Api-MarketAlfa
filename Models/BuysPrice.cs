using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class BuysPrice
    {
        public int Idbp { get; set; }
        public int CodeBuy { get; set; }
        public double BuyPriceBrute { get; set; }
        public double BuyPriceFinal { get; set; }
        public int BuyPayMethod { get; set; }
        public int BuyCoin { get; set; }

        public virtual Coin BuyCoinNavigation { get; set; }
        public virtual BuysProduct CodeBuyNavigation { get; set; }
    }
}
