using Microsoft.AspNetCore.Mvc;
using MarketAlfa.Models;
using MarketAlfa.Models.Response;
using Microsoft.EntityFrameworkCore;
using MarketAlfa.Models.ViewModels;
using MarketAlfa.Services;

namespace MarketAlfa.Controllers;

[ApiController]
[Route("[controller]")]
public class QuestionController : ControllerBase
{
    [HttpPut]
    public IActionResult Update(User _Entity)
    {
        Result _Result = new Result();
        try
        {
            using (MarketAlfaContext _DB = new MarketAlfaContext())
            {
                var Entity = _DB.Users.Find(_Entity.Id);
                Entity.Question = _Entity.Question;
                Entity.Answer = _Entity.Answer;
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