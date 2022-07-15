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
    [ApiController]
    [Route("[controller]")]
    public class ClientController : ControllerBase
    {
        private readonly MarketAlfaContext _context;

        public ClientController(MarketAlfaContext context)
        {
            _context = context;
        }

        [HttpPost]
        public async Task<ActionResult> Create(Client _Entity)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    _Entity.Date = DateTime.Now;
                    _Entity.Status = true;
                    _DB.Clients.Add(_Entity);
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

        // GET: api/Client
        [HttpGet]
        public async Task<ActionResult> Get()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Clients.Where(x => x.Status == true).Select(y => new { Name = y.Name, NationalityName = y.NationalityNavigation.Name, Dni = y.Dni, User = y.UserRegisterNavigation.Name, Date = y.Date, Nationality = y.Nationality, Phone = y.Phone, Direction = y.Direction }).OrderByDescending(y => y.Date).ToListAsync();
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

        [HttpGet("dni")]
        public async Task<IActionResult> GetDni()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Clients.Select(x => x.Dni).ToListAsync();
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

        // GET: api/Client/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Client>> GetClient(int id)
        {
            var client = await _context.Clients.FindAsync(id);

            if (client == null)
            {
                return NotFound();
            }

            return client;
        }

        [HttpPut]
        public IActionResult Update(Client _Entity)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    Client Entity = _DB.Clients.Find(_Entity.Dni);
                    Entity.Name = _Entity.Name;
                    Entity.Nationality = _Entity.Nationality;
                    Entity.Phone = _Entity.Phone;
                    Entity.Direction = _Entity.Direction;
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

        // POST: api/Client
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754


        // DELETE: api/Client/5
        [HttpDelete("{ID}")]
        public async Task<IActionResult> Delete(string ID)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    Client Entity = await _DB.Clients.FindAsync(ID);
                    Entity.Status = false;
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

        // private bool ClientExists(int id)
        // {
        //     return _context.Clients.Any(e => e.Id == id);
        // }
    }
}
