/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bd_tiendatecno
-- ------------------------------------------------------
-- Server version	10.11.11-MariaDB

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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES
(1,'Smartphones'),
(2,'Laptops'),
(3,'Tablets'),
(4,'Accesorios'),
(5,'Redes'),
(6,'Periféricos'),
(7,'Audio'),
(8,'Gaming'),
(9,'Smart Home'),
(10,'Almacenamiento');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES
(1,'Pedro López','pedro@gmail.com','987654321','Av. Central 123'),
(2,'Ana Ruiz','ana@gmail.com','123456789','Calle Norte 456'),
(3,'Hugo Salinas','hugo@gmail.com','321654987','Av. Sur 789'),
(4,'Julia Ríos','julia@gmail.com','456789123','Calle Este 321'),
(5,'Luis Bravo','luis@gmail.com','789123456','Av. Oeste 654'),
(6,'Pedro López 92','user1@mail.com','193374887','Dirección 1'),
(7,'Ana Ruiz 18','user2@mail.com','343672871','Dirección 2'),
(8,'Hugo Salinas 16','user3@mail.com','789410857','Dirección 3'),
(9,'Julia Ríos 45','user4@mail.com','905750717','Dirección 4'),
(10,'Luis Bravo 16','user5@mail.com','104566200','Dirección 5');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_venta`
--

DROP TABLE IF EXISTS `detalles_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_venta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_venta` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_venta` (`id_venta`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalles_venta_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`),
  CONSTRAINT `detalles_venta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_venta`
--

LOCK TABLES `detalles_venta` WRITE;
/*!40000 ALTER TABLE `detalles_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalles_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES
(1,'Laura Torres','laura@tienda.com','111111111','2022-01-10'),
(2,'Carlos Pérez','carlos@tienda.com','222222222','2022-02-15'),
(3,'Diana Méndez','diana@tienda.com','333333333','2022-03-20'),
(4,'Marco Díaz','marco@tienda.com','444444444','2022-04-05'),
(5,'Lucía Vega','lucia@tienda.com','555555555','2023-05-01');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `id_producto` int(11) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES
(1,47),
(2,53),
(3,17),
(4,40),
(5,39),
(6,30),
(7,23),
(8,52),
(9,51),
(10,25),
(11,26),
(12,53),
(13,13),
(14,30),
(15,56),
(16,56),
(17,29),
(18,38),
(19,36),
(20,32),
(21,42),
(22,43),
(23,30),
(24,28),
(25,46),
(26,40),
(27,42),
(28,39),
(29,17),
(30,18),
(31,16),
(32,27),
(33,44),
(34,46),
(35,37),
(36,16),
(37,26),
(38,47),
(39,51),
(40,43),
(41,23),
(42,12),
(43,26),
(44,14),
(45,20),
(46,11),
(47,34),
(48,27),
(49,18),
(50,23),
(51,12),
(52,24),
(53,11),
(54,46),
(55,49),
(56,45),
(57,31),
(58,49),
(59,18),
(60,59),
(61,16),
(62,42),
(63,43),
(64,52),
(65,57),
(66,42),
(67,30),
(68,56),
(69,55),
(70,35),
(71,42),
(72,46),
(73,54),
(74,35),
(75,36),
(76,20),
(77,47),
(78,18),
(79,38),
(80,31),
(81,13),
(82,52),
(83,41),
(84,37),
(85,35),
(86,52),
(87,53),
(88,30),
(89,29),
(90,44),
(91,39),
(92,19),
(93,14),
(94,54),
(95,34),
(96,47),
(97,56),
(98,28),
(99,55),
(100,51);
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodos_pago`
--

DROP TABLE IF EXISTS `metodos_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodos_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodos_pago`
--

LOCK TABLES `metodos_pago` WRITE;
/*!40000 ALTER TABLE `metodos_pago` DISABLE KEYS */;
INSERT INTO `metodos_pago` VALUES
(1,'Efectivo'),
(2,'Tarjeta Débito'),
(3,'Tarjeta Crédito'),
(4,'Transferencia'),
(5,'Pago móvil');
/*!40000 ALTER TABLE `metodos_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES
(1,'Producto 0029','Descripción genérica de producto',467.50,1,10),
(2,'Producto 0362','Descripción genérica de producto',69.88,2,5),
(3,'Producto 0864','Descripción genérica de producto',51.08,5,1),
(4,'Producto 0152','Descripción genérica de producto',309.55,2,2),
(5,'Producto 0255','Descripción genérica de producto',486.66,7,4),
(6,'Producto 0133','Descripción genérica de producto',302.24,2,1),
(7,'Producto 0118','Descripción genérica de producto',200.27,2,9),
(8,'Producto 0747','Descripción genérica de producto',161.39,9,7),
(9,'Producto 0826','Descripción genérica de producto',84.31,9,2),
(10,'Producto 0965','Descripción genérica de producto',297.05,6,4),
(11,'Producto 0216','Descripción genérica de producto',509.18,10,10),
(12,'Producto 0971','Descripción genérica de producto',538.39,10,10),
(13,'Producto 0679','Descripción genérica de producto',373.29,2,1),
(14,'Producto 0546','Descripción genérica de producto',379.59,7,3),
(15,'Producto 0523','Descripción genérica de producto',411.45,1,1),
(16,'Producto 0146','Descripción genérica de producto',332.06,4,3),
(17,'Producto 0915','Descripción genérica de producto',520.32,10,10),
(18,'Producto 0970','Descripción genérica de producto',522.71,9,3),
(19,'Producto 0762','Descripción genérica de producto',93.73,2,5),
(20,'Producto 0975','Descripción genérica de producto',261.55,2,7),
(21,'Producto 0813','Descripción genérica de producto',69.85,8,7),
(22,'Producto 0070','Descripción genérica de producto',222.64,6,6),
(23,'Producto 0169','Descripción genérica de producto',158.11,6,3),
(24,'Producto 0369','Descripción genérica de producto',147.42,9,8),
(25,'Producto 0107','Descripción genérica de producto',207.07,3,4),
(26,'Producto 0775','Descripción genérica de producto',532.62,5,6),
(27,'Producto 0484','Descripción genérica de producto',367.62,8,8),
(28,'Producto 0364','Descripción genérica de producto',402.62,5,1),
(29,'Producto 0912','Descripción genérica de producto',269.51,5,10),
(30,'Producto 0473','Descripción genérica de producto',280.21,9,1),
(31,'Producto 0489','Descripción genérica de producto',232.36,4,7),
(32,'Producto 0374','Descripción genérica de producto',453.04,10,2),
(33,'Producto 0857','Descripción genérica de producto',521.14,2,9),
(34,'Producto 0899','Descripción genérica de producto',504.37,9,6),
(35,'Producto 0976','Descripción genérica de producto',236.56,10,6),
(36,'Producto 0013','Descripción genérica de producto',235.87,9,10),
(37,'Producto 0445','Descripción genérica de producto',193.78,1,7),
(38,'Producto 0886','Descripción genérica de producto',309.55,10,2),
(39,'Producto 0829','Descripción genérica de producto',431.22,4,4),
(40,'Producto 0693','Descripción genérica de producto',283.63,3,9),
(41,'Producto 0629','Descripción genérica de producto',305.12,7,8),
(42,'Producto 0899','Descripción genérica de producto',132.66,2,2),
(43,'Producto 0364','Descripción genérica de producto',236.43,8,8),
(44,'Producto 0338','Descripción genérica de producto',301.49,6,10),
(45,'Producto 0458','Descripción genérica de producto',208.79,3,2),
(46,'Producto 0902','Descripción genérica de producto',144.12,3,7),
(47,'Producto 0333','Descripción genérica de producto',472.53,3,6),
(48,'Producto 0275','Descripción genérica de producto',353.12,3,3),
(49,'Producto 0423','Descripción genérica de producto',296.82,2,6),
(50,'Producto 0947','Descripción genérica de producto',156.06,3,5),
(51,'Producto 0628','Descripción genérica de producto',434.89,10,6),
(52,'Producto 0679','Descripción genérica de producto',476.64,3,6),
(53,'Producto 0212','Descripción genérica de producto',213.15,10,10),
(54,'Producto 0952','Descripción genérica de producto',451.04,2,4),
(55,'Producto 0354','Descripción genérica de producto',390.38,4,7),
(56,'Producto 0306','Descripción genérica de producto',317.23,8,2),
(57,'Producto 0530','Descripción genérica de producto',139.11,4,10),
(58,'Producto 0949','Descripción genérica de producto',468.96,4,2),
(59,'Producto 0904','Descripción genérica de producto',533.99,2,8),
(60,'Producto 0266','Descripción genérica de producto',121.67,10,2),
(61,'Producto 0048','Descripción genérica de producto',430.70,7,1),
(62,'Producto 0122','Descripción genérica de producto',323.91,4,3),
(63,'Producto 0976','Descripción genérica de producto',163.67,3,4),
(64,'Producto 0130','Descripción genérica de producto',350.62,7,3),
(65,'Producto 0527','Descripción genérica de producto',457.38,5,1),
(66,'Producto 0555','Descripción genérica de producto',430.72,2,5),
(67,'Producto 0688','Descripción genérica de producto',137.89,9,6),
(68,'Producto 0245','Descripción genérica de producto',358.26,4,9),
(69,'Producto 0375','Descripción genérica de producto',163.53,1,4),
(70,'Producto 0808','Descripción genérica de producto',520.67,3,6),
(71,'Producto 0043','Descripción genérica de producto',294.19,4,1),
(72,'Producto 0506','Descripción genérica de producto',183.99,9,4),
(73,'Producto 0054','Descripción genérica de producto',230.59,7,2),
(74,'Producto 0712','Descripción genérica de producto',139.31,8,3),
(75,'Producto 0948','Descripción genérica de producto',56.32,3,1),
(76,'Producto 0605','Descripción genérica de producto',484.93,6,1),
(77,'Producto 0703','Descripción genérica de producto',217.65,6,9),
(78,'Producto 0402','Descripción genérica de producto',326.30,6,2),
(79,'Producto 0950','Descripción genérica de producto',240.04,1,2),
(80,'Producto 0385','Descripción genérica de producto',353.05,9,6),
(81,'Producto 0155','Descripción genérica de producto',103.64,1,1),
(82,'Producto 0962','Descripción genérica de producto',403.00,7,1),
(83,'Producto 0551','Descripción genérica de producto',284.76,7,1),
(84,'Producto 0206','Descripción genérica de producto',480.97,7,9),
(85,'Producto 0239','Descripción genérica de producto',355.72,4,9),
(86,'Producto 0299','Descripción genérica de producto',502.90,7,5),
(87,'Producto 0294','Descripción genérica de producto',130.59,10,2),
(88,'Producto 0857','Descripción genérica de producto',506.82,10,3),
(89,'Producto 0208','Descripción genérica de producto',211.51,10,10),
(90,'Producto 0948','Descripción genérica de producto',444.20,1,2),
(91,'Producto 0326','Descripción genérica de producto',179.96,4,9),
(92,'Producto 0152','Descripción genérica de producto',197.29,1,2),
(93,'Producto 0912','Descripción genérica de producto',544.29,3,1),
(94,'Producto 0678','Descripción genérica de producto',159.32,1,7),
(95,'Producto 0959','Descripción genérica de producto',510.65,8,9),
(96,'Producto 0183','Descripción genérica de producto',198.83,10,8),
(97,'Producto 0173','Descripción genérica de producto',287.28,9,9),
(98,'Producto 0635','Descripción genérica de producto',379.91,4,10),
(99,'Producto 0770','Descripción genérica de producto',489.85,1,9),
(100,'Producto 0738','Descripción genérica de producto',194.57,3,3);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES
(1,'TecnoGlobal','Carlos Méndez','111122223'),
(2,'DistribuTech','Ana Flores','222233334'),
(3,'MaxHard','Luis Ortega','333344445'),
(4,'GigaSistemas','Laura Martínez','444455556'),
(5,'RedCorp','David Ríos','555566667'),
(6,'MegaSoft','Silvia Gómez','666677778'),
(7,'SmartDistrib','Mario Vega','777788889'),
(8,'NextTech','Paula Díaz','888899990'),
(9,'UltraComp','Pedro Pérez','999900001'),
(10,'CyberPro','Nora Torres','000011112');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(50) NOT NULL,
  `contrasena_hash` varchar(255) NOT NULL,
  `rol` enum('admin','vendedor','auditor') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES
(1,'admin1','240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9','admin'),
(2,'vendedor1','bc431c22f966ff587d08bec8f58b97425d05c402e54c9052888b3a3ab1b7f7a3','vendedor'),
(3,'auditor1','5b92db4dfb561dc69c949f34d36f5db0f8b30811be3a2949d85c5001279e9b1a','auditor');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `id_metodo_pago` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_empleado` (`id_empleado`),
  KEY `id_metodo_pago` (`id_metodo_pago`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id`),
  CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodos_pago` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-30  0:57:13
