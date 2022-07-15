using Microsoft.AspNetCore.Mvc;
using MarketAlfa.Models;
using MarketAlfa.Models.Response;
using Microsoft.EntityFrameworkCore;
using MarketAlfa.Models.ViewModels;
using Microsoft.AspNetCore.Authorization;

namespace MarketAlfa.Controllers;

[ApiController]
[Route("[controller]")]
[Authorize]
public class AcademicController : ControllerBase
{
    public AcademicController() { }

    [HttpGet]
    public IActionResult Get()
    {
        Result _Result = new Result();
        try
        {
            using (MarketAlfaContext _DB = new MarketAlfaContext())
            {
                var _List = _DB.Academics.ToList();
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

    [HttpPost]
    public IActionResult Create(AcademicVM _Entity)
    {
        Result _Result = new Result();
        try
        {
            using (MarketAlfaContext _DB = new MarketAlfaContext())
            {
                Academic Entity = new Academic();
                Entity.Employee = _Entity.Employee;
                Entity.Grade = _Entity.Grade;
                Entity.Title = _Entity.Title;
                Entity.Id = _Entity.Id;
                _DB.Academics.Add(Entity);
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
    public IActionResult Update(AcademicVM _Entity)
    {
        Result _Result = new Result();
        try
        {
            using (MarketAlfaContext _DB = new MarketAlfaContext())
            {
                Academic Entity = _DB.Academics.Find(_Entity.Id);
                Entity.Employee = _Entity.Employee;
                Entity.Grade = _Entity.Grade;
                Entity.Title = _Entity.Title;
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

    [HttpDelete("{ID}")]
    public IActionResult Delete(int ID)
    {
        Result _Result = new Result();
        try
        {
            using (MarketAlfaContext _DB = new MarketAlfaContext())
            {
                Academic Entity = _DB.Academics.Find(ID);
                _DB.Remove(Entity);
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
//dotnet aspnet-codegenerator controller -name TodoItemsController -async -api -m TodoItem -dc TodoContext -outDir Controllers