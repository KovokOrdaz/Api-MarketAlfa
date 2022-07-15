using MarketAlfa.Models;
using MarketAlfa.Models.ViewModels;

namespace MarketAlfa.Services
{
    public class RequestService : IRequestService
    {
        public void Create(RequestsVM _Entity)
        {
            using (MarketAlfaContext _Context = new MarketAlfaContext())
            {
                using (var _Transaction = _Context.Database.BeginTransaction())
                {
                    try
                    {
                        var Entity = new Request();
                        Entity.Distributor = _Entity.Distributor;
                        Entity.Receive = DateTime.Now;
                        Entity.OrderD = _Entity.OrderD;
                        Entity.Code = _Entity.Code;
                        Entity.ReceivedBy = _Entity.User;
                        _Context.Requests.Add(Entity);
                        _Context.SaveChanges();
                        foreach (var Concept in _Entity.Products)
                        {
                            var Detail = new ConceptRequest();
                            Detail.Product = Concept.Product;
                            Detail.Amount = Concept.Amount;
                            Detail.Price = Concept.Price;
                            Detail.Expiration = Concept.Expiration;
                            Detail.Request = Entity.Id;
                            _Context.ConceptRequests.Add(Detail);
                            _Context.SaveChanges();
                        }
                        foreach (var Item in _Entity.Products)
                        {
                            var Lot = new InventoryLot();
                            Lot.Product = Item.Product;
                            Lot.Amount = Item.Amount;
                            Lot.Sold = 0;
                            Lot.Expiration = Item.Expiration;
                            Lot.Status = true;
                            Lot.Lot = Entity.Id;
                            Lot.RegisteredBy = _Entity.User;
                            _Context.InventoryLots.Add(Lot);
                            _Context.SaveChanges();
                        }
                        foreach (var Concept in _Entity.Products)
                        {
                            Inventory InventoryProduct = _Context.Inventories.Where(x => x.Product == Concept.Product).FirstOrDefault();
                            InventoryProduct.Amount = InventoryProduct.Amount + Concept.Amount;
                            Concept.Price = Concept.Price + (Concept.Price * 0.3m);
                            Console.WriteLine(Concept.Price);
                            if (Concept.Price > InventoryProduct.Price)
                            {
                                InventoryProduct.Price = Concept.Price;
                            }
                            _Context.Entry(InventoryProduct).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                            _Context.SaveChanges();
                        }
                        Distributor DistributorInference = _Context.Distributors.Find(_Entity.Distributor);
                        Order OrderInference = _Context.Orders.Find(_Entity.OrderD);
                        OrderInference.Delivered = true;
                        _Context.Entry(OrderInference).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                        _Context.SaveChanges();
                        List<ConceptOrder> OrderConceptInference = _Context.ConceptOrders.Where(x => x.OrderD == _Entity.OrderD).ToList();
                        decimal Speed = DistributorInference.Speed;
                        decimal SpeedNow = 0;
                        decimal Respet = 0;
                        decimal ValueProduct = Decimal.Divide(1, OrderConceptInference.Count);
                        if (Entity.Receive <= OrderInference.Receive.AddDays(1))
                        {
                            SpeedNow = 1;
                        }
                        else if (Entity.Receive <= OrderInference.Receive.AddDays(3))
                        {
                            SpeedNow = 0.7M;
                        }
                        else if (Entity.Receive <= OrderInference.Receive.AddDays(7))
                        {
                            SpeedNow = 0.5M;
                        }
                        else if (Entity.Receive <= OrderInference.Receive.AddDays(15))
                        {
                            SpeedNow = 0.3M;
                        }
                        else if (Entity.Receive <= OrderInference.Receive.AddDays(31))
                        {
                            SpeedNow = 0.1M;
                        }
                        Console.WriteLine("Medida: " + ValueProduct);
                        Console.WriteLine("Inferencia: " + OrderConceptInference.Count);
                        Console.WriteLine("Entidad: " + _Entity.Products.Count);
                        int k, i;
                        for (k = 0; k < OrderConceptInference.Count; k++)
                        {
                            for (i = 0; i < _Entity.Products.Count; i++)
                            {
                                if (OrderConceptInference[k].Product == _Entity.Products[i].Product)
                                {
                                    Console.WriteLine(OrderConceptInference[k].Product);
                                    Console.WriteLine(_Entity.Products[i].Product);
                                    Respet = Respet + ValueProduct;
                                }
                            }
                        }
                        DistributorInference.Respet = DistributorInference.Respet + Respet;
                        DistributorInference.Speed = Speed + SpeedNow;
                        DistributorInference.CountD = DistributorInference.CountD + 1;
                        _Context.Entry(DistributorInference).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                        _Context.SaveChanges();
                        _Transaction.Commit();
                    }
                    catch (Exception e)
                    {
                        _Transaction.Rollback();
                        Console.WriteLine(e);
                        throw new Exception("Ocurrió un Error en la transacción" + e.ToString());
                    }
                }
            }
        }
    }
}