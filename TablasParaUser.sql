USE [pruebas]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 24/6/2021 16:41:24 ******/
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
/****** Object:  Table [dbo].[Cities]    Script Date: 24/6/2021 16:41:24 ******/
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
/****** Object:  Table [dbo].[Countries]    Script Date: 24/6/2021 16:41:24 ******/
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
/****** Object:  Table [dbo].[Genders]    Script Date: 24/6/2021 16:41:24 ******/
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
/****** Object:  Table [dbo].[SM_LoginInfo]    Script Date: 24/6/2021 16:41:24 ******/
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
/****** Object:  Table [dbo].[Social_Medias]    Script Date: 24/6/2021 16:41:24 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 24/6/2021 16:41:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userId] [bigint] IDENTITY(1,1) NOT NULL,
	[nationalId] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Zones]    Script Date: 24/6/2021 16:41:24 ******/
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
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Countries_countryId] FOREIGN KEY([countryId])
REFERENCES [dbo].[Countries] ([countryId])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Countries_countryId]
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
