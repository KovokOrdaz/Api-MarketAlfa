using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class Business
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Rif { get; set; }
        public int Ls { get; set; }
        public string Direction { get; set; }
        public string Mail { get; set; }
        public string Phone { get; set; }
        public string Coin { get; set; }
        public string Acronym { get; set; }

        public virtual LegalStructure LsNavigation { get; set; }
    }
}
