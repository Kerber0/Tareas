-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: localhost    Database: campeonato_ajedrez
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `arbitro`
--

DROP TABLE IF EXISTS `arbitro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arbitro` (
  `dni` varchar(9) NOT NULL,
  `salario` double NOT NULL,
  PRIMARY KEY (`dni`),
  CONSTRAINT `arbitro_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `participante` (`dni`),
  CONSTRAINT `arbitro_chk_1` CHECK ((`salario` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arbitro`
--

LOCK TABLES `arbitro` WRITE;
/*!40000 ALTER TABLE `arbitro` DISABLE KEYS */;
INSERT INTO `arbitro` VALUES ('44444444E',450),('55555555T',600);
/*!40000 ALTER TABLE `arbitro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `nombre` varchar(40) NOT NULL,
  `calle` varchar(40) NOT NULL,
  `numero` int NOT NULL,
  `cp` varchar(5) NOT NULL,
  `localidade` varchar(40) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES ('Hotel Pazo Verde','Plaza de España ',18,'35700','A Coruña'),('Hotel Rey','Avda. Principal',5,'35700','A Coruña'),('Hotel Sta. María','c) Progreso',114,'35700','A Coruña');
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_telefono`
--

DROP TABLE IF EXISTS `hotel_telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel_telefono` (
  `nombre` varchar(40) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  PRIMARY KEY (`nombre`,`telefono`),
  CONSTRAINT `hotel_telefono_ibfk_1` FOREIGN KEY (`nombre`) REFERENCES `hotel` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_telefono`
--

LOCK TABLES `hotel_telefono` WRITE;
/*!40000 ALTER TABLE `hotel_telefono` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotel_telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participante`
--

DROP TABLE IF EXISTS `participante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participante` (
  `dni` varchar(9) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `nombre_hotel` varchar(40) NOT NULL,
  PRIMARY KEY (`dni`),
  KEY `nombre_hotel` (`nombre_hotel`),
  CONSTRAINT `participante_ibfk_1` FOREIGN KEY (`nombre_hotel`) REFERENCES `hotel` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participante`
--

LOCK TABLES `participante` WRITE;
/*!40000 ALTER TABLE `participante` DISABLE KEYS */;
INSERT INTO `participante` VALUES ('11111111B','María García López','Hotel Rey'),('12345678Z','Antonio Rodríguez Pérez','Hotel Rey'),('22222222C','Marcos Veiga López','Hotel Pazo Verde'),('33333333B','María Estévez Ramos','Hotel Pazo Verde'),('44444444E','Javier Rodríguez Cabana','Hotel Sta. María'),('55555555T','Lucía Graña Gómez','Hotel Sta. María'),('66666666N','Borja Valle Estévez','Hotel Rey');
/*!40000 ALTER TABLE `participante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partida`
--

DROP TABLE IF EXISTS `partida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partida` (
  `codigo` int NOT NULL,
  `duracion` double NOT NULL,
  `dni_arbitro` varchar(9) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `dni_arbitro` (`dni_arbitro`),
  CONSTRAINT `partida_ibfk_1` FOREIGN KEY (`dni_arbitro`) REFERENCES `arbitro` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partida`
--

LOCK TABLES `partida` WRITE;
/*!40000 ALTER TABLE `partida` DISABLE KEYS */;
/*!40000 ALTER TABLE `partida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partida_xogador`
--

DROP TABLE IF EXISTS `partida_xogador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partida_xogador` (
  `codigo_partida` int NOT NULL,
  `dni_xogador` varchar(9) NOT NULL,
  `color` varchar(1) NOT NULL,
  PRIMARY KEY (`codigo_partida`,`dni_xogador`),
  KEY `dni_xogador` (`dni_xogador`),
  CONSTRAINT `partida_xogador_ibfk_1` FOREIGN KEY (`codigo_partida`) REFERENCES `partida` (`codigo`),
  CONSTRAINT `partida_xogador_ibfk_2` FOREIGN KEY (`dni_xogador`) REFERENCES `xogador` (`dni`),
  CONSTRAINT `partida_xogador_chk_1` CHECK ((`color` in (_utf8mb4'B',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partida_xogador`
--

LOCK TABLES `partida_xogador` WRITE;
/*!40000 ALTER TABLE `partida_xogador` DISABLE KEYS */;
/*!40000 ALTER TABLE `partida_xogador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xogador`
--

DROP TABLE IF EXISTS `xogador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `xogador` (
  `dni` varchar(9) NOT NULL,
  `data_nacemento` date NOT NULL,
  PRIMARY KEY (`dni`),
  CONSTRAINT `xogador_ibfk_1` FOREIGN KEY (`dni`) REFERENCES `participante` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xogador`
--

LOCK TABLES `xogador` WRITE;
/*!40000 ALTER TABLE `xogador` DISABLE KEYS */;
INSERT INTO `xogador` VALUES ('11111111B','1980-09-23'),('12345678Z','1985-06-15'),('22222222C','1979-10-03'),('33333333B','1986-12-17'),('66666666N','1977-01-30');
/*!40000 ALTER TABLE `xogador` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-23 20:29:14
