using System.ComponentModel.DataAnnotations;

namespace MarketAlfa.Models.ViewModels
{
    public class InactiveElementVM
    {
        [Required]
        public string Id { get; set; }

        [Required]
        public string Reason { get; set; }

        [Required]
        public string User { get; set; }
    }
}