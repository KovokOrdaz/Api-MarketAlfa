using System.ComponentModel.DataAnnotations;

namespace MarketAlfa.Models.ViewModels
{
    public class RequestsVM
    {
        [Required]
        public int User { get; set; }
        [Required]
        [ExistDistributorAtrribute(ErrorMessage = "Distributor No Valid")]
        public string Distributor { get; set; }
        [Required]
        [ExistOrderAtrribute(ErrorMessage = "Order No Valid")]
        public int OrderD { get; set; }
        [Required]
        public string Code { get; set; }
        [Required]
        [MinLength(1, ErrorMessage = "Concept Empty")]
        public List<ProductRequest> Products { get; set; }

        public RequestsVM()
        {
            this.Products = new List<ProductRequest>();
        }
    }

    public class ProductRequest
    {
        public string Product { get; set; }
        public decimal Amount { get; set; }
        public decimal Price { get; set; }
        public DateTime Expiration { get; set; }
    }

    #region VALIDATION
    public class ExistDistributorAtrribute : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            string ID = (string)value;
            using (var _Context = new Models.MarketAlfaContext())
            {
                if (_Context.Distributors.Find(ID) == null) return false;
            }
            return true;
        }
    }
    public class ExistOrderAtrribute : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            int ID = (int)value;
            using (var _Context = new Models.MarketAlfaContext())
            {
                if (_Context.Orders.Find(ID) == null) return false;
            }
            return true;
        }
    }
    #endregion
}