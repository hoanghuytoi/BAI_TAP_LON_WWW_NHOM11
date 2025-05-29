-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: shopapp
-- ------------------------------------------------------
-- Server version	11.3.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;



DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'T?n danh m?c, vd: D? di?n t?',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (6,'Pin sạc dự phòng'),(7,'Ốp lưng'),(8,'Sạc, cáp');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(100) DEFAULT NULL,
  `phone_number` varchar(10) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `password` varchar(200) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `date_of_birth` datetime(6) DEFAULT NULL,
  `facebook_account_id` int(11) DEFAULT 0,
  `google_account_id` int(11) DEFAULT 0,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Nguyen Tan Loc','0353552767','245 ấp 5','$2a$10$vL3ixSHQf0z8x3EOYYQ1a.UsKVW8YhPZRWHWW1UWbD4dlwa/oQv9C','2024-11-16 03:38:53','2024-11-26 09:26:52',1,'1970-10-25 00:00:00.000000',0,0,1),(3,'Nguyen Tan Loc','0326559994','245 ấp 5','$2a$10$WkBs.V9ICkLvCVzNCajo9O5uESV9/NrtqixI594orcUic0h/kgINO','2024-11-16 10:14:17','2024-11-16 10:14:17',0,'1970-10-25 00:00:00.000000',0,0,1),(18,'Tai khoan admin 1','0123456789','245 ấp 5','$2a$10$vdJUgRzbgm4HHFuRXtbtYejpaHoiKH9DqFHCEUZAGc5Uw5.DlPCI6','2024-11-18 16:14:22','2024-11-18 16:14:22',1,'1970-10-25 00:00:00.000000',0,0,2),(19,'Nguyễn Tấn Lộc','033445566','245 ấp 5','$2a$10$CAKm8.9097aL4Evd8Jynd.7SlKmm8i6hrZHkwDx9NzAaMdlXKoal.','2024-11-20 07:00:32','2024-11-20 07:00:32',1,'1970-10-25 00:00:00.000000',0,0,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `token_type` varchar(50) DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'user'),(2,'admin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;




DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(350) NOT NULL DEFAULT '' COMMENT 'Tên sản phẩm',
  `price` float NOT NULL CHECK (`price` >= 0),
  `thumbnail` varchar(300) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4800 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (4765,'Pin sạc dự phòng Baseus Airpow Fast Charge 20000mAh 20W',440000,'27013701-b862-451e-90ac-d3c00abb7aa6_pin-sac-du-phong-baseus-airpow-fast-charge-20000mah-20w-9.png','This is a test product.','2024-11-20 01:07:57','2024-11-20 01:07:57',6),(4766,'Pin dự phòng Anker Zolo 20000mAh 30W 1A1C tích hợp cáp C, L A1689',760000,'47ed2277-8c39-4112-a743-73d8e5869cc9_pin-sac-du-phong-anker-zolo-a1689-20000mah-30w_4_.png','This is a test product.','2024-11-20 01:12:48','2024-11-20 01:12:48',6),(4767,'Pin sạc dự phòng Anker Powercore 2C1A 30W 20.000mAh A1384',715000,'a9ca6d38-ca72-48ae-9400-8724030ce9c0_group_240_25_.png','This is a test product.','2024-11-20 01:17:24','2024-11-20 01:17:24',6),(4768,'Pin sạc dự phòng không dây Baseus Magnetic Mini Fast Charge Type-C Edition 10000mAh 30W',780000,'994c5268-9a43-4a64-a130-ae0d791e6c11_pin-sac-du-phong-baesus-mini-fast-01.png','This is a test product.','2024-11-20 01:20:04','2024-11-20 01:20:04',6),(4769,'Pin sạc dự phòng Golf 20.000mAh G81-C',320000,'6b9c845f-d506-41ab-a267-b700c5a11963_group_551_14__1.png','This is a test product.','2024-11-20 01:22:54','2024-11-20 01:22:54',6),(4770,'Ốp lưng iPhone 11 Filada trong viền màu',105000,'9ff91c88-3c10-4e93-a001-9b0365e816ea_7_35.png','This is a test product.','2024-11-20 01:26:18','2024-11-20 01:26:18',7),(4771,'Ốp lưng iPhone 13/14 Uniq Hybird Combat',306000,'2794652a-6edb-4363-afa0-12b5c05f3728_30_2_50.png','This is a test product.','2024-11-20 01:29:42','2024-11-20 01:29:42',7),(4772,'Ốp lưng Samsung Galaxy A14 2023 Clear Transparency',59000,'d1caecbd-c0bc-4525-aca8-057180ad3b4c_image_10_2.png','This is a test product.','2024-11-20 01:32:55','2024-11-20 01:32:55',7),(4773,'Ốp lưng Samsung Galaxy S23 Plus Leather Cover',99000,'e27eeb8d-0203-4e7f-a02d-155dbf5f9118_gvfrhyuj900_5__2.png','This is a test product.','2024-11-20 01:34:58','2024-11-20 01:34:58',7),(4774,'Ốp lưng iPhone 16 Pro Max Apple Silicone With Magsafe',1350000,'ce7aaa63-0508-4bd3-825a-de90942b69ad_op-lung-iphone-16-pro-max-apple-silicone-magsafe_5_.png','This is a test product.','2024-11-20 01:37:44','2024-11-20 01:37:44',7),(4775,'Sạc nhanh 20W Apple MHJE3ZA | Chính hãng Apple Việt Nam',490000,'ccc987a3-b334-4a03-97ed-d4d3fd53c9ff_adapter-20w-apple-5_1.png','This is a test product.','2024-11-20 01:47:31','2024-11-20 01:47:31',8),(4776,'Củ sạc nhanh Anker 2 cổng 1C1A/20W A2348',150000,'2af45aad-5ef3-4e01-80ea-6157699d9fab_sac-anker-1c-20w-a2347-a-04.png','This is a test product.','2024-11-20 01:48:52','2024-11-20 01:48:52',8),(4777,'Củ sạc Anker 30W Nano 3 PD Type-C A2147',240000,'bc51106c-b58e-4bb1-9e3d-e56ada3a5b37_a2147-trg_1.png','This is a test product.','2024-11-20 01:51:07','2024-11-20 01:51:07',8),(4778,'Cáp Baseus Crystal Shine USB-A to Lightning 1.2M',90000,'62b6a607-88fa-4e83-9cae-029d1ff4d8d5_5_33_37.png','This is a test product.','2024-11-20 01:53:25','2024-11-20 01:53:25',8),(4779,'Cáp Baseus Crystal Shine Type-C to Lightning 2M',140000,'c6ab11d9-a3f9-42a8-90a8-ea8198ae8980_34_1_18.png','This is a test product.','2024-11-20 01:55:15','2024-11-20 01:55:15',8),(4780,'Củ sạc Apple 2 cổng Type-C 35W MNWP3ZA-A',1355000,'48856fad-74ae-4d8b-aa27-e4dc4b205133_group_10_1__1.png','This is a test product.','2024-11-20 06:27:13','2024-11-20 06:27:13',8),(4781,'Sạc nhanh Ugreen Robot CD361 3 cổng USB-C và USB-A GaN 65W',630000,'eb980bd6-fe0a-4867-83fb-1b6411faf733_cu-sac-nhanh-ugreen-robot-3-cong-usb-c-to-usb-a-gan-65w-11570-2.png','This is a test product.','2024-11-20 06:30:04','2024-11-20 06:30:04',8),(4782,'Cáp Type C - Lightning Apple MM0A3FE/A 1m',540000,'f86f99d0-4ac4-4e74-a30d-91c6085a10bd_cap-type-c-to-lightning-apple-mm0a3fe-a-1m_4.png','This is a test product.','2024-11-20 06:34:10','2024-11-20 06:34:10',8),(4784,'Cáp Anker 322 USB-C to USB-L 0.9M Nylon A81B5H21',215000,'b0cf7d4d-6088-4042-8e8c-6fe547668e12_text_ng_n_7_63.png','This is a test product.','2024-11-20 06:38:25','2024-11-20 06:38:25',8),(4785,'Củ sạc nhanh Samsung 25W không kèm cáp (EP-T2510NBEGWW)',390000,'09ab6a54-76d0-4153-9e3a-17fee09683f7_cu-sac-nhanh-samsung-25w-ep-t2510nbegww-4.png','This is a test product.','2024-11-20 06:40:47','2024-11-20 06:40:47',8),(4786,'Ốp lưng iPhone 15 Pro Max Slimcase Unique with Magsafe',535500,'7ef824dd-6658-4829-95b1-53c3293f8cf6_op-lung-iphone-15-pro-max-slimcase-unique-with-magsafe-trong_3_.png','This is a test product.','2024-11-20 06:43:53','2024-11-20 06:43:53',7),(4787,'Ốp lưng iPhone 16 Pro Max Slimcase Unique 3 Clear',450000,'e7c3ee61-c228-48da-a984-b05c5b37c68b_group_629_12_.png','This is a test product.','2024-11-20 06:46:15','2024-11-20 06:46:15',7),(4789,'Ốp lưng Samsung Galaxy S22 Devilcase Bản Tiêu Chuẩn Viền Camera',288000,'2e50846c-6f37-4fc3-83d8-65e181429887_1_319_2.png','This is a test product.','2024-11-20 06:51:50','2024-11-20 06:51:50',7),(4790,'Ốp lưng iPhone 14 Plus 15 Plus Zagg Hampton',540000,'2b6274be-1a27-43eb-adca-2c4d4d659d6a_328_1_1.png','This is a test product.','2024-11-20 06:54:35','2024-11-20 06:54:35',7),(4791,'Ốp lưng da Samsung Galaxy S24 Ultra chính hãng',693000,'2a47e18a-e972-4e28-9e06-94acfe8c6c11_op-lung-da-samsung-galaxy-s24-ultra-5.png','This is a test product.','2024-11-20 06:57:11','2024-11-20 06:57:11',7),(4792,'Pin sạc dự phòng Anker 633 Magnetic A1641 10.000mAh 20W',990000,'163552de-4ea5-432a-a7b4-c4a251d85710_633_de.png','This is a test product.','2024-11-20 06:59:18','2024-11-20 06:59:18',6),(4794,'Pin sạc dự phòng Energizer 20.000mAh UE20012PQ',690000,'74ade1a8-f587-4ae4-bd2d-20e1972a02a6_90_1.png','This is a test product.','2024-11-20 07:03:52','2024-11-20 07:03:52',6),(4795,'Pin sạc dự phòng Ugreen 25000mAh 145W 2 chiều 2C1A 90597A',1690000,'9b7af06d-e40a-4e84-9d83-d8875f8a4f9c_1_659.png','This is a test product.','2024-11-20 07:05:50','2024-11-20 07:05:50',6),(4798,'Pin sạc dự phòng Energizer 4600mAh /3.6V Li-Ion - UE4600PQ',450000,'a90fb0b6-9404-400f-8b63-f675735a8cf4_group_563_-_2024-10-27t111941.155.png','This is a test product.','2024-11-20 07:10:55','2024-11-20 07:10:55',6);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `image_url` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_images_product_id` (`product_id`),
  CONSTRAINT `fk_product_images_product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (10,4765,'27013701-b862-451e-90ac-d3c00abb7aa6_pin-sac-du-phong-baseus-airpow-fast-charge-20000mah-20w-9.png'),(11,4765,'8ae44efb-9945-4937-a4ad-beb6673d8ca1_pin-sac-du-phong-baseus-airpow-fast-charge-20000mah-20w-7.png'),(12,4765,'7f6ea74d-0964-4e99-8fa1-e01b434717bb_pin-sac-du-phong-baseus-airpow-fast-charge-20000mah-20w-5.png'),(13,4765,'fa320c36-360f-4854-9ded-977dd45802fc_pin-sac-du-phong-baseus-airpow-fast-charge-20000mah-20w-3.png'),(14,4766,'47ed2277-8c39-4112-a743-73d8e5869cc9_pin-sac-du-phong-anker-zolo-a1689-20000mah-30w_4_.png'),(15,4766,'432407f4-347f-4c20-9f4f-0fb34983a4fb_pin-sac-du-phong-anker-zolo-a1689-20000mah-30w_3_.png'),(16,4766,'76926047-eb56-4025-a528-1dfc3d44c321_pin-sac-du-phong-anker-zolo-a1689-20000mah-30w_2_.png'),(18,4766,'6510dfc1-b333-407f-a10f-9bdf61b47446_pin-sac-du-phong-anker-zolo-a1689-20000mah-30w_5_.png'),(19,4767,'a9ca6d38-ca72-48ae-9400-8724030ce9c0_group_240_25_.png'),(20,4767,'afc3e871-7cc9-4327-99f0-b4bb2c9f0fa3_group_240_24_.png'),(21,4767,'dffaf459-6989-4ccd-89f8-bc3ed4e70156_frame_1_13__1_3.png'),(22,4767,'d11c86bc-3c25-4bde-8319-11d677347a8a_frame_1_11__2_3.png'),(23,4768,'994c5268-9a43-4a64-a130-ae0d791e6c11_pin-sac-du-phong-baesus-mini-fast-01.png'),(24,4768,'eb3bdb59-5163-4d80-9fcc-0eb08079f367_pin-sac-du-phong-baesus-mini-fast-04.png'),(25,4768,'ac3fa8a7-f4cd-4bb9-b9f3-ae918263c87c_pin-sac-du-phong-baesus-mini-fast-05.png'),(26,4768,'ecb5085a-3f22-46b9-aa1b-d2305c4c3f21_pin-sac-du-phong-baesus-mini-fast-06.png'),(27,4769,'6b9c845f-d506-41ab-a267-b700c5a11963_group_551_14__1.png'),(28,4769,'6ef8e590-1531-42a5-b678-6c25c03b6649_pin-sac-du-phong-golf-g81-c-20000mah_4_.png'),(29,4769,'e73933f7-326c-475a-bd4d-b1992c0a62b3_pin-sac-du-phong-golf-g81-c-20000mah_2_.png'),(30,4769,'396dcb42-c0e1-41f1-9e63-82c334a288c2_pin-sac-du-phong-golf-g81-c-20000mah_3_.png'),(31,4770,'9ff91c88-3c10-4e93-a001-9b0365e816ea_7_35.png'),(32,4770,'54b143d6-e4b1-414d-8935-1d51fd7b2a06_4_82.png'),(33,4770,'f63a35a0-9a87-4d17-a5a4-024392702531_5_72.png'),(34,4770,'2cb9e859-4841-44c5-a9a0-8da81df78800_6_54.png'),(35,4771,'2794652a-6edb-4363-afa0-12b5c05f3728_30_2_50.png'),(36,4771,'54cafa97-a253-406d-9ab1-fc0798b95d10_24_133.png'),(37,4771,'0b7bf777-f4ae-41a7-bb90-04a33a905d17_26_1_114.png'),(38,4771,'35d683e2-ab31-4373-be90-95ed8e1b4c9c_22_10_3.png'),(39,4772,'d1caecbd-c0bc-4525-aca8-057180ad3b4c_image_10_2.png'),(40,4772,'001d28af-cf1d-4ebd-a247-718f545c1164_image_9_1__1.png'),(41,4772,'65d4a714-5510-41e1-a29b-2317abcc771b_image_9_2.png'),(42,4772,'1cb740ed-24b9-4ce0-8d74-ab435369f393_image_8_2.png'),(43,4773,'e27eeb8d-0203-4e7f-a02d-155dbf5f9118_gvfrhyuj900_5__2.png'),(44,4773,'1e9fa0be-da1f-49d8-ad6b-71b0324262bc_gvfrhyuj900_4__2.png'),(45,4773,'812b6f9d-966b-4e88-9b61-0e48ed2d0544_gvfrhyuj900_3__3.png'),(46,4774,'ce7aaa63-0508-4bd3-825a-de90942b69ad_op-lung-iphone-16-pro-max-apple-silicone-magsafe_5_.png'),(47,4774,'6be04aed-f5b5-4598-83c9-9171d60d7191_op-lung-iphone-16-pro-max-apple-silicone-magsafe_6_.png'),(48,4774,'fe13bded-e9f2-4a47-be81-1047e0c16f00_op-lung-iphone-16-pro-max-apple-silicone-magsafe_4_.png'),(49,4774,'ddd65ae9-ac42-439f-8851-58b602c64765_op-lung-iphone-16-pro-max-apple-silicone-magsafe_2_.png'),(50,4775,'ccc987a3-b334-4a03-97ed-d4d3fd53c9ff_adapter-20w-apple-5_1.png'),(51,4775,'c10177c2-818d-4f3c-8b20-74fa5a2a2f4a_adapter-20w-apple-1_1.png'),(52,4775,'ced5b0e2-d1df-480e-a7c6-1a856fc0ccec_637387863045632122_pk-apple-00720432-3.png'),(53,4775,'e1e7cd28-2860-4cf8-9bec-f411e958c6f4_adapter-20w-apple-5_1_1.png'),(54,4776,'2af45aad-5ef3-4e01-80ea-6157699d9fab_sac-anker-1c-20w-a2347-a-04.png'),(55,4776,'78734fd4-5902-46bf-a2fd-d1573de5279b_sac-anker-1c-20w-a2347-a-05.png'),(56,4776,'23ebbde9-0764-4da5-b23a-deea43c99d1e_sac-anker-1c-20w-a2347-a-02.png'),(57,4776,'76987005-8e68-4166-bd16-19121815cb64_sac-anker-1c-20w-a2347-a-03.png'),(58,4777,'bc51106c-b58e-4bb1-9e3d-e56ada3a5b37_a2147-trg_1.png'),(59,4777,'fa6ba0ac-5379-4f3d-9b52-204ba9ca13f3_a2147-den_1.png'),(60,4777,'ce773a91-4639-439c-9e81-2509899547a0_a2147-la_1.png'),(61,4777,'54974f45-5d08-4189-a41d-a0f6f1209441_a2147-tim_1.png'),(62,4778,'62b6a607-88fa-4e83-9cae-029d1ff4d8d5_5_33_37.png'),(63,4778,'6c0ffada-3c5e-4b52-aeee-5e97365bfb96_2_64_50.png'),(64,4778,'809264ae-2d17-4834-aa21-2de655a40cd4_3_54_40.png'),(65,4778,'56a3cc55-58dd-4c03-9c3d-1d33503b906d_1_69_44.png'),(66,4779,'c6ab11d9-a3f9-42a8-90a8-ea8198ae8980_34_1_18.png'),(67,4779,'3540a9e1-deb3-4b6b-a0c4-ef09bf173792_37_1_15.png'),(68,4779,'d475c9df-1c3c-4384-83f0-80392ac8c7bd_35_1_17.png'),(69,4779,'06cc9c89-2c0e-4d41-b2ac-78b099f0c515_36_1_18.png'),(74,4780,'48856fad-74ae-4d8b-aa27-e4dc4b205133_group_10_1__1.png'),(75,4780,'355e61af-62fa-4d56-bd9e-a34fd3b3eb68_1_75_21.png'),(76,4780,'41be9fd7-55af-4106-816c-ecf6189ef074_group_9_1__2.png'),(77,4780,'0db1a84e-4509-4c9d-9de9-7ca9a92f8223_2_69_14.png'),(78,4780,'95d9f3fc-5b18-4192-b0c7-5734bf63c221_group_8_1__2.png'),(79,4781,'eb980bd6-fe0a-4867-83fb-1b6411faf733_cu-sac-nhanh-ugreen-robot-3-cong-usb-c-to-usb-a-gan-65w-11570-2.png'),(80,4781,'3a55d11e-c215-4b74-afa1-7c0cd24b324e_qu_t_3.png'),(81,4781,'398d1731-b4d3-466a-be17-74991b0f747f_cu-sac-nhanh-ugreen-robot-3-cong-usb-c-to-usb-a-gan-65w-11570-3.png'),(82,4781,'0edf525b-f5c2-4951-9723-96192788788a_cu-sac-nhanh-ugreen-robot-3-cong-usb-c-to-usb-a-gan-65w-11570-1.png'),(83,4782,'f86f99d0-4ac4-4e74-a30d-91c6085a10bd_cap-type-c-to-lightning-apple-mm0a3fe-a-1m_4.png'),(84,4782,'fcd3b463-a000-42cd-84f6-154bb51d3390_cap-type-c-to-lightning-apple-mm0a3fe-a-1m_3.png'),(85,4782,'6863d26b-5b75-4ee0-a5b9-9b570e028390_cap-type-c-to-lightning-apple-mm0a3fe-a-1m_2.png'),(86,4782,'be5aeded-7f89-463d-8d17-3a67579756e9_cap-type-c-to-lightning-apple-mm0a3fe-a-1m_1.png'),(87,4782,'23ae3bb2-d3ec-498c-8664-96f8f1591e8e_group_118_2.png'),(88,4784,'b0cf7d4d-6088-4042-8e8c-6fe547668e12_text_ng_n_7_63.png'),(89,4784,'be8cb2ff-6a39-40c2-9312-a68cbed0084b_cap-usb-c-to-usb-l-anker-322-0-9m-nylon-a81b5h21-2.png'),(90,4784,'075f3da1-a88d-4e98-83a5-25d5a5b35ca4_cap-usb-c-to-usb-l-anker-322-0-9m-nylon-a81b5h21-1.png'),(91,4785,'09ab6a54-76d0-4153-9e3a-17fee09683f7_cu-sac-nhanh-samsung-25w-ep-t2510nbegww-4.png'),(92,4785,'3bfe32be-256b-43ac-9ac4-ab1d752fa580_cu-sac-nhanh-samsung-25w-ep-t2510nbegww-3.png'),(93,4785,'30569934-e27c-43b7-b846-e9e4cd55e3a5_cu-sac-nhanh-samsung-25w-ep-t2510nbegww-2.png'),(94,4785,'852fdefe-91ca-493a-ad48-919a90c43fa9_cu-sac-nhanh-samsung-25w-ep-t2510nbegww-1.png'),(95,4786,'7ef824dd-6658-4829-95b1-53c3293f8cf6_op-lung-iphone-15-pro-max-slimcase-unique-with-magsafe-trong_3_.png'),(96,4786,'543d48c0-7e4e-464f-ba79-8424cbbf3d51_op-lung-iphone-15-pro-max-slimcase-unique-with-magsafe-trong_2_.png'),(97,4786,'c9bf7d1b-2761-4b80-98c2-4f0027c952d1_op-lung-iphone-15-pro-max-slimcase-unique-with-magsafe-trong_1_.png'),(98,4786,'e65d863d-8784-44e6-822b-eb1a793e3a5f_thumb-op-lung_1__1_6.png'),(99,4787,'e7c3ee61-c228-48da-a984-b05c5b37c68b_group_629_12_.png'),(100,4787,'6e373409-23d0-41a0-a07d-dd8f519137a9_group_629_11_.png'),(101,4787,'a8cc6456-d8a7-4969-957c-1a0a385b20e8_group_629_10_.png'),(102,4787,'c2f7f351-3437-4796-b037-d28e79b60918_text_ng_n_-_2024-11-06t223318.436.png'),(103,4789,'2e50846c-6f37-4fc3-83d8-65e181429887_1_319_2.png'),(104,4789,'f2bb3a55-e4c3-4f08-be5a-7ffb2300b391_2_298_1.png'),(105,4789,'0b6f8961-ee02-4e0a-ba96-6c6a8becf2af_thumb-op-lung_7__2.png'),(106,4790,'2b6274be-1a27-43eb-adca-2c4d4d659d6a_328_1_1.png'),(107,4790,'93d28cde-d736-4642-8167-c16415421b50_327_1_1.png'),(108,4790,'9025b076-48a5-4655-882a-482da798b93a_326_1_1.png'),(109,4790,'f517d033-5891-4452-98d1-5d8f1abcd362_op-lung-iphone-14-plus-zagg-hampton.png'),(110,4791,'2a47e18a-e972-4e28-9e06-94acfe8c6c11_op-lung-da-samsung-galaxy-s24-ultra-5.png'),(111,4791,'fe54bdf6-e3a3-47e8-9f5a-b641810a8d7f_op-lung-da-samsung-galaxy-s24-ultra-4.png'),(112,4791,'3ca459c4-fbe5-459e-9890-ff65eee27a91_op-lung-da-samsung-galaxy-s24-ultra-2.png'),(113,4791,'40d4830f-eaa7-42cc-8625-4b140410bda2_op-lung-da-samsung-galaxy-s24-ultra-3.png'),(114,4791,'83732b45-6b7f-43ab-af96-50efe4368f6d_op-lung-da-samsung-galaxy-s24-ultra-1.png'),(115,4792,'163552de-4ea5-432a-a7b4-c4a251d85710_633_de.png'),(116,4792,'109ee590-344b-4e03-b3e2-7e47dd44ffe9_633_xa.png'),(117,4792,'76b3403c-5b5c-45e9-abb8-ce872b9cdca4_633.png'),(118,4792,'54696079-2415-4bff-9a49-824f494301dc_group_270.png'),(124,4794,'74ade1a8-f587-4ae4-bd2d-20e1972a02a6_90_1.png'),(125,4794,'a5e3d89b-f10f-4836-ac84-c0278b872591_92_1.png'),(126,4794,'0fab73a6-bd18-4b1e-981a-90a4570c013c_91_1.png'),(127,4794,'22381766-7ca8-463f-abfc-f4d1a4281e39_93_2.png'),(128,4794,'924fc7fc-dd2e-4bdc-b8f1-a0a6ca5ed8c4_group_2007_2_.png'),(129,4795,'9b7af06d-e40a-4e84-9d83-d8875f8a4f9c_1_659.png'),(130,4795,'28a1066c-ac47-4f8c-9bf0-0b86cbeed1c8_2_638.png'),(131,4798,'a90fb0b6-9404-400f-8b63-f675735a8cf4_group_563_-_2024-10-27t111941.155.png'),(132,4798,'7fdcc2bc-5ce8-4f5c-8ede-50d5c8593389_frame_1_-_2024-10-27t111918.336.png'),(133,4798,'356890e8-2122-4b86-ab27-8643b9d76c82_frame_1_-_2024-10-27t111858.206.png'),(134,4798,'1803a005-2ca9-4f8c-9972-2b86f7da8b2b_frame_1_-_2024-10-27t111832.619.png');
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `total_money` float DEFAULT NULL CHECK (`total_money` >= 0),
  `payment_method` varchar(255) DEFAULT NULL,
  `shipping_method` varchar(255) DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  `shipping_address` varchar(255) DEFAULT NULL,
  `tracking_number` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (5,2,'Nguyễn Tấn Lộc','nguyentanloc12c9tlt@gmail.com','11223344','245 ấp 5 Tân Lợi Thạnh','hello','2024-11-25','PENDING',23.432,'cod','express','2024-11-25',NULL,NULL,NULL,_binary ''),(6,2,'Nguyễn Tấn Lộc','nguyentanloc13c9@gmail.com','0373715541','245 ấp 5 xã Tân Lợi Thạnh huyện Giồng Trôm, Bến Tre','dễ vỡ','2024-11-25','PENDING',0,'cod','express','2024-11-25',NULL,NULL,NULL,_binary ''),(7,2,'hoàng xx','hoang234@gmail.com','11445547','nhà x ngõ y','dễ vữ','2024-11-26','PENDING',13140000,'cod','express','2024-11-26',NULL,NULL,NULL,_binary ''),(8,2,'hoàng xx','hoang234@gmail.com','11445547','nhà x ngõ y','dễ vữ','2024-11-26','PENDING',1875000,'cod','express','2024-11-26',NULL,NULL,NULL,_binary ''),(9,2,'hoàng xx','hoang234@gmail.com','11445547','nhà x ngõ y','dễ vữ','2024-11-27','PENDING',306000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(10,2,'hoàng xx','hoang234@gmail.com','11445547','nhà x ngõ y','dễ vữ','2024-11-27','PENDING',198000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(11,2,'hoàng xx','hoang234@gmail.com','11445547','nhà x ngõ y','dễ vữ','2024-11-27','PENDING',2700000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(12,2,'hoàng xx','hoang234@gmail.com','11445547','nhà x ngõ y','dễ vữ','2024-11-27','PENDING',980000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(13,2,'hoàng xx','hoang234@gmail.com','11445547','nhà x ngõ y','dễ vữ','2024-11-27','PENDING',300000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(14,2,'hoàng xx','hoang234@gmail.com','11445547','nhà x ngõ y','dễ vữ','2024-11-27','PENDING',1430000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(15,2,'hoàng xx','hoang234@gmail.com','11445547','nhà x ngõ y','dễ vữ','2024-11-27','PENDING',180000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(16,2,'hoàng xx','hoang234@gmail.com','11445547','nhà x ngõ y','dễ vữ','2024-11-27','PENDING',1840000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(17,19,'Nguyễn Tấn Lộc','nguyentanloc13c9@gmail.com','0326559994','245 ấp Miếu Điền, xã Tân Lợi Thạnh, huyện Giồng Trôm, tỉnh Bến Tre','dễ vỡ','2024-11-27','PENDING',1077000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(18,19,'Nguyễn Tấn Lộc','nguyentanloc13c9@gmail.com','0326559994','245 ấp Miếu Điền, xã Tân Lợi Thạnh, huyện Giồng Trôm, tỉnh Bến Tre','dễ vỡ','2024-11-27','PENDING',880000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(19,19,'Nguyễn Tấn Lộc','nguyentanloc13c9@gmail.com','0326559994','245 ấp Miếu Điền, xã Tân Lợi Thạnh, huyện Giồng Trôm, tỉnh Bến Tre','dễ vỡ','2024-11-27','PENDING',880000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(20,19,'Nguyễn Tấn Lộc','nguyentanloc13c9@gmail.com','0326559994','245 ấp Miếu Điền, xã Tân Lợi Thạnh, huyện Giồng Trôm, tỉnh Bến Tre','dễ vỡ','2024-11-27','PENDING',760000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(21,19,'Nguyễn Tấn Lộc','nguyentanloc13c9@gmail.com','0326559994','245 ấp Miếu Điền, xã Tân Lợi Thạnh, huyện Giồng Trôm, tỉnh Bến Tre','dễ vỡ','2024-11-27','PENDING',3740000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(22,19,'Nguyễn Tấn Lộc','nguyentanloc13c9@gmail.com','0326559994','245 ấp','dễ vỡ','2024-11-27','PENDING',3740000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(23,19,'Nguyễn Tấn Lộc','nguyentanloc13c9@gmail.com','0326559994','245 ấp','dễ vỡ','2024-11-27','PENDING',3740000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(24,19,'Nguyễn Tấn Lộc','nguyentanloc13c9@gmail.com','0326559994','245 ấp Miếu Điền, xã Tân Lợi Thạnh, huyện Giồng Trôm, tỉnh Bến Tre','dễ vỡ','2024-11-27','PENDING',3740000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(25,19,'hoàng xx','hoang234@gmail.com','11445547','nhà x ngõ y','dễ vữ','2024-11-27','PENDING',3740000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(26,19,'hoàng xx','hoang234@gmail.com','11445547','nhà x ngõ y','dễ vữ','2024-11-27','PENDING',3740000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(27,19,'hoàng xx','hoang234@gmail.com','11445547','nhà x ngõ y','dễ vữ','2024-11-27','PENDING',3740000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(28,19,'hoàng xx','hoang234@gmail.com','11445547','nhà x ngõ y','dễ vữ','2024-11-27','PENDING',3740000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(29,19,'hoàng xx','hoang234@gmail.com','11445547','nhà x ngõ y','dễ vữ','2024-11-27','PENDING',3740000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(30,19,'hoàng xx','hoang234@gmail.com','11445547','nhà x ngõ y','dễ vữ','2024-11-27','PENDING',3740000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(31,2,'Nguyễn Tấn Lộc','nguyentanloc12c9tlt@gmail.com','11223344','245 ấp 5 Tân Lợi Thạnh','hello','2024-11-27','PENDING',23.432,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(32,19,'Nguyễn Tấn Lộc','nguyentanloc12c9tlt@gmail.com','11223344','245 ấp 5 Tân Lợi Thạnh','hello','2024-11-27','PENDING',23.432,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(33,19,'Nguyễn Tấn Lộc','nguyentanloc12c9tlt@gmail.com','11223344','245 ấp 5 Tân Lợi Thạnh','hello','2024-11-27','PENDING',23.432,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(34,19,'hoàng xx','hoang234@gmail.com','11445547','nhà x ngõ y','dễ vữ','2024-11-27','PENDING',3740000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(35,19,'hoàng xx','hoang234@gmail.com','11445547','nhà x ngõ y','dễ vữ','2024-11-27','PENDING',3740000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(36,19,'hoàng xx','hoang234@gmail.com','11445547','nhà x ngõ y','dễ vữ','2024-11-27','PENDING',210000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(37,19,'hoàng xx','hoang234@gmail.com','11445547','nhà x ngõ y','dễ vữ','2024-11-27','PENDING',418000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(38,19,'Nguyễn Tấn Lộc','nguyentanloc13c9@gmail.com','0326559994','245 ấp 5, xã Tân Lợi Thạnh, huyện Giồng Trôm, tỉnh Bến Tre','dễ vỡ','2024-11-27','PENDING',760000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary ''),(39,19,'Nguyễn Tấn Lộc','nguyentanloc13c9@gmail.com','0326559994','245 ấp 5, xã Tân Lợi Thạnh, huyện Giồng Trôm, tỉnh Bến Tre','dễ vỡ','2024-11-27','PENDING',3680000,'cod','express','2024-11-27',NULL,NULL,NULL,_binary '');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL CHECK (`price` >= 0),
  `number_of_products` int(11) DEFAULT NULL CHECK (`number_of_products` > 0),
  `total_money` float DEFAULT NULL CHECK (`total_money` >= 0),
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (2,5,4765,440000,3,NULL,NULL),(3,5,4767,715000,3,NULL,NULL),(4,6,4765,440000,15,NULL,NULL),(5,6,4774,1350000,4,NULL,NULL),(6,6,4777,240000,4,NULL,NULL),(7,6,4778,90000,2,NULL,NULL),(8,7,4765,440000,15,NULL,NULL),(9,7,4774,1350000,4,NULL,NULL),(10,7,4777,240000,4,NULL,NULL),(11,7,4778,90000,2,NULL,NULL),(12,8,4768,780000,2,NULL,NULL),(13,8,4770,105000,3,NULL,NULL),(14,9,4771,306000,1,NULL,NULL),(15,10,4773,99000,2,NULL,NULL),(16,11,4774,1350000,2,NULL,NULL),(17,12,4775,490000,2,NULL,NULL),(18,13,4776,150000,2,NULL,NULL),(19,14,4767,715000,2,NULL,NULL),(20,15,4778,90000,2,NULL,NULL),(21,16,4769,320000,2,NULL,NULL),(22,16,4776,150000,8,NULL,NULL),(23,17,4798,450000,2,NULL,NULL),(24,17,4772,59000,3,NULL,NULL),(25,18,4765,440000,2,NULL,NULL),(26,19,4765,440000,2,NULL,NULL),(27,20,4766,760000,1,NULL,NULL),(28,21,4765,440000,2,NULL,NULL),(29,21,4767,715000,4,NULL,NULL),(30,22,4765,440000,2,NULL,NULL),(31,22,4767,715000,4,NULL,NULL),(32,23,4765,440000,2,NULL,NULL),(33,23,4767,715000,4,NULL,NULL),(34,24,4765,440000,2,NULL,NULL),(35,24,4767,715000,4,NULL,NULL),(36,25,4765,440000,2,NULL,NULL),(37,25,4767,715000,4,NULL,NULL),(38,26,4765,440000,2,NULL,NULL),(39,26,4767,715000,4,NULL,NULL),(40,27,4765,440000,2,NULL,NULL),(41,27,4767,715000,4,NULL,NULL),(42,28,4765,440000,2,NULL,NULL),(43,28,4767,715000,4,NULL,NULL),(44,29,4765,440000,2,NULL,NULL),(45,29,4767,715000,4,NULL,NULL),(46,30,4765,440000,2,NULL,NULL),(47,30,4767,715000,4,NULL,NULL),(48,31,4765,440000,3,NULL,NULL),(49,31,4767,715000,3,NULL,NULL),(50,32,4765,440000,3,NULL,NULL),(51,32,4767,715000,3,NULL,NULL),(52,33,4765,440000,3,NULL,NULL),(53,33,4767,715000,3,NULL,NULL),(54,34,4765,440000,2,NULL,NULL),(55,34,4767,715000,4,NULL,NULL),(56,35,4765,440000,2,NULL,NULL),(57,35,4767,715000,4,NULL,NULL),(58,36,4770,105000,2,NULL,NULL),(59,37,4772,59000,2,NULL,NULL),(60,37,4776,150000,2,NULL,NULL),(61,38,4766,760000,1,NULL,NULL),(62,39,4769,320000,2,NULL,NULL),(63,39,4766,760000,4,NULL,NULL);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;




