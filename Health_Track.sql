CREATE DATABASE  IF NOT EXISTS `health_track` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `health_track`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: health_track
-- ------------------------------------------------------
-- Server version	8.0.36

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
  `Address_ID` int NOT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `District` varchar(50) DEFAULT NULL,
  `Postal_Code` varchar(20) DEFAULT NULL,
  `City_ID` int DEFAULT NULL,
  PRIMARY KEY (`Address_ID`),
  KEY `City_ID` (`City_ID`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`City_ID`) REFERENCES `city` (`City_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'123 Main St','Manhattan','10001',1),(2,'456 Queen St','Downtown','M5V 2A3',2),(3,'789 Park Ave','Westminster','SW1A 1AA',3),(4,'321 Elm St','Downtown','90001',4),(5,'654 Oak St','West End','V6B 2T9',5),(6,'987 High St','City Centre','M1 1AG',6),(7,'234 Maple St','Loop','60601',7),(8,'567 Pine St','Old Montreal','H2Z 1J2',8),(9,'890 Cedar St','Digbeth','B4 6BS',9),(10,'1234 Willow St','Downtown','77002',10);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `Appointment_ID` int NOT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  `Patient_ID` int DEFAULT NULL,
  `Staff_ID` int DEFAULT NULL,
  PRIMARY KEY (`Appointment_ID`),
  KEY `Patient_ID` (`Patient_ID`),
  KEY `Staff_ID` (`Staff_ID`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`),
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,'2023-01-15','08:00:00',1,1),(2,'2023-02-15','09:00:00',2,2),(3,'2023-03-15','10:00:00',3,3),(4,'2023-04-15','11:00:00',4,4),(5,'2023-05-15','12:00:00',5,5),(6,'2023-06-15','13:00:00',6,6),(7,'2023-07-15','14:00:00',7,7),(8,'2023-08-15','15:00:00',8,8),(9,'2023-09-15','16:00:00',9,9),(10,'2023-10-15','17:00:00',10,10),(11,'2024-05-01','10:00:00',1,3),(12,'2024-05-10','11:00:00',1,3),(13,'2024-05-20','12:00:00',1,6),(14,'2024-05-13','12:00:00',2,3),(15,'2024-05-19','16:00:00',2,9),(16,'2024-05-26','15:00:00',2,9),(17,'2024-05-01','12:00:00',3,3),(18,'2024-05-08','13:00:00',3,6),(19,'2024-05-15','11:00:00',3,6);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `Attendance_ID` int NOT NULL,
  `Attendance_State` varchar(50) DEFAULT NULL,
  `Patient_ID` int DEFAULT NULL,
  `Therapy_ID` int DEFAULT NULL,
  `Absence_Time` datetime DEFAULT NULL,
  PRIMARY KEY (`Attendance_ID`),
  KEY `Patient_ID` (`Patient_ID`),
  KEY `Therapy_ID` (`Therapy_ID`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`),
  CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`Therapy_ID`) REFERENCES `prescribed_therapy` (`Therapy_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,'Attended',1,1,NULL),(2,'Attended',2,2,NULL),(3,'Attended',3,3,NULL),(4,'Attended',4,4,NULL),(5,'Attended',5,5,NULL),(6,'Attended',6,6,NULL),(7,'Attended',7,7,NULL),(8,'Attended',8,8,NULL),(9,'Attended',9,9,NULL),(10,'Attended',10,10,NULL);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `City_ID` int NOT NULL,
  `City_Name` varchar(50) DEFAULT NULL,
  `Country_ID` int DEFAULT NULL,
  PRIMARY KEY (`City_ID`),
  KEY `Country_ID` (`Country_ID`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`Country_ID`) REFERENCES `country` (`Country_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'New York',1),(2,'Toronto',2),(3,'London',3),(4,'Los Angeles',4),(5,'Vancouver',5),(6,'Manchester',6),(7,'Chicago',7),(8,'Montreal',8),(9,'Birmingham',9),(10,'Houston',10);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `Country_ID` int NOT NULL,
  `Country_Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Country_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'United States'),(2,'Canada'),(3,'United Kingdom'),(4,'United States'),(5,'Canada'),(6,'United Kingdom'),(7,'United States'),(8,'Canada'),(9,'United Kingdom'),(10,'United States');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosis`
--

DROP TABLE IF EXISTS `diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosis` (
  `Diagnosis_ID` int NOT NULL,
  `Diagnosis_Name` varchar(100) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Diagnosis_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis`
--

LOCK TABLES `diagnosis` WRITE;
/*!40000 ALTER TABLE `diagnosis` DISABLE KEYS */;
INSERT INTO `diagnosis` VALUES (1,'ADHD','Attention-deficit/hyperactivity disorder'),(2,'Autism','Autism spectrum disorder'),(3,'Major Depressive Disorder','Major depressive disorder, also known as clinical depression'),(4,'Anxiety Disorder','Generalized anxiety disorder'),(5,'ADHD','Attention-deficit/hyperactivity disorder'),(6,'Autism','Autism spectrum disorder'),(7,'Major Depressive Disorder','Major depressive disorder, also known as clinical depression'),(8,'Anxiety Disorder','Generalized anxiety disorder'),(9,'ADHD','Attention-deficit/hyperactivity disorder'),(10,'Autism','Autism spectrum disorder');
/*!40000 ALTER TABLE `diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosis_to_patient`
--

DROP TABLE IF EXISTS `diagnosis_to_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosis_to_patient` (
  `Patient_ID` int NOT NULL,
  `Diagnosis_ID` int NOT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  PRIMARY KEY (`Patient_ID`,`Diagnosis_ID`),
  KEY `Diagnosis_ID` (`Diagnosis_ID`),
  CONSTRAINT `diagnosis_to_patient_ibfk_1` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`),
  CONSTRAINT `diagnosis_to_patient_ibfk_2` FOREIGN KEY (`Diagnosis_ID`) REFERENCES `diagnosis` (`Diagnosis_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis_to_patient`
--

LOCK TABLES `diagnosis_to_patient` WRITE;
/*!40000 ALTER TABLE `diagnosis_to_patient` DISABLE KEYS */;
INSERT INTO `diagnosis_to_patient` VALUES (1,1,'2023-01-01','2023-02-01'),(2,2,'2023-02-01','2023-03-01'),(3,3,'2023-03-01','2023-04-01'),(4,4,'2023-04-01','2023-05-01'),(5,1,'2023-05-01','2023-06-01'),(6,2,'2023-06-01','2023-07-01'),(7,3,'2023-07-01','2023-08-01'),(8,4,'2023-08-01','2023-09-01'),(9,1,'2023-09-01','2023-10-01'),(10,2,'2023-10-01','2023-11-01');
/*!40000 ALTER TABLE `diagnosis_to_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medication_type`
--

DROP TABLE IF EXISTS `medication_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medication_type` (
  `Medication_Type_ID` int NOT NULL,
  `Medication_Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Medication_Type_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication_type`
--

LOCK TABLES `medication_type` WRITE;
/*!40000 ALTER TABLE `medication_type` DISABLE KEYS */;
INSERT INTO `medication_type` VALUES (1,'Adderall'),(2,'Ritalin'),(3,'Prozac'),(4,'Xanax'),(5,'Adderall'),(6,'Ritalin'),(7,'Prozac'),(8,'Xanax'),(9,'Adderall'),(10,'Ritalin');
/*!40000 ALTER TABLE `medication_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `Patient_ID` int NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Phone_Number` varchar(20) DEFAULT NULL,
  `Address_ID` int DEFAULT NULL,
  PRIMARY KEY (`Patient_ID`),
  KEY `Address_ID` (`Address_ID`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`Address_ID`) REFERENCES `address` (`Address_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Alice Johnson','Female','1990-05-15','111-222-3333',1),(2,'Bob Smith','Male','1985-10-20','222-333-4444',2),(3,'Charlie Brown','Male','1978-03-12','333-444-5555',3),(4,'Diana Davis','Female','1995-07-30','444-555-6666',4),(5,'Eva Wilson','Female','1983-01-05','555-666-7777',5),(6,'Frank Miller','Male','1970-11-18','New_Phone_Number',6),(7,'Grace Taylor','Female','1992-09-25','777-888-9999',7),(8,'Henry Anderson','Male','1980-06-08','888-999-0000',8),(9,'Ivy Jackson','Female','1988-12-15','999-000-1111',9),(10,'Jack White','Male','1975-04-03','000-111-2222',10);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `patient_attendance_record`
--

DROP TABLE IF EXISTS `patient_attendance_record`;
/*!50001 DROP VIEW IF EXISTS `patient_attendance_record`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `patient_attendance_record` AS SELECT 
 1 AS `Attendance_ID`,
 1 AS `Attendance_State`,
 1 AS `Patient_ID`,
 1 AS `Patient_Name`,
 1 AS `Therapy_Name`,
 1 AS `Session_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `prescribed_medication`
--

DROP TABLE IF EXISTS `prescribed_medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescribed_medication` (
  `Medication_ID` int NOT NULL,
  `Dosage` varchar(50) DEFAULT NULL,
  `Session_ID` int DEFAULT NULL,
  `Staff_ID` int DEFAULT NULL,
  `Medication_Type_ID` int DEFAULT NULL,
  PRIMARY KEY (`Medication_ID`),
  KEY `Session_ID` (`Session_ID`),
  KEY `Staff_ID` (`Staff_ID`),
  KEY `Medication_Type_ID` (`Medication_Type_ID`),
  CONSTRAINT `prescribed_medication_ibfk_1` FOREIGN KEY (`Session_ID`) REFERENCES `session` (`Session_ID`),
  CONSTRAINT `prescribed_medication_ibfk_2` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`),
  CONSTRAINT `prescribed_medication_ibfk_3` FOREIGN KEY (`Medication_Type_ID`) REFERENCES `medication_type` (`Medication_Type_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescribed_medication`
--

LOCK TABLES `prescribed_medication` WRITE;
/*!40000 ALTER TABLE `prescribed_medication` DISABLE KEYS */;
INSERT INTO `prescribed_medication` VALUES (1,'10mg',1,1,1),(2,'20mg',2,2,2),(3,'30mg',3,3,3),(4,'40mg',4,4,4),(5,'10mg',5,5,1),(6,'20mg',6,6,2),(7,'30mg',7,7,3),(8,'40mg',8,8,4),(9,'10mg',9,9,1),(10,'20mg',10,10,2),(11,'Dosage',2,9,3);
/*!40000 ALTER TABLE `prescribed_medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescribed_therapy`
--

DROP TABLE IF EXISTS `prescribed_therapy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescribed_therapy` (
  `Therapy_ID` int NOT NULL,
  `Therapy_Description` varchar(255) DEFAULT NULL,
  `Session_ID` int DEFAULT NULL,
  `Staff_ID` int DEFAULT NULL,
  `Therapy_Type_ID` int DEFAULT NULL,
  PRIMARY KEY (`Therapy_ID`),
  KEY `Session_ID` (`Session_ID`),
  KEY `Staff_ID` (`Staff_ID`),
  KEY `Therapy_Type_ID` (`Therapy_Type_ID`),
  CONSTRAINT `prescribed_therapy_ibfk_1` FOREIGN KEY (`Session_ID`) REFERENCES `session` (`Session_ID`),
  CONSTRAINT `prescribed_therapy_ibfk_2` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`),
  CONSTRAINT `prescribed_therapy_ibfk_3` FOREIGN KEY (`Therapy_Type_ID`) REFERENCES `therapy_type` (`Therapy_Type_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescribed_therapy`
--

LOCK TABLES `prescribed_therapy` WRITE;
/*!40000 ALTER TABLE `prescribed_therapy` DISABLE KEYS */;
INSERT INTO `prescribed_therapy` VALUES (1,'Weekly CBT sessions',1,1,1),(2,'Weekly IPT sessions',2,2,2),(3,'Weekly exposure sessions',3,3,3),(4,'Weekly CBT sessions',4,4,4),(5,'Weekly IPT sessions',5,5,5),(6,'Weekly exposure sessions',6,6,6),(7,'Weekly CBT sessions',7,7,7),(8,'Weekly IPT sessions',8,8,8),(9,'Weekly exposure sessions',9,9,9),(10,'Weekly CBT sessions',10,10,10);
/*!40000 ALTER TABLE `prescribed_therapy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `psychological_assessment`
--

DROP TABLE IF EXISTS `psychological_assessment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `psychological_assessment` (
  `Assessment_Report_ID` int NOT NULL,
  `Wechsler_Intelligence_Scale_Score` int DEFAULT NULL,
  `Psychologists_Description` varchar(255) DEFAULT NULL,
  `Session_ID` int DEFAULT NULL,
  `Staff_ID` int DEFAULT NULL,
  PRIMARY KEY (`Assessment_Report_ID`),
  KEY `Session_ID` (`Session_ID`),
  KEY `Staff_ID` (`Staff_ID`),
  CONSTRAINT `psychological_assessment_ibfk_1` FOREIGN KEY (`Session_ID`) REFERENCES `session` (`Session_ID`),
  CONSTRAINT `psychological_assessment_ibfk_2` FOREIGN KEY (`Staff_ID`) REFERENCES `staff` (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `psychological_assessment`
--

LOCK TABLES `psychological_assessment` WRITE;
/*!40000 ALTER TABLE `psychological_assessment` DISABLE KEYS */;
INSERT INTO `psychological_assessment` VALUES (1,110,'Average intelligence level',1,1),(2,115,'Above average intelligence level',2,2),(4,105,'Below average intelligence level',4,4),(5,100,'Low intelligence level',5,5),(6,125,'Very high intelligence level',6,6),(7,110,'Average intelligence level',7,7),(8,115,'Above average intelligence level',8,8),(9,120,'High intelligence level',9,9),(10,105,'Below average intelligence level',10,10),(11,85,'Below average intelligence level',3,4);
/*!40000 ALTER TABLE `psychological_assessment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `Role_ID` int NOT NULL,
  `Position` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Role_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Doctor'),(2,'Psychologist'),(3,'Receptionist'),(4,'Doctor'),(5,'Psychologist'),(6,'Receptionist'),(7,'Doctor'),(8,'Psychologist'),(9,'Receptionist'),(10,'Doctor');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session` (
  `Session_ID` int NOT NULL,
  `Start_Time` datetime DEFAULT NULL,
  `End_Time` datetime DEFAULT NULL,
  `Appointment_ID` int DEFAULT NULL,
  PRIMARY KEY (`Session_ID`),
  KEY `Appointment_ID` (`Appointment_ID`),
  CONSTRAINT `session_ibfk_1` FOREIGN KEY (`Appointment_ID`) REFERENCES `appointment` (`Appointment_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
INSERT INTO `session` VALUES (1,'2023-01-15 08:00:00','2023-01-15 09:00:00',1),(2,'2023-02-15 09:00:00','2023-02-15 10:00:00',2),(3,'2023-03-15 10:00:00','2023-03-15 11:00:00',3),(4,'2023-04-15 11:00:00','2023-04-15 12:00:00',4),(5,'2023-05-15 12:00:00','2023-05-15 13:00:00',5),(6,'2023-06-15 13:00:00','2023-06-15 14:00:00',6),(7,'2023-07-15 14:00:00','2023-07-15 15:00:00',7),(8,'2023-08-15 15:00:00','2023-08-15 16:00:00',8),(9,'2023-09-15 16:00:00','2023-09-15 17:00:00',9),(10,'2023-10-15 17:00:00','2023-10-15 18:00:00',10);
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `Staff_ID` int NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Phone_Number` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Role_ID` int DEFAULT NULL,
  `Address_ID` int DEFAULT NULL,
  PRIMARY KEY (`Staff_ID`),
  KEY `Role_ID` (`Role_ID`),
  KEY `Address_ID` (`Address_ID`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`Role_ID`) REFERENCES `role` (`Role_ID`),
  CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`Address_ID`) REFERENCES `address` (`Address_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'John Smith','123-456-7890','john.smith@example.com',1,1),(2,'Emily Johnson','234-567-8901','emily.johnson@example.com',2,2),(3,'Michael Williams','345-678-9012','michael.williams@example.com',3,3),(4,'Jessica Brown','456-789-0123','jessica.brown@example.com',1,4),(5,'Daniel Wilson','567-890-1234','daniel.wilson@example.com',2,5),(6,'Sarah Miller','678-901-2345','sarah.miller@example.com',3,6),(7,'David Taylor','789-012-3456','david.taylor@example.com',1,7),(8,'Emma Anderson','890-123-4567','emma.anderson@example.com',2,8),(9,'James Jackson','901-234-5678','james.jackson@example.com',3,9),(10,'Olivia White','012-345-6789','olivia.white@example.com',1,10);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `therapy_type`
--

DROP TABLE IF EXISTS `therapy_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `therapy_type` (
  `Therapy_Type_ID` int NOT NULL,
  `Therapy_Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Therapy_Type_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `therapy_type`
--

LOCK TABLES `therapy_type` WRITE;
/*!40000 ALTER TABLE `therapy_type` DISABLE KEYS */;
INSERT INTO `therapy_type` VALUES (1,'Cognitive Behavioral Therapy'),(2,'Interpersonal Therapy'),(3,'Exposure Therapy'),(4,'Cognitive Behavioral Therapy'),(5,'Interpersonal Therapy'),(6,'Exposure Therapy'),(7,'Cognitive Behavioral Therapy'),(8,'Interpersonal Therapy'),(9,'Exposure Therapy'),(10,'Cognitive Behavioral Therapy');
/*!40000 ALTER TABLE `therapy_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `patient_attendance_record`
--

/*!50001 DROP VIEW IF EXISTS `patient_attendance_record`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patient_attendance_record` AS select `attendance`.`Attendance_ID` AS `Attendance_ID`,`attendance`.`Attendance_State` AS `Attendance_State`,`patient`.`Patient_ID` AS `Patient_ID`,`patient`.`Name` AS `Patient_Name`,`therapy_type`.`Therapy_Name` AS `Therapy_Name`,`prescribed_therapy`.`Session_ID` AS `Session_ID` from (((`attendance` join `patient` on((`attendance`.`Patient_ID` = `patient`.`Patient_ID`))) join `prescribed_therapy` on((`attendance`.`Therapy_ID` = `prescribed_therapy`.`Therapy_ID`))) join `therapy_type` on((`prescribed_therapy`.`Therapy_Type_ID` = `therapy_type`.`Therapy_Type_ID`))) */;
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

-- Dump completed on 2024-05-05  4:39:11
