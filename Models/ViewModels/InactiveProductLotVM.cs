using System.ComponentModel.DataAnnotations;

namespace MarketAlfa.Models.ViewModels
{
    public class InactiveProductLotVM
    {
        [Required]
        public string Id { get; set; }

        [Required]
        public string Product { get; set; }

        [Required]
        public string Reason { get; set; }

        [Required]
        public string User { get; set; }
    }
}