CREATE DATABASE  IF NOT EXISTS `testdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `testdb`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: testdb
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `alquiler`
--

DROP TABLE IF EXISTS `alquiler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alquiler` (
  `Alquilerid` int NOT NULL AUTO_INCREMENT,
  `Fecha` date DEFAULT NULL,
  `Tiempo` int DEFAULT NULL,
  `ValorTotal` int DEFAULT NULL,
  `Saldo` int DEFAULT NULL,
  `AbonoInicial` int DEFAULT NULL,
  `Devuelto` tinyint(1) NOT NULL DEFAULT '0',
  `Carroid` int DEFAULT NULL,
  `Clienteid` int DEFAULT NULL,
  PRIMARY KEY (`Alquilerid`),
  KEY `Carroid` (`Carroid`),
  KEY `Clienteid` (`Clienteid`),
  CONSTRAINT `alquiler_ibfk_1` FOREIGN KEY (`Carroid`) REFERENCES `carro` (`Carroid`),
  CONSTRAINT `alquiler_ibfk_2` FOREIGN KEY (`Clienteid`) REFERENCES `cliente` (`Clienteid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alquiler`
--

LOCK TABLES `alquiler` WRITE;
/*!40000 ALTER TABLE `alquiler` DISABLE KEYS */;
INSERT INTO `alquiler` VALUES (1,'2009-01-20',2,1000,10000,100,0,1,1),(2,'2009-02-02',2,1000,10000,100,0,1,1);
/*!40000 ALTER TABLE `alquiler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carro`
--

DROP TABLE IF EXISTS `carro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carro` (
  `Carroid` int NOT NULL AUTO_INCREMENT,
  `Placa` varchar(255) DEFAULT NULL,
  `Marca` varchar(255) DEFAULT NULL,
  `Modelo` varchar(255) DEFAULT NULL,
  `Costo` varchar(255) DEFAULT NULL,
  `Disponible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Carroid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carro`
--

LOCK TABLES `carro` WRITE;
/*!40000 ALTER TABLE `carro` DISABLE KEYS */;
INSERT INTO `carro` VALUES (1,'Prueba1','MarcaPrueba','ModeloPrueba','1',1);
/*!40000 ALTER TABLE `carro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `Clienteid` int NOT NULL AUTO_INCREMENT,
  `Cedula` varchar(255) DEFAULT NULL,
  `Nombre` varchar(255) DEFAULT NULL,
  `Telefono1` varchar(255) DEFAULT NULL,
  `Telefono2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Clienteid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'1234','Daniel','1234','1234');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `Pagosid` int NOT NULL AUTO_INCREMENT,
  `Fecha` date DEFAULT NULL,
  `Valor` int DEFAULT NULL,
  `Alquilerid` int DEFAULT NULL,
  PRIMARY KEY (`Pagosid`),
  KEY `Alquilerid` (`Alquilerid`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`Alquilerid`) REFERENCES `alquiler` (`Alquilerid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,'2009-02-03',100,2),(2,'2009-02-04',200,2),(3,'2009-01-21',200,1),(4,'2009-01-22',500,1);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'testdb'
--

--
-- Dumping routines for database 'testdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-24 17:14:47
