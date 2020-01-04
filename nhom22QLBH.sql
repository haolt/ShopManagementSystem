USE [master]
GO
/****** Object:  Database [QL_BanHang15]    Script Date: 4/1/2020 16:59:15 PM ******/
CREATE DATABASE [QL_BanHang15]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QL_BanHang15', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.PHUONGLH\MSSQL\DATA\QL_BanHang15.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QL_BanHang15_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.PHUONGLH\MSSQL\DATA\QL_BanHang15_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QL_BanHang15] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QL_BanHang15].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QL_BanHang15] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QL_BanHang15] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QL_BanHang15] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QL_BanHang15] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QL_BanHang15] SET ARITHABORT OFF 
GO
ALTER DATABASE [QL_BanHang15] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QL_BanHang15] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QL_BanHang15] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QL_BanHang15] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QL_BanHang15] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QL_BanHang15] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QL_BanHang15] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QL_BanHang15] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QL_BanHang15] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QL_BanHang15] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QL_BanHang15] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QL_BanHang15] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QL_BanHang15] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QL_BanHang15] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QL_BanHang15] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QL_BanHang15] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QL_BanHang15] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QL_BanHang15] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QL_BanHang15] SET  MULTI_USER 
GO
ALTER DATABASE [QL_BanHang15] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QL_BanHang15] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QL_BanHang15] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QL_BanHang15] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QL_BanHang15] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QL_BanHang15', N'ON'
GO
USE [QL_BanHang15]
GO
/****** Object:  Table [dbo].[ChiNhanh]    Script Date: 4/1/2020 16:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiNhanh](
	[IDChiNhanh] [char](10) NOT NULL,
	[TenChiNhanh] [nvarchar](50) NULL,
	[IDKhuVuc] [char](10) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SoLuongNVien] [int] NULL,
 CONSTRAINT [PK_ChiNhanh] PRIMARY KEY CLUSTERED 
(
	[IDChiNhanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTDonMuaHang]    Script Date: 4/1/2020 16:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTDonMuaHang](
	[IDHoaDon] [char](10) NOT NULL,
	[IDSanPham] [char](10) NOT NULL,
	[SoLuong] [int] NULL,
	[GiaBan] [money] NULL,
 CONSTRAINT [PK_CTDonMuaHang] PRIMARY KEY CLUSTERED 
(
	[IDHoaDon] ASC,
	[IDSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTDonNhap]    Script Date: 4/1/2020 16:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTDonNhap](
	[IDHoaDon] [char](10) NOT NULL,
	[IDSanPham] [char](10) NOT NULL,
	[SoLuong] [int] NULL,
	[GiaNhap] [money] NULL,
 CONSTRAINT [PK_PNhap] PRIMARY KEY CLUSTERED 
(
	[IDHoaDon] ASC,
	[IDSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTPhieuNhapKho]    Script Date: 4/1/2020 16:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTPhieuNhapKho](
	[IDPhieuNhap] [char](10) NOT NULL,
	[IDSanPham] [char](10) NOT NULL,
	[SoLuongNhap] [int] NULL,
 CONSTRAINT [PK_CTPhieuNhap] PRIMARY KEY CLUSTERED 
(
	[IDPhieuNhap] ASC,
	[IDSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTPhieuXuatKho]    Script Date: 4/1/2020 16:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTPhieuXuatKho](
	[IDPhieuXuat] [char](10) NOT NULL,
	[IDSanPham] [char](10) NOT NULL,
	[SoLuongXuat] [int] NULL,
 CONSTRAINT [PK_CTPhieuXuatKho] PRIMARY KEY CLUSTERED 
(
	[IDPhieuXuat] ASC,
	[IDSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DonMuaHang]    Script Date: 4/1/2020 16:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DonMuaHang](
	[IDHoaDon] [char](10) NOT NULL,
	[IDKhachHang] [char](10) NULL,
	[NgayMua] [date] NULL,
 CONSTRAINT [PK_HoaDonMuaHang] PRIMARY KEY CLUSTERED 
(
	[IDHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DonNhap]    Script Date: 4/1/2020 16:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DonNhap](
	[IDHoaDon] [char](10) NOT NULL,
	[NgayNhap] [datetime] NULL,
 CONSTRAINT [PK_DonNhap1] PRIMARY KEY CLUSTERED 
(
	[IDHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoTroKhachHang]    Script Date: 4/1/2020 16:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoTroKhachHang](
	[IDHoTro] [char](10) NOT NULL,
	[IDNhanVien] [char](10) NULL,
	[NoiDungHT] [text] NULL,
	[IDPhanHoi] [char](10) NULL,
	[ngayHT] [datetime] NULL,
 CONSTRAINT [PK_HoTroKhachHang] PRIMARY KEY CLUSTERED 
(
	[IDHoTro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 4/1/2020 16:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[IDKhachHang] [char](10) NOT NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[SoDienThoai] [char](10) NULL,
	[GioiTinh] [bit] NULL,
 CONSTRAINT [PK_KhachHang_1] PRIMARY KEY CLUSTERED 
(
	[IDKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Kho]    Script Date: 4/1/2020 16:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kho](
	[IDKho] [char](10) NOT NULL,
	[IDChiNhanh] [char](10) NULL,
	[DiaDiem] [nvarchar](50) NULL,
	[NhanVienQlyKho] [nvarchar](50) NULL,
	[TrangThai] [text] NULL,
 CONSTRAINT [PK_Kho] PRIMARY KEY CLUSTERED 
(
	[IDKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KhuVuc]    Script Date: 4/1/2020 16:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhuVuc](
	[IDKhuVuc] [char](10) NOT NULL,
	[TenKhuVuc] [nvarchar](50) NULL,
	[SoLuongChiNhanh] [int] NULL,
	[ImageBanDo] [geography] NULL,
	[IDQuanLy] [char](10) NULL,
 CONSTRAINT [PK_KhuVuc] PRIMARY KEY CLUSTERED 
(
	[IDKhuVuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 4/1/2020 16:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[IDLoaiSanPham] [char](10) NOT NULL,
	[TenLoaiSanPham] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[IDLoaiSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Luong]    Script Date: 4/1/2020 16:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Luong](
	[IDNhanVien] [char](10) NOT NULL,
	[IDNghiepVu] [char](10) NULL,
	[SoNgayLam] [int] NULL,
	[Thuong] [money] NULL,
	[Phat] [money] NULL,
	[NgayTraLuong] [date] NULL,
 CONSTRAINT [PK_Luong] PRIMARY KEY CLUSTERED 
(
	[IDNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NghiepVu]    Script Date: 4/1/2020 16:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NghiepVu](
	[IDNghiepVu] [char](10) NOT NULL,
	[TenNghiepVu] [nvarchar](50) NULL,
	[LuongUng] [money] NULL,
 CONSTRAINT [PK_NghiepVu] PRIMARY KEY CLUSTERED 
(
	[IDNghiepVu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 4/1/2020 16:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[IDNhaCungCap] [char](10) NOT NULL,
	[TenNhaCC] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nchar](10) NULL,
	[Fax] [char](10) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[IDNhaCungCap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 4/1/2020 16:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[IDNhanVien] [char](10) NOT NULL,
	[TenNhanVien] [nvarchar](50) NULL,
	[IDChiNhanh] [char](10) NULL,
	[SDT] [nvarchar](10) NULL,
	[Sex] [nvarchar](3) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[IDNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhanHoi]    Script Date: 4/1/2020 16:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhanHoi](
	[IDPhanHoi] [char](10) NOT NULL,
	[IDKhachHang] [char](10) NULL,
	[NDPhanHoi] [ntext] NULL,
	[NgayPhanHoi] [datetime] NULL,
	[DiaChiPH] [nvarchar](50) NULL,
 CONSTRAINT [PK_PhanHoi] PRIMARY KEY CLUSTERED 
(
	[IDPhanHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuNhapKho]    Script Date: 4/1/2020 16:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhieuNhapKho](
	[IDPhieuNhap] [char](10) NOT NULL,
	[IDNhanVien] [char](10) NULL,
	[IDKho] [char](10) NULL,
	[NgayNhapKho] [date] NULL,
 CONSTRAINT [PK_PhieuNhapKho] PRIMARY KEY CLUSTERED 
(
	[IDPhieuNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuXuatKho]    Script Date: 4/1/2020 16:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhieuXuatKho](
	[IDPhieuXuat] [char](10) NOT NULL,
	[IDNhanVien] [char](10) NULL,
	[IDKho] [char](10) NULL,
	[NgayXuat] [date] NULL,
 CONSTRAINT [PK_PhieuXuatKho] PRIMARY KEY CLUSTERED 
(
	[IDPhieuXuat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuanLy]    Script Date: 4/1/2020 16:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuanLy](
	[IDQuanLy] [char](10) NOT NULL,
	[IDChiNhanh] [char](10) NULL,
	[TenQly] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nchar](10) NULL,
 CONSTRAINT [PK_QuanLy] PRIMARY KEY CLUSTERED 
(
	[IDQuanLy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 4/1/2020 16:59:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SanPham](
	[IDSanPham] [char](10) NOT NULL,
	[TenSanPham] [nvarchar](50) NULL,
	[IDNhaCC] [char](10) NULL,
	[IDLoaiSanPham] [char](10) NULL,
	[MauSac] [nvarchar](50) NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[IDSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ChiNhanh] ([IDChiNhanh], [TenChiNhanh], [IDKhuVuc], [DiaChi], [SoLuongNVien]) VALUES (N'VM01      ', N'Vinmart Minh Khai', N'KV01      ', N'Minh Khai, Hà Nội', 15)
INSERT [dbo].[ChiNhanh] ([IDChiNhanh], [TenChiNhanh], [IDKhuVuc], [DiaChi], [SoLuongNVien]) VALUES (N'VM02      ', N'Vinmart Nguyễn Bỉnh Khiêm', N'KV01      ', N'Nguyễn Bỉnh Khiêm, Hà Nội', 21)
INSERT [dbo].[ChiNhanh] ([IDChiNhanh], [TenChiNhanh], [IDKhuVuc], [DiaChi], [SoLuongNVien]) VALUES (N'VM03      ', N'Vinmart Bà Triệu', N'KV01      ', N'Phố Bà Triệu', 22)
INSERT [dbo].[ChiNhanh] ([IDChiNhanh], [TenChiNhanh], [IDKhuVuc], [DiaChi], [SoLuongNVien]) VALUES (N'VM04      ', N'Vinmart Lê Duẩn', N'KV01      ', N'Đường Lê Duẩn', 16)
INSERT [dbo].[ChiNhanh] ([IDChiNhanh], [TenChiNhanh], [IDKhuVuc], [DiaChi], [SoLuongNVien]) VALUES (N'VM05      ', N'Vinmart Hoàng Cầu', N'KV01      ', N'Hoàng Cầu, Hà Nội', 19)
INSERT [dbo].[ChiNhanh] ([IDChiNhanh], [TenChiNhanh], [IDKhuVuc], [DiaChi], [SoLuongNVien]) VALUES (N'VM06      ', N'Vinmart Thủ Đức', N'KV02      ', N'Thủ Đức', 20)
INSERT [dbo].[ChiNhanh] ([IDChiNhanh], [TenChiNhanh], [IDKhuVuc], [DiaChi], [SoLuongNVien]) VALUES (N'VM07      ', N'Vinmart Dĩ An', N'KV03      ', N'Thị xã Dĩ An', 27)
INSERT [dbo].[ChiNhanh] ([IDChiNhanh], [TenChiNhanh], [IDKhuVuc], [DiaChi], [SoLuongNVien]) VALUES (N'VM08      ', N'Vinmart Quận 9', N'KV02      ', N'Quận 9', 25)
INSERT [dbo].[ChiNhanh] ([IDChiNhanh], [TenChiNhanh], [IDKhuVuc], [DiaChi], [SoLuongNVien]) VALUES (N'VM09      ', N'Vinmart Phạm Ngọc Thạch', N'KV01      ', N'Phạm Ngọc Thạch', 25)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM1      ', N'Sp01      ', 4, 14000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM10     ', N'Sp10      ', 4, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM11     ', N'Sp11      ', 4, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM12     ', N'Sp12      ', 4, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM13     ', N'Sp13      ', 5, 15900.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM14     ', N'Sp14      ', 6, 15900.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM15     ', N'Sp15      ', 7, 15900.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM16     ', N'Sp16      ', 8, 15900.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM17     ', N'Sp17      ', 9, 15900.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM18     ', N'Sp18      ', 10, 15900.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM19     ', N'Sp19      ', 11, 15900.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM2      ', N'Sp02      ', 4, 14000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM20     ', N'Sp20      ', 12, 17800.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM21     ', N'Sp21      ', 3, 17800.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM22     ', N'Sp22      ', 3, 17800.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM23     ', N'Sp23      ', 3, 17800.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM24     ', N'Sp24      ', 3, 17800.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM25     ', N'Sp25      ', 3, 17800.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM26     ', N'Sp26      ', 3, 17800.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM27     ', N'Sp27      ', 3, 17800.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM28     ', N'Sp28      ', 3, 17800.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM29     ', N'Sp29      ', 3, 17800.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM3      ', N'Sp03      ', 4, 14000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM30     ', N'Sp30      ', 3, 17800.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM31     ', N'Sp31      ', 3, 19500.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM32     ', N'Sp32      ', 9, 23000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM33     ', N'Sp32      ', 9, 23000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM34     ', N'Sp33      ', 9, 23000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM35     ', N'Sp34      ', 9, 23000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM36     ', N'Sp35      ', 9, 23000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM37     ', N'Sp36      ', 9, 23000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM38     ', N'Sp37      ', 9, 23000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM39     ', N'Sp38      ', 9, 25900.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM4      ', N'Sp04      ', 4, 14000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM40     ', N'Sp01      ', 9, 14000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM41     ', N'Sp31      ', 9, 19500.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM42     ', N'Sp32      ', 9, 23000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM43     ', N'Sp32      ', 2, 23000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM44     ', N'Sp33      ', 3, 23000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM45     ', N'Sp34      ', 4, 23000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM46     ', N'Sp35      ', 5, 23000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM47     ', N'Sp28      ', 6, 17800.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM48     ', N'Sp29      ', 7, 17800.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM49     ', N'Sp30      ', 8, 17800.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM5      ', N'Sp05      ', 4, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM50     ', N'Sp31      ', 9, 19500.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM51     ', N'Sp32      ', 10, 23000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM52     ', N'Sp32      ', 11, 23000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM53     ', N'Sp33      ', 12, 23000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM54     ', N'Sp34      ', 13, 23000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM55     ', N'Sp35      ', 14, 23000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM56     ', N'Sp36      ', 15, 23000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM57     ', N'Sp37      ', 1, 23000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM58     ', N'Sp38      ', 1, 25900.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM59     ', N'Sp01      ', 1, 14000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM6      ', N'Sp06      ', 4, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM60     ', N'Sp31      ', 1, 19500.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM61     ', N'Sp32      ', 1, 23000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM62     ', N'Sp32      ', 1, 23000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM63     ', N'Sp33      ', 1, 23000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM64     ', N'Sp01      ', 1, 14000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM65     ', N'Sp02      ', 1, 14000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM66     ', N'Sp03      ', 1, 14000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM67     ', N'Sp04      ', 1, 14000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM68     ', N'Sp05      ', 1, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM69     ', N'Sp06      ', 1, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM7      ', N'Sp07      ', 4, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM70     ', N'Sp07      ', 6, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM71     ', N'Sp08      ', 7, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM72     ', N'Sp09      ', 8, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM73     ', N'Sp10      ', 9, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM74     ', N'Sp11      ', 10, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM75     ', N'Sp12      ', 11, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM76     ', N'Sp13      ', 12, 15900.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM77     ', N'Sp14      ', 13, 15900.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM78     ', N'Sp01      ', 14, 14000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM79     ', N'Sp02      ', 15, 14000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM8      ', N'Sp08      ', 4, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM80     ', N'Sp03      ', 16, 14000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM81     ', N'Sp04      ', 17, 14000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM82     ', N'Sp05      ', 18, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM83     ', N'Sp06      ', 19, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM84     ', N'Sp07      ', 20, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM85     ', N'Sp08      ', 21, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM86     ', N'Sp09      ', 22, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM87     ', N'Sp10      ', 7, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM88     ', N'Sp11      ', 7, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM89     ', N'Sp12      ', 7, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM9      ', N'Sp09      ', 4, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM90     ', N'Sp13      ', 7, 15900.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM91     ', N'Sp14      ', 7, 15900.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM92     ', N'Sp08      ', 7, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM93     ', N'Sp09      ', 7, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM94     ', N'Sp10      ', 7, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM95     ', N'Sp11      ', 7, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM96     ', N'Sp12      ', 7, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM97     ', N'Sp08      ', 7, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM97     ', N'Sp09      ', 8, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM97     ', N'Sp13      ', 7, 15900.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM97     ', N'Sp14      ', 6, 15900.0000)
GO
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM98     ', N'Sp05      ', 9, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM98     ', N'Sp06      ', 1, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM98     ', N'Sp07      ', 1, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM98     ', N'Sp08      ', 2, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM98     ', N'Sp09      ', 3, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM99     ', N'Sp01      ', 3, 14000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM99     ', N'Sp02      ', 6, 14000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM99     ', N'Sp08      ', 2, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM99     ', N'Sp09      ', 2, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM99     ', N'Sp10      ', 2, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM99     ', N'Sp11      ', 2, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM99     ', N'Sp12      ', 2, 17000.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM99     ', N'Sp13      ', 5, 15900.0000)
INSERT [dbo].[CTDonMuaHang] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaBan]) VALUES (N'HDM99     ', N'Sp14      ', 8, 15900.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M1        ', N'Sp01      ', 4, 10000.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M10       ', N'Sp10      ', 5, 11700.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M11       ', N'Sp11      ', 6, 11700.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M12       ', N'Sp12      ', 7, 11700.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M13       ', N'Sp13      ', 8, 13200.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M14       ', N'Sp14      ', 9, 13200.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M15       ', N'Sp15      ', 10, 13200.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M16       ', N'Sp16      ', 11, 13200.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M17       ', N'Sp17      ', 12, 13200.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M18       ', N'Sp18      ', 13, 13200.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M19       ', N'Sp19      ', 6, 13200.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M2        ', N'Sp02      ', 4, 10000.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M20       ', N'Sp20      ', 8, 10300.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M21       ', N'Sp21      ', 34, 10300.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M22       ', N'Sp22      ', 6, 10300.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M23       ', N'Sp23      ', 5, 10300.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M24       ', N'Sp24      ', 4, 10300.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M25       ', N'Sp25      ', 2, 10300.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M26       ', N'Sp26      ', 8, 10300.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M27       ', N'Sp27      ', 6, 10300.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M28       ', N'Sp28      ', 7, 10300.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M29       ', N'Sp29      ', 9, 10300.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M29       ', N'Sp30      ', 5, 10300.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M29       ', N'Sp31      ', 3, 14600.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M29       ', N'Sp32      ', 6, 12600.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M3        ', N'Sp03      ', 4, 10000.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M30       ', N'Sp01      ', 12, 10000.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M30       ', N'Sp32      ', 7, 12600.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M30       ', N'Sp33      ', 8, 12600.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M30       ', N'Sp34      ', 5, 12600.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M30       ', N'Sp35      ', 3, 12600.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M30       ', N'Sp36      ', 6, 12600.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M30       ', N'Sp37      ', 8, 12600.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M30       ', N'Sp38      ', 6, 20400.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M4        ', N'Sp04      ', 4, 10000.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M5        ', N'Sp05      ', 4, 11700.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M6        ', N'Sp06      ', 4, 11700.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M7        ', N'Sp07      ', 4, 11700.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M8        ', N'Sp08      ', 4, 11700.0000)
INSERT [dbo].[CTDonNhap] ([IDHoaDon], [IDSanPham], [SoLuong], [GiaNhap]) VALUES (N'M9        ', N'Sp09      ', 4, 11700.0000)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N01       ', N'Sp01      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N02       ', N'Sp02      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N03       ', N'Sp03      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N04       ', N'Sp04      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N05       ', N'Sp05      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N06       ', N'Sp06      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N07       ', N'Sp07      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N08       ', N'Sp08      ', 20)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N09       ', N'Sp09      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N10       ', N'Sp10      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N11       ', N'Sp11      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N12       ', N'Sp12      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N13       ', N'Sp13      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N14       ', N'Sp14      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N15       ', N'Sp15      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N16       ', N'Sp16      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N17       ', N'Sp17      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N18       ', N'Sp18      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N19       ', N'Sp19      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N20       ', N'Sp20      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N21       ', N'Sp21      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N22       ', N'Sp22      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N23       ', N'Sp23      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N24       ', N'Sp24      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N25       ', N'Sp25      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N26       ', N'Sp26      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N27       ', N'Sp27      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N28       ', N'Sp28      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N29       ', N'Sp29      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N30       ', N'Sp01      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N30       ', N'Sp02      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N30       ', N'Sp03      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N30       ', N'Sp04      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N30       ', N'Sp05      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N30       ', N'Sp06      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N30       ', N'Sp07      ', 30)
INSERT [dbo].[CTPhieuNhapKho] ([IDPhieuNhap], [IDSanPham], [SoLuongNhap]) VALUES (N'N30       ', N'Sp08      ', 24)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X01       ', N'Sp01      ', 5)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X01       ', N'Sp02      ', 6)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X01       ', N'Sp03      ', 3)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X01       ', N'Sp04      ', 7)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X02       ', N'Sp11      ', 6)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X02       ', N'Sp12      ', 6)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X02       ', N'Sp13      ', 6)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X02       ', N'Sp14      ', 6)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X02       ', N'Sp15      ', 6)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X03       ', N'Sp07      ', 5)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X04       ', N'Sp08      ', 5)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X05       ', N'Sp09      ', 5)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X06       ', N'Sp10      ', 5)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X07       ', N'Sp11      ', 5)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X08       ', N'Sp12      ', 5)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X09       ', N'Sp13      ', 5)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X10       ', N'Sp14      ', 5)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X11       ', N'Sp15      ', 5)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X12       ', N'Sp16      ', 5)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X17       ', N'Sp23      ', 9)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X18       ', N'Sp24      ', 9)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X19       ', N'Sp25      ', 9)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X20       ', N'Sp26      ', 9)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X21       ', N'Sp27      ', 10)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X22       ', N'Sp28      ', 11)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X23       ', N'Sp29      ', 12)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X24       ', N'Sp30      ', 13)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X25       ', N'Sp31      ', 14)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X26       ', N'Sp32      ', 15)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X27       ', N'Sp33      ', 16)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X28       ', N'Sp34      ', 17)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X29       ', N'Sp35      ', 18)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X30       ', N'Sp36      ', 19)
INSERT [dbo].[CTPhieuXuatKho] ([IDPhieuXuat], [IDSanPham], [SoLuongXuat]) VALUES (N'X31       ', N'Sp37      ', 20)
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM1      ', N'KH01      ', CAST(N'2015-05-12' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM10     ', N'KH10      ', CAST(N'2015-05-21' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM11     ', N'KH11      ', CAST(N'2015-05-22' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM12     ', N'KH12      ', CAST(N'2015-05-23' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM13     ', N'KH13      ', CAST(N'2015-05-24' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM14     ', N'KH14      ', CAST(N'2015-05-25' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM15     ', N'KH15      ', CAST(N'2015-05-26' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM16     ', N'KH16      ', CAST(N'2015-05-27' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM17     ', N'KH17      ', CAST(N'2015-05-28' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM18     ', N'KH18      ', CAST(N'2015-05-29' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM19     ', N'KH19      ', CAST(N'2015-05-30' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM2      ', N'KH02      ', CAST(N'2015-05-13' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM20     ', N'KH20      ', CAST(N'2015-05-31' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM21     ', N'KH21      ', CAST(N'2015-06-01' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM22     ', N'KH22      ', CAST(N'2015-06-02' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM23     ', N'KH23      ', CAST(N'2015-06-03' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM24     ', N'KH24      ', CAST(N'2015-06-04' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM25     ', N'KH25      ', CAST(N'2015-06-05' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM26     ', N'KH26      ', CAST(N'2015-06-06' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM27     ', N'KH27      ', CAST(N'2015-06-07' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM28     ', N'KH28      ', CAST(N'2015-06-08' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM29     ', N'KH29      ', CAST(N'2015-06-09' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM3      ', N'KH03      ', CAST(N'2015-05-14' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM30     ', N'KH30      ', CAST(N'2015-06-10' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM31     ', N'KH31      ', CAST(N'2015-06-11' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM32     ', N'KH32      ', CAST(N'2015-04-12' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM33     ', N'KH33      ', CAST(N'2015-04-13' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM34     ', N'KH34      ', CAST(N'2015-04-14' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM35     ', N'KH35      ', CAST(N'2015-04-15' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM36     ', N'KH36      ', CAST(N'2015-04-16' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM37     ', N'KH37      ', CAST(N'2015-04-17' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM38     ', N'KH38      ', CAST(N'2015-04-18' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM39     ', N'KH39      ', CAST(N'2015-04-19' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM4      ', N'KH04      ', CAST(N'2015-05-15' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM40     ', N'KH40      ', CAST(N'2015-04-20' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM41     ', N'KH41      ', CAST(N'2015-04-21' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM42     ', N'KH42      ', CAST(N'2015-04-22' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM43     ', N'KH43      ', CAST(N'2015-04-23' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM44     ', N'KH44      ', CAST(N'2015-04-24' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM45     ', N'KH45      ', CAST(N'2015-04-25' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM46     ', N'KH46      ', CAST(N'2015-04-26' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM47     ', N'KH47      ', CAST(N'2015-04-27' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM48     ', N'KH48      ', CAST(N'2015-04-28' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM49     ', N'KH49      ', CAST(N'2015-04-29' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM5      ', N'KH05      ', CAST(N'2015-05-16' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM50     ', N'KH50      ', CAST(N'2015-04-30' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM51     ', N'KH51      ', CAST(N'2015-05-01' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM52     ', N'KH52      ', CAST(N'2015-05-02' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM53     ', N'KH53      ', CAST(N'2015-05-03' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM54     ', N'KH54      ', CAST(N'2015-05-04' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM55     ', N'KH55      ', CAST(N'2015-05-05' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM56     ', N'KH56      ', CAST(N'2015-05-06' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM57     ', N'KH57      ', CAST(N'2015-05-07' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM58     ', N'KH58      ', CAST(N'2015-05-08' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM59     ', N'KH59      ', CAST(N'2015-05-09' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM6      ', N'KH06      ', CAST(N'2015-05-17' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM60     ', N'KH60      ', CAST(N'2015-05-10' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM61     ', N'KH61      ', CAST(N'2015-05-11' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM62     ', N'KH62      ', CAST(N'2015-05-12' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM63     ', N'KH63      ', CAST(N'2015-05-13' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM64     ', N'KH64      ', CAST(N'2015-05-14' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM65     ', N'KH65      ', CAST(N'2015-05-15' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM66     ', N'KH66      ', CAST(N'2015-05-16' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM67     ', N'KH67      ', CAST(N'2015-05-17' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM68     ', N'KH68      ', CAST(N'2015-05-18' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM69     ', N'KH69      ', CAST(N'2015-05-19' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM7      ', N'KH07      ', CAST(N'2015-05-18' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM70     ', N'KH01      ', CAST(N'2015-05-20' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM71     ', N'KH02      ', CAST(N'2015-05-21' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM72     ', N'KH03      ', CAST(N'2015-05-22' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM73     ', N'KH04      ', CAST(N'2015-05-23' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM74     ', N'KH05      ', CAST(N'2015-05-24' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM75     ', N'KH06      ', CAST(N'2015-05-25' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM76     ', N'KH07      ', CAST(N'2015-05-26' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM77     ', N'KH08      ', CAST(N'2015-05-27' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM78     ', N'KH09      ', CAST(N'2015-05-28' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM79     ', N'KH01      ', CAST(N'2015-05-29' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM8      ', N'KH08      ', CAST(N'2015-05-19' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM80     ', N'KH02      ', CAST(N'2015-05-30' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM81     ', N'KH03      ', CAST(N'2015-05-31' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM82     ', N'KH04      ', CAST(N'2015-06-01' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM83     ', N'KH05      ', CAST(N'2015-06-02' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM84     ', N'KH06      ', CAST(N'2015-06-03' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM85     ', N'KH07      ', CAST(N'2015-06-04' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM86     ', N'KH08      ', CAST(N'2015-06-05' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM87     ', N'KH09      ', CAST(N'2015-06-06' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM88     ', N'KH10      ', CAST(N'2015-06-07' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM89     ', N'KH11      ', CAST(N'2015-06-08' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM9      ', N'KH09      ', CAST(N'2015-05-20' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM90     ', N'KH12      ', CAST(N'2015-06-09' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM91     ', N'KH13      ', CAST(N'2015-06-10' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM92     ', N'KH14      ', CAST(N'2015-06-11' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM93     ', N'KH15      ', CAST(N'2015-06-12' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM94     ', N'KH16      ', CAST(N'2015-06-13' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM95     ', N'KH17      ', CAST(N'2015-06-14' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM96     ', N'KH18      ', CAST(N'2015-06-15' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM97     ', N'KH19      ', CAST(N'2015-06-16' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM98     ', N'KH20      ', CAST(N'2015-06-17' AS Date))
INSERT [dbo].[DonMuaHang] ([IDHoaDon], [IDKhachHang], [NgayMua]) VALUES (N'HDM99     ', N'KH21      ', CAST(N'2015-06-18' AS Date))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M1        ', CAST(N'2015-03-04 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M10       ', CAST(N'2015-03-13 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M11       ', CAST(N'2015-03-14 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M12       ', CAST(N'2015-03-15 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M13       ', CAST(N'2015-03-16 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M14       ', CAST(N'2015-03-17 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M15       ', CAST(N'2015-03-18 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M16       ', CAST(N'2015-03-19 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M17       ', CAST(N'2015-03-20 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M18       ', CAST(N'2015-03-21 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M19       ', CAST(N'2015-03-22 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M2        ', CAST(N'2015-03-05 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M20       ', CAST(N'2015-03-23 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M21       ', CAST(N'2015-03-24 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M22       ', CAST(N'2015-03-25 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M23       ', CAST(N'2015-03-26 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M24       ', CAST(N'2015-03-27 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M25       ', CAST(N'2015-03-28 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M26       ', CAST(N'2015-03-29 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M27       ', CAST(N'2015-03-30 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M28       ', CAST(N'2015-03-31 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M29       ', CAST(N'2015-04-01 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M3        ', CAST(N'2015-03-06 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M30       ', CAST(N'2015-04-02 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M4        ', CAST(N'2015-03-07 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M5        ', CAST(N'2015-03-08 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M6        ', CAST(N'2015-03-09 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M7        ', CAST(N'2015-03-10 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M8        ', CAST(N'2015-03-11 00:00:00.000' AS DateTime))
INSERT [dbo].[DonNhap] ([IDHoaDon], [NgayNhap]) VALUES (N'M9        ', CAST(N'2015-03-12 00:00:00.000' AS DateTime))
INSERT [dbo].[HoTroKhachHang] ([IDHoTro], [IDNhanVien], [NoiDungHT], [IDPhanHoi], [ngayHT]) VALUES (N'H1        ', N'TL01      ', N'C?m on quý khách', N'PH01      ', NULL)
INSERT [dbo].[HoTroKhachHang] ([IDHoTro], [IDNhanVien], [NoiDungHT], [IDPhanHoi], [ngayHT]) VALUES (N'H10       ', N'TL10      ', N'C?m on quý khách', N'PH10      ', NULL)
INSERT [dbo].[HoTroKhachHang] ([IDHoTro], [IDNhanVien], [NoiDungHT], [IDPhanHoi], [ngayHT]) VALUES (N'H11       ', N'TL11      ', N'C?m on quý khách', N'PH11      ', NULL)
INSERT [dbo].[HoTroKhachHang] ([IDHoTro], [IDNhanVien], [NoiDungHT], [IDPhanHoi], [ngayHT]) VALUES (N'H12       ', N'TL01      ', N'C?m on quý khách', N'PH12      ', NULL)
INSERT [dbo].[HoTroKhachHang] ([IDHoTro], [IDNhanVien], [NoiDungHT], [IDPhanHoi], [ngayHT]) VALUES (N'H13       ', N'TL02      ', N'C?m on quý khách', N'PH13      ', NULL)
INSERT [dbo].[HoTroKhachHang] ([IDHoTro], [IDNhanVien], [NoiDungHT], [IDPhanHoi], [ngayHT]) VALUES (N'H14       ', N'TL03      ', N'C?m on quý khách', N'PH14      ', NULL)
INSERT [dbo].[HoTroKhachHang] ([IDHoTro], [IDNhanVien], [NoiDungHT], [IDPhanHoi], [ngayHT]) VALUES (N'H15       ', N'TL04      ', N'C?m on quý khách', N'PH15      ', NULL)
INSERT [dbo].[HoTroKhachHang] ([IDHoTro], [IDNhanVien], [NoiDungHT], [IDPhanHoi], [ngayHT]) VALUES (N'H16       ', N'TL05      ', N'C?m on quý khách', N'PH16      ', NULL)
INSERT [dbo].[HoTroKhachHang] ([IDHoTro], [IDNhanVien], [NoiDungHT], [IDPhanHoi], [ngayHT]) VALUES (N'H17       ', N'TL06      ', N'C?m on quý khách', N'PH17      ', NULL)
INSERT [dbo].[HoTroKhachHang] ([IDHoTro], [IDNhanVien], [NoiDungHT], [IDPhanHoi], [ngayHT]) VALUES (N'H18       ', N'TL07      ', N'C?m on quý khách', N'PH18      ', NULL)
INSERT [dbo].[HoTroKhachHang] ([IDHoTro], [IDNhanVien], [NoiDungHT], [IDPhanHoi], [ngayHT]) VALUES (N'H19       ', N'TL08      ', N'C?m on quý khách', N'PH19      ', NULL)
INSERT [dbo].[HoTroKhachHang] ([IDHoTro], [IDNhanVien], [NoiDungHT], [IDPhanHoi], [ngayHT]) VALUES (N'H2        ', N'TL02      ', N'C?m on quý khách', N'PH02      ', NULL)
INSERT [dbo].[HoTroKhachHang] ([IDHoTro], [IDNhanVien], [NoiDungHT], [IDPhanHoi], [ngayHT]) VALUES (N'H3        ', N'TL03      ', N'Có,quý khách d?n gian hàng n d? xem hàng.', N'PH03      ', NULL)
INSERT [dbo].[HoTroKhachHang] ([IDHoTro], [IDNhanVien], [NoiDungHT], [IDPhanHoi], [ngayHT]) VALUES (N'H4        ', N'TL04      ', N'C?m on quý khách', N'PH04      ', NULL)
INSERT [dbo].[HoTroKhachHang] ([IDHoTro], [IDNhanVien], [NoiDungHT], [IDPhanHoi], [ngayHT]) VALUES (N'H5        ', N'TL05      ', N'C?m on quý khách', N'PH05      ', NULL)
INSERT [dbo].[HoTroKhachHang] ([IDHoTro], [IDNhanVien], [NoiDungHT], [IDPhanHoi], [ngayHT]) VALUES (N'H6        ', N'TL06      ', N'C?m on quý khách', N'PH06      ', NULL)
INSERT [dbo].[HoTroKhachHang] ([IDHoTro], [IDNhanVien], [NoiDungHT], [IDPhanHoi], [ngayHT]) VALUES (N'H7        ', N'TL07      ', N'C?m on quý khách', N'PH07      ', NULL)
INSERT [dbo].[HoTroKhachHang] ([IDHoTro], [IDNhanVien], [NoiDungHT], [IDPhanHoi], [ngayHT]) VALUES (N'H8        ', N'TL08      ', N'Không, quý khách có th? tham kh?o s?n ph?m khách', N'PH08      ', NULL)
INSERT [dbo].[HoTroKhachHang] ([IDHoTro], [IDNhanVien], [NoiDungHT], [IDPhanHoi], [ngayHT]) VALUES (N'H9        ', N'TL09      ', N'C?m on quý khách', N'PH09      ', NULL)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH01      ', N'Lê Anh', N'Hai Bà Trưng, Hà Nội', N'0869574386', 1)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH02      ', N'Tào Hùng', N'Hai Bà Trưng, Hà Nội', N'0869574387', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH03      ', N'Lương thế Tùng', N'Hai Bà Trưng, Hà Nội', N'0869574388', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH04      ', N'Vũ Đức Huy', N'Hai Bà Trưng, Hà Nội', N'0869574389', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH05      ', N'Lữ Tiệp', N'Hai Bà Trưng, Hà Nội', N'0869574390', 1)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH06      ', N'Vũ Đức Huy', N'Hai Bà Trưng, Hà Nội', N'0869574391', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH07      ', N'Lê Anh', N'Hai Bà Trưng, Hà Nội', N'0869574392', 1)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH08      ', N'Minh Huy', N'Hai Bà Trưng, Hà Nội', N'0869574393', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH09      ', N'Tào Đình Tuấn', N'Hai Bà Trưng, Hà Nội', N'0869574394', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH10      ', N'Vũ Mạnh', N'Hai Bà Trưng, Hà Nội', N'0869574395', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH11      ', N'Sùng a Chư', N'Hai Bà Trưng, Hà Nội', N'0869574396', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH12      ', N'Hari', N'Hai Bà Trưng, Hà Nội', N'0869574397', 1)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH13      ', N'Lê thị Thảo', N'Hai Bà Trưng, Hà Nội', N'0869574398', 1)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH14      ', N'Vũ Thức', N'Hai Bà Trưng, Hà Nội', N'0869574399', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH15      ', N'Trọng Tùng', N'Hai Bà Trưng, Hà Nội', N'0869574400', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH16      ', N'Bá Thắng', N'Hai Bà Trưng, Hà Nội', N'0869574401', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH17      ', N'Đức Thắng', N'Hai Bà Trưng, Hà Nội', N'0869574402', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH18      ', N'Vũ Duy TRường', N'Hai Bà Trưng, Hà Nội', N'0869574403', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH19      ', N'Tạ duy mạnh', N'Hai Bà Trưng, Hà Nội', N'0869574404', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH20      ', N'Lương thế Tùng', N'Cầu Giấy,Hà Nội', N'0869574405', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH21      ', N'Vũ Đức Huy', N'Cầu Giấy,Hà Nội', N'0869574406', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH22      ', N'Lữ Tiệp', N'Cầu Giấy,Hà Nội', N'0869574407', 1)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH23      ', N'Vũ Đức Huy', N'Cầu Giấy,Hà Nội', N'0869574408', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH24      ', N'Lê Anh', N'Cầu Giấy,Hà Nội', N'0869574409', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH25      ', N'Minh Huy', N'Cầu Giấy,Hà Nội', N'0869574410', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH26      ', N'Tào Đình Tuấn', N'Cầu Giấy,Hà Nội', N'0869574411', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH27      ', N'Hari', N'Cầu Giấy,Hà Nội', N'0869574412', 1)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH28      ', N'Lê thị Thảo', N'Cầu Giấy,Hà Nội', N'0869574413', 1)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH29      ', N'Vũ Thức', N'Cầu Giấy,Hà Nội', N'0869574414', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH30      ', N'Trọng Tùng', N'Cầu Giấy,Hà Nội', N'0869574415', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH31      ', N'Bá Thắng', N'Cầu Giấy,Hà Nội', N'0869574416', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH32      ', N'Đức Thắng', N'Cầu Giấy,Hà Nội', N'0869574417', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH33      ', N'Vũ Duy TRường', N'Cầu Giấy,Hà Nội', N'0869574418', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH34      ', N'Mạc Văn Khoa', N'Cầu Giấy,Hà Nội', N'0869574419', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH35      ', N'Tô hữu Bằng', N'Cầu Giấy,Hà Nội', N'0869574420', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH36      ', N'Phạm Băng', N'Cầu Giấy,Hà Nội', N'0869574421', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH37      ', N'Lý Tú', N'Cầu Giấy,Hà Nội', N'0869574422', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH38      ', N'Thiên Y', N'Quận 9, Hồ Chí Minh', N'0869574423', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH39      ', N'Vũ Thanh Tuyền', N'Quận 9, Hồ Chí Minh', N'0869574424', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH40      ', N'Hữu Vi', N'Quận 9, Hồ Chí Minh', N'0869574425', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH41      ', N'Tố Nga', N'Quận 9, Hồ Chí Minh', N'0869574426', 1)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH42      ', N'Nhã phương', N'Quận 9, Hồ Chí Minh', N'0869574427', 1)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH43      ', N'Lý Anh Khoa', N'Quận 9, Hồ Chí Minh', N'0869574428', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH44      ', N'Mạc Anh Khoa', N'Quận 9, Hồ Chí Minh', N'0869574429', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH45      ', N'Bá Thắng', N'Quận 9, Hồ Chí Minh', N'0869574430', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH46      ', N'Đức Thắng', N'Quận 9, Hồ Chí Minh', N'0869574431', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH47      ', N'Vũ Duy TRường', N'Quận 9, Hồ Chí Minh', N'0869574432', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH48      ', N'Mạc Văn Khoa', N'Quận 9, Hồ Chí Minh', N'0869574433', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH49      ', N'Tô hữu Bằng', N'Quận Thủ Đức,Hồ Chí Minh', N'0869574434', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH50      ', N'Phạm Băng', N'Quận Thủ Đức,Hồ Chí Minh', N'0869574435', 1)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH51      ', N'Lý Tú', N'Quận Thủ Đức,Hồ Chí Minh', N'0869574436', 1)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH52      ', N'Thiên Y', N'Quận Thủ Đức,Hồ Chí Minh', N'0869574437', 1)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH53      ', N'Vũ Thanh Tuyền', N'Quận Thủ Đức,Hồ Chí Minh', N'0869574438', 1)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH54      ', N'Hữu Vi', N'Quận Thủ Đức,Hồ Chí Minh', N'0869574439', 1)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH55      ', N'Tố Nga', N'Quận Thủ Đức,Hồ Chí Minh', N'0869574440', 1)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH56      ', N'Nhã phương', N'Quận Thủ Đức,Hồ Chí Minh', N'0869574441', 1)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH57      ', N'Phạm Trưởng', N'Quận Thủ Đức,Hồ Chí Minh', N'0869574442', 1)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH58      ', N'Vũ Ngọc', N'Quận Thủ Đức,Hồ Chí Minh', N'0869574443', 1)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH59      ', N'Tô Hoài', N'Quận Thủ Đức,Hồ Chí Minh', N'0869574444', 1)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH60      ', N'Lý hà', N'Dĩ An, Bình Dương', N'0869574445', 1)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH61      ', N'Vũ Minh Nhật', N'Dĩ An, Bình Dương', N'0869574446', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH62      ', N'Tào Đình Tuấn', N'Dĩ An, Bình Dương', N'0869574447', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH63      ', N'Vũ Mạnh', N'Ba Đình, Hà Nội', N'0869574448', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH64      ', N'Sùng a Chư', N'Ba Đình, Hà Nội', N'0869574449', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH65      ', N'Hari', N'Ba Đình, Hà Nội', N'0869574450', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH66      ', N'Lê thị Thảo', N'Ba Đình, Hà Nội', N'0869574451', 1)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH67      ', N'Vũ Thức', N'Ba Đình, Hà Nội', N'0869574452', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH68      ', N'Trọng Tùng', N'Ba Đình, Hà Nội', N'0869574453', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH69      ', N'Bá Thắng', N'Ba Đình, Hà Nội', N'0869574454', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH70      ', N'Đức Thắng', N'Ba Đình, Hà Nội', N'0869574455', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH71      ', N'Vũ Duy TRường', N'Ba Đình, Hà Nội', N'0869574456', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH72      ', N'Tạ duy mạnh', N'Ba Đình, Hà Nội', N'0869574457', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH73      ', N'Lương thế Tùng', N'Ba Đình, Hà Nội', N'0869574458', 0)
INSERT [dbo].[KhachHang] ([IDKhachHang], [TenKhachHang], [DiaChi], [SoDienThoai], [GioiTinh]) VALUES (N'KH74      ', N'Vũ Đức Huy', N'Ba Đình, Hà Nội', N'0869574459', 0)
INSERT [dbo].[Kho] ([IDKho], [IDChiNhanh], [DiaDiem], [NhanVienQlyKho], [TrangThai]) VALUES (N'K01       ', N'VM01      ', N'458 Minh Khai, P, Hai Bà Trưng
', N'Lê Thu Hà', NULL)
INSERT [dbo].[Kho] ([IDKho], [IDChiNhanh], [DiaDiem], [NhanVienQlyKho], [TrangThai]) VALUES (N'K02       ', N'VM02      ', N'35B Nguyễn Bỉnh Khiêm, Lê Đại Hành, Hai Bà Trưng
', N'Nguyễn Mạnh Linh', NULL)
INSERT [dbo].[Kho] ([IDKho], [IDChiNhanh], [DiaDiem], [NhanVienQlyKho], [TrangThai]) VALUES (N'K03       ', N'VM03      ', N'191 Bà Triệu, Lê Đại Hành, Hai Bà Trưng
', N'Tạ Huy', NULL)
INSERT [dbo].[Kho] ([IDKho], [IDChiNhanh], [DiaDiem], [NhanVienQlyKho], [TrangThai]) VALUES (N'K04       ', N'VM04      ', N'Lê Duẩn, Văn Chương, Đống Đa
', N'Lê Hiền', NULL)
INSERT [dbo].[Kho] ([IDKho], [IDChiNhanh], [DiaDiem], [NhanVienQlyKho], [TrangThai]) VALUES (N'K05       ', N'VM05      ', N'4 Phố Hoàng Cầu, Chợ Dừa, Đống Đa
', N'Nguyến Hiếu', NULL)
INSERT [dbo].[Kho] ([IDKho], [IDChiNhanh], [DiaDiem], [NhanVienQlyKho], [TrangThai]) VALUES (N'K06       ', N'VM06      ', N'91 Lĩnh Nam, Mai Động, Hoàng Mai
', N'Lê Văn Chung', NULL)
INSERT [dbo].[Kho] ([IDKho], [IDChiNhanh], [DiaDiem], [NhanVienQlyKho], [TrangThai]) VALUES (N'K07       ', N'VM07      ', N' Chương Dương Độ, Hoàn Kiếm
', N'Lê Văn Thắng', NULL)
INSERT [dbo].[Kho] ([IDKho], [IDChiNhanh], [DiaDiem], [NhanVienQlyKho], [TrangThai]) VALUES (N'K08       ', N'VM08      ', N'Phạm Ngọc Thạch, Đống Đa
', N'Vũ Nhung', NULL)
INSERT [dbo].[Kho] ([IDKho], [IDChiNhanh], [DiaDiem], [NhanVienQlyKho], [TrangThai]) VALUES (N'K09       ', N'VM09      ', N'24 Kim Đồng, Giáp Bát, Hai Bà Trưng
', N'Bùi Hiền', NULL)
INSERT [dbo].[KhuVuc] ([IDKhuVuc], [TenKhuVuc], [SoLuongChiNhanh], [ImageBanDo], [IDQuanLy]) VALUES (N'KV01      ', N'Hà Nội', 23, NULL, NULL)
INSERT [dbo].[KhuVuc] ([IDKhuVuc], [TenKhuVuc], [SoLuongChiNhanh], [ImageBanDo], [IDQuanLy]) VALUES (N'KV02      ', N'Hồ Chí Minh', 24, NULL, NULL)
INSERT [dbo].[KhuVuc] ([IDKhuVuc], [TenKhuVuc], [SoLuongChiNhanh], [ImageBanDo], [IDQuanLy]) VALUES (N'KV03      ', N'Bình Dương', 10, NULL, NULL)
INSERT [dbo].[LoaiSanPham] ([IDLoaiSanPham], [TenLoaiSanPham]) VALUES (N'B01       ', N'Bánh')
INSERT [dbo].[LoaiSanPham] ([IDLoaiSanPham], [TenLoaiSanPham]) VALUES (N'B02       ', N'Bột ăn liền')
INSERT [dbo].[LoaiSanPham] ([IDLoaiSanPham], [TenLoaiSanPham]) VALUES (N'B03       ', N'Bột xay')
INSERT [dbo].[LoaiSanPham] ([IDLoaiSanPham], [TenLoaiSanPham]) VALUES (N'BG        ', N'Bột giặt')
INSERT [dbo].[LoaiSanPham] ([IDLoaiSanPham], [TenLoaiSanPham]) VALUES (N'CAL       ', N'Cháo ăn liền')
INSERT [dbo].[LoaiSanPham] ([IDLoaiSanPham], [TenLoaiSanPham]) VALUES (N'DA        ', N'Dầu ăn')
INSERT [dbo].[LoaiSanPham] ([IDLoaiSanPham], [TenLoaiSanPham]) VALUES (N'DG        ', N'Dầu gội')
INSERT [dbo].[LoaiSanPham] ([IDLoaiSanPham], [TenLoaiSanPham]) VALUES (N'K01       ', N'Kẹo')
INSERT [dbo].[LoaiSanPham] ([IDLoaiSanPham], [TenLoaiSanPham]) VALUES (N'KDR       ', N'Kem đánh răng')
INSERT [dbo].[LoaiSanPham] ([IDLoaiSanPham], [TenLoaiSanPham]) VALUES (N'MAL       ', N'Mỳ phở ăn liền')
INSERT [dbo].[LoaiSanPham] ([IDLoaiSanPham], [TenLoaiSanPham]) VALUES (N'S01       ', N'Sữa')
INSERT [dbo].[LoaiSanPham] ([IDLoaiSanPham], [TenLoaiSanPham]) VALUES (N'SRM       ', N'Sữa rửa mặt')
INSERT [dbo].[LoaiSanPham] ([IDLoaiSanPham], [TenLoaiSanPham]) VALUES (N'ST        ', N'Sữa tắm')
INSERT [dbo].[LoaiSanPham] ([IDLoaiSanPham], [TenLoaiSanPham]) VALUES (N'XP        ', N'Xà Phòng')
INSERT [dbo].[LoaiSanPham] ([IDLoaiSanPham], [TenLoaiSanPham]) VALUES (N'XX        ', N'Xúc Xích')
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'BH01      ', N'NV01      ', 30, 150000.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'BH02      ', N'NV01      ', 30, 150000.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'BH03      ', N'NV01      ', 30, 150000.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'BH04      ', N'NV01      ', 30, 150000.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'BH05      ', N'NV01      ', 26, 0.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'BH06      ', N'NV01      ', 27, 0.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'BH07      ', N'NV01      ', 29, 100000.0000, 50000.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'BH08      ', N'NV01      ', 29, 100000.0000, 50000.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'BH09      ', N'NV01      ', 29, 100000.0000, 50000.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'BH10      ', N'NV01      ', 29, 100000.0000, 50000.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'BH11      ', N'NV01      ', 29, 100000.0000, 50000.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'BH12      ', N'NV01      ', 30, 150000.0000, 50000.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'BH13      ', N'NV01      ', 30, 150000.0000, 50000.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'BH14      ', N'NV01      ', 30, 150000.0000, 50000.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'BH15      ', N'NV01      ', 30, 150000.0000, 50000.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'BH16      ', N'NV01      ', 30, 150000.0000, 50000.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'BH17      ', N'NV01      ', 30, 150000.0000, 50000.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'BH18      ', N'NV01      ', 30, 150000.0000, 50000.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'BH19      ', N'NV01      ', 30, 150000.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'BH20      ', N'NV01      ', 30, 150000.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'BH21      ', N'NV01      ', 30, 150000.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'BH22      ', N'NV01      ', 30, 150000.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'QK01      ', N'NV02      ', 29, 100000.0000, 50000.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'QK02      ', N'NV02      ', 30, 150000.0000, 30000.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'QK03      ', N'NV02      ', 28, 0.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'QK04      ', N'NV02      ', 27, 0.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'QK05      ', N'NV02      ', 30, 150000.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'QK06      ', N'NV02      ', 26, 0.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'QK07      ', N'NV02      ', 27, 0.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'QK08      ', N'NV02      ', 30, 150000.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'QK09      ', N'NV02      ', 30, 150000.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'QK10      ', N'NV02      ', 30, 150000.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'QK11      ', N'NV02      ', 30, 150000.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'QK12      ', N'NV02      ', 30, 150000.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'TL01      ', N'NV03      ', 28, 0.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'TL02      ', N'NV03      ', 28, 0.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'TL03      ', N'NV03      ', 27, 0.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'TL04      ', N'NV03      ', 29, 100000.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'TL05      ', N'NV03      ', 30, 150000.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'TL06      ', N'NV03      ', 30, 150000.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'TL07      ', N'NV03      ', 30, 150000.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'TL08      ', N'NV03      ', 30, 150000.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'TL09      ', N'NV03      ', 30, 150000.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'TL10      ', N'NV03      ', 30, 150000.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'TL11      ', N'NV03      ', 30, 150000.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[Luong] ([IDNhanVien], [IDNghiepVu], [SoNgayLam], [Thuong], [Phat], [NgayTraLuong]) VALUES (N'TL12      ', N'NV03      ', 30, 150000.0000, 0.0000, CAST(N'2015-05-15' AS Date))
INSERT [dbo].[NghiepVu] ([IDNghiepVu], [TenNghiepVu], [LuongUng]) VALUES (N'NV01      ', N'Bán hàng', 200000.0000)
INSERT [dbo].[NghiepVu] ([IDNghiepVu], [TenNghiepVu], [LuongUng]) VALUES (N'NV02      ', N'Quản Lí kho', 250000.0000)
INSERT [dbo].[NghiepVu] ([IDNghiepVu], [TenNghiepVu], [LuongUng]) VALUES (N'NV03      ', N'Nhận và trả lời phản hồi', 210000.0000)
INSERT [dbo].[NhaCungCap] ([IDNhaCungCap], [TenNhaCC], [DiaChi], [SDT], [Fax]) VALUES (N'C01       ', N'Cao Hồng Sơn', N'Giáp Bát, Hoàng Mai', N'0629521856', N'0678912345')
INSERT [dbo].[NhaCungCap] ([IDNhaCungCap], [TenNhaCC], [DiaChi], [SDT], [Fax]) VALUES (N'C02       ', N'Hà Văn Cường', N'Bách Khoa, Hai Bà Trưng', N'0629521857', N'0678912346')
INSERT [dbo].[NhaCungCap] ([IDNhaCungCap], [TenNhaCC], [DiaChi], [SDT], [Fax]) VALUES (N'C03       ', N'Huy Hùng', N'Cầu Giấy', N'0629521858', N'0678912347')
INSERT [dbo].[NhaCungCap] ([IDNhaCungCap], [TenNhaCC], [DiaChi], [SDT], [Fax]) VALUES (N'C04       ', N'Lê Trung Hiếu', N'Kim Mã, Ba Đình', N'0629521859', N'0678912348')
INSERT [dbo].[NhaCungCap] ([IDNhaCungCap], [TenNhaCC], [DiaChi], [SDT], [Fax]) VALUES (N'C05       ', N'Trần Hà Trang', N'Linh Chiểu , Thủ Đức', N'0629521860', N'0678912349')
INSERT [dbo].[NhaCungCap] ([IDNhaCungCap], [TenNhaCC], [DiaChi], [SDT], [Fax]) VALUES (N'C06       ', N'Lê Mai Phương', N'Thị xã Dĩ An ', N'0629521861', N'0678912350')
INSERT [dbo].[NhaCungCap] ([IDNhaCungCap], [TenNhaCC], [DiaChi], [SDT], [Fax]) VALUES (N'C07       ', N'Đào Tấn Cường', N'Trường Thạch, Quận 9', N'0629521862', N'0678912351')
INSERT [dbo].[NhaCungCap] ([IDNhaCungCap], [TenNhaCC], [DiaChi], [SDT], [Fax]) VALUES (N'C08       ', N'Lê Huy Đức', N'Phú Hiệp, Quận 9', N'0629521863', N'0678912352')
INSERT [dbo].[NhaCungCap] ([IDNhaCungCap], [TenNhaCC], [DiaChi], [SDT], [Fax]) VALUES (N'C09       ', N'Tôn Đức Thắng', N'Giang Văn Minh, Ba Đình', N'0629521864', N'0678912353')
INSERT [dbo].[NhaCungCap] ([IDNhaCungCap], [TenNhaCC], [DiaChi], [SDT], [Fax]) VALUES (N'C10       ', N'Lê Hồng Ngọc', N'Lê Thanh Nghị, Hai Bà Trưng', N'0629521865', N'0678912354')
INSERT [dbo].[NhaCungCap] ([IDNhaCungCap], [TenNhaCC], [DiaChi], [SDT], [Fax]) VALUES (N'C11       ', N'Lê Công Tuấn', N'Bạch Mai, Hai Bà Trưng', N'0629521866', N'0678912355')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'BH01      ', N'Lê Huyền Thương', N'VM01      ', N'0875432156', N'nữ')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'BH02      ', N'Đào Bá Cường', N'VM02      ', N'0875432157', N'nam')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'BH03      ', N'Hà Văn Minh', N'VM03      ', N'0875432158', N'nam')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'BH04      ', N'Đoàn Văn Quân', N'VM04      ', N'0875432159', N'nam')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'BH05      ', N'Tào Đức Anh', N'VM05      ', N'0875432160', N'nam')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'BH06      ', N'Ngô Văn Huy', N'VM06      ', N'0875432161', N'nam')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'BH07      ', N'Lê Trung Kiên ', N'VM07      ', N'0875432162', N'nam')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'BH08      ', N'Tạ Bá Sáng', N'VM01      ', N'0875432163', N'nam')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'BH09      ', N'Vũ Như Quỳnh', N'VM02      ', N'0875432164', N'nữ')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'BH10      ', N'Đào Ngọc Mai', N'VM03      ', N'0875432165', N'nữ')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'BH11      ', N'NGuyễn Thị Minh', N'VM04      ', N'0875432166', N'nữ')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'BH12      ', N'Lê Thu Thảo', N'VM05      ', N'0875432167', N'nữ')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'BH13      ', N'Lê Thu Quỳnh', N'VM06      ', N'0875432168', N'nữ')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'BH14      ', N'Lê Thu Uyên', N'VM07      ', N'0875432169', N'nữ')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'BH15      ', N'Đỗ Thị Quyên', N'VM08      ', N'0875432170', N'nữ')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'BH16      ', N'Lê Thị Mai', N'VM09      ', N'0875432171', N'nữ')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'BH17      ', N'NGuyễn Thị Minh', N'VM10      ', N'0875432172', N'nữ')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'BH18      ', N'Hà Thị Sáng', N'VM11      ', N'0875432173', N'nữ')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'BH19      ', N'Lê Văn Hưng', N'VM12      ', N'0584245769', NULL)
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'BH20      ', N'Lê Văn Hưng', N'VM07      ', N'0584245770', NULL)
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'BH21      ', N'Lê Huyền Thương', N'VM08      ', N'0584245771', N'nữ')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'BH22      ', N'Lê Huyền Thương', N'VM09      ', N'0584245772', N'nữ')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'QK01      ', N'Nguyễn Thu Hà', N'VM01      ', N'0965148995', N'nữ')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'QK02      ', N'Trần Huy', N'VM02      ', N'0965148996', NULL)
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'QK03      ', N'Hà Trung Anh', N'VM03      ', N'0965148997', NULL)
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'QK04      ', N'Bùi Thu Hiền', N'VM04      ', N'0965148998', N'nữ')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'QK05      ', N'Lê Văn Hưng', N'VM05      ', N'0965148999', NULL)
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'QK06      ', N'Lê Hà Trang', N'VM06      ', N'0965149000', N'nữ')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'QK07      ', N'Hoàng Trung Kiên', N'VM07      ', N'0965149001', NULL)
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'QK08      ', N'Trần Đức Mạnh', N'VM08      ', N'0965149002', NULL)
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'QK09      ', N'Nguyễn Văn Đức', N'VM09      ', N'0965149003', NULL)
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'QK10      ', N'Hà Anh Tuấn', N'VM10      ', N'0965149004', NULL)
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'QK11      ', N'Đinh Văn Tùng', N'VM11      ', N'0965149005', NULL)
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'QK12      ', N'Nguyễn Thế Huy', N'VM12      ', N'0965149006', NULL)
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'TL01      ', N'Lê Hồng Hà', N'VM01      ', N'0976543965', N'nữ')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'TL02      ', N'Nguyễn Lệ Hằng', N'VM02      ', N'0976543966', N'nữ')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'TL03      ', N'Nguyễn Thị Lệ', N'VM03      ', N'0976543967', N'nữ')
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'TL04      ', N'Trương Thị Lệ', N'VM04      ', N'0976543968', NULL)
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'TL05      ', N'Lê Thị Hằng', N'VM05      ', N'0976543969', NULL)
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'TL06      ', N'Lê Thị Hằng', N'VM06      ', N'0976543970', NULL)
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'TL07      ', N'Lê Thị Hằng', N'VM07      ', N'0976543971', NULL)
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'TL08      ', N'Phạm Bá Huy', N'VM08      ', N'0976543972', NULL)
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'TL09      ', N'Nguyễn Lê Lộc', N'VM09      ', N'0976543973', NULL)
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'TL10      ', N'Long Thị Lê', N'VM10      ', N'0976543974', NULL)
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'TL11      ', N'Đặng Thị Ngọc', N'VM11      ', N'0976543975', NULL)
INSERT [dbo].[NhanVien] ([IDNhanVien], [TenNhanVien], [IDChiNhanh], [SDT], [Sex]) VALUES (N'TL12      ', N'Đặng Ngọc Linh', N'VM12      ', N'0976543976', NULL)
INSERT [dbo].[PhanHoi] ([IDPhanHoi], [IDKhachHang], [NDPhanHoi], [NgayPhanHoi], [DiaChiPH]) VALUES (N'PH01      ', N'KH01      ', N'Hàng chât lượng', CAST(N'2015-05-05 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PhanHoi] ([IDPhanHoi], [IDKhachHang], [NDPhanHoi], [NgayPhanHoi], [DiaChiPH]) VALUES (N'PH02      ', N'KH02      ', N'Thái độ phục vụ tốt.', CAST(N'2015-05-05 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PhanHoi] ([IDPhanHoi], [IDKhachHang], [NDPhanHoi], [NgayPhanHoi], [DiaChiPH]) VALUES (N'PH03      ', N'KH03      ', N'Chi Nhánh có bán sản phẩm x không?', CAST(N'2015-05-05 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PhanHoi] ([IDPhanHoi], [IDKhachHang], [NDPhanHoi], [NgayPhanHoi], [DiaChiPH]) VALUES (N'PH04      ', N'KH04      ', N'Hàng bị lỗi, nên kiểm tra kĩ hàng trước khi bán', CAST(N'2015-05-05 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PhanHoi] ([IDPhanHoi], [IDKhachHang], [NDPhanHoi], [NgayPhanHoi], [DiaChiPH]) VALUES (N'PH05      ', N'KH05      ', N'Hài lòng về hàng hóa của chi nhánh', CAST(N'2015-05-06 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PhanHoi] ([IDPhanHoi], [IDKhachHang], [NDPhanHoi], [NgayPhanHoi], [DiaChiPH]) VALUES (N'PH06      ', N'KH06      ', N'Các phân loại hàng dễ tìm', CAST(N'2015-05-06 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PhanHoi] ([IDPhanHoi], [IDKhachHang], [NDPhanHoi], [NgayPhanHoi], [DiaChiPH]) VALUES (N'PH07      ', N'KH07      ', N'Giá cả hợp lí', CAST(N'2015-05-06 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PhanHoi] ([IDPhanHoi], [IDKhachHang], [NDPhanHoi], [NgayPhanHoi], [DiaChiPH]) VALUES (N'PH08      ', N'KH08      ', N'Sản phẩm sửa rửa mặt a có phù hợp với da dầu không?', CAST(N'2015-05-06 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PhanHoi] ([IDPhanHoi], [IDKhachHang], [NDPhanHoi], [NgayPhanHoi], [DiaChiPH]) VALUES (N'PH09      ', N'KH09      ', N'Sẽ tiếp tục ủng hộ ', CAST(N'2015-05-21 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PhanHoi] ([IDPhanHoi], [IDKhachHang], [NDPhanHoi], [NgayPhanHoi], [DiaChiPH]) VALUES (N'PH10      ', N'KH10      ', N'Sẽ tiếp tục ủng hộ ', CAST(N'2015-05-21 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PhanHoi] ([IDPhanHoi], [IDKhachHang], [NDPhanHoi], [NgayPhanHoi], [DiaChiPH]) VALUES (N'PH11      ', N'KH11      ', N'Sẽ tiếp tục ủng hộ ', CAST(N'2015-05-21 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PhanHoi] ([IDPhanHoi], [IDKhachHang], [NDPhanHoi], [NgayPhanHoi], [DiaChiPH]) VALUES (N'PH12      ', N'KH12      ', N'Sẽ tiếp tục ủng hộ ', CAST(N'2015-05-21 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PhanHoi] ([IDPhanHoi], [IDKhachHang], [NDPhanHoi], [NgayPhanHoi], [DiaChiPH]) VALUES (N'PH13      ', N'KH13      ', N'Sẽ tiếp tục ủng hộ ', CAST(N'2015-09-21 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PhanHoi] ([IDPhanHoi], [IDKhachHang], [NDPhanHoi], [NgayPhanHoi], [DiaChiPH]) VALUES (N'PH14      ', N'KH14      ', N'Sẽ tiếp tục ủng hộ ', CAST(N'2015-09-21 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PhanHoi] ([IDPhanHoi], [IDKhachHang], [NDPhanHoi], [NgayPhanHoi], [DiaChiPH]) VALUES (N'PH15      ', N'KH15      ', N'Sẽ tiếp tục ủng hộ ', CAST(N'2015-09-21 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PhanHoi] ([IDPhanHoi], [IDKhachHang], [NDPhanHoi], [NgayPhanHoi], [DiaChiPH]) VALUES (N'PH16      ', N'KH16      ', N'Sẽ tiếp tục ủng hộ ', CAST(N'2015-09-21 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PhanHoi] ([IDPhanHoi], [IDKhachHang], [NDPhanHoi], [NgayPhanHoi], [DiaChiPH]) VALUES (N'PH17      ', N'KH17      ', N'Sẽ tiếp tục ủng hộ ', CAST(N'2015-09-21 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PhanHoi] ([IDPhanHoi], [IDKhachHang], [NDPhanHoi], [NgayPhanHoi], [DiaChiPH]) VALUES (N'PH18      ', N'KH18      ', N'Sẽ tiếp tục ủng hộ ', CAST(N'2015-09-21 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PhanHoi] ([IDPhanHoi], [IDKhachHang], [NDPhanHoi], [NgayPhanHoi], [DiaChiPH]) VALUES (N'PH19      ', N'KH19      ', N'Sẽ tiếp tục ủng hộ ', CAST(N'2016-07-03 00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[PhieuNhapKho] ([IDPhieuNhap], [IDNhanVien], [IDKho], [NgayNhapKho]) VALUES (N'N01       ', N'QK01      ', N'K01       ', CAST(N'2015-03-04' AS Date))
INSERT [dbo].[PhieuNhapKho] ([IDPhieuNhap], [IDNhanVien], [IDKho], [NgayNhapKho]) VALUES (N'N02       ', N'QK02      ', N'K02       ', CAST(N'2015-03-04' AS Date))
INSERT [dbo].[PhieuNhapKho] ([IDPhieuNhap], [IDNhanVien], [IDKho], [NgayNhapKho]) VALUES (N'N03       ', N'QK03      ', N'K03       ', CAST(N'2015-03-06' AS Date))
INSERT [dbo].[PhieuNhapKho] ([IDPhieuNhap], [IDNhanVien], [IDKho], [NgayNhapKho]) VALUES (N'N04       ', N'QK04      ', N'K04       ', CAST(N'2015-03-07' AS Date))
INSERT [dbo].[PhieuNhapKho] ([IDPhieuNhap], [IDNhanVien], [IDKho], [NgayNhapKho]) VALUES (N'N05       ', N'QK05      ', N'K05       ', CAST(N'2015-03-08' AS Date))
INSERT [dbo].[PhieuNhapKho] ([IDPhieuNhap], [IDNhanVien], [IDKho], [NgayNhapKho]) VALUES (N'N06       ', N'QK06      ', N'K06       ', CAST(N'2015-03-09' AS Date))
INSERT [dbo].[PhieuNhapKho] ([IDPhieuNhap], [IDNhanVien], [IDKho], [NgayNhapKho]) VALUES (N'N07       ', N'QK07      ', N'K07       ', CAST(N'2015-03-10' AS Date))
INSERT [dbo].[PhieuNhapKho] ([IDPhieuNhap], [IDNhanVien], [IDKho], [NgayNhapKho]) VALUES (N'N08       ', N'QK08      ', N'K08       ', CAST(N'2015-03-11' AS Date))
INSERT [dbo].[PhieuNhapKho] ([IDPhieuNhap], [IDNhanVien], [IDKho], [NgayNhapKho]) VALUES (N'N09       ', N'QK09      ', N'K09       ', CAST(N'2015-03-12' AS Date))
INSERT [dbo].[PhieuNhapKho] ([IDPhieuNhap], [IDNhanVien], [IDKho], [NgayNhapKho]) VALUES (N'N13       ', N'QK01      ', N'K01       ', CAST(N'2015-03-16' AS Date))
INSERT [dbo].[PhieuNhapKho] ([IDPhieuNhap], [IDNhanVien], [IDKho], [NgayNhapKho]) VALUES (N'N14       ', N'QK02      ', N'K02       ', CAST(N'2015-03-17' AS Date))
INSERT [dbo].[PhieuNhapKho] ([IDPhieuNhap], [IDNhanVien], [IDKho], [NgayNhapKho]) VALUES (N'N15       ', N'QK03      ', N'K03       ', CAST(N'2015-03-18' AS Date))
INSERT [dbo].[PhieuNhapKho] ([IDPhieuNhap], [IDNhanVien], [IDKho], [NgayNhapKho]) VALUES (N'N16       ', N'QK04      ', N'K04       ', CAST(N'2015-03-19' AS Date))
INSERT [dbo].[PhieuNhapKho] ([IDPhieuNhap], [IDNhanVien], [IDKho], [NgayNhapKho]) VALUES (N'N17       ', N'QK05      ', N'K05       ', CAST(N'2015-03-20' AS Date))
INSERT [dbo].[PhieuNhapKho] ([IDPhieuNhap], [IDNhanVien], [IDKho], [NgayNhapKho]) VALUES (N'N18       ', N'QK06      ', N'K06       ', CAST(N'2015-03-21' AS Date))
INSERT [dbo].[PhieuNhapKho] ([IDPhieuNhap], [IDNhanVien], [IDKho], [NgayNhapKho]) VALUES (N'N19       ', N'QK07      ', N'K07       ', CAST(N'2015-03-22' AS Date))
INSERT [dbo].[PhieuNhapKho] ([IDPhieuNhap], [IDNhanVien], [IDKho], [NgayNhapKho]) VALUES (N'N20       ', N'QK08      ', N'K08       ', CAST(N'2015-03-23' AS Date))
INSERT [dbo].[PhieuNhapKho] ([IDPhieuNhap], [IDNhanVien], [IDKho], [NgayNhapKho]) VALUES (N'N21       ', N'QK09      ', N'K09       ', CAST(N'2015-03-24' AS Date))
INSERT [dbo].[PhieuNhapKho] ([IDPhieuNhap], [IDNhanVien], [IDKho], [NgayNhapKho]) VALUES (N'N25       ', N'QK03      ', N'K03       ', CAST(N'2015-03-28' AS Date))
INSERT [dbo].[PhieuNhapKho] ([IDPhieuNhap], [IDNhanVien], [IDKho], [NgayNhapKho]) VALUES (N'N26       ', N'QK04      ', N'K04       ', CAST(N'2015-03-29' AS Date))
INSERT [dbo].[PhieuNhapKho] ([IDPhieuNhap], [IDNhanVien], [IDKho], [NgayNhapKho]) VALUES (N'N27       ', N'QK05      ', N'K05       ', CAST(N'2015-03-30' AS Date))
INSERT [dbo].[PhieuNhapKho] ([IDPhieuNhap], [IDNhanVien], [IDKho], [NgayNhapKho]) VALUES (N'N28       ', N'QK06      ', N'K06       ', CAST(N'2015-03-31' AS Date))
INSERT [dbo].[PhieuNhapKho] ([IDPhieuNhap], [IDNhanVien], [IDKho], [NgayNhapKho]) VALUES (N'N29       ', N'QK07      ', N'K07       ', CAST(N'2015-04-01' AS Date))
INSERT [dbo].[PhieuNhapKho] ([IDPhieuNhap], [IDNhanVien], [IDKho], [NgayNhapKho]) VALUES (N'N30       ', N'QK08      ', N'K08       ', CAST(N'2015-04-02' AS Date))
INSERT [dbo].[PhieuXuatKho] ([IDPhieuXuat], [IDNhanVien], [IDKho], [NgayXuat]) VALUES (N'X01       ', N'QK01      ', N'K01       ', CAST(N'2015-07-06' AS Date))
INSERT [dbo].[PhieuXuatKho] ([IDPhieuXuat], [IDNhanVien], [IDKho], [NgayXuat]) VALUES (N'X02       ', N'QK02      ', N'K02       ', CAST(N'2015-07-07' AS Date))
INSERT [dbo].[PhieuXuatKho] ([IDPhieuXuat], [IDNhanVien], [IDKho], [NgayXuat]) VALUES (N'X03       ', N'QK03      ', N'K03       ', CAST(N'2015-07-08' AS Date))
INSERT [dbo].[PhieuXuatKho] ([IDPhieuXuat], [IDNhanVien], [IDKho], [NgayXuat]) VALUES (N'X04       ', N'QK04      ', N'K04       ', CAST(N'2015-07-09' AS Date))
INSERT [dbo].[PhieuXuatKho] ([IDPhieuXuat], [IDNhanVien], [IDKho], [NgayXuat]) VALUES (N'X05       ', N'QK05      ', N'K05       ', CAST(N'2015-07-10' AS Date))
INSERT [dbo].[PhieuXuatKho] ([IDPhieuXuat], [IDNhanVien], [IDKho], [NgayXuat]) VALUES (N'X06       ', N'QK06      ', N'K06       ', CAST(N'2015-07-11' AS Date))
INSERT [dbo].[PhieuXuatKho] ([IDPhieuXuat], [IDNhanVien], [IDKho], [NgayXuat]) VALUES (N'X07       ', N'QK04      ', N'K04       ', CAST(N'2015-07-12' AS Date))
INSERT [dbo].[PhieuXuatKho] ([IDPhieuXuat], [IDNhanVien], [IDKho], [NgayXuat]) VALUES (N'X08       ', N'QK05      ', N'K05       ', CAST(N'2015-07-13' AS Date))
INSERT [dbo].[PhieuXuatKho] ([IDPhieuXuat], [IDNhanVien], [IDKho], [NgayXuat]) VALUES (N'X09       ', N'QK06      ', N'K06       ', CAST(N'2015-07-14' AS Date))
INSERT [dbo].[PhieuXuatKho] ([IDPhieuXuat], [IDNhanVien], [IDKho], [NgayXuat]) VALUES (N'X10       ', N'QK07      ', N'K07       ', CAST(N'2015-07-15' AS Date))
INSERT [dbo].[PhieuXuatKho] ([IDPhieuXuat], [IDNhanVien], [IDKho], [NgayXuat]) VALUES (N'X11       ', N'QK08      ', N'K08       ', CAST(N'2015-07-16' AS Date))
INSERT [dbo].[PhieuXuatKho] ([IDPhieuXuat], [IDNhanVien], [IDKho], [NgayXuat]) VALUES (N'X12       ', N'QK09      ', N'K09       ', CAST(N'2015-07-17' AS Date))
INSERT [dbo].[PhieuXuatKho] ([IDPhieuXuat], [IDNhanVien], [IDKho], [NgayXuat]) VALUES (N'X15       ', N'QK07      ', N'K07       ', CAST(N'2015-07-20' AS Date))
INSERT [dbo].[PhieuXuatKho] ([IDPhieuXuat], [IDNhanVien], [IDKho], [NgayXuat]) VALUES (N'X16       ', N'QK08      ', N'K08       ', CAST(N'2015-07-21' AS Date))
INSERT [dbo].[PhieuXuatKho] ([IDPhieuXuat], [IDNhanVien], [IDKho], [NgayXuat]) VALUES (N'X17       ', N'QK09      ', N'K09       ', CAST(N'2015-07-22' AS Date))
INSERT [dbo].[PhieuXuatKho] ([IDPhieuXuat], [IDNhanVien], [IDKho], [NgayXuat]) VALUES (N'X21       ', N'QK02      ', N'K02       ', CAST(N'2015-07-26' AS Date))
INSERT [dbo].[PhieuXuatKho] ([IDPhieuXuat], [IDNhanVien], [IDKho], [NgayXuat]) VALUES (N'X22       ', N'QK03      ', N'K03       ', CAST(N'2015-07-27' AS Date))
INSERT [dbo].[PhieuXuatKho] ([IDPhieuXuat], [IDNhanVien], [IDKho], [NgayXuat]) VALUES (N'X23       ', N'QK04      ', N'K04       ', CAST(N'2015-07-28' AS Date))
INSERT [dbo].[PhieuXuatKho] ([IDPhieuXuat], [IDNhanVien], [IDKho], [NgayXuat]) VALUES (N'X24       ', N'QK05      ', N'K05       ', CAST(N'2015-07-29' AS Date))
INSERT [dbo].[PhieuXuatKho] ([IDPhieuXuat], [IDNhanVien], [IDKho], [NgayXuat]) VALUES (N'X25       ', N'QK06      ', N'K06       ', CAST(N'2015-07-30' AS Date))
INSERT [dbo].[PhieuXuatKho] ([IDPhieuXuat], [IDNhanVien], [IDKho], [NgayXuat]) VALUES (N'X26       ', N'QK07      ', N'K07       ', CAST(N'2015-07-31' AS Date))
INSERT [dbo].[PhieuXuatKho] ([IDPhieuXuat], [IDNhanVien], [IDKho], [NgayXuat]) VALUES (N'X27       ', N'QK08      ', N'K08       ', CAST(N'2015-08-01' AS Date))
INSERT [dbo].[PhieuXuatKho] ([IDPhieuXuat], [IDNhanVien], [IDKho], [NgayXuat]) VALUES (N'X28       ', N'QK09      ', N'K09       ', CAST(N'2015-08-02' AS Date))
INSERT [dbo].[QuanLy] ([IDQuanLy], [IDChiNhanh], [TenQly], [DiaChi], [SDT]) VALUES (N'QL01      ', N'VM01      ', N'Trần Linh', N'Số 7 Tạ Quang Bửu, Bách Khoa, Hai Bà Trưng ', N'0145368759')
INSERT [dbo].[QuanLy] ([IDQuanLy], [IDChiNhanh], [TenQly], [DiaChi], [SDT]) VALUES (N'QL02      ', N'VM02      ', N'Vũ Hiểu', N'128 Lê Thanh Nghị, Bách Khoa, Hai Bà Trưng', N'0145369784')
INSERT [dbo].[QuanLy] ([IDQuanLy], [IDChiNhanh], [TenQly], [DiaChi], [SDT]) VALUES (N'QL03      ', N'VM03      ', N'Lê Thị Minh', N'26 Bạch Mai', N'0145375424')
INSERT [dbo].[QuanLy] ([IDQuanLy], [IDChiNhanh], [TenQly], [DiaChi], [SDT]) VALUES (N'QL04      ', N'VM04      ', N'Hà Thị Huệ', N'28 Lĩnh Nam', N'0145375425')
INSERT [dbo].[QuanLy] ([IDQuanLy], [IDChiNhanh], [TenQly], [DiaChi], [SDT]) VALUES (N'QL05      ', N'VM05      ', N'Lê Bá Thắng', N'456 Thợ Nhuộm', N'0674823225')
INSERT [dbo].[QuanLy] ([IDQuanLy], [IDChiNhanh], [TenQly], [DiaChi], [SDT]) VALUES (N'QL06      ', N'VM06      ', N'Trần Nguyên Hùng', N'56 Võ Thị Sáu', N'0679474556')
INSERT [dbo].[QuanLy] ([IDQuanLy], [IDChiNhanh], [TenQly], [DiaChi], [SDT]) VALUES (N'QL07      ', N'VM07      ', N'Hà Huy Tập', N'208 Cầu Giấy', N'0645324333')
INSERT [dbo].[QuanLy] ([IDQuanLy], [IDChiNhanh], [TenQly], [DiaChi], [SDT]) VALUES (N'QL08      ', N'VM08      ', N'Vũ Anh Đức', N'269 Cầu Giấy', N'0689645424')
INSERT [dbo].[QuanLy] ([IDQuanLy], [IDChiNhanh], [TenQly], [DiaChi], [SDT]) VALUES (N'QL09      ', N'VM09      ', N'Vũ Bá Thành', N'210 Cầu Giấy', N'0768667842')
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp01      ', N'Bánh quy Hải Hà', N'C01       ', N'B01       ', N'xanh')
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp02      ', N'Bánh tippo', N'C02       ', N'B01       ', N'đỏ')
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp03      ', N'Bánh Nabati', N'C03       ', N'B01       ', N'vàng')
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp04      ', N'Kẹo kitkat', N'C04       ', N'K01       ', N'cam ')
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp05      ', N'Kẹo dừa', N'C05       ', N'K01       ', N'hồng')
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp06      ', N'Mì hảo hảo', N'C06       ', N'MAL       ', N'tím')
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp07      ', N'Phờ Bò Vifon', N'C07       ', N'MAL       ', N'xanh')
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp08      ', N'Sữa Fami', N'C08       ', N'S01       ', N'lục')
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp09      ', N'Sữa Vinamilk', N'C09       ', N'S01       ', N'chàm')
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp10      ', N'Bột cacao', N'C10       ', N'B02       ', N'nâu')
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp11      ', N'Bột giặt omo', N'C11       ', N'B02       ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp12      ', N'Bột Giặt ariel', N'C01       ', N'B02       ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp13      ', N'Bột giặt tide', N'C02       ', N'B02       ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp14      ', N'Bột ngũ cốc dinh dưỡng', N'C03       ', N'B02       ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp15      ', N'dầu gội dove', N'C04       ', N'BG        ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp16      ', N'dầu gội clear', N'C05       ', N'BG        ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp17      ', N'dầu gội head and shoulder', N'C06       ', N'BG        ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp18      ', N'sữa tắm dove', N'C07       ', N'ST        ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp19      ', N'sữa tắm aderma', N'C08       ', N'ST        ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp20      ', N'sữa tắm romano', N'C09       ', N'ST        ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp21      ', N'kem đánh răng ps', N'C01       ', N'KDR       ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp22      ', N'kem đánh răng colgat', N'C02       ', N'KDR       ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp23      ', N'kem đánh răng closeup', N'C03       ', N'KDR       ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp24      ', N'sữa rửa mặt acnes', N'C04       ', N'SRM       ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp25      ', N'sữa rửa mặt innisfree', N'C05       ', N'SRM       ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp26      ', N'sữa rửa mặt fond', N'C06       ', N'SRM       ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp27      ', N'Cháo vifon', N'C07       ', N'CAL       ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp28      ', N'cháo gấu đỏ', N'C08       ', N'CAL       ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp29      ', N'bột mỳ ', N'C09       ', N'B03       ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp30      ', N'bột gạo', N'C10       ', N'B03       ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp31      ', N'bột gạo lứt', N'C01       ', N'B03       ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp32      ', N'bột bánh rán doremon', N'C02       ', N'B03       ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp33      ', N'xúc xích bông mai', N'C03       ', N'XX        ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp34      ', N'xúc xích bé khỏe', N'C04       ', N'XX        ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp35      ', N'xúc xích Việt đức', N'C05       ', N'XX        ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp36      ', N'sữa Mộc Châu', N'C06       ', N'S01       ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp37      ', N'Dầu cái lân', N'C07       ', N'DA        ', NULL)
INSERT [dbo].[SanPham] ([IDSanPham], [TenSanPham], [IDNhaCC], [IDLoaiSanPham], [MauSac]) VALUES (N'Sp38      ', N'Dầu ăn simply', N'C08       ', N'DA        ', NULL)
ALTER TABLE [dbo].[ChiNhanh]  WITH CHECK ADD  CONSTRAINT [FK_ChiNhanh_KhuVuc] FOREIGN KEY([IDKhuVuc])
REFERENCES [dbo].[KhuVuc] ([IDKhuVuc])
GO
ALTER TABLE [dbo].[ChiNhanh] CHECK CONSTRAINT [FK_ChiNhanh_KhuVuc]
GO
ALTER TABLE [dbo].[CTDonMuaHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDonMuaHang_DonMuaHang] FOREIGN KEY([IDHoaDon])
REFERENCES [dbo].[DonMuaHang] ([IDHoaDon])
GO
ALTER TABLE [dbo].[CTDonMuaHang] CHECK CONSTRAINT [FK_CTDonMuaHang_DonMuaHang]
GO
ALTER TABLE [dbo].[CTDonMuaHang]  WITH CHECK ADD  CONSTRAINT [FK_CTDonMuaHang_SanPham] FOREIGN KEY([IDSanPham])
REFERENCES [dbo].[SanPham] ([IDSanPham])
GO
ALTER TABLE [dbo].[CTDonMuaHang] CHECK CONSTRAINT [FK_CTDonMuaHang_SanPham]
GO
ALTER TABLE [dbo].[CTDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_CTDonNhap_DonNhap] FOREIGN KEY([IDHoaDon])
REFERENCES [dbo].[DonNhap] ([IDHoaDon])
GO
ALTER TABLE [dbo].[CTDonNhap] CHECK CONSTRAINT [FK_CTDonNhap_DonNhap]
GO
ALTER TABLE [dbo].[CTDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_CTDonNhap_SanPham] FOREIGN KEY([IDSanPham])
REFERENCES [dbo].[SanPham] ([IDSanPham])
GO
ALTER TABLE [dbo].[CTDonNhap] CHECK CONSTRAINT [FK_CTDonNhap_SanPham]
GO
ALTER TABLE [dbo].[CTPhieuNhapKho]  WITH CHECK ADD  CONSTRAINT [FK_CTPhieuNhapKho_SanPham] FOREIGN KEY([IDSanPham])
REFERENCES [dbo].[SanPham] ([IDSanPham])
GO
ALTER TABLE [dbo].[CTPhieuNhapKho] CHECK CONSTRAINT [FK_CTPhieuNhapKho_SanPham]
GO
ALTER TABLE [dbo].[CTPhieuXuatKho]  WITH CHECK ADD  CONSTRAINT [FK_CTPhieuXuatKho_SanPham] FOREIGN KEY([IDSanPham])
REFERENCES [dbo].[SanPham] ([IDSanPham])
GO
ALTER TABLE [dbo].[CTPhieuXuatKho] CHECK CONSTRAINT [FK_CTPhieuXuatKho_SanPham]
GO
ALTER TABLE [dbo].[DonMuaHang]  WITH CHECK ADD  CONSTRAINT [FK_DonMuaHang_KhachHang] FOREIGN KEY([IDKhachHang])
REFERENCES [dbo].[KhachHang] ([IDKhachHang])
GO
ALTER TABLE [dbo].[DonMuaHang] CHECK CONSTRAINT [FK_DonMuaHang_KhachHang]
GO
ALTER TABLE [dbo].[HoTroKhachHang]  WITH CHECK ADD  CONSTRAINT [FK_HoTroKhachHang_NhanVien] FOREIGN KEY([IDNhanVien])
REFERENCES [dbo].[NhanVien] ([IDNhanVien])
GO
ALTER TABLE [dbo].[HoTroKhachHang] CHECK CONSTRAINT [FK_HoTroKhachHang_NhanVien]
GO
ALTER TABLE [dbo].[HoTroKhachHang]  WITH CHECK ADD  CONSTRAINT [FK_HoTroKhachHang_PhanHoi] FOREIGN KEY([IDPhanHoi])
REFERENCES [dbo].[PhanHoi] ([IDPhanHoi])
GO
ALTER TABLE [dbo].[HoTroKhachHang] CHECK CONSTRAINT [FK_HoTroKhachHang_PhanHoi]
GO
ALTER TABLE [dbo].[Kho]  WITH CHECK ADD  CONSTRAINT [FK_Kho_ChiNhanh] FOREIGN KEY([IDChiNhanh])
REFERENCES [dbo].[ChiNhanh] ([IDChiNhanh])
GO
ALTER TABLE [dbo].[Kho] CHECK CONSTRAINT [FK_Kho_ChiNhanh]
GO
ALTER TABLE [dbo].[Luong]  WITH CHECK ADD  CONSTRAINT [FK_Luong_NghiepVu] FOREIGN KEY([IDNghiepVu])
REFERENCES [dbo].[NghiepVu] ([IDNghiepVu])
GO
ALTER TABLE [dbo].[Luong] CHECK CONSTRAINT [FK_Luong_NghiepVu]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_Luong] FOREIGN KEY([IDNhanVien])
REFERENCES [dbo].[Luong] ([IDNhanVien])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_Luong]
GO
ALTER TABLE [dbo].[PhanHoi]  WITH CHECK ADD  CONSTRAINT [FK_PhanHoi_KhachHang] FOREIGN KEY([IDKhachHang])
REFERENCES [dbo].[KhachHang] ([IDKhachHang])
GO
ALTER TABLE [dbo].[PhanHoi] CHECK CONSTRAINT [FK_PhanHoi_KhachHang]
GO
ALTER TABLE [dbo].[PhieuNhapKho]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhapKho_Kho] FOREIGN KEY([IDKho])
REFERENCES [dbo].[Kho] ([IDKho])
GO
ALTER TABLE [dbo].[PhieuNhapKho] CHECK CONSTRAINT [FK_PhieuNhapKho_Kho]
GO
ALTER TABLE [dbo].[PhieuNhapKho]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhapKho_NhanVien] FOREIGN KEY([IDNhanVien])
REFERENCES [dbo].[NhanVien] ([IDNhanVien])
GO
ALTER TABLE [dbo].[PhieuNhapKho] CHECK CONSTRAINT [FK_PhieuNhapKho_NhanVien]
GO
ALTER TABLE [dbo].[PhieuXuatKho]  WITH CHECK ADD  CONSTRAINT [FK_PhieuXuatKho_Kho] FOREIGN KEY([IDKho])
REFERENCES [dbo].[Kho] ([IDKho])
GO
ALTER TABLE [dbo].[PhieuXuatKho] CHECK CONSTRAINT [FK_PhieuXuatKho_Kho]
GO
ALTER TABLE [dbo].[PhieuXuatKho]  WITH CHECK ADD  CONSTRAINT [FK_PhieuXuatKho_NhanVien] FOREIGN KEY([IDNhanVien])
REFERENCES [dbo].[NhanVien] ([IDNhanVien])
GO
ALTER TABLE [dbo].[PhieuXuatKho] CHECK CONSTRAINT [FK_PhieuXuatKho_NhanVien]
GO
ALTER TABLE [dbo].[QuanLy]  WITH CHECK ADD  CONSTRAINT [FK_QuanLy_ChiNhanh] FOREIGN KEY([IDChiNhanh])
REFERENCES [dbo].[ChiNhanh] ([IDChiNhanh])
GO
ALTER TABLE [dbo].[QuanLy] CHECK CONSTRAINT [FK_QuanLy_ChiNhanh]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham] FOREIGN KEY([IDLoaiSanPham])
REFERENCES [dbo].[LoaiSanPham] ([IDLoaiSanPham])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaCungCap] FOREIGN KEY([IDNhaCC])
REFERENCES [dbo].[NhaCungCap] ([IDNhaCungCap])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaCungCap]
GO
USE [master]
GO
ALTER DATABASE [QL_BanHang15] SET  READ_WRITE 
GO
