using System;
using System.Collections.Generic;

namespace MarketAlfa.Models
{
    public partial class User
    {
        public User()
        {
            Buys = new HashSet<Buy>();
            Clients = new HashSet<Client>();
            DistributorReasons = new HashSet<DistributorReason>();
            Distributors = new HashSet<Distributor>();
            EntryInventaries = new HashSet<EntryInventary>();
            InventoryLotReasons = new HashSet<InventoryLotReason>();
            InventoryLots = new HashSet<InventoryLot>();
            InventoryProductReasons = new HashSet<InventoryProductReason>();
            Orders = new HashSet<Order>();
            ProductReasons = new HashSet<ProductReason>();
            Products = new HashSet<Product>();
            Requests = new HashSet<Request>();
            Transactions = new HashSet<Transaction>();
            UserReasons = new HashSet<UserReason>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Pseudomyn { get; set; }
        public string Salt { get; set; }
        public string Password { get; set; }
        public bool Privilege { get; set; }
        public bool Status { get; set; }
        public DateTime Date { get; set; }
        public string Question { get; set; }
        public string Answer { get; set; }

        public virtual ICollection<Buy> Buys { get; set; }
        public virtual ICollection<Client> Clients { get; set; }
        public virtual ICollection<DistributorReason> DistributorReasons { get; set; }
        public virtual ICollection<Distributor> Distributors { get; set; }
        public virtual ICollection<EntryInventary> EntryInventaries { get; set; }
        public virtual ICollection<InventoryLotReason> InventoryLotReasons { get; set; }
        public virtual ICollection<InventoryLot> InventoryLots { get; set; }
        public virtual ICollection<InventoryProductReason> InventoryProductReasons { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
        public virtual ICollection<ProductReason> ProductReasons { get; set; }
        public virtual ICollection<Product> Products { get; set; }
        public virtual ICollection<Request> Requests { get; set; }
        public virtual ICollection<Transaction> Transactions { get; set; }
        public virtual ICollection<UserReason> UserReasons { get; set; }
    }
}
