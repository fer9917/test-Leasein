-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.24-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for testdb
CREATE DATABASE IF NOT EXISTS `testdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `testdb`;

-- Dumping structure for table testdb.asesor
CREATE TABLE IF NOT EXISTS `asesor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `celular` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `celular` (`celular`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table testdb.asesor: ~5 rows (approximately)
INSERT INTO `asesor` (`id`, `nombre`, `correo`, `celular`) VALUES
	(1, 'MAURICIO', 'mauricio@leasein.pe', '999888777'),
	(2, 'DIEGO', 'diego@leasein.pe', '999777666'),
	(3, 'ALEJANDRO', 'alejandro@leasein.pe', '999666555'),
	(4, 'ERIKA', 'erika@leasein.pe', '999555444'),
	(5, 'NICOLE', 'nicole@leasein.pe', '999444333');

-- Dumping structure for table testdb.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asesor_id` int(11) DEFAULT NULL,
  `empresa` varchar(20) NOT NULL,
  `sector` varchar(50) NOT NULL,
  `tamano` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_asesor` (`asesor_id`),
  CONSTRAINT `FK_asesor` FOREIGN KEY (`asesor_id`) REFERENCES `asesor` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table testdb.clientes: ~19 rows (approximately)
INSERT INTO `clientes` (`id`, `asesor_id`, `empresa`, `sector`, `tamano`) VALUES
	(1, 1, 'EMPRESA 1', 'FINANCIERO', 'CORPORATIVO'),
	(2, 2, 'EMPRESA 2', 'FINANCIERO', 'MEDIANA'),
	(3, 2, 'EMPRESA 3', 'FINANCIERO', 'GRANDE'),
	(4, NULL, 'EMPRESA 4', 'FINANCIERO', 'PEQUEÑA'),
	(5, NULL, 'EMPRESA 5', 'FINANCIERO', 'MEDIANA'),
	(6, NULL, 'EMPRESA 6', 'SERVICIOS EMPRESARIALES', 'PEQUEÑA'),
	(7, NULL, 'EMPRESA 7', 'SERVICIOS EMPRESARIALES', 'MEDIANA'),
	(8, NULL, 'EMPRESA 8', 'TECNOLOGÍA', 'GRANDE'),
	(9, NULL, 'EMPRESA 9', 'TECNOLOGÍA', 'MEDIANA'),
	(10, NULL, 'EMPRESA 10', 'TECNOLOGÍA', 'MEDIANA'),
	(11, NULL, 'EMPRESA 11', 'TECNOLOGÍA', 'PEQUEÑA'),
	(12, NULL, 'EMPRESA 12', 'TECNOLOGÍA', 'MEDIANA'),
	(13, NULL, 'EMPRESA 13', 'TECNOLOGÍA', 'GRANDE'),
	(14, NULL, 'EMPRESA 14', 'CONSTRUCCIÓN', 'PEQUEÑA'),
	(15, NULL, 'EMPRESA 15', 'CONSTRUCCIÓN', 'CORPORATIVO'),
	(16, NULL, 'EMPRESA 16', 'CONSTRUCCIÓN', 'PEQUEÑA'),
	(17, NULL, 'EMPRESA 17', 'CONSTRUCCIÓN', 'GRANDE'),
	(18, NULL, 'EMPRESA 18', 'LOGÍSTICA', 'PEQUEÑA'),
	(19, NULL, 'EMPRESA 19', 'LOGÍSTICA', 'GRANDE');

-- Dumping structure for view testdb.clientes_activos
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `clientes_activos` (
	`cliente` VARCHAR(20) NULL COLLATE 'utf8mb4_general_ci',
	`sector` VARCHAR(50) NULL COLLATE 'utf8mb4_general_ci',
	`tamano` VARCHAR(20) NULL COLLATE 'utf8mb4_general_ci',
	`codigo` VARCHAR(15) NOT NULL COLLATE 'utf8mb4_general_ci'
) ENGINE=MyISAM;

-- Dumping structure for table testdb.unidades_de_alquiler
CREATE TABLE IF NOT EXISTS `unidades_de_alquiler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) DEFAULT NULL,
  `codigo` varchar(15) NOT NULL,
  `tipo_de_ua` varchar(10) NOT NULL,
  `marca` varchar(15) NOT NULL,
  `procesador` varchar(10) NOT NULL,
  `generacion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_clientes` (`id_cliente`),
  CONSTRAINT `FK_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table testdb.unidades_de_alquiler: ~200 rows (approximately)
INSERT INTO `unidades_de_alquiler` (`id`, `id_cliente`, `codigo`, `tipo_de_ua`, `marca`, `procesador`, `generacion`) VALUES
	(1, 1, 'LAP-00001', 'LAPTOP', 'HP', 'CORE I7', 8),
	(2, 2, 'LAP-00002', 'LAPTOP', 'HP', 'CORE I7', 8),
	(3, 1, 'LAP-00003', 'LAPTOP', 'HP', 'CORE I7', 8),
	(4, 3, 'LAP-00004', 'LAPTOP', 'HP', 'CORE I7', 8),
	(5, NULL, 'LAP-00005', 'LAPTOP', 'HP', 'CORE I7', 8),
	(6, NULL, 'LAP-00006', 'LAPTOP', 'HP', 'CORE I7', 8),
	(7, NULL, 'LAP-00007', 'LAPTOP', 'HP', 'CORE I7', 8),
	(8, NULL, 'LAP-00008', 'LAPTOP', 'HP', 'CORE I7', 8),
	(9, NULL, 'LAP-00009', 'LAPTOP', 'HP', 'CORE I7', 8),
	(10, NULL, 'LAP-00010', 'LAPTOP', 'HP', 'CORE I7', 8),
	(11, NULL, 'LAP-00011', 'LAPTOP', 'LENOVO', 'CORE I3', 8),
	(12, NULL, 'LAP-00012', 'LAPTOP', 'LENOVO', 'CORE I3', 8),
	(13, NULL, 'LAP-00013', 'LAPTOP', 'LENOVO', 'CORE I3', 8),
	(14, NULL, 'LAP-00014', 'LAPTOP', 'LENOVO', 'CORE I3', 8),
	(15, NULL, 'LAP-00015', 'LAPTOP', 'LENOVO', 'CORE I3', 8),
	(16, NULL, 'LAP-00016', 'LAPTOP', 'LENOVO', 'CORE I3', 8),
	(17, NULL, 'LAP-00017', 'LAPTOP', 'LENOVO', 'CORE I7', 8),
	(18, NULL, 'LAP-00018', 'LAPTOP', 'LENOVO', 'CORE I7', 8),
	(19, NULL, 'LAP-00019', 'LAPTOP', 'LENOVO', 'CORE I7', 8),
	(20, NULL, 'LAP-00020', 'LAPTOP', 'LENOVO', 'CORE I7', 8),
	(21, NULL, 'LAP-00021', 'LAPTOP', 'LENOVO', 'CORE I7', 8),
	(22, NULL, 'LAP-00022', 'LAPTOP', 'LENOVO', 'CORE I7', 8),
	(23, NULL, 'LAP-00023', 'LAPTOP', 'LENOVO', 'CORE I7', 8),
	(24, NULL, 'LAP-00024', 'LAPTOP', 'LENOVO', 'CORE I7', 8),
	(25, NULL, 'LAP-00025', 'LAPTOP', 'LENOVO', 'CORE I7', 8),
	(26, NULL, 'LAP-00026', 'LAPTOP', 'LENOVO', 'CORE I7', 8),
	(27, NULL, 'LAP-00027', 'LAPTOP', 'HP', 'CORE I5', 8),
	(28, NULL, 'LAP-00028', 'LAPTOP', 'HP', 'CORE I5', 8),
	(29, NULL, 'LAP-00029', 'LAPTOP', 'HP', 'CORE I5', 8),
	(30, NULL, 'LAP-00030', 'LAPTOP', 'HP', 'CORE I5', 8),
	(31, NULL, 'LAP-00031', 'LAPTOP', 'HP', 'CORE I5', 8),
	(32, NULL, 'LAP-00032', 'LAPTOP', 'HP', 'CORE I5', 8),
	(33, NULL, 'LAP-00033', 'LAPTOP', 'HP', 'CORE I5', 8),
	(34, NULL, 'LAP-00034', 'LAPTOP', 'HP', 'CORE I5', 8),
	(35, NULL, 'LAP-00035', 'LAPTOP', 'HP', 'CORE I5', 8),
	(36, NULL, 'LAP-00036', 'LAPTOP', 'HP', 'CORE I5', 8),
	(37, NULL, 'LAP-00037', 'LAPTOP', 'HP', 'CORE I5', 8),
	(38, NULL, 'LAP-00038', 'LAPTOP', 'HP', 'CORE I5', 8),
	(39, NULL, 'LAP-00039', 'LAPTOP', 'HP', 'CORE I5', 8),
	(40, NULL, 'LAP-00040', 'LAPTOP', 'HP', 'CORE I5', 8),
	(41, NULL, 'LAP-00041', 'LAPTOP', 'HP', 'CORE I5', 8),
	(42, NULL, 'LAP-00042', 'LAPTOP', 'HP', 'CORE I5', 8),
	(43, NULL, 'LAP-00043', 'LAPTOP', 'HP', 'CORE I5', 8),
	(44, NULL, 'LAP-00044', 'LAPTOP', 'HP', 'CORE I5', 8),
	(45, NULL, 'LAP-00045', 'LAPTOP', 'HP', 'CORE I5', 8),
	(46, NULL, 'LAP-00046', 'LAPTOP', 'HP', 'CORE I5', 8),
	(47, NULL, 'LAP-00047', 'LAPTOP', 'HP', 'CORE I7', 8),
	(48, NULL, 'LAP-00048', 'LAPTOP', 'HP', 'CORE I7', 8),
	(49, NULL, 'LAP-00049', 'LAPTOP', 'HP', 'CORE I7', 8),
	(50, NULL, 'LAP-00050', 'LAPTOP', 'HP', 'CORE I7', 8),
	(51, NULL, 'LAP-00051', 'LAPTOP', 'HP', 'CORE I7', 8),
	(52, NULL, 'LAP-00052', 'LAPTOP', 'HP', 'CORE I7', 8),
	(53, NULL, 'LAP-00053', 'LAPTOP', 'HP', 'CORE I7', 8),
	(54, NULL, 'LAP-00054', 'LAPTOP', 'HP', 'CORE I7', 8),
	(55, NULL, 'LAP-00055', 'LAPTOP', 'HP', 'CORE I7', 8),
	(56, NULL, 'LAP-00056', 'LAPTOP', 'HP', 'CORE I7', 8),
	(57, NULL, 'LAP-00057', 'LAPTOP', 'LENOVO', 'CORE I7', 8),
	(58, NULL, 'LAP-00058', 'LAPTOP', 'LENOVO', 'CORE I7', 8),
	(59, NULL, 'LAP-00059', 'LAPTOP', 'LENOVO', 'CORE I7', 8),
	(60, NULL, 'LAP-00060', 'LAPTOP', 'DELL', 'CORE I7', 8),
	(61, NULL, 'LAP-00061', 'LAPTOP', 'DELL', 'CORE I7', 8),
	(62, NULL, 'LAP-00062', 'LAPTOP', 'DELL', 'CORE I7', 8),
	(63, NULL, 'LAP-00063', 'LAPTOP', 'DELL', 'CORE I7', 8),
	(64, NULL, 'LAP-00064', 'LAPTOP', 'DELL', 'CORE I7', 8),
	(65, NULL, 'LAP-00065', 'LAPTOP', 'HP', 'CORE I5', 8),
	(66, NULL, 'LAP-00066', 'LAPTOP', 'HP', 'CORE I5', 8),
	(67, NULL, 'LAP-00067', 'LAPTOP', 'HP', 'CORE I5', 8),
	(68, NULL, 'LAP-00068', 'LAPTOP', 'HP', 'CORE I5', 8),
	(69, NULL, 'LAP-00069', 'LAPTOP', 'HP', 'CORE I5', 8),
	(70, NULL, 'LAP-00070', 'LAPTOP', 'HP', 'CORE I5', 8),
	(71, NULL, 'LAP-00071', 'LAPTOP', 'HP', 'CORE I5', 8),
	(72, NULL, 'LAP-00072', 'LAPTOP', 'HP', 'CORE I5', 8),
	(73, NULL, 'LAP-00073', 'LAPTOP', 'HP', 'CORE I5', 8),
	(74, NULL, 'LAP-00074', 'LAPTOP', 'HP', 'CORE I5', 8),
	(75, NULL, 'LAP-00075', 'LAPTOP', 'HP', 'CORE I5', 8),
	(76, NULL, 'LAP-00076', 'LAPTOP', 'LENOVO', 'CORE I7', 8),
	(77, NULL, 'LAP-00077', 'LAPTOP', 'LENOVO', 'CORE I7', 8),
	(78, NULL, 'LAP-00078', 'LAPTOP', 'LENOVO', 'CORE I7', 8),
	(79, NULL, 'LAP-00079', 'LAPTOP', 'LENOVO', 'CORE I7', 4),
	(80, NULL, 'LAP-00080', 'LAPTOP', 'LENOVO', 'CORE I7', 4),
	(81, NULL, 'LAP-00081', 'LAPTOP', 'DELL', 'CORE I7', 8),
	(82, NULL, 'LAP-00082', 'LAPTOP', 'LENOVO', 'CORE I3', 2),
	(83, NULL, 'LAP-00083', 'LAPTOP', 'DELL', 'CORE I5', 2),
	(84, NULL, 'LAP-00084', 'LAPTOP', 'DELL', 'CORE I5', 2),
	(85, NULL, 'LAP-00085', 'LAPTOP', 'DELL', 'CORE I5', 2),
	(86, NULL, 'LAP-00086', 'LAPTOP', 'HP', 'CORE I3', 3),
	(87, NULL, 'LAP-00087', 'LAPTOP', 'HP', 'CORE I3', 3),
	(88, NULL, 'LAP-00088', 'LAPTOP', 'DELL', 'CORE I5', 5),
	(89, NULL, 'LAP-00089', 'LAPTOP', 'HP', 'CORE I5', 4),
	(90, NULL, 'LAP-00090', 'LAPTOP', 'HP', 'CORE I5', 4),
	(91, NULL, 'LAP-00091', 'LAPTOP', 'HP', 'CORE I5', 4),
	(92, NULL, 'LAP-00092', 'LAPTOP', 'HP', 'CORE I5', 4),
	(93, NULL, 'LAP-00093', 'LAPTOP', 'HP', 'CORE I5', 4),
	(94, NULL, 'LAP-00094', 'LAPTOP', 'HP', 'CORE I5', 4),
	(95, NULL, 'LAP-00095', 'LAPTOP', 'HP', 'CORE I5', 4),
	(96, NULL, 'LAP-00096', 'LAPTOP', 'HP', 'CORE I5', 4),
	(97, NULL, 'LAP-00097', 'LAPTOP', 'HP', 'CORE I5', 4),
	(98, NULL, 'LAP-00098', 'LAPTOP', 'HP', 'CORE I5', 4),
	(99, NULL, 'LAP-00099', 'LAPTOP', 'HP', 'CORE I5', 4),
	(100, NULL, 'LAP-00100', 'LAPTOP', 'HP', 'CORE I5', 4),
	(101, NULL, 'LAP-00101', 'LAPTOP', 'HP', 'CORE I5', 4),
	(102, NULL, 'LAP-00102', 'LAPTOP', 'HP', 'CORE I5', 4),
	(103, NULL, 'LAP-00103', 'LAPTOP', 'HP', 'CORE I5', 4),
	(104, NULL, 'LAP-00104', 'LAPTOP', 'HP', 'CORE I5', 4),
	(105, NULL, 'LAP-00105', 'LAPTOP', 'HP', 'CORE I5', 4),
	(106, NULL, 'LAP-00106', 'LAPTOP', 'HP', 'CORE I5', 4),
	(107, NULL, 'LAP-00107', 'LAPTOP', 'HP', 'CORE I5', 4),
	(108, NULL, 'LAP-00108', 'LAPTOP', 'HP', 'CORE I5', 4),
	(109, NULL, 'LAP-00109', 'LAPTOP', 'HP', 'CORE I5', 4),
	(110, NULL, 'LAP-00110', 'LAPTOP', 'HP', 'CORE I5', 4),
	(111, NULL, 'LAP-00111', 'LAPTOP', 'HP', 'CORE I5', 4),
	(112, NULL, 'LAP-00112', 'LAPTOP', 'HP', 'CORE I5', 4),
	(113, NULL, 'LAP-00113', 'LAPTOP', 'DELL', 'CORE I5', 5),
	(114, NULL, 'LAP-00114', 'LAPTOP', 'HP', 'CORE I5', 4),
	(115, NULL, 'LAP-00115', 'LAPTOP', 'HP', 'CORE I5', 4),
	(116, NULL, 'LAP-00116', 'LAPTOP', 'HP', 'CORE I5', 4),
	(117, NULL, 'LAP-00117', 'LAPTOP', 'HP', 'CORE I5', 4),
	(118, NULL, 'LAP-00118', 'LAPTOP', 'HP', 'CORE I5', 4),
	(119, NULL, 'LAP-00119', 'LAPTOP', 'HP', 'CORE I5', 5),
	(120, NULL, 'LAP-00120', 'LAPTOP', 'HP', 'CORE I5', 5),
	(121, NULL, 'LAP-00121', 'LAPTOP', 'HP', 'CORE I5', 5),
	(122, NULL, 'LAP-00122', 'LAPTOP', 'HP', 'CORE I5', 5),
	(123, NULL, 'LAP-00123', 'LAPTOP', 'LENOVO', 'CORE I7', 4),
	(124, NULL, 'LAP-00124', 'LAPTOP', 'LENOVO', 'CORE I5', 5),
	(125, NULL, 'LAP-00125', 'LAPTOP', 'LENOVO', 'CORE I5', 5),
	(126, NULL, 'LAP-00126', 'LAPTOP', 'LENOVO', 'CORE I5', 5),
	(127, NULL, 'LAP-00127', 'LAPTOP', 'LENOVO', 'CORE I5', 5),
	(128, NULL, 'LAP-00128', 'LAPTOP', 'LENOVO', 'CORE I5', 5),
	(129, NULL, 'LAP-00129', 'LAPTOP', 'LENOVO', 'CORE I7', 4),
	(130, NULL, 'LAP-00130', 'LAPTOP', 'LENOVO', 'CORE I3', 5),
	(131, NULL, 'LAP-00131', 'LAPTOP', 'LENOVO', 'CORE I3', 5),
	(132, NULL, 'LAP-00132', 'LAPTOP', 'LENOVO', 'CORE I3', 5),
	(133, NULL, 'LAP-00133', 'LAPTOP', 'LENOVO', 'CORE I3', 5),
	(134, NULL, 'LAP-00134', 'LAPTOP', 'LENOVO', 'CORE I3', 5),
	(135, NULL, 'LAP-00135', 'LAPTOP', 'HP', 'CORE I3', 4),
	(136, NULL, 'LAP-00136', 'LAPTOP', 'HP', 'CORE I5', 4),
	(137, NULL, 'LAP-00137', 'LAPTOP', 'HP', 'CORE I5', 4),
	(138, NULL, 'LAP-00138', 'LAPTOP', 'HP', 'CORE I5', 4),
	(139, NULL, 'LAP-00139', 'LAPTOP', 'HP', 'CORE I5', 4),
	(140, NULL, 'LAP-00140', 'LAPTOP', 'HP', 'CORE I3', 5),
	(141, NULL, 'LAP-00141', 'LAPTOP', 'HP', 'CORE I3', 5),
	(142, NULL, 'LAP-00142', 'LAPTOP', 'HP', 'CORE I3', 5),
	(143, NULL, 'LAP-00143', 'LAPTOP', 'HP', 'CORE I5', 4),
	(144, NULL, 'LAP-00144', 'LAPTOP', 'HP', 'CORE I3', 5),
	(145, NULL, 'LAP-00145', 'LAPTOP', 'HP', 'CORE I3', 5),
	(146, NULL, 'LAP-00146', 'LAPTOP', 'HP', 'CORE I3', 5),
	(147, NULL, 'LAP-00147', 'LAPTOP', 'HP', 'CORE I3', 5),
	(148, NULL, 'LAP-00148', 'LAPTOP', 'HP', 'CORE I3', 5),
	(149, NULL, 'LAP-00149', 'LAPTOP', 'HP', 'CORE I3', 5),
	(150, NULL, 'LAP-00150', 'LAPTOP', 'HP', 'CORE I3', 5),
	(151, NULL, 'LAP-00151', 'LAPTOP', 'LENOVO', 'CORE I5', 5),
	(152, NULL, 'LAP-00152', 'LAPTOP', 'LENOVO', 'CORE I5', 5),
	(153, NULL, 'LAP-00153', 'LAPTOP', 'HP', 'CORE I5', 5),
	(154, NULL, 'LAP-00154', 'LAPTOP', 'HP', 'CORE I5', 5),
	(155, NULL, 'LAP-00155', 'LAPTOP', 'HP', 'CORE I5', 5),
	(156, NULL, 'LAP-00156', 'LAPTOP', 'HP', 'CORE I5', 5),
	(157, NULL, 'LAP-00157', 'LAPTOP', 'HP', 'CORE I5', 5),
	(158, NULL, 'LAP-00158', 'LAPTOP', 'HP', 'CORE I5', 5),
	(159, NULL, 'LAP-00159', 'LAPTOP', 'HP', 'CORE I5', 5),
	(160, NULL, 'LAP-00160', 'LAPTOP', 'HP', 'CORE I5', 5),
	(161, NULL, 'LAP-00161', 'LAPTOP', 'HP', 'CORE I5', 5),
	(162, NULL, 'LAP-00162', 'LAPTOP', 'HP', 'CORE I5', 5),
	(163, NULL, 'LAP-00163', 'LAPTOP', 'HP', 'CORE I5', 5),
	(164, NULL, 'LAP-00164', 'LAPTOP', 'HP', 'CORE I5', 5),
	(165, NULL, 'LAP-00165', 'LAPTOP', 'HP', 'CORE I5', 5),
	(166, NULL, 'LAP-00166', 'LAPTOP', 'HP', 'CORE I5', 5),
	(167, NULL, 'LAP-00167', 'LAPTOP', 'HP', 'CORE I5', 5),
	(168, NULL, 'LAP-00168', 'LAPTOP', 'HP', 'CORE I5', 6),
	(169, NULL, 'LAP-00169', 'LAPTOP', 'HP', 'CORE I5', 6),
	(170, NULL, 'LAP-00170', 'LAPTOP', 'HP', 'CORE I5', 6),
	(171, NULL, 'LAP-00171', 'LAPTOP', 'HP', 'CORE I5', 6),
	(172, NULL, 'LAP-00172', 'LAPTOP', 'HP', 'CORE I5', 6),
	(173, NULL, 'LAP-00173', 'LAPTOP', 'HP', 'CORE I5', 6),
	(174, NULL, 'LAP-00174', 'LAPTOP', 'HP', 'CORE I5', 6),
	(175, NULL, 'LAP-00175', 'LAPTOP', 'HP', 'CORE I5', 6),
	(176, NULL, 'LAP-00176', 'LAPTOP', 'HP', 'CORE I5', 6),
	(177, NULL, 'LAP-00177', 'LAPTOP', 'HP', 'CORE I5', 6),
	(178, NULL, 'LAP-00178', 'LAPTOP', 'HP', 'CORE I7', 6),
	(179, NULL, 'LAP-00179', 'LAPTOP', 'HP', 'CORE I7', 6),
	(180, NULL, 'LAP-00180', 'LAPTOP', 'HP', 'CORE I7', 6),
	(181, NULL, 'LAP-00181', 'LAPTOP', 'HP', 'CORE I7', 6),
	(182, NULL, 'LAP-00182', 'LAPTOP', 'HP', 'CORE I7', 6),
	(183, NULL, 'LAP-00183', 'LAPTOP', 'HP', 'CORE I7', 6),
	(184, NULL, 'LAP-00184', 'LAPTOP', 'HP', 'CORE I7', 6),
	(185, NULL, 'LAP-00185', 'LAPTOP', 'HP', 'CORE I5', 5),
	(186, NULL, 'LAP-00186', 'LAPTOP', 'HP', 'CORE I5', 5),
	(187, NULL, 'LAP-00187', 'LAPTOP', 'HP', 'CORE I5', 5),
	(188, NULL, 'LAP-00188', 'LAPTOP', 'HP', 'CORE I5', 5),
	(189, NULL, 'LAP-00189', 'LAPTOP', 'HP', 'CORE I5', 5),
	(190, NULL, 'LAP-00190', 'LAPTOP', 'HP', 'CORE I5', 5),
	(191, NULL, 'LAP-00191', 'LAPTOP', 'HP', 'CORE I5', 5),
	(192, NULL, 'LAP-00192', 'LAPTOP', 'HP', 'CORE I5', 5),
	(193, NULL, 'LAP-00193', 'LAPTOP', 'HP', 'CORE I5', 5),
	(194, NULL, 'LAP-00194', 'LAPTOP', 'HP', 'CORE I5', 5),
	(195, NULL, 'LAP-00195', 'LAPTOP', 'HP', 'CORE I5', 5),
	(196, NULL, 'LAP-00196', 'LAPTOP', 'HP', 'CORE I5', 5),
	(197, NULL, 'LAP-00197', 'LAPTOP', 'HP', 'CORE I5', 5),
	(198, NULL, 'LAP-00198', 'LAPTOP', 'HP', 'CORE I5', 5),
	(199, NULL, 'LAP-00199', 'LAPTOP', 'DELL', 'CORE I7', 6),
	(200, NULL, 'LAP-00200', 'LAPTOP', 'DELL', 'CORE I7', 6);

-- Dumping structure for view testdb.unidades_libres
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `unidades_libres` (
	`id` INT(11) NOT NULL,
	`id_cliente` INT(11) NULL,
	`codigo` VARCHAR(15) NOT NULL COLLATE 'utf8mb4_general_ci',
	`tipo_de_ua` VARCHAR(10) NOT NULL COLLATE 'utf8mb4_general_ci',
	`marca` VARCHAR(15) NOT NULL COLLATE 'utf8mb4_general_ci',
	`procesador` VARCHAR(10) NOT NULL COLLATE 'utf8mb4_general_ci',
	`generacion` INT(11) NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for view testdb.clientes_activos
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `clientes_activos`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `clientes_activos` AS SELECT 
	c.empresa AS cliente, c.sector, c.tamano, u.codigo
FROM
	unidades_de_alquiler u
LEFT JOIN	
	clientes c ON u.id_cliente = c.id
WHERE
	u.id_cliente IS NOT NULL ;

-- Dumping structure for view testdb.unidades_libres
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `unidades_libres`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `unidades_libres` AS SELECT 
	*
FROM
	unidades_de_alquiler
WHERE
	id_cliente IS NULL ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
