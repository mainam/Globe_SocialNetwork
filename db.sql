USE [master]
GO
/****** Object:  Database [wdmfglrf_SOCIAL_NETWORK]    Script Date: 4/26/2017 1:18:41 PM ******/
CREATE DATABASE [wdmfglrf_SOCIAL_NETWORK]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'wdmfglrf_SOCIAL_NETWORK', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\wdmfglrf_SOCIAL_NETWORK.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'wdmfglrf_SOCIAL_NETWORK_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\wdmfglrf_SOCIAL_NETWORK_log.ldf' , SIZE = 2304KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [wdmfglrf_SOCIAL_NETWORK].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET ARITHABORT OFF 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET  ENABLE_BROKER 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET RECOVERY FULL 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET  MULTI_USER 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET DB_CHAINING OFF 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'wdmfglrf_SOCIAL_NETWORK', N'ON'
GO
USE [wdmfglrf_SOCIAL_NETWORK]
GO
/****** Object:  User [wdmfglrf_SOTAYCHEMGIO]    Script Date: 4/26/2017 1:18:41 PM ******/
CREATE USER [wdmfglrf_SOTAYCHEMGIO] FOR LOGIN [wdmfglrf_SOTAYCHEMGIO] WITH DEFAULT_SCHEMA=[wdmfglrf_SOTAYCHEMGIO]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [wdmfglrf_SOTAYCHEMGIO]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [wdmfglrf_SOTAYCHEMGIO]
GO
ALTER ROLE [db_datareader] ADD MEMBER [wdmfglrf_SOTAYCHEMGIO]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [wdmfglrf_SOTAYCHEMGIO]
GO
/****** Object:  Schema [wdmfglrf_mainam]    Script Date: 4/26/2017 1:18:41 PM ******/
CREATE SCHEMA [wdmfglrf_mainam]
GO
/****** Object:  Schema [wdmfglrf_SOTAYCHEMGIO]    Script Date: 4/26/2017 1:18:41 PM ******/
CREATE SCHEMA [wdmfglrf_SOTAYCHEMGIO]
GO
/****** Object:  Table [dbo].[tbComment]    Script Date: 4/26/2017 1:18:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbComment](
	[CreatedBy] [nvarchar](50) NOT NULL,
	[PostId] [int] NOT NULL,
	[Id] [nvarchar](50) NOT NULL,
	[Content] [nvarchar](50) NOT NULL,
	[CreatedDate] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbDevice]    Script Date: 4/26/2017 1:18:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbDevice](
	[DeviceId] [nvarchar](50) NOT NULL,
	[Token] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbFriend]    Script Date: 4/26/2017 1:18:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbFriend](
	[UserName] [nvarchar](50) NOT NULL,
	[Friend] [nvarchar](50) NOT NULL,
	[FollowDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tbFriend] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC,
	[Friend] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbImage]    Script Date: 4/26/2017 1:18:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageUrl] [nvarchar](255) NOT NULL,
	[UploadedBy] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbImagePost]    Script Date: 4/26/2017 1:18:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbImagePost](
	[PostId] [int] NOT NULL,
	[ImageId] [int] NOT NULL,
 CONSTRAINT [PK_tbImagePost] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC,
	[ImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbLike]    Script Date: 4/26/2017 1:18:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbLike](
	[UserName] [nvarchar](50) NOT NULL,
	[PostId] [int] NOT NULL,
	[LikeDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tbLike] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC,
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbPost]    Script Date: 4/26/2017 1:18:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPost](
	[CreatedBy] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tbPost] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbUser]    Script Date: 4/26/2017 1:18:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbUser](
	[UserName] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[LastLogin] [float] NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[Token] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbUser] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[tbDevice] ([DeviceId], [Token], [UserName]) VALUES (N'716a8596f6750308', N'fNrZH5Odnnc:APA91bHd55krmmgZ7Spc-IvIWK8h3yPQnaqsdD3tXr5qwMjOJr8yh3DwnTVN7L5mYgtgHILU-7jtYGjyblIHUqScAtiPQCtocY6OD-fK2xPud-OyNe1K4DOJ_KCnQDp9AmOjkVCeZxkl', N'mainam12a')
INSERT [dbo].[tbDevice] ([DeviceId], [Token], [UserName]) VALUES (N'c68bd700a9990a3d', N'fW9dbXUMKTA:APA91bFLeQfhtcZ4hGEsYkVGpD0Acp_QnwwxPZOCSoEMDwhr0R37mit-lDmDZ9XjGJzRgb9Z3E6A8KpSm6lek2ZOb99KluveRPU1iphajgdB4l91BS3xPiRmLKnkbcOU0yUyTawXrZ1J', N'RedHat777')
INSERT [dbo].[tbDevice] ([DeviceId], [Token], [UserName]) VALUES (N'e817d5faacb5dfba', N'cKOxuEfq0IA:APA91bGfmIKuSPENDmeB3sDK_7EZGJur7-EnCZeiJFkYpkhrCZ6_nPgDUYo6F-IWK4T8-HApG0CqpTxPFO5D3Rta8ibMpZpWdIijuqcs7C0oza9P1iPBJzzaJ8sAA9ALHQnz3ZkxvJEQ', N'Zeref12')
INSERT [dbo].[tbDevice] ([DeviceId], [Token], [UserName]) VALUES (N'eec789de46016f78', N'd2moMgqJ4h0:APA91bG6osfB_0QdzaRze_tzGQZVg1DPwiFkXwDgnBO6yT9iXHboJ5SVlygoYd64SdNUnqNAH9v6d_Y64yl6RgS_abHPrZ4cVJCIqwCt_ar1eu6tTl257D8rXiyAAgzR1jWeh7iYYGwb', N'1')
INSERT [dbo].[tbDevice] ([DeviceId], [Token], [UserName]) VALUES (N'75d4d628b663b4cf', N'', N'nguyenloc')
INSERT [dbo].[tbDevice] ([DeviceId], [Token], [UserName]) VALUES (N'881a24379c470c36', N'cs-wItZfKe0:APA91bHM-Yt-7lgXFx5QFqT5yZvGaMh52rC7wXB9qc7-lwFeDkHzjrZal2MRCem_Et3DDsrQ8DTWSTeDW_AKgTmtTouG5TOurH1UTZm0pA3NnTmKCFtdd8DkJRXPPzqHdX1qOzI361Dv', N'admin')
INSERT [dbo].[tbDevice] ([DeviceId], [Token], [UserName]) VALUES (N'1381450758771f9b', N'eG-rzY2kC84:APA91bGr8NBZMUxTDdR2L1x5ZNOJRuHaoPnN-I4ff2CMmSrmxndJpc7rEl-GcyWyiub401haAO6xv18VF2QqnsOKsnFKgw51OEa3OgaSNrVox4gsqU6E_zRsBSWeu1aY92szzNkIXaiC', N'congtan9090')
INSERT [dbo].[tbDevice] ([DeviceId], [Token], [UserName]) VALUES (N'c76d72f91f4a2991', N'dn5LdA8ryKc:APA91bHrzG4IlZp1fgan9SOCO7dDEELdXwmYNJVyb8qP4PbyldteTTV4QFg6xJWEeOImTE5O9B12vG1jURTumHrnR1lrmW2-CS-qNaRG5jLRmscDzOf2RwqsUNh8MgHFTqQcHF-dUYGo', N'RedHat777')
INSERT [dbo].[tbDevice] ([DeviceId], [Token], [UserName]) VALUES (N'91953e75723f36a9', N'cU57u7Fe99g:APA91bFfFGUi-R1J0vROkqq-xqN1q5mJa_ZAkJ38mDC4kGCK0JM5YUNyTEbiXeb2DP5X1ZYLoqXif_IUCOv5JjYTNvUCuwBuhu_WMG_q5gwWvrp7f_20iBu-oVkhTuGQODI-iFZIs-pd', N'admin')
INSERT [dbo].[tbUser] ([UserName], [FullName], [Password], [Email], [LastLogin], [ImageUrl], [Token]) VALUES (N'1', N'2', N'1', N'3@gmail.com', 1491095515909.5098, N'', N'f4bf86f73528634003da836f96a6f9fda996e528')
INSERT [dbo].[tbUser] ([UserName], [FullName], [Password], [Email], [LastLogin], [ImageUrl], [Token]) VALUES (N'admin', N'admin', N'admin', N'admin@admin', 1492932849401.4246, N'', N'111fb618f4bd4eb2df452bae3a8ae3345e14dabd')
INSERT [dbo].[tbUser] ([UserName], [FullName], [Password], [Email], [LastLogin], [ImageUrl], [Token]) VALUES (N'admin22', N'admin22', N'123', N'abc@gmail.com', -62135596800000, N'', N'f56edbf3cbdb6556e8544e6f88d6f80547978edb')
INSERT [dbo].[tbUser] ([UserName], [FullName], [Password], [Email], [LastLogin], [ImageUrl], [Token]) VALUES (N'alone', N'aloneb', N'12345', N'phamdong1995@hotmail.com', -62135596800000, N'', N'3255233117b9a9da10613bdefe2defa61f049bb9')
INSERT [dbo].[tbUser] ([UserName], [FullName], [Password], [Email], [LastLogin], [ImageUrl], [Token]) VALUES (N'cong tan', N'tru9ongcongtan', N'123456789', N'congtan.fix@gmail.com', -62135596800000, N'', N'25f17d2178f15453a79afc8c69b8c699a7ae1af1')
INSERT [dbo].[tbUser] ([UserName], [FullName], [Password], [Email], [LastLogin], [ImageUrl], [Token]) VALUES (N'congtan', N'congtanthao', N'123456789', N'thao90@gmail.com', -62135596800000, N'', N'c3bb44c70541ee714ec6a1bb4cabb4bc683d8141')
INSERT [dbo].[tbUser] ([UserName], [FullName], [Password], [Email], [LastLogin], [ImageUrl], [Token]) VALUES (N'congtan9090', N'congtan999', N'01234567890', N'congtan.fix90@gmail.com', -62135596800000, N'', N'0e0ec4052a8a6cfd832f55c355ec3512f75dfc8a')
INSERT [dbo].[tbUser] ([UserName], [FullName], [Password], [Email], [LastLogin], [ImageUrl], [Token]) VALUES (N'loc', N'nguyenloc', N'xitrum', N'xitrumblabla@gmail.com', 1491404753862.8245, N'', N'f31e01fdabebeeaa3f773fbaadabaa977912dbeb')
INSERT [dbo].[tbUser] ([UserName], [FullName], [Password], [Email], [LastLogin], [ImageUrl], [Token]) VALUES (N'mainam', N'mai ngoc nam', N'123456', N'mainam.ctk33@gmail.com', 1491123121753.1909, N'', N'069c8103672a37da2d35e8cba58cba73575c3d2a')
INSERT [dbo].[tbUser] ([UserName], [FullName], [Password], [Email], [LastLogin], [ImageUrl], [Token]) VALUES (N'mainam12a', N'maingocnam', N'mailuong', N'mainam12a@gmail.com', -62135596800000, N'/v0/b/socnetwork-142503.appspot.com/o/Avatar/debb260a-a17f-469a-8280-beb195681d07', N'501c8d5ba24237d12dc17a87afb87a8c1760de42')
INSERT [dbo].[tbUser] ([UserName], [FullName], [Password], [Email], [LastLogin], [ImageUrl], [Token]) VALUES (N'nguyenloc', N'nguyenloc', N'1234567', N'fsefsef@gmail.com', -62135596800000, N'', N'82ef6883ab52ccc12916c5dc11fdc151646b0652')
INSERT [dbo].[tbUser] ([UserName], [FullName], [Password], [Email], [LastLogin], [ImageUrl], [Token]) VALUES (N'RedHat188', N'Nguyễn Trung', N'trung', N'trungceramics1@gmail.com', -62135596800000, N'', N'438a684291d90418e2171a34b5c34b717e124bd9')
INSERT [dbo].[tbUser] ([UserName], [FullName], [Password], [Email], [LastLogin], [ImageUrl], [Token]) VALUES (N'RedHat444', N'Nguyen Trung', N'trung', N'dfghkfsdgh', -62135596800000, N'', N'a27dfaa4d305822f84553b140f2140155406fc05')
INSERT [dbo].[tbUser] ([UserName], [FullName], [Password], [Email], [LastLogin], [ImageUrl], [Token]) VALUES (N'RedHat777', N'Nguyen Trung', N'trung', N'trungceramics@gmail.com', 1492933253448.3484, N'', N'e388c6ee76679e2c7bb6597b5ab7b56b6cc4b467')
INSERT [dbo].[tbUser] ([UserName], [FullName], [Password], [Email], [LastLogin], [ImageUrl], [Token]) VALUES (N'tan', N'truongcongtan', N'123456789', N'congtan90@gmail.com', -62135596800000, N'', N'd7c2c8d3ca4e02340af78737be037b1f7e4cb84e')
INSERT [dbo].[tbUser] ([UserName], [FullName], [Password], [Email], [LastLogin], [ImageUrl], [Token]) VALUES (N'xitrum', N'xitrum', N'123456', N'nguyenloc2309@gmail.com', 1491714132098.1504, N'', N'9ed70f98f8e5c3429fc8c9a5040a505c8561cae5')
INSERT [dbo].[tbUser] ([UserName], [FullName], [Password], [Email], [LastLogin], [ImageUrl], [Token]) VALUES (N'Zeref12', N'hghhg', N'trung', N'gt@gt', -62135596800000, N'/v0/b/socnetwork-142503.appspot.com/o/Avatar/7045531e-156c-41c9-b4e3-ecea636ca039', N'63db636b9abcfc8fd8eaf733f8433f7ea6933fbc')
INSERT [dbo].[tbUser] ([UserName], [FullName], [Password], [Email], [LastLogin], [ImageUrl], [Token]) VALUES (N'Zeref3', N'Nguyễn Kỳ Phương', N'trung', N'fffff@fff', -62135596800000, N'/v0/b/socnetwork-142503.appspot.com/o/Avatar/5a7be1d1-97bb-43b0-8e7a-007f9cff3d64', N'3729f732dc4aa620b8ce4f28c3f28c9cedda524a')
ALTER TABLE [dbo].[tbComment]  WITH CHECK ADD  CONSTRAINT [FK_tbComment_tbPost] FOREIGN KEY([PostId])
REFERENCES [dbo].[tbPost] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbComment] CHECK CONSTRAINT [FK_tbComment_tbPost]
GO
ALTER TABLE [dbo].[tbComment]  WITH CHECK ADD  CONSTRAINT [FK_tbComment_tbUser] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tbUser] ([UserName])
GO
ALTER TABLE [dbo].[tbComment] CHECK CONSTRAINT [FK_tbComment_tbUser]
GO
ALTER TABLE [dbo].[tbDevice]  WITH CHECK ADD  CONSTRAINT [FK_tbDevice_tbUser] FOREIGN KEY([UserName])
REFERENCES [dbo].[tbUser] ([UserName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbDevice] CHECK CONSTRAINT [FK_tbDevice_tbUser]
GO
ALTER TABLE [dbo].[tbFriend]  WITH CHECK ADD  CONSTRAINT [FK_tbFriend_tbUser] FOREIGN KEY([UserName])
REFERENCES [dbo].[tbUser] ([UserName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbFriend] CHECK CONSTRAINT [FK_tbFriend_tbUser]
GO
ALTER TABLE [dbo].[tbFriend]  WITH CHECK ADD  CONSTRAINT [FK_tbFriend_tbUser2] FOREIGN KEY([Friend])
REFERENCES [dbo].[tbUser] ([UserName])
GO
ALTER TABLE [dbo].[tbFriend] CHECK CONSTRAINT [FK_tbFriend_tbUser2]
GO
ALTER TABLE [dbo].[tbImage]  WITH CHECK ADD  CONSTRAINT [FK_tbImage_tbUser] FOREIGN KEY([UploadedBy])
REFERENCES [dbo].[tbUser] ([UserName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbImage] CHECK CONSTRAINT [FK_tbImage_tbUser]
GO
ALTER TABLE [dbo].[tbImagePost]  WITH CHECK ADD  CONSTRAINT [FK_tbImagePost_tbImage] FOREIGN KEY([ImageId])
REFERENCES [dbo].[tbImage] ([Id])
GO
ALTER TABLE [dbo].[tbImagePost] CHECK CONSTRAINT [FK_tbImagePost_tbImage]
GO
ALTER TABLE [dbo].[tbImagePost]  WITH CHECK ADD  CONSTRAINT [FK_tbImagePost_tbPost] FOREIGN KEY([PostId])
REFERENCES [dbo].[tbPost] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbImagePost] CHECK CONSTRAINT [FK_tbImagePost_tbPost]
GO
ALTER TABLE [dbo].[tbLike]  WITH CHECK ADD  CONSTRAINT [FK_tbLike_tbPost] FOREIGN KEY([PostId])
REFERENCES [dbo].[tbPost] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbLike] CHECK CONSTRAINT [FK_tbLike_tbPost]
GO
ALTER TABLE [dbo].[tbLike]  WITH CHECK ADD  CONSTRAINT [FK_tbLike_tbUser] FOREIGN KEY([UserName])
REFERENCES [dbo].[tbUser] ([UserName])
GO
ALTER TABLE [dbo].[tbLike] CHECK CONSTRAINT [FK_tbLike_tbUser]
GO
ALTER TABLE [dbo].[tbPost]  WITH CHECK ADD  CONSTRAINT [FK_tbPost_tbUser] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[tbUser] ([UserName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbPost] CHECK CONSTRAINT [FK_tbPost_tbUser]
GO
USE [master]
GO
ALTER DATABASE [wdmfglrf_SOCIAL_NETWORK] SET  READ_WRITE 
GO
