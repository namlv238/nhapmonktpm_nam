-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 02, 2020 lúc 05:29 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nhapmonkithuatpm`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giohang`
--

CREATE TABLE `giohang` (
  `id` varchar(50) NOT NULL,
  `dsgiohang` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `mahoadon` int(11) NOT NULL,
  `tendangnhap` varchar(50) NOT NULL,
  `ngayhoadon` date DEFAULT NULL,
  `ghichu` varchar(255) DEFAULT NULL,
  `trangthai` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`mahoadon`, `tendangnhap`, `ngayhoadon`, `ghichu`, `trangthai`) VALUES
(6, 'letan', '2020-02-28', 'Họ tên :     diachi:    so dien thoai : ', 'Đã Chuyển'),
(9, 'letan', '2020-02-28', 'Họ tên :     diachi:    so dien thoai : ', 'Đã Chuyển'),
(15, 'letan', '2020-02-28', 'Họ tên : ăd    diachi: đă   so dien thoai : đă', 'Đã Chuyển'),
(16, 'letan', '2020-02-28', 'Họ tên : ăd    diachi: đă   so dien thoai : đă', 'Đã Chuyển'),
(17, 'letan', '2020-02-28', 'Họ tên : dă    diachi: dă   so dien thoai : đă', 'Đã Chuyển'),
(20, 'haiduong', '2020-03-01', 'Họ tên :     diachi:    so dien thoai : ', 'Đã Chuyển'),
(22, 'letan', '2020-03-01', 'Họ tên :     diachi:    so dien thoai : ', 'Đã Chuyển'),
(23, 'letan', '2020-03-01', 'Họ tên :     diachi:    so dien thoai : ', 'Chưa Chuyển'),
(24, 'letan', '2020-03-01', 'Họ tên :     diachi:    so dien thoai : ', 'Chưa Chuyển'),
(25, 'letan', '2020-03-01', 'Họ tên :     diachi:    so dien thoai : ', 'Chưa Chuyển'),
(26, 'haiduong', '2020-03-01', 'Họ tên :     diachi:    so dien thoai : ', 'Chưa Chuyển'),
(27, 'letan', '2020-03-01', 'Họ tên :     diachi:    so dien thoai : ', 'Chưa Chuyển');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadonchitiet`
--

CREATE TABLE `hoadonchitiet` (
  `mahoadonchitiet` int(11) NOT NULL,
  `mahoadon` int(11) NOT NULL,
  `masanpham` varchar(50) NOT NULL,
  `soluong` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `hoadonchitiet`
--

INSERT INTO `hoadonchitiet` (`mahoadonchitiet`, `mahoadon`, `masanpham`, `soluong`) VALUES
(37, 20, 'sanpham1', 1),
(38, 20, 'sanpham', 1),
(41, 22, 'sanpham12', 1),
(42, 22, 'sanpham1', 1),
(43, 23, 'sanpham12', 1),
(44, 23, 'sanpham1', 1),
(45, 24, 'tandz', 1),
(46, 24, 'sanpham12', 1),
(47, 25, 'sanpham1', 1),
(48, 25, 'sanpham12', 1),
(49, 26, 'sanpham1', 1),
(50, 26, 'sanpham', 1),
(51, 27, 'sanpham12', 2),
(52, 27, 'sanpham1', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `maloaisanpham` varchar(50) NOT NULL,
  `tenloaisanpham` varchar(50) NOT NULL,
  `maloaisanoham` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `loaisanpham`
--

INSERT INTO `loaisanpham` (`maloaisanpham`, `tenloaisanpham`, `maloaisanoham`) VALUES
('l1', 'loai1', ''),
('l2', 'loai2', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `masanpham` varchar(50) NOT NULL,
  `tensanpham` varchar(50) NOT NULL,
  `giasanpham` int(11) NOT NULL,
  `maloaisanpham` varchar(50) NOT NULL,
  `hinhanh` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`masanpham`, `tensanpham`, `giasanpham`, `maloaisanpham`, `hinhanh`) VALUES
('ma3', 'sp3', 123, 'l1', '2019-06-03 (12).png'),
('sanpham', 'keo', 12321, 'l2', '2019-06-03 (14).png'),
('sanpham1', 'keo', 12321, 'l1', '2019-06-03 (14).png'),
('sanpham12', 'keo xxx', 12321, 'l2', '2019-06-03 (11).png'),
('sanphamss', 'keo', 12321, 'l1', '2019-06-03 (10).png'),
('tandz', 'dzvl', 6996, 'l1', '2019-06-03 (2).png'),
('đuongz', 'đưa', 0, 'l2', '2019-06-03 (10).png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taikhoan`
--

CREATE TABLE `taikhoan` (
  `tendangnhap` varchar(50) NOT NULL,
  `matkhau` varchar(50) NOT NULL,
  `hoten` varchar(50) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `diachi` varchar(255) DEFAULT NULL,
  `gioitinh` varchar(5) DEFAULT NULL,
  `chucnang` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `taikhoan`
--

INSERT INTO `taikhoan` (`tendangnhap`, `matkhau`, `hoten`, `Email`, `diachi`, `gioitinh`, `chucnang`) VALUES
('haiduong', '123456', 'dương hải đường', 'aa@gmail.com', 'hưng yên', 'nam', 'admin'),
('lenam1', 'ăd', 'dưa', NULL, 'dădaw', 'Nu', 'admin'),
('letan', '123', 'anh', 'mrduongno2@gmail.com', 'dasd', 'Nam', 'kh'),
('ưdwadawd', 'ădawd', 'ădwadaw', NULL, 'đă', 'Nu', 'admin');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `giohang`
--
ALTER TABLE `giohang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`mahoadon`),
  ADD KEY `fk_hoadon_taikhoan` (`tendangnhap`);

--
-- Chỉ mục cho bảng `hoadonchitiet`
--
ALTER TABLE `hoadonchitiet`
  ADD PRIMARY KEY (`mahoadonchitiet`),
  ADD KEY `fk_hoadonchitiet_hoadon` (`mahoadon`),
  ADD KEY `fk_hoadonchitiet_sanpham` (`masanpham`);

--
-- Chỉ mục cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`maloaisanpham`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`masanpham`),
  ADD KEY `fk_loaisanpham_sanpham` (`maloaisanpham`);

--
-- Chỉ mục cho bảng `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`tendangnhap`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `mahoadon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `hoadonchitiet`
--
ALTER TABLE `hoadonchitiet`
  MODIFY `mahoadonchitiet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `fk_hoadon_taikhoan` FOREIGN KEY (`tendangnhap`) REFERENCES `taikhoan` (`tendangnhap`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `hoadonchitiet`
--
ALTER TABLE `hoadonchitiet`
  ADD CONSTRAINT `fk_hoadonchitiet_hoadon` FOREIGN KEY (`mahoadon`) REFERENCES `hoadon` (`mahoadon`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_hoadonchitiet_sanpham` FOREIGN KEY (`masanpham`) REFERENCES `sanpham` (`masanpham`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `fk_loaisanpham_sanpham` FOREIGN KEY (`maloaisanpham`) REFERENCES `loaisanpham` (`maloaisanpham`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
