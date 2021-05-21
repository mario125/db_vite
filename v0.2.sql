-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: v1
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `t_bussines`
--

DROP TABLE IF EXISTS `t_bussines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_bussines` (
  `bussines_id` varchar(50) NOT NULL,
  `bussines_code` varchar(100) DEFAULT NULL,
  `bussines_owner` varchar(100) DEFAULT NULL,
  `bussines_name` varchar(100) DEFAULT NULL,
  `bussines_brand` varchar(50) DEFAULT NULL,
  `bussines_telephone` varchar(9) DEFAULT NULL,
  `bussines_email` varchar(50) DEFAULT NULL,
  `bussines_password` varchar(100) DEFAULT NULL,
  `bussines_address` varchar(50) DEFAULT NULL,
  `bussines_latlng` varchar(50) DEFAULT NULL,
  `bussines_image` varchar(100) DEFAULT NULL,
  `bussines_date_open` varchar(20) DEFAULT NULL,
  `bussines_date_close` varchar(20) DEFAULT NULL,
  `bussines_city` varchar(100) DEFAULT NULL,
  `bussines_score` double DEFAULT NULL,
  `id_bussines_category` varchar(50) NOT NULL,
  PRIMARY KEY (`bussines_id`),
  KEY `id_bussines_category` (`id_bussines_category`),
  CONSTRAINT `t_bussines_ibfk_1` FOREIGN KEY (`id_bussines_category`) REFERENCES `t_bussines_category` (`bussines_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_bussines`
--

LOCK TABLES `t_bussines` WRITE;
/*!40000 ALTER TABLE `t_bussines` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_bussines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_bussines_category`
--

DROP TABLE IF EXISTS `t_bussines_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_bussines_category` (
  `bussines_category_id` varchar(50) NOT NULL,
  `bussines_category_name` varchar(50) DEFAULT NULL,
  `bussines_category_image` varchar(100) DEFAULT NULL,
  `bussines_category_description` varchar(100) DEFAULT NULL,
  `bussines_category_status` int DEFAULT NULL,
  `bussines_category_order` int DEFAULT NULL,
  PRIMARY KEY (`bussines_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_bussines_category`
--

LOCK TABLES `t_bussines_category` WRITE;
/*!40000 ALTER TABLE `t_bussines_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_bussines_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cash_bussines`
--

DROP TABLE IF EXISTS `t_cash_bussines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cash_bussines` (
  `cash_bussines_id` varchar(50) NOT NULL,
  `cash_bussines_correlative` int DEFAULT NULL,
  `cash_bussines_start` datetime DEFAULT NULL,
  `cash_bussines_end` datetime DEFAULT NULL,
  `cash_bussines_description` varchar(50) DEFAULT NULL,
  `id_cash_status` varchar(50) NOT NULL,
  `id_bussines` varchar(50) NOT NULL,
  PRIMARY KEY (`cash_bussines_id`),
  KEY `id_cash_status` (`id_cash_status`),
  KEY `id_bussines` (`id_bussines`),
  CONSTRAINT `t_cash_bussines_ibfk_1` FOREIGN KEY (`id_cash_status`) REFERENCES `t_cash_status` (`cash_status_id`),
  CONSTRAINT `t_cash_bussines_ibfk_2` FOREIGN KEY (`id_bussines`) REFERENCES `t_bussines` (`bussines_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cash_bussines`
--

LOCK TABLES `t_cash_bussines` WRITE;
/*!40000 ALTER TABLE `t_cash_bussines` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cash_bussines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cash_driver`
--

DROP TABLE IF EXISTS `t_cash_driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cash_driver` (
  `cash_driver_id` varchar(50) NOT NULL,
  `cash_driver_correlative` int DEFAULT NULL,
  `cash_driver_start` datetime DEFAULT NULL,
  `cash_driver_end` datetime DEFAULT NULL,
  `cash_driver_summary_all` double DEFAULT '0',
  `cash_driver_description` varchar(50) DEFAULT NULL,
  `id_cash_status` varchar(50) NOT NULL,
  `id_driver` varchar(50) NOT NULL,
  PRIMARY KEY (`cash_driver_id`),
  KEY `id_cash_status` (`id_cash_status`),
  KEY `id_driver` (`id_driver`),
  CONSTRAINT `t_cash_driver_ibfk_1` FOREIGN KEY (`id_cash_status`) REFERENCES `t_cash_status` (`cash_status_id`),
  CONSTRAINT `t_cash_driver_ibfk_2` FOREIGN KEY (`id_driver`) REFERENCES `t_driver` (`driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cash_driver`
--

LOCK TABLES `t_cash_driver` WRITE;
/*!40000 ALTER TABLE `t_cash_driver` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cash_driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cash_people`
--

DROP TABLE IF EXISTS `t_cash_people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cash_people` (
  `cash_people_id` varchar(50) NOT NULL,
  `cash_people_correlative` int DEFAULT NULL,
  `cash_people_start` datetime DEFAULT NULL,
  `cash_people_end` datetime DEFAULT NULL,
  `cash_people_summary_all` double DEFAULT '0',
  `cash_people_description` varchar(50) DEFAULT NULL,
  `id_cash_status` varchar(50) NOT NULL,
  `id_people` varchar(50) NOT NULL,
  PRIMARY KEY (`cash_people_id`),
  KEY `id_cash_status` (`id_cash_status`),
  KEY `id_people` (`id_people`),
  CONSTRAINT `t_cash_people_ibfk_1` FOREIGN KEY (`id_cash_status`) REFERENCES `t_cash_status` (`cash_status_id`),
  CONSTRAINT `t_cash_people_ibfk_2` FOREIGN KEY (`id_people`) REFERENCES `t_people` (`people_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cash_people`
--

LOCK TABLES `t_cash_people` WRITE;
/*!40000 ALTER TABLE `t_cash_people` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cash_people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cash_status`
--

DROP TABLE IF EXISTS `t_cash_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cash_status` (
  `cash_status_id` varchar(50) NOT NULL,
  `cash_status_name` varchar(20) DEFAULT NULL COMMENT 'PENDIENTE, PAGADO, ARQUEADO.',
  PRIMARY KEY (`cash_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cash_status`
--

LOCK TABLES `t_cash_status` WRITE;
/*!40000 ALTER TABLE `t_cash_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cash_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_city`
--

DROP TABLE IF EXISTS `t_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_city` (
  `city_id` varchar(50) NOT NULL,
  `city_cod` varchar(10) DEFAULT NULL,
  `city_name` varchar(20) DEFAULT NULL,
  `city_status` int DEFAULT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_city`
--

LOCK TABLES `t_city` WRITE;
/*!40000 ALTER TABLE `t_city` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_document_type`
--

DROP TABLE IF EXISTS `t_document_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_document_type` (
  `document_type_id` varchar(50) NOT NULL,
  `document_type_code` varchar(10) DEFAULT NULL,
  `document_type_name` varchar(20) DEFAULT NULL COMMENT 'DNI, PASAPORTE',
  `document_type_status` int DEFAULT NULL,
  PRIMARY KEY (`document_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_document_type`
--

LOCK TABLES `t_document_type` WRITE;
/*!40000 ALTER TABLE `t_document_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_document_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_driver`
--

DROP TABLE IF EXISTS `t_driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_driver` (
  `driver_id` varchar(50) NOT NULL,
  `driver_name` varchar(50) DEFAULT NULL,
  `driver_surnames` varchar(50) DEFAULT NULL,
  `driver_number_document` varchar(20) DEFAULT NULL,
  `driver_address` varchar(100) DEFAULT NULL,
  `driver_email` varchar(50) DEFAULT NULL,
  `driver_password` varchar(50) DEFAULT NULL,
  `driver_telephone` varchar(9) DEFAULT NULL,
  `driver_image_profile` varchar(100) DEFAULT NULL,
  `driver_image_document` varchar(100) DEFAULT NULL,
  `driver_score` double DEFAULT NULL,
  `driver_gender` varchar(10) DEFAULT NULL,
  `driver_birth_date` date DEFAULT NULL,
  `driver_status` int DEFAULT NULL,
  `driver_city` varchar(100) DEFAULT NULL,
  `driver_date_created` datetime DEFAULT NULL,
  `driver_date_edit` datetime DEFAULT NULL,
  `id_document_type` varchar(50) NOT NULL,
  `id_vehicle_type` varchar(50) NOT NULL,
  `id_city` varchar(50) NOT NULL,
  PRIMARY KEY (`driver_id`),
  KEY `id_document_type` (`id_document_type`),
  KEY `id_vehicle_type` (`id_vehicle_type`),
  KEY `id_city` (`id_city`),
  CONSTRAINT `t_driver_ibfk_1` FOREIGN KEY (`id_document_type`) REFERENCES `t_document_type` (`document_type_id`),
  CONSTRAINT `t_driver_ibfk_2` FOREIGN KEY (`id_vehicle_type`) REFERENCES `t_vehicle_type` (`vehicle_type_id`),
  CONSTRAINT `t_driver_ibfk_3` FOREIGN KEY (`id_city`) REFERENCES `t_city` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_driver`
--

LOCK TABLES `t_driver` WRITE;
/*!40000 ALTER TABLE `t_driver` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_ingredient`
--

DROP TABLE IF EXISTS `t_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_ingredient` (
  `ingredient_id` varchar(50) NOT NULL,
  `ingredient_name` varchar(50) DEFAULT NULL,
  `ingredient_image` varchar(100) DEFAULT NULL,
  `ingredient_status` int DEFAULT NULL,
  PRIMARY KEY (`ingredient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_ingredient`
--

LOCK TABLES `t_ingredient` WRITE;
/*!40000 ALTER TABLE `t_ingredient` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_license`
--

DROP TABLE IF EXISTS `t_license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_license` (
  `license_id` varchar(50) NOT NULL,
  `license_code` varchar(20) DEFAULT NULL,
  `license_image` varchar(100) DEFAULT NULL,
  `license_description` text,
  `license_status` int DEFAULT NULL,
  `id_driver` varchar(50) NOT NULL,
  PRIMARY KEY (`license_id`),
  KEY `id_driver` (`id_driver`),
  CONSTRAINT `t_license_ibfk_1` FOREIGN KEY (`id_driver`) REFERENCES `t_driver` (`driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_license`
--

LOCK TABLES `t_license` WRITE;
/*!40000 ALTER TABLE `t_license` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_offer`
--

DROP TABLE IF EXISTS `t_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_offer` (
  `offer_id` varchar(50) NOT NULL,
  `offer_name` varchar(50) DEFAULT NULL,
  `offer_price` double DEFAULT NULL,
  `offer_image` varchar(100) DEFAULT NULL,
  `offer_description` text,
  `offer_type` varchar(20) DEFAULT 'OFERTA',
  `offer_date_start` datetime DEFAULT NULL,
  `offer_date_end` datetime DEFAULT NULL,
  `ofeer_score` double DEFAULT NULL,
  `offer_status` int DEFAULT NULL,
  `id_bussines` varchar(50) NOT NULL,
  PRIMARY KEY (`offer_id`),
  KEY `id_bussines` (`id_bussines`),
  CONSTRAINT `t_offer_ibfk_1` FOREIGN KEY (`id_bussines`) REFERENCES `t_bussines` (`bussines_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_offer`
--

LOCK TABLES `t_offer` WRITE;
/*!40000 ALTER TABLE `t_offer` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_order`
--

DROP TABLE IF EXISTS `t_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_order` (
  `order_id` varchar(50) NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `order_adress_bussines` varchar(100) DEFAULT NULL,
  `order_latlong_bussines` varchar(50) DEFAULT NULL,
  `order_adress_user` varchar(100) DEFAULT NULL,
  `order_latlong_user` varchar(50) DEFAULT NULL,
  `order_pryce_food` double DEFAULT NULL,
  `order_pryce_delivery` double DEFAULT NULL,
  `order_pryce_total` double DEFAULT NULL,
  `order_description` text,
  `order_status` int DEFAULT NULL,
  `id_city` varchar(50) NOT NULL COMMENT 'para identificar a que ciudad pertense.',
  `id_driver` varchar(50) DEFAULT NULL,
  `id_cash_driver` varchar(50) DEFAULT NULL,
  `id_user` varchar(50) NOT NULL,
  `id_type_payment` varchar(50) NOT NULL,
  `id_cash_people` varchar(50) DEFAULT NULL,
  `id_order_status` varchar(50) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `id_user` (`id_user`),
  KEY `id_type_payment` (`id_type_payment`),
  KEY `id_order_status` (`id_order_status`),
  KEY `id_city` (`id_city`),
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `t_user` (`user_id`),
  CONSTRAINT `t_order_ibfk_2` FOREIGN KEY (`id_type_payment`) REFERENCES `t_type_payment` (`type_payment_id`),
  CONSTRAINT `t_order_ibfk_3` FOREIGN KEY (`id_order_status`) REFERENCES `t_order_status` (`order_status_id`),
  CONSTRAINT `t_order_ibfk_4` FOREIGN KEY (`id_city`) REFERENCES `t_city` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_order`
--

LOCK TABLES `t_order` WRITE;
/*!40000 ALTER TABLE `t_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_order_item`
--

DROP TABLE IF EXISTS `t_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_order_item` (
  `order_item_id` varchar(50) NOT NULL,
  `order_item_product` varchar(100) DEFAULT NULL,
  `order_item_type` varchar(50) DEFAULT NULL,
  `order_item_amount` double DEFAULT NULL,
  `order_item_pryce` double DEFAULT NULL,
  `order_item_total` double DEFAULT NULL,
  `order_item_date` datetime DEFAULT NULL,
  `id_order` varchar(50) NOT NULL,
  `id_bussines` varchar(50) NOT NULL,
  `id_cash_bussines` varchar(50) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `id_order` (`id_order`),
  KEY `id_bussines` (`id_bussines`),
  KEY `id_cash_bussines` (`id_cash_bussines`),
  CONSTRAINT `t_order_item_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `t_order` (`order_id`),
  CONSTRAINT `t_order_item_ibfk_2` FOREIGN KEY (`id_bussines`) REFERENCES `t_bussines` (`bussines_id`),
  CONSTRAINT `t_order_item_ibfk_3` FOREIGN KEY (`id_cash_bussines`) REFERENCES `t_cash_bussines` (`cash_bussines_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_order_item`
--

LOCK TABLES `t_order_item` WRITE;
/*!40000 ALTER TABLE `t_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_order_status`
--

DROP TABLE IF EXISTS `t_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_order_status` (
  `order_status_id` varchar(50) NOT NULL,
  `order_status_name` varchar(50) DEFAULT NULL COMMENT 'PEDIDO, PENDIENTE, COCINA, EN CAMINO, RESIVIDO, PAGADO, CANCELADO',
  PRIMARY KEY (`order_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_order_status`
--

LOCK TABLES `t_order_status` WRITE;
/*!40000 ALTER TABLE `t_order_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_people`
--

DROP TABLE IF EXISTS `t_people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_people` (
  `people_id` varchar(50) NOT NULL,
  `people_name` varchar(50) DEFAULT NULL,
  `people_email` varchar(50) DEFAULT NULL,
  `people_password` varchar(100) DEFAULT NULL,
  `people_phone` varchar(13) DEFAULT NULL,
  `people_bussines_id` int DEFAULT NULL,
  `people_image` varchar(100) DEFAULT NULL,
  `people_city` varchar(100) DEFAULT NULL COMMENT 'ciudad de ubicacion',
  `people_status` int DEFAULT NULL,
  `id_role` varchar(50) NOT NULL,
  PRIMARY KEY (`people_id`),
  KEY `id_role` (`id_role`),
  CONSTRAINT `t_people_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `t_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_people`
--

LOCK TABLES `t_people` WRITE;
/*!40000 ALTER TABLE `t_people` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_product`
--

DROP TABLE IF EXISTS `t_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_product` (
  `product_id` varchar(50) NOT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `product_price` double DEFAULT NULL,
  `pruduct_image` varchar(100) DEFAULT NULL,
  `product_description` text,
  `product_time` varchar(20) DEFAULT NULL,
  `product_score` double DEFAULT NULL,
  `product_status` int DEFAULT NULL,
  `id_bussines` varchar(50) NOT NULL,
  `id_product_category` varchar(50) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `id_bussines` (`id_bussines`),
  KEY `id_product_category` (`id_product_category`),
  CONSTRAINT `t_product_ibfk_1` FOREIGN KEY (`id_bussines`) REFERENCES `t_bussines` (`bussines_id`),
  CONSTRAINT `t_product_ibfk_2` FOREIGN KEY (`id_product_category`) REFERENCES `t_product_category` (`product_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_product`
--

LOCK TABLES `t_product` WRITE;
/*!40000 ALTER TABLE `t_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_product_category`
--

DROP TABLE IF EXISTS `t_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_product_category` (
  `product_category_id` varchar(50) NOT NULL,
  `product_category_name` varchar(50) DEFAULT NULL COMMENT ' BEBIDA, JUGO, CEVICHE',
  `product_category_image` varchar(100) DEFAULT NULL,
  `product_category_desdcription` varchar(100) DEFAULT NULL,
  `product_category_status` int DEFAULT NULL,
  `prodcut_category_order` int DEFAULT NULL,
  PRIMARY KEY (`product_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_product_category`
--

LOCK TABLES `t_product_category` WRITE;
/*!40000 ALTER TABLE `t_product_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_product_offer`
--

DROP TABLE IF EXISTS `t_product_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_product_offer` (
  `t_product_offer_id` varchar(50) NOT NULL,
  `id_offer` varchar(50) NOT NULL,
  `id_product` varchar(50) NOT NULL,
  PRIMARY KEY (`t_product_offer_id`),
  KEY `id_offer` (`id_offer`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `t_product_offer_ibfk_1` FOREIGN KEY (`id_offer`) REFERENCES `t_offer` (`offer_id`),
  CONSTRAINT `t_product_offer_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `t_product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_product_offer`
--

LOCK TABLES `t_product_offer` WRITE;
/*!40000 ALTER TABLE `t_product_offer` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_product_offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_producto_ingredient`
--

DROP TABLE IF EXISTS `t_producto_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_producto_ingredient` (
  `product_ingredient_id` varchar(50) NOT NULL,
  `product_ingredient_porcent` double DEFAULT NULL,
  `product_ingredient_description` text,
  `id_ingredient` varchar(50) NOT NULL,
  `id_product` varchar(50) NOT NULL,
  PRIMARY KEY (`product_ingredient_id`),
  KEY `id_ingredient` (`id_ingredient`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `t_producto_ingredient_ibfk_1` FOREIGN KEY (`id_ingredient`) REFERENCES `t_ingredient` (`ingredient_id`),
  CONSTRAINT `t_producto_ingredient_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `t_product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_producto_ingredient`
--

LOCK TABLES `t_producto_ingredient` WRITE;
/*!40000 ALTER TABLE `t_producto_ingredient` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_producto_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_role` (
  `role_id` varchar(50) NOT NULL,
  `role_name` varchar(50) DEFAULT NULL COMMENT 'ADMIN, CAJA,ETC.',
  `role_permision` json DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role`
--

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_soat`
--

DROP TABLE IF EXISTS `t_soat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_soat` (
  `soat_id` varchar(50) NOT NULL,
  `soat_code` varchar(20) DEFAULT NULL,
  `soat_image` varchar(100) DEFAULT NULL,
  `soat_description` text,
  `soat_status` int DEFAULT NULL,
  `id_driver` varchar(50) NOT NULL,
  PRIMARY KEY (`soat_id`),
  KEY `id_driver` (`id_driver`),
  CONSTRAINT `t_soat_ibfk_1` FOREIGN KEY (`id_driver`) REFERENCES `t_driver` (`driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_soat`
--

LOCK TABLES `t_soat` WRITE;
/*!40000 ALTER TABLE `t_soat` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_soat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_suggestions`
--

DROP TABLE IF EXISTS `t_suggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_suggestions` (
  `suggestion_id` varchar(50) NOT NULL,
  `suggestion_description` varchar(100) DEFAULT NULL,
  `suggestion_status` int DEFAULT NULL,
  `id_user` varchar(50) NOT NULL,
  PRIMARY KEY (`suggestion_id`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `t_suggestions_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `t_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_suggestions`
--

LOCK TABLES `t_suggestions` WRITE;
/*!40000 ALTER TABLE `t_suggestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_suggestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_type_payment`
--

DROP TABLE IF EXISTS `t_type_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_type_payment` (
  `type_payment_id` varchar(50) NOT NULL,
  `type_payment_name` varchar(20) DEFAULT NULL,
  `type_payment_image` varchar(100) DEFAULT NULL,
  `type_payment_status` int DEFAULT NULL,
  PRIMARY KEY (`type_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_type_payment`
--

LOCK TABLES `t_type_payment` WRITE;
/*!40000 ALTER TABLE `t_type_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_type_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user` (
  `user_id` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_surnames` varchar(50) NOT NULL,
  `user_address` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_telephone` varchar(9) NOT NULL,
  `user_image` varchar(200) DEFAULT NULL,
  `user_score` double NOT NULL DEFAULT '0',
  `user_point` double NOT NULL DEFAULT '0',
  `user_gender` varchar(20) DEFAULT NULL,
  `user_location` varchar(100) DEFAULT NULL,
  `user_birth_date` date DEFAULT NULL,
  `user_membership_level` int DEFAULT NULL,
  `user_status` int DEFAULT NULL,
  `user_date_created` datetime DEFAULT NULL,
  `user_date_edit` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_vehicle_type`
--

DROP TABLE IF EXISTS `t_vehicle_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_vehicle_type` (
  `vehicle_type_id` varchar(50) NOT NULL,
  `vehicle_type_name` varchar(20) DEFAULT NULL,
  `vehicle_type_image` varchar(100) DEFAULT NULL,
  `vehicle_type_status` int DEFAULT NULL,
  PRIMARY KEY (`vehicle_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_vehicle_type`
--

LOCK TABLES `t_vehicle_type` WRITE;
/*!40000 ALTER TABLE `t_vehicle_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_vehicle_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-21 16:41:00
