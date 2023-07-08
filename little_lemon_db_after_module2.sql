-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: project_little_lemon_db
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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `AdsressID` int NOT NULL AUTO_INCREMENT,
  `Postcode` varchar(45) NOT NULL,
  `Street` varchar(255) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AdsressID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'10001','First Street','Lorem ipsum dolor sit amet.'),(2,'20002','Second Street','Consectetur adipiscing elit.'),(3,'30003','Third Street',NULL),(4,'40004','Fourth Street','Nulla facilisi.');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `TableNo` int NOT NULL,
  `CustomerID` int NOT NULL,
  `BookingSlot` time NOT NULL,
  `EmployeeID` int NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `employeeid_fk_idx` (`EmployeeID`),
  KEY `customerid_fk_idx` (`CustomerID`),
  CONSTRAINT `customerid_fk` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employeeid_fk` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,12,1,'19:00:00',1),(2,12,2,'19:00:00',1),(3,19,7,'15:00:00',3),(5,5,4,'18:30:00',2),(6,8,5,'20:00:00',5),(10,4,2,'13:00:00',2),(11,1,4,'16:00:00',3),(12,7,2,'05:00:00',6),(13,2,2,'10:00:00',1),(14,4,2,'13:00:00',2),(15,1,4,'16:00:00',3),(16,7,2,'05:00:00',6),(18,2,2,'11:00:00',2),(19,4,1,'11:00:00',2);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(255) NOT NULL,
  `ContuctNumber` int NOT NULL,
  `Email` varchar(255) NOT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'John Smith',123456790,'john.smith@example.com'),(2,'Jane Doe',987654321,'jane.doe@example.com'),(3,'Michael Brown',55514567,'michael.brown@example.com'),(4,'Sarah Johnson',22234444,'sarah.johnson@example.com'),(5,'David Lee',99988877,'david.lee@example.com'),(6,'Emily Wilson',11122333,'emily.wilson@example.com'),(7,'Robert Davis',44455666,'robert.davis@example.com');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `DeliveryID` int NOT NULL AUTO_INCREMENT,
  `DeliveryDate` date NOT NULL,
  `OrderID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `AddressID` int NOT NULL,
  `Status` varchar(45) NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  KEY `orderid_fk_idx` (`OrderID`),
  KEY `addresid_fk_idx` (`AddressID`),
  KEY `customerid_fk_idx` (`CustomerID`),
  CONSTRAINT `addresid_fk` FOREIGN KEY (`AddressID`) REFERENCES `addresses` (`AdsressID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customeriddelivery_fk` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `orderid_fk` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,'2023-07-01',1,1,1,'Delivered'),(2,'2023-07-02',2,2,2,'In Transit'),(3,'2023-07-03',3,3,3,'Pending');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(255) NOT NULL,
  `Role` varchar(100) NOT NULL,
  `Contact_Number` int NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Annual_Salary` varchar(100) NOT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Mario Gollini','Manager',211324654,'Mario.g@littlelemon.com','$70,000'),(2,'Adrian Gollini','Assistant Manager',351474048,'Adrian.g@littlelemon.com','$65,000'),(3,'Giorgos Dioudis','Head Chef',351970582,'Giorgos.d@littlelemon.com','$50,000'),(4,'Fatma Kaya','Assistant Chef',121463569,'Fatma.k@littlelemon.com','$45,000'),(5,'Elena Salvai','Head Waiter',351074198,'Elena.s@littlelemon.com','$40,000'),(6,'John Millar','Receptionist',351584508,'John.m@littlelemon.com','$35,000');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `MenuID` int NOT NULL,
  `ItemID` int NOT NULL,
  `Cuisine` varchar(100) NOT NULL,
  PRIMARY KEY (`MenuID`),
  KEY `itemid_fk_idx` (`ItemID`),
  CONSTRAINT `itemid_fk` FOREIGN KEY (`ItemID`) REFERENCES `menuitems` (`ItemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,'Greek'),(2,7,'Greek'),(3,10,'Greek'),(4,13,'Greek'),(5,3,'Italian'),(6,9,'Italian'),(7,12,'Italian'),(8,15,'Italian'),(9,5,'Turkish'),(10,17,'Turkish'),(11,11,'Turkish'),(12,16,'Turkish');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitems`
--

DROP TABLE IF EXISTS `menuitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuitems` (
  `ItemID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(200) NOT NULL,
  `Type` varchar(100) NOT NULL,
  `Price` int NOT NULL,
  PRIMARY KEY (`ItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitems`
--

LOCK TABLES `menuitems` WRITE;
/*!40000 ALTER TABLE `menuitems` DISABLE KEYS */;
INSERT INTO `menuitems` VALUES (1,'Olives','Starters',5),(2,'Flatbread','Starters',5),(3,'Minestrone','Starters',8),(4,'Tomato bread','Starters',8),(5,'Falafel','Starters',7),(6,'Hummus','Starters',5),(7,'Greek salad','Main Courses',15),(8,'Bean soup','Main Courses',12),(9,'Pizza','Main Courses',15),(10,'Greek yoghurt','Desserts',7),(11,'Ice cream','Desserts',6),(12,'Cheesecake','Desserts',4),(13,'Athens White wine','Drinks',25),(14,'Corfu Red Wine','Drinks',30),(15,'Turkish Coffee','Drinks',10),(16,'Turkish Coffee','Drinks',10),(17,'Kabasa','Main Courses',17);
/*!40000 ALTER TABLE `menuitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newbookings`
--

DROP TABLE IF EXISTS `newbookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newbookings` (
  `NewBookingID` int NOT NULL AUTO_INCREMENT,
  `BookingSlot` time NOT NULL,
  `TableNo` int NOT NULL,
  `BookingID` int DEFAULT NULL,
  PRIMARY KEY (`NewBookingID`),
  KEY `bookingid_tonew_fk_idx` (`BookingID`),
  CONSTRAINT `bookingid_tonew_fk` FOREIGN KEY (`BookingID`) REFERENCES `bookings` (`BookingID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newbookings`
--

LOCK TABLES `newbookings` WRITE;
/*!40000 ALTER TABLE `newbookings` DISABLE KEYS */;
INSERT INTO `newbookings` VALUES (1,'11:00:00',2,NULL);
/*!40000 ALTER TABLE `newbookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL,
  `TableNo` int NOT NULL,
  `MenuID` int NOT NULL,
  `BookingID` int NOT NULL,
  `BillAmount` int NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `menuid__fk_idx` (`MenuID`),
  KEY `bookingid_fk_idx` (`BookingID`),
  CONSTRAINT `bookingid_fk` FOREIGN KEY (`BookingID`) REFERENCES `bookings` (`BookingID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `menuid__fk` FOREIGN KEY (`MenuID`) REFERENCES `menu` (`MenuID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,1,5011,2),(2,2,2,2,112,1),(3,3,3,3,123,3),(6,6,4,6,226,2);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ordersview`
--

DROP TABLE IF EXISTS `ordersview`;
/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ordersview` AS SELECT 
 1 AS `OrderID`,
 1 AS `Quantity`,
 1 AS `Cost`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `ordersview`
--

/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ordersview` AS select `orders`.`OrderID` AS `OrderID`,`orders`.`Quantity` AS `Quantity`,`orders`.`BillAmount` AS `Cost` from `orders` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-08 15:11:23
