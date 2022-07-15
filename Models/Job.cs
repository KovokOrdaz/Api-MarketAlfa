using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class Job
    {
        public Job()
        {
            Employees = new HashSet<Employee>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public bool Status { get; set; }

        public virtual ICollection<Employee> Employees { get; set; }
    }
}
