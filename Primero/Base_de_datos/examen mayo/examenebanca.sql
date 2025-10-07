DROP DATABASE IF EXISTS `examenebanca`;
CREATE DATABASE `examenebanca`;

USE `examenebanca`;

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `codigo_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `dni` int(7) NOT NULL,
  `nome` char(20) NOT NULL,
  `apelido1` char(20) NOT NULL,
  `apelido2` char(20) DEFAULT NULL,
  `direcion` char(50) NOT NULL,
  `rexion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo_cliente`),
  UNIQUE KEY `idni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

LOCK TABLES `clientes` WRITE;
INSERT INTO `clientes` VALUES (1,11111111,'jcarlos','baldo',NULL,'d1','aragon'),(2,22222222,'pilar','rodri',NULL,'d2','aragon'),(3,33333333,'pablo','babes',NULL,'d3','pais vasco'),(4,44444444,'javi','sonas',NULL,'d4','pais vasco'),(5,55555555,'angel','alva',NULL,'d5','pais vasco'),(6,66666666,'pilar','bueso','perez','d6','aragon'),(7,77777777,'alberto','perez','dominguez','d7','aragon'),(8,88888888,'antonio','martinez','barea','d8','extremadura'),(9,99999999,'maria jesus','longares','hernandez','d9','extremadura'),(10,10101010,'ana','guillen','lopera','d10','aragon'),(11,12121212,'fernando','montero','iglesias','d11','aragon'),(12,13131313,'silvia','lopez','escartin','d12','aragon'),(13,14141414,'raquel','beltran','acebes','d13','aragon'),(14,15151515,'mario','caba a','encinas','d14','aragon'),(15,16161616,'manuel','falceto','carrera','d15','aragon'),(16,17171717,'jordi','eulalia','perales','d16','aragon'),(17,18181818,'marc','garriga','higuera','d17','aragon'),(18,19191919,'rafael','hueso','iba ez','d18','aragon'),(19,20202020,'fran','granada','mariategui','d19','aragon'),(20,21212121,'porfirio','gambo','perez','d20','aragon');
UNLOCK TABLES;

DROP TABLE IF EXISTS `contas`;
CREATE TABLE `contas` (
  `data_creacion` date NOT NULL,
  `saldo` int(11) NOT NULL DEFAULT '0',
  `cod_conta` int(11) NOT NULL,
  `cod_cliente` int(11) NOT NULL,
  PRIMARY KEY (`cod_conta`),
  KEY `ccl` (`cod_cliente`),
  KEY `dc` (`data_creacion`,`cod_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `contas` WRITE;
INSERT INTO `contas` VALUES ('2012-01-01',30000,0,6),('2010-01-01',100,1,1),('2010-02-01',100,2,2),('2009-02-13',4400,3,3),('2011-12-13',-40,4,4),('2011-06-23',20040,5,5),('2012-01-01',30000,6,6),('2012-02-01',3300,7,7),('2012-02-03',0,8,8),('2012-02-03',41990,9,9),('2012-12-13',4718,10,10),('2012-12-23',47622,11,10),('2012-12-23',45452,12,9),('2012-11-03',36414,13,3),('2008-05-03',32799,14,15),('2008-05-03',45464,15,4),('2010-09-12',18632,16,4),('2012-02-02',44837,17,17),('2009-02-02',34210,18,15),('2009-04-10',46461,19,5),('2009-07-13',24873,20,14),('2010-01-23',4435,21,5),('2010-03-29',10415,22,3),('2011-02-24',7971,23,6),('2011-02-25',7726,24,15),('2012-02-25',-25061,25,2),('2012-12-15',-6621,26,5),('2012-11-09',-255,27,3),('2011-11-09',-4525,28,19),('2011-04-11',-3777,29,4),('2011-06-05',-4890,30,2),('2011-06-17',-3917,31,9),('2010-06-17',-423,32,19),('2010-08-17',-4263,33,10),('2009-08-17',-873,34,4),('2009-12-01',-3339,35,15);
UNLOCK TABLES;

DROP TABLE IF EXISTS `movementos`;
CREATE TABLE `movementos` (
  `id_movemento` int(11) NOT NULL AUTO_INCREMENT,
  `datahora` date NOT NULL,
  `cantidade` double NOT NULL,
  `dni` int(11) NOT NULL,
  `cod_conta` int(11) NOT NULL,
  PRIMARY KEY (`id_movemento`),
  KEY `cconta` (`cod_conta`),
  KEY `fk1_dni` (`dni`),
  KEY `fk2_cconta` (`cod_conta`),
  CONSTRAINT `fk2_cconta` FOREIGN KEY (`cod_conta`) REFERENCES `contas` (`cod_conta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk1_dni` FOREIGN KEY (`dni`) REFERENCES `clientes` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=latin1;

LOCK TABLES `movementos` WRITE;
INSERT INTO `movementos` VALUES (37,'2011-04-18',64028,11111111,1),(38,'2011-04-18',60528,44444444,4),(39,'2011-04-18',13979,44444444,4),(40,'2011-04-18',26467,44444444,4),(41,'2011-04-18',6906,22222222,2),(42,'2011-04-18',47477,44444444,4),(43,'2011-04-18',15490,33333333,3),(44,'2011-04-18',57323,22222222,2),(45,'2011-04-18',67620,33333333,3),(46,'2011-04-18',61864,33333333,3),(47,'2011-04-18',35142,11111111,1),(48,'2011-04-18',87009,11111111,1),(49,'2011-04-18',11884,22222222,2),(50,'2011-04-18',1480,11111111,1),(51,'2011-04-18',75530,22222222,2),(52,'2011-04-18',32424,44444444,4),(53,'2011-04-18',86077,44444444,4),(54,'2011-04-18',96523,33333333,3),(55,'2011-04-18',35796,22222222,2),(56,'2011-04-18',99784,33333333,3),(57,'2010-05-04',-583,55555555,14),(78,'2009-03-25',-3327,55555555,33),(79,'2009-03-21',471,55555555,3),(80,'2010-12-05',2881,66666666,13),(81,'2011-01-09',2784,66666666,13),(82,'2010-10-11',4939,66666666,9),(83,'2010-06-01',4972,77777777,31),(84,'2009-12-22',4450,77777777,31),(85,'2009-03-07',1763,88888888,11),(86,'2009-08-22',902,88888888,34),(87,'2010-05-15',4605,88888888,16),(88,'2009-08-09',4066,88888888,3),(89,'2011-02-08',994,99999999,23),(90,'2009-03-19',4733,10101010,12),(91,'2008-12-26',1827,10101010,6),(92,'2009-01-25',-3397,10101010,29),(93,'2010-10-29',-2440,10101010,28),(94,'2009-08-31',-3496,11111111,21),(95,'2008-11-20',-3826,11111111,2),(96,'2011-01-26',-1699,12121212,12),(97,'2009-06-07',-2685,12121212,18),(98,'2011-03-03',-3959,13131313,25),(99,'2010-11-06',-4243,13131313,22),(100,'2009-07-01',-2586,14141414,17),(101,'2011-05-24',-2351,15151515,12),(102,'2010-06-16',-3289,15151515,9),(103,'2010-06-13',-4672,16161616,22),(104,'2010-05-07',-4996,16161616,29),(105,'2010-09-14',-3550,17171717,27),(107,'2009-08-07',-1928,21212121,33),(108,'2013-03-08',-1922,15151515,33),(109,'2013-03-01',-1773,15151515,29),(110,'2011-09-01',-4997,15151515,24),(111,'2012-10-01',-1906,14141414,14),(112,'2014-01-02',-2566,13131313,24),(113,'2014-01-23',-3821,13131313,31),(114,'2011-12-07',-1447,13131313,30),(115,'2012-07-17',-2631,99999999,13),(116,'2012-02-29',-1446,99999999,21),(117,'2011-10-21',-4691,99999999,8),(118,'2012-06-23',-1273,77777777,2),(119,'2013-03-14',-217,77777777,8),(120,'2011-07-25',-2981,33333333,27),(121,'2011-11-23',-2669,11111111,4),(122,'2014-02-12',-3086,11111111,3);
UNLOCK TABLES;

DROP TABLE IF EXISTS `ten`;
CREATE TABLE `ten` (
  `dni` int(7) NOT NULL,
  `cod_conta` int(11) NOT NULL,
  PRIMARY KEY (`dni`,`cod_conta`),
  KEY `dd` (`dni`),
  KEY `fk2_tcconta` (`cod_conta`),
  CONSTRAINT `fk2_tcconta` FOREIGN KEY (`cod_conta`) REFERENCES `contas` (`cod_conta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk1_tdni` FOREIGN KEY (`dni`) REFERENCES `clientes` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `ten` WRITE;
UNLOCK TABLES;

CREATE TABLE IF NOT EXISTS audit_examen
(
id_movemento INT NOT NULL,
usuario VARCHAR(20) NOT NULL,
fecha_insercion DATE NOT NULL,
cuenta INT NOT NULL,
cliente_dni INT NOT NULL,
cantidade DOUBLE NOT NULL,
PRIMARY KEY(id_movemento)
);
