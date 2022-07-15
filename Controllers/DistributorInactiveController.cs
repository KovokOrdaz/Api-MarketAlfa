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
    public class DistributorInactiveController : ControllerBase
    {
        [HttpGet]
        public async Task<ActionResult> Get()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.DistributorReasons.Select(y => new { Id = y.Id, Name = y.DistributorNavigation.Name, Rif = y.DistributorNavigation.Rif, Ls = y.DistributorNavigation.LsNavigation.Name, Reason = y.Reason, Date = y.Date, User = y.UserXNavigation.Pseudomyn }).ToListAsync();
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
        public async Task<IActionResult> Delete(int id)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var Entity = await _DB.DistributorReasons.FindAsync(id);
                    var _Distributor = await _DB.Distributors.FindAsync(Entity.Distributor);
                    _Distributor.Status = true;
                    _DB.Entry(_Distributor).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
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
                Console.WriteLine(e.Message);
            }
            return Ok(_Result);
        }
    }
}
