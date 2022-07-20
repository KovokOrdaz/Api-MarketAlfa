using MarketAlfa.Models;
using MarketAlfa.Models.ViewModels;

namespace MarketAlfa.Services
{
    public class OrderService : IOrderService
    {
        public void Create(OrderVM _Entity)
        {
            using (MarketAlfaContext _context = new MarketAlfaContext())
            {
                using (var Transaction = _context.Database.BeginTransaction())
                {
                    try
                    {
                        var _Order = new Order();
                        _Order.Id = 0;
                        _Order.Date = DateTime.Now;
                        _Order.Distributor = _Entity.Distributor;
                        _Order.Receive = _Entity.Receive;
                        _Order.Delivered = false;
                        _Order.Status = true;
                        _Order.MadeBy = _Entity.User;
                        _context.Orders.Add(_Order);
                        _context.SaveChanges();
                        foreach (var element in _Entity.Concepts)
                        {
                            var _Concept = new Models.ConceptOrder();
                            _Concept.OrderD = _Order.Id;
                            _Concept.Product = element.Product;
                            _Concept.Amount = element.Amount;
                            _context.ConceptOrders.Add(_Concept);
                            _context.SaveChanges();
                        }
                        Transaction.Commit();
                    }
                    catch (Exception e)
                    {
                        Transaction.Rollback();
                        throw new Exception("Ocurrió un Error en la transaction" + e.ToString());
                    }
                }
            }
        }

    }
}