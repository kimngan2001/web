USE [master]
GO
/****** Object:  Database [KinhDoanhLapTop]    Script Date: 10/26/2021 8:23:45 PM ******/
CREATE DATABASE [KinhDoanhLapTop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KinhDoanhLapTop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.KIMNGAN\MSSQL\DATA\KinhDoanhLapTop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KinhDoanhLapTop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.KIMNGAN\MSSQL\DATA\KinhDoanhLapTop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [KinhDoanhLapTop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KinhDoanhLapTop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KinhDoanhLapTop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KinhDoanhLapTop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KinhDoanhLapTop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KinhDoanhLapTop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KinhDoanhLapTop] SET ARITHABORT OFF 
GO
ALTER DATABASE [KinhDoanhLapTop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [KinhDoanhLapTop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KinhDoanhLapTop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KinhDoanhLapTop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KinhDoanhLapTop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KinhDoanhLapTop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KinhDoanhLapTop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KinhDoanhLapTop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KinhDoanhLapTop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KinhDoanhLapTop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [KinhDoanhLapTop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KinhDoanhLapTop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KinhDoanhLapTop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KinhDoanhLapTop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KinhDoanhLapTop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KinhDoanhLapTop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KinhDoanhLapTop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KinhDoanhLapTop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KinhDoanhLapTop] SET  MULTI_USER 
GO
ALTER DATABASE [KinhDoanhLapTop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KinhDoanhLapTop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KinhDoanhLapTop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KinhDoanhLapTop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KinhDoanhLapTop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KinhDoanhLapTop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [KinhDoanhLapTop] SET QUERY_STORE = OFF
GO
USE [KinhDoanhLapTop]
GO
/****** Object:  Table [dbo].[ThongTinSP]    Script Date: 10/26/2021 8:23:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinSP](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](50) NOT NULL,
	[ImageDataName] [varchar](30) NOT NULL,
	[GiaSP] [int] NOT NULL,
	[ThoiGianBaoHanh] [nvarchar](50) NOT NULL,
	[XuatXu] [nvarchar](50) NOT NULL,
	[ThongSo] [nvarchar](1000) NOT NULL,
	[SoLuongTon] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[f_ChiTietSanPham]    Script Date: 10/26/2021 8:23:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Function
--Dung
CREATE function [dbo].[f_ChiTietSanPham](@MaSP int)
returns table
as
return
( select TenSP,GiaSP, ThoiGianBaoHanh, XuatXu, ThongSo
 from ThongTinSP
 where ThongTinSP.MaSP = @MaSP)
GO
/****** Object:  Table [dbo].[HoaDonBanHang]    Script Date: 10/26/2021 8:23:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonBanHang](
	[MaHDBH] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[firstlastname] [nvarchar](50) NOT NULL,
	[diachi] [nvarchar](50) NOT NULL,
	[numberphone] [nvarchar](50) NOT NULL,
	[gender] [nvarchar](50) NOT NULL,
	[nationality] [nvarchar](50) NOT NULL,
	[noted] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHDBH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[HoaDonBanHang_views]    Script Date: 10/26/2021 8:23:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 --views
 --Dung
 CREATE VIEW [dbo].[HoaDonBanHang_views] AS
select  username, firstlastname, diachi, numberphone
from HoaDonBanHang
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10/26/2021 8:23:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id_Account] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[PassWord] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 10/26/2021 8:23:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[MaSP] [int] NOT NULL,
	[TenSP] [nvarchar](50) NOT NULL,
	[GiaSP] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDonDatHang]    Script Date: 10/26/2021 8:23:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonDatHang](
	[MaHDDH] [int] IDENTITY(1,1) NOT NULL,
	[MaNCC] [int] NOT NULL,
	[MaNV] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[NgayLapHoaDonDatHang] [date] NOT NULL,
	[GiaTri] [int] NOT NULL,
	[SoLuongDat] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 10/26/2021 8:23:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[SDT] [nvarchar](50) NOT NULL,
	[Gmail] [nvarchar](50) NOT NULL,
	[Id_Account] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 10/26/2021 8:23:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[DienThoai] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 10/26/2021 8:23:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [char](50) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[SDT] [nvarchar](50) NOT NULL,
	[QueQuan] [nvarchar](50) NOT NULL,
	[STK] [nvarchar](50) NOT NULL,
	[Id_Account] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongTinUuDai]    Script Date: 10/26/2021 8:23:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinUuDai](
	[MaKH] [int] NOT NULL,
	[MaHDBH] [int] NOT NULL,
	[DiemTichLuy] [int] NOT NULL,
	[ThoiGianTichLuy] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [indexChiTietSanPHam]    Script Date: 10/26/2021 8:23:45 PM ******/
CREATE NONCLUSTERED INDEX [indexChiTietSanPHam] ON [dbo].[ThongTinSP]
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_MaSP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[ThongTinSP] ([MaSP])
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_MaSP]
GO
ALTER TABLE [dbo].[HoaDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonDatHang_MaNCC] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[HoaDonDatHang] CHECK CONSTRAINT [FK_HoaDonDatHang_MaNCC]
GO
ALTER TABLE [dbo].[HoaDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonDatHang_MaNV] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDonDatHang] CHECK CONSTRAINT [FK_HoaDonDatHang_MaNV]
GO
ALTER TABLE [dbo].[HoaDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonDatHang_MaSP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[ThongTinSP] ([MaSP])
GO
ALTER TABLE [dbo].[HoaDonDatHang] CHECK CONSTRAINT [FK_HoaDonDatHang_MaSP]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_KhachHang_Id_Account] FOREIGN KEY([Id_Account])
REFERENCES [dbo].[Account] ([Id_Account])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK_KhachHang_Id_Account]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_Id_Account] FOREIGN KEY([Id_Account])
REFERENCES [dbo].[Account] ([Id_Account])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_Id_Account]
GO
ALTER TABLE [dbo].[ThongTinUuDai]  WITH CHECK ADD  CONSTRAINT [FK_ThongTinUuDai_MaHDBH] FOREIGN KEY([MaHDBH])
REFERENCES [dbo].[HoaDonBanHang] ([MaHDBH])
GO
ALTER TABLE [dbo].[ThongTinUuDai] CHECK CONSTRAINT [FK_ThongTinUuDai_MaHDBH]
GO
ALTER TABLE [dbo].[ThongTinUuDai]  WITH CHECK ADD  CONSTRAINT [FK_ThongTinUuDai_MaKH] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[ThongTinUuDai] CHECK CONSTRAINT [FK_ThongTinUuDai_MaKH]
GO
/****** Object:  StoredProcedure [dbo].[Insert_GioHang]    Script Date: 10/26/2021 8:23:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--PROCEDURE
CREATE PROCEDURE [dbo].[Insert_GioHang]
@MaSP int,
@TenSP NVARCHAR(50),
@GiaSP int
AS
Begin
 INSERT INTO dbo.GioHang
(MaSP,TenSP,GiaSP) VALUES
(@MaSP,@TenSP,@GiaSP);
End
GO
/****** Object:  StoredProcedure [dbo].[Insert_HoaDonBanHang]    Script Date: 10/26/2021 8:23:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Dung
CREATE PROCEDURE [dbo].[Insert_HoaDonBanHang]
	@username NVARCHAR(50),
	@firstlastname  NVARCHAR(50),
	@diachi  NVARCHAR(50) ,
	@numberphone  NVARCHAR(50) ,
	@gender  NVARCHAR(50) ,
	@nationality NVARCHAR(50),
	@noted NVARCHAR(50)
AS
Begin
 INSERT INTO dbo.HoaDonBanHang
(username, firstlastname, diachi, numberphone, gender, nationality, noted) VALUES
(@username,@firstlastname,@diachi,@numberphone,@gender,@nationality,@noted);
End
GO
USE [master]
GO
ALTER DATABASE [KinhDoanhLapTop] SET  READ_WRITE 
GO
