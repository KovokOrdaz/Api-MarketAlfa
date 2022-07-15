using System.ComponentModel.DataAnnotations;

namespace MarketAlfa.Models.ViewModels
{
    public class BuyVM
    {
        [Required]
        public string Client { set; get; }
        [Required]
        public int Seller { set; get; }
        [Required]
        public List<ConceptBuy> Concepts { set; get; }
        public BuyVM()
        {
            this.Concepts = new List<ConceptBuy>();
        }
    }

    public class ConceptBuy
    {
        public string Product { get; set; }
        public decimal Amount { get; set; }
        public decimal Price { get; set; }
    }
}