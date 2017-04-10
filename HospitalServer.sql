-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: HospitalServer
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `medication`
--

DROP TABLE IF EXISTS `medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medication` (
  `Nonproprietary_Name` varchar(40) NOT NULL,
  `Proprietary_Name` varchar(26) NOT NULL,
  `Labeler` varchar(26) DEFAULT NULL,
  `Substance` varchar(50) DEFAULT NULL,
  `Package_Description` varchar(100) DEFAULT NULL,
  `Strength` varchar(20) DEFAULT NULL,
  `Form` varchar(12) DEFAULT NULL,
  `Route` varchar(26) DEFAULT NULL,
  `Billing_Charge` varchar(50) DEFAULT NULL,
  `NDC` int(11) DEFAULT NULL,
  PRIMARY KEY (`Nonproprietary_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication`
--

LOCK TABLES `medication` WRITE;
/*!40000 ALTER TABLE `medication` DISABLE KEYS */;
/*!40000 ALTER TABLE `medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `name` varchar(50) DEFAULT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  `MRN` char(7) DEFAULT NULL,
  `insurance_company` varchar(50) DEFAULT NULL,
  `id` varchar(10) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `contact_information` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacist`
--

DROP TABLE IF EXISTS `pharmacist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacist` (
  `Pharmacist_id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Hospital` varchar(30) NOT NULL,
  PRIMARY KEY (`Pharmacist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacist`
--

LOCK TABLES `pharmacist` WRITE;
/*!40000 ALTER TABLE `pharmacist` DISABLE KEYS */;
/*!40000 ALTER TABLE `pharmacist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_dispense`
--

DROP TABLE IF EXISTS `pharmacy_dispense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy_dispense` (
  `dispense_ID` varchar(10) NOT NULL,
  `pharmacistID` varchar(10) DEFAULT NULL,
  `prescriptionID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`dispense_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_dispense`
--

LOCK TABLES `pharmacy_dispense` WRITE;
/*!40000 ALTER TABLE `pharmacy_dispense` DISABLE KEYS */;
/*!40000 ALTER TABLE `pharmacy_dispense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_note`
--

DROP TABLE IF EXISTS `pharmacy_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy_note` (
  `prescription_item_ID` varchar(10) NOT NULL,
  `date_and_time` datetime DEFAULT NULL,
  `issue` varchar(50) DEFAULT NULL,
  `prescribing_provider` char(10) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `decision` varchar(50) DEFAULT NULL,
  `date_of_decision` datetime DEFAULT NULL,
  `pharmacistID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`prescription_item_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_note`
--

LOCK TABLES `pharmacy_note` WRITE;
/*!40000 ALTER TABLE `pharmacy_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `pharmacy_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prescription` (
  `medNDC` char(10) NOT NULL,
  `providerID` char(10) DEFAULT NULL,
  `date_and_time` datetime DEFAULT NULL,
  `patientMRN` char(7) DEFAULT NULL,
  `reason` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`medNDC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription_item`
--

DROP TABLE IF EXISTS `prescription_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prescription_item` (
  `itemID` int(11) NOT NULL,
  `startDate` varchar(10) NOT NULL,
  `treatment_Length` varchar(12) DEFAULT NULL,
  `frequency` varchar(15) DEFAULT NULL,
  `form` varchar(10) DEFAULT NULL,
  `dosage` int(11) NOT NULL,
  `number_of_refills` int(11) NOT NULL,
  `diagnosis` varchar(26) NOT NULL,
  PRIMARY KEY (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription_item`
--

LOCK TABLES `prescription_item` WRITE;
/*!40000 ALTER TABLE `prescription_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescription_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider` (
  `Name` varchar(40) NOT NULL,
  `Provider_type` varchar(12) DEFAULT NULL,
  `Hospital_Dept` varchar(30) NOT NULL,
  `NPI` int(11) NOT NULL,
  `Contact` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-09 20:46:16
