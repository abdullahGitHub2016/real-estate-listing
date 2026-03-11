-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: real_estate_listing
-- ------------------------------------------------------
-- Server version	8.0.44

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

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `city_name` (`city_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (2,'Chittagong'),(1,'Dhaka'),(3,'Sylhet');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `developers`
--

DROP TABLE IF EXISTS `developers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dev_name` varchar(100) NOT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `is_premium` tinyint(1) DEFAULT '0',
  `membership_type` enum('BASIC','GOLD','PLATINUM') DEFAULT 'BASIC',
  `membership_expiry` date DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `developers`
--

LOCK TABLES `developers` WRITE;
/*!40000 ALTER TABLE `developers` DISABLE KEYS */;
INSERT INTO `developers` VALUES (1,'Inheritance Development Ltd. (IDL)',NULL,1,'PLATINUM',NULL,0),(2,'ARKAM BUILDERS LIMITED',NULL,1,'GOLD',NULL,0),(3,'NAGAR HOLDINGS LIMITED',NULL,0,'BASIC',NULL,0),(4,'DREAMWAY HOLDINGS LTD',NULL,1,'BASIC',NULL,0);
/*!40000 ALTER TABLE `developers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features`
--

DROP TABLE IF EXISTS `features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features` (
  `id` int NOT NULL AUTO_INCREMENT,
  `feature_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features`
--

LOCK TABLES `features` WRITE;
/*!40000 ALTER TABLE `features` DISABLE KEYS */;
INSERT INTO `features` VALUES (1,'Security'),(2,'Lift'),(3,'Fire exit'),(4,'WASA connection'),(5,'Gymnasium'),(6,'Garden'),(7,'Servant Room'),(8,'Mosque/Prayer Room'),(9,'Self Water supply'),(10,'Hot water and heating'),(11,'Gas Connection'),(12,'Cylinder Gas'),(13,'Electricity'),(14,'Generator'),(15,'Telephone line'),(16,'Inter com'),(17,'CCTV'),(18,'Wi-Fi connectivity'),(19,'Security Alarm System'),(20,'Satellite or cable TV'),(21,'Electronic security'),(22,'Pool'),(23,'Solar panels'),(24,'Guest Parking'),(25,'Fire Protection');
/*!40000 ALTER TABLE `features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiries`
--

DROP TABLE IF EXISTS `inquiries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inquiries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `property_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `visitor_name` varchar(100) DEFAULT NULL,
  `visitor_phone` varchar(20) DEFAULT NULL,
  `message` text,
  `status` enum('New','Contacted','Closed') DEFAULT 'New',
  `owner_reply` text,
  `replied_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `property_id` (`property_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `inquiries_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`),
  CONSTRAINT `inquiries_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiries`
--

LOCK TABLES `inquiries` WRITE;
/*!40000 ALTER TABLE `inquiries` DISABLE KEYS */;
INSERT INTO `inquiries` VALUES (1,4,3,'Kamal Hossain','01700000000','I am interested in this Jolshiri project. Is the price negotiable?','New',NULL,NULL),(2,1,NULL,'Mr. Rahim','01811111111','When is the handover date for IDL AZALEA?','New',NULL,NULL),(3,1,NULL,'Arif Chowdhury','01712345678','Interested in IDL AZALEA. What is the down payment amount?','New',NULL,NULL);
/*!40000 ALTER TABLE `inquiries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `properties` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `type_id` int DEFAULT NULL,
  `property_type` varchar(50) DEFAULT NULL,
  `purpose` varchar(20) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `area_name` varchar(100) DEFAULT NULL,
  `city_id` int DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `construction_status` varchar(50) DEFAULT NULL,
  `size_sqft` int DEFAULT NULL,
  `developer_id` int DEFAULT NULL,
  `owner_user_id` int DEFAULT NULL,
  `transaction_type` varchar(50) DEFAULT NULL,
  `floors_available` varchar(100) DEFAULT NULL,
  `beds` int DEFAULT NULL,
  `baths` int DEFAULT NULL,
  `balconies` int DEFAULT NULL,
  `garages` varchar(50) DEFAULT NULL,
  `total_building_floors` int DEFAULT NULL,
  `furnishing` varchar(50) DEFAULT NULL,
  `facing` varchar(50) DEFAULT NULL,
  `land_area` varchar(50) DEFAULT NULL,
  `thumbnail_url` varchar(255) DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT '0',
  `description` text,
  `price_total` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_owner` (`owner_user_id`),
  KEY `fk_type` (`type_id`),
  CONSTRAINT `fk_owner` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_type` FOREIGN KEY (`type_id`) REFERENCES `property_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (1,'Suvastu Brishti Bilash',NULL,'Apartment/Flats','Sale',NULL,'Jolshiri Abason',NULL,'Dhaka','Under Construction',2750,NULL,4,'New','2nd, 4th, 5th, 6th',4,5,5,'Parking 1',10,'Unfurnished','East Facing','5 katha',NULL,0,'Discover Suvastu Brishti Bilash in Jolshiri. Designed by Cubeinside...',NULL),(2,'IDL AZALEA',NULL,NULL,NULL,'Apartment/Flats','Uttara',1,NULL,NULL,1770,1,NULL,NULL,NULL,4,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,16400000.00),(3,'Arkam MC Park',NULL,NULL,NULL,'Land Sharing Flat','Banasree',1,NULL,NULL,1800,2,NULL,NULL,NULL,3,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,0.00),(4,'NAGAR MOONLIGHT',NULL,NULL,NULL,'Apartment/Flats','Mohammadpur',1,NULL,NULL,1350,3,NULL,NULL,NULL,3,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,0.00),(5,'Dreamway The Bloom',NULL,NULL,NULL,'Apartment/Flats','Jolshiri Abason',1,NULL,NULL,2850,4,NULL,NULL,NULL,4,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,0.00),(6,'Nagar Moonlight',NULL,NULL,NULL,'Apartment/Flats','Adabor',1,NULL,NULL,1350,3,NULL,NULL,NULL,3,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,26400000.00);
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_categories`
--

DROP TABLE IF EXISTS `property_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  `parent_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `property_categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `property_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_categories`
--

LOCK TABLES `property_categories` WRITE;
/*!40000 ALTER TABLE `property_categories` DISABLE KEYS */;
INSERT INTO `property_categories` VALUES (1,'Residential',NULL),(2,'Commercial',NULL),(3,'Land/Plot',NULL),(4,'Apartment/Flat',1),(5,'Independent House',1),(6,'Duplex Home',1),(7,'Studio Apartment',1),(8,'Land Sharing Flat',1),(9,'Office Space',2),(10,'Industrial Space',2),(11,'Shop Showroom',2),(12,'Residential Plot',3),(13,'Commercial Plot',3),(14,'Agriculture Plot',3);
/*!40000 ALTER TABLE `property_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_features`
--

DROP TABLE IF EXISTS `property_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_features` (
  `property_id` int NOT NULL,
  `feature_id` int NOT NULL,
  PRIMARY KEY (`property_id`,`feature_id`),
  KEY `feature_id` (`feature_id`),
  CONSTRAINT `property_features_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`),
  CONSTRAINT `property_features_ibfk_2` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_features`
--

LOCK TABLES `property_features` WRITE;
/*!40000 ALTER TABLE `property_features` DISABLE KEYS */;
INSERT INTO `property_features` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,21);
/*!40000 ALTER TABLE `property_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_images`
--

DROP TABLE IF EXISTS `property_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `property_id` int DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `is_main` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `property_id` (`property_id`),
  CONSTRAINT `property_images_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `properties` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_images`
--

LOCK TABLES `property_images` WRITE;
/*!40000 ALTER TABLE `property_images` DISABLE KEYS */;
INSERT INTO `property_images` VALUES (1,1,'images/idl-azalea-main.jpg',1),(2,1,'images/idl-azalea-bedroom.jpg',0),(3,1,'images/idl-azalea-kitchen.jpg',0),(4,1,'images/idl-azalea-balcony.jpg',0);
/*!40000 ALTER TABLE `property_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('BUYER','AGENT','ADMIN') DEFAULT 'BUYER',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin User','admin@bdhousing.com','hashed_pass_123','ADMIN','2026-03-11 06:23:40'),(2,'Zahir Ahmed','zahir.agent@example.com','hashed_pass_456','AGENT','2026-03-11 06:23:40'),(3,'Kamal Hossain','kamal.buyer@gmail.com','hashed_pass_789','BUYER','2026-03-11 06:23:40'),(4,'IDL Admin','info@idl-bd.com','pass123','AGENT','2026-03-11 07:47:09');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-11 15:04:10
