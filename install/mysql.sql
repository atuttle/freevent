CREATE DATABASE `freevent_schedule`;
USE `freevent_schedule`;

--
-- Table structure for table `tblAdminUsers`
--

DROP TABLE IF EXISTS `tblAdminUsers`;
CREATE TABLE `tblAdminUsers` (
  `userId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `passwordHash` varchar(80) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `uniqUsername` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--
-- Table structure for table `tblTracks`
--

DROP TABLE IF EXISTS `tblTracks`;
CREATE TABLE `tblTracks` (
  `trackId` int(11) NOT NULL AUTO_INCREMENT,
  `trackName` varchar(50) NOT NULL,
  `primaryBG` varchar(25) DEFAULT NULL,
  `primaryColor` varchar(25) DEFAULT NULL,
  `secondaryBG` varchar(25) DEFAULT NULL,
  `secondaryColor` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`trackId`),
  UNIQUE KEY `uniqTblTrack` (`trackName`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
