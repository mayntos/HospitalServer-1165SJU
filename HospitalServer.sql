-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: HospitalServer
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `Medication`
--

DROP TABLE IF EXISTS `Medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Medication` (
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
-- Dumping data for table `Medication`
--

LOCK TABLES `Medication` WRITE;
/*!40000 ALTER TABLE `Medication` DISABLE KEYS */;
/*!40000 ALTER TABLE `Medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pharmacist`
--

DROP TABLE IF EXISTS `Pharmacist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pharmacist` (
  `Pharmacist_id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Hospital` varchar(30) NOT NULL,
  PRIMARY KEY (`Pharmacist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pharmacist`
--

LOCK TABLES `Pharmacist` WRITE;
/*!40000 ALTER TABLE `Pharmacist` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pharmacist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prescription_Item`
--

DROP TABLE IF EXISTS `Prescription_Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prescription_Item` (
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
-- Dumping data for table `Prescription_Item`
--

LOCK TABLES `Prescription_Item` WRITE;
/*!40000 ALTER TABLE `Prescription_Item` DISABLE KEYS */;
/*!40000 ALTER TABLE `Prescription_Item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Provider`
--

DROP TABLE IF EXISTS `Provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Provider` (
  `Name` varchar(40) NOT NULL,
  `Provider_type` varchar(12) DEFAULT NULL,
  `Hospital_Dept` varchar(30) NOT NULL,
  `NPI` int(11) NOT NULL,
  `Contact` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Provider`
--

LOCK TABLES `Provider` WRITE;
/*!40000 ALTER TABLE `Provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `Provider` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-08 11:06:51
