using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class ClientsBalance
    {
        public int Idcb { get; set; }
        public int ClientBalance { get; set; }
        public double BalanceMoney { get; set; }
        public int BalanceCoin { get; set; }
        public DateTime BalanceDateEntry { get; set; }
        public DateTime BalanceDateExit { get; set; }

        public virtual Coin BalanceCoinNavigation { get; set; }
        public virtual Client ClientBalanceNavigation { get; set; }
    }
}
