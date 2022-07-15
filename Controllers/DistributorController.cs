using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MarketAlfa.Models;
using MarketAlfa.Models.Response;
using MarketAlfa.Models.ViewModels;

namespace MarketAlfa.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class DistributorController : ControllerBase
    {
        private readonly MarketAlfaContext _context;

        public DistributorController(MarketAlfaContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult> Get()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Distributors.Where(x => x.Status == true).Select(y => new { Name = y.Name, Rif = y.Rif, Ls = y.LsNavigation.Name, RegisteredBy = y.RegisteredByNavigation.Pseudomyn }).ToListAsync();
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

        [HttpGet("name")]
        public async Task<ActionResult> GetName()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Distributors.Select(y => y.Name).ToListAsync();
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

        [HttpGet("rif")]
        public async Task<ActionResult> GetRif()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Distributors.Select(y => y.Rif).ToListAsync();
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

        [HttpGet("speed")]
        public async Task<ActionResult> GetSpeed()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Distributors.Where(x => x.Status == true && x.CountD > 1).Select(y => new { Id = y.Rif, Name = y.Name, Ls = y.LsNavigation.Name, SpeedCount = (y.Speed / y.CountD) }).Take(3).OrderByDescending(x => x.SpeedCount).ToListAsync();
                    _Result.Success = 1;
                    _Result.Message = "Consulta Correcto";
                    _Result.Data = _List;
                }
            }
            catch (Exception e)
            {
                _Result.Message = e.Message;
                Console.WriteLine(e.Message);
            }
            return Ok(_Result);
        }

        [HttpGet("respet")]
        public async Task<ActionResult> GetRespet()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Distributors.Where(x => x.Status == true && x.CountD > 1).Select(y => new { Id = y.Rif, Name = y.Name, Ls = y.LsNavigation.Name, RespetCount = (y.Respet / y.CountD) }).Take(3).OrderByDescending(x => x.RespetCount).ToListAsync();
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

        [HttpGet("ultimate")]
        public async Task<ActionResult> GetUltimate()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Requests.Select(y => new { ID = y.DistributorNavigation.Rif, Name = y.DistributorNavigation.Name, Date = y.Receive }).OrderByDescending(x => x.Date).FirstOrDefaultAsync();
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

        [HttpGet("ultimate/{ID}")]
        public async Task<ActionResult> GetUltimate(int ID)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Requests.Select(y => new { ID = y.DistributorNavigation.Rif, Name = y.DistributorNavigation.Name, Date = y.Receive }).OrderByDescending(x => x.Date).FirstOrDefaultAsync();
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


        [HttpGet("common")]
        public async Task<ActionResult> GetCommon()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Distributors.Where(x => x.Status == true).OrderByDescending(x => x.CountD).Take(3).ToListAsync();
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

        [HttpGet("speed/{ID}")]
        public async Task<ActionResult> GetSpeed(string ID)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.ConceptRequests.Where(x => x.Product == ID && x.RequestNavigation.DistributorNavigation.Status == true).Select(x => new { ID = x.RequestNavigation.Distributor, Name = x.RequestNavigation.DistributorNavigation.Name, SpeedCount = (x.RequestNavigation.DistributorNavigation.Speed / x.RequestNavigation.DistributorNavigation.CountD) }).Take(1).OrderByDescending(x => x.SpeedCount).ToListAsync();
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

        [HttpGet("respet/{ID}")]
        public async Task<ActionResult> GetRespet(string ID)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.ConceptRequests.Where(x => x.Product == ID && x.RequestNavigation.DistributorNavigation.Status == true).Select(x => new { ID = x.RequestNavigation.Distributor, Name = x.RequestNavigation.DistributorNavigation.Name, SpeedCount = (x.RequestNavigation.DistributorNavigation.Respet / x.RequestNavigation.DistributorNavigation.CountD) }).Take(1).OrderByDescending(x => x.SpeedCount).ToListAsync();
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
        public async Task<ActionResult> Create(Distributor _Entity)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    _Entity.Status = true;
                    _DB.Distributors.Add(_Entity);
                    await _DB.SaveChangesAsync();
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
        public IActionResult Update(Distributor _Entity)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var Entity = _DB.Distributors.Find(_Entity.Rif);
                    Entity.Name = _Entity.Name;
                    Entity.Ls = _Entity.Ls;
                    _DB.Entry(Entity).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
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

        [HttpPut("delete")]
        public IActionResult Delete(InactiveElementVM Element)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var Entity = _DB.Distributors.Find(Element.Id);
                    Entity.Status = false;
                    _DB.Entry(Entity).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                    _DB.SaveChanges();
                    var Reason = new DistributorReason();
                    Reason.Distributor = Element.Id;
                    Reason.Reason = Element.Reason;
                    Reason.Date = DateTime.Now;
                    Reason.UserX = int.Parse(Element.User);
                    _DB.DistributorReasons.Add(Reason);
                    _DB.SaveChanges();
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

        // [HttpDelete("{RIF}")]
        // public async Task<IActionResult> Delete(string RIF)
        // {
        //     Result _Result = new Result();
        //     try
        //     {
        //         using (MarketAlfaContext _DB = new MarketAlfaContext())
        //         {
        //             var Entity = await _DB.Distributors.FindAsync(RIF);
        //             Entity.Status = false;
        //             _DB.Entry(Entity).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
        //             await _DB.SaveChangesAsync();
        //             _Result.Success = 1;
        //             _Result.Message = "Actualizacion Correcta";
        //         }
        //     }
        //     catch (Exception e)
        //     {
        //         _Result.Message = e.Message;
        //     }
        //     return Ok(_Result);
        // }
    }
}
