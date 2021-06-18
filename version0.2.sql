USE [master]
GO
/****** Object:  Database [ChangeIt]    Script Date: 17/6/2021 23:43:02 ******/
CREATE DATABASE [ChangeIt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChangeIt', FILENAME = N'C:\development\basedata\ChangeIt\ChangeIt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ChangeIt_log', FILENAME = N'C:\development\basedata\ChangeIt\ChangeIt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Address]    Script Date: 17/6/2021 23:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[addressId] [bigint] IDENTITY(1,1) NOT NULL,
	[countryId] [smallint] NOT NULL,
	[cityId] [bigint] NOT NULL,
	[zoneId] [bigint] NOT NULL,
	[otherIndications] [nvarchar](200) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[addressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ads]    Script Date: 17/6/2021 23:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ads](
	[adId] [bigint] IDENTITY(1,1) NOT NULL,
	[campaign] [nvarchar](100) NOT NULL,
	[adObjetiveId] [bigint] NULL,
	[adQualityId] [tinyint] NULL,
 CONSTRAINT [PK_Ads] PRIMARY KEY CLUSTERED 
(
	[adId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ads_Objetives]    Script Date: 17/6/2021 23:43:02 ******/
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
/****** Object:  Table [dbo].[Ads_Qualities]    Script Date: 17/6/2021 23:43:02 ******/
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
/****** Object:  Table [dbo].[Ads_Tags]    Script Date: 17/6/2021 23:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ads_Tags](
	[adTagId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Ads_Tags] PRIMARY KEY CLUSTERED 
(
	[adTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Availables_Habit_Ubications]    Script Date: 17/6/2021 23:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Availables_Habit_Ubications](
	[geographicUbicationId] [bigint] NOT NULL,
	[habitId] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 17/6/2021 23:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[cityId] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](80) NOT NULL,
	[countryId] [smallint] NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[cityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Commerces]    Script Date: 17/6/2021 23:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commerces](
	[commerceId] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Commerces] PRIMARY KEY CLUSTERED 
(
	[commerceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 17/6/2021 23:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[countryId] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](80) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[countryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entity_Types]    Script Date: 17/6/2021 23:43:02 ******/
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
/****** Object:  Table [dbo].[Genders]    Script Date: 17/6/2021 23:43:02 ******/
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
/****** Object:  Table [dbo].[Geographic_Ubications]    Script Date: 17/6/2021 23:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Geographic_Ubications](
	[geographicUbicationId] [bigint] IDENTITY(1,1) NOT NULL,
	[label] [nvarchar](120) NOT NULL,
	[latitude] [decimal](9, 6) NOT NULL,
	[longitude] [decimal](9, 6) NOT NULL,
	[coverageRadiusMeters] [int] NOT NULL,
 CONSTRAINT [PK_Geographic_Ubications] PRIMARY KEY CLUSTERED 
(
	[geographicUbicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habits]    Script Date: 17/6/2021 23:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habits](
	[habitId] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[description] [varchar](240) NOT NULL,
	[habitActionTypeId] [smallint] NOT NULL,
	[iconURL] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Habits] PRIMARY KEY CLUSTERED 
(
	[habitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habits_Actions_Types]    Script Date: 17/6/2021 23:43:02 ******/
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
/****** Object:  Table [dbo].[Images]    Script Date: 17/6/2021 23:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[imageId] [bigint] IDENTITY(1,1) NOT NULL,
	[url] [nvarchar](128) NOT NULL,
	[deleted] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reaction]    Script Date: 17/6/2021 23:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reaction](
	[reactionTypeId] [smallint] IDENTITY(1,1) NOT NULL,
	[entityTypeId] [tinyint] NOT NULL,
	[entityId] [bigint] NOT NULL,
 CONSTRAINT [PK_Reaction] PRIMARY KEY CLUSTERED 
(
	[reactionTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reaction_Types]    Script Date: 17/6/2021 23:43:02 ******/
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
/****** Object:  Table [dbo].[Rules]    Script Date: 17/6/2021 23:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rules](
	[name] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[social_Medias]    Script Date: 17/6/2021 23:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[social_Medias](
	[socialMediaId] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[url] [nvarchar](128) NOT NULL,
	[support] [nvarchar](128) NOT NULL,
	[iconUrl] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_socialMedias] PRIMARY KEY CLUSTERED 
(
	[socialMediaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sponsor_types]    Script Date: 17/6/2021 23:43:02 ******/
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
/****** Object:  Table [dbo].[Sponsors]    Script Date: 17/6/2021 23:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sponsors](
	[sponsorId] [bigint] IDENTITY(1,1) NOT NULL,
	[sponsorTypeId] [smallint] NOT NULL,
 CONSTRAINT [PK_Sponsors] PRIMARY KEY CLUSTERED 
(
	[sponsorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Summary_Posts]    Script Date: 17/6/2021 23:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Summary_Posts](
	[summaryPostId] [bigint] IDENTITY(1,1) NOT NULL,
	[userId] [bigint] NOT NULL,
	[socialMediaId] [smallint] NOT NULL,
	[title] [nvarchar](200) NOT NULL,
	[text] [nvarchar](2000) NOT NULL,
	[date] [datetime] NOT NULL,
 CONSTRAINT [PK_Summary_Posts] PRIMARY KEY CLUSTERED 
(
	[summaryPostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags_Per_Ad]    Script Date: 17/6/2021 23:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags_Per_Ad](
	[adTagId] [int] NOT NULL,
	[adId] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17/6/2021 23:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userId] [bigint] IDENTITY(1,1) NOT NULL,
	[nationalId] [varchar](50) NOT NULL,
	[name] [nvarchar](60) NOT NULL,
	[lastname] [nvarchar](60) NOT NULL,
	[birthday] [date] NOT NULL,
	[genderId] [tinyint] NOT NULL,
	[mail] [nvarchar](128) NOT NULL,
	[socialMediaId] [smallint] NOT NULL,
	[internalSocialMediaId] [nvarchar](200) NOT NULL,
	[addressId] [bigint] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zones]    Script Date: 17/6/2021 23:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zones](
	[zoneId] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](80) NOT NULL,
	[cityId] [bigint] NOT NULL,
 CONSTRAINT [PK_Zones] PRIMARY KEY CLUSTERED 
(
	[zoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Images] ADD  CONSTRAINT [DF_Images_deleted]  DEFAULT ((0)) FOR [deleted]
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
ALTER TABLE [dbo].[Habits]  WITH CHECK ADD  CONSTRAINT [FK_Habits_HabitsActions_Types] FOREIGN KEY([habitActionTypeId])
REFERENCES [dbo].[Habits_Actions_Types] ([habitActionTypeId])
GO
ALTER TABLE [dbo].[Habits] CHECK CONSTRAINT [FK_Habits_HabitsActions_Types]
GO
ALTER TABLE [dbo].[Sponsors]  WITH CHECK ADD  CONSTRAINT [FK_Sponsors_Sponsortypes_sponsor_typeId] FOREIGN KEY([sponsorTypeId])
REFERENCES [dbo].[Sponsor_types] ([sponsorTypeId])
GO
ALTER TABLE [dbo].[Sponsors] CHECK CONSTRAINT [FK_Sponsors_Sponsortypes_sponsor_typeId]
GO
ALTER TABLE [dbo].[Tags_Per_Ad]  WITH CHECK ADD  CONSTRAINT [FK_TagsPerAd_Ads] FOREIGN KEY([adId])
REFERENCES [dbo].[Ads] ([adId])
GO
ALTER TABLE [dbo].[Tags_Per_Ad] CHECK CONSTRAINT [FK_TagsPerAd_Ads]
GO
ALTER TABLE [dbo].[Tags_Per_Ad]  WITH CHECK ADD  CONSTRAINT [FK_TagsPerAd_AdsTags_adTagId] FOREIGN KEY([adTagId])
REFERENCES [dbo].[Ads_Tags] ([adTagId])
GO
ALTER TABLE [dbo].[Tags_Per_Ad] CHECK CONSTRAINT [FK_TagsPerAd_AdsTags_adTagId]
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
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_socialMedias_socialMediaId] FOREIGN KEY([socialMediaId])
REFERENCES [dbo].[social_Medias] ([socialMediaId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_socialMedias_socialMediaId]
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
