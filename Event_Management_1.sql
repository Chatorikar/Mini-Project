-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: Event_Management
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.10.1

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
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` int(11) NOT NULL,
  `id_no` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `id_no` (`id_no`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp`
--

LOCK TABLES `emp` WRITE;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` VALUES (1,'fsd',923821,'swefw');
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_communication`
--

DROP TABLE IF EXISTS `event_communication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_communication` (
  `event_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `communication_number` int(11) NOT NULL,
  `communication_flag` int(11) DEFAULT NULL,
  KEY `fk4` (`event_id`),
  CONSTRAINT `fk4` FOREIGN KEY (`event_id`) REFERENCES `event_ledger` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_communication`
--

LOCK TABLES `event_communication` WRITE;
/*!40000 ALTER TABLE `event_communication` DISABLE KEYS */;
INSERT INTO `event_communication` VALUES (12,'Keep it up',1,1),(12,'Thank you sir',2,0),(13,'Disscuss',1,1),(14,'Keep it up',1,1),(14,'Thanks Bhai',2,0),(1,'OK',1,0);
/*!40000 ALTER TABLE `event_communication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_communication_history`
--

DROP TABLE IF EXISTS `event_communication_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_communication_history` (
  `event_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `communication_number` int(11) NOT NULL,
  `communication_flag` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_communication_history`
--

LOCK TABLES `event_communication_history` WRITE;
/*!40000 ALTER TABLE `event_communication_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_communication_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_ledger`
--

DROP TABLE IF EXISTS `event_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_ledger` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_level` int(11) NOT NULL,
  `prev_status_level` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`event_id`),
  KEY `username` (`username`),
  CONSTRAINT `event_ledger_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_ledger`
--

LOCK TABLES `event_ledger` WRITE;
/*!40000 ALTER TABLE `event_ledger` DISABLE KEYS */;
INSERT INTO `event_ledger` VALUES (1,'A1','sdfvs','aj10',4,1,'2018-08-10','2018-08-11'),(2,'A2','sdfvs','aj10',4,1,'2017-08-10','2017-08-11'),(3,'A3','sdfvs','aj10',4,1,'2016-08-10','2016-08-11'),(4,'A4','sdfvs','aj10',4,1,'2015-08-10','2015-08-11'),(5,'A5','sdfvs','aj10',3,1,'2014-08-10','2014-08-11'),(6,'P1','sad','ap',3,1,'2013-08-11','2013-08-12'),(7,'T1','sadsa','test',6,1,'2020-08-10','2020-08-11'),(8,'Csd','dsadsa','test',5,1,'2019-10-23','2019-10-26'),(9,'Testtn','Test','aj10',4,1,'2019-10-12','2019-10-27'),(10,'New','New','aj10',4,1,'2019-11-02','2019-11-09'),(11,'Omkar_event','Omkar_event','aj10',4,1,'2019-10-18','2019-11-02'),(12,'test','test','test',4,1,'2019-10-19','2019-10-20'),(13,'Alumi Meet','Alumi Meet','test',4,1,'2019-10-22','2019-10-26'),(14,'Ayan','q','test',4,1,'2019-10-25','2019-10-31');
/*!40000 ALTER TABLE `event_ledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_ledger_history`
--

DROP TABLE IF EXISTS `event_ledger_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_ledger_history` (
  `event_id` int(11) NOT NULL DEFAULT '0',
  `event_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_level` int(11) NOT NULL,
  `prev_status_level` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_ledger_history`
--

LOCK TABLES `event_ledger_history` WRITE;
/*!40000 ALTER TABLE `event_ledger_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_ledger_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `misc_ledger`
--

DROP TABLE IF EXISTS `misc_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `misc_ledger` (
  `event_id` int(11) DEFAULT NULL,
  `permission_type` int(11) DEFAULT NULL,
  `req_start` date NOT NULL,
  `req_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_status` int(11) DEFAULT NULL,
  `req_end` date NOT NULL,
  KEY `event_id` (`event_id`),
  CONSTRAINT `misc_ledger_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event_ledger` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `misc_ledger`
--

LOCK TABLES `misc_ledger` WRITE;
/*!40000 ALTER TABLE `misc_ledger` DISABLE KEYS */;
INSERT INTO `misc_ledger` VALUES (2,1,'2019-10-25','OK',3,'2019-10-27'),(2,2,'2019-10-25','OK',1,'2019-10-27'),(9,1,'2019-10-17','OK',1,'2019-10-11'),(9,2,'2019-10-17','OK',3,'2019-10-11'),(1,1,'2019-10-17','OK',3,'2019-10-24'),(1,2,'2019-10-17','OK',1,'2019-10-24'),(12,1,'2019-10-18','OK',3,'2019-10-12'),(12,2,'2019-10-18','OK',3,'2019-10-12'),(13,1,'2019-10-17','OK',3,'2019-10-18'),(13,2,'2019-10-17','OK',1,'2019-10-18'),(14,1,'2019-10-17','OK',3,'2019-10-25'),(14,2,'2019-10-17','OK',2,'2019-10-25');
/*!40000 ALTER TABLE `misc_ledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `misc_ledger_history`
--

DROP TABLE IF EXISTS `misc_ledger_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `misc_ledger_history` (
  `event_id` int(11) DEFAULT NULL,
  `request_number` int(11) NOT NULL,
  `req_start` date NOT NULL,
  `req_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_category` int(11) NOT NULL,
  `req_end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `misc_ledger_history`
--

LOCK TABLES `misc_ledger_history` WRITE;
/*!40000 ALTER TABLE `misc_ledger_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `misc_ledger_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization` (
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES ('CSI',1);
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_communication`
--

DROP TABLE IF EXISTS `resource_communication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_communication` (
  `event_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `communication_number` int(11) NOT NULL,
  `communication_flag` int(11) DEFAULT NULL,
  KEY `fk12` (`event_id`),
  CONSTRAINT `fk12` FOREIGN KEY (`event_id`) REFERENCES `event_ledger` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_communication`
--

LOCK TABLES `resource_communication` WRITE;
/*!40000 ALTER TABLE `resource_communication` DISABLE KEYS */;
INSERT INTO `resource_communication` VALUES (12,'Respected Sir',1,0),(12,'Ok you can continue.',2,1),(14,'Please',1,0);
/*!40000 ALTER TABLE `resource_communication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_communication_history`
--

DROP TABLE IF EXISTS `resource_communication_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_communication_history` (
  `event_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `communication_number` int(11) NOT NULL,
  `communication_flag` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_communication_history`
--

LOCK TABLES `resource_communication_history` WRITE;
/*!40000 ALTER TABLE `resource_communication_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_communication_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `returnqs`
--

DROP TABLE IF EXISTS `returnqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `returnqs` (
  `position` int(11) DEFAULT NULL,
  `e_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `returnqs`
--

LOCK TABLES `returnqs` WRITE;
/*!40000 ALTER TABLE `returnqs` DISABLE KEYS */;
INSERT INTO `returnqs` VALUES (1,'A1','2018-08-10','2018-08-11'),(2,'A2','2017-08-10','2017-08-11'),(3,'A3','2016-08-10','2016-08-11'),(4,'A4','2015-08-10','2015-08-11'),(5,'A5','2014-08-10','2014-08-11'),(7,'T1','2020-08-10','2020-08-11'),(8,'Csd','2019-10-23','2019-10-26');
/*!40000 ALTER TABLE `returnqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_computers` int(11) NOT NULL,
  `projector_support` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `emp_incharge` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'mllab',20,0,20,'Mr.Kambale Sir'),(2,'classroom-201',20,1,50,'Mr.Murumkar Sir'),(3,'classroom-301',20,1,50,'Mr.Patil Sir'),(4,'classroom-401',20,1,50,'Mr.Bansod Sir'),(5,'IT-Seminar Hall',200,3,2,'Mrs.Jagdale Ma\'am'),(6,'CS-Seminar Hall',200,3,2,'Mrs.Joshi Ma\'am'),(7,'ENTC-Seminar Hall',500,1,1,'Mr.Jadhav Sir'),(8,'Auditorium',1000,5,4,'Mr.Pande Sir'),(9,'Ground',1000,0,0,'Mr.Dhoni Sir');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_acknowledgement`
--

DROP TABLE IF EXISTS `security_acknowledgement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_acknowledgement` (
  `event_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `in_time` time NOT NULL,
  `out_time` time NOT NULL,
  KEY `fk13` (`event_id`),
  KEY `fk14` (`student_id`),
  CONSTRAINT `fk13` FOREIGN KEY (`event_id`) REFERENCES `event_ledger` (`event_id`),
  CONSTRAINT `fk14` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_acknowledgement`
--

LOCK TABLES `security_acknowledgement` WRITE;
/*!40000 ALTER TABLE `security_acknowledgement` DISABLE KEYS */;
/*!40000 ALTER TABLE `security_acknowledgement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `security_acknowledgement_history`
--

DROP TABLE IF EXISTS `security_acknowledgement_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `security_acknowledgement_history` (
  `event_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `in_time` time NOT NULL,
  `out_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `security_acknowledgement_history`
--

LOCK TABLES `security_acknowledgement_history` WRITE;
/*!40000 ALTER TABLE `security_acknowledgement_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `security_acknowledgement_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slots_and_details`
--

DROP TABLE IF EXISTS `slots_and_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slots_and_details` (
  `event_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `status_level` int(11) NOT NULL,
  `prev_status_level` int(11) NOT NULL,
  `purpose` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose_explained` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_slot_start` int(11) DEFAULT NULL,
  `time_slot_end` int(11) DEFAULT NULL,
  KEY `fk1` (`room_id`),
  KEY `fk3` (`event_id`),
  CONSTRAINT `fk1` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  CONSTRAINT `fk3` FOREIGN KEY (`event_id`) REFERENCES `event_ledger` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slots_and_details`
--

LOCK TABLES `slots_and_details` WRITE;
/*!40000 ALTER TABLE `slots_and_details` DISABLE KEYS */;
INSERT INTO `slots_and_details` VALUES (10,9,1,1,'','',1,2),(11,9,1,1,'','',1,2),(12,9,1,1,'','',2,2),(13,9,1,1,'','',2,2),(14,9,1,1,'','',3,2),(14,5,1,1,'','',3,2);
/*!40000 ALTER TABLE `slots_and_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`pratham`@`localhost`*/ /*!50003 trigger update_status_4
  after insert
  on slots_and_details for each row
  begin
  update `event_ledger` set status_level=4 where event_id=NEW.event_id;
  end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `slots_and_details_history`
--

DROP TABLE IF EXISTS `slots_and_details_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slots_and_details_history` (
  `event_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `status_level` int(11) NOT NULL,
  `prev_status_level` int(11) NOT NULL,
  `purpose` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `purpose_explained` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_slot_start` time NOT NULL,
  `time_slot_end` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slots_and_details_history`
--

LOCK TABLES `slots_and_details_history` WRITE;
/*!40000 ALTER TABLE `slots_and_details_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `slots_and_details_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_no` int(11) NOT NULL,
  `id_no` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `id_no` (`id_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_level` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_id` int(11) DEFAULT NULL,
  `email_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`username`),
  KEY `org_id` (`org_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `organization` (`org_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('aj10','aj10',1,'Atharva',1,'ayhu@.com'),('ap','ap',1,'Ayushi',1,'122@.com'),('hod','1',3,'MOD',1,'ayhu@.com'),('princi','princi',2,'princi',1,'ema@.com'),('test','test123',1,'test',1,'as@.com'),('test1','test',1,'test',1,'@.com');
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

-- Dump completed on 2019-10-14 21:23:11
