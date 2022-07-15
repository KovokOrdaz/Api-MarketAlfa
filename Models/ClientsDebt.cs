using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class ClientsDebt
    {
        public int Idcd { get; set; }
        public int ClientDebt { get; set; }
        public int? CoinDebt { get; set; }
        public double Debt { get; set; }

        public virtual Client ClientDebtNavigation { get; set; }
        public virtual Coin CoinDebtNavigation { get; set; }
    }
}
