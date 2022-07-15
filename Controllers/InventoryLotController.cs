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
    public class InventoryLotController : ControllerBase
    {
        public InventoryLotController()
        {
        }

        [HttpGet]
        public async Task<ActionResult> Get()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.InventoryLots.Where(x => x.Status == true && x.Amount > x.Sold).Select(y => new { Id = y.Id, Lot = y.Lot, Date = y.LotNavigation.Receive, Code = y.ProductNavigation.Code, Name = y.ProductNavigation.Name, Category = y.ProductNavigation.CategoryNavigation.Name, Amount = (y.Amount.ToString("0.##") + " " + y.ProductNavigation.DescriptionNavigation.Acronym), Sold = (y.Sold.ToString("0.##") + " " + y.ProductNavigation.DescriptionNavigation.Acronym), RegisteredBy = y.RegisteredByNavigation.Pseudomyn, Expiration = y.Expiration }).OrderByDescending(y => y.Id).ToListAsync();
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

        [HttpGet("empty")]
        public async Task<ActionResult> GetEmpty()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.InventoryLots.Where(x => x.Status == true && x.Amount > x.Sold && x.Expiration < DateTime.Now).Select(y => new { Id = y.Id, Lot = y.Lot, Date = y.LotNavigation.Receive, Code = y.ProductNavigation.Code, Name = y.ProductNavigation.Name, Category = y.ProductNavigation.CategoryNavigation.Name, Amount = (y.Amount.ToString("0.##") + " " + y.ProductNavigation.DescriptionNavigation.Acronym), Sold = (y.Sold.ToString("0.##") + " " + y.ProductNavigation.DescriptionNavigation.Acronym), RegisteredBy = y.RegisteredByNavigation.Pseudomyn, Expiration = y.Expiration }).OrderByDescending(y => y.Id).ToListAsync();
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


        [HttpGet("low")]
        public async Task<ActionResult> GetLow()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.InventoryLots.Where(x => x.Status == true && x.Amount > x.Sold && x.Expiration > DateTime.Now && x.Expiration < DateTime.Now.AddDays(7)).Select(y => new { Id = y.Id, Lot = y.Lot, Date = y.LotNavigation.Receive, Code = y.ProductNavigation.Code, Name = y.ProductNavigation.Name, Category = y.ProductNavigation.CategoryNavigation.Name, Amount = (y.Amount.ToString("0.##") + " " + y.ProductNavigation.DescriptionNavigation.Acronym), Sold = (y.Sold.ToString("0.##") + " " + y.ProductNavigation.DescriptionNavigation.Acronym), RegisteredBy = y.RegisteredByNavigation.Pseudomyn, Expiration = y.Expiration }).OrderByDescending(y => y.Id).ToListAsync();
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
        [HttpGet("inactive")]
        public async Task<ActionResult> GetInactive()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.InventoryLots.Where(x => x.Status == false && x.Expiration < DateTime.Now).Select(y => new { Id = y.Id, Lot = y.Lot, Date = y.LotNavigation.Receive, Code = y.ProductNavigation.Code, Name = y.ProductNavigation.Name, Category = y.ProductNavigation.CategoryNavigation.Name, Amount = (y.Amount.ToString("0.##") + " " + y.ProductNavigation.DescriptionNavigation.Acronym), Sold = (y.Sold.ToString("0.##") + " " + y.ProductNavigation.DescriptionNavigation.Acronym), RegisteredBy = y.RegisteredByNavigation.Pseudomyn, Expiration = y.Expiration }).OrderByDescending(y => y.Id).ToListAsync();
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

        [HttpGet("available")]
        public async Task<ActionResult> GetAvailable()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.InventoryLots.Where(x => x.Amount > x.Sold && x.Status == true).Select(y => new { Id = y.Id, Lot = y.Lot, Date = y.LotNavigation.Receive, Code = y.ProductNavigation.Code, Name = y.ProductNavigation.Name, Category = y.ProductNavigation.CategoryNavigation.Name, Amount = (y.Amount.ToString("0.##") + " " + y.ProductNavigation.DescriptionNavigation.Acronym), Sold = (y.Sold.ToString("0.##") + " " + y.ProductNavigation.DescriptionNavigation.Acronym), RegisteredBy = y.RegisteredByNavigation.Pseudomyn, Expiration = y.Expiration }).OrderByDescending(y => y.Id).ToListAsync();
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

        [HttpGet("reason")]
        public async Task<ActionResult> GetReason()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.InventoryLotReasons.Select(y => new { Id = y.Id, Date = y.Date, Reason = y.Reason, User = y.UserXNavigation.Pseudomyn, Lot = y.Lot, IdProduct = y.LotNavigation.Product, Code = y.LotNavigation.ProductNavigation.Code, Name = y.LotNavigation.ProductNavigation.Name, Category = y.LotNavigation.ProductNavigation.CategoryNavigation.Name, Amount = (y.LotNavigation.Amount.ToString("0.##") + " " + y.LotNavigation.ProductNavigation.DescriptionNavigation.Acronym), Sold = (y.LotNavigation.Sold.ToString("0.##") + " " + y.LotNavigation.ProductNavigation.DescriptionNavigation.Acronym), RegisteredBy = y.LotNavigation.RegisteredByNavigation.Pseudomyn, Expiration = y.LotNavigation.Expiration }).OrderByDescending(x => x.Id).ToListAsync();
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

        [HttpGet("productreason")]
        public async Task<ActionResult> GetProductReason()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.InventoryProductReasons.Select(y => new { Id = y.Id, Date = y.Date, Reason = y.Reason, User = y.RegisterByNavigation.Pseudomyn, Lot = y.Lot, Code = y.ProductNavigation.Code, Name = y.ProductNavigation.Name, Category = y.ProductNavigation.CategoryNavigation.Name, Amount = (y.Amount.ToString("0.##") + " " + y.ProductNavigation.DescriptionNavigation.Acronym) }).OrderByDescending(x => x.Id).ToListAsync();
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

        [HttpPut]
        public IActionResult DeleteLot(InactiveElementVM Element)
        {
            Result _Result = new Result();
            using (MarketAlfaContext _DB = new MarketAlfaContext())
            {
                using (var _Transaction = _DB.Database.BeginTransaction())
                {
                    try
                    {
                        var Entity = _DB.InventoryLots.Find(int.Parse(Element.Id));
                        Entity.Status = false;
                        _DB.Entry(Entity).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                        _DB.SaveChanges();
                        var Reason = new InventoryLotReason();
                        Reason.Lot = int.Parse(Element.Id);
                        Reason.Reason = Element.Reason;
                        Reason.Date = DateTime.Now;
                        Reason.UserX = int.Parse(Element.User);
                        _DB.InventoryLotReasons.Add(Reason);
                        _DB.SaveChanges();
                        var Inventory = _DB.Inventories.Where(x => x.Product == Entity.Product).FirstOrDefault();
                        Inventory.Amount = Inventory.Amount - (Entity.Amount - Entity.Sold);
                        _DB.SaveChanges();
                        _Result.Success = 1;
                        _Result.Message = "Actualización Correcta";
                        _Transaction.Commit();
                    }
                    catch (Exception e)
                    {
                        _Result.Message = e.Message;
                        Console.WriteLine(e.Message);
                        _Transaction.Rollback();
                    }
                }
            }
            return Ok(_Result);
        }

        [HttpPut("deleteproduct")]
        public IActionResult DeleteProduct(InventoryProductReason _Element)
        {
            Result _Result = new Result();
            using (MarketAlfaContext _DB = new MarketAlfaContext())
            {
                using (var _Transaction = _DB.Database.BeginTransaction())
                {
                    try
                    {
                        _Element.Date = DateTime.Now;
                        _DB.InventoryProductReasons.Add(_Element);
                        _DB.SaveChanges();
                        var Inventory = _DB.Inventories.Where(x => x.Product == _Element.Product).FirstOrDefault();
                        Inventory.Amount = Inventory.Amount - _Element.Amount;
                        _DB.Entry(Inventory).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                        _DB.SaveChanges();
                        var Lot = _DB.InventoryLots.Where(x => x.Lot == _Element.Lot && x.Product == _Element.Product).FirstOrDefault();
                        if ((Lot.Amount - Lot.Sold) > _Element.Amount)
                        {
                            Lot.Amount = Lot.Amount - _Element.Amount;
                            _DB.Entry(Lot).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                            _DB.SaveChanges();
                            _Result.Message = "Consulta Correcto";
                            _Transaction.Commit();
                        }
                        else
                        {
                            Console.WriteLine("Cantidad Mayor a la Existencia");
                            _Result.Message = "Cantidad Mayor a la Existencia";
                            _Transaction.Rollback();
                        }
                        _Result.Success = 1;
                        _Result.Data = null;
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

        [HttpDelete("{ID}")]
        public async Task<IActionResult> Delete(int ID)
        {
            Result _Result = new Result();
            using (MarketAlfaContext _DB = new MarketAlfaContext())
            {
                using (var _Transaction = _DB.Database.BeginTransaction())
                {
                    try
                    {
                        var Entity = await _DB.InventoryLots.FindAsync(ID);
                        Entity.Status = false;
                        _DB.Entry(Entity).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                        await _DB.SaveChangesAsync();
                        var Inventory = _DB.Inventories.Where(x => x.Product == Entity.Product).FirstOrDefault();
                        Inventory.Amount = Inventory.Amount - (Entity.Amount - Entity.Sold);
                        await _DB.SaveChangesAsync();
                        _Result.Success = 1;
                        _Result.Message = "Actualización Correcta";
                        _Transaction.Commit();
                    }
                    catch (Exception e)
                    {
                        _Result.Message = e.Message;
                        Console.WriteLine(e.Message);
                        _Transaction.Rollback();
                    }
                    return Ok(_Result);
                }
            }
        }

        [HttpGet("lotproduct/{ID}")]
        public async Task<ActionResult> GetLotProduct(string ID)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.InventoryLots.Where(x => x.Status == true && x.Amount > x.Sold && x.Expiration > DateTime.Now && x.Product == ID).Select(y => new { Id = y.Id, Lot = y.Lot, Date = y.LotNavigation.Receive, Code = y.ProductNavigation.Code, Name = y.ProductNavigation.Name, Category = y.ProductNavigation.CategoryNavigation.Name, Amount = y.Amount, Measure = y.ProductNavigation.DescriptionNavigation.Name, Sold = y.Sold, RegisteredBy = y.RegisteredByNavigation.Pseudomyn, Expiration = y.Expiration }).OrderByDescending(y => y.Id).ToListAsync();
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

        [HttpGet("lotproduct")]
        public async Task<ActionResult> GetLotProductAll()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.InventoryLots.Where(x => x.Status == true && x.Amount > x.Sold && x.Expiration > DateTime.Now).Select(y => new { Id = y.Id, Lot = y.Lot, Date = y.LotNavigation.Receive, Code = y.ProductNavigation.Code, Name = y.ProductNavigation.Name, Category = y.ProductNavigation.CategoryNavigation.Name, Amount = y.Amount, Measure = y.ProductNavigation.DescriptionNavigation.Name, Sold = y.Sold, RegisteredBy = y.RegisteredByNavigation.Pseudomyn, Expiration = y.Expiration }).OrderByDescending(y => y.Id).ToListAsync();
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

    }
}
