using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class Nationality
    {
        public Nationality()
        {
            Clients = new HashSet<Client>();
            Employees = new HashSet<Employee>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Acronym { get; set; }

        public virtual ICollection<Client> Clients { get; set; }
        public virtual ICollection<Employee> Employees { get; set; }
    }
}
