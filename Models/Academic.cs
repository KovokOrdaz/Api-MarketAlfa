using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class Academic
    {
        public int Id { get; set; }
        public int Employee { get; set; }
        public int Grade { get; set; }
        public string Title { get; set; }

        public virtual Employee EmployeeNavigation { get; set; }
        public virtual DegreesAcademic GradeNavigation { get; set; }
    }
}
