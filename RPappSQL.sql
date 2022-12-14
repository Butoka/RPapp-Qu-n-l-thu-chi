USE [master]
GO
/****** Object:  Database [RPapp]    Script Date: 30/10/2022 10:49:43 AM ******/
CREATE DATABASE [RPapp]
ALTER DATABASE [RPapp] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RPapp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RPapp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RPapp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RPapp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RPapp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RPapp] SET ARITHABORT OFF 
GO
ALTER DATABASE [RPapp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RPapp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RPapp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RPapp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RPapp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RPapp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RPapp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RPapp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RPapp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RPapp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RPapp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RPapp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RPapp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RPapp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RPapp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RPapp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RPapp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RPapp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RPapp] SET  MULTI_USER 
GO
ALTER DATABASE [RPapp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RPapp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RPapp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RPapp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RPapp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RPapp] SET QUERY_STORE = OFF
GO
USE [RPapp]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 30/10/2022 10:49:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](8) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[gender] [bit] NOT NULL,
	[email] [nvarchar](20) NOT NULL,
	[active] [bit] NOT NULL,
	[role] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 30/10/2022 10:49:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[pays] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pays]    Script Date: 30/10/2022 10:49:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pays](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[money] [float] NOT NULL,
	[createdate] [datetime] NOT NULL,
	[category] [int] NOT NULL,
	[createuser] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Receipts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receives]    Script Date: 30/10/2022 10:49:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receives](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[money] [float] NOT NULL,
	[createdate] [date] NOT NULL,
	[category] [int] NOT NULL,
	[createuser] [nvarchar](50) NOT NULL,
	[levels] [bit] NOT NULL,
 CONSTRAINT [PK_Receives] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 30/10/2022 10:49:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [nvarchar](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([username], [password], [fullname], [gender], [email], [active], [role]) VALUES (N'admin', N'123', N'Nguyễn Văn Tèo Em ', 1, N'nguyenteo@gmail.com', 1, N'admin')
INSERT [dbo].[Accounts] ([username], [password], [fullname], [gender], [email], [active], [role]) VALUES (N'teonv', N'123', N'Nguyễn Văn Tèo Anh', 1, N'teonv@gmail.com', 1, N'manager')
INSERT [dbo].[Accounts] ([username], [password], [fullname], [gender], [email], [active], [role]) VALUES (N'teonv1', N'123', N'Nguyễn Văn Tèo', 1, N'teonv1@gmail.com', 0, N'content')
INSERT [dbo].[Accounts] ([username], [password], [fullname], [gender], [email], [active], [role]) VALUES (N'teonv2', N'123', N'Nguyễn Văn TÈo 2', 1, N'teonv2@gmail.com', 1, N'content')
INSERT [dbo].[Accounts] ([username], [password], [fullname], [gender], [email], [active], [role]) VALUES (N'teonv3', N'123', N'Nguyễn Văn Tèo 2', 1, N'teonv3@gmail.com', 1, N'manager')
INSERT [dbo].[Accounts] ([username], [password], [fullname], [gender], [email], [active], [role]) VALUES (N'teonv5', N'123456', N'Nguyễn Văn Tèo', 1, N'teonv5@gmail.com', 1, N'content')
INSERT [dbo].[Accounts] ([username], [password], [fullname], [gender], [email], [active], [role]) VALUES (N'tranhl@123', N'123', N'Hồ Lý Trân2', 1, N'holytra@gmail.com', 0, N'admin')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([id], [name], [pays]) VALUES (1, N'Ăn uống', 1)
INSERT [dbo].[Categories] ([id], [name], [pays]) VALUES (2, N'Vệ sinh', 1)
INSERT [dbo].[Categories] ([id], [name], [pays]) VALUES (3, N'Bảo vệ', 1)
INSERT [dbo].[Categories] ([id], [name], [pays]) VALUES (4, N'Tắm rửa 2', 1)
INSERT [dbo].[Categories] ([id], [name], [pays]) VALUES (5, N'Ăn uống', 0)
INSERT [dbo].[Categories] ([id], [name], [pays]) VALUES (7, N'Đi lại ', 0)
INSERT [dbo].[Categories] ([id], [name], [pays]) VALUES (8, N'Đi du lịch', 0)
INSERT [dbo].[Categories] ([id], [name], [pays]) VALUES (9, N'Rửa tiền', 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Pays] ON 

INSERT [dbo].[Pays] ([id], [name], [money], [createdate], [category], [createuser]) VALUES (2, N'Đi xe ôm', 24000, CAST(N'2022-12-20T12:00:00.000' AS DateTime), 1, N'admin')
INSERT [dbo].[Pays] ([id], [name], [money], [createdate], [category], [createuser]) VALUES (3, N'Bàn chải đánh răng', 20000, CAST(N'2022-10-27T00:00:00.000' AS DateTime), 5, N'admin')
INSERT [dbo].[Pays] ([id], [name], [money], [createdate], [category], [createuser]) VALUES (4, N'Trả tiền giữ xe', 1000, CAST(N'2022-12-01T15:30:24.000' AS DateTime), 3, N'teonv')
SET IDENTITY_INSERT [dbo].[Pays] OFF
GO
SET IDENTITY_INSERT [dbo].[Receives] ON 

INSERT [dbo].[Receives] ([id], [name], [money], [createdate], [category], [createuser], [levels]) VALUES (1, N'Thu tiền ăn sáng', 12000, CAST(N'2022-02-01' AS Date), 5, N'admin', 1)
INSERT [dbo].[Receives] ([id], [name], [money], [createdate], [category], [createuser], [levels]) VALUES (2, N'Tiền giữ xe', 2, CAST(N'2022-01-01' AS Date), 7, N'admin', 1)
INSERT [dbo].[Receives] ([id], [name], [money], [createdate], [category], [createuser], [levels]) VALUES (3, N'Đi du lịch Thái Lan', 150000, CAST(N'2021-12-01' AS Date), 8, N'admin', 0)
INSERT [dbo].[Receives] ([id], [name], [money], [createdate], [category], [createuser], [levels]) VALUES (6, N'Thử nghiệm', 34000, CAST(N'2022-10-29' AS Date), 8, N'admin', 0)
SET IDENTITY_INSERT [dbo].[Receives] OFF
GO
INSERT [dbo].[Roles] ([id], [name]) VALUES (N'admin', N'Quản trị')
INSERT [dbo].[Roles] ([id], [name]) VALUES (N'content', N'Người dùng')
INSERT [dbo].[Roles] ([id], [name]) VALUES (N'manager', N'Quản lý')
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Roles] FOREIGN KEY([role])
REFERENCES [dbo].[Roles] ([id])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Roles]
GO
ALTER TABLE [dbo].[Pays]  WITH CHECK ADD  CONSTRAINT [FK_Pays_Accounts] FOREIGN KEY([createuser])
REFERENCES [dbo].[Accounts] ([username])
GO
ALTER TABLE [dbo].[Pays] CHECK CONSTRAINT [FK_Pays_Accounts]
GO
ALTER TABLE [dbo].[Pays]  WITH CHECK ADD  CONSTRAINT [FK_Pays_Categories] FOREIGN KEY([category])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Pays] CHECK CONSTRAINT [FK_Pays_Categories]
GO
ALTER TABLE [dbo].[Receives]  WITH CHECK ADD  CONSTRAINT [FK_Receives_Accounts] FOREIGN KEY([createuser])
REFERENCES [dbo].[Accounts] ([username])
GO
ALTER TABLE [dbo].[Receives] CHECK CONSTRAINT [FK_Receives_Accounts]
GO
ALTER TABLE [dbo].[Receives]  WITH CHECK ADD  CONSTRAINT [FK_Receives_Categories] FOREIGN KEY([category])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Receives] CHECK CONSTRAINT [FK_Receives_Categories]
GO
USE [master]
GO
ALTER DATABASE [RPapp] SET  READ_WRITE 
GO
