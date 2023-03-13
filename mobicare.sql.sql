CREATE DATABASE  IF NOT EXISTS `mobicare` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mobicare`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: mobicare
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `ID` int NOT NULL,
  `Status` enum('Active','Disabled') NOT NULL,
  `Time` varchar(10) NOT NULL,
  `Date` varchar(10) NOT NULL,
  `P_ID` int NOT NULL,
  `D_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Appointment_Doctor_idx` (`D_ID`),
  KEY `fk_Appointment_Patient_idx` (`P_ID`),
  CONSTRAINT `fk_Appointment_Doctor` FOREIGN KEY (`D_ID`) REFERENCES `sys_doctor` (`ID`),
  CONSTRAINT `fk_Appointment_Patient` FOREIGN KEY (`P_ID`) REFERENCES `sys_patient` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_report`
--

DROP TABLE IF EXISTS `doctor_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_report` (
  `R_ID` int NOT NULL,
  `D_ID` int NOT NULL,
  `Date` varchar(10) NOT NULL,
  PRIMARY KEY (`R_ID`,`D_ID`),
  KEY `fk_Doctor_Report_Doctor_idx` (`D_ID`),
  CONSTRAINT `fk_Doctor_Report_Doctor` FOREIGN KEY (`D_ID`) REFERENCES `sys_doctor` (`ID`),
  CONSTRAINT `fk_Doctor_Report_Medical_Report` FOREIGN KEY (`R_ID`) REFERENCES `medical_report` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_report`
--

LOCK TABLES `doctor_report` WRITE;
/*!40000 ALTER TABLE `doctor_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctor_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `Id` int NOT NULL,
  `No3` varchar(45) NOT NULL,
  `Date` varchar(10) NOT NULL,
  `Time` varchar(10) NOT NULL,
  `Amount` varchar(10) NOT NULL,
  `D_Id` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Invoice_Doctor_idx` (`D_Id`),
  CONSTRAINT `fk_Invoice_Doctor` FOREIGN KEY (`D_Id`) REFERENCES `sys_doctor` (`ID`)
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
-- Table structure for table `medical_report`
--

DROP TABLE IF EXISTS `medical_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_report` (
  `ID` int NOT NULL,
  `Drugs` varchar(255) DEFAULT NULL,
  `Diagnose` varchar(255) NOT NULL,
  `P_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Medical_Reprt_Patient_idx` (`P_ID`),
  CONSTRAINT `fk_Medical_Reprt_Patient` FOREIGN KEY (`P_ID`) REFERENCES `sys_patient` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_report`
--

LOCK TABLES `medical_report` WRITE;
/*!40000 ALTER TABLE `medical_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `medical_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `Id` int NOT NULL,
  `Medicine` varchar(250) NOT NULL,
  `Advice` varchar(250) DEFAULT NULL,
  `Remark` varchar(250) DEFAULT NULL,
  `P_ID` int NOT NULL,
  `D_ID` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Prescription_Patient_idx` (`P_ID`),
  KEY `fk_Prescription_Doctor_idx` (`D_ID`),
  CONSTRAINT `fk_Prescription_Doctor` FOREIGN KEY (`D_ID`) REFERENCES `sys_doctor` (`ID`),
  CONSTRAINT `fk_Prescription_Patient` FOREIGN KEY (`P_ID`) REFERENCES `sys_patient` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Table structure for table `sys_admin_phones`
--

DROP TABLE IF EXISTS `sys_admin_phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_admin_phones` (
  `Admin_ID` int NOT NULL,
  `Admin_phones` int NOT NULL,
  PRIMARY KEY (`Admin_ID`,`Admin_phones`),
  CONSTRAINT `fk_Admin_Phones_Admin1` FOREIGN KEY (`Admin_ID`) REFERENCES `sys_admin` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_admin_phones`
--

LOCK TABLES `sys_admin_phones` WRITE;
/*!40000 ALTER TABLE `sys_admin_phones` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_admin_phones` ENABLE KEYS */;
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
  `Phone` int NOT NULL,
  `Refresh_Token_Value` varchar(450) DEFAULT NULL,
  `Photo` varchar(200) DEFAULT NULL,
  `Bio` varchar(255) DEFAULT NULL,
  `Vedio` varchar(255) DEFAULT NULL,
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
INSERT INTO `sys_doctor` VALUES (16,'Active',1,'test1','test2','test1_test266@Rosheta.com','2541','test3',0,'test3','test3',138141681,NULL,NULL,NULL,NULL),(17,'Active',1,'test1','test2','test1_test250@Rosheta.com','2541','test3',0,'test3','test3',138141681,NULL,NULL,NULL,NULL),(18,'Active',1,'test1','test2','test1_test257@Rosheta.com','$2b$10$wFUF/Xl6XRhkQU2gJIotHeaQjKOQdBuASChYS3sUVnQB59avOvXhK','test3',0,'test3','test3',138141681,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6MTgsIkRvY3Rvcl9FbWFpbF9WIjoidGVzdDFfdGVzdDI1N0BSb3NoZXRhLmNvbSIsInJvbGUiOiJET0NUT1IiLCJpYXQiOjE2NjY4NzY5NzB9.3gD364QLYMihY3HM11o1qTIyQgcLJmNDtpjkOf7ijbo',NULL,NULL,NULL);
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
  `Symptoms` varchar(250) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
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
INSERT INTO `sys_patient` VALUES (1,'Active','test1','test2','test@yho.com','$2b$10$wFUF/Xl6XRhkQU2gJIotHeLdFyKraEsteJAr2F/Ea1Hy24AohfCdK','test3',0,'test3',1,1,NULL,NULL,NULL,NULL),(2,'Active','test1','test2','test@yhoo.com','$2b$10$wFUF/Xl6XRhkQU2gJIotHeaQjKOQdBuASChYS3sUVnQB59avOvXhK','test3',0,'test3',1,1,NULL,NULL,NULL,NULL),(3,'Active','test1','test2','test@yahoo.com','$2b$10$wFUF/Xl6XRhkQU2gJIotHeaQjKOQdBuASChYS3sUVnQB59avOvXhK','test3',0,'test3',1,1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJJRCI6MywiUGF0aWVudF9FbWFpbF9WIjoidGVzdEB5YWhvby5jb20iLCJyb2xlIjoiUEFUSUVOVCIsImlhdCI6MTY2Njg3Njg0NH0.NKtKrx-nuFc-3fNZylRtE9lIAhSCstvsWAnp54qYLWA',NULL,NULL,NULL);
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-14  1:11:57
