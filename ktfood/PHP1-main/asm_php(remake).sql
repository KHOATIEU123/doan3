-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 07, 2021 lúc 08:48 AM
-- Phiên bản máy phục vụ: 10.4.19-MariaDB
-- Phiên bản PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `asm_php1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Trà sữa', '2021-07-07 11:50:15', '2021-11-07 08:07:44'),
(2, 'Món ăn nhẹ', '2021-07-07 11:50:15', '2021-07-22 16:07:29'),
(3, 'Bánh mì', '2021-07-07 11:50:15', '2021-07-22 16:12:25'),
(38, 'Cà phê', '2021-07-13 10:57:52', '2021-07-13 10:57:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` varchar(200) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `fullname`, `phone_number`, `email`, `address`, `note`, `order_date`) VALUES
(143, 'tiêu hải khoa', '0123456789', 'thkhoa2000679@student.ctuet.edu.vn', '68.65.120.213, viet nam', '', '2021-11-07 08:37:06'),
(144, 'trần trung tín', '0123456789', 'DEMO@gmail.com', 'DEMO', 'DEMO', '2021-11-07 08:42:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `price` float NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `id_user`, `num`, `price`, `status`) VALUES
(149, 143, 2, 7, 3, 35000, 'Đã hủy'),
(150, 143, 4, 7, 1, 25000, 'Đã hủy'),
(151, 143, 12, 7, 1, 30000, 'Đã hủy'),
(152, 143, 14, 7, 1, 35000, 'Đã hủy'),
(153, 144, 12, 8, 11, 30000, 'Đã nhận hàng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `price` float NOT NULL,
  `number` float NOT NULL,
  `thumbnail` varchar(500) NOT NULL,
  `content` longtext NOT NULL,
  `id_category` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `title`, `price`, `number`, `thumbnail`, `content`, `id_category`, `created_at`, `updated_at`) VALUES
(1, 'Tivi Samsung 32 inch', 25000, 20, 'uploads/SOCOLAHL.png', '<p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 44px; padding: 0px;\"><span style=\"color: rgb(0, 0, 0);\">Thiết kế AirSlim thanh mảnh, hài hoà Smart Tivi Tivi Samsung 32 inch được mang lên trên mình thiết kế không viền 3 cạnh loại bỏ cảm giác hình ảnh bị giới hạn, chân tivi có dạng hình chữ L đẹp mắt và vững vàng. 
Hình ảnh hiển thị dải màu sáng đạt 100% dải màu tiêu chuẩn với công nghệ màn hình chấm lượng tử Quantum Dot (QLED)
</span><br></p>', 2, '2023-27-11 17:41:08', '2023-27-11 18:41:08'),
(2, 'Tủ lạnh LG Inverter 519 lít Side By Side GR-B256JDS ', 35000, 50, 'uploads/TRASENVANG.png', '<font color=\"#000000\">Thức uống chinh phục những thực khách khó tính! Sự kết hợp độc đáo giữa trà Ô long, hạt sen thơm bùi và củ năng giòn tan. Thêm vào chút sữa sẽ để vị thêm ngọt ngào.</font><br>', 1, '2023-27-11 14:41:08', '2023-27-11 19:41:08'),
(4, 'Máy giặt Aqua 8.8 KG AQW-FR88GT.BK ', 25000, 30, 'uploads/BMTHITNUONG.png', 'Đặc sản của Việt Nam! Bánh mì giòn với nhân thịt nướng, rau thơm và gia vị đậm đà, hòa quyện trong lớp nước sốt tuyệt hảo.', 3, '2021-07-07 17:25:47', '2021-08-15 16:12:51'),
(5, 'Máy nước nóng trực tiếp Casper 4500W EN-45TH11', 35000, 10, 'uploads/MOUSSEDAO.png', '<span style=\"color: rgb(83, 56, 44); font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: justify;\">Một sự kết hợp khéo léo giữa kem và lớp bánh mềm, được phủ lên trên vài lát đào ngon tuyệt.</span><br>', 2, '2023-27-11 10:41:08', '2023-27-11 15:41:08'),
(8, 'Tủ đông đứng Hòa Phát 147 Lít HPF UAH6147', 50000, 10, 'uploads/Trà-sữa-Trân-châu-đen-1.png', '<p><span style=\"color: rgb(0, 0, 0); font-family: \" times=\"\" new=\"\" roman\";=\"\" font-size:=\"\" 20px;=\"\" font-weight:=\"\" 700;=\"\" text-align:=\"\" center;\"=\"\">Trà sữa trân trâu đường đen</span><br></p>', 1, '2023-27-11 8:41:08', '2023-27-11 18:41:01'),
(9, 'Máy lạnh TCL Inverter 1 HP TAC-10CSD/XAB1I', 25000, 46, 'uploads/TRATHANHDAO.png', '<p>Trà sữa Matcha<br></p>', 1, '2021-07-11 16:38:58', '2021-08-15 16:02:52'),
(10, 'Nồi cơm nắp gài Sharp 1.8 lít KS-NR191STV ', 50000, 44, 'uploads/AMERICANO.png', '<p><font color=\"#53382c\">Dành cho những tín đồ cà phê đích thực! Hương vị cà phê truyền thống được phối trộn độc đáo tại Highlands. Cà phê đậm đà pha từ Phin, cho thêm 1 thìa đường, mang đến vị cà phê đậm đà chất Phin.</font><br></p>', 38, '2023-27-11 17:41:05', '2023-27-11 18:42:08'),
(12, 'Nồi chiên không dầu Rapido SMART-7.0M 7 lít ', 30000, 15, 'uploads/Trà-sữa-Trân-châu-đen-1.png', '<p>Nếu Phin Sữa Đá dành cho các bạn đam mê vị đậm đà, thì Bạc Xỉu Đá là một sự lựa chọn nhẹ “đô\" cà phê nhưng vẫn thơm ngon, chất lừ không kém!<br></p>', 38, '2021-07-13 10:20:53', '2021-08-15 16:45:54'),
(13, 'Bếp từ đôi lắp âm Hafele HC-I2712A (536.61.716)', 19000, 20, 'uploads/BANHCHUOI.jpg', '<span style=\"color: rgb(83, 56, 44); font-family: \"Open Sans\", sans-serif; font-size: 15px; text-align: justify;\">Bánh chuối truyền thống, sự kết hợp của 100% chuối tươi và nước cốt dừa Việt Nam.</span><br>', 2, '2023-27-11 7:41:08', '2023-27-11 18:44:08'),
(14, 'Bếp hồng ngoại Delites 853', 35000, 5, 'uploads/MOUSSECACAO.png', '<span style=\"color: rgb(83, 56, 44); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" text-align:=\"\" justify;\"=\"\">Bánh Mousse Ca Cao, là sự kết hợp giữa ca-cao Việt Nam đậm đà cùng kem tươi.</span><br>', 2, '2023-27-11 6:41:08', '2023-27-11 10:41:08'),
(16, 'Robot hút bụi lau nhà Xiaomi Vacuum E10', 20000, 30, 'uploads/BMXIUMAI.png', 'Bánh mì Việt Nam giòn thơm, với nhân thịt viên hấp dẫn, phủ thêm một lớp nước sốt cà chua ngọt, cùng với rau tươi và gia vị đậm đà.', 3, '2021-07-07 17:25:47', '2021-08-15 16:17:55'),
(17, 'Máy hút bụi cầm tay Deerma DX115C', 35000, 10, 'uploads/CARAMELPHOMAI.jpg', 'Ngon khó cưỡng! Bánh phô mai thơm béo được phủ bằng lớp caramel ngọt ngào.', 2, '2021-07-07 18:36:37', '2021-08-15 16:35:55'),
(18, 'Máy rửa chén độc lập Hafele HDW-F60E (538.21.200)', 50000, 10, 'uploads/TRATHANHDAO.png', '<p><span style=\"color: rgb(0, 0, 0); font-size: 1rem;\">Vị trà đậm đà kết hợp cùng những miếng đào thơm ngon mọng nước cùng thạch đào giòn dai. Thêm vào ít sữa để gia tăng vị béo</span><br></p><p><br></p>', 1, '2023-27-11 4:41:08', '2023-27-11 8:41:08'),
(19, 'Xe Đạp Địa Hình MTB XDS Hero 380 27.5 inch Size M', 50000, 46, 'uploads/TRATHACHVAI_1.png', '<p>Một sự kết hợp thú vị giữa trà đen, những quả vải thơm ngon và thạch giòn khó cưỡng, mang đến thức uống tuyệt hảo!<br></p>', 1, '2021-07-11 16:38:58', '2021-08-15 16:03:56'),
(20, 'Xe Đạp Đường Phố City Thống Nhất New 24 24 inch', 50000, 44, 'uploads/TRATHANHDAO (1).png', '<p><span style=\"color: rgb(83, 56, 44); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" text-align:=\"\" justify;\"=\"\">Một sự kết hợp thú vị giữa trà đen, những quả vải thơm ngon và thạch giòn khó cưỡng, mang đến thức uống tuyệt hảo!</span><br></p>', 1, '2023-27-11 2:41:08', '2023-27-11 8:11:08'),
(21, 'Xe Đạp Địa Hình MTB Giant ATX 620 26 inch Size S', 30000, 15, 'uploads/CFD.png', '<p>Dành cho những tín đồ cà phê đích thực! Hương vị cà phê truyền thống được phối trộn độc đáo tại Highlands. Cà phê đậm đà pha hoàn toàn từ Phin, cho thêm 1 thìa đường, một ít đá viên mát lạnh, tạo nên Phin Đen Đá mang vị cà phê đậm đà chất Phin.<br></p>', 38, '2023-27-11 17:41:08', '2023-27-11 18:41:08'),
(26, 'Loa kéo karaoke Nanomax X-2000 1100W ', 35000, 100, 'uploads/TIRAMISU.jpg', '<p>Tiramisu thơm béo, làm từ ca-cao Việt Nam đậm đà, kết hợp với phô mai ít béo, vani và chút rum nhẹ nhàng.<br></p>', 2, '2023-27-11 17:41:08', '2023-27-11 18:41:08'),
(28, 'Bộ loa Sony 5.1 HT-S700RF 1000W', 20000, 90, 'uploads/BMCHALUAXAXIU.png', '<p>Bánh mì Việt Nam giòn thơm với chả lụa và thịt xá xíu thơm ngon, kết hợp cùng rau và gia vị, hòa quyện cùng nước sốt độc đáo.<br></p>', 3, '2023-27-11 17:41:08', '2023-27-11 18:41:08'),
(29, 'Quạt sưởi hồng ngoại Sunhouse SHD7023', 19000, 20, 'uploads/BMGAXE.png', '<p>Bánh mì Việt Nam giòn thơm với nhân gà xé, rau, gia vị hòa quyện cùng nước sốt đặc biệt.<br></p>', 3, '2023-27-11 17:41:08', '2023-27-11 18:41:08'),
(30, 'Máy mài góc Tolsen 79542 760W', 35000, 100, 'uploads/270_crop_PHINDI_Hong_Tra.png', '<p>PhinDi Kem Sữa - Cà phê Phin thế hệ mới với chất Phin êm hơn, lần đầu tiên kết hợp cùng Hồng Trà mang đến hương vị quyện êm, phiên bản giới hạn chỉ trong mùa lễ hội 2020!<br></p>', 38, '2023-27-11 17:41:08', '2023-27-11 18:41:08'),
(31, 'Máy phun xịt rửa áp lực cao Bosch Universal AQT 125 1500W', 35000, 90, 'uploads/270_crop_phindi_kem_sua_new.png', '<p>PhinDi Kem Sữa - Cà phê Phin thế hệ mới với chất Phin êm hơn, kết hợp cùng Kem Sữa béo ngậy mang đến hương vị mới lạ, không thể hấp dẫn hơn!<br></p>', 38, '2023-27-11 17:41:08', '2023-27-11 18:41:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `hoten` varchar(255) CHARACTER SET utf8 NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(28) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id_user`, `hoten`, `username`, `password`, `phone`, `email`) VALUES
(7, 'tieu hai khoa', 'admin', 'khoa', '+84123456789', 'thkhoa2000679@student.ctuet.edu.vn'),
(8, 'tin tran', 'khoa', 'khoakhoa', '0123654789', 'thkhoa2000679@student.ctuet.edu.vn'),
(55, 'khoatieu', 'tin', 'tin', '0321456987', 'thkhoa2000679@student.ctuet.edu.vn'),
(57, 'trungtin', 'khoadeptrai', 'khoakhoakhoa', '0213546879', 'thkhoa2000679@student.ctuet.edu.vn'),
(58, 'khoa', 'tindeptrai', 'tin', '0132465789', 'thkhoa2000679@student.ctuet.edu.vn');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `id_user` (`id_user`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=154;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
