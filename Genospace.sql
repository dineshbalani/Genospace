USE [master]
GO
/****** Object:  Database [Genospace]    Script Date: 05-02-2018 02:53:49 ******/
CREATE DATABASE [Genospace]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Genospace', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Genospace.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Genospace_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Genospace_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Genospace] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Genospace].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Genospace] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Genospace] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Genospace] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Genospace] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Genospace] SET ARITHABORT OFF 
GO
ALTER DATABASE [Genospace] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Genospace] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Genospace] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Genospace] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Genospace] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Genospace] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Genospace] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Genospace] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Genospace] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Genospace] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Genospace] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Genospace] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Genospace] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Genospace] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Genospace] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Genospace] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Genospace] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Genospace] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Genospace] SET  MULTI_USER 
GO
ALTER DATABASE [Genospace] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Genospace] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Genospace] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Genospace] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Genospace] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Genospace]
GO
/****** Object:  Table [dbo].[AdministrationRoutes]    Script Date: 05-02-2018 02:53:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdministrationRoutes](
	[id] [int] NOT NULL,
	[routes] [nvarchar](50) NULL,
 CONSTRAINT [PK_AdministrationRoutes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Conditions]    Script Date: 05-02-2018 02:53:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conditions](
	[id] [int] NOT NULL,
	[name] [nchar](10) NULL,
 CONSTRAINT [PK_Conditions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DSRows]    Script Date: 05-02-2018 02:53:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DSRows](
	[id] [int] NOT NULL,
	[conditionId] [int] NULL,
	[phaseHighestId] [int] NULL,
	[year] [time](7) NULL,
 CONSTRAINT [PK_DSRows] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DSRowsIdToOrganizationAdministrationRoute]    Script Date: 05-02-2018 02:53:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DSRowsIdToOrganizationAdministrationRoute](
	[id] [int] NOT NULL,
	[dsRowsID] [int] NULL,
	[organizationID] [int] NULL,
	[administrationRowID] [int] NULL,
 CONSTRAINT [PK_DSRowsIdToOrganizationAdministrationRoute] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MechanismMolecular]    Script Date: 05-02-2018 02:53:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MechanismMolecular](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_MechanismMolecular] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Medicine]    Script Date: 05-02-2018 02:53:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine](
	[id] [int] NOT NULL,
	[namemain] [nvarchar](50) NULL,
 CONSTRAINT [PK_Medicine] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MedicineToDSRows]    Script Date: 05-02-2018 02:53:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicineToDSRows](
	[id] [int] NOT NULL,
	[medicineId] [int] NULL,
	[DSRowsId] [int] NULL,
 CONSTRAINT [PK_MedicineToDSRows] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MedicineToMechanismMoleclar]    Script Date: 05-02-2018 02:53:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicineToMechanismMoleclar](
	[id] [int] NOT NULL,
	[medicineId] [int] NULL,
	[mechanismMolecularId] [int] NULL,
 CONSTRAINT [PK_MedicineToMechanismMoleclar] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MedicineToNameCode]    Script Date: 05-02-2018 02:53:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicineToNameCode](
	[id] [int] NOT NULL,
	[medicineId] [int] NULL,
	[nameCodeId] [int] NULL,
 CONSTRAINT [PK_MedicineToNameCode] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MedicineToNamesBrand]    Script Date: 05-02-2018 02:53:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicineToNamesBrand](
	[id] [int] NOT NULL,
	[medicineId] [int] NULL,
	[namesBrandId] [int] NULL,
 CONSTRAINT [PK_MedicineToNamesBrand] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MedicineToNamesGeneric]    Script Date: 05-02-2018 02:53:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicineToNamesGeneric](
	[id] [int] NOT NULL,
	[medicineId] [int] NULL,
	[namesGeneriId] [int] NULL,
 CONSTRAINT [PK_MedicineToNamesGeneric] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NamesBrand]    Script Date: 05-02-2018 02:53:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NamesBrand](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_NamesBrand] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NamesCodes]    Script Date: 05-02-2018 02:53:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NamesCodes](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_NamesCodes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NamesGeneric]    Script Date: 05-02-2018 02:53:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NamesGeneric](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_NamesGeneric] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Organizations]    Script Date: 05-02-2018 02:53:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organizations](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Organizations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhaseHighest]    Script Date: 05-02-2018 02:53:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhaseHighest](
	[id] [int] NOT NULL,
	[name] [nchar](10) NULL,
 CONSTRAINT [PK_PhaseHighest] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[DSRows]  WITH CHECK ADD  CONSTRAINT [FK_DSRows_Conditions] FOREIGN KEY([conditionId])
REFERENCES [dbo].[Conditions] ([id])
GO
ALTER TABLE [dbo].[DSRows] CHECK CONSTRAINT [FK_DSRows_Conditions]
GO
ALTER TABLE [dbo].[DSRows]  WITH CHECK ADD  CONSTRAINT [FK_DSRows_PhaseHighest] FOREIGN KEY([phaseHighestId])
REFERENCES [dbo].[PhaseHighest] ([id])
GO
ALTER TABLE [dbo].[DSRows] CHECK CONSTRAINT [FK_DSRows_PhaseHighest]
GO
ALTER TABLE [dbo].[DSRowsIdToOrganizationAdministrationRoute]  WITH CHECK ADD  CONSTRAINT [FK_DSRowsIdToOrganizationAdministrationRoute_AdministrationRoutes] FOREIGN KEY([administrationRowID])
REFERENCES [dbo].[AdministrationRoutes] ([id])
GO
ALTER TABLE [dbo].[DSRowsIdToOrganizationAdministrationRoute] CHECK CONSTRAINT [FK_DSRowsIdToOrganizationAdministrationRoute_AdministrationRoutes]
GO
ALTER TABLE [dbo].[DSRowsIdToOrganizationAdministrationRoute]  WITH CHECK ADD  CONSTRAINT [FK_DSRowsIdToOrganizationAdministrationRoute_DSRows] FOREIGN KEY([dsRowsID])
REFERENCES [dbo].[DSRows] ([id])
GO
ALTER TABLE [dbo].[DSRowsIdToOrganizationAdministrationRoute] CHECK CONSTRAINT [FK_DSRowsIdToOrganizationAdministrationRoute_DSRows]
GO
ALTER TABLE [dbo].[DSRowsIdToOrganizationAdministrationRoute]  WITH CHECK ADD  CONSTRAINT [FK_DSRowsIdToOrganizationAdministrationRoute_Organizations] FOREIGN KEY([organizationID])
REFERENCES [dbo].[Organizations] ([id])
GO
ALTER TABLE [dbo].[DSRowsIdToOrganizationAdministrationRoute] CHECK CONSTRAINT [FK_DSRowsIdToOrganizationAdministrationRoute_Organizations]
GO
ALTER TABLE [dbo].[MedicineToDSRows]  WITH CHECK ADD  CONSTRAINT [FK_MedicineToDSRows_DSRows] FOREIGN KEY([DSRowsId])
REFERENCES [dbo].[DSRows] ([id])
GO
ALTER TABLE [dbo].[MedicineToDSRows] CHECK CONSTRAINT [FK_MedicineToDSRows_DSRows]
GO
ALTER TABLE [dbo].[MedicineToDSRows]  WITH CHECK ADD  CONSTRAINT [FK_MedicineToDSRows_Medicine] FOREIGN KEY([medicineId])
REFERENCES [dbo].[Medicine] ([id])
GO
ALTER TABLE [dbo].[MedicineToDSRows] CHECK CONSTRAINT [FK_MedicineToDSRows_Medicine]
GO
ALTER TABLE [dbo].[MedicineToMechanismMoleclar]  WITH CHECK ADD  CONSTRAINT [FK_MedicineToMechanismMoleclar_MechanismMolecular] FOREIGN KEY([mechanismMolecularId])
REFERENCES [dbo].[MechanismMolecular] ([id])
GO
ALTER TABLE [dbo].[MedicineToMechanismMoleclar] CHECK CONSTRAINT [FK_MedicineToMechanismMoleclar_MechanismMolecular]
GO
ALTER TABLE [dbo].[MedicineToMechanismMoleclar]  WITH CHECK ADD  CONSTRAINT [FK_MedicineToMechanismMoleclar_Medicine] FOREIGN KEY([medicineId])
REFERENCES [dbo].[Medicine] ([id])
GO
ALTER TABLE [dbo].[MedicineToMechanismMoleclar] CHECK CONSTRAINT [FK_MedicineToMechanismMoleclar_Medicine]
GO
ALTER TABLE [dbo].[MedicineToNameCode]  WITH CHECK ADD  CONSTRAINT [FK_MedicineToNameCode_MedicineToNameCode] FOREIGN KEY([medicineId])
REFERENCES [dbo].[Medicine] ([id])
GO
ALTER TABLE [dbo].[MedicineToNameCode] CHECK CONSTRAINT [FK_MedicineToNameCode_MedicineToNameCode]
GO
ALTER TABLE [dbo].[MedicineToNameCode]  WITH CHECK ADD  CONSTRAINT [FK_MedicineToNameCode_NamesCodes] FOREIGN KEY([nameCodeId])
REFERENCES [dbo].[NamesCodes] ([id])
GO
ALTER TABLE [dbo].[MedicineToNameCode] CHECK CONSTRAINT [FK_MedicineToNameCode_NamesCodes]
GO
ALTER TABLE [dbo].[MedicineToNamesBrand]  WITH CHECK ADD  CONSTRAINT [FK_MedicineToNamesBrand_Medicine] FOREIGN KEY([medicineId])
REFERENCES [dbo].[Medicine] ([id])
GO
ALTER TABLE [dbo].[MedicineToNamesBrand] CHECK CONSTRAINT [FK_MedicineToNamesBrand_Medicine]
GO
ALTER TABLE [dbo].[MedicineToNamesBrand]  WITH CHECK ADD  CONSTRAINT [FK_MedicineToNamesBrand_NamesBrand] FOREIGN KEY([namesBrandId])
REFERENCES [dbo].[NamesBrand] ([id])
GO
ALTER TABLE [dbo].[MedicineToNamesBrand] CHECK CONSTRAINT [FK_MedicineToNamesBrand_NamesBrand]
GO
ALTER TABLE [dbo].[MedicineToNamesGeneric]  WITH CHECK ADD  CONSTRAINT [FK_MedicineToNamesGeneric_Medicine] FOREIGN KEY([medicineId])
REFERENCES [dbo].[Medicine] ([id])
GO
ALTER TABLE [dbo].[MedicineToNamesGeneric] CHECK CONSTRAINT [FK_MedicineToNamesGeneric_Medicine]
GO
ALTER TABLE [dbo].[MedicineToNamesGeneric]  WITH CHECK ADD  CONSTRAINT [FK_MedicineToNamesGeneric_NamesGeneric] FOREIGN KEY([namesGeneriId])
REFERENCES [dbo].[NamesGeneric] ([id])
GO
ALTER TABLE [dbo].[MedicineToNamesGeneric] CHECK CONSTRAINT [FK_MedicineToNamesGeneric_NamesGeneric]
GO
USE [master]
GO
ALTER DATABASE [Genospace] SET  READ_WRITE 
GO
