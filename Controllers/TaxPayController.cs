using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MarketAlfa.Models;

namespace MarketAlfa.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class TaxPayController : ControllerBase
    {
        private readonly MarketAlfaContext _context;

        public TaxPayController(MarketAlfaContext context)
        {
            _context = context;
        }

        // GET: api/TaxPay
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TaxPay>>> GetTaxPays()
        {
            return await _context.TaxPays.ToListAsync();
        }

        // GET: api/TaxPay/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TaxPay>> GetTaxPay(int id)
        {
            var taxPay = await _context.TaxPays.FindAsync(id);

            if (taxPay == null)
            {
                return NotFound();
            }

            return taxPay;
        }

        // PUT: api/TaxPay/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTaxPay(int id, TaxPay taxPay)
        {
            if (id != taxPay.Id)
            {
                return BadRequest();
            }

            _context.Entry(taxPay).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TaxPayExists(id))
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

        // POST: api/TaxPay
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TaxPay>> PostTaxPay(TaxPay taxPay)
        {
            _context.TaxPays.Add(taxPay);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetTaxPay", new { id = taxPay.Id }, taxPay);
        }

        // DELETE: api/TaxPay/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTaxPay(int id)
        {
            var taxPay = await _context.TaxPays.FindAsync(id);
            if (taxPay == null)
            {
                return NotFound();
            }

            _context.TaxPays.Remove(taxPay);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TaxPayExists(int id)
        {
            return _context.TaxPays.Any(e => e.Id == id);
        }
    }
}
