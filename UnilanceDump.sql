DROP SCHEMA IF EXISTS `student`;
CREATE SCHEMA `student`;
USE `student`;

-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: student
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_listing_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `application_status` enum('NEW','PROCESSED','ACCEPTED','REJECTED') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`),
  KEY `job_listing_id` (`job_listing_id`),
  CONSTRAINT `application_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `application_ibfk_2` FOREIGN KEY (`job_listing_id`) REFERENCES `job_listing` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (1,1,1,'2023-02-01 09:00:00','PROCESSED'),(2,2,2,'2023-01-25 08:00:00','ACCEPTED'),(3,3,3,'2023-02-20 10:45:09','NEW'),(4,4,4,'2023-01-05 08:11:00','REJECTED'),(5,5,5,'2023-01-06 15:48:22','PROCESSED');
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `average_user_rating`
--

DROP TABLE IF EXISTS `average_user_rating`;
/*!50001 DROP VIEW IF EXISTS `average_user_rating`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `average_user_rating` AS SELECT 
 1 AS `user_id`,
 1 AS `average_rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Graphic Design & Multimedia','This category encompasses a wide range of writing services, including copywriting for marketing materials, blog and article writing, technical documentation, editing, and creative content creation.'),(2,'Programming & Development','Developers in this category specialize in creating websites, mobile apps, software solutions, and managing databases. Whether it’s front–end design or back-end functionality, skilled developers...'),(3,'Writing & Content','This category encompasses a wide range of writing services, including copywriting for marketing materials, blog and article writing, technical documentation, editing, and creative content creation'),(4,'Digital Marketing','Digital marketing professionals excel in online strategies, including SEO to improve search visibility, social media management, email marketing campaigns, PPC advertising, and content marketing for brand promotion.'),(5,'Creative Arts','Language experts offer translation services, language tutoring, and proofreading. This category is essential for businesses and individuals looking to communicate effectively across diverse linguistic backgrounds.');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `founded_date` date DEFAULT NULL,
  `VAT_number` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (2,1,'1997-02-18',472917481),(11,17,'2001-09-25',483917489),(15,812,'2001-02-27',173983210),(58,81,'2001-10-20',897690175),(91,51,'1997-02-01',481749186);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_listing_id` int NOT NULL,
  `application_id` int NOT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_status` enum('PENDING','COMPLETED','FAILED') NOT NULL,
  `payment_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `application_id` (`application_id`),
  KEY `job_listing_id` (`job_listing_id`),
  CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`),
  CONSTRAINT `contract_ibfk_2` FOREIGN KEY (`job_listing_id`) REFERENCES `job_listing` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=545 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` VALUES (3,3,3,'2023-02-12 09:00:00','PENDING','2023-04-19 15:01:08'),(26,2,2,'2023-01-25 15:30:00','COMPLETED','2023-02-28 16:00:00'),(165,1,1,'2023-02-02 10:00:00','PENDING','2022-06-22 09:00:00'),(441,4,4,'2023-03-05 14:00:00','COMPLETED','2023-03-31 17:00:00'),(544,5,5,'2023-01-20 08:00:00','PENDING','2023-08-30 14:41:51');
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `contract_details`
--

DROP TABLE IF EXISTS `contract_details`;
/*!50001 DROP VIEW IF EXISTS `contract_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `contract_details` AS SELECT 
 1 AS `contract_id`,
 1 AS `created_date`,
 1 AS `payment_status`,
 1 AS `payment_date`,
 1 AS `application_status`,
 1 AS `job_title`,
 1 AS `applicant_username`,
 1 AS `applicant_email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,1,'2004-05-29'),(2,2,'2000-08-12'),(3,3,'1998-01-05'),(4,4,'1999-12-30'),(5,5,'2003-07-24');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_listing`
--

DROP TABLE IF EXISTS `job_listing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_listing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` int DEFAULT NULL,
  `job_title` varchar(50) DEFAULT NULL,
  `job_description` text,
  `experience_level` enum('BEGINNER','INTERMEDIATE','EXPERT') DEFAULT NULL,
  `status` enum('NEW','ONGOING','DONE') DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `reward` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `job_listing_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_listing`
--

LOCK TABLES `job_listing` WRITE;
/*!40000 ALTER TABLE `job_listing` DISABLE KEYS */;
INSERT INTO `job_listing` VALUES (1,2,'Graphic Design','Looking for a graphic designer for branding...','INTERMEDIATE','NEW','2023-02-01 10:15:59','2023-02-15 16:04:05','Remote',300.00),(2,2,'Web Developer','Need a developer to create a responsive website','EXPERT','DONE','2023-01-20 08:14:34','2023-03-01 19:28:06','New York',1000.00),(3,4,'SEO Specialist','Searching for an SEO specialist to improve website rank','INTERMEDIATE','NEW','2023-02-10 19:06:37','2023-04-10 03:29:16','Remote',600.00),(4,4,'Content Writer','Looking for a content writer with tech industry experience','BEGINNER','ONGOING','2023-03-01 12:05:19','2023-04-01 13:34:35','Remote',500.00),(5,2,'Data Analyst','Data analyst needed for market analysis project','EXPERT','NEW','2023-01-15 15:06:58','2023-02-28 04:24:12','Athens',1200.00);
/*!40000 ALTER TABLE `job_listing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_listing_category`
--

DROP TABLE IF EXISTS `job_listing_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_listing_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_listing_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_listing_id` (`job_listing_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `job_listing_category_ibfk_1` FOREIGN KEY (`job_listing_id`) REFERENCES `job_listing` (`id`),
  CONSTRAINT `job_listing_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=565 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_listing_category`
--

LOCK TABLES `job_listing_category` WRITE;
/*!40000 ALTER TABLE `job_listing_category` DISABLE KEYS */;
INSERT INTO `job_listing_category` VALUES (12,125,165),(23,244,255),(52,544,543),(562,555,231),(564,458,854);
/*!40000 ALTER TABLE `job_listing_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_listing_skill`
--

DROP TABLE IF EXISTS `job_listing_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_listing_skill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_listing_id` int DEFAULT NULL,
  `skill_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `job_listing_id` (`job_listing_id`),
  KEY `skill_id` (`skill_id`),
  CONSTRAINT `job_listing_skill_ibfk_1` FOREIGN KEY (`job_listing_id`) REFERENCES `job_listing` (`id`),
  CONSTRAINT `job_listing_skill_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_listing_skill`
--

LOCK TABLES `job_listing_skill` WRITE;
/*!40000 ALTER TABLE `job_listing_skill` DISABLE KEYS */;
INSERT INTO `job_listing_skill` VALUES (10,121,13),(25,452,15),(65,851,35),(95,1203,26),(222,258,21);
/*!40000 ALTER TABLE `job_listing_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sender_user_id` int NOT NULL,
  `recipient_user_id` int NOT NULL,
  `message` text,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_read` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sender_user_id` (`sender_user_id`),
  KEY `recipient_user_id` (`recipient_user_id`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`sender_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`recipient_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (4135,4,5671,'Fine by me!','2022-03-12 04:50:22',1),(8241,3,1,'Any news on this?','2023-03-06 12:25:00',0),(12345,26,1,'Thank you for applying. Can you share your portfolio?','2023-02-01 19:31:32',1),(43214,110,255,'Hi there, I am interested in Graphic Design...','2023-02-01 09:15:00',0),(143142,5,643,'Did you check this?','2022-06-04 07:18:00',0);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stars` int DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `rating_user_id` int DEFAULT NULL,
  `rated_user_id` int DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `rating_user_id` (`rating_user_id`),
  KEY `rated_user_id` (`rated_user_id`),
  CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`rating_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`rated_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (1,5,'2023-03-01 12:00:00',2,1,'This user did a really good job'),(2,2,'2023-03-02 14:30:00',1,2,'This user did not do good job'),(3,1,'2022-12-12 04:36:14',3,5,'Complete unprofessional work, ruined my project!'),(4,5,'2021-10-30 12:25:14',4,3,'Excelled at everything! Would recommend'),(5,4,'2023-06-12 04:45:49',5,4,'He needed some improvement but overall great job');
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `recent_job_listings`
--

DROP TABLE IF EXISTS `recent_job_listings`;
/*!50001 DROP VIEW IF EXISTS `recent_job_listings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `recent_job_listings` AS SELECT 
 1 AS `job_title`,
 1 AS `job_description`,
 1 AS `reward`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `skill_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=954 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES (2,24,'JavaScript','Experienced in JavaScript coding'),(54,102,'Python Programming language','Great coding skills and knowledge of libraries used in machine learning applications '),(154,95,'ESP32 Microcontrolers','Have successfully collected data from sensors in order to build an application for smart light bulbs'),(201,105,'Photoshop','Proficient in Adobe Photoshop'),(953,8,'Team Spirit','Experienced in working with large Teams');
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'John Doe','johndoe','********','john@example.com','2023-01-01 10:00:00','Ikoniou 28, Thessaloniki, 54453'),(2,'Jane Smith','janesmith','********','jane@example.com','2023-01-02 11:00:00','Dim. Gounari 24, Thessaloniki, 54622'),(3,'Bob Brown','bobbrown','********','bob@example.com','2023-01-03 12:00:00','Delfon 128, Thessaloniki, 54643'),(4,'Alice Green','alicegreen','********','alice@example.com','2023-01-04 13:00:00','Valaoritou 19, Thessaloniki, 54625'),(5,'Charlie Black','charlieblack','********','charlie@example.com','2023-01-05 14:00:00','Sofouli 89, Thessaloniki, 55131');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_skill`
--

DROP TABLE IF EXISTS `user_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_skill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `skill_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `skill_id` (`skill_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_skill_ibfk_1` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`id`),
  CONSTRAINT `user_skill_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_skill`
--

LOCK TABLES `user_skill` WRITE;
/*!40000 ALTER TABLE `user_skill` DISABLE KEYS */;
INSERT INTO `user_skill` VALUES (11,102,10),(35,68,35),(44,541,75),(85,681,95),(125,351,5);
/*!40000 ALTER TABLE `user_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `average_user_rating`
--

/*!50001 DROP VIEW IF EXISTS `average_user_rating`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `average_user_rating` AS select `user`.`id` AS `user_id`,avg(`rating`.`stars`) AS `average_rating` from (`user` left join `rating` on((`user`.`id` = `rating`.`rated_user_id`))) group by `user`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `contract_details`
--

/*!50001 DROP VIEW IF EXISTS `contract_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `contract_details` AS select `contract`.`id` AS `contract_id`,`contract`.`created_date` AS `created_date`,`contract`.`payment_status` AS `payment_status`,`contract`.`payment_date` AS `payment_date`,`application`.`application_status` AS `application_status`,`job_listing`.`job_title` AS `job_title`,`user`.`username` AS `applicant_username`,`user`.`email` AS `applicant_email` from ((((`job_listing` join `contract` on((`job_listing`.`id` = `contract`.`job_listing_id`))) join `application` on((`contract`.`application_id` = `application`.`job_listing_id`))) join `employee` on((`application`.`employee_id` = `employee`.`id`))) join `user` on((`employee`.`user_id` = `user`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `recent_job_listings`
--

/*!50001 DROP VIEW IF EXISTS `recent_job_listings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `recent_job_listings` AS select `job_listing`.`job_title` AS `job_title`,`job_listing`.`job_description` AS `job_description`,`job_listing`.`reward` AS `reward` from `job_listing` where (`job_listing`.`status` = 'NEW') */;
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

-- Dump completed on 2023-12-21 11:09:20
