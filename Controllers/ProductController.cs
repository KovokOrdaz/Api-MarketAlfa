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
    public class ProductController : ControllerBase
    {
        private readonly MarketAlfaContext _context;

        public ProductController(MarketAlfaContext context)
        {
            _context = context;
        }

        [HttpPost]
        public ActionResult Create(Product product)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    Product _Product = product;
                    _DB.Products.Add(_Product);
                    _DB.SaveChanges();
                    _Result.Success = 1;
                    _Result.Message = "Registro Correcto";
                    Inventory Concept = new Inventory();
                    Concept.Id = 0;
                    Concept.Product = _Product.Code;
                    Concept.Amount = 0;
                    Concept.Price = 0;
                    Concept.Low = 12;
                    Concept.Lock = 0;
                    _DB.Inventories.Add(Concept);
                    _DB.SaveChanges();
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                _Result.Message = e.Message;
            }
            return Ok(_Result);
        }

        // GET: api/Product
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Products.Where(x => x.Status == true).Select(x => new { Code = x.Code, Name = x.Name, Category = x.CategoryNavigation.Name, Description = x.DescriptionNavigation.Name, Acronym = x.DescriptionNavigation.Acronym, Complete = x.DescriptionNavigation.Complete, RegisteredBy = x.RegisteredByNavigation.Pseudomyn }).ToListAsync();
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

        [HttpGet("code")]
        public async Task<IActionResult> GetCode()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Products.Select(x => x.Code).ToListAsync();
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
        public async Task<IActionResult> GetName()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Products.Select(x => x.Name).ToListAsync();
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

        [HttpGet("{Code}")]
        public async Task<ActionResult<Product>> Get(string Code)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Products.Where(x => x.Status == false).Select(x => new { Code = x.Code, Name = x.Name, Category = x.CategoryNavigation.Name, Description = x.DescriptionNavigation.Name, Status = x.Status }).ToListAsync();
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

        [HttpGet("iscomplete/{Code}")]
        public async Task<ActionResult> GetIsComplete(string Code)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Products.Where(x => x.Code == Code).Select(x => new { x.DescriptionNavigation.Complete }).FirstOrDefaultAsync();
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

        [HttpGet("name/{Code}")]
        public async Task<ActionResult> GetName(string Code)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Products.Where(x => x.Code == Code).Select(x => x.Name).FirstOrDefaultAsync();
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

        [HttpGet("measure/{Code}")]
        public async Task<ActionResult> GetMeasure(string Code)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Products.Where(x => x.Code == Code).Select(x => x.DescriptionNavigation.Name).FirstOrDefaultAsync();
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
        public IActionResult Update(Product _Entity)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    Product Entity = _DB.Products.Find(_Entity.Code);
                    Entity.Name = _Entity.Name;
                    Entity.Description = _Entity.Description;
                    Entity.Category = _Entity.Category;
                    _DB.Entry(Entity).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                    _DB.SaveChanges();
                    _Result.Success = 1;
                    _Result.Message = "Actualización Correcta";
                }
            }
            catch (Exception e)
            {
                _Result.Message = e.Message;
                Console.WriteLine(e);
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
                    var Entity = _DB.Products.Find(Element.Id);
                    Entity.Status = false;
                    _DB.Entry(Entity).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                    _DB.SaveChanges();
                    var Reason = new ProductReason();
                    Reason.Product = Element.Id;
                    Reason.Reason = Element.Reason;
                    Reason.Date = DateTime.Now;
                    Reason.UserX = int.Parse(Element.User);
                    _DB.ProductReasons.Add(Reason);
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

        // DELETE: api/Product/5
        // [HttpDelete("{Code}")]
        // public async Task<IActionResult> Delete(string Code)
        // {
        //     Result _Result = new Result();
        //     try
        //     {
        //         using (MarketAlfaContext _DB = new MarketAlfaContext())
        //         {
        //             Product Entity = await _DB.Products.FindAsync(Code);
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
