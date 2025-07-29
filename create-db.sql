CREATE DATABASE IF NOT EXISTS `test_db`;
USE test_db;

-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: 0.0.0.0    Database: app_development
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `basket_items`
--

DROP TABLE IF EXISTS `basket_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `basket_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `basket_id` int NOT NULL,
  `item_id` int NOT NULL,
  `last_accepted_price` decimal(8,2) NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note_to_seller` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `discount_code_id` int DEFAULT NULL,
  `checkout_orderset_id` int DEFAULT NULL,
  `customisation_options` mediumtext COLLATE utf8mb4_unicode_ci,
  `universal_discount_code_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `basket_items_basket_idx` (`basket_id`),
  KEY `index_basket_items_on_checkout_orderset_id` (`checkout_orderset_id`),
  KEY `basket_items_discount_code_idx` (`discount_code_id`),
  KEY `basket_items_item_idx` (`item_id`),
  KEY `index_basket_items_on_created_at_and_updated_at` (`created_at`,`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket_items`
--

LOCK TABLES `basket_items` WRITE;
/*!40000 ALTER TABLE `basket_items` DISABLE KEYS */;
INSERT INTO `basket_items` VALUES (2,23,568,10.80,'1',NULL,'2023-11-01 15:33:44','2023-11-01 15:33:44',NULL,NULL,NULL,NULL),(4,25,586,49.50,'1',NULL,'2023-12-04 12:19:38','2023-12-04 12:19:38',NULL,33,NULL,NULL),(9,27,692,4.20,'1',NULL,'2024-09-19 09:07:52','2024-09-19 09:07:52',NULL,NULL,NULL,NULL),(11,29,559,6.00,'1',NULL,'2024-11-22 12:14:21','2024-11-22 12:14:21',NULL,NULL,NULL,NULL),(14,30,594,9.00,'1',NULL,'2024-12-02 14:45:53','2024-12-02 14:48:32',NULL,37,NULL,NULL),(16,31,708,22.45,'1',NULL,'2024-12-13 16:39:58','2024-12-13 16:39:58',NULL,NULL,NULL,NULL),(17,32,592,7.50,'1',NULL,'2025-06-30 13:08:40','2025-06-30 13:08:40',NULL,NULL,NULL,NULL),(18,33,592,7.50,'1',NULL,'2025-06-30 13:11:15','2025-06-30 13:11:15',NULL,NULL,NULL,NULL),(19,34,580,32.50,'1',NULL,'2025-07-01 10:59:11','2025-07-01 10:59:11',NULL,NULL,NULL,NULL),(20,35,568,10.80,'1',NULL,'2025-07-02 13:05:40','2025-07-02 13:05:40',NULL,NULL,NULL,NULL),(21,35,586,49.50,'1',NULL,'2025-07-02 14:00:49','2025-07-02 14:00:49',NULL,NULL,NULL,NULL),(22,36,680,2.10,'1',NULL,'2025-07-10 09:22:32','2025-07-10 09:22:32',NULL,NULL,NULL,NULL),(23,36,715,19.95,'1',NULL,'2025-07-10 09:22:41','2025-07-10 09:26:07',NULL,NULL,NULL,1),(25,36,711,19.95,'1',NULL,'2025-07-10 09:23:10','2025-07-10 09:26:07',NULL,NULL,NULL,1),(27,36,692,4.20,'1',NULL,'2025-07-10 09:28:38','2025-07-10 09:28:38',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `basket_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-29 10:49:20
