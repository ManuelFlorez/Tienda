-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: tienda
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abono`
--

DROP TABLE IF EXISTS `abono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `abono` (
  `abon_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `clie_id` bigint(20) NOT NULL,
  `abon_monto` double NOT NULL,
  `abon_fecha_registro` datetime NOT NULL,
  `abon_registrado_por` varchar(200) NOT NULL,
  PRIMARY KEY (`abon_id`),
  KEY `fk_abono_cliente1_idx` (`clie_id`),
  CONSTRAINT `fk_abono_cliente1` FOREIGN KEY (`clie_id`) REFERENCES `cliente` (`clie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abono`
--

LOCK TABLES `abono` WRITE;
/*!40000 ALTER TABLE `abono` DISABLE KEYS */;
INSERT INTO `abono` VALUES (1,2,10000,'2019-06-10 19:42:39','TIENDA');
/*!40000 ALTER TABLE `abono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cliente` (
  `clie_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `clie_nombre` varchar(200) NOT NULL,
  `clie_apellido` varchar(200) NOT NULL,
  `clie_cedula` varchar(200) NOT NULL,
  `clie_email` varchar(200) NOT NULL,
  `clie_celular` varchar(20) NOT NULL,
  `clie_fecha_registro` datetime NOT NULL,
  `clie_registrado_por` varchar(200) NOT NULL,
  PRIMARY KEY (`clie_id`),
  UNIQUE KEY `email_UNIQUE` (`clie_email`),
  UNIQUE KEY `cedula_UNIQUE` (`clie_cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Manuel','Florez','1090471388','manuelflorezww@gmail.com','3043742691','2019-05-04 09:16:11','TIENDA'),(2,'Jairo','Florez','2090471389','jairoflorezww@gmail.com','3053742691','2019-05-04 09:16:11','TIENDA'),(3,'Pedro','Perez','1090471392','pedritoperez@gmail.com','3043742694','2019-05-04 09:16:11','TIENDA'),(4,'Oscar','Peñaranda','1090471300','oscar@gmail.com','3043742619','2019-06-07 00:16:09','TIENDA'),(5,'Jose','Dismar','1090473555','dismar@gmail.com','3185937377','2019-06-07 11:27:46','TIENDA');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `compra` (
  `comp_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comp_total` double NOT NULL,
  `comp_fecha_registro` datetime NOT NULL,
  `comp_registrado_por` varchar(200) NOT NULL,
  `prov_id` bigint(20) NOT NULL,
  PRIMARY KEY (`comp_id`),
  KEY `fk_compra_proveedor1_idx` (`prov_id`),
  CONSTRAINT `fk_compra_proveedor1` FOREIGN KEY (`prov_id`) REFERENCES `proveedor` (`prov_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,11300,'2019-05-05 12:03:23','TIENDA',1);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credito`
--

DROP TABLE IF EXISTS `credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `credito` (
  `cred_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cred_monto_limite` double NOT NULL,
  `cred_registrado_por` varchar(200) NOT NULL,
  `cred_fecha_registro` datetime DEFAULT NULL,
  `clie_id` bigint(20) NOT NULL,
  PRIMARY KEY (`cred_id`),
  KEY `fk_credito_cliente1_idx` (`clie_id`),
  CONSTRAINT `fk_credito_cliente1` FOREIGN KEY (`clie_id`) REFERENCES `cliente` (`clie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credito`
--

LOCK TABLES `credito` WRITE;
/*!40000 ALTER TABLE `credito` DISABLE KEYS */;
INSERT INTO `credito` VALUES (1,50000,'',NULL,2);
/*!40000 ALTER TABLE `credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemcompra`
--

DROP TABLE IF EXISTS `itemcompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `itemcompra` (
  `itco_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `itco_cantidad` bigint(20) NOT NULL,
  `itco_subtotal` double NOT NULL,
  `comp_id` bigint(20) NOT NULL,
  `prod_id` bigint(20) NOT NULL,
  PRIMARY KEY (`itco_id`),
  KEY `fk_ItemCompra_compra1_idx` (`comp_id`),
  KEY `fk_ItemCompra_producto1_idx` (`prod_id`),
  CONSTRAINT `fk_ItemCompra_compra1` FOREIGN KEY (`comp_id`) REFERENCES `compra` (`comp_id`),
  CONSTRAINT `fk_ItemCompra_producto1` FOREIGN KEY (`prod_id`) REFERENCES `producto` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemcompra`
--

LOCK TABLES `itemcompra` WRITE;
/*!40000 ALTER TABLE `itemcompra` DISABLE KEYS */;
INSERT INTO `itemcompra` VALUES (1,1,2800,1,1),(2,1,8500,1,3);
/*!40000 ALTER TABLE `itemcompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemventa`
--

DROP TABLE IF EXISTS `itemventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `itemventa` (
  `itve_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `itve_cantidad` bigint(20) NOT NULL,
  `itve_subtotal` double NOT NULL,
  `prod_id` bigint(20) NOT NULL,
  `vent_id` bigint(20) NOT NULL,
  PRIMARY KEY (`itve_id`),
  KEY `fk_itemventa_producto_idx` (`prod_id`),
  KEY `fk_itemventa_venta1_idx` (`vent_id`),
  CONSTRAINT `fk_itemventa_producto` FOREIGN KEY (`prod_id`) REFERENCES `producto` (`prod_id`),
  CONSTRAINT `fk_itemventa_venta1` FOREIGN KEY (`vent_id`) REFERENCES `venta` (`vent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemventa`
--

LOCK TABLES `itemventa` WRITE;
/*!40000 ALTER TABLE `itemventa` DISABLE KEYS */;
/*!40000 ALTER TABLE `itemventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `producto` (
  `prod_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prod_nombre` varchar(200) COLLATE utf8_bin NOT NULL,
  `prod_descripcion` varchar(200) COLLATE utf8_bin NOT NULL,
  `prod_img` varchar(700) COLLATE utf8_bin DEFAULT NULL,
  `prod_precio_compra` double NOT NULL,
  `prod_precio_venta` double NOT NULL,
  `prod_fecha_vencimiento` date NOT NULL,
  `prod_unidades_disponible` int(11) NOT NULL,
  `prod_fecha_registro` datetime NOT NULL,
  `prod_registrado_por` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Arina Pan','Arina Pan kilo',NULL,2800,3300,'2020-05-05',24,'2019-05-05 12:03:23','TIENDA'),(2,'Huevo','Huevo unidad',NULL,270,350,'2020-05-05',180,'2019-05-05 12:03:23','TIENDA'),(3,'Carton de huevos','Carton de huevos',NULL,8500,9000,'2020-05-05',6,'2019-05-05 12:03:23','TIENDA'),(4,'Arroz','Arroz Kilo',NULL,2600,3000,'2020-05-05',24,'2019-05-05 12:03:23','TIENDA'),(5,'Azúcar','Azúcar Kilo',NULL,1800,2000,'2050-10-04',50,'2019-06-06 23:06:03','TIENDA');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proveedor` (
  `prov_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prov_nombre` varchar(200) COLLATE utf8_bin NOT NULL,
  `prov_apellido` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `prov_cedula` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `prov_telefono` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `prov_nombre_empresa` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `prov_email` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `prov_fecha_registro` datetime NOT NULL,
  `prov_registrado_por` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`prov_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Abastos','Abastos','0','0','Abastos','','2019-05-05 12:03:23','TIENDA'),(2,'Patricia','Hernandez','1090471359','3003742691','Nestle','patriciaher@gmail.com','2019-05-05 12:55:40','TIENDA'),(3,'Martha','Velasquez','1090493177','3033476219','CocaCola','martha@gmail.com','2019-06-07 00:34:33','TIENDA'),(4,'Juan','Rozo','1090488888','3203742691','Leche la Mejor','juan@gmail.com','2019-06-07 00:40:08','TIENDA');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `venta` (
  `vent_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vent_total` double NOT NULL,
  `vent_fecha_registro` datetime NOT NULL,
  `vent_registrado_por` varchar(200) NOT NULL,
  `clie_id` bigint(20) NOT NULL,
  PRIMARY KEY (`vent_id`),
  KEY `fk_venta_cliente1_idx` (`clie_id`),
  CONSTRAINT `fk_venta_cliente1` FOREIGN KEY (`clie_id`) REFERENCES `cliente` (`clie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-12 23:58:30
