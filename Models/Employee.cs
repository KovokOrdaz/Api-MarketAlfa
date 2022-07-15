using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class Employee
    {
        public Employee()
        {
            Academics = new HashSet<Academic>();
            ContactEmergencies = new HashSet<ContactEmergency>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public int Nationality { get; set; }
        public string Dni { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string Phone { get; set; }
        public string SocialSecurity { get; set; }
        public int Job { get; set; }
        public TimeSpan Input { get; set; }
        public TimeSpan Output { get; set; }
        public decimal Salary { get; set; }
        public int DatePay { get; set; }
        public bool Status { get; set; }
        public bool IsUser { get; set; }
        public DateTime Date { get; set; }

        public virtual PayDate DatePayNavigation { get; set; }
        public virtual Job JobNavigation { get; set; }
        public virtual Nationality NationalityNavigation { get; set; }
        public virtual ICollection<Academic> Academics { get; set; }
        public virtual ICollection<ContactEmergency> ContactEmergencies { get; set; }
    }
}
