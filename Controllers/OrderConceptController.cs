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
    public class OrderConceptController : ControllerBase
    {
        private readonly MarketAlfaContext _context;

        public OrderConceptController(MarketAlfaContext context)
        {
            _context = context;
        }

        // GET: api/OrderConcept
        [HttpGet]
        public async Task<ActionResult> GetConceptOrders()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.ConceptOrders.Include(x => x.ProductNavigation).Select(x => new { Id = x.Id, Product = x.ProductNavigation.Name, Measure = x.ProductNavigation.DescriptionNavigation.Name, Amount = x.Amount }).ToListAsync();
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



        // GET: api/OrderConcept/5
        [HttpGet("{id}")]
        public async Task<ActionResult> Get(int id)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.ConceptOrders.Include(x => x.ProductNavigation).Where(x => x.OrderD == id).Select(x => new { Id = x.Id, Product = x.ProductNavigation.Name, Measure = x.ProductNavigation.DescriptionNavigation.Name, Amount = x.Amount }).ToListAsync();
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

        // POST: api/OrderConcept
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754

        [HttpPost]
        public ActionResult Create(ConceptOrder Entity)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    _DB.ConceptOrders.Add(Entity);
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

        // DELETE: api/OrderConcept/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var conceptOrder = await _context.ConceptOrders.FindAsync(id);
                    if (conceptOrder == null)
                    {
                        return NotFound();
                    }
                    _DB.ConceptOrders.Remove(conceptOrder);
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

        private bool ConceptOrderExists(int id)
        {
            return _context.ConceptOrders.Any(e => e.Id == id);
        }
    }
}
