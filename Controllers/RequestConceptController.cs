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
    public class RequestConceptController : ControllerBase
    {
        private readonly MarketAlfaContext _context;

        public RequestConceptController(MarketAlfaContext context)
        {
            _context = context;
        }

        // GET: api/RequestConcept
        [HttpGet]
        public async Task<ActionResult> Get()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.ConceptRequests.Include(x => x.ProductNavigation).Select(x => new { Id = x.Id, Product = x.ProductNavigation.Name, Measure = x.ProductNavigation.DescriptionNavigation.Name, Amount = x.Amount }).ToListAsync();
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

        // GET: api/RequestConcept/5
        [HttpGet("{id}")]
        public async Task<ActionResult> Get(int id)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.ConceptRequests.Include(x => x.ProductNavigation).Where(x => x.Request == id).Select(x => new { Id = x.Id, Product = x.ProductNavigation.Name, Measure = x.ProductNavigation.DescriptionNavigation.Name, Amount = x.Amount }).ToListAsync();
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

        // PUT: api/RequestConcept/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutConceptRequest(long id, ConceptRequest conceptRequest)
        {
            if (id != conceptRequest.Id)
            {
                return BadRequest();
            }

            _context.Entry(conceptRequest).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ConceptRequestExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/RequestConcept
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<ConceptRequest>> PostConceptRequest(ConceptRequest conceptRequest)
        {
            _context.ConceptRequests.Add(conceptRequest);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetConceptRequest", new { id = conceptRequest.Id }, conceptRequest);
        }

        // DELETE: api/RequestConcept/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteConceptRequest(long id)
        {
            var conceptRequest = await _context.ConceptRequests.FindAsync(id);
            if (conceptRequest == null)
            {
                return NotFound();
            }

            _context.ConceptRequests.Remove(conceptRequest);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ConceptRequestExists(long id)
        {
            return _context.ConceptRequests.Any(e => e.Id == id);
        }
    }
}
