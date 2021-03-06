USE [Innosix]
GO
/****** Object:  StoredProcedure [dbo].[GetTagHierarchy]    Script Date: 10.01.2018 16:20:36 ******/
DROP PROCEDURE [dbo].[GetTagHierarchy]
GO
/****** Object:  StoredProcedure [dbo].[GetAdditionalTechTags]    Script Date: 10.01.2018 16:20:36 ******/
DROP PROCEDURE [dbo].[GetAdditionalTechTags]
GO
ALTER TABLE [dbo].[TechTagToTC] DROP CONSTRAINT [FK_TechTagToTC_TechTag]
GO
ALTER TABLE [dbo].[TechTagToTC] DROP CONSTRAINT [FK_TechTagToTC_TCBasicInfo]
GO
ALTER TABLE [dbo].[TechTagParents] DROP CONSTRAINT [FK_TechTagParents_TechTag_Parent]
GO
ALTER TABLE [dbo].[TechTagParents] DROP CONSTRAINT [FK_TechTagParents_TechTag]
GO
ALTER TABLE [dbo].[TechDomainToTC] DROP CONSTRAINT [FK_TechDomainToTC_TechDomain]
GO
ALTER TABLE [dbo].[TechDomainToTC] DROP CONSTRAINT [FK_TechDomainToTC_TCBasicInfo]
GO
ALTER TABLE [dbo].[TCTechnology] DROP CONSTRAINT [FK_TCTechnology_TechSector]
GO
ALTER TABLE [dbo].[TCTechnology] DROP CONSTRAINT [FK_TCTechnology_TCBasicInfo]
GO
ALTER TABLE [dbo].[TCRating] DROP CONSTRAINT [FK_TCRating_TCBasicInfo]
GO
ALTER TABLE [dbo].[TCIdealPartner] DROP CONSTRAINT [FK_TCIdealPartner_TCBasicInfo]
GO
ALTER TABLE [dbo].[TCGeneral] DROP CONSTRAINT [FK_TCGeneral_TCBasicInfo]
GO
ALTER TABLE [dbo].[TCContact] DROP CONSTRAINT [FK_TCContact_TCBasicInfo]
GO
ALTER TABLE [dbo].[TCBusinessInfo] DROP CONSTRAINT [FK_TCBusinessInfo_TCBasicInfo]
GO
ALTER TABLE [dbo].[TCBusinessInfo] DROP CONSTRAINT [FK_TCBusinessInfo_Revenue]
GO
ALTER TABLE [dbo].[TCBusinessInfo] DROP CONSTRAINT [FK_TCBusinessInfo_Nace]
GO
ALTER TABLE [dbo].[TCBusinessInfo] DROP CONSTRAINT [FK_TCBusinessInfo_Maturity]
GO
ALTER TABLE [dbo].[TCBusinessInfo] DROP CONSTRAINT [FK_TCBusinessInfo_Employees]
GO
ALTER TABLE [dbo].[TCBasicInfo] DROP CONSTRAINT [FK_TCBasicInfo_Country]
GO
ALTER TABLE [dbo].[TCAdmin] DROP CONSTRAINT [FK_TCAdmin_TCBasicInfo]
GO
ALTER TABLE [dbo].[TCAdmin] DROP CONSTRAINT [FK_TCAdmin_Cluster]
GO
ALTER TABLE [dbo].[TCAdmin] DROP CONSTRAINT [FK_TCAdmin_AccountManager]
GO
ALTER TABLE [dbo].[TCActive] DROP CONSTRAINT [FK_TCActive_TCBasicInfo]
GO
ALTER TABLE [dbo].[ServicesToTC] DROP CONSTRAINT [FK_ServicesToTC_TCBasicInfo]
GO
ALTER TABLE [dbo].[ServicesToTC] DROP CONSTRAINT [FK_ServicesToTC_Services]
GO
ALTER TABLE [dbo].[ProductToTC] DROP CONSTRAINT [FK_ProductToTC_TCBasicInfo]
GO
ALTER TABLE [dbo].[ProductToTC] DROP CONSTRAINT [FK_ProductToTC_Product]
GO
ALTER TABLE [dbo].[PortfolioToPortfolioItem] DROP CONSTRAINT [FK_PortfolioToPortfolioItem_PortfolioItem]
GO
ALTER TABLE [dbo].[PortfolioToPortfolioItem] DROP CONSTRAINT [FK_PortfolioToPortfolioItem_Portfolio]
GO
ALTER TABLE [dbo].[PortfolioItem] DROP CONSTRAINT [FK_PorftolioItem_TCBasicInfo]
GO
ALTER TABLE [dbo].[PortfolioItem] DROP CONSTRAINT [FK_PorftolioItem_Stage1]
GO
ALTER TABLE [dbo].[PortfolioItem] DROP CONSTRAINT [FK_PorftolioItem_Stage]
GO
ALTER TABLE [dbo].[BusinessModelToTC] DROP CONSTRAINT [FK_BusinessModelToTC_TCBasicInfo]
GO
ALTER TABLE [dbo].[BusinessModelToTC] DROP CONSTRAINT [FK_BusinessModelToTC_BusinessModel]
GO
ALTER TABLE [dbo].[AspNetUsersToTC] DROP CONSTRAINT [FK_AspNetUsersToTC_TCBasicInfo]
GO
ALTER TABLE [dbo].[AspNetUsersToTC] DROP CONSTRAINT [FK_AspNetUsersToTC_AspNetUsers]
GO
ALTER TABLE [dbo].[AspNetUsersToStage] DROP CONSTRAINT [FK_AspNetUsersToStage_Stage]
GO
ALTER TABLE [dbo].[AspNetUsersToStage] DROP CONSTRAINT [FK_AspNetUsersToStage_AspNetUsers]
GO
ALTER TABLE [dbo].[AspNetUsersToPortfolio] DROP CONSTRAINT [FK_AspNetUsersToPortfolio_Portfolio]
GO
ALTER TABLE [dbo].[AspNetUsersToPortfolio] DROP CONSTRAINT [FK_AspNetUsersToPortfolio_AspNetUsers]
GO
ALTER TABLE [dbo].[AspNetUsersTcClaim] DROP CONSTRAINT [FK_AspNetUsersTcClaim_TCBasicInfo]
GO
ALTER TABLE [dbo].[AspNetUsersTcClaim] DROP CONSTRAINT [FK_AspNetUsersTcClaim_AspNetUsers]
GO
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  View [dbo].[VUserTcClaim]    Script Date: 10.01.2018 16:20:36 ******/
DROP VIEW [dbo].[VUserTcClaim]
GO
/****** Object:  View [dbo].[VTcWithTagsUser]    Script Date: 10.01.2018 16:20:36 ******/
DROP VIEW [dbo].[VTcWithTagsUser]
GO
/****** Object:  View [dbo].[VTcWithTags]    Script Date: 10.01.2018 16:20:36 ******/
DROP VIEW [dbo].[VTcWithTags]
GO
/****** Object:  View [dbo].[VTcClaim]    Script Date: 10.01.2018 16:20:36 ******/
DROP VIEW [dbo].[VTcClaim]
GO
/****** Object:  Table [dbo].[TechTagToTC]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[TechTagToTC]
GO
/****** Object:  Table [dbo].[TechTagParents]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[TechTagParents]
GO
/****** Object:  Table [dbo].[TechTagDeclined]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[TechTagDeclined]
GO
/****** Object:  Table [dbo].[TechTag]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[TechTag]
GO
/****** Object:  Table [dbo].[TechSector]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[TechSector]
GO
/****** Object:  Table [dbo].[TechDomainToTC]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[TechDomainToTC]
GO
/****** Object:  Table [dbo].[TechDomain]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[TechDomain]
GO
/****** Object:  Table [dbo].[TCTechnology]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[TCTechnology]
GO
/****** Object:  Table [dbo].[TCRating]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[TCRating]
GO
/****** Object:  Table [dbo].[TCIdealPartner]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[TCIdealPartner]
GO
/****** Object:  Table [dbo].[TCGeneral]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[TCGeneral]
GO
/****** Object:  Table [dbo].[TCContact]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[TCContact]
GO
/****** Object:  Table [dbo].[TCBusinessInfo]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[TCBusinessInfo]
GO
/****** Object:  Table [dbo].[TCBasicInfo]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[TCBasicInfo]
GO
/****** Object:  Table [dbo].[TCAdmin]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[TCAdmin]
GO
/****** Object:  Table [dbo].[TCActive]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[TCActive]
GO
/****** Object:  Table [dbo].[Stage]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[Stage]
GO
/****** Object:  Table [dbo].[ServicesToTC]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[ServicesToTC]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[Services]
GO
/****** Object:  Table [dbo].[Revenue]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[Revenue]
GO
/****** Object:  Table [dbo].[ProductToTC]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[ProductToTC]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[Product]
GO
/****** Object:  Table [dbo].[PortfolioToPortfolioItem]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[PortfolioToPortfolioItem]
GO
/****** Object:  Table [dbo].[PortfolioItem]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[PortfolioItem]
GO
/****** Object:  Table [dbo].[Portfolio]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[Portfolio]
GO
/****** Object:  Table [dbo].[Nace]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[Nace]
GO
/****** Object:  Table [dbo].[Maturity]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[Maturity]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[Employees]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[Country]
GO
/****** Object:  Table [dbo].[Cluster]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[Cluster]
GO
/****** Object:  Table [dbo].[BusinessModelToTC]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[BusinessModelToTC]
GO
/****** Object:  Table [dbo].[BusinessModel]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[BusinessModel]
GO
/****** Object:  Table [dbo].[AspNetUsersToTC]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[AspNetUsersToTC]
GO
/****** Object:  Table [dbo].[AspNetUsersToStage]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[AspNetUsersToStage]
GO
/****** Object:  Table [dbo].[AspNetUsersToPortfolio]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[AspNetUsersToPortfolio]
GO
/****** Object:  Table [dbo].[AspNetUsersTcClaim]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[AspNetUsersTcClaim]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[AccountManager]    Script Date: 10.01.2018 16:20:36 ******/
DROP TABLE [dbo].[AccountManager]
GO
/****** Object:  Table [dbo].[AccountManager]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountManager](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountManagerName] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](120) NULL,
 CONSTRAINT [PK_AccountManager] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsersTcClaim]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsersTcClaim](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TCid] [bigint] NOT NULL,
	[AspNetUserId] [nvarchar](128) NOT NULL,
	[Description] [nvarchar](1500) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AspNetUsersTcClaim] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsersToPortfolio]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsersToPortfolio](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PortfolioId] [bigint] NOT NULL,
	[AspNetUserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_AspNetUsersToPortfolio] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsersToStage]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsersToStage](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AspNetUserId] [nvarchar](128) NOT NULL,
	[StageId] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUserToStage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsersToTC]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsersToTC](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TCid] [bigint] NOT NULL,
	[AspNetUserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_AspNetUsersToTC] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BusinessModel]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessModel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BusinessModelName] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](120) NULL,
 CONSTRAINT [PK_BusinessModel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BusinessModelToTC]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessModelToTC](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TCid] [bigint] NOT NULL,
	[BusinessModelId] [int] NOT NULL,
 CONSTRAINT [PK_BusinessModelToTC] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cluster]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cluster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClusterName] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](120) NULL,
 CONSTRAINT [PK_Cluster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeTypeName] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](120) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Maturity]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maturity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaturityStageName] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](120) NULL,
 CONSTRAINT [PK_Maturity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nace]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nace](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NACEcode] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Nace] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Portfolio]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Portfolio](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[NrOfTCs] [int] NOT NULL CONSTRAINT [DF_Portfolio_NrOfTCs]  DEFAULT ((0)),
 CONSTRAINT [PK_Portfolio] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PortfolioItem]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PortfolioItem](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TCid] [bigint] NOT NULL,
	[StageId] [int] NULL,
	[NextMoveId] [int] NULL,
	[NextMoveDate] [date] NULL,
	[ResponsibleEmail] [nvarchar](200) NULL,
	[ResponsibleName] [nvarchar](200) NULL,
	[OpportunityDate] [date] NULL,
	[Comment] [nvarchar](1000) NULL,
 CONSTRAINT [PK_PorftolioItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PortfolioToPortfolioItem]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PortfolioToPortfolioItem](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PortfolioId] [bigint] NOT NULL,
	[PortfolioItemId] [bigint] NOT NULL,
 CONSTRAINT [PK_PortfolioToPortfolioItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](200) NOT NULL,
	[ProductDescription] [nvarchar](1500) NOT NULL,
	[ProductImage] [nvarchar](200) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductToTC]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductToTC](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TCid] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
 CONSTRAINT [PK_ProductToTC] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Revenue]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Revenue](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RevenueName] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](120) NULL,
 CONSTRAINT [PK_Revenue] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Services]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServicesName] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](120) NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServicesToTC]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicesToTC](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TCid] [bigint] NOT NULL,
	[ServicesId] [int] NOT NULL,
 CONSTRAINT [PK_ServicesToTC] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stage]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Stage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TCActive]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TCActive](
	[TCid] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_TCActive] PRIMARY KEY CLUSTERED 
(
	[TCid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TCAdmin]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TCAdmin](
	[TCid] [bigint] NOT NULL,
	[ClusterRelationId] [int] NULL,
	[FreetextNoteField] [nvarchar](1500) NULL,
	[InnosixAccountManagerId] [int] NULL,
	[Source] [nvarchar](200) NULL,
 CONSTRAINT [PK__TCAdmin__B773705F75E18A81] PRIMARY KEY CLUSTERED 
(
	[TCid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TCBasicInfo]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TCBasicInfo](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Address1] [nvarchar](200) NULL,
	[Address2] [nvarchar](200) NULL,
	[Address3] [nvarchar](200) NULL,
	[Zip] [nvarchar](200) NULL,
	[City] [nvarchar](200) NULL,
	[CountryId] [int] NOT NULL,
	[CompanyEmail] [nvarchar](200) NOT NULL,
	[CompanyName] [nvarchar](200) NOT NULL,
	[CompanyPhone] [nvarchar](200) NOT NULL,
	[LegalSuffix] [nvarchar](200) NULL,
	[CompanyWebsite] [nvarchar](200) NOT NULL,
	[LogoUrl] [nvarchar](200) NULL,
	[RegistrationNumber] [nvarchar](200) NULL,
 CONSTRAINT [PK__TCBasicI__3214EC07B856B3B5] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TCBusinessInfo]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TCBusinessInfo](
	[TCid] [bigint] NOT NULL,
	[BusinessSummary] [nvarchar](400) NOT NULL,
	[CompanyDescription] [nvarchar](1500) NULL,
	[NaceCodeId] [int] NULL,
	[RevenueYear] [int] NULL,
	[FullTimeEmployeesId] [int] NULL,
	[FTEyear] [int] NULL,
	[KeyCompetitors] [nvarchar](200) NULL,
	[KeyPartners] [nvarchar](200) NULL,
	[LargestOwners] [nvarchar](200) NULL,
	[MaturityStageId] [int] NULL,
	[ProfitMaking] [bit] NOT NULL,
	[RevenueId] [int] NULL,
	[Established] [int] NOT NULL,
 CONSTRAINT [PK__TCBusine__B773705FD4726F7C] PRIMARY KEY CLUSTERED 
(
	[TCid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TCContact]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TCContact](
	[TCid] [bigint] NOT NULL,
	[ContactPersonEmail] [nvarchar](200) NOT NULL,
	[ContactPersonPhone] [nvarchar](200) NOT NULL,
	[ContactPersonName] [nvarchar](200) NOT NULL,
	[Position] [nvarchar](200) NULL,
 CONSTRAINT [PK__TCContac__B773705F95A9FAF8] PRIMARY KEY CLUSTERED 
(
	[TCid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TCGeneral]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TCGeneral](
	[TCid] [bigint] NOT NULL,
	[Created] [date] NOT NULL,
	[LastUpdated] [date] NOT NULL,
 CONSTRAINT [PK_TCGeneral] PRIMARY KEY CLUSTERED 
(
	[TCid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TCIdealPartner]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TCIdealPartner](
	[TCid] [bigint] NOT NULL,
	[IdealCorporatePartnerNace] [int] NULL,
	[IdealCorporatePartnerName] [nvarchar](500) NULL,
	[IdealCorporatePartnerTechnologyFocus] [int] NULL,
 CONSTRAINT [PK__TCIdealP__B773705F3CA66F0B] PRIMARY KEY CLUSTERED 
(
	[TCid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TCRating]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TCRating](
	[TCid] [bigint] NOT NULL,
	[Financials] [decimal](3, 2) NOT NULL,
	[Fundamentals] [decimal](3, 2) NOT NULL,
	[Market] [decimal](3, 2) NOT NULL,
	[ManagementAndExecution] [decimal](3, 2) NOT NULL,
	[BML] [decimal](3, 2) NOT NULL,
	[BMLConfidenceIndex] [int] NOT NULL,
	[IntellectualProperty] [decimal](3, 2) NOT NULL,
	[Technology] [decimal](3, 2) NOT NULL,
	[TechnologyRisk] [decimal](3, 2) NOT NULL,
	[TML] [decimal](3, 2) NOT NULL,
	[TMLConfidenceIndex] [int] NOT NULL,
	[OverallRating] [decimal](3, 2) NOT NULL,
	[OverallRatingConfidenceIndex] [int] NOT NULL,
	[RatingDate] [date] NOT NULL,
 CONSTRAINT [PK__TCRating__B773705F26C79D26] PRIMARY KEY CLUSTERED 
(
	[TCid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TCTechnology]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TCTechnology](
	[TCid] [bigint] NOT NULL,
	[AdditionalTechTags] [nvarchar](200) NULL,
	[Patents] [nvarchar](500) NULL,
	[OtherIpNotPatented] [nvarchar](200) NULL,
	[TechnologySectorId] [int] NULL,
 CONSTRAINT [PK__TCTechno__3214EC071FA8C12E] PRIMARY KEY CLUSTERED 
(
	[TCid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TechDomain]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TechDomain](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DomainName] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](120) NULL,
 CONSTRAINT [PK_TechDomain] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TechDomainToTC]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TechDomainToTC](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TCid] [bigint] NOT NULL,
	[TechDomainId] [int] NOT NULL,
 CONSTRAINT [PK_TechDomainToTC] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TechSector]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TechSector](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TechSectorName] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](120) NULL,
 CONSTRAINT [PK_TechSector] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TechTag]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TechTag](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](200) NOT NULL,
	[ParentsCount] [int] NULL,
	[ChildrenCount] [int] NULL,
	[UsageCount] [int] NULL,
	[Description] [nvarchar](120) NULL,
 CONSTRAINT [PK_TechTag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TechTagDeclined]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TechTagDeclined](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_TechTagDeclined] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TechTagParents]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TechTagParents](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TechTagId] [int] NOT NULL,
	[ParentTechTagId] [int] NOT NULL,
 CONSTRAINT [PK_TechTagParents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TechTagToTC]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TechTagToTC](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TCid] [bigint] NOT NULL,
	[TechTagId] [int] NOT NULL,
 CONSTRAINT [PK_TechTagToTC] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[VTcClaim]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[VTcClaim] AS
WITH TcWithTags (Id, CompanyName, City, Country, CompanyEmail, LegalSuffix, CompanyWebsite, TagName)											-- add more columns here
AS
(
	SELECT bi.Id, bi.CompanyName, bi.City, c.CountryName, bi.CompanyEmail, bi.LegalSuffix, bi.CompanyWebsite, t.TagName FROM dbo.TCBasicInfo bi	-- add more columns here
	INNER JOIN dbo.TechTagToTC tt ON bi.Id = tt.TCid
	INNER JOIN dbo.TechTag t ON tt.TechTagId = t.Id
	INNER JOIN dbo.TCActive ta ON bi.Id = ta.TCid
	INNER JOIN dbo.Country c ON bi.CountryId = c.Id
	WHERE ta.IsActive = 0
)

SELECT Main.Id, Main.CompanyName, Main.City, Main.Country, Main.CompanyEmail, Main.LegalSuffix, Main.CompanyWebsite,							-- add more columns here
		REPLACE(LEFT(Main.Tc, LEN(Main.Tc)-1), '&amp;', '&') AS "TechTags"
FROM
(
	SELECT DISTINCT bi2.Id, bi2.CompanyName, bi2.City, bi2.Country, bi2.CompanyEmail, bi2.LegalSuffix, bi2.CompanyWebsite,						-- add more columns here
	(
		SELECT bi1.TagName + ', ' AS [text()]
		FROM TcWithTags bi1
		WHERE bi1.Id = bi2.Id
		ORDER BY bi1.CompanyName
		FOR XML PATH ('')
	) [Tc]
	FROM TcWithTags bi2
) [Main]






GO
/****** Object:  View [dbo].[VTcWithTags]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[VTcWithTags] AS
WITH TcWithTags (Id, CompanyName, City, Country, CompanyEmail, LegalSuffix, CompanyWebsite, IsActive, TagName)													-- add more columns here
AS
(
	SELECT bi.Id, bi.CompanyName, bi.City, c.CountryName, bi.CompanyEmail, bi.LegalSuffix, bi.CompanyWebsite, ta.IsActive, t.TagName FROM dbo.TCBasicInfo bi	-- add more columns here
	INNER JOIN dbo.TechTagToTC tt ON bi.Id = tt.TCid
	INNER JOIN dbo.TechTag t ON tt.TechTagId = t.Id
	INNER JOIN dbo.TCActive ta ON bi.Id = ta.TCid
	INNER JOIN dbo.Country c ON bi.CountryId = c.Id
)

SELECT Main.Id, Main.CompanyName, Main.City, Main.Country, Main.CompanyEmail, Main.LegalSuffix, Main.CompanyWebsite, Main.IsActive,								-- add more columns here
		REPLACE(LEFT(Main.Tc, LEN(Main.Tc)-1), '&amp;', '&') AS "TechTags"
FROM
(
	SELECT DISTINCT bi2.Id, bi2.CompanyName, bi2.City, bi2.Country, bi2.CompanyEmail, bi2.LegalSuffix, bi2.CompanyWebsite, bi2.IsActive,						-- add more columns here
	(
		SELECT bi1.TagName + ', ' AS [text()]
		FROM TcWithTags bi1
		WHERE bi1.Id = bi2.Id
		ORDER BY bi1.CompanyName
		FOR XML PATH ('')
	) [Tc]
	FROM TcWithTags bi2
) [Main]






GO
/****** Object:  View [dbo].[VTcWithTagsUser]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[VTcWithTagsUser] AS
WITH TcWithTags (Id, CompanyName, City, Country, CompanyEmail, LegalSuffix, CompanyWebsite, TagName)												-- add more columns here
AS
(
	SELECT bi.Id, bi.CompanyName, bi.City, c.CountryName, bi.CompanyEmail, bi.LegalSuffix, bi.CompanyWebsite, t.TagName FROM dbo.TCBasicInfo bi		-- add more columns here
	INNER JOIN dbo.TechTagToTC tt ON bi.Id = tt.TCid
	INNER JOIN dbo.TechTag t ON tt.TechTagId = t.Id
	INNER JOIN dbo.TCActive ta ON bi.Id = ta.TCid
	INNER JOIN dbo.Country c ON bi.CountryId = c.Id
	WHERE ta.IsActive = 1
)

SELECT Main.Id, Main.CompanyName, Main.City, Main.Country, Main.CompanyEmail, Main.LegalSuffix, Main.CompanyWebsite,								-- add more columns here
		REPLACE(LEFT(Main.Tc, LEN(Main.Tc)-1), '&amp;', '&') AS "TechTags"
FROM
(
	SELECT DISTINCT bi2.Id, bi2.CompanyName, bi2.City, bi2.Country, bi2.CompanyEmail, bi2.LegalSuffix, bi2.CompanyWebsite,							-- add more columns here
	(
		SELECT bi1.TagName + ', ' AS [text()]
		FROM TcWithTags bi1
		WHERE bi1.Id = bi2.Id
		ORDER BY bi1.CompanyName
		FOR XML PATH ('')
	) [Tc]
	FROM TcWithTags bi2
) [Main]







GO
/****** Object:  View [dbo].[VUserTcClaim]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[VUserTcClaim] AS
SELECT uc.Id, u.Id as UserId, u.Email, uc.Description, uc.PhoneNumber, bi.Id as TcId, bi.CompanyName, bi.City, c.CountryName, bi.CompanyEmail, bi.LegalSuffix, bi.CompanyWebsite, a.IsActive
FROM dbo.TCBasicInfo bi
INNER JOIN dbo.Country c ON bi.CountryId = c.Id
INNER JOIN dbo.AspNetUsersTcClaim uc ON bi.Id = uc.TCid
INNER JOIN dbo.AspNetUsers u ON uc.AspNetUserId = u.Id
INNER JOIN dbo.TCActive a ON bi.Id = a.TCid



GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUsersTcClaim]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsersTcClaim_AspNetUsers] FOREIGN KEY([AspNetUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUsersTcClaim] CHECK CONSTRAINT [FK_AspNetUsersTcClaim_AspNetUsers]
GO
ALTER TABLE [dbo].[AspNetUsersTcClaim]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsersTcClaim_TCBasicInfo] FOREIGN KEY([TCid])
REFERENCES [dbo].[TCBasicInfo] ([Id])
GO
ALTER TABLE [dbo].[AspNetUsersTcClaim] CHECK CONSTRAINT [FK_AspNetUsersTcClaim_TCBasicInfo]
GO
ALTER TABLE [dbo].[AspNetUsersToPortfolio]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsersToPortfolio_AspNetUsers] FOREIGN KEY([AspNetUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUsersToPortfolio] CHECK CONSTRAINT [FK_AspNetUsersToPortfolio_AspNetUsers]
GO
ALTER TABLE [dbo].[AspNetUsersToPortfolio]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsersToPortfolio_Portfolio] FOREIGN KEY([PortfolioId])
REFERENCES [dbo].[Portfolio] ([Id])
GO
ALTER TABLE [dbo].[AspNetUsersToPortfolio] CHECK CONSTRAINT [FK_AspNetUsersToPortfolio_Portfolio]
GO
ALTER TABLE [dbo].[AspNetUsersToStage]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsersToStage_AspNetUsers] FOREIGN KEY([AspNetUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUsersToStage] CHECK CONSTRAINT [FK_AspNetUsersToStage_AspNetUsers]
GO
ALTER TABLE [dbo].[AspNetUsersToStage]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsersToStage_Stage] FOREIGN KEY([StageId])
REFERENCES [dbo].[Stage] ([Id])
GO
ALTER TABLE [dbo].[AspNetUsersToStage] CHECK CONSTRAINT [FK_AspNetUsersToStage_Stage]
GO
ALTER TABLE [dbo].[AspNetUsersToTC]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsersToTC_AspNetUsers] FOREIGN KEY([AspNetUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUsersToTC] CHECK CONSTRAINT [FK_AspNetUsersToTC_AspNetUsers]
GO
ALTER TABLE [dbo].[AspNetUsersToTC]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsersToTC_TCBasicInfo] FOREIGN KEY([TCid])
REFERENCES [dbo].[TCBasicInfo] ([Id])
GO
ALTER TABLE [dbo].[AspNetUsersToTC] CHECK CONSTRAINT [FK_AspNetUsersToTC_TCBasicInfo]
GO
ALTER TABLE [dbo].[BusinessModelToTC]  WITH CHECK ADD  CONSTRAINT [FK_BusinessModelToTC_BusinessModel] FOREIGN KEY([BusinessModelId])
REFERENCES [dbo].[BusinessModel] ([Id])
GO
ALTER TABLE [dbo].[BusinessModelToTC] CHECK CONSTRAINT [FK_BusinessModelToTC_BusinessModel]
GO
ALTER TABLE [dbo].[BusinessModelToTC]  WITH CHECK ADD  CONSTRAINT [FK_BusinessModelToTC_TCBasicInfo] FOREIGN KEY([TCid])
REFERENCES [dbo].[TCBasicInfo] ([Id])
GO
ALTER TABLE [dbo].[BusinessModelToTC] CHECK CONSTRAINT [FK_BusinessModelToTC_TCBasicInfo]
GO
ALTER TABLE [dbo].[PortfolioItem]  WITH CHECK ADD  CONSTRAINT [FK_PorftolioItem_Stage] FOREIGN KEY([StageId])
REFERENCES [dbo].[Stage] ([Id])
GO
ALTER TABLE [dbo].[PortfolioItem] CHECK CONSTRAINT [FK_PorftolioItem_Stage]
GO
ALTER TABLE [dbo].[PortfolioItem]  WITH CHECK ADD  CONSTRAINT [FK_PorftolioItem_Stage1] FOREIGN KEY([NextMoveId])
REFERENCES [dbo].[Stage] ([Id])
GO
ALTER TABLE [dbo].[PortfolioItem] CHECK CONSTRAINT [FK_PorftolioItem_Stage1]
GO
ALTER TABLE [dbo].[PortfolioItem]  WITH CHECK ADD  CONSTRAINT [FK_PorftolioItem_TCBasicInfo] FOREIGN KEY([TCid])
REFERENCES [dbo].[TCBasicInfo] ([Id])
GO
ALTER TABLE [dbo].[PortfolioItem] CHECK CONSTRAINT [FK_PorftolioItem_TCBasicInfo]
GO
ALTER TABLE [dbo].[PortfolioToPortfolioItem]  WITH CHECK ADD  CONSTRAINT [FK_PortfolioToPortfolioItem_Portfolio] FOREIGN KEY([PortfolioId])
REFERENCES [dbo].[Portfolio] ([Id])
GO
ALTER TABLE [dbo].[PortfolioToPortfolioItem] CHECK CONSTRAINT [FK_PortfolioToPortfolioItem_Portfolio]
GO
ALTER TABLE [dbo].[PortfolioToPortfolioItem]  WITH CHECK ADD  CONSTRAINT [FK_PortfolioToPortfolioItem_PortfolioItem] FOREIGN KEY([PortfolioItemId])
REFERENCES [dbo].[PortfolioItem] ([Id])
GO
ALTER TABLE [dbo].[PortfolioToPortfolioItem] CHECK CONSTRAINT [FK_PortfolioToPortfolioItem_PortfolioItem]
GO
ALTER TABLE [dbo].[ProductToTC]  WITH CHECK ADD  CONSTRAINT [FK_ProductToTC_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductToTC] CHECK CONSTRAINT [FK_ProductToTC_Product]
GO
ALTER TABLE [dbo].[ProductToTC]  WITH CHECK ADD  CONSTRAINT [FK_ProductToTC_TCBasicInfo] FOREIGN KEY([TCid])
REFERENCES [dbo].[TCBasicInfo] ([Id])
GO
ALTER TABLE [dbo].[ProductToTC] CHECK CONSTRAINT [FK_ProductToTC_TCBasicInfo]
GO
ALTER TABLE [dbo].[ServicesToTC]  WITH CHECK ADD  CONSTRAINT [FK_ServicesToTC_Services] FOREIGN KEY([ServicesId])
REFERENCES [dbo].[Services] ([Id])
GO
ALTER TABLE [dbo].[ServicesToTC] CHECK CONSTRAINT [FK_ServicesToTC_Services]
GO
ALTER TABLE [dbo].[ServicesToTC]  WITH CHECK ADD  CONSTRAINT [FK_ServicesToTC_TCBasicInfo] FOREIGN KEY([TCid])
REFERENCES [dbo].[TCBasicInfo] ([Id])
GO
ALTER TABLE [dbo].[ServicesToTC] CHECK CONSTRAINT [FK_ServicesToTC_TCBasicInfo]
GO
ALTER TABLE [dbo].[TCActive]  WITH CHECK ADD  CONSTRAINT [FK_TCActive_TCBasicInfo] FOREIGN KEY([TCid])
REFERENCES [dbo].[TCBasicInfo] ([Id])
GO
ALTER TABLE [dbo].[TCActive] CHECK CONSTRAINT [FK_TCActive_TCBasicInfo]
GO
ALTER TABLE [dbo].[TCAdmin]  WITH CHECK ADD  CONSTRAINT [FK_TCAdmin_AccountManager] FOREIGN KEY([InnosixAccountManagerId])
REFERENCES [dbo].[AccountManager] ([Id])
GO
ALTER TABLE [dbo].[TCAdmin] CHECK CONSTRAINT [FK_TCAdmin_AccountManager]
GO
ALTER TABLE [dbo].[TCAdmin]  WITH CHECK ADD  CONSTRAINT [FK_TCAdmin_Cluster] FOREIGN KEY([ClusterRelationId])
REFERENCES [dbo].[Cluster] ([Id])
GO
ALTER TABLE [dbo].[TCAdmin] CHECK CONSTRAINT [FK_TCAdmin_Cluster]
GO
ALTER TABLE [dbo].[TCAdmin]  WITH CHECK ADD  CONSTRAINT [FK_TCAdmin_TCBasicInfo] FOREIGN KEY([TCid])
REFERENCES [dbo].[TCBasicInfo] ([Id])
GO
ALTER TABLE [dbo].[TCAdmin] CHECK CONSTRAINT [FK_TCAdmin_TCBasicInfo]
GO
ALTER TABLE [dbo].[TCBasicInfo]  WITH CHECK ADD  CONSTRAINT [FK_TCBasicInfo_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[TCBasicInfo] CHECK CONSTRAINT [FK_TCBasicInfo_Country]
GO
ALTER TABLE [dbo].[TCBusinessInfo]  WITH CHECK ADD  CONSTRAINT [FK_TCBusinessInfo_Employees] FOREIGN KEY([FullTimeEmployeesId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[TCBusinessInfo] CHECK CONSTRAINT [FK_TCBusinessInfo_Employees]
GO
ALTER TABLE [dbo].[TCBusinessInfo]  WITH CHECK ADD  CONSTRAINT [FK_TCBusinessInfo_Maturity] FOREIGN KEY([MaturityStageId])
REFERENCES [dbo].[Maturity] ([Id])
GO
ALTER TABLE [dbo].[TCBusinessInfo] CHECK CONSTRAINT [FK_TCBusinessInfo_Maturity]
GO
ALTER TABLE [dbo].[TCBusinessInfo]  WITH CHECK ADD  CONSTRAINT [FK_TCBusinessInfo_Nace] FOREIGN KEY([NaceCodeId])
REFERENCES [dbo].[Nace] ([Id])
GO
ALTER TABLE [dbo].[TCBusinessInfo] CHECK CONSTRAINT [FK_TCBusinessInfo_Nace]
GO
ALTER TABLE [dbo].[TCBusinessInfo]  WITH CHECK ADD  CONSTRAINT [FK_TCBusinessInfo_Revenue] FOREIGN KEY([RevenueId])
REFERENCES [dbo].[Revenue] ([Id])
GO
ALTER TABLE [dbo].[TCBusinessInfo] CHECK CONSTRAINT [FK_TCBusinessInfo_Revenue]
GO
ALTER TABLE [dbo].[TCBusinessInfo]  WITH CHECK ADD  CONSTRAINT [FK_TCBusinessInfo_TCBasicInfo] FOREIGN KEY([TCid])
REFERENCES [dbo].[TCBasicInfo] ([Id])
GO
ALTER TABLE [dbo].[TCBusinessInfo] CHECK CONSTRAINT [FK_TCBusinessInfo_TCBasicInfo]
GO
ALTER TABLE [dbo].[TCContact]  WITH CHECK ADD  CONSTRAINT [FK_TCContact_TCBasicInfo] FOREIGN KEY([TCid])
REFERENCES [dbo].[TCBasicInfo] ([Id])
GO
ALTER TABLE [dbo].[TCContact] CHECK CONSTRAINT [FK_TCContact_TCBasicInfo]
GO
ALTER TABLE [dbo].[TCGeneral]  WITH CHECK ADD  CONSTRAINT [FK_TCGeneral_TCBasicInfo] FOREIGN KEY([TCid])
REFERENCES [dbo].[TCBasicInfo] ([Id])
GO
ALTER TABLE [dbo].[TCGeneral] CHECK CONSTRAINT [FK_TCGeneral_TCBasicInfo]
GO
ALTER TABLE [dbo].[TCIdealPartner]  WITH CHECK ADD  CONSTRAINT [FK_TCIdealPartner_TCBasicInfo] FOREIGN KEY([TCid])
REFERENCES [dbo].[TCBasicInfo] ([Id])
GO
ALTER TABLE [dbo].[TCIdealPartner] CHECK CONSTRAINT [FK_TCIdealPartner_TCBasicInfo]
GO
ALTER TABLE [dbo].[TCRating]  WITH CHECK ADD  CONSTRAINT [FK_TCRating_TCBasicInfo] FOREIGN KEY([TCid])
REFERENCES [dbo].[TCBasicInfo] ([Id])
GO
ALTER TABLE [dbo].[TCRating] CHECK CONSTRAINT [FK_TCRating_TCBasicInfo]
GO
ALTER TABLE [dbo].[TCTechnology]  WITH CHECK ADD  CONSTRAINT [FK_TCTechnology_TCBasicInfo] FOREIGN KEY([TCid])
REFERENCES [dbo].[TCBasicInfo] ([Id])
GO
ALTER TABLE [dbo].[TCTechnology] CHECK CONSTRAINT [FK_TCTechnology_TCBasicInfo]
GO
ALTER TABLE [dbo].[TCTechnology]  WITH CHECK ADD  CONSTRAINT [FK_TCTechnology_TechSector] FOREIGN KEY([TechnologySectorId])
REFERENCES [dbo].[TechSector] ([Id])
GO
ALTER TABLE [dbo].[TCTechnology] CHECK CONSTRAINT [FK_TCTechnology_TechSector]
GO
ALTER TABLE [dbo].[TechDomainToTC]  WITH CHECK ADD  CONSTRAINT [FK_TechDomainToTC_TCBasicInfo] FOREIGN KEY([TCid])
REFERENCES [dbo].[TCBasicInfo] ([Id])
GO
ALTER TABLE [dbo].[TechDomainToTC] CHECK CONSTRAINT [FK_TechDomainToTC_TCBasicInfo]
GO
ALTER TABLE [dbo].[TechDomainToTC]  WITH CHECK ADD  CONSTRAINT [FK_TechDomainToTC_TechDomain] FOREIGN KEY([TechDomainId])
REFERENCES [dbo].[TechDomain] ([Id])
GO
ALTER TABLE [dbo].[TechDomainToTC] CHECK CONSTRAINT [FK_TechDomainToTC_TechDomain]
GO
ALTER TABLE [dbo].[TechTagParents]  WITH CHECK ADD  CONSTRAINT [FK_TechTagParents_TechTag] FOREIGN KEY([TechTagId])
REFERENCES [dbo].[TechTag] ([Id])
GO
ALTER TABLE [dbo].[TechTagParents] CHECK CONSTRAINT [FK_TechTagParents_TechTag]
GO
ALTER TABLE [dbo].[TechTagParents]  WITH CHECK ADD  CONSTRAINT [FK_TechTagParents_TechTag_Parent] FOREIGN KEY([ParentTechTagId])
REFERENCES [dbo].[TechTag] ([Id])
GO
ALTER TABLE [dbo].[TechTagParents] CHECK CONSTRAINT [FK_TechTagParents_TechTag_Parent]
GO
ALTER TABLE [dbo].[TechTagToTC]  WITH CHECK ADD  CONSTRAINT [FK_TechTagToTC_TCBasicInfo] FOREIGN KEY([TCid])
REFERENCES [dbo].[TCBasicInfo] ([Id])
GO
ALTER TABLE [dbo].[TechTagToTC] CHECK CONSTRAINT [FK_TechTagToTC_TCBasicInfo]
GO
ALTER TABLE [dbo].[TechTagToTC]  WITH CHECK ADD  CONSTRAINT [FK_TechTagToTC_TechTag] FOREIGN KEY([TechTagId])
REFERENCES [dbo].[TechTag] ([Id])
GO
ALTER TABLE [dbo].[TechTagToTC] CHECK CONSTRAINT [FK_TechTagToTC_TechTag]
GO
/****** Object:  StoredProcedure [dbo].[GetAdditionalTechTags]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAdditionalTechTags]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TCid,
	LTRIM(RTRIM(m.n.value('.[1]','varchar(200)'))) AS AdditionalTechTags
	FROM
	(
	SELECT TCid,CAST('<XMLRoot><RowData>' + REPLACE(AdditionalTechTags,',','</RowData><RowData>') + '</RowData></XMLRoot>' AS XML) AS x
	FROM [dbo].[TCTechnology]
	WHERE AdditionalTechTags <> ''
	)t
	CROSS APPLY x.nodes('/XMLRoot/RowData')m(n)
END


GO
/****** Object:  StoredProcedure [dbo].[GetTagHierarchy]    Script Date: 10.01.2018 16:20:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTagHierarchy]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	  with cteRel as 
	(
	select t.Id [TagId], cast('/' + cast(t.Id as varchar(max)) as varchar(max)) [Node], 0 [Level]
	from TechTag t
	where not exists
	(
	select * from TechTagParents th where t.Id = th.TechTagId
	)
	union all 
	select t.Id [TagId],  cast(r.Node + '/'+ cast(t.id as varchar(max)) as varchar(max)) [Node] , r.[Level] + 1 [Level]
	from Techtag t
	join TechTagParents th on t.Id = th.TechTagId
	join cteRel r
	on th.ParentTechTagId = r.TagId
	)
	select [TagId], [Node], [Level] from cteRel
END

GO
