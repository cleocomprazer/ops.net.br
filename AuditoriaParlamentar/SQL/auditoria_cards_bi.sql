-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: auditoria
-- ------------------------------------------------------
-- Server version	5.7.11-log

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
-- Table structure for table `cards_bi`
--

DROP TABLE IF EXISTS `cards_bi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cards_bi` (
  `idParlamentar` int(11) DEFAULT NULL,
  `nomeParlamentar` varchar(45) DEFAULT NULL,
  `cargoParlamentar` varchar(45) DEFAULT NULL,
  `valorCard` decimal(11,2) DEFAULT NULL,
  `tipoCartao` varchar(45) DEFAULT NULL,
  `urlImagem` varchar(100) DEFAULT NULL,
  `descricaoCartao` varchar(45) DEFAULT NULL,
  `ordemExibicao` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards_bi`
--

LOCK TABLES `cards_bi` WRITE;
/*!40000 ALTER TABLE `cards_bi` DISABLE KEYS */;
INSERT INTO `cards_bi` VALUES 
	(178884,'HILDO ROCHA','Deputado(a)',123144.51,'MAIOR','DEPFEDERAL/178884.jpg','Geral',1),
	(178849,'HISSA ABRAHÃO','Deputado(a)',75500.00,'MAIOR','DEPFEDERAL/178849.jpg','Divulgação Atividade Parlamentar',2),
	(74141,'JOSIAS GOMES','Deputado(a)',7.56,'MENOR','DEPFEDERAL/74141.jpg','Geral',1),
	(178978,'FLAVINHO','Deputado(a)',20.45,'MENOR','DEPFEDERAL/178978.jpg','Divulgação Atividade Parlamentar',2),
	(5012,'RANDOLFE RODRIGUES','Senador(a)',119868.55,'MAIOR','SENADOR/5012.jpg','Geral',3),
	(5322,'ROMÁRIO','Senador(a)',36500.00,'MAIOR','SENADOR/5322.jpg','Divulgação Atividade Parlamentar',4),
	(5100,'HÉLIO JOSÉ','Senador(a)',9588.21,'MENOR','SENADOR/5100.jpg','Geral',3),
	(3823,'BENEDITO DE LIRA','Senador(a)',98.67,'MENOR','SENADOR/3823.jpg','Divulgação Atividade Parlamentar',4);

/*!40000 ALTER TABLE `cards_bi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-29 22:09:45
