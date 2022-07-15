using Microsoft.AspNetCore.Mvc;
using MarketAlfa.Models;
using MarketAlfa.Models.Response;
using Microsoft.EntityFrameworkCore;
using MarketAlfa.Models.ViewModels;
using MarketAlfa.Services;

namespace MarketAlfa.Controllers;

[ApiController]
[Route("[controller]")]
public class UserInactiveController : ControllerBase
{

    [HttpGet]
    public async Task<IActionResult> Get()
    {
        Result _Result = new Result();
        try
        {
            using (MarketAlfaContext _DB = new MarketAlfaContext())
            {
                var _List = await _DB.UserReasons.Select(x => new { Id = x.Id, Banned = x.BannedNavigation.Pseudomyn, User = x.UserX, Reason = x.Reason, Date = x.Date }).ToListAsync();
                _Result.Success = 1;
                _Result.Message = "Consulta Correcto";
                _Result.Data = _List;
            }
        }
        catch (Exception e)
        {
            _Result.Message = e.Message;
        }
        return Ok(_Result);
    }

    public string GetUser(int ID)
    {
        using (MarketAlfaContext _DB = new MarketAlfaContext())
        {
            var User = _DB.Users.Find(ID);
            return User.Pseudomyn;
        }
    }

    [HttpDelete("{ID}")]
    public async Task<IActionResult> Delete(int ID)
    {
        Result _Result = new Result();
        try
        {
            using (MarketAlfaContext _DB = new MarketAlfaContext())
            {
                var Entity = await _DB.UserReasons.FindAsync(ID);
                var _User = await _DB.Users.FindAsync(Entity.Banned);
                _User.Status = true;
                _DB.Entry(_User).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                await _DB.SaveChangesAsync();
                _DB.Remove(Entity);
                await _DB.SaveChangesAsync();
                _Result.Success = 1;
                _Result.Message = "Actualización Correcta";
            }
        }
        catch (Exception e)
        {
            _Result.Message = e.Message;
        }
        return Ok(_Result);
    }
}