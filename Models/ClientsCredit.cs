using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class ClientsCredit
    {
        public int Idcc { get; set; }
        public int ClientCredit { get; set; }
        public int CoinCredit { get; set; }
        public double MaxCredit { get; set; }

        public virtual Client ClientCreditNavigation { get; set; }
        public virtual Coin CoinCreditNavigation { get; set; }
    }
}
