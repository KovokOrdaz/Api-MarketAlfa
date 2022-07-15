using System;
using System.Collections.Generic;
using MarketAlfa.Models.NotKey;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace MarketAlfa.Models
{
    public partial class MarketAlfaContext : DbContext
    {
        public MarketAlfaContext()
        {
        }

        public MarketAlfaContext(DbContextOptions<MarketAlfaContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Academic> Academics { get; set; }
        public virtual DbSet<Business> Businesses { get; set; }
        public virtual DbSet<Buy> Buys { get; set; }
        public virtual DbSet<BuysPrice> BuysPrices { get; set; }
        public virtual DbSet<BuysProduct> BuysProducts { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Client> Clients { get; set; }
        public virtual DbSet<Coin> Coins { get; set; }
        public virtual DbSet<CoinPrice> CoinPrices { get; set; }
        public virtual DbSet<ConceptBuy> ConceptBuys { get; set; }
        public virtual DbSet<ConceptOrder> ConceptOrders { get; set; }
        public virtual DbSet<ConceptRequest> ConceptRequests { get; set; }
        public virtual DbSet<ContactEmergency> ContactEmergencies { get; set; }
        public virtual DbSet<DegreesAcademic> DegreesAcademics { get; set; }
        public virtual DbSet<Distributor> Distributors { get; set; }
        public virtual DbSet<DistributorBalance> DistributorBalances { get; set; }
        public virtual DbSet<DistributorReason> DistributorReasons { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<EntryInventary> EntryInventaries { get; set; }
        public virtual DbSet<HorarysName> HorarysNames { get; set; }
        public virtual DbSet<Inventory> Inventories { get; set; }
        public virtual DbSet<InventoryLot> InventoryLots { get; set; }
        public virtual DbSet<InventoryLotReason> InventoryLotReasons { get; set; }
        public virtual DbSet<InventoryProductReason> InventoryProductReasons { get; set; }
        public virtual DbSet<Job> Jobs { get; set; }
        public virtual DbSet<KeyStatus> KeyStatuses { get; set; }
        public virtual DbSet<LegalStructure> LegalStructures { get; set; }
        public virtual DbSet<License> Licenses { get; set; }
        public virtual DbSet<Measure> Measures { get; set; }
        public virtual DbSet<Nationality> Nationalities { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<PayDate> PayDates { get; set; }
        public virtual DbSet<PayMethod> PayMethods { get; set; }
        public virtual DbSet<Privilege> Privileges { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<ProductReason> ProductReasons { get; set; }
        public virtual DbSet<ProductsPrice> ProductsPrices { get; set; }
        public virtual DbSet<Rating> Ratings { get; set; }
        public virtual DbSet<ReasonForInvalidating> ReasonForInvalidatings { get; set; }
        public virtual DbSet<Request> Requests { get; set; }
        public virtual DbSet<Speed> Speeds { get; set; }
        public virtual DbSet<Tax> Taxes { get; set; }
        public virtual DbSet<TaxPay> TaxPays { get; set; }
        public virtual DbSet<Transaction> Transactions { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<UserReason> UserReasons { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Server=DESKTOP-3FP92LL; Initial Catalog=MarketAlfa; Integrated Security=True; TrustServerCertificate=True; ");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Academic>(entity =>
            {
                entity.ToTable("academic");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Employee).HasColumnName("employee");

                entity.Property(e => e.Grade).HasColumnName("grade");

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("title");

                entity.HasOne(d => d.EmployeeNavigation)
                    .WithMany(p => p.Academics)
                    .HasForeignKey(d => d.Employee)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_academic_employee");

                entity.HasOne(d => d.GradeNavigation)
                    .WithMany(p => p.Academics)
                    .HasForeignKey(d => d.Grade)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_academic_degreesAcademic");
            });

            modelBuilder.Entity<Business>(entity =>
            {
                entity.ToTable("business");

                entity.HasIndex(e => e.Ls, "IX_LSBusiness");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Acronym)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("acronym");

                entity.Property(e => e.Coin)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("coin");

                entity.Property(e => e.Direction)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("direction");

                entity.Property(e => e.Ls).HasColumnName("ls");

                entity.Property(e => e.Mail)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("mail");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("name");

                entity.Property(e => e.Phone)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("phone");

                entity.Property(e => e.Rif)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("rif");

                entity.HasOne(d => d.LsNavigation)
                    .WithMany(p => p.Businesses)
                    .HasForeignKey(d => d.Ls)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_myBusiness_legalStructure");
            });

            modelBuilder.Entity<Buy>(entity =>
            {
                entity.ToTable("buy");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Client)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("client");

                entity.Property(e => e.Date)
                    .HasColumnType("datetime")
                    .HasColumnName("date");

                entity.Property(e => e.Seller).HasColumnName("seller");

                entity.HasOne(d => d.ClientNavigation)
                    .WithMany(p => p.Buys)
                    .HasForeignKey(d => d.Client)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_buy_clients");

                entity.HasOne(d => d.SellerNavigation)
                    .WithMany(p => p.Buys)
                    .HasForeignKey(d => d.Seller)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_buy_users");
            });

            modelBuilder.Entity<BuysPrice>(entity =>
            {
                entity.HasKey(e => e.Idbp);

                entity.ToTable("buysPrices");

                entity.Property(e => e.Idbp).HasColumnName("IDBP");

                entity.Property(e => e.BuyCoin).HasColumnName("buyCoin");

                entity.Property(e => e.BuyPayMethod).HasColumnName("buyPayMethod");

                entity.Property(e => e.BuyPriceBrute).HasColumnName("buyPriceBrute");

                entity.Property(e => e.BuyPriceFinal).HasColumnName("buyPriceFinal");

                entity.Property(e => e.CodeBuy).HasColumnName("codeBuy");

                entity.HasOne(d => d.BuyCoinNavigation)
                    .WithMany(p => p.BuysPrices)
                    .HasForeignKey(d => d.BuyCoin)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_buysPrices_coins");

                entity.HasOne(d => d.CodeBuyNavigation)
                    .WithMany(p => p.BuysPrices)
                    .HasForeignKey(d => d.CodeBuy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_buysPrices_buys");
            });

            modelBuilder.Entity<BuysProduct>(entity =>
            {
                entity.HasKey(e => e.BuyCode)
                    .HasName("PK_buys_1");

                entity.ToTable("buysProduct");

                entity.Property(e => e.BuyCode)
                    .ValueGeneratedNever()
                    .HasColumnName("buyCode");

                entity.Property(e => e.BuyProduct).HasColumnName("buyProduct");

                entity.Property(e => e.BuyProductPrice).HasColumnName("buyProductPrice");

                entity.Property(e => e.Idbuy)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("IDBuy");

                entity.HasOne(d => d.BuyProductPriceNavigation)
                    .WithMany(p => p.BuysProducts)
                    .HasForeignKey(d => d.BuyProductPrice)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_buys_productsPrices");
            });

            modelBuilder.Entity<Category>(entity =>
            {
                entity.ToTable("category");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("name");

                entity.Property(e => e.Status).HasColumnName("status");
            });

            modelBuilder.Entity<Client>(entity =>
            {
                entity.HasKey(e => e.Dni);

                entity.ToTable("clients");

                entity.Property(e => e.Dni)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("dni");

                entity.Property(e => e.Date)
                    .HasColumnType("datetime")
                    .HasColumnName("date");

                entity.Property(e => e.Direction)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("direction");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("name");

                entity.Property(e => e.Nationality).HasColumnName("nationality");

                entity.Property(e => e.Phone)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("phone");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.UserRegister).HasColumnName("userRegister");

                entity.HasOne(d => d.NationalityNavigation)
                    .WithMany(p => p.Clients)
                    .HasForeignKey(d => d.Nationality)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_clients_nationalities");

                entity.HasOne(d => d.UserRegisterNavigation)
                    .WithMany(p => p.Clients)
                    .HasForeignKey(d => d.UserRegister)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_clients_users");
            });

            modelBuilder.Entity<Coin>(entity =>
            {
                entity.ToTable("coin");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Acronym)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("acronym");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("name");

                entity.Property(e => e.Region)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("region");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.Value)
                    .HasColumnType("decimal(18, 4)")
                    .HasColumnName("value");
            });

            modelBuilder.Entity<CoinPrice>(entity =>
            {
                entity.ToTable("coin_price");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Coin).HasColumnName("coin");

                entity.Property(e => e.Date)
                    .HasColumnType("datetime")
                    .HasColumnName("date");

                entity.Property(e => e.Value)
                    .HasColumnType("decimal(18, 4)")
                    .HasColumnName("value");

                entity.HasOne(d => d.CoinNavigation)
                    .WithMany(p => p.CoinPrices)
                    .HasForeignKey(d => d.Coin)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_coin_price_coin");
            });

            modelBuilder.Entity<ConceptBuy>(entity =>
            {
                entity.ToTable("conceptBuy");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Amount)
                    .HasColumnType("decimal(18, 4)")
                    .HasColumnName("amount");

                entity.Property(e => e.Buy).HasColumnName("buy");

                entity.Property(e => e.Price)
                    .HasColumnType("decimal(18, 4)")
                    .HasColumnName("price");

                entity.Property(e => e.Product)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("product");

                entity.HasOne(d => d.BuyNavigation)
                    .WithMany(p => p.ConceptBuys)
                    .HasForeignKey(d => d.Buy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_conceptBuy_buy");

                entity.HasOne(d => d.ProductNavigation)
                    .WithMany(p => p.ConceptBuys)
                    .HasForeignKey(d => d.Product)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_conceptBuy_products");
            });

            modelBuilder.Entity<ConceptOrder>(entity =>
            {
                entity.ToTable("conceptOrder");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Amount)
                    .HasColumnType("decimal(18, 4)")
                    .HasColumnName("amount");

                entity.Property(e => e.OrderD).HasColumnName("orderD");

                entity.Property(e => e.Product)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("product");

                entity.HasOne(d => d.OrderDNavigation)
                    .WithMany(p => p.ConceptOrders)
                    .HasForeignKey(d => d.OrderD)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_conceptOrder_orders");

                entity.HasOne(d => d.ProductNavigation)
                    .WithMany(p => p.ConceptOrders)
                    .HasForeignKey(d => d.Product)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_conceptOrder_conceptOrder");
            });

            modelBuilder.Entity<ConceptRequest>(entity =>
            {
                entity.ToTable("conceptRequest");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Amount)
                    .HasColumnType("decimal(18, 2)")
                    .HasColumnName("amount");

                entity.Property(e => e.Expiration)
                    .HasColumnType("datetime")
                    .HasColumnName("expiration");

                entity.Property(e => e.Price)
                    .HasColumnType("decimal(18, 2)")
                    .HasColumnName("price");

                entity.Property(e => e.Product)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("product");

                entity.Property(e => e.Request).HasColumnName("request");

                entity.HasOne(d => d.ProductNavigation)
                    .WithMany(p => p.ConceptRequests)
                    .HasForeignKey(d => d.Product)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_conceptRequest_products");

                entity.HasOne(d => d.RequestNavigation)
                    .WithMany(p => p.ConceptRequests)
                    .HasForeignKey(d => d.Request)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_conceptRequest_request");
            });

            modelBuilder.Entity<ContactEmergency>(entity =>
            {
                entity.ToTable("contactEmergency");

                entity.HasIndex(e => e.Employee, "IX_employeeEmergency");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Container)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("container");

                entity.Property(e => e.Employee).HasColumnName("employee");

                entity.Property(e => e.Format)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("format");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("name");

                entity.Property(e => e.Parent)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("parent");

                entity.HasOne(d => d.EmployeeNavigation)
                    .WithMany(p => p.ContactEmergencies)
                    .HasForeignKey(d => d.Employee)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_employeesContactEmergency_employees");
            });

            modelBuilder.Entity<DegreesAcademic>(entity =>
            {
                entity.ToTable("degreesAcademic");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("name");

                entity.Property(e => e.Percentage).HasColumnName("percentage");
            });

            modelBuilder.Entity<Distributor>(entity =>
            {
                entity.HasKey(e => e.Rif)
                    .HasName("PK_distributors_1");

                entity.ToTable("distributors");

                entity.Property(e => e.Rif)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("rif");

                entity.Property(e => e.CountD).HasColumnName("countD");

                entity.Property(e => e.Ls).HasColumnName("ls");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("name");

                entity.Property(e => e.RegisteredBy).HasColumnName("registeredBy");

                entity.Property(e => e.Respet)
                    .HasColumnType("decimal(18, 4)")
                    .HasColumnName("respet");

                entity.Property(e => e.Speed)
                    .HasColumnType("decimal(18, 4)")
                    .HasColumnName("speed");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.HasOne(d => d.LsNavigation)
                    .WithMany(p => p.Distributors)
                    .HasForeignKey(d => d.Ls)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_distributors_legalStructure");

                entity.HasOne(d => d.RegisteredByNavigation)
                    .WithMany(p => p.Distributors)
                    .HasForeignKey(d => d.RegisteredBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_distributors_users");
            });

            modelBuilder.Entity<DistributorBalance>(entity =>
            {
                entity.HasKey(e => e.Iddb);

                entity.ToTable("distributorBalance");

                entity.Property(e => e.Iddb).HasColumnName("IDDB");

                entity.Property(e => e.Balance).HasColumnName("balance");

                entity.Property(e => e.Distributor).HasColumnName("distributor");
            });

            modelBuilder.Entity<DistributorReason>(entity =>
            {
                entity.ToTable("distributorReason");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Date)
                    .HasColumnType("datetime")
                    .HasColumnName("date");

                entity.Property(e => e.Distributor)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("distributor");

                entity.Property(e => e.Reason)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("reason");

                entity.Property(e => e.UserX).HasColumnName("userX");

                entity.HasOne(d => d.DistributorNavigation)
                    .WithMany(p => p.DistributorReasons)
                    .HasForeignKey(d => d.Distributor)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_distributorReason_distributors");

                entity.HasOne(d => d.UserXNavigation)
                    .WithMany(p => p.DistributorReasons)
                    .HasForeignKey(d => d.UserX)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_distributorReason_users");
            });

            modelBuilder.Entity<Employee>(entity =>
            {
                entity.ToTable("employee");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Date)
                    .HasColumnType("date")
                    .HasColumnName("date");

                entity.Property(e => e.DateOfBirth)
                    .HasColumnType("date")
                    .HasColumnName("dateOfBirth");

                entity.Property(e => e.DatePay).HasColumnName("datePay");

                entity.Property(e => e.Dni)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("dni");

                entity.Property(e => e.Input).HasColumnName("input");

                entity.Property(e => e.IsUser).HasColumnName("isUser");

                entity.Property(e => e.Job).HasColumnName("job");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("name");

                entity.Property(e => e.Nationality).HasColumnName("nationality");

                entity.Property(e => e.Output).HasColumnName("output");

                entity.Property(e => e.Phone)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("phone");

                entity.Property(e => e.Salary)
                    .HasColumnType("decimal(18, 4)")
                    .HasColumnName("salary");

                entity.Property(e => e.SocialSecurity)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("socialSecurity");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.HasOne(d => d.DatePayNavigation)
                    .WithMany(p => p.Employees)
                    .HasForeignKey(d => d.DatePay)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_employee_payDate");

                entity.HasOne(d => d.JobNavigation)
                    .WithMany(p => p.Employees)
                    .HasForeignKey(d => d.Job)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_employee_jobs");

                entity.HasOne(d => d.NationalityNavigation)
                    .WithMany(p => p.Employees)
                    .HasForeignKey(d => d.Nationality)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_employee_nationalities");
            });

            modelBuilder.Entity<EntryInventary>(entity =>
            {
                entity.ToTable("entryInventary");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Amount)
                    .HasColumnType("decimal(18, 4)")
                    .HasColumnName("amount");

                entity.Property(e => e.Date)
                    .HasColumnType("datetime")
                    .HasColumnName("date");

                entity.Property(e => e.Expiration)
                    .HasColumnType("datetime")
                    .HasColumnName("expiration");

                entity.Property(e => e.Price)
                    .HasColumnType("decimal(18, 4)")
                    .HasColumnName("price");

                entity.Property(e => e.Product)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("product");

                entity.Property(e => e.RegisteredBy).HasColumnName("registeredBy");

                entity.HasOne(d => d.ProductNavigation)
                    .WithMany(p => p.EntryInventaries)
                    .HasForeignKey(d => d.Product)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_entryInventary_products");

                entity.HasOne(d => d.RegisteredByNavigation)
                    .WithMany(p => p.EntryInventaries)
                    .HasForeignKey(d => d.RegisteredBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_entryInventary_users");
            });

            modelBuilder.Entity<HorarysName>(entity =>
            {
                entity.ToTable("horarysNames");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false)
                    .HasColumnName("name");
            });

            modelBuilder.Entity<Inventory>(entity =>
            {
                entity.ToTable("inventory");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Amount)
                    .HasColumnType("decimal(18, 4)")
                    .HasColumnName("amount");

                entity.Property(e => e.Lock)
                    .HasColumnType("decimal(18, 4)")
                    .HasColumnName("lock");

                entity.Property(e => e.Low)
                    .HasColumnType("decimal(18, 4)")
                    .HasColumnName("low");

                entity.Property(e => e.Price)
                    .HasColumnType("decimal(18, 4)")
                    .HasColumnName("price");

                entity.Property(e => e.Product)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("product");

                entity.HasOne(d => d.ProductNavigation)
                    .WithMany(p => p.Inventories)
                    .HasForeignKey(d => d.Product)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_inventory_products");
            });

            modelBuilder.Entity<InventoryLot>(entity =>
            {
                entity.ToTable("inventoryLot");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Amount)
                    .HasColumnType("decimal(18, 4)")
                    .HasColumnName("amount");

                entity.Property(e => e.Expiration)
                    .HasColumnType("datetime")
                    .HasColumnName("expiration");

                entity.Property(e => e.Lot).HasColumnName("lot");

                entity.Property(e => e.Product)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("product");

                entity.Property(e => e.RegisteredBy).HasColumnName("registeredBy");

                entity.Property(e => e.Sold)
                    .HasColumnType("decimal(18, 4)")
                    .HasColumnName("sold");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.HasOne(d => d.LotNavigation)
                    .WithMany(p => p.InventoryLots)
                    .HasForeignKey(d => d.Lot)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_inventoryLot_request");

                entity.HasOne(d => d.ProductNavigation)
                    .WithMany(p => p.InventoryLots)
                    .HasForeignKey(d => d.Product)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_inventoryLot_products");

                entity.HasOne(d => d.RegisteredByNavigation)
                    .WithMany(p => p.InventoryLots)
                    .HasForeignKey(d => d.RegisteredBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_inventoryLot_users");
            });

            modelBuilder.Entity<InventoryLotReason>(entity =>
            {
                entity.ToTable("inventoryLotReason");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Date)
                    .HasColumnType("datetime")
                    .HasColumnName("date");

                entity.Property(e => e.Lot).HasColumnName("lot");

                entity.Property(e => e.Reason)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("reason");

                entity.Property(e => e.UserX).HasColumnName("userX");

                entity.HasOne(d => d.LotNavigation)
                    .WithMany(p => p.InventoryLotReasons)
                    .HasForeignKey(d => d.Lot)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_inventoryLotReason_inventoryLot");

                entity.HasOne(d => d.UserXNavigation)
                    .WithMany(p => p.InventoryLotReasons)
                    .HasForeignKey(d => d.UserX)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_inventoryLotReason_users");
            });

            modelBuilder.Entity<InventoryProductReason>(entity =>
            {
                entity.ToTable("inventoryProductReason");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Amount)
                    .HasColumnType("decimal(18, 4)")
                    .HasColumnName("amount");

                entity.Property(e => e.Date)
                    .HasColumnType("datetime")
                    .HasColumnName("date");

                entity.Property(e => e.Lot).HasColumnName("lot");

                entity.Property(e => e.Product)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("product");

                entity.Property(e => e.Reason)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("reason");

                entity.Property(e => e.RegisterBy).HasColumnName("registerBy");

                entity.HasOne(d => d.LotNavigation)
                    .WithMany(p => p.InventoryProductReasons)
                    .HasForeignKey(d => d.Lot)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_inventoryProductReason_request");

                entity.HasOne(d => d.ProductNavigation)
                    .WithMany(p => p.InventoryProductReasons)
                    .HasForeignKey(d => d.Product)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_inventoryProductReason_products");

                entity.HasOne(d => d.RegisterByNavigation)
                    .WithMany(p => p.InventoryProductReasons)
                    .HasForeignKey(d => d.RegisterBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_inventoryProductReason_users");
            });

            modelBuilder.Entity<Job>(entity =>
            {
                entity.ToTable("jobs");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("name");

                entity.Property(e => e.Status).HasColumnName("status");
            });

            modelBuilder.Entity<KeyStatus>(entity =>
            {
                entity.HasKey(e => e.Idks);

                entity.ToTable("keyStatus");

                entity.Property(e => e.Idks).HasColumnName("IDKS");

                entity.Property(e => e.KeyStatusName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("keyStatusName");

                entity.Property(e => e.KeyStatusNameEs)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("keyStatusNameES");
            });

            modelBuilder.Entity<LegalStructure>(entity =>
            {
                entity.ToTable("legalStructure");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<License>(entity =>
            {
                entity.ToTable("licenses");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(500)
                    .IsUnicode(false)
                    .HasColumnName("code");

                entity.Property(e => e.Status).HasColumnName("status");
            });

            modelBuilder.Entity<Measure>(entity =>
            {
                entity.ToTable("measure");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Acronym)
                    .IsRequired()
                    .HasMaxLength(5)
                    .IsUnicode(false)
                    .HasColumnName("acronym");

                entity.Property(e => e.Complete).HasColumnName("complete");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("name");

                entity.Property(e => e.Status).HasColumnName("status");
            });

            modelBuilder.Entity<Nationality>(entity =>
            {
                entity.ToTable("nationalities");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Acronym)
                    .IsRequired()
                    .HasMaxLength(5)
                    .IsUnicode(false)
                    .HasColumnName("acronym");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("name");
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.ToTable("orders");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Date)
                    .HasColumnType("datetime")
                    .HasColumnName("date");

                entity.Property(e => e.Delivered).HasColumnName("delivered");

                entity.Property(e => e.Distributor)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("distributor");

                entity.Property(e => e.MadeBy).HasColumnName("madeBy");

                entity.Property(e => e.Receive)
                    .HasColumnType("datetime")
                    .HasColumnName("receive");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.HasOne(d => d.DistributorNavigation)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.Distributor)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_orders_distributors");

                entity.HasOne(d => d.MadeByNavigation)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.MadeBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_orders_users");
            });

            modelBuilder.Entity<PayDate>(entity =>
            {
                entity.ToTable("payDate");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<PayMethod>(entity =>
            {
                entity.ToTable("payMethod");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Commission).HasColumnName("commission");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("name");

                entity.Property(e => e.Status).HasColumnName("status");
            });

            modelBuilder.Entity<Privilege>(entity =>
            {
                entity.ToTable("privileges");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.NameEs)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.HasKey(e => e.Code);

                entity.ToTable("products");

                entity.Property(e => e.Code)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("code");

                entity.Property(e => e.Category).HasColumnName("category");

                entity.Property(e => e.Description).HasColumnName("description");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("name");

                entity.Property(e => e.RegisteredBy).HasColumnName("registeredBy");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.HasOne(d => d.CategoryNavigation)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.Category)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_products_productsCategory");

                entity.HasOne(d => d.DescriptionNavigation)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.Description)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_products_measure");

                entity.HasOne(d => d.RegisteredByNavigation)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.RegisteredBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_products_users");
            });

            modelBuilder.Entity<ProductReason>(entity =>
            {
                entity.ToTable("productReason");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Date)
                    .HasColumnType("datetime")
                    .HasColumnName("date");

                entity.Property(e => e.Product)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("product");

                entity.Property(e => e.Reason)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("reason");

                entity.Property(e => e.UserX).HasColumnName("userX");

                entity.HasOne(d => d.ProductNavigation)
                    .WithMany(p => p.ProductReasons)
                    .HasForeignKey(d => d.Product)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_productReason_products");

                entity.HasOne(d => d.UserXNavigation)
                    .WithMany(p => p.ProductReasons)
                    .HasForeignKey(d => d.UserX)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_productReason_users");
            });

            modelBuilder.Entity<ProductsPrice>(entity =>
            {
                entity.HasKey(e => e.Idpp);

                entity.ToTable("productsPrices");

                entity.Property(e => e.Idpp).HasColumnName("IDPP");

                entity.Property(e => e.Product).HasColumnName("product");

                entity.Property(e => e.ProductCoin).HasColumnName("productCoin");

                entity.Property(e => e.ProductPrice).HasColumnName("productPrice");

                entity.HasOne(d => d.ProductCoinNavigation)
                    .WithMany(p => p.ProductsPrices)
                    .HasForeignKey(d => d.ProductCoin)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_productsPrices_coins");
            });

            modelBuilder.Entity<Rating>(entity =>
            {
                entity.ToTable("rating");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Distributor).HasColumnName("distributor");

                entity.Property(e => e.Quality)
                    .HasColumnType("decimal(18, 4)")
                    .HasColumnName("quality");

                entity.Property(e => e.Request).HasColumnName("request");
            });

            modelBuilder.Entity<ReasonForInvalidating>(entity =>
            {
                entity.ToTable("reasonForInvalidating");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Item)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("item");

                entity.Property(e => e.Reason)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("reason");
            });

            modelBuilder.Entity<Request>(entity =>
            {
                entity.ToTable("request");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("code");

                entity.Property(e => e.Distributor)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("distributor");

                entity.Property(e => e.OrderD).HasColumnName("orderD");

                entity.Property(e => e.Receive)
                    .HasColumnType("datetime")
                    .HasColumnName("receive");

                entity.Property(e => e.ReceivedBy).HasColumnName("receivedBy");

                entity.HasOne(d => d.DistributorNavigation)
                    .WithMany(p => p.Requests)
                    .HasForeignKey(d => d.Distributor)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_request_distributors");

                entity.HasOne(d => d.ReceivedByNavigation)
                    .WithMany(p => p.Requests)
                    .HasForeignKey(d => d.ReceivedBy)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_request_users");
            });

            modelBuilder.Entity<Speed>(entity =>
            {
                entity.ToTable("speed");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Distributor).HasColumnName("distributor");

                entity.Property(e => e.Fast)
                    .HasColumnType("decimal(18, 4)")
                    .HasColumnName("fast");

                entity.Property(e => e.Request).HasColumnName("request");
            });

            modelBuilder.Entity<Tax>(entity =>
            {
                entity.HasKey(e => e.Idtax);

                entity.ToTable("tax");

                entity.Property(e => e.Idtax).HasColumnName("IDTax");

                entity.Property(e => e.DatePay).HasColumnName("datePay");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("name");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.HasOne(d => d.DatePayNavigation)
                    .WithMany(p => p.Taxes)
                    .HasForeignKey(d => d.DatePay)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_tax_payDate");
            });

            modelBuilder.Entity<TaxPay>(entity =>
            {
                entity.ToTable("taxPay");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Coin).HasColumnName("coin");

                entity.Property(e => e.Date)
                    .HasColumnType("datetime")
                    .HasColumnName("date");

                entity.Property(e => e.Price).HasColumnName("price");

                entity.Property(e => e.Tax).HasColumnName("tax");

                entity.HasOne(d => d.CoinNavigation)
                    .WithMany(p => p.TaxPays)
                    .HasForeignKey(d => d.Coin)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_taxPay_coins");

                entity.HasOne(d => d.TaxNavigation)
                    .WithMany(p => p.TaxPays)
                    .HasForeignKey(d => d.Tax)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_taxPay_tax");
            });

            modelBuilder.Entity<Transaction>(entity =>
            {
                entity.HasKey(e => e.Idtransaction);

                entity.ToTable("transactions");

                entity.Property(e => e.Idtransaction).HasColumnName("IDTransaction");

                entity.Property(e => e.TransactionClient)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("transactionClient");

                entity.Property(e => e.TransactionDate)
                    .HasColumnType("date")
                    .HasColumnName("transactionDate");

                entity.Property(e => e.TransactionUser).HasColumnName("transactionUser");

                entity.HasOne(d => d.TransactionUserNavigation)
                    .WithMany(p => p.Transactions)
                    .HasForeignKey(d => d.TransactionUser)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_transactions_users");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("users");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Answer)
                    .HasMaxLength(250)
                    .IsUnicode(false)
                    .HasColumnName("answer");

                entity.Property(e => e.Date)
                    .HasColumnType("datetime")
                    .HasColumnName("date");

                entity.Property(e => e.Name)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("name");

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(500)
                    .HasColumnName("password");

                entity.Property(e => e.Privilege).HasColumnName("privilege");

                entity.Property(e => e.Pseudomyn)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("pseudomyn");

                entity.Property(e => e.Question)
                    .HasMaxLength(250)
                    .IsUnicode(false)
                    .HasColumnName("question");

                entity.Property(e => e.Salt)
                    .IsRequired()
                    .HasMaxLength(500)
                    .HasColumnName("salt");

                entity.Property(e => e.Status).HasColumnName("status");
            });

            modelBuilder.Entity<UserReason>(entity =>
            {
                entity.ToTable("userReason");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Banned).HasColumnName("banned");

                entity.Property(e => e.Date)
                    .HasColumnType("datetime")
                    .HasColumnName("date");

                entity.Property(e => e.Reason)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("reason");

                entity.Property(e => e.UserX)
                    .IsRequired()
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("userX");

                entity.HasOne(d => d.BannedNavigation)
                    .WithMany(p => p.UserReasons)
                    .HasForeignKey(d => d.Banned)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_userReason_users");
            });

            modelBuilder.Entity<ReportBuy>().ToSqlQuery("EXEC spReportBuy");
            modelBuilder.Entity<ReportProduct>().ToSqlQuery("EXEC spReportProduct");
            modelBuilder.Entity<ReportProductDay>().ToSqlQuery("EXEC spReportProductDay");
            modelBuilder.Entity<ReportProductWeek>().ToSqlQuery("EXEC spReportProductWeek");
            modelBuilder.Entity<ReportProductMonth>().ToSqlQuery("EXEC spReportProductMonth");
            modelBuilder.Entity<ReportCategory>().ToSqlQuery("EXEC spReportCategory");
            modelBuilder.Entity<ReportCategoryDay>().ToSqlQuery("EXEC spReportCategoryDay");
            modelBuilder.Entity<ReportCategoryWeek>().ToSqlQuery("EXEC spReportCategoryWeek");
            modelBuilder.Entity<ReportCategoryMonth>().ToSqlQuery("EXEC spReportCategoryMonth");
            modelBuilder.Entity<ReportMeasure>().ToSqlQuery("EXEC spReportMeasure");
            modelBuilder.Entity<ReportMeasureDay>().ToSqlQuery("EXEC spReportMeasureDay");
            modelBuilder.Entity<ReportMeasureWeek>().ToSqlQuery("EXEC spReportMeasureWeek");
            modelBuilder.Entity<ReportMeasureMonth>().ToSqlQuery("EXEC spReportMeasureMonth");
            modelBuilder.Entity<ReportInventoryMeasure>().ToSqlQuery("EXEC spReportInventoryMeasure");
            modelBuilder.Entity<ReportInventoryCategory>().ToSqlQuery("EXEC spReportInventoryCategory");

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
