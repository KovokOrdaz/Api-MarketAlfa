using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class ContactEmergency
    {
        public int Id { get; set; }
        public int Employee { get; set; }
        public string Name { get; set; }
        public string Format { get; set; }
        public string Container { get; set; }
        public string Parent { get; set; }

        public virtual Employee EmployeeNavigation { get; set; }
    }
}
