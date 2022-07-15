using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class Transaction
    {
        public int Idtransaction { get; set; }
        public int TransactionUser { get; set; }
        public string TransactionClient { get; set; }
        public DateTime TransactionDate { get; set; }

        public virtual User TransactionUserNavigation { get; set; }
    }
}
