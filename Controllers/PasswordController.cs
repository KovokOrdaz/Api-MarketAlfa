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
public class PasswordController : ControllerBase
{
    [HttpPost("recovery")]
    public IActionResult Get(UserRecoveryPasswordVM Entity)
    {
        Result _Result = new Result
        {
            Success = 0,
            Data = null
        };

        try
        {
            using (MarketAlfaContext _Context = new MarketAlfaContext())
            {
                var User = _Context.Users.Where(x => x.Pseudomyn == Entity.username && x.Name == Entity.name).Select(y => new { y.Id, y.Question, y.Answer }).ToList().FirstOrDefault();
                if (User != null)
                {
                    _Result.Success = 1;
                    _Result.Data = User;
                    _Result.Message = "Usuario Encontrado";
                }

            }
        }
        catch (Exception e)
        {
            _Result.Message = e.ToString();
        }
        return Ok(_Result);
    }

    [HttpPut("change")]
    public IActionResult Update(UserChangePasswordVM _Change)
    {
        Result _Result = new Result();
        try
        {
            using (MarketAlfaContext _DB = new MarketAlfaContext())
            {
                var Entity = _DB.Users.Find(_Change.id);
                var NewPassword = Encrypt.Hash(_Change.password);
                Entity.Password = NewPassword.Password;
                Entity.Salt = NewPassword.Salt;
                _DB.Entry(Entity).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                _DB.SaveChanges();
                _Result.Success = 1;
                _Result.Message = "Actualizacion Correcta";
            }
        }
        catch (Exception e)
        {
            _Result.Message = e.Message;
        }
        return Ok(_Result);
    }

    [HttpPut("answer")]
    public IActionResult UpdateAnswer(UserChangeAnswerVM _Change)
    {
        Result _Result = new Result();
        try
        {
            using (MarketAlfaContext _DB = new MarketAlfaContext())
            {
                var Entity = _DB.Users.Find(_Change.id);
                Entity.Answer = _Change.answer;
                Entity.Question = _Change.question;
                _DB.Entry(Entity).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                _DB.SaveChanges();
                _Result.Success = 1;
                _Result.Message = "Actualizacion Correcta";
            }
        }
        catch (Exception e)
        {
            _Result.Message = e.Message;
        }
        return Ok(_Result);
    }

}