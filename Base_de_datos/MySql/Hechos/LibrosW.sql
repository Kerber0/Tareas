-- MySQL dump 10.13  Distrib 5.5.9, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: libros
-- ------------------------------------------------------
-- Server version	5.5.8

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
-- Current Database: `libros`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `libros` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `libros`;

--
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autores` (
  `au_id` int(11) NOT NULL AUTO_INCREMENT,
  `au_nome` varchar(30) NOT NULL,
  `au_anon` year(4) DEFAULT NULL,
  PRIMARY KEY (`au_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (1,'Bard, Dick',1959),(2,'Williams, Summer',1969),(3,'Korth, Will',1945),(4,'Silberschatz, Henry',1949),(5,'Kortazar, Catherin',1955),(6,'Sugarckz, Yern',1941),(7,'López Montalbán, Iván',1943),(8,'Castellano Pérez, Mª Jesús',1942),(9,'Dubois, Paul',1961),(10,'González, Alfons',1971),(11,'Cowart, Robert',1950);
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editoriais`
--

DROP TABLE IF EXISTS `editoriais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editoriais` (
  `ed_id` int(11) NOT NULL AUTO_INCREMENT,
  `ed_nome` varchar(30) NOT NULL,
  `ed_nomeempresa` varchar(45) NOT NULL,
  `ed_enderezo` varchar(50) NOT NULL,
  `ed_cidade` varchar(20) NOT NULL,
  `ed_estado` char(2) DEFAULT NULL,
  `ed_cp` char(6) DEFAULT NULL,
  `ed_telefono` char(10) DEFAULT NULL,
  `ed_fax` char(10) DEFAULT NULL,
  `ed_comentarios` longtext,
  PRIMARY KEY (`ed_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoriais`
--

LOCK TABLES `editoriais` WRITE;
/*!40000 ALTER TABLE `editoriais` DISABLE KEYS */;
INSERT INTO `editoriais` VALUES (1,'Yourdon','Yourdon Editorial, S.A','R/ Vilagrande, S/N- Pol. Industrilal de Vilares','New York','NY','12345','123456789','123456789',NULL),(2,'Prentice Hall','Prentice Hall Editorial','R/Da Industria, S/N- Pol. Industrial As Flores','Berkeley','IL','12346','234567891','234567891',NULL),(3,'Osborne','Osborne editorial, S.L.','R/Das Tradicións, S/N- Pol. Industrial A Cerrada','Anchorage','NE','12347','345678912','345678912',NULL),(4,'RA-MA','RA-MA Editorial','R/ Jarama, 3A- Pol. Industrial Igarsa','New York','NY','12345','456789123','456789123',NULL),(5,'Garceta','IBERGARCETA PUBLICACIÓNS,SL','R/ Madrid, S/N- Pol. Industrial Fomento','Berkeley','IL','12346','567891234','567891234',NULL),(6,'Anaya','Edicións Anaya Multimedia','R/ Juán Iganacio Luca de Tena, 15','Anchorage','NE','12347','678912345','678912345',NULL),(7,'McGraw-Hill','McGraw-Hill/Interamericana de España, SA','Edificio Valrealty, 1º andar- Basauri- 17. Aravaca','Madrid','MA','28023','789123456','789123456',NULL),(8,'Brady Pub.','Brandy Pub. Editoriais, SA','Avda. EEUU, S/N- Pol. Industrial Ancares','Lugo','LU','27000','891234567','891234567',NULL),(9,'Publicacións de Tío Sam','Sams Publications','R/ da Informática, S/N- Pol. Industrial Roma','Venecia','VE','37000','912345678','912345678',NULL),(10,'Hyden','Hyden Editorial, SA','R/Sen nome, S/N- Pol. Industrial sen nome','Paris','PA','12348','987654321','987654321',NULL),(11,'Hyden','Hyden Editorial, SA','R/ do estranxeiro, S/N- Pol. Industrial de fóra','Carmel','CA','27001','876543219','876543219',NULL);
/*!40000 ALTER TABLE `editoriais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tituloautor`
--

DROP TABLE IF EXISTS `tituloautor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tituloautor` (
  `ta_isbn` char(13) NOT NULL,
  `ta_idautor` int(11) NOT NULL,
  PRIMARY KEY (`ta_isbn`,`ta_idautor`),
  KEY `ta_idautor` (`ta_idautor`),
  CONSTRAINT `tituloautor_fk` FOREIGN KEY (`ta_isbn`) REFERENCES `titulos` (`ti_isbn`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tituloautor_fk1` FOREIGN KEY (`ta_idautor`) REFERENCES `autores` (`au_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tituloautor`
--

LOCK TABLES `tituloautor` WRITE;
/*!40000 ALTER TABLE `tituloautor` DISABLE KEYS */;
INSERT INTO `tituloautor` VALUES ('12-123-1234-1',1),('12-123-1234-6',1),('13-123-1234-6',1),('12-123-1234-1',2),('12-123-1234-7',2),('13-123-1234-7',2),('12-123-1234-2',3),('12-123-1234-8',3),('13-123-1234-8',3),('12-123-1234-2',4),('12-123-1234-9',4),('13-123-1234-9',4),('12-123-1234-3',5),('13-123-1234-1',5),('12-123-1234-3',6),('13-123-1234-2',6),('12-123-1234-4',7),('13-123-1234-3',7),('12-123-1234-4',8),('13-123-1234-4',8),('13-123-1234-9',8),('12-123-1234-5',9),('13-123-1234-4',9),('13-123-1234-5',9),('13-123-1234-8',9),('12-123-1234-5',10),('13-123-1234-5',10),('13-123-1234-7',10),('13-123-1234-6',11);
/*!40000 ALTER TABLE `tituloautor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulos`
--

DROP TABLE IF EXISTS `titulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titulos` (
  `ti_isbn` char(13) NOT NULL,
  `ti_titulo` varchar(40) NOT NULL,
  `ti_anopub` year(4) NOT NULL,
  `ti_idedit` int(11) DEFAULT NULL,
  `ti_descricion` text,
  `ti_notas` text,
  `ti_materia` varchar(20) DEFAULT NULL,
  `ti_comentarios` longtext,
  PRIMARY KEY (`ti_isbn`),
  KEY `ti_idedit` (`ti_idedit`),
  CONSTRAINT `titulos_fk` FOREIGN KEY (`ti_idedit`) REFERENCES `editoriais` (`ed_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulos`
--

LOCK TABLES `titulos` WRITE;
/*!40000 ALTER TABLE `titulos` DISABLE KEYS */;
INSERT INTO `titulos` VALUES ('12-123-1234-1','Guide to Oracle',1995,1,NULL,NULL,'SQL Server',NULL),('12-123-1234-2','Introdución a Visual Basic',1993,2,NULL,NULL,'Visual Basic',NULL),('12-123-1234-3','Introdución a Oracle',1989,6,NULL,NULL,'SQL Server',NULL),('12-123-1234-4','Visual Basic a fondo',1986,3,NULL,NULL,'Visual Basic',NULL),('12-123-1234-5','Introdución a SQL',1993,5,NULL,NULL,'SQL',NULL),('12-123-1234-6','SQL a fondo',1995,4,NULL,NULL,'SQL',NULL),('12-123-1234-7','Introdución a Btrieve',1997,6,NULL,NULL,'Btrieve',NULL),('12-123-1234-8','Btrieve a fondo',1993,1,NULL,NULL,'Btrieve',NULL),('12-123-1234-9','Introdución a Prolog',1987,2,NULL,NULL,'Prolog',NULL),('13-123-1234-1','Prolog a fondo',1997,3,NULL,NULL,'Prolog',NULL),('13-123-1234-2','C++ paso a paso',1993,7,NULL,NULL,'C++',NULL),('13-123-1234-3','C++ para todos',1985,7,NULL,NULL,'C++',NULL),('13-123-1234-4','Estudia o que queiras',1986,5,NULL,NULL,'pedagoxía',NULL),('13-123-1234-5','Que hai que facer para ser feliz',1986,4,NULL,NULL,'psicoloxía',NULL),('13-123-1234-6','Todo sobre MySQL',2000,8,NULL,NULL,'MySQL',NULL),('13-123-1234-7','A Biblia de MySQL',2005,9,NULL,NULL,'MySQL',NULL),('13-123-1234-8','Todo o que querías saber sobre as BD',2005,10,NULL,NULL,'Bases de datos',NULL),('13-123-1234-9','Aprende a traballar con Informix',1996,11,NULL,NULL,'Informix',NULL);
/*!40000 ALTER TABLE `titulos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-11-06 10:05:02
