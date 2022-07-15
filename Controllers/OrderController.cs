using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MarketAlfa.Models;
using Microsoft.AspNetCore.Authorization;
using MarketAlfa.Models.ViewModels;
using MarketAlfa.Models.Response;
using MarketAlfa.Services;

namespace MarketAlfa.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class OrderController : ControllerBase
    {
        private readonly MarketAlfaContext _context;
        private IOrderService _Service;
        public OrderController(MarketAlfaContext context, IOrderService Service)
        {
            _Service = Service;
            _context = context;
        }

        [HttpPost]
        public IActionResult Create(OrderVM _Entity)
        {
            Result _Result = new Result
            {

                Success = 0,
                Data = null
            };
            try
            {
                _Service.Create(_Entity);
                _Result.Success = 1;
                _Result.Message = "Registro Correcto";
            }
            catch (Exception e)
            {
                _Result.Message = e.ToString();
            }
            return Ok(_Result);
        }

        [HttpPost("Master")]
        public ActionResult CreateOrder(Order _Entity)
        {
            Result Response = new Result
            {
                Success = 0,
                Data = null
            };
            try
            {
                using (MarketAlfaContext _context = new MarketAlfaContext())
                {
                    Console.WriteLine();
                    Order _Order = new Order();
                    _Order.Date = DateTime.Now;
                    _Order.Distributor = _Entity.Distributor;
                    _Order.Receive = _Entity.Receive;
                    _Order.Status = true;
                    _context.Orders.Add(_Order);
                    _context.SaveChanges();
                    Response.Success = 1;
                    Response.Message = "Registro Correcto";
                }
            }
            catch (Exception e)
            {
                Response.Message = e.ToString();
                Console.WriteLine(e);
            }
            return Ok(Response);
        }

        [HttpPost("detail")]
        public ActionResult Detail(ConceptOrder Entity)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    int ID = _context.Orders.Select(x => x.Id).FirstOrDefault();
                    Entity.OrderD = ID;
                    _DB.ConceptOrders.Add(Entity);
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

        // GET: api/Order
        [HttpGet("first")]
        public ActionResult First()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = _DB.Orders.Include(x => x.DistributorNavigation).Select(y => new { Id = y.Id, Distributor = y.DistributorNavigation.Name }).OrderByDescending(x => x.Id).FirstOrDefault();
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

        [HttpGet]
        public async Task<ActionResult> Get()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Orders.Where(x => x.Status == true && x.Delivered == false).Select(x => new { Id = x.Id, IdDistributor = x.Distributor, Date = x.Date, Distributor = x.DistributorNavigation.Name, Receive = x.Receive, User = x.MadeByNavigation.Pseudomyn }).OrderByDescending(x => x.Date).ToListAsync();
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

        [HttpGet("inference")]
        public async Task<ActionResult> GetInference()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Orders.Where(x => x.Status == true && x.Delivered == false).Select(x => new { Id = x.Id, IdDistributor = x.Distributor, Date = x.Date, Distributor = x.DistributorNavigation.Name, Receive = x.Receive }).OrderBy(x => x.Receive).Take(5).ToListAsync();
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

        [HttpGet("receive")]
        public async Task<ActionResult> GetReceive()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Orders.Where(x => x.Status == true).Select(x => new { Id = x.Id, Date = x.Date, Distributor = x.DistributorNavigation.Name, Receive = x.Receive }).OrderByDescending(x => x.Date).ToListAsync();
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

        [HttpGet("detail/{id}")]
        public async Task<ActionResult> GetDetail(int ID)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.ConceptOrders.Where(x => x.OrderD == ID).Select(x => new { Id = x.Id, Product = x.ProductNavigation.Name, Measure = x.ProductNavigation.DescriptionNavigation.Name, Amount = x.Amount }).ToListAsync();
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

        // GET: api/Order/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Order>> GetOrder(int id)
        {
            var order = await _context.Orders.FindAsync(id);

            if (order == null)
            {
                return NotFound();
            }

            return order;
        }

        [HttpDelete("{ID}")]
        public IActionResult Delete(int ID)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var Entity = _DB.Orders.Find(ID);
                    Entity.Status = false;
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
