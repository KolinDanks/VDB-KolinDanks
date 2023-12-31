USE [master]
GO
/****** Object:  Database [Personal Project]    Script Date: 9/24/2023 10:23:48 PM ******/
CREATE DATABASE [Personal Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Personal Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Personal Project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Personal Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Personal Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Personal Project] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Personal Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Personal Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Personal Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Personal Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Personal Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Personal Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [Personal Project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Personal Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Personal Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Personal Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Personal Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Personal Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Personal Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Personal Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Personal Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Personal Project] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Personal Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Personal Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Personal Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Personal Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Personal Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Personal Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Personal Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Personal Project] SET RECOVERY FULL 
GO
ALTER DATABASE [Personal Project] SET  MULTI_USER 
GO
ALTER DATABASE [Personal Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Personal Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Personal Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Personal Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Personal Project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Personal Project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Personal Project', N'ON'
GO
ALTER DATABASE [Personal Project] SET QUERY_STORE = OFF
GO
USE [Personal Project]
GO
/****** Object:  Table [dbo].[Builds]    Script Date: 9/24/2023 10:23:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Builds](
	[Build_ID] [int] IDENTITY(1,1) NOT NULL,
	[Build_Type] [nchar](3) NOT NULL,
	[Build_Notes] [nchar](100) NULL,
	[PC_Case] [nchar](30) NULL,
	[Fan_Type] [nchar](30) NULL,
	[Fan_Num] [int] NULL,
	[MOBO] [nchar](30) NULL,
	[CPU] [nchar](30) NULL,
	[GPU] [nchar](30) NULL,
	[RAM] [nchar](30) NULL,
	[PSU] [nchar](30) NULL,
	[Storage1] [nchar](30) NULL,
	[Storage2] [nchar](30) NULL,
 CONSTRAINT [PK_Builds] PRIMARY KEY CLUSTERED 
(
	[Build_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 9/24/2023 10:23:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Customer_ID] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [nchar](20) NOT NULL,
	[Middle_Initial] [nchar](1) NULL,
	[Last_Name] [nchar](20) NOT NULL,
	[Phone_Number] [nchar](10) NOT NULL,
	[Shipping_ID] [int] NULL,
	[Email] [nchar](40) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 9/24/2023 10:23:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Order_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[Build_ID] [int] NOT NULL,
	[Cost] [money] NOT NULL,
	[Expected_Complete_Date] [date] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping Address]    Script Date: 9/24/2023 10:23:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping Address](
	[Shipping_ID] [int] IDENTITY(1,1) NOT NULL,
	[Street1] [nchar](20) NOT NULL,
	[Street2] [nchar](10) NULL,
	[City] [nchar](20) NOT NULL,
	[State] [nchar](2) NOT NULL,
	[Zipcode] [nchar](5) NOT NULL,
	[Delivery_Info] [nchar](100) NULL,
 CONSTRAINT [PK_Shipping Address'] PRIMARY KEY CLUSTERED 
(
	[Shipping_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Builds] ON 

INSERT [dbo].[Builds] ([Build_ID], [Build_Type], [Build_Notes], [PC_Case], [Fan_Type], [Fan_Num], [MOBO], [CPU], [GPU], [RAM], [PSU], [Storage1], [Storage2]) VALUES (1, N'UPG', NULL, NULL, NULL, NULL, NULL, N'Gridfinion7x                  ', N'GrumbleX48                    ', N'2x128TB Sheildpot RAM         ', NULL, NULL, NULL)
INSERT [dbo].[Builds] ([Build_ID], [Build_Type], [Build_Notes], [PC_Case], [Fan_Type], [Fan_Num], [MOBO], [CPU], [GPU], [RAM], [PSU], [Storage1], [Storage2]) VALUES (2, N'REP', N'GrumbleX48 was full of droff                                                                        ', NULL, NULL, NULL, NULL, NULL, N'GrumbleX48                    ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Builds] ([Build_ID], [Build_Type], [Build_Notes], [PC_Case], [Fan_Type], [Fan_Num], [MOBO], [CPU], [GPU], [RAM], [PSU], [Storage1], [Storage2]) VALUES (3, N'SCR', N'Ram goes in slots 1 and 3                                                                           ', N'The Box V3                    ', N'CourseAirDraft2               ', 5, N'The Slab                      ', N'Agrus 50+                     ', N'AMB 6600 XD                   ', N'2x1Pb Grunk Glep Edition      ', N'DuraSellNuclear               ', N'1GB HD of Sloogate            ', N'2GB nvme.5 Sloogate           ')
INSERT [dbo].[Builds] ([Build_ID], [Build_Type], [Build_Notes], [PC_Case], [Fan_Type], [Fan_Num], [MOBO], [CPU], [GPU], [RAM], [PSU], [Storage1], [Storage2]) VALUES (4, N'REP', N'Argus 49 Divided by 0                                                                               ', NULL, NULL, NULL, NULL, N'Argus49xp                     ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Builds] ([Build_ID], [Build_Type], [Build_Notes], [PC_Case], [Fan_Type], [Fan_Num], [MOBO], [CPU], [GPU], [RAM], [PSU], [Storage1], [Storage2]) VALUES (5, N'UPG', NULL, NULL, N'Slurgon Wind thingy           ', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Builds] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Customer_ID], [First_Name], [Middle_Initial], [Last_Name], [Phone_Number], [Shipping_ID], [Email]) VALUES (1, N'Glimp               ', N's', N'Scroogles           ', N'4344343446', 1, NULL)
INSERT [dbo].[Customers] ([Customer_ID], [First_Name], [Middle_Initial], [Last_Name], [Phone_Number], [Shipping_ID], [Email]) VALUES (2, N'Torg                ', NULL, N'Chup                ', N'4244244354', 2, N'Cheem@B.corg                            ')
INSERT [dbo].[Customers] ([Customer_ID], [First_Name], [Middle_Initial], [Last_Name], [Phone_Number], [Shipping_ID], [Email]) VALUES (3, N'Glop                ', N'h', N'Squimbleton         ', N'2425252345', 3, N'cloop@b.Corg                            ')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Build_ID], [Cost], [Expected_Complete_Date]) VALUES (1, 1, 1, 40.0000, CAST(N'2012-12-12' AS Date))
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Build_ID], [Cost], [Expected_Complete_Date]) VALUES (2, 1, 2, 25.0000, CAST(N'2012-12-14' AS Date))
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Build_ID], [Cost], [Expected_Complete_Date]) VALUES (3, 2, 3, 100.0000, CAST(N'2012-12-15' AS Date))
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Build_ID], [Cost], [Expected_Complete_Date]) VALUES (4, 3, 4, 15.0000, CAST(N'2012-12-18' AS Date))
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Build_ID], [Cost], [Expected_Complete_Date]) VALUES (6, 3, 5, 8000.0000, CAST(N'2012-12-30' AS Date))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipping Address] ON 

INSERT [dbo].[Shipping Address] ([Shipping_ID], [Street1], [Street2], [City], [State], [Zipcode], [Delivery_Info]) VALUES (1, N'42435 Guh ST        ', N'APT 4534  ', N'Cydonia             ', N'MR', N'45345', NULL)
INSERT [dbo].[Shipping Address] ([Shipping_ID], [Street1], [Street2], [City], [State], [Zipcode], [Delivery_Info]) VALUES (3, N'24222 Gloo BLVD     ', N'          ', N'Olympus Mons        ', N'MR', N'45342', N'Leave it under the Space Rock                                                                       ')
INSERT [dbo].[Shipping Address] ([Shipping_ID], [Street1], [Street2], [City], [State], [Zipcode], [Delivery_Info]) VALUES (4, N'42435 Guh ST        ', N'APT 4532  ', N'Cydonia             ', N'MR', N'45345', NULL)
SET IDENTITY_INSERT [dbo].[Shipping Address] OFF
GO
USE [master]
GO
ALTER DATABASE [Personal Project] SET  READ_WRITE 
GO
