using System.ComponentModel.DataAnnotations;

namespace MarketAlfa.Models.ViewModels
{
    public class UserChangeAnswerVM
    {
        [Required]
        public int id { get; set; }
        [Required]
        public string answer { get; set; }

        [Required]
        public string question { get; set; }
    }
}