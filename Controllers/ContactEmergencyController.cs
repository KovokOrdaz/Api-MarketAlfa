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
    public class ContactEmergencyController : ControllerBase
    {
        private readonly MarketAlfaContext _context;

        public ContactEmergencyController(MarketAlfaContext context)
        {
            _context = context;
        }

        // GET: api/ContactEmergency
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.ContactEmergencies.ToListAsync();
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
        public IActionResult Create(ContactEmergencyVM _Entity)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    ContactEmergency Entity = new ContactEmergency();
                    Entity.Employee = _Entity.Employee;
                    Entity.Name = _Entity.Name;
                    Entity.Format = _Entity.Format;
                    Entity.Container = _Entity.Container;
                    Entity.Parent = _Entity.Parent;
                    Entity.Id = _Entity.Id;
                    _DB.ContactEmergencies.Add(Entity);
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
        public IActionResult Update(ContactEmergencyVM _Entity)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    ContactEmergency Entity = _DB.ContactEmergencies.Find(_Entity.Id);
                    Entity.Employee = _Entity.Employee;
                    Entity.Name = _Entity.Name;
                    Entity.Format = _Entity.Format;
                    Entity.Container = _Entity.Container;
                    Entity.Parent = _Entity.Parent;
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
                    ContactEmergency Entity = _DB.ContactEmergencies.Find(ID);
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
}
