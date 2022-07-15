using Microsoft.AspNetCore.Mvc;
using MarketAlfa.Models;
using MarketAlfa.Models.Response;
using Microsoft.EntityFrameworkCore;
using MarketAlfa.Models.ViewModels;

namespace MarketAPI.Controllers;

[ApiController]
[Route("[controller]")]
public class BusinessController : ControllerBase
{
    public BusinessController() { }

    [HttpGet]
    public async Task<IActionResult> Get()
    {
        Result _Result = new Result();
        try
        {
            using (MarketAlfaContext _DB = new MarketAlfaContext())
            {
                var _List = await _DB.Businesses.FirstOrDefaultAsync();
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

    [HttpGet("exist")]
    public IActionResult Exist()
    {
        Result _Result = new Result();
        try
        {
            using (MarketAlfaContext _DB = new MarketAlfaContext())
            {
                Business _Entity = _DB.Businesses.ToList().FirstOrDefault();
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
    public IActionResult Create(Business _Entity)
    {
        Result _Result = new Result();
        try
        {
            using (MarketAlfaContext _DB = new MarketAlfaContext())
            {
                _DB.Businesses.Add(_Entity);
                _DB.SaveChanges();
                _Result.Success = 1;
                _Result.Message = "Registro Correcto";
            }
        }
        catch (Exception e)
        {
            _Result.Message = e.Message;
        }
        return Ok(_Result);
    }

    [HttpPut]
    public IActionResult Update(Business _Entity)
    {
        Result _Result = new Result();
        try
        {
            using (MarketAlfaContext _DB = new MarketAlfaContext())
            {
                Business Entity = _DB.Businesses.Find(_Entity.Id);
                Entity.Name = _Entity.Name;
                Entity.Phone = _Entity.Phone;
                Entity.Direction = _Entity.Direction;
                Entity.Mail = _Entity.Mail;
                Entity.Rif = _Entity.Rif;
                Entity.Ls = _Entity.Ls;
                Entity.Coin = _Entity.Coin;
                Entity.Acronym = _Entity.Acronym;
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