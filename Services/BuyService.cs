using MarketAlfa.Models;
using MarketAlfa.Models.ViewModels;

namespace MarketAlfa.Services
{
    public class BuyService : IBuyService
    {
        public void Create(BuyVM _Entity)
        {
            using (MarketAlfaContext _Context = new MarketAlfaContext())
            {
                using (var _Transaction = _Context.Database.BeginTransaction())
                {
                    try
                    {
                        var Entity = new Buy();
                        Entity.Client = _Entity.Client;
                        Entity.Date = DateTime.Now;
                        Entity.Seller = _Entity.Seller;
                        _Context.Buys.Add(Entity);
                        _Context.SaveChanges();
                        foreach (var Concept in _Entity.Concepts)
                        {
                            var Detail = new Models.ConceptBuy();
                            Detail.Product = Concept.Product;
                            Detail.Amount = Concept.Amount;
                            Detail.Price = Concept.Price;
                            Detail.Buy = Entity.Id;
                            _Context.ConceptBuys.Add(Detail);
                            _Context.SaveChanges();
                            Console.WriteLine(Concept.Product);
                            decimal TotalAmount = Concept.Amount;
                            do
                            {
                                InventoryLot ProductLot = _Context.InventoryLots.Where(x => x.Product == Concept.Product && x.Amount > x.Sold && x.Status == true).OrderBy(x => x.Expiration).FirstOrDefault();
                                decimal Available = ProductLot.Amount - ProductLot.Sold;
                                if (Available > TotalAmount)
                                {
                                    ProductLot.Sold = ProductLot.Sold + TotalAmount;
                                    _Context.Entry(ProductLot).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                                    _Context.SaveChanges();
                                    TotalAmount = TotalAmount - TotalAmount;
                                }
                                else
                                {
                                    ProductLot.Sold = ProductLot.Sold + Available;
                                    _Context.Entry(ProductLot).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                                    _Context.SaveChanges();
                                    TotalAmount = TotalAmount - Available;
                                }
                            } while (TotalAmount > 0);
                            Inventory InventoryProduct = _Context.Inventories.Where(x => x.Product == Concept.Product).FirstOrDefault();
                            InventoryProduct.Amount = InventoryProduct.Amount - Concept.Amount;
                            _Context.Entry(InventoryProduct).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                            _Context.SaveChanges();
                        }
                        _Transaction.Commit();

                    }
                    catch (Exception e)
                    {
                        _Transaction.Rollback();
                        throw new Exception("Ocurio un Error en la transacion" + e.ToString());
                    }
                }
            }
        }
    }
}