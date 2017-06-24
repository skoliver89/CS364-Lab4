-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: soliver
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

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
-- Table structure for table `CHARACTERS`
--

DROP TABLE IF EXISTS `CHARACTERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CHARACTERS` (
  `PlayerID` int(11) NOT NULL,
  `CharacterID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` char(20) NOT NULL,
  `Level` tinyint(3) unsigned NOT NULL,
  `Sex` enum('Male','Female') NOT NULL,
  `Class` enum('Mage','Warrior','Priest') NOT NULL,
  PRIMARY KEY (`CharacterID`),
  KEY `PlayerFK` (`PlayerID`),
  CONSTRAINT `PlayerFK` FOREIGN KEY (`PlayerID`) REFERENCES `PLAYERS` (`PlayerID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHARACTERS`
--

LOCK TABLES `CHARACTERS` WRITE;
/*!40000 ALTER TABLE `CHARACTERS` DISABLE KEYS */;
INSERT INTO `CHARACTERS` VALUES (1,1,'Zappo',1,'Male','Mage'),(2,2,'Slashy',1,'Male','Warrior'),(3,3,'Acorn',2,'Female','Priest'),(4,4,'Blank',1,'Male','Mage'),(5,5,'Fireup',11,'Female','Mage'),(6,6,'Jason',1,'Male','Warrior'),(6,7,'Nelly',15,'Female','Warrior'),(7,8,'Icy',1,'Female','Mage'),(8,9,'Dilan',1,'Male','Priest'),(9,10,'Robbie',18,'Male','Priest'),(10,11,'Holyshock',1,'Male','Priest'),(11,12,'Millie',1,'Female','Mage'),(11,13,'Zap',1,'Male','Mage'),(12,14,'Zorg',1,'Male','Mage'),(13,15,'Rage',20,'Female','Warrior'),(15,16,'Roar',1,'Male','Warrior'),(16,17,'Flameon',20,'Male','Mage'),(17,18,'TimeWizard',1,'Male','Mage'),(18,19,'Bubble U',20,'Female','Priest'),(20,20,'Shade',1,'Female','Mage');
/*!40000 ALTER TABLE `CHARACTERS` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER ins_character AFTER INSERT ON CHARACTERS
FOR EACH ROW
INSERT INTO CHARACTERS_LOGS
SET	CharacterID = NEW.CharacterID,
	PlayerID = NEW.PlayerID,
	modTime = NOW(),
	modType = 'NEW'; */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER update_character BEFORE UPDATE ON CHARACTERS
FOR EACH ROW
INSERT INTO CHARACTERS_LOGS
SET	CharacterID = OLD.CharacterID,
	PlayerID = OLD.PlayerID,
	Name = OLD.Name,
	Level = OLD.Level,
	Sex = OLD.Sex,
	Class = OLD.Class,
	modTime = NOW(),
	modType = 'UPDATE' */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `CHARACTERS_ITEMS_INT`
--

DROP TABLE IF EXISTS `CHARACTERS_ITEMS_INT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CHARACTERS_ITEMS_INT` (
  `CharacterID` int(11) NOT NULL,
  `ItemID` int(11) NOT NULL,
  `NumberInStack` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`CharacterID`,`ItemID`),
  KEY `CIInt_ItemsFK` (`ItemID`),
  CONSTRAINT `CIInt_CharactersFK` FOREIGN KEY (`CharacterID`) REFERENCES `CHARACTERS` (`CharacterID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `CIInt_ItemsFK` FOREIGN KEY (`ItemID`) REFERENCES `ITEMS` (`ItemID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHARACTERS_ITEMS_INT`
--

LOCK TABLES `CHARACTERS_ITEMS_INT` WRITE;
/*!40000 ALTER TABLE `CHARACTERS_ITEMS_INT` DISABLE KEYS */;
INSERT INTO `CHARACTERS_ITEMS_INT` VALUES (1,1,20),(2,1,20),(3,1,20),(4,1,20),(5,1,20),(6,1,20),(7,1,20),(8,1,20),(9,1,20),(10,1,20),(11,1,20),(12,1,20),(13,1,20),(14,1,20),(15,1,20),(16,1,20),(17,1,20),(18,1,20),(18,2,20),(19,1,20);
/*!40000 ALTER TABLE `CHARACTERS_ITEMS_INT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CHARACTERS_LOGS`
--

DROP TABLE IF EXISTS `CHARACTERS_LOGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CHARACTERS_LOGS` (
  `LogID` int(11) NOT NULL AUTO_INCREMENT,
  `PlayerID` int(11) NOT NULL,
  `CharacterID` int(11) NOT NULL,
  `Name` char(20) DEFAULT NULL,
  `Level` tinyint(3) unsigned DEFAULT NULL,
  `Sex` enum('Male','Female') DEFAULT NULL,
  `Class` enum('Mage','Warrior','Priest') DEFAULT NULL,
  `modTime` datetime NOT NULL,
  `modType` char(20) NOT NULL,
  PRIMARY KEY (`LogID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CHARACTERS_LOGS`
--

LOCK TABLES `CHARACTERS_LOGS` WRITE;
/*!40000 ALTER TABLE `CHARACTERS_LOGS` DISABLE KEYS */;
INSERT INTO `CHARACTERS_LOGS` VALUES (1,1,1,NULL,NULL,NULL,NULL,'2017-05-15 03:36:37','NEW'),(2,2,2,NULL,NULL,NULL,NULL,'2017-05-15 03:36:37','NEW'),(3,3,3,NULL,NULL,NULL,NULL,'2017-05-15 03:36:37','NEW'),(4,4,4,NULL,NULL,NULL,NULL,'2017-05-15 03:36:37','NEW'),(5,5,5,NULL,NULL,NULL,NULL,'2017-05-15 03:36:37','NEW'),(6,6,6,NULL,NULL,NULL,NULL,'2017-05-15 03:36:38','NEW'),(7,6,7,NULL,NULL,NULL,NULL,'2017-05-15 03:36:38','NEW'),(8,7,8,NULL,NULL,NULL,NULL,'2017-05-15 03:36:38','NEW'),(9,8,9,NULL,NULL,NULL,NULL,'2017-05-15 03:36:38','NEW'),(10,9,10,NULL,NULL,NULL,NULL,'2017-05-15 03:36:38','NEW'),(11,10,11,NULL,NULL,NULL,NULL,'2017-05-15 03:36:38','NEW'),(12,11,12,NULL,NULL,NULL,NULL,'2017-05-15 03:36:38','NEW'),(13,11,13,NULL,NULL,NULL,NULL,'2017-05-15 03:36:38','NEW'),(14,12,14,NULL,NULL,NULL,NULL,'2017-05-15 03:36:38','NEW'),(15,13,15,NULL,NULL,NULL,NULL,'2017-05-15 03:36:38','NEW'),(16,15,16,NULL,NULL,NULL,NULL,'2017-05-15 03:36:38','NEW'),(17,16,17,NULL,NULL,NULL,NULL,'2017-05-15 03:36:38','NEW'),(18,17,18,NULL,NULL,NULL,NULL,'2017-05-15 03:36:38','NEW'),(19,18,19,NULL,NULL,NULL,NULL,'2017-05-15 03:36:38','NEW'),(20,20,20,NULL,NULL,NULL,NULL,'2017-05-15 03:36:38','NEW');
/*!40000 ALTER TABLE `CHARACTERS_LOGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ITEMS`
--

DROP TABLE IF EXISTS `ITEMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ITEMS` (
  `ItemID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` char(20) NOT NULL,
  `OnLootTable` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ITEMS`
--

LOCK TABLES `ITEMS` WRITE;
/*!40000 ALTER TABLE `ITEMS` DISABLE KEYS */;
INSERT INTO `ITEMS` VALUES (1,'Health Potion',1),(2,'Mana Potion',1),(3,'Sword',1),(4,'Mace',1),(5,'Wand',1),(6,'Staff',1),(7,'Holy Robe',1),(8,'Scroll',1),(9,'Helm',1),(10,'Pointed Hat',1),(11,'Laser Blaster',0),(12,'Nuke',0),(13,'A Rock',1),(14,'Tent',1),(15,'Food',1),(16,'Car',0),(17,'Horse',1),(18,'The One Ring',0),(19,'Holy Hand Grenade',0),(20,'Water',1);
/*!40000 ALTER TABLE `ITEMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ITEM_DESCRIPTIONS`
--

DROP TABLE IF EXISTS `ITEM_DESCRIPTIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ITEM_DESCRIPTIONS` (
  `ItemID` int(11) NOT NULL,
  `DescriptionID` int(11) NOT NULL AUTO_INCREMENT,
  `Rarity` enum('Common','Rare','Legendary') NOT NULL DEFAULT 'Common',
  `Value` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `FlavorText` tinytext NOT NULL,
  PRIMARY KEY (`DescriptionID`),
  UNIQUE KEY `UniqueFK` (`ItemID`),
  CONSTRAINT `ItemFK` FOREIGN KEY (`ItemID`) REFERENCES `ITEMS` (`ItemID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ITEM_DESCRIPTIONS`
--

LOCK TABLES `ITEM_DESCRIPTIONS` WRITE;
/*!40000 ALTER TABLE `ITEM_DESCRIPTIONS` DISABLE KEYS */;
INSERT INTO `ITEM_DESCRIPTIONS` VALUES (1,1,'Common',10,'Restores 5 HP'),(2,2,'Common',10,'Restores 5 MP'),(3,3,'Common',25,'I cut you!'),(4,4,'Common',30,'Batter up!'),(5,5,'Rare',100,'the magical fruit'),(6,6,'Common',25,'Standard Magic Staff'),(7,7,'Rare',110,'You look holy.'),(8,8,'Common',15,'Used to cast spells'),(9,9,'Rare',110,'You are the man in the iron mask.'),(10,10,'Rare',110,'I feel pretty!'),(11,11,'Legendary',0,'GMs ONLY!!'),(12,12,'Legendary',0,'GMs ONLY!!'),(13,13,'Legendary',1000,'Just a rock?!'),(14,14,'Common',75,'Are you sleepy yet?'),(15,15,'Common',15,'Come and get it!'),(16,16,'Rare',0,'GMs ONLY TRANSPORT!!'),(17,17,'Rare',1100,'Clip Clop, Giddy Up!'),(18,18,'Legendary',0,'GMs ONLY!!'),(19,19,'Legendary',0,'My Precious!'),(20,20,'Common',5,'Fresh, straight from the spring!');
/*!40000 ALTER TABLE `ITEM_DESCRIPTIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAYERS`
--

DROP TABLE IF EXISTS `PLAYERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PLAYERS` (
  `PlayerID` int(11) NOT NULL AUTO_INCREMENT,
  `Alias` char(20) NOT NULL,
  `FirstName` char(20) NOT NULL,
  `LastName` char(20) NOT NULL,
  `Email` char(30) NOT NULL,
  `accntCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`PlayerID`),
  UNIQUE KEY `UniqueAlias` (`Alias`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYERS`
--

LOCK TABLES `PLAYERS` WRITE;
/*!40000 ALTER TABLE `PLAYERS` DISABLE KEYS */;
INSERT INTO `PLAYERS` VALUES (1,'Pilot','Aaron','Earl','Pilot@game.com','2017-05-15 10:55:02'),(2,'Horns','Abby','Horner','Horns@game.com','2017-05-15 10:55:02'),(3,'Kube','Amanda','Kubo','Kube@game.com','2017-05-15 10:55:02'),(4,'Huntster','Brandon','Hunt','Huntster@game.com','2017-05-15 10:55:02'),(5,'Bruiser','Blake','Bauer','Bruiser@game.com','2017-05-15 10:55:02'),(6,'Cleric','Alexandria','LeClerc','Cleric@game.com','2017-05-15 10:55:02'),(7,'Frank','Anthony','Franco','Frank@game.com','2017-05-15 10:55:02'),(8,'Koi','Dakota','Koki','Koi@game.com','2017-05-15 10:55:02'),(9,'Hatter','Jacob','Hatfield','Hatter@game.com','2017-05-15 10:55:02'),(10,'Beard','John','Mozingo','Beard@game.com','2017-05-15 10:55:02'),(11,'Jello','Jonathan','Elliott','Jello@game.com','2017-05-15 10:55:02'),(12,'Fawn','Launia','Davis','Fawn@game.com','2017-05-15 10:55:02'),(13,'Liono','Leo','Thalman','Liono@game.com','2017-05-15 10:55:02'),(14,'Lee','Lijian','Nian','Lee@game.com','2017-05-15 10:55:02'),(15,'L','Luis','Loyh','L@game.com','2017-05-15 10:55:02'),(16,'Daemon','Michael','Brown','Daemon@game.com','2017-05-15 10:55:02'),(17,'Tony','Nathan','Stark','Tony@game.com','2017-05-15 10:55:02'),(18,'Friar','Nathaniel','Frey','Friar@game.com','2017-05-15 10:55:02'),(19,'Monk','Nikki','Ki','Monk@game.com','2017-05-15 10:55:02'),(20,'Squeaks','Stephen','Oliver','Squeaks@game.com','2017-05-15 10:55:02');
/*!40000 ALTER TABLE `PLAYERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `PLAYER_CHARACTER`
--

DROP TABLE IF EXISTS `PLAYER_CHARACTER`;
/*!50001 DROP VIEW IF EXISTS `PLAYER_CHARACTER`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `PLAYER_CHARACTER` (
  `Player` tinyint NOT NULL,
  `Character` tinyint NOT NULL,
  `Level` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `SERVERS`
--

DROP TABLE IF EXISTS `SERVERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SERVERS` (
  `ServerID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` char(20) NOT NULL,
  `Type` enum('PvE','PvP') NOT NULL,
  PRIMARY KEY (`ServerID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVERS`
--

LOCK TABLES `SERVERS` WRITE;
/*!40000 ALTER TABLE `SERVERS` DISABLE KEYS */;
INSERT INTO `SERVERS` VALUES (1,'Big Boy','PvP'),(2,'Big Girl','PvP'),(3,'Lil Boy','PvE'),(4,'Lil Girl','PvE'),(5,'War Zone','PvP'),(6,'Carebear','PvE'),(7,'Math Club','PvP'),(8,'Byte Club','PvP'),(9,'WOU','PvE'),(10,'Daggers Point','PvP'),(11,'Stared Twins','PvE'),(12,'Lore Hunters','PvE'),(13,'Battle Ground','PvP'),(14,'Dungeon Run','PvE'),(15,'Gank Town','PvP'),(16,'Hell','PvP'),(17,'Heaven','PvE'),(18,'PCC','PvE'),(19,'PSU','PvP'),(20,'OSU','PvP');
/*!40000 ALTER TABLE `SERVERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SERVERS_PLAYERS_INT`
--

DROP TABLE IF EXISTS `SERVERS_PLAYERS_INT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SERVERS_PLAYERS_INT` (
  `ServerID` int(11) NOT NULL,
  `PlayerID` int(11) NOT NULL,
  PRIMARY KEY (`ServerID`,`PlayerID`),
  KEY `SPInt_PlayerFK` (`PlayerID`),
  CONSTRAINT `SPInt_ServerFK` FOREIGN KEY (`ServerID`) REFERENCES `SERVERS` (`ServerID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `SPInt_PlayerFK` FOREIGN KEY (`PlayerID`) REFERENCES `PLAYERS` (`PlayerID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SERVERS_PLAYERS_INT`
--

LOCK TABLES `SERVERS_PLAYERS_INT` WRITE;
/*!40000 ALTER TABLE `SERVERS_PLAYERS_INT` DISABLE KEYS */;
INSERT INTO `SERVERS_PLAYERS_INT` VALUES (1,1),(1,2),(1,3),(2,4),(3,5),(4,6),(4,7),(5,8),(5,9),(10,10),(10,11),(11,12),(12,13),(13,14),(14,15),(20,16),(20,17),(20,18),(20,19),(20,20);
/*!40000 ALTER TABLE `SERVERS_PLAYERS_INT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `PLAYER_CHARACTER`
--

/*!50001 DROP TABLE IF EXISTS `PLAYER_CHARACTER`*/;
/*!50001 DROP VIEW IF EXISTS `PLAYER_CHARACTER`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `PLAYER_CHARACTER` AS select `P`.`Alias` AS `Player`,`C`.`Name` AS `Character`,`C`.`Level` AS `Level` from (`PLAYERS` `P` join `CHARACTERS` `C` on((`P`.`PlayerID` = `C`.`PlayerID`))) order by `P`.`PlayerID` */;
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

-- Dump completed on 2017-05-16 16:24:40
