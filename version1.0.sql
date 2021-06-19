USE [master]
GO
/****** Object:  Database [ChangeIt]    Script Date: 18/6/2021 23:32:10 ******/
CREATE DATABASE [ChangeIt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChangeIt', FILENAME = N'C:\development\basedata\ChangeIt\ChangeIt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ChangeIt_log', FILENAME = N'C:\development\basedata\ChangeIt\ChangeIt_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ChangeIt] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChangeIt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChangeIt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChangeIt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChangeIt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChangeIt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChangeIt] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChangeIt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChangeIt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChangeIt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChangeIt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChangeIt] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [ChangeIt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChangeIt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChangeIt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChangeIt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChangeIt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ChangeIt] SET AUTO_UPDATE_STATISTICS_ASYNC ON 
GO
ALTER DATABASE [ChangeIt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChangeIt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChangeIt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChangeIt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChangeIt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChangeIt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChangeIt] SET RECOVERY FULL 
GO
ALTER DATABASE [ChangeIt] SET  MULTI_USER 
GO
ALTER DATABASE [ChangeIt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChangeIt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChangeIt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChangeIt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ChangeIt] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ChangeIt] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ChangeIt', N'ON'
GO
ALTER DATABASE [ChangeIt] SET QUERY_STORE = OFF
GO
USE [ChangeIt]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[addressId] [bigint] IDENTITY(1,1) NOT NULL,
	[countryId] [smallint] NOT NULL,
	[cityId] [bigint] NOT NULL,
	[zoneId] [bigint] NULL,
	[otherIndications] [nvarchar](200) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[addressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ads]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ads](
	[adId] [bigint] IDENTITY(1,1) NOT NULL,
	[adRefId] [varbinary](50) NULL,
	[campaignId] [bigint] NOT NULL,
	[adObjetiveId] [bigint] NULL,
	[adQualityId] [tinyint] NULL,
	[releaseDate] [datetime] NOT NULL,
	[autoTagging] [bit] NOT NULL,
	[hiredDays] [int] NOT NULL,
	[expectedClicksRated] [decimal](10, 2) NULL,
	[adUrl] [nvarchar](128) NULL,
	[actionUrl] [nvarchar](128) NULL,
 CONSTRAINT [PK_Ads] PRIMARY KEY CLUSTERED 
(
	[adId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ads_Objetives]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ads_Objetives](
	[adObjetiveId] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](60) NOT NULL,
	[description] [nvarchar](120) NULL,
 CONSTRAINT [PK_Ads_Objetives] PRIMARY KEY CLUSTERED 
(
	[adObjetiveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ads_Qualities]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ads_Qualities](
	[adQualityId] [tinyint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Ads_Qualities] PRIMARY KEY CLUSTERED 
(
	[adQualityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Availables_Habit_Ubications]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Availables_Habit_Ubications](
	[geographicUbicationId] [bigint] NOT NULL,
	[habitId] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campaigns]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campaigns](
	[campaignId] [bigint] NOT NULL,
	[name] [nvarchar](120) NOT NULL,
	[investedAmount] [money] NULL,
	[earnedAmount] [money] NULL,
	[conversionValue] [decimal](8, 2) NOT NULL,
	[lastUpdate] [datetime] NULL,
	[computername] [nvarchar](60) NULL,
	[ipAddress] [varbinary](32) NULL,
	[checksum] [varbinary](300) NULL,
 CONSTRAINT [PK_Campaigns] PRIMARY KEY CLUSTERED 
(
	[campaignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[cityId] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](80) NOT NULL,
	[countryId] [smallint] NOT NULL,
	[approxPopulation] [bigint] NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[cityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Commerces]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commerces](
	[commerceId] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[mail] [nvarchar](128) NULL,
	[phone] [varchar](20) NULL,
	[addressId] [bigint] NOT NULL,
	[postalCode] [varchar](20) NULL,
	[website] [nvarchar](128) NOT NULL,
	[logoUrl] [nvarchar](128) NULL,
 CONSTRAINT [PK_Commerces] PRIMARY KEY CLUSTERED 
(
	[commerceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[countryId] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](80) NOT NULL,
	[approxPopulation] [bigint] NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[countryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entity_Types]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entity_Types](
	[entityTypeId] [tinyint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Entity_Types] PRIMARY KEY CLUSTERED 
(
	[entityTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genders]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genders](
	[genderId] [tinyint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Genders] PRIMARY KEY CLUSTERED 
(
	[genderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Geographic_Ubications]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Geographic_Ubications](
	[geographicUbicationId] [bigint] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](120) NOT NULL,
	[geoPosition] [geography] NOT NULL,
	[coverageRadiusMeters] [int] NOT NULL,
	[countryId] [smallint] NOT NULL,
	[cityId] [bigint] NULL,
	[zoneId] [bigint] NULL,
	[referenceName] [nvarchar](200) NULL,
 CONSTRAINT [PK_Geographic_Ubications] PRIMARY KEY CLUSTERED 
(
	[geographicUbicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habits]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habits](
	[habitId] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[description] [varchar](300) NOT NULL,
	[iconUrl] [nvarchar](128) NOT NULL,
	[habitActionTypeId] [smallint] NULL,
	[releasedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Habits] PRIMARY KEY CLUSTERED 
(
	[habitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habits_Actions_Types]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habits_Actions_Types](
	[habitActionTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Habits_Actions_Types] PRIMARY KEY CLUSTERED 
(
	[habitActionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habits_History]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habits_History](
	[habitHistoryId] [bigint] NOT NULL,
	[habitId] [bigint] NOT NULL,
	[userId] [bigint] NOT NULL,
	[posttime] [datetime] NOT NULL,
	[imageId] [bigint] NULL,
	[checkIn] [bit] NOT NULL,
	[geoPosition] [geography] NOT NULL,
	[computername] [nvarchar](60) NOT NULL,
	[ipAddress] [varbinary](32) NOT NULL,
	[checksum] [varbinary](300) NOT NULL,
 CONSTRAINT [PK_Habits_History] PRIMARY KEY CLUSTERED 
(
	[habitHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image_Per_User]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image_Per_User](
	[imageId] [bigint] NULL,
	[userId] [bigint] NULL,
	[isDefault] [bit] NULL,
	[posttime] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[imageId] [bigint] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](128) NOT NULL,
	[deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[imageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reaction_Types]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reaction_Types](
	[reactionTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Reaction_Types] PRIMARY KEY CLUSTERED 
(
	[reactionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reactions]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reactions](
	[reactionTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[entityTypeId] [tinyint] NOT NULL,
	[entityId] [bigint] NOT NULL,
	[startDate] [datetime] NOT NULL,
	[endDate] [datetime] NOT NULL,
	[quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rules]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rules](
	[ruleId] [bigint] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](200) NOT NULL,
	[unit] [varchar](20) NULL,
 CONSTRAINT [PK_Rules] PRIMARY KEY CLUSTERED 
(
	[ruleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rules_Per_Habit]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rules_Per_Habit](
	[habitId] [bigint] NOT NULL,
	[ruleId] [bigint] NOT NULL,
	[quantity] [decimal](12, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SM_LoginInfo]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SM_LoginInfo](
	[sm_loginInfoId] [bigint] IDENTITY(1,1) NOT NULL,
	[token] [varbinary](60) NOT NULL,
	[posttime] [datetime] NOT NULL,
	[socialMediaId] [smallint] NOT NULL,
	[userId] [bigint] NOT NULL,
 CONSTRAINT [PK_SM_LoginInfo] PRIMARY KEY CLUSTERED 
(
	[sm_loginInfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Social_Medias]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Social_Medias](
	[socialMediaId] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[url] [nvarchar](128) NOT NULL,
	[support] [nvarchar](128) NULL,
	[iconUrl] [nvarchar](128) NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_socialMedias] PRIMARY KEY CLUSTERED 
(
	[socialMediaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sponsor_types]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sponsor_types](
	[sponsorTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](120) NOT NULL,
 CONSTRAINT [PK_Sponsor_types_1] PRIMARY KEY CLUSTERED 
(
	[sponsorTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sponsorships]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sponsorships](
	[sponsorshipId] [bigint] IDENTITY(1,1) NOT NULL,
	[sponsorTypeId] [smallint] NOT NULL,
	[sponsorId] [bigint] NOT NULL,
	[amount] [money] NOT NULL,
	[habitId] [bigint] NOT NULL,
	[posttime] [datetime] NOT NULL,
	[computername] [nvarchar](60) NOT NULL,
	[ipAddress] [varbinary](32) NOT NULL,
	[checksum] [varbinary](300) NOT NULL,
	[updatePosttime] [datetime] NULL,
	[oldValue] [money] NULL,
 CONSTRAINT [PK_Sponsors] PRIMARY KEY CLUSTERED 
(
	[sponsorshipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Summary_Posts]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Summary_Posts](
	[summaryPostId] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NOT NULL,
	[title] [nvarchar](200) NOT NULL,
	[posttime] [datetime] NOT NULL,
	[postUrl] [nvarchar](128) NOT NULL,
	[actionUrl] [nvarchar](128) NOT NULL,
	[startDate] [datetime] NULL,
	[endDate] [datetime] NULL,
 CONSTRAINT [PK_Summary_Posts] PRIMARY KEY CLUSTERED 
(
	[summaryPostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag_Value]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag_Value](
	[utmTagId] [bigint] NOT NULL,
	[entityTypeId] [tinyint] NULL,
	[entityId] [bigint] NULL,
	[value] [varbinary](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userId] [bigint] IDENTITY(1,1) NOT NULL,
	[nationalId] [varchar](50) NOT NULL,
	[name] [nvarchar](60) NOT NULL,
	[lastname] [nvarchar](60) NOT NULL,
	[secondLastname] [nvarchar](60) NULL,
	[birthday] [date] NOT NULL,
	[genderId] [tinyint] NOT NULL,
	[mail] [nvarchar](128) NOT NULL,
	[addressId] [bigint] NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UTM_Tags]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UTM_Tags](
	[utmTagId] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UTM_Tags] PRIMARY KEY CLUSTERED 
(
	[utmTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zones]    Script Date: 18/6/2021 23:32:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zones](
	[zoneId] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](80) NOT NULL,
	[cityId] [bigint] NOT NULL,
	[approxPopulation] [bigint] NULL,
 CONSTRAINT [PK_Zones] PRIMARY KEY CLUSTERED 
(
	[zoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Habits] ADD  CONSTRAINT [DF_Habits_releasedDate]  DEFAULT (getdate()) FOR [releasedDate]
GO
ALTER TABLE [dbo].[Habits_History] ADD  CONSTRAINT [DF_Habits_History_checkIn]  DEFAULT ((1)) FOR [checkIn]
GO
ALTER TABLE [dbo].[Images] ADD  CONSTRAINT [DF_Images_deleted]  DEFAULT ((0)) FOR [deleted]
GO
ALTER TABLE [dbo].[Social_Medias] ADD  CONSTRAINT [DF_Social_Medias_enabled]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_enabled]  DEFAULT ((1)) FOR [enabled]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Cities_cityId] FOREIGN KEY([cityId])
REFERENCES [dbo].[Cities] ([cityId])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Cities_cityId]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Countries_countryId] FOREIGN KEY([countryId])
REFERENCES [dbo].[Countries] ([countryId])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Countries_countryId]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Zones_zoneId] FOREIGN KEY([zoneId])
REFERENCES [dbo].[Zones] ([zoneId])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Zones_zoneId]
GO
ALTER TABLE [dbo].[Ads]  WITH CHECK ADD  CONSTRAINT [FK_Ads_AdsObjetives] FOREIGN KEY([adObjetiveId])
REFERENCES [dbo].[Ads_Objetives] ([adObjetiveId])
GO
ALTER TABLE [dbo].[Ads] CHECK CONSTRAINT [FK_Ads_AdsObjetives]
GO
ALTER TABLE [dbo].[Ads]  WITH CHECK ADD  CONSTRAINT [FK_Ads_AdsQualities_qualityId] FOREIGN KEY([adQualityId])
REFERENCES [dbo].[Ads_Qualities] ([adQualityId])
GO
ALTER TABLE [dbo].[Ads] CHECK CONSTRAINT [FK_Ads_AdsQualities_qualityId]
GO
ALTER TABLE [dbo].[Ads]  WITH CHECK ADD  CONSTRAINT [FK_Ads_Campaigns_campaignId] FOREIGN KEY([campaignId])
REFERENCES [dbo].[Campaigns] ([campaignId])
GO
ALTER TABLE [dbo].[Ads] CHECK CONSTRAINT [FK_Ads_Campaigns_campaignId]
GO
ALTER TABLE [dbo].[Availables_Habit_Ubications]  WITH CHECK ADD  CONSTRAINT [FK_AvailablesHabitUbications_GeographicUbications_Id] FOREIGN KEY([geographicUbicationId])
REFERENCES [dbo].[Geographic_Ubications] ([geographicUbicationId])
GO
ALTER TABLE [dbo].[Availables_Habit_Ubications] CHECK CONSTRAINT [FK_AvailablesHabitUbications_GeographicUbications_Id]
GO
ALTER TABLE [dbo].[Availables_Habit_Ubications]  WITH CHECK ADD  CONSTRAINT [FK_AvailablesHabitUbications_Habits_id] FOREIGN KEY([habitId])
REFERENCES [dbo].[Habits] ([habitId])
GO
ALTER TABLE [dbo].[Availables_Habit_Ubications] CHECK CONSTRAINT [FK_AvailablesHabitUbications_Habits_id]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Countries_countryId] FOREIGN KEY([countryId])
REFERENCES [dbo].[Countries] ([countryId])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Countries_countryId]
GO
ALTER TABLE [dbo].[Commerces]  WITH CHECK ADD  CONSTRAINT [FK_Commerces_Address_addressId] FOREIGN KEY([addressId])
REFERENCES [dbo].[Address] ([addressId])
GO
ALTER TABLE [dbo].[Commerces] CHECK CONSTRAINT [FK_Commerces_Address_addressId]
GO
ALTER TABLE [dbo].[Habits]  WITH CHECK ADD  CONSTRAINT [FK_Habits_HabitsActionsTypes_habitActionTypeId] FOREIGN KEY([habitActionTypeId])
REFERENCES [dbo].[Habits_Actions_Types] ([habitActionTypeId])
GO
ALTER TABLE [dbo].[Habits] CHECK CONSTRAINT [FK_Habits_HabitsActionsTypes_habitActionTypeId]
GO
ALTER TABLE [dbo].[Habits_History]  WITH CHECK ADD  CONSTRAINT [FK_HabitsPerUser_Habits_habitId] FOREIGN KEY([habitId])
REFERENCES [dbo].[Habits] ([habitId])
GO
ALTER TABLE [dbo].[Habits_History] CHECK CONSTRAINT [FK_HabitsPerUser_Habits_habitId]
GO
ALTER TABLE [dbo].[Habits_History]  WITH CHECK ADD  CONSTRAINT [FK_HabitsPerUser_Users_userId] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Habits_History] CHECK CONSTRAINT [FK_HabitsPerUser_Users_userId]
GO
ALTER TABLE [dbo].[Image_Per_User]  WITH CHECK ADD  CONSTRAINT [FK_ImagePerUser_Images_imageId] FOREIGN KEY([imageId])
REFERENCES [dbo].[Images] ([imageId])
GO
ALTER TABLE [dbo].[Image_Per_User] CHECK CONSTRAINT [FK_ImagePerUser_Images_imageId]
GO
ALTER TABLE [dbo].[Image_Per_User]  WITH CHECK ADD  CONSTRAINT [FK_ImagePerUser_Users_userId] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Image_Per_User] CHECK CONSTRAINT [FK_ImagePerUser_Users_userId]
GO
ALTER TABLE [dbo].[Reactions]  WITH CHECK ADD  CONSTRAINT [FK_Reactions_EntityTypes_entityTypeId] FOREIGN KEY([entityTypeId])
REFERENCES [dbo].[Entity_Types] ([entityTypeId])
GO
ALTER TABLE [dbo].[Reactions] CHECK CONSTRAINT [FK_Reactions_EntityTypes_entityTypeId]
GO
ALTER TABLE [dbo].[Reactions]  WITH CHECK ADD  CONSTRAINT [FK_Reactions_ReactionTypes_reactionTypeId] FOREIGN KEY([reactionTypeId])
REFERENCES [dbo].[Reaction_Types] ([reactionTypeId])
GO
ALTER TABLE [dbo].[Reactions] CHECK CONSTRAINT [FK_Reactions_ReactionTypes_reactionTypeId]
GO
ALTER TABLE [dbo].[Rules_Per_Habit]  WITH CHECK ADD  CONSTRAINT [FK_RulesPerHabit_Habits_habitId] FOREIGN KEY([habitId])
REFERENCES [dbo].[Habits] ([habitId])
GO
ALTER TABLE [dbo].[Rules_Per_Habit] CHECK CONSTRAINT [FK_RulesPerHabit_Habits_habitId]
GO
ALTER TABLE [dbo].[Rules_Per_Habit]  WITH CHECK ADD  CONSTRAINT [FK_RulesPerHabit_Rules_ruleId] FOREIGN KEY([ruleId])
REFERENCES [dbo].[Rules] ([ruleId])
GO
ALTER TABLE [dbo].[Rules_Per_Habit] CHECK CONSTRAINT [FK_RulesPerHabit_Rules_ruleId]
GO
ALTER TABLE [dbo].[SM_LoginInfo]  WITH CHECK ADD  CONSTRAINT [FK_SM_LoginInfo_SocialMedias_socialMediaId] FOREIGN KEY([socialMediaId])
REFERENCES [dbo].[Social_Medias] ([socialMediaId])
GO
ALTER TABLE [dbo].[SM_LoginInfo] CHECK CONSTRAINT [FK_SM_LoginInfo_SocialMedias_socialMediaId]
GO
ALTER TABLE [dbo].[SM_LoginInfo]  WITH CHECK ADD  CONSTRAINT [FK_SM_LoginInfo_Users_userId] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[SM_LoginInfo] CHECK CONSTRAINT [FK_SM_LoginInfo_Users_userId]
GO
ALTER TABLE [dbo].[Sponsorships]  WITH CHECK ADD  CONSTRAINT [FK_Sponsors_Sponsortypes_sponsor_typeId] FOREIGN KEY([sponsorTypeId])
REFERENCES [dbo].[Sponsor_types] ([sponsorTypeId])
GO
ALTER TABLE [dbo].[Sponsorships] CHECK CONSTRAINT [FK_Sponsors_Sponsortypes_sponsor_typeId]
GO
ALTER TABLE [dbo].[Sponsorships]  WITH CHECK ADD  CONSTRAINT [FK_Sponsorships_Habits_habitId] FOREIGN KEY([habitId])
REFERENCES [dbo].[Habits] ([habitId])
GO
ALTER TABLE [dbo].[Sponsorships] CHECK CONSTRAINT [FK_Sponsorships_Habits_habitId]
GO
ALTER TABLE [dbo].[Summary_Posts]  WITH CHECK ADD  CONSTRAINT [FK_SummaryPosts_Users_userId] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Summary_Posts] CHECK CONSTRAINT [FK_SummaryPosts_Users_userId]
GO
ALTER TABLE [dbo].[Tag_Value]  WITH CHECK ADD  CONSTRAINT [FK_TagValue_EntityTypes_entityTypeId] FOREIGN KEY([entityTypeId])
REFERENCES [dbo].[Entity_Types] ([entityTypeId])
GO
ALTER TABLE [dbo].[Tag_Value] CHECK CONSTRAINT [FK_TagValue_EntityTypes_entityTypeId]
GO
ALTER TABLE [dbo].[Tag_Value]  WITH CHECK ADD  CONSTRAINT [FK_TagValue_UTMTags_utmTagId] FOREIGN KEY([utmTagId])
REFERENCES [dbo].[UTM_Tags] ([utmTagId])
GO
ALTER TABLE [dbo].[Tag_Value] CHECK CONSTRAINT [FK_TagValue_UTMTags_utmTagId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Address_addressId] FOREIGN KEY([addressId])
REFERENCES [dbo].[Address] ([addressId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Address_addressId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Genders_genderId] FOREIGN KEY([genderId])
REFERENCES [dbo].[Genders] ([genderId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Genders_genderId]
GO
ALTER TABLE [dbo].[Zones]  WITH CHECK ADD  CONSTRAINT [FK_Zones_Cities_cityId] FOREIGN KEY([cityId])
REFERENCES [dbo].[Cities] ([cityId])
GO
ALTER TABLE [dbo].[Zones] CHECK CONSTRAINT [FK_Zones_Cities_cityId]
GO
USE [master]
GO
ALTER DATABASE [ChangeIt] SET  READ_WRITE 
GO
