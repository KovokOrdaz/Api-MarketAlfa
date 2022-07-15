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
using MarketAlfa.Services;

namespace MarketAlfa.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class RequestController : ControllerBase
    {
        private IRequestService _Service;
        public RequestController(IRequestService Service)
        {
            this._Service = Service;
        }

        [HttpPost]
        public IActionResult Create(RequestsVM _Entity)
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

        [HttpGet]
        public async Task<ActionResult> Get()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Requests.Select(x => new { Id = x.Id, Receive = x.Receive }).ToListAsync();
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

        [HttpGet("read")]
        public async Task<ActionResult> Read()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Requests.Select(x => new { Id = x.Id, Receive = x.Receive, Distributor = x.DistributorNavigation.Name, Code = x.Code, ReceivedBy = x.ReceivedByNavigation.Pseudomyn }).OrderByDescending(x => x.Receive).ToListAsync();
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
        public async Task<ActionResult> ReadCode()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Requests.Select(x => x.Code).ToListAsync();
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
                    var _List = await _DB.ConceptRequests.Where(x => x.Request == ID).Select(x => new { Id = x.Id, Product = x.ProductNavigation.Code, Name = x.ProductNavigation.Name, Measure = x.ProductNavigation.DescriptionNavigation.Acronym, Amount = x.Amount, Price = x.Price }).ToListAsync();
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

        [HttpGet("product/{ID}")]
        public ActionResult GetProduct(int ID)
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = _DB.ConceptOrders.Where(x => x.OrderD == ID).Select(x => new { Product = x.Product, Amount = x.Amount, Price = (_DB.ConceptRequests.Where(y => y.Product == x.Product).Max(y => y.Price)), Date = DateTime.Now.AddMonths(1) }).ToList();
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

        // [HttpPost]
        // public ActionResult Create(Request _Entity)
        // {
        //     Console.WriteLine(_Entity);
        //     Result Response = new Result
        //     {
        //         Success = 0,
        //         Data = null
        //     };
        //     try
        //     {
        //         using (MarketAlfaContext _context = new MarketAlfaContext())
        //         {
        //             Request _Order = new Request();
        //             _Entity.Receive = DateTime.Now;
        //             _context.Requests.Add(_Entity);
        //             _context.SaveChanges();
        //             Response.Success = 1;
        //             Response.Message = "Registro Correcto";
        //         }
        //     }
        //     catch (Exception e)
        //     {
        //         Response.Message = e.ToString();
        //         Console.WriteLine(e);
        //     }
        //     return Ok(Response);
        // }

        // [HttpPost("t")]
        // public ActionResult Crt(Request _Entity)
        // {
        //     Console.WriteLine(_Entity);
        //     Result Response = new Result
        //     {
        //         Success = 0,
        //         Data = null
        //     };
        //     try
        //     {
        //         using (MarketAlfaContext _context = new MarketAlfaContext())
        //         {
        //             Request _Order = new Request();
        //             _Entity.Receive = DateTime.Now;
        //             _context.Requests.Add(_Entity);
        //             _context.SaveChanges();
        //             Response.Success = 1;
        //             Response.Message = "Registro Correcto";
        //         }
        //     }
        //     catch (Exception e)
        //     {
        //         Response.Message = e.ToString();
        //         Console.WriteLine(e);
        //     }
        //     return Ok(Response);
        // }

        public void voil()
        {
            // var Order = _context.Orders.Find(_Entity.OrderD);
            // Order.Status = false;
            // _context.Entry(Order).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
            // _context.SaveChanges();
            // var Distributor = _context.Distributors.Find(_Entity.Distributor);
            // Distributor.Speed = Distributor.CountD++;
            // if (Order.Recieve >= _Entity.Receive)
            // {
            //     Distributor.Speed = Distributor.Speed++;
            // }
            // else if (DateTime.Now.AddDays(7) >= _Entity.Receive)
            // {
            //     Distributor.Speed = Distributor.CountD + 7;
            // }
            // else
            // {
            //     Distributor.Speed = Distributor.CountD + 15;
            // }
            // Distributor.CountD = Distributor.CountD++;
            // _context.Entry(Distributor).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
            // _context.SaveChanges();
        }
    }
}
