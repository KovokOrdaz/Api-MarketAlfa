using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using MarketAlfa.Models;
using MarketAlfa.Models.Common;
using MarketAlfa.Models.Response;
using MarketAlfa.Models.ViewModels;
using MarketAlfa.Tools;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;

namespace MarketAlfa.Services
{
    public class UserService : IUserService
    {
        private readonly AppSetting _AppSetting;

        public UserService(IOptions<AppSetting> AppSettings)
        {
            _AppSetting = AppSettings.Value;
        }
        public UserResult Response(LoginVM _Entity)
        {
            using (var _DB = new MarketAlfaContext())
            {
                UserResult _UserResult = new UserResult();
                var _Result = _DB.Users.Where(x => x.Pseudomyn == _Entity.Username && x.Status == true).FirstOrDefault();
                if (_Result != null)
                {
                    if (Encrypt.CheckHash(_Entity.Password, _Result.Password, _Result.Salt))
                    {
                        _UserResult.ID = _Result.Id;
                        _UserResult.Username = _Result.Pseudomyn;
                        _UserResult.Privilege = _Result.Privilege;
                        _UserResult.Token = GetToken(_Result);
                        return _UserResult;
                    }
                    else
                    {
                        return null;
                    }
                }
                else
                {
                    return null;
                }
            }
        }

        private string GetToken(User _Entity)
        {
            var TokenHandler = new JwtSecurityTokenHandler();
            var Key = Encoding.ASCII.GetBytes(_AppSetting.Secret);
            var TokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity
                (
                    new Claim[]
                    {
                        new Claim (ClaimTypes.NameIdentifier, _Entity.Id.ToString())
                    }
                ),
                Expires = DateTime.UtcNow.AddMinutes(5),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(Key), SecurityAlgorithms.HmacSha256Signature)
            };
            var Token = TokenHandler.CreateToken(TokenDescriptor);
            return TokenHandler.WriteToken(Token);
        }
    }
}