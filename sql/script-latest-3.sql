USE [master]
GO
/****** Object:  Database [PRJ301_SE1630]    Script Date: 7/20/2022 11:14:25 AM ******/
CREATE DATABASE [PRJ301_SE1630]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoppingOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShoppingOnline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShoppingOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ShoppingOnline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRJ301_SE1630] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRJ301_SE1630].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRJ301_SE1630] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PRJ301_SE1630] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRJ301_SE1630] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRJ301_SE1630] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRJ301_SE1630] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRJ301_SE1630] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRJ301_SE1630] SET  MULTI_USER 
GO
ALTER DATABASE [PRJ301_SE1630] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRJ301_SE1630] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRJ301_SE1630] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRJ301_SE1630] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRJ301_SE1630] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRJ301_SE1630] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PRJ301_SE1630] SET QUERY_STORE = OFF
GO
USE [PRJ301_SE1630]
GO
/****** Object:  Table [dbo].[Account_HE153482]    Script Date: 7/20/2022 11:14:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_HE153482](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[displayName] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[phone] [nvarchar](50) NULL,
	[role] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category_HE153482]    Script Date: 7/20/2022 11:14:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category_HE153482](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image_HE153482]    Script Date: 7/20/2022 11:14:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image_HE153482](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_HE153482]    Script Date: 7/20/2022 11:14:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_HE153482](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NOT NULL,
	[totalPrice] [float] NULL,
	[note] [nvarchar](max) NULL,
	[created_date] [date] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails_HE153482]    Script Date: 7/20/2022 11:14:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails_HE153482](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[priceId] [int] NOT NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Price_HE153482]    Script Date: 7/20/2022 11:14:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Price_HE153482](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[price] [float] NOT NULL,
	[date] [date] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_HE153482]    Script Date: 7/20/2022 11:14:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_HE153482](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[quantity] [int] NOT NULL,
	[priceId] [int] NULL,
	[description] [nvarchar](50) NULL,
	[imageUrl] [int] NOT NULL,
	[created_date] [date] NULL,
	[category_id] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_HE153482]    Script Date: 7/20/2022 11:14:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_HE153482](
	[id] [int] NOT NULL,
	[roleName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account_HE153482] ON 

INSERT [dbo].[Account_HE153482] ([id], [username], [password], [displayName], [address], [email], [phone], [role]) VALUES (11, N'admin', N'123456', N'Admin', N'Quang Ninh', N'vinhpham2761@gmail.com', N'0975720884', 1)
INSERT [dbo].[Account_HE153482] ([id], [username], [password], [displayName], [address], [email], [phone], [role]) VALUES (12, N'kakavinh1', N'123456', N'For User', N'Quang Ninh', N'kakavinh1@gmail.com', N'0975720884', 2)
SET IDENTITY_INSERT [dbo].[Account_HE153482] OFF
GO
INSERT [dbo].[Category_HE153482] ([id], [name]) VALUES (1, N'Văn học')
INSERT [dbo].[Category_HE153482] ([id], [name]) VALUES (2, N'Tâm lý kỹ năng sống')
INSERT [dbo].[Category_HE153482] ([id], [name]) VALUES (3, N'Truyện cho bé')
INSERT [dbo].[Category_HE153482] ([id], [name]) VALUES (4, N'Khoa học')
INSERT [dbo].[Category_HE153482] ([id], [name]) VALUES (5, N'Ngôn Tình')
INSERT [dbo].[Category_HE153482] ([id], [name]) VALUES (6, N'Xã Hội')
INSERT [dbo].[Category_HE153482] ([id], [name]) VALUES (7, N'Sách tham khảo')
INSERT [dbo].[Category_HE153482] ([id], [name]) VALUES (8, N'Kinh tế')
INSERT [dbo].[Category_HE153482] ([id], [name]) VALUES (9, N'Sách nước ngoài')
INSERT [dbo].[Category_HE153482] ([id], [name]) VALUES (10, N'Sách toán học')
GO
SET IDENTITY_INSERT [dbo].[Image_HE153482] ON 

INSERT [dbo].[Image_HE153482] ([id], [url]) VALUES (1, N'image-product/khu-rung-kim-cuong.jpg')
INSERT [dbo].[Image_HE153482] ([id], [url]) VALUES (2, N'image-product/100-ki-nang-sinh-ton.jpg')
INSERT [dbo].[Image_HE153482] ([id], [url]) VALUES (3, N'image-product/6a611c6544aa88f4d1bb.jpg')
INSERT [dbo].[Image_HE153482] ([id], [url]) VALUES (4, N'image-product/365-chuyen-ke-truoc-gio-di-ngu.jpg')
INSERT [dbo].[Image_HE153482] ([id], [url]) VALUES (5, N'image-product/8934974153023_1.jpg')
INSERT [dbo].[Image_HE153482] ([id], [url]) VALUES (6, N'image-product/8936066690867.jpg')
SET IDENTITY_INSERT [dbo].[Image_HE153482] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_HE153482] ON 

INSERT [dbo].[Order_HE153482] ([id], [account_id], [totalPrice], [note], [created_date]) VALUES (3, 12, 80, N'abc xyz', CAST(N'2022-07-18' AS Date))
INSERT [dbo].[Order_HE153482] ([id], [account_id], [totalPrice], [note], [created_date]) VALUES (4, 12, 120, N'test lan 2', CAST(N'2022-07-18' AS Date))
INSERT [dbo].[Order_HE153482] ([id], [account_id], [totalPrice], [note], [created_date]) VALUES (5, 12, 120, N'test lan 3', CAST(N'2022-07-18' AS Date))
SET IDENTITY_INSERT [dbo].[Order_HE153482] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails_HE153482] ON 

INSERT [dbo].[OrderDetails_HE153482] ([id], [order_id], [productId], [priceId], [quantity]) VALUES (3, 3, 4, 45, 2)
INSERT [dbo].[OrderDetails_HE153482] ([id], [order_id], [productId], [priceId], [quantity]) VALUES (4, 4, 4, 45, 3)
INSERT [dbo].[OrderDetails_HE153482] ([id], [order_id], [productId], [priceId], [quantity]) VALUES (5, 5, 4, 45, 3)
INSERT [dbo].[OrderDetails_HE153482] ([id], [order_id], [productId], [priceId], [quantity]) VALUES (6, 5, 2, 1, 1)
SET IDENTITY_INSERT [dbo].[OrderDetails_HE153482] OFF
GO
SET IDENTITY_INSERT [dbo].[Price_HE153482] ON 

INSERT [dbo].[Price_HE153482] ([id], [price], [date]) VALUES (1, 0, CAST(N'2022-07-17' AS Date))
INSERT [dbo].[Price_HE153482] ([id], [price], [date]) VALUES (45, 40, CAST(N'2022-07-17' AS Date))
INSERT [dbo].[Price_HE153482] ([id], [price], [date]) VALUES (46, 40, CAST(N'2022-07-18' AS Date))
SET IDENTITY_INSERT [dbo].[Price_HE153482] OFF
GO
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (2, N'Triết lý làm giàu', 17, 46, N'Pressure ulcer of right heel, stage 4', 3, CAST(N'2021-09-28' AS Date), 1)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (4, N'365 Truyện kể trước khi ngủ', 12, 45, N'Major laceration of kidney', 4, CAST(N'2022-04-20' AS Date), 4)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (6, N'100 kỹ năng sinh tồn', 30, 1, N'Pain in limb, unspecified', 2, CAST(N'2021-02-17' AS Date), 2)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (9, N'Shinzo Abe & Gia tộc tuyệt đỉnh', 13, 1, N'Osteomyelitis, unspecified', 5, CAST(N'2021-06-21' AS Date), 3)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (10, N'Cứ đi đi', 11, 1, N'Oligospermia due to other extratesticular causes', 6, CAST(N'2021-02-20' AS Date), 5)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (22, N'Khu rừng kim cương', 14, 1, N'Other symptomatic neurosyphilis', 1, CAST(N'2021-06-28' AS Date), 8)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (24, N'Bringing Up Bobby', 11, 45, N'Other disorders of autonomic nervous system', 1, CAST(N'2021-12-03' AS Date), 1)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (30, N'End of the Game (Der Richter und sein Henker)', 9, 1, N'Cutis rhomboidalis nuchae', 1, CAST(N'2021-05-22' AS Date), 5)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (32, N'All I Want for Christmas', 12, 1, N'Sepsis due to Serratia', 1, CAST(N'2021-10-04' AS Date), 7)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (38, N'Stepfather, The', 7, 1, N'X-linked adrenoleukodystrophy', 1, CAST(N'2021-06-28' AS Date), 3)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (41, N'Our Fathers', 7, 45, N'Acute dacryocystitis', 1, CAST(N'2021-01-25' AS Date), 9)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (43, N'Murder at the Gallop', 17, 1, N'Abrasion of hip', 1, CAST(N'2021-06-10' AS Date), 1)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (48, N'Geronimo', 5, 1, N'Congenital stenosis and stricture of esophagus', 1, CAST(N'2022-03-07' AS Date), 2)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (49, N'Strange Cargo', 11, 45, N'Embolism and thrombosis of unspecified artery', 1, CAST(N'2022-01-31' AS Date), 9)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (50, N'Visit to a Small Planet', 14, 1, N'Laceration of unspecified tibial artery, right leg', 1, CAST(N'2021-04-04' AS Date), 3)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (52, N'Girl on the Train, The (La fille du RER)', 11, 1, N'Ventricular flutter', 1, CAST(N'2022-01-12' AS Date), 4)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (53, N'Primary Colors', 12, 1, N'Presence of heart assist device', 1, CAST(N'2021-06-03' AS Date), 3)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (56, N'Skeleton Key, The', 10, 1, N'Tonic pupil, bilateral', 1, CAST(N'2021-05-15' AS Date), 4)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (59, N'Theatre of Blood', 20, 1, N'Flail joint, right wrist', 1, CAST(N'2021-06-20' AS Date), 3)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (60, N'Freeloaders', 18, 1, N'Labyrinthitis, bilateral', 1, CAST(N'2021-02-04' AS Date), 3)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (61, N'Highway to Hell', 5, 1, N'Sequelae of Guillain-Barre syndrome', 1, CAST(N'2021-12-14' AS Date), 2)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (65, N'Magic Gloves, The (Los guantes mágicos)', 15, 1, N'Adverse effect of diagnostic agents', 1, CAST(N'2021-08-18' AS Date), 1)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (66, N'Dance Party, USA', 12, 1, N'Enteropathic arthropathies, right hip', 1, CAST(N'2021-07-23' AS Date), 2)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (70, N'Hide-Out', 18, 1, N'Other specified disorders of tympanic membrane', 1, CAST(N'2022-03-10' AS Date), 2)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (72, N'Beach Party', 17, 1, N'Other subluxation of unspecified foot, sequela', 1, CAST(N'2021-10-31' AS Date), 8)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (73, N'King Lines', 9, 1, N'Choroidal degeneration, unspecified, right eye', 1, CAST(N'2021-05-30' AS Date), 8)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (79, N'Santa Claus', 12, 1, N'Malignant neoplasm of abdomen', 1, CAST(N'2021-07-04' AS Date), 6)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (82, N'Only Angels Have Wings', 11, 1, N'Abscess of lung and mediastinum', 1, CAST(N'2021-07-22' AS Date), 6)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (85, N'Eastern Plays', 6, 1, N'Postauricular fistula, unspecified ear', 1, CAST(N'2022-04-15' AS Date), 5)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (86, N'Once Bitten', 9, 1, N'Poisoning by immunoglobulin, undetermined', 1, CAST(N'2021-01-28' AS Date), 5)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (87, N'Bad Sleep Well, The (Warui yatsu hodo yoku nemuru)', 11, 1, N'Pathological fracture, right hand', 1, CAST(N'2021-03-21' AS Date), 10)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (88, N'55 Days at Peking', 14, 1, N'Activity, water aerobics and water exercise', 1, CAST(N'2022-01-27' AS Date), 7)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (89, N'Rent', 6, 1, N'Unspecified sprain of right little finger, sequela', 1, CAST(N'2022-04-29' AS Date), 4)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (91, N'Hobbit: An Unexpected Journey, The', 15, 1, N'Hypertrophy of bone, unspecified ulna and radius', 1, CAST(N'2021-12-21' AS Date), 6)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (93, N'Apple, The', 18, 1, N'Spondylosis', 1, CAST(N'2021-04-11' AS Date), 1)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (95, N'Crush', 7, 1, N'Osteolysis, multiple sites', 1, CAST(N'2021-04-10' AS Date), 1)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (99, N'Mad Detective (Sun taam)', 7, 1, N'Congenital deformity of hip, unspecified', 1, CAST(N'2021-12-23' AS Date), 4)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (100, N'Mercerdes Benz', 3, 1, N'Good car', 1, CAST(N'2021-12-03' AS Date), 6)
INSERT [dbo].[Product_HE153482] ([id], [name], [quantity], [priceId], [description], [imageUrl], [created_date], [category_id]) VALUES (101, N'Mercerdes Benz', 3, 1, N'Good car', 1, CAST(N'2021-12-03' AS Date), 1)
GO
INSERT [dbo].[Role_HE153482] ([id], [roleName]) VALUES (1, N'admin')
INSERT [dbo].[Role_HE153482] ([id], [roleName]) VALUES (2, N'customer')
GO
ALTER TABLE [dbo].[Order_HE153482] ADD  CONSTRAINT [DF_Order_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[Price_HE153482] ADD  CONSTRAINT [DF_Table_1_date]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[Account_HE153482]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([role])
REFERENCES [dbo].[Role_HE153482] ([id])
GO
ALTER TABLE [dbo].[Account_HE153482] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Order_HE153482]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account_HE153482] ([id])
GO
ALTER TABLE [dbo].[Order_HE153482] CHECK CONSTRAINT [FK_Order_Account]
GO
ALTER TABLE [dbo].[OrderDetails_HE153482]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order_HE153482] ([id])
GO
ALTER TABLE [dbo].[OrderDetails_HE153482] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails_HE153482]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Price] FOREIGN KEY([priceId])
REFERENCES [dbo].[Price_HE153482] ([id])
GO
ALTER TABLE [dbo].[OrderDetails_HE153482] CHECK CONSTRAINT [FK_OrderDetails_Price]
GO
ALTER TABLE [dbo].[OrderDetails_HE153482]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product_HE153482] ([id])
GO
ALTER TABLE [dbo].[OrderDetails_HE153482] CHECK CONSTRAINT [FK_OrderDetails_Product]
GO
ALTER TABLE [dbo].[Product_HE153482]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category_HE153482] ([id])
GO
ALTER TABLE [dbo].[Product_HE153482] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product_HE153482]  WITH CHECK ADD  CONSTRAINT [FK_Product_Image] FOREIGN KEY([imageUrl])
REFERENCES [dbo].[Image_HE153482] ([id])
GO
ALTER TABLE [dbo].[Product_HE153482] CHECK CONSTRAINT [FK_Product_Image]
GO
ALTER TABLE [dbo].[Product_HE153482]  WITH CHECK ADD  CONSTRAINT [FK_Product_Price] FOREIGN KEY([priceId])
REFERENCES [dbo].[Price_HE153482] ([id])
GO
ALTER TABLE [dbo].[Product_HE153482] CHECK CONSTRAINT [FK_Product_Price]
GO
USE [master]
GO
ALTER DATABASE [PRJ301_SE1630] SET  READ_WRITE 
GO
