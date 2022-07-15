using Microsoft.AspNetCore.Mvc;
using MarketAlfa.Models;
using MarketAlfa.Models.Response;
using Microsoft.EntityFrameworkCore;
using MarketAlfa.Models.ViewModels;
using MarketAlfa.Services;
using MarketAlfa.Tools;

namespace MarketAlfa.Controllers;

[ApiController]
[Route("[controller]")]
public class LoginController : ControllerBase
{
    private IUserService _UserService;
    private Result _Result = new Result();
    public LoginController(IUserService UserService)
    {
        _UserService = UserService;
    }

    [HttpPost]
    public IActionResult Login([FromBody] LoginVM Entity)
    {
        var UserService = _UserService.Response(Entity);
        if (UserService == null)
        {
            _Result.Success = 0;
            _Result.Message = "Contraseña o Usuario Invalido";
            _Result.Data = null;
            return Ok(_Result);
        }
        _Result.Success = 1;
        _Result.Message = "Logueo Correcto";
        _Result.Data = UserService;
        return Ok(_Result);
    }
}