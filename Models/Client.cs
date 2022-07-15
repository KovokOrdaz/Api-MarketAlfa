using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class Client
    {
        public Client()
        {
            Buys = new HashSet<Buy>();
        }

        public string Name { get; set; }
        public int Nationality { get; set; }
        public string Dni { get; set; }
        public int UserRegister { get; set; }
        public DateTime Date { get; set; }
        public bool Status { get; set; }
        public string Direction { get; set; }
        public string Phone { get; set; }

        public virtual Nationality NationalityNavigation { get; set; }
        public virtual User UserRegisterNavigation { get; set; }
        public virtual ICollection<Buy> Buys { get; set; }
    }
}
