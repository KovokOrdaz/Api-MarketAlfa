using System.ComponentModel.DataAnnotations;

namespace MarketAlfa.Models.ViewModels
{
    public class OrderVM
    {
        [Required]
        public int User { set; get; }
        [Required]
        public string Distributor { set; get; }
        [Required]
        public DateTime Receive { set; get; }
        [Required]
        public List<ConceptOrderVM> Concepts { set; get; }
        public OrderVM()
        {
            this.Concepts = new List<ConceptOrderVM>();
        }
    }

    public class ConceptOrderVM
    {
        public string Product { get; set; }
        public decimal Amount { get; set; }
    }
}