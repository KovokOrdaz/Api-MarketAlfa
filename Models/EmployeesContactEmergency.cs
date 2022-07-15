using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class EmployeesContactEmergency
    {
        public int Idce { get; set; }
        public int EmergencyEmployee { get; set; }
        public string ContactEmergencyName { get; set; }
        public string ContactEmergencyFormat { get; set; }
        public string ContactEmergencyContent { get; set; }
        public string Parent { get; set; }

        public virtual Employee EmergencyEmployeeNavigation { get; set; }
    }
}
