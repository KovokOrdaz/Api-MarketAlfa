USE [master]
GO
/****** Object:  Database [MarketAlfa]    Script Date: 21/07/2022 2:57:09 ******/
CREATE DATABASE [MarketAlfa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MarketAlfa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MarketAlfa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MarketAlfa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MarketAlfa_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MarketAlfa] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MarketAlfa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MarketAlfa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MarketAlfa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MarketAlfa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MarketAlfa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MarketAlfa] SET ARITHABORT OFF 
GO
ALTER DATABASE [MarketAlfa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MarketAlfa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MarketAlfa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MarketAlfa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MarketAlfa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MarketAlfa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MarketAlfa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MarketAlfa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MarketAlfa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MarketAlfa] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MarketAlfa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MarketAlfa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MarketAlfa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MarketAlfa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MarketAlfa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MarketAlfa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MarketAlfa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MarketAlfa] SET RECOVERY FULL 
GO
ALTER DATABASE [MarketAlfa] SET  MULTI_USER 
GO
ALTER DATABASE [MarketAlfa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MarketAlfa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MarketAlfa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MarketAlfa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MarketAlfa] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MarketAlfa] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MarketAlfa', N'ON'
GO
ALTER DATABASE [MarketAlfa] SET QUERY_STORE = OFF
GO
USE [MarketAlfa]
GO
/****** Object:  UserDefinedTableType [dbo].[Detail]    Script Date: 21/07/2022 2:57:10 ******/
CREATE TYPE [dbo].[Detail] AS TABLE(
	[ID] [int] NOT NULL,
	[Amount] [int] NULL,
	[Name] [int] NULL,
	[Price] [decimal](18, 2) NULL,
	PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [dbo].[RequestDetail]    Script Date: 21/07/2022 2:57:10 ******/
CREATE TYPE [dbo].[RequestDetail] AS TABLE(
	[ID] [int] NOT NULL,
	[product] [int] NULL,
	[amount] [decimal](18, 2) NULL,
	PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[academic]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[academic](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[employee] [int] NOT NULL,
	[grade] [int] NOT NULL,
	[title] [varchar](255) NOT NULL,
 CONSTRAINT [PK_academic] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[business]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[business](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[rif] [varchar](255) NOT NULL,
	[ls] [int] NOT NULL,
	[direction] [varchar](255) NULL,
	[mail] [varchar](255) NULL,
	[phone] [varchar](50) NULL,
	[coin] [varchar](255) NULL,
	[acronym] [varchar](10) NULL,
 CONSTRAINT [PK_myBusiness_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[buy]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[buy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[client] [varchar](50) NOT NULL,
	[seller] [int] NOT NULL,
 CONSTRAINT [PK_buy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[buysPrices]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[buysPrices](
	[IDBP] [int] IDENTITY(1,1) NOT NULL,
	[codeBuy] [int] NOT NULL,
	[buyPriceBrute] [float] NOT NULL,
	[buyPriceFinal] [float] NOT NULL,
	[buyPayMethod] [int] NOT NULL,
	[buyCoin] [int] NOT NULL,
 CONSTRAINT [PK_buysPrices] PRIMARY KEY CLUSTERED 
(
	[IDBP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[buysProduct]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[buysProduct](
	[IDBuy] [int] IDENTITY(1,1) NOT NULL,
	[buyCode] [int] NOT NULL,
	[buyProduct] [int] NOT NULL,
	[buyProductPrice] [int] NOT NULL,
 CONSTRAINT [PK_buys_1] PRIMARY KEY CLUSTERED 
(
	[buyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_ProductsCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clients]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clients](
	[name] [varchar](100) NOT NULL,
	[nationality] [int] NOT NULL,
	[dni] [varchar](50) NOT NULL,
	[userRegister] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[status] [bit] NOT NULL,
	[direction] [varchar](255) NOT NULL,
	[phone] [varchar](255) NOT NULL,
 CONSTRAINT [PK_clients] PRIMARY KEY CLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[coin]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[acronym] [varchar](50) NOT NULL,
	[region] [varchar](50) NOT NULL,
	[value] [decimal](18, 4) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_coins] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[coin_price]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coin_price](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[coin] [int] NOT NULL,
	[value] [decimal](18, 4) NOT NULL,
	[date] [datetime] NOT NULL,
 CONSTRAINT [PK_coin_price] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[conceptBuy]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[conceptBuy](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[buy] [int] NOT NULL,
	[product] [varchar](255) NOT NULL,
	[amount] [decimal](18, 4) NOT NULL,
	[price] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_conceptBuy] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[conceptOrder]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[conceptOrder](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[orderD] [int] NOT NULL,
	[product] [varchar](255) NOT NULL,
	[amount] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_conceptOrder] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[conceptRequest]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[conceptRequest](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[request] [int] NOT NULL,
	[product] [varchar](255) NOT NULL,
	[amount] [decimal](18, 2) NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[expiration] [datetime] NULL,
 CONSTRAINT [PK_conceptRequest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contactEmergency]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contactEmergency](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[employee] [int] NOT NULL,
	[name] [varchar](255) NOT NULL,
	[format] [varchar](50) NOT NULL,
	[container] [varchar](50) NOT NULL,
	[parent] [varchar](50) NOT NULL,
 CONSTRAINT [PK_employeesContactEmergency] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[degreesAcademic]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[degreesAcademic](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[percentage] [int] NOT NULL,
 CONSTRAINT [PK_gradesAcademic] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[distributorBalance]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[distributorBalance](
	[IDDB] [int] IDENTITY(1,1) NOT NULL,
	[distributor] [int] NOT NULL,
	[balance] [float] NOT NULL,
 CONSTRAINT [PK_distributorBalance] PRIMARY KEY CLUSTERED 
(
	[IDDB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[distributorReason]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[distributorReason](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[distributor] [varchar](255) NOT NULL,
	[reason] [varchar](255) NOT NULL,
	[date] [datetime] NOT NULL,
	[userX] [int] NOT NULL,
 CONSTRAINT [PK_distributorReason] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[distributors]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[distributors](
	[rif] [varchar](255) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[ls] [int] NOT NULL,
	[speed] [decimal](18, 4) NOT NULL,
	[respet] [decimal](18, 4) NOT NULL,
	[countD] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[registeredBy] [int] NOT NULL,
 CONSTRAINT [PK_distributors_1] PRIMARY KEY CLUSTERED 
(
	[rif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[nationality] [int] NOT NULL,
	[dni] [varchar](50) NOT NULL,
	[dateOfBirth] [date] NOT NULL,
	[phone] [varchar](50) NOT NULL,
	[socialSecurity] [varchar](50) NOT NULL,
	[job] [int] NOT NULL,
	[input] [time](7) NOT NULL,
	[output] [time](7) NOT NULL,
	[salary] [decimal](18, 4) NOT NULL,
	[datePay] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[isUser] [bit] NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_employees_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entryInventary]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entryInventary](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[product] [varchar](255) NOT NULL,
	[amount] [decimal](18, 4) NOT NULL,
	[price] [decimal](18, 4) NOT NULL,
	[date] [datetime] NOT NULL,
	[registeredBy] [int] NOT NULL,
	[expiration] [datetime] NOT NULL,
 CONSTRAINT [PK_entryInventary] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[horarysNames]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[horarysNames](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_horarysNames] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventory]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[product] [varchar](255) NOT NULL,
	[price] [decimal](18, 4) NOT NULL,
	[amount] [decimal](18, 4) NOT NULL,
	[low] [decimal](18, 4) NOT NULL,
	[lock] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_inventory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventoryLot]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventoryLot](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[lot] [int] NOT NULL,
	[product] [varchar](255) NOT NULL,
	[amount] [decimal](18, 4) NOT NULL,
	[sold] [decimal](18, 4) NOT NULL,
	[expiration] [datetime] NOT NULL,
	[status] [bit] NOT NULL,
	[registeredBy] [int] NOT NULL,
 CONSTRAINT [PK_inventoryLot] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventoryLotReason]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventoryLotReason](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[lot] [int] NOT NULL,
	[reason] [varchar](255) NOT NULL,
	[date] [datetime] NOT NULL,
	[userX] [int] NOT NULL,
 CONSTRAINT [PK_inventoryLotReason] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventoryProductReason]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventoryProductReason](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product] [varchar](255) NOT NULL,
	[lot] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[registerBy] [int] NOT NULL,
	[reason] [varchar](255) NOT NULL,
	[amount] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_inventoryProductReason] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jobs]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jobs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_jobs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[keyStatus]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[keyStatus](
	[IDKS] [int] IDENTITY(1,1) NOT NULL,
	[keyStatusName] [varchar](50) NOT NULL,
	[keyStatusNameES] [varchar](50) NOT NULL,
 CONSTRAINT [PK_keyStatus] PRIMARY KEY CLUSTERED 
(
	[IDKS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[legalStructure]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[legalStructure](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_legalStructure_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[licenses]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[licenses](
	[id] [int] NOT NULL,
	[code] [varchar](500) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_licenses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[measure]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[measure](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[acronym] [varchar](5) NOT NULL,
	[complete] [bit] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_measure] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nationalities]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nationalities](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[acronym] [varchar](5) NOT NULL,
 CONSTRAINT [PK_nationalities] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[distributor] [varchar](255) NOT NULL,
	[receive] [datetime] NOT NULL,
	[delivered] [bit] NOT NULL,
	[status] [bit] NOT NULL,
	[madeBy] [int] NOT NULL,
 CONSTRAINT [PK_orders_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payDate]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payDate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Minute] [int] NOT NULL,
	[Day] [int] NULL,
 CONSTRAINT [PK_payDate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[payMethod]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payMethod](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[commission] [float] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_payMethod] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[privileges]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[privileges](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[NameEs] [varchar](50) NOT NULL,
 CONSTRAINT [PK__privileg__3271F80BF2E1B786] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productReason]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productReason](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product] [varchar](255) NOT NULL,
	[reason] [varchar](255) NOT NULL,
	[date] [datetime] NOT NULL,
	[userX] [int] NOT NULL,
 CONSTRAINT [PK_productReason] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[code] [varchar](255) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[category] [int] NOT NULL,
	[description] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[registeredBy] [int] NOT NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productsPrices]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productsPrices](
	[IDPP] [int] IDENTITY(1,1) NOT NULL,
	[product] [int] NOT NULL,
	[productPrice] [float] NOT NULL,
	[productCoin] [int] NOT NULL,
 CONSTRAINT [PK_productsPrices] PRIMARY KEY CLUSTERED 
(
	[IDPP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rating]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rating](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[distributor] [int] NOT NULL,
	[request] [int] NOT NULL,
	[quality] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_rating] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reasonForInvalidating]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reasonForInvalidating](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[item] [varchar](255) NOT NULL,
	[reason] [varchar](255) NOT NULL,
 CONSTRAINT [PK_reasonForInvalidating] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[request]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[request](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[distributor] [varchar](255) NOT NULL,
	[receive] [datetime] NOT NULL,
	[orderD] [int] NOT NULL,
	[receivedBy] [int] NOT NULL,
 CONSTRAINT [PK_request] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[speed]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[speed](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[distributor] [int] NOT NULL,
	[request] [int] NOT NULL,
	[fast] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_speed] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tax]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tax](
	[IDTax] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[datePay] [int] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_tax] PRIMARY KEY CLUSTERED 
(
	[IDTax] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[taxPay]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taxPay](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[tax] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[price] [float] NOT NULL,
	[coin] [int] NOT NULL,
 CONSTRAINT [PK_taxPay] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transactions]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactions](
	[IDTransaction] [int] IDENTITY(1,1) NOT NULL,
	[transactionUser] [int] NOT NULL,
	[transactionClient] [varchar](50) NOT NULL,
	[transactionDate] [date] NOT NULL,
 CONSTRAINT [PK_transactions] PRIMARY KEY CLUSTERED 
(
	[IDTransaction] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userReason]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userReason](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[banned] [int] NOT NULL,
	[reason] [varchar](255) NOT NULL,
	[date] [datetime] NOT NULL,
	[userX] [varchar](255) NOT NULL,
 CONSTRAINT [PK_userReason] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
	[pseudomyn] [varchar](255) NOT NULL,
	[salt] [nvarchar](500) NOT NULL,
	[password] [nvarchar](500) NOT NULL,
	[privilege] [bit] NOT NULL,
	[status] [bit] NOT NULL,
	[date] [datetime] NOT NULL,
	[question] [varchar](250) NULL,
	[answer] [varchar](250) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_LSBusiness]    Script Date: 21/07/2022 2:57:10 ******/
CREATE NONCLUSTERED INDEX [IX_LSBusiness] ON [dbo].[business]
(
	[ls] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_employeeEmergency]    Script Date: 21/07/2022 2:57:10 ******/
CREATE NONCLUSTERED INDEX [IX_employeeEmergency] ON [dbo].[contactEmergency]
(
	[employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[academic]  WITH CHECK ADD  CONSTRAINT [FK_academic_degreesAcademic] FOREIGN KEY([grade])
REFERENCES [dbo].[degreesAcademic] ([ID])
GO
ALTER TABLE [dbo].[academic] CHECK CONSTRAINT [FK_academic_degreesAcademic]
GO
ALTER TABLE [dbo].[academic]  WITH CHECK ADD  CONSTRAINT [FK_academic_employee] FOREIGN KEY([employee])
REFERENCES [dbo].[employee] ([ID])
GO
ALTER TABLE [dbo].[academic] CHECK CONSTRAINT [FK_academic_employee]
GO
ALTER TABLE [dbo].[business]  WITH CHECK ADD  CONSTRAINT [FK_myBusiness_legalStructure] FOREIGN KEY([ls])
REFERENCES [dbo].[legalStructure] ([ID])
GO
ALTER TABLE [dbo].[business] CHECK CONSTRAINT [FK_myBusiness_legalStructure]
GO
ALTER TABLE [dbo].[buy]  WITH CHECK ADD  CONSTRAINT [FK_buy_clients] FOREIGN KEY([client])
REFERENCES [dbo].[clients] ([dni])
GO
ALTER TABLE [dbo].[buy] CHECK CONSTRAINT [FK_buy_clients]
GO
ALTER TABLE [dbo].[buy]  WITH CHECK ADD  CONSTRAINT [FK_buy_users] FOREIGN KEY([seller])
REFERENCES [dbo].[users] ([ID])
GO
ALTER TABLE [dbo].[buy] CHECK CONSTRAINT [FK_buy_users]
GO
ALTER TABLE [dbo].[buysPrices]  WITH CHECK ADD  CONSTRAINT [FK_buysPrices_buys] FOREIGN KEY([codeBuy])
REFERENCES [dbo].[buysProduct] ([buyCode])
GO
ALTER TABLE [dbo].[buysPrices] CHECK CONSTRAINT [FK_buysPrices_buys]
GO
ALTER TABLE [dbo].[buysPrices]  WITH CHECK ADD  CONSTRAINT [FK_buysPrices_coins] FOREIGN KEY([buyCoin])
REFERENCES [dbo].[coin] ([ID])
GO
ALTER TABLE [dbo].[buysPrices] CHECK CONSTRAINT [FK_buysPrices_coins]
GO
ALTER TABLE [dbo].[buysProduct]  WITH CHECK ADD  CONSTRAINT [FK_buys_productsPrices] FOREIGN KEY([buyProductPrice])
REFERENCES [dbo].[productsPrices] ([IDPP])
GO
ALTER TABLE [dbo].[buysProduct] CHECK CONSTRAINT [FK_buys_productsPrices]
GO
ALTER TABLE [dbo].[clients]  WITH CHECK ADD  CONSTRAINT [FK_clients_nationalities] FOREIGN KEY([nationality])
REFERENCES [dbo].[nationalities] ([ID])
GO
ALTER TABLE [dbo].[clients] CHECK CONSTRAINT [FK_clients_nationalities]
GO
ALTER TABLE [dbo].[clients]  WITH CHECK ADD  CONSTRAINT [FK_clients_users] FOREIGN KEY([userRegister])
REFERENCES [dbo].[users] ([ID])
GO
ALTER TABLE [dbo].[clients] CHECK CONSTRAINT [FK_clients_users]
GO
ALTER TABLE [dbo].[coin_price]  WITH CHECK ADD  CONSTRAINT [FK_coin_price_coin] FOREIGN KEY([coin])
REFERENCES [dbo].[coin] ([ID])
GO
ALTER TABLE [dbo].[coin_price] CHECK CONSTRAINT [FK_coin_price_coin]
GO
ALTER TABLE [dbo].[conceptBuy]  WITH CHECK ADD  CONSTRAINT [FK_conceptBuy_buy] FOREIGN KEY([buy])
REFERENCES [dbo].[buy] ([ID])
GO
ALTER TABLE [dbo].[conceptBuy] CHECK CONSTRAINT [FK_conceptBuy_buy]
GO
ALTER TABLE [dbo].[conceptBuy]  WITH CHECK ADD  CONSTRAINT [FK_conceptBuy_products] FOREIGN KEY([product])
REFERENCES [dbo].[products] ([code])
GO
ALTER TABLE [dbo].[conceptBuy] CHECK CONSTRAINT [FK_conceptBuy_products]
GO
ALTER TABLE [dbo].[conceptOrder]  WITH CHECK ADD  CONSTRAINT [FK_conceptOrder_conceptOrder] FOREIGN KEY([product])
REFERENCES [dbo].[products] ([code])
GO
ALTER TABLE [dbo].[conceptOrder] CHECK CONSTRAINT [FK_conceptOrder_conceptOrder]
GO
ALTER TABLE [dbo].[conceptOrder]  WITH CHECK ADD  CONSTRAINT [FK_conceptOrder_orders] FOREIGN KEY([orderD])
REFERENCES [dbo].[orders] ([ID])
GO
ALTER TABLE [dbo].[conceptOrder] CHECK CONSTRAINT [FK_conceptOrder_orders]
GO
ALTER TABLE [dbo].[conceptRequest]  WITH CHECK ADD  CONSTRAINT [FK_conceptRequest_products] FOREIGN KEY([product])
REFERENCES [dbo].[products] ([code])
GO
ALTER TABLE [dbo].[conceptRequest] CHECK CONSTRAINT [FK_conceptRequest_products]
GO
ALTER TABLE [dbo].[conceptRequest]  WITH CHECK ADD  CONSTRAINT [FK_conceptRequest_request] FOREIGN KEY([request])
REFERENCES [dbo].[request] ([ID])
GO
ALTER TABLE [dbo].[conceptRequest] CHECK CONSTRAINT [FK_conceptRequest_request]
GO
ALTER TABLE [dbo].[contactEmergency]  WITH CHECK ADD  CONSTRAINT [FK_employeesContactEmergency_employees] FOREIGN KEY([employee])
REFERENCES [dbo].[employee] ([ID])
GO
ALTER TABLE [dbo].[contactEmergency] CHECK CONSTRAINT [FK_employeesContactEmergency_employees]
GO
ALTER TABLE [dbo].[distributorReason]  WITH CHECK ADD  CONSTRAINT [FK_distributorReason_distributors] FOREIGN KEY([distributor])
REFERENCES [dbo].[distributors] ([rif])
GO
ALTER TABLE [dbo].[distributorReason] CHECK CONSTRAINT [FK_distributorReason_distributors]
GO
ALTER TABLE [dbo].[distributorReason]  WITH CHECK ADD  CONSTRAINT [FK_distributorReason_users] FOREIGN KEY([userX])
REFERENCES [dbo].[users] ([ID])
GO
ALTER TABLE [dbo].[distributorReason] CHECK CONSTRAINT [FK_distributorReason_users]
GO
ALTER TABLE [dbo].[distributors]  WITH CHECK ADD  CONSTRAINT [FK_distributors_legalStructure] FOREIGN KEY([ls])
REFERENCES [dbo].[legalStructure] ([ID])
GO
ALTER TABLE [dbo].[distributors] CHECK CONSTRAINT [FK_distributors_legalStructure]
GO
ALTER TABLE [dbo].[distributors]  WITH CHECK ADD  CONSTRAINT [FK_distributors_users] FOREIGN KEY([registeredBy])
REFERENCES [dbo].[users] ([ID])
GO
ALTER TABLE [dbo].[distributors] CHECK CONSTRAINT [FK_distributors_users]
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK_employee_jobs] FOREIGN KEY([job])
REFERENCES [dbo].[jobs] ([ID])
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_employee_jobs]
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK_employee_nationalities] FOREIGN KEY([nationality])
REFERENCES [dbo].[nationalities] ([ID])
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_employee_nationalities]
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK_employee_payDate] FOREIGN KEY([datePay])
REFERENCES [dbo].[payDate] ([ID])
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_employee_payDate]
GO
ALTER TABLE [dbo].[entryInventary]  WITH CHECK ADD  CONSTRAINT [FK_entryInventary_products] FOREIGN KEY([product])
REFERENCES [dbo].[products] ([code])
GO
ALTER TABLE [dbo].[entryInventary] CHECK CONSTRAINT [FK_entryInventary_products]
GO
ALTER TABLE [dbo].[entryInventary]  WITH CHECK ADD  CONSTRAINT [FK_entryInventary_users] FOREIGN KEY([registeredBy])
REFERENCES [dbo].[users] ([ID])
GO
ALTER TABLE [dbo].[entryInventary] CHECK CONSTRAINT [FK_entryInventary_users]
GO
ALTER TABLE [dbo].[inventory]  WITH CHECK ADD  CONSTRAINT [FK_inventory_products] FOREIGN KEY([product])
REFERENCES [dbo].[products] ([code])
GO
ALTER TABLE [dbo].[inventory] CHECK CONSTRAINT [FK_inventory_products]
GO
ALTER TABLE [dbo].[inventoryLot]  WITH CHECK ADD  CONSTRAINT [FK_inventoryLot_products] FOREIGN KEY([product])
REFERENCES [dbo].[products] ([code])
GO
ALTER TABLE [dbo].[inventoryLot] CHECK CONSTRAINT [FK_inventoryLot_products]
GO
ALTER TABLE [dbo].[inventoryLot]  WITH CHECK ADD  CONSTRAINT [FK_inventoryLot_request] FOREIGN KEY([lot])
REFERENCES [dbo].[request] ([ID])
GO
ALTER TABLE [dbo].[inventoryLot] CHECK CONSTRAINT [FK_inventoryLot_request]
GO
ALTER TABLE [dbo].[inventoryLot]  WITH CHECK ADD  CONSTRAINT [FK_inventoryLot_users] FOREIGN KEY([registeredBy])
REFERENCES [dbo].[users] ([ID])
GO
ALTER TABLE [dbo].[inventoryLot] CHECK CONSTRAINT [FK_inventoryLot_users]
GO
ALTER TABLE [dbo].[inventoryLotReason]  WITH CHECK ADD  CONSTRAINT [FK_inventoryLotReason_inventoryLot] FOREIGN KEY([lot])
REFERENCES [dbo].[inventoryLot] ([id])
GO
ALTER TABLE [dbo].[inventoryLotReason] CHECK CONSTRAINT [FK_inventoryLotReason_inventoryLot]
GO
ALTER TABLE [dbo].[inventoryLotReason]  WITH CHECK ADD  CONSTRAINT [FK_inventoryLotReason_users] FOREIGN KEY([userX])
REFERENCES [dbo].[users] ([ID])
GO
ALTER TABLE [dbo].[inventoryLotReason] CHECK CONSTRAINT [FK_inventoryLotReason_users]
GO
ALTER TABLE [dbo].[inventoryProductReason]  WITH CHECK ADD  CONSTRAINT [FK_inventoryProductReason_products] FOREIGN KEY([product])
REFERENCES [dbo].[products] ([code])
GO
ALTER TABLE [dbo].[inventoryProductReason] CHECK CONSTRAINT [FK_inventoryProductReason_products]
GO
ALTER TABLE [dbo].[inventoryProductReason]  WITH CHECK ADD  CONSTRAINT [FK_inventoryProductReason_request] FOREIGN KEY([lot])
REFERENCES [dbo].[request] ([ID])
GO
ALTER TABLE [dbo].[inventoryProductReason] CHECK CONSTRAINT [FK_inventoryProductReason_request]
GO
ALTER TABLE [dbo].[inventoryProductReason]  WITH CHECK ADD  CONSTRAINT [FK_inventoryProductReason_users] FOREIGN KEY([registerBy])
REFERENCES [dbo].[users] ([ID])
GO
ALTER TABLE [dbo].[inventoryProductReason] CHECK CONSTRAINT [FK_inventoryProductReason_users]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_distributors] FOREIGN KEY([distributor])
REFERENCES [dbo].[distributors] ([rif])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_distributors]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_users] FOREIGN KEY([madeBy])
REFERENCES [dbo].[users] ([ID])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_users]
GO
ALTER TABLE [dbo].[productReason]  WITH CHECK ADD  CONSTRAINT [FK_productReason_products] FOREIGN KEY([product])
REFERENCES [dbo].[products] ([code])
GO
ALTER TABLE [dbo].[productReason] CHECK CONSTRAINT [FK_productReason_products]
GO
ALTER TABLE [dbo].[productReason]  WITH CHECK ADD  CONSTRAINT [FK_productReason_users] FOREIGN KEY([userX])
REFERENCES [dbo].[users] ([ID])
GO
ALTER TABLE [dbo].[productReason] CHECK CONSTRAINT [FK_productReason_users]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_measure] FOREIGN KEY([description])
REFERENCES [dbo].[measure] ([ID])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_measure]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_productsCategory] FOREIGN KEY([category])
REFERENCES [dbo].[category] ([ID])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_productsCategory]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_users] FOREIGN KEY([registeredBy])
REFERENCES [dbo].[users] ([ID])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_users]
GO
ALTER TABLE [dbo].[productsPrices]  WITH CHECK ADD  CONSTRAINT [FK_productsPrices_coins] FOREIGN KEY([productCoin])
REFERENCES [dbo].[coin] ([ID])
GO
ALTER TABLE [dbo].[productsPrices] CHECK CONSTRAINT [FK_productsPrices_coins]
GO
ALTER TABLE [dbo].[request]  WITH CHECK ADD  CONSTRAINT [FK_request_distributors] FOREIGN KEY([distributor])
REFERENCES [dbo].[distributors] ([rif])
GO
ALTER TABLE [dbo].[request] CHECK CONSTRAINT [FK_request_distributors]
GO
ALTER TABLE [dbo].[request]  WITH CHECK ADD  CONSTRAINT [FK_request_users] FOREIGN KEY([receivedBy])
REFERENCES [dbo].[users] ([ID])
GO
ALTER TABLE [dbo].[request] CHECK CONSTRAINT [FK_request_users]
GO
ALTER TABLE [dbo].[tax]  WITH CHECK ADD  CONSTRAINT [FK_tax_payDate] FOREIGN KEY([datePay])
REFERENCES [dbo].[payDate] ([ID])
GO
ALTER TABLE [dbo].[tax] CHECK CONSTRAINT [FK_tax_payDate]
GO
ALTER TABLE [dbo].[taxPay]  WITH CHECK ADD  CONSTRAINT [FK_taxPay_coins] FOREIGN KEY([coin])
REFERENCES [dbo].[coin] ([ID])
GO
ALTER TABLE [dbo].[taxPay] CHECK CONSTRAINT [FK_taxPay_coins]
GO
ALTER TABLE [dbo].[taxPay]  WITH CHECK ADD  CONSTRAINT [FK_taxPay_tax] FOREIGN KEY([tax])
REFERENCES [dbo].[tax] ([IDTax])
GO
ALTER TABLE [dbo].[taxPay] CHECK CONSTRAINT [FK_taxPay_tax]
GO
ALTER TABLE [dbo].[transactions]  WITH CHECK ADD  CONSTRAINT [FK_transactions_users] FOREIGN KEY([transactionUser])
REFERENCES [dbo].[users] ([ID])
GO
ALTER TABLE [dbo].[transactions] CHECK CONSTRAINT [FK_transactions_users]
GO
ALTER TABLE [dbo].[userReason]  WITH CHECK ADD  CONSTRAINT [FK_userReason_users] FOREIGN KEY([banned])
REFERENCES [dbo].[users] ([ID])
GO
ALTER TABLE [dbo].[userReason] CHECK CONSTRAINT [FK_userReason_users]
GO
/****** Object:  StoredProcedure [dbo].[SelectCE]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SelectCE]
	@ID int
AS
BEGIN
	SELECT IDCE, employeeName, contactEmergencyName, contactEmergencyFormat, contactEmergencyContent, parent
	FROM employeesContactEmergency
	INNER JOIN employees ON employeesContactEmergency.emergencyEmployee = employees.IDEmployee
	WHERE IDCE = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spActiveClient]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spActiveClient]
	@ID int
AS
BEGIN
	Declare @statusActive int
	Declare @statusInactive int

	SELECT TOP (1) @statusActive = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP (1) @statusInactive = [IDStatus] FROM status WHERE IDStatus != @statusActive ORDER BY IDStatus ASC

	UPDATE clients
	SET clientStatus = @statusActive
	WHERE IDClient = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spActiveCoins]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActiveCoins]
 @ID int
AS
BEGIN
	DECLARE @Status int
	DECLARE @Inactive int
	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP(1) @Inactive = [IDStatus] FROM status WHERE IDStatus != @Status ORDER BY IDStatus ASC

	UPDATE coins
   SET coinStatus = @Status
	WHERE IDCoin = @ID

END
GO
/****** Object:  StoredProcedure [dbo].[spActiveDistributor]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActiveDistributor]
	@ID int
AS
BEGIN
	Declare @statusActive int
	Declare @statusInactive int

	SELECT TOP (1) @statusActive = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP (1) @statusInactive = [IDStatus] FROM status WHERE IDStatus != @statusActive ORDER BY IDStatus ASC

	UPDATE distributors SET distributorStatus = @statusActive
	WHERE IDDistributor = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spActiveMeasure]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spActiveMeasure]
	@ID int
AS
BEGIN
	DECLARE @Status INT
	DECLARE @StatusInactive INT
	SELECT TOP (1) @Status =[IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP (1) @StatusInactive =[IDStatus] FROM status ORDER BY IDStatus ASC

	UPDATE measure SET status=@Status WHERE ID = @ID

END
GO
/****** Object:  StoredProcedure [dbo].[spActivePacking]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spActivePacking]
	@ID int
AS
BEGIN
	DECLARE @Status INT
	DECLARE @StatusInactive INT
	SELECT TOP (1) @Status =[IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP (1) @StatusInactive =[IDStatus] FROM status WHERE IDStatus != @Status ORDER BY IDStatus ASC

	UPDATE packing SET status=@Status WHERE ID = @ID

END
GO
/****** Object:  StoredProcedure [dbo].[spActivePayMethod]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spActivePayMethod]
@ID INT
AS
BEGIN
	DECLARE @Status INT
	DECLARE @StatusInactive INT
	SELECT TOP (1) @Status =[IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP (1) @StatusInactive =[IDStatus] FROM status WHERE IDStatus != @Status ORDER BY IDStatus ASC

	UPDATE payMethod
	SET status =  @Status
	WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spActiveProduct]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spActiveProduct]
	@ID int
AS
BEGIN
	Declare @statusActive int
	Declare @statusInactive int

	SELECT TOP (1) @statusActive = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP (1) @statusInactive = [IDStatus] FROM status WHERE IDStatus != @statusActive ORDER BY IDStatus ASC

	UPDATE products
	SET productStatus = @statusActive
	WHERE IDProduct = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spActiveProductCategory]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spActiveProductCategory]
	@ID int
AS
BEGIN
	Declare @statusActive int
	Declare @statusInactive int

	SELECT TOP (1) @statusActive = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP (1) @statusInactive = [IDStatus] FROM status WHERE IDStatus != @statusActive ORDER BY IDStatus ASC

	UPDATE productsCategory
	SET categoryStatus = @statusActive
	WHERE IDPC = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spActiveProductsCategory]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spActiveProductsCategory]
	@ID int
AS
BEGIN
	DECLARE @Status int

	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC

	UPDATE [dbo].[productsCategory]
   SET [categoryStatus] = @Status
   WHERE IDPC = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spActiveTax]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spActiveTax]
	@ID int
AS
BEGIN
	DECLARE @Status INT
	DECLARE @StatusInactive INT
	SELECT TOP (1) @Status =[IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP (1) @StatusInactive =[IDStatus] FROM status WHERE IDStatus != @Status ORDER BY IDStatus ASC

	UPDATE tax SET status=@Status WHERE IDTax = @ID

END
GO
/****** Object:  StoredProcedure [dbo].[spAssignPriceCoin]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spAssignPriceCoin]
@ID int,
@Price float
AS
BEGIN
	UPDATE coinPrice
	SET price = @price
	WHERE coin = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spAssignPriceProduct]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spAssignPriceProduct]
@ID int,
@Price float,
@Coin int
AS
BEGIN
	UPDATE productsPrices
    SET productPrice = @Price, productCoin = @Coin
	WHERE product = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultCategoryProduct]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultCategoryProduct]
AS
BEGIN
	SELECT ROW_NUMBER() OVER(ORDER BY IDPC ASC) AS Num, IDPC, IDStatus, categoryName, statusNameEs, (SELECT COUNT(*) FROM products WHERE category = IDPC GROUP BY category) AS quantity
	FROM productsCategory
	INNER JOIN status ON categoryStatus = IDStatus
	ORDER BY IDPC ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultClients]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultClients]
AS
BEGIN
	DECLARE @Anonymous int
	DECLARE @Status int
	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP(1) @Anonymous = [IDClient] FROM clients ORDER BY IDClient ASC

	SELECT ROW_NUMBER()OVER(ORDER BY IDClient ASC) AS Num, IDClient, clientName, nationAcronym, clientDNI, clientPhone 
	FROM clients
	INNER JOIN nationalities ON nationalities.IDNation = clients.clientNationality
	WHERE clientStatus = @Status AND IDClient != @Anonymous
	ORDER BY IDClient ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultClientsInactive]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultClientsInactive]
AS
BEGIN
	DECLARE @Anonymous int
	DECLARE @Status int
	DECLARE @StatusActive int
	SELECT TOP(1) @StatusActive = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP(1) @Status = [IDStatus] FROM status WHERE IDStatus != @StatusActive ORDER BY IDStatus ASC
	SELECT TOP(1) @Anonymous = [IDClient] FROM clients ORDER BY IDClient ASC

	SELECT ROW_NUMBER()OVER(ORDER BY IDClient ASC) AS Num, IDClient, clientName, nationAcronym, clientDNI, clientPhone 
	FROM clients
	INNER JOIN nationalities ON nationalities.IDNation = clients.clientNationality
	WHERE clientStatus = @Status AND IDClient != @Anonymous
	ORDER BY IDClient ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultCoins]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultCoins]
AS
BEGIN
	DECLARE @Coin int

	SELECT TOP(1) @Coin = [IDCoin] FROM coins ORDER BY IDCoin ASC
	DECLARE @Status int
	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC

	SELECT ROW_NUMBER() OVER(ORDER BY IDCoin ASC) AS Num, IDCoin, coinName, coinAcronym, coinRegion, coinStatus, statusNameEs, price 
	FROM coins 
	INNER JOIN coinPrice ON coins.IDCoin = coinPrice.coin 
	INNER JOIN status ON coins.coinStatus = status.IDStatus
	WHERE IDStatus = @Status AND IDCoin != @Coin
	ORDER BY IDCoin ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultCoinsInactive]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultCoinsInactive]
AS
BEGIN
	DECLARE @Status int
	DECLARE @Inactive int
	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP(1) @Inactive = [IDStatus] FROM status WHERE IDStatus != @Status ORDER BY IDStatus ASC

	SELECT ROW_NUMBER() OVER(ORDER BY IDCoin ASC) AS Num, IDCoin, coinName, coinAcronym, coinRegion, statusNameEs, price 
	FROM coins INNER JOIN coinPrice ON coins.IDCoin = coinPrice.coin
	INNER JOIN status ON coins.coinStatus = status.IDStatus
	WHERE IDStatus = @Inactive
	ORDER BY IDCoin ASC

END
GO
/****** Object:  StoredProcedure [dbo].[spConsultDistributor]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultDistributor]
AS
BEGIN
	
	DECLARE @StatusActive int
	DECLARE @StatusInactive int
	SELECT TOP(1) @StatusActive = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP(1) @StatusInactive = [IDStatus] FROM status WHERE IDStatus != @StatusActive ORDER BY IDStatus ASC

	SELECT ROW_NUMBER() OVER(ORDER BY IDDistributor ASC) AS Num, IDDistributor, distributorName, distributorPhone, distributorRIF , lsNameES, balance, statusNameEs
	FROM distributors
	INNER JOIN distributorBalance ON distributors.IDDistributor = distributorBalance.distributor
	INNER JOIN legalStructure ON distributors.distributorLS = legalStructure.IDLS
	INNER JOIN status ON distributors.distributorStatus = status.IDStatus
	WHERE distributorStatus = @StatusActive
	ORDER BY IDDistributor ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultDistributorInactive]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultDistributorInactive]
AS
BEGIN
	
	DECLARE @StatusActive int
	DECLARE @StatusInactive int
	SELECT TOP(1) @StatusActive = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP(1) @StatusInactive = [IDStatus] FROM status WHERE IDStatus != @StatusActive ORDER BY IDStatus ASC

	SELECT ROW_NUMBER() OVER(ORDER BY IDDistributor ASC) AS Num, IDDistributor, distributorName, distributorPhone, distributorRIF, lsNameES, balance, statusNameEs
	FROM distributors
	INNER JOIN distributorBalance ON distributors.IDDistributor = distributorBalance.distributor
	INNER JOIN status ON distributors.distributorStatus = status.IDStatus
	INNER JOIN legalStructure ON distributors.distributorLS = legalStructure.IDLS
	WHERE distributorStatus = @StatusInactive
	ORDER BY IDDistributor ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultEmployee]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultEmployee]
	@Employee int
AS
BEGIN
	SELECT IDEmployee, employeeName, nationName, dni, dateOfBirth, numberPhone, numberSocialSecurity, statusNameEs, jobName, salaryBase, coinAcronym, nameHoraryEs, answerOptionES FROM employees 
	INNER JOIN employeesJobs ON employeesJobs.employee = employees.IDEmployee 
	INNER JOIN jobs ON jobs.IDJob = employeesJobs.job
	INNER JOIN answers ON answers.IDAnswer = employees.IsUser
	INNER JOIN status ON status.IDStatus = employees.employeeStatus
	INNER JOIN employeesSalarys ON employeesSalarys.employeeSalary = employees.IDEmployee
	INNER JOIN coins ON coins.IDCoin = employeesSalarys.salaryCoin
	INNER JOIN employeesHorary ON employeesHorary.horaryEmployee = employees.IDEmployee
	INNER JOIN horarysNames ON horarysNames.IDHN = employeesHorary.horaryName
	INNER JOIN nationalities ON nationalities.IDNation = employees.nationality
	WHERE employees.IDEmployee = @Employee
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultEmployees]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultEmployees]
AS
BEGIN
	DECLARE @Status int
	DECLARE @BackDoor int
	DECLARE @User int

	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP(1) @BackDoor = [IDEmployee] FROM employees ORDER BY IDEmployee ASC
	SELECT TOP(1) @User = [IDEmployee] FROM employees WHERE IDEmployee !=@BackDoor ORDER BY IDEmployee ASC

	SELECT IDEmployee, employeeName FROM employees 
	WHERE employeeStatus = @Status AND IDEmployee != @BackDoor AND IDEmployee != @User
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultEmployeesAcademics]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultEmployeesAcademics]
AS
BEGIN
	
	SELECT ROW_NUMBER() OVER(ORDER BY IDEA ASC) AS Num, IDEA, employeeName, nationAcronym, dni, daName, titleGradeName FROM employees 
	INNER JOIN employeesAcademic ON employees.IDEmployee = employeesAcademic.academicEmployee 
	INNER JOIN degreesAcademic ON degreesAcademic.IDDA = employeesAcademic.academicGrade
	INNER JOIN nationalities ON nationalities.IDNation = employees.nationality
	ORDER BY IDEA ASC

END
GO
/****** Object:  StoredProcedure [dbo].[spConsultEmployeesActives]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultEmployeesActives]
AS
BEGIN
	DECLARE @Status int
	DECLARE @BackDoor int
	DECLARE @User int

	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP(1) @BackDoor = [IDEmployee] FROM employees ORDER BY IDEmployee ASC
	SELECT TOP(1) @User = [IDEmployee] FROM employees WHERE IDEmployee !=@BackDoor ORDER BY IDEmployee ASC

	SELECT ROW_NUMBER() OVER(ORDER BY IDEmployee ASC) AS Num, IDEmployee, employeeName, nationAcronym, dni, numberPhone, numberSocialSecurity, statusNameEs, answerOptionES, statusName 
	FROM employees 
	INNER JOIN nationalities ON employees.nationality = nationalities.idNation 
	INNER JOIN status ON employees.employeeStatus = status.idStatus 
	INNER JOIN answers ON employees.isUser = answers.IDAnswer
	WHERE employeeStatus = @Status AND IDEmployee != @BackDoor AND IDEmployee != @User
	ORDER BY IDEmployee ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultEmployeesCE]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultEmployeesCE]
AS
BEGIN
	SELECT ROW_NUMBER() OVER(ORDER BY IDCE) as Num, IDCE, employeeName, contactEmergencyName, parent, contactEmergencyFormat, contactEmergencyContent 
	FROM employees 
	INNER JOIN employeesContactEmergency ON employees.IDEmployee = employeesContactEmergency.emergencyEmployee 
	ORDER BY IDCE ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultEmployeesHorary]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultEmployeesHorary]
	
AS
BEGIN
	DECLARE @Status int
	DECLARE @BackDoor int
	DECLARE @User int

	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP(1) @BackDoor = [IDEmployee] FROM employees ORDER BY IDEmployee ASC
	SELECT TOP(1) @User = [IDEmployee] FROM employees WHERE IDEmployee !=@BackDoor ORDER BY IDEmployee ASC

	SELECT ROW_NUMBER() OVER(ORDER BY IDEH ASC) AS Num, IDEH, IDEmployee, employeeName, jobName, nameHoraryEs, horaryEntry, horaryExit 
	FROM employeesHorary
	INNER JOIN employees ON employees.IDEmployee = employeesHorary.horaryEmployee
	INNER JOIN horarysNames ON horarysNames.IDHN = employeesHorary.horaryName
	INNER JOIN employeesJobs ON employees.IDEmployee = employeesJobs.employee
	INNER JOIN jobs ON jobs.IDJob = employeesJobs.job
	WHERE employeeStatus = @Status AND IDEmployee != @BackDoor AND IDEmployee != @User
	ORDER BY IDEH ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultEmployeesInactives]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultEmployeesInactives]
AS
BEGIN
	Declare @statusActive int
	Declare @statusInactive int

	SELECT TOP (1) @statusActive = [IDStatus] FROM status
	SELECT TOP (1) @statusInactive = [IDStatus] FROM status WHERE IDStatus != @statusActive

	SELECT ROW_NUMBER() OVER(ORDER BY IDEmployee ASC) AS Num,
	IDEmployee, employeeName, nationAcronym, dni, numberPhone, numberSocialSecurity, statusNameEs, answerOptionES
	FROM employees 
	INNER JOIN nationalities ON employees.nationality = nationalities.idNation 
	INNER JOIN status ON employees.employeeStatus = status.idStatus 
	INNER JOIN answers ON employees.isUser = answers.IDAnswer
	WHERE status.IDStatus = @statusInactive
	ORDER BY IDEmployee ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultEmployeesJob]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultEmployeesJob]
AS
BEGIN
	DECLARE @Status int
	DECLARE @BackDoor int
	DECLARE @User int

	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP(1) @BackDoor = [IDEmployee] FROM employees ORDER BY IDEmployee ASC
	SELECT TOP(1) @User = [IDEmployee] FROM employees WHERE IDEmployee !=@BackDoor ORDER BY IDEmployee ASC

	SELECT ROW_NUMBER() OVER(ORDER BY IDEmployee ASC) AS Num, IDEmployee, employeeName, jobName, salaryBase, salaryForMinute, jobSalary, coinAcronym,  dateNameEs, nameHoraryEs
	FROM employeesSalarys
	INNER JOIN employees ON employees.IDEmployee = employeesSalarys.employeeSalary
	INNER JOIN coins ON coins.IDCoin = employeesSalarys.salaryCoin
	INNER JOIN employeesJobs ON employeesJobs.employee = employees.IDEmployee
	INNER JOIN jobs ON jobs.IDJob = employeesJobs.job
	INNER JOIN horarysNames ON employeesSalarys.salaryDate = horarysNames.IDHN
	INNER JOIN payDate ON employeesSalarys.salaryFormat = payDate.IDDate
	WHERE employeeStatus = @Status AND IDEmployee != @BackDoor AND IDEmployee != @User
	ORDER BY IDEmployee ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultEmployeesToUser]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultEmployeesToUser]
AS
BEGIN
	DECLARE @Answer int
	SELECT TOP (1) @Answer = [IDAnswer] FROM answers ORDER BY IDAnswer DESC
	SELECT IDEmployee, employeeName FROM employees WHERE isUser = @Answer
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultInventary]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultInventary]
AS
BEGIN

	SELECT ROW_NUMBER() OVER(ORDER BY IDInventory ASC) AS N, IDInventory, productName, productDescription, productPrice, inventoryAmount 
	FROM inventory
	INNER JOIN products ON products.IDProduct = inventory.inventoryProduct
	INNER JOIN productsPrices ON productsPrices.product = products.IDProduct
	WHERE inventoryAmount > 0

	
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultMeasure]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultMeasure]
AS
BEGIN

	SELECT ROW_NUMBER() OVER(ORDER BY ID) AS Num, ID, name, acronym, complete, answerOptionEs, status, statusNameEs
	FROM measure
	INNER JOIN status ON status.IDStatus = measure.status
	INNER JOIN answers ON answers.IDAnswer = measure.complete
	ORDER BY ID

END
GO
/****** Object:  StoredProcedure [dbo].[spConsultPacking]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultPacking]
AS
BEGIN

	SELECT ROW_NUMBER() OVER(ORDER BY ID) AS Num, ID, name, acronym, quantity, status, statusNameEs
	FROM packing
	INNER JOIN status ON status.IDStatus = packing.status
	ORDER BY ID

END
GO
/****** Object:  StoredProcedure [dbo].[spConsultPayMethod]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultPayMethod]
AS
BEGIN
	SELECT ROW_NUMBER() OVER(ORDER BY ID ASC) AS Num, ID, name, commission, status, statusNameES 
	FROM payMethod
	INNER JOIN status ON status.IDStatus = payMethod.status
	ORDER BY ID ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultProducts]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultProducts]
AS
BEGIN
	Declare @StatusActive int
	Declare @StatusInactive int
	SELECT TOP (1) @StatusActive = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP (1) @StatusInactive = [IDStatus] FROM status WHERE IDStatus != @statusActive ORDER BY IDStatus ASC
	
	SELECT ROW_NUMBER() OVER(ORDER BY IDProduct ASC) AS NUM, IDProduct, productName, IDPC, categoryName, measure.name, productDescription
	FROM products
	INNER JOIN productsCategory ON products.category = productsCategory.IDPC
	INNER JOIN measure ON productDescription = ID
	WHERE productStatus = @StatusActive
	ORDER BY IDProduct ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultProductsInactive]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultProductsInactive]
AS
BEGIN
	Declare @StatusActive int
	Declare @StatusInactive int
	SELECT TOP (1) @StatusActive = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP (1) @StatusInactive = [IDStatus] FROM status WHERE IDStatus != @statusActive ORDER BY IDStatus ASC
	
	SELECT ROW_NUMBER() OVER(ORDER BY IDProduct ASC) AS NUM, IDProduct, productName, IDPC, measure.name, categoryName, productDescription
	FROM products
	INNER JOIN productsCategory ON products.category = productsCategory.IDPC
	INNER JOIN measure ON productDescription = ID
	WHERE productStatus = @StatusInactive
	ORDER BY IDProduct ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultRequests]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultRequests]
AS
BEGIN
	
	DECLARE @StatusActive int
	DECLARE @StatusInactive int
	SELECT TOP(1) @StatusActive = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP(1) @StatusInactive = [IDStatus] FROM status WHERE IDStatus != @StatusActive ORDER BY IDStatus ASC

	SELECT ROW_NUMBER() OVER(ORDER BY requests.ID ASC) AS Num, (str(requests.ID) + '-' + distributorName) AS request, distributorName, (SELECT answerOptionEs FROM answers WHERE answers.IDAnswer = requestsPay.pay ) AS paid, (SELECT answerOptionEs FROM answers WHERE answers.IDAnswer = requestsReceive.receive) AS received, (SELECT COUNT(*) FROM conceptRequests WHERE request = requests.ID) AS quantity, statusNameEs  
	FROM requests
	INNER JOIN distributors ON distributors.IDDistributor = requests.distributor
	INNER JOIN status ON status.IDStatus = requests.status
	INNER JOIN requestsPay ON requestsPay.request = requests.ID
	INNER JOIN requestsReceive ON requestsReceive.request = requests.ID
	ORDER BY requests.ID

	
END

GO
/****** Object:  StoredProcedure [dbo].[spConsultSalary]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultSalary]
AS
BEGIN
	DECLARE @Status int
	DECLARE @BackDoor int
	DECLARE @User int

	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP(1) @BackDoor = [IDEmployee] FROM employees ORDER BY IDEmployee ASC
	SELECT TOP(1) @User = [IDEmployee] FROM employees WHERE IDEmployee !=@BackDoor ORDER BY IDEmployee ASC

	SELECT ROW_NUMBER() OVER(ORDER BY IDEmployee ASC) AS Num, IDEmployee, employeeName, jobName, salaryBase, coinAcronym, nameHoraryEs, dateNameEs 
	FROM employeesSalarys
	INNER JOIN employees ON employees.IDEmployee = employeesSalarys.employeeSalary
	INNER JOIN coins ON coins.IDCoin = employeesSalarys.salaryCoin
	INNER JOIN employeesJobs ON employeesJobs.employee = employees.IDEmployee
	INNER JOIN jobs ON jobs.IDJob = employeesJobs.job
	INNER JOIN horarysNames ON employeesSalarys.salaryDate = horarysNames.IDHN
	INNER JOIN payDate ON employeesSalarys.salaryFormat = payDate.IDDate
	WHERE employeeStatus = @Status AND IDEmployee != @BackDoor AND IDEmployee != @User
	ORDER BY IDEmployee ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultTax]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultTax]
AS
BEGIN

	SELECT ROW_NUMBER() OVER(ORDER BY IDTax) AS Num, IDTax, name, datePay, status, statusNameEs, dateNameEs
	FROM tax
	INNER JOIN status ON status.IDStatus = tax.status
	INNER JOIN payDate ON payDate.IDDate = tax.datePay
	ORDER BY IDTax

END
GO
/****** Object:  StoredProcedure [dbo].[spConsultTaxPay]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultTaxPay]
AS
BEGIN
	SELECT ROW_NUMBER() OVER(ORDER BY ID ASC) AS Num, taxPay.ID AS pay, name, tax, date, (Str(price)+'	'+coinAcronym) AS priceTotal
	FROM taxPay
	INNER JOIN coins ON coins.IDCoin = taxPay.coin
	INNER JOIN tax ON tax.IDTax = taxPay.tax
	ORDER BY pay ASC

END
GO
/****** Object:  StoredProcedure [dbo].[spConsultUser]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultUser]
	@ID int
AS
BEGIN

	SELECT IDUser, employeeName, pseudomyn, mail, password, statusNameEs, privilegeName
	FROM employees
	INNER JOIN users ON users.userEmployee = employees.IDEmployee
	INNER JOIN status ON users.userStatus = status.IDStatus
	INNER JOIN privileges ON users.privilege = privileges.idPrivilege
	WHERE users.idUser = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultUsers]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultUsers]
AS
BEGIN
	Declare @StatusActive int
	Declare @Privilege int
	
	SELECT TOP(1) @StatusActive = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP(1) @Privilege= [idPrivilege] FROM privileges ORDER BY idPrivilege DESC

	SELECT ROW_NUMBER() OVER(ORDER BY idUser ASC) AS Num, idUser, employeeName, pseudomyn, mail, statusNameEs
	FROM employees
	INNER JOIN users ON users.userEmployee = employees.IDEmployee
	INNER JOIN status ON users.userStatus = status.IDStatus
	WHERE users.userStatus = @StatusActive AND users.privilege = @Privilege
	ORDER BY idUser ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultUsersInactive]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultUsersInactive]
AS
BEGIN
	DECLARE @StatusInactive int
	DECLARE @StatusActive int
	Declare @Privilege int

	SELECT TOP (1) @StatusActive = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP (1) @StatusInactive = [IDStatus] FROM status WHERE IDStatus != @StatusActive ORDER BY IDStatus ASC
	SELECT TOP(1) @Privilege = [idPrivilege] FROM privileges ORDER BY idPrivilege DESC

	SELECT ROW_NUMBER() OVER(ORDER BY idUser ASC) AS Num, idUser, employeeName, pseudomyn, mail, statusNameEs
	FROM employees
	INNER JOIN users ON users.userEmployee = employees.IDEmployee
	INNER JOIN status ON users.userStatus = status.IDStatus
	WHERE users.userStatus = @StatusInactive AND users.privilege = @Privilege
	ORDER BY idUser ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteAcademic]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDeleteAcademic]
	@ID int
AS
BEGIN
	
	DELETE FROM employeesAcademic WHERE IDEA = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spDeleteCE]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spDeleteCE]
	@ID int
AS
BEGIN
	DELETE FROM employeesContactEmergency WHERE IDCE = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spEmployeeActive]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEmployeeActive]
	@ID int
AS
BEGIN
	Declare @statusActive int
	Declare @statusInactive int

	SELECT TOP (1) @statusActive = [IDStatus] FROM status
	SELECT TOP (1) @statusInactive = [IDStatus] FROM status WHERE IDStatus != @statusActive

	UPDATE employees
	SET employeeStatus = @statusActive
	WHERE IDEmployee = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spEmployeeInactive]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEmployeeInactive]
	@ID int
AS
BEGIN
	Declare @statusActive int
	Declare @statusInactive int

	SELECT TOP (1) @statusActive = [IDStatus] FROM status
	SELECT TOP (1) @statusInactive = [IDStatus] FROM status WHERE IDStatus != @statusActive

	UPDATE employees
	SET employeeStatus = @statusInactive
	WHERE IDEmployee = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spEstablishAnswers]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEstablishAnswers]
AS
BEGIN

INSERT INTO answers (answerOption , answerOptionEs) VALUES ('Yes', 'Si')
INSERT INTO answers (answerOption , answerOptionEs) VALUES ('No', 'No')

END
GO
/****** Object:  StoredProcedure [dbo].[spEstablishClientAnonymous]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEstablishClientAnonymous]
AS
BEGIN
	Declare @Status int
	Declare @Coin int
	Declare @Client int
	Declare @Nation int

	SELECT TOP (1) @Status = [IDStatus] FROM status
	SELECT TOP (1) @Coin = [IDCoin] FROM coins ORDER BY IDCoin ASC
	SELECT TOP (1) @Nation = [IDNation] FROM nationalities ORDER BY IDNation ASC

	INSERT INTO clients(clientName, clientNationality, clientDNI, clientPhone,clientStatus)
    VALUES ('Anonimo', @Nation, '1', 'S/N', @Status)
	
	set @Client =@@IDENTITY

	INSERT INTO clientsCredit(clientCredit, coinCredit, maxCredit)
     VALUES (@Client, @Coin , 0)

	 INSERT INTO clientsDebt(clientDebt, coinDebt, Debt)
     VALUES (@Client, @Coin , 0)

END
GO
/****** Object:  StoredProcedure [dbo].[spEstablishDegreesAcademic]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEstablishDegreesAcademic]
AS
BEGIN
	INSERT INTO degreesAcademic (daName, percentage) VALUES('Curso', 5)
	INSERT INTO degreesAcademic (daName, percentage) VALUES('TSU', 10)
	INSERT INTO degreesAcademic (daName, percentage) VALUES('Licenciatura', 20)
	INSERT INTO degreesAcademic (daName, percentage) VALUES('Ingenieria', 20)
	INSERT INTO degreesAcademic (daName, percentage) VALUES('Maestria', 25)
END
GO
/****** Object:  StoredProcedure [dbo].[spEstablishHoraryBusiness]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEstablishHoraryBusiness]
AS
BEGIN
	INSERT INTO horaryBusiness(hourEntry, hourExit)
     VALUES ('00:00:00', '00:00:00')

END
GO
/****** Object:  StoredProcedure [dbo].[spEstablishHoraryName]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEstablishHoraryName]
AS
BEGIN

    INSERT INTO horarysNames (nameHorary, nameHoraryEs) VALUES ('Complete', 'Completo')
	INSERT INTO horarysNames (nameHorary, nameHoraryEs) VALUES ('Halftime', 'Medio tiempo')	
	INSERT INTO horarysNames (nameHorary, nameHoraryEs) VALUES ('Partial', 'Parcial')

END
GO
/****** Object:  StoredProcedure [dbo].[spEstablishJobs]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEstablishJobs]
AS
BEGIN
	DECLARE @Coin int 

	SELECT TOP (1) @Coin = [IDCoin] FROM coins ORDER BY IDCoin ASC

	INSERT INTO jobs (jobName, jobSalary, jobCoin) VALUES ('Desarrollador', 0, @Coin)
	INSERT INTO jobs (jobName, jobSalary, jobCoin) VALUES ('Propietario (a)', 0, @Coin)
	INSERT INTO jobs (jobName, jobSalary, JobCoin) VALUES ('NO DEFINIDO', 0, @Coin)
	INSERT INTO jobs (jobName, jobSalary, jobCoin) VALUES ('Gerente', 0, @Coin)
	INSERT INTO jobs (jobName, jobSalary, jobCoin) VALUES ('Cajero (a)', 0, @Coin)

END
GO
/****** Object:  StoredProcedure [dbo].[spEstablishLegalStructure]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEstablishLegalStructure]
AS
BEGIN
                    
	INSERT INTO legalStructure (lsName, lsNameES) VALUES ('S.L(Sociaty Limited)', 'S.L (Sociedad Limitada)')
	INSERT INTO legalStructure (lsName, lsNameES) VALUES ('S.A (Public Limited Company)', 'S.A (Sociedad Anónima)')
	INSERT INTO legalStructure (lsName, lsNameES) VALUES ('S.L.U (Unilateral Limited Company)', 'S.L.U (Sociedad Limitada Unilateral)')
	INSERT INTO legalStructure (lsName, lsNameES) VALUES ('Cooperative', 'Cooperativa')
	INSERT INTO legalStructure (lsName, lsNameES) VALUES ('Social Capital', 'Capital Social')
	INSERT INTO legalStructure (lsName, lsNameES) VALUES ('C.A (Anonymous Company)', 'C.A (Compañia Anonima)')
	INSERT INTO legalStructure (lsName, lsNameES) VALUES ('Informal', 'Informal')

END
GO
/****** Object:  StoredProcedure [dbo].[spEstablishMeasure]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEstablishMeasure]
AS
BEGIN
	DECLARE @Yes INT
	DECLARE @No INT
	DECLARE @Status INT
	SELECT TOP (1) @Yes =[IDAnswer] FROM answers ORDER BY IDAnswer ASC
	SELECT TOP (1) @No =[IDAnswer] FROM answers ORDER BY IDAnswer DESC
	SELECT TOP (1) @Status =[IDStatus] FROM status ORDER BY IDStatus ASC

	INSERT INTO measure (name, acronym, complete, status) VALUES ('Unidad', 'Und.', @Yes, @Status)
	INSERT INTO measure (name, acronym, complete, status) VALUES ('Kilo', 'Kl.', @No, @Status)
	INSERT INTO measure (name, acronym, complete, status) VALUES ('Litro', 'Lt.', @No, @Status)

END
GO
/****** Object:  StoredProcedure [dbo].[spEstablishNationalities]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEstablishNationalities]

AS
BEGIN
	INSERT INTO nationalities (nationName , nationAcronym) VALUES ('Venezolano (a)', 'V-')
	INSERT INTO nationalities (nationName , nationAcronym) VALUES ('Extranjero (a)', 'E-')
END
GO
/****** Object:  StoredProcedure [dbo].[spEstablishPacking]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEstablishPacking]
AS
BEGIN
	DECLARE @Yes INT
	DECLARE @No INT
	DECLARE @Status INT
	SELECT TOP (1) @Yes =[IDAnswer] FROM answers ORDER BY IDAnswer ASC
	SELECT TOP (1) @No =[IDAnswer] FROM answers ORDER BY IDAnswer DESC
	SELECT TOP (1) @Status =[IDStatus] FROM status ORDER BY IDStatus ASC

	INSERT INTO packing(name, acronym, quantity, complete, status) VALUES ('Unidad', 'Und.', 1, @Yes, @Status)
	INSERT INTO packing(name, acronym, quantity, complete, status) VALUES ('Kilo', 'Kls.', 1, @No, @Status)
	INSERT INTO packing(name, acronym, quantity, complete, status) VALUES ('Docena', 'Dc.', 12, @Yes, @Status)
	INSERT INTO packing(name, acronym, quantity, complete, status) VALUES ('Paca', 'Pc.', 20, @Yes, @Status)
END
GO
/****** Object:  StoredProcedure [dbo].[spEstablishPayDate]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEstablishPayDate]
AS
BEGIN
	INSERT INTO payDate(dateName, dateNameES, valuesForMinute) VALUES ('Hour','Hora', 60)
	INSERT INTO payDate(dateName, dateNameES, valuesForMinute) VALUES ('Day','Dia', 480)
	INSERT INTO payDate(dateName, dateNameES, valuesForMinute) VALUES ('Week','Semana', 2400)
	INSERT INTO payDate(dateName, dateNameES, valuesForMinute) VALUES ('Quince','Quisena', 4800)
	INSERT INTO payDate(dateName, dateNameES, valuesForMinute) VALUES ('Month','Mes', 9600)
END
GO
/****** Object:  StoredProcedure [dbo].[spEstablishPayMethod]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEstablishPayMethod]
AS
BEGIN
	DECLARE @Status int

	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC

	INSERT INTO payMethod (name, commission, status)
     VALUES ('Efectivo' , 0, @Status)
END
GO
/****** Object:  StoredProcedure [dbo].[spEstablishPrivileges]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEstablishPrivileges]

AS
BEGIN

	INSERT INTO privileges(privilegeName, privilegeNameEs) VALUES('BackDoor', 'Juridico')
	INSERT INTO privileges(privilegeName, privilegeNameEs) VALUES('Admin', 'Administrador') 
	INSERT INTO privileges(privilegeName, privilegeNameEs) VALUES('User', 'Usuario')
	
END
GO
/****** Object:  StoredProcedure [dbo].[spEstablishProductsCategory]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEstablishProductsCategory]
AS
BEGIN
	Declare @Status int

	SELECT TOP (1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC

	INSERT INTO productsCategory (categoryName, categoryStatus) VALUES ('Carniceria', @Status)
	INSERT INTO productsCategory (categoryName, categoryStatus) VALUES ('Charcuteria', @Status)
	INSERT INTO productsCategory (categoryName, categoryStatus) VALUES ('Verduras', @Status)
	INSERT INTO productsCategory (categoryName, categoryStatus) VALUES ('Bebidas', @Status)
	INSERT INTO productsCategory (categoryName, categoryStatus) VALUES ('Licores', @Status)
END
GO
/****** Object:  StoredProcedure [dbo].[spEstablishStatus]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[spEstablishStatus]
AS
BEGIN
	INSERT INTO status (statusName ,statusNameEs) VALUES ('Active', 'Activo')
	INSERT INTO status (statusName ,statusNameEs) VALUES ('Inactive', 'Inactivo')
	INSERT INTO status (statusName ,statusNameEs) VALUES ('Provisional', 'Provisional')
END
GO
/****** Object:  StoredProcedure [dbo].[spInactiveClient]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInactiveClient]
	@ID int
AS
BEGIN
	Declare @statusActive int
	Declare @statusInactive int

	SELECT TOP (1) @statusActive = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP (1) @statusInactive = [IDStatus] FROM status WHERE IDStatus != @statusActive ORDER BY IDStatus ASC

	UPDATE clients
	SET clientStatus = @statusInactive
	WHERE IDClient = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spInactiveCoins]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInactiveCoins]
 @ID int
AS
BEGIN
	DECLARE @Status int
	DECLARE @Inactive int
	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP(1) @Inactive = [IDStatus] FROM status WHERE IDStatus != @Status ORDER BY IDStatus ASC

	UPDATE coins
   SET coinStatus = @Inactive
	WHERE IDCoin = @ID

END
GO
/****** Object:  StoredProcedure [dbo].[spInactiveDistributor]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInactiveDistributor]
	@ID int
AS
BEGIN
	Declare @statusActive int
	Declare @statusInactive int

	SELECT TOP (1) @statusActive = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP (1) @statusInactive = [IDStatus] FROM status WHERE IDStatus != @statusActive ORDER BY IDStatus ASC

	UPDATE distributors SET distributorStatus = @statusInactive
	WHERE IDDistributor = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spInactiveMeasure]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInactiveMeasure]
	@ID int
AS
BEGIN
	DECLARE @Status INT
	DECLARE @StatusInactive INT
	SELECT TOP (1) @Status =[IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP (1) @StatusInactive =[IDStatus] FROM status WHERE IDStatus != @Status ORDER BY IDStatus ASC

	UPDATE measure SET status=@StatusInactive WHERE ID = @ID

END
GO
/****** Object:  StoredProcedure [dbo].[spInactivePacking]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInactivePacking]
	@ID int
AS
BEGIN
	DECLARE @Status INT
	DECLARE @StatusInactive INT
	SELECT TOP (1) @Status =[IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP (1) @StatusInactive =[IDStatus] FROM status WHERE IDStatus != @Status ORDER BY IDStatus ASC

	UPDATE packing SET status=@StatusInactive WHERE ID = @ID

END
GO
/****** Object:  StoredProcedure [dbo].[spInactivePayMethod]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInactivePayMethod]
@ID INT
AS
BEGIN
	DECLARE @Status INT
	DECLARE @StatusInactive INT
	SELECT TOP (1) @Status =[IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP (1) @StatusInactive =[IDStatus] FROM status WHERE IDStatus != @Status ORDER BY IDStatus ASC

	UPDATE payMethod
	SET status =  @StatusInactive
	WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spInactiveProduct]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInactiveProduct]
	@ID int
AS
BEGIN
	Declare @statusActive int
	Declare @statusInactive int

	SELECT TOP (1) @statusActive = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP (1) @statusInactive = [IDStatus] FROM status WHERE IDStatus != @statusActive ORDER BY IDStatus ASC

	UPDATE products
	SET productStatus = @statusInactive
	WHERE IDProduct = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spInactiveProductCategory]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInactiveProductCategory]
	@ID int
AS
BEGIN
	Declare @statusActive int
	Declare @statusInactive int

	SELECT TOP (1) @statusActive = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP (1) @statusInactive = [IDStatus] FROM status WHERE IDStatus != @statusActive ORDER BY IDStatus ASC

	UPDATE productsCategory
	SET categoryStatus = @statusInactive
	WHERE IDPC = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spInactiveProductsCategory]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInactiveProductsCategory]
	@ID int
AS
BEGIN
	DECLARE @Status int
	DECLARE @StatusInactive int

	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP(1) @StatusInactive = [IDStatus] FROM status WHERE [IDStatus]!=@Status ORDER BY IDStatus ASC
	UPDATE [dbo].[productsCategory]
   SET [categoryStatus] = @StatusInactive
   WHERE IDPC = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spInactiveTax]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInactiveTax]
	@ID int
AS
BEGIN
	DECLARE @Status INT
	DECLARE @StatusInactive INT
	SELECT TOP (1) @Status =[IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP (1) @StatusInactive =[IDStatus] FROM status WHERE IDStatus != @Status ORDER BY IDStatus ASC

	UPDATE tax SET status=@StatusInactive WHERE IDTax = @ID

END
GO
/****** Object:  StoredProcedure [dbo].[spLogin]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spLogin] 
	@User Varchar(255),
	@Password Varchar(500)
AS
BEGIN
	SELECT idUser, userStatus, privilege, pseudomyn, userEmployee FROM users WHERE (pseudomyn=@User OR mail=@User) AND password=@Password
END
GO
/****** Object:  StoredProcedure [dbo].[spRegisterClient]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegisterClient]
	@Name varchar(255),
	@Nation int,
	@DNI varchar(55),
	@Phone varchar(55)
AS
BEGIN
	Declare @Status int
	Declare @Coin int
	Declare @Client int

	SELECT TOP (1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP (1) @Coin = [IDCoin] FROM coins ORDER BY IDCoin ASC

	INSERT INTO clients(clientName, clientNationality, clientDNI, clientPhone,clientStatus)
    VALUES (@Name, @Nation, @DNI, @Phone, @Status)
	
	set @Client =@@IDENTITY

	INSERT INTO clientsCredit(clientCredit, coinCredit, maxCredit)
     VALUES (@Client, @Coin , 0)

	 INSERT INTO clientsDebt(clientDebt, coinDebt, Debt)
     VALUES (@Client, @Coin , 0)
END
GO
/****** Object:  StoredProcedure [dbo].[spRegisterCoin]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spRegisterCoin]
	@Name varchar(255), 
	@Acronym varchar(255), 
	@Region varchar(255)
AS
BEGIN

	DECLARE @Status int

	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC

	INSERT INTO coins (coinName, coinAcronym, coinRegion, coinStatus) 
	VALUES(@Name, @Acronym, @Region, @Status)

	INSERT INTO coinPrice(coin, price)
     VALUES (@@IDENTITY, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[spRegisterCoinLocal]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[spRegisterCoinLocal]
	@coinLocalName varchar(80),
	@coinLocalAcronym varchar(10)
AS
BEGIN

	declare @coinStatus int
	declare @nation varchar(80)

	SELECT TOP (1) @coinStatus = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP (1) @nation = [nationName] FROM nationalities ORDER BY IDNation ASC

	INSERT INTO coinLocal
           (coinLocalName, coinLocalAcronym)
     VALUES
           (@coinLocalName, @coinLocalAcronym)

	INSERT INTO coins
			(coinName, coinAcronym, coinRegion, coinStatus)
     VALUES
           (@coinLocalName, @coinLocalAcronym, @nation, @coinStatus)

	declare @idCoin int

	set @idCoin = @@IDENTITY
	
	INSERT INTO coinPrice 
			(coin , price)
     VALUES
           (@idCoin, 1)
END
GO
/****** Object:  StoredProcedure [dbo].[spRegisterDistributor]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spRegisterDistributor]
	@Name varchar(255),
	@Phone varchar(255),
	@RIF varchar (255),
	@LS int
AS
BEGIN
	
	DECLARE @Status int

	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC

	INSERT INTO distributors(distributorName, distributorPhone, distributorRIF, distributorLS, distributorStatus)
     VALUES (@Name, @Phone, @RIF, @LS, @Status)

	 INSERT INTO distributorBalance(distributor, balance)
     VALUES (@@IDENTITY, 0)

END
GO
/****** Object:  StoredProcedure [dbo].[spRegisterEmployee]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spRegisterEmployee]
	@employeeName varchar(255),
	@nationality int,
	@dni varchar(50),
	@dateOfBirth date,
	@numberPhone varchar(50),
	@numberSocialSecurity varchar(50),
	@job int
AS
BEGIN
	declare @idEmployee int
	declare @coin int
	declare @horaryName int
	declare @employeeStatus int
	declare @isUser int
	declare @datePay int
	declare @dateFormat int

	SELECT TOP (1) @coin = [IDCoin] FROM coins ORDER BY IDCoin ASC
	SELECT TOP (1) @horaryName = [IDHN] FROM horarysNames ORDER BY IDHN ASC
	SELECT TOP (1) @employeeStatus = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP (1) @isUser = [IDAnswer] FROM answers ORDER BY IDAnswer DESC
	SELECT TOP (1) @dateFormat = [IDDate] FROM payDate ORDER BY IDDATE ASC
	SELECT TOP (1) @datePay = [IDHN] FROM horarysNames ORDER BY IDHN ASC

	INSERT INTO employees 
		(employeeName , nationality, dni, dateOfBirth, numberPhone, numberSocialSecurity, employeeStatus, isUser) 
	VALUES 
		(@employeeName, @nationality, @dni, @dateOfBirth, @numberPhone, @numberSocialSecurity, @employeeStatus, @isUser)
	
	set @idEmployee = @@IDENTITY

	INSERT INTO employeesSalarys 
		(employeeSalary, salaryBase, salaryForMinute, salaryCoin, salaryDate, salaryFormat) 
	VALUES
		(@idEmployee, '0' , '0', @coin, @datePay, @dateFormat)

	INSERT INTO employeesHorary
           (horaryEmployee, horaryName, horaryEntry, horaryExit)
     VALUES
           (@idEmployee, @horaryName, '00:00:00.0000', '00:00:00.0000')

	INSERT INTO employeesJobs
           (employee, job)
     VALUES
           (@idEmployee, @job)
END
GO
/****** Object:  StoredProcedure [dbo].[spRegisterEmployeeJob]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spRegisterEmployeeJob]
	@Employee int,
	@Job int
AS
BEGIN
	UPDATE employeesJobs
	SET job = @Job
	WHERE employee = @Employee
END
GO
/****** Object:  StoredProcedure [dbo].[spRegisterInventary]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spRegisterInventary]
@ID int,
@Cant int
AS
BEGIN
	DECLARE @Amount int
	SELECT TOP(1) @Amount = [inventoryAmount] FROM inventory WHERE inventoryProduct = @ID
	DECLARE @NewAmount int
	set @NewAmount = ABS(@Amount + @Cant)
	UPDATE inventory
    SET inventoryAmount = @NewAmount
	WHERE inventoryProduct = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spRegisterMeasure]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spRegisterMeasure]
	@Name varchar(50),
	@Acronym varchar(5),
	@Complete int
AS
BEGIN
	DECLARE @Status INT
	SELECT TOP (1) @Status =[IDStatus] FROM status ORDER BY IDStatus ASC

	INSERT INTO measure (name, acronym, complete, status) VALUES (@Name, @Acronym, @Complete, @Status)

END
GO
/****** Object:  StoredProcedure [dbo].[spRegisterPacking]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spRegisterPacking]
	@Name varchar(50),
	@Acronym varchar(5),
	@Quantity int,
	@Complete int
AS
BEGIN
	DECLARE @Status INT
	SELECT TOP (1) @Status =[IDStatus] FROM status ORDER BY IDStatus ASC

	INSERT INTO packing(name, acronym, quantity, complete, status) VALUES (@Name, @Acronym, @Quantity, @Complete, @Status)

END
GO
/****** Object:  StoredProcedure [dbo].[spRegisterPayMethod]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spRegisterPayMethod]
 @Name VARCHAR(255),
 @Commission float
AS
BEGIN
	DECLARE @Status int

	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC

	INSERT INTO payMethod (name, commission, status)
     VALUES (@Name , @Commission, @Status)
END
GO
/****** Object:  StoredProcedure [dbo].[spRegisterProduct]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spRegisterProduct]
	@Name varchar(255),
	@Category int,
	@Description int
AS
BEGIN
	DECLARE @Status int
	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC

	DECLARE @Coin int
   SELECT TOP (1) @Coin =[IDCoin] FROM coins ORDER BY IDCoin ASC

	INSERT INTO products (productName, category, productDescription, productStatus)
   VALUES (@Name, @Category, @Description, @Status)

   DECLARE @Product int
   set @Product= @@IDENTITY

	 INSERT INTO inventory(inventoryProduct, inventoryAmount)
     VALUES(@Product, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[spRegisterProductsCategory]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spRegisterProductsCategory]
	@Name varchar(255)
AS
BEGIN
	DECLARE @Status int

	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC

	INSERT INTO [dbo].[productsCategory]
           ([categoryName]
           ,[categoryStatus])
     VALUES
           (@Name, @Status)
END
GO
/****** Object:  StoredProcedure [dbo].[spRegisterSalary]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spRegisterSalary]
	@Employee int,
	@Salary float,
	@Coin int,
	@Date int,
	@Format int
AS
BEGIN
	DECLARE @SalaryDate float

	SELECT @SalaryDate = [valuesForMinute] FROM payDate WHERE IDDate = @Date

	UPDATE employeesSalarys
	SET 
      salaryBase = @Salary,
      salaryForMinute = (@Salary/ @SalaryDate), 
      salaryCoin = @Coin,
      salaryDate = @Format,
	  salaryFormat = @Date
	WHERE 
		employeeSalary = @Employee

END
GO
/****** Object:  StoredProcedure [dbo].[spRegisterTax]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spRegisterTax]
	@Name varchar(50),
	@Date int
AS
BEGIN
	DECLARE @Status INT
	SELECT TOP (1) @Status =[IDStatus] FROM status ORDER BY IDStatus ASC

	INSERT INTO tax (name, datePay, status) VALUES (@Name, @Date, @Status)

END
GO
/****** Object:  StoredProcedure [dbo].[spRegisterTaxPay]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spRegisterTaxPay]
	@Tax int,
	@Date datetime,
	@Price float,
	@Coin int
AS
BEGIN
	INSERT INTO taxPay (tax, date, price, coin)
     VALUES (@Tax, @Date, @Price, @Coin)

END
GO
/****** Object:  StoredProcedure [dbo].[spRegisterUser]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spRegisterUser]
	@Employee int,
	@Pseudomyn varchar(255),
	@Mail varchar(255),
	@Privilege int,
	@Password varchar(255)
AS
BEGIN
	declare @Status int

	declare @Answer int

	SELECT TOP (1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC

	SELECT TOP (1) @Answer = [IDAnswer] FROM answers ORDER BY IDAnswer ASC

	INSERT INTO Users 
		(userEmployee, pseudomyn, mail, password, privilege, userStatus) 
	VALUES
		(@Employee, @Pseudomyn, @Mail, @Password, @Privilege, @Status)

	UPDATE employees SET isUser = @Answer  WHERE IDEmployee = @Employee
END
GO
/****** Object:  StoredProcedure [dbo].[spReportBuy]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReportBuy]
AS
BEGIN
	SELECT CONVERT(char(10), buy.date, 101) as Date,
	COUNT(distinct buy.ID) AS CountB, AVG(amount) AS AverageAmount, 
	AVG(amount * price) AS AveragePrice, (AVG(amount * price)* 0.3) AS AverageProfit, 
	SUM(amount) AS TotalAmount, SUM(amount * price) AS TotalPrice,
	(SUM(amount * price)* 0.3) AS TotalProfit
	FROM conceptBuy
	INNER JOIN buy ON conceptBuy.buy = buy.ID
	GROUP BY CONVERT(char(10), buy.date, 101)
	ORDER BY date DESC
END
GO
/****** Object:  StoredProcedure [dbo].[spReportCategory]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReportCategory]
AS
BEGIN
	SELECT category.name as Name, category.ID AS Code, 
	COUNT(distinct conceptBuy.buy) AS CountB, 
	AVG(price) AS AveragePrice,
	AVG(amount) AS AverageAmount,
	(AVG(amount * price)* 0.3) AS AverageProfit,
	SUM(amount) AS TotalAmount,
	SUM(amount * price) TotalPrice,
	(SUM(amount * price)* 0.3) AS TotalProfit
	FROM conceptBuy
	INNER JOIN products ON conceptBuy.product = products.code
	INNER JOIN category ON category.id = products.category
	GROUP BY category.ID, category.name
END
GO
/****** Object:  StoredProcedure [dbo].[spReportCategoryDay]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReportCategoryDay]
AS
BEGIN
	SELECT category.name as Name, category.ID AS Code, 
	COUNT(distinct conceptBuy.buy) AS CountB, 
	AVG(price) AS AveragePrice,
	AVG(amount) AS AverageAmount,
	(AVG(amount * price)* 0.3) AS AverageProfit,
	SUM(amount) AS TotalAmount,
	SUM(amount * price) TotalPrice,
	(SUM(amount * price)* 0.3) AS TotalProfit
	FROM conceptBuy
	INNER JOIN buy ON conceptBuy.buy = buy.ID
	INNER JOIN products ON conceptBuy.product = products.code
	INNER JOIN category ON category.id = products.category
	WHERE buy.date > DATEADD(DAY,-1,GETDATE()) AND buy.date < GETDATE()
	GROUP BY category.ID, category.name
END
GO
/****** Object:  StoredProcedure [dbo].[spReportCategoryMonth]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReportCategoryMonth]
AS
BEGIN
	SELECT category.name as Name, category.ID AS Code, 
	COUNT(distinct conceptBuy.buy) AS CountB, 
	AVG(price) AS AveragePrice,
	AVG(amount) AS AverageAmount,
	(AVG(amount * price)* 0.3) AS AverageProfit,
	SUM(amount) AS TotalAmount,
	SUM(amount * price) TotalPrice,
	(SUM(amount * price)* 0.3) AS TotalProfit
	FROM conceptBuy
	INNER JOIN buy ON conceptBuy.buy = buy.ID
	INNER JOIN products ON conceptBuy.product = products.code
	INNER JOIN category ON category.id = products.category
	WHERE buy.date > DATEADD(MONTH,-1,GETDATE()) AND buy.date < GETDATE()
	GROUP BY category.ID, category.name
END
GO
/****** Object:  StoredProcedure [dbo].[spReportCategoryWeek]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReportCategoryWeek]
AS
BEGIN
	SELECT category.name as Name, category.ID AS Code, 
	COUNT(distinct conceptBuy.buy) AS CountB, 
	AVG(price) AS AveragePrice,
	AVG(amount) AS AverageAmount,
	(AVG(amount * price)* 0.3) AS AverageProfit,
	SUM(amount) AS TotalAmount,
	SUM(amount * price) TotalPrice,
	(SUM(amount * price)* 0.3) AS TotalProfit
	FROM conceptBuy
	INNER JOIN buy ON conceptBuy.buy = buy.ID
	INNER JOIN products ON conceptBuy.product = products.code
	INNER JOIN category ON category.id = products.category
	WHERE buy.date > DATEADD(WEEK,-1,GETDATE()) AND buy.date < GETDATE()
	GROUP BY category.ID, category.name
END
GO
/****** Object:  StoredProcedure [dbo].[spReportInventoryCategory]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReportInventoryCategory]
AS
BEGIN
	SELECT category.name as Name, 
	category.ID AS Code,
	measure.name AS Measure,
	COUNT(distinct products.code) AS CountB,
	SUM(amount) AS AmountTotal
	FROM inventory
	INNER JOIN products ON inventory.product = products.code
	INNER JOIN category ON category.id = products.category
	INNER JOIN measure ON measure.id = products.description
	GROUP BY category.ID, category.name, measure.name, measure.ID 
END
GO
/****** Object:  StoredProcedure [dbo].[spReportInventoryMeasure]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReportInventoryMeasure]
AS
BEGIN
	SELECT measure.name as Name, 
	measure.ID AS Code, 
	COUNT(distinct products.code) AS CountB,
	SUM(amount) AS AmountTotal
	FROM inventory
	INNER JOIN products ON inventory.product = products.code
	INNER JOIN category ON category.id = products.category
	INNER JOIN measure ON measure.id = products.description
	GROUP BY measure.ID, measure.name 
END
GO
/****** Object:  StoredProcedure [dbo].[spReportMeasure]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReportMeasure]
AS
BEGIN
	SELECT measure.name as Name, measure.ID AS Code, 
	COUNT(distinct conceptBuy.buy) AS CountB, 
	AVG(price) AS AveragePrice,
	AVG(amount) AS AverageAmount,
	(AVG(amount * price)* 0.3) AS AverageProfit,
	SUM(amount) AS TotalAmount,
	SUM(amount * price) TotalPrice,
	(SUM(amount * price)* 0.3) AS TotalProfit
	FROM conceptBuy
	INNER JOIN products ON conceptBuy.product = products.code
	INNER JOIN measure ON measure.ID = products.description
	GROUP BY measure.ID, measure.name
END
GO
/****** Object:  StoredProcedure [dbo].[spReportMeasureDay]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReportMeasureDay]
AS
BEGIN
	SELECT measure.name as Name, measure.ID AS Code, 
	COUNT(distinct conceptBuy.buy) AS CountB, 
	AVG(price) AS AveragePrice,
	AVG(amount) AS AverageAmount,
	(AVG(amount * price)* 0.3) AS AverageProfit,
	SUM(amount) AS TotalAmount,
	SUM(amount * price) TotalPrice,
	(SUM(amount * price)* 0.3) AS TotalProfit
	FROM conceptBuy
	INNER JOIN buy ON conceptBuy.buy = buy.ID
	INNER JOIN products ON conceptBuy.product = products.code
	INNER JOIN measure ON measure.ID = products.description
	WHERE buy.date > DATEADD(DAY,-1,GETDATE()) AND buy.date < GETDATE()
	GROUP BY measure.ID, measure.name
END
GO
/****** Object:  StoredProcedure [dbo].[spReportMeasureMonth]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReportMeasureMonth]
AS
BEGIN
	SELECT measure.name as Name, measure.ID AS Code, 
	COUNT(distinct conceptBuy.buy) AS CountB, 
	AVG(price) AS AveragePrice,
	AVG(amount) AS AverageAmount,
	(AVG(amount * price)* 0.3) AS AverageProfit,
	SUM(amount) AS TotalAmount,
	SUM(amount * price) TotalPrice,
	(SUM(amount * price)* 0.3) AS TotalProfit
	FROM conceptBuy
	INNER JOIN buy ON conceptBuy.buy = buy.ID
	INNER JOIN products ON conceptBuy.product = products.code
	INNER JOIN measure ON measure.ID = products.description
	WHERE buy.date > DATEADD(MONTH,-1,GETDATE()) AND buy.date < GETDATE()
	GROUP BY measure.ID, measure.name
END
GO
/****** Object:  StoredProcedure [dbo].[spReportMeasureWeek]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReportMeasureWeek]
AS
BEGIN
	SELECT measure.name as Name, measure.ID AS Code, 
	COUNT(distinct conceptBuy.buy) AS CountB, 
	AVG(price) AS AveragePrice,
	AVG(amount) AS AverageAmount,
	(AVG(amount * price)* 0.3) AS AverageProfit,
	SUM(amount) AS TotalAmount,
	SUM(amount * price) TotalPrice,
	(SUM(amount * price)* 0.3) AS TotalProfit
	FROM conceptBuy
	INNER JOIN buy ON conceptBuy.buy = buy.ID
	INNER JOIN products ON conceptBuy.product = products.code
	INNER JOIN measure ON measure.ID = products.description
	WHERE buy.date > DATEADD(WEEK,-1,GETDATE()) AND buy.date < GETDATE()
	GROUP BY measure.ID, measure.name
END
GO
/****** Object:  StoredProcedure [dbo].[spReportProduct]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReportProduct]
AS
BEGIN
	SELECT products.name as Name, products.code AS Code, 
	COUNT(distinct conceptBuy.buy) AS CountB, 
	AVG(price) AS AveragePrice,
	AVG(amount) AS AverageAmount,
	(AVG(amount * price)* 0.3) AS AverageProfit,
	SUM(amount) AS TotalAmount,
	SUM(amount * price) TotalPrice,
	(SUM(amount * price)* 0.3) AS TotalProfit
	FROM conceptBuy
	INNER JOIN products ON conceptBuy.product = products.code
	GROUP BY products.name, products.code
END
GO
/****** Object:  StoredProcedure [dbo].[spReportProductDay]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReportProductDay]
AS
BEGIN
	SELECT products.name as Name, products.code AS Code, 
	COUNT(distinct conceptBuy.buy) AS CountB, 
	AVG(price) AS AveragePrice,
	AVG(amount) AS AverageAmount,
	(AVG(amount * price)* 0.3) AS AverageProfit,
	SUM(amount) AS TotalAmount,
	SUM(amount * price) TotalPrice,
	(SUM(amount * price)* 0.3) AS TotalProfit
	FROM conceptBuy
	INNER JOIN buy ON conceptBuy.buy = buy.ID
	INNER JOIN products ON conceptBuy.product = products.code
	WHERE buy.date > DATEADD(DAY,-1,GETDATE()) AND buy.date < GETDATE()
	GROUP BY products.name, products.code
END
GO
/****** Object:  StoredProcedure [dbo].[spReportProductMonth]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReportProductMonth]
AS
BEGIN
	SELECT products.name as Name, products.code AS Code, 
	COUNT(distinct conceptBuy.buy) AS CountB, 
	AVG(price) AS AveragePrice,
	AVG(amount) AS AverageAmount,
	(AVG(amount * price)* 0.3) AS AverageProfit,
	SUM(amount) AS TotalAmount,
	SUM(amount * price) TotalPrice,
	(SUM(amount * price)* 0.3) AS TotalProfit
	FROM conceptBuy
	INNER JOIN buy ON conceptBuy.buy = buy.ID
	INNER JOIN products ON conceptBuy.product = products.code
	WHERE buy.date > DATEADD(MONTH,-1,GETDATE()) AND buy.date < GETDATE()
	GROUP BY products.name, products.code
END
GO
/****** Object:  StoredProcedure [dbo].[spReportProductWeek]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReportProductWeek]
AS
BEGIN
	SELECT products.name as Name, products.code AS Code, 
	COUNT(distinct conceptBuy.buy) AS CountB, 
	AVG(price) AS AveragePrice,
	AVG(amount) AS AverageAmount,
	(AVG(amount * price)* 0.3) AS AverageProfit,
	SUM(amount) AS TotalAmount,
	SUM(amount * price) TotalPrice,
	(SUM(amount * price)* 0.3) AS TotalProfit
	FROM conceptBuy
	INNER JOIN buy ON conceptBuy.buy = buy.ID
	INNER JOIN products ON conceptBuy.product = products.code
	WHERE buy.date > DATEADD(WEEK,-1,GETDATE()) AND buy.date < GETDATE()
	GROUP BY products.name, products.code
END
GO
/****** Object:  StoredProcedure [dbo].[spSaveBuy]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSaveBuy]
	@Client int,
	@ListConcept Detail readonly
AS
BEGIN
	DECLARE @IDBuy int
	INSERT INTO buy(date, Client) VALUES (GETDATE(), @Client)

	SET @IDBuy = @@IDENTITY

	INSERT INTO conceptBuy(amount, name, price, buy)
	SELECT amount, name, price, @IDBuy FROM @ListConcept

	UPDATE inventory
   SET inventoryAmount = (inventoryAmount - amount)
   FROM @ListConcept
   WHERE inventoryProduct = name 

 END
GO
/****** Object:  StoredProcedure [dbo].[spSaveRequest]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSaveRequest]
	@Distributor int,
	@Receive Date,
	@Concept RequestDetail READONLY
AS
BEGIN
	DECLARE @ID int
	DECLARE @Status int
	DECLARE @Answer int
	DECLARE @Method int
	DECLARE @CoinLocal int
	SELECT TOP (1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP (1) @Answer = [IDAnswer] FROM answers ORDER BY IDAnswer DESC
	SELECT TOP (1) @Method = [ID] FROM payMethod ORDER BY ID ASC
	SELECT TOP (1) @CoinLocal = [IDCoin] FROM coins ORDER BY IDCoin ASC

	INSERT INTO requests (date, distributor, receive, status) VALUES  (GETDATE(), @Distributor, @Receive, @Status)

	SET @ID = @@IDENTITY

	INSERT INTO conceptRequests(product, amount, request)
	SELECT product, amount, @ID FROM @Concept

END
GO
/****** Object:  StoredProcedure [dbo].[spSearchAcademics]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSearchAcademics]
	@Search VARCHAR(255)
AS
BEGIN
	
	SELECT ROW_NUMBER() OVER(ORDER BY IDEA ASC) AS Num, IDEA, employeeName, nationAcronym, dni, daName, titleGradeName FROM employees 
	INNER JOIN employeesAcademic ON employees.IDEmployee = employeesAcademic.academicEmployee 
	INNER JOIN degreesAcademic ON degreesAcademic.IDDA = employeesAcademic.academicGrade
	INNER JOIN nationalities ON nationalities.IDNation = employees.nationality
	WHERE employees.employeeName LIKE @Search+'%'  OR degreesAcademic.daName LIKE @Search+'%' OR employeesAcademic.titleGradeName LIKE @Search+'%'
	ORDER BY IDEA ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spSearchCategoryProduct]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSearchCategoryProduct]
	@Search VARCHAR(255)
AS
BEGIN
	SELECT ROW_NUMBER() OVER(ORDER BY IDPC ASC) AS Num, IDPC, IDStatus, categoryName, statusNameEs, (SELECT COUNT(*) FROM products WHERE category = IDPC GROUP BY category) AS quantity
	FROM productsCategory
	INNER JOIN status ON categoryStatus = IDStatus
	WHERE categoryName LIKE '%'+@Search+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[spSearchClients]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSearchClients]
	@Search Varchar(255)
AS
BEGIN
	DECLARE @Anonymous int
	DECLARE @Status int
	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP(1) @Anonymous = [IDClient] FROM clients ORDER BY IDClient ASC

	SELECT ROW_NUMBER()OVER(ORDER BY IDClient ASC) AS Num, IDClient, clientName, nationAcronym, clientDNI, clientPhone 
	FROM clients
	INNER JOIN nationalities ON nationalities.IDNation = clients.clientNationality
	WHERE clientName LIKE @Search+'%' AND clientStatus = @Status AND IDClient != @Anonymous
	OR clientDNI LIKE @Search+'%' AND clientStatus = @Status AND IDClient != @Anonymous
	ORDER BY IDClient ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spSearchClientsInactive]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSearchClientsInactive]
	@Search Varchar(255)
AS
BEGIN
	DECLARE @Anonymous int
	DECLARE @Status int
	DECLARE @StatusActive int
	SELECT TOP(1) @StatusActive = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP(1) @Status = [IDStatus] FROM status WHERE IDStatus != @StatusActive ORDER BY IDStatus ASC
	SELECT TOP(1) @Anonymous = [IDClient] FROM clients ORDER BY IDClient ASC

	SELECT ROW_NUMBER()OVER(ORDER BY IDClient ASC) AS Num, IDClient, clientName, nationAcronym, clientDNI, clientPhone 
	FROM clients
	INNER JOIN nationalities ON nationalities.IDNation = clients.clientNationality
	WHERE clientName LIKE @Search+'%' AND clientStatus = @Status AND IDClient != @Anonymous
	OR clientDNI LIKE @Search+'%' AND clientStatus = @Status AND IDClient != @Anonymous
	ORDER BY IDClient ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spSearchCoins]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSearchCoins]
	@Search varchar(255)
AS
BEGIN
	DECLARE @Coin int
	SELECT TOP(1) @Coin = [IDCoin] FROM coins ORDER BY IDCoin ASC
	DECLARE @Status int
	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC

	SELECT ROW_NUMBER() OVER(ORDER BY IDCoin ASC) AS Num, IDCoin, coinName, coinAcronym, coinRegion, statusNameEs, price 
	FROM coins 
	INNER JOIN coinPrice ON coins.IDCoin = coinPrice.coin
	INNER JOIN status ON coins.coinStatus = status.IDStatus
	WHERE coinName LIKE @Search+'%' AND IDStatus = @Status AND IDCoin != @Coin
	OR coinAcronym LIKE @Search+'%' AND IDStatus = @Status AND IDCoin != @Coin
	OR coinRegion LIKE @Search+'%' AND IDStatus = @Status AND IDCoin != @Coin
	ORDER BY IDCoin ASC

END
GO
/****** Object:  StoredProcedure [dbo].[spSearchCoinsInactive]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSearchCoinsInactive]
	@Search varchar(255)
AS
BEGIN
	DECLARE @Status int
	DECLARE @Inactive int
	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP(1) @Inactive = [IDStatus] FROM status WHERE IDStatus != @Status ORDER BY IDStatus ASC

	SELECT ROW_NUMBER() OVER(ORDER BY IDCoin ASC) AS Num, IDCoin, coinName, coinAcronym, coinRegion, statusNameEs, price 
	FROM coins 
	INNER JOIN coinPrice ON coins.IDCoin = coinPrice.coin
	INNER JOIN status ON coins.coinStatus = status.IDStatus
	WHERE coinName LIKE @Search+'%' AND IDStatus = @Inactive
	OR coinAcronym LIKE @Search+'%' AND IDStatus = @Inactive
	OR coinRegion LIKE @Search+'%' AND IDStatus = @Inactive
	ORDER BY IDCoin ASC

END
GO
/****** Object:  StoredProcedure [dbo].[spSearchDistributor]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSearchDistributor]
	@Search varchar(255)
AS
BEGIN
	
	DECLARE @StatusActive int
	SELECT TOP(1) @StatusActive = [IDStatus] FROM status ORDER BY IDStatus ASC

	SELECT ROW_NUMBER() OVER(ORDER BY IDDistributor ASC) AS Num, IDDistributor, distributorName, distributorPhone, distributorRIF , lsNameES, balance, statusNameEs
	FROM distributors
	INNER JOIN distributorBalance ON distributors.IDDistributor = distributorBalance.distributor
	INNER JOIN status ON distributors.distributorStatus = status.IDStatus
	INNER JOIN legalStructure ON distributors.distributorLS = legalStructure.IDLS
	WHERE distributorName LIKE @Search+'%' AND distributorStatus = @StatusActive
	OR distributorRIF LIKE @Search+'%' AND distributorStatus = @StatusActive
	ORDER BY IDDistributor ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spSearchDistributorInactive]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSearchDistributorInactive]
	@Search varchar(255)
AS
BEGIN
	
	DECLARE @StatusActive int
	DECLARE @StatusInactive int
	SELECT TOP(1) @StatusActive = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP(1) @StatusInactive = [IDStatus] FROM status WHERE IDStatus != @StatusActive ORDER BY IDStatus ASC

	SELECT IDDistributor, distributorName, distributorPhone, distributorRIF ,distributorLS, balance, statusNameEs, lsNameES
	FROM distributors
	INNER JOIN distributorBalance ON distributors.IDDistributor = distributorBalance.distributor
	INNER JOIN status ON distributors.distributorStatus = status.IDStatus
	INNER JOIN legalStructure ON distributors.distributorLS = legalStructure.IDLS
	WHERE distributorName LIKE @Search+'%' AND distributorStatus = @StatusInactive
	OR distributorRIF LIKE @Search+'%' AND distributorStatus = @StatusInactive
END
GO
/****** Object:  StoredProcedure [dbo].[spSearchEmployee]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSearchEmployee]
	@Search VARCHAR(255)
AS	
BEGIN
	SELECT IDEmployee, employeeName, nationName, dni, dateOfBirth, numberPhone, numberSocialSecurity, statusNameEs, jobName, salaryBase, coinAcronym, nameHoraryEs, answerOptionES, nationAcronym FROM employees 
	INNER JOIN employeesJobs ON employeesJobs.employee = employees.IDEmployee 
	INNER JOIN jobs ON jobs.IDJob = employeesJobs.job
	INNER JOIN answers ON answers.IDAnswer = employees.IsUser
	INNER JOIN status ON status.IDStatus = employees.employeeStatus
	INNER JOIN employeesSalarys ON employeesSalarys.employeeSalary = employees.IDEmployee
	INNER JOIN coins ON coins.IDCoin = employeesSalarys.salaryCoin
	INNER JOIN employeesHorary ON employeesHorary.horaryEmployee = employees.IDEmployee
	INNER JOIN horarysNames ON horarysNames.IDHN = employeesHorary.horaryName
	INNER JOIN nationalities ON nationalities.IDNation = employees.nationality
	WHERE employees.employeeName LIKE @Search+'%'  OR employees.dni LIKE @Search+'%' OR employees.numberPhone LIKE @Search+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[spSearchEmployeesCE]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSearchEmployeesCE]
	@Search Varchar(255)
AS
BEGIN
	SELECT ROW_NUMBER() OVER(ORDER BY IDCE) as Num, IDCE, employeeName, contactEmergencyName, parent, contactEmergencyFormat, contactEmergencyContent 
	FROM employees 
	INNER JOIN employeesContactEmergency ON employees.IDEmployee = employeesContactEmergency.emergencyEmployee
	WHERE employees.employeeName LIKE @Search+'%' OR employeesContactEmergency.contactEmergencyName LIKE @Search+'%'
	ORDER BY IDCE ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spSearchEmployeesHorary]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSearchEmployeesHorary]
	@Search varchar(255)
AS
BEGIN
	
	DECLARE @Status int
	DECLARE @BackDoor int
	DECLARE @User int

	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP(1) @BackDoor = [IDEmployee] FROM employees ORDER BY IDEmployee ASC
	SELECT TOP(1) @User = [IDEmployee] FROM employees WHERE IDEmployee !=@BackDoor ORDER BY IDEmployee ASC

	SELECT ROW_NUMBER() OVER(ORDER BY IDEH ASC) AS Num, IDEH, IDEmployee, jobName, employeeName, employeeName, nameHoraryEs, horaryEntry, horaryExit 
	FROM employeesHorary
	INNER JOIN employees ON employees.IDEmployee = employeesHorary.horaryEmployee
	INNER JOIN horarysNames ON horarysNames.IDHN = employeesHorary.horaryName
	INNER JOIN employeesJobs ON employees.IDEmployee = employeesJobs.employee
	INNER JOIN jobs ON jobs.IDJob = employeesJobs.job
	WHERE employeeName LIKE @Search+'%' AND employeeStatus = @Status AND IDEmployee != @BackDoor AND IDEmployee != @User
	ORDER BY IDEH ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spSearchEmployeesInactives]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSearchEmployeesInactives]
	@Search VARCHAR(255)
AS
BEGIN
	Declare @statusActive int
	Declare @statusInactive int

	SELECT TOP (1) @statusActive = [IDStatus] FROM status
	SELECT TOP (1) @statusInactive = [IDStatus] FROM status WHERE IDStatus != @statusActive

	SELECT ROW_NUMBER() OVER(ORDER BY IDEmployee ASC) AS Num, IDEmployee, employeeName, nationAcronym, dni, numberPhone, numberSocialSecurity, statusNameEs, answerOptionES
	FROM employees 
	INNER JOIN nationalities ON employees.nationality = nationalities.idNation 
	INNER JOIN status ON employees.employeeStatus = status.idStatus 
	INNER JOIN answers ON employees.isUser = answers.IDAnswer
	WHERE status.IDStatus = @statusInactive AND employees.employeeName LIKE '%'+@Search+'%'
	OR status.IDStatus = @statusInactive AND employees.dni LIKE '%'+@Search+'%' 
	OR status.IDStatus = @statusInactive AND employees.numberPhone LIKE '%'+@Search+'%'
	ORDER BY IDEmployee ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spSearchEmployeesJob]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSearchEmployeesJob]
	@Search Varchar(255)
AS
BEGIN
	DECLARE @Status int
	DECLARE @BackDoor int
	DECLARE @User int

	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP(1) @BackDoor = [IDEmployee] FROM employees ORDER BY IDEmployee ASC
	SELECT TOP(1) @User = [IDEmployee] FROM employees WHERE IDEmployee !=@BackDoor ORDER BY IDEmployee ASC
	
	SELECT ROW_NUMBER() OVER(ORDER BY IDEmployee ASC) AS Num, IDEmployee, employeeName, jobName, salaryBase, salaryForMinute, jobSalary, coinAcronym,  dateNameEs, nameHoraryEs
	FROM employeesSalarys
	INNER JOIN employees ON employees.IDEmployee = employeesSalarys.employeeSalary
	INNER JOIN coins ON coins.IDCoin = employeesSalarys.salaryCoin
	INNER JOIN employeesJobs ON employeesJobs.employee = employees.IDEmployee
	INNER JOIN jobs ON jobs.IDJob = employeesJobs.job
	INNER JOIN horarysNames ON employeesSalarys.salaryDate = horarysNames.IDHN
	INNER JOIN payDate ON employeesSalarys.salaryFormat = payDate.IDDate
	WHERE employees.employeeName LIKE @Search+'%' AND employeeStatus = @Status AND IDEmployee != @BackDoor AND IDEmployee != @User
	OR jobs.jobName LIKE @Search+'%' AND employeeStatus = @Status AND IDEmployee != @BackDoor AND IDEmployee != @User
	OR coins.coinName LIKE @Search+'%' AND employeeStatus = @Status AND IDEmployee != @BackDoor AND IDEmployee != @User
	ORDER BY IDEmployee ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spSearchInventary]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSearchInventary]
@Search varchar (255)
AS
BEGIN
	SELECT ROW_NUMBER() OVER(ORDER BY IDInventory ASC) AS N, IDInventory, productName, productDescription, productPrice, inventoryAmount 
	FROM inventory
	INNER JOIN products ON products.IDProduct = inventory.inventoryProduct
	INNER JOIN productsPrices ON productsPrices.product = products.IDProduct
	WHERE productName LIKE @Search+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[spSearchMeasure]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSearchMeasure]
	@Search varchar(50)
AS
BEGIN

	SELECT ROW_NUMBER() OVER(ORDER BY ID) AS Num, ID, name, acronym, complete, answerOptionEs, status, statusNameEs
	FROM measure
	INNER JOIN status ON status.IDStatus = measure.status
	INNER JOIN answers ON answers.IDAnswer = measure.complete
	WHERE name LIKE '%'+@Search+'%' OR acronym like '%'+@Search+'%' OR answerOptionEs like '%'+@Search+'%' OR statusNameEs = '%'+@Search+'%'
	ORDER BY ID

END
GO
/****** Object:  StoredProcedure [dbo].[spSearchPacking]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSearchPacking]
	@Search varchar(50)
AS
BEGIN

	SELECT ROW_NUMBER() OVER(ORDER BY ID) AS Num, ID, name, acronym, quantity, status, statusNameEs
	FROM packing
	INNER JOIN status ON status.IDStatus = packing.status
	WHERE name LIKE '%'+@Search+'%' OR acronym like '%'+@Search+'%' OR statusNameEs = '%'+@Search+'%'
	ORDER BY ID

END
GO
/****** Object:  StoredProcedure [dbo].[spSearchPayMethod]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSearchPayMethod]
 @Search VARCHAR(255)
AS
BEGIN
	SELECT ROW_NUMBER() OVER(ORDER BY ID), ID, name, commission, status, statusNameES 
	FROM payMethod
	INNER JOIN status ON status.IDStatus = payMethod.status
	WHERE name LIKE '%'+@Search+'%'
	ORDER BY ID
END
GO
/****** Object:  StoredProcedure [dbo].[spSearchProduct]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSearchProduct]
@Search varchar(255)
AS
BEGIN
	Declare @StatusActive int
	Declare @StatusInactive int
	SELECT TOP (1) @StatusActive = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP (1) @StatusInactive = [IDStatus] FROM status WHERE IDStatus != @statusActive ORDER BY IDStatus ASC
	
	SELECT ROW_NUMBER() OVER(ORDER BY IDProduct ASC) AS NUM, IDProduct, productName, categoryName, productDescription, productPrice, coinAcronym
	FROM products
	INNER JOIN productsCategory ON products.category = productsCategory.IDPC
	INNER JOIN productsPrices ON products.IDProduct = productsPrices.product
	INNER JOIN coins ON productsPrices.productCoin = coins.IDCoin
	WHERE productName LIKE '%'+@Search+'%' AND productStatus = @StatusActive OR categoryName LIKE '%'+@Search+'%' AND productStatus = @StatusActive
	ORDER BY IDProduct ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spSearchProductInactive]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSearchProductInactive]
@Search varchar(255)
AS
BEGIN
	Declare @StatusActive int
	Declare @StatusInactive int
	SELECT TOP (1) @StatusActive = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP (1) @StatusInactive = [IDStatus] FROM status WHERE IDStatus != @statusActive ORDER BY IDStatus ASC
	
	SELECT ROW_NUMBER() OVER(ORDER BY IDProduct ASC) AS NUM, IDProduct, productName, categoryName, productDescription, productPrice, coinAcronym
	FROM products
	INNER JOIN productsCategory ON products.category = productsCategory.IDPC
	INNER JOIN productsPrices ON products.IDProduct = productsPrices.product
	INNER JOIN coins ON productsPrices.productCoin = coins.IDCoin
	WHERE productName LIKE '%'+@Search+'%' AND productStatus = @StatusInactive OR categoryName LIKE '%'+@Search+'%' AND productStatus = @StatusInactive
	ORDER BY IDProduct ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spSearchSalary]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSearchSalary]
	@Search VARCHAR(255)
AS
BEGIN
	DECLARE @Status int
	DECLARE @BackDoor int
	DECLARE @User int

	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP(1) @BackDoor = [IDEmployee] FROM employees ORDER BY IDEmployee ASC
	SELECT TOP(1) @User = [IDEmployee] FROM employees WHERE IDEmployee !=@BackDoor ORDER BY IDEmployee ASC
	
	SELECT ROW_NUMBER() OVER(ORDER BY IDEmployee ASC) AS Num, IDEmployee, employeeName, jobName, salaryBase, coinAcronym, nameHoraryEs, dateNameEs 
	FROM employeesSalarys
	INNER JOIN employees ON employees.IDEmployee = employeesSalarys.employeeSalary
	INNER JOIN coins ON coins.IDCoin = employeesSalarys.salaryCoin
	INNER JOIN employeesJobs ON employeesJobs.employee = employees.IDEmployee
	INNER JOIN jobs ON jobs.IDJob = employeesJobs.job
	INNER JOIN horarysNames ON employeesSalarys.salaryDate = horarysNames.IDHN
	INNER JOIN payDate ON employeesSalarys.salaryFormat = payDate.IDDate
	WHERE employees.employeeName LIKE @Search+'%' AND employeeStatus = @Status AND IDEmployee != @BackDoor AND IDEmployee != @User
	OR jobs.jobName LIKE @Search+'%' AND employeeStatus = @Status AND IDEmployee != @BackDoor AND IDEmployee != @User
	OR horarysNames.nameHoraryEs LIKE @Search+'%' AND employeeStatus = @Status AND IDEmployee != @BackDoor AND IDEmployee != @User
	OR coins.coinName LIKE @Search+'%' AND employeeStatus = @Status AND IDEmployee != @BackDoor AND IDEmployee != @User
	ORDER BY IDEmployee ASC

END
GO
/****** Object:  StoredProcedure [dbo].[spSearchTax]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSearchTax]
@Search VARCHAR(255)
AS
BEGIN

	SELECT ROW_NUMBER() OVER(ORDER BY IDTax) AS Num, IDTax, name, datePay, status, statusNameEs, dateNameEs
	FROM tax
	INNER JOIN status ON status.IDStatus = tax.status
	INNER JOIN payDate ON payDate.IDDate = tax.datePay
	WHERE name LIKE '%'+@Search+'%'
	ORDER BY IDTax

END
GO
/****** Object:  StoredProcedure [dbo].[spSearchTaxPay]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSearchTaxPay]
@Search VARCHAR(255)
AS
BEGIN
	SELECT ROW_NUMBER() OVER(ORDER BY ID ASC) AS Num, taxPay.ID AS pay, name, tax, date, (str(price)+'	'+coinAcronym) AS priceTotal
	FROM taxPay
	INNER JOIN coins ON coins.IDCoin = taxPay.coin
	INNER JOIN tax ON tax.IDTax = taxPay.tax
	WHERE name LIKE '%'+@Search+'%'
	ORDER BY pay ASC


END
GO
/****** Object:  StoredProcedure [dbo].[spSearchtDistributorInactive]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSearchtDistributorInactive]
	@Search varchar(255)
AS
BEGIN
	
	DECLARE @StatusActive int
	DECLARE @StatusInactive int
	SELECT TOP(1) @StatusActive = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP(1) @StatusInactive = [IDStatus] FROM status WHERE IDStatus != @StatusActive ORDER BY IDStatus ASC

	SELECT IDDistributor, distributorName, distributorPhone, distributorRIF ,distributorLS, balance, statusNameEs, lsNameES
	FROM distributors
	INNER JOIN distributorBalance ON distributors.IDDistributor = distributorBalance.distributor
	INNER JOIN status ON distributors.distributorStatus = status.IDStatus
	INNER JOIN legalStructure ON distributors.distributorLS = legalStructure.IDLS
	WHERE distributorName LIKE @Search+'%' AND distributorStatus = @StatusInactive
	OR distributorRIF LIKE @Search+'%' AND distributorStatus = @StatusInactive
END
GO
/****** Object:  StoredProcedure [dbo].[spSearchUsers]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSearchUsers]
	@Search varchar(255)
AS
BEGIN
	DECLARE @StatusActive int
	Declare @Privilege int

	SELECT TOP (1) @StatusActive = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP(1) @Privilege= [idPrivilege] FROM privileges ORDER BY idPrivilege DESC

	SELECT ROW_NUMBER() OVER(ORDER BY idUser ASC) AS Num, idUser, employeeName, pseudomyn, mail, statusNameEs FROM employees 
	INNER JOIN users ON users.userEmployee = employees.IDEmployee
	INNER JOIN status ON users.userStatus = status.IDStatus
	WHERE employeeName LIKE @Search+'%' AND users.userStatus = @StatusActive AND users.privilege = @Privilege
	OR pseudomyn LIKE @Search+'%' AND users.userStatus = @StatusActive AND users.privilege = @Privilege
	OR mail LIKE @Search+'%' AND users.userStatus = @StatusActive AND users.privilege = @Privilege
	ORDER BY idUser ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spSearchUsersInactive]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSearchUsersInactive]
	@Search varchar(255)
AS
BEGIN
	
	DECLARE @StatusInactive int
	DECLARE @StatusActive int
	DECLARE @Privilege int

	SELECT TOP (1) @StatusActive = [IDStatus] FROM status ORDER BY IDStatus ASC
	SELECT TOP (1) @StatusInactive = [IDStatus] FROM status WHERE IDStatus != @StatusActive ORDER BY IDStatus ASC
	SELECT TOP(1) @Privilege = [idPrivilege] FROM privileges ORDER BY idPrivilege DESC

	SELECT ROW_NUMBER() OVER(ORDER BY idUser ASC) AS Num, idUser, employeeName, pseudomyn, mail, statusNameEs FROM employees 
	INNER JOIN users ON users.userEmployee = employees.IDEmployee
	INNER JOIN status ON users.userStatus = status.IDStatus
	WHERE employeeName LIKE @Search+'%' AND users.userStatus = @StatusInactive AND users.privilege = @Privilege
	OR pseudomyn LIKE @Search+'%' AND users.userStatus = @StatusInactive AND users.privilege = @Privilege
	OR mail LIKE @Search+'%' AND users.userStatus = @StatusInactive AND users.privilege = @Privilege
	ORDER BY idUser ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectAcademic]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectAcademic]
	@ID int
AS
BEGIN
	SELECT IDEA, employeeName, academicGrade, titleGradeName
	FROM employeesAcademic
	INNER JOIN employees ON employees.IDEmployee = employeesAcademic.academicEmployee
	INNER JOIN degreesAcademic ON degreesAcademic.IDDA = employeesAcademic.academicGrade
	WHERE IDEA = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectCategory]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectCategory]
	@ID INT
AS
BEGIN
	
	SELECT IDPC, categoryName, categoryStatus, statusName
	FROM productsCategory
	INNER JOIN status ON categoryStatus = IDStatus 
	WHERE IDPC = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectCategoryProduct]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectCategoryProduct]
AS
BEGIN
	SELECT ROW_NUMBER() OVER(ORDER BY IDPC ASC) AS Num, categoryName, statusNameEs, (SELECT COUNT(*) FROM products WHERE category = IDPC) AS quantity
	FROM productsCategory
	INNER JOIN status ON categoryStatus = IDStatus
	INNER JOIN products ON category = IDPC
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectCategorys]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectCategorys]
AS
BEGIN
	
	SELECT IDPC, categoryName, categoryStatus, statusName
	FROM productsCategory
	INNER JOIN status ON categoryStatus = IDStatus 
	ORDER BY IDPC ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectClient]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectClient]
	@ID int
AS
BEGIN
	DECLARE @Status int
	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC

	SELECT IDClient, clientName, nationAcronym, clientDNI, clientPhone 
	FROM clients
	INNER JOIN nationalities ON nationalities.IDNation = clients.clientNationality
	WHERE IDClient = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectCoin]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSelectCoin]
@ID int
AS
BEGIN
	DECLARE @Status int
	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC

	SELECT IDCoin, coinName, coinAcronym, coinRegion, coinStatus, price 
	FROM coins INNER JOIN coinPrice ON coins.IDCoin = coinPrice.coin
	INNER JOIN status ON coins.coinStatus = status.IDStatus
	WHERE IDCoin = @ID

END
GO
/****** Object:  StoredProcedure [dbo].[spSelectCoins]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spSelectCoins]
AS
BEGIN
	DECLARE @Status int
	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC

	SELECT IDCoin, coinName, coinAcronym, coinRegion, coinStatus 
	FROM coins
	WHERE coinStatus = @Status
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectDistributor]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectDistributor]
	@ID int
AS
BEGIN
	SELECT IDDistributor, distributorName, distributorPhone, distributorRIF FROM distributors
	WHERE IDDistributor = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectMeasure]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectMeasure]
 @ID int
AS
BEGIN

	SELECT ID, name, acronym, complete, answerOptionEs, status, statusNameEs
	FROM measure
	INNER JOIN status ON status.IDStatus = measure.status
	INNER JOIN answers ON answers.IDAnswer = measure.complete
	WHERE ID = @ID

END
GO
/****** Object:  StoredProcedure [dbo].[spSelectPacking]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectPacking]
 @ID int
AS
BEGIN

	SELECT ID, name, acronym, complete, quantity, status
	FROM packing
	WHERE ID = @ID

END
GO
/****** Object:  StoredProcedure [dbo].[spSelectPayMethod]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectPayMethod]
@ID int
AS
BEGIN
	SELECT ID, name, commission, status, statusNameES 
	FROM payMethod
	INNER JOIN status ON status.IDStatus = payMethod.status
	WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectProduct]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectProduct]
	@ID INT
AS
BEGIN
	
	SELECT IDProduct, productName, category, productDescription
	FROM products
	WHERE IDProduct = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectProducts]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectProducts]
AS
BEGIN
	
	SELECT IDProduct, productName, IDPC, categoryName, productDescription, inventoryAmount, productPrice, IDCoin, coinName, coinAcronym
	FROM products
	INNER JOIN productsCategory ON products.category = productsCategory.IDPC
	INNER JOIN productsPrices ON products.IDProduct = productsPrices.product
	INNER JOIN coins ON productsPrices.productCoin = coins.IDCoin
	INNER JOIN inventory ON products.IDProduct = inventory.inventoryProduct
	WHERE inventoryAmount > 0
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectTax]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectTax]
@ID int
AS
BEGIN

	SELECT IDTax, name, datePay, status
	FROM tax
	WHERE IDTax = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spSelectTaxPay]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSelectTaxPay]
@ID int
AS
BEGIN
	SELECT ID, tax, date, price, coin
	FROM taxPay
	WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateAcademic]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateAcademic]
	@ID int,
	@Grade int,
	@Title Varchar(255)
AS
BEGIN
	UPDATE employeesAcademic  
	SET academicGrade = @Grade, titleGradeName = @Title
	WHERE IDEA = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateBusinessHorary]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateBusinessHorary]
	 @ENTRY time,
	 @EXIT time
AS
BEGIN
	DECLARE @Business int
	SELECT TOP (1) @Business = [IDBH] FROM horaryBusiness ORDER BY IDBH

	UPDATE horaryBusiness 
	SET hourEntry = @ENTRY, hourExit = @EXIT
	WHERE IDBH = @Business
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateCE]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateCE]
	@ID int,
	@Name Varchar (255),
	@Parent Varchar (50),
	@Format Varchar (50),
	@Content Varchar (50)
AS
BEGIN
	UPDATE employeesContactEmergency 
	SET contactEmergencyName = @Name ,contactEmergencyFormat = @Format, contactEmergencyContent = @Content, parent = @Parent
	WHERE IDCE = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateCoin]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateCoin]
@ID int,
@Name varchar (255),
@Acronym varchar (255),
@Region varchar (255)
AS
BEGIN
	UPDATE coins 
	SET coinName = @Name, coinAcronym = @Acronym, coinRegion = @Region 
	WHERE IDCoin = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateCoinLocal]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateCoinLocal]
	@ID int,
	@Name varchar(255), 
	@Acronym varchar (10)
AS
BEGIN
	DECLARE @Coin int

	SELECT TOP(1) @Coin = [IDCoin] FROM coins ORDER BY IDCoin ASC

	UPDATE coinLocal SET coinLocalName = @Name, coinLocalAcronym = @Acronym WHERE IDCL = @ID

	UPDATE coins SET coinName = @Name, coinAcronym = @Acronym WHERE IDCoin = @Coin
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateDistributor]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateDistributor]
	@ID int,
	@Name varchar(255),
	@Phone varchar(255),
	@RIF varchar (255),
	@LS int
AS
BEGIN
	UPDATE distributors
	SET distributorName = @Name,
		distributorPhone = @Phone,
		distributorRIF = @RIF,
		distributorLS = @LS
		WHERE IDDistributor = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateEmployee]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateEmployee]
	@ID int,
	@employeeName varchar(255),
	@nationality int,
	@dni varchar(50),
	@dateOfBirth date,
	@numberPhone varchar(50),
	@numberSocialSecurity varchar(50),
	@job int
AS
BEGIN

	UPDATE employees
	SET employeeName = @employeeName, nationality = @nationality ,dni = @dni, dateOfBirth = @dateOfBirth, numberPhone = @numberPhone, numberSocialSecurity = @numberSocialSecurity
	WHERE IDEmployee = @ID

	
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateHorary]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateHorary]
	@ID int,
	@HoraryName int,
	@HoraryEntry time,
	@HoraryExit time
AS
BEGIN
	UPDATE [dbo].[employeesHorary]
	SET horaryName = @HoraryName, horaryEntry = @HoraryEntry, horaryExit = @HoraryExit
	WHERE horaryEmployee = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateMeasure]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateMeasure]
	@ID int,
	@Name varchar(50),
	@Acronym varchar(5),
	@Complete int
AS
BEGIN
	DECLARE @Status INT
	SELECT TOP (1) @Status =[IDStatus] FROM status ORDER BY IDStatus ASC

	UPDATE measure SET name = @Name, acronym = @Acronym, complete = @Complete WHERE ID = @ID

END
GO
/****** Object:  StoredProcedure [dbo].[spUpdatePacking]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdatePacking]
	@ID int,
	@Name varchar(50),
	@Acronym varchar(5),
	@Quantity int,
	@Complete int
AS
BEGIN
	DECLARE @Status INT
	SELECT TOP (1) @Status =[IDStatus] FROM status ORDER BY IDStatus ASC

	UPDATE packing SET name = @Name, acronym = @Acronym, quantity = @Quantity, complete = @Complete 
	WHERE ID = @ID

END
GO
/****** Object:  StoredProcedure [dbo].[spUpdatePayMethod]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdatePayMethod]
@ID INT,
@Name VARCHAR(255),
@Commission FLOAT
AS
BEGIN
	UPDATE payMethod
	SET name = @Name, commission = @Commission
	WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateProduct]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateProduct]
	@ID INT,
	@Name VARCHAR(255),
	@Category INT,
	@Description VARCHAR(255)

AS
BEGIN
	UPDATE products
	SET productName = @Name,
	category = @Category,
	productDescription = @Description
	WHERE IDProduct = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateProductsCategory]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateProductsCategory]
	@ID int,
	@Name varchar(255)
AS
BEGIN
	DECLARE @Status int

	SELECT TOP(1) @Status = [IDStatus] FROM status ORDER BY IDStatus ASC

	UPDATE [dbo].[productsCategory]
   SET [categoryName] = @Name
   WHERE IDPC = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateTax]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateTax]
	@ID int,
	@Name varchar(50),
	@Date int
AS
BEGIN
	DECLARE @Status INT
	SELECT TOP (1) @Status =[IDStatus] FROM status ORDER BY IDStatus ASC
	UPDATE tax 
	SET name = @Name, datePay = @Date
	WHERE IDTax = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateTaxPay]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUpdateTaxPay]
	@ID int,
	@Tax int,
	@Date datetime,
	@Price float,
	@Coin int
AS
BEGIN
	UPDATE taxPay
	SET tax = @Tax, date =@Date, price = @Price, coin = @Coin
	WHERE ID = @ID

END
GO
/****** Object:  StoredProcedure [dbo].[spUserActive]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUserActive]
	@ID int
AS
BEGIN
	Declare @statusActive int
	Declare @statusInactive int

	SELECT TOP (1) @statusActive = [IDStatus] FROM status
	SELECT TOP (1) @statusInactive = [IDStatus] FROM status WHERE IDStatus != @statusActive

	UPDATE users
	SET userStatus = @statusActive
	WHERE IDUser = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spUserInactive]    Script Date: 21/07/2022 2:57:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spUserInactive]
	@ID int
AS
BEGIN
	Declare @statusActive int
	Declare @statusInactive int

	SELECT TOP (1) @statusActive = [IDStatus] FROM status
	SELECT TOP (1) @statusInactive = [IDStatus] FROM status WHERE IDStatus != @statusActive

	UPDATE users
	SET userStatus = @statusInactive
	WHERE IDUser = @ID
END
GO
USE [master]
GO
ALTER DATABASE [MarketAlfa] SET  READ_WRITE 
GO
