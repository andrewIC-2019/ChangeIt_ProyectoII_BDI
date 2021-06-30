USE [master]
GO
/****** Object:  Database [ChangeIt_Cubes]    Script Date: 30/6/2021 08:32:13 ******/
CREATE DATABASE [ChangeIt_Cubes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChangeIt_Cubes', FILENAME = N'C:\development\basedata\ChangeIt_Cubes\ChangeIt_Cubes.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ChangeIt_Cubes_log', FILENAME = N'C:\development\basedata\ChangeIt_Cubes\ChangeIt_Cubes_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ChangeIt_Cubes] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChangeIt_Cubes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChangeIt_Cubes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChangeIt_Cubes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChangeIt_Cubes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChangeIt_Cubes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChangeIt_Cubes] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChangeIt_Cubes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChangeIt_Cubes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChangeIt_Cubes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChangeIt_Cubes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChangeIt_Cubes] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [ChangeIt_Cubes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChangeIt_Cubes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChangeIt_Cubes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChangeIt_Cubes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChangeIt_Cubes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ChangeIt_Cubes] SET AUTO_UPDATE_STATISTICS_ASYNC ON 
GO
ALTER DATABASE [ChangeIt_Cubes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChangeIt_Cubes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChangeIt_Cubes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChangeIt_Cubes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChangeIt_Cubes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChangeIt_Cubes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChangeIt_Cubes] SET RECOVERY FULL 
GO
ALTER DATABASE [ChangeIt_Cubes] SET  MULTI_USER 
GO
ALTER DATABASE [ChangeIt_Cubes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChangeIt_Cubes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChangeIt_Cubes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChangeIt_Cubes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ChangeIt_Cubes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ChangeIt_Cubes] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ChangeIt_Cubes', N'ON'
GO
ALTER DATABASE [ChangeIt_Cubes] SET QUERY_STORE = OFF
GO
USE [ChangeIt_Cubes]
GO
/****** Object:  Table [dbo].[data_dates]    Script Date: 30/6/2021 08:32:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_dates](
	[dateId] [bigint] IDENTITY(1,1) NOT NULL,
	[cMonth] [smallint] NOT NULL,
	[cMonthname] [varchar](20) NULL,
	[cYear] [smallint] NOT NULL,
 CONSTRAINT [PK_data_dates] PRIMARY KEY CLUSTERED 
(
	[dateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_facts]    Script Date: 30/6/2021 08:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_facts](
	[restaurantId] [nvarchar](200) NULL,
	[monto] [money] NULL,
	[dateId] [bigint] NULL,
	[locationId] [bigint] NULL,
	[views] [int] NULL,
	[shares] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_locations]    Script Date: 30/6/2021 08:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_locations](
	[locationId] [bigint] IDENTITY(1,1) NOT NULL,
	[country] [nvarchar](60) NULL,
	[city] [nvarchar](60) NULL,
	[zone] [nvarchar](60) NULL,
 CONSTRAINT [PK_data_locations] PRIMARY KEY CLUSTERED 
(
	[locationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[excelData]    Script Date: 30/6/2021 08:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[excelData](
	[id] [nvarchar](200) NULL,
	[dateAdded] [datetime] NULL,
	[dateUpdated] [datetime] NULL,
	[address] [nvarchar](200) NULL,
	[categories] [nvarchar](200) NULL,
	[city] [nvarchar](200) NULL,
	[country] [nvarchar](200) NULL,
	[keys] [nvarchar](200) NULL,
	[latitude] [nvarchar](200) NULL,
	[longitude] [nvarchar](200) NULL,
	[name] [nvarchar](200) NULL,
	[postalCode] [nvarchar](200) NULL,
	[province] [nvarchar](200) NULL,
	[sourceURLs] [nvarchar](3000) NULL,
	[websites] [nvarchar](2000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mongoData]    Script Date: 30/6/2021 08:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mongoData](
	[restaurantId] [nvarchar](200) NOT NULL,
	[campaignId] [nvarchar](200) NOT NULL,
	[amount] [money] NOT NULL,
	[date] [datetime] NOT NULL,
	[views] [int] NOT NULL,
	[shares] [int] NOT NULL,
	[country] [nvarchar](60) NOT NULL,
	[province] [nvarchar](60) NOT NULL,
	[city] [nvarchar](60) NOT NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [ChangeIt_Cubes] SET  READ_WRITE 
GO
