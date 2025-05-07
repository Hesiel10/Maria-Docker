/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bd_auditoria
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
-- Table structure for table `alertas_seguridad`
--

DROP TABLE IF EXISTS `alertas_seguridad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `alertas_seguridad` (
  `id` int(11) NOT NULL,
  `mensaje` text DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alertas_seguridad`
--

LOCK TABLES `alertas_seguridad` WRITE;
/*!40000 ALTER TABLE `alertas_seguridad` DISABLE KEYS */;
INSERT INTO `alertas_seguridad` VALUES
(4,'Cambio de configuración crítica','Advertencia','2025-04-22 10:25:58'),
(5,'Cambio de configuración crítica','Crítica','2025-04-22 09:08:47'),
(6,'Intento de acceso desde IP sospechosa','Alerta','2025-04-22 09:02:27'),
(7,'Cambio de configuración crítica','Advertencia','2025-04-22 10:18:54');
/*!40000 ALTER TABLE `alertas_seguridad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditorias`
--

DROP TABLE IF EXISTS `auditorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditorias` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `accion` varchar(10) DEFAULT NULL,
  `tabla_afectada` varchar(100) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `auditorias_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditorias`
--

LOCK TABLES `auditorias` WRITE;
/*!40000 ALTER TABLE `auditorias` DISABLE KEYS */;
INSERT INTO `auditorias` VALUES
(4,5,'UPDATE','usuarios','2025-04-22 08:46:30'),
(5,10,'DELETE','roles','2025-04-22 09:53:16'),
(6,2,'UPDATE','roles','2025-04-22 09:25:10'),
(7,9,'DELETE','usuarios','2025-04-22 08:41:24'),
(8,10,'INSERT','roles','2025-04-22 10:14:26'),
(9,5,'DELETE','usuarios','2025-04-22 09:32:04'),
(10,7,'UPDATE','roles','2025-04-22 08:25:49'),
(11,6,'INSERT','usuarios','2025-04-22 09:06:54'),
(12,6,'INSERT','usuarios','2025-04-22 08:23:48'),
(13,7,'DELETE','roles','2025-04-22 09:22:42'),
(14,9,'UPDATE','usuarios','2025-04-22 09:47:52'),
(15,5,'UPDATE','usuarios','2025-04-22 10:17:07'),
(16,10,'INSERT','configuraciones','2025-04-22 10:06:41'),
(17,1,'DELETE','configuraciones','2025-04-22 08:14:30'),
(18,4,'UPDATE','usuarios','2025-04-22 08:48:07'),
(19,4,'DELETE','roles','2025-04-22 10:42:11'),
(20,4,'UPDATE','usuarios','2025-04-22 09:04:48'),
(21,9,'INSERT','roles','2025-04-22 09:31:28'),
(22,9,'UPDATE','roles','2025-04-22 10:08:59'),
(23,4,'UPDATE','roles','2025-04-22 10:46:09'),
(24,8,'DELETE','configuraciones','2025-04-22 08:45:19'),
(25,9,'UPDATE','configuraciones','2025-04-22 09:29:41'),
(26,1,'UPDATE','usuarios','2025-04-22 09:32:51'),
(27,3,'UPDATE','usuarios','2025-04-22 09:23:32'),
(28,8,'INSERT','usuarios','2025-04-22 10:13:41');
/*!40000 ALTER TABLE `auditorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuraciones`
--

DROP TABLE IF EXISTS `configuraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuraciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(100) DEFAULT NULL,
  `valor` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuraciones`
--

LOCK TABLES `configuraciones` WRITE;
/*!40000 ALTER TABLE `configuraciones` DISABLE KEYS */;
INSERT INTO `configuraciones` VALUES
(1,'intentos_maximos','5'),
(2,'politica_clave','mínimo 8 caracteres'),
(3,'modo_mantenimiento','false');
/*!40000 ALTER TABLE `configuraciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs_acceso`
--

DROP TABLE IF EXISTS `logs_acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_acceso` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `fecha_acceso` datetime DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `exito` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `logs_acceso_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs_acceso`
--

LOCK TABLES `logs_acceso` WRITE;
/*!40000 ALTER TABLE `logs_acceso` DISABLE KEYS */;
INSERT INTO `logs_acceso` VALUES
(6,9,'2025-04-22 09:10:11','192.168.0.68',1),
(7,3,'2025-04-22 08:54:57','192.168.0.57',1),
(8,5,'2025-04-22 09:18:37','192.168.0.25',1),
(9,3,'2025-04-22 08:17:00','192.168.0.17',0),
(10,7,'2025-04-22 08:47:41','192.168.0.91',1),
(11,3,'2025-04-22 09:04:37','192.168.0.20',1),
(12,8,'2025-04-22 08:52:43','192.168.0.99',0),
(13,3,'2025-04-22 08:15:11','192.168.0.12',0),
(14,9,'2025-04-22 08:23:39','192.168.0.77',1),
(15,5,'2025-04-22 08:52:04','192.168.0.63',0),
(16,5,'2025-04-22 08:27:44','192.168.0.40',1),
(17,7,'2025-04-22 08:45:42','192.168.0.66',1),
(18,3,'2025-04-22 08:14:45','192.168.0.24',1),
(19,5,'2025-04-22 08:25:05','192.168.0.20',0),
(20,9,'2025-04-22 09:18:00','192.168.0.17',0),
(21,6,'2025-04-22 08:58:41','192.168.0.89',1),
(22,10,'2025-04-22 09:04:28','192.168.0.3',1),
(23,10,'2025-04-22 08:29:21','192.168.0.90',1),
(24,5,'2025-04-22 08:14:44','192.168.0.39',1),
(25,9,'2025-04-22 08:12:38','192.168.0.14',0),
(26,7,'2025-04-22 08:55:46','192.168.0.37',1),
(27,10,'2025-04-22 08:25:11','192.168.0.68',1),
(28,4,'2025-04-22 08:39:09','192.168.0.20',1),
(29,3,'2025-04-22 08:57:14','192.168.0.59',1),
(30,7,'2025-04-22 08:46:11','192.168.0.86',1);
/*!40000 ALTER TABLE `logs_acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulos`
--

DROP TABLE IF EXISTS `modulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulos` (
  `id` int(11) NOT NULL,
  `nombre_modulo` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulos`
--

LOCK TABLES `modulos` WRITE;
/*!40000 ALTER TABLE `modulos` DISABLE KEYS */;
INSERT INTO `modulos` VALUES
(1,'Usuarios','Gestión de usuarios'),
(2,'Auditoría','Registro de eventos'),
(3,'Seguridad','Configuraciones sensibles');
/*!40000 ALTER TABLE `modulos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `nombre_permiso` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES
(1,'Ver Usuarios'),
(2,'Editar Usuarios'),
(3,'Ver Auditoría'),
(4,'Acceder Módulo Seguridad');
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_modulo`
--

DROP TABLE IF EXISTS `rol_modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_modulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_id` int(11) DEFAULT NULL,
  `modulo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rol_id` (`rol_id`),
  KEY `modulo_id` (`modulo_id`),
  CONSTRAINT `rol_modulo_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `rol_modulo_ibfk_2` FOREIGN KEY (`modulo_id`) REFERENCES `modulos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_modulo`
--

LOCK TABLES `rol_modulo` WRITE;
/*!40000 ALTER TABLE `rol_modulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol_modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_permiso`
--

DROP TABLE IF EXISTS `rol_permiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_permiso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_id` int(11) DEFAULT NULL,
  `permiso_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rol_id` (`rol_id`),
  KEY `permiso_id` (`permiso_id`),
  CONSTRAINT `rol_permiso_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `rol_permiso_ibfk_2` FOREIGN KEY (`permiso_id`) REFERENCES `permisos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_permiso`
--

LOCK TABLES `rol_permiso` WRITE;
/*!40000 ALTER TABLE `rol_permiso` DISABLE KEYS */;
INSERT INTO `rol_permiso` VALUES
(1,2,3),
(2,1,1),
(3,1,2),
(4,1,3),
(5,1,4);
/*!40000 ALTER TABLE `rol_permiso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre_rol` varchar(50) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(1,'Administrador','Acceso total al sistema'),
(2,'Auditor','Acceso a reportes y registros de auditoría'),
(3,'Usuario','Acceso limitado a módulos permitidos');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `contrasena` varchar(100) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rol_id` (`rol_id`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES
(1,'Ana Gómez','agomez','54a430efe3e41205d903d0f8d4c97f67755a4985d5a519d1094a994b761153b3',1,1),
(2,'Luis Pérez','lperez','5bfa336b6b4793326568b16c59334498bc8c5632436c4fede986c615d4d55e81',2,1),
(3,'Marta Ríos','mrios','fd07223559a8bde64b28c277018029a756ca64097c9612dad2670015c296761c',3,1),
(4,'Carlos Ruiz','cruiz','660246ec6f6b80ba1b135d06e73dc1f1f07523e2de6abfcd6b108b095399a33b',1,1),
(5,'Elena Salas','esalas','4efa64629b15ca429907c8e09d70b6d177bd64bc7cc48d0b86d62d1b970cb905',2,0),
(6,'Pedro Tórrez','ptorrez','85095cea90b22815b5980a0fda65a8488ca08288c26c29fa37f89e9ef8ea09e5',3,1),
(7,'Laura Díaz','ldiaz','8e6d03f9dc41b357a36569f7b4069968e0534bced9cabe5b042a5d1c86f0fc9a',3,1),
(8,'Sofía Martínez','smartinez','817e74c4aef4ccee20765762132d2984db9270ee8de3b4e14f20f5893a855f84',1,1),
(9,'Jorge López','jlopez','0749ba4b22ae083fd559f9505891ff9b00fd81533903857feaa11149c6c50912',2,1),
(10,'Andrés Quispe','aquispe','092396a13faeba2cddc81c5649fe193ddaf6bba1a57cbbe0281e9afa3f63fb07',3,1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-25 10:35:30
