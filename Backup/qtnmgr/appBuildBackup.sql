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
  `dc` varchar(5) NOT NULL,
  `qtn` varchar(5) NOT NULL,
  `inv` varchar(5) NOT NULL,
  `user_account` int(11) NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `user_account` (`user_account`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billno`
--

LOCK TABLES `billno` WRITE;
/*!40000 ALTER TABLE `billno` DISABLE KEYS */;
INSERT INTO `billno` VALUES (1,'13','1','1',1),(2,'1','1','1',2);
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
  `name` varchar(150) NOT NULL,
  `company` varchar(150) NOT NULL,
  `address` text NOT NULL,
  `tin` varchar(25) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `fax` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `type` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `active` int(2) NOT NULL,
  `addedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_account` varchar(11) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customermaster`
--

LOCK TABLES `customermaster` WRITE;
/*!40000 ALTER TABLE `customermaster` DISABLE KEYS */;
INSERT INTO `customermaster` VALUES (3,'AZIZ','AL-AQMAR HYDRAULIC PVT LTD','Ranigunj Secunderabad','3698909889789','980929123010','040','040','admin@alaqmar.in','MANUFACTURING & ASSEMBLER','MANUFACTURING / ASSEMBLER / STOCKIEST',1,'2015-11-29 07:03:28','1'),(4,'KALPESH','SARAH ENTERPRISES','ranigunj','932048234989','98898239292','040','040','sarah.enterprises@gmail.com','DEALER TIGER','DEALER / STOCKIEST - SAFETY ITEMS',1,'2015-11-29 07:05:10','1'),(6,'Kalpesh Petel','SARAH ENTERPRISES','5-1-526, 2nd Floor, Ranigunj, Secunderabad','36541236548','9859854125','9854922586','040','sarah.enterprises@gmail.com','Distributor','Sahara',1,'2015-12-12 13:23:25','2'),(7,'Pradeep Pendyala','DR.PRADEEP','Shivaram Pally, Rejendranagar, Hyderabad','NIL','9848150333','9848150333','040','NIL','HOSPITAL','',1,'2015-12-05 09:18:11','2'),(8,'SANTOSH REDDY','SANTOSH ENTERPRISES','SECOND FLOOR GANJI COMPLEX RANIGUNJ','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 05:26:48','2'),(9,'ALI','ALI SAFDAR BHAI FOCUS','SECOND FLOOR GANJI COMPLEX','040','040','040','040','TEST@GMAIL.COM','ACCOUNTS','ACCOUNTS',1,'2015-12-08 05:27:50','2'),(10,'ASHFAQ','PIONEER TRADING CORPORATION','SECOND FLOOR GANJI COMLEX','040','040','040','040','TEST@GMAIL.COM','TRADING','TRAIDING',1,'2015-12-08 05:29:02','2'),(11,'SHARMA','SRUTHI ENTERPRISES','ground floor ganji complex','040','040','040','040','test@gmail.com','TRADING','TRADING',1,'2015-12-08 05:30:01','2'),(12,'VENKATESH','SRI LAXMI AGENCIES','second floor ganji complex','040','040','040','040','test@gmail.com','TRADING','TRADING',1,'2015-12-08 05:31:59','2'),(13,'HASAN','B.A.TRADERS','HILL STREET RANIGUNJ','040','040','040','040','test@gmail.com','TRADING','TRADING',1,'2015-12-08 05:33:36','2'),(14,'JUZER','DYNAMIC INDUSTRIAL','HILL STREET RANIGUNJ SECUNDERABAD','040','040','04027711118','040','test@gmail.com','TRADING','',1,'2015-12-12 00:23:31','2'),(15,'HUSSAIN RANGOONWALA','RANGOON MILLS STORES','hill street ranigunj secunderabad','040','040','040','040','test@gmail.com','TRADING','TRADING',1,'2015-12-08 05:35:53','2'),(16,'UDAY','KEMPLAST ASBESTORS','ranigunj secunderabad','040','040','040','040','test@gmail.com','TRADING','TRADING',1,'2015-12-08 05:36:59','2'),(17,'MURTAZA','CHAINS & SPARES CORPORATION','hill street ranigunj secunderabad','040','040','040','040','test@gmail.com','TRADING','TRADING',1,'2015-12-08 05:38:27','2'),(18,'SAIFI BHAI','MUSTANSIR ENTERPRISES','HILL STREET RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 05:39:32','2'),(19,'VINAY','SRI BALAJI INDUSTRIES','HILL STREET RANIGUNJ','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 05:40:53','2'),(20,'JUZER','INDUSTRIAL TOOLS & HARDWARE SYNDICATE','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 05:42:01','2'),(21,'SHAMUN BHAI','APEX ENGINEERING CORPN','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 05:42:40','2'),(22,'SHABBIR','HONESTY TOOLS & HARDWARE','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 05:43:52','2'),(23,'MOHAMMED','RELIABLE ENGINEERING','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 05:44:48','2'),(24,'Nimesh Jain','RATANMANI METALS','4-2-245 To 250/3 Old Bhoiguda Mhankali Street Ranigunj Secundrabd -3','040','9391005171','04023896429','040','TEST@GMAIL.COM','TRADING','',1,'2015-12-08 23:26:27','2'),(25,'AZIZ','AL-AQMAR HYDRAULIC PVT LTD','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 05:48:09','2'),(26,'IDRISE','TEXEL ENGINEERING','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 05:48:57','2'),(27,'SHABBIR','ALLIED INDUSTRIAL PRODUCTS','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 05:50:07','2'),(28,'AKBER','SUMMIT TOOLS','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 05:51:07','2'),(29,'HUSSAIN','INDIAN FASTNERS','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 05:53:21','2'),(30,'HUZEFA','CENTRAL TRADING CORPORATION','ranigunj secunderabad','040','040','040','040','test@gmail.com','TRADING','TRADING',1,'2015-12-08 05:57:45','2'),(31,'JAWEED','J.K.ENTERPRISES','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 05:59:39','2'),(32,'ALIF','ALIF TRADING CORPN','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:00:55','2'),(33,'KAID ZOHAR','M.B.ENTERPRISES','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:02:18','2'),(34,'HUNAID BHAI','M.B.TRADERS','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:04:44','2'),(40,'BANTI SIR','RAMAN TRADING CO.','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:07:23','2'),(41,'BANTI SIR','RAMAN FASTNERS','ranigunj secunderabad','040','040','040','040','test@gmail.com','TRADING','TRADING',1,'2015-12-08 06:07:59','2'),(42,'BANTI SIR','SAGAR SONS','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:08:59','2'),(43,'BANTI SIR','SWARNA SAGAR','RANIGUNJ SECUNDERBAD','040','040','040','040','TEST@GMAL.COM','TRADING','TRADING',1,'2015-12-08 06:09:42','2'),(44,'NRTOOLS','N.R.TOOLS','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:10:30','2'),(45,'BURHANI TRADING','BURHANI TRADING','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:11:50','2'),(46,'SAIFI BHAI','QUBIA ENTERPRISES','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:13:06','2'),(47,'SRINIVAS','MARGADARSHI ENGINEERING CO','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:14:26','2'),(48,'GOGI','GOGI ENGINEERING CO','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:15:15','2'),(49,'MOHAMMED BHAI','GEM PRESSURE SYSTEMS (I) PVT LTD','BALAPOOR SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:16:18','2'),(50,'YUSUF BHAI','GEM ENGG. INDUSTRIES (I) PVT LTD','cherlapally hyderabad','040','040','040','040','test@gmail.com','MANUFACTURERS','TRADING',1,'2015-12-08 06:17:09','2'),(51,'MUSTAFA BHAI','MISHKAT ENGG.','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:18:26','2'),(52,'MOIZ BHAI','BOMBAY GENERAL','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:19:15','2'),(53,'HUZEFA','CONTINENTAL TOOLS & HARDWARE','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:20:05','2'),(54,'HAMIDSONS','HAMIDSONS SECURITIES','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:21:24','2'),(55,'KUSHAI','ENGG. SUPPLY AGENCIES','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:22:28','2'),(56,'RCI','INDUSTRIAL EQUIPMENT CENTRE','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','RANIGUNJ SECUNDERABAD','TRADING',1,'2015-12-08 06:25:04','2'),(57,'HUSSAIN','CONTINENTAL TRADING CO','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:27:18','2'),(58,'SHABBIR','WESTERN TRADING','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:33:37','2'),(59,'HASAN','BRILLIENT HARDWARE & INSTRUMENTS','RANIGUNJ SECUNDERABAD','040','040','040','040','test@gmail.com','TRADING','TRADING',1,'2015-12-08 06:34:43','2'),(60,'HUSSAIN','EMERALD ENTERPRISES','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:35:46','2'),(61,'MOIZ','M.S.TRADERS','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:36:24','2'),(62,'HUSSAIN','ATLAS ENTERPRISES','RANIGUNJ','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:37:00','2'),(63,'NAGINA','NAGINA INDUSTRIAL CORPN','RANIGUNJ SECUNDERBAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:37:44','2'),(64,'PRADEEP','PIPE HOUSE','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@gmail.com','TRADING','TRADING',1,'2015-12-08 06:38:38','2'),(65,'MUFADDAL','NOBLE TRADING CORPN','RANIGUNJ SECUNDERABAD','040','040','040','040','040','TRADING','TRADING',1,'2015-12-08 06:40:39','2'),(66,'MUSTAFA','DARBER TRADING CORPN','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:41:44','2'),(67,'MUSTAFA','FALCON SOLUTIONS','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:42:33','2'),(68,'AMIT','AMEENJI RUBBERS PVT LTD','5-5-65/1/A, F-14 S.A. TRADE CENTER FIRST FLOOR RANIGUNJ SECUNDERABAD','040','040','040','04027718681','ameenjirubber@gmail.com','TRADING','',1,'2015-12-08 23:13:37','2'),(69,'MUKESH','CABLES & CONDUCTORS','5-2-282, Mahavir Complex Hyderbasti Ranigunj Sec-Bad -3,','36750210724','9849007100','04027541493,','040','info@cabcon.in','TRADING','',1,'2015-12-12 00:51:21','2'),(70,'Pankaj Gulani','VAJRA ELECTRICALS','5-2-128, Rashtrapat, Sec-Bad ,3','040','9885160005','04027540796,','040','info@vajraelectric.com','TRADING','',1,'2015-12-12 00:57:28','2'),(71,'ALI','S.N.TRADERS','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:48:04','2'),(72,'ALI','VENUS ENGG. CO','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:49:08','2'),(73,'MENAKSHI','BHAVANI LINES','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:51:01','2'),(74,'ASHOK','TIRUMALA TRADING','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:51:31','2'),(75,'SANTOSH REDDY','SECUNDERABAD ENGG. AGENCIES','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:52:40','2'),(76,'SANTOSH REDDY','SECUNDERABAD ENGG. CORPN','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 06:57:22','2'),(77,'SANTOSH REDDY','DECCAN CAR SERVICES (BOSCH)','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','SERVICING','CAR SERVICING',1,'2015-12-08 06:58:36','2'),(78,'RAMLAL SIR','SRI RAMA SALES CORPN','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 07:00:52','2'),(79,'PRAMOD','AMBICA SALES CORPN','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','RANIGUNJ SECUNDERABAD',1,'2015-12-08 07:01:47','2'),(80,'RAMESH','SRI RAMA TRADING CO','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRA',1,'2015-12-08 07:02:33','2'),(81,'VENKATESH','SRIVEN ELECTRICALS','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 07:03:15','2'),(82,'DHANALAXMI','DHANA LAXMI SALES CORPN','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 07:04:42','2'),(83,'HARSH BOMB','KONTACT HYDERABAD','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 07:08:10','2'),(84,'POLI SIR','SPUTNIC ELECTRICALS','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','ELECTRICLAS TRADING','TRADING',1,'2015-12-08 07:10:01','2'),(85,'VENKATESH','SRI VENKATESHWARA SALES CORPN','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','ELECTRICALS TRADING','ELECTRICALS',1,'2015-12-08 07:11:19','2'),(86,'NAMAN TRADING','NAMAN TRADING','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','ELECTRICALS TRADING','TRADING',1,'2015-12-08 07:13:36','2'),(87,'KUMAR SIR','BRITE ELECTRICALS','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','ELECTRICALS TRADING','ELECTRICALS TRADING',1,'2015-12-08 07:15:39','2'),(88,'BELL','BELL ELECTRICALS','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','ELECTRICALS TRADING','ELECTRICALS TRADING',1,'2015-12-08 07:18:04','2'),(89,'MOHAMMED','ABIDIN TOOLS','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 07:19:38','2'),(90,'GOUROW','SRI RADHA KRISHNA AGENCIES','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 07:20:58','2'),(91,'SANJAY SIR','RAJ CLASSIC INN','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','HOTEL INDUSTRY','HOTEL',1,'2015-12-08 07:22:11','2'),(92,'SANJAY SIR','RAJ COMFORT INN','Paradise circle Secunderabad','040','040','040','040','test@gmail.com','HOTEL INDUSTRY','HOTEL INDUSTRY',1,'2015-12-08 07:24:37','2'),(93,'SOHAIL','FURNISHING WORLD','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','CLOTH MERCHANT','CLOTH MERCHANT',1,'2015-12-08 07:27:24','2'),(94,'KAID BHAI','ACME ENGG. CO','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 07:29:26','2'),(95,'NATIONAL HARDWARE','NATIONAL HARDWARE','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','RANIGUNJ',1,'2015-12-08 07:30:59','2'),(96,'KIRAN','HARSHINI TRADING CO','RANIGUNJ SECUNDERABAD','TRADING','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 07:31:43','2'),(97,'MOHAMMED','EMINENT ENGG. CORPN','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 07:32:36','2'),(98,'MOHAMMED','ELITE INDUSTRIAL CORPN','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@gmail.com','TRADING','TRADING',1,'2015-12-08 07:33:27','2'),(99,'SHABBIR','GALASY ENGG. CORPN','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 07:34:07','2'),(100,'MANNAN','HARDWARE & INSTRUEMTN CENTRE','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 07:35:28','2'),(101,'SAJITH BHAI','MONDIAL TRAVELS','abids hyderabad','040','040','040','040','test@gmail.com','TRAVELS','TRAVELS',1,'2015-12-08 07:36:52','2'),(102,'DEEPAK AGARWAL','MANOKAMANA GOLD','GULZARHOUSE HYDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 07:38:06','2'),(103,'GOPAL','SRI LAXMI CHEMICALS','GULZAAR HOUSE HYDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 07:39:04','2'),(104,'ZAFAR','YA WARIS ENTERPRISES','BALNAGAR HYDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 07:40:41','2'),(105,'SANTOSH REDDY','HYDERABAD ENGG. SERVICES','BALNAGAR HYDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 07:41:41','2'),(106,'SANTOSH REDDY','SECUNDERABAD ENGG CORPN. (FILKHANA)','FILKHANA BEGUMBAZAR HYDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 07:42:36','2'),(107,'SANTOSH REDDY','SECUNDERABAD ENGG. CORPN (AUTO NAGAR)','AUTONAGAR HYDERABAD','040','040','040','040','TEST@GMAIL.COM','SERVICING','SERVICING',1,'2015-12-08 07:43:23','2'),(108,'SANJAY SIR','ST.PETER ENGG. COLLEGE','KOMPALLY HYDERABAD','040','040','040','040','TEST@GMAIL.COM','ENGG. COLLEGE','SCHOOL',1,'2015-12-08 07:44:26','2'),(109,'SANJAY SIR','ST.PETER INTERNATIONAL SCHOOL','KOMPALLY HYDERABAD','040','040','040','040','TEST@GMAIL.COM','SCHOOL','SCHOOL',1,'2015-12-08 07:46:52','2'),(110,'KRISHNA','SRI KRISHNA HARDWARE & STEEL','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 07:47:33','2'),(111,'HUZEFA','TOOLS & HARDWARE','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 07:48:09','2'),(112,'SHABBIR','S.NAIM TOOLS & HARDWARE SYNDICATE','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 07:48:51','2'),(113,'MURTAZA','ROYAL INDUSTRIAL CORPN','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 07:49:38','2'),(114,'MOHAMMED','SOUTHERN HARDWARE MART','3-131/9, Narsapur X Roads, Opp. SBH Bank Balanagar, Hyderabad -500 037.','040','9391045192','0406435152','23774786','southernhardwaremart@gmail.com','TRADING','',1,'2015-12-12 05:53:12','2'),(115,'ABBAS','BEST HARDWARE','RANIGUNJ SECUNDERABAD','040','040','040','040','TEST@GMAIL.COM','TRADING','TRADING',1,'2015-12-08 07:51:03','2'),(116,'asdfasd','adf','asfd','asdf','asfd','asfdsadf','asdfsad','asdf','asfdasd','asdfas',1,'2015-12-12 12:49:35','2'),(117,'235432','243523452','23542345','23454235','23453245','234523','234523','23452345','2345234','234523',1,'2015-12-12 12:58:05','2');
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
  `billno` varchar(10) DEFAULT NULL,
  `billDate` varchar(20) NOT NULL,
  `dcItemList` text NOT NULL,
  `grandTotal` text NOT NULL,
  `discount` text NOT NULL,
  `vat` text NOT NULL,
  `totalAmount` text NOT NULL,
  `active` tinyint(1) NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_account` int(11) NOT NULL,
  PRIMARY KEY (`did`),
  KEY `user_account` (`user_account`),
  KEY `user_account_2` (`user_account`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dcreport`
--

LOCK TABLES `dcreport` WRITE;
/*!40000 ALTER TABLE `dcreport` DISABLE KEYS */;
INSERT INTO `dcreport` VALUES (6,'3','No product','29-11-2015','[{\"name\":\"mouse\",\"rate\":\"250\",\"qty\":\"2\",\"setVatRow\":0,\"amt\":500},{\"name\":\"computer\",\"rate\":\"35000\",\"qty\":\"2\",\"setVatRow\":0,\"amt\":70000}]','70500','0','0','70500',1,'2015-11-29 15:16:13',1),(7,'3','7','29-11-2015','[{\"name\":\"speakers\",\"rate\":\"4500\",\"qty\":\"2\",\"setVatRow\":0,\"amt\":9000}]','9000','0','0','9000',1,'2015-11-29 15:59:06',1),(8,'3','8','29-11-2015','[{\"name\":\"mouse\",\"rate\":\"250\",\"qty\":\"3\",\"setVatRow\":0,\"amt\":750}]','750','0','0','750',1,'2015-11-29 16:00:28',1),(9,'3','9','05-12-2015','[{\"name\":\"computer\",\"rate\":\"35000\",\"qty\":\"2\",\"setVatRow\":0,\"amt\":70000},{\"name\":\"mouse\",\"rate\":\"250\",\"qty\":\"2\",\"setVatRow\":0,\"amt\":500},{\"name\":\"speakers\",\"rate\":\"4500\",\"qty\":\"2\",\"setVatRow\":0,\"amt\":9000},{\"name\":\"HARD DISK 500 GB SEAGATE\",\"rate\":\"3300\",\"qty\":\"2\",\"setVatRow\":0,\"amt\":6600},{\"name\":\"mouse\",\"rate\":\"250\",\"qty\":\"2\",\"setVatRow\":0,\"amt\":500},{\"name\":\"speakers\",\"rate\":\"4500\",\"qty\":\"2\",\"setVatRow\":0,\"amt\":9000},{\"name\":\"HARD DISK 500 GB SEAGATE\",\"rate\":\"3300\",\"qty\":\"3\",\"setVatRow\":0,\"amt\":9900},{\"name\":\"laptop\",\"rate\":\"45800\",\"qty\":\"4\",\"setVatRow\":0,\"amt\":183200}]','288700','0','0','288700',1,'2015-12-05 09:16:58',1),(10,'4','10','05-12-2015','[{\"name\":\"computer\",\"rate\":\"35000.50\",\"qty\":\"3\",\"setVatRow\":0,\"amt\":105001.5},{\"name\":\"laptop\",\"rate\":\"45800.15\",\"qty\":\"3\",\"setVatRow\":0,\"amt\":137400.45}]','242401.95','0','0','242401.95',1,'2015-12-05 11:34:01',1),(11,'4','11','05-12-2015','[{\"name\":\"laptop\",\"rate\":\"45800.35\",\"qty\":\"1\",\"setVatRow\":0,\"amt\":45800.35}]','45800.35','0','0','45800.35',1,'2015-12-05 12:12:19',1),(12,'4','12','05-12-2015','[{\"name\":\"laptop\",\"rate\":\"45800\",\"qty\":\"2\",\"setVatRow\":0,\"amt\":91600},{\"name\":\"computer\",\"rate\":\"35000\",\"qty\":\"2\",\"setVatRow\":0,\"amt\":70000},{\"name\":\"mouse\",\"rate\":\"250\",\"qty\":\"2\",\"setVatRow\":0,\"amt\":500},{\"name\":\"computer\",\"rate\":\"35000\",\"qty\":\"3\",\"setVatRow\":0,\"amt\":105000},{\"name\":\"computer\",\"rate\":\"35000\",\"qty\":\"2\",\"setVatRow\":0,\"amt\":70000},{\"name\":\"mouse\",\"rate\":\"250\",\"qty\":\"4\",\"setVatRow\":0,\"amt\":1000},{\"name\":\"computer\",\"rate\":\"35000\",\"qty\":\"4\",\"setVatRow\":0,\"amt\":140000},{\"name\":\"computer\",\"rate\":\"35000\",\"qty\":\"4\",\"setVatRow\":0,\"amt\":140000},{\"name\":\"mouse\",\"rate\":\"250\",\"qty\":\"4\",\"setVatRow\":0,\"amt\":1000},{\"name\":\"mouse\",\"rate\":\"250\",\"qty\":\"5\",\"setVatRow\":0,\"amt\":1250},{\"name\":\"HARD DISK 500 GB SEAGATE\",\"rate\":\"3300\",\"qty\":\"5\",\"setVatRow\":0,\"amt\":16500},{\"name\":\"speakers\",\"rate\":\"4500\",\"qty\":\"4\",\"setVatRow\":0,\"amt\":18000}]','654850','0','0','654850',1,'2015-12-05 14:25:07',1),(13,'7','1','05-12-2015','[{\"name\":\"DESKTOP COMPUTER SET\",\"rate\":\"12800\",\"qty\":\"1\",\"setVatRow\":0,\"amt\":12800},{\"name\":\"Intel Dual Core\",\"rate\":\"0\",\"qty\":\"1\",\"setVatRow\":0,\"amt\":0},{\"name\":\"MEMORY 2 GB DDR2\",\"rate\":\"0\",\"qty\":\"1\",\"setVatRow\":0,\"amt\":0},{\"name\":\"HARD DISK 160 GB SEAGATE\",\"rate\":\"0\",\"qty\":\"1\",\"setVatRow\":0,\"amt\":0},{\"name\":\"CABINET ATX\",\"rate\":\"0\",\"qty\":\"1\",\"setVatRow\":0,\"amt\":0},{\"name\":\"Microsoft Key Board & Mouse\",\"rate\":\"0\",\"qty\":\"1\",\"setVatRow\":0,\"amt\":0},{\"name\":\"UPS - INTEX\",\"rate\":\"0\",\"qty\":\"1\",\"setVatRow\":0,\"amt\":0},{\"name\":\"Mother Board Intel 31 Chipset\",\"rate\":\"0\",\"qty\":\"1\",\"setVatRow\":0,\"amt\":0},{\"name\":\"17\\\" LED Krystal\",\"rate\":\"0\",\"qty\":\"1\",\"setVatRow\":0,\"amt\":0}]','12800','0','0','12800',1,'2015-12-05 09:59:32',2),(14,'19','2','12-12-2015','[{\"name\":\"DIGILITE WIRELESS ROUTER 300\",\"rate\":\"1500\",\"qty\":\"5\",\"setVatRow\":0,\"amt\":7500},{\"name\":\"Mother Board Intel 31 Chipset\",\"rate\":\"3500\",\"qty\":\"9\",\"setVatRow\":0,\"amt\":31500}]','39000','0','0','39000',1,'2015-12-12 03:17:48',2),(15,'7','2','12-12-2015','[{\"name\":\"MEMORY 2 GB DDR2\",\"rate\":\"1500\",\"qty\":\"5\",\"setVatRow\":0,\"amt\":7500},{\"name\":\"CABINET ATX\",\"rate\":\"1500\",\"qty\":\"3\",\"setVatRow\":0,\"amt\":4500},{\"name\":\"DESKTOP COMPUTER SET\",\"rate\":\"25000\",\"qty\":\"6\",\"setVatRow\":0,\"amt\":150000},{\"name\":\"Intel i5 Processor\",\"rate\":\"12000\",\"qty\":\"8\",\"setVatRow\":0,\"amt\":96000}]','258000','0','0','258000',1,'2015-12-12 03:17:49',2);
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
  `code` varchar(11) DEFAULT NULL,
  `price` int(11) DEFAULT '0',
  `qty` int(11) DEFAULT '0',
  `unit` varchar(15) CHARACTER SET utf8 NOT NULL,
  `vat` varchar(5) CHARACTER SET utf8 NOT NULL,
  `desc` text CHARACTER SET utf8,
  `active` int(2) NOT NULL DEFAULT '1',
  `addedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_account` varchar(11) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemmaster`
--

LOCK TABLES `itemmaster` WRITE;
/*!40000 ALTER TABLE `itemmaster` DISABLE KEYS */;
INSERT INTO `itemmaster` VALUES (1,'laptop','electronic','1',45800,8,'each','0','this is computer',1,'2015-11-30 02:24:48','1'),(4,'computer','electronics','100',35000,8,'each','5','computer device',1,'2015-11-25 04:27:03','1'),(5,'mouse','electronics','101',250,8,'each','5','computer device',1,'2015-11-25 04:28:12','1'),(6,'ram','electronics','102',1100,8,'each','5','computer device',1,'2015-11-25 04:28:29','3'),(7,'speakers','electronics','103',4500,8,'each','5','computer device',1,'2015-11-25 04:28:39','1'),(8,'HARD DISK 500 GB SEAGATE','STORAGE','HDD500',3300,10,'EACH','5',NULL,1,'2015-11-29 07:23:27','1'),(10,'Mother Board Intel 31 Chipset','Computer Peripherals','MBoard',3500,1,'each','0',NULL,1,'2015-12-05 09:22:13','2'),(11,'MEMORY 2 GB DDR2','COMPUTER','RAM DDR2',1500,1,'EACH','5',NULL,1,'2015-12-05 09:23:04','2'),(12,'HARD DISK 160 GB SEAGATE','COMPUTER PERIPHERALS','HDD',1500,1,'EACH','5',NULL,1,'2015-12-05 09:23:54','2'),(13,'CABINET ATX','COMPUTER PERIPHERALS','CABINET',1500,1,'EACH','5',NULL,1,'2015-12-05 09:24:42','2'),(14,'DVD R/W LG','COMPUTER PERIPHERALS','DVD R/W',1000,1,'EACH','5',NULL,1,'2015-12-05 09:25:36','2'),(15,'KEY BOARD','COMPUTER PERIPHERALS','KB',500,1,'EACH','5',NULL,1,'2015-12-05 09:26:28','2'),(16,'MOUSE - OPTICAL','COMPUTER PHERALS','MOUSE',200,1,'EACH','5',NULL,1,'2015-12-05 09:27:05','2'),(17,'Microsoft Key Board & Mouse','Computer Peripherals','KB/Mouse',1000,1,'each','5',NULL,1,'2015-12-05 09:27:57','2'),(18,'HP LASERJET 1018 PRINTER','COMPUTER PERIPHERALS','printer',7000,1,'EACH','5',NULL,1,'2015-12-05 09:28:54','2'),(19,'UPS - INTEX','COMPUTER PERIPHERALS','ups',1500,1,'EACH','5',NULL,1,'2015-12-05 09:29:47','2'),(20,'DESKTOP COMPUTER SET','COMPUTER','COMPUTER SE',25000,1,'EACH','5',NULL,1,'2015-12-05 09:32:12','2'),(21,'17\" LED Krystal','COMPUTER','MONITOR',4000,1,'EACH','5',NULL,1,'2015-12-05 09:53:23','2'),(22,'INTEL DUAL CORE 4th Generation','COMPUTER PEREPHERALS','DC4',3950,1,'EACH','5','PROCESSOR',1,'2015-12-08 07:53:28','2'),(23,'D-LINK WIRELESS ROUTER 150','COMPUTER','DLINKR',1500,1,'1','5','WIRELESS ROUTER',1,'2015-12-08 07:54:24','2'),(24,'DIGILITE WIRELESS ROUTER 300','COMPUTER','ROUTERDL',1500,1,'1','5','WIRELESS ROUTER',1,'2015-12-08 07:55:12','2'),(25,'INTEL DUAL CORE','COMPUTER','DC',3500,1,'EACH','5','PROCESSOR',1,'2015-12-08 08:04:55','2'),(26,'Intel i3 Processor','computer','i3',8000,1,'each','5','processor',1,'2015-12-08 08:05:49','2'),(27,'Intel i5 Processor','computer','i5',12000,1,'each','5','processor',1,'2015-12-08 08:06:45','2'),(28,'INTEL CORE2DUO','computer','c2d',1500,1,'each','5','processor',1,'2015-12-08 08:07:38','2'),(29,'RAM 2 GB DDR2','COMPUTER','DDR2',1000,1,'EACH','5','RAM',1,'2015-12-08 08:08:22','2'),(30,'DDR3 2 GB RAM','COMPUTER','DDR3',1000,1,'EACH','5','RAM',1,'2015-12-08 08:08:56','2'),(31,'RAM DDR3 4 GB','COMPUTER','DDR3',1500,1,'EACH','5','RAM',1,'2015-12-08 08:09:39','2'),(32,'HARD DISK 500 GB SEAGATE','COMPUTER','HDD500',3250,1,'EACH','5','HARD DISK 500 GB',1,'2015-12-08 08:11:01','2'),(33,'HARD DISK 1000 GB SEAGATE','COMPUTER','HDD1000',3700,1,'EACH','5','HARD DISK',1,'2015-12-08 08:12:01','2'),(34,'MOTHER BOARD INTEL 41 CHIPSET','COMPUTER','MB41',3500,1,'EACH','5','MOTHER BOARD INTEL SERIES',1,'2015-12-08 08:13:19','2'),(35,'MOTHER BOARD INTEL 61 CHIPSET','COMPUTER','MB61',3500,1,'EACH','5','MOTHER BOARD INTEL SERIES',1,'2015-12-08 08:14:14','2'),(36,'MOTHER BOARD INTEL 81 CHIPSET','COMPUTER','MB81',3500,1,'EACH','5','MOTHER BOARD',1,'2015-12-08 08:15:19','2'),(37,'SMPS ZEBRONICS','COMPUTER','SMPS',650,1,'EACH','5','SMPS',1,'2015-12-08 08:15:53','2'),(38,'SMPS - INTEX','COMPUTER','SMPSI',650,1,'EACH','5','SMPS',1,'2015-12-08 08:16:56','2'),(39,'D-LINK USB WIRELESS CARD 150','COMPUTER','DLINKWD',1000,1,'EACH','5','D-LINK WIRELESS USB CARD',1,'2015-12-08 08:27:07','2'),(40,'DELL WIRELESS MOUSE','COMPUTER','DMOUSE',750,1,'EACH','5','MOUSE WIRELESS',1,'2015-12-08 08:29:03','2'),(41,'KRYSTAL KEY BOARD','COMPUTER','KITKB',250,1,'EACH','5','KEY BOARD',1,'2015-12-08 08:29:53','2'),(42,'ZEBRONICS KEY BOARD','COMPUTER','ZEBKB',250,1,'EACH','5','ZEBRONICS',1,'2015-12-08 08:30:40','2'),(44,'FRONTECH KEY BOARD','COMPUTER','FTKB',250,1,'EACH','5','KEY BOARD',1,'2015-12-08 08:32:05','2'),(53,'FRONTECH MOUSE','COMPUTER','FTMOUSE',150,1,'EACH','5','MOUSE',1,'2015-12-08 08:33:52','2'),(54,'MICROSOFT COMBO KEY BOARD & MOUSE','COMPUTER','MSCOMBO',1000,1,'EACH','5','COMBO',1,'2015-12-08 08:34:30','2'),(55,'-Formatting & Installation / Data Backup & Restore','COMPUTER','SERVICE',750,1,'EACH','0','FORMATTING',1,'2015-12-09 04:21:57','2'),(56,'QUICK HEAL PRO ANTIVIRUS','COMPUTER','QHP',550,1,'EACH','5','ANTIVIRUS',1,'2015-12-09 04:22:48','2'),(57,'Quick Heal Pro Renewal 3 Years (offer 2+1 Year Fre','COMPUTER','QHPRen',1400,1,'EACH','5','ANTIVIRUS RENEWAL',1,'2015-12-09 04:23:36','2'),(58,'DELL  LAPTOP BATTERY','COMPUTER','DELLBAT',1800,1,'EACH','5','LAPTOP BATTERY',1,'2015-12-09 04:35:27','2'),(59,'HP LAPTOP BATTERY','LAPTOP','HPBAT',1800,1,'EACH','5','BATTERY LAPTOP',1,'2015-12-09 04:36:21','2'),(60,'SPEAKERS','COMPUTER SPEAKERS','SPK',1000,1,'EACH','5','SPEAKERS',1,'2015-12-09 04:37:34','2');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_accounts`
--

LOCK TABLES `user_accounts` WRITE;
/*!40000 ALTER TABLE `user_accounts` DISABLE KEYS */;
INSERT INTO `user_accounts` VALUES (1,'giriy','admin','Giriy Poshaneeshwar','indotech technologies','','software','admin','we are the leading web designing and development c','icsitpar','info@icsitpark.com','7893585898','','','','','',''),(2,'ahmed','ahmed','Taj Ahmed','indotech','technologies','software','annual','this is introduction','','indotech06@gmail.com','9395306161','secunderabad','','','','','');
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

-- Dump completed on 2016-01-03 23:18:50
