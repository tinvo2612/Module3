-- MySQL dump 10.13  Distrib 9.2.0, for macos15.2 (arm64)
--
-- Host: localhost    Database: QuanLyDiemThi
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `BangDiem`
--

DROP TABLE IF EXISTS `BangDiem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BangDiem` (
  `MaHS` varchar(20) NOT NULL,
  `MaMH` varchar(50) NOT NULL,
  `DiemThi` int DEFAULT NULL,
  `NgayKT` datetime DEFAULT NULL,
  PRIMARY KEY (`MaHS`,`MaMH`),
  KEY `fk_BangDiem` (`MaMH`),
  CONSTRAINT `fk_BangDiem` FOREIGN KEY (`MaMH`) REFERENCES `MonHoc` (`MaMH`),
  CONSTRAINT `fk_HocSinh` FOREIGN KEY (`MaHS`) REFERENCES `HocSinh` (`MaHS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BangDiem`
--

LOCK TABLES `BangDiem` WRITE;
/*!40000 ALTER TABLE `BangDiem` DISABLE KEYS */;
/*!40000 ALTER TABLE `BangDiem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GiaoVien`
--

DROP TABLE IF EXISTS `GiaoVien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GiaoVien` (
  `MaGV` varchar(20) NOT NULL,
  `TenGV` varchar(50) DEFAULT NULL,
  `Sdt` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`MaGV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GiaoVien`
--

LOCK TABLES `GiaoVien` WRITE;
/*!40000 ALTER TABLE `GiaoVien` DISABLE KEYS */;
/*!40000 ALTER TABLE `GiaoVien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HocSinh`
--

DROP TABLE IF EXISTS `HocSinh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HocSinh` (
  `MaHS` varchar(20) NOT NULL,
  `TenHS` varchar(50) NOT NULL,
  `NgaySinh` datetime DEFAULT NULL,
  `Lop` varchar(20) DEFAULT NULL,
  `GT` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MaHS`),
  UNIQUE KEY `MaHS` (`MaHS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HocSinh`
--

LOCK TABLES `HocSinh` WRITE;
/*!40000 ALTER TABLE `HocSinh` DISABLE KEYS */;
/*!40000 ALTER TABLE `HocSinh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MonHoc`
--

DROP TABLE IF EXISTS `MonHoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MonHoc` (
  `MaMH` varchar(20) NOT NULL,
  `TenMH` varchar(50) DEFAULT NULL,
  `MaGV` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MaMH`),
  KEY `fk_MonHoc_GiaoVien` (`MaGV`),
  CONSTRAINT `fk_MonHoc_GiaoVien` FOREIGN KEY (`MaGV`) REFERENCES `GiaoVien` (`MaGV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MonHoc`
--

LOCK TABLES `MonHoc` WRITE;
/*!40000 ALTER TABLE `MonHoc` DISABLE KEYS */;
/*!40000 ALTER TABLE `MonHoc` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-18 11:43:16
