USE [master]
GO
/****** Object:  Database [Blogging]    Script Date: 2019/4/10 上午 09:49:37 ******/
CREATE DATABASE [Blogging]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Blogging', FILENAME = N'C:\Users\USER\Blogging.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Blogging_log', FILENAME = N'C:\Users\USER\Blogging_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Blogging] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Blogging].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Blogging] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Blogging] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Blogging] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Blogging] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Blogging] SET ARITHABORT OFF 
GO
ALTER DATABASE [Blogging] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Blogging] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Blogging] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Blogging] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Blogging] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Blogging] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Blogging] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Blogging] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Blogging] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Blogging] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Blogging] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Blogging] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Blogging] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Blogging] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Blogging] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Blogging] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Blogging] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Blogging] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Blogging] SET  MULTI_USER 
GO
ALTER DATABASE [Blogging] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Blogging] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Blogging] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Blogging] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Blogging] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Blogging] SET QUERY_STORE = OFF
GO
USE [Blogging]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Blogging]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 2019/4/10 上午 09:49:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogId] [int] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 2019/4/10 上午 09:49:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[BlogId] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([BlogId], [Url]) VALUES (1, N'http://blogs.msdn.com/dotnet')
INSERT [dbo].[Blog] ([BlogId], [Url]) VALUES (2, N'http://blogs.msdn.com/webdev')
INSERT [dbo].[Blog] ([BlogId], [Url]) VALUES (3, N'http://blogs.msdn.com/visualstudio')
SET IDENTITY_INSERT [dbo].[Blog] OFF
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_Blog_BlogId] FOREIGN KEY([BlogId])
REFERENCES [dbo].[Blog] ([BlogId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_Blog_BlogId]
GO
USE [master]
GO
ALTER DATABASE [Blogging] SET  READ_WRITE 
GO
