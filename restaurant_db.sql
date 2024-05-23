-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: restaurant_db
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `line1` varchar(45) NOT NULL,
  `line2` varchar(45) NOT NULL,
  `city_id` int NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `fk_address_city1_idx` (`city_id`),
  CONSTRAINT `fk_address_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'I 52/2','Pannala North Ampagala',38),(2,'I 105','Bauddaloka Mawatha',31),(3,'Kompanyawidiya Rathinkya Mawath','Colombo',31);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beverage_has_volume`
--

DROP TABLE IF EXISTS `beverage_has_volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beverage_has_volume` (
  `id` int NOT NULL AUTO_INCREMENT,
  `beverage_id` int NOT NULL,
  `volume_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_beverages_has_volume_volume1_idx` (`volume_id`),
  KEY `fk_beverages_has_volume_beverages1_idx` (`beverage_id`),
  CONSTRAINT `fk_beverages_has_volume_beverages1` FOREIGN KEY (`beverage_id`) REFERENCES `beverageType` (`beverage_id`),
  CONSTRAINT `fk_beverages_has_volume_volume1` FOREIGN KEY (`volume_id`) REFERENCES `volume` (`volume_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beverage_has_volume`
--

LOCK TABLES `beverage_has_volume` WRITE;
/*!40000 ALTER TABLE `beverage_has_volume` DISABLE KEYS */;
/*!40000 ALTER TABLE `beverage_has_volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beverageType`
--

DROP TABLE IF EXISTS `beverageType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beverageType` (
  `beverage_id` int NOT NULL AUTO_INCREMENT,
  `beverage_name` varchar(45) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`beverage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beverageType`
--

LOCK TABLES `beverageType` WRITE;
/*!40000 ALTER TABLE `beverageType` DISABLE KEYS */;
/*!40000 ALTER TABLE `beverageType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `cityname` varchar(45) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (27,'Ampara'),(28,'Anuradhapura'),(29,'Badulla'),(30,'Batticaloa'),(31,'Colombo'),(32,'Galle'),(33,'Gampaha'),(34,'Hambantota'),(35,'Jaffna'),(36,'Kalutara'),(37,'Kandy'),(38,'Kegalle'),(39,'Kilinochchi'),(40,'Kurunegala'),(41,'Mannar'),(42,'Matale'),(43,'Matara'),(44,'Monaragala'),(45,'Mullaitivu'),(46,'Nuwara Eliya'),(47,'Polonnaruwa'),(48,'Puttalam'),(49,'Ratnapura'),(50,'Trincomalee'),(51,'Vavuniya');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `company_id` int NOT NULL AUTO_INCREMENT,
  `companyname` varchar(45) NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_mobile` varchar(10) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `points` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`customer_mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('0715533553','Kalum','Srimal',0),('0715544343','Test','Customer',0),('0771122333','Customer','Test',0),('0773322332','LLLL','AAAA',0),('0779988999','iiiiisadas','adadsd',0),('0781122333','AAA','BBB',0),('0785555555','MMMM','LLLL',0),('0788877666','Gijjkp','asfdsf',0);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_has_reserve_table`
--

DROP TABLE IF EXISTS `customer_has_reserve_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_has_reserve_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_mobile` varchar(10) NOT NULL,
  `reserve_table_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_customer_has_reserve_table_reserve_table1_idx` (`reserve_table_id`),
  KEY `fk_customer_has_reserve_table_customer1_idx` (`customer_mobile`),
  CONSTRAINT `fk_customer_has_reserve_table_customer1` FOREIGN KEY (`customer_mobile`) REFERENCES `customer` (`customer_mobile`),
  CONSTRAINT `fk_customer_has_reserve_table_reserve_table1` FOREIGN KEY (`reserve_table_id`) REFERENCES `reserve_table` (`reserve_table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_has_reserve_table`
--

LOCK TABLES `customer_has_reserve_table` WRITE;
/*!40000 ALTER TABLE `customer_has_reserve_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_has_reserve_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drinkType`
--

DROP TABLE IF EXISTS `drinkType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drinkType` (
  `drink_id` int NOT NULL AUTO_INCREMENT,
  `drink_name` varchar(45) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`drink_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drinkType`
--

LOCK TABLES `drinkType` WRITE;
/*!40000 ALTER TABLE `drinkType` DISABLE KEYS */;
/*!40000 ALTER TABLE `drinkType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `nic` varchar(12) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `password` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `employee_type_id` int NOT NULL,
  `status_id` int NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `fk_employee_status_idx` (`status_id`),
  KEY `fk_employee_employee_type1_idx` (`employee_type_id`),
  KEY `fk_employee_address1_idx` (`address_id`),
  CONSTRAINT `fk_employee_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `fk_employee_employee_type1` FOREIGN KEY (`employee_type_id`) REFERENCES `employee_type` (`employee_type_id`),
  CONSTRAINT `fk_employee_status` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (2,'Gihan','Punarji','200204301186','0715327065','123','2024-05-18',1,1,1),(3,'Suneth','Navodya','200135503730','0771122334','123','2024-05-18',1,1,2),(4,'Ayodya','Ranasinghe','200177401190','0763420783','666','2024-05-22',1,1,3);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_type`
--

DROP TABLE IF EXISTS `employee_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_type` (
  `employee_type_id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`employee_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_type`
--

LOCK TABLES `employee_type` WRITE;
/*!40000 ALTER TABLE `employee_type` DISABLE KEYS */;
INSERT INTO `employee_type` VALUES (1,'Admin'),(2,'Cashier');
/*!40000 ALTER TABLE `employee_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_has_size`
--

DROP TABLE IF EXISTS `food_has_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_has_size` (
  `id` int NOT NULL AUTO_INCREMENT,
  `food_type_id` int NOT NULL,
  `meal_size_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_foodType_has_meal_size_meal_size1_idx` (`meal_size_id`),
  KEY `fk_foodType_has_meal_size_foodType1_idx` (`food_type_id`),
  CONSTRAINT `fk_foodType_has_meal_size_foodType1` FOREIGN KEY (`food_type_id`) REFERENCES `food_type` (`food_type_id`),
  CONSTRAINT `fk_foodType_has_meal_size_meal_size1` FOREIGN KEY (`meal_size_id`) REFERENCES `meal_size` (`meal_size_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_has_size`
--

LOCK TABLES `food_has_size` WRITE;
/*!40000 ALTER TABLE `food_has_size` DISABLE KEYS */;
/*!40000 ALTER TABLE `food_has_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_type`
--

DROP TABLE IF EXISTS `food_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_type` (
  `food_type_id` int NOT NULL AUTO_INCREMENT,
  `food_type_name` varchar(45) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`food_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_type`
--

LOCK TABLES `food_type` WRITE;
/*!40000 ALTER TABLE `food_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `food_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grn`
--

DROP TABLE IF EXISTS `grn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grn` (
  `grn_id` int NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `total` double NOT NULL,
  `supplier_mobile` varchar(10) NOT NULL,
  PRIMARY KEY (`grn_id`),
  KEY `fk_grn_supplier1_idx` (`supplier_mobile`),
  CONSTRAINT `fk_grn_supplier1` FOREIGN KEY (`supplier_mobile`) REFERENCES `supplier` (`supplier_mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grn`
--

LOCK TABLES `grn` WRITE;
/*!40000 ALTER TABLE `grn` DISABLE KEYS */;
/*!40000 ALTER TABLE `grn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grn_item`
--

DROP TABLE IF EXISTS `grn_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grn_item` (
  `grn_item_id` int NOT NULL AUTO_INCREMENT,
  `ingredients_id` int NOT NULL,
  `qty` int NOT NULL,
  `buying_price` double NOT NULL,
  `grn_id` int NOT NULL,
  PRIMARY KEY (`grn_item_id`),
  KEY `fk_grn_item_grn1_idx` (`grn_id`),
  KEY `fk_grn_item_ingredients1_idx` (`ingredients_id`),
  CONSTRAINT `fk_grn_item_grn1` FOREIGN KEY (`grn_id`) REFERENCES `grn` (`grn_id`),
  CONSTRAINT `fk_grn_item_ingredients1` FOREIGN KEY (`ingredients_id`) REFERENCES `ingredients` (`ingredients_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grn_item`
--

LOCK TABLES `grn_item` WRITE;
/*!40000 ALTER TABLE `grn_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `grn_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `ingredients_id` int NOT NULL AUTO_INCREMENT,
  `ingredients_name` varchar(45) NOT NULL,
  PRIMARY KEY (`ingredients_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `invoice_id` int NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `total` double NOT NULL,
  `customer_mobile` varchar(10) NOT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `fk_invoice_customer1_idx` (`customer_mobile`),
  CONSTRAINT `fk_invoice_customer1` FOREIGN KEY (`customer_mobile`) REFERENCES `customer` (`customer_mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_item`
--

DROP TABLE IF EXISTS `invoice_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_item` (
  `invoice_item_id` int NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL,
  `invoice_id` int NOT NULL,
  `food_id` int NOT NULL,
  `beverages_id` int DEFAULT NULL,
  `Item_id` int NOT NULL,
  PRIMARY KEY (`invoice_item_id`),
  KEY `fk_invoice_item_invoice1_idx` (`invoice_id`),
  KEY `fk_invoice_item_MenuItem1_idx` (`Item_id`),
  CONSTRAINT `fk_invoice_item_invoice1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`invoice_id`),
  CONSTRAINT `fk_invoice_item_MenuItem1` FOREIGN KEY (`Item_id`) REFERENCES `menuitem` (`ItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_item`
--

LOCK TABLES `invoice_item` WRITE;
/*!40000 ALTER TABLE `invoice_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal_size`
--

DROP TABLE IF EXISTS `meal_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal_size` (
  `meal_size_id` int NOT NULL AUTO_INCREMENT,
  `meal_size_name` varchar(45) NOT NULL,
  PRIMARY KEY (`meal_size_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal_size`
--

LOCK TABLES `meal_size` WRITE;
/*!40000 ALTER TABLE `meal_size` DISABLE KEYS */;
/*!40000 ALTER TABLE `meal_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitem`
--

DROP TABLE IF EXISTS `menuitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuitem` (
  `ItemId` int NOT NULL AUTO_INCREMENT,
  `food_type_id` int NOT NULL,
  `drink_id` int NOT NULL,
  `beverage_id` int NOT NULL,
  PRIMARY KEY (`ItemId`),
  KEY `fk_MenuItem_foodType1_idx` (`food_type_id`),
  KEY `fk_MenuItem_drinkTable1_idx` (`drink_id`),
  KEY `fk_MenuItem_beverages1_idx` (`beverage_id`),
  CONSTRAINT `fk_MenuItem_beverages1` FOREIGN KEY (`beverage_id`) REFERENCES `beverageType` (`beverage_id`),
  CONSTRAINT `fk_MenuItem_drinkTable1` FOREIGN KEY (`drink_id`) REFERENCES `drinkType` (`drink_id`),
  CONSTRAINT `fk_MenuItem_foodType1` FOREIGN KEY (`food_type_id`) REFERENCES `food_type` (`food_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitem`
--

LOCK TABLES `menuitem` WRITE;
/*!40000 ALTER TABLE `menuitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `menuitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserve_table`
--

DROP TABLE IF EXISTS `reserve_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserve_table` (
  `reserve_table_id` int NOT NULL AUTO_INCREMENT,
  `status_id` int NOT NULL,
  PRIMARY KEY (`reserve_table_id`),
  KEY `fk_reserve_table_status1_idx` (`status_id`),
  CONSTRAINT `fk_reserve_table_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserve_table`
--

LOCK TABLES `reserve_table` WRITE;
/*!40000 ALTER TABLE `reserve_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `reserve_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary` (
  `salary_id` int NOT NULL AUTO_INCREMENT,
  `salary_date` date NOT NULL,
  `amount` double NOT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`salary_id`),
  KEY `fk_salary_employee1_idx` (`employee_id`),
  CONSTRAINT `fk_salary_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Active'),(2,'Inactive');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `stock_id` int NOT NULL AUTO_INCREMENT,
  `ingredients_id` int NOT NULL,
  `qty` int NOT NULL,
  `status_id` int NOT NULL,
  PRIMARY KEY (`stock_id`),
  KEY `fk_stock_ingredients1_idx` (`ingredients_id`),
  KEY `fk_stock_status1_idx` (`status_id`),
  CONSTRAINT `fk_stock_ingredients1` FOREIGN KEY (`ingredients_id`) REFERENCES `ingredients` (`ingredients_id`),
  CONSTRAINT `fk_stock_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `supplier_mobile` varchar(10) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `company_id` int NOT NULL,
  PRIMARY KEY (`supplier_mobile`),
  KEY `fk_supplier_company1_idx` (`company_id`),
  CONSTRAINT `fk_supplier_company1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume`
--

DROP TABLE IF EXISTS `volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volume` (
  `volume_id` int NOT NULL AUTO_INCREMENT,
  `volume_name` varchar(45) NOT NULL,
  PRIMARY KEY (`volume_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume`
--

LOCK TABLES `volume` WRITE;
/*!40000 ALTER TABLE `volume` DISABLE KEYS */;
/*!40000 ALTER TABLE `volume` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-23 10:22:56
