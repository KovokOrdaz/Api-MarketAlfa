using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class ProductsPrice
    {
        public ProductsPrice()
        {
            BuysProducts = new HashSet<BuysProduct>();
        }

        public int Idpp { get; set; }
        public int Product { get; set; }
        public double ProductPrice { get; set; }
        public int ProductCoin { get; set; }

        public virtual Coin ProductCoinNavigation { get; set; }
        public virtual ICollection<BuysProduct> BuysProducts { get; set; }
    }
}
