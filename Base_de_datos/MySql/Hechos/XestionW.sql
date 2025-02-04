-- MySQL dump 10.13  Distrib 5.5.9, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: xestion
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
-- Current Database: `xestion`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `xestion` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `xestion`;

--
-- Table structure for table `artigo`
--

DROP TABLE IF EXISTS `artigo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artigo` (
  `ar_id` decimal(8,0) NOT NULL DEFAULT '0',
  `ar_descricion` char(30) NOT NULL DEFAULT '',
  `ar_prezo` decimal(8,2) NOT NULL DEFAULT '0.00',
  `ar_stockmin` int(11) NOT NULL DEFAULT '0',
  `ar_stockmax` int(11) NOT NULL DEFAULT '0',
  `ar_stockpend` int(11) NOT NULL DEFAULT '0',
  `ar_stock` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ar_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artigo`
--

LOCK TABLES `artigo` WRITE;
/*!40000 ALTER TABLE `artigo` DISABLE KEYS */;
INSERT INTO `artigo` VALUES (1,'Cartafol',10.00,10,20,5,10),(2,'Maletín',99.00,5,10,0,10),(3,'Folios 100 u',0.75,2500,5000,1000,2000),(4,'Xogo boligrafo e pluma',123.50,20,30,5,10),(5,'Boligrafo bic 5 u',6.75,30,50,0,50),(6,'Lapis 4 u',4.99,50,150,50,50),(7,'Pluma ouro',1000.00,5,8,2,2),(8,'Folios 500 u',3.20,2500,5000,1500,3000),(9,'Boligrafo pilot 6 u',15.00,25,40,0,14);
/*!40000 ALTER TABLE `artigo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `cl_id` decimal(8,0) NOT NULL DEFAULT '0',
  `cl_nome` char(30) NOT NULL DEFAULT '',
  `cl_enderezo` char(40) NOT NULL DEFAULT '',
  `cl_codpostal` char(5) DEFAULT '',
  `cl_cidade` char(20) NOT NULL DEFAULT '',
  `cl_telefono` char(9) NOT NULL DEFAULT '',
  PRIMARY KEY (`cl_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Alexandre Dumas','Mosqueteiros, 1','15001','A CORUÑA','981123456'),(2,'Jules Verne','Nautilus, 2',NULL,'LUGO','982222222'),(3,'Voltaire','Candido, 3','36000','OURENSE','986123654'),(4,'Honore de Balzac','A comedia humana, 4','08000','MADRID','911234567'),(5,'Gustave Flaubert','Madame Bobary, 5','27000','LUGO','982333333'),(6,'Stendhal','Vermello e negro, 6','27000','LUGO','982444444'),(7,'Victor Hugo','Notre Dame, 7','15001','A CORUÑA','982444444'),(8,'Ildefonso Falcones','La Catedral del Mar, 8',NULL,'PONTEVEDRA','982555555');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linea_ped`
--

DROP TABLE IF EXISTS `linea_ped`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linea_ped` (
  `lp_numped` decimal(6,0) NOT NULL DEFAULT '0',
  `lp_numlinea` decimal(6,0) NOT NULL DEFAULT '0',
  `lp_idartigo` decimal(8,0) NOT NULL DEFAULT '0',
  `lp_canped` decimal(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`lp_numped`,`lp_numlinea`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linea_ped`
--

LOCK TABLES `linea_ped` WRITE;
/*!40000 ALTER TABLE `linea_ped` DISABLE KEYS */;
INSERT INTO `linea_ped` VALUES (1,1,1,10.00),(1,2,7,1.00),(2,1,8,10.00),(2,2,6,5.00),(2,3,9,1.00),(3,1,6,5.00),(3,2,2,1.00),(4,1,2,1.00),(4,2,5,10.00),(4,3,6,20.00),(5,1,8,5.00),(6,1,4,2.00),(6,2,2,2.00),(6,3,8,10.00),(6,4,6,5.00),(7,1,2,20.00),(7,2,5,10.00),(8,1,7,1.00),(9,1,9,2.00),(9,2,5,2.00),(9,3,6,2.00),(10,1,1,1.00),(10,2,8,3.00),(11,1,8,2.00),(11,2,6,1.00),(12,1,3,50.00),(12,2,4,10.00),(12,3,6,5.00),(13,1,2,3.00),(13,2,4,1.00),(14,1,1,10.00),(14,2,3,5.00),(15,1,1,5.00),(15,2,5,4.00),(15,3,6,4.00);
/*!40000 ALTER TABLE `linea_ped` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `pe_numped` decimal(6,0) NOT NULL DEFAULT '0',
  `pe_idcliente` decimal(8,0) NOT NULL DEFAULT '0',
  `pe_dataped` date NOT NULL DEFAULT '0000-00-00',
  `pe_enviado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pe_numped`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,'2000-01-01',1),(2,3,'2000-02-03',1),(3,7,'2000-02-03',1),(4,5,'2000-03-04',1),(5,2,'2000-04-10',1),(6,4,'2000-05-11',1),(7,2,'2001-05-15',1),(8,5,'2001-06-30',0),(9,7,'2001-06-30',0),(10,6,'2001-07-07',0),(11,1,'2001-09-18',1),(12,3,'2002-01-07',1),(13,3,'2002-02-07',0),(14,3,'2002-03-07',0),(15,3,'2002-04-07',1);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-10-10  0:41:32


    1. Obter toda a información dos clientes.
	SELECT * FROM CLIENTE;
	
    2. Obter o nome e teléfono dos clientes.
	SELECT cl_nome, cl_telefono from CLIENTE;
	
    3. Obter os datos dos clientes por orde de cidade e nome de cliente.
	SELECT * from cliente order by cl_cidade, cl_nome;
	
    4. O mesmo que o anterior pero por orde inverso de nome.
	SELECT * from cliente order by cl_cidade, cl_nome DESC;
	
    5. Obter os datos dos clientes de LUGO, ordenados por código postal.
	select * from cliente where cl_cidade = "LUGO" order by cl_codpostal;
	
    6. Obter os datos dos clientes dos que se descoñece o código postal.
	select * from CLIENTE where cl_codpostal is NULL;
	
    7. Obter os artigos cun prezo superior a 150 € e os artigos dos que se teñan menos de 100 unidades.
	select ar_descricion from artigo where ar_prezo > 150 and ar_stock < 100;
	
    8. Obter os pedidos feitos a partir do 1 de Xaneiro de 2001, e o nome do cliente que os fixo.
	select pe_numped, cl_nome, pe_dataped from pedido, cliente where pe_idcliente = cl_id and pe_dataped > "2001-01-01"; 
	
    9. Obter os artigos cun prezo entre 100 e 200 Euros.
	select ar_descricion from artigo where (ar_prezo BETWEEN 100 and 200);
	
    10. Obter os pedidos realizados durante o ano 2001. De cada pedido débese obter o número, data e o nome do cliente que o fixo.
	select pe_numped, pe_dataped, cl_nome from pedido, CLIENTE where pe_idcliente = cl_id and (pe_dataped BETWEEN "2001-01-01" and "2001-12-31");
	
    11. Obter todos os artigos cun prezo de 10, 99 ou 1000 Euros.
	 select ar_descricion from artigo where ar_prezo in ( 10, 99, 1000);
	
    12. Obter todos os clientes con nome que remate en “e”.
	select cl_nome from CLIENTE where cl_nome like "%e";
	
    13. Obter todos os artigos que conteñan a palabra “pluma” na súa descrición.
	select * from artigo where ar_descricion like "%pluma%";
	
    14. Obter todos os artigos cunha descrición que teña a cadea  “li” a partir da terceira posición.
	select * from artigo where ar_descricion like "__li%";
	
    15. Obter os clientes lucenses que realizaran un pedido entre o 1 de Xaneiro de 2001 e o día de hoxe.
	select * from cliente, pedido where cl_id = pe_idcliente and cl_cidade = "LUGO" and pe_dataped > "2001-01-01";
	
    16. Obter os artigos dos que sexa necesario efectuar o pedido e a cantidade que se debe pedir de
	cada un.
	select ar_descricion, ar_stockmax - (ar_stockpend + ar_stock) as  cantidadPorPedir 
	from artigo where ar_stockmin >= (ar_stockpend + ar_stock);
	
    17. Listar todos os artigos que non foran pedidos entre o 1 de Xaneiro de 2002 e o día de hoxe.
	select * from artigo, pedido, linea_ped where lp_numped = pe_numped and ar_id = lp_idartigo and pe_dataped < "2002-01-01";
	
    18. Obter parellas de artigos onde a cantidade en stock do primeiro é 5 veces o stock do segundo.
	
	select a1.ar_descricion, a1.ar_stock, a2.ar_descricion, a2.ar_stock 
	from artigo as a1, artigo as a2 
	where a1.ar_stock  = (a2.ar_stock*5);
	
    19. Obter as parellas de clientes que viven na mesma cidade.
	
	select c1.CL_NOME, c1.CL_CIDADE, c2.CL_NOME, c2.CL_CIDADE FROM CLIENTE AS c1, cliente AS c2 where
	c1.CL_CIDADE = c2.cl_cidade and c1.CL_NOME != c2.cl_nome; 
	
    20. Obter as parellas de clientes que fixeron pedidos na mesma data.
	
	select c1.cl_nome, p1.pe_dataped, c2.cl_nome, p2.pe_dataped from cliente as c1, cliente as c2,
	pedido as p1, pedido as p2 where c1.cl_id = p1.pe_idcliente 
	and c2.cl_id = p2.pe_idcliente and p1.pe_dataped = p2.pe_dataped and c1.CL_NOME != c2.CL_NOME;
	
    21. Obter aqueles artigos dos que se fixeron pedidos en cantidades iguais en diferentes pedidos.
	Evitar as parellas triviais formadas pola repetición dun mesmo pedido. Obter tamén o número e data 
	dos pedidos nos que se produciu esa coincidencia e a cantidade pedida.
	



	
    22. Obter o número de artigos, os prezos máximo e mínimo e medio.
	
	select count(*) as cantArt, max(ar_prezo) as PMaximo, min(ar_prezo) as PMinimo, 
	AVG(ar_prezo) as mediaPrecio 
	from artigo;
	
    23. Obter o número total de artigos dos que hai algunha unidade en stock.
	
	select count(ar_stock) from artigo where ar_stock != 0;
	
    24. Obter, para cada cidade, cantos clientes hai.
	
	select sum(lp_canped * ar_prezo) as TotalPedido, lp_idartigo, ar_id, lp_numped 
	from artigo, linea_ped 
	where ar_id = lp_idartigo and lp_numped = 1;
	
    25. Obter, para cada data, cantos pedidos se fixeron nesa data.
	
	
	
    26. Obter cantos pedidos fixo cada cliente
	
	
    27. Obter o número de liñas de cada pedido.
	
	
    28. Obter para cada liña de pedido, a cantidade pedida, o prezo unitario e o importe da mesma
	
	
    29. Obter o importe total de cada pedido.
	
	
    30. Obter o importe total dos pedidos con máis de dúas liñas de pedido.
	
	
    31. Obter en cantas cidades distintas ten clientes a librería.
	
	
    32. Listar todos os artigos cunha cantidade en stock maior ou igual que a suma de tódalas 
	cantidades pedidas do mesmo artigo.
	
	33. Listar os artigos solicitados en pedidos pendentes de envío, xunto coa suma das cantidades pedidas de cada artigo.
	
	
    34. Obter o mesmo que no exercicio anterior pero mostrando só aqueles casos nos que a suma de cantidades pedidas 
	sexa inferior ao stock actual mais o stock pendente de recibir. Mostrar ademais o “superávit” de cada artigo.
	
	
    35. Obter o día do mes, da semana, mes e ano da data de cada pedido.	
	
	
    36. Se dividimos os clientes segundo a inicial do seu nome en dous grupos, o primeiro deles formado 
	por aqueles clientes cuxo nome comenza por letras entre a A e a J e o segundo polos que teñen un nome que 
	comeza por letras entre a K e a Z, obter o número de pedidos realizados polos clientes de cada grupo.