USE [master]
GO
/****** Object:  Database [QLBH_v1]    Script Date: 11/27/2019 5:10:17 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_IsLoginSuccess]    Script Date: 11/27/2019 5:10:18 PM ******/
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
/****** Object:  Table [dbo].[Areas]    Script Date: 11/27/2019 5:10:18 PM ******/
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
/****** Object:  Table [dbo].[Catergories]    Script Date: 11/27/2019 5:10:18 PM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 11/27/2019 5:10:18 PM ******/
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
/****** Object:  Table [dbo].[ExRate]    Script Date: 11/27/2019 5:10:18 PM ******/
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
/****** Object:  Table [dbo].[Form]    Script Date: 11/27/2019 5:10:18 PM ******/
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
/****** Object:  Table [dbo].[Parts]    Script Date: 11/27/2019 5:10:18 PM ******/
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
/****** Object:  Table [dbo].[Permission]    Script Date: 11/27/2019 5:10:18 PM ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 11/27/2019 5:10:18 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 11/27/2019 5:10:18 PM ******/
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
/****** Object:  Table [dbo].[Role_Form]    Script Date: 11/27/2019 5:10:18 PM ******/
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
/****** Object:  Table [dbo].[Staffs]    Script Date: 11/27/2019 5:10:18 PM ******/
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
/****** Object:  Table [dbo].[Suppliers]    Script Date: 11/27/2019 5:10:18 PM ******/
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
/****** Object:  Table [dbo].[Unit]    Script Date: 11/27/2019 5:10:18 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 11/27/2019 5:10:18 PM ******/
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
/****** Object:  Table [dbo].[Warehouse]    Script Date: 11/27/2019 5:10:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Warehouse](
	[ID] [varchar](15) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Note] [nchar](30) NULL,
 CONSTRAINT [PK_Warehouse] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Areas] ([ID], [Name], [Note]) VALUES (N'KV000001', N'Miền Nam', NULL)
INSERT [dbo].[Areas] ([ID], [Name], [Note]) VALUES (N'KV000002', N'hieu', N'hieu')
INSERT [dbo].[Areas] ([ID], [Name], [Note]) VALUES (N'KV000003', N'Miền Trung', NULL)
INSERT [dbo].[Areas] ([ID], [Name], [Note]) VALUES (N'KV000004', N'Đông Nam Bộ', N'')
SET IDENTITY_INSERT [dbo].[Form] ON 

INSERT [dbo].[Form] ([ID], [FormName], [Description], [FatherForm]) VALUES (1, N'frmMain                       ', N'frmMain                       ', 1)
INSERT [dbo].[Form] ([ID], [FormName], [Description], [FatherForm]) VALUES (2, N'frmProduct                    ', N'Product manager               ', NULL)
INSERT [dbo].[Form] ([ID], [FormName], [Description], [FatherForm]) VALUES (3, N'ucArea                        ', N'Area manager                  ', NULL)
INSERT [dbo].[Form] ([ID], [FormName], [Description], [FatherForm]) VALUES (4, N'frmInsertArea                 ', NULL, NULL)
INSERT [dbo].[Form] ([ID], [FormName], [Description], [FatherForm]) VALUES (5, N'frmUpdateArea                 ', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Form] OFF
INSERT [dbo].[Parts] ([ID], [Name], [Note]) VALUES (N'P000001', N'Manager', NULL)
INSERT [dbo].[Permission] ([Perm], [f_insertUser], [f_deleteUser], [f_updateUser], [f_insertProduct], [f_deleteProduct], [f_updateProduct], [f_insertCategory], [f_deleteCategory], [f_updateCategory], [f_insertSupplier], [f_deleteSupplier], [f_updateSupplier], [f_insertStaff], [f_deleteStaff], [f_updateStaff], [f_cashing], [f_report]) VALUES (1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Permission] ([Perm], [f_insertUser], [f_deleteUser], [f_updateUser], [f_insertProduct], [f_deleteProduct], [f_updateProduct], [f_insertCategory], [f_deleteCategory], [f_updateCategory], [f_insertSupplier], [f_deleteSupplier], [f_updateSupplier], [f_insertStaff], [f_deleteStaff], [f_updateStaff], [f_cashing], [f_report]) VALUES (2, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1)
INSERT [dbo].[Permission] ([Perm], [f_insertUser], [f_deleteUser], [f_updateUser], [f_insertProduct], [f_deleteProduct], [f_updateProduct], [f_insertCategory], [f_deleteCategory], [f_updateCategory], [f_insertSupplier], [f_deleteSupplier], [f_updateSupplier], [f_insertStaff], [f_deleteStaff], [f_updateStaff], [f_cashing], [f_report]) VALUES (3, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0)
INSERT [dbo].[Permission] ([Perm], [f_insertUser], [f_deleteUser], [f_updateUser], [f_insertProduct], [f_deleteProduct], [f_updateProduct], [f_insertCategory], [f_deleteCategory], [f_updateCategory], [f_insertSupplier], [f_deleteSupplier], [f_updateSupplier], [f_insertStaff], [f_deleteStaff], [f_updateStaff], [f_cashing], [f_report]) VALUES (4, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
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
SET IDENTITY_INSERT [dbo].[Role_Form] OFF
INSERT [dbo].[Staffs] ([ID], [Name], [Position], [Address], [Email], [Phone], [Parts], [Manager]) VALUES (N'NV000001', N'Admin', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [f_username], [f_password], [f_name], [f_mail], [f_dob], [f_Permission]) VALUES (1, N'nndkhoa                                           ', N'E0308DA5BBE8279ADC296567334D429B                  ', N'Khoa N. D. Ngô                                    ', N'nndkhoa@a.c                                       ', CAST(N'2014-02-26' AS Date), 0)
INSERT [dbo].[Users] ([ID], [f_username], [f_password], [f_name], [f_mail], [f_dob], [f_Permission]) VALUES (2, N'tdquang                                           ', N'BABA9830D1E5DEAE4954C1364B536D66                  ', N'Trần Duy Quang                                    ', N'tdquang@a.c                                       ', CAST(N'2014-02-18' AS Date), 0)
INSERT [dbo].[Users] ([ID], [f_username], [f_password], [f_name], [f_mail], [f_dob], [f_Permission]) VALUES (3, N'abc                                               ', N'E10ADC3949BA59ABBE56E057F20F883E                  ', N'abc                                               ', N'abc@a.c                                           ', CAST(N'2014-03-07' AS Date), 0)
INSERT [dbo].[Users] ([ID], [f_username], [f_password], [f_name], [f_mail], [f_dob], [f_Permission]) VALUES (4, N'admin                                             ', N'0192023A7BBD73250516F069DF18B500                  ', N'Admin                                             ', N'admin@g.c                                         ', CAST(N'2014-03-19' AS Date), 1)
INSERT [dbo].[Users] ([ID], [f_username], [f_password], [f_name], [f_mail], [f_dob], [f_Permission]) VALUES (5, N'hieu                                              ', N'5C2E72E526BB2125398CFC9AA5987B31                  ', N'hieu                                              ', N'hieu@gmail.com                                    ', CAST(N'1999-04-20' AS Date), 4)
SET IDENTITY_INSERT [dbo].[Users] OFF
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
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([Supplier])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
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
