-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: demo_dump
-- ------------------------------------------------------
-- Server version	5.7.26

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
-- Table structure for table `customer_address_entity_varchar`
--

DROP TABLE IF EXISTS `customer_address_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  KEY `IDX_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_CSTR_ADDR_ENTT_VCHR_ATTR_ID_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CSTR_ADDR_ENTT_VCHR_ENTT_ID_CSTR_ADDR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CSTR_ADDR_ENTT_VCHR_ENTT_TYPE_ID_EAV_ENTT_TYPE_ENTT_TYPE_ID` FOREIGN KEY (`entity_type_id`) REFERENCES `eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=217744 DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Varchar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address_entity_varchar`
--

LOCK TABLES `customer_address_entity_varchar` WRITE;
/*!40000 ALTER TABLE `customer_address_entity_varchar` DISABLE KEYS */;
INSERT INTO `customer_address_entity_varchar` VALUES (458,2,28,36,'Berkshire'),(459,2,30,36,'IW23 6TA'),(460,2,22,36,'Casper'),(461,2,26,36,'Blaisemouth'),(462,2,31,36,'0800 620 6220'),(463,2,27,36,'GB'),(464,2,20,36,'Angela'),(465,2,19,36,'Miss'),(466,2,28,37,'Staffordshire'),(467,2,30,37,'EO78 3ZH'),(468,2,22,37,'Fadel'),(469,2,26,37,'Casperburgh'),(470,2,31,37,'0882 366 3936'),(471,2,27,37,'GB'),(472,2,20,37,'Kassandra'),(473,2,19,37,'Mrs.'),(500,2,19,41,'Miss'),(501,2,20,41,'Halle'),(502,2,22,41,'Feest'),(504,2,26,41,'Lake Harmony'),(505,2,28,41,'Durham'),(506,2,30,41,'UK26 1AM'),(507,2,27,41,'GB'),(508,2,31,41,'0800 818 8402'),(510,2,19,42,'Miss'),(511,2,20,42,'Bernadette'),(512,2,22,42,'Muller'),(514,2,26,42,'West Carolynehaven'),(515,2,27,42,'GB'),(516,2,28,42,'Lancashire'),(517,2,30,42,'PP76 6DU'),(518,2,31,42,'01906 60908'),(519,2,28,43,'Merseyside'),(520,2,30,43,'EJ7 1RT'),(521,2,22,43,'Sporer'),(522,2,26,43,'Port Judy'),(523,2,31,43,'0962 949 6137'),(524,2,27,43,'GB'),(525,2,20,43,'Brock'),(526,2,19,43,'Miss'),(527,2,28,44,'Suffolk'),(528,2,30,44,'NO86 9CV'),(529,2,22,44,'Bartoletti'),(530,2,26,44,'Whitemouth'),(531,2,31,44,'0881 948 7625'),(532,2,27,44,'GB'),(533,2,20,44,'Margret'),(534,2,19,44,'Mr.'),(5530,2,24,36,NULL),(81644,2,19,8797,'Miss'),(81645,2,20,8797,'Aron'),(81646,2,22,8797,'Beier'),(81647,2,24,8797,NULL),(81648,2,26,8797,'Boscomouth'),(81649,2,28,8797,'Northamptonshire'),(81650,2,30,8797,'CB3 3EX'),(81651,2,27,8797,'GB'),(81652,2,31,8797,'01301 282924'),(81653,2,32,8797,NULL),(87504,2,19,9430,'Mrs.'),(87505,2,20,9430,'Christine'),(87506,2,22,9430,'Watsica'),(87507,2,24,9430,'Downfall24'),(87508,2,26,9430,'West Abdullahchester'),(87509,2,27,9430,'GB'),(87510,2,28,9430,'Gwynedd County'),(87511,2,30,9430,'EJ94 2GH'),(87512,2,31,9430,'0800 367 8854'),(87522,2,19,9432,'Ms.'),(87523,2,20,9432,'Orion'),(87524,2,22,9432,'Franecki'),(87525,2,24,9432,'Downfall24'),(87526,2,26,9432,'Port Abdul'),(87527,2,27,9432,'GB'),(87528,2,28,9432,'County Armagh'),(87529,2,30,9432,'UL1 4US'),(87530,2,31,9432,'0339 755 4714'),(120463,2,19,13046,'Mr.'),(120464,2,20,13046,'Nathen'),(120465,2,22,13046,'Borer'),(120466,2,24,13046,NULL),(120467,2,26,13046,'North Meggiestad'),(120468,2,27,13046,'GB'),(120469,2,28,13046,'Devon'),(120470,2,30,13046,'ML8 2XD'),(120471,2,31,13046,'01013 80621'),(187813,2,21,50,NULL),(187814,2,23,50,NULL),(187815,2,24,50,NULL),(187816,2,32,50,NULL),(187817,2,36,50,NULL);
/*!40000 ALTER TABLE `customer_address_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;
