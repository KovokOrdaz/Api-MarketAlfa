using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class Answer
    {
        public Answer()
        {
            Packings = new HashSet<Packing>();
        }

        public int Id { get; set; }
        public string Name { get; set; }

        public virtual ICollection<Packing> Packings { get; set; }
    }
}
