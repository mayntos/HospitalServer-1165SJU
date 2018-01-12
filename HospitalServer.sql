-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: hospitalserver
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
-- Table structure for table `dispense_note`
--

DROP TABLE IF EXISTS `dispense_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dispense_note` (
  `dispenseID` varchar(10) NOT NULL,
  `pharmacistID` varchar(10) DEFAULT NULL,
  `prescriptionID` varchar(11) DEFAULT NULL,
  `quantity` varchar(5) DEFAULT NULL,
  `medNDC` int(11) DEFAULT NULL,
  PRIMARY KEY (`dispenseID`),
  KEY `medNDC_idx` (`medNDC`),
  CONSTRAINT `medNDC` FOREIGN KEY (`medNDC`) REFERENCES `medication` (`NDC`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispense_note`
--

LOCK TABLES `dispense_note` WRITE;
/*!40000 ALTER TABLE `dispense_note` DISABLE KEYS */;
INSERT INTO `dispense_note` VALUES ('1393819345','86086','72434','75mgs',545694700),('1977892152','86086','72434','10mgs',545694700),('2309475706','86086','90187','8gms',17089075),('3434298734','86086','43209','8gms',17089075),('7470488721','86086','90187','8gms',17089075),('8194773056','90876','90187','8gms',17089075),('9189565937','86086','68131','10mgs',545694700);
/*!40000 ALTER TABLE `dispense_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medication`
--

DROP TABLE IF EXISTS `medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medication` (
  `NDC` int(11) NOT NULL,
  `nonproprietary_name` varchar(40) DEFAULT NULL,
  `proprietary_name` varchar(40) DEFAULT NULL,
  `substance` varchar(50) DEFAULT NULL,
  `labeler` varchar(25) DEFAULT NULL,
  `package_description` varchar(100) DEFAULT NULL,
  `strength` varchar(20) DEFAULT NULL,
  `form` varchar(12) DEFAULT NULL,
  `route` varchar(26) DEFAULT NULL,
  `billing_charge` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`NDC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication`
--

LOCK TABLES `medication` WRITE;
/*!40000 ALTER TABLE `medication` DISABLE KEYS */;
INSERT INTO `medication` VALUES (90029,'alprazolam','Xanax','alprazolam','Direct RX','60 tablet in 1 bottle (61919-089-60)','2mg','tablet','oral',360.92),(17089075,'.alpha.-ketoglutaric acid','Omeosport','adenosine triphosphate','Guna spa','2 TUBE in 1 BOX(17089-075-20) > 4 g in 1 TUBE','8g / 0.28 oz','pellet','oral',45.00),(50580123,'acetaminophen','Children\'s Tylenol','acetaminophen','Johnson & Johnson','1 bottle, plastic in 1 carton (50580-123-50) > 120 mL in 1 bottle, plastic','4 oz','liquid','oral',6.99),(545694466,'atorvastatin','Lipitor','atorvastatin calcium','A-S Medication Solutions','90 tablets in 1 bottle','10 mg','tablet','oral',142.00),(545694700,'clopidogrel bisulfate','Plavix','clopidogrel bisulfate','A-S Medication Solutions','30 tablets / bottle','75 mg','tablet','oral',8.05);
/*!40000 ALTER TABLE `medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `mrn` char(7) NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `lname` varchar(25) DEFAULT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `contact_information` varchar(50) DEFAULT NULL,
  `insurance_company` varchar(50) DEFAULT NULL,
  `insuranceID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`mrn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('0576472','Abram','Minor','M','2229 Forest Avenue, New York, New York','646-852-6464','Humana','732165894'),('1016800','Richard','Brown','M','1786 Rosewood Lane, Englewood, New Jersey','212-905-2722','BlueCross BlueShield','865324791'),('1156466','Georgia','Bruner','F','66 Farnum Road, Elmhurst, New York','212-379-4091','Aetna','297134756'),('3268795','Emelia','Sanford','F','4047 Deans Lane, Stony Brook, New York','917-455-5228','Aetna','756239418'),('4657891','Zion','Patel','M','215 Terry Lane, New York, NY','321-385-9175','BlueCross BlueShield','654192387'),('6947283','Olive','Johnsson','F','1134 Williams Avenue, Oneida, New York','914-885-2610','United HealthCare','164973258');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacist`
--

DROP TABLE IF EXISTS `pharmacist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacist` (
  `id` varchar(11) NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `lname` varchar(25) DEFAULT NULL,
  `hospital` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacist`
--

LOCK TABLES `pharmacist` WRITE;
/*!40000 ALTER TABLE `pharmacist` DISABLE KEYS */;
INSERT INTO `pharmacist` VALUES ('45789','John','Blascovich','Lenox Hill'),('86086','Leorichard','Pascua','Mount Sinai Beth Israel'),('90876','Jessica','Vasquez','NYU Langone Medical Center');
/*!40000 ALTER TABLE `pharmacist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy_note`
--

DROP TABLE IF EXISTS `pharmacy_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy_note` (
  `noteID` varchar(11) NOT NULL,
  `decisionDateTime` datetime DEFAULT NULL,
  `decision` varchar(50) DEFAULT NULL,
  `date_of_decision` datetime DEFAULT NULL,
  `prescriptionID` varchar(9) DEFAULT NULL,
  `status` varchar(6) DEFAULT NULL,
  `pharmacistID` int(11) DEFAULT NULL,
  PRIMARY KEY (`noteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy_note`
--

LOCK TABLES `pharmacy_note` WRITE;
/*!40000 ALTER TABLE `pharmacy_note` DISABLE KEYS */;
INSERT INTO `pharmacy_note` VALUES ('10293','2015-09-15 14:00:00','Insufficient amount of Plavix','2015-09-15 00:00:00','43209','CLOSED',86086),('10995','2015-09-15 13:00:00','Misread of Lipitor dosage','2015-09-15 00:00:00','18942','CLOSED',45789),('24563','2016-11-13 17:00:00','Medication is not available for this patient','2016-11-13 19:00:00','90187','CLOSED',90876),('53954','2017-04-25 09:00:00','May require Children\'s Tylenol instead','2017-04-25 12:00:00','78395','OPEN',45789);
/*!40000 ALTER TABLE `pharmacy_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prescription` (
  `prescriptionID` varchar(9) NOT NULL,
  `providerNPI` varchar(11) DEFAULT NULL,
  `scriptDATETIME` datetime DEFAULT NULL,
  `patientMRN` char(7) DEFAULT NULL,
  PRIMARY KEY (`prescriptionID`),
  KEY `providerNPI_idx` (`providerNPI`),
  CONSTRAINT `providerNPI` FOREIGN KEY (`providerNPI`) REFERENCES `provider` (`NPI`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES ('145608686','1518013911','2015-09-10 10:30:00','0576472'),('516526851','30323403','2017-04-20 10:30:31','1016800'),('552356742','172013495','2016-11-10 09:25:00','3268795'),('708087626','1730432303','2017-01-29 12:00:00','4657891'),('904576287','1518013911','2017-04-01 08:10:00','1156466');
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription_item`
--

DROP TABLE IF EXISTS `prescription_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prescription_item` (
  `item_id` varchar(11) NOT NULL,
  `treatment_length` datetime DEFAULT NULL,
  `reason` varchar(25) DEFAULT NULL,
  `dosage` varchar(5) DEFAULT NULL,
  `prescriptionDATETIME` datetime DEFAULT NULL,
  `frequency` varchar(25) DEFAULT NULL,
  `refills` char(1) DEFAULT NULL,
  `ndcCODE` int(11) DEFAULT NULL,
  `pharmacistID` varchar(11) DEFAULT NULL,
  `prescriptionID` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `ndcCode_idx` (`ndcCODE`),
  KEY `pharmacistID_idx` (`pharmacistID`),
  KEY `prescriptionID_idx` (`prescriptionID`),
  CONSTRAINT `ndcCode` FOREIGN KEY (`ndcCODE`) REFERENCES `medication` (`NDC`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pharmacistID` FOREIGN KEY (`pharmacistID`) REFERENCES `pharmacist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prescriptionID` FOREIGN KEY (`prescriptionID`) REFERENCES `prescription` (`prescriptionID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription_item`
--

LOCK TABLES `prescription_item` WRITE;
/*!40000 ALTER TABLE `prescription_item` DISABLE KEYS */;
INSERT INTO `prescription_item` VALUES ('18942','2017-01-30 12:31:00','diagnostic','10mgs','2017-02-21 23:59:00','1 tablet / day','0',545694466,'45789','708087626'),('43209','2015-09-30 00:00:00','diagnostic','8gms','2015-09-15 00:00:00','3 pellets/3 times per day','5',17089075,'86086','145608686'),('58179','2016-12-30 12:00:00','protocol','2mgs','2016-11-10 12:00:00','.5 tab /2 times per day','0',90029,'45789','552356742'),('68131','2015-09-30 00:00:00','diagnostic','75mgs','2015-09-15 00:00:00','1 tablet/ day','0',545694700,'86086','145608686'),('72434','2015-09-30 00:00:00','protocol','10mgs','2015-09-15 00:00:00','1 tablet / day','0',545694466,'86086','145608686'),('78395','2017-05-05 23:00:00','diagnostic','4oz','2017-04-20 10:30:31','12.5ml / day','0',50580123,'45789','516526851'),('90187','2017-04-20 23:00:00','diagnostic','8gms','2017-04-01 08:10:00','3 pellets/3 times per day','4',17089075,'90876','904576287');
/*!40000 ALTER TABLE `prescription_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider` (
  `NPI` varchar(11) NOT NULL,
  `fname` varchar(25) DEFAULT NULL,
  `lname` varchar(25) DEFAULT NULL,
  `department` varchar(20) DEFAULT NULL,
  `contactInfo` varchar(25) DEFAULT NULL,
  `providerType` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`NPI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES ('1326168659','Carl','Caravana','Dental Clinic','212-398-9690','Dentist'),('1518013911','Eric','Lippman','Rehab Clinic','516-295-3355','P.T.'),('172013495','Susan','Abbott','Psychiatry','631-379-8294','Psychiatrist'),('1730432303','Marcus','Abboud','Dentistry','631-632-9371','D.D.S'),('1922292309','Joseph','Akilov','Podiatry','718-725-6555','podiatrist'),('30323403','Mark','Abel','Orthopaedic Surgery','631-388-2372','Orthopedician');
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

-- Dump completed on 2018-01-12 12:25:51
