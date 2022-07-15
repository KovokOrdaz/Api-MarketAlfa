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
    public class MeasureController : ControllerBase
    {

        public MeasureController()
        {
        }

        // GET: api/Measure
        [HttpGet]
        public async Task<ActionResult> Get()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Measures.ToListAsync();
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
                    var _List = await _DB.Measures.Select(x => x.Name).ToListAsync();
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

        [HttpGet("acro")]
        public async Task<ActionResult> GetAcro()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Measures.Select(x => x.Acronym).ToListAsync();
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

        [HttpGet("active")]
        public async Task<ActionResult> GetActive()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Measures.Where(x => x.Status == true).ToListAsync();
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
        public ActionResult Create(Measure _Entity)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    _DB.Measures.Add(_Entity);
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

        [HttpDelete("{ID}")]
        public async Task<IActionResult> Delete(int ID)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var Entity = await _DB.Measures.FindAsync(ID);
                    Entity.Status = !Entity.Status;
                    _DB.Entry(Entity).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                    await _DB.SaveChangesAsync();
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

        [HttpPut]
        public IActionResult Update(Measure _Entity)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var Entity = _DB.Measures.Find(_Entity.Id);
                    Entity.Name = _Entity.Name;
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
}
