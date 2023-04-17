CREATE DATABASE  IF NOT EXISTS `mobicare` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mobicare`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mobicare
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `sys_admin`
--

DROP TABLE IF EXISTS `sys_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_admin` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `F_Name` varchar(15) NOT NULL,
  `L_Name` varchar(15) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Pass` varchar(450) NOT NULL,
  `Gender` varchar(15) NOT NULL,
  `DOB` varchar(10) NOT NULL,
  `Refresh_Token_Value` varchar(450) DEFAULT NULL,
  `Photo` varchar(200) DEFAULT NULL,
  `Admin_Status` enum('Active','Disabled') NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_admin`
--

LOCK TABLES `sys_admin` WRITE;
/*!40000 ALTER TABLE `sys_admin` DISABLE KEYS */;
INSERT INTO `sys_admin` VALUES (1,'kk','kk','dd','dd','ddd','dd',NULL,NULL,'Active'),(2,'omar','anas','omar_anas61@yahoo.com','$2b$10$wFUF/Xl6XRhkQU2gJIotHeaQjKOQdBuASChYS3sUVnQB59avOvXhK','male','dd','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6MiwiQWRtaW5fRW1haWxfViI6Im9tYXJfYW5hczYxQHlhaG9vLmNvbSIsInJvbGUiOiJBRE1JTiIsImlhdCI6MTY2Njg3Njk3NX0.92q_7T6o78cD_ICQF5u4wvJjVNVzfk24cd0ssGuziDA',NULL,'Active');
/*!40000 ALTER TABLE `sys_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_doctor`
--

DROP TABLE IF EXISTS `sys_doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_doctor` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Doctor_Status` enum('Active','Disabled') NOT NULL,
  `Admin_ID` int NOT NULL,
  `F_Name` varchar(15) NOT NULL,
  `L_Name` varchar(15) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Pass` varchar(250) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Gender` tinyint NOT NULL,
  `DOB` varchar(10) NOT NULL,
  `Specialization` varchar(45) NOT NULL,
  `Phone` varchar(11) NOT NULL,
  `Refresh_Token_Value` varchar(450) DEFAULT NULL,
  `Photo` varchar(200) DEFAULT NULL,
  `Bio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `fk_Doctor_Admin1_idx` (`Admin_ID`),
  CONSTRAINT `fk_Doctor_Admin1` FOREIGN KEY (`Admin_ID`) REFERENCES `sys_admin` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_doctor`
--

LOCK TABLES `sys_doctor` WRITE;
/*!40000 ALTER TABLE `sys_doctor` DISABLE KEYS */;
INSERT INTO `sys_doctor` VALUES (16,'Active',1,'test1','test2','test1_test266@Rosheta.com','2541','test3',0,'test3','test3','138141681',NULL,NULL,NULL),(17,'Active',1,'test1','test2','test1_test250@Rosheta.com','2541','test3',0,'test3','test3','138141681',NULL,NULL,NULL),(18,'Active',1,'test1','test2','test1_test257@Rosheta.com','$2b$10$wFUF/Xl6XRhkQU2gJIotHeaQjKOQdBuASChYS3sUVnQB59avOvXhK','test3',0,'test3','test3','138141681','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6MTgsIkRvY3Rvcl9FbWFpbF9WIjoidGVzdDFfdGVzdDI1N0BSb3NoZXRhLmNvbSIsInJvbGUiOiJET0NUT1IiLCJpYXQiOjE2NjY4NzY5NzB9.3gD364QLYMihY3HM11o1qTIyQgcLJmNDtpjkOf7ijbo',NULL,NULL);
/*!40000 ALTER TABLE `sys_doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_patient`
--

DROP TABLE IF EXISTS `sys_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_patient` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Patient_Status` enum('Active','Disabled') NOT NULL,
  `F_Name` varchar(15) NOT NULL,
  `L_Name` varchar(15) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Pass` varchar(250) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Gender` tinyint NOT NULL,
  `DOB` varchar(10) NOT NULL,
  `Weight` int DEFAULT NULL,
  `Height` int DEFAULT NULL,
  `Refresh_Token_Value` varchar(450) DEFAULT NULL,
  `Photo` varchar(200) DEFAULT NULL,
  `Phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_patient`
--

LOCK TABLES `sys_patient` WRITE;
/*!40000 ALTER TABLE `sys_patient` DISABLE KEYS */;
INSERT INTO `sys_patient` VALUES (1,'Active','test1','test2','test@yho.com','$2b$10$wFUF/Xl6XRhkQU2gJIotHeLdFyKraEsteJAr2F/Ea1Hy24AohfCdK','test3',0,'test3',1,1,NULL,NULL,NULL),(2,'Active','test1','test2','test@yhoo.com','$2b$10$wFUF/Xl6XRhkQU2gJIotHeaQjKOQdBuASChYS3sUVnQB59avOvXhK','test3',0,'test3',1,1,NULL,NULL,NULL),(3,'Active','test1','test2','test@yahoo.com','$2b$10$wFUF/Xl6XRhkQU2gJIotHeaQjKOQdBuASChYS3sUVnQB59avOvXhK','test3',0,'test3',1,1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6MywiUGF0aWVudF9FbWFpbF9WIjoidGVzdEB5YWhvby5jb20iLCJyb2xlIjoiUEFUSUVOVCIsImlhdCI6MTY2Njg3Njg0NH0.NKtKrx-nuFc-3fNZylRtE9lIAhSCstvsWAnp54qYLWA',NULL,NULL);
/*!40000 ALTER TABLE `sys_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_patient_has_doctor`
--

DROP TABLE IF EXISTS `sys_patient_has_doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_patient_has_doctor` (
  `Patient_ID` int NOT NULL,
  `Doctor_ID` int NOT NULL,
  PRIMARY KEY (`Patient_ID`,`Doctor_ID`),
  KEY `fk_Patient_has_Doctor_Doctor1_idx` (`Doctor_ID`),
  KEY `fk_Patient_has_Doctor_Patient1_idx` (`Patient_ID`),
  CONSTRAINT `fk_Patient_has_Doctor_Doctor1` FOREIGN KEY (`Doctor_ID`) REFERENCES `sys_doctor` (`ID`),
  CONSTRAINT `fk_Patient_has_Doctor_Patient1` FOREIGN KEY (`Patient_ID`) REFERENCES `sys_patient` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_patient_has_doctor`
--

LOCK TABLES `sys_patient_has_doctor` WRITE;
/*!40000 ALTER TABLE `sys_patient_has_doctor` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_patient_has_doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_symptoms`
--

DROP TABLE IF EXISTS `sys_symptoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_symptoms` (
  `ID` int NOT NULL,
  `Patient_ID` int NOT NULL,
  `Symptoms` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`,`Patient_ID`),
  KEY `fk_Symptoms_Patient1_idx` (`Patient_ID`),
  CONSTRAINT `fk_Symptoms_Patient1` FOREIGN KEY (`Patient_ID`) REFERENCES `sys_patient` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_symptoms`
--

LOCK TABLES `sys_symptoms` WRITE;
/*!40000 ALTER TABLE `sys_symptoms` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_symptoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_vedios_doctor`
--

DROP TABLE IF EXISTS `sys_vedios_doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_vedios_doctor` (
  `ID` int NOT NULL,
  `Doctor_ID` int NOT NULL,
  `Vedio` varchar(255) NOT NULL,
  `Desccription` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`,`Doctor_ID`),
  KEY `fk_Doctor_Vedios_Doctor1_idx` (`Doctor_ID`),
  CONSTRAINT `fk_Doctor_Vedios_Doctor1` FOREIGN KEY (`Doctor_ID`) REFERENCES `sys_doctor` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_vedios_doctor`
--

LOCK TABLES `sys_vedios_doctor` WRITE;
/*!40000 ALTER TABLE `sys_vedios_doctor` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_vedios_doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mobicare'
--

--
-- Dumping routines for database 'mobicare'
--
/*!50003 DROP PROCEDURE IF EXISTS `ADD_NEW_ADMIN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `ADD_NEW_ADMIN`(
F_Name_V varchar(15),
L_Name_V  varchar(15),
Email_V  varchar(45),
Pass_V  varchar(45),
Gender_V  varchar(15),
DOB_V  varchar(10),
Photo_V  varchar(200)
)
BEGIN
insert into sys_Admin(
Admin_Status,
F_Name,
L_Name,
Email,
Pass, 
Gender,
DOB,
Photo

)VALUES(
'Active',
F_Name_V ,
L_Name_V ,
Email_V ,
Pass_V, 
Gender_V ,
DOB_V,
Photo_V
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ADD_NEW_DOCTOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `ADD_NEW_DOCTOR`(
Admin_ID_V int(11),
F_Name_V varchar(15),
L_Name_V  varchar(15),
Email_V  varchar(45),
Pass_V   VARCHAR(250),
Address_V  varchar(45),
Gender_V  varchar(15),
DOB_V  varchar(10),
Specialization_V  varchar(45),
Phone_V  varchar(11),
Photo_V VARCHAR(200)
)
BEGIN
insert into sys_Doctor(
Doctor_Status,
Admin_ID,
F_Name,
L_Name,
Email,
Pass,
Address, 
Gender,
DOB,
Specialization,
Phone,
Photo

)VALUES(
'Active',
Admin_ID_V,
Clinic_ID_V ,
F_Name_V ,
L_Name_V ,
Email_V ,
Pass_V,
Address_V, 
Gender_V ,
DOB_V,
Specialization_V ,  
Phone_V,
Photo_V
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ADD_NEW_PATIENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `ADD_NEW_PATIENT`(
F_Name_V varchar(15),
L_Name_V  varchar(15),
Email_V  varchar(45),
Pass_V  varchar(450),
Address_V  varchar(45),
Phone_V varchar(11),
Gender_V  varchar(15),
DOB_V  varchar(10)
)
BEGIN
insert into sys_Patient(
Patient_Status,
F_Name,
L_Name,
Email,
Pass,
Address,
Phone, 
Gender,
DOB

)VALUES(
'Active',
F_Name_V ,
L_Name_V ,
Email_V ,
Pass_V,
Address_V, 
Phone_V,
Gender_V ,
DOB_V
);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ADD_NEW_PATIENTS_has_DOCTOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `ADD_NEW_PATIENTS_has_DOCTOR`(
Patient_ID_V int(11),
Doctor_ID_V int(11)
)
BEGIN
insert into sys_Patient_has_Doctor(
Patient_ID,
Doctor_ID

)VALUES(
Patient_ID_V, 
Doctor_ID_V);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ADD_NEW_SYMPTOMS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `ADD_NEW_SYMPTOMS`(
Symptoms_ID_V int(11),
Patient_ID_V int(11),
Symptoms_V varchar(255)
)
BEGIN
insert into sys_symptoms(
ID,
Patient_ID,
Symptoms
)VALUES(
Symptoms_ID_V, 
Patient_ID_V,
Symptoms_V);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ADD_NEW_VEDIO_of_DOCTOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `ADD_NEW_VEDIO_of_DOCTOR`(
Vedio_ID_V int(11),
Doctor_ID_V int(11),
Vedio_V varchar(255),
Desccription_V varchar(255)
)
BEGIN
insert into sys_vedios_doctor(
ID,
Doctor_ID,
Vedio,
Desccription
)VALUES(
Vedio_ID_V, 
Doctor_ID_V,
Vedio_V,
Desccription_V);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EDIT_ADMIN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `EDIT_ADMIN`(
ID_V int(11),
F_Name_V varchar(15),
L_Name_V  varchar(15),
Email_V  varchar(45),
Pass_V  varchar(45),
Gender_V  varchar(15),
DOB_V  varchar(10),
Photo_V  varchar(200)
)
BEGIN
update sys_Admin
set
    F_Name = IFNULL(F_Name_V,F_Name),
	L_Name = IFNULL(L_Name_V,L_Name),
	Email = IFNULL(Email_V,Email),
	Pass = IFNULL(Pass_V,Pass),
	Gender = IFNULL(Gender_V,Gender),
	DOB = IFNULL(DOB_V,DOB),
    Photo = IFNULL(Photo_V,Photo)
    where ID = ID_V;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EDIT_DOCTOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `EDIT_DOCTOR`(
ID_V int(11),
Status_V varchar(30),
Admin_ID_V int(11),
F_Name_V varchar(15),
L_Name_V  varchar(15),
Email_V  varchar(45),
Pass_V  VARCHAR(250),
Address_V  varchar(45),
Gender_V  varchar(15),
DOB_V  varchar(10),
Specialization_V  varchar(45),
Phone_V  varchar(11),
Photo_V VARCHAR(200),
Bio_V VARCHAR(250)

)
BEGIN
update sys_Doctor
set
	Doctor_Status = IFNULL(Status_V,Doctor_Status),
    Admin_ID = IFNULL(Admin_ID_V,Admin_ID),
    F_NAME = IFNULL(F_NAME_V,F_NAME),
	L_NAME = IFNULL(L_NAME_V,L_NAME),
	Email = IFNULL(Email_V,Email),
    Pass = IFNULL(Pass_V,Pass),
	Address = IFNULL(Address_V,Address),
	Gender = IFNULL(Gender_V,Gender),
	DOB = IFNULL(DOB_V,DOB),
	Specialization = IFNULL(Specialization_V,Specialization),
	Phone = IFNULL(Phone_V,Phone),
    Photo = IFNULL(Photo_V,Photo),
    Bio = IFNULL(Bio_V,Bio)
    where ID = ID_V;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EDIT_Patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `EDIT_Patient`(
ID_V int(11),
Status_V varchar(30),
F_Name_V varchar(15),
L_Name_V  varchar(15),
Email_V  varchar(45),
Pass_V  varchar(45),
Address_V  varchar(45),
Phone_V varchar(11),
Gender_V  varchar(15),
DOB_V  varchar(10),
Weight_V  INT(11),
Height_V  INT(11),
Photo_V varchar(200)
)
BEGIN
update sys_Patient
set
    Patient_Status = IFNULL(Status_V,Patient_Status),
    F_NAME = IFNULL(F_NAME_V,F_NAME),
	L_NAME = IFNULL(L_NAME_V,L/_NAME),
	Email = IFNULL(Email_V,Email),
    Pass = IFNULL(Pass_V,Pass),
	Address = IFNULL(Address_V,Address),
    Phone = IFNULL(Phone_V,Phone),
	Gender = IFNULL(Gender_V,Gender),
	DOB = IFNULL(DOB_V,DOB),
	Weight= IFNULL(Weight_V,Weight),
	Height = IFNULL(Height_V,Height),
	Photo = IFNULL(Photo_V,Photo)
    where ID = ID_V;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EDIT_PATIENT_has_DOCTOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `EDIT_PATIENT_has_DOCTOR`(
Patient_ID_V int(11),
Doctor_ID_V int(11)
)
BEGIN
update sys_vedios_doctor
set
    Doctor_ID = IFNULL(Doctor_ID_V,Doctor_ID)
    where Patient_ID = Patient_ID_V;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EDIT_Symptom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `EDIT_Symptom`(
ID_V int(11),
Patient_ID_V int(11),
Symptom_V VARCHAR(255)

)
BEGIN
update sys_symptoms
set
    Patient_ID = IFNULL(Patient_ID_V,Patient_ID),
    Symptom = IFNULL(Symptom_V,Symptom)
    where ID = ID_V;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EDIT_SYMPTOMS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `EDIT_SYMPTOMS`(
ID_V int(11),
Patient_ID_V int(11),
Symptoms_V VARCHAR(255)

)
BEGIN
update sys_symptoms
set
    Patient_ID = IFNULL(Patient_ID_V,Patient_ID),
    Symptoms = IFNULL(Symptoms_V,Symptoms)
    where ID = ID_V;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EDIT_VEDIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `EDIT_VEDIO`(
ID_V int(11),
Doctor_ID_V int(11),
Vedio_V VARCHAR(255),
Desccription_V VARCHAR(255)

)
BEGIN
update sys_vedios_doctor
set
    Doctor_ID = IFNULL(Doctor_ID_V,Doctor_ID),
    Vedio = IFNULL(Vedio_V,Vedio),
    Desccription = IFNULL(Desccription_V,Desccription)
    
    where ID = ID_V;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_ADMIN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_ADMIN`(ID_V int)
BEGIN
select * from sys_Admin where ID = ID_V; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_ADMIN_REFRESHTOKEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_ADMIN_REFRESHTOKEN`(ID_V int)
BEGIN
select Refresh_Token_Value from sys_admin where ID = ID_V;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_ALL_Admins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_ALL_Admins`( OFFSET_V int, ROWS_PER_PAGE_V int)
BEGIN
select * from sys_Admin LIMIT OFFSET_V, ROWS_PER_PAGE_V ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_ALL_DOCTORS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_ALL_DOCTORS`( OFFSET_V int , ROWS_PER_PAGE_V int )
BEGIN
select * from sys_Doctor LIMIT OFFSET_V ,ROWS_PER_PAGE_V ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_ALL_PATIENTS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_ALL_PATIENTS`( OFFSET_V int , ROWS_PER_PAGE_V int )
BEGIN
select * from sys_Patient LIMIT OFFSET_V, ROWS_PER_PAGE_V ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_ALL_PATIENTS_has_DOCTORS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_ALL_PATIENTS_has_DOCTORS`( OFFSET_V int , ROWS_PER_PAGE_V int )
BEGIN
select * from sys_Patient_has_Doctor LIMIT OFFSET_V ,ROWS_PER_PAGE_V ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_ALL_SYMPTOMS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_ALL_SYMPTOMS`( OFFSET_V int , ROWS_PER_PAGE_V int )
BEGIN
select * from sys_symptoms LIMIT OFFSET_V ,ROWS_PER_PAGE_V ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_ALL_VEDIOS_of_DOCTORS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_ALL_VEDIOS_of_DOCTORS`( OFFSET_V int , ROWS_PER_PAGE_V int )
BEGIN
select * from sys_vedios_doctor LIMIT OFFSET_V ,ROWS_PER_PAGE_V ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_DOCTOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_DOCTOR`(ID_V int)
BEGIN
select * from sys_Doctor where ID = ID_V; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_DOCTOR_HAS_PATIENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_DOCTOR_HAS_PATIENT`(Doctor_ID_V int)
BEGIN
select * from sys_Patient_has_Doctor where Doctor_ID = Doctor_ID_V; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_DOCTOR_HAS_VEDIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_DOCTOR_HAS_VEDIO`(vedio_ID_V int)
BEGIN
select * from sys_vedios_doctor where ID = vedio_ID_V; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_DOCTOR_REFRESHTOKEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_DOCTOR_REFRESHTOKEN`(ID_V int)
BEGIN
select Refresh_Token_Value from sys_doctor where ID = ID_V;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_PATIENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_PATIENT`(ID_V int)
BEGIN
select * from sys_Patient where ID = ID_V; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_PATIENT_HAS_DOCTOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_PATIENT_HAS_DOCTOR`(Patient_ID_V int)
BEGIN
select * from sys_Patient_has_Doctor where Patient_ID = Patient_ID_V; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_PATIENT_REFRESHTOKEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_PATIENT_REFRESHTOKEN`(ID_V int)
BEGIN
select Refresh_Token_Value from sys_patient where ID = ID_V;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GET_SYMPTOM` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `GET_SYMPTOM`(Symptoms_ID_V int)
BEGIN
select * from sys_symptoms where ID = Symptoms_ID_V; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LOGIN_ADMIN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `LOGIN_ADMIN`(
     Email_V  VARCHAR(50),
     hashed_password_v  VARCHAR(250)
)
BEGIN

SELECT ID  FROM sys_admin
      WHERE  Email = Email_V   
      and  pass = hashed_password_v;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LOGIN_DOCTOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `LOGIN_DOCTOR`(
     Email_V  VARCHAR(50),
     hashed_password_v  VARCHAR(250)
)
BEGIN

SELECT ID  FROM sys_doctor
      WHERE  Email = Email_V   
      and  pass = hashed_password_v;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LOGIN_PATIENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `LOGIN_PATIENT`(
     Email_V  VARCHAR(50),
     hashed_password_v  VARCHAR(250)
)
BEGIN

SELECT ID  FROM sys_patient
      WHERE  Email = Email_V   
      and  pass = hashed_password_v;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPDATE_ADMIN_REFRESHTOKEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `UPDATE_ADMIN_REFRESHTOKEN`(ID_V int, Refresh_Token_Value_V varchar(450))
BEGIN
update sys_admin
	set
		Refresh_Token_Value = Refresh_Token_Value_V
		where ID = ID_V;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPDATE_DOCTOR_REFRESHTOKEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `UPDATE_DOCTOR_REFRESHTOKEN`(ID_V int, Refresh_Token_Value_V varchar(450))
BEGIN
update sys_doctor
	set
		Refresh_Token_Value = Refresh_Token_Value_V
		where ID = ID_V;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UPDATE_PATIENT_REFRESHTOKEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `UPDATE_PATIENT_REFRESHTOKEN`(ID_V int, Refresh_Token_Value_V varchar(450))
BEGIN
update sys_patient
	set
		Refresh_Token_Value = Refresh_Token_Value_V
		where ID = ID_V;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-17 19:01:31
