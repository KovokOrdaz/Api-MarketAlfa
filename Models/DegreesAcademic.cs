using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class DegreesAcademic
    {
        public DegreesAcademic()
        {
            Academics = new HashSet<Academic>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public int Percentage { get; set; }

        public virtual ICollection<Academic> Academics { get; set; }
    }
}
