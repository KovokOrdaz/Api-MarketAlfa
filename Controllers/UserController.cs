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
public class UserController : ControllerBase
{
    private Result _Result = new Result();

    [HttpGet("exist")]
    public IActionResult Exist()
    {
        Result _Result = new Result();
        try
        {
            using (MarketAlfaContext _DB = new MarketAlfaContext())
            {
                User _Entity = _DB.Users.ToList().FirstOrDefault();
                _Result.Success = 1;
                _Result.Message = "Consulta Correcto";
                if (_Entity != null)
                {
                    _Result.Data = true;
                }
                else
                {
                    _Result.Data = false;
                }
            }
        }
        catch (Exception e)
        {
            _Result.Message = e.Message;
        }
        return Ok(_Result);
    }


    [HttpPost]
    public IActionResult Create(User Entity)
    {
        Console.WriteLine(Entity);
        Result _Result = new Result();
        try
        {
            using (MarketAlfaContext _DB = new MarketAlfaContext())
            {
                User _Entity = Entity;
                _Entity.Date = DateTime.Now;
                var NewPassword = Encrypt.Hash(Entity.Password);
                _Entity.Password = NewPassword.Password;
                _Entity.Salt = NewPassword.Salt;
                _DB.Users.Add(_Entity);
                _DB.SaveChanges();
                _Result.Success = 1;
                _Result.Message = "Registro Correcto";
            }
        }
        catch (Exception e)
        {
            _Result.Message = e.Message;
            Console.WriteLine(e);
        }
        return Ok(_Result);
    }

    [HttpGet]
    public async Task<IActionResult> Get()
    {
        Result _Result = new Result();
        try
        {
            using (MarketAlfaContext _DB = new MarketAlfaContext())
            {
                var _List = await _DB.Users.Where(x => x.Status == true && x.Privilege == false).ToListAsync();
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

    [HttpGet("pseudonym")]
    public async Task<IActionResult> GetPseudonym()
    {
        Result _Result = new Result();
        try
        {
            using (MarketAlfaContext _DB = new MarketAlfaContext())
            {
                var _List = await _DB.Users.Select(x => x.Pseudomyn).ToListAsync();
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

    [HttpGet("superuser")]
    public async Task<IActionResult> GetSuperUser()
    {
        Result _Result = new Result();
        try
        {
            using (MarketAlfaContext _DB = new MarketAlfaContext())
            {
                var _List = await _DB.Users.Select(x => x.Id).FirstOrDefaultAsync();
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

    [HttpGet("fulluser")]
    public async Task<IActionResult> GetFullUser()
    {
        Result _Result = new Result();
        try
        {
            using (MarketAlfaContext _DB = new MarketAlfaContext())
            {
                var _SuperUser = await _DB.Users.Select(x => x.Id).FirstOrDefaultAsync();
                var _List = await _DB.Users.Where(x => x.Status == true && x.Id != _SuperUser).ToListAsync();
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

    [HttpPut]
    public async Task<IActionResult> Update(InactiveElementVM Element)
    {
        Result _Result = new Result();
        try
        {
            using (MarketAlfaContext _DB = new MarketAlfaContext())
            {
                Console.WriteLine(Element.Id);
                Console.WriteLine(Element.Reason);
                Console.WriteLine(Element.User);
                var Entity = await _DB.Users.FindAsync(int.Parse(Element.Id));
                Entity.Status = false;
                _DB.Entry(Entity).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                await _DB.SaveChangesAsync();
                var Reason = new UserReason();
                Reason.Banned = int.Parse(Element.Id);
                Reason.Reason = Element.Reason;
                Reason.Date = DateTime.Now;
                Reason.UserX = Element.User;
                _DB.UserReasons.Add(Reason);
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


    [HttpDelete]
    public async Task<IActionResult> Delete(InactiveElementVM Element)
    {
        Result _Result = new Result();
        try
        {
            using (MarketAlfaContext _DB = new MarketAlfaContext())
            {
                var Entity = await _DB.Users.FindAsync(int.Parse(Element.Id));
                Entity.Status = false;
                _DB.Entry(Entity).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                await _DB.SaveChangesAsync();
                var Reason = new UserReason();
                // Reason.UserR = int.Parse(Element.Id);
                Reason.Reason = Element.Reason;
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
//dotnet aspnet-codegenerator controller -name TodoItemsController -async -api -m TodoItem -dc TodoContext -outDir Controllers