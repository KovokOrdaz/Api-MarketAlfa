using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class PayDate
    {
        public PayDate()
        {
            Employees = new HashSet<Employee>();
            Taxes = new HashSet<Tax>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public int Minute { get; set; }
        public int? Day { get; set; }

        public virtual ICollection<Employee> Employees { get; set; }
        public virtual ICollection<Tax> Taxes { get; set; }
    }
}
