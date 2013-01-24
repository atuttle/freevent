CREATE DATABASE `freevent_schedule`;
USE `freevent_schedule`;

-- MySQL dump 10.13  Distrib 5.5.14, for osx10.7 (i386)
--
-- Host: localhost    Database: freevent_prototype
-- ------------------------------------------------------
-- Server version	5.5.14

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
-- Table structure for table `tblAdminUsers`
--

DROP TABLE IF EXISTS `tblAdminUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblAdminUsers` (
  `userId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `passwordHash` varchar(80) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `uniqUsername` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblAdminUsers`
--

LOCK TABLES `tblAdminUsers` WRITE;
/*!40000 ALTER TABLE `tblAdminUsers` DISABLE KEYS */;
INSERT INTO `tblAdminUsers` VALUES (1,'admin','B766DFBDB89039CF676332CD0F19E9E3','');
/*!40000 ALTER TABLE `tblAdminUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblSessions`
--

DROP TABLE IF EXISTS `tblSessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblSessions` (
  `sessionId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `sortVal` int(11) NOT NULL DEFAULT '1',
  `speaker` text,
  `location` text,
  `title` text,
  `descr` text,
  `htmldescr` text,
  `active` bit(1) DEFAULT b'1',
  `track` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tblTracks`
--

DROP TABLE IF EXISTS `tblTracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblTracks` (
  `trackId` int(11) NOT NULL AUTO_INCREMENT,
  `trackName` varchar(50) NOT NULL,
  `primaryBG` varchar(25) DEFAULT NULL,
  `primaryColor` varchar(25) DEFAULT NULL,
  `secondaryBG` varchar(25) DEFAULT NULL,
  `secondaryColor` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`trackId`),
  UNIQUE KEY `uniqTblTrack` (`trackName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-01-23 20:50:44
