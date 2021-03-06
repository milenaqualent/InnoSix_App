USE [Innosix]
GO
/****** Object:  StoredProcedure [dbo].[GetTagHierarchy]    Script Date: 08.01.2018 16:09:03 ******/
DROP PROCEDURE [dbo].[GetTagHierarchy]
GO
/****** Object:  StoredProcedure [dbo].[GetAdditionalTechTags]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  View [dbo].[VUserTcClaim]    Script Date: 08.01.2018 16:09:03 ******/
DROP VIEW [dbo].[VUserTcClaim]
GO
/****** Object:  View [dbo].[VTcWithTags]    Script Date: 08.01.2018 16:09:03 ******/
DROP VIEW [dbo].[VTcWithTags]
GO
/****** Object:  View [dbo].[VTcClaim]    Script Date: 08.01.2018 16:09:03 ******/
DROP VIEW [dbo].[VTcClaim]
GO
/****** Object:  Table [dbo].[TechTagToTC]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[TechTagToTC]
GO
/****** Object:  Table [dbo].[TechTagParents]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[TechTagParents]
GO
/****** Object:  Table [dbo].[TechTagDeclined]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[TechTagDeclined]
GO
/****** Object:  Table [dbo].[TechTag]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[TechTag]
GO
/****** Object:  Table [dbo].[TechSector]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[TechSector]
GO
/****** Object:  Table [dbo].[TechDomainToTC]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[TechDomainToTC]
GO
/****** Object:  Table [dbo].[TechDomain]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[TechDomain]
GO
/****** Object:  Table [dbo].[TCTechnology]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[TCTechnology]
GO
/****** Object:  Table [dbo].[TCRating]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[TCRating]
GO
/****** Object:  Table [dbo].[TCIdealPartner]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[TCIdealPartner]
GO
/****** Object:  Table [dbo].[TCGeneral]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[TCGeneral]
GO
/****** Object:  Table [dbo].[TCContact]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[TCContact]
GO
/****** Object:  Table [dbo].[TCBusinessInfo]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[TCBusinessInfo]
GO
/****** Object:  Table [dbo].[TCBasicInfo]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[TCBasicInfo]
GO
/****** Object:  Table [dbo].[TCAdmin]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[TCAdmin]
GO
/****** Object:  Table [dbo].[TCActive]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[TCActive]
GO
/****** Object:  Table [dbo].[Stage]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[Stage]
GO
/****** Object:  Table [dbo].[ServicesToTC]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[ServicesToTC]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[Services]
GO
/****** Object:  Table [dbo].[Revenue]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[Revenue]
GO
/****** Object:  Table [dbo].[ProductToTC]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[ProductToTC]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[Product]
GO
/****** Object:  Table [dbo].[PortfolioToPortfolioItem]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[PortfolioToPortfolioItem]
GO
/****** Object:  Table [dbo].[PortfolioItem]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[PortfolioItem]
GO
/****** Object:  Table [dbo].[Portfolio]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[Portfolio]
GO
/****** Object:  Table [dbo].[Nace]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[Nace]
GO
/****** Object:  Table [dbo].[Maturity]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[Maturity]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[Employees]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[Country]
GO
/****** Object:  Table [dbo].[Cluster]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[Cluster]
GO
/****** Object:  Table [dbo].[BusinessModelToTC]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[BusinessModelToTC]
GO
/****** Object:  Table [dbo].[BusinessModel]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[BusinessModel]
GO
/****** Object:  Table [dbo].[AspNetUsersToTC]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[AspNetUsersToTC]
GO
/****** Object:  Table [dbo].[AspNetUsersToPortfolio]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[AspNetUsersToPortfolio]
GO
/****** Object:  Table [dbo].[AspNetUsersTcClaim]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[AspNetUsersTcClaim]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[AccountManager]    Script Date: 08.01.2018 16:09:03 ******/
DROP TABLE [dbo].[AccountManager]
GO
/****** Object:  Table [dbo].[AccountManager]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[AspNetUsersTcClaim]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[AspNetUsersToPortfolio]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[AspNetUsersToTC]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[BusinessModel]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[BusinessModelToTC]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[Cluster]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[Country]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[Employees]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[Maturity]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[Nace]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[Portfolio]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[PortfolioItem]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[PortfolioToPortfolioItem]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[ProductToTC]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[Revenue]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[Services]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[ServicesToTC]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[Stage]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[TCActive]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[TCAdmin]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[TCBasicInfo]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[TCBusinessInfo]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[TCContact]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[TCGeneral]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[TCIdealPartner]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[TCRating]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[TCTechnology]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[TechDomain]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[TechDomainToTC]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[TechSector]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[TechTag]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[TechTagDeclined]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[TechTagParents]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  Table [dbo].[TechTagToTC]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  View [dbo].[VTcClaim]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  View [dbo].[VTcWithTags]    Script Date: 08.01.2018 16:09:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[VTcWithTags] AS
WITH TcWithTags (Id, CompanyName, City, Country, CompanyEmail, LegalSuffix, CompanyWebsite, TagName)											-- add more columns here
AS
(
	SELECT bi.Id, bi.CompanyName, bi.City, c.CountryName, bi.CompanyEmail, bi.LegalSuffix, bi.CompanyWebsite, t.TagName FROM dbo.TCBasicInfo bi	-- add more columns here
	INNER JOIN dbo.TechTagToTC tt ON bi.Id = tt.TCid
	INNER JOIN dbo.TechTag t ON tt.TechTagId = t.Id
	INNER JOIN dbo.TCActive ta ON bi.Id = ta.TCid
	INNER JOIN dbo.Country c ON bi.CountryId = c.Id
	WHERE ta.IsActive = 1
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
/****** Object:  View [dbo].[VUserTcClaim]    Script Date: 08.01.2018 16:09:03 ******/
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
SET IDENTITY_INSERT [dbo].[AccountManager] ON 

INSERT [dbo].[AccountManager] ([Id], [AccountManagerName], [Description]) VALUES (1, N'Manager1', NULL)
INSERT [dbo].[AccountManager] ([Id], [AccountManagerName], [Description]) VALUES (2, N'Manager2', NULL)
INSERT [dbo].[AccountManager] ([Id], [AccountManagerName], [Description]) VALUES (3, N'Manager3', NULL)
SET IDENTITY_INSERT [dbo].[AccountManager] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'66781278-cff1-4701-a5dd-58297e8255a2', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'20b5d9ab-10e5-47ca-8468-fa7bd30800dc', N'TC')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'cbf6b686-ee56-4e8c-b346-b42a89064eb1', N'User')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0d7d5ce5-b6b7-4a04-bea8-86c28c9a0fe5', N'20b5d9ab-10e5-47ca-8468-fa7bd30800dc')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1e7ac434-0a01-4cc4-a680-207786cb673f', N'20b5d9ab-10e5-47ca-8468-fa7bd30800dc')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3de86ae3-bdbf-446b-8b2a-d8d266a357d7', N'20b5d9ab-10e5-47ca-8468-fa7bd30800dc')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4a4e8736-2c77-4c01-a1fe-27ffda45bdb0', N'20b5d9ab-10e5-47ca-8468-fa7bd30800dc')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7b5adcf5-8a56-4285-a5af-152f25483fb0', N'20b5d9ab-10e5-47ca-8468-fa7bd30800dc')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2af02e24-5996-46fc-bdf0-ce4fe03a955f', N'66781278-cff1-4701-a5dd-58297e8255a2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'12b28a45-99ab-4792-93e6-aa4e921d0cdf', N'cbf6b686-ee56-4e8c-b346-b42a89064eb1')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0d7d5ce5-b6b7-4a04-bea8-86c28c9a0fe5', N'test4@test.test', 1, N'APnyEqGmaOaJHlXhFVBQpyGvFRfssI8xDUAF750TDlhrP6Db0XnkGBIFbAI3W0E8ww==', N'9086d211-d2d4-48b2-8cc5-90c0b2319997', NULL, 0, 0, NULL, 1, 0, N'test4@test.test')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'12b28a45-99ab-4792-93e6-aa4e921d0cdf', N'User@test.test', 1, N'APLCWm5UUwKYdJcchAOUK8d5N42lBaLXgIHWiCaxGaw5FKXOcDG+O6RoRBf2H0BtTg==', N'19f2bd3c-1b46-4cd4-b7a8-13d25c8ff481', NULL, 0, 0, NULL, 0, 0, N'User@test.test')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1e7ac434-0a01-4cc4-a680-207786cb673f', N'TC@test.test', 1, N'AFLx9nYnhmBFPDZETQRwesVn9wTYEU1JPUwHJ0KjrHzEErNnCZTA9IoE0xiMmvhFxA==', N'4954c557-7e0f-453c-b5bb-67af772c2d50', NULL, 0, 0, NULL, 0, 0, N'TC@test.test')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2af02e24-5996-46fc-bdf0-ce4fe03a955f', N'Admin@test.test', 1, N'ANgfjEoitElfcqzsN2QnOXX3oowAFapbIwRDHJheEyIXuhXF56VgQd1Yk/VaCaNkCQ==', N'f3c9ebc0-8609-423d-b495-7a47c4520dc7', NULL, 0, 0, NULL, 0, 0, N'Admin@test.test')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3de86ae3-bdbf-446b-8b2a-d8d266a357d7', N'test3@test.test', 1, N'ALwVAp4A9t+1j8niCjSMBrKPjb4haFUiNWWm7NeI+NgcI+tBMXTrc3QwADbf+1Mrow==', N'41235c17-d899-43b4-af28-ad6a5297f12a', NULL, 0, 0, NULL, 1, 0, N'test3@test.test')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4a4e8736-2c77-4c01-a1fe-27ffda45bdb0', N'test@test.test', 1, N'AJOWEHG/I0aopHwvDSsNvR+Lem35xHK9fyUy12N52pXYGn9Iy++lwrgRp7VXJwgj/g==', N'7d6d9532-ccfc-46cb-995f-a4ac02eccf4c', NULL, 0, 0, NULL, 1, 0, N'test@test.test')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7b5adcf5-8a56-4285-a5af-152f25483fb0', N'test2@test.test', 1, N'ADjX5SvcyLKhQxpnVUAIvHucPAR4JBN92dH8cThET/eDP664aylJavEckkoDQdATog==', N'7c777c08-9131-438d-ab0d-adaef70238f6', NULL, 0, 0, NULL, 1, 0, N'test2@test.test')
SET IDENTITY_INSERT [dbo].[AspNetUsersToPortfolio] ON 

INSERT [dbo].[AspNetUsersToPortfolio] ([Id], [PortfolioId], [AspNetUserId]) VALUES (2, 2, N'12b28a45-99ab-4792-93e6-aa4e921d0cdf')
INSERT [dbo].[AspNetUsersToPortfolio] ([Id], [PortfolioId], [AspNetUserId]) VALUES (3, 3, N'12b28a45-99ab-4792-93e6-aa4e921d0cdf')
SET IDENTITY_INSERT [dbo].[AspNetUsersToPortfolio] OFF
SET IDENTITY_INSERT [dbo].[AspNetUsersToTC] ON 

INSERT [dbo].[AspNetUsersToTC] ([Id], [TCid], [AspNetUserId]) VALUES (1, 41, N'1e7ac434-0a01-4cc4-a680-207786cb673f')
INSERT [dbo].[AspNetUsersToTC] ([Id], [TCid], [AspNetUserId]) VALUES (14, 58, N'7b5adcf5-8a56-4285-a5af-152f25483fb0')
INSERT [dbo].[AspNetUsersToTC] ([Id], [TCid], [AspNetUserId]) VALUES (15, 59, N'3de86ae3-bdbf-446b-8b2a-d8d266a357d7')
SET IDENTITY_INSERT [dbo].[AspNetUsersToTC] OFF
SET IDENTITY_INSERT [dbo].[BusinessModel] ON 

INSERT [dbo].[BusinessModel] ([Id], [BusinessModelName], [Description]) VALUES (1, N'B2B', NULL)
INSERT [dbo].[BusinessModel] ([Id], [BusinessModelName], [Description]) VALUES (2, N'B2B2C', NULL)
INSERT [dbo].[BusinessModel] ([Id], [BusinessModelName], [Description]) VALUES (3, N'B2C', NULL)
INSERT [dbo].[BusinessModel] ([Id], [BusinessModelName], [Description]) VALUES (4, N'B2G', NULL)
SET IDENTITY_INSERT [dbo].[BusinessModel] OFF
SET IDENTITY_INSERT [dbo].[BusinessModelToTC] ON 

INSERT [dbo].[BusinessModelToTC] ([Id], [TCid], [BusinessModelId]) VALUES (1, 33, 1)
INSERT [dbo].[BusinessModelToTC] ([Id], [TCid], [BusinessModelId]) VALUES (2, 34, 1)
INSERT [dbo].[BusinessModelToTC] ([Id], [TCid], [BusinessModelId]) VALUES (3, 35, 3)
INSERT [dbo].[BusinessModelToTC] ([Id], [TCid], [BusinessModelId]) VALUES (4, 36, 1)
INSERT [dbo].[BusinessModelToTC] ([Id], [TCid], [BusinessModelId]) VALUES (5, 37, 1)
INSERT [dbo].[BusinessModelToTC] ([Id], [TCid], [BusinessModelId]) VALUES (6, 38, 3)
INSERT [dbo].[BusinessModelToTC] ([Id], [TCid], [BusinessModelId]) VALUES (7, 39, 1)
INSERT [dbo].[BusinessModelToTC] ([Id], [TCid], [BusinessModelId]) VALUES (8, 40, 1)
INSERT [dbo].[BusinessModelToTC] ([Id], [TCid], [BusinessModelId]) VALUES (9, 41, 3)
INSERT [dbo].[BusinessModelToTC] ([Id], [TCid], [BusinessModelId]) VALUES (10, 42, 1)
INSERT [dbo].[BusinessModelToTC] ([Id], [TCid], [BusinessModelId]) VALUES (11, 43, 1)
INSERT [dbo].[BusinessModelToTC] ([Id], [TCid], [BusinessModelId]) VALUES (12, 44, 3)
INSERT [dbo].[BusinessModelToTC] ([Id], [TCid], [BusinessModelId]) VALUES (13, 45, 1)
INSERT [dbo].[BusinessModelToTC] ([Id], [TCid], [BusinessModelId]) VALUES (14, 46, 1)
INSERT [dbo].[BusinessModelToTC] ([Id], [TCid], [BusinessModelId]) VALUES (15, 47, 3)
SET IDENTITY_INSERT [dbo].[BusinessModelToTC] OFF
SET IDENTITY_INSERT [dbo].[Cluster] ON 

INSERT [dbo].[Cluster] ([Id], [ClusterName], [Description]) VALUES (2, N'Cluster1', NULL)
INSERT [dbo].[Cluster] ([Id], [ClusterName], [Description]) VALUES (3, N'Cluster2', NULL)
SET IDENTITY_INSERT [dbo].[Cluster] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (1, N'Argentina')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (2, N'Australia')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (3, N'Austria')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (4, N'Belgium')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (5, N'Brazil')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (6, N'Canada')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (7, N'Croatia')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (8, N'Czech Republic')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (9, N'Denmark')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (10, N'Deutschland')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (11, N'England')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (12, N'Estonia')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (13, N'Europe')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (14, N'Finland')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (15, N'France')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (16, N'Frankfurt')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (17, N'Germany')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (18, N'Guangdong')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (19, N'Hempstead')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (20, N'Iceland')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (21, N'India')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (22, N'Ireland')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (23, N'Israel')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (24, N'Italia')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (25, N'Italy')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (26, N'Lithuania')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (27, N'London')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (28, N'Lund')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (29, N'Luxembourg')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (30, N'Malaysia')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (31, N'Mumbai')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (32, N'Netherlands')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (33, N'New York')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (34, N'Nigeria')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (35, N'Nordrhein-Westfalen')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (36, N'Norway')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (37, N'Poland')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (38, N'Russia')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (39, N'Russian Federation')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (40, N'San Francisco')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (41, N'Scotland United Kingdom')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (42, N'Singapore')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (43, N'Sogndal')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (44, N'South Africa')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (45, N'Spain')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (46, N'Sweden')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (47, N'Switzerland')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (48, N'Texas')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (49, N'UK')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (50, N'United Kingdom')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (51, N'United States')
INSERT [dbo].[Country] ([Id], [CountryName]) VALUES (52, N'USA')
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [EmployeeTypeName], [Description]) VALUES (1, N'1-2 FTE
', NULL)
INSERT [dbo].[Employees] ([Id], [EmployeeTypeName], [Description]) VALUES (2, N'3-5 FTE
', NULL)
INSERT [dbo].[Employees] ([Id], [EmployeeTypeName], [Description]) VALUES (3, N'6-10 FTE
', NULL)
INSERT [dbo].[Employees] ([Id], [EmployeeTypeName], [Description]) VALUES (4, N'11-20 FTE
', NULL)
INSERT [dbo].[Employees] ([Id], [EmployeeTypeName], [Description]) VALUES (5, N'21-50 FTE
', NULL)
INSERT [dbo].[Employees] ([Id], [EmployeeTypeName], [Description]) VALUES (6, N'51-100 FTE
', NULL)
INSERT [dbo].[Employees] ([Id], [EmployeeTypeName], [Description]) VALUES (7, N'101 -250 FTE
', NULL)
INSERT [dbo].[Employees] ([Id], [EmployeeTypeName], [Description]) VALUES (8, N'> 250 FTE
', NULL)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Maturity] ON 

INSERT [dbo].[Maturity] ([Id], [MaturityStageName], [Description]) VALUES (1, N'Start-up
', NULL)
INSERT [dbo].[Maturity] ([Id], [MaturityStageName], [Description]) VALUES (2, N'Pre-revenue
', NULL)
INSERT [dbo].[Maturity] ([Id], [MaturityStageName], [Description]) VALUES (3, N'Growth
', NULL)
SET IDENTITY_INSERT [dbo].[Maturity] OFF
SET IDENTITY_INSERT [dbo].[Nace] ON 

INSERT [dbo].[Nace] ([Id], [NACEcode]) VALUES (1, N'A - Agriculture, forestry and fishing')
SET IDENTITY_INSERT [dbo].[Nace] OFF
SET IDENTITY_INSERT [dbo].[Portfolio] ON 

INSERT [dbo].[Portfolio] ([Id], [Name], [NrOfTCs]) VALUES (2, N'Portfolio1', 0)
INSERT [dbo].[Portfolio] ([Id], [Name], [NrOfTCs]) VALUES (3, N'Portfolio2', 0)
INSERT [dbo].[Portfolio] ([Id], [Name], [NrOfTCs]) VALUES (32, N'Portfolio3', 0)
SET IDENTITY_INSERT [dbo].[Portfolio] OFF
SET IDENTITY_INSERT [dbo].[PortfolioItem] ON 

INSERT [dbo].[PortfolioItem] ([Id], [TCid], [StageId], [NextMoveId], [NextMoveDate], [ResponsibleEmail], [ResponsibleName], [OpportunityDate], [Comment]) VALUES (2, 41, 4, 6, CAST(N'2017-11-28' AS Date), N'test1', N'test2', NULL, N'test3')
INSERT [dbo].[PortfolioItem] ([Id], [TCid], [StageId], [NextMoveId], [NextMoveDate], [ResponsibleEmail], [ResponsibleName], [OpportunityDate], [Comment]) VALUES (11, 40, 4, 6, CAST(N'2017-11-28' AS Date), N'test1', N'test2', NULL, N'test3')
INSERT [dbo].[PortfolioItem] ([Id], [TCid], [StageId], [NextMoveId], [NextMoveDate], [ResponsibleEmail], [ResponsibleName], [OpportunityDate], [Comment]) VALUES (14, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[PortfolioItem] ([Id], [TCid], [StageId], [NextMoveId], [NextMoveDate], [ResponsibleEmail], [ResponsibleName], [OpportunityDate], [Comment]) VALUES (15, 24, NULL, NULL, NULL, NULL, NULL, CAST(N'2017-12-15' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[PortfolioItem] OFF
SET IDENTITY_INSERT [dbo].[PortfolioToPortfolioItem] ON 

INSERT [dbo].[PortfolioToPortfolioItem] ([Id], [PortfolioId], [PortfolioItemId]) VALUES (1, 2, 2)
INSERT [dbo].[PortfolioToPortfolioItem] ([Id], [PortfolioId], [PortfolioItemId]) VALUES (3, 3, 2)
INSERT [dbo].[PortfolioToPortfolioItem] ([Id], [PortfolioId], [PortfolioItemId]) VALUES (32, 2, 11)
INSERT [dbo].[PortfolioToPortfolioItem] ([Id], [PortfolioId], [PortfolioItemId]) VALUES (35, 3, 14)
INSERT [dbo].[PortfolioToPortfolioItem] ([Id], [PortfolioId], [PortfolioItemId]) VALUES (41, 32, 15)
SET IDENTITY_INSERT [dbo].[PortfolioToPortfolioItem] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (1, N'Lightaccess', N'Protect your personal space behind the comfort of a 21st-century lock. Our affordable product allows easy management for the whole family while providing the peace of mind that your home is secure. Entertaining in-laws this weekend? send them a digital key before they arrive. Key distribution and around-the-clock monitoring is only a few taps away.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (2, N'Lightaccess Pro', N'Our locks can be retrofitted to any door (european or american), and our system can be integrated with any pre-existing system using our signature control module or using our standard lock module. The versatile protocols supported by the access module allow for a smooth transition for your entire organization. And of course, our product comes with easy distribution and around-the-clock monitoring software.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (3, N'Lightcommand', N'Our lightcommand system allows administrators and common users alike to easily issue, revoke, and manage access to their doors. It showcases a flexible and intuitive interface to provide an at-a-glance overview of access as well as a simple, efficient experience for managing passes.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (4, N'Standard Products', N'We have a range of profiles in stock which we can supply directly from stock. To create your custom made profile we like to support you during the design and prototyping.', N'https://static.wixstatic.com/media/7247b8_6d50503723478d9712f145c92632a528.jpg/v1/fill/w_330,h_230,al_c,q_80,usm_0.66_1.00_0.01/7247b8_6d50503723478d9712f145c92632a528.webp')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (5, N'Resins', N'Different types of resin to meet your requirements in, for example, mechanical properties and chemical resistance.', N'https://static.wixstatic.com/media/7247b8_5c88cfd9c0990b464f2da6f11e07c431.png/v1/fill/w_330,h_240,al_c,usm_0.66_1.00_0.01/7247b8_5c88cfd9c0990b464f2da6f11e07c431.png')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (6, N'Fibers / Reinforcements', N'To reinforce our profiles we use the next fibers. These fibers make sure that you get the high mechanical properties as requested', N'https://static.wixstatic.com/media/7247b8_246d74a4b3fa96666b63498f6c328461.png/v1/fill/w_330,h_230,al_c,usm_0.66_1.00_0.01/7247b8_246d74a4b3fa96666b63498f6c328461.png')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (7, N'Banks', N'360t is an ideal solution for banks as a market maker and market taker, allowing them to act as both – market maker and market taker. Banks therefore look for technology that allows them to position themselves flexibly as electronic rate providers across different asset classes, products or currencies.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (8, N'Broker / Dealers', N'360t has developed a state-of-the-art broker administration tool which allows straight credit account trading, prime brokerage and margin account dealing.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (9, N'Corporate Treasuries', N'360t serves the needs of corporate treasurers by providing a link to broad liquidity from more than 200 liquidity providers – including large global players as well as regional and niche makers around the world.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (10, N'Lightaccess', N'Protect your personal space behind the comfort of a 21st-century lock. Our affordable product allows easy management for the whole family while providing the peace of mind that your home is secure. Entertaining in-laws this weekend? send them a digital key before they arrive. Key distribution and around-the-clock monitoring is only a few taps away.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (11, N'Lightaccess Pro', N'Our locks can be retrofitted to any door (european or american), and our system can be integrated with any pre-existing system using our signature control module or using our standard lock module. The versatile protocols supported by the access module allow for a smooth transition for your entire organization. And of course, our product comes with easy distribution and around-the-clock monitoring software.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (12, N'Lightcommand', N'Our lightcommand system allows administrators and common users alike to easily issue, revoke, and manage access to their doors. It showcases a flexible and intuitive interface to provide an at-a-glance overview of access as well as a simple, efficient experience for managing passes.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (13, N'Standard Products', N'We have a range of profiles in stock which we can supply directly from stock. To create your custom made profile we like to support you during the design and prototyping.', N'https://static.wixstatic.com/media/7247b8_6d50503723478d9712f145c92632a528.jpg/v1/fill/w_330,h_230,al_c,q_80,usm_0.66_1.00_0.01/7247b8_6d50503723478d9712f145c92632a528.webp')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (14, N'Resins', N'Different types of resin to meet your requirements in, for example, mechanical properties and chemical resistance.', N'https://static.wixstatic.com/media/7247b8_5c88cfd9c0990b464f2da6f11e07c431.png/v1/fill/w_330,h_240,al_c,usm_0.66_1.00_0.01/7247b8_5c88cfd9c0990b464f2da6f11e07c431.png')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (15, N'Fibers / Reinforcements', N'To reinforce our profiles we use the next fibers. These fibers make sure that you get the high mechanical properties as requested', N'https://static.wixstatic.com/media/7247b8_246d74a4b3fa96666b63498f6c328461.png/v1/fill/w_330,h_230,al_c,usm_0.66_1.00_0.01/7247b8_246d74a4b3fa96666b63498f6c328461.png')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (16, N'Banks', N'360t is an ideal solution for banks as a market maker and market taker, allowing them to act as both – market maker and market taker. Banks therefore look for technology that allows them to position themselves flexibly as electronic rate providers across different asset classes, products or currencies.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (17, N'Broker / Dealers', N'360t has developed a state-of-the-art broker administration tool which allows straight credit account trading, prime brokerage and margin account dealing.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (18, N'Corporate Treasuries', N'360t serves the needs of corporate treasurers by providing a link to broad liquidity from more than 200 liquidity providers – including large global players as well as regional and niche makers around the world.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (19, N'Lightaccess', N'Protect your personal space behind the comfort of a 21st-century lock. Our affordable product allows easy management for the whole family while providing the peace of mind that your home is secure. Entertaining in-laws this weekend? send them a digital key before they arrive. Key distribution and around-the-clock monitoring is only a few taps away.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (20, N'Lightaccess Pro', N'Our locks can be retrofitted to any door (european or american), and our system can be integrated with any pre-existing system using our signature control module or using our standard lock module. The versatile protocols supported by the access module allow for a smooth transition for your entire organization. And of course, our product comes with easy distribution and around-the-clock monitoring software.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (21, N'Lightcommand', N'Our lightcommand system allows administrators and common users alike to easily issue, revoke, and manage access to their doors. It showcases a flexible and intuitive interface to provide an at-a-glance overview of access as well as a simple, efficient experience for managing passes.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (22, N'Standard Products', N'We have a range of profiles in stock which we can supply directly from stock. To create your custom made profile we like to support you during the design and prototyping.', N'https://static.wixstatic.com/media/7247b8_6d50503723478d9712f145c92632a528.jpg/v1/fill/w_330,h_230,al_c,q_80,usm_0.66_1.00_0.01/7247b8_6d50503723478d9712f145c92632a528.webp')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (23, N'Resins', N'Different types of resin to meet your requirements in, for example, mechanical properties and chemical resistance.', N'https://static.wixstatic.com/media/7247b8_5c88cfd9c0990b464f2da6f11e07c431.png/v1/fill/w_330,h_240,al_c,usm_0.66_1.00_0.01/7247b8_5c88cfd9c0990b464f2da6f11e07c431.png')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (24, N'Fibers / Reinforcements', N'To reinforce our profiles we use the next fibers. These fibers make sure that you get the high mechanical properties as requested', N'https://static.wixstatic.com/media/7247b8_246d74a4b3fa96666b63498f6c328461.png/v1/fill/w_330,h_230,al_c,usm_0.66_1.00_0.01/7247b8_246d74a4b3fa96666b63498f6c328461.png')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (25, N'Banks', N'360t is an ideal solution for banks as a market maker and market taker, allowing them to act as both – market maker and market taker. Banks therefore look for technology that allows them to position themselves flexibly as electronic rate providers across different asset classes, products or currencies.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (26, N'Broker / Dealers', N'360t has developed a state-of-the-art broker administration tool which allows straight credit account trading, prime brokerage and margin account dealing.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (27, N'Corporate Treasuries', N'360t serves the needs of corporate treasurers by providing a link to broad liquidity from more than 200 liquidity providers – including large global players as well as regional and niche makers around the world.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (28, N'Lightaccess', N'Protect your personal space behind the comfort of a 21st-century lock. Our affordable product allows easy management for the whole family while providing the peace of mind that your home is secure. Entertaining in-laws this weekend? send them a digital key before they arrive. Key distribution and around-the-clock monitoring is only a few taps away.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (29, N'Lightaccess Pro', N'Our locks can be retrofitted to any door (european or american), and our system can be integrated with any pre-existing system using our signature control module or using our standard lock module. The versatile protocols supported by the access module allow for a smooth transition for your entire organization. And of course, our product comes with easy distribution and around-the-clock monitoring software.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (30, N'Lightcommand', N'Our lightcommand system allows administrators and common users alike to easily issue, revoke, and manage access to their doors. It showcases a flexible and intuitive interface to provide an at-a-glance overview of access as well as a simple, efficient experience for managing passes.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (31, N'Standard Products', N'We have a range of profiles in stock which we can supply directly from stock. To create your custom made profile we like to support you during the design and prototyping.', N'https://static.wixstatic.com/media/7247b8_6d50503723478d9712f145c92632a528.jpg/v1/fill/w_330,h_230,al_c,q_80,usm_0.66_1.00_0.01/7247b8_6d50503723478d9712f145c92632a528.webp')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (32, N'Resins', N'Different types of resin to meet your requirements in, for example, mechanical properties and chemical resistance.', N'https://static.wixstatic.com/media/7247b8_5c88cfd9c0990b464f2da6f11e07c431.png/v1/fill/w_330,h_240,al_c,usm_0.66_1.00_0.01/7247b8_5c88cfd9c0990b464f2da6f11e07c431.png')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (33, N'Fibers / Reinforcements', N'To reinforce our profiles we use the next fibers. These fibers make sure that you get the high mechanical properties as requested', N'https://static.wixstatic.com/media/7247b8_246d74a4b3fa96666b63498f6c328461.png/v1/fill/w_330,h_230,al_c,usm_0.66_1.00_0.01/7247b8_246d74a4b3fa96666b63498f6c328461.png')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (34, N'Banks', N'360t is an ideal solution for banks as a market maker and market taker, allowing them to act as both – market maker and market taker. Banks therefore look for technology that allows them to position themselves flexibly as electronic rate providers across different asset classes, products or currencies.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (35, N'Broker / Dealers', N'360t has developed a state-of-the-art broker administration tool which allows straight credit account trading, prime brokerage and margin account dealing.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (36, N'Corporate Treasuries', N'360t serves the needs of corporate treasurers by providing a link to broad liquidity from more than 200 liquidity providers – including large global players as well as regional and niche makers around the world.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (37, N'Lightaccess', N'Protect your personal space behind the comfort of a 21st-century lock. Our affordable product allows easy management for the whole family while providing the peace of mind that your home is secure. Entertaining in-laws this weekend? send them a digital key before they arrive. Key distribution and around-the-clock monitoring is only a few taps away.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (38, N'Lightaccess Pro', N'Our locks can be retrofitted to any door (european or american), and our system can be integrated with any pre-existing system using our signature control module or using our standard lock module. The versatile protocols supported by the access module allow for a smooth transition for your entire organization. And of course, our product comes with easy distribution and around-the-clock monitoring software.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (39, N'Lightcommand', N'Our lightcommand system allows administrators and common users alike to easily issue, revoke, and manage access to their doors. It showcases a flexible and intuitive interface to provide an at-a-glance overview of access as well as a simple, efficient experience for managing passes.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (40, N'Standard Products', N'We have a range of profiles in stock which we can supply directly from stock. To create your custom made profile we like to support you during the design and prototyping.', N'https://static.wixstatic.com/media/7247b8_6d50503723478d9712f145c92632a528.jpg/v1/fill/w_330,h_230,al_c,q_80,usm_0.66_1.00_0.01/7247b8_6d50503723478d9712f145c92632a528.webp')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (41, N'Resins', N'Different types of resin to meet your requirements in, for example, mechanical properties and chemical resistance.', N'https://static.wixstatic.com/media/7247b8_5c88cfd9c0990b464f2da6f11e07c431.png/v1/fill/w_330,h_240,al_c,usm_0.66_1.00_0.01/7247b8_5c88cfd9c0990b464f2da6f11e07c431.png')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (42, N'Fibers / Reinforcements', N'To reinforce our profiles we use the next fibers. These fibers make sure that you get the high mechanical properties as requested', N'https://static.wixstatic.com/media/7247b8_246d74a4b3fa96666b63498f6c328461.png/v1/fill/w_330,h_230,al_c,usm_0.66_1.00_0.01/7247b8_246d74a4b3fa96666b63498f6c328461.png')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (43, N'Banks', N'360t is an ideal solution for banks as a market maker and market taker, allowing them to act as both � market maker and market taker. Banks therefore look for technology that allows them to position themselves flexibly as electronic rate providers across different asset classes, products or currencies.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (44, N'Broker / Dealers', N'360t has developed a state-of-the-art broker administration tool which allows straight credit account trading, prime brokerage and margin account dealing.', N'')
INSERT [dbo].[Product] ([Id], [ProductName], [ProductDescription], [ProductImage]) VALUES (45, N'Corporate Treasuries', N'360t serves the needs of corporate treasurers by providing a link to broad liquidity from more than 200 liquidity providers � including large global players as well as regional and niche makers around the world.', N'')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductToTC] ON 

INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (1, 33, 1)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (2, 33, 2)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (3, 33, 3)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (4, 34, 4)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (5, 34, 5)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (6, 34, 6)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (7, 35, 7)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (8, 35, 8)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (9, 35, 9)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (10, 36, 10)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (11, 36, 11)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (12, 36, 12)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (13, 37, 13)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (14, 37, 14)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (15, 37, 15)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (16, 38, 16)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (17, 38, 17)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (18, 38, 18)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (19, 39, 19)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (20, 39, 20)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (21, 39, 21)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (22, 40, 22)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (23, 40, 23)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (24, 40, 24)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (25, 41, 25)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (26, 41, 26)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (27, 41, 27)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (28, 42, 28)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (29, 42, 29)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (30, 42, 30)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (31, 43, 31)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (32, 43, 32)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (33, 43, 33)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (34, 44, 34)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (35, 44, 35)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (36, 44, 36)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (37, 45, 37)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (38, 45, 38)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (39, 45, 39)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (40, 46, 40)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (41, 46, 41)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (42, 46, 42)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (43, 47, 43)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (44, 47, 44)
INSERT [dbo].[ProductToTC] ([Id], [TCid], [ProductId]) VALUES (45, 47, 45)
SET IDENTITY_INSERT [dbo].[ProductToTC] OFF
SET IDENTITY_INSERT [dbo].[Revenue] ON 

INSERT [dbo].[Revenue] ([Id], [RevenueName], [Description]) VALUES (1, N'EUR 0
', NULL)
INSERT [dbo].[Revenue] ([Id], [RevenueName], [Description]) VALUES (2, N'< EUR 0.2 M
', NULL)
INSERT [dbo].[Revenue] ([Id], [RevenueName], [Description]) VALUES (3, N'EUR 0.2 - 0.5 M
', NULL)
INSERT [dbo].[Revenue] ([Id], [RevenueName], [Description]) VALUES (4, N'EUR 0.5 - 1 M
', NULL)
INSERT [dbo].[Revenue] ([Id], [RevenueName], [Description]) VALUES (5, N'EUR 1 - 5 M
', NULL)
INSERT [dbo].[Revenue] ([Id], [RevenueName], [Description]) VALUES (6, N'EUR 5 - 10 M
', NULL)
INSERT [dbo].[Revenue] ([Id], [RevenueName], [Description]) VALUES (7, N'More than EUR 10 M
', NULL)
SET IDENTITY_INSERT [dbo].[Revenue] OFF
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([Id], [ServicesName], [Description]) VALUES (1, N'Gold', NULL)
INSERT [dbo].[Services] ([Id], [ServicesName], [Description]) VALUES (2, N'Sliver ', NULL)
INSERT [dbo].[Services] ([Id], [ServicesName], [Description]) VALUES (3, N'Bronze', NULL)
SET IDENTITY_INSERT [dbo].[Services] OFF
SET IDENTITY_INSERT [dbo].[Stage] ON 

INSERT [dbo].[Stage] ([Id], [Name]) VALUES (4, N'Stage 1')
INSERT [dbo].[Stage] ([Id], [Name]) VALUES (5, N'Stage 2')
INSERT [dbo].[Stage] ([Id], [Name]) VALUES (6, N'Stage 3')
SET IDENTITY_INSERT [dbo].[Stage] OFF
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (1, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (2, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (12, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (13, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (14, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (24, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (25, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (26, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (27, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (28, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (29, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (30, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (31, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (32, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (33, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (34, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (35, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (36, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (37, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (38, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (39, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (40, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (41, 1)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (42, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (43, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (44, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (45, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (46, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (47, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (57, 0)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (58, 1)
INSERT [dbo].[TCActive] ([TCid], [IsActive]) VALUES (59, 1)
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (12, NULL, N'', NULL, N'')
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (13, NULL, N'', NULL, N'')
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (14, NULL, N'', NULL, N'')
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (24, NULL, N'', NULL, N'')
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (25, NULL, N'', NULL, N'')
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (26, NULL, N'', NULL, N'')
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (27, NULL, N'', NULL, N'')
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (28, NULL, N'', NULL, N'')
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (29, NULL, N'', NULL, N'')
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (30, NULL, N'', NULL, N'')
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (31, NULL, N'', NULL, N'')
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (32, NULL, N'', NULL, N'')
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (33, NULL, N'', NULL, N'')
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (34, NULL, N'', NULL, N'')
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (35, NULL, N'', NULL, N'')
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (36, NULL, N'', NULL, N'')
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (37, NULL, N'', NULL, N'')
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (38, NULL, N'', NULL, N'')
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (39, NULL, N'', NULL, N'')
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (40, NULL, N'', NULL, N'')
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (41, NULL, N'', NULL, N'')
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (42, NULL, N'', NULL, N'')
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (43, NULL, N'', NULL, N'')
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (44, NULL, N'', NULL, N'')
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (45, NULL, N'', NULL, N'')
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (46, NULL, N'', NULL, N'')
INSERT [dbo].[TCAdmin] ([TCid], [ClusterRelationId], [FreetextNoteField], [InnosixAccountManagerId], [Source]) VALUES (47, NULL, N'', NULL, N'')
SET IDENTITY_INSERT [dbo].[TCBasicInfo] ON 

INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (1, N'Address1TC1', N'Address2TC1', N'Address3TC1', N'ZipTC1', N'CityTC1', 37, N'CompanyEmailTC1', N'CompanyNameTC1', N'CompanyPhoneTC1', N'LegalSuffixTC1', N'CompanyWebsiteTC1', N'LogoUrlTC1', N'RegistrationNumberTC1')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (2, N'Address1', N'Address2', N'Address3', N'Zip', N'City', 9, N'CompanyEmail', N'CompanyName', N'CompanyPhone', N'LegalSuffix', N'CompanyWebsite', N'LogoUrl', N'RegistrationNumber')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (12, N'Eichborndamm 9', N'Bezirk Reinickendorf', N'', N'', N'Berlin', 17, N'contact@1aim.com', N'1Aim', N'49 30 57702040', N'GmbH', N'https://1aim.com/', N'', N'')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (13, N'Jupiterweg 41', N'', N'Flevoland', N'3893', N'Zeewolde', 32, N'info@1dcomposites.com', N'1D Composites', N'31 0 653 161362', N'BV', N'http://www.1dcomposites.com/', N'', N'')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (14, N'Grüneburgweg 16-18 / Westend', N'', N'', N'60322', N'Carree', 17, N'info@360t.com', N'360T', N'49 69 900 289 0', N'AG', N'https://www.360t.com/', N'https://www.360t.com/wp-content/uploads/2017/03/logo_360T_DBG.png', N'')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (24, N'Eichborndamm 9', N'Bezirk Reinickendorf', N'', N'', N'Berlin', 17, N'contact@1aim.com', N'1Aim', N'49 30 57702040', N'GmbH', N'https://1aim.com/', N'', N'')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (25, N'Jupiterweg 41', N'', N'Flevoland', N'3893', N'Zeewolde', 32, N'info@1dcomposites.com', N'1D Composites', N'31 0 653 161362', N'BV', N'http://www.1dcomposites.com/', N'', N'')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (26, N'Grüneburgweg 16-18 / Westend', N'', N'', N'60322', N'Carree', 17, N'info@360t.com', N'360T', N'49 69 900 289 0', N'AG', N'https://www.360t.com/', N'https://www.360t.com/wp-content/uploads/2017/03/logo_360T_DBG.png', N'')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (27, N'Eichborndamm 9', N'Bezirk Reinickendorf', N'', N'', N'Berlin', 17, N'contact@1aim.com', N'1Aim', N'49 30 57702040', N'GmbH', N'https://1aim.com/', N'', N'')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (28, N'Jupiterweg 41', N'', N'Flevoland', N'3893', N'Zeewolde', 32, N'info@1dcomposites.com', N'1D Composites', N'31 0 653 161362', N'BV', N'http://www.1dcomposites.com/', N'', N'')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (29, N'Grüneburgweg 16-18 / Westend', N'', N'', N'60322', N'Carree', 17, N'info@360t.com', N'360T', N'49 69 900 289 0', N'AG', N'https://www.360t.com/', N'https://www.360t.com/wp-content/uploads/2017/03/logo_360T_DBG.png', N'')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (30, N'Eichborndamm 9', N'Bezirk Reinickendorf', N'', N'', N'Berlin', 17, N'contact@1aim.com', N'1Aim', N'49 30 57702040', N'GmbH', N'https://1aim.com/', N'', N'')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (31, N'Jupiterweg 41', N'', N'Flevoland', N'3893', N'Zeewolde', 32, N'info@1dcomposites.com', N'1D Composites', N'31 0 653 161362', N'BV', N'http://www.1dcomposites.com/', N'', N'')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (32, N'Grüneburgweg 16-18 / Westend', N'', N'', N'60322', N'Carree', 17, N'info@360t.com', N'360T', N'49 69 900 289 0', N'AG', N'https://www.360t.com/', N'https://www.360t.com/wp-content/uploads/2017/03/logo_360T_DBG.png', N'')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (33, N'Eichborndamm 9', N'Bezirk Reinickendorf', N'', N'', N'Berlin', 17, N'contact@1aim.com', N'1Aim', N'49 30 57702040', N'GmbH', N'https://1aim.com/', N'', N'')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (34, N'Jupiterweg 41', N'', N'Flevoland', N'3893', N'Zeewolde', 32, N'info@1dcomposites.com', N'1D Composites', N'31 0 653 161362', N'BV', N'http://www.1dcomposites.com/', N'', N'')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (35, N'Grüneburgweg 16-18 / Westend', N'', N'', N'60322', N'Carree', 17, N'info@360t.com', N'360T', N'49 69 900 289 0', N'AG', N'https://www.360t.com/', N'https://www.360t.com/wp-content/uploads/2017/03/logo_360T_DBG.png', N'')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (36, N'Eichborndamm 9', N'Bezirk Reinickendorf', N'', N'', N'Berlin', 17, N'contact@1aim.com', N'1Aim', N'49 30 57702040', N'GmbH', N'https://1aim.com/', N'', N'')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (37, N'Jupiterweg 41', N'', N'Flevoland', N'3893', N'Zeewolde', 32, N'info@1dcomposites.com', N'1D Composites', N'31 0 653 161362', N'BV', N'http://www.1dcomposites.com/', N'', N'')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (38, N'Grüneburgweg 16-18 / Westend', N'', N'', N'60322', N'Carree', 17, N'info@360t.com', N'360T', N'49 69 900 289 0', N'AG', N'https://www.360t.com/', N'https://www.360t.com/wp-content/uploads/2017/03/logo_360T_DBG.png', N'')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (39, N'Eichborndamm 9', N'Bezirk Reinickendorf', N'', N'', N'Berlin', 17, N'contact@1aim.com', N'1Aim', N'49 30 57702040', N'GmbH', N'https://1aim.com/', N'', N'')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (40, N'Jupiterweg 41', N'', N'Flevoland', N'3893', N'Zeewolde', 32, N'info@1dcomposites.com', N'1D Composites', N'31 0 653 161362', N'BV', N'http://www.1dcomposites.com/', N'', N'')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (41, N'Grüneburgweg 16-18', N'Westend', N'21', N'60322', N'Carree', 17, N'info@360t.com', N'360T', N'49 69 900 289 0', N'AG', N'https://www.360t.com/', N'https://www.360t.com/wp-content/uploads/2017/03/logo_360T_DBG.png', N'1')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (42, N'Eichborndamm 9', N'Bezirk Reinickendorf', N'', N'', N'Berlin', 17, N'contact@1aim.com', N'1Aim', N'49 30 57702040', N'GmbH', N'https://1aim.com/', N'', N'')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (43, N'Jupiterweg 41', N'', N'Flevoland', N'3893', N'Zeewolde', 32, N'info@1dcomposites.com', N'1D Composites', N'31 0 653 161362', N'BV', N'http://www.1dcomposites.com/', N'', N'')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (44, N'Grüneburgweg 16-18 / Westend', N'', N'', N'60322', N'Carree', 17, N'info@360t.com', N'360T', N'49 69 900 289 0', N'AG', N'https://www.360t.com/', N'https://www.360t.com/wp-content/uploads/2017/03/logo_360T_DBG.png', N'')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (45, N'Eichborndamm 9', N'Bezirk Reinickendorf', N'', N'', N'Berlin', 17, N'contact@1aim.com', N'1Aim', N'49 30 57702040', N'GmbH', N'https://1aim.com/', N'', N'')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (46, N'Jupiterweg 41', N'', N'Flevoland', N'3893', N'Zeewolde', 32, N'info@1dcomposites.com', N'1D Composites', N'31 0 653 161362', N'BV', N'http://www.1dcomposites.com/', N'', N'')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (47, N'Gr�neburgweg 16-18 / Westend', N'', N'', N'60322', N'Carree', 17, N'info@360t.com', N'360T', N'49 69 900 289 0', N'AG', N'https://www.360t.com/', N'https://www.360t.com/wp-content/uploads/2017/03/logo_360T_DBG.png', N'')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (57, N'asd', N'asd', N'asd', N'asd', N'asd', 1, N'asd', N'asd', N'asd', N'asd', N'asd', N'asd', N'asd')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (58, N'qwe', N'qwe', N'qwe', N'qwe', N'qwe', 1, N'qwe', N'qwe', N'qwe', N'qwe', N'qwe', N'qwe', N'qwe')
INSERT [dbo].[TCBasicInfo] ([Id], [Address1], [Address2], [Address3], [Zip], [City], [CountryId], [CompanyEmail], [CompanyName], [CompanyPhone], [LegalSuffix], [CompanyWebsite], [LogoUrl], [RegistrationNumber]) VALUES (59, N'qwe', N'qwe', N'qwe', N'qwe', N'qwe', 1, N'qwe', N'qwe', N'qwe', N'qwe', N'qwe', N'qwe', N'qwe')
SET IDENTITY_INSERT [dbo].[TCBasicInfo] OFF
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (12, N'1aim combine excellence in mechanical, electrical and software engineering with an intelligent approach to design to create the best access control systems ever built.', N'', NULL, 0, NULL, 0, N'', N'', N'', NULL, 0, NULL, 2012)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (13, N'1d composites is a leading producer of fiber reinforced pultruded profiles.', N'1D Composites is a leading producer of fiber reinforced pultruded profiles.', NULL, 0, NULL, 0, N'', N'', N'', NULL, 0, NULL, 0)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (14, N'360t is the leading global provider of web-based trading technology. This best-in-class trading technology enables clients to trade otc financial instruments.', N'', NULL, 0, NULL, 0, N'', N'', N'', NULL, 0, NULL, 2000)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (24, N'1aim combine excellence in mechanical, electrical and software engineering with an intelligent approach to design to create the best access control systems ever built.', N'', NULL, 0, NULL, 0, N'', N'', N'', NULL, 0, NULL, 2012)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (25, N'1d composites is a leading producer of fiber reinforced pultruded profiles.', N'1D Composites is a leading producer of fiber reinforced pultruded profiles.', NULL, 0, NULL, 0, N'', N'', N'', NULL, 0, NULL, 0)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (26, N'360t is the leading global provider of web-based trading technology. This best-in-class trading technology enables clients to trade otc financial instruments.', N'', NULL, 0, NULL, 0, N'', N'', N'', NULL, 0, NULL, 2000)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (27, N'1aim combine excellence in mechanical, electrical and software engineering with an intelligent approach to design to create the best access control systems ever built.', N'', NULL, 0, NULL, 0, N'', N'', N'', NULL, 0, NULL, 2012)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (28, N'1d composites is a leading producer of fiber reinforced pultruded profiles.', N'1D Composites is a leading producer of fiber reinforced pultruded profiles.', NULL, 0, NULL, 0, N'', N'', N'', NULL, 0, NULL, 0)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (29, N'360t is the leading global provider of web-based trading technology. This best-in-class trading technology enables clients to trade otc financial instruments.', N'', NULL, 0, NULL, 0, N'', N'', N'', NULL, 0, NULL, 2000)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (30, N'1aim combine excellence in mechanical, electrical and software engineering with an intelligent approach to design to create the best access control systems ever built.', N'', NULL, 0, NULL, 0, N'', N'', N'', NULL, 0, NULL, 2012)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (31, N'1d composites is a leading producer of fiber reinforced pultruded profiles.', N'1D Composites is a leading producer of fiber reinforced pultruded profiles.', NULL, 0, NULL, 0, N'', N'', N'', NULL, 0, NULL, 0)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (32, N'360t is the leading global provider of web-based trading technology. This best-in-class trading technology enables clients to trade otc financial instruments.', N'', NULL, 0, NULL, 0, N'', N'', N'', NULL, 0, NULL, 2000)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (33, N'1aim combine excellence in mechanical, electrical and software engineering with an intelligent approach to design to create the best access control systems ever built.', N'', NULL, 0, NULL, 0, N'', N'', N'', NULL, 0, NULL, 2012)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (34, N'1d composites is a leading producer of fiber reinforced pultruded profiles.', N'1D Composites is a leading producer of fiber reinforced pultruded profiles.', NULL, 0, NULL, 0, N'', N'', N'', NULL, 0, NULL, 0)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (35, N'360t is the leading global provider of web-based trading technology. This best-in-class trading technology enables clients to trade otc financial instruments.', N'', NULL, 0, NULL, 0, N'', N'', N'', NULL, 0, NULL, 2000)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (36, N'1aim combine excellence in mechanical, electrical and software engineering with an intelligent approach to design to create the best access control systems ever built.', N'', NULL, 0, NULL, 0, N'', N'', N'', NULL, 0, NULL, 2012)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (37, N'1d composites is a leading producer of fiber reinforced pultruded profiles.', N'1D Composites is a leading producer of fiber reinforced pultruded profiles.', NULL, 0, NULL, 0, N'', N'', N'', NULL, 0, NULL, 0)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (38, N'360t is the leading global provider of web-based trading technology. This best-in-class trading technology enables clients to trade otc financial instruments.', N'', NULL, 0, NULL, 0, N'', N'', N'', NULL, 0, NULL, 2000)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (39, N'1aim combine excellence in mechanical, electrical and software engineering with an intelligent approach to design to create the best access control systems ever built.', N'', NULL, 0, NULL, 0, N'', N'', N'', NULL, 0, NULL, 2012)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (40, N'1d composites is a leading producer of fiber reinforced pultruded profiles.', N'1D Composites is a leading producer of fiber reinforced pultruded profiles.', 1, 0, 1, 0, N'', N'', N'', 2, 0, 1, 0)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (41, N'360t is the leading global provider of web-based trading technology. This best-in-class trading technology enables clients to trade otc financial instruments.', NULL, 1, 0, 3, 0, NULL, NULL, NULL, 2, 0, 7, 2000)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (42, N'1aim combine excellence in mechanical, electrical and software engineering with an intelligent approach to design to create the best access control systems ever built.', N'', NULL, 0, NULL, 0, N'', N'', N'', 3, 0, NULL, 2012)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (43, N'1d composites is a leading producer of fiber reinforced pultruded profiles.', N'1D Composites is a leading producer of fiber reinforced pultruded profiles.', NULL, 0, NULL, 0, N'', N'', N'', 1, 0, NULL, 0)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (44, N'360t is the leading global provider of web-based trading technology. This best-in-class trading technology enables clients to trade otc financial instruments.', N'', NULL, 0, NULL, 0, N'', N'', N'', NULL, 0, NULL, 2000)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (45, N'1aim combine excellence in mechanical, electrical and software engineering with an intelligent approach to design to create the best access control systems ever built.', N'', NULL, 0, NULL, 0, N'', N'', N'', NULL, 0, NULL, 2012)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (46, N'1d composites is a leading producer of fiber reinforced pultruded profiles.', N'1D Composites is a leading producer of fiber reinforced pultruded profiles.', NULL, 0, NULL, 0, N'', N'', N'', NULL, 0, NULL, 0)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (47, N'360t is the leading global provider of web-based trading technology. This best-in-class trading technology enables clients to trade otc financial instruments.', N'', NULL, 0, NULL, 0, N'', N'', N'', NULL, 0, NULL, 2000)
INSERT [dbo].[TCBusinessInfo] ([TCid], [BusinessSummary], [CompanyDescription], [NaceCodeId], [RevenueYear], [FullTimeEmployeesId], [FTEyear], [KeyCompetitors], [KeyPartners], [LargestOwners], [MaturityStageId], [ProfitMaking], [RevenueId], [Established]) VALUES (58, N'asd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, 2018)
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (12, N'', N'', N'Torben Frieh', N'CEO')
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (13, N'', N'', N'Gertjan Switsar', N'Director')
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (14, N'carlo.koelzer@360t.com', N'', N'Carlo Koelzer', N'CEO')
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (24, N'', N'', N'Torben Frieh', N'CEO')
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (25, N'', N'', N'Gertjan Switsar', N'Director')
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (26, N'carlo.koelzer@360t.com', N'', N'Carlo Koelzer', N'CEO')
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (27, N'', N'', N'Torben Frieh', N'CEO')
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (28, N'', N'', N'Gertjan Switsar', N'Director')
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (29, N'carlo.koelzer@360t.com', N'', N'Carlo Koelzer', N'CEO')
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (30, N'', N'', N'Torben Frieh', N'CEO')
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (31, N'', N'', N'Gertjan Switsar', N'Director')
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (32, N'carlo.koelzer@360t.com', N'', N'Carlo Koelzer', N'CEO')
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (33, N'', N'', N'Torben Frieh', N'CEO')
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (34, N'', N'', N'Gertjan Switsar', N'Director')
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (35, N'carlo.koelzer@360t.com', N'', N'Carlo Koelzer', N'CEO')
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (36, N'', N'', N'Torben Frieh', N'CEO')
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (37, N'', N'', N'Gertjan Switsar', N'Director')
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (38, N'carlo.koelzer@360t.com', N'', N'Carlo Koelzer', N'CEO')
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (39, N'', N'', N'Torben Frieh', N'CEO')
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (40, N'', N'', N'Gertjan Switsar', N'Director')
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (41, N'carlo.koelzer@360t.com', N'123456789', N'Carlo Koelzer', N'CEO')
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (42, N'', N'', N'Torben Frieh', N'CEO')
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (43, N'', N'', N'Gertjan Switsar', N'Director')
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (44, N'carlo.koelzer@360t.com', N'', N'Carlo Koelzer', N'CEO')
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (45, N'', N'', N'Torben Frieh', N'CEO')
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (46, N'', N'', N'Gertjan Switsar', N'Director')
INSERT [dbo].[TCContact] ([TCid], [ContactPersonEmail], [ContactPersonPhone], [ContactPersonName], [Position]) VALUES (47, N'carlo.koelzer@360t.com', N'', N'Carlo Koelzer', N'CEO')
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (12, CAST(N'2017-11-09' AS Date), CAST(N'2017-11-09' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (13, CAST(N'2017-11-09' AS Date), CAST(N'2017-11-09' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (14, CAST(N'2017-11-09' AS Date), CAST(N'2017-11-09' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (24, CAST(N'2017-11-10' AS Date), CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (25, CAST(N'2017-11-10' AS Date), CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (26, CAST(N'2017-11-10' AS Date), CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (27, CAST(N'2017-11-10' AS Date), CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (28, CAST(N'2017-11-10' AS Date), CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (29, CAST(N'2017-11-10' AS Date), CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (30, CAST(N'2017-11-10' AS Date), CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (31, CAST(N'2017-11-10' AS Date), CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (32, CAST(N'2017-11-10' AS Date), CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (33, CAST(N'2017-11-10' AS Date), CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (34, CAST(N'2017-11-10' AS Date), CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (35, CAST(N'2017-11-10' AS Date), CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (36, CAST(N'2017-11-10' AS Date), CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (37, CAST(N'2017-11-10' AS Date), CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (38, CAST(N'2017-11-10' AS Date), CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (39, CAST(N'2017-11-10' AS Date), CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (40, CAST(N'2017-11-10' AS Date), CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (41, CAST(N'2017-11-10' AS Date), CAST(N'2018-01-08' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (42, CAST(N'2017-11-10' AS Date), CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (43, CAST(N'2017-11-10' AS Date), CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (44, CAST(N'2017-11-10' AS Date), CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (45, CAST(N'2017-11-13' AS Date), CAST(N'2017-11-13' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (46, CAST(N'2017-11-13' AS Date), CAST(N'2017-11-13' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (47, CAST(N'2017-11-13' AS Date), CAST(N'2017-11-13' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (57, CAST(N'2017-12-14' AS Date), CAST(N'2017-12-14' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (58, CAST(N'2017-12-20' AS Date), CAST(N'2018-01-08' AS Date))
INSERT [dbo].[TCGeneral] ([TCid], [Created], [LastUpdated]) VALUES (59, CAST(N'2017-12-20' AS Date), CAST(N'2017-12-20' AS Date))
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (12, NULL, N'', NULL)
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (13, NULL, N'', NULL)
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (14, NULL, N'', NULL)
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (24, NULL, N'', NULL)
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (25, NULL, N'', NULL)
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (26, NULL, N'', NULL)
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (27, NULL, N'', NULL)
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (28, NULL, N'', NULL)
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (29, NULL, N'', NULL)
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (30, NULL, N'', NULL)
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (31, NULL, N'', NULL)
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (32, NULL, N'', NULL)
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (33, NULL, N'', NULL)
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (34, NULL, N'', NULL)
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (35, NULL, N'', NULL)
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (36, NULL, N'', NULL)
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (37, NULL, N'', NULL)
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (38, NULL, N'', NULL)
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (39, NULL, N'', NULL)
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (40, NULL, N'', NULL)
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (41, NULL, NULL, NULL)
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (42, NULL, N'', NULL)
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (43, NULL, N'', NULL)
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (44, NULL, N'', NULL)
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (45, NULL, N'', NULL)
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (46, NULL, N'', NULL)
INSERT [dbo].[TCIdealPartner] ([TCid], [IdealCorporatePartnerNace], [IdealCorporatePartnerName], [IdealCorporatePartnerTechnologyFocus]) VALUES (47, NULL, N'', NULL)
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (12, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), 0, CAST(N'2017-11-09' AS Date))
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (13, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), 0, CAST(N'2017-11-09' AS Date))
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (14, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), 0, CAST(N'2017-11-09' AS Date))
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (24, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), 0, CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (25, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), 0, CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (26, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), 0, CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (27, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), 0, CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (28, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), 0, CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (29, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), 0, CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (30, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), 0, CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (31, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), 0, CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (32, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), 0, CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (33, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), 0, CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (34, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), 0, CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (35, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), 0, CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (36, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), 0, CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (37, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), 0, CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (38, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), 0, CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (39, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), 0, CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (40, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), 0, CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (41, CAST(1.09 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(1.04 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 1, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 2, CAST(0.00 AS Decimal(3, 2)), 3, CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (42, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), 0, CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (43, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), 0, CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (44, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), 0, CAST(N'2017-11-10' AS Date))
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (45, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), 0, CAST(N'2017-11-13' AS Date))
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (46, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), 0, CAST(N'2017-11-13' AS Date))
INSERT [dbo].[TCRating] ([TCid], [Financials], [Fundamentals], [Market], [ManagementAndExecution], [BML], [BMLConfidenceIndex], [IntellectualProperty], [Technology], [TechnologyRisk], [TML], [TMLConfidenceIndex], [OverallRating], [OverallRatingConfidenceIndex], [RatingDate]) VALUES (47, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), CAST(0.00 AS Decimal(3, 2)), 0, CAST(0.00 AS Decimal(3, 2)), 0, CAST(N'2017-11-13' AS Date))
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (12, N'AddTag1,AddTag11,AddTag2,AddTag3', NULL, N'', NULL)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (13, N'AddTag4,AddTag5', NULL, N'', NULL)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (14, N'Quantum computing', NULL, N'', NULL)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (24, N'', NULL, N'', 9)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (25, N'', NULL, N'', 17)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (26, N'', NULL, N'', 11)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (27, N'', NULL, N'', 9)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (28, N'', NULL, N'', 17)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (29, N'', NULL, N'', 11)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (30, N'', NULL, N'', 9)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (31, N'', NULL, N'', 17)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (32, N'', NULL, N'', 11)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (33, N'', NULL, N'', 9)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (34, N'', NULL, N'', 17)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (35, N'', NULL, N'', 11)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (36, N'', NULL, N'', 9)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (37, N'', NULL, N'', 17)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (38, N'', NULL, N'', 11)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (39, N'', NULL, N'', 9)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (40, N'', NULL, N'', 17)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (41, N'Additional Tag,Additional Tag 2,Additional Tag 3', NULL, N'test', 11)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (42, N'', NULL, N'', 9)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (43, N'', NULL, N'', 17)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (44, N'', NULL, N'', 11)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (45, N'', NULL, N'', 9)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (46, N'', NULL, N'', 17)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (47, N'', NULL, N'', 11)
INSERT [dbo].[TCTechnology] ([TCid], [AdditionalTechTags], [Patents], [OtherIpNotPatented], [TechnologySectorId]) VALUES (58, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TechDomain] ON 

INSERT [dbo].[TechDomain] ([Id], [DomainName], [Description]) VALUES (1, N'Acoustics', NULL)
INSERT [dbo].[TechDomain] ([Id], [DomainName], [Description]) VALUES (2, N'Agro-tech', NULL)
INSERT [dbo].[TechDomain] ([Id], [DomainName], [Description]) VALUES (3, N'Analytics', NULL)
INSERT [dbo].[TechDomain] ([Id], [DomainName], [Description]) VALUES (4, N'Biological', NULL)
INSERT [dbo].[TechDomain] ([Id], [DomainName], [Description]) VALUES (5, N'Chemical', NULL)
INSERT [dbo].[TechDomain] ([Id], [DomainName], [Description]) VALUES (6, N'Clean-tech', NULL)
INSERT [dbo].[TechDomain] ([Id], [DomainName], [Description]) VALUES (7, N'Connectivity', NULL)
INSERT [dbo].[TechDomain] ([Id], [DomainName], [Description]) VALUES (8, N'Construction', NULL)
INSERT [dbo].[TechDomain] ([Id], [DomainName], [Description]) VALUES (9, N'Digital', NULL)
INSERT [dbo].[TechDomain] ([Id], [DomainName], [Description]) VALUES (10, N'Ed-tech', NULL)
INSERT [dbo].[TechDomain] ([Id], [DomainName], [Description]) VALUES (11, N'Electric', NULL)
INSERT [dbo].[TechDomain] ([Id], [DomainName], [Description]) VALUES (12, N'Electronics', NULL)
INSERT [dbo].[TechDomain] ([Id], [DomainName], [Description]) VALUES (13, N'Energy', NULL)
INSERT [dbo].[TechDomain] ([Id], [DomainName], [Description]) VALUES (14, N'Fintech', NULL)
INSERT [dbo].[TechDomain] ([Id], [DomainName], [Description]) VALUES (15, N'Food-tech', NULL)
INSERT [dbo].[TechDomain] ([Id], [DomainName], [Description]) VALUES (16, N'Hardware', NULL)
INSERT [dbo].[TechDomain] ([Id], [DomainName], [Description]) VALUES (17, N'HR-tech', NULL)
INSERT [dbo].[TechDomain] ([Id], [DomainName], [Description]) VALUES (18, N'Instruments', NULL)
INSERT [dbo].[TechDomain] ([Id], [DomainName], [Description]) VALUES (19, N'Insur-tech', NULL)
INSERT [dbo].[TechDomain] ([Id], [DomainName], [Description]) VALUES (20, N'Mechanical', NULL)
INSERT [dbo].[TechDomain] ([Id], [DomainName], [Description]) VALUES (21, N'Med-tech', NULL)
INSERT [dbo].[TechDomain] ([Id], [DomainName], [Description]) VALUES (22, N'Natural', NULL)
INSERT [dbo].[TechDomain] ([Id], [DomainName], [Description]) VALUES (23, N'Optical', NULL)
INSERT [dbo].[TechDomain] ([Id], [DomainName], [Description]) VALUES (24, N'Pharma', NULL)
INSERT [dbo].[TechDomain] ([Id], [DomainName], [Description]) VALUES (25, N'Process-tech', NULL)
INSERT [dbo].[TechDomain] ([Id], [DomainName], [Description]) VALUES (26, N'Robotics', NULL)
SET IDENTITY_INSERT [dbo].[TechDomain] OFF
SET IDENTITY_INSERT [dbo].[TechDomainToTC] ON 

INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (1, 33, 12)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (2, 33, 9)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (3, 34, 25)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (4, 34, 20)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (5, 35, 14)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (6, 35, 9)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (7, 36, 12)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (8, 36, 9)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (9, 37, 25)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (10, 37, 20)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (11, 38, 14)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (12, 38, 9)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (13, 39, 12)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (14, 39, 9)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (15, 40, 25)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (16, 40, 20)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (17, 41, 14)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (18, 41, 9)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (19, 42, 12)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (20, 42, 9)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (21, 43, 25)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (22, 43, 20)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (23, 44, 14)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (24, 44, 9)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (25, 45, 12)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (26, 45, 9)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (27, 46, 25)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (28, 46, 20)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (29, 47, 14)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (30, 47, 9)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (49, 58, 1)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (50, 58, 3)
INSERT [dbo].[TechDomainToTC] ([Id], [TCid], [TechDomainId]) VALUES (51, 58, 4)
SET IDENTITY_INSERT [dbo].[TechDomainToTC] OFF
SET IDENTITY_INSERT [dbo].[TechSector] ON 

INSERT [dbo].[TechSector] ([Id], [TechSectorName], [Description]) VALUES (1, N'Aerospace and defense', NULL)
INSERT [dbo].[TechSector] ([Id], [TechSectorName], [Description]) VALUES (2, N'Agriculture, forestry and fishing', NULL)
INSERT [dbo].[TechSector] ([Id], [TechSectorName], [Description]) VALUES (3, N'Automotive', NULL)
INSERT [dbo].[TechSector] ([Id], [TechSectorName], [Description]) VALUES (4, N'Chemicals', NULL)
INSERT [dbo].[TechSector] ([Id], [TechSectorName], [Description]) VALUES (5, N'Construction and infrastructure', NULL)
INSERT [dbo].[TechSector] ([Id], [TechSectorName], [Description]) VALUES (6, N'Consulting and business services', NULL)
INSERT [dbo].[TechSector] ([Id], [TechSectorName], [Description]) VALUES (7, N'Consumer products', NULL)
INSERT [dbo].[TechSector] ([Id], [TechSectorName], [Description]) VALUES (8, N'Education, media and publishing', NULL)
INSERT [dbo].[TechSector] ([Id], [TechSectorName], [Description]) VALUES (9, N'Electronics and semiconductor equipment', NULL)
INSERT [dbo].[TechSector] ([Id], [TechSectorName], [Description]) VALUES (10, N'Energy', NULL)
INSERT [dbo].[TechSector] ([Id], [TechSectorName], [Description]) VALUES (11, N'Financial and insurance', NULL)
INSERT [dbo].[TechSector] ([Id], [TechSectorName], [Description]) VALUES (12, N'Food and beverages', NULL)
INSERT [dbo].[TechSector] ([Id], [TechSectorName], [Description]) VALUES (13, N'Healthcare', NULL)
INSERT [dbo].[TechSector] ([Id], [TechSectorName], [Description]) VALUES (14, N'Information technology and telecommunications', NULL)
INSERT [dbo].[TechSector] ([Id], [TechSectorName], [Description]) VALUES (15, N'Maritime', NULL)
INSERT [dbo].[TechSector] ([Id], [TechSectorName], [Description]) VALUES (16, N'Mining and materials', NULL)
INSERT [dbo].[TechSector] ([Id], [TechSectorName], [Description]) VALUES (17, N'Other machinery, equipment and components', NULL)
INSERT [dbo].[TechSector] ([Id], [TechSectorName], [Description]) VALUES (18, N'Pharma and biotech', NULL)
INSERT [dbo].[TechSector] ([Id], [TechSectorName], [Description]) VALUES (19, N'Transportation and logistics', NULL)
SET IDENTITY_INSERT [dbo].[TechSector] OFF
SET IDENTITY_INSERT [dbo].[TechTag] ON 

INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (1, N'3D-printing', 0, 3, 0, N'Description printing 3D')
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (2, N'5G', 1, 0, 0, N'Description 5G')
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (3, N'Acoustic', 1, 2, 0, N'Description Acoustic')
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (4, N'Adaptive radar', 1, 0, 0, N'Description Adaptive radar')
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (5, N'Adaptive system', 1, 2, 0, N'Description Adaptive system')
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (6, N'Additive manufacturing', 1, 0, 0, N'Description Additive manufacturing')
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (7, N'Advanced materials', 1, 0, 0, N'Description Advanced materials')
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (8, N'Advanced reconnaissance ', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (9, N'Aerospace components', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (10, N'Agritech', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (11, N'Agro-productivity enhancers', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (12, N'Air purification', 1, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (13, N'Airports', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (14, N'Algae', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (15, N'Aluminum', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (16, N'Analytical', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (17, N'Analytics', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (18, N'Animal care', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (19, N'Anti-aging', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (20, N'Anti-fouling', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (21, N'App based', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (22, N'Artificial intelligence', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (23, N'Augmented reality', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (24, N'Automation', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (25, N'Automobiles', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (26, N'Automotive components', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (27, N'Autonomous systems', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (28, N'Autonomous vehicles', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (29, N'Avatar', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (30, N'Aviation', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (31, N'Banking automation', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (32, N'Battery technology', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (33, N'Bearings', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (34, N'Big data', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (35, N'Binders', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (36, N'Biocatalysis', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (37, N'Biocultures', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (38, N'Biofuels', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (39, N'Biogas', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (40, N'Biological', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (41, N'Biomass processing', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (42, N'Biomedical', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (43, N'Biomimetic', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (44, N'Bioplastics', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (45, N'Bioprinting', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (46, N'Biorefining', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (47, N'Biosensors', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (48, N'Biotechnology', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (49, N'Blended reality', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (50, N'Block chains & distributed ledgers', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (51, N'Bookkeeping & accounting', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (52, N'Bots', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (53, N'Breeding in plants and animals', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (54, N'Building component', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (55, N'CAD', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (56, N'Capital Markets & Financial services', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (57, N'Carbon', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (58, N'Cardboard', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (59, N'Catalyst', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (60, N'Cells', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (61, N'Cement', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (62, N'Ceramic', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (63, N'Changing nature of work', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (64, N'Chemical', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (65, N'Child nutrition', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (66, N'Chips - graphical processing units', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (67, N'Chipsets', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (68, N'CHP', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (69, N'Chromatography', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (70, N'Circular economy', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (71, N'Clay', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (72, N'Cleantech', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (73, N'Climate', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (74, N'Clinical studies', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (75, N'Cloud-based', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (76, N'CO2 reduction', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (77, N'Coatings', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (78, N'Collaborative & knowledge management systems', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (79, N'Communications technology', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (80, N'Components', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (81, N'Composites', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (82, N'Compressor', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (83, N'Concrete', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (84, N'Connected car', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (85, N'Connected health care', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (86, N'Connected home', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (87, N'Connectivity', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (88, N'Construction', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (89, N'Consulting services', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (90, N'Consumer durables', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (91, N'Cooling', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (92, N'Cooperative sonar', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (93, N'Cosmetics', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (94, N'Crowdsourcing', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (95, N'Cryprocurrency mining', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (96, N'Cryptocurrency trading & Exchanges', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (97, N'Currencies', 0, 0, 0, N'desc')
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (98, N'Cyber security', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (99, N'Cytometry', 0, 0, 0, NULL)
GO
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (100, N'Data analytics', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (101, N'Data management', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (102, N'Data visualization', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (103, N'Defense systems', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (104, N'Desalination', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (105, N'Diabetes', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (106, N'Diagnostics', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (107, N'Diesel', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (108, N'Dietary supplements', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (109, N'Digital', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (110, N'Digital-physical integration', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (111, N'Disinfection', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (112, N'District Heating', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (113, N'DNA analysis & processing', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (114, N'DNA diagnostics', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (115, N'Drones', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (116, N'Earth mover', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (117, N'Edge computing', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (118, N'Education', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (119, N'Educational technology', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (120, N'Efficient protein production', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (121, N'E-learning', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (122, N'Electric', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (123, N'Electric bike', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (124, N'Electric car', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (125, N'Electronic', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (126, N'Electronic warfare', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (127, N'Energy', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (128, N'Energy efficiency', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (129, N'Energy management', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (130, N'Energy monitor', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (131, N'Energy storage', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (132, N'Engineering', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (133, N'Engineering design', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (134, N'Enterprise services', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (135, N'Environment monitoring', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (136, N'Environmental protection', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (137, N'Enzyme discovery, isolation and production', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (138, N'Enzyme stabilization', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (139, N'Exhaust filter systems', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (140, N'Farming', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (141, N'Fashion', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (142, N'Fermentation', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (143, N'Fibres', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (144, N'Fibretronics', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (145, N'Filters', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (146, N'Fintech', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (147, N'Fintech - securities trading', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (148, N'Fire proofing', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (149, N'Fishery operations', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (150, N'Fog computing', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (151, N'Food design', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (152, N'Food flavours & textures', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (153, N'Food waste', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (154, N'Fuel cell', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (155, N'Functional foods', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (156, N'Functional packaging', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (157, N'Gamification', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (158, N'Genome editing', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (159, N'Gen-set', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (160, N'Geopositioning', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (161, N'Geothermal power', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (162, N'Gig economy', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (163, N'Glycobiologi', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (164, N'Graphene', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (165, N'Grids', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (166, N'Handheld devices', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (167, N'Hardware', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (168, N'Health', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (169, N'Health informatics', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (170, N'Health system interoperability', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (171, N'Heat exchangers', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (172, N'Heating', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (173, N'Hematology', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (174, N'HR-tech', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (175, N'Human augmentation', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (176, N'HVAC', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (177, N'Hydro power', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (178, N'Hydrocarbon', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (179, N'Hydrogen', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (180, N'i-beacons', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (181, N'Identity & Content Management', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (182, N'Individualised marketing', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (183, N'Indoor climate control', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (184, N'Indoor heating', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (185, N'Industrial mobility', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (186, N'Industrial robotics', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (187, N'Industry 4.0', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (188, N'Information technology and telecommunications', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (189, N'Ingredients extraction', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (190, N'Innovation', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (191, N'Instruments', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (192, N'Insulated-gate bipolar transistor, IGBT', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (193, N'Insurance unbundling', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (194, N'Insurtech', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (195, N'Internet of things - Cloud-borne', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (196, N'Internet of things - Low power/wide area', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (197, N'Interoperability', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (198, N'Investment management', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (199, N'Jet engine', 0, 0, 0, NULL)
GO
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (200, N'Kevlar', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (201, N'Knowledge economy', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (202, N'Lab testing', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (203, N'Language translation', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (204, N'Laser', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (205, N'Laser weapons', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (206, N'Last mile delivery', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (207, N'LED', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (208, N'LED lighting', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (209, N'Li-batteries', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (210, N'Light', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (211, N'LNG', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (212, N'Long-distance medicine', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (213, N'LPWAN, Low Power Wide Area Network', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (214, N'LTE mobile technology', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (215, N'LV/MV systems', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (216, N'M2M', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (217, N'Machine autonomy', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (218, N'Machine learning & neural networks', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (219, N'Magnetic', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (220, N'Mapping', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (221, N'Marketing', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (222, N'Measuring device', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (223, N'Meat & dairy products', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (224, N'Mechanical', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (225, N'Med-tech', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (226, N'Membranes', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (227, N'Merchant services', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (228, N'Mesh networks', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (229, N'Messaging', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (230, N'Metals', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (231, N'Metalurgy', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (232, N'Microbes', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (233, N'Microbilling / micro payment', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (234, N'Microbiology', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (235, N'Microscopy', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (236, N'Microwave', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (237, N'Mobile and cloud computing', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (238, N'Mobile payments', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (239, N'Motor controls', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (240, N'Moulding', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (241, N'Nanotech', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (242, N'Natural', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (243, N'Navigation', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (244, N'Near field communications', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (245, N'Networking', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (246, N'New business models', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (247, N'Novel weaponry', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (248, N'NOx reduction', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (249, N'Nuclear power', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (250, N'Nutrients', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (251, N'Nutrition', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (252, N'Object tracking', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (253, N'Offshore', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (254, N'Offsite construction', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (255, N'Oil', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (256, N'OLED', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (257, N'Oncology', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (258, N'Optical', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (259, N'Optics', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (260, N'Optimization', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (261, N'Organic foods', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (262, N'Other machinery, equipment and components', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (263, N'Over-the-air (OTA)', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (264, N'Ozone', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (265, N'P2P Lending', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (266, N'P2P Marketplace', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (267, N'Passive radar', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (268, N'Peer-to-peer lending', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (269, N'Performance analysis', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (270, N'Persistent surveillance', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (271, N'Personal care', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (272, N'Personal mobility', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (273, N'Pesticides', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (274, N'Pharma', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (275, N'Photonics', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (276, N'Photovoltaic', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (277, N'Plastic', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (278, N'Point of sale', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (279, N'Pollution control', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (280, N'Polymers', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (281, N'Power generation', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (282, N'Powergrid', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (283, N'Powertrain', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (284, N'Predictive maintenance', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (285, N'Privacy', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (286, N'Probiotics', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (287, N'Process-tech', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (288, N'Product design & development', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (289, N'Programming', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (290, N'Prosthetics', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (291, N'Protein extraction, design & manipulation', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (292, N'Proteines', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (293, N'Prototyping', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (294, N'Publishing', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (295, N'Pulp & paper', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (296, N'Pultrusion', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (297, N'Pumps', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (298, N'Pyrolysis', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (299, N'PaaS', 0, 0, 0, NULL)
GO
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (300, N'Quantum computing', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (301, N'Radiology', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (302, N'Reactor', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (303, N'Reader', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (304, N'Realtime monitoring', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (305, N'Recycling', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (306, N'Remote diagnostics', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (307, N'Remote management', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (308, N'Renewable', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (309, N'Renewables', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (310, N'Resource optimization', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (311, N'Retail experience', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (312, N'RFID', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (313, N'Rheology', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (314, N'Ride sharing', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (315, N'Risk management', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (316, N'Road safety', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (317, N'Robotics', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (318, N'Rotors', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (319, N'Rubber', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (320, N'Safety solutions', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (321, N'Scaling', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (322, N'Security', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (323, N'Sensors', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (324, N'Sharing economy', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (325, N'Shipping', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (326, N'SIM, embedded/programmable', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (327, N'Simulation & modelling', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (328, N'Skin treatment & care', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (329, N'Smart buildings', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (330, N'Smart cities', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (331, N'Smart grid', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (332, N'Smart man/machine interfaces', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (333, N'Smart manufacturing', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (334, N'Smart systems', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (335, N'Soaps & detergents', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (336, N'Social empowerment', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (337, N'Software', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (338, N'Software development', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (339, N'Solar power', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (340, N'Solar/UV screen', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (341, N'SOx', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (342, N'Space', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (343, N'Spectrum analysis', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (344, N'Stainless steel', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (345, N'Steel', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (346, N'Supply chain', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (347, N'Surface hardening', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (348, N'Surgical robotics', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (349, N'Sustainability', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (350, N'Sustainable energy generation', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (351, N'Synthetic biology', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (352, N'SaaS', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (353, N'Technology for climate change', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (354, N'Telemedicine', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (355, N'Temperature', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (356, N'Textiles', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (357, N'Therapy and treatment', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (358, N'Thermal power', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (359, N'Thermostat', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (360, N'Trade', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (361, N'Transportation', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (362, N'Transportation and logistics', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (363, N'Travel & liesure', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (364, N'Turbines', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (365, N'Ultrasound', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (366, N'Uninteruptable power supply, UPS', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (367, N'Unmanned aerial vehicle, UAV', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (368, N'Unmanned underwater vehicle, UUV', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (369, N'Utility metering', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (370, N'Ventilation', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (371, N'Vibration', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (372, N'Video & film production', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (373, N'Virtual reality', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (374, N'Visual Thinking', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (375, N'Voice recognition', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (376, N'Wallets & Money service', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (377, N'Waste management', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (378, N'Waste water treatment', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (379, N'Water', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (380, N'Water meter', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (381, N'Water Purification', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (382, N'Water treatment', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (383, N'Wave power', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (384, N'Wearables', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (385, N'Welding', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (386, N'Wholesale', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (387, N'WiFi', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (388, N'Wind power', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (389, N'Wireless', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (390, N'Wireless connectivity, long range', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (391, N'Wireless connectivity, short range', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (392, N'Workflow management system', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (393, N'X-ray', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (431, N'Additional Tag', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (432, N'Additional Tag 2', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (433, N'Additional Tag 3', 0, 0, 0, NULL)
INSERT [dbo].[TechTag] ([Id], [TagName], [ParentsCount], [ChildrenCount], [UsageCount], [Description]) VALUES (437, N'Additional Tag 4', 0, 0, 0, NULL)
SET IDENTITY_INSERT [dbo].[TechTag] OFF
SET IDENTITY_INSERT [dbo].[TechTagDeclined] ON 

INSERT [dbo].[TechTagDeclined] ([Id], [TagName]) VALUES (1, N'AddTag11')
SET IDENTITY_INSERT [dbo].[TechTagDeclined] OFF
SET IDENTITY_INSERT [dbo].[TechTagParents] ON 

INSERT [dbo].[TechTagParents] ([Id], [TechTagId], [ParentTechTagId]) VALUES (44, 2, 1)
INSERT [dbo].[TechTagParents] ([Id], [TechTagId], [ParentTechTagId]) VALUES (45, 3, 1)
INSERT [dbo].[TechTagParents] ([Id], [TechTagId], [ParentTechTagId]) VALUES (46, 4, 3)
INSERT [dbo].[TechTagParents] ([Id], [TechTagId], [ParentTechTagId]) VALUES (47, 5, 3)
INSERT [dbo].[TechTagParents] ([Id], [TechTagId], [ParentTechTagId]) VALUES (48, 6, 5)
INSERT [dbo].[TechTagParents] ([Id], [TechTagId], [ParentTechTagId]) VALUES (50, 7, 5)
INSERT [dbo].[TechTagParents] ([Id], [TechTagId], [ParentTechTagId]) VALUES (51, 12, 1)
SET IDENTITY_INSERT [dbo].[TechTagParents] OFF
SET IDENTITY_INSERT [dbo].[TechTagToTC] ON 

INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (1, 24, 1)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (2, 25, 1)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (3, 26, 1)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (4, 27, 300)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (5, 28, 300)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (6, 29, 300)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (7, 30, 109)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (8, 30, 337)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (9, 30, 167)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (10, 30, 125)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (11, 31, 296)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (12, 31, 143)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (13, 31, 88)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (14, 31, 277)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (15, 32, 97)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (16, 32, 147)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (17, 32, 146)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (18, 32, 51)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (19, 33, 109)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (20, 33, 337)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (21, 33, 167)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (22, 33, 125)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (23, 34, 296)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (24, 34, 143)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (25, 34, 88)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (26, 34, 277)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (27, 35, 97)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (28, 35, 147)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (29, 35, 146)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (30, 35, 51)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (31, 36, 109)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (32, 36, 337)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (33, 36, 167)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (34, 36, 125)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (35, 37, 296)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (36, 37, 143)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (37, 37, 88)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (38, 37, 277)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (39, 38, 97)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (40, 38, 147)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (41, 38, 146)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (42, 38, 51)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (43, 39, 109)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (44, 39, 337)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (45, 39, 167)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (46, 39, 125)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (47, 40, 296)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (48, 40, 143)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (49, 40, 88)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (50, 40, 277)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (55, 42, 109)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (56, 42, 337)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (57, 42, 167)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (58, 42, 125)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (59, 43, 296)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (60, 43, 143)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (61, 43, 88)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (62, 43, 277)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (63, 44, 97)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (64, 44, 147)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (65, 44, 146)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (66, 44, 51)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (67, 45, 109)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (68, 45, 337)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (69, 45, 167)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (70, 45, 125)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (71, 46, 296)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (72, 46, 143)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (73, 46, 88)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (74, 46, 277)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (75, 47, 97)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (76, 47, 147)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (77, 47, 146)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (78, 47, 51)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (158, 41, 1)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (159, 41, 51)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (160, 41, 97)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (161, 41, 146)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (162, 41, 147)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (199, 58, 1)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (200, 58, 3)
INSERT [dbo].[TechTagToTC] ([Id], [TCid], [TechTagId]) VALUES (201, 58, 5)
SET IDENTITY_INSERT [dbo].[TechTagToTC] OFF
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
/****** Object:  StoredProcedure [dbo].[GetAdditionalTechTags]    Script Date: 08.01.2018 16:09:03 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTagHierarchy]    Script Date: 08.01.2018 16:09:03 ******/
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
