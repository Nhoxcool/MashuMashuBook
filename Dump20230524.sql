-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: mashumashu
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book_detail`
--

DROP TABLE IF EXISTS `book_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_detail` (
  `bookid` int NOT NULL AUTO_INCREMENT,
  `bookname` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `author` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `bookCategory` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bookDetail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `status` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `photo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_detail`
--

LOCK TABLES `book_detail` WRITE;
/*!40000 ALTER TABLE `book_detail` DISABLE KEYS */;
INSERT INTO `book_detail` VALUES (1,'Sách Giáo Khoa Bộ Lớp 12','Bộ Giáo Dục Và Đào Tạo',169400,'Sách giáo khoa','Mã hàng	3300000027517\r\nTên Nhà Cung Cấp	Nhà xuất bản Giáo Dục\r\nTác giả	Bộ Giáo Dục Và Đào Tạo\r\nNXB	Giáo Dục Việt Nam\r\nNăm XB	2023\r\nTrọng lượng (gr)	1982\r\nKích Thước Bao Bì	24 x 17 x 7.5 cm\r\nHình thức	Bìa Mềm\r\n								','Active','SGK12.jpg','admin'),(2,'Sách Giáo Khoa Bộ Lớp 9','Bộ Giáo Dục Và Đào Tạo',136000,'Sách giáo khoa','Mã hàng	3300000027388\r\nCấp Độ/ Lớp	Lớp 9\r\nCấp Học	Cấp 2\r\nNhà Cung Cấp	Nhà xuất bản Giáo Dục\r\nTác giả	Bộ Giáo Dục Và Đào Tạo\r\nNXB	Giáo Dục Việt Nam\r\nNăm XB	2023\r\nNgôn Ngữ	Tiếng Việt\r\nTrọng lượng (gr)	2305\r\nKích Thước Bao Bì	24 x 17 x 6.3 cm\r\nHình thức	Bìa Mềm								\r\n								','Active','SGK9.jpg','admin'),(3,'Sách Giáo Khoa Bộ Lớp 7','Bộ Giáo Dục Và Đào Tạo',170000,'Sách giáo khoa','Mã hàng	3300000027357\r\nCấp Độ/ Lớp	Lớp 7\r\nCấp Học	Cấp 2\r\nNhà Cung Cấp	Nhà xuất bản Giáo Dục\r\nTác giả	Bộ Giáo Dục Và Đào Tạo\r\nNXB	Giáo Dục Việt Nam\r\nNăm XB	2023\r\nNgôn Ngữ	Tiếng Việt\r\nTrọng lượng (gr)	1200\r\nKích Thước Bao Bì	24 x 17 x 3 cm\r\nHình thức	Bìa Mềm							\r\n								','Active','SGK7.jpg','admin'),(4,'Sách Giáo Khoa Bộ Lớp 5','Bộ Giáo Dục Và Đào Tạo',99600,'Sách giáo khoa','\r\nMã hàng	3300000027135\r\nCấp Độ/ Lớp	Lớp 5\r\nCấp Học	Cấp 1\r\nNhà Cung Cấp	Nhà xuất bản Giáo Dục\r\nTác giả	Bộ Giáo Dục Và Đào Tạo\r\nNXB	Giáo Dục Việt Nam\r\nNăm XB	2023\r\nNgôn Ngữ	Tiếng Việt\r\nTrọng lượng (gr)	1500\r\nKích Thước Bao Bì	24 x 17 x 4 cm\r\nHình thức	Bìa Mềm						','Active','SGK5.jpg','admin'),(9,'999 Lá Thư Gửi Cho Chính Mình','Miêu Công Tử',49500,'Sách văn học','Mã hàng	8935325010736\r\nTên Nhà Cung Cấp	AZ Việt Nam\r\nTác giả	Miêu Công Tử\r\nNgười Dịch	Quỳnh Nhi\r\nNXB	Thanh Niên\r\nNăm XB	2023\r\nTrọng lượng (gr)	210\r\nKích Thước Bao Bì	18 x 12.5 x 1.3 cm\r\nSố trang	164\r\nHình thức	Bìa Mềm						','Active','999 Lá Thư Gửi Cho Chính Mình .jpg','admin'),(10,'Nhà Giả Kim (Tái Bản 2020)','Paulo Coelho',61620,'Sách văn học','Mã hàng	8935235226272\r\nTên Nhà Cung Cấp	Nhã Nam\r\nTác giả	Paulo Coelho\r\nNgười Dịch	Lê Chu Cầu\r\nNXB	NXB Hội Nhà Văn\r\nNăm XB	2020\r\nTrọng lượng (gr)	220\r\nKích Thước Bao Bì	20.5 x 13 cm\r\nSố trang	227\r\nHình thức	Bìa Mềm					\r\n								','Active','Nhà Giả Kim (Tái Bản 2020).jpg','admin'),(11,'Cây Cam Ngọt Của Tôi','José Mauro de Vasconcelos',84240,'Sách văn học','Mã hàng	8935235228351\r\nTên Nhà Cung Cấp	Nhã Nam\r\nTác giả	José Mauro de Vasconcelos\r\nNgười Dịch	Nguyễn Bích Lan, Tô Yến Ly\r\nNXB	NXB Hội Nhà Văn\r\nNăm XB	2020\r\nTrọng lượng (gr)	280\r\nKích Thước Bao Bì	20 x 14.5 cm\r\nSố trang	244\r\nHình thức	Bìa Mềm								\r\n								','Active','Cây Cam Ngọt Của Tôi.jpg','admin'),(12,'Chưa Kịp Lớn Đã Trưởng Thành','Tớ Là Mây',63200,'Sách văn học','Mã hàng	9786048862862\r\nNhà Cung Cấp	Công Ty Cổ Phần Time Books\r\nTác giả	Tớ Là Mây\r\nNXB	Dân Trí\r\nNăm XB	2023\r\nNgôn Ngữ	Tiếng Việt\r\nTrọng lượng (gr)	185\r\nKích Thước Bao Bì	17 x 14 x 1.1 cm\r\nSố trang	240\r\nHình thức	Bìa Mềm								\r\n								','Active','Chưa Kịp Lớn Đã Trưởng Thành (Tái Bản 2023).jpg','admin'),(13,'Sách Giáo Khoa Bộ Lớp 12','Bộ Giáo Dục Và Đào Tạo',50000,'Cũ','Đây là sách cũ','Active','SGK12.jpg','nhoxcool2002@gmail.com'),(14,'Nhà Giả Kim (Tái Bản 2020)','Paulo Coelho',30000,'Cũ','Đây là sách cũ','Active','Nhà Giả Kim (Tái Bản 2020).jpg','nhoxcool2002@gmail.com'),(15,'Cây Cam Ngọt Của Tôi','José Mauro de Vasconcelos',30000,'Cũ','Đây là sách cũ','Active','Cây Cam Ngọt Của Tôi.jpg','nhoxcool2002@gmail.com'),(17,'Sách Giáo Khoa Bộ Lớp 9','Bộ Giáo Dục Và Đào Tạo',50000,'Cũ','Đây là sách cũ','Active','SGK9.jpg','nhoxcool2002@gmail.com');
/*!40000 ALTER TABLE `book_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_order`
--

DROP TABLE IF EXISTS `book_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `oder_id` varchar(500) DEFAULT NULL,
  `user_name` varchar(500) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `phone` varchar(500) DEFAULT NULL,
  `book_name` varchar(500) DEFAULT NULL,
  `author` varchar(500) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `payment` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_order`
--

LOCK TABLES `book_order` WRITE;
/*!40000 ALTER TABLE `book_order` DISABLE KEYS */;
INSERT INTO `book_order` VALUES (39,'BOOK-ORD-00515','Trần Đức Tú','nhoxcool2002@gmail.com','315/6 Lê Văn Sĩ Phường 13 Quận 3,3,15,Hồ Chí Minh','0336298584','Sách Giáo Khoa Bộ Lớp 5','Bộ Giáo Dục Và Đào Tạo',99600,'Thanh toán online'),(40,'BOOK-ORD-00732','Trần Đức Tú','nhoxcool2002@gmail.com','315/6 Lê Văn Sĩ Phường 13 Quận 3,3,15,Hồ Chí Minh','0336298584','Chưa Kịp Lớn Đã Trưởng Thành','Tớ Là Mây',61620,'Thanh toán online'),(41,'BOOK-ORD-00585','Trần Đức Tú','nhoxcool2002@gmail.com','315/6 Lê Văn Sĩ Phường 13 Quận 3,3,15,Hồ Chí Minh','0336298584','Chưa Kịp Lớn Đã Trưởng Thành','Tớ Là Mây',61620,'Thanh toán online');
/*!40000 ALTER TABLE `book_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cartid` int NOT NULL AUTO_INCREMENT,
  `bid` int DEFAULT NULL,
  `uid` int DEFAULT NULL,
  `bookName` varchar(500) DEFAULT NULL,
  `author` varchar(500) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `photo` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`cartid`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phno` int DEFAULT NULL,
  `password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `diachi` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `quan` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `city` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `huyen` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'Trần Đức Tú','nhoxcool2002@gmail.com',336298584,'123',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-24 16:54:03
