
-- STEP1
USE [master]
GO
/****** Object:  Database [VanPhongPham]    Script Date: 2020-07-30 11:04:39 AM ******/
-- END STEP1
--STEP 2
CREATE DATABASE [VanPhongPham]
 CONTAINMENT = NONE
--END STEP 2
-- STEP 3 CHAY TAT CA DONG CON LAI
ALTER DATABASE [VanPhongPham] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VanPhongPham].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VanPhongPham] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VanPhongPham] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VanPhongPham] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VanPhongPham] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VanPhongPham] SET ARITHABORT OFF 
GO
ALTER DATABASE [VanPhongPham] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VanPhongPham] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VanPhongPham] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VanPhongPham] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VanPhongPham] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VanPhongPham] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VanPhongPham] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VanPhongPham] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VanPhongPham] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VanPhongPham] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VanPhongPham] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VanPhongPham] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VanPhongPham] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VanPhongPham] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VanPhongPham] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VanPhongPham] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VanPhongPham] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VanPhongPham] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VanPhongPham] SET  MULTI_USER 
GO
ALTER DATABASE [VanPhongPham] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VanPhongPham] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VanPhongPham] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VanPhongPham] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [VanPhongPham] SET DELAYED_DURABILITY = DISABLED 
GO
USE [VanPhongPham]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 2020-07-30 11:04:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaDonHang] [int] NOT NULL,
	[MaSanPham] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChuDe]    Script Date: 2020-07-30 11:04:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuDe](
	[MaChuDe] [int] IDENTITY(1,1) NOT NULL,
	[TenChuDe] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChuDe] PRIMARY KEY CLUSTERED 
(
	[MaChuDe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 2020-07-30 11:04:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[NgayGiao] [datetime] NULL,
	[NgayDat] [datetime] NULL,
	[DaThanhToan] [bit] NULL,
	[TinhTrangGiaoHang] [bit] NULL,
	[MaKH] [int] NULL,
 CONSTRAINT [PK_DonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 2020-07-30 11:04:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[NgaySinh] [datetime] NULL,
	[GioiTinh] [nvarchar](3) NULL,
	[DienThoai] [varchar](50) NULL,
	[TaiKhoan] [varchar](50) NULL,
	[MatKhau] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[DiaChi] [nvarchar](100) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 2020-07-30 11:04:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [int] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](100) NULL,
	[GiaBan] [decimal](18, 0) NULL,
	[MoTa] [nvarchar](max) NULL,
	[NgayCapNhat] [datetime] NULL,
	[AnhBia] [nvarchar](max) NULL,
	[SoLuongTon] [int] NULL,
	[MaChuDe] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 2020-07-30 11:04:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[MaTin] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](max) NULL,
	[TinTuc] [nvarchar](max) NULL,
	[HinhAnh] [nvarchar](max) NULL,
 CONSTRAINT [PK_TinTuc] PRIMARY KEY CLUSTERED 
(
	[MaTin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (1, 71, 1, CAST(4000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (1, 101, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (1, 105, 1, CAST(15500 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (2, 86, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (3, 87, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (4, 86, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (4, 87, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (5, 86, 2, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (6, 86, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (7, 86, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (8, 86, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (9, 86, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (10, 86, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (11, 86, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (12, 86, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (13, 86, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (14, 86, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (14, 87, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (15, 86, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (15, 87, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (16, 86, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (16, 87, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (17, 86, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (17, 87, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (18, 86, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (18, 87, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (19, 86, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (19, 87, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (20, 86, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (20, 87, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (21, 86, 1, CAST(12000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSanPham], [SoLuong], [DonGia]) VALUES (21, 87, 1, CAST(12000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[ChuDe] ON 

INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (1, N'Giấy in- Giấy A4')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (2, N'Bìa hồ sơ - Kệ')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (3, N'Sổ - Tập')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (4, N'Bút - Mực')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (5, N'Dụng cụ văn phòng')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (6, N'Băng keo - Dao - Kéo')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (7, N'Bảng văn phòng')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (8, N'Máy tính CASIO')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (9, N'Thiết bị văn phòng')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (10, N'Mực in')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (11, N'Bảo hộ lao động')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (12, N'Điện gia dụng')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (13, N'Thiết bị điện tử')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (14, N'Đồ dùng học sinh')
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe]) VALUES (15, N'Sản phẩm khác')
SET IDENTITY_INSERT [dbo].[ChuDe] OFF
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (1, CAST(N'2020-07-13 00:00:00.000' AS DateTime), CAST(N'2020-07-10 17:34:27.433' AS DateTime), 0, 0, 0)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (2, CAST(N'2020-07-27 00:00:00.000' AS DateTime), CAST(N'2020-07-27 18:36:42.153' AS DateTime), 0, 0, 3)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (3, CAST(N'2020-07-30 00:00:00.000' AS DateTime), CAST(N'2020-07-27 20:45:49.927' AS DateTime), 0, 0, 0)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (4, NULL, CAST(N'2020-07-30 10:03:32.117' AS DateTime), 0, 0, 3)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (5, NULL, CAST(N'2020-07-30 10:06:05.777' AS DateTime), 0, 0, 3)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (6, NULL, CAST(N'2020-07-30 10:17:26.537' AS DateTime), 0, 0, 3)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (7, NULL, CAST(N'2020-07-30 10:17:44.997' AS DateTime), 0, 0, 3)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (8, NULL, CAST(N'2020-07-30 10:27:47.340' AS DateTime), 0, 0, 3)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (9, NULL, CAST(N'2020-07-30 10:28:06.843' AS DateTime), 0, 0, 3)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (10, NULL, CAST(N'2020-07-30 10:33:31.857' AS DateTime), 0, 0, 3)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (11, NULL, CAST(N'2020-07-30 10:33:50.847' AS DateTime), 0, 0, 3)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (12, NULL, CAST(N'2020-07-30 10:35:55.570' AS DateTime), 0, 0, 3)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (13, NULL, CAST(N'2020-07-30 10:36:11.027' AS DateTime), 0, 0, 3)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (14, NULL, CAST(N'2020-07-30 10:40:43.223' AS DateTime), 0, 0, 0)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (15, NULL, CAST(N'2020-07-30 10:46:13.097' AS DateTime), 0, 0, 0)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (16, NULL, CAST(N'2020-07-30 10:46:37.257' AS DateTime), 0, 0, 0)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (17, NULL, CAST(N'2020-07-30 10:48:11.333' AS DateTime), 0, 0, 0)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (18, NULL, CAST(N'2020-07-30 10:51:17.020' AS DateTime), 0, 0, 0)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (19, NULL, CAST(N'2020-07-30 10:51:47.690' AS DateTime), 0, 0, 0)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (20, NULL, CAST(N'2020-07-30 10:59:00.900' AS DateTime), 0, 0, 0)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayGiao], [NgayDat], [DaThanhToan], [TinhTrangGiaoHang], [MaKH]) VALUES (21, NULL, CAST(N'2020-07-30 10:59:31.867' AS DateTime), 0, 0, 0)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [TaiKhoan], [MatKhau], [Email], [DiaChi]) VALUES (0, N'Lê Ngọc Hưng', CAST(N'1999-02-05 00:00:00.000' AS DateTime), NULL, N'0387650799', N'hungleqt123', N'0123456789', N'birthday12x@gmail.com', N'Sơn Kỳ - Tân Phú')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [TaiKhoan], [MatKhau], [Email], [DiaChi]) VALUES (1, N'Đào Tuấn Hùng', CAST(N'1999-02-09 00:00:00.000' AS DateTime), NULL, N'038465111', N'hungdao', N'0123456789', N'hungdao@gmail.com', N'TP.HCM')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [TaiKhoan], [MatKhau], [Email], [DiaChi]) VALUES (2, N'Nguyễn Trọng Tuấn', CAST(N'1999-01-01 00:00:00.000' AS DateTime), NULL, N'01455545', N'tuannguyen99', N'0123456789', N'tuantrong@gmail.com', N'TP.HCM')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [TaiKhoan], [MatKhau], [Email], [DiaChi]) VALUES (3, N'Phan Khắc Tùng', CAST(N'1999-01-01 00:00:00.000' AS DateTime), NULL, N'04894455', N'tungphan99', N'0123456789', N'tungphan99@gmail.com', N'TP.HCM')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [TaiKhoan], [MatKhau], [Email], [DiaChi]) VALUES (4, N'Huỳnh Kỳ Hùng', CAST(N'1999-01-01 00:00:00.000' AS DateTime), NULL, N'014564655', N'kyhung99', N'0123456789', N'kyhung99@gmail.com', N'TP.HCM')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [TaiKhoan], [MatKhau], [Email], [DiaChi]) VALUES (5, N'Huỳnh Kỳ Hùng', CAST(N'1999-01-01 00:00:00.000' AS DateTime), NULL, N'014564655', N'kyhung99', N'0123456789', N'kyhung99@gmail.com', N'TP.HCM')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [TaiKhoan], [MatKhau], [Email], [DiaChi]) VALUES (6, N'Phan Thị A', CAST(N'1999-05-20 00:00:00.000' AS DateTime), NULL, N'01456656', N'phana99', N'0123456789', N'phana@gmail.com', N'TP.HCM')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [TaiKhoan], [MatKhau], [Email], [DiaChi]) VALUES (7, N'Phan Thị A', CAST(N'1999-05-20 00:00:00.000' AS DateTime), NULL, N'01456656', N'phana99', N'0123456789', N'phana@gmail.com', N'TP.HCM')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [TaiKhoan], [MatKhau], [Email], [DiaChi]) VALUES (8, N'Huỳnh Kỳ Hùng', CAST(N'2020-07-24 00:00:00.000' AS DateTime), NULL, N'0123455899', N'admin', N'password', N'aa@gmail.com', N'THCM')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [TaiKhoan], [MatKhau], [Email], [DiaChi]) VALUES (9, N'Nguyễn Thị Chanh', CAST(N'1999-02-17 00:00:00.000' AS DateTime), NULL, N'0387554555', N'chanhtran99', N'0123456789', N'chanhnguyen99@gmail.com', N'TP.HCM')
INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [NgaySinh], [GioiTinh], [DienThoai], [TaiKhoan], [MatKhau], [Email], [DiaChi]) VALUES (10, N'Trần Văn Bình', CAST(N'1999-02-10 00:00:00.000' AS DateTime), NULL, N'0584788800', N'binhtran99', N'0123456789', N'binhtran99@gmail.com', N'TP.HCM')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (1, N'Giấy phân trang mũi tên 5 màu Pronoti', CAST(16000 AS Decimal(18, 0)), N'Công dụng: Miếng phân trang hình mũi tên Post-it giúp bạn phân loại và quản lý hồ sơ hiệu quả, đánh dấu trang sách, từ điển.
Đặc Điểm: Miếng phân trang có các đặc điểm nổi trội như: không thấm nước, không rách
Đơn Vị Tính: 1 vỉ gồm 5 tép nhỏ với 5 màu dạ quang
Quy Cách: 1 tép nhỏ có 20 miếng phân trang
Màu Sắc: 5 màu dạ quang
Bảo Quản: Nhiệt độ: 10 ~ 55º C. Độ ẩm: 55 ~ 95% RH. Tránh xa nguồn nhiệt, dầu mỡ.
', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh1.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (2, N'Giấy in bill tính tiền 8F', CAST(14000 AS Decimal(18, 0)), N'Công dụng: in hóa đơn bán hàng, in bill máy quẹt thẻ POS, bill máy in di động
Đặc Điểm: là giấy cảm nhiệt không cần mực in
Đơn Vị Tính: cuộn
Quy Cách: 100 cuộn (01 thùng)
Màu Sắc: trắng
Bảo Quản: Nhiệt độ: 10 ~ 55º C. Độ ẩm: 55 ~ 95% RH. Tránh xa nguồn nhiệt, dầu mỡ.
', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh2.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (3, N'Decal A4 da bò', CAST(128000 AS Decimal(18, 0)), N'Công dụng: tạo tem in giá , ghi chú, hay bìa nhãn bưu phẩm
Đặc Điểm: : A4 (210cm x 297cm), màu nâu sần carton
Đơn Vị Tính: Xấp (100 tờ)
Quy Cách: Xấp (100 tờ)
Màu Sắc: màu nâu sần carton
Bảo Quản: Nhiệt độ: 10 ~ 55º C. Độ ẩm: 55 ~ 95% RH. Tránh xa nguồn nhiệt, dầu mỡ.
', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh3.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (4, N'Bìa thái A4 Sunflower cao cấp', CAST(45000 AS Decimal(18, 0)), N'"Công dụng Dùng đóng sách, làm thủ công trang trí...
Có thể in, bề mặt giấy trơn, mịn chống kẹt giấy khi in, photo. "
Đặc Điểm : Sản phẩm có tính ứng dụng cao
Sử dụng bìa thái A4 định lượng 180gsm để làm tăng tính chuyên nghiệp và tạo sức hút cho bộ tài liệu, báo cáo của bạn. Ngoài ra, bạn còn có thể sử dụng loại giấy này để làm thiệp, cắt dán hộp quà, trang trí... Sản phẩm sẽ hỗ trợ bạn tối đa trong học tập, làm việc và sáng tạo.
Đơn Vị Tính : Xấp
Quy Cách : Khổ A4. 100 tờ/xấp
Màu Sắc : Vàng, Hồng, Xanh Lá, Xanh Dương,Trắng
Bảo Quản: Nhiệt độ: 10 ~ 55º C. Độ ẩm: 55 ~ 95% RH. Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh4.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (5, N'Giấy in vi tính Liên Sơn 5 liên A5', CAST(565000 AS Decimal(18, 0)), N'
Giấy vi tính Liên Sơn 2 - 5 liên (210 x 279) A4
Công Dụng : Giấy 2 liên đến 5 liên Impression là loại giấy màu Carbonless, liên tục đục lỗ chuyên dùng cho máy in vi tính.
Đặc Điểm :Là sản phẩm được sản xuất từ nguyên liệu giấy ngoại nhập từ Indonesia, được gia công và đóng thùng tại công ty giấy vi tính Liên Sơn bằng thiết bị hiện đại nhất của Châu Âu
* Đạt tiêu chuẩn quốc tế : Bề mặt giấy láng đều, không có bụi giấy, không bị kẹt giấy, ít hao mực, khả năng lưu trữ thông tin lâu phai, giúp tăng tuổi thọ cho thiết bị máy in và số lượng luôn đủ tờ.
Đơn Vị Tính : Thùng
Quy Cách : A4 (210x279) - 1500 tờ
Màu Sắc : trắng, hồng, xanh dương, xanh lá, vàng
Bảo Quản: Nhiệt độ: 10 ~ 55º C. Độ ẩm: 55 ~ 95% RH. Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh5.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (6, N'Giấy Ebank chia 2 (thùng)', CAST(378000 AS Decimal(18, 0)), N'Giấy A4 có đường chia ở giữa

Đơn vị tính: thùng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh6.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (7, N'Giấy A3 Excel 120 Gsm', CAST(310000 AS Decimal(18, 0)), N'Giấy A3 Excel 120 Gsm: Loại giấy in trắng, đẹp, mịn

                        thích hợp với tất cả các loại Máy in phun, Máy in Laser,

                        Máy Fax laser, Máy Photocopy. In đảo 2 mặt không lo kẹt giấy.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh7.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (8, N'Giấy A4 Excel 100 Gsm', CAST(135000 AS Decimal(18, 0)), N'Giấy A4 Excel 100 Gsm: Loại giấy in trắng, đẹp, mịn

                        thích hợp với tất cả các loại Máy in phun, Máy in Laser,

                        Máy Fax laser, Máy Photocopy. In đảo 2 mặt không lo kẹt giấy.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh10.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (9, N'Giấy cuộn A0 định lượng 80g/100g/120g', CAST(325000 AS Decimal(18, 0)), N'Đặc điểm: Có 2 loại: Lõi lớn (đường kính lõi 7.5cm) và lõi nhỏ (đường kính lõi 5.5cm)

Trọng lượng: 7.2kg', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh11.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (10, N'Giấy cuộn A1 định lượng 80g/100g/120g', CAST(285000 AS Decimal(18, 0)), N'Đặc điểm: Có 2 loại: Lõi lớn (đường kính lõi 7.5cm) và lõi nhỏ (đường kính lõi 5.5cm)

Trọng lượng: 5.3kg', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh12.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (11, N'Giấy cuộn A2 định lượng 80g/100g', CAST(218000 AS Decimal(18, 0)), N'Đặc điểm: Có 2 loại: Lõi lớn (đường kính lõi 7.5cm) và lõi nhỏ (đường kính lõi 5.5cm)

Trọng lượng: 3.8kg', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh13.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (12, N'Giấy cuộn A3 định lượng 80g/100g/120g', CAST(195000 AS Decimal(18, 0)), N'Lõi 5.5F, 7.5F

Trọng lượng: 2.7kg

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh14.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (13, N'Giấy A3 Paper One 70 Gsm', CAST(142000 AS Decimal(18, 0)), N'Giấy A3 Paper One 70 Gsm: Loại giấy in cao cấp, trắng, đẹp,

                        thích hợp với tất cả các loại Máy in phun, Máy in Laser,

                        Máy Fax laser, Máy Photocopy. In đảo 2 mặt không lo kẹt giấy.

                        Giấy được đóng gói và nhập khẩu từ Indo', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh15.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (14, N'Giấy A4 Paper One 80 Gsm', CAST(82000 AS Decimal(18, 0)), N'Giấy A4 Paper One 80 Gsm: Loại giấy in cao cấp, trắng, đẹp,

                        thích hợp với tất cả các loại Máy in phun, Máy in Laser,

                        Máy Fax laser, Máy Photocopy. In đảo 2 mặt không lo kẹt giấy.

                        Giấy được đóng gói và nhập khẩu từ Indo', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh16.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (15, N'Giấy A4 IK Plus 80 Gsm', CAST(84000 AS Decimal(18, 0)), N'Giấy A4 IK Plus 80 Gsm: Loại giấy in trắng, đẹp, mịn

                        thích hợp với tất cả các loại Máy in phun, Máy in Laser,

                        Máy Fax laser, Máy Photocopy. In đảo 2 mặt không lo kẹt giấy.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh17.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (16, N'Giấy A5 Idea 70 Gsm', CAST(39000 AS Decimal(18, 0)), N'Giấy A5 Idea 70 Gsm: Loại giấy in trắng, đẹp, mịn

                        thích hợp với tất cả các loại Máy in phun, Máy in Laser,

                        Máy Fax laser, Máy Photocopy. In đảo 2 mặt không lo kẹt giấy.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh18.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (17, N'Bìa Mỹ A3 - Xanh Dương', CAST(275000 AS Decimal(18, 0)), N'Bìa Mỹ A3 - Xanh Dương', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh19.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (18, N'Giấy bìa A0 Roky', CAST(15000 AS Decimal(18, 0)), N'Đặc điểm: dày, một mặt trắng, một mặt xám, học sinh thường dùng làm báo tường

Bảo quản: Sạch sẽ, khô ráo

Giấy bìa A0 Roky - Cần là có', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh20.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (19, N'Bìa thơm A4 mỏng - hồng', CAST(85000 AS Decimal(18, 0)), N'Công dụng: Bìa giấy thơm A4 cao cấp có hoa văn dùng để đóng sách, hồ sơ tài liệu thật gọn đẹp với hương thơm nhẹ dịu cùng hiều màu khác nhau cho bạn lựa chọn phù hợp
Đặc Điểm:Đẹp, trắng, mịn, láng
Đơn Vị Tính: 100 tờ/ xấp
Quy Cách: 10 xấp/ lốc
Màu Sắc: xanh dương, xanh lá, hồng, vàng
Bảo Quản: Nhiệt độ: 10 ~ 55º C. Độ ẩm: 55 ~ 95% RH. Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh21.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (20, N'Bìa thơm A4 mỏng - vàng', CAST(85000 AS Decimal(18, 0)), N'
Công dụng: Bìa giấy thơm A4 cao cấp có hoa văn dùng để đóng sách, hồ sơ tài liệu thật gọn đẹp với hương thơm nhẹ dịu cùng hiều màu khác nhau cho bạn lựa chọn phù hợp
Đặc Điểm:Đẹp, trắng, mịn, láng
Đơn Vị Tính: 100 tờ/ xấp
Quy Cách: 10 xấp/ lốc
Màu Sắc: xanh dương, xanh lá, hồng, vàng
Bảo Quản: Nhiệt độ: 10 ~ 55º C. Độ ẩm: 55 ~ 95% RH. Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh22.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (21, N'Giấy Fort 80g màu hồng A5', CAST(48000 AS Decimal(18, 0)), N'Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh25.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (22, N'Giấy Fort 80g màu vàng A5', CAST(48000 AS Decimal(18, 0)), N'Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh26.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (23, N'Giấy Fort 80g màu xanh dương A5', CAST(48000 AS Decimal(18, 0)), N'Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh27.jpg', 50, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (24, N'Bìa lá A4 màu vàng', CAST(4000 AS Decimal(18, 0)), N'Công dụng: Luôn giữ hồ sơ , chứng từ phẳng phiu , sạch sẽ và tạo cảm giác thoải mái khi sử dụng .
Đặc Điểm: - Nhựa PP không độc hại, thân thiện với môi trường.

- Kích thước A4 thuận tiện.

- Độ bền đường hàn cao, chắc chắn .

- Bề mặt có độ bóng cao.

- Sản phẩm có độ trong.
Đơn Vị Tính: cái
Quy Cách: 1 xấp 100 cái
Màu Sắc: nhiều màu
Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh32.jpg', 50, 2)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (25, N'Bìa Accor Thiên Long có lỗ', CAST(9000 AS Decimal(18, 0)), N'Công dụng Kích thước nhỏ gọn, nhẹ
Tiện lợi lưu trữ và bảo quản hồ sơ
Đặc Điểm Được làm bằng nhựa PP đặc biệt chịu lực cao
01 bìa có thể chứa được 50 tờ A4
Sản phẩm trong suốt giúp quan sát nội dung bên trong dễ dàng
Túi pocket bên phải giúp giữ hồ sơ được phẳng phiu, sạch sẽ, tạo cảm giác thoải mái khi sử dụng
White tape dễ dàng tháo lắp và có thể viết ghi chú
Có thanh khóa Fastener bằng kẽm mạ Niken và thanh Compressor có độ bền cao giúp kẹp chặt tài liệu bên trong, tăng tuổi thọ sử dụng
Gáy của sản phẩm có 11 lỗ, thuận tiện lưu trữ trong các loại bìa còng, bìa nhẫn
Đơn Vị Tính Cái', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh33.jpg', 50, 2)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (26, N'Kệ viết xoay TTM 3006
', CAST(43000 AS Decimal(18, 0)), N'Công dụng : Sản phẩm làm từ Mica, thân thiện với môi trường, an toàn khi sử dụng.
Có nhiều ngăn để đựng bút viết .
Thiết kế trong suốt hiện đại, đơn giản nhưng tinh tế với kiểu dáng nhỏ gọn tiện dụng.
Đặc Điểm :Khay cắm bút đa năng thiết kế hiện đại với đế xoay rất tiện lợi, có những ngăn nhỏ để chứa những vật dụng như ghim bấm, kẹp giấy, .... Khay làm bằng chất liệu mica bền, đẹp, khó vỡ. . Khay bút tiện lợi cho các đối tượng như sinh viên, nhân viên văn phòng
Đơn Vị Tính : Cái', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh34.jpg', 50, 2)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (27, N'Bìa Accor giấy Plus có kẹp - xám', CAST(14500 AS Decimal(18, 0)), N'Công dụng : Bìa acco giấy A4 Plus có kẹp là mẫu bìa chất lượng Nhật Bản, tiện lợi và có tính thẩm mỹ cao. Ưu điểm của bìa acco giấy Plus là nhẹ bền, an toàn, màu sắc tinh tế là lựa chọn tốt nhất cho nhu cầu bảo quản, lưu trữ hồ sơ, tài liệu. Bìa cho khả năng lưu trữ lên đến 180 tờ giấy A4.
Đặc Điểm :
Bìa acco giấy A4 Plus có kẹp giúp giữ cho hồ sơ, chứng từ, tài liệu của bạn luôn ở trong trạng thái phẳng phiu, tránh bụi bẩn và thất lạc. Bìa có thể lưu trữ tối đa 180 tờ A4 tiện lợi cho nhu cầu bảo quản, sắp xếp tài liệu tại công ty và các đơn vị hành chính. Có thể đặt trong bìa còng, bìa còng cua cho mục đích lưu trữ chung.
Bìa acco giấy A4 Plus có kẹp làm từ giấy mỏng đặc biệt chịu lực tốt, có tính bền dai. Thiết kế thanh chặn giấy dạng trượt dễ sử dụng và giúp giữ chắc chắn tài liệu bên trong. Sản phẩm được sản xuất đáp ứng các chỉ tiêu an toàn đối với sức khỏe, không mùi lạ, không độc hại
', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh35.jpg', 50, 2)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (28, N'Bìa treo giấy bóng MT - hộp 25 cái', CAST(315000 AS Decimal(18, 0)), N'Công dụng : Bìa treo giấy MT có công dụng lưu trữ hồ sơ dạng treo
Đặc Điểm
Đơn Vị Tính : Hộp 25 cái (1 màu)
Quy Cách : 24x36,5cm
Màu Sắc : Xanh Dương, Xanh Lá , Đỏ , Vàng 
Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh36.jpg', 50, 2)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (29, N'Bảng kính ghép keo sữa 10ly38 0,8x1,2m
', CAST(2735000 AS Decimal(18, 0)), N'Bảng kính cường lực gồm 2 lớp kính cường lực được ghép với nhau bởi lớp keo sữa.

Mặt bảng viết không lem mực, dễ dàng lau sạch, không bị hư hỏng khi sử dụng chất tẩy rửa.

Các góc cạnh của bảng được mài cẩn thận tăng tính thẩm mỹ và độ an toàn cho người sử dụng.

Bảng kính cường lực được gắn lên tường bằng bù lon inox hoặc bắt inox chắc chắn.

Bảng kính cường lực được thiết kế tinh tế và sang trọng phù hợp với mọi không gian.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh37.jpg', 50, 2)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (30, N'Bảng kính 8 ly không ghép 1,2x0,8m
', CAST(2185000 AS Decimal(18, 0)), N'Bảng kính gồm tấm kính 8ly phía sau được tráng lớp keo sữa.

Mặt bảng viết không lem mực, dễ dàng lau sạch, không bị hư hỏng khi sử dụng chất tẩy rửa.

Các góc cạnh của bảng được mài cẩn thận tăng tính thẩm mỹ và độ an toàn cho người sử dụng.

Bảng kính cường lực được gắn lên tường bằng bù lon inox hoặc bắt pas chắc chắn.

Bảng kính được thiết kế tinh tế và sang trọng phù hợp với mọi không gian.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh38.jpg', 50, 2)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (31, N'Bảng Flipchart từ tính, chân inox 120x100', CAST(3585000 AS Decimal(18, 0)), N'Kích thước: cao x ngang

Công Nghệ của Đức. Mặt bảng nhập khẩu từ Korea, bảng viết bút lông màu trắng.

Đặc biệt dễ xóa & không để lại dấu, có ô ly chìm 5cm của Công ty Union – Hàn Quốc, viền khung nhôm hộp.

Chân giá đỡ bằng Inox sáng bóng, có gắn thanh kẹp giấy. Đặc biệt có thể đính hình ảnh hoặc văn bản bằng nam châm, điều chỉnh độ cao, độ nghiêng và xếp gọn khi không sử dụng hoặc di chuyển.

Sản phẩm tinh tế sang trọng phù hợp với mọi không gian.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh39.jpg', 50, 2)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (32, N'Bảng Flipchart từ tính, chân inox 120x140', CAST(3970000 AS Decimal(18, 0)), N'Kích thước: cao x ngang

Công Nghệ của Đức. Mặt bảng nhập khẩu từ Korea, bảng viết bút lông màu trắng.

Đặc biệt dễ xóa & không để lại dấu, có ô ly chìm 5cm của Công ty Union – Hàn Quốc, viền khung nhôm hộp.

Chân giá đỡ bằng Inox sáng bóng, có gắn thanh kẹp giấy. Đặc biệt có thể đính hình ảnh hoặc văn bản bằng nam châm, điều chỉnh độ cao, độ nghiêng và xếp gọn khi không sử dụng hoặc di chuyển.

Sản phẩm tinh tế sang trọng phù hợp với mọi không gian.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh40.jpg', 50, 2)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (33, N'Bìa cây gáy nhỏ', CAST(5000 AS Decimal(18, 0)), N'Công dụng Bìa cây này rất thông dụng cho các loại giấy tờ khổ A4, tiện lợi cho công việc văn phòng.
Đặc Điểm Bìa cây trong gáy nhỏ làm từ chất liệu nhựa PP nhẹ bền, chịu va đập tốt. Thiết kế gáy bìa nhỏ, nhiều màu chắc chắn và dễ sử dụng. Mặt bìa trong đẹp, có khả năng chống lóa rất lý tưởng cho việc quan sát bên trong.
Đơn Vị Tính : Cái
Quy Cách 10 Cái/ Xấp', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh41.jpg', 50, 2)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (34, N'Kệ viết không xoay TTM 3008', CAST(39000 AS Decimal(18, 0)), N'Công dụng : Sản phẩm làm từ Mica, thân thiện với môi trường, an toàn khi sử dụng.
Có nhiều ngăn để đựng bút viết .
Thiết kế trong suốt hiện đại, đơn giản nhưng tinh tế với kiểu dáng nhỏ gọn tiện dụng.
Đặc Điểm :Khay cắm bút đa năng thiết kế hiện đại với đế xoay rất tiện lợi, có những ngăn nhỏ để chứa những vật dụng như ghim bấm, kẹp giấy, .... Khay làm bằng chất liệu mica bền, đẹp, khó vỡ. . Khay bút tiện lợi cho các đối tượng như sinh viên, nhân viên văn phòng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh42.jpg', 50, 2)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (35, N'Hộp cắm bút No.170
', CAST(49000 AS Decimal(18, 0)), N'Công dụng Sản phẩm có 07 ngăn chứa lớn giúp thuận tiện trong việc lưu giữ : bút viết, gôm, kim bấm, dao, kéo, thước, chuốt chì, bấm kim, gỡ kim,...
Đặc Điểm Là một sản phẩm file hồ sơ từ nhãn hiệu Xukiva, sản xuất tại Việt Nam.
Sản phẩm được làm bằng nhựa trong suốt kích cỡ 10.8 x 10.6 x 9.2 cm. Mẫu mã nhỏ gọn, tiết kiệm diện tích để trên bàn.
Gồm 7 ngăn, xếp theo dạng bậc thang', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh43.jpg', 50, 2)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (36, N'Hộp cắm bút No.176 xoay
', CAST(53000 AS Decimal(18, 0)), N'Công dụng Sản phẩm có 13 ngăn chứa lớn giúp thuận tiện trong việc lưu giữ : bút viết, gôm, kim bấm, dao, kéo, thước, chuốt chì, bấm kim, gỡ kim,...
Đặc Điểm dạng xoay, số ngăn: 13, chất liệu: Nhựa, kích thước: 18 x 13.5 x 11.2 cm,', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh44.jpg', 50, 2)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (37, N'Hộp cắm bút No.179 xoay nhỏ', CAST(46000 AS Decimal(18, 0)), N'Công dụng Sản phẩm có 5 ngăn chứa lớn giúp thuận tiện trong việc lưu giữ : bút viết, gôm, kim bấm, dao, kéo, thước, chuốt chì, bấm kim, gỡ kim,...
Đặc Điểm dạng xoay, số ngăn: 05, chất liệu: Nhựa, kích thước: 12 x 12 x 10.5 cm', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh45.jpg', 50, 2)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (38, N'Hộp cắm bút No.199 xoay lớn', CAST(66000 AS Decimal(18, 0)), N'Công dụng Sản phẩm có 7 ngăn chứa lớn giúp thuận tiện trong việc lưu giữ : bút viết, gôm, kim bấm, dao, kéo, thước, chuốt chì, bấm kim, gỡ kim,...', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh50.jpg', 50, 2)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (39, N'Sổ Namecard 160 lá', CAST(59000 AS Decimal(18, 0)), N'Công dụng Lưu giữ những giá trị
Đặc Điểm : Lớp da bền đẹp bảo vệ namecard tránh được các tác động xấu từ bên ngoài
Đơn Vị Tính : Cuốn', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh51.jpg', 50, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (40, N'Sổ Namecard 120 lá', CAST(45000 AS Decimal(18, 0)), N'Công dụng : Lưu giữ những giá trị
Đặc Điểm : Lớp da bền đẹp bảo vệ namecard tránh được các tác động xấu từ bên ngoài
Đơn Vị Tính : Cuốn', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh52.jpg', 50, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (41, N'Sổ Namecard 500 lá', CAST(118000 AS Decimal(18, 0)), N'Công dụng Lưu giữ những giá trị
Đặc Điểm : Lớp da bền đẹp bảo vệ namecard tránh được các tác động xấu từ bên ngoài
Đơn Vị Tính : Cuốn', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh53.jpg', 50, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (42, N'Hộp đựng NameCard SureMark SQ-9400 (10,5 x 16,5 x 6,5cm)', CAST(152000 AS Decimal(18, 0)), N'Công dụng Sản phẩm có thiết kế hiện đại, là vật dụng thiết yếu giúp bảo quản namecard, phù hợp sử dụng trong văn phòng, công ty, lưu trữ cá nhân,…

– Hộp chứa được 400 namecard.

– Ngoài ra, sản phẩm còn có công dụng phân namecard theo vần Alphabet
Đặc Điểm Nắp hộp được làm từ chất liệu mica (Acrylic) là một loại vật liệu dẻo dai, bền bỉ với thời gian giúp sản phẩm có tuổi thọ cao, sử dụng được lâu dài, tiết kiệm chi phí. Đặc biệt mica có độ bóng cao, dễ dàng nhìn thấy namecard bên trong..', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh54.jpg', 50, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (43, N'Hộp đựng NameCard SureMark SQ-9600 (10,5 x 21 x 6,5cm)', CAST(175000 AS Decimal(18, 0)), N'Công dụng Sản phẩm có thiết kế hiện đại, là vật dụng thiết yếu giúp bảo quản namecard, phù hợp sử dụng trong văn phòng, công ty, lưu trữ cá nhân,…

– Hộp chứa được 600 namecard.

– Ngoài ra, sản phẩm còn có công dụng phân namecard theo vần Alphabet
Đặc Điểm Nắp hộp được làm từ chất liệu mica (Acrylic) là một loại vật liệu dẻo dai, bền bỉ với thời gian giúp sản phẩm có tuổi thọ cao, sử dụng được lâu dài, tiết kiệm chi phí. Đặc biệt mica có độ bóng cao, dễ dàng nhìn thấy namecard bên trong..', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh55.jpg', 50, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (44, N'Hộp đựng NameCard SureMark SQ-9800 (10,5 x 26,5 x 6,5cm)', CAST(195000 AS Decimal(18, 0)), N'Công dụng Sản phẩm có thiết kế hiện đại, là vật dụng thiết yếu giúp bảo quản namecard, phù hợp sử dụng trong văn phòng, công ty, lưu trữ cá nhân,…

– Hộp chứa được 800 namecard.

– Ngoài ra, sản phẩm còn có công dụng phân namecard theo vần Alphabet
Đặc Điểm Nắp hộp được làm từ chất liệu mica (Acrylic) là một loại vật liệu dẻo dai, bền bỉ với thời gian giúp sản phẩm có tuổi thọ cao, sử dụng được lâu dài, tiết kiệm chi phí. Đặc biệt mica có độ bóng cao, dễ dàng nhìn thấy namecard bên trong..', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh56.jpg', 50, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (45, N'Bao thư trắng 12x22 100g (100 cái)', CAST(34000 AS Decimal(18, 0)), N'Công dụng thuận tiện cho việc lưu trữ, ký gởi các chứng từ như hóa đơn VAT, giấy tờ khổ nhỏ trong văn phòng
Đặc Điểm
- Được thiết kế với khổ giấy 12x22cm (80gsm)
Đơn Vị Tính Xấp
Quy Cách : 100 Cái / Xấp . 50 Xấp/Thùng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh57.jpg', 50, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (46, N'Sổ quỹ tiền mặt', CAST(22500 AS Decimal(18, 0)), N'Công dụng được dùng cho thủ quỹ hoặc dùng cho kế toán tiền mặt để phản ánh tình hình thu, chi tồn quỹ tiền mặt bằng tiền Việt Nam của đơn vị.
Đặc Điểm Mẫu sổ quỹ tiền mặt mới nhất được ban hành kèm theo Thông tư 200/2014/TT-BTC sẽ cập nhật những thông tin mới nhất trong chế độ kế toán doanh nghiệp.
Đơn Vị Tính : Cuốn', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh58.jpg', 50, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (47, N'Hộp đựng NameCard Xukiva 181', CAST(34000 AS Decimal(18, 0)), N'Hộp đựng NameCard Xukiva 181 chứa được khoảng 30 tờ name card

Đẹp, sang trọng

Chất Liệu: Nhựa PS

Kích thước: 10.8 x 4.6 x 5.5 cm', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh59.jpg', 50, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (48, N'Sổ Namecard 320 lá', CAST(72000 AS Decimal(18, 0)), N'Công dụng Lưu giữ những giá trị
Đặc Điểm : Lớp da bền đẹp bảo vệ namecard tránh được các tác động xấu từ bên ngoài
Đơn Vị Tính : Cuốn', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh60.jpg', 50, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (49, N'Sổ Namecard 240 lá', CAST(75000 AS Decimal(18, 0)), N'
Công dụng Lưu giữ những giá trị
Đặc Điểm : Lớp da bền đẹp bảo vệ namecard tránh được các tác động xấu từ bên ngoài
Đơn Vị Tính : Cuốn', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh61.jpg', 50, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (50, N'Tập 96 trang ABC Hòa Bình (5 ô ly)', CAST(8500 AS Decimal(18, 0)), N'Văn phòng phẩm FAST chuyên cung cấp Tập 96 trang Conan', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh62.jpg', 50, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (51, N'Sổ ca sỹ 10x15', CAST(5500 AS Decimal(18, 0)), N'Văn phòng phẩm FAST chuyên cung cấp Sổ ca sỹ 10x15', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh63.jpg', 50, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (52, N'Sổ ca sỹ 7x10', CAST(4000 AS Decimal(18, 0)), N'Văn phòng phẩm FAST chuyên cung cấp Sổ ca sỹ 7x10', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh64.jpg', 50, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (53, N'Sổ còng - bìa da', CAST(195000 AS Decimal(18, 0)), N'Văn phòng phẩm FAST chuyên cung cấp Sổ còng đẹp', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh65.jpg', 50, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (54, N'Ruột xóa giấy Plus', CAST(18000 AS Decimal(18, 0)), N'Công dụng : Thay ruột khi dùng hết.
Đặc Điểm Xóa kéo Plus Whiper V Correction tape WH-105, 5mmx10m, Ruột xóa dài 10, rộng 5mm.
Đơn Vị Tính : Cái
Quy Cách 10 Cái/ Hộp', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh66.jpg', 50, 4)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (55, N'Bút gel LINC xanh', CAST(10000 AS Decimal(18, 0)), N'Bút gel LINC xanh', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh67.jpg', 50, 4)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (56, N'Bút gel LINC đỏ', CAST(10000 AS Decimal(18, 0)), N'Bút gel LINC đỏ', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh68.jpg', 50, 4)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (57, N'Bút gel LINC đen', CAST(10000 AS Decimal(18, 0)), N'Bút gel LINC đen', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh69.jpg', 50, 4)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (58, N'Bút lông dầu ZEBRA đen', CAST(4000 AS Decimal(18, 0)), N'Bút lông dầu ZEBRA đen', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh70.jpg', 50, 4)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (59, N'Bút lông dầu ZEBRA đỏ', CAST(4000 AS Decimal(18, 0)), N'Bút lông dầu ZEBRA đỏ', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh71.jpg', 50, 4)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (60, N'Bút lông dầu ZEBRA xanh', CAST(4000 AS Decimal(18, 0)), N'Bút lông dầu ZEBRA xanh', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh72.jpg', 50, 4)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (61, N'Xóa kéo WONDER', CAST(25000 AS Decimal(18, 0)), N'Văn phòng phẩm FAST chuyên cung cấp Xóa kéo WONDER', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh73.jpg', 50, 4)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (62, N'Bút dạ quang Staedtler - Tím', CAST(22000 AS Decimal(18, 0)), N'Công dụng : Công dụng của bút dạ quang hay gọi là bút nhớ dòng được ứng dụng nhiều và phải nói là thường xuyên hằng ngày trong cuộc sống của chúng ta như, học sinh sinh viên dùng trong học tập, nhân viên văn phòng dùng để ghi chú đánh dấu các loại giấy tờ quan trọng
Đặc Điểm : Bút dạ quang Staedler là loại bút dùng để đánh dấu, nhớ dòng dùng cho mọi loại giấy. Màu mực tươi sáng làm nổi bật các dòng cần điểm cần lưu ý. Mực viết được sản xuất Đức từ chất màu hoà với nước vì vậy không gây mùi khó chịu và không độc hại. Bút có nhiều màu sắc lựa chọn giúp cho bạn thể hiện dòng thông tin của mình rõ ràng hơn', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh74.jpg', 50, 4)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (63, N'Bút chì gỗ KOH 2B', CAST(4000 AS Decimal(18, 0)), N'Công dụng Bút chì gỗ 2B KOH thích hợp cho các hoạt động như ghi chép, vẽ nháp, học tập.
Đặc Điểm - Bút chì thân gỗ có sẵn gôm, thân dạng hình lục giác, dễ cầm nắm khi viết. Thân có thiết kế đơn giản, sơn hai màu xanh và vàng.
- Ruột chì loại HB, cứng và đen. Nét đậm vừa phải, ít gãy, dễ gôm tẩy.
- Thích hợp cho các hoạt động như ghi chép, vẽ nháp, học tập.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh75.jpg', 50, 4)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (64, N'Bút Aihao 555', CAST(2000 AS Decimal(18, 0)), N'Bút Aihao 555', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh76.jpg', 50, 4)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (65, N'Bút nước Aihao Xanh', CAST(5000 AS Decimal(18, 0)), N'Công dụng: Bút bi nước Aihao AH-801A 0,5mm là sản phẩm được các em học sinh, sinh viên và nhân viên văn phòng yêu thích, không chỉ bởi giá cả mà còn nhờ chất lượng và kiểu dáng đẹp mắt. Bút bi nước sử dụng loại mực mau khô, không đóng cặn, không phai màu sau thời gian dài sử dụng.
Đặc Điểm:Màu mực tươi sáng, mau khô, không đóng cặn. Đầu bi 0,5mm cho nét bút thanh mảnh. Tay cầm đệm cao su mềm mại, viết lâu không bị đau tay .Có nhiều màu sắc: xanh, đen, tím, đỏ', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh77.jpg', 50, 4)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (66, N'Bút nước Aihao Đen', CAST(5000 AS Decimal(18, 0)), N'Công dụng: Bút bi nước Aihao AH-801A 0,5mm là sản phẩm được các em học sinh, sinh viên và nhân viên văn phòng yêu thích, không chỉ bởi giá cả mà còn nhờ chất lượng và kiểu dáng đẹp mắt. Bút bi nước sử dụng loại mực mau khô, không đóng cặn, không phai màu sau thời gian dài sử dụng.
Đặc Điểm:Màu mực tươi sáng, mau khô, không đóng cặn. Đầu bi 0,5mm cho nét bút thanh mảnh. Tay cầm đệm cao su mềm mại, viết lâu không bị đau tay .Có nhiều màu sắc: xanh, đen, tím, đỏ', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh78.jpg', 50, 4)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (67, N'Bút nước Aihao Đỏ', CAST(5000 AS Decimal(18, 0)), N'Công dụng: Bút bi nước Aihao AH-801A 0,5mm là sản phẩm được các em học sinh, sinh viên và nhân viên văn phòng yêu thích, không chỉ bởi giá cả mà còn nhờ chất lượng và kiểu dáng đẹp mắt. Bút bi nước sử dụng loại mực mau khô, không đóng cặn, không phai màu sau thời gian dài sử dụng.
Đặc Điểm:Màu mực tươi sáng, mau khô, không đóng cặn. Đầu bi 0,5mm cho nét bút thanh mảnh. Tay cầm đệm cao su mềm mại, viết lâu không bị đau tay .Có nhiều màu sắc: xanh, đen, tím, đỏ', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh79.jpg', 50, 4)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (68, N'Bút TIZO 05 - Xanh', CAST(7000 AS Decimal(18, 0)), N'Công dụng: Dùng ghi chép
Đặc Điểm: - Đầu bi: 0.5mm

- Mực đậm, độ bền cao, ghi tốt trên nhiều loại bề mặt.

- Bút dạng đậy nắp, kiểu dáng thon nhỏ.

- Không độc hại đối với người sử dụng.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh80.jpg', 50, 4)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (69, N'Bút lông kim Thiên Long Fl-04 Doraemon xanh', CAST(13500 AS Decimal(18, 0)), N'Bút lông kim Thiên Long Fl-04 Doraemon xanh', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh81.jpg', 50, 4)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (70, N'Bút lông kim Thiên Long Fl-04 Doraemon đỏ', CAST(13500 AS Decimal(18, 0)), N'Bút lông kim Thiên Long Fl-04 Doraemon đỏ', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh82.jpg', 50, 4)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (71, N'Bút Raddar 665', CAST(3000 AS Decimal(18, 0)), N'Công dụng: Kích cỡ 1.0 mm. Phù hợp với văn phòng và trường học.
Đặc Điểm: Bút bi RADDAR chất lượng tốt, có nắp vặn xoay ở đầu bút giúp thuận tiện khi đóng mở bút.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh83.jpg', 50, 4)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (72, N'Bút Bến Nghé B30 - Đỏ', CAST(4500 AS Decimal(18, 0)), N'Công dụng: Ghi chép
Đặc Điểm: Tiện dụng, hiệu quả. Chất liệu cao cấp. Độ bền cao . Mang đến sự hài lòng
Đơn Vị Tính: cây
Quy Cách: hộp 30 cây
Màu Sắc: xanh, đỏ, đen', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh84.jpg', 50, 4)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (73, N'Bút gel Đông A tím', CAST(14000 AS Decimal(18, 0)), N'Bút gel Đông A tím', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh85.jpg', 50, 4)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (74, N'Bấm lỗ KwTrio 978 - 2 lỗ 30 tờ', CAST(135000 AS Decimal(18, 0)), N'Công dụng Khả năng dập tối đa 30 tờ/ 1 lần, đường kính lổ bấm 6mm và khoảng cách giữa 2 lỗ là 80mm.
Lò xo có độ đàn hồi tốt.
Đặc Điểm với thiết kế đơn giản, tiện dụng, nhiều màu màu sắc đẹp mắt.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh86.jpg', 50, 5)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (75, N'Bấm lỗ KwTrio 9670 - 2 lỗ 70 tờ', CAST(425000 AS Decimal(18, 0)), N'Bấm lỗ KwTrio 9670 - 2 lỗ 70 tờ', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh87.jpg', 50, 5)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (76, N'Bấm lỗ KwTrio 938 - 2 lỗ 100 tờ', CAST(1780000 AS Decimal(18, 0)), N'Bấm lỗ KwTrio 938 - 2 lỗ 100 tờ', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh88.jpg', 50, 5)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (77, N'Đinh ghim bảng màu - 20 cái', CAST(15000 AS Decimal(18, 0)), N'Đinh ghim bảng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh92.jpg', 50, 5)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (78, N'Kẹp bướm 51mm SLECHO', CAST(21500 AS Decimal(18, 0)), N'Công dụng giúp bạn dễ dàng bảo quản, phân loại và tránh thất lạc các liên giấy, tài liệu rời trong công việc, học tập. Nhờ đó mà công tác văn phòng sẽ trở nên đơn giản và nhẹ nhàng hơn.
Đặc Điểm Làm từ thép tốt có độ cứng cao đảm bảo chất lượng và độ bền tuyệt đối.
Bề mặt được phủ sơn gia nhiệt, chống gỉ.
Kẹp có tai cầm nhỏ gọn, dài vừa phải trợ lực cho bạn gài kẹp vào tài liệu
Kẹp có nhiều kích cỡ cho bạn lựa chọn: 15mm, 19mm ,25mm, 32mm, 41mm, 51mm.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh93.jpg', 50, 5)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (79, N'Bấm 1 lỗ KwTrio 097A0', CAST(35000 AS Decimal(18, 0)), N'Văn phòng phẩm FAST chuyên cung cấp Bấm 1 lỗ KwTrio 097A0

Số lượng tờ: 8

Đặc điểm: Bền, đẹp, dễ sử dụng.

Đơn vị tính: Cái

Bảo quản: Nơi khô ráo

Bấm 1 lỗ KwTrio 097A0 - Cần là có

Ngoài ra, văn phòng phẩm FAST còn cung cấp bấm kim, kim bấm và các loại van phong pham khác  với giá cả và chất lượng tốt nhất tại TPHCM', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh94.jpg', 50, 5)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (80, N'Bấm lỗ Eagle 837', CAST(42000 AS Decimal(18, 0)), N'Công dụng Khả năng dập tối đa 10 tờ/ 1 lần, đường kính lổ bấm 6mm và khoảng cách giữa 2 lỗ là 80mm.
Lò xo có độ đàn hồi tốt.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh95.jpg', 50, 5)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (81, N'Thước cuộn 3m thép', CAST(42000 AS Decimal(18, 0)), N'Công dụng có kiểu dáng nhỏ gọn, giúp người thợ sử dụng đo đạc ở nhiều nơi chật hẹp, khó di chuyển. Thước là người bạn đồng hành không thể thiếu trong các ngành công nghiệp, xây dựng, mộc, lắp đặt….
Đặc Điểm Thước được thiết kế chắc chắn.
Được phủ lớp ABS + TPR', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh96.jpg', 50, 5)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (82, N'Thước cuộn 5m thép', CAST(58000 AS Decimal(18, 0)), N'Công dụng có kiểu dáng nhỏ gọn, giúp người thợ sử dụng đo đạc ở nhiều nơi chật hẹp, khó di chuyển. Thước là người bạn đồng hành không thể thiếu trong các ngành công nghiệp, xây dựng, mộc, lắp đặt….
Đặc Điểm Thước được thiết kế chắc chắn.
Được phủ lớp ABS + TPR', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh97.jpg', 50, 5)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (83, N'Thước cuộn 7.5m thép', CAST(68000 AS Decimal(18, 0)), N'Công dụng có kiểu dáng nhỏ gọn, giúp người thợ sử dụng đo đạc ở nhiều nơi chật hẹp, khó di chuyển. Thước là người bạn đồng hành không thể thiếu trong các ngành công nghiệp, xây dựng, mộc, lắp đặt….
Đặc Điểm Thước được thiết kế chắc chắn.
Được phủ lớp ABS + TPR', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh98.jpg', 50, 5)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (84, N'Màng Ép Plastic dầy 60 Mic - A4', CAST(145000 AS Decimal(18, 0)), N'Công dụng Màng ép độ trong suốt cao, độ bám dính tốt

Giữ màu mực bền lâu, không nhàu rách

Bảo vệ khỏi ẩm mốc, bụi bẩn, nước trong lưu trữ, di chuyển

Độ dày 60mic chắc chắn, bền đẹp
Đặc Điểm khổ A4 (22 x 31.5 cm) phù hợp nhiều loại giấy tờ, văn bằng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh99.jpg', 50, 5)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (85, N'Màng Ép Plastic dầy A4 100Mic', CAST(185000 AS Decimal(18, 0)), N'Công dụng Màng ép độ trong suốt cao, độ bám dính tốt

Giữ màu mực bền lâu, không nhàu rách

Bảo vệ khỏi ẩm mốc, bụi bẩn, nước trong lưu trữ, di chuyển

Độ dày 100mic chắc chắn, bền đẹp
Đặc Điểm khổ A4 (22 x 31.5 cm) phù hợp nhiều loại giấy tờ, văn bằng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinh100.jpg', 50, 5)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (86, N'Băng keo simili xanh dương 3.6cm - 8 mét', CAST(12000 AS Decimal(18, 0)), N'Dùng để dán gáy sách
Chất dính được làm từ cao su tự nhiên.
Chống nước tốt.
Dễ cắt. Có nhiều màu sắc để lựa chọn.
Đóng gói: 8 cuộn/ cây.

Đơn vị tính: Cuộn

Bảo quản: Sạch sẽ, khô ráo', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh103.jpg', 50, 6)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (87, N'Băng keo trong 5F - 80Y', CAST(12000 AS Decimal(18, 0)), N' Được làm từ màng BOPP có độ bền cao, cộng keo tráng được lựa chọn

                         làm băng keo có độ dính cao, khả năng đàn hồi tốt.

                        Có thể dính rất chắc trên nhiều chất liệu khác nhau.

                        Công nghệ hiện đại, đạt tiêu chuẩn quốc tế, thân thiện với môi trường.', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh104.jpg', 50, 6)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (88, N'Băng keo trong 5F - 100Y', CAST(15500 AS Decimal(18, 0)), N'Được làm từ màng BOPP có độ bền cao, cộng keo tráng được lựa chọn

                         làm băng keo có độ dính cao, khả năng đàn hồi tốt.

                        Có thể dính rất chắc trên nhiều chất liệu khác nhau.

                        Công nghệ hiện đại, đạt tiêu chuẩn quốc tế, thân thiện với môi trường.', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh105.jpg', 50, 6)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (89, N'Thước cứng 20cm', CAST(5200 AS Decimal(18, 0)), N'Công dụng : có các vạch chia khoảng cách khá tỉ mỉ và rõ ràng cùng những con số chỉ đơn vị in đậm nét, giúp bạn có thể đo được chính xác kích thước của các vật dụng hoặc kẻ những đường thẳng tinh tế. Thước có độ dài 20cm thuận tiện cho học sinh, sinh viên, nhân viên văn phòng sử dụng.
Đặc Điểm Dụng cụ thước kẻ dùng trong học tập,văn phòng có nhiều kích thước dộ dài khác nhau, tiện dụng, sản xuất tại VN. Vạch chia cm rõ ràng tạo những đường kẻ chính xác.Màu sắc đa dạng
Đơn Vị Tính : Cây', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh106.jpg', 500, 6)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (90, N'Thước dẻo 30cm', CAST(6500 AS Decimal(18, 0)), N'Công dụng : có các vạch chia khoảng cách khá tỉ mỉ và rõ ràng cùng những con số chỉ đơn vị in đậm nét, giúp bạn có thể đo được chính xác kích thước của các vật dụng hoặc kẻ những đường thẳng tinh tế. Thước có độ dài 30cm thuận tiện cho học sinh, sinh viên, nhân viên văn phòng sử dụng.
Đặc Điểm Dụng cụ thước kẻ dùng trong học tập,văn phòng có nhiều kích thước dộ dài khác nhau, tiện dụng, sản xuất tại VN
Được sản xuất bằng nhựa dẻo chất lượng tốt. Vạch chia cm rõ ràng tạo những đường kẻ chính xác.Màu sắc đa dạng
Đơn Vị Tính : Cây', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh107.jpg', 500, 6)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (91, N'Thước cứng 50cm', CAST(17500 AS Decimal(18, 0)), N'Công dụng : có các vạch chia khoảng cách khá tỉ mỉ và rõ ràng cùng những con số chỉ đơn vị in đậm nét, giúp bạn có thể đo được chính xác kích thước của các vật dụng hoặc kẻ những đường thẳng tinh tế. Thước có độ dài 50cm thuận tiện cho học sinh, sinh viên, nhân viên văn phòng sử dụng.
Đặc Điểm Dụng cụ thước kẻ dùng trong học tập,văn phòng có nhiều kích thước dộ dài khác nhau, tiện dụng, sản xuất tại VN
Vạch chia cm rõ ràng tạo những đường kẻ chính xác.Màu sắc đa dạng
Đơn Vị Tính : Cây', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh108.jpg', 500, 6)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (92, N'Thước sắt 20cm', CAST(24500 AS Decimal(18, 0)), N'Công dụng Đo đạc kích thước vật thể đa năng
Đặc Điểm chất liệu thép bền, cứng, các vạch kẻ rõ nét.
Đơn Vị Tính : Cây', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh109.jpg', 500, 6)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (93, N'Thước sắt 30cm', CAST(30500 AS Decimal(18, 0)), N'Công dụng Đo đạc kích thước vật thể đa năng
Đặc Điểm chất liệu thép bền, cứng, các vạch kẻ rõ nét.
Đơn Vị Tính : Cây', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh110.jpg', 500, 6)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (94, N'Cắt băng keo No. 2005', CAST(59000 AS Decimal(18, 0)), N'
Công dụng : Cắt băng keo N.2005 là sản phẩm cắt băng keo để bàn rất phổ biến trên thị trường. Cắt keo N.2005 dùng để cắt băng keo vòng lớn hoặc vòng nhỏ 2,5F và 1,8F.
Đặc Điểm : Việc cắt dán băng keo hàng ngày sẽ trở nên nhanh chóng và đơn giản hơn với sản phẩm cắt băng keo để bàn . Dụng cụ cắt băng keo cầm tay giúp cho người sử dụng dễ dàng điều khiển độ dài băng keo cần cắt, việc cắt dán băng keo thật tiện lợi và an toàn với tay cầm chắc chắn. Chất lượng nhựa cứng tốt, lưỡi cắt bằng sắt hợp kim bền chắc.
Đơn Vị Tính : Cái
Quy Cách
Màu Sắc : Mặc định', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh111.jpg', 500, 6)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (95, N'Thước đo độ No3', CAST(8500 AS Decimal(18, 0)), N'Thước đo độ No3', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh112.jpg', 500, 6)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (96, N'Cắt keo văn phòng 2001 nhỏ', CAST(18000 AS Decimal(18, 0)), N'Công dụng : Cắt băng keo VP nhỏ N.2001 là sản phẩm cắt băng keo để bàn rất phổ biến trên thị trường. Cắt keo N.2001 dùng để cắt băng keo vòng nhỏ 1,8F
Đặc Điểm : Việc cắt dán băng keo hàng ngày sẽ trở nên nhanh chóng và đơn giản hơn với sản phẩm cắt băng keo để bàn . Dụng cụ cắt băng keo cầm tay giúp cho người sử dụng dễ dàng điều khiển độ dài băng keo cần cắt, việc cắt dán băng keo thật tiện lợi và an toàn với tay cầm chắc chắn . Chất lượng: nhựa cứng tốt, lưỡi cắt bằng sắt hợp kim bền chắc.
Đơn Vị Tính : Cái
Quy Cách
Màu Sắc : Mặc định', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh113.jpg', 500, 6)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (97, N'Dao rọc giấy SDI lớn 0423', CAST(19000 AS Decimal(18, 0)), N'Công dụng là dụng cụ hữu ích cho nhiều ngành nghề và đối tượng, từ học sinh, sinh viên, nhân viên công sở đến thợ chế tác thủ công, thợ điện, ngành đóng gói… Một chiếc dao sắc bén, tiện dụng sẽ giúp bạn hoàn thành công việc nhanh hơn, tiết kiệm thời gian.
Đặc Điểm có kết cấu chắc chắn, lưỡi dao bằng thép có độ cứng cao, sắc bén giúp cho đường rọc trở nên trơn tru, chính xác hơn. Thiết kế nhỏ gọn, dễ dàng bảo quản trong hộp đồ dùng hay hộp bút để tiện lấy dùng khi cần. Thiết kế có thể thay lưỡi dao linh hoạt và dễ dàng khi lưỡi dao cũ đã mòn.
Đơn Vị Tính : Câí', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh114.jpg', 500, 6)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (98, N'Kéo lớn 25cm - K20', CAST(24000 AS Decimal(18, 0)), N'
Công dụng là loại kéo cắt giấy đa năng, thích hợp sử dụng trong văn phòng và các sinh hoạt trong gia đình như cắt giấy tờ, cắt dán thủ công, cắt vải, vỏ bao bì. Chiều dài kéo 25cm.
Đặc Điểm là loại kéo lớn, lưỡi kéo được làm với thép dày, độ cứng cao, cán kéo tròn ngắn, khi cắt có cảm giác nhẹ nhàng và thoải mái. Kéo phù hợp cho việc cắt các loại giấy tại văn phòng, dễ dàng dùng để cắt nhiều tờ một lúc hoặc cắt các loại giấy cứng.', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh115.jpg', 500, 6)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (99, N'Bàn cắt giấy A4 Trio- 3018 dao cắt con lăn', CAST(1775000 AS Decimal(18, 0)), N'Bàn cắt giấy A4 - 3018 dao cắt con lăn', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh116.jpg', 500, 6)
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (100, N'Keo cây silicon nhỏ', CAST(3000 AS Decimal(18, 0)), N'Keo cây silicon nhỏ', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh117.jpg', 500, 6)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (101, N'Súng bắn keo nhỏ', CAST(78000 AS Decimal(18, 0)), N'Súng bắn keo nhỏ', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh118.jpg', 500, 6)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (102, N'Súng bắn keo silicon Asaki AK - 6789', CAST(482000 AS Decimal(18, 0)), N'15" Súng bắn silicon Asaki AK-6789 được thiết kế có kích thước nhỏ gọn, trọng lượng nhẹ, dễ dàng mang theo sử dụng trong nhiều không gian và bảo quản trong hộp đồ nghề sau mỗi lần sử dụng, là dụng cụ rất phổ biến và được ứng dụng trong nhiều ngành nghề khác nhau đáp ứng nhu cầu thi công lắp đặt hiệu quả và nhanh chóng với tốc độ làm nóng nhanh và có thể sử dụng ngay.', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh119.jpg', 500, 6)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (103, N'Keo silicon Apollo A500 (trắng đục)', CAST(135000 AS Decimal(18, 0)), N'Keo silicon Apollo A500  là chất trám trét, kết dính gốc silicone (Silicone Sealant) cao cấp một thành phần lưu hóa axít, độ đàn hồi cao. Bền bỉ, có thể chịu được những điều kiện nhiệt độ khắc nghiệt, độ ẩm, ozone và tia cực tím. Apollo A500 không bị mất màu, rạn nứt khi sử dụng ngoài trời, bất kể thời tiết khắc nghiệt, có  khả năng bám dính với hầu hết các loại vật liệu xây dựng mà không cần sử dụng sơn lót. ', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh120.jpg', 500, 6)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (104, N'Bảng viết bút lông cao cấp 60x80', CAST(885000 AS Decimal(18, 0)), N'Bảng viết bút lông cao cấp 60x80

Đặc điểm:

      -   Chất liệu chính bằng Greenlam nhập khẩu từ Ấn Độ. Mặt bảng viết bút lông màu trắng bạch

      -   Có kẻ ô li 5cm hoặc không kẻ ô li

      -   Viết không để lại dấu

      -   Viền khung nhôm định hình', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh121.jpg', 500, 7)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (105, N'Bảng viết bút lông học sinh B-09 - khổ A4', CAST(65000 AS Decimal(18, 0)), N'Bảng viết bút lông học sinh B-09 - khổ A4', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh127.jpg', 500, 7)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (106, N'Bảng viết tự xoá hình Ipad', CAST(270000 AS Decimal(18, 0)), N'Bảng viết tự xoá hình Ipad', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh128.jpg', 500, 7)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (107, N'Bảng di động 1 mặt viết bút lông Ấn Độ cao cấp 120x140', CAST(2084000 AS Decimal(18, 0)), N'Bảng di động 1 mặt  viết bút lông cao cấp 120x140

Đặc điểm:

Bảng 1 mặt: Mặt bảng được nhập khẩu từ Ấn Độ - có 2 màu đen và xanh ngọc, chất liệu chính bằng Greenlam, 

Mặt bảng màu trắng kẻ ô ly vuông 5cm hoặc không kẻ, 

viền khung nhôm hộp định hình Việt –Nhật. 

Bảng có gắn giá bằng sắt 2x4cm dày 1,2mm. Có bánh xe của Taiwan di động dễ dàng. 

Bảng có thể quay theo chiều trục ngang. ', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh129.jpg', 500, 7)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (108, N'Bảng lịch công tác 60x100', CAST(972000 AS Decimal(18, 0)), N'Bảng lịch công tác 60x100

Đặc điểm:

      -   Mặt bảng màu trắng in lụa màu xanh biển theo mẫu lịch công tác

      -   Chất liệu Greenlam nhập từ Ấn Độ

      -   Viền khung nhôm định hình', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh130.jpg', 500, 7)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (109, N'Bảng lịch công tác 80x120', CAST(1010000 AS Decimal(18, 0)), N'Bảng lịch công tác 80x120

Đặc điểm:

      -   Mặt bảng màu trắng in lụa màu xanh biển theo mẫu lịch công tác

      -   Chất liệu Greenlam nhập từ Ấn Độ

      -   Viền khung nhôm định hình', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh131.jpg', 500, 7)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (110, N'Bảng ghim nỉ đa năng 60x100', CAST(725000 AS Decimal(18, 0)), N'Bảng ghim nỉ đa năng 60x100

Đặc điểm:

      -   Mặt bảng bằng nỉ được nhập khẩu từ Indonesia

      -   Không phai màu

      -   Màu sắc: xanh dương, xanh lá, đỏ, đen, xám

      -   Viền khung nhôm định hình', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh132.jpg', 500, 7)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (111, N'Bảng ghim nỉ đa năng 80x120', CAST(81000 AS Decimal(18, 0)), N'Bảng ghim nỉ đa năng 80x120

Đặc điểm:

      -   Mặt bảng bằng nỉ được nhập khẩu từ Indonesia

      -   Không phai màu

      -   Màu sắc: xanh dương, xanh lá, đỏ, đen, xám

      -   Viền khung nhôm định hình', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh133.jpg', 500, 7)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (112, N'Bảng thông báo cửa kiếng gắn khóa 80x120cm', CAST(2148000 AS Decimal(18, 0)), N'Bảng thông báo cửa kiếng gắn khóa không mái che có mặt bảng có thể lựa chọn bảng từ viết bút lông Hàn Quốc, bảng từ viết phấn Hàn Quốc hoặc bảng ghim, cửa bằng kiếng gắn khóa để tiện sử dụng.

Bảng thông báo cửa kiếng gắn khóa không mái che được viền khung nhôm hộp định hình, các góc có co nhựa chống trầy xước, hài hòa với khung bảng', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh134.jpg', 500, 7)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (113, N'Bảng thông báo cửa kiếng gắn khóa 120x140cm', CAST(3616000 AS Decimal(18, 0)), N'Bảng thông báo cửa kiếng gắn khóa không mái che có mặt bảng có thể lựa chọn bảng từ viết bút lông Hàn Quốc, bảng từ viết phấn Hàn Quốc hoặc bảng ghim, cửa bằng kiếng gắn khóa để tiện sử dụng.

Bảng thông báo cửa kiếng gắn khóa không mái che được viền khung nhôm hộp định hình, các góc có co nhựa chống trầy xước, hài hòa với khung bảng', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh135.jpg', 500, 7)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (114, N'Bảng thông báo cửa kiếng gắn khóa 120x180cm', CAST(4368000 AS Decimal(18, 0)), N'Bảng thông báo cửa kiếng gắn khóa không mái che có mặt bảng có thể lựa chọn bảng từ viết bút lông Hàn Quốc, bảng từ viết phấn Hàn Quốc hoặc bảng ghim, cửa bằng kiếng gắn khóa để tiện sử dụng.

Bảng thông báo cửa kiếng gắn khóa không mái che được viền khung nhôm hộp định hình, các góc có co nhựa chống trầy xước, hài hòa với khung bảng', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh136.jpg', 500, 7)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (115, N'Bảng Flipchart từ tính, chân inox 100x60', CAST(2875000 AS Decimal(18, 0)), N'Kích thước: cao x ngang

Công Nghệ của Đức. Mặt bảng nhập khẩu từ Korea, bảng viết bút lông màu trắng.

Đặc biệt dễ xóa & không để lại dấu, có ô ly chìm 5cm của Công ty Union – Hàn Quốc, viền khung nhôm hộp.

Chân giá đỡ bằng Inox sáng bóng, có gắn thanh kẹp giấy. Đặc biệt có thể đính hình ảnh hoặc văn bản bằng nam châm, điều chỉnh độ cao, độ nghiêng và xếp gọn khi không sử dụng hoặc di chuyển.

Sản phẩm tinh tế sang trọng phù hợp với mọi không gian.', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh137.jpg', 500, 7)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (116, N'Bảng Flipchart từ tính, chân sắt sơn tĩnh điện 120x120', CAST(344000 AS Decimal(18, 0)), N'Kích thước: cao x ngang

Công Nghệ của Đức. Mặt bảng nhập khẩu từ Korea, bảng viết bút lông màu trắng.

Đặc biệt dễ xóa & không để lại dấu, có ô ly chìm 5cm của Công ty Union – Hàn Quốc, viền khung nhôm hộp.

Chân giá đỡ bằng Inox sáng bóng, có gắn thanh kẹp giấy. Đặc biệt có thể đính hình ảnh hoặc văn bản bằng nam châm, điều chỉnh độ cao, độ nghiêng và xếp gọn khi không sử dụng hoặc di chuyển.

Sản phẩm tinh tế sang trọng phù hợp với mọi không gian.', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh138.jpg', 500, 7)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (117, N'Máy tính Casio MX 12B', CAST(205000 AS Decimal(18, 0)), N'	
Kích thước:  14.7 cm x 10.65cm x 2.9cm

Màn hình cực lớn
Màn hình lớn hơn giúp đọc nhiều dữ liệu dễ dàng hơn.

Nguồn hai chiều (Mặt trời + Pin)
Chế độ sử dụng năng lượng mặt trời được bật khi đủ sáng, chế độ pin được bật khi không đủ sáng.
Nhấn đồng thời phím
Các thao tác phím được lưu trữ trong bộ nhớ đệm, nhờ vậy sẽ không bị mất dữ liệu ngay cả khi nhập với tốc độ cao.
Các phím dẻo
Được thiết kế và chế tạo để dễ dàng thao tác.
Phần trăm thông thường
Các tính toán phần trăm thông thường.', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh141.jpg', 500, 8)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (118, N'Máy tính Casio MC-12M', CAST(298000 AS Decimal(18, 0)), N'Máy tính Casio MC-12M', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh149.jpg', 500, 8)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (122, N'Máy tính M28 (nhỏ 8 số)', CAST(84000 AS Decimal(18, 0)), N'Công dụng Màn hình lớn dễ dàng đọc dữ liệu, sử dụng 2 nguồn năng lượng: pin và mặt trời. Bàn phím lớn với khoảng cách phím xa nên dễ dàng thao tác tính toán không bị nhầm lẫn.
Đặc Điểm "Đặc Điểm Màn hình lớn dễ dàng đọc dữ liệu
- Sử dụng 2 nguồn năng lượng: pin và mặt trời
- Phím cuốn đảm bảo không mất dữ liệu khi làm việc với tốc độ cao
- Bề mặt kim loại bền, có nhóm lệnh chức năng
- Chức năng nổi bật: tính tỷ lệ phần trăm, tính thuế, đổi tỷ giá"

Kích thước : 12x15x2 cm

Đơn Vị Tính : Cái', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh153.jpg', 500, 8)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (123, N'Máy tính JS-120L', CAST(119000 AS Decimal(18, 0)), N'Máy tính Casio JS -120L', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh154.jpg', 500, 8)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (124, N'Máy tính Casio FX-570ES Plus', CAST(495000 AS Decimal(18, 0)), N'Công dụng Tính sô thập phân tuần hoàn, phép chia có dư, Thừa số nguyên tố, Tìm UCLN, BCNN, Phép tính tích, Bất PT bậc 2, bậc 3, tính toán phân phối DIST, Tọa độ đỉnh Parabol, Tự động điều chỉnh phép nhân tắt rõ hơn, tạo bảng số từ 2 hàm. Phép chia có dư, Bộ nhớ trước PreAns, Int,Ingt, lưu nghiệm khi giải phương trình, tính lũy thùa bậc 4 trở lên cho số phức
Đặc Điểm - Tính toán số thập phân vô hạn tuần hoàn`
- Phân tích thành thừa số nguyên tố
- Tìm thương và số dư của phép chia
- Tìm ƯCLN, BCNN
- Tìm tọa độ đỉnh Parabol trực tiếp trên máy
- Giải bất phương trình bậc 2, bậc 3
- Tính tích, tổng của dãy số
- Lưu nghiệm khi giải phương trình
- Hiển thị kết quả dưới dạng hỗn số, số thập phân, căn thức
- Tính logarit với cơ số bất kỳ
- Tính toán phân phối DIST
- Tính ma trận, thống kê
Đơn Vị Tính : Cái', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh158.jpg', 500, 8)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (125, N'Máy tính Casio MS-20UC đen', CAST(375000 AS Decimal(18, 0)), N'Văn phòng phẩm FAST chuyên cung cấp: Máy tính Casio MS-20UC đen

Kích thước (Dài × Rộng × Dày) : 149,5 × 105 × 22,8 mm

Trọng lượng : 110g', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh159.jpg', 500, 8)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (126, N'Máy tính in giấy Casio DR-140TM', CAST(3785000 AS Decimal(18, 0)), N'Máy tính Casio DR-140TM

- Tiện lợi cho việc bán hàng tại tiệm vàng bạc, nữ trang, tiệm thuốc tấy, siêu thị mini...

- Màn hình lớn dễ dàng đọc dữ liệu.

- Các giá trị tương đương in màu đen, các giá trị âm in màu đỏ

-  Phím cuốn đảm bảo không mất dữ liệu khi làm việc với tốc độ cao

- In với tốc độ nhanh và không gây tiếng ồn

- Chức năng nổi bật: tính tỷ lệ phần trăm, tính thuế, chi phí & lợi nhuận, thêm bớt lợi nhuận và chi phí đã định

- Tiện lợi cho việc bán hàng tại tiệm vàng bạc, nữ trang, tiệm thuốc tấy, siêu thị mini...

- Màn hình lớn dễ dàng đọc dữ liệu.

- Các giá trị tương đương in màu đen, các giá trị âm in màu đỏ

-  Phím cuốn đảm bảo không mất dữ liệu khi làm việc với tốc độ cao

- In với tốc độ nhanh và không gây tiếng ồn

- Chức năng nổi bật: tính tỷ lệ phần trăm, tính thuế, chi phí & lợi nhuận, thêm bớt lợi nhuận và chi phí đã định', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh160.jpg', 500, 8)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (127, N'Chổi vệ sinh bàn phím', CAST(55000 AS Decimal(18, 0)), N'Chổi quét máy tính', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh161.jpg', 500, 9)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (128, N'Máy hủy tài liệu Silicon PS-812C', CAST(3350000 AS Decimal(18, 0)), N'Máy hủy tài liệu Silicon PS-812C

* Hủy 1 lần 8 tờ A4 / 70g

* Vụn thành mảnh: 3.8 x 50 mm

*  Độ ồn< 65d b

* Có hủy được ghim bấm, thẻ nhựa

* Miệng cắt rộng: 230mm

* Tự khởi động, tốc độ: 4m/phút

* Chức năng trả giấy ngược

* Chức năng chống kẹt giấy

* Thùng giấy: 21 lít

* Kích cỡ máy: 380 x 275 x 435 mm

* Trọng lượng 6.3 Kg

* Bánh xe di chuyển dễ dàng

* Hiển thị đèn Led

Công nghệ Mỹ, chính hãng

Bảo hành: 1 năm thân máy & 7 năm cho dao cắt', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh162.jpg', 500, 9)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (129, N'Bàn phím máy tính Genius', CAST(2750000 AS Decimal(18, 0)), N'Công dụng Sản phẩm là loại bàn phím thông dụng dành cho máy tính để bàn, kết nối qua cổng kết nối USB và tương thích với mọi hệ điều hành để bạn thuận tiện sử dụng
Đặc Điểm có thiết kế ấn tượng với những đường cong tạo nên một dáng vẻ thời trang và hiện đại. Bàn phím thông minh với các lỗ thoát nước hiệu quả, bảo vệ bàn phím an toàn khỏi các sự cố tràn chất lỏng một cách an toàn. Bề mặt bàn phím rộng lõm phù hợp với đầu ngón tay và các góc cạnh phím được bo tròn nhẹ giữ cho tay bạn được tự nhiên hơn khi gõ phím và dễ dàng di chuyển qua lại giữa các phím.
Đơn Vị Tính : Cái', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh163.jpg', 500, 9)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (130, N'Pin đại con Ó', CAST(28000 AS Decimal(18, 0)), N'Cặp 2 viên', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh164.jpg', 500, 9)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (131, N'Bộ vệ sinh máy tính', CAST(45000 AS Decimal(18, 0)), N'Bộ vệ sinh máy tính', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh165.jpg', 500, 9)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (132, N'Máy đếm tiền thế hệ mới Silicon MC-6000', CAST(3190000 AS Decimal(18, 0)), N'Tính năng & thiết kế ưu việt
- Sản phẩm chất lượng cực tốt, hoạt động ổn định, bền bỉ, không kẹt tiền, không đếm sai nhầm.
- Có 2 màn hình LCD trên máy giúp quan sát được tốt hơn
- Thiết kế thời trang và gọn nhẹ.
- Tự động, đếm tiền giấy và polime, VNĐ và ngoại tệ
- Đếm được USD & EURO ( đếm thông thường ).
- Máy đếm tiền ấn định số tờ cần đếm, đếm cộng dồn, đếm mẻ.
- Tự động, đếm tiền giấy và polime VNĐ và ngoại tệ các loại
- Chất lượng đếm ổn định, bền bỉ
- Điện nguồn: AC220-230V(120V) ,50Hz(60Hz)
- Tốc độ : ≥1000 tờ/phút
- Màn hình hiện thị : 2 màn LCD bên hông máy, 1 màn hiển thị kéo dài.
- Kích thước sản phẩm : 280 x 340 x 230mm
- Kích thước bao bì : 330*380*220mm
- Trọng lượng sản phẩm : 8.5 kg 
- Trọng lượng cả bao bì : 8.6 kg 
Công nghệ Mỹ, chính hãng', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh166.jpg', 500, 9)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (133, N'Xe đẩy hàng Nhật bản DANDY UDL-DX', CAST(2190000 AS Decimal(18, 0)), N'Xe đẩy hàng Nhật bản DANDY UDL-DX

Sàn thép 2 lớp siêu bền và chịu lực vô cùng chắc chắn, bề mặt sàn được trang bị 1 lớp nệm cao su đàn hồi cao cấp.

- Chở và vận chuyển hàng hoá. 

- Kiểu xe : xe đẩy tay (Gấp được)

- Kích thước sản phẩm : Dài 710 x Rộng 450 x Cao (Tay đẩy) 888mm 

- Kích thước cả thùng :  755x490x140mm

- Kích thước mặt sàn : Dài 710 x Rộng 450mm

- Tải trọng : 150kg ( Max )  

- Đường kính bánh xe : Ø 100 mm (4”)

- Trọng lượng xe : 12 kg

- Trọng lượng cả thùng : 13 kg 

- Bảo hành 12 tháng.

- Sản xuất tại Nhật bản.', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh167.jpg', 500, 9)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (134, N'Xe đẩy hàng Nhật bản DANDY UDA-LSC
', CAST(4350000 AS Decimal(18, 0)), N'Xe đẩy hàng Nhật bản DANDY UDA-LSC

Sàn thép 2 lớp siêu bền và chịu lực vô cùng chắc chắn, bề mặt sàn được trang bị 1 lớp nệm cao su đàn hồi cao cấp.

- Chở và vận chuyển hàng hoá. 

- Kiểu xe : xe đẩy tay (Gấp được)

- Kích thước sản phẩm : Dài 900 x Rộng 600 x Cao (Tay đẩy) 954mm 

- Kích thước cả thùng :  930x640x220mm

- Kích thước mặt sàn : Dài 900 x Rộng 600mm

- Tải trọng : 300kg ( Max )  

- Đường kính bánh xe : Ø 125 mm (5”)

- Trọng lượng xe : 26 kg

- Trọng lượng cả thùng :  27 kg

- Bảo hành 12 tháng.

- Sản xuất tại Nhật bản.', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh168.jpg', 500, 9)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (135, N'Thẻ nhớ 16G', CAST(285000 AS Decimal(18, 0)), N'Công dụng Bạn sẽ thuận tiện trong việc nhập hoặc truy xuất dữ liệu mọi lúc mọi nơi mà không gặp bất kì khó khăn nào bởi thẻ nhớ tương thích với tất cả các bảng mạch led,định vị ô tô có hỗ trợ khe cắm thẻ nhớ Kingston Micro 16gb-SD trên thị trường hiện nay.

Khả năng hoạt động bền bỉ đã được khẳng định .
Đặc Điểm Tốc độ đọc có thể lên đến 80MB/s, đảm bảo khả năng xử lý nhanh chóng dữ liệu hình ảnh có độ phân giải cao và những file video dung lượng lớn. Bạn sẽ trải nghiệm những giây phút làm việc, học tập hay thư giãn vô cùng thoải mái, nhanh chóng và đơn giản thẻ nhớ Kingston 4gb Micro SD ', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh169.jpg', 500, 9)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (136, N'Thẻ nhớ 32G', CAST(375000 AS Decimal(18, 0)), N'
Công dụng Bạn sẽ thuận tiện trong việc nhập hoặc truy xuất dữ liệu mọi lúc mọi nơi mà không gặp bất kì khó khăn nào bởi thẻ nhớ tương thích với tất cả các bảng mạch led,định vị ô tô có hỗ trợ khe cắm thẻ nhớ Kingston Micro 32gb-SD trên thị trường hiện nay.

Khả năng hoạt động bền bỉ đã được khẳng định .
Đặc Điểm Tốc độ đọc có thể lên đến 80MB/s, đảm bảo khả năng xử lý nhanh chóng dữ liệu hình ảnh có độ phân giải cao và những file video dung lượng lớn. Bạn sẽ trải nghiệm những giây phút làm việc, học tập hay thư giãn vô cùng thoải mái, nhanh chóng và đơn giản thẻ nhớ Kingston 4gb Micro SD ', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh170.jpg', 500, 9)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (137, N'Thẻ nhớ 4G', CAST(235000 AS Decimal(18, 0)), N'Công dụng Bạn sẽ thuận tiện trong việc nhập hoặc truy xuất dữ liệu mọi lúc mọi nơi mà không gặp bất kì khó khăn nào bởi thẻ nhớ tương thích với tất cả các bảng mạch led,định vị ô tô có hỗ trợ khe cắm thẻ nhớ Kingston Micro 4gb-SD trên thị trường hiện nay.

Khả năng hoạt động bền bỉ đã được khẳng định .
Đặc Điểm Tốc độ đọc có thể lên đến 80MB/s, đảm bảo khả năng xử lý nhanh chóng dữ liệu hình ảnh có độ phân giải cao và những file video dung lượng lớn. Bạn sẽ trải nghiệm những giây phút làm việc, học tập hay thư giãn vô cùng thoải mái, nhanh chóng và đơn giản thẻ nhớ Kingston 4gb Micro SD
Đơn Vị Tính : Cái', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh171.jpg', 500, 9)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (138, N'Thẻ nhớ 8G', CAST(255000 AS Decimal(18, 0)), N'Công dụng Bạn sẽ thuận tiện trong việc nhập hoặc truy xuất dữ liệu mọi lúc mọi nơi mà không gặp bất kì khó khăn nào bởi thẻ nhớ tương thích với tất cả các bảng mạch led,định vị ô tô có hỗ trợ khe cắm thẻ nhớ Kingston Micro 8gb-SD trên thị trường hiện nay.

Khả năng hoạt động bền bỉ đã được khẳng định .
Đặc Điểm Tốc độ đọc có thể lên đến 80MB/s, đảm bảo khả năng xử lý nhanh chóng dữ liệu hình ảnh có độ phân giải cao và những file video dung lượng lớn. Bạn sẽ trải nghiệm những giây phút làm việc, học tập hay thư giãn vô cùng thoải mái, nhanh chóng và đơn giản thẻ nhớ Kingston 4gb Micro SD
Đơn Vị Tính : Cái', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh172.jpg', 500, 9)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (139, N'Máy sạc Energizer kèm 4 viên pin AA', CAST(665000 AS Decimal(18, 0)), N'Máy sạc Energizer kèm 4 viên pin AA

Bảo quản:', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh173.jpg', 500, 9)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (140, N'Pin Sạc 2A Camelion - Sạc', CAST(198000 AS Decimal(18, 0)), N'Pin sạc 2A Camelion', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh174.jpg', 500, 9)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (141, N'Pin sạc 3A Camelion - Sạc', CAST(198000 AS Decimal(18, 0)), N'Pin sạc AAA Camelion 1100 mAh vỉ 2 viên chính hãng
• Loại pin: Pin sạc / NiMH
• Hãng: Camelion (Germany)
• Model: Camelion AlwaysReady
• Điện thế: 1.2 V
• Dung lượng: 1100 mAh
• Kích thước: Pin AAA/ Pin đũa/ R06/ LR3
• Hình thức đóng gói: Vỉ 2 viên
• Xuất xứ: Trung Quốc', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh175.jpg', 500, 9)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (142, N'Điện thoại bàn Panasonic KX TS500 - màu trắng', CAST(495000 AS Decimal(18, 0)), N'Điện thoại bàn Panasonic KX TS500', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh176.jpg', 500, 9)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (143, N'Điện thoại bàn Panasonic KX-TS580MX', CAST(1095000 AS Decimal(18, 0)), N'Điện thoại bàn Panasonic KX-TS580MX', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh177.jpg', 500, 9)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (144, N'Điện thoại Panasonic KX-TGB110', CAST(1045000 AS Decimal(18, 0)), N'Điện thọai Panasonic KX-TGB110', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh179.jpg', 500, 9)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (145, N'USB Kingston 16G', CAST(235000 AS Decimal(18, 0)), N'Công dụng có thiết kế độc đáo, được làm bằng nhựa cứng, đem tới sự sang trọng, bền bỉ cho thiết bị. Sản phẩm có cổng kết nối đáp ứng khả năng trao đổi dữ liệu qua lại giữa các thiết bị một cách nhanh chóng.
Đặc Điểm Với thiết kế được chọn lọc, kiểu dáng sắc sảo pha trộn nhiều phong cách cho phép các dòng USB kim loại thể hiện được nhiều concept tốt.

Bằng việc pha phối với các chất liệu khác, kèm màu sắc có thể thay đổi theo từng nhu cầu riêng biệt sẽ phù hợp với nhiều chiến dịch quảng cáo, marketing, branding, quảng bá cũng như các nhu cầu quà tặng khác.
Đơn Vị Tính : Cái', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh180.jpg', 500, 9)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (146, N'Mực in HP 80A Black LaserJet Toner Cartridge (CF280A)', CAST(2355000 AS Decimal(18, 0)), N'Mực in HP 80A Black LaserJet Toner Cartridge (CF280A)', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh181.jpg', 500, 10)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (147, N'Mực in HP 05A Black LaserJet Toner Cartridge (CE505A)', CAST(2225000 AS Decimal(18, 0)), N'Mã mực: Mực in HP 05A Black LaserJet Toner Cartridge (CE505A)
Loại mực: Laser trắng đen
Dung lượng: 2.300 trang độ phủ 5%
Bảo hành: Chính hãng 
Giao hàng: Miễn phí phạm vi TPHCM
Máy sử dụng: HP LaserJet P2035 / 2035n, 2055d, 2055dn', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh182.jpg', 500, 10)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (148, N'Mực in HP 38A Black LaserJet Toner Cartridge (Q1338A)', CAST(4444000 AS Decimal(18, 0)), N'Mã mực: HP 38A Black LaserJet Toner Cartridge (Q1338A)
Loại mực: Laser trắng đen
Dung lượng: 12.000 trang độ phủ 5%
Bảo hành: Chính hãng
Giao hàng: Miễn phí TPHCM', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh188.jpg', 500, 10)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (149, N'Mực in Canon 418 Black Toner Cartridge', CAST(3394000 AS Decimal(18, 0)), N'Mã mực: Mực in Canon 418 Black Toner Cartridge', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh192.jpg', 500, 10)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (150, N'Mực in Canon EP-65 Black Toner Cartridge', CAST(3250000 AS Decimal(18, 0)), N'Mực in Canon EP-65 Black Toner Cartridge', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh193.jpg', 500, 10)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (151, N'Mực in Canon EP-65 Black Toner Cartridge', CAST(3250000 AS Decimal(18, 0)), N'Mực in Canon EP-65 Black Toner Cartridge', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh194.jpg', 500, 10)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (152, N'Mực in Samsung ML D1043 Black Toner Cartridge', CAST(2280000 AS Decimal(18, 0)), N'Mã mực: Samsung ML-D1043 Black Toner Cartridge', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh195.jpg', 500, 10)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (153, N'Mực in Samsung SCX-6320D8 Blak Toner cartridge', CAST(3720000 AS Decimal(18, 0)), N'Mã mực: Samsung SCX-6320D8 Blak Toner cartridge', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh196.jpg', 500, 10)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (154, N'Mực in Samsung MLT D209L Black Toner Cartridge (MLT-D209L)', CAST(3085000 AS Decimal(18, 0)), N'Mã mực: Samsung MLT-D209S Black Toner Cartridge', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh197.jpg', 500, 10)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (155, N'Mực in Brother TN 261 Black Toner Cartridge (TN-261BK)', CAST(1650000 AS Decimal(18, 0)), N'Mã mực: Mực in Brother TN-261 Black Toner Cartridge
Loại mực: Laser màu đen
Dung lượng: 2.500 trang độ phủ 5%
Bảo hành: Chính hãng
Giao hàng: Miễn phí TPHCM', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh198.jpg', 500, 10)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (156, N'Mực in Brother TN 240 Black Toner Cartridge (TN 240BK)', CAST(1795000 AS Decimal(18, 0)), N'Mã mực: Mực in Brother TN-240 Black Toner Cartridge (TN-240BK)
Loại mực: Laser màu đen
Dung lượng: 2.500 trang độ phủ 5%
Bảo hành: Chính hãng
Giao hàng: Miễn phí TPHCM', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh199.jpg', 500, 10)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (157, N'Mực in Brother TN 240 Magenta Toner Cartridge (TN 240M)', CAST(1895000 AS Decimal(18, 0)), N'Mực in Brother TN 240 Magenta Toner Cartridge (TN 240M)', CAST(N'2020-07-05 00:00:00.000' AS DateTime), N'hinh200.jpg', 500, 10)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (201, N'Bảng nội quy phòng cháy chữa cháy', CAST(98000 AS Decimal(18, 0)), N'Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhbh1.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (202, N'Kính mát bảo hộ', CAST(68000 AS Decimal(18, 0)), N'Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhbh2.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (203, N'Đầu báo cháy nhiệt cố định không đế hochiki', CAST(1010000 AS Decimal(18, 0)), N'Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhbh3.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (204, N'mảng xốp bong bóng', CAST(1385000 AS Decimal(18, 0)), N'Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhbh4.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (205, N'Tủ đựng bình chữa cháy 650x550x220mm', CAST(595000 AS Decimal(18, 0)), N'Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhbh5.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (206, N'Bảng tiêu lệnh chữa cháy', CAST(98000 AS Decimal(18, 0)), N'Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhbh6.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (207, N'Bao tay nilong (50 đôi)', CAST(25000 AS Decimal(18, 0)), N' Bao tay nilong

Đặc điểm: để bảo vệ đôi tay bạn khi chế biến thực phẩm, khi sử dụng công cụ dụng cụ, rất tiện lợi dễ xài, an toàn và tiết kiệm

Quy cách: 1 hộp 100 cái', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhbh7.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (208, N'Mũ bảo hộ lao động', CAST(145000 AS Decimal(18, 0)), N' Mũ bảo hộ lao đông

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhbh8.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (209, N'Áo phản quang L1', CAST(85000 AS Decimal(18, 0)), N' Văn phòng phẩm FAST chuyên cung cấp Áo phản quang L1

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhbh9.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (210, N'Áo phản quang L2', CAST(142000 AS Decimal(18, 0)), N' Văn phòng phẩm FAST chuyên cung cấp Áo phản quang

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhbh10.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (211, N'Đèn tín hiệu công trường đế nam châm', CAST(215000 AS Decimal(18, 0)), N' Văn phòng phẩm FAST chuyên cung cấp Đèn tín hiệu công trường đế nam châm

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhbh11.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (212, N'Áo phao cứu sinh', CAST(225000 AS Decimal(18, 0)), N' Văn phòng phẩm FAST chuyên cung cấp Áo Phao Cứu Sinh

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhbh12.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (213, N'Bao tay len bảo hộ', CAST(22000 AS Decimal(18, 0)), N' Văn phòng phẩm FAST chuyên cung cấp Bao tay len bảo hộ

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhbh13.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (214, N'Mảng xếp bong bóng 1m', CAST(15000 AS Decimal(18, 0)), N' ĐVT: cuộn

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhbh14.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (215, N'Ổ khóa YOMAKA cao cấp - 60mm', CAST(285000 AS Decimal(18, 0)), N'Ổ khóa YOMAKA cao cấp - 60mm

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhbh15.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (216, N'Khóa cầu ngang đồng việt tiệp CN974', CAST(2250000 AS Decimal(18, 0)), N'Khóa cầu ngang đồng Việt Tiệp CN974 (05203)

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhbh16.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (217, N'Ổ khóa mã số', CAST(2350000 AS Decimal(18, 0)), N'Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhbh17.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (218, N'Ổ khóa royal cao cấp - chuông báo động', CAST(3250000 AS Decimal(18, 0)), N'Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhbh18.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (219, N'Bình chữa cháy bột BC - 4kg', CAST(3950000 AS Decimal(18, 0)), N'Bình chữa cháy

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhbh19.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (220, N'Găng tay cao su cầu vòng cao cấp', CAST(31000 AS Decimal(18, 0)), N' Găng tay cao su

Đơn vị tính: đôi

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhbh20.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (221, N'ủng cao su', CAST(1500000 AS Decimal(18, 0)), N' Văn phòng phẩm FAST chuyên cung cấp Ủng bảo hộ

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhbh21.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (222, N'Nón bảo hộ hàn quốc cao cấp trắng', CAST(2450000 AS Decimal(18, 0)), N' Văn phòng phẩm FAST chuyên cung cấp Nón bảo hộ Hàn Quốc cao cấp - Trắng 

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhbh22.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (223, N'Mút xốp cách nhiệt tán bạc', CAST(18500000 AS Decimal(18, 0)), N' ĐVT: cuộn

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhbh23.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (224, N'Ổ khóa Howard 5cm chống cắt chìa', CAST(3850000 AS Decimal(18, 0)), N'Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhbh24.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (225, N'Bảng thông báo cấm hút thuốc', CAST(6500000 AS Decimal(18, 0)), N'Bảng thông báo cấm hút thuốc

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhbh25.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (226, N'Bảng thông báo cấm lửa', CAST(6500000 AS Decimal(18, 0)), N'Bảng thông báo cấm lửa 

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhbh1.jpg', 50, 11)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (227, N'Bóng đèn Philip 3U 23W', CAST(65000 AS Decimal(18, 0)), N' Bóng đèn Philip 3U 23W

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdien30.jpg', 50, 12)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (228, N'Đèn bàn KENTOM', CAST(398000 AS Decimal(18, 0)), N' Đèn bàn KENTOM

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng

                                    (Chiết khấu ngoài hóa đơn trừ giấy in)', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdien1.jpg', 50, 12)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (229, N'Bóng đèn trái ớt', CAST(568000 AS Decimal(18, 0)), N' Bóng đèn trái ớt

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng

                                    (Chiết khấu ngoài hóa đơn trừ giấy in)', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdien2.jpg', 50, 12)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (230, N'Ổ cắm điện 6S - 2 mét', CAST(235000 AS Decimal(18, 0)), N' Đèn bàn Deli 3671

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng

                                    (Chiết khấu ngoài hóa đơn trừ giấy in)', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdien3.jpg', 50, 12)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (231, N'Ổ cắm 2 lỗ có công tắc 2,5mm', CAST(123000 AS Decimal(18, 0)), N'Ổ Cắm 2 Lỗ Có Công Tắc 2.5m ', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdien4.jpg', 50, 12)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (232, N'bóng đèn led bulb trụ', CAST(275000 AS Decimal(18, 0)), N' Bóng đèn led bulb trụ 30W Rạng Đông LED TR100N1 30W 

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng

                                    (Chiết khấu ngoài hóa đơn trừ giấy in)', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdien5.jpg', 50, 12)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (233, N'bóng đèn philip LED Ecobright 5W 6500k', CAST(162000 AS Decimal(18, 0)), N' Bóng Đèn Philips LED Classic 2W 2700K E27 P45 - Ánh sáng vàng 

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng

                                    (Chiết khấu ngoài hóa đơn trừ giấy in)', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdien6.jpg', 50, 12)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (236, N'Đèn Tường Philips LED Shellline 31173 10W ', CAST(60000 AS Decimal(18, 0)), N' Bóng đèn Philips LED MyCare 12W 6500K E27 A60 

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng

                                    (Chiết khấu ngoài hóa đơn trừ giấy in)', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdien9.jpg', 50, 12)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (237, N'Bóng đèn led edison trang trí*', CAST(245000 AS Decimal(18, 0)), N'Bóng đèn led edison trang trí', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdien10.jpg', 50, 12)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (238, N'ổ cắm điện lý trung 6 ổ cắm dây dài 3m', CAST(235000 AS Decimal(18, 0)), N'ổ cắm điện lý trung 6 ổ cắm dây dài 3m', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdien11.jpg', 50, 12)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (239, N'đui đèn có công tắc, phích cắm không dây', CAST(144444 AS Decimal(18, 0)), N'đui đèn có công tắc, phích cắm ko dây', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdien12.jpg', 50, 12)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (240, N'Chuông không dây chống nước moli lm-', CAST(1620000 AS Decimal(18, 0)), N'Chuông không dây chống nước moli lm-db2n', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdien13.jpg', 50, 12)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (241, N'Quạt sạc hình mặt heo có đèn có gương', CAST(63000 AS Decimal(18, 0)), N'Quạt sạc hình mặt heo có đèn có gương', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdien14.jpg', 50, 12)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (242, N'Ổ cắm 2 ngả liền dây 3 mét Vinakip', CAST(6080000 AS Decimal(18, 0)), N'Ổ cắm 2 ngả liền dây 3 mét Vinakip', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdien15.jpg', 50, 12)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (243, N'Ổ cắm 2 ngả liền dây 2 mét Vinakip', CAST(1480000 AS Decimal(18, 0)), N'Ổ cắm 2 ngả liền dây 2 mét Vinakip', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdien16.jpg', 50, 12)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (244, N'Phích 3 chấu 15A (2 dẹp thẳng, 1 tròn) - ', CAST(1050 AS Decimal(18, 0)), N'Phích 3 chấu', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdien17.jpg', 50, 12)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (245, N'Đầu chuyển Mini Displayport sang ', CAST(980000 AS Decimal(18, 0)), N'Đầu chuyển Mini Displayport sang HDMI', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdien18.jpg', 50, 12)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (246, N'Ổ cắm điện Lioa 3D3S - 5m', CAST(350000 AS Decimal(18, 0)), N'Công dụng Tiếp xúc tốt.
Bảo vệ quá tải bằng CB.
Mỗi ổ cắm mỗi màu, nhằm nhận diện ổ cắm khi sử dụng rõ ràng hơn.
Ổ đa năng thích hợp với các phích cắm hầu hết trên thế giới.
Đặc Điểm Ổ cắm LIOA kéo dài đa năng kết hợp (Đen) với công suất hoạt động tối đa 2200W Max 10A 250V, bảo vệ quá tải bằng CB kết hợp cùng 3 ổ cắm tiêu chuẩn và 3 ổ cắm đa năng, giúp bạn cung cấp điện cho nhiều thiết bị cùng lúc. Vỏ được làm từ chất liệu nhựa ABS bền đẹp, có khả năng chịu nhiệt cao. Lỗ cắm bằng đồng nguyên chất, tiếp xúc tốt, không lỏng lẻo, không đánh lửa, đảm bảo an toàn tuyệt đối cho người dùng.
Đơn Vị Tính : Cái', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdien19.jpg', 50, 12)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (247, N'Ổ cắm chia 3', CAST(1350000 AS Decimal(18, 0)), N' Ổ cắm chia 3

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng

                                    (Chiết khấu ngoài hóa đơn trừ giấy in)', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdien20.jpg', 50, 12)
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (248, N'Phích chuyển đổi', CAST(3150000 AS Decimal(18, 0)), N' Phích chuyển đổi

Công dụng: chuyển 2 thành 3 chấu

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng

                                    (Chiết khấu ngoài hóa đơn trừ giấy in)', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdien21.jpg', 50, 12)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (249, N'Ổ cắm điện Lioa 6S - 3m', CAST(48000 AS Decimal(18, 0)), N'Công dụng Sản phẩm tiện lợi cho việc sử dụng cùng lúc nhiều thiết bị điện gia dụng.
Đặc Điểm có dây điện dài 3m, được sản xuất với công nghệ EPC duy trì tuổi thọ ổ cắm suốt quá trình sử dụng. Chân phích cắm có chiều dài 4.8mm đảm bảo tiếp điện tốt và không bị biến dạng.
Đơn Vị Tính : Cái', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdien22.jpg', 50, 12)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (250, N'Loa bluetooth đa năng không dây WS - 631', CAST(355000 AS Decimal(18, 0)), N' Hỗ trợ A2DP; AVRCP; tai nghe.
Bluetooth phiên bản: V2.1
Phạm vi làm việc: 10m
Thời gian làm việc: 3~8giờ
Loa Output: 3w
Tần số đáp ứng: 280HZ 16KHz
Pin điện áp / công suất: 450mAh
Pin sạc điện áp: 5V ± 0.5V', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhtb1.jpg', 50, 13)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (251, N'Máy trợ giảng subos w-14a, có thiết bị phát', CAST(1792000 AS Decimal(18, 0)), N'Máy trợ giảng subos w-14a, có thiết bị phát aamply loa ko dây', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhtb2.jpg', 50, 13)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (252, N'Loa karaoke mini kbq1803 kèm mic ', CAST(1470900 AS Decimal(18, 0)), N'Loa karaoke mini kbq1803 kèm mic ko dây', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhtb3.jpg', 50, 13)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (253, N'Mic karaoke không dây đa năng zansong', CAST(1193000 AS Decimal(18, 0)), N'Mic karaoke ko dây đa năng zansong s28', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhtb4.jpg', 50, 13)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (254, N'Mic karaoke không dây shure sh-300g 2 ', CAST(1990000 AS Decimal(18, 0)), N'Mic karaoke ko dây shure sh-300g 2 mic', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhtb5.jpg', 50, 13)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (255, N'Micro karaoke không dây bose 777', CAST(1920000 AS Decimal(18, 0)), N'Micro karaoke ko dây bose 777', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhtb6.jpg', 50, 13)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (256, N'đầu otg borofone bv3 type-c ra usb chính ', CAST(126000 AS Decimal(18, 0)), N'đầu otg borofone bv3 type-c ra usb chính hãng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhtb7.jpg', 50, 13)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (257, N'Cáp sạc từ hít nam châm dây dù 3in1', CAST(177000 AS Decimal(18, 0)), N'Cáp sạc từ hít nam châm dây dù 3in1', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhtb8.jpg', 50, 13)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (258, N'Máy ghi âm bộ nhớ trong 8gb', CAST(928000 AS Decimal(18, 0)), N'Máy ghi âm bộ nhớ trong 8gb', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhtb9.jpg', 50, 13)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (259, N'đầu otg micro ra cổng usb', CAST(31500 AS Decimal(18, 0)), N'đầu otg micro ra cổng usb', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhtb10.jpg', 50, 13)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (260, N'Máy phát hiện súng bắn tốc độ xrs-9880', CAST(840000 AS Decimal(18, 0)), N'Máy phát hiện súng bắn tốc độ xrs-9880', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhtb11.jpg', 50, 13)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (261, N'Thiết bị định vị gps gf-07', CAST(508800 AS Decimal(18, 0)), N'Thiết bị định vị gps gf-07', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhtb12.jpg', 50, 13)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (262, N'Cammera wifi ngoài trời ipw022 6 led ', CAST(1140000 AS Decimal(18, 0)), N' Cammera wifi ngoài trời ipw022 6 led yoosee', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhtb13.jpg', 50, 13)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (263, N'Cam hành trình xe hơi vietmap x11s dual lens', CAST(1437000 AS Decimal(18, 0)), N'Cam hành trình xe hơi vietmap x11s dual lens', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhtb14.jpg', 50, 13)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (264, N'Loa phóng thanh ms-16-004, sd-4s', CAST(480000 AS Decimal(18, 0)), N'Loa phóng thanh ms-16-004, sd-4s', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhtb15.jpg', 50, 13)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (265, N'Loa bluetooth bt-158', CAST(480000 AS Decimal(18, 0)), N'Loa bluetooth bt-158', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhtb16.jpg', 50, 13)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (266, N'Loa bluetooth oneder v5 (loại xịn)', CAST(1020000 AS Decimal(18, 0)), N'Loa bluetooth oneder v5 (loại xịn)', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhtb17.jpg', 50, 13)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (267, N'Loa bluetoth k25', CAST(580000 AS Decimal(18, 0)), N'Loa bluetoth k25
CHÍNH SÁCH ƯU ĐÃI

    Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng
    Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng
    Tổng đơn hàng > 8 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhtb18.jpg', 50, 13)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (268, N'Loa bluetooth jbl lcs-099', CAST(492000 AS Decimal(18, 0)), N'Loa bluetooth jbl lcs-099
CHÍNH SÁCH ƯU ĐÃI

    Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng
    Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng
    Tổng đơn hàng > 8 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhtb19.jpg', 50, 13)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (269, N'Loa bluetooth t18', CAST(440000 AS Decimal(18, 0)), N'Loa bluetooth t18', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhtb20.jpg', 50, 13)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (270, N'Loa bluetooth kimiso kms-225', CAST(540000 AS Decimal(18, 0)), N'Loa bluetooth kimiso kms-225', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhtb21.jpg', 50, 13)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (271, N'Loa bluetooth kimiso km-89', CAST(910000 AS Decimal(18, 0)), N'Loa bluetooth oneder v5 (loại xịn)', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhtb22.jpg', 50, 13)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (272, N'Bút chì màu gỗ - 12 màu', CAST(450000 AS Decimal(18, 0)), N' Văn phòng phẩm FAST chuyên cung cấp Bút chì màu gỗ - 12 màu

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdc1.jpg', 50, 14)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (273, N'Màu nước Thiên Long WACO - 05 (12 màu)', CAST(680000 AS Decimal(18, 0)), N' Văn phòng phẩm FAST chuyên cung cấp Màu nước Thiên Long WACO - 05 (12 màu)

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdc2.jpg', 50, 14)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (274, N'Bút chì khúc', CAST(70000 AS Decimal(18, 0)), N' Văn phòng phẩm FAST chuyên cung cấp Bút chì khúc

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdc3.jpg', 50, 14)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (275, N'Bóp đựng bút', CAST(62000 AS Decimal(18, 0)), N' THÔNG TIN SẢN PHẨM

Bóp đựng bút

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdc4.jpg', 50, 14)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (276, N'Bột nặn Hàn Quốc Donerland 8 màu', CAST(195000 AS Decimal(18, 0)), N' Văn phòng phẩm FAST chuyên cung cấp Bột nặn Hàn Quốc Donerland 8 màu

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdc5.jpg', 50, 14)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (277, N'Bộ Dụng Cụ Deli 9598', CAST(55000 AS Decimal(18, 0)), N'Bộ Dụng Cụ Học Tập Deli G30204 (8 món) 

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdc6.jpg', 50, 14)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (278, N'Bộ Dụng Cụ Học Tập Deli G30204 (8 món)', CAST(109000 AS Decimal(18, 0)), N'Bộ Dụng Cụ Học Tập Deli G30204 (8 món) 

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdc7.jpg', 50, 14)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (279, N'Bộ Sáp Nặn Thiên Long MCT-C01', CAST(66000 AS Decimal(18, 0)), N' Văn phòng phẩm FAST chuyên cung cấp Bộ Sáp Nặn Thiên Long MCT-C01 

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdc8.jpg', 50, 14)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (280, N'Màu Nước Thiên Long WACO C06 (8 Màu)', CAST(45000 AS Decimal(18, 0)), N' Văn phòng phẩm FAST chuyên cung cấp Màu Nước Thiên Long WACO C06 (8 Màu) 

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdc9.jpg', 50, 14)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (281, N'Bộ Dụng Cụ Học Sinh 9609 Deli', CAST(95000 AS Decimal(18, 0)), N' Bộ Dụng Cụ Học Sinh 9609 Deli 

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 8 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdc10.jpg', 50, 14)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (282, N'Hộp Bút Sáp Dầu 36 Màu Deli 72053', CAST(179000 AS Decimal(18, 0)), N' Văn phòng phẩm FAST chuyên cung cấp Bút Sáp Dầu 36 Màu Deli 72053

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdc11.jpg', 50, 14)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (283, N'Bộ Dụng Cụ Eke Hộp Nhựa Chì Kim Deli ', CAST(135000 AS Decimal(18, 0)), N' Bộ Dụng Cụ Eke Hộp Nhựa Chì Kim Deli G30304 (7 món) 

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdc12.jpg', 50, 14)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (284, N'Bộ Dụng Cụ Eke Hộp Nhựa Deli G30404 (8 Món)', CAST(155000 AS Decimal(18, 0)), N' Bộ Dụng Cụ Eke Hộp Nhựa Deli G30404 (8 Món) 

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 8 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdc13.jpg', 50, 14)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (285, N'Bộ Dụng Cụ Học Sinh 9614 Deli', CAST(84000 AS Decimal(18, 0)), N' Bộ Dụng Cụ Học Sinh 9614 Deli

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 8 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdc14.jpg', 50, 14)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (286, N'Bộ dụng cụ thước kẻ compas G30505', CAST(102000 AS Decimal(18, 0)), N' Bộ Dụng Cụ Học Sinh 9614 Deli

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 8 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdc15.jpg', 50, 14)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (287, N'Bộ Thước Eke 30cm Deli 6430', CAST(74000 AS Decimal(18, 0)), N'Bộ Thước Eke 30cm Deli 6430 

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdc16.jpg', 50, 14)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (288, N'Compa Deli 8621', CAST(39000 AS Decimal(18, 0)), N'Compa Deli 8621 

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdc17.jpg', 50, 14)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (289, N'Bộ Dụng Cụ Deli 9597', CAST(46000 AS Decimal(18, 0)), N' Bộ Dụng Cụ Deli 9597  

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdc18.jpg', 50, 14)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (290, N'Compa Sắt Chì Kim - Deli G20302', CAST(83000 AS Decimal(18, 0)), N'Compa Sắt Chì Kim - Deli G20302  

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdc19.jpg', 50, 14)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (291, N'Bộ Dụng Cụ Học Sinh 8 Món - Deli G30001 ', CAST(85000 AS Decimal(18, 0)), N' Bộ Dụng Cụ Học Sinh 8 Món - Deli G30001 - Màu Xanh

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdc20.jpg', 50, 14)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (292, N'Đồ Dùng Học Sinh-Bộ Dụng Cụ Học Sinh 8', CAST(85000 AS Decimal(18, 0)), N' Đồ Dùng Học Sinh-Bộ Dụng Cụ Học Sinh 8 Món - Deli G30001 - Màu Hồng  

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdc21.jpg', 50, 14)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (293, N'Sách tập tô 5000 hình kèm hộp bút', CAST(210000 AS Decimal(18, 0)), N'Sách tập tô 5000 hình kèm hộp bút', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdc22.jpg', 50, 14)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (294, N'Hộp bút lông hình trứng 12 màu cho bé', CAST(210000 AS Decimal(18, 0)), N'Hộp bút lông hình trứng 12 màu cho bé', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhdc23.jpg', 50, 14)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (295, N'Thẻ chấm công 8.5x18 cm', CAST(87000 AS Decimal(18, 0)), N' Văn phòng phẩm FAST chuyên cung cấp thẻ chấm công

Đơn vị tính: Xấp 100 tờ', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhsp1.jpg', 50, 15)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (296, N'Bao thun xuất khẩu nhỏ - 2cm', CAST(42000 AS Decimal(18, 0)), N'Công dụng Phù hợp cho việc đóng gói hàng hóa nhỏ.
Đặc Điểm với ưu điểm là: mềm, độ co giãn tốt, sản phẩm có nhiều cỡ lớn, trung, nhỏ phù hợp cho nhiều mục đích sử dụng khác nhau.
Đơn Vị Tính : Bịch', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhsp2.jpg', 50, 15)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (297, N'Bao thun xuất khẩu lớn - đường kính 4cm', CAST(42000 AS Decimal(18, 0)), N'Công dụng Phù hợp cho việc đóng gói hàng hóa nhỏ.
Đặc Điểm với ưu điểm là: mềm, độ co giãn tốt, sản phẩm có nhiều cỡ lớn, trung, nhỏ phù hợp cho nhiều mục đích sử dụng khác nhau.
Đơn Vị Tính : Bịch', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhsp3.jpg', 50, 15)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (298, N'Sáp đếm tiền', CAST(7000 AS Decimal(18, 0)), N'Công dụng , phù hợp với nhiều nhu cầu sử dụng
Đặc Điểm chất liệu nhựa, gọn nhẹ,
Đơn Vị Tính : Hộp', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhsp4.jpg', 50, 15)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (299, N'Phấn trắng không bụi cao cấp - 100 viên', CAST(45000 AS Decimal(18, 0)), N' Phấn trắng không bụi cao cấp

Hộp 100 viên

Bảo quản:', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhsp5.jpg', 50, 15)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (300, N'Dây rút nhựa 8x400mm', CAST(125000 AS Decimal(18, 0)), N' Bịch: 100 sợi

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhsp6.jpg', 50, 15)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (301, N'Cờ tổ quốc 60x80cm', CAST(45000 AS Decimal(18, 0)), N' Cờ tổ quốc

Kích thước 75x100

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhsp7.jpg', 50, 15)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (302, N'Phấn màu không bụi cao cấp - 100 viên', CAST(52000 AS Decimal(18, 0)), N' Phấn màu không bụi cao cấp

Hộp 100 viên

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhsp8.jpg', 50, 15)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (303, N'Thẻ chìa khóa SureMark 3328', CAST(4000 AS Decimal(18, 0)), N'Thẻ chìa khóa SureMark

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhsp9.jpg', 50, 15)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (304, N'Túi Zipper 4x6cm', CAST(135000 AS Decimal(18, 0)), N'Công dụng Sử dụng để dựng: Hàng hoá, linh kiện điện tử, mỹ phẩm, vất tư y tê, hay làm bịch trà sữa túi đang rất được yêu thích trên thị trường hiện nay.
Đặc Điểm được sản xuất từ nhựa PE, đây là loại nhựa có độ dai, bền rất tốt, đặc biệt kín khí và an toàn với người sử dụng, có nhiều size để lựa chọn phù hợp cho nhu cầu sử dụng mỗi người', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhsp10.jpg', 50, 15)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (305, N'Đèn pin soi tiền giả', CAST(85000 AS Decimal(18, 0)), N'Đèn pin soi tiền giả

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhsp11.jpg', 50, 15)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (306, N'Cân sức khỏe', CAST(355000 AS Decimal(18, 0)), N' Cân sức khỏe

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhsp12.jpg', 50, 15)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (307, N'Búa đóng đinh', CAST(45000 AS Decimal(18, 0)), N'Búa đóng đinh

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhsp13.jpg', 50, 15)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (308, N'Túi xốp 2 quai đen 15cm', CAST(75000 AS Decimal(18, 0)), N'Túi xốp 2 quai đen

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhsp14.jpg', 50, 15)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (309, N'Túi xốp 2 quai trắng 15cm', CAST(75000 AS Decimal(18, 0)), N'Túi xốp 2 quai trắng 15cm', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhsp15.jpg', 50, 15)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (310, N'Băng keo cá nhân - 100 miếng', CAST(85000 AS Decimal(18, 0)), N'Băng keo cá nhân - 50 miếng 

Đơn vị tính: hộp

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhsp16.jpg', 50, 15)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (311, N'Phấn sáp (dùng cho bảo vệ) - 100 viên', CAST(36000 AS Decimal(18, 0)), N' Phấn sáp

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhsp17.jpg', 50, 15)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (312, N'Ống hút', CAST(15000 AS Decimal(18, 0)), N'Ống hút

Đơn vị tính: Bịch

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhsp18.jpg', 50, 15)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (313, N'Nhựa cuồn (nilong bao tập)', CAST(350000 AS Decimal(18, 0)), N' Quy cách: 80cmX25m

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng

                                    (Chiết khấu ngoài hóa đơn trừ giấy in)', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhsp19.jpg', 50, 15)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (314, N'Dây rút nhựa 3x100mm', CAST(35000 AS Decimal(18, 0)), N' Dây rút nhựa 3x100mm

Bịch: 100 sợi

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng

                                    (Chiết khấu ngoài hóa đơn trừ giấy in)', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhsp20.jpg', 50, 15)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (315, N'Dây rút nhựa 10x600mm', CAST(35000 AS Decimal(18, 0)), N' Dây rút nhựa 3x100mm

Bịch: 100 sợi

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng

                                    (Chiết khấu ngoài hóa đơn trừ giấy in)', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhsp20.jpg', 50, 15)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaBan], [MoTa], [NgayCapNhat], [AnhBia], [SoLuongTon], [MaChuDe]) VALUES (316, N'Dây rút nhựa 10x650mm', CAST(35000 AS Decimal(18, 0)), N' Dây rút nhựa 3x100mm

Bịch: 100 sợi

Bảo quản:

                      Nhiệt độ: 10 ~ 55º C.

                      Độ ẩm: 55 ~ 95% RH.

                      Tránh xa nguồn nhiệt, dầu mỡ.

Chính sách ưu đãi: Tổng đơn hàng > 1 triệu: Chiết khấu 5% + Quà tặng

                                 Tổng đơn hàng > 5 triệu: Chiết khấu 7% + Quà tặng

                                 Tổng đơn hàng > 10 triệu: Chiết khấu 10% + Quà tặng

                                    (Chiết khấu ngoài hóa đơn trừ giấy in)', CAST(N'2020-05-07 00:00:00.000' AS DateTime), N'hinhsp20.jpg', 50, 15)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonHang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonHang]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_SanPham]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_KhachHang]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_ChuDe] FOREIGN KEY([MaChuDe])
REFERENCES [dbo].[ChuDe] ([MaChuDe])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_ChuDe]
GO
USE [master]
GO
ALTER DATABASE [VanPhongPham] SET  READ_WRITE 
GO
