USE [master]
GO
/****** Object:  Database [QLBH_v1]    Script Date: 12/25/2019 11:08:24 PM ******/
CREATE DATABASE [QLBH_v1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBH_v1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QLBH_v1.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLBH_v1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QLBH_v1_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLBH_v1] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBH_v1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBH_v1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBH_v1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBH_v1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBH_v1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBH_v1] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBH_v1] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLBH_v1] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QLBH_v1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBH_v1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBH_v1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBH_v1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBH_v1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBH_v1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBH_v1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBH_v1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBH_v1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLBH_v1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBH_v1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBH_v1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBH_v1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBH_v1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBH_v1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBH_v1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBH_v1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLBH_v1] SET  MULTI_USER 
GO
ALTER DATABASE [QLBH_v1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBH_v1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBH_v1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBH_v1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QLBH_v1]
GO
/****** Object:  StoredProcedure [dbo].[sp_IsLoginSuccess]    Script Date: 12/25/2019 11:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[sp_IsLoginSuccess]
@Username varchar(50),
@Password varchar(50)
AS
BEGIN
	IF EXISTS(SELECT * FROM Users WHERE f_Username=@Username and f_Password=@Password)
	BEGIN		
		RETURN 1
	END
	RETURN 0
END

GO
/****** Object:  Table [dbo].[Areas]    Script Date: 12/25/2019 11:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Areas](
	[ID] [varchar](15) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Note] [nvarchar](30) NULL,
 CONSTRAINT [PK_Areas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BuyProduct]    Script Date: 12/25/2019 11:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BuyProduct](
	[BillID] [varchar](15) NOT NULL,
	[WarehouseID] [varchar](15) NOT NULL,
	[StaffID] [varchar](15) NOT NULL,
	[Phone] [char](15) NULL,
	[NumVAT] [char](20) NULL,
	[Date] [date] NULL,
	[ExperiDate] [date] NULL,
	[Address] [nvarchar](40) NULL,
	[Note] [nvarchar](30) NULL,
	[Total] [decimal](18, 0) NULL,
	[SupplierID] [varchar](15) NOT NULL,
 CONSTRAINT [PK_BuyProduct] PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BuyProductDetail]    Script Date: 12/25/2019 11:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BuyProductDetail](
	[BillID] [varchar](15) NOT NULL,
	[ProductID] [varchar](15) NOT NULL,
	[ProductName] [nvarchar](30) NULL,
	[UnitID] [varchar](15) NULL,
	[Amount] [int] NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Total] [decimal](18, 0) NULL,
 CONSTRAINT [PK_BuyProductDetail] PRIMARY KEY CLUSTERED 
(
	[BillID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Catergories]    Script Date: 12/25/2019 11:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Catergories](
	[CatID] [varchar](15) NOT NULL,
	[CatName] [nvarchar](30) NULL,
	[Note] [nvarchar](30) NULL,
 CONSTRAINT [PK_Catergories] PRIMARY KEY CLUSTERED 
(
	[CatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/25/2019 11:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [varchar](15) NOT NULL,
	[CustomerName] [nvarchar](30) NULL,
	[Address] [nvarchar](40) NULL,
	[Phone] [char](15) NULL,
	[Area] [varchar](15) NULL,
	[AccountBank] [char](20) NULL,
	[Email] [varchar](30) NULL,
	[Bank] [varchar](30) NULL,
	[Discount] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExRate]    Script Date: 12/25/2019 11:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExRate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
	[Rate] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ExRate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Form]    Script Date: 12/25/2019 11:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Form](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FormName] [char](30) NOT NULL,
	[Description] [nchar](30) NULL,
	[FatherForm] [int] NULL,
 CONSTRAINT [PK_Form] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[History]    Script Date: 12/25/2019 11:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[History](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [char](50) NULL,
	[UserName] [nchar](50) NULL,
	[Computer] [char](50) NULL,
	[Time] [char](30) NULL,
	[Buiness] [char](50) NULL,
	[Action] [char](50) NULL,
	[Object] [char](50) NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Parts]    Script Date: 12/25/2019 11:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Parts](
	[ID] [varchar](15) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Note] [nvarchar](30) NULL,
 CONSTRAINT [PK_Parts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 12/25/2019 11:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[Perm] [int] NOT NULL,
	[f_insertUser] [bit] NULL,
	[f_deleteUser] [bit] NULL,
	[f_updateUser] [bit] NULL,
	[f_insertProduct] [bit] NULL,
	[f_deleteProduct] [bit] NULL,
	[f_updateProduct] [bit] NULL,
	[f_insertCategory] [bit] NULL,
	[f_deleteCategory] [bit] NULL,
	[f_updateCategory] [bit] NULL,
	[f_insertSupplier] [bit] NULL,
	[f_deleteSupplier] [bit] NULL,
	[f_updateSupplier] [bit] NULL,
	[f_insertStaff] [bit] NULL,
	[f_deleteStaff] [bit] NULL,
	[f_updateStaff] [bit] NULL,
	[f_cashing] [bit] NULL,
	[f_report] [bit] NULL,
 CONSTRAINT [PK_Perm] PRIMARY KEY CLUSTERED 
(
	[Perm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/25/2019 11:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [varchar](15) NOT NULL,
	[ProductName] [nvarchar](30) NULL,
	[CatergoryID] [varchar](15) NULL,
	[WarehouseID] [varchar](15) NULL,
	[UnitID] [varchar](15) NULL,
	[Origin] [nvarchar](30) NULL,
	[MinInventory] [int] NULL,
	[CurrInventory] [int] NULL,
	[Supplier] [varchar](15) NULL,
	[Purchase] [decimal](18, 0) NULL,
	[Retail] [decimal](18, 0) NULL,
	[Wholesale] [decimal](18, 0) NULL,
	[Image] [text] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/25/2019 11:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](20) NOT NULL,
	[Description] [nchar](30) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role_Form]    Script Date: 12/25/2019 11:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Form](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[FormID] [int] NOT NULL,
	[Access] [bit] NULL,
	[f_Insert] [bit] NULL,
	[f_Update] [bit] NULL,
	[f_Delete] [bit] NULL,
	[Export] [bit] NULL,
	[Import] [bit] NULL,
 CONSTRAINT [PK_Role_Form] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SellProduct]    Script Date: 12/25/2019 11:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SellProduct](
	[BillID] [varchar](15) NOT NULL,
	[CustomerID] [varchar](15) NOT NULL,
	[WarehouseID] [varchar](15) NOT NULL,
	[StaffID] [varchar](15) NOT NULL,
	[Phone] [char](15) NULL,
	[NumVAT] [char](20) NULL,
	[Date] [date] NULL,
	[ExperiDate] [date] NULL,
	[Address] [nvarchar](40) NULL,
	[Note] [nvarchar](30) NULL,
	[Total] [decimal](18, 0) NULL,
 CONSTRAINT [PK_SellProduct] PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SellProductDetail]    Script Date: 12/25/2019 11:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SellProductDetail](
	[BillID] [varchar](15) NOT NULL,
	[ProductID] [varchar](15) NOT NULL,
	[ProductName] [nvarchar](30) NULL,
	[UnitID] [varchar](15) NULL,
	[ExchangeRate] [int] NOT NULL,
	[Amount] [int] NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Total] [decimal](18, 0) NULL,
	[Discount] [decimal](18, 0) NULL,
 CONSTRAINT [PK_SellProductDetail] PRIMARY KEY CLUSTERED 
(
	[BillID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 12/25/2019 11:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staffs](
	[ID] [varchar](15) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Position] [nvarchar](30) NULL,
	[Address] [nvarchar](40) NULL,
	[Email] [varchar](30) NULL,
	[Phone] [char](15) NULL,
	[Parts] [varchar](15) NULL,
	[Manager] [varchar](15) NULL,
 CONSTRAINT [PK_Staffs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 12/25/2019 11:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [varchar](15) NOT NULL,
	[SupplierName] [nvarchar](30) NULL,
	[Address] [nvarchar](40) NULL,
	[Phone] [char](15) NULL,
	[Area] [varchar](15) NULL,
	[AccountBank] [char](20) NULL,
	[Email] [varchar](30) NULL,
	[Bank] [varchar](30) NULL,
	[Discount] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 12/25/2019 11:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Unit](
	[ID] [varchar](15) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Note] [nvarchar](30) NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/25/2019 11:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[f_username] [char](50) NULL,
	[f_password] [char](50) NULL,
	[f_name] [nchar](50) NULL,
	[f_mail] [char](50) NULL,
	[f_dob] [date] NULL,
	[f_Permission] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 12/25/2019 11:08:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Warehouse](
	[ID] [varchar](15) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Decription] [nchar](30) NULL,
	[Manager] [varchar](15) NULL,
	[Contact] [nvarchar](30) NULL,
	[Address] [nvarchar](40) NULL,
	[Phone] [char](15) NULL,
	[Email] [varchar](30) NULL,
 CONSTRAINT [PK_Warehouse] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Areas] ([ID], [Name], [Note]) VALUES (N'KV00001', N'Miền Bắc', NULL)
INSERT [dbo].[Areas] ([ID], [Name], [Note]) VALUES (N'KV00002', N'Miền Trung', NULL)
INSERT [dbo].[Areas] ([ID], [Name], [Note]) VALUES (N'KV00003', N'Miền Nam', NULL)
INSERT [dbo].[Areas] ([ID], [Name], [Note]) VALUES (N'KV00004', N'Duyên Hải Nam Trung Bộ', NULL)
INSERT [dbo].[Areas] ([ID], [Name], [Note]) VALUES (N'KV00005', N'Tây Nguyên', NULL)
INSERT [dbo].[Areas] ([ID], [Name], [Note]) VALUES (N'KV00006', N'Miền Tây', NULL)
INSERT [dbo].[BuyProduct] ([BillID], [WarehouseID], [StaffID], [Phone], [NumVAT], [Date], [ExperiDate], [Address], [Note], [Total], [SupplierID]) VALUES (N'agvhv', N'K000001', N'NV000001', N'123345         ', N'156                 ', CAST(N'2019-12-08' AS Date), CAST(N'2019-12-04' AS Date), N'ahcb', N'ancb', CAST(2 AS Decimal(18, 0)), N'NCC000003')
INSERT [dbo].[BuyProduct] ([BillID], [WarehouseID], [StaffID], [Phone], [NumVAT], [Date], [ExperiDate], [Address], [Note], [Total], [SupplierID]) VALUES (N'B0001', N'K000001', N'NV000001', N'0123           ', N'                    ', CAST(N'2019-12-04' AS Date), CAST(N'2019-12-06' AS Date), N'ajn', N'abc', CAST(0 AS Decimal(18, 0)), N'NCC000003')
INSERT [dbo].[BuyProduct] ([BillID], [WarehouseID], [StaffID], [Phone], [NumVAT], [Date], [ExperiDate], [Address], [Note], [Total], [SupplierID]) VALUES (N'B0002', N'K000001', N'NV000001', N'123345         ', N'156                 ', CAST(N'2019-12-08' AS Date), CAST(N'2019-12-04' AS Date), N'ahcb', N'ancb', CAST(2 AS Decimal(18, 0)), N'NCC000003')
INSERT [dbo].[BuyProduct] ([BillID], [WarehouseID], [StaffID], [Phone], [NumVAT], [Date], [ExperiDate], [Address], [Note], [Total], [SupplierID]) VALUES (N'B001', N'K000001', N'NV000001', N'145a           ', N'                    ', CAST(N'2019-12-04' AS Date), CAST(N'2019-12-04' AS Date), N'', N'', CAST(0 AS Decimal(18, 0)), N'NCC000003')
INSERT [dbo].[BuyProductDetail] ([BillID], [ProductID], [ProductName], [UnitID], [Amount], [Price], [Total]) VALUES (N'agvhv', N'SP000001', N'Sản phẩm 2', N'Cái', 1, CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[BuyProductDetail] ([BillID], [ProductID], [ProductName], [UnitID], [Amount], [Price], [Total]) VALUES (N'agvhv', N'SP000002', N'Sản phẩm 2', N'Cái', 1, CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[BuyProductDetail] ([BillID], [ProductID], [ProductName], [UnitID], [Amount], [Price], [Total]) VALUES (N'B0002', N'SP000001', N'Sản phẩm 2', N'Cái', 1, CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[BuyProductDetail] ([BillID], [ProductID], [ProductName], [UnitID], [Amount], [Price], [Total]) VALUES (N'B0002', N'SP000002', N'Sản phẩm 2', N'Cái', 1, CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[Catergories] ([CatID], [CatName], [Note]) VALUES (N'PL000001', N'Thức ăn', N'')
INSERT [dbo].[Catergories] ([CatID], [CatName], [Note]) VALUES (N'PL000002', N'Đồ uống', NULL)
INSERT [dbo].[Catergories] ([CatID], [CatName], [Note]) VALUES (N'PL000003', N'An ninh siêu thị', NULL)
INSERT [dbo].[Catergories] ([CatID], [CatName], [Note]) VALUES (N'PL000004', N'Camera hành trình', NULL)
INSERT [dbo].[Catergories] ([CatID], [CatName], [Note]) VALUES (N'PL000005', N'Máy chấm công', NULL)
INSERT [dbo].[Catergories] ([CatID], [CatName], [Note]) VALUES (N'PL000006', N'Dây cáp', NULL)
INSERT [dbo].[Catergories] ([CatID], [CatName], [Note]) VALUES (N'PL000007', N'Đầu ghi', NULL)
INSERT [dbo].[Catergories] ([CatID], [CatName], [Note]) VALUES (N'PL000008', N'Hàng cũ', NULL)
INSERT [dbo].[Catergories] ([CatID], [CatName], [Note]) VALUES (N'PL000009', N'Ổ cứng', NULL)
INSERT [dbo].[Catergories] ([CatID], [CatName], [Note]) VALUES (N'PL000010', N'Văn phòng phẩm', NULL)
INSERT [dbo].[Catergories] ([CatID], [CatName], [Note]) VALUES (N'PL000011', N'Thiết bị hội nghị', NULL)
INSERT [dbo].[Catergories] ([CatID], [CatName], [Note]) VALUES (N'PL000012', N'Đồ dùng nhà bếp', NULL)
INSERT [dbo].[Catergories] ([CatID], [CatName], [Note]) VALUES (N'PL000013', N'Đồ gia dụng', NULL)
INSERT [dbo].[Catergories] ([CatID], [CatName], [Note]) VALUES (N'PL000014', N'Thiết bị khác', NULL)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Address], [Phone], [Area], [AccountBank], [Email], [Bank], [Discount]) VALUES (N'KH00001', N'Anh Trần Quận', N'91 Chương Dương, Quy Nhơn, Bình Định', N'0909339436     ', N'KV00002', N'15                  ', NULL, N'ACB', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Address], [Phone], [Area], [AccountBank], [Email], [Bank], [Discount]) VALUES (N'KH00002', N'181-185 Điện Biên Phủ- Đà Nẵng', N'181-185 Điện Biên Phủ- Đà Nẵng', N'0903737790     ', N'KV00002', N'15                  ', NULL, N'VPB', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Address], [Phone], [Area], [AccountBank], [Email], [Bank], [Discount]) VALUES (N'KH00003', N'Anh Hiếu - Tập đoàn Gold Star ', N'217 Nguyễn Văn Cừ, Quận 5, Hồ Chí Minh', N'0133888899     ', N'KV00003', N'1825115622          ', N'director@goldstar.com', N'ABZ', CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Address], [Phone], [Area], [AccountBank], [Email], [Bank], [Discount]) VALUES (N'KH00004', N'Chị Na-BMT', NULL, N'0974722218     ', N'KV00002', NULL, NULL, N'OCB', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Address], [Phone], [Area], [AccountBank], [Email], [Bank], [Discount]) VALUES (N'KH00005', N'Công ty Quang Phúc', NULL, N'0164492248     ', N'KV00003', NULL, NULL, N'AGB', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Address], [Phone], [Area], [AccountBank], [Email], [Bank], [Discount]) VALUES (N'KH00006', N'Thông_ anh An 451 Hai Bà Trưng', NULL, N'0971881008     ', N'KV00003', NULL, NULL, N'VCB', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Address], [Phone], [Area], [AccountBank], [Email], [Bank], [Discount]) VALUES (N'KH00007', N'A Trang Hitech', NULL, N'0974417277     ', N'KV00003', NULL, NULL, N'ACB', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Address], [Phone], [Area], [AccountBank], [Email], [Bank], [Discount]) VALUES (N'KH00008', N'Cao Đế Năng-Chị Thảo', NULL, N'0903812820     ', N'KV00003', NULL, N'thao@cadena-it.com', N'ACB', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Address], [Phone], [Area], [AccountBank], [Email], [Bank], [Discount]) VALUES (N'KH00009', N'Anh Quang SCTV', N'219 Nguyễn Hồng Đào, P19, Q.TB, TPHCM', N'0919903349     ', N'KV00003', NULL, NULL, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Address], [Phone], [Area], [AccountBank], [Email], [Bank], [Discount]) VALUES (N'KV00010', N'Anh Dũng_Cty Cầu Rồng', N'K25/27 Tôn Thất Tùng, Q. TK, TP Đà Nẵng', N'0916004984     ', N'KV00002', NULL, NULL, NULL, CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Address], [Phone], [Area], [AccountBank], [Email], [Bank], [Discount]) VALUES (N'KV00011', N'anh Hùng-Công ty DV BV Đệ Nhất', N'Số 39 Ngõ 176,Phố Lê Trọng Tấn, HN', N'0904544396     ', N'KV00001', NULL, NULL, NULL, CAST(0 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[ExRate] ON 

INSERT [dbo].[ExRate] ([ID], [Name], [Rate]) VALUES (1, N'VNĐ', CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[ExRate] ([ID], [Name], [Rate]) VALUES (2, N'USD', CAST(23425 AS Decimal(18, 0)))
INSERT [dbo].[ExRate] ([ID], [Name], [Rate]) VALUES (3, N'HKD', CAST(2987 AS Decimal(18, 0)))
INSERT [dbo].[ExRate] ([ID], [Name], [Rate]) VALUES (4, N'GBP', CAST(31311 AS Decimal(18, 0)))
INSERT [dbo].[ExRate] ([ID], [Name], [Rate]) VALUES (5, N'EUR', CAST(25717 AS Decimal(18, 0)))
INSERT [dbo].[ExRate] ([ID], [Name], [Rate]) VALUES (6, N'JPY', CAST(222 AS Decimal(18, 0)))
INSERT [dbo].[ExRate] ([ID], [Name], [Rate]) VALUES (7, N'KRW', CAST(20 AS Decimal(18, 0)))
INSERT [dbo].[ExRate] ([ID], [Name], [Rate]) VALUES (8, N'CAD', CAST(1 AS Decimal(18, 0)))
INSERT [dbo].[ExRate] ([ID], [Name], [Rate]) VALUES (9, N'CNY', CAST(3478 AS Decimal(18, 0)))
INSERT [dbo].[ExRate] ([ID], [Name], [Rate]) VALUES (10, N'SGD', CAST(17255 AS Decimal(18, 0)))
INSERT [dbo].[ExRate] ([ID], [Name], [Rate]) VALUES (11, N'CHF', CAST(24000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[ExRate] OFF
SET IDENTITY_INSERT [dbo].[Form] ON 

INSERT [dbo].[Form] ([ID], [FormName], [Description], [FatherForm]) VALUES (1, N'frmMain                       ', N'frmMain                       ', 1)
INSERT [dbo].[Form] ([ID], [FormName], [Description], [FatherForm]) VALUES (2, N'frmProduct                    ', N'Product manager               ', NULL)
INSERT [dbo].[Form] ([ID], [FormName], [Description], [FatherForm]) VALUES (6, N'frmArea                       ', N'Area manager                  ', NULL)
INSERT [dbo].[Form] ([ID], [FormName], [Description], [FatherForm]) VALUES (7, N'frmCategory                   ', N'Category manager              ', NULL)
INSERT [dbo].[Form] ([ID], [FormName], [Description], [FatherForm]) VALUES (8, N'frmCustomer                   ', N'Customer  manage              ', NULL)
INSERT [dbo].[Form] ([ID], [FormName], [Description], [FatherForm]) VALUES (9, N'frmExRate                     ', N'Exchange rate manage          ', NULL)
INSERT [dbo].[Form] ([ID], [FormName], [Description], [FatherForm]) VALUES (10, N'frmPart                       ', N'Part manage                   ', NULL)
INSERT [dbo].[Form] ([ID], [FormName], [Description], [FatherForm]) VALUES (11, N'frmStaff                      ', N'Staff manage                  ', NULL)
INSERT [dbo].[Form] ([ID], [FormName], [Description], [FatherForm]) VALUES (12, N'frmSupplier                   ', N'Supplier manage               ', NULL)
INSERT [dbo].[Form] ([ID], [FormName], [Description], [FatherForm]) VALUES (13, N'frmUnit                       ', N'Unit manage                   ', NULL)
INSERT [dbo].[Form] ([ID], [FormName], [Description], [FatherForm]) VALUES (14, N'frmWarehouse                  ', N'Warehouse manage              ', NULL)
SET IDENTITY_INSERT [dbo].[Form] OFF
INSERT [dbo].[Parts] ([ID], [Name], [Note]) VALUES (N'BP00002', N'Phòng Marketing', N'')
INSERT [dbo].[Parts] ([ID], [Name], [Note]) VALUES (N'BP00003', N'Phòng Kinh Doanh', N'')
INSERT [dbo].[Parts] ([ID], [Name], [Note]) VALUES (N'BP00004', N'Phòng Kỹ Thuật', NULL)
INSERT [dbo].[Parts] ([ID], [Name], [Note]) VALUES (N'BP00005', N'Phòng Kế Toán', NULL)
INSERT [dbo].[Parts] ([ID], [Name], [Note]) VALUES (N'BP00006', N'Giám đốc', NULL)
INSERT [dbo].[Parts] ([ID], [Name], [Note]) VALUES (N'P000001', N'Quản Lý', NULL)
INSERT [dbo].[Permission] ([Perm], [f_insertUser], [f_deleteUser], [f_updateUser], [f_insertProduct], [f_deleteProduct], [f_updateProduct], [f_insertCategory], [f_deleteCategory], [f_updateCategory], [f_insertSupplier], [f_deleteSupplier], [f_updateSupplier], [f_insertStaff], [f_deleteStaff], [f_updateStaff], [f_cashing], [f_report]) VALUES (1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Permission] ([Perm], [f_insertUser], [f_deleteUser], [f_updateUser], [f_insertProduct], [f_deleteProduct], [f_updateProduct], [f_insertCategory], [f_deleteCategory], [f_updateCategory], [f_insertSupplier], [f_deleteSupplier], [f_updateSupplier], [f_insertStaff], [f_deleteStaff], [f_updateStaff], [f_cashing], [f_report]) VALUES (2, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Permission] ([Perm], [f_insertUser], [f_deleteUser], [f_updateUser], [f_insertProduct], [f_deleteProduct], [f_updateProduct], [f_insertCategory], [f_deleteCategory], [f_updateCategory], [f_insertSupplier], [f_deleteSupplier], [f_updateSupplier], [f_insertStaff], [f_deleteStaff], [f_updateStaff], [f_cashing], [f_report]) VALUES (3, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Permission] ([Perm], [f_insertUser], [f_deleteUser], [f_updateUser], [f_insertProduct], [f_deleteProduct], [f_updateProduct], [f_insertCategory], [f_deleteCategory], [f_updateCategory], [f_insertSupplier], [f_deleteSupplier], [f_updateSupplier], [f_insertStaff], [f_deleteStaff], [f_updateStaff], [f_cashing], [f_report]) VALUES (4, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CatergoryID], [WarehouseID], [UnitID], [Origin], [MinInventory], [CurrInventory], [Supplier], [Purchase], [Retail], [Wholesale], [Image]) VALUES (N'SP000001', N'Sản phẩm 1', N'PL000001', N'K000001', N'DV000001', N'Việt Nam', 1, 25, N'NCC000003', CAST(14000 AS Decimal(18, 0)), CAST(15000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CatergoryID], [WarehouseID], [UnitID], [Origin], [MinInventory], [CurrInventory], [Supplier], [Purchase], [Retail], [Wholesale], [Image]) VALUES (N'SP000002', N'Sản phẩm 2', N'PL000001', N'K000001', N'DV000001', N'VN', 2, 4, N'NCC000003', CAST(25000 AS Decimal(18, 0)), CAST(14 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [CatergoryID], [WarehouseID], [UnitID], [Origin], [MinInventory], [CurrInventory], [Supplier], [Purchase], [Retail], [Wholesale], [Image]) VALUES (N'SP00003', N'Cá hộp', N'PL000001', N'K000001', N'DV000001', N'Thái Lan', 100, 1000, N'NCC000003', CAST(14000 AS Decimal(18, 0)), CAST(18000 AS Decimal(18, 0)), CAST(15000 AS Decimal(18, 0)), N'C:\Users\LENOVO\OneDrive\Hi`nh a?nh\Saved Pictures\hlw-blogtamsuvn2_vonq.jpg')
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [Name], [Description]) VALUES (1, N'Admin               ', N'Admin                         ')
INSERT [dbo].[Role] ([ID], [Name], [Description]) VALUES (2, N'Manager             ', N'Manager                       ')
INSERT [dbo].[Role] ([ID], [Name], [Description]) VALUES (3, N'Staff               ', N'Staff                         ')
INSERT [dbo].[Role] ([ID], [Name], [Description]) VALUES (4, N'User                ', N'User                          ')
INSERT [dbo].[Role] ([ID], [Name], [Description]) VALUES (5, N'Low-User            ', N'Low-User                      ')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Role_Form] ON 

INSERT [dbo].[Role_Form] ([ID], [RoleID], [FormID], [Access], [f_Insert], [f_Update], [f_Delete], [Export], [Import]) VALUES (1, 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Role_Form] ([ID], [RoleID], [FormID], [Access], [f_Insert], [f_Update], [f_Delete], [Export], [Import]) VALUES (2, 1, 2, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Role_Form] ([ID], [RoleID], [FormID], [Access], [f_Insert], [f_Update], [f_Delete], [Export], [Import]) VALUES (5, 2, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Role_Form] ([ID], [RoleID], [FormID], [Access], [f_Insert], [f_Update], [f_Delete], [Export], [Import]) VALUES (6, 2, 2, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Role_Form] ([ID], [RoleID], [FormID], [Access], [f_Insert], [f_Update], [f_Delete], [Export], [Import]) VALUES (7, 3, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Role_Form] ([ID], [RoleID], [FormID], [Access], [f_Insert], [f_Update], [f_Delete], [Export], [Import]) VALUES (8, 3, 2, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Role_Form] ([ID], [RoleID], [FormID], [Access], [f_Insert], [f_Update], [f_Delete], [Export], [Import]) VALUES (9, 4, 1, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Role_Form] ([ID], [RoleID], [FormID], [Access], [f_Insert], [f_Update], [f_Delete], [Export], [Import]) VALUES (10, 4, 2, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Role_Form] ([ID], [RoleID], [FormID], [Access], [f_Insert], [f_Update], [f_Delete], [Export], [Import]) VALUES (11, 1, 6, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Role_Form] ([ID], [RoleID], [FormID], [Access], [f_Insert], [f_Update], [f_Delete], [Export], [Import]) VALUES (13, 1, 7, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Role_Form] ([ID], [RoleID], [FormID], [Access], [f_Insert], [f_Update], [f_Delete], [Export], [Import]) VALUES (14, 1, 8, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Role_Form] ([ID], [RoleID], [FormID], [Access], [f_Insert], [f_Update], [f_Delete], [Export], [Import]) VALUES (15, 1, 9, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Role_Form] ([ID], [RoleID], [FormID], [Access], [f_Insert], [f_Update], [f_Delete], [Export], [Import]) VALUES (16, 1, 10, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Role_Form] ([ID], [RoleID], [FormID], [Access], [f_Insert], [f_Update], [f_Delete], [Export], [Import]) VALUES (17, 1, 11, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Role_Form] ([ID], [RoleID], [FormID], [Access], [f_Insert], [f_Update], [f_Delete], [Export], [Import]) VALUES (18, 1, 12, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Role_Form] ([ID], [RoleID], [FormID], [Access], [f_Insert], [f_Update], [f_Delete], [Export], [Import]) VALUES (19, 1, 13, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Role_Form] ([ID], [RoleID], [FormID], [Access], [f_Insert], [f_Update], [f_Delete], [Export], [Import]) VALUES (20, 1, 14, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Role_Form] ([ID], [RoleID], [FormID], [Access], [f_Insert], [f_Update], [f_Delete], [Export], [Import]) VALUES (22, 4, 6, 1, 1, 1, 0, 0, 0)
INSERT [dbo].[Role_Form] ([ID], [RoleID], [FormID], [Access], [f_Insert], [f_Update], [f_Delete], [Export], [Import]) VALUES (23, 4, 7, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Role_Form] ([ID], [RoleID], [FormID], [Access], [f_Insert], [f_Update], [f_Delete], [Export], [Import]) VALUES (24, 4, 8, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Role_Form] ([ID], [RoleID], [FormID], [Access], [f_Insert], [f_Update], [f_Delete], [Export], [Import]) VALUES (25, 4, 9, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Role_Form] ([ID], [RoleID], [FormID], [Access], [f_Insert], [f_Update], [f_Delete], [Export], [Import]) VALUES (26, 4, 10, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Role_Form] ([ID], [RoleID], [FormID], [Access], [f_Insert], [f_Update], [f_Delete], [Export], [Import]) VALUES (27, 4, 11, 1, 1, 1, 0, 0, 0)
INSERT [dbo].[Role_Form] ([ID], [RoleID], [FormID], [Access], [f_Insert], [f_Update], [f_Delete], [Export], [Import]) VALUES (28, 4, 12, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Role_Form] ([ID], [RoleID], [FormID], [Access], [f_Insert], [f_Update], [f_Delete], [Export], [Import]) VALUES (29, 4, 13, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Role_Form] ([ID], [RoleID], [FormID], [Access], [f_Insert], [f_Update], [f_Delete], [Export], [Import]) VALUES (30, 4, 14, 1, 1, 1, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Role_Form] OFF
INSERT [dbo].[SellProduct] ([BillID], [CustomerID], [WarehouseID], [StaffID], [Phone], [NumVAT], [Date], [ExperiDate], [Address], [Note], [Total]) VALUES (N'BLS00001', N'KH00001', N'K000001', N'NV000001', N'0155           ', N'1055                ', CAST(N'2019-12-11' AS Date), CAST(N'2019-12-18' AS Date), N'anc', N'anc', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[SellProduct] ([BillID], [CustomerID], [WarehouseID], [StaffID], [Phone], [NumVAT], [Date], [ExperiDate], [Address], [Note], [Total]) VALUES (N'BLS00002', N'KH00001', N'K000001', N'NV000001', N'016515         ', N'145                 ', CAST(N'2019-12-16' AS Date), CAST(N'2019-12-19' AS Date), N'abc', N'abc', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[SellProduct] ([BillID], [CustomerID], [WarehouseID], [StaffID], [Phone], [NumVAT], [Date], [ExperiDate], [Address], [Note], [Total]) VALUES (N'BLS00003', N'KH00001', N'K000001', N'NV000001', N'1451           ', N'145                 ', CAST(N'2019-12-16' AS Date), CAST(N'2019-12-26' AS Date), N'abc', N'abc', CAST(60 AS Decimal(18, 0)))
INSERT [dbo].[SellProduct] ([BillID], [CustomerID], [WarehouseID], [StaffID], [Phone], [NumVAT], [Date], [ExperiDate], [Address], [Note], [Total]) VALUES (N'BLS00004', N'KH00002', N'K000001', N'NV000001', N'1452           ', N'1452                ', CAST(N'2019-12-18' AS Date), CAST(N'2019-12-12' AS Date), N'ajb', N'145', CAST(1260 AS Decimal(18, 0)))
INSERT [dbo].[SellProductDetail] ([BillID], [ProductID], [ProductName], [UnitID], [ExchangeRate], [Amount], [Price], [Total], [Discount]) VALUES (N'BLS00002', N'SP000001', N'Sản phẩm 1', N'DV000001', 0, 1, CAST(14 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[SellProductDetail] ([BillID], [ProductID], [ProductName], [UnitID], [ExchangeRate], [Amount], [Price], [Total], [Discount]) VALUES (N'BLS00002', N'SP000002', N'Sản phẩm 2', N'DV000001', 0, 1, CAST(14 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[SellProductDetail] ([BillID], [ProductID], [ProductName], [UnitID], [ExchangeRate], [Amount], [Price], [Total], [Discount]) VALUES (N'BLS00003', N'SP000001', N'Sản phẩm 1', N'DV000001', 0, 2, CAST(14 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[SellProductDetail] ([BillID], [ProductID], [ProductName], [UnitID], [ExchangeRate], [Amount], [Price], [Total], [Discount]) VALUES (N'BLS00003', N'SP000002', N'Sản phẩm 2', N'DV000001', 0, 2, CAST(14 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[SellProductDetail] ([BillID], [ProductID], [ProductName], [UnitID], [ExchangeRate], [Amount], [Price], [Total], [Discount]) VALUES (N'BLS00004', N'SP000001', N'Sản phẩm 1', N'DV000001', 0, 1, CAST(140 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[SellProductDetail] ([BillID], [ProductID], [ProductName], [UnitID], [ExchangeRate], [Amount], [Price], [Total], [Discount]) VALUES (N'BLS00004', N'SP000002', N'Sản phẩm 2', N'DV000001', 0, 1, CAST(140 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Staffs] ([ID], [Name], [Position], [Address], [Email], [Phone], [Parts], [Manager]) VALUES (N'NV000001', N'Nguyễn Thị Minh Huệ', N'Quản Lý', NULL, N'huenguyen@hptvn.com', N'0946 980 408   ', N'BP00006', NULL)
INSERT [dbo].[Staffs] ([ID], [Name], [Position], [Address], [Email], [Phone], [Parts], [Manager]) VALUES (N'NV00002', N'Phan Quang Thông', N'Quản Lý', NULL, N'pqt@hcmus.edu.vn', N'0946 980 408   ', N'BP00003', N'NV00002')
INSERT [dbo].[Staffs] ([ID], [Name], [Position], [Address], [Email], [Phone], [Parts], [Manager]) VALUES (N'NV00003', N'Nguyễn Hoàng Dũng', N'Nhân viên', NULL, N'hoangdung@hptvn.com', N'0946 980 407   ', N'BP00003', N'NV00002')
INSERT [dbo].[Staffs] ([ID], [Name], [Position], [Address], [Email], [Phone], [Parts], [Manager]) VALUES (N'NV00004', N'Vũ Anh Tuấn', N'Giám Đốc', NULL, N'director@hptvn.com', N'0909 668 443   ', N'BP00006', N'NV00004')
INSERT [dbo].[Staffs] ([ID], [Name], [Position], [Address], [Email], [Phone], [Parts], [Manager]) VALUES (N'NV00005', N'Huỳnh Thị Ngọc Lãnh', N'Nhân viên', NULL, N'ketoan@hptvn.com', N'0914 181 101   ', N'BP00005', N'NV00007')
INSERT [dbo].[Staffs] ([ID], [Name], [Position], [Address], [Email], [Phone], [Parts], [Manager]) VALUES (N'NV00006', N'Phạm Bảo Trung', N'Nhân viên', NULL, NULL, N'01207 512 093  ', N'BP00004', N'NV00008')
INSERT [dbo].[Staffs] ([ID], [Name], [Position], [Address], [Email], [Phone], [Parts], [Manager]) VALUES (N'NV00007', N'Nguyễn Phú Trọng', N'Quản Lý', NULL, N'npt@hptvn.com', N'01270 482 896  ', N'BP00005', N'NV00007')
INSERT [dbo].[Staffs] ([ID], [Name], [Position], [Address], [Email], [Phone], [Parts], [Manager]) VALUES (N'NV00008', N'Đinh La Thăng', N'Quản Lý', NULL, N'dlt@hptvn.com', N'03500 853 879  ', N'BP00004', N'NV00008')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [Address], [Phone], [Area], [AccountBank], [Email], [Bank], [Discount]) VALUES (N'NCC000003', N'NCC 1', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Unit] ([ID], [Name], [Note]) VALUES (N'DV000001', N'cái', NULL)
INSERT [dbo].[Unit] ([ID], [Name], [Note]) VALUES (N'DV00002', N'thùng', NULL)
INSERT [dbo].[Unit] ([ID], [Name], [Note]) VALUES (N'DV00003', N'kg', NULL)
INSERT [dbo].[Unit] ([ID], [Name], [Note]) VALUES (N'DV00004', N'gam', NULL)
INSERT [dbo].[Unit] ([ID], [Name], [Note]) VALUES (N'DV00005', N'bình', NULL)
INSERT [dbo].[Unit] ([ID], [Name], [Note]) VALUES (N'DV00006', N'bộ', NULL)
INSERT [dbo].[Unit] ([ID], [Name], [Note]) VALUES (N'DV00007', N'cặp', NULL)
INSERT [dbo].[Unit] ([ID], [Name], [Note]) VALUES (N'DV00008', N'con', NULL)
INSERT [dbo].[Unit] ([ID], [Name], [Note]) VALUES (N'DV00009', N'cục', NULL)
INSERT [dbo].[Unit] ([ID], [Name], [Note]) VALUES (N'DV00010', N'cụm', NULL)
INSERT [dbo].[Unit] ([ID], [Name], [Note]) VALUES (N'DV00011', N'cuộn', NULL)
INSERT [dbo].[Unit] ([ID], [Name], [Note]) VALUES (N'DV00012', N'dàn', NULL)
INSERT [dbo].[Unit] ([ID], [Name], [Note]) VALUES (N'DV00013', N'đôi', NULL)
INSERT [dbo].[Unit] ([ID], [Name], [Note]) VALUES (N'DV00014', N'khúc', NULL)
INSERT [dbo].[Unit] ([ID], [Name], [Note]) VALUES (N'DV00015', N'ống', NULL)
INSERT [dbo].[Unit] ([ID], [Name], [Note]) VALUES (N'DV00016', N'sợi', NULL)
INSERT [dbo].[Unit] ([ID], [Name], [Note]) VALUES (N'DV00017', N'que', NULL)
INSERT [dbo].[Unit] ([ID], [Name], [Note]) VALUES (N'DV00018', N'tờ', NULL)
INSERT [dbo].[Unit] ([ID], [Name], [Note]) VALUES (N'DV00019', N'xấp', NULL)
INSERT [dbo].[Unit] ([ID], [Name], [Note]) VALUES (N'DV00020', N'tấm', NULL)
INSERT [dbo].[Unit] ([ID], [Name], [Note]) VALUES (N'DV00021', N'chai', NULL)
INSERT [dbo].[Unit] ([ID], [Name], [Note]) VALUES (N'DV00022', N'lít', NULL)
INSERT [dbo].[Unit] ([ID], [Name], [Note]) VALUES (N'DV00023', N'mét', NULL)
INSERT [dbo].[Unit] ([ID], [Name], [Note]) VALUES (N'DV00024', N'cm', NULL)
INSERT [dbo].[Unit] ([ID], [Name], [Note]) VALUES (N'DV00025', N'gói', NULL)
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [f_username], [f_password], [f_name], [f_mail], [f_dob], [f_Permission]) VALUES (1, N'nndkhoa                                           ', N'E0308DA5BBE8279ADC296567334D429B                  ', N'Khoa N. D. Ngô                                    ', N'nndkhoa@a.c                                       ', CAST(N'2014-02-26' AS Date), 0)
INSERT [dbo].[Users] ([ID], [f_username], [f_password], [f_name], [f_mail], [f_dob], [f_Permission]) VALUES (2, N'tdquang                                           ', N'BABA9830D1E5DEAE4954C1364B536D66                  ', N'Trần Duy Quang                                    ', N'tdquang@a.c                                       ', CAST(N'2014-02-18' AS Date), 0)
INSERT [dbo].[Users] ([ID], [f_username], [f_password], [f_name], [f_mail], [f_dob], [f_Permission]) VALUES (3, N'abc                                               ', N'E10ADC3949BA59ABBE56E057F20F883E                  ', N'abc                                               ', N'abc@a.c                                           ', CAST(N'2014-03-07' AS Date), 0)
INSERT [dbo].[Users] ([ID], [f_username], [f_password], [f_name], [f_mail], [f_dob], [f_Permission]) VALUES (4, N'admin                                             ', N'25C675225D8182194172F103A3B71D31                  ', N'Admin                                             ', N'admin@g.c                                         ', CAST(N'2014-03-19' AS Date), 1)
INSERT [dbo].[Users] ([ID], [f_username], [f_password], [f_name], [f_mail], [f_dob], [f_Permission]) VALUES (5, N'hieu                                              ', N'5C2E72E526BB2125398CFC9AA5987B31                  ', N'hieu                                              ', N'hieu@gmail.com                                    ', CAST(N'1999-04-20' AS Date), 4)
INSERT [dbo].[Users] ([ID], [f_username], [f_password], [f_name], [f_mail], [f_dob], [f_Permission]) VALUES (8, N'hieu1                                             ', N'F56EE4B9D1DED74BD8FBF264409F895B                  ', N'hieu                                              ', N'hieu@h.com                                        ', CAST(N'2019-01-25' AS Date), 0)
INSERT [dbo].[Users] ([ID], [f_username], [f_password], [f_name], [f_mail], [f_dob], [f_Permission]) VALUES (9, N'hieu2                                             ', N'25C675225D8182194172F103A3B71D31                  ', N'hieu2                                             ', N'hieu2@admin.com                                   ', CAST(N'2019-01-25' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
INSERT [dbo].[Warehouse] ([ID], [Name], [Decription], [Manager], [Contact], [Address], [Phone], [Email]) VALUES (N'K000001', N'Vĩnh Tường', N'                              ', N'NV00002', N'0357212895', N'', N'               ', N'')
INSERT [dbo].[Warehouse] ([ID], [Name], [Decription], [Manager], [Contact], [Address], [Phone], [Email]) VALUES (N'K00002', N'Mạnh Tiến', N'                              ', N'NV00002', N'Tân Bình', N'(123) 345-1105', N'MT@Kho.com     ', N'')
INSERT [dbo].[Warehouse] ([ID], [Name], [Decription], [Manager], [Contact], [Address], [Phone], [Email]) VALUES (N'K00003', N'Long Hưng', N'                              ', N'NV00002', NULL, NULL, NULL, NULL)
INSERT [dbo].[Warehouse] ([ID], [Name], [Decription], [Manager], [Contact], [Address], [Phone], [Email]) VALUES (N'K00004', N'Kho công ty', N'                              ', N'NV00002', NULL, NULL, NULL, NULL)
INSERT [dbo].[Warehouse] ([ID], [Name], [Decription], [Manager], [Contact], [Address], [Phone], [Email]) VALUES (N'K00005', N'Kho HCM', NULL, N'NV00002', NULL, NULL, NULL, NULL)
INSERT [dbo].[Warehouse] ([ID], [Name], [Decription], [Manager], [Contact], [Address], [Phone], [Email]) VALUES (N'K00006', N'Kho Hà Nội', NULL, N'NV00002', NULL, NULL, NULL, NULL)
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Areas] FOREIGN KEY([Area])
REFERENCES [dbo].[Areas] ([ID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Areas]
GO
ALTER TABLE [dbo].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Users] FOREIGN KEY([Perm])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Permission] CHECK CONSTRAINT [FK_Permission_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Catergories] FOREIGN KEY([CatergoryID])
REFERENCES [dbo].[Catergories] ([CatID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Catergories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Unit] FOREIGN KEY([UnitID])
REFERENCES [dbo].[Unit] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Unit]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Warehouse] FOREIGN KEY([WarehouseID])
REFERENCES [dbo].[Warehouse] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Warehouse]
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD  CONSTRAINT [FK_Staffs_Parts] FOREIGN KEY([Parts])
REFERENCES [dbo].[Parts] ([ID])
GO
ALTER TABLE [dbo].[Staffs] CHECK CONSTRAINT [FK_Staffs_Parts]
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD  CONSTRAINT [FK_Staffs_Staffs] FOREIGN KEY([Manager])
REFERENCES [dbo].[Staffs] ([ID])
GO
ALTER TABLE [dbo].[Staffs] CHECK CONSTRAINT [FK_Staffs_Staffs]
GO
ALTER TABLE [dbo].[Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Suppliers_Areas] FOREIGN KEY([Area])
REFERENCES [dbo].[Areas] ([ID])
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [FK_Suppliers_Areas]
GO
USE [master]
GO
ALTER DATABASE [QLBH_v1] SET  READ_WRITE 
GO
