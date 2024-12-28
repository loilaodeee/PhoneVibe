-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th12 25, 2024 lúc 01:16 PM
-- Phiên bản máy phục vụ: 8.3.0
-- Phiên bản PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `doanchuyennganh`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

DROP TABLE IF EXISTS `bills`;
CREATE TABLE IF NOT EXISTS `bills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Seri` varchar(50) DEFAULT NULL,
  `OrderdetailsID` int DEFAULT NULL,
  `TotalAmount` decimal(10,2) NOT NULL,
  `BillDate` date DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `OrderdetailsID` (`OrderdetailsID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `bills`
--

INSERT INTO `bills` (`id`, `Seri`, `OrderdetailsID`, `TotalAmount`, `BillDate`, `Status`) VALUES
(35, 'BILL_1734330792.0531_958646', 40, 28990000.00, '2024-12-16', 'Đã thanh toán'),
(36, 'BILL_1734334203.1475_765835', 41, 10990000.00, '2024-12-16', 'Đã thanh toán'),
(38, 'BILL_1734525291.6059_808669', 43, 28990000.00, '2024-12-18', 'Đã thanh toán'),
(39, 'BILL_1734526557.9007_358986', 44, 57980000.00, '2024-12-18', 'Đã thanh toán'),
(40, 'BILL_1734527148.8877_763239', 45, 3290000.00, '2024-12-18', 'Đã thanh toán'),
(41, 'BILL_1734528120.901_404294', 46, 19280000.00, '2024-12-18', 'Đã thanh toán'),
(42, 'BILL_1734528120.901_404294', 47, 19280000.00, '2024-12-18', 'Đã thanh toán');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

DROP TABLE IF EXISTS `brands`;
CREATE TABLE IF NOT EXISTS `brands` (
  `id` int NOT NULL AUTO_INCREMENT,
  `BrandName` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `BrandName`) VALUES
(6, 'Samsung'),
(7, 'Apple'),
(8, 'Xiaomi'),
(9, 'Oppo'),
(10, 'Vivo'),
(11, 'Realme');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

DROP TABLE IF EXISTS `carts`;
CREATE TABLE IF NOT EXISTS `carts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `ProductID` int NOT NULL,
  `Quantity` text,
  PRIMARY KEY (`id`),
  KEY `CustomerID` (`CustomerID`),
  KEY `ProductID` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `CustomerID`, `ProductID`, `Quantity`) VALUES
(78, 23, 37, '1'),
(80, 22, 41, '1'),
(81, 22, 29, '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `CategoryName`) VALUES
(4, 'Điện thoại'),
(5, 'Máy tính bảng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `colors`
--

DROP TABLE IF EXISTS `colors`;
CREATE TABLE IF NOT EXISTS `colors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ColorName` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `colors`
--

INSERT INTO `colors` (`id`, `ColorName`) VALUES
(3, 'Đen'),
(4, 'Vàng'),
(5, 'Trắng'),
(6, 'Xanh'),
(7, 'Xanh ngọc'),
(8, 'Hồng'),
(9, 'Xám'),
(10, 'Tím'),
(11, 'Xanh lá');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
CREATE TABLE IF NOT EXISTS `orderdetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `OrderID` int DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `Quantity` int NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `TotalAmount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ProductID` (`ProductID`),
  KEY `OrderID` (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `orderdetails`
--

INSERT INTO `orderdetails` (`id`, `OrderID`, `ProductID`, `Quantity`, `Price`, `TotalAmount`) VALUES
(40, 44, 27, 1, 28990000.00, 28990000.00),
(41, 45, 30, 1, 10990000.00, 10990000.00),
(43, 47, 27, 1, 28990000.00, 28990000.00),
(44, 48, 27, 2, 28990000.00, 57980000.00),
(45, 49, 33, 1, 3290000.00, 3290000.00),
(46, 50, 20, 1, 5990000.00, 5990000.00),
(47, 50, 26, 1, 13290000.00, 13290000.00);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `ShippingAddress` varchar(255) DEFAULT NULL,
  `OrderDate` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CustomerID` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `CustomerID`, `Status`, `ShippingAddress`, `OrderDate`) VALUES
(44, 22, 'Đang vận chuyển', '2581/125a, huỳnh tấn phát', '2024-12-16 06:33:12'),
(45, 22, 'Đã hủy', '2581/125a, huỳnh tấn phát', '2024-12-16 07:30:03'),
(47, 23, 'Đang xử lý', 'Quận 5', '2024-12-18 12:34:51'),
(48, 23, 'Đang xử lý', 'Quận 5', '2024-12-18 12:55:57'),
(49, 23, 'Đang xử lý', 'Quận 5', '2024-12-18 13:05:48'),
(50, 22, 'Đang xử lý', '2581/125a, huỳnh tấn phát', '2024-12-18 13:22:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Image` varchar(200) NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `Description` text,
  `Price` decimal(10,2) NOT NULL,
  `BrandID` int DEFAULT NULL,
  `CategoryID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `BrandID` (`BrandID`),
  KEY `CategoryID` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `Image`, `ProductName`, `Description`, `Price`, `BrandID`, `CategoryID`) VALUES
(20, '../../../img/product_20/674fecbf923f4-samsungA54xanh.png', 'Samsung Galaxy A54 4G 8GB/128GB ', '- Màn hình: Super AMOLED, 6.4 inch, Full HD+ (2340 x 1080 pixels), tần số quét 120Hz.\r\n- Chipset: Exynos 1380, 8 nhân, tốc độ lên đến 2.6GHz.\r\n- RAM: 8GB, giúp chạy mượt mà các ứng dụng và đa nhiệm.\r\n- Bộ nhớ trong: 128GB, hỗ trợ thẻ nhớ microSD mở rộng lên đến 1TB.\r\n- Camera sau: 50MP (chính) + 12MP (siêu rộng) + 5MP (macro) + 5MP (depth) với tính năng quay video 4K.\r\n- Camera trước: 32MP, chụp ảnh sắc nét cho selfie.\r\n- Pin: 5000mAh, hỗ trợ sạc nhanh 25W.\r\n- Hệ điều hành: Android 13, giao diện One UI 5.1.\r\n- Kết nối: 4G, Wi-Fi 6, Bluetooth 5.3, USB Type-C, jack tai nghe 3.5mm.\r\n- Kháng nước, kháng bụi: IP67.\r\n- Màu sắc: Xanh, Đen, Trắng, Tím.\r\n- Cảm biến: Vân tay dưới màn hình, cảm biến ánh sáng, gia tốc, con quay hồi chuyển.', 5990000.00, 6, 4),
(21, '../../../img/product_21/674fefdf06aee-samsungA25.jpg', 'Samsung Galaxy A25 4G 8GB/128GB ', '- Màn hình: PLS LCD, 6.6 inch, Full HD+ (2408 x 1080 pixels), tần số quét 90Hz.\r\n- Chipset: MediaTek Helio G99, 8 nhân, tốc độ tối đa 2.2GHz.\r\n- RAM: 8GB, giúp xử lý mượt mà các tác vụ và chơi game nhẹ.\r\n- Bộ nhớ trong: 128GB, hỗ trợ thẻ nhớ microSD mở rộng lên đến 1TB.\r\n- Camera sau: 50MP (chính) + 5MP (siêu rộng) + 2MP (depth) với tính năng quay video Full HD.\r\n- Camera trước: 13MP, chụp ảnh sắc nét cho selfie.\r\n- Pin: 5000mAh, hỗ trợ sạc nhanh 25W.\r\n- Hệ điều hành: Android 13, giao diện One UI 5.1.\r\n- Kết nối: 4G, Wi-Fi 5, Bluetooth 5.2, USB Type-C, jack tai nghe 3.5mm.\r\n- Kháng nước, kháng bụi: IP67.\r\n- Màu sắc: Xám, Trắng, Xanh, Tím.\r\n- Cảm biến: Vân tay bên cạnh, cảm biến ánh sáng, gia tốc, con quay hồi chuyển.', 6490000.00, 6, 4),
(22, '../../../img/product_22/674ff1e1b9dbe-samsungA15.jpg', 'Samsung Galaxy A35 4G 8GB/128GB ', '- Màn hình: Super AMOLED, 6.4 inch, Full HD+ (2340 x 1080 pixels), tần số quét 120Hz.\r\n- Chipset: Exynos 1380, 8 nhân, tốc độ lên đến 2.6GHz.\r\n- RAM: 8GB, giúp chạy mượt mà các ứng dụng và đa nhiệm.\r\n- Bộ nhớ trong: 128GB, hỗ trợ thẻ nhớ microSD mở rộng lên đến 1TB.\r\n- Camera sau: 50MP (chính) + 12MP (siêu rộng) + 5MP (macro) + 5MP (depth) với tính năng quay video 4K.\r\n- Camera trước: 32MP, chụp ảnh sắc nét cho selfie.\r\n- Pin: 5000mAh, hỗ trợ sạc nhanh 25W.\r\n- Hệ điều hành: Android 13, giao diện One UI 5.1.\r\n- Kết nối: 4G, Wi-Fi 6, Bluetooth 5.3, USB Type-C, jack tai nghe 3.5mm.\r\n- Kháng nước, kháng bụi: IP67.\r\n- Màu sắc: Xanh, Đen, Vàng, Xanh ngọc.\r\n- Cảm biến: Vân tay dưới màn hình, cảm biến ánh sáng, gia tốc, con quay hồi chuyển.', 8790000.00, 6, 4),
(23, '../../../img/product_23/67585af76ffc1-samsungs24ultratim.jpg', 'Samsung Galaxy S24 Ultra 5G 256GB', '- Màn hình: Dynamic AMOLED 2X, 6.8 inch, độ phân giải QHD+ (3088 x 1440), tần số quét 120Hz, hỗ trợ HDR10+.\r\n- Bộ vi xử lý: Exynos 2400 (hoặc Qualcomm Snapdragon 8 Gen 3 tùy thị trường).\r\n- RAM: 12GB.\r\n- Bộ nhớ trong: 256GB (không hỗ trợ thẻ nhớ microSD).\r\n- Camera chính: Hệ thống 4 camera với cảm biến chính 200MP, camera telephoto 10MP (zoom 10x), camera telephoto 12MP (zoom 3x), camera góc rộng 12MP.\r\n- Camera selfie: 12MP.\r\n- Hệ điều hành: Android 14 với giao diện One UI 6.\r\n- Pin: 5000mAh, hỗ trợ sạc nhanh 45W, sạc không dây 15W.\r\n- Kết nối: 5G, Wi-Fi 6E, Bluetooth 5.3, USB Type-C.\r\n- Chống nước và bụi: IP68.\r\n- Màu sắc: Xám, Đen, Tím, Vàng.\r\n- Các tính năng bổ sung: Bút S Pen tích hợp, bảo mật vân tay dưới màn hình, nhận diện khuôn mặt, Samsung DeX.\r\n- Kích thước: 164.7 x 79.1 x 8.9 mm.\r\n- Trọng lượng: 234g.', 24990000.00, 6, 4),
(24, '../../../img/product_24/67585d73389ac-samsungz6hong.png', 'Samsung Galaxy Z Fold 6 5G 256GB', '-Màn hình chính: Dynamic AMOLED 2X, 7.6 inch, độ phân giải QXGA+ (2208 x 1768), tần số quét 120Hz, hỗ trợ HDR10+.\r\n- Màn hình phụ: Super AMOLED, 6.2 inch, độ phân giải HD+ (2316 x 904), tần số quét 120Hz.\r\n- Bộ vi xử lý: Qualcomm Snapdragon 8 Gen 3 cho Galaxy.\r\n- RAM: 12GB.\r\n- Bộ nhớ trong: 256GB (không hỗ trợ thẻ nhớ microSD).\r\n- Camera chính: Hệ thống 3 camera với cảm biến chính 50MP, camera góc rộng 12MP, camera telephoto 10MP (zoom 3x).\r\n- Camera selfie: 10MP (màn hình phụ) và 4MP (màn hình chính khi mở).\r\n- Hệ điều hành: Android 14 với giao diện One UI 6.\r\n- Pin: 4400mAh, hỗ trợ sạc nhanh 25W, sạc không dây 15W.\r\n- Kết nối: 5G, Wi-Fi 6E, Bluetooth 5.3, USB Type-C.\r\n- Chống nước và bụi: IPX8.\r\n- Màu sắc: Xám, Xanh, hồng, Xanh ngọc.\r\n- Các tính năng bổ sung: Hỗ trợ bút S Pen (mua rời), Samsung DeX, màn hình gập, bảo mật vân tay dưới màn hình, nhận diện khuôn mặt.\r\n- Kích thước khi gập: 159.9 x 67.1 x 15.8 mm.\r\n- Kích thước khi mở: 159.9 x 128.1 x 6.3 mm.\r\n- Trọng lượng: 253g.', 41990000.00, 6, 4),
(25, '../../../img/product_25/67585ff9ed5fb-ip16prmden.jpg', 'Iphone 16 Pro Max 8GB 256GB', '- RAM: 8GB.\r\n- Bộ nhớ trong: 256GB (không hỗ trợ thẻ nhớ microSD).\r\n- Camera chính: Hệ thống 3 camera với cảm biến chính 48MP, camera telephoto 12MP (zoom 5x), camera góc siêu rộng 12MP.\r\n- Camera selfie: 12MP, hỗ trợ autofocus.\r\n- Hệ điều hành: iOS 18.\r\n- Pin: Pin lithium-ion, thời gian sử dụng lên đến 29 giờ phát video, hỗ trợ sạc nhanh 20W, sạc không dây MagSafe 15W.\r\n- Kết nối: 5G, Wi-Fi 6E, Bluetooth 5.3, U1 chip (Ultra Wideband).\r\n- Chống nước và bụi: IP68.\r\n- Màu sắc: Đen, Trắng, Vàng, Xám.\r\n- Các tính năng bổ sung: Face ID, Dynamic Island, hỗ trợ 2 SIM (Nano-SIM và eSIM), Apple Pay, MagSafe.\r\n- Bảo mật: Quét vân tay trên màn hình, nhận diện khuôn mặt.\r\n- Kích thước: 159.9 x 76.7 x 8.25 mm.\r\n- Trọng lượng: 221g.', 33690000.00, 7, 4),
(26, '../../../img/product_26/6758607b10f81-ip13trang.jpg', 'Iphone 13 4G 4GB/128GB VN/LLA', '- Màn hình: Super Retina XDR OLED, 6.1 inch, độ phân giải 2532 x 1170, hỗ trợ HDR10 và Dolby Vision.\r\n- Bộ vi xử lý: Chip A15 Bionic với 6 nhân CPU, 4 nhân GPU.\r\n- RAM: 4GB.\r\n- Bộ nhớ trong: 128GB (không hỗ trợ thẻ nhớ microSD).\r\n- Camera chính: Hệ thống 2 camera với cảm biến chính 12MP, camera góc siêu rộng 12MP.\r\n- Camera selfie: 12MP, hỗ trợ chế độ Night Mode và Deep Fusion.\r\n- Hệ điều hành: iOS 15 (có thể nâng cấp lên các phiên bản mới).\r\n- Pin: Pin lithium-ion, thời gian sử dụng lên đến 19 giờ phát video, hỗ trợ sạc nhanh 20W, sạc không dây MagSafe 15W.\r\n- Kết nối: 5G, Wi-Fi 6, Bluetooth 5.0, Ultra Wideband (U1 chip).\r\n- Chống nước và bụi: IP68.\r\n- Màu sắc: Đen, Trắng, Xanh, Hồng.\r\n- Các tính năng bổ sung: Face ID, hỗ trợ 2 SIM (Nano-SIM và eSIM), Apple Pay, MagSafe.\r\n- Bảo mật: Face ID (nhận diện khuôn mặt).\r\n- Kích thước: 146.7 x 71.5 x 7.65 mm.\r\n- Trọng lượng: 174g.', 13290000.00, 7, 4),
(27, '../../../img/product_27/67587e8c4eec5-ip15prmden.jpg', 'Iphone 15 Pro Max 5G 256GB ', '- Màn hình: iPhone 15 Pro Max sở hữu màn hình Super Retina XDR OLED 6.7 inch với độ phân giải 2796 x 1290 pixels, mang đến chất lượng hình ảnh sắc nét và sống động.\r\n- Chipset: Trang bị chip A17 Pro mạnh mẽ, với hiệu suất vượt trội giúp xử lý nhanh chóng các tác vụ nặng và chơi game đồ họa cao cấp.\r\n- Camera: Camera chính 48MP với cảm biến lớn và khả năng zoom quang học 5x cho những bức ảnh sắc nét và chi tiết, camera telephoto và camera siêu rộng 12MP, hỗ trợ quay video 4K, Dolby Vision.\r\n- Bộ nhớ: Phiên bản 256GB cho không gian lưu trữ rộng rãi, cho phép bạn lưu trữ ảnh, video, và ứng dụng mà không lo hết bộ nhớ.\r\n- Pin: Dung lượng pin 4.422 mAh, hỗ trợ sạc nhanh 20W và sạc không dây MagSafe, giúp bạn sử dụng suốt cả ngày dài.\r\n- Hệ điều hành: iOS 17 với các tính năng mới như màn hình khóa tùy chỉnh, Live Activities, và cải tiến bảo mật.\r\n- Thiết kế: Thiết kế sang trọng với khung titan và mặt lưng kính Ceramic Shield, bền bỉ và chống trầy xước.\r\n- Kết nối: Hỗ trợ 5G, Wi-Fi 6, Bluetooth 5.3, và cổng USB-C cải tiến.\r\n- Các tính năng đặc biệt: Tính năng nhận diện khuôn mặt Face ID, cảm biến LiDAR, và khả năng chống nước đạt chuẩn IP68.', 28990000.00, 7, 4),
(28, '../../../img/product_28/67587fac3f7b8-ip16plden.jpg', 'Iphone 16 Plus 5G 128GB VN/LLA', '- Màn hình: iPhone 16 Plus sở hữu màn hình Super Retina XDR OLED 6.7 inch, với độ phân giải cao, mang đến hình ảnh sắc nét, màu sắc sống động và trải nghiệm xem tuyệt vời.\r\n- Chipset: Trang bị chip A16 Bionic mạnh mẽ, giúp nâng cao hiệu suất và tiết kiệm năng lượng, đáp ứng mượt mà mọi tác vụ, từ chơi game đến xử lý đa nhiệm.\r\n- Camera: Camera kép 48MP + 12MP, với khả năng chụp ảnh sắc nét, chi tiết và hỗ trợ quay video 4K. - Các chế độ như Deep Fusion và Night Mode giúp cải thiện chất lượng ảnh trong mọi điều kiện ánh sáng.\r\n- Bộ nhớ: Phiên bản 128GB mang đến không gian lưu trữ đủ cho việc lưu trữ ảnh, video, và các ứng dụng yêu thích.\r\n- Pin: Dung lượng pin lớn, hỗ trợ sạc nhanh và sạc không dây MagSafe, giúp bạn sử dụng suốt cả ngày mà không lo hết pin.\r\n- Hệ điều hành: iOS 17 với các tính năng mới như màn hình khóa tùy chỉnh, Live Activities, và cải tiến bảo mật.\r\n- Thiết kế: Thiết kế tinh tế với khung nhôm và mặt kính Ceramic Shield, vừa bền bỉ vừa sang trọng.\r\n- Kết nối: Hỗ trợ 5G, Wi-Fi 6, Bluetooth 5.3 và cổng USB-C giúp kết nối nhanh chóng và ổn định.\r\n- Các tính năng đặc biệt: Tính năng nhận diện khuôn mặt Face ID, khả năng chống nước đạt chuẩn IP68, giúp bảo vệ điện thoại trong mọi điều kiện.', 25390000.00, 7, 4),
(29, '../../../img/product_29/675880e98ae3a-ip16hong.jpg', 'Iphone 16 5G 4GB/128GB VN/LLA', '- Màn hình: iPhone 16 được trang bị màn hình Super Retina XDR OLED 6.1 inch, mang đến trải nghiệm hình ảnh sắc nét với độ phân giải cao và màu sắc trung thực.\r\n- Chipset: Máy sử dụng chip A16 Bionic, với hiệu suất mạnh mẽ giúp xử lý nhanh chóng các tác vụ, từ chơi game đến chạy các ứng dụng nặng mà không gặp phải độ trễ.\r\n- Camera: Camera kép 48MP + 12MP, cho phép chụp ảnh chi tiết với chất lượng tuyệt vời, hỗ trợ quay video 4K với các tính năng như Deep Fusion và chế độ Night Mode cho ảnh sáng rõ ngay cả trong điều kiện thiếu sáng.\r\n- Bộ nhớ: Phiên bản 128GB cung cấp không gian lưu trữ đủ cho các ứng dụng, ảnh và video, phù hợp với nhu cầu sử dụng hàng ngày.\r\n- Pin: Pin dung lượng lớn hỗ trợ sạc nhanh và sạc không dây MagSafe, giúp bạn sử dụng suốt cả ngày mà không lo hết pin.\r\n- Hệ điều hành: iOS 17, đi kèm với các tính năng mới như Live Activities, màn hình khóa tùy chỉnh và các cải tiến về bảo mật và quyền riêng tư.\r\n- Thiết kế: Thiết kế tinh tế với khung nhôm và mặt kính Ceramic Shield, mang lại sự bền bỉ và vẻ ngoài sang trọng.\r\n- Kết nối: Hỗ trợ 5G, Wi-Fi 6, Bluetooth 5.3, và cổng USB-C, giúp kết nối ổn định và nhanh chóng.\r\n- Các tính năng đặc biệt: Tính năng nhận diện khuôn mặt Face ID, cảm biến LiDAR và khả năng chống nước chuẩn IP68, bảo vệ iPhone khỏi các tác động từ môi trường bên ngoài.', 22090000.00, 7, 4),
(30, '../../../img/product_30/6758823d9c7a2-rminode13prtrang.jpg', 'Xiaomi Redmi Note 13 Pro+ 5G 8GB/256GB', '- Màn hình: Xiaomi Redmi Note 13 Pro+ sở hữu màn hình AMOLED 6.67 inch, độ phân giải FHD+ (2712 x 1220 pixels), mang đến hình ảnh sắc nét, màu sắc sống động và độ sáng cao, phù hợp cho mọi nhu cầu giải trí và làm việc.\r\n- Chipset: Máy trang bị vi xử lý MediaTek Dimensity 7200-Ultra 8 nhân, kết hợp với GPU Mali-G610, giúp xử lý mượt mà các tác vụ nặng như chơi game đồ họa cao, đa nhiệm và duyệt web.\r\n- Camera: Camera chính 200MP, camera siêu rộng 8MP và camera macro 2MP, mang đến khả năng chụp ảnh sắc nét và chi tiết ở mọi góc độ. Camera chính hỗ trợ quay video 4K và có nhiều chế độ chụp thú vị như chân dung, phong cảnh và ban đêm.\r\n- Bộ nhớ: Phiên bản 8GB RAM và 256GB bộ nhớ trong, cung cấp không gian lưu trữ rộng rãi cho các ứng dụng, game, ảnh và video, đồng thời giúp máy chạy mượt mà khi đa nhiệm.\r\n- Pin: Dung lượng pin 5000mAh, hỗ trợ sạc nhanh 120W, giúp sạc đầy nhanh chóng chỉ trong ít phút, cung cấp thời gian sử dụng lâu dài cho người dùng.\r\n- Hệ điều hành: Xiaomi Redmi Note 13 Pro+ chạy trên MIUI 15 dựa trên Android 13, mang đến giao diện dễ sử dụng và các tính năng tùy chỉnh đa dạng.\r\n- Thiết kế: Thiết kế hiện đại với mặt lưng kính bóng bẩy và khung nhôm, giúp điện thoại vừa bền bỉ vừa sang trọng. Các góc bo tròn tạo cảm giác cầm nắm thoải mái.\r\n- Kết nối: Hỗ trợ 5G, Wi-Fi 6, Bluetooth 5.3, và NFC, mang lại kết nối nhanh chóng và ổn định.\r\n- Các tính năng đặc biệt: Cảm biến vân tay trong màn hình, nhận diện khuôn mặt, khả năng chống nước chuẩn IP53 và loa stereo cho trải nghiệm âm thanh sống động.', 10990000.00, 8, 4),
(31, '../../../img/product_31/6758843a4df83-rm14cxanh.jpg', 'Xiaomi Redmi 14C 4G 4GB/128GB', '- Màn hình: Xiaomi Redmi 14C sở hữu màn hình IPS LCD 6.71 inch, độ phân giải HD+ (1650 x 720 pixels), mang đến không gian hiển thị rộng rãi và hình ảnh rõ nét cho việc giải trí và làm việc hàng ngày.\r\n- Chipset: Máy được trang bị vi xử lý MediaTek Helio G85, kết hợp với GPU Mali-G52, giúp xử lý các tác vụ cơ bản và chơi game nhẹ mượt mà, đồng thời tiết kiệm năng lượng hiệu quả.\r\n- Camera: Camera chính 50MP với cảm biến lớn giúp chụp ảnh rõ nét và chi tiết trong nhiều điều kiện ánh sáng, cùng với camera phụ 2MP hỗ trợ chụp ảnh xoá phông, mang lại những bức ảnh chân dung đẹp mắt.\r\n- Bộ nhớ: Phiên bản 4GB RAM và 128GB bộ nhớ trong cho phép bạn lưu trữ nhiều ứng dụng, ảnh và video, đồng thời đảm bảo khả năng đa nhiệm mượt mà.\r\n- Pin: Dung lượng pin 5000mAh, hỗ trợ sạc nhanh 18W, giúp bạn sử dụng máy suốt cả ngày mà không lo hết pin.\r\n- Hệ điều hành: Xiaomi Redmi 14C chạy trên MIUI 14 dựa trên Android 13, mang lại giao diện trực quan và các tính năng hữu ích như chế độ tối, bảo mật nâng cao.\r\n- Thiết kế: Thiết kế trẻ trung, mặt lưng bóng bẩy với các màu sắc nổi bật, khung nhựa chắc chắn, dễ cầm nắm và sử dụng.\r\n- Kết nối: Hỗ trợ 4G, Wi-Fi, Bluetooth 5.1 và cổng USB-C, giúp kết nối nhanh chóng và ổn định.\r\n- Các tính năng đặc biệt: Cảm biến vân tay ở mặt lưng, nhận diện khuôn mặt, jack cắm tai nghe 3.5mm và khả năng chống nước chuẩn IP53, giúp bảo vệ điện thoại trong các tình huống mưa nhẹ hoặc bụi bẩn.', 2990000.00, 8, 4),
(32, '../../../img/product_32/6758858229fee-rminote11xanh.png', 'Xiaomi Redmi Note 11 Pro 5G 8GB/128GB ', '- Màn hình: Xiaomi Redmi Note 11 Pro 5G trang bị màn hình AMOLED 6.67 inch, độ phân giải FHD+ (2400 x 1080 pixels), mang đến hình ảnh sắc nét, màu sắc sống động, và độ sáng cao, hỗ trợ trải nghiệm xem tuyệt vời, đặc biệt trong các điều kiện ánh sáng mạnh.\r\n- Chipset: Máy sử dụng vi xử lý Qualcomm Snapdragon 695 5G, giúp xử lý mượt mà các tác vụ hàng ngày và chơi game đồ họa tầm trung, đồng thời hỗ trợ kết nối mạng 5G tốc độ cao.\r\n- Camera: Camera chính 108MP với cảm biến lớn, hỗ trợ chụp ảnh chi tiết và sắc nét. Bên cạnh đó, máy còn có camera siêu rộng 8MP và camera macro 2MP, giúp bạn dễ dàng chụp ảnh phong cảnh, cận cảnh và những bức ảnh với góc rộng.\r\n- Bộ nhớ: Phiên bản 8GB RAM và 128GB bộ nhớ trong, cung cấp không gian lưu trữ lớn cho ảnh, video và ứng dụng, đồng thời đảm bảo hiệu suất đa nhiệm mượt mà.\r\n- Pin: Dung lượng pin 5000mAh, hỗ trợ sạc nhanh 67W, giúp bạn sạc đầy nhanh chóng chỉ trong ít phút và sử dụng lâu dài mà không lo hết pin.\r\n- Hệ điều hành: Xiaomi Redmi Note 11 Pro 5G chạy trên MIUI 13 dựa trên Android 11, mang đến giao diện thân thiện và các tính năng cải tiến về bảo mật, hiệu suất và khả năng tùy chỉnh.\r\n- Thiết kế: Thiết kế hiện đại với mặt lưng kính bóng bẩy và khung nhựa, giúp máy có vẻ ngoài sang trọng, dễ cầm nắm và sử dụng.\r\n- Kết nối: Hỗ trợ 5G, Wi-Fi 6, Bluetooth 5.1, NFC, và cổng USB-C, giúp kết nối nhanh chóng và ổn định.\r\n- Các tính năng đặc biệt: Cảm biến vân tay trong nút nguồn, nhận diện khuôn mặt, khả năng chống nước chuẩn IP53, và loa stereo giúp mang lại trải nghiệm âm thanh chất lượng cao.', 8190000.00, 8, 4),
(33, '../../../img/product_33/6758870eca894-rmi12cxanh.jpg', 'Xiaomi Redmi 12C 4G 4GB/64GB', '- Màn hình: Xiaomi Redmi 12C sở hữu màn hình LCD 6.71 inch với độ phân giải HD+ (1650 x 720 pixels), mang đến không gian hiển thị rộng rãi và hình ảnh rõ nét cho nhu cầu giải trí và làm việc cơ bản.\r\n- Chipset: Máy được trang bị vi xử lý MediaTek Helio G85, giúp xử lý các tác vụ cơ bản, chơi game nhẹ và duyệt web mượt mà, đồng thời tiết kiệm năng lượng hiệu quả.\r\n- Camera: Camera chính 50MP với cảm biến lớn cho phép chụp ảnh rõ nét và chi tiết, cùng với camera phụ 2MP hỗ trợ chụp ảnh xoá phông, mang lại những bức ảnh chân dung đẹp mắt.\r\n- Bộ nhớ: Phiên bản 4GB RAM và 64GB bộ nhớ trong giúp bạn lưu trữ ảnh, video, ứng dụng và các dữ liệu cá nhân. Máy cũng hỗ trợ thẻ nhớ microSD mở rộng, giúp tăng không gian lưu trữ khi cần thiết.\r\n- Pin: Dung lượng pin 5000mAh, giúp bạn sử dụng máy cả ngày mà không lo hết pin. Máy hỗ trợ sạc nhanh 10W, giúp tiết kiệm thời gian khi sạc.\r\n- Hệ điều hành: Xiaomi Redmi 12C chạy trên MIUI 13 dựa trên Android 12, mang đến giao diện trực quan và các tính năng hữu ích, bao gồm chế độ tối, các công cụ bảo mật và quyền riêng tư.\r\n- Thiết kế: Thiết kế trẻ trung, mặt lưng nhựa mịn màng với các màu sắc nổi bật, tạo cảm giác cầm nắm dễ chịu và bền bỉ.\r\n- Kết nối: Hỗ trợ 4G, Wi-Fi, Bluetooth 5.1 và cổng USB-C, giúp kết nối ổn định và nhanh chóng.\r\n- Các tính năng đặc biệt: Cảm biến vân tay ở mặt lưng, nhận diện khuôn mặt, jack cắm tai nghe 3.5mm, và khả năng chống nước chuẩn IP52, giúp bảo vệ điện thoại khỏi mưa nhẹ và bụi bẩn.', 3290000.00, 8, 4),
(34, '../../../img/product_34/67588821c293f-rmi13cxanhla.jpg', 'Xiaomi Redmi 13C 4G 6GB/128GB', '- Màn hình: Xiaomi Redmi 13C trang bị màn hình LCD 6.71 inch với độ phân giải HD+ (1650 x 720 pixels), mang lại không gian hiển thị rộng rãi, hình ảnh rõ nét và màu sắc sống động cho các nhu cầu giải trí và làm việc cơ bản.\r\n- Chipset: Vi xử lý MediaTek Helio G85, kết hợp với GPU Mali-G52, giúp máy xử lý các tác vụ hàng ngày, chơi game nhẹ và đa nhiệm mượt mà, đồng thời tiết kiệm năng lượng hiệu quả.\r\n- Camera: Camera chính 50MP giúp bạn chụp ảnh sắc nét và chi tiết, cùng với camera phụ 2MP hỗ trợ chụp ảnh xoá phông, mang đến những bức ảnh chân dung đẹp mắt và camera macro 2MP cho ảnh cận cảnh.\r\n- Bộ nhớ: Phiên bản 6GB RAM và 128GB bộ nhớ trong cung cấp không gian lưu trữ đủ cho các ứng dụng, ảnh, video và game yêu thích. Máy còn hỗ trợ thẻ nhớ microSD mở rộng giúp tăng không gian lưu trữ khi cần thiết.\r\n- Pin: Dung lượng pin 5000mAh, cho thời gian sử dụng dài lâu và hỗ trợ sạc nhanh 18W, giúp bạn tiết kiệm thời gian sạc đầy.\r\n- Hệ điều hành: Xiaomi Redmi 13C chạy MIUI 14 dựa trên Android 13, mang đến giao diện thân thiện và nhiều tính năng hữu ích như chế độ tối, bảo mật tốt hơn và khả năng tùy chỉnh cao.\r\n- Thiết kế: Thiết kế trẻ trung với mặt lưng nhựa bền bỉ và các màu sắc nổi bật, khung máy chắc chắn, dễ cầm nắm và sử dụng.\r\n- Kết nối: Hỗ trợ 4G, Wi-Fi, Bluetooth 5.1, và cổng USB-C, mang lại khả năng kết nối ổn định và nhanh chóng.\r\n- Các tính năng đặc biệt: Cảm biến vân tay ở mặt lưng, nhận diện khuôn mặt, jack cắm tai nghe 3.5mm, và khả năng chống nước chuẩn IP53 giúp bảo vệ máy trong điều kiện mưa nhẹ và bụi bẩn.', 6790000.00, 8, 4),
(35, '../../../img/product_35/6759141e0c120-opa3xanhla.webp', 'OPPO A3 5G 6GB/128GB FULL HD', '- Màn hình: Màn hình 6.2 inch, độ phân giải Full HD+ (1080 x 2280 pixels), tỉ lệ màn hình 19:9, sử dụng công nghệ LTPS IPS LCD.\r\n- Vi xử lý: Chipset MediaTek Helio P60, 8 nhân, tốc độ lên tới 2.0 GHz, hỗ trợ AI.\r\n- RAM: 6GB, cho phép đa nhiệm mượt mà, chạy nhiều ứng dụng cùng lúc mà không bị lag.\r\n- Bộ nhớ trong: 128GB, có thể mở rộng qua thẻ nhớ microSD lên tới 256GB.\r\n- Camera sau: Camera kép 16MP + 2MP, hỗ trợ AI, chụp ảnh sắc nét, xóa phông chuyên nghiệp.\r\n- Camera trước: 8MP, hỗ trợ AI Beautification, chụp selfie đẹp tự nhiên.\r\n- Hệ điều hành: ColorOS 5.0, dựa trên Android 8.1 (có thể cập nhật lên phiên bản mới).\r\n- Pin: Pin 3400mAh, hỗ trợ sạc nhanh VOOC, cho thời gian sử dụng lâu dài.\r\n- Mạng: Hỗ trợ 4G LTE, Wi-Fi, Bluetooth 4.2.\r\n- Cảm biến: Cảm biến vân tay (sau), nhận diện khuôn mặt.\r\n- Thiết kế: Mặt lưng nhựa giả kính, màu sắc gradient sang trọng, kiểu dáng thời trang, màn hình tràn viền.\r\n- Kết nối: USB Type-C, jack cắm tai nghe 3.5mm.\r\n- Tính năng đặc biệt: Hỗ trợ AI, nhận diện khuôn mặt nhanh chóng, tối ưu hóa hiệu suất với AI.', 4690000.00, 9, 4),
(36, '../../../img/product_36/6759158b8ad8d-opa18den.jpg', 'OPPO A18 4G 4GB/64GB FULL HD ', '- Màn hình: Màn hình 6.56 inch, độ phân giải HD+ (1612 x 720 pixels), tỉ lệ màn hình 20:9, công nghệ IPS LCD.\r\n- Vi xử lý: Chipset MediaTek Helio G35, 8 nhân, tốc độ lên tới 2.3 GHz, hiệu năng ổn định cho các tác vụ cơ bản.\r\n- RAM: 4GB, giúp đa nhiệm tốt và xử lý mượt mà các ứng dụng thông thường.\r\n- Bộ nhớ trong: 64GB, có thể mở rộng qua thẻ nhớ microSD lên tới 256GB.\r\n- Camera sau: Camera kép 13MP (chính) + 2MP (macro), chụp ảnh sắc nét, hỗ trợ chụp ảnh macro chi tiết.\r\n- Camera trước: 5MP, chụp selfie rõ nét, hỗ trợ làm đẹp tự động.\r\n- Hệ điều hành: ColorOS 12.1, dựa trên Android 12.\r\n- Pin: Pin 5000mAh, thời gian sử dụng dài, hỗ trợ sạc nhanh 18W.\r\n- Mạng: Hỗ trợ 4G LTE, Wi-Fi, Bluetooth 5.0.\r\n- Cảm biến: Cảm biến vân tay (bên hông), nhận diện khuôn mặt.\r\n- Thiết kế: Mặt lưng nhựa, kiểu dáng thanh lịch, màu sắc gradient thời trang, màn hình giọt nước.\r\n- Kết nối: USB Type-C, jack cắm tai nghe 3.5mm.\r\n- Tính năng đặc biệt: AI Beauty, chế độ tiết kiệm năng lượng, hỗ trợ nhiều ứng dụng và game nhẹ.', 2890000.00, 9, 4),
(37, '../../../img/product_37/67591ddbaef68-vivoy17sxanh.jpg', 'Vivo Y17s 4G 4GB/128GB FULL HD+', '- Màn hình: Màn hình 6.56 inch, độ phân giải HD+ (1612 x 720 pixels), tỉ lệ màn hình 20:9, công nghệ IPS LCD, hiển thị hình ảnh sắc nét, màu sắc sống động.\r\n- Vi xử lý: Chipset MediaTek Helio G85, 8 nhân, tốc độ tối đa 2.0 GHz, hiệu suất ổn định cho các tác vụ hàng ngày và chơi game nhẹ.\r\n- RAM: 4GB, giúp thao tác mượt mà và dễ dàng chuyển đổi giữa các ứng dụng.\r\n- Bộ nhớ trong: 128GB, có thể mở rộng qua thẻ nhớ microSD lên tới 1TB.\r\n- Camera sau: Camera kép 50MP (chính) + 2MP (xóa phông), cho phép chụp ảnh sắc nét, rõ ràng và khả năng xóa phông đẹp.\r\n- Camera trước: 8MP, hỗ trợ làm đẹp AI, chụp selfie rõ nét và tự nhiên.\r\n- Hệ điều hành: Funtouch OS 13, dựa trên Android 13.\r\n- Pin: Pin 5000mAh, thời gian sử dụng lâu dài, hỗ trợ sạc nhanh 18W.\r\n- Mạng: Hỗ trợ 4G LTE, Wi-Fi, Bluetooth 5.0.\r\n- Cảm biến: Cảm biến vân tay (bên hông), nhận diện khuôn mặt.\r\n- Thiết kế: Mặt lưng nhựa với hiệu ứng gradient, kiểu dáng thanh lịch, màn hình giọt nước.\r\n- Kết nối: USB Type-C, jack cắm tai nghe 3.5mm.\r\n- Tính năng đặc biệt: Chế độ bảo vệ mắt, AI Beauty cho ảnh selfie đẹp tự nhiên, tối ưu hóa hiệu suất với Funtouch OS.', 3490000.00, 10, 4),
(38, '../../../img/product_38/67591fc2d0f68-reamec55den.jpg', 'Realme C55 6GB/128GB FULL HD', '- Màn hình: Màn hình 6.72 inch, độ phân giải Full HD+ (2400 x 1080 pixels), tỉ lệ màn hình 20:9, công nghệ IPS LCD, mang lại hình ảnh sắc nét và màu sắc sống động.\r\n- Vi xử lý: Chipset MediaTek Helio G88, 8 nhân, tốc độ tối đa 2.0 GHz, xử lý mượt mà các tác vụ hàng ngày và chơi game nhẹ.\r\n- RAM: 6GB, đảm bảo đa nhiệm hiệu quả, xử lý các ứng dụng và trò chơi mượt mà.\r\n- Bộ nhớ trong: 128GB, có thể mở rộng qua thẻ nhớ microSD lên tới 1TB.\r\n- Camera sau: Camera kép 64MP (chính) + 2MP (xóa phông), hỗ trợ chụp ảnh chi tiết, sắc nét với khả năng xóa phông đẹp.\r\n- Camera trước: 8MP, hỗ trợ chụp selfie rõ nét, làm đẹp AI tự động.\r\n- Hệ điều hành: Realme UI 4.0, dựa trên Android 13.\r\n- Pin: Pin 5000mAh, cho thời gian sử dụng lâu dài, hỗ trợ sạc nhanh 33W.\r\n- Mạng: Hỗ trợ 4G LTE, Wi-Fi, Bluetooth 5.0.\r\n- Cảm biến: Cảm biến vân tay (bên hông), nhận diện khuôn mặt.\r\n- Thiết kế: Mặt lưng nhựa với thiết kế bóng bẩy, màu sắc gradient đẹp mắt, màn hình \"viền mỏng\" hiện đại.\r\n- Kết nối: USB Type-C, jack cắm tai nghe 3.5mm.\r\nTính năng đặc biệt: Chế độ siêu tiết kiệm pin, tối ưu hóa hiệu suất, AI Beauty cho ảnh selfie tự nhiên, tính năng mở rộng RAM (Dynamic RAM).', 3490000.00, 11, 4),
(40, '../../../img/product_40/6759c9106b1ae-sstaba9.jpg', 'Máy tính bảng Samsung Galaxy Tab A9 Wifi 64GB', '- Màn hình: 10.5 inch, độ phân giải WUXGA (1920 x 1200), công nghệ TFT, mang đến hình ảnh sắc nét và màu sắc sống động.\r\n- Hệ điều hành: Android 13, giao diện One UI 5.1, trải nghiệm mượt mà và nhiều tính năng hữu ích.\r\n- Vi xử lý: Chipset MediaTek Helio G99, xử lý nhanh chóng các tác vụ hàng ngày và chơi game nhẹ nhàng.\r\n- RAM: 4GB, giúp đa nhiệm mượt mà và mở nhiều ứng dụng cùng lúc mà không bị giật lag.\r\n- Bộ nhớ trong: 64GB, hỗ trợ lưu trữ dữ liệu, hình ảnh và video. Có thể mở rộng với thẻ nhớ microSD lên tới 1TB.\r\n- Camera chính: 8MP, chụp ảnh sắc nét, hỗ trợ quay video Full HD.\r\n- Camera trước: 5MP, hỗ trợ video call và chụp ảnh selfie chất lượng.\r\n- Pin: 8,000mAh, cho thời gian sử dụng lâu dài, có hỗ trợ sạc nhanh 15W.\r\n- Kết nối: Wifi 5, Bluetooth 5.2, hỗ trợ kết nối ổn định với các thiết bị khác.\r\n- Âm thanh: Hệ thống loa kép Dolby Atmos, âm thanh sống động, rõ ràng.\r\n- Thiết kế: Mỏng nhẹ, với độ dày chỉ 6.9mm, trọng lượng 366g, dễ dàng cầm nắm và mang theo.\r\n- Màu sắc: Các tùy chọn màu sắc sang trọng, như đen và bạc.\r\n- Cổng kết nối: USB-C, jack tai nghe 3.5mm.\r\n- Tính năng khác: Hỗ trợ Samsung Knox bảo mật, chế độ trẻ em giúp kiểm soát nội dung cho trẻ nhỏ.', 2990000.00, 6, 5),
(41, '../../../img/product_41/6759ce10d1c8b-sstabs9.jpg', 'Máy tính bảng Samsung Galaxy Tab S9 FE Wifi 128GB', '- Màn hình: 10.9 inch, độ phân giải 2560 x 1600, công nghệ TFT, mang lại hình ảnh sắc nét, màu sắc tươi sáng và sống động.\r\n- Hệ điều hành: Android 13, giao diện One UI 5.1, cung cấp trải nghiệm người dùng mượt mà với nhiều tính năng tiện ích.\r\n- Vi xử lý: Qualcomm Snapdragon 778G, hiệu năng mạnh mẽ, hỗ trợ chơi game, xử lý đa nhiệm nhanh chóng.\r\n- RAM: 6GB, giúp trải nghiệm đa nhiệm mượt mà, dễ dàng chuyển đổi giữa các ứng dụng mà không bị giật lag.\r\n- Bộ nhớ trong: 128GB, dung lượng lớn để lưu trữ ảnh, video, ứng dụng và tài liệu. Có thể mở rộng với thẻ nhớ microSD lên tới 1TB.\r\n- Camera chính: 8MP, chụp ảnh sắc nét và hỗ trợ quay video Full HD chất lượng cao.\r\n- Camera trước: 12MP, camera góc rộng, hỗ trợ video call và chụp ảnh selfie chất lượng cao.\r\n- Pin: 8,000mAh, giúp sử dụng liên tục trong nhiều giờ, hỗ trợ sạc nhanh 45W.\r\n- Kết nối: Wifi 6, Bluetooth 5.3, cho kết nối nhanh và ổn định.\r\n- Âm thanh: Hệ thống loa kép với Dolby Atmos, âm thanh vòm sống động, phù hợp với nhu cầu giải trí và xem phim.\r\n- Thiết kế: Mỏng nhẹ, chỉ 6.5mm, trọng lượng 405g, dễ dàng mang theo khi di chuyển.\r\n- Màu sắc: Các tùy chọn màu sắc đẹp mắt như xám, bạc và xanh dương.\r\n- Cổng kết nối: USB-C, jack tai nghe 3.5mm.\r\n- Tính năng khác: Hỗ trợ bút S Pen (bán riêng), Samsung DeX để chuyển đổi trải nghiệm máy tính bàn, bảo mật với Samsung Knox.', 8890000.00, 6, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_colors`
--

DROP TABLE IF EXISTS `product_colors`;
CREATE TABLE IF NOT EXISTS `product_colors` (
  `ProductID` int NOT NULL,
  `ColorID` int NOT NULL,
  `Image` varchar(200) NOT NULL,
  PRIMARY KEY (`ProductID`,`ColorID`),
  KEY `ColorID` (`ColorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `product_colors`
--

INSERT INTO `product_colors` (`ProductID`, `ColorID`, `Image`) VALUES
(20, 3, '../../../img/product_20/674fecbf8ee77-samsungA54den.png'),
(20, 4, '../../../img/product_20/674fecbf905ba-samsungA54.jpg'),
(20, 6, '../../../img/product_20/674fecbf923f4-samsungA54xanh.png'),
(20, 7, '../../../img/product_20/674fecbf93c61-samsungA54xanhngoc.png'),
(21, 3, '../../../img/product_21/674fefdf06aee-samsungA25.jpg'),
(21, 4, '../../../img/product_21/674fefdf08586-samsungA25vang.jpg'),
(21, 6, '../../../img/product_21/674fefdf09686-samsungA15.jpg'),
(21, 7, '../../../img/product_21/674fefdf0a2ea-samsungA25xanh.jpg'),
(22, 3, '../../../img/product_22/674ff1e1b74b6-samsungA25.jpg'),
(22, 4, '../../../img/product_22/674ff1e1b8f7d-samsungA25vang.jpg'),
(22, 6, '../../../img/product_22/674ff1e1b9dbe-samsungA15.jpg'),
(22, 7, '../../../img/product_22/674ff1e1bb05d-samsungA25xanh.jpg'),
(23, 3, '../../../img/product_23/67585af773030-samsungs24ultraden.jpg'),
(23, 4, '../../../img/product_23/67585af77418f-samsungs24ultravang.jpg'),
(23, 9, '../../../img/product_23/67585af771d82-samsungs24ultraxam.jpg'),
(23, 10, '../../../img/product_23/67585af76ffc1-samsungs24ultratim.jpg'),
(24, 6, '../../../img/product_24/67585d73355f1-samsungz6xanh.png'),
(24, 7, '../../../img/product_24/67585d7337cd7-samsungz6xanhngoc.png'),
(24, 8, '../../../img/product_24/67585d73389ac-samsungz6hong.png'),
(24, 9, '../../../img/product_24/67585d7336b21-samsungz6xam.png'),
(25, 3, '../../../img/product_25/67585ff9ed5fb-ip16prmden.jpg'),
(25, 4, '../../../img/product_25/67585ff9f0d1c-ip16prmvang.jpg'),
(25, 5, '../../../img/product_25/67585ff9efc7b-ip16prmtrang.jpg'),
(25, 9, '../../../img/product_25/67585ff9eeb66-ip16prmxam.jpg'),
(26, 3, '../../../img/product_26/6758607b0e6c2-ip13den.jpg'),
(26, 5, '../../../img/product_26/6758607b10f81-ip13trang.jpg'),
(26, 6, '../../../img/product_26/6758607b122a6-ip13xanh.png'),
(26, 8, '../../../img/product_26/6758607b0ff12-ip13hong.jpg'),
(27, 3, '../../../img/product_27/67587e8c4eec5-ip15prmden.jpg'),
(27, 4, '../../../img/product_27/67587e8c521d0-ip15prmvang.jpg'),
(27, 5, '../../../img/product_27/67587e8c5061a-ip15prmtrang.jpg'),
(27, 6, '../../../img/product_27/67587e8c5129a-ip15prmxanh.jpg'),
(28, 3, '../../../img/product_28/67587fac3f7b8-ip16plden.jpg'),
(28, 5, '../../../img/product_28/67587fac40e89-ip16pltrang.jpg'),
(28, 6, '../../../img/product_28/67587fac418b5-ip16plxanh.jpg'),
(28, 8, '../../../img/product_28/67587fac4257f-ip16plhong.jpg'),
(29, 3, '../../../img/product_29/675880e9888ba-ip16den.jpg'),
(29, 5, '../../../img/product_29/675880e989ec3-ip16trang.jpg'),
(29, 6, '../../../img/product_29/675880e98bc93-ip16xanh.jpg'),
(29, 8, '../../../img/product_29/675880e98ae3a-ip16hong.jpg'),
(30, 3, '../../../img/product_30/6758823d99806-rminode13prden.jpg'),
(30, 5, '../../../img/product_30/6758823d9c7a2-rminode13prtrang.jpg'),
(30, 6, '../../../img/product_30/6758823d9b4c4-rminode13prxanhla.jpg'),
(30, 10, '../../../img/product_30/6758823d9a866-rminode13prtim.jpg'),
(31, 3, '../../../img/product_31/6758843a4cd37-rmi14cden.jpg'),
(31, 4, '../../../img/product_31/6758843a4fa02-rmi14cvang.jpg'),
(31, 6, '../../../img/product_31/6758843a4df83-rm14cxanh.jpg'),
(31, 10, '../../../img/product_31/6758843a4eabd-rm14ctim.jpg'),
(32, 3, '../../../img/product_32/6758858226e21-rminote11den.png'),
(32, 5, '../../../img/product_32/6758858227fa2-rminote11trang.png'),
(32, 6, '../../../img/product_32/6758858229fee-rminote11xanh.png'),
(32, 9, '../../../img/product_32/6758858228e6d-rminote11xam.png'),
(33, 3, '../../../img/product_33/6758870ec865c-rmi12cxam.jpg'),
(33, 6, '../../../img/product_33/6758870eca894-rmi12cxanh.jpg'),
(33, 9, '../../../img/product_33/6758870ec9ab8-rmi12cden.jpg'),
(33, 11, '../../../img/product_33/6758870ecb8f4-rmi12cxanhla.jpg'),
(34, 3, '../../../img/product_34/67588821bfc3d-rmi13cden.jpg'),
(34, 6, '../../../img/product_34/67588821c1e1f-rmi13cxanh.jpg'),
(34, 10, '../../../img/product_34/67588821c0f00-rmi13ctim.png'),
(34, 11, '../../../img/product_34/67588821c293f-rmi13cxanhla.jpg'),
(35, 3, '../../../img/product_35/6759141e0a229-opa3den.jpg'),
(35, 5, '../../../img/product_35/6759141e0ccdd-opa3tim.jpg'),
(35, 10, '../../../img/product_35/6759141e0b7e9-opa3tim.jpg'),
(35, 11, '../../../img/product_35/6759141e0c120-opa3xanhla.webp'),
(36, 3, '../../../img/product_36/6759158b8ad8d-opa18den.jpg'),
(36, 5, '../../../img/product_36/6759158b8c10a-opa18trang.jpg'),
(36, 6, '../../../img/product_36/6759158b8e72f-opa18xanh.png'),
(36, 9, '../../../img/product_36/6759158b8cdc6-opa18xam.webp'),
(37, 4, '../../../img/product_37/67591ddbadf8c-vivoy17svang.png'),
(37, 6, '../../../img/product_37/67591ddbaef68-vivoy17sxanh.jpg'),
(37, 9, '../../../img/product_37/67591ddbabb20-vivoy17sxam.jpg'),
(37, 10, '../../../img/product_37/67591ddbacf33-vivoy17stim.jpg'),
(38, 3, '../../../img/product_38/67591fc2d0f68-reamec55den.jpg'),
(38, 4, '../../../img/product_38/67591fc2d256b-reamec55vang.jpg'),
(38, 6, '../../../img/product_38/67591fc2d3733-reamec55xanh.jpg'),
(38, 11, '../../../img/product_38/67591fc2d4d47-reamec55xanhla.jpg'),
(41, 3, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `RoleName`) VALUES
(5, 'Admin'),
(6, 'Manager'),
(7, 'Employee'),
(8, 'Customer');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `FullName` varchar(100) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `RoleID` int DEFAULT NULL,
  `user_status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `RoleID` (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `Username`, `Password`, `Code`, `FullName`, `Email`, `Phone`, `Address`, `RoleID`, `user_status`) VALUES
(6, 'loilade', '$2y$10$yidQQI7gTvJ2PSY86.U2MeeDXsM6TvDv99wAB80I7Agw.HTXhKlua', NULL, 'Lợi Nguyễn', 'nguyenloi1442@gmail.com', '098712343', 'STU', 5, 'Đang hoạt động'),
(22, 'thanhloi123', '$2y$10$RUGAs1xmRsSJbM0XyTpPp.Zxn0.ATRajicGU0uNS/ATj5n9B/bkjK', NULL, 'Nguyễn Thành Lợi', 'loinguyen1442003@gmail.com', '0334153621', '2581/125a, huỳnh tấn phát', 8, 'Đang hoạt động'),
(23, 'thaoyeudau', '$2y$10$3okej1iyKm/3WL.SzVgz.eek8hSI0FwIFzkVUaZcIarBOYko4UCYG', NULL, 'Hà Thanh Thả', 'thao@gmail.com', '0987653', 'Quận 9', 6, 'Ngưng hoạt động'),
(24, 'diemhuynh', '$2y$10$5CqSxVs1vLP/xyIipVvw8OsNurd4mbQTqO7l4H8lNEtJuKNCz3pfW', NULL, 'Diễm Huỳnh', 'diemhuynh@gmail.com', '0943552776', 'Cao Lỗ', 5, 'Đang hoạt động'),
(25, 'ductri', '$2y$10$xLFwS/JA2yKDqUdJV016WeV7ZtuqVeje1XmBTxtaweZsmj.fVNBja', NULL, 'Trí đức', 'ductri@gmail.com', '0984624242', 'HTP', 8, 'Đang hoạt động'),
(28, 'long', '$2y$10$yZ0w.BSQHf8eD.ygP1bmle8Aajz.BJFO8eGDh.2zP/j0XbZ5DkJcm', NULL, 'Long Dương', 'long@gmail.com', '2134243', '245HTP', 7, 'Ngưng hoạt động');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warranty_accepts`
--

DROP TABLE IF EXISTS `warranty_accepts`;
CREATE TABLE IF NOT EXISTS `warranty_accepts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `BillSeri` varchar(50) NOT NULL,
  `WarrantyDate` date NOT NULL,
  `Description` text,
  `Reason` text,
  `Status` varchar(50) DEFAULT NULL,
  `BillID` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `BillID` (`BillID`),
  KEY `CustomerID` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `warranty_accepts`
--

INSERT INTO `warranty_accepts` (`id`, `BillSeri`, `WarrantyDate`, `Description`, `Reason`, `Status`, `BillID`, `CustomerID`) VALUES
(40, 'BILL_1734527148.8877_763239', '2024-12-18', 'Điện thoại tôi bị trúng gió', 'trúng gió', 'Đã xử lý', 40, 23);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`OrderdetailsID`) REFERENCES `orderdetails` (`id`);

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`BrandID`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `product_colors`
--
ALTER TABLE `product_colors`
  ADD CONSTRAINT `product_colors_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_colors_ibfk_2` FOREIGN KEY (`ColorID`) REFERENCES `colors` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `roles` (`id`);

--
-- Các ràng buộc cho bảng `warranty_accepts`
--
ALTER TABLE `warranty_accepts`
  ADD CONSTRAINT `warranty_accepts_ibfk_1` FOREIGN KEY (`BillID`) REFERENCES `bills` (`id`),
  ADD CONSTRAINT `warranty_accepts_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
