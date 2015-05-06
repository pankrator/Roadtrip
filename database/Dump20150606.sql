CREATE DATABASE  IF NOT EXISTS `ecotravel` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ecotravel`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: ecotravel
-- ------------------------------------------------------
-- Server version	5.6.22-log

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
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ads` (
  `adId` int(11) NOT NULL AUTO_INCREMENT,
  `driverId` int(11) NOT NULL,
  `TownFrom` varchar(45) NOT NULL,
  `TownTo` varchar(45) NOT NULL,
  `dateOfTravel` date NOT NULL,
  `freePlaces` int(11) NOT NULL,
  `timeOfTravel` time NOT NULL,
  PRIMARY KEY (`adId`),
  KEY `fk_drivers_idx` (`driverId`),
  CONSTRAINT `fk_drivers` FOREIGN KEY (`driverId`) REFERENCES `drivers` (`driverId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` VALUES (1,1,'Sofia','Lovech','2014-12-15',3,'19:30:00'),(3,2,'Sofia','Lovech','2014-12-15',5,'19:30:00'),(4,1,'Vratza','Pernik','2010-10-10',2,'16:00:00'),(5,1,'Vratza','Varna','2012-12-12',3,'15:00:00'),(6,2,'Lovech','Blagoevgrad','2014-12-18',3,'01:58:00'),(10,8,'Sofia','Lovech','2014-12-22',3,'01:57:00'),(11,10,'Sofia','Lovech','2014-12-22',6,'10:30:00'),(12,2,'Lovech','Sofia','2015-01-04',3,'15:30:00'),(13,8,'Lovech','Sofia','2015-01-04',1,'16:00:00'),(14,10,'Lovech','Sofia','2015-01-04',2,'17:00:00'),(15,1,'Lovech','Sofia','2015-01-04',6,'10:00:00'),(16,1,'Lovech','Sofia','2015-01-04',5,'20:00:00');
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drivers` (
  `driverId` int(11) NOT NULL AUTO_INCREMENT,
  `profileId` int(11) NOT NULL,
  `nameOfDriver` varchar(45) NOT NULL,
  `telephone` varchar(45) NOT NULL,
  `rating` int(11) NOT NULL,
  `smokeInTheCar` tinyint(1) DEFAULT NULL,
  `travels` int(11) NOT NULL,
  `yearsInDriving` int(11) NOT NULL,
  `musicInTheCar` varchar(45) NOT NULL,
  `birthYear` int(11) NOT NULL,
  PRIMARY KEY (`driverId`),
  UNIQUE KEY `profileId_UNIQUE` (`profileId`),
  KEY `fk_Profiles_idx` (`profileId`),
  CONSTRAINT `fk_Profiles` FOREIGN KEY (`profileId`) REFERENCES `profiles` (`profileId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (1,1,'name','08522',0,0,0,10,'Rock',2010),(2,2,'name2','085363',2,2,2,2,'Rock',2011),(4,21,'gugu','08526',0,0,0,2000,'Commercial',2000),(5,23,'Admen','088391112',0,0,0,2000,'Pop folk',1999),(6,24,'kjhsgkdh','025533',0,1,0,2000,'Folk',2000),(7,25,'vikiii','02252',0,1,0,2000,'Commercial',2000),(8,26,'Santa Claus','0898144532',0,0,0,2012,'Metal',1993),(9,32,'Radka Piratka','0899112113',0,0,0,1989,'Pop folk',1985),(10,33,'Kristina','0887503403',0,1,0,2011,'Pop',1993);
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengers`
--

DROP TABLE IF EXISTS `passengers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passengers` (
  `passengerId` int(11) NOT NULL AUTO_INCREMENT,
  `profileId` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `rating` int(11) NOT NULL,
  `telephone` varchar(45) NOT NULL,
  `birthYear` int(11) NOT NULL,
  PRIMARY KEY (`passengerId`),
  UNIQUE KEY `profileId_UNIQUE` (`profileId`),
  CONSTRAINT `fk_profiles2` FOREIGN KEY (`profileId`) REFERENCES `profiles` (`profileId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengers`
--

LOCK TABLES `passengers` WRITE;
/*!40000 ALTER TABLE `passengers` DISABLE KEYS */;
INSERT INTO `passengers` VALUES (1,18,'haskfjds',0,'05546',2000),(2,19,'cveti',0,'085163',1990),(3,22,'ygyugigi',0,'05464631',2000),(4,27,'Nicholas',0,'0089918124',1990),(5,28,'pich',0,'0089918124',1990),(6,29,'Passanger',0,'0879315850',1993),(7,30,'Deborah',0,'0885725255',1999),(8,31,'n',0,'0879315850',1950),(9,34,'Persefona',0,'0888243433',1991);
/*!40000 ALTER TABLE `passengers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `profileId` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  PRIMARY KEY (`profileId`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'mitko@abv.bg','GRBR5gRC','mitaka'),(2,'zanko@abv.bg','zanko','zanko'),(3,'petyr@mail.bg','petyr','peshito'),(11,'koko@mail.bg','koko','koko'),(12,'malkasladka@abv.bg','saldka','sladkata'),(13,'admin@abv.bg','admin','admin'),(14,'gosho@abv.bg','gosho','gosho'),(15,'natali@mail.bg','natali','natashka'),(16,'kristian@abv.bg','kristian','kriso'),(17,'ceci77@mail.bg','ceci','cecko'),(18,'mitaka@abv.bg','123','djassfkl'),(19,'cveti@gmail.com','123','cveteto'),(21,'huhhi@abv.bg','123','hihihi'),(22,'fhffu@abv.bg','123','uugigi'),(23,'admenadmen99@gmail.com','v83mbm4K','admenCho'),(24,'fejyu@abv.bg','123','ttri'),(25,'hjjgjf@andi.bg','123','rgrh'),(26,'n_monov@mail.bg','admini','feyan'),(27,'casper_forever@abv.bg','admin','niksa'),(28,'pich@abv.bg','admin','pich'),(29,'highway_to_hell@gmail.com','123456','pass'),(30,'debbi_99@abv.bg','1234','deborah'),(31,'nmonov@mail.com','123','asd'),(32,'radcheto@abv.bg','piratka','piratka'),(33,'krisituu69@abv.bg','123456','krisi'),(34,'persefona@gmail.com','persefona','persefona');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voting`
--

DROP TABLE IF EXISTS `voting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voting` (
  `voteId` int(11) NOT NULL AUTO_INCREMENT,
  `driverId` int(11) NOT NULL,
  `numberOfVotes` int(11) NOT NULL,
  PRIMARY KEY (`voteId`),
  KEY `fk_passengers0_idx` (`driverId`),
  KEY `fk_ads_idx` (`numberOfVotes`),
  CONSTRAINT `fk_drivers_vote` FOREIGN KEY (`driverId`) REFERENCES `drivers` (`driverId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voting`
--

LOCK TABLES `voting` WRITE;
/*!40000 ALTER TABLE `voting` DISABLE KEYS */;
/*!40000 ALTER TABLE `voting` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-05 11:50:18
