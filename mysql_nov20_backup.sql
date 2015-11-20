-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: appBuild
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `billno`
--

DROP TABLE IF EXISTS `billno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billno` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `dcNum` varchar(5) NOT NULL,
  `quotationNum` varchar(5) NOT NULL,
  `invoiceNum` varchar(5) NOT NULL,
  `user_account` int(11) NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `user_account` (`user_account`),
  CONSTRAINT `billno_ibfk_1` FOREIGN KEY (`user_account`) REFERENCES `user_accounts` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billno`
--

LOCK TABLES `billno` WRITE;
/*!40000 ALTER TABLE `billno` DISABLE KEYS */;
INSERT INTO `billno` VALUES (1,'1','1','1',1),(2,'1','1','1',3);
/*!40000 ALTER TABLE `billno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customermaster`
--

DROP TABLE IF EXISTS `customermaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customermaster` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(11) DEFAULT NULL,
  `company` varchar(11) DEFAULT NULL,
  `address` varchar(11) DEFAULT NULL,
  `tin` varchar(25) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `fax` varchar(15) NOT NULL,
  `email` varchar(75) NOT NULL,
  `type` varchar(11) DEFAULT NULL,
  `desc` text,
  `active` int(2) NOT NULL,
  `addedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_account` varchar(11) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customermaster`
--

LOCK TABLES `customermaster` WRITE;
/*!40000 ALTER TABLE `customermaster` DISABLE KEYS */;
INSERT INTO `customermaster` VALUES (9,'Ahmed','indotech','Secunderaba','123456789','9395306191','2345678','234567890','indotech@gmail.com','software','development company',1,'2015-11-20 16:48:21','1');
/*!40000 ALTER TABLE `customermaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dcreport`
--

DROP TABLE IF EXISTS `dcreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dcreport` (
  `did` int(10) NOT NULL AUTO_INCREMENT,
  `customer` varchar(150) NOT NULL,
  `company` varchar(150) NOT NULL,
  `address` text NOT NULL,
  `billno` varchar(10) DEFAULT NULL,
  `billDate` varchar(20) NOT NULL,
  `dcItemList` text NOT NULL,
  `grandTotal` text NOT NULL,
  `discount` text NOT NULL,
  `vat` text NOT NULL,
  `totalAmount` text NOT NULL,
  `deliveryAddress` text NOT NULL,
  `active` tinyint(1) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_account` int(11) NOT NULL,
  PRIMARY KEY (`did`),
  KEY `user_account` (`user_account`),
  KEY `user_account_2` (`user_account`),
  CONSTRAINT `dcreport_ibfk_1` FOREIGN KEY (`user_account`) REFERENCES `user_accounts` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcreport`
--

LOCK TABLES `dcreport` WRITE;
/*!40000 ALTER TABLE `dcreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `dcreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemmaster`
--

DROP TABLE IF EXISTS `itemmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `itemmaster` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `unit` varchar(15) CHARACTER SET utf8 NOT NULL,
  `vat` varchar(5) CHARACTER SET utf8 NOT NULL,
  `desc` text CHARACTER SET utf8,
  `active` int(2) NOT NULL,
  `addedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_account` varchar(11) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemmaster`
--

LOCK TABLES `itemmaster` WRITE;
/*!40000 ALTER TABLE `itemmaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_accounts`
--

DROP TABLE IF EXISTS `user_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_accounts` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 NOT NULL,
  `personName` varchar(50) CHARACTER SET utf8 NOT NULL,
  `company` varchar(50) CHARACTER SET utf8 NOT NULL,
  `caption` text CHARACTER SET utf8 NOT NULL,
  `companyType` varchar(50) CHARACTER SET utf8 NOT NULL,
  `accountType` varchar(50) CHARACTER SET utf8 NOT NULL,
  `introduction` varchar(50) CHARACTER SET utf8 NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 NOT NULL,
  `secretQuestion` varchar(255) CHARACTER SET utf8 NOT NULL,
  `secretAnswer` text CHARACTER SET utf8 NOT NULL,
  `quotationMessage` text CHARACTER SET utf8 NOT NULL,
  `terms` text CHARACTER SET utf8 NOT NULL,
  `loggedat` varchar(15) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_accounts`
--

LOCK TABLES `user_accounts` WRITE;
/*!40000 ALTER TABLE `user_accounts` DISABLE KEYS */;
INSERT INTO `user_accounts` VALUES (1,'giriy','admin','Giriy Poshaneeshwar','icsitpark','','software','admin','we are the leading web designing and development c','icsitpar','info@icsitpark.com','7893585898','','','','','',''),(3,'ahmed','ahmed','Taj Ahmed','indotech','technologies','software','annual','this is introduction','','indotech06@gmail.com','9395306161','secunderabad','','','','','');
/*!40000 ALTER TABLE `user_accounts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-20 22:51:59
