using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class UserReason
    {
        public int Id { get; set; }
        public int Banned { get; set; }
        public string Reason { get; set; }
        public DateTime Date { get; set; }
        public string UserX { get; set; }

        public virtual User BannedNavigation { get; set; }
    }
}
