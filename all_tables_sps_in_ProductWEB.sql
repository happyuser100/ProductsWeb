USE [master]
GO
/****** Object:  Database [ProductWebDB]    Script Date: 1/19/2025 1:44:01 PM ******/
CREATE DATABASE [ProductWebDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProductWebDB', FILENAME = N'D:\SqlServer\MSSQL16.SQLEXPRESS\MSSQL\DATA\ProductWebDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProductWebDB_log', FILENAME = N'D:\SqlServer\MSSQL16.SQLEXPRESS\MSSQL\DATA\ProductWebDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ProductWebDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProductWebDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProductWebDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProductWebDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProductWebDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProductWebDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProductWebDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProductWebDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProductWebDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProductWebDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProductWebDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProductWebDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProductWebDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProductWebDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProductWebDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProductWebDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProductWebDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProductWebDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProductWebDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProductWebDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProductWebDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProductWebDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProductWebDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProductWebDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProductWebDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProductWebDB] SET  MULTI_USER 
GO
ALTER DATABASE [ProductWebDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProductWebDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProductWebDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProductWebDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProductWebDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProductWebDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ProductWebDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [ProductWebDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ProductWebDB]
GO
/****** Object:  User [moshe]    Script Date: 1/19/2025 1:44:02 PM ******/
CREATE USER [moshe] FOR LOGIN [moshe] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 1/19/2025 1:44:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[ImageLink] [nvarchar](200) NULL,
 CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 1/19/2025 1:44:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[SellDate] [datetime] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ProductImages] ON 

INSERT [dbo].[ProductImages] ([ImageId], [ProductId], [ImageLink]) VALUES (1, 1, N't1.jpg')
INSERT [dbo].[ProductImages] ([ImageId], [ProductId], [ImageLink]) VALUES (2, 4, N't2.jpg')
INSERT [dbo].[ProductImages] ([ImageId], [ProductId], [ImageLink]) VALUES (3, 5, N'')
INSERT [dbo].[ProductImages] ([ImageId], [ProductId], [ImageLink]) VALUES (4, 6, N'')
INSERT [dbo].[ProductImages] ([ImageId], [ProductId], [ImageLink]) VALUES (5, 7, N'')
INSERT [dbo].[ProductImages] ([ImageId], [ProductId], [ImageLink]) VALUES (7, 9, N'')
INSERT [dbo].[ProductImages] ([ImageId], [ProductId], [ImageLink]) VALUES (8, 10, N'473624391_10236694723131639_5967652637823171510_n_9a8b3fd4-99a9-4f3c-903a-65124f9fc7c6.jpg')
INSERT [dbo].[ProductImages] ([ImageId], [ProductId], [ImageLink]) VALUES (9, 11, N'461903747_27054997770815242_7236416947414297412_n_9461b066-a310-4943-be32-1ba743843202.jpg')
INSERT [dbo].[ProductImages] ([ImageId], [ProductId], [ImageLink]) VALUES (10, 10, N'0366e44b-ce20-4597-9422-43b46a82d3a7_e86c0b97-ba37-4511-b20f-46f6c0736c9f.jpg')
INSERT [dbo].[ProductImages] ([ImageId], [ProductId], [ImageLink]) VALUES (11, 11, N'461903747_27054997770815242_7236416947414297412_n_9461b066-a310-4943-be32-1ba743843202.jpg')
INSERT [dbo].[ProductImages] ([ImageId], [ProductId], [ImageLink]) VALUES (12, 12, N'haha_060560cf-27d5-4d9f-801b-82f6846633fe.png')
SET IDENTITY_INSERT [dbo].[ProductImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductId], [Code], [Name], [Description], [SellDate]) VALUES (1, N'1234', N'Bag', N'Desc 1', CAST(N'2025-01-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Code], [Name], [Description], [SellDate]) VALUES (2, N'12345', N'Bag 2', N'Desc 2', CAST(N'2025-01-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Code], [Name], [Description], [SellDate]) VALUES (3, N'344', N'sss', N'desc sss', CAST(N'2025-01-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Code], [Name], [Description], [SellDate]) VALUES (4, N'5556', N'aa', N'fgfg', CAST(N'2025-01-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Code], [Name], [Description], [SellDate]) VALUES (5, N'777', N'Mosddd', N'hhhhh', CAST(N'2025-01-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Code], [Name], [Description], [SellDate]) VALUES (6, N'888', N'ddffff', N'fffff', CAST(N'2025-01-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Code], [Name], [Description], [SellDate]) VALUES (7, N'88554', N'eee', N'weee', CAST(N'2025-01-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Code], [Name], [Description], [SellDate]) VALUES (9, N'9999', N'aaa', N'bbbb', CAST(N'2025-01-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Code], [Name], [Description], [SellDate]) VALUES (10, N'5556644', N'eee', N'ddd', CAST(N'2025-01-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Code], [Name], [Description], [SellDate]) VALUES (11, N'789989', N'FFF', N'dffgg', CAST(N'2025-01-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Products] ([ProductId], [Code], [Name], [Description], [SellDate]) VALUES (12, N'7888893', N'mos111', N'ggg', CAST(N'2025-01-15T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
/****** Object:  StoredProcedure [dbo].[CreateProductWithImage]    Script Date: 1/19/2025 1:44:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create Product With Image
CREATE PROCEDURE [dbo].[CreateProductWithImage]
    @Code NVARCHAR(50),
    @Name NVARCHAR(50),
    @Description NVARCHAR(100),
	@SellDate DateTime,
    @ImageLink NVARCHAR(200)
AS
BEGIN
    DECLARE @ProductId INT;

    INSERT INTO [dbo].[Products]
           ([Code]
           ,[Name]
           ,[Description]
		   ,[SellDate]
           )
     VALUES
           (@Code, 
            @Name, 
            @Description,
			@SellDate
            )

     SET @ProductId = SCOPE_IDENTITY();

     INSERT INTO [dbo].[ProductImages]
           ([ProductId]
           ,[ImageLink])
     VALUES
           (@ProductId,
            @ImageLink)
    
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 1/19/2025 1:44:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Delete Product
CREATE   PROCEDURE [dbo].[DeleteProduct]
    @ProductID INT
AS
BEGIN
    -- Start transaction
    BEGIN TRANSACTION;

	DELETE FROM [dbo].[ProductImages]
    WHERE ProductID = @ProductID

	DELETE FROM [dbo].[Products]
	WHERE ProductID = @ProductID

    -- Commit transaction
    COMMIT TRANSACTION;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAllProducts]    Script Date: 1/19/2025 1:44:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetAllProducts]
AS
BEGIN
  SELECT p.ProductId,Code,Name,Description,SellDate, a.ImageLink
  FROM dbo.Products p
  INNER JOIN ProductImages a ON p.ProductId = a.ProductId;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetProductByID]    Script Date: 1/19/2025 1:44:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Get Product By ID
CREATE   PROCEDURE [dbo].[GetProductByID]
    @ProductId INT
AS
BEGIN
  SELECT p.ProductId,Code,Name,Description,SellDate, a.ImageLink
  FROM dbo.Products p
  INNER JOIN ProductImages a ON p.ProductId = a.ProductId
  WHERE p.ProductId = @ProductId;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetProductByNameOrCode]    Script Date: 1/19/2025 1:44:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetProductByNameOrCode]
    @str nvarchar(100)
AS
BEGIN
  --SELECT p.ProductId,Code,Name,Description, CONVERT (varchar(10), SellDate, 105) as SellDate, a.ImageLink
  SELECT p.ProductId,Code,Name,Description, SellDate, a.ImageLink
  FROM dbo.Products p
  INNER JOIN ProductImages a ON p.ProductId = a.ProductId
  WHERE (p.Code LIKE '%' + @str + '%') OR  (p.Name LIKE '%' + @str + '%');
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateProductWithImage]    Script Date: 1/19/2025 1:44:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Update Product With Image
CREATE PROCEDURE [dbo].[UpdateProductWithImage]
	@ProductId INT,
    @Code NVARCHAR(50),
    @Name NVARCHAR(50),
    @Description NVARCHAR(100),
	@SellDate DateTime,
    @ImageLink NVARCHAR(200)
AS
BEGIN
    -- Update Products table
    UPDATE [dbo].[Products]
    SET [Code] = @Code,[Name] = @Name,[Description] = @Description, [SellDate] = @SellDate
    WHERE ProductId = @ProductId;

	-- Update ProductImages table
    UPDATE [dbo].[ProductImages]
    SET [ImageLink] = @ImageLink
    WHERE ProductId = @ProductId;
END;
GO
USE [master]
GO
ALTER DATABASE [ProductWebDB] SET  READ_WRITE 
GO
