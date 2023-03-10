USE [master]
GO
/****** Object:  Database [DTNsShop]    Script Date: 01/07/2022 10:47:27 AM ******/
CREATE DATABASE [DTNsShop]
 CONTAINMENT = NONE
GO
ALTER DATABASE [DTNsShop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DTNsShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DTNsShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DTNsShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DTNsShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DTNsShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DTNsShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [DTNsShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DTNsShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DTNsShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DTNsShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DTNsShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DTNsShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DTNsShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DTNsShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DTNsShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DTNsShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DTNsShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DTNsShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DTNsShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DTNsShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DTNsShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DTNsShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DTNsShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DTNsShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DTNsShop] SET  MULTI_USER 
GO
ALTER DATABASE [DTNsShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DTNsShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DTNsShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DTNsShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DTNsShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DTNsShop] SET QUERY_STORE = OFF
GO
USE [DTNsShop]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 01/07/2022 10:47:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[Admins] [bit] NOT NULL,
	[Photo] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 01/07/2022 10:47:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 01/07/2022 10:47:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 01/07/2022 10:47:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[LikeDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 01/07/2022 10:47:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 01/07/2022 10:47:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Status] [bit] NOT NULL,
	[CancelOrder] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 01/07/2022 10:47:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[ColorId] [int] NOT NULL,
	[Images] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 01/07/2022 10:47:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[images] [nvarchar](100) NOT NULL,
	[Price] [float] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[CategoryId] [nvarchar](50) NOT NULL,
	[Review] [nvarchar](max) NOT NULL,
	[Amount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [PhoneNumber], [Active], [Admins], [Photo]) VALUES (N'admin@123', N'123', N'Võ Lê Nhật Linh ', N'volenhatlinh2k2@gmail.com', N'0944694441', 1, 1, N'photo_admin@123.png')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [PhoneNumber], [Active], [Admins], [Photo]) VALUES (N'Butoka@123', N'123', N'Lê Long Linh', N'linhlelong@gmail.com', N'0944694449', 1, 1, N'default.jpg')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [PhoneNumber], [Active], [Admins], [Photo]) VALUES (N'chiwake', N'123', N'Võ Lê Nhật Linh', N'volenhatlinh2k2@gmail.com', N'0944694440', 1, 1, N'photo_chiwake.jpg')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [PhoneNumber], [Active], [Admins], [Photo]) VALUES (N'dat@123', N'123', N'Huỳnh Văn Đạt', N'dat123@gmail.com', N'0912345678', 1, 0, N'photo_dat@123.jpg')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [PhoneNumber], [Active], [Admins], [Photo]) VALUES (N'linhvln', N'123', N'Võ Lê Nhật Linh', N'volenhatlinh@gmail.com', N'0944694450', 1, 1, N'default.jpg')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [PhoneNumber], [Active], [Admins], [Photo]) VALUES (N'long123', N'123', N'Nguyễn Văn Long', N'longnv2084@gmail.com', N'0944694449', 0, 0, N'default.jpg')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [PhoneNumber], [Active], [Admins], [Photo]) VALUES (N'tan@23', N'123', N'Lê Hoàng Tân', N'tanleh@gmail.com', N'0934553434', 0, 0, N'default.jpg')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [PhoneNumber], [Active], [Admins], [Photo]) VALUES (N'teonv', N'123', N'Nguyễn Văn Tèo', N'teonv123@gmail.com', N'0944694449', 1, 0, N'default.jpg')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [PhoneNumber], [Active], [Admins], [Photo]) VALUES (N'TeoNV2', N'123', N'Nguyễn Tèo', N'linhvlnpc01785@fpt.edu.vn', N'0944694449', 1, 0, N'default.jpg')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [PhoneNumber], [Active], [Admins], [Photo]) VALUES (N'teonv3', N'123', N'Võ Lê Nhật Linh', N'volenhatlinh2k2@gmail.com', N'0944694449', 1, 0, N'default.jpg')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [PhoneNumber], [Active], [Admins], [Photo]) VALUES (N'tranhl@123', N'123', N'Hồ Lý Trân', N'tranhl123@gmail.com', N'0833388888', 1, 1, N'default.jpg')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [PhoneNumber], [Active], [Admins], [Photo]) VALUES (N'truyennv', N'123', N'Nguyễn Văn Truyền', N'truyennv@gmail.com', N'0923235467', 1, 1, N'default.jpg')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [PhoneNumber], [Active], [Admins], [Photo]) VALUES (N'tungNp', N'123', N'Nguyễn Phương Tùng', N'tungnp21@gmail.com', N'0912333333', 1, 1, N'default.jpg')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [PhoneNumber], [Active], [Admins], [Photo]) VALUES (N'user1', N'123', N'Trương Tấn Lộc', N'nguoidung1@gmail.com', N'0943232323', 1, 0, N'photo_user1.jpg')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [PhoneNumber], [Active], [Admins], [Photo]) VALUES (N'user2', N'123', N'Người dùng 2', N'nguoidung2@gmail.com', N'0942434344', 1, 0, N'default.jpg')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [PhoneNumber], [Active], [Admins], [Photo]) VALUES (N'user3', N'123', N'Trần Khôn Chủng', N'volenhatlinh2k2@gmail.com', N'0944694449', 1, 0, N'photo_Ninh@123.jpg')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [PhoneNumber], [Active], [Admins], [Photo]) VALUES (N'user5', N'123', N'Nguyễn Văn Tèo 2', N'volenhatlinh2k2@gmail.com', N'0944694449', 1, 0, N'photo_user5.jpg')
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [PhoneNumber], [Active], [Admins], [Photo]) VALUES (N'viden@123', N'123', N'Danh Vĩ', N'vidvden@gmail.com', N'0341212121', 0, 1, N'default.jpg')
GO
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1000', N'Sách ')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1001', N'Sổ tay')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1002', N'Bút mực')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1003', N'Thước kẻ')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1004', N'Hộp đựng bút')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1005', N'Bút màu')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1006', N'Giấy note')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1007', N'Gom tẩy ')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1008', N'Sổ bì thư')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1009', N'Băng keo - hồ dán')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1010', N'Giấy văn phòng')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1011', N'Bìa hồ sơ')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1013', N'Bút chì  ')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (N'1014', N'Người tốt ')
GO
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([Id], [Name]) VALUES (1, N'Màu đỏ')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (2, N'Màu xanh')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (3, N'Màu hồng cánh sen')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (4, N'Màu hồng')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (5, N'Màu trắng')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (6, N'Màu trong suốt ')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (7, N'Không màu')
SET IDENTITY_INSERT [dbo].[Colors] OFF
GO
SET IDENTITY_INSERT [dbo].[Favorites] ON 

INSERT [dbo].[Favorites] ([Id], [UserId], [ProductId], [LikeDate]) VALUES (4, N'user2', 2, CAST(N'2022-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Favorites] ([Id], [UserId], [ProductId], [LikeDate]) VALUES (5, N'tungNp', 6, CAST(N'2022-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Favorites] ([Id], [UserId], [ProductId], [LikeDate]) VALUES (7, N'dat@123', 7, CAST(N'1999-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Favorites] ([Id], [UserId], [ProductId], [LikeDate]) VALUES (18, N'admin@123', 2, CAST(N'2022-06-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Favorites] ([Id], [UserId], [ProductId], [LikeDate]) VALUES (19, N'dat@123', 13, CAST(N'2022-06-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Favorites] ([Id], [UserId], [ProductId], [LikeDate]) VALUES (20, N'admin@123', 7, CAST(N'2022-06-29T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Favorites] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (1, 3, 2, 4000, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (2, 3, 2, 3000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (3, 1, 9, 12000, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (4, 1, 2, 4000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (5, 1, 7, 3200, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (6, 1, 2, 4000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (7, 7, 2, 12000, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (8, 7, 7, 10000, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (9, 12, 10, 20000, 5)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (10, 13, 36, 140000, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (11, 14, 14, 300000, 6)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (12, 15, 57, 25600, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (13, 16, 48, 120000, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (14, 16, 51, 35000, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (15, 16, 52, 100000, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (16, 16, 14, 300000, 4)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (17, 17, 9, 13000, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (18, 17, 10, 20000, 10)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (19, 18, 3, 12000, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (20, 19, 10, 20000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (21, 19, 28, 30000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (22, 20, 57, 25600, 2)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (23, 20, 41, 50000, 3)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (24, 20, 27, 170000, 1)
INSERT [dbo].[OrderDetails] ([Id], [OrderId], [ProductId], [Price], [Quantity]) VALUES (25, 21, 3, 12000, 2)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Status], [CancelOrder]) VALUES (1, N'dat@123', CAST(N'2022-06-06T00:00:00.000' AS DateTime), N'Bạc Liêu ', 0, 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Status], [CancelOrder]) VALUES (3, N'admin@123', CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'Kiên Giang', 1, 0)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Status], [CancelOrder]) VALUES (5, N'admin@123', CAST(N'2022-03-22T00:00:00.000' AS DateTime), N'Kiên Giang', 1, 0)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Status], [CancelOrder]) VALUES (6, N'dat@123', CAST(N'2022-04-01T00:00:00.000' AS DateTime), N'Bạc Liêu ', 0, 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Status], [CancelOrder]) VALUES (7, N'admin@123', CAST(N'2022-06-22T00:00:00.000' AS DateTime), N'288 Nguyễn Văn Linh,NNinh Kiều, Cần Thơ', 0, 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Status], [CancelOrder]) VALUES (8, N'admin@123', CAST(N'2022-06-22T00:00:00.000' AS DateTime), N'288 Nguyễn Văn Linh, Ninh Kiều, Cần Thơ', 0, 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Status], [CancelOrder]) VALUES (9, N'tranhl@123', CAST(N'2022-06-22T00:00:00.000' AS DateTime), N'Cần Thơ', 1, 0)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Status], [CancelOrder]) VALUES (12, N'tranhl@123', CAST(N'2022-06-22T00:00:00.000' AS DateTime), N'sasa', 0, 0)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Status], [CancelOrder]) VALUES (13, N'admin@123', CAST(N'2022-06-22T00:00:00.000' AS DateTime), N'Kiên Giang', 0, 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Status], [CancelOrder]) VALUES (14, N'dat@123', CAST(N'2022-06-22T00:00:00.000' AS DateTime), N'Bạc Liêu', 0, 0)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Status], [CancelOrder]) VALUES (15, N'admin@123', CAST(N'2022-06-26T00:00:00.000' AS DateTime), N'Cần Thơ', 0, 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Status], [CancelOrder]) VALUES (16, N'admin@123', CAST(N'2022-06-26T00:00:00.000' AS DateTime), N'288', 1, 0)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Status], [CancelOrder]) VALUES (17, N'dat@123', CAST(N'2022-06-26T00:00:00.000' AS DateTime), N'288 Nguyễn Văn Linh, Ninh Kiều, Cần Thơ', 1, 0)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Status], [CancelOrder]) VALUES (18, N'dat@123', CAST(N'2022-06-26T00:00:00.000' AS DateTime), N'288 Nguyễn Văn Linh, Ninh Kiều, Cần Thơ', 0, 0)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Status], [CancelOrder]) VALUES (19, N'admin@123', CAST(N'2022-06-26T00:00:00.000' AS DateTime), N'abcdfegkh', 0, 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Status], [CancelOrder]) VALUES (20, N'admin@123', CAST(N'2022-06-27T00:00:00.000' AS DateTime), N'288 Nguyễn Văn Linh, Ninh Kiều, Cần Thơ', 1, 0)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Status], [CancelOrder]) VALUES (21, N'TeoNV', CAST(N'2022-06-27T00:00:00.000' AS DateTime), N'288 Nguyễn Văn Linh, Ninh Kiều, Cần Thơ', 0, 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImage] ON 

INSERT [dbo].[ProductImage] ([Id], [ProductId], [ColorId], [Images]) VALUES (1, 6, 1, N'default.jpg')
INSERT [dbo].[ProductImage] ([Id], [ProductId], [ColorId], [Images]) VALUES (2, 6, 2, N'default.jpg')
INSERT [dbo].[ProductImage] ([Id], [ProductId], [ColorId], [Images]) VALUES (3, 6, 3, N'default.jpg')
INSERT [dbo].[ProductImage] ([Id], [ProductId], [ColorId], [Images]) VALUES (6, 2, 1, N'productImg_13.jpg')
INSERT [dbo].[ProductImage] ([Id], [ProductId], [ColorId], [Images]) VALUES (8, 2, 2, N'default.jpg')
INSERT [dbo].[ProductImage] ([Id], [ProductId], [ColorId], [Images]) VALUES (11, 2, 3, N'productImg_12.jpg')
INSERT [dbo].[ProductImage] ([Id], [ProductId], [ColorId], [Images]) VALUES (12, 2, 5, N'But_mau_nuoc_Cute_animals_set12_(20110274_xx).jpg')
SET IDENTITY_INSERT [dbo].[ProductImage] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (2, N'Bút bi Thiên Long xanh', N'productImg_2.jpg', 4500, CAST(N'2022-06-08' AS Date), 1, N'1002', N'Bút bi thiên long xanh với mực là màu xanh ', 12)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (3, N'Bút bi Thiên Long Đen', N'productImg_3.jpg', 12000, CAST(N'2022-06-12' AS Date), 1, N'1001', N'Màu đen', 20)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (5, N'Bút bi Thiên Long Đỏ', N'productImg_5.jpg', 13000, CAST(N'2022-06-01' AS Date), 1, N'1001', N'Màu đỏ', 30)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (6, N'Bút bi Thiên Long Hồng', N'productImg_6.jpg', 12000, CAST(N'2022-06-12' AS Date), 1, N'1002', N'Đen thoi đỏ quên đi :)) nhưng nó màu hồng', 15)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (7, N'Tập học sinh 96 trang', N'productImg_7.jpg', 15000, CAST(N'2022-06-01' AS Date), 0, N'1001', N'Tập học sinh', 99)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (8, N'Bút chì gỗ Thiên Long', N'productImg_8.jpg', 12000, CAST(N'2022-01-01' AS Date), 1, N'1002', N'Bút chì để vẽ hoặc để viết :)', 17)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (9, N'Bìa bao tập sách điểm 10', N'productImg_9.jpg', 13000, CAST(N'2022-08-12' AS Date), 1, N'1001', N'Bìa bao tập', 2)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (10, N'Võ Lê Nhật Linh', N'productImg_10.jpg', 20000, CAST(N'2022-06-14' AS Date), 1, N'1014', N'', 10)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (12, N'Huỳnh Văn Đạt', N'productImg_12.jpg', 1, CAST(N'2022-06-14' AS Date), 1, N'1014', N'Đang có nguy cơ lạm phát  trên thị trường :))', 1)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (13, N'Nguyễn Văn Tèo 2', N'productImg_13.jpg', 10, CAST(N'2022-06-14' AS Date), 0, N'1001', N'Rất đẹp trai
', 3)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (14, N'Nguyễn Đoàn Chí Thức', N'productImg_14.jpg', 300000, CAST(N'2022-06-14' AS Date), 1, N'1014', N'Đặc điểm nhận dạng : Ốm :v', 1)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (24, N'Khay đựng văn phòng phẩm khổ A4 - Hàng nội địa Nhật', N'productImg_15.jpg', 69000, CAST(N'2022-06-14' AS Date), 1, N'1004', N'', 1)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (25, N'Bút bi Thiên Long Xanh', N'productImg_25.jfif', 10000, CAST(N'2022-06-14' AS Date), 1, N'1002', N'', 3)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (26, N'Hộp đựng bút đẹp', N'productImg_26.jpg', 1, CAST(N'2022-06-14' AS Date), 1, N'1004', N'', 12)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (27, N' Bút màu nước Cute penguin ice cream set24 - Mix', N'productImg_27.jpg', 170000, CAST(N'2022-06-14' AS Date), 1, N'1005', N'Bút màu nước Cute penguin ice cream set24 - Mix....', 80)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (28, N'Bút viết treo Astronaut khối tròn kẻ ô - Mix', N'productImg_28.jpg', 30000, CAST(N'2022-06-14' AS Date), 1, N'1002', N'Bút viết treo Astronaut khối tròn kẻ ô - Mix', 20)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (29, N'Bút viết Star astronaut có đèn - Mix', N'productImg_29.jpg', 30000, CAST(N'2022-06-14' AS Date), 1, N'1002', N'Bút viết Star astronaut có đèn - Mix', 20)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (30, N'Bút chì kim DF Friends Cáo hồng - Mix', N'productImg_30.jpg', 20000, CAST(N'2022-06-14' AS Date), 0, N'1013', N'Bút chì kim DF Friends Cáo hồng - Mix', 12)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (31, N'Bút nhớ dòng Astronaut rabbit space - Mix', N'productImg_31.jpg', 25000, CAST(N'2022-06-14' AS Date), 1, N'1002', N'Bút nhớ dòng Astronaut rabbit space - Mix', 22)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (32, N'Kẹp tài liệu A4 Cún lông xù fruit strawberry f', N'productImg_32.jpg', 30000, CAST(N'2022-06-14' AS Date), 1, N'1008', N'Kẹp tài liệu A4 Cún lông xù fruit strawberry flower nền kẻ ô 22x31 - Mix', 29)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (33, N'Túi đựng tài liệu MJ khóa kéo Little boy', N'productImg_33.jpg', 20000, CAST(N'2022-06-14' AS Date), 0, N'1011', N'Túi đựng tài liệu MJ khóa kéo Little boy playing with animal 24x33 - Mix', 17)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (34, N'Túi đựng tài liệu MJ khóa kéo Happy tiger 24x33 - Mix', N'productImg_34.jpg', 20000, CAST(N'2022-06-14' AS Date), 1, N'1011', N'Túi đựng tài liệu MJ khóa kéo Happy tiger 24x33 - Mix', 17)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (35, N'Cục tẩy gôm Toast set4 - Mix', N'productImg_35.jpg', 25000, CAST(N'2022-06-14' AS Date), 1, N'1007', N'Cục tẩy gôm Toast set4 - Mix', 13)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (36, N'Đựng bút đa năng trang trí Mysterious astronaut ', N'productImg_36.jpg', 140000, CAST(N'2022-06-14' AS Date), 1, N'1004', N'Đựng bút đa năng trang trí Mysterious astronaut cao cấp 8x10 - Xanh indigo', 16)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (37, N'Bút màu Minion', N'But_mau_nuoc_Minions_doi_non_mau_set36_(20061224_xx).jpg', 12000, CAST(N'2022-06-14' AS Date), 1, N'1005', N'', 20)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (38, N'Dao rọc giấy khủng long', N'Dung_cu_roc_giay_mini_Khung_long_sung_do_cute_(21112225_gn).jpg', 20000, CAST(N'2022-06-14' AS Date), 1, N'1009', N'', 10)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (39, N'Dao rọc giấy hình mèo', N'Dung_cu_roc_giay_mini_Meo_may_man_NB_(21112226_wh).jpg', 15000, CAST(N'2022-06-14' AS Date), 1, N'1009', N'', 11)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (40, N'Hộp đựng bút đẹp con mèo 1', N'productImg_40.jpg', 23000, CAST(N'2022-06-14' AS Date), 1, N'1004', N'', 25)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (41, N'Tẩy hình siêu nhân', N'Cu__c_ta__y_Sieu_nhan_ba__nh_xe_sa__ng_ta__o_(m_c107_no_1805714_xx).jpg', 50000, CAST(N'2022-06-14' AS Date), 1, N'1007', N'', 20)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (42, N'Bộ thước kẻ 1', N'Thuoc_ke_Baby_bear_rabbit_long_xu_toffee_diary_15cm_(21120103_xx).jpg', 13000, CAST(N'2022-06-14' AS Date), 1, N'1003', N'', 10)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (43, N'Hộp bút đa năng 222', N'Dung_but_da_nang_nhua_Astronaut_little_girl_rabbit_space_dreams_(22020021).jpg', 30000, CAST(N'2022-06-14' AS Date), 1, N'1004', N'', 10)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (44, N'Hôp đựng bút đa năng cute phô mai que', N'Dung_but_da_nang_nhua_tu_lanh_1_mau_cute_7x9x13_(21112218).jpg', 45000, CAST(N'2022-06-14' AS Date), 1, N'1004', N'', 22)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (45, N'Sổ tay 1', N'productImg_45.jpg', 20000, CAST(N'2022-06-14' AS Date), 1, N'1001', N'', 11)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (46, N'Sổ tay tranh vẽ :))', N'productImg_46.jpg', 23000, CAST(N'2022-06-14' AS Date), 1, N'1001', N'', 21)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (47, N'Sổ tay bìa da đẹp', N'productImg_47.jpg', 25000, CAST(N'2022-06-14' AS Date), 1, N'1001', N'', 11)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (48, N'Sổ tay bìa da hạng sang', N'productImg_48.jpg', 120000, CAST(N'2022-06-14' AS Date), 1, N'1001', N'', 23)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (49, N'Viết có khả năng  uốn cong ', N'productImg_49.jpg', 12000, CAST(N'2022-06-14' AS Date), 1, N'1013', N'', 17)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (50, N'Bộ thước kẻ trong suốt', N'Thuoc_ke_Baby_bear_rabbit_long_xu_toffee_diary_15cm_(21120103_xx).jpg', 23500, CAST(N'2022-06-14' AS Date), 1, N'1003', N'', 20)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (51, N'Bộ thước kẻ 3 con mèo con', N'Thuoc_ke_Electronics_12cm_(19050006_xx).jpg', 35000, CAST(N'2022-06-14' AS Date), 1, N'1003', N'', 22)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (52, N'Sổ tay da cute ', N'So_vo_cao_cap_boc_da_Cute_cat_superise_13x18_(21010392_xx).jpg', 100000, CAST(N'2022-06-14' AS Date), 1, N'1001', N'', 21)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (53, N'Sổ tay cao cấp ', N'So_vo_cao_cap_Cute_carnival_party_animal_13x18_(20070421_hoc).jpg', 12000, CAST(N'2022-06-14' AS Date), 1, N'1001', N'', 16)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (54, N'Bìa hồ sơ hình thỏ con', N'productImg_54.jpg', 12000, CAST(N'2022-06-14' AS Date), 1, N'1011', N'', 20)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (55, N'Bút chì màu siêu xịn', N'But_chi_mau_Hoa_anh_dao_than_bac_hop_36_mau_(19072208_xx).jpg', 22000, CAST(N'2022-06-14' AS Date), 1, N'1013', N'', 25)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (56, N'Bút chì màu không xịn', N'But_chi_mau_Hoa_anh_dao_than_bac_hop_36_mau_(19072208_xx).jpg', 16000, CAST(N'2022-06-14' AS Date), 1, N'1013', N'', 35)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (57, N'Kẹp tài liệu thỏ con', N'productImg_57.jpg', 25600, CAST(N'2022-06-14' AS Date), 1, N'1000', N'', 20)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (58, N'Bìa hồ sơ khám phá vũ trụ', N'productImg_58.jpg', 26000, CAST(N'2022-06-14' AS Date), 1, N'1011', N'', 30)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (59, N'Sổ tay cao cấp 1000', N'productImg_59.jpg', 23000, CAST(N'2022-06-14' AS Date), 1, N'1001', N'', 25)
INSERT [dbo].[Products] ([Id], [Name], [images], [Price], [CreateDate], [Available], [CategoryId], [Review], [Amount]) VALUES (60, N'Đơn giản là bút bi xanh', N'productImg_60.jpg', 6000, CAST(N'2022-06-14' AS Date), 1, N'1002', N'', 20)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Accounts] ADD  DEFAULT ((1)) FOR [Admins]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD FOREIGN KEY([ColorId])
REFERENCES [dbo].[Colors] ([Id])
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
USE [master]
GO
ALTER DATABASE [DTNsShop] SET  READ_WRITE 
GO
