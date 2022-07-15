using MarketAlfa.Models.ViewModels;

namespace MarketAlfa.Services
{
    public interface IOrderService
    {
        public void Create(OrderVM _Entity);
    }
}