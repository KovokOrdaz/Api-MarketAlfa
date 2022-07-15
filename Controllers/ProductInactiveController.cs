using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MarketAlfa.Models;
using MarketAlfa.Models.Response;

namespace MarketAlfa.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class ProductInactiveController : ControllerBase
    {
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.ProductReasons.Select(y => new { Id = y.Id, Name = y.ProductNavigation.Name, Code = y.ProductNavigation.Code, Reason = y.Reason, Date = y.Date, User = y.UserXNavigation.Pseudomyn }).ToListAsync();
                    //var _List = await _DB.Products.Where(x => x.Status == false).Select(x => new { Code = x.Code, Name = x.Name, Category = x.CategoryNavigation.Name, Description = x.DescriptionNavigation.Name }).ToListAsync();
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

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var Entity = _DB.ProductReasons.Find(id);
                    var _Product = _DB.Products.Find(Entity.Product);
                    _Product.Status = true;
                    _DB.Entry(_Product).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                    _DB.SaveChanges();
                    _DB.Remove(Entity);
                    _DB.SaveChanges();
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
}
