-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Segur
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Cliente`
--

DROP TABLE IF EXISTS `Cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cliente` (
  `CNPJ` varchar(22) NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `Endereco` varchar(255) NOT NULL,
  PRIMARY KEY (`CNPJ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cliente`
--

LOCK TABLES `Cliente` WRITE;
/*!40000 ALTER TABLE `Cliente` DISABLE KEYS */;
INSERT INTO `Cliente` VALUES ('00.123.445.685/0001-22','89fm','Av. Paulista'),('11.987.654.321/0001-33','Supermercado Extra','Av. Interlagos'),('11.999.888.777/0001-66','Supermercado Extra','Av. Cupce');
/*!40000 ALTER TABLE `Cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Escala`
--

DROP TABLE IF EXISTS `Escala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Escala` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Data` datetime NOT NULL,
  `SegMatricula` int(11) NOT NULL,
  `MatNumero` int(11) NOT NULL,
  `CliCNPJ` varchar(22) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `SegMatricula` (`SegMatricula`),
  KEY `MatNumero` (`MatNumero`),
  KEY `CliCNPJ` (`CliCNPJ`),
  CONSTRAINT `Escala_ibfk_1` FOREIGN KEY (`SegMatricula`) REFERENCES `Seguranca` (`Matricula`),
  CONSTRAINT `Escala_ibfk_2` FOREIGN KEY (`MatNumero`) REFERENCES `Materiais` (`Numero`),
  CONSTRAINT `Escala_ibfk_3` FOREIGN KEY (`CliCNPJ`) REFERENCES `Cliente` (`CNPJ`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Escala`
--

LOCK TABLES `Escala` WRITE;
/*!40000 ALTER TABLE `Escala` DISABLE KEYS */;
INSERT INTO `Escala` VALUES (3,'0000-00-00 00:00:00',5,2,'00.123.445.685/0001-22'),(4,'0000-00-00 00:00:00',6,1,'11.987.654.321/0001-33');
/*!40000 ALTER TABLE `Escala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Materiais`
--

DROP TABLE IF EXISTS `Materiais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Materiais` (
  `Numero` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(255) NOT NULL,
  `Marca` varchar(255) NOT NULL,
  PRIMARY KEY (`Numero`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Materiais`
--

LOCK TABLES `Materiais` WRITE;
/*!40000 ALTER TABLE `Materiais` DISABLE KEYS */;
INSERT INTO `Materiais` VALUES (1,'Lanterna','Shing Ling'),(2,'Cassetete','Arrebenta');
/*!40000 ALTER TABLE `Materiais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Seguranca`
--

DROP TABLE IF EXISTS `Seguranca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Seguranca` (
  `Matricula` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) NOT NULL,
  `Funcao` varchar(255) NOT NULL DEFAULT 'Recem contratado',
  `Salario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Seguranca`
--

LOCK TABLES `Seguranca` WRITE;
/*!40000 ALTER TABLE `Seguranca` DISABLE KEYS */;
INSERT INTO `Seguranca` VALUES (5,'Jonny Ramone','Segurana',2500.00),(6,'Serji Tankian','Segurana',2000.00),(7,'Corey Taylor','Recem contratado',973.00);
/*!40000 ALTER TABLE `Seguranca` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-09  0:50:37
