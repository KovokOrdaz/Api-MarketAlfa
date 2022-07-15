using System.ComponentModel.DataAnnotations;

namespace MarketAlfa.Models.ViewModels
{
    public class UserChangePasswordVM
    {
        [Required]
        public int id { get; set; }
        [Required]
        public string password { get; set; }
    }
}