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
using MarketAlfa.Models.NotKey;

namespace MarketAlfa.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class InventoryController : ControllerBase
    {
        private readonly MarketAlfaContext _context;

        public InventoryController(MarketAlfaContext context)
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
                    var _Business = await _DB.Businesses.FirstOrDefaultAsync();
                    var _List = await _DB.Inventories.Where(x => x.Amount > 0 && x.ProductNavigation.Status == true).Select(y => new { Id = y.Id, IdProduct = y.Product, Code = y.ProductNavigation.Code, Name = y.ProductNavigation.Name, Category = y.ProductNavigation.CategoryNavigation.Name, Amount = (y.Amount.ToString("0.##") + " " + y.ProductNavigation.DescriptionNavigation.Acronym), Low = (y.Low.ToString("0.##") + " " + y.ProductNavigation.DescriptionNavigation.Acronym), Lock = (y.Lock.ToString("0.##") + " " + y.ProductNavigation.DescriptionNavigation.Acronym), Price = (y.Price.ToString("0.##") + " " + _Business.Acronym), Measure = y.ProductNavigation.DescriptionNavigation.Name, Money = y.Price, AmountX = y.Amount }).ToListAsync();
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

        [HttpGet("inventorycategory")]
        public async Task<ActionResult> GetReportCategory()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Set<ReportInventoryCategory>().ToListAsync();
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

        [HttpGet("inventorymeasure")]
        public async Task<ActionResult> GetReportMeasure()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Set<ReportInventoryMeasure>().ToListAsync();
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

        [HttpGet("select")]
        public async Task<ActionResult> select()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Inventories.Select(y => new { Id = y.Id, Code = y.ProductNavigation.Code, Name = y.ProductNavigation.Name }).ToListAsync();
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

        [HttpGet("entry")]
        public async Task<ActionResult> entry()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _Business = await _DB.Businesses.FirstOrDefaultAsync();
                    var _List = await _DB.EntryInventaries.Select(y => new { Id = y.Id, Name = y.ProductNavigation.Name, Amount = (y.Amount.ToString("0.##") + " " + y.ProductNavigation.DescriptionNavigation.Acronym), Price = (y.Price.ToString("0.##") + " " + _Business.Acronym), Date = y.Date }).OrderByDescending(y => y.Date).ToListAsync();
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
        public ActionResult create(EntryInventary _Entity)
        {
            Result _Result = new Result();
            using (MarketAlfaContext _DB = new MarketAlfaContext())
            {
                using (var _Transaction = _DB.Database.BeginTransaction())
                {
                    try
                    {
                        _Entity.Date = DateTime.Now;
                        _DB.EntryInventaries.Add(_Entity);
                        _DB.SaveChanges();
                        var Inventory = _DB.Inventories.Where(x => x.Product == _Entity.Product).FirstOrDefault();
                        Inventory.Amount = Inventory.Amount + _Entity.Amount;
                        var NewPrice = _Entity.Price + (_Entity.Price * 0.3m);
                        if (NewPrice > Inventory.Price)
                        {
                            Inventory.Price = NewPrice;
                        }
                        _DB.Entry(Inventory).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                        _DB.SaveChanges();
                        var LotCode = _DB.InventoryLots.OrderByDescending(x => x.Id).FirstOrDefault();
                        var Lot = new InventoryLot();
                        Lot.Product = _Entity.Product;
                        Lot.Amount = _Entity.Amount;
                        Lot.Sold = 0;
                        Lot.Expiration = _Entity.Expiration;
                        Lot.Status = true;
                        Lot.Lot = LotCode.Lot;
                        Lot.RegisteredBy = _Entity.RegisteredBy;
                        _DB.InventoryLots.Add(Lot);
                        _DB.SaveChanges();
                        _Result.Success = 1;
                        _Result.Message = "Consulta Correcto";
                        _Result.Data = null;
                        _Transaction.Commit();
                    }
                    catch (Exception e)
                    {
                        _Transaction.Rollback();
                        _Result.Message = e.Message;
                        Console.WriteLine(e.Message);
                    }
                }
            }
            return Ok(_Result);
        }


        [HttpPost("alert")]
        public ActionResult ChangeAlert(AlertVM _Entity)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var Entity = _DB.Inventories.Find(_Entity.Id);
                    Entity.Lock = _Entity.Lock;
                    Entity.Low = _Entity.Low;
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

        [HttpPost("price")]
        public ActionResult ChangePrice(PriceVM _Entity)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var Entity = _DB.Inventories.Find(_Entity.Id);
                    Entity.Price = _Entity.Money;
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

        [HttpGet("low")]
        public async Task<ActionResult> GetLow()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Inventories.Where(y => y.Amount < y.Low).Select(y => new { Code = y.ProductNavigation.Code, Name = y.ProductNavigation.Name, Category = y.ProductNavigation.CategoryNavigation.Name, Measure = y.ProductNavigation.DescriptionNavigation.Name, Amount = y.Amount }).ToListAsync();
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

        // GET: api/Inventory/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Inventory>> GetInventory(int id)
        {
            var inventory = await _context.Inventories.FindAsync(id);

            if (inventory == null)
            {
                return NotFound();
            }

            return inventory;
        }

        // PUT: api/Inventory/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutInventory(int id, Inventory inventory)
        {
            if (id != inventory.Id)
            {
                return BadRequest();
            }

            _context.Entry(inventory).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!InventoryExists(id))
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

        // DELETE: api/Inventory/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteInventory(int id)
        {
            var inventory = await _context.Inventories.FindAsync(id);
            if (inventory == null)
            {
                return NotFound();
            }

            _context.Inventories.Remove(inventory);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool InventoryExists(int id)
        {
            return _context.Inventories.Any(e => e.Id == id);
        }
    }
}
