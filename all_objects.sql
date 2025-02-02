USE [ProductWebDB]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 1/19/2025 1:51:20 PM ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 1/19/2025 1:51:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CreateProductWithImage]    Script Date: 1/19/2025 1:51:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 1/19/2025 1:51:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllProducts]    Script Date: 1/19/2025 1:51:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetProductByID]    Script Date: 1/19/2025 1:51:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetProductByNameOrCode]    Script Date: 1/19/2025 1:51:20 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateProductWithImage]    Script Date: 1/19/2025 1:51:20 PM ******/
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
