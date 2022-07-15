using MarketAlfa.Models.Response;
using MarketAlfa.Models.ViewModels;

namespace MarketAlfa.Services
{
    public interface IUserService
    {
        UserResult Response(LoginVM _Entity);
    }
}