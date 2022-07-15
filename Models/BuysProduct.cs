using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class BuysProduct
    {
        public BuysProduct()
        {
            BuysPrices = new HashSet<BuysPrice>();
        }

        public int Idbuy { get; set; }
        public int BuyCode { get; set; }
        public int BuyProduct { get; set; }
        public int BuyProductPrice { get; set; }

        public virtual ProductsPrice BuyProductPriceNavigation { get; set; }
        public virtual ICollection<BuysPrice> BuysPrices { get; set; }
    }
}
