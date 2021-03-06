USE [master]
GO
/****** Object:  Database [POS_Tutorial]    Script Date: 5/22/2020 12:35:04 AM ******/
CREATE DATABASE [POS_Tutorial]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'POS_Tutorial', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\POS_Tutorial.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'POS_Tutorial_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\POS_Tutorial_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [POS_Tutorial] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [POS_Tutorial].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [POS_Tutorial] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [POS_Tutorial] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [POS_Tutorial] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [POS_Tutorial] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [POS_Tutorial] SET ARITHABORT OFF 
GO
ALTER DATABASE [POS_Tutorial] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [POS_Tutorial] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [POS_Tutorial] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [POS_Tutorial] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [POS_Tutorial] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [POS_Tutorial] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [POS_Tutorial] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [POS_Tutorial] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [POS_Tutorial] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [POS_Tutorial] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [POS_Tutorial] SET  DISABLE_BROKER 
GO
ALTER DATABASE [POS_Tutorial] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [POS_Tutorial] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [POS_Tutorial] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [POS_Tutorial] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [POS_Tutorial] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [POS_Tutorial] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [POS_Tutorial] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [POS_Tutorial] SET RECOVERY FULL 
GO
ALTER DATABASE [POS_Tutorial] SET  MULTI_USER 
GO
ALTER DATABASE [POS_Tutorial] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [POS_Tutorial] SET DB_CHAINING OFF 
GO
ALTER DATABASE [POS_Tutorial] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [POS_Tutorial] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'POS_Tutorial', N'ON'
GO
USE [POS_Tutorial]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/22/2020 12:35:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/22/2020 12:35:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[CategoryId] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductQuantity]    Script Date: 5/22/2020 12:35:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductQuantity](
	[ProductQtyId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_ProductQuantity] PRIMARY KEY CLUSTERED 
(
	[ProductQtyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sale]    Script Date: 5/22/2020 12:35:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[SalesId] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [nvarchar](50) NULL,
	[CustomerName] [nvarchar](50) NULL,
	[CustomerPhone] [nvarchar](50) NULL,
	[CustomerAddress] [nvarchar](50) NULL,
	[OrderDate] [datetime] NULL,
	[PaymentMethod] [nvarchar](50) NULL,
	[TotalAmout] [float] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[SalesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesDetail]    Script Date: 5/22/2020 12:35:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesDetail](
	[SalesDetailId] [int] IDENTITY(1,1) NOT NULL,
	[SalesId] [int] NULL,
	[ProductId] [int] NULL,
	[UnitPrice] [float] NULL,
	[Quantity] [int] NULL,
	[LineTotal] [float] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_SalesDetail] PRIMARY KEY CLUSTERED 
(
	[SalesDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 5/22/2020 12:35:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](200) NULL,
	[Role] [nvarchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[ProductQuantity]  WITH CHECK ADD  CONSTRAINT [FK_ProductQuantity_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductQuantity] CHECK CONSTRAINT [FK_ProductQuantity_Product]
GO
ALTER TABLE [dbo].[SalesDetail]  WITH CHECK ADD  CONSTRAINT [FK_SalesDetail_Sale] FOREIGN KEY([SalesId])
REFERENCES [dbo].[Sale] ([SalesId])
GO
ALTER TABLE [dbo].[SalesDetail] CHECK CONSTRAINT [FK_SalesDetail_Sale]
GO
USE [master]
GO
ALTER DATABASE [POS_Tutorial] SET  READ_WRITE 
GO
