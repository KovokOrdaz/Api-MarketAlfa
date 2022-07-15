using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MarketAlfa.Models;
using MarketAlfa.Models.Response;
namespace MarketAlfa.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class EmployeeInactiveController : ControllerBase
    {
        private readonly MarketAlfaContext _context;

        public EmployeeInactiveController(MarketAlfaContext context)
        {
            _context = context;
        }

        // GET: api/Employee
        [HttpGet]
        public async Task<ActionResult> Get()
        {
            Result _Result = new Result();
            try
            {
                using (MarketAlfaContext _DB = new MarketAlfaContext())
                {
                    var _List = await _DB.Employees.Select(x => new { id = x.Id, name = x.Name, nationality = x.NationalityNavigation.Name, dni = x.Dni, dateOfBirth = x.DateOfBirth, phone = x.Phone, socialSecurity = x.SocialSecurity, job = x.JobNavigation.Name, input = x.Input, output = x.Output, salary = x.Salary, datePay = x.DatePayNavigation.Name, status = x.Status, isUser = x.IsUser, date = x.Date }).ToListAsync();
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