CREATE DATABASE  IF NOT EXISTS `4thewords_prueba_jerry_hurtado` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `4thewords_prueba_jerry_hurtado`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: 4thewords_prueba_jerry_hurtado
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `canton`
--

DROP TABLE IF EXISTS `canton`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `canton` (
  `id` int NOT NULL,
  `provinceId` int NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_idx` (`provinceId`),
  CONSTRAINT `fk_provinceId` FOREIGN KEY (`provinceId`) REFERENCES `province` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canton`
--

LOCK TABLES `canton` WRITE;
/*!40000 ALTER TABLE `canton` DISABLE KEYS */;
INSERT INTO `canton` VALUES (1,1,'San José'),(2,1,'Escazú'),(3,1,'Desamparados'),(4,1,'Puriscal'),(5,1,'Tarrazú'),(6,1,'Aserrí'),(7,1,'Mora'),(8,1,'Goicoechea'),(9,1,'Santa Ana'),(10,1,'Alajuelita'),(11,1,'Vásquez de Coronado'),(12,1,'Acosta'),(13,1,'Tibás'),(14,1,'Moravia'),(15,1,'Montes de Oca'),(16,1,'Turrubares'),(17,1,'Dota'),(18,1,'Curridabat'),(19,1,'Pérez Zeledón'),(20,1,'León Cortéz Castro'),(21,2,'Alajuela'),(22,2,'San Ramón'),(23,2,'Grecia'),(24,2,'San Mateo'),(25,2,'Atenas'),(26,2,'Naranjo'),(27,2,'Palmares'),(28,2,'Poás'),(29,2,'Orotina'),(30,2,'San Carlos'),(31,2,'Zarcero'),(32,2,'Valverde Vega'),(33,2,'Upala'),(34,2,'Los Chiles'),(35,2,'Guatuso'),(36,3,'Cartago'),(37,3,'Paraíso'),(38,3,'La Unión'),(39,3,'Jiménez'),(40,3,'Turrialba'),(41,3,'Alvarado'),(42,3,'Oreamuno'),(43,3,'El Guarco'),(44,4,'Heredia'),(45,4,'Barva'),(46,4,'Santo Domingo'),(47,4,'Santa Bárbara'),(48,4,'San Rafaél'),(49,4,'San Isidro'),(50,4,'Belén'),(51,4,'Flores'),(52,4,'San Pablo'),(53,4,'Sarapiquí'),(54,5,'Liberia'),(55,5,'Nicoya'),(56,5,'Santa Cruz'),(57,5,'Bagaces'),(58,5,'Carrillo'),(59,5,'Cañas'),(60,5,'Abangáres'),(61,5,'Tilarán'),(62,5,'Nandayure'),(63,5,'La Cruz'),(64,5,'Hojancha'),(65,6,'Puntarenas'),(66,6,'Esparza'),(67,6,'Buenos Aires'),(68,6,'Montes de Oro'),(69,6,'Osa'),(70,6,'Aguirre'),(71,6,'Golfito'),(72,6,'Coto Brus'),(73,6,'Parrita'),(74,6,'Corredores'),(75,6,'Garabito'),(76,7,'Limón'),(77,7,'Pococí'),(78,7,'Siquirres'),(79,7,'Talamanca'),(80,7,'Matina'),(81,7,'Guácimo');
/*!40000 ALTER TABLE `canton` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` char(36) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('a4c71631-2cea-11f0-a603-d8bbc173d8b6','Leyenda Urbana'),('a4c777a9-2cea-11f0-a603-d8bbc173d8b6','Leyenda Histórica'),('a4c784c3-2cea-11f0-a603-d8bbc173d8b6','Leyenda Sobrenatural'),('a4c78598-2cea-11f0-a603-d8bbc173d8b6','Leyenda Indígena'),('a4c785e2-2cea-11f0-a603-d8bbc173d8b6','Leyenda Religiosa'),('a4c78623-2cea-11f0-a603-d8bbc173d8b6','Leyenda Popular');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `district` (
  `id` int NOT NULL,
  `cantonId` int NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cantonId_idx` (`cantonId`),
  CONSTRAINT `fk_cantonId` FOREIGN KEY (`cantonId`) REFERENCES `canton` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES (1,1,'CARMEN'),(2,1,'MERCED'),(3,1,'HOSPITAL'),(4,1,'CATEDRAL'),(5,1,'ZAPOTE'),(6,1,'SAN FRANCISCO DE DOS RÍOS'),(7,1,'URUCA'),(8,1,'MATA REDONDA'),(9,1,'PAVAS'),(10,1,'HATILLO'),(11,1,'SAN SEBASTIÁN'),(12,2,'ESCAZÚ'),(13,2,'SAN ANTONIO'),(14,2,'SAN RAFAEL'),(15,3,'DESAMPARADOS'),(16,3,'SAN MIGUEL'),(17,3,'SAN JUAN DE DIOS'),(18,3,'SAN RAFAEL ARRIBA'),(19,3,'SAN ANTONIO'),(20,3,'FRAILES'),(21,3,'PATARRÁ'),(22,3,'SAN CRISTÓBAL'),(23,3,'ROSARIO'),(24,3,'DAMAS'),(25,3,'SAN RAFAEL ABAJO'),(26,3,'GRAVILIAS'),(27,3,'LOS GUIDO'),(28,4,'SANTIAGO'),(29,4,'MERCEDES SUR'),(30,4,'BARBACOAS'),(31,4,'GRIFO ALTO'),(32,4,'SAN RAFAEL'),(33,4,'CANDELARITA'),(34,4,'DESAMPARADITOS'),(35,4,'SAN ANTONIO'),(36,4,'CHIRES'),(37,5,'SAN MARCOS'),(38,5,'SAN LORENZO'),(39,5,'SAN CARLOS'),(40,6,'ASERRI'),(41,6,'TARBACA'),(42,6,'VUELTA DE JORCO'),(43,6,'SAN GABRIEL'),(44,6,'LEGUA'),(45,6,'MONTERREY'),(46,6,'SALITRILLOS'),(47,7,'COLÓN'),(48,7,'GUAYABO'),(49,7,'TABARCIA'),(50,7,'PIEDRAS NEGRAS'),(51,7,'PICAGRES'),(52,7,'JARIS'),(53,7,'QUITIRRISI'),(54,8,'GUADALUPE'),(55,8,'SAN FRANCISCO'),(56,8,'CALLE BLANCOS'),(57,8,'MATA DE PLÁTANO'),(58,8,'IPÍS'),(59,8,'RANCHO REDONDO'),(60,8,'PURRAL'),(61,9,'SANTA ANA'),(62,9,'SALITRAL'),(63,9,'POZOS'),(64,9,'URUCA'),(65,9,'PIEDADES'),(66,9,'BRASIL'),(67,10,'ALAJUELITA'),(68,10,'SAN JOSECITO'),(69,10,'SAN ANTONIO'),(70,10,'CONCEPCIÓN'),(71,10,'SAN FELIPE'),(72,11,'SAN ISIDRO'),(73,11,'SAN RAFAEL'),(74,11,'DULCE NOMBRE DE JESÚS'),(75,11,'PATALILLO'),(76,11,'CASCAJAL'),(77,12,'SAN IGNACIO'),(78,12,'GUAITIL Villa'),(79,12,'PALMICHAL'),(80,12,'CANGREJAL'),(81,12,'SABANILLAS'),(82,13,'SAN JUAN'),(83,13,'CINCO ESQUINAS'),(84,13,'ANSELMO LLORENTE'),(85,13,'LEON XIII'),(86,13,'COLIMA'),(87,14,'SAN VICENTE'),(88,14,'SAN JERÓNIMO'),(89,14,'LA TRINIDAD'),(90,15,'SAN PEDRO'),(91,15,'SABANILLA'),(92,15,'MERCEDES'),(93,15,'SAN RAFAEL'),(94,16,'SAN PABLO'),(95,16,'SAN PEDRO'),(96,16,'SAN JUAN DE MATA'),(97,16,'SAN LUIS'),(98,16,'CARARA'),(99,17,'SANTA MARÍA'),(100,17,'JARDÍN'),(101,17,'COPEY'),(102,18,'CURRIDABAT'),(103,18,'GRANADILLA'),(104,18,'SÁNCHEZ'),(105,18,'TIRRASES'),(106,19,'SAN ISIDRO DE EL GENERAL'),(107,19,'EL GENERAL'),(108,19,'DANIEL FLORES'),(109,19,'RIVAS'),(110,19,'SAN PEDRO'),(111,19,'PLATANARES'),(112,19,'PEJIBAYE'),(113,19,'CAJÓN'),(114,19,'BARÚ'),(115,19,'RÍO NUEVO'),(116,19,'PÁRAMO'),(117,20,'SAN PABLO'),(118,20,'SAN ANDRÉS'),(119,20,'LLANO BONITO'),(120,20,'SAN ISIDRO'),(121,20,'SANTA CRUZ'),(122,20,'SAN ANTONIO'),(123,21,'ALAJUELA'),(124,21,'SAN JOSÉ'),(125,21,'CARRIZAL'),(126,21,'SAN ANTONIO'),(127,21,'GUÁCIMA'),(128,21,'SAN ISIDRO'),(129,21,'SABANILLA'),(130,21,'SAN RAFAEL'),(131,21,'RÍO SEGUNDO'),(132,21,'DESAMPARADOS'),(133,21,'TURRÚCARES'),(134,21,'TAMBOR'),(135,21,'GARITA'),(136,21,'SARAPIQUÍ'),(137,22,'SAN RAMÓN'),(138,22,'SANTIAGO'),(139,22,'SAN JUAN'),(140,22,'PIEDADES NORTE'),(141,22,'PIEDADES SUR'),(142,22,'SAN RAFAEL'),(143,22,'SAN ISIDRO'),(144,22,'ÁNGELES'),(145,22,'ALFARO'),(146,22,'VOLIO'),(147,22,'CONCEPCIÓN'),(148,22,'ZAPOTAL'),(149,22,'PEÑAS BLANCAS'),(150,23,'GRECIA'),(151,23,'SAN ISIDRO'),(152,23,'SAN JOSÉ'),(153,23,'SAN ROQUE'),(154,23,'TACARES'),(155,23,'RÍO CUARTO'),(156,23,'PUENTE DE PIEDRA'),(157,23,'BOLÍVAR'),(158,24,'SAN MATEO'),(159,24,'DESMONTE'),(160,24,'JESÚS MARÍA'),(161,24,'LABRADOR'),(162,25,'ATENAS'),(163,25,'JESÚS'),(164,25,'MERCEDES'),(165,25,'SAN ISIDRO'),(166,25,'CONCEPCIÓN'),(167,25,'SAN JOSE'),(168,25,'SANTA EULALIA'),(169,25,'ESCOBAL'),(170,26,'NARANJO'),(171,26,'SAN MIGUEL'),(172,26,'SAN JOSÉ'),(173,26,'CIRRÍ SUR'),(174,26,'SAN JERÓNIMO'),(175,26,'SAN JUAN'),(176,26,'EL ROSARIO'),(177,26,'PALMITOS'),(178,27,'PALMARES'),(179,27,'ZARAGOZA'),(180,27,'BUENOS AIRES'),(181,27,'SANTIAGO'),(182,27,'CANDELARIA'),(183,27,'ESQUÍPULAS'),(184,27,'LA GRANJA'),(185,28,'SAN PEDRO'),(186,28,'SAN JUAN'),(187,28,'SAN RAFAEL'),(188,28,'CARRILLOS'),(189,28,'SABANA REDONDA'),(190,29,'OROTINA'),(191,29,'EL MASTATE'),(192,29,'HACIENDA VIEJA'),(193,29,'COYOLAR'),(194,29,'LA CEIBA'),(195,30,'QUESADA'),(196,30,'FLORENCIA'),(197,30,'BUENAVISTA'),(198,30,'AGUAS ZARCAS'),(199,30,'VENECIA'),(200,30,'PITAL'),(201,30,'LA FORTUNA'),(202,30,'LA TIGRA'),(203,30,'LA PALMERA'),(204,30,'VENADO'),(205,30,'CUTRIS'),(206,30,'MONTERREY'),(207,30,'POCOSOL'),(208,31,'ZARCERO'),(209,31,'LAGUNA'),(210,31,'GUADALUPE'),(211,31,'PALMIRA'),(212,31,'ZAPOTE'),(213,31,'BRISAS'),(214,32,'SARCHÍ NORTE'),(215,32,'SARCHÍ SUR'),(216,32,'TORO AMARILLO'),(217,32,'SAN PEDRO'),(218,32,'RODRÍGUEZ'),(219,33,'UPALA'),(220,33,'AGUAS CLARAS'),(221,33,'SAN JOSÉ o PIZOTE'),(222,33,'BIJAGUA'),(223,33,'DELICIAS'),(224,33,'DOS RÍOS'),(225,33,'YOLILLAL'),(226,33,'CANALETE'),(227,34,'LOS CHILES'),(228,34,'CAÑO NEGRO'),(229,34,'EL AMPARO'),(230,34,'SAN JORGE'),(231,35,'BUENAVISTA'),(232,35,'COTE'),(233,35,'KATIRA'),(234,36,'ORIENTAL'),(235,36,'OCCIDENTAL'),(236,36,'CARMEN'),(237,36,'SAN NICOLÁS'),(238,36,'AGUACALIENTE o SAN FRANCISCO'),(239,36,'GUADALUPE o ARENILLA'),(240,36,'CORRALILLO'),(241,36,'TIERRA BLANCA'),(242,36,'DULCE NOMBRE'),(243,36,'LLANO GRANDE'),(244,36,'QUEBRADILLA'),(245,37,'PARAÍSO'),(246,37,'SANTIAGO'),(247,37,'OROSI'),(248,37,'CACHÍ'),(249,37,'LLANOS DE SANTA LUCÍA'),(250,38,'TRES RÍOS'),(251,38,'SAN DIEGO'),(252,38,'SAN JUAN'),(253,38,'SAN RAFAEL'),(254,38,'CONCEPCIÓN'),(255,38,'DULCE NOMBRE'),(256,38,'SAN RAMÓN'),(257,38,'RÍO AZUL'),(258,39,'JUAN VIÑAS'),(259,39,'TUCURRIQUE'),(260,39,'PEJIBAYE'),(261,40,'TURRIALBA'),(262,40,'LA SUIZA'),(263,40,'PERALTA'),(264,40,'SANTA CRUZ'),(265,40,'SANTA TERESITA'),(266,40,'PAVONES'),(267,40,'TUIS'),(268,40,'TAYUTIC'),(269,40,'SANTA ROSA'),(270,40,'TRES EQUIS'),(271,40,'LA ISABEL'),(272,40,'CHIRRIPÓ'),(273,41,'PACAYAS'),(274,41,'CERVANTES'),(275,41,'CAPELLADES'),(276,42,'SAN RAFAEL'),(277,42,'COT'),(278,42,'POTRERO CERRADO'),(279,42,'CIPRESES'),(280,42,'SANTA ROSA'),(281,43,'EL TEJAR'),(282,43,'SAN ISIDRO'),(283,43,'TOBOSI'),(284,43,'PATIO DE AGUA'),(285,44,'HEREDIA'),(286,44,'MERCEDES'),(287,44,'SAN FRANCISCO'),(288,44,'ULLOA'),(289,44,'VARABLANCA'),(290,45,'BARVA'),(291,45,'SAN PEDRO'),(292,45,'SAN PABLO'),(293,45,'SAN ROQUE'),(294,45,'SANTA LUCÍA'),(295,45,'SAN JOSÉ DE LA MONTAÑA'),(296,46,'SAN VICENTE'),(297,46,'SAN MIGUEL'),(298,46,'PARACITO'),(299,46,'SANTO TOMÁS'),(300,46,'SANTA ROSA'),(301,46,'TURES'),(302,46,'PARÁ'),(303,47,'SANTA BÁRBARA'),(304,47,'SAN PEDRO'),(305,47,'SAN JUAN'),(306,47,'JESÚS'),(307,47,'SANTO DOMINGO'),(308,47,'PURABÁ'),(309,48,'SAN RAFAEL'),(310,48,'SAN JOSECITO'),(311,48,'SANTIAGO'),(312,48,'ÁNGELES'),(313,48,'CONCEPCIÓN'),(314,49,'SAN ISIDRO'),(315,49,'SAN JOSÉ'),(316,49,'CONCEPCIÓN'),(317,49,'SAN FRANCISCO'),(318,50,'SAN ANTONIO'),(319,50,'LA RIBERA'),(320,50,'LA ASUNCIÓN'),(321,51,'SAN JOAQUÍN'),(322,51,'BARRANTES'),(323,51,'LLORENTE'),(324,52,'SAN PABLO'),(325,53,'PUERTO VIEJO'),(326,53,'LA VIRGEN'),(327,53,'LAS HORQUETAS'),(328,53,'LLANURAS DEL GASPAR'),(329,53,'CUREÑA'),(330,54,'LIBERIA'),(331,54,'CAÑAS DULCES'),(332,54,'MAYORGA'),(333,54,'NACASCOLO'),(334,54,'CURUBANDÉ'),(335,55,'NICOYA'),(336,55,'MANSIÓN'),(337,55,'SAN ANTONIO'),(338,55,'QUEBRADA HONDA'),(339,55,'SÁMARA'),(340,55,'NOSARA'),(341,55,'BELÉN DE NOSARITA'),(342,56,'SANTA CRUZ'),(343,56,'BOLSÓN'),(344,56,'VEINTISIETE DE ABRIL'),(345,56,'TEMPATE'),(346,56,'CARTAGENA'),(347,56,'CUAJINIQUIL'),(348,56,'DIRIÁ'),(349,56,'CABO VELAS'),(350,56,'TAMARINDO'),(351,57,'BAGACES'),(352,57,'LA FORTUNA'),(353,57,'MOGOTE'),(354,57,'RÍO NARANJO'),(355,58,'FILADELFIA'),(356,58,'PALMIRA'),(357,58,'SARDINAL'),(358,58,'BELÉN'),(359,59,'CAÑAS'),(360,59,'PALMIRA'),(361,59,'SAN MIGUEL'),(362,59,'BEBEDERO'),(363,59,'POROZAL'),(364,60,'LAS JUNTAS'),(365,60,'SIERRA'),(366,60,'SAN JUAN'),(367,60,'COLORADO'),(368,61,'TILARÁN'),(369,61,'QUEBRADA GRANDE'),(370,61,'TRONADORA'),(371,61,'SANTA ROSA'),(372,61,'LÍBANO'),(373,61,'TIERRAS MORENAS'),(374,61,'ARENAL'),(375,62,'CARMONA'),(376,62,'SANTA RITA'),(377,62,'ZAPOTAL'),(378,62,'SAN PABLO'),(379,62,'PORVENIR'),(380,62,'BEJUCO'),(381,63,'LA CRUZ'),(382,63,'SANTA CECILIA'),(383,63,'LA GARITA'),(384,63,'SANTA ELENA'),(385,64,'HOJANCHA'),(386,64,'MONTE ROMO'),(387,64,'PUERTO CARRILLO'),(388,64,'HUACAS'),(389,65,'PUNTARENAS'),(390,65,'PITAHAYA'),(391,65,'CHOMES'),(392,65,'LEPANTO'),(393,65,'PAQUERA'),(394,65,'MANZANILLO'),(395,65,'GUACIMAL'),(396,65,'BARRANCA'),(397,65,'MONTE VERDE'),(398,65,'CÓBANO'),(399,65,'CHACARITA'),(400,65,'CHIRA'),(401,65,'ACAPULCO'),(402,65,'EL ROBLE'),(403,65,'ARANCIBIA'),(404,66,'ESPÍRITU SANTO'),(405,66,'SAN JUAN GRANDE'),(406,66,'MACACONA'),(407,66,'SAN RAFAEL'),(408,66,'SAN JERÓNIMO'),(409,66,'CALDERA'),(410,67,'BUENOS AIRES'),(411,67,'VOLCÁN'),(412,67,'POTRERO GRANDE'),(413,67,'BORUCA'),(414,67,'PILAS'),(415,67,'COLINAS'),(416,67,'CHÁNGUENA'),(417,67,'BIOLLEY'),(418,67,'BRUNKA'),(419,68,'MIRAMAR'),(420,68,'LA UNIÓN'),(421,68,'SAN ISIDRO'),(422,69,'PUERTO CORTÉS'),(423,69,'PALMAR'),(424,69,'SIERPE'),(425,69,'BAHÍA BALLENA'),(426,69,'PIEDRAS BLANCAS'),(427,69,'BAHÍA DRAKE'),(428,70,'QUEPOS'),(429,70,'SAVEGRE'),(430,70,'NARANJITO'),(431,71,'GOLFITO'),(432,71,'PUERTO JIMÉNEZ'),(433,71,'GUAYCARÁ'),(434,71,'PAVÓN'),(435,72,'SAN VITO'),(436,72,'SABALITO'),(437,72,'AGUABUENA'),(438,72,'LIMONCITO'),(439,72,'PITTIER'),(440,72,'GUTIERREZ BRAUN'),(441,73,'PARRITA'),(442,74,'CORREDOR'),(443,74,'LA CUESTA'),(444,74,'CANOAS'),(445,74,'LAUREL'),(446,75,'JACÓ'),(447,75,'TÁRCOLES'),(448,76,'LIMÓN'),(449,76,'VALLE LA ESTRELLA'),(450,76,'MATAMA'),(451,77,'GUÁPILES'),(452,77,'JIMÉNEZ'),(453,77,'RITA'),(454,77,'ROXANA'),(455,77,'CARIARI'),(456,77,'COLORADO'),(457,77,'LA COLONIA'),(458,78,'SIQUIRRES'),(459,78,'PACUARITO'),(460,78,'FLORIDA'),(461,78,'GERMANIA'),(462,78,'EL CAIRO'),(463,78,'ALEGRÍA'),(464,79,'BRATSI'),(465,79,'SIXAOLA'),(466,79,'CAHUITA'),(467,79,'TELIRE'),(468,80,'MATINA'),(469,80,'BATÁN'),(470,80,'CARRANDI'),(471,81,'GUÁCIMO'),(472,81,'MERCEDES'),(473,81,'POCORA'),(474,81,'RÍO JIMÉNEZ'),(475,81,'DUACARÍ');
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legend`
--

DROP TABLE IF EXISTS `legend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `legend` (
  `id` char(36) NOT NULL,
  `districtId` int NOT NULL,
  `categoryId` char(36) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `imageURL` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `isActive` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_categoryId_idx` (`categoryId`),
  KEY `fk_districtId_idx` (`districtId`),
  CONSTRAINT `fk_categoryId` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_districtId` FOREIGN KEY (`districtId`) REFERENCES `district` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legend`
--

LOCK TABLES `legend` WRITE;
/*!40000 ALTER TABLE `legend` DISABLE KEYS */;
INSERT INTO `legend` VALUES ('00108bc9-bc5f-4990-be30-030b23493a7b',21,'a4c78623-2cea-11f0-a603-d8bbc173d8b6','El Alma en Pena','Esta leyenda describe el espíritu de una persona que murió en circunstancias trágicas o injustas y no ha podido encontrar descanso. En Costa Rica, se asocia con caminos rurales, cementerios o ríos, donde se escuchan lamentos y suspiros en la noche. En Patarrá, por ejemplo, se cuenta que un hombre murió sin confesarse y su alma vaga por la “Calle del Cura”, buscando redención. También se le vincula con la Tulevieja y La Llorona, quienes son consideradas almas en pena femeninas.','https://res.cloudinary.com/dfqzeqbyt/image/upload/v1752045098/books/iyico1wyfbfuutal930x.jpg','1977-08-10',_binary ''),('13029b73-95cd-4501-8356-302a24559feb',170,'a4c78623-2cea-11f0-a603-d8bbc173d8b6','La Llorona','Una mujer que, tras perder o asesinar a su hijo, vaga por los ríos llorando desconsoladamente. Su lamento se escucha en las noches, y se dice que su presencia anuncia muerte o desgracia. Aunque es común en toda América Latina, en Costa Rica tiene versiones propias ligadas a zonas rurales y leyendas locales.','https://res.cloudinary.com/dfqzeqbyt/image/upload/v1752044715/books/fcd9bn9clqvglokgpybx.jpg','1983-05-09',_binary ''),('2f492c8f-1174-4a64-9726-6d12ada6b101',151,'a4c78623-2cea-11f0-a603-d8bbc173d8b6','La Carreta sin Bueyes','Una carreta fantasma recorre las calles en la oscuridad, sin bueyes que la arrastren ni conductor visible. Se dice que aparece cerca de casas donde hay conflictos o codicia, como advertencia de que algo terrible está por suceder. En algunas versiones, la carreta lleva un cadáver y es guiada por una bruja o el mismísimo diablo.','https://res.cloudinary.com/dfqzeqbyt/image/upload/v1752043881/books/hccpdwwavlwksogqizlq.jpg','1985-07-02',_binary ''),('3108807a-8526-433c-bb3c-59a8261aece2',12,'a4c78623-2cea-11f0-a603-d8bbc173d8b6','La Bruja de Escazú','Conocida como María la Negra, esta bruja vivía cerca de la iglesia de Escazú. Se decía que tenía poderes oscuros y podía transformarse en una chancha negra con crías que atacaban a quienes la ofendían. Tras su muerte, un fuerte temblor destruyó su casa, y desde entonces se cree que su espíritu aún ronda la zona.','https://res.cloudinary.com/dfqzeqbyt/image/upload/v1752044043/books/mncpiryevqddppvrs688.jpg','1993-04-09',_binary ''),('31de3d29-27b7-4232-8be8-a36dca8bd65e',125,'a4c78623-2cea-11f0-a603-d8bbc173d8b6','La Segua','Una mujer bellísima que aparece en caminos rurales pidiendo ayuda para llegar a casa. Cuando el hombre accede, ella se transforma en una criatura con rostro de caballo y aliento fétido. Castiga la lujuria y la infidelidad, dejando a sus víctimas traumatizadas o muertas.','https://res.cloudinary.com/dfqzeqbyt/image/upload/v1752044909/books/rgm7xv2rf6b7h4scj4m5.jpg','2024-02-05',_binary ''),('3377b9de-bc5f-4889-878d-37aa88a369f3',245,'a4c784c3-2cea-11f0-a603-d8bbc173d8b6','El Espantajo Azul','Este espanto aparece en los caminos entre Paraíso y Cartago, especialmente en noches sin luna. Se describe como una figura humana envuelta en llamas azules, con ojos brillantes y una presencia aterradora. Según la leyenda, fue un hombre malvado que logró escapar del infierno, y ahora vaga por los caminos castigando a quienes han obrado con crueldad o injusticia. Se dice que su aparición provoca desmayos, parálisis momentánea o incluso pérdida de la razón. Algunos aseguran que si se le enfrenta con fe y oración, desaparece sin causar daño.','https://res.cloudinary.com/dfqzeqbyt/image/upload/v1752045373/books/ipq7jq9cs4hlqmm3cl4n.jpg','1984-08-09',_binary ''),('82640840-c4bf-4615-a58e-b12ec74c29e2',389,'a4c78623-2cea-11f0-a603-d8bbc173d8b6','La Mona','Una bruja que se transforma en un mono gigante y peludo para atacar a sus enemigos. Se mueve entre los árboles con gran agilidad, emitiendo carcajadas y alaridos que paralizan de miedo. Se cree que es enviada por otras brujas para castigar a hombres infieles o personas que la han ofendido.','https://res.cloudinary.com/dfqzeqbyt/image/upload/v1752044477/books/w7k32cpgps6nv8iuoy0m.jpg','2010-05-07',_binary ''),('8c0bb614-55b9-4f2d-8101-97075e503001',40,'a4c784c3-2cea-11f0-a603-d8bbc173d8b6','La Bruja de Zárate','La más poderosa de las brujas costarricenses, habitante de los encantos de Aserrí y Escazú. Se enamoró de un conquistador español que la rechazó, y como castigo convirtió el pueblo en piedra y al hombre en un pavo real. Es temida y respetada, capaz de transformar frutas en oro o lanzar maldiciones.','https://res.cloudinary.com/dfqzeqbyt/image/upload/v1752044594/books/db7tttsweduzkcergj4w.jpg','2024-09-11',_binary ''),('cbfa29e3-af90-4f02-b644-9e93871f11b5',290,'a4c785e2-2cea-11f0-a603-d8bbc173d8b6','El Padre sin Cabeza','Un sacerdote fantasma que aparece en caminos solitarios, convocando a misa en una iglesia inexistente. Al dar la bendición, revela que no tiene cabeza. Quienes lo ven despiertan en medio de la calle, confundidos y aterrados. Es una advertencia sobre la fe y el respeto a lo sagrado.','https://res.cloudinary.com/dfqzeqbyt/image/upload/v1752044833/books/rsrcypsfd9yktoagionr.jpg','2023-03-08',_binary ''),('df3519d2-4aa9-4bb9-966b-477808fbdf66',448,'a4c78598-2cea-11f0-a603-d8bbc173d8b6','La Tulevieja','Espíritu de una mujer que abandonó a su hijo en un río y fue condenada a vagar eternamente. Tiene cuerpo de ave de rapiña, alas de murciélago y un sombrero de tule. Se dice que ataca a quienes están en pecado mortal y que su lamento anuncia tragedias. Su origen se vincula con mitos indígenas bribris.','https://res.cloudinary.com/dfqzeqbyt/image/upload/v1752044374/books/ocfcml75uw4qpdjqcscz.jpg','2018-07-03',_binary ''),('e7bd5e3b-628e-49d0-93b3-2b1ee79ee395',12,'a4c784c3-2cea-11f0-a603-d8bbc173d8b6','El Cadejos','Cuenta la leyenda que fue el tercer hijo varón, parrandero y vago de un gamonal de Escazú. Siempre echado de día, en las noches envolvía un yugo en cobijas, lo ponía en la cama y se escabullía a parrandear. El padre y sus hermanos furiosos le llevaron casi a la fuerza al monte, a “tapar” frijoles. Apenas llegó a la finca se echó a sestear. Entonces ocurrió que el padre al verlo nuevamente perdiendo su tiempo mientras sus hermanos trabajaban decidió maldecirlo diciéndole: “Echado y a cuatro patas seguirás por los siglos de los siglos, amén”. Así súbitamente el joven se transformó en un perro grande, adusto, flaco, erizo que hoy día trota al lado de los parranderos y les acompaña con su trotecillo ligero, triste y advertidor.','https://res.cloudinary.com/dfqzeqbyt/image/upload/v1752046777/books/j0fgzlv3xrcxaudikm7k.jpg','2020-05-06',_binary '');
/*!40000 ALTER TABLE `legend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `province` (
  `id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,'San José'),(2,'Alajuela'),(3,'Cartago'),(4,'Heredia'),(5,'Guanacaste'),(6,'Puntarenas'),(7,'Limón');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` char(36) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-09  1:57:33
