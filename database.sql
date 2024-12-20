USE [master]
GO
/****** Object:  Database [us_erab]    Script Date: 16/12/2024 21:52:52 ******/
CREATE DATABASE [us_erab]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'us_erab', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\us_erab.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'us_erab_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\us_erab_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [us_erab] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [us_erab].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [us_erab] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [us_erab] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [us_erab] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [us_erab] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [us_erab] SET ARITHABORT OFF 
GO
ALTER DATABASE [us_erab] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [us_erab] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [us_erab] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [us_erab] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [us_erab] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [us_erab] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [us_erab] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [us_erab] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [us_erab] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [us_erab] SET  DISABLE_BROKER 
GO
ALTER DATABASE [us_erab] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [us_erab] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [us_erab] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [us_erab] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [us_erab] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [us_erab] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [us_erab] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [us_erab] SET RECOVERY FULL 
GO
ALTER DATABASE [us_erab] SET  MULTI_USER 
GO
ALTER DATABASE [us_erab] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [us_erab] SET DB_CHAINING OFF 
GO
ALTER DATABASE [us_erab] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [us_erab] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [us_erab] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'us_erab', N'ON'
GO
ALTER DATABASE [us_erab] SET QUERY_STORE = OFF
GO
USE [us_erab]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [us_erab]
GO
/****** Object:  Table [dbo].[urlshortener_history]    Script Date: 16/12/2024 21:52:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[urlshortener_history](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[shortened_url] [nvarchar](max) NULL,
	[previous_url] [nvarchar](max) NULL,
	[click_count] [int] NULL,
	[expiration_time] [datetime] NULL,
	[expirate_time] [nvarchar](max) NULL,
 CONSTRAINT [PK_urlshortener_history] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [us_erab] SET  READ_WRITE 
GO
