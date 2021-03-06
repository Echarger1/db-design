USE [master]
GO
/****** Object:  Database [Welp]    Script Date: 7/24/2016 8:21:41 PM ******/
CREATE DATABASE [Welp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Welp', FILENAME = N'D:\SQL\MSSQL12.MSSQLSERVER\MSSQL\DATA\Welp.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Welp_log', FILENAME = N'D:\SQL\MSSQL12.MSSQLSERVER\MSSQL\DATA\Welp_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Welp] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Welp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Welp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Welp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Welp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Welp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Welp] SET ARITHABORT OFF 
GO
ALTER DATABASE [Welp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Welp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Welp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Welp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Welp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Welp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Welp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Welp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Welp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Welp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Welp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Welp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Welp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Welp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Welp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Welp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Welp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Welp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Welp] SET  MULTI_USER 
GO
ALTER DATABASE [Welp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Welp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Welp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Welp] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Welp] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Welp]
GO
/****** Object:  Table [dbo].[BusinessRating]    Script Date: 7/24/2016 8:21:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessRating](
	[BusinessID] [int] NOT NULL,
	[Rating] [int] NOT NULL,
 CONSTRAINT [PK_BusinessRating_1] PRIMARY KEY CLUSTERED 
(
	[BusinessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/24/2016 8:21:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[restaurantID] [int] NULL,
	[serviceID] [int] NULL,
	[shoppingID] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/24/2016 8:21:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_BusinessRating] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[BusinessRating] ([BusinessID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_BusinessRating]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Users] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Users]
GO
USE [master]
GO
ALTER DATABASE [Welp] SET  READ_WRITE 
GO
