CREATE DATABASE  IF NOT EXISTS `lynschema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lynschema`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lynschema
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `FlightNumber` int NOT NULL,
  `Destination` varchar(255) DEFAULT NULL,
  `Arrived` tinyint(1) DEFAULT NULL,
  `TimeOfArrival` datetime DEFAULT NULL,
  `TimeForTakeoff` datetime DEFAULT NULL,
  PRIMARY KEY (`FlightNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (2550,'San Jose, CA',0,'2023-05-17 04:02:13','2023-05-17 00:02:13'),(2741,'Philadelphia, PA',0,'2023-05-17 07:03:16','2023-05-17 01:03:16'),(3391,'Dallas, TX',0,'2023-05-14 22:30:33','2023-05-14 16:30:33'),(3474,'San Antonio, TX',0,'2023-05-09 12:41:09','2023-05-09 10:41:09'),(4238,'Philadelphia, PA',0,'2023-05-13 10:11:32','2023-05-13 04:11:32'),(5353,'San Diego, CA',0,'2023-05-12 00:03:35','2023-05-11 22:03:35'),(5849,'San Jose, CA',0,'2023-05-09 16:15:45','2023-05-09 12:15:45'),(6219,'San Antonio, TX',0,'2023-05-18 08:18:44','2023-05-18 06:18:44'),(6489,'San Diego, CA',0,'2023-05-17 18:36:36','2023-05-17 11:36:36'),(8377,'Philadelphia, PA',0,'2023-05-15 08:29:08','2023-05-15 02:29:08');
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `PassengerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `SeatID` int DEFAULT NULL,
  `FlightNumber` int DEFAULT NULL,
  PRIMARY KEY (`PassengerID`),
  UNIQUE KEY `SeatID_UNIQUE` (`SeatID`),
  KEY `passenger_ibfk_2` (`FlightNumber`),
  CONSTRAINT `passenger_ibfk_1` FOREIGN KEY (`SeatID`) REFERENCES `seat` (`SeatID`),
  CONSTRAINT `passenger_ibfk_2` FOREIGN KEY (`FlightNumber`) REFERENCES `flight` (`FlightNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (13,'awdadawdwa','fargreregr',16716740,3474);
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `SeatID` int NOT NULL AUTO_INCREMENT,
  `SeatNumber` varchar(3) DEFAULT NULL,
  `FlightNumber` int DEFAULT NULL,
  `PassengerID` int DEFAULT NULL,
  `taken` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SeatID`),
  UNIQUE KEY `PassengerID` (`PassengerID`),
  KEY `FlightNumber` (`FlightNumber`),
  CONSTRAINT `PassengerID` FOREIGN KEY (`PassengerID`) REFERENCES `passenger` (`PassengerID`),
  CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`FlightNumber`) REFERENCES `flight` (`FlightNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=16716959 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (16716559,'1',2741,NULL,0),(16716560,'2',2741,NULL,0),(16716561,'3',2741,NULL,0),(16716562,'4',2741,NULL,0),(16716563,'5',2741,NULL,0),(16716564,'6',2741,NULL,0),(16716565,'7',2741,NULL,0),(16716566,'8',2741,NULL,0),(16716567,'9',2741,NULL,0),(16716568,'10',2741,NULL,0),(16716569,'11',2741,NULL,0),(16716570,'12',2741,NULL,0),(16716571,'13',2741,NULL,0),(16716572,'14',2741,NULL,0),(16716573,'15',2741,NULL,0),(16716574,'16',2741,NULL,0),(16716575,'17',2741,NULL,0),(16716576,'18',2741,NULL,0),(16716577,'19',2741,NULL,0),(16716578,'20',2741,NULL,0),(16716579,'21',2741,NULL,0),(16716580,'22',2741,NULL,0),(16716581,'23',2741,NULL,0),(16716582,'24',2741,NULL,0),(16716583,'25',2741,NULL,0),(16716584,'26',2741,NULL,0),(16716585,'27',2741,NULL,0),(16716586,'28',2741,NULL,0),(16716587,'29',2741,NULL,0),(16716588,'30',2741,NULL,0),(16716589,'31',2741,NULL,0),(16716590,'32',2741,NULL,0),(16716591,'33',2741,NULL,0),(16716592,'34',2741,NULL,0),(16716593,'35',2741,NULL,0),(16716594,'36',2741,NULL,0),(16716595,'37',2741,NULL,0),(16716596,'38',2741,NULL,0),(16716597,'39',2741,NULL,0),(16716598,'40',2741,NULL,0),(16716599,'1',4238,NULL,0),(16716600,'2',4238,NULL,0),(16716601,'3',4238,NULL,0),(16716602,'4',4238,NULL,0),(16716603,'5',4238,NULL,0),(16716604,'6',4238,NULL,0),(16716605,'7',4238,NULL,0),(16716606,'8',4238,NULL,0),(16716607,'9',4238,NULL,0),(16716608,'10',4238,NULL,0),(16716609,'11',4238,NULL,0),(16716610,'12',4238,NULL,0),(16716611,'13',4238,NULL,0),(16716612,'14',4238,NULL,0),(16716613,'15',4238,NULL,0),(16716614,'16',4238,NULL,0),(16716615,'17',4238,NULL,0),(16716616,'18',4238,NULL,0),(16716617,'19',4238,NULL,0),(16716618,'20',4238,NULL,0),(16716619,'21',4238,NULL,0),(16716620,'22',4238,NULL,0),(16716621,'23',4238,NULL,0),(16716622,'24',4238,NULL,0),(16716623,'25',4238,NULL,0),(16716624,'26',4238,NULL,0),(16716625,'27',4238,NULL,0),(16716626,'28',4238,NULL,0),(16716627,'29',4238,NULL,0),(16716628,'30',4238,NULL,0),(16716629,'31',4238,NULL,0),(16716630,'32',4238,NULL,0),(16716631,'33',4238,NULL,0),(16716632,'34',4238,NULL,0),(16716633,'35',4238,NULL,0),(16716634,'36',4238,NULL,0),(16716635,'37',4238,NULL,0),(16716636,'38',4238,NULL,0),(16716637,'39',4238,NULL,0),(16716638,'40',4238,NULL,0),(16716639,'1',2550,NULL,0),(16716640,'2',2550,NULL,0),(16716641,'3',2550,NULL,0),(16716642,'4',2550,NULL,0),(16716643,'5',2550,NULL,0),(16716644,'6',2550,NULL,0),(16716645,'7',2550,NULL,0),(16716646,'8',2550,NULL,0),(16716647,'9',2550,NULL,0),(16716648,'10',2550,NULL,0),(16716649,'11',2550,NULL,0),(16716650,'12',2550,NULL,0),(16716651,'13',2550,NULL,0),(16716652,'14',2550,NULL,0),(16716653,'15',2550,NULL,0),(16716654,'16',2550,NULL,0),(16716655,'17',2550,NULL,0),(16716656,'18',2550,NULL,0),(16716657,'19',2550,NULL,0),(16716658,'20',2550,NULL,0),(16716659,'21',2550,NULL,0),(16716660,'22',2550,NULL,0),(16716661,'23',2550,NULL,0),(16716662,'24',2550,NULL,0),(16716663,'25',2550,NULL,0),(16716664,'26',2550,NULL,0),(16716665,'27',2550,NULL,0),(16716666,'28',2550,NULL,0),(16716667,'29',2550,NULL,0),(16716668,'30',2550,NULL,0),(16716669,'31',2550,NULL,0),(16716670,'32',2550,NULL,0),(16716671,'33',2550,NULL,0),(16716672,'34',2550,NULL,0),(16716673,'35',2550,NULL,0),(16716674,'36',2550,NULL,0),(16716675,'37',2550,NULL,0),(16716676,'38',2550,NULL,0),(16716677,'39',2550,NULL,0),(16716678,'40',2550,NULL,0),(16716679,'1',5353,NULL,0),(16716680,'2',5353,NULL,0),(16716681,'3',5353,NULL,0),(16716682,'4',5353,NULL,0),(16716683,'5',5353,NULL,0),(16716684,'6',5353,NULL,0),(16716685,'7',5353,NULL,0),(16716686,'8',5353,NULL,0),(16716687,'9',5353,NULL,0),(16716688,'10',5353,NULL,0),(16716689,'11',5353,NULL,0),(16716690,'12',5353,NULL,0),(16716691,'13',5353,NULL,0),(16716692,'14',5353,NULL,0),(16716693,'15',5353,NULL,0),(16716694,'16',5353,NULL,0),(16716695,'17',5353,NULL,0),(16716696,'18',5353,NULL,0),(16716697,'19',5353,NULL,0),(16716698,'20',5353,NULL,0),(16716699,'21',5353,NULL,0),(16716700,'22',5353,NULL,0),(16716701,'23',5353,NULL,0),(16716702,'24',5353,NULL,0),(16716703,'25',5353,NULL,0),(16716704,'26',5353,NULL,0),(16716705,'27',5353,NULL,0),(16716706,'28',5353,NULL,0),(16716707,'29',5353,NULL,0),(16716708,'30',5353,NULL,0),(16716709,'31',5353,NULL,0),(16716710,'32',5353,NULL,0),(16716711,'33',5353,NULL,0),(16716712,'34',5353,NULL,0),(16716713,'35',5353,NULL,0),(16716714,'36',5353,NULL,0),(16716715,'37',5353,NULL,0),(16716716,'38',5353,NULL,0),(16716717,'39',5353,NULL,0),(16716718,'40',5353,NULL,0),(16716719,'1',3474,NULL,0),(16716720,'2',3474,NULL,0),(16716721,'3',3474,NULL,0),(16716722,'4',3474,NULL,0),(16716723,'5',3474,NULL,0),(16716724,'6',3474,NULL,0),(16716725,'7',3474,NULL,0),(16716726,'8',3474,NULL,0),(16716727,'9',3474,NULL,0),(16716728,'10',3474,NULL,0),(16716729,'11',3474,NULL,0),(16716730,'12',3474,NULL,0),(16716731,'13',3474,NULL,0),(16716732,'14',3474,NULL,0),(16716733,'15',3474,NULL,0),(16716734,'16',3474,NULL,0),(16716735,'17',3474,NULL,0),(16716736,'18',3474,NULL,0),(16716737,'19',3474,NULL,0),(16716738,'20',3474,NULL,0),(16716739,'21',3474,NULL,0),(16716740,'22',3474,13,1),(16716741,'23',3474,NULL,0),(16716742,'24',3474,NULL,0),(16716743,'25',3474,NULL,0),(16716744,'26',3474,NULL,0),(16716745,'27',3474,NULL,0),(16716746,'28',3474,NULL,0),(16716747,'29',3474,NULL,0),(16716748,'30',3474,NULL,0),(16716749,'31',3474,NULL,0),(16716750,'32',3474,NULL,0),(16716751,'33',3474,NULL,0),(16716752,'34',3474,NULL,0),(16716753,'35',3474,NULL,0),(16716754,'36',3474,NULL,0),(16716755,'37',3474,NULL,0),(16716756,'38',3474,NULL,0),(16716757,'39',3474,NULL,0),(16716758,'40',3474,NULL,0),(16716759,'1',3391,NULL,0),(16716760,'2',3391,NULL,0),(16716761,'3',3391,NULL,0),(16716762,'4',3391,NULL,0),(16716763,'5',3391,NULL,0),(16716764,'6',3391,NULL,0),(16716765,'7',3391,NULL,0),(16716766,'8',3391,NULL,0),(16716767,'9',3391,NULL,0),(16716768,'10',3391,NULL,0),(16716769,'11',3391,NULL,0),(16716770,'12',3391,NULL,0),(16716771,'13',3391,NULL,0),(16716772,'14',3391,NULL,0),(16716773,'15',3391,NULL,0),(16716774,'16',3391,NULL,0),(16716775,'17',3391,NULL,0),(16716776,'18',3391,NULL,0),(16716777,'19',3391,NULL,0),(16716778,'20',3391,NULL,0),(16716779,'21',3391,NULL,0),(16716780,'22',3391,NULL,0),(16716781,'23',3391,NULL,0),(16716782,'24',3391,NULL,0),(16716783,'25',3391,NULL,0),(16716784,'26',3391,NULL,0),(16716785,'27',3391,NULL,0),(16716786,'28',3391,NULL,0),(16716787,'29',3391,NULL,0),(16716788,'30',3391,NULL,0),(16716789,'31',3391,NULL,0),(16716790,'32',3391,NULL,0),(16716791,'33',3391,NULL,0),(16716792,'34',3391,NULL,0),(16716793,'35',3391,NULL,0),(16716794,'36',3391,NULL,0),(16716795,'37',3391,NULL,0),(16716796,'38',3391,NULL,0),(16716797,'39',3391,NULL,0),(16716798,'40',3391,NULL,0),(16716799,'1',5849,NULL,0),(16716800,'2',5849,NULL,0),(16716801,'3',5849,NULL,0),(16716802,'4',5849,NULL,0),(16716803,'5',5849,NULL,0),(16716804,'6',5849,NULL,0),(16716805,'7',5849,NULL,0),(16716806,'8',5849,NULL,0),(16716807,'9',5849,NULL,0),(16716808,'10',5849,NULL,0),(16716809,'11',5849,NULL,0),(16716810,'12',5849,NULL,0),(16716811,'13',5849,NULL,0),(16716812,'14',5849,NULL,0),(16716813,'15',5849,NULL,0),(16716814,'16',5849,NULL,0),(16716815,'17',5849,NULL,0),(16716816,'18',5849,NULL,0),(16716817,'19',5849,NULL,0),(16716818,'20',5849,NULL,0),(16716819,'21',5849,NULL,0),(16716820,'22',5849,NULL,0),(16716821,'23',5849,NULL,0),(16716822,'24',5849,NULL,0),(16716823,'25',5849,NULL,0),(16716824,'26',5849,NULL,0),(16716825,'27',5849,NULL,0),(16716826,'28',5849,NULL,0),(16716827,'29',5849,NULL,0),(16716828,'30',5849,NULL,0),(16716829,'31',5849,NULL,0),(16716830,'32',5849,NULL,0),(16716831,'33',5849,NULL,0),(16716832,'34',5849,NULL,0),(16716833,'35',5849,NULL,0),(16716834,'36',5849,NULL,0),(16716835,'37',5849,NULL,0),(16716836,'38',5849,NULL,0),(16716837,'39',5849,NULL,0),(16716838,'40',5849,NULL,0),(16716839,'1',8377,NULL,0),(16716840,'2',8377,NULL,0),(16716841,'3',8377,NULL,0),(16716842,'4',8377,NULL,0),(16716843,'5',8377,NULL,0),(16716844,'6',8377,NULL,0),(16716845,'7',8377,NULL,0),(16716846,'8',8377,NULL,0),(16716847,'9',8377,NULL,0),(16716848,'10',8377,NULL,0),(16716849,'11',8377,NULL,0),(16716850,'12',8377,NULL,0),(16716851,'13',8377,NULL,0),(16716852,'14',8377,NULL,0),(16716853,'15',8377,NULL,0),(16716854,'16',8377,NULL,0),(16716855,'17',8377,NULL,0),(16716856,'18',8377,NULL,0),(16716857,'19',8377,NULL,0),(16716858,'20',8377,NULL,0),(16716859,'21',8377,NULL,0),(16716860,'22',8377,NULL,0),(16716861,'23',8377,NULL,0),(16716862,'24',8377,NULL,0),(16716863,'25',8377,NULL,0),(16716864,'26',8377,NULL,0),(16716865,'27',8377,NULL,0),(16716866,'28',8377,NULL,0),(16716867,'29',8377,NULL,0),(16716868,'30',8377,NULL,0),(16716869,'31',8377,NULL,0),(16716870,'32',8377,NULL,0),(16716871,'33',8377,NULL,0),(16716872,'34',8377,NULL,0),(16716873,'35',8377,NULL,0),(16716874,'36',8377,NULL,0),(16716875,'37',8377,NULL,0),(16716876,'38',8377,NULL,0),(16716877,'39',8377,NULL,0),(16716878,'40',8377,NULL,0),(16716879,'1',6219,NULL,0),(16716880,'2',6219,NULL,0),(16716881,'3',6219,NULL,0),(16716882,'4',6219,NULL,0),(16716883,'5',6219,NULL,0),(16716884,'6',6219,NULL,0),(16716885,'7',6219,NULL,0),(16716886,'8',6219,NULL,0),(16716887,'9',6219,NULL,0),(16716888,'10',6219,NULL,0),(16716889,'11',6219,NULL,0),(16716890,'12',6219,NULL,0),(16716891,'13',6219,NULL,0),(16716892,'14',6219,NULL,0),(16716893,'15',6219,NULL,0),(16716894,'16',6219,NULL,0),(16716895,'17',6219,NULL,0),(16716896,'18',6219,NULL,0),(16716897,'19',6219,NULL,0),(16716898,'20',6219,NULL,0),(16716899,'21',6219,NULL,0),(16716900,'22',6219,NULL,0),(16716901,'23',6219,NULL,0),(16716902,'24',6219,NULL,0),(16716903,'25',6219,NULL,0),(16716904,'26',6219,NULL,0),(16716905,'27',6219,NULL,0),(16716906,'28',6219,NULL,0),(16716907,'29',6219,NULL,0),(16716908,'30',6219,NULL,0),(16716909,'31',6219,NULL,0),(16716910,'32',6219,NULL,0),(16716911,'33',6219,NULL,0),(16716912,'34',6219,NULL,0),(16716913,'35',6219,NULL,0),(16716914,'36',6219,NULL,0),(16716915,'37',6219,NULL,0),(16716916,'38',6219,NULL,0),(16716917,'39',6219,NULL,0),(16716918,'40',6219,NULL,0),(16716919,'1',6489,NULL,0),(16716920,'2',6489,NULL,0),(16716921,'3',6489,NULL,0),(16716922,'4',6489,NULL,0),(16716923,'5',6489,NULL,0),(16716924,'6',6489,NULL,0),(16716925,'7',6489,NULL,0),(16716926,'8',6489,NULL,0),(16716927,'9',6489,NULL,0),(16716928,'10',6489,NULL,0),(16716929,'11',6489,NULL,0),(16716930,'12',6489,NULL,0),(16716931,'13',6489,NULL,0),(16716932,'14',6489,NULL,0),(16716933,'15',6489,NULL,0),(16716934,'16',6489,NULL,0),(16716935,'17',6489,NULL,0),(16716936,'18',6489,NULL,0),(16716937,'19',6489,NULL,0),(16716938,'20',6489,NULL,0),(16716939,'21',6489,NULL,0),(16716940,'22',6489,NULL,0),(16716941,'23',6489,NULL,0),(16716942,'24',6489,NULL,0),(16716943,'25',6489,NULL,0),(16716944,'26',6489,NULL,0),(16716945,'27',6489,NULL,0),(16716946,'28',6489,NULL,0),(16716947,'29',6489,NULL,0),(16716948,'30',6489,NULL,0),(16716949,'31',6489,NULL,0),(16716950,'32',6489,NULL,0),(16716951,'33',6489,NULL,0),(16716952,'34',6489,NULL,0),(16716953,'35',6489,NULL,0),(16716954,'36',6489,NULL,0),(16716955,'37',6489,NULL,0),(16716956,'38',6489,NULL,0),(16716957,'39',6489,NULL,0),(16716958,'40',6489,NULL,0);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'lynschema'
--
/*!50003 DROP PROCEDURE IF EXISTS `generate_flight_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`lyn`@`127.0.0.1` PROCEDURE `generate_flight_data`()
BEGIN
 DECLARE i INT DEFAULT 1;
  WHILE (i <= 10) DO
    SET @flight_number = FLOOR((.1 + RAND()) * POW(10, 4));
	SET @destination = (SELECT city_state FROM (
	  SELECT 'New York, NY' AS city_state UNION
	  SELECT 'Los Angeles, CA' AS city_state UNION
	  SELECT 'Chicago, IL' AS city_state UNION
	  SELECT 'Houston, TX' AS city_state UNION
	  SELECT 'Phoenix, AZ' AS city_state UNION
	  SELECT 'Philadelphia, PA' AS city_state UNION
	  SELECT 'San Antonio, TX' AS city_state UNION
	  SELECT 'San Diego, CA' AS city_state UNION
	  SELECT 'Dallas, TX' AS city_state UNION
	  SELECT 'San Jose, CA' AS city_state
	) AS cities ORDER BY RAND() LIMIT 1);
    SET @takeoff_time = NOW() + INTERVAL FLOOR(RAND() * 10) DAY + INTERVAL FLOOR(RAND() * 24) HOUR + INTERVAL FLOOR(RAND() * 60) MINUTE + INTERVAL FLOOR(RAND() * 60) SECOND;
    SET @random_num = FLOOR(1 + RAND() * 10);
    set @arrival_time = @takeoff_time + interval @random_num hour;
    
    SET @sql = CONCAT('INSERT INTO flight (FlightNumber, Destination, arrived, timeofArrival, Timefortakeoff) VALUES ("', @flight_number, '", "', @destination, '", "', false, '", "',  @arrival_time, '", "',@takeoff_time, '");');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    Call insert_seats(@flight_number);
    SET i = i + 1;
  END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_seats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`lyn`@`127.0.0.1` PROCEDURE `insert_seats`(IN flight_number INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    WHILE (i <= 40) DO
        SET @seat_number = i;
        INSERT INTO seat (flightnumber, seatnumber, passengerID) VALUES (flight_number, @seat_number, NULL);
        SET i = i + 1;
    END WHILE;
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

-- Dump completed on 2023-05-08 17:56:09
