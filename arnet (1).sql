-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 04-12-2020 a las 22:05:15
-- Versión del servidor: 10.4.10-MariaDB
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `arnet`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apuntes`
--

DROP TABLE IF EXISTS `apuntes`;
CREATE TABLE IF NOT EXISTS `apuntes` (
  `USUARIO` int(5) NOT NULL,
  `FECHA` varchar(10) NOT NULL,
  `ASIENTO` tinyint(6) UNSIGNED NOT NULL,
  `APUNTE` tinyint(6) UNSIGNED NOT NULL,
  `DOCUMENTO` varchar(15) DEFAULT NULL,
  `ID_CONCEPTO` tinyint(5) UNSIGNED NOT NULL,
  `CONCEPTO` varchar(40) DEFAULT NULL,
  `DEBE_HABER` varchar(5) NOT NULL,
  `IMPORTE_DEBE` int(10) NOT NULL,
  `IMPORTE_HABER` int(10) NOT NULL,
  `CUENTA` varchar(12) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `FECHA_REAL` date NOT NULL,
  `SALDO_ANTERIOR` int(10) NOT NULL,
  PRIMARY KEY (`USUARIO`,`FECHA`,`ASIENTO`,`APUNTE`),
  KEY `CUENTA` (`CUENTA`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `apuntes`
--

INSERT INTO `apuntes` (`USUARIO`, `FECHA`, `ASIENTO`, `APUNTE`, `DOCUMENTO`, `ID_CONCEPTO`, `CONCEPTO`, `DEBE_HABER`, `IMPORTE_DEBE`, `IMPORTE_HABER`, `CUENTA`, `FECHA_REAL`, `SALDO_ANTERIOR`) VALUES
(124, '2020-10-14', 158, 12, '', 3, 'APERTURA', 'DEBE', 2000, 0, '430001000001', '2020-12-04', 0),
(124, '2020-10-14', 158, 8, '', 3, 'APERTURA', 'DEBE', 650, 0, '430001000001', '2020-12-04', -3660),
(124, '2020-10-14', 158, 11, '', 3, 'CONCEPTO DEUDOR', 'DEBE', 3500, 0, '430001000001', '2020-12-04', 0),
(124, '2020-10-14', 158, 10, '', 3, 'un apunte al debe', 'DEBE', 1500, 0, '430001000001', '2020-12-04', 0),
(124, '2020-10-14', 158, 9, '', 3, 'APERTURA', 'DEBE', 7500, 0, '430001000001', '2020-12-04', 0),
(124, '2020-10-14', 158, 7, '', 3, 'APERTURA', 'DEBE', 200, 0, '430001000001', '2020-12-04', -4060),
(124, '2020-10-14', 158, 6, '', 4, 'APERTURA', 'HABER', 0, 3000, '430001000001', '2020-12-04', 1940),
(124, '2020-10-14', 158, 5, '', 4, 'APERTURA', 'HABER', 0, 5000, '430001000001', '2020-12-04', 6940),
(124, '2020-10-14', 158, 4, '', 3, 'APERTURA', 'DEBE', 6000, 0, '430001000001', '2020-12-04', 940),
(124, '2020-10-14', 158, 1, '', 3, 'APERTURA', 'DEBE', 90, 0, '070707070707', '2020-12-03', 0),
(124, '2020-10-14', 158, 2, '', 3, 'APERTURA', 'DEBE', 1, 0, '010101010104', '2020-12-03', 0),
(124, '2020-10-14', 158, 3, '', 4, 'apeltura', 'DEBE', 25, 0, '010101010101', '2020-12-03', 990);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conceptos`
--

DROP TABLE IF EXISTS `conceptos`;
CREATE TABLE IF NOT EXISTS `conceptos` (
  `CONCEPTO_ID` tinyint(5) UNSIGNED NOT NULL,
  `DEBE_O_HABER` varchar(5) NOT NULL,
  `TEXTO_FIJO` varchar(40) NOT NULL,
  PRIMARY KEY (`CONCEPTO_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `conceptos`
--

INSERT INTO `conceptos` (`CONCEPTO_ID`, `DEBE_O_HABER`, `TEXTO_FIJO`) VALUES
(3, 'DEBE', 'APERTURA'),
(4, 'HABER', 'APERTURA'),
(5, 'DEBE', 'SU COMPRA'),
(8, 'HABER', 'SU ENTREGA EN EFECTIVO'),
(9, 'HABER', 'xxxxx'),
(10, 'DEBE', 'aaaaaaaaaaaa'),
(11, 'HABER', 'VBCVBXCVB'),
(12, 'DEBE', 'VVVVV'),
(14, 'HABER', ''),
(15, 'DEBE', ''),
(16, 'HABER', ''),
(17, 'DEBE', ''),
(18, 'HABER', ''),
(19, 'DEBE', 'EL DIECINUEVE!!!');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
CREATE TABLE IF NOT EXISTS `cuentas` (
  `CODIGO_CUENTA` varchar(12) NOT NULL,
  `TITULO` varchar(40) NOT NULL,
  `FECHA_ALTA` date NOT NULL DEFAULT current_timestamp(),
  `DEBE_ANIO` float(9,2) NOT NULL DEFAULT 0.00,
  `HABER_ANIO` float(9,2) NOT NULL DEFAULT 0.00,
  `MASA_PATRIMONIAL` tinyint(2) NOT NULL,
  `GRADO` tinyint(1) NOT NULL DEFAULT 3,
  PRIMARY KEY (`CODIGO_CUENTA`),
  UNIQUE KEY `CODIGO_CUENTA` (`CODIGO_CUENTA`),
  KEY `TITULO_CUENTA` (`TITULO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Maestro de Cuentas contables. Pendiente arrays acumulados';

--
-- Volcado de datos para la tabla `cuentas`
--

INSERT INTO `cuentas` (`CODIGO_CUENTA`, `TITULO`, `FECHA_ALTA`, `DEBE_ANIO`, `HABER_ANIO`, `MASA_PATRIMONIAL`, `GRADO`) VALUES
('430000000000', 'CLIENTES', '2020-12-01', 0.00, 0.00, 10, 1),
('430001000000', 'CLIENTES ZONA 1', '2020-12-01', 0.00, 0.00, 10, 2),
('430001000001', 'FULANO DE COPAS', '2020-10-23', 0.00, 0.00, 10, 3),
('430001000002', 'TAL DE LOS TALCUALES', '2020-10-23', 0.00, 0.00, 10, 3),
('430002000000', 'CLIENTES ZONA 2', '2020-12-01', 0.00, 0.00, 10, 2),
('430002000001', 'MENGANO ZONA DOS', '2020-10-23', 0.00, 0.00, 10, 3),
('430002000002', 'SEÃ‘OR TEN PIEDAD', '2020-10-23', 0.00, 0.00, 10, 3),
('570000000000', 'CAJA', '2020-12-01', 0.00, 0.00, 10, 1),
('570001000000', 'CAJA ALMACENES ZONA 1', '2020-12-01', 0.00, 0.00, 10, 2),
('570001000001', 'CAJA SEDE 1', '2020-10-23', 0.00, 0.00, 10, 3),
('570001000002', 'CAJA SEDE 2', '2020-10-23', 0.00, 0.00, 10, 3),
('570002000000', 'CAJA ALMACENES ZONA 2', '2020-12-01', 0.00, 0.00, 10, 2),
('570002000001', 'CAJA SEDE 2-1', '2020-10-23', 0.00, 0.00, 10, 3),
('572000000000', 'BANCOS', '2020-12-01', 0.00, 0.00, 10, 1),
('572001000000', 'BANCOS', '2020-12-01', 0.00, 0.00, 10, 2),
('572001000001', 'BANCO COOPERATIVO', '2020-10-23', 0.00, 0.00, 10, 3),
('572001000002', 'PRESTAMISTAS DESINTERESADOS', '2020-10-23', 0.00, 0.00, 10, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diario`
--

DROP TABLE IF EXISTS `diario`;
CREATE TABLE IF NOT EXISTS `diario` (
  `DIARIO_FECHA` date NOT NULL,
  `DIARIO_ASIENTO` tinyint(6) UNSIGNED NOT NULL,
  `DIARIO_APUNTE` tinyint(6) UNSIGNED NOT NULL,
  `DIARIO_DOCUMENTO` varchar(15) NOT NULL,
  `DIARIO_ID_USUARIO` int(5) NOT NULL,
  `DIARIO_ID_CONCEPTO` int(5) NOT NULL,
  `DIARIO_CONCEPTO` varchar(40) NOT NULL,
  `DIARIO_DEBE_HABER` varchar(5) NOT NULL,
  `DIARIO_IMPORTE_DEBE` int(10) NOT NULL,
  `DIARIO_IMPORTE_HABER` int(10) NOT NULL,
  `DIARIO_CONCILIADO` varchar(2) NOT NULL DEFAULT 'NO',
  `DIARIO_CUENTA` varchar(12) NOT NULL,
  `DIARIO_FECHA_REAL` date NOT NULL,
  PRIMARY KEY (`DIARIO_FECHA`,`DIARIO_ASIENTO`,`DIARIO_APUNTE`) USING BTREE,
  KEY `CUENTA` (`DIARIO_CUENTA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `diario`
--

INSERT INTO `diario` (`DIARIO_FECHA`, `DIARIO_ASIENTO`, `DIARIO_APUNTE`, `DIARIO_DOCUMENTO`, `DIARIO_ID_USUARIO`, `DIARIO_ID_CONCEPTO`, `DIARIO_CONCEPTO`, `DIARIO_DEBE_HABER`, `DIARIO_IMPORTE_DEBE`, `DIARIO_IMPORTE_HABER`, `DIARIO_CONCILIADO`, `DIARIO_CUENTA`, `DIARIO_FECHA_REAL`) VALUES
('2020-10-14', 147, 1, '', 124, 3, 'APERTURA', 'DEBE', 100, 0, 'NO', '010101010101', '2020-11-30'),
('2020-10-14', 147, 2, '', 124, 4, 'APERTURA', 'HABER', 0, 100, 'NO', '010101010102', '2020-11-30'),
('2020-10-14', 147, 3, '', 124, 3, 'APERTURA', 'DEBE', 20, 0, 'NO', '010101010101', '2020-11-30'),
('2020-10-14', 147, 4, '', 124, 4, 'APERTURA', 'HABER', 0, 20, 'NO', '010101010102', '2020-11-30'),
('2020-10-14', 147, 5, ' ', 124, 0, 'RESUMEN', ' ', 120, 120, 'NO', '999999999999', '2020-11-30'),
('2020-10-14', 148, 1, '', 124, 4, 'APERTURA', 'HABER', 0, 500, 'NO', '010101010101', '2020-11-30'),
('2020-10-14', 148, 2, '', 124, 3, 'APERTURA', 'DEBE', 500, 0, 'NO', '010101010102', '2020-11-30'),
('2020-10-14', 148, 3, ' ', 124, 0, 'RESUMEN', ' ', 500, 500, 'NO', '999999999999', '2020-11-30'),
('2020-10-14', 149, 1, '', 124, 4, 'APERTURA', 'HABER', 0, 300, 'NO', '010101010103', '2020-11-30'),
('2020-10-14', 149, 2, '', 124, 3, 'APERTURA', 'DEBE', 300, 0, 'NO', '070707070707', '2020-11-30'),
('2020-10-14', 149, 3, '', 124, 12, 'VVVVV', 'DEBE', 200, 0, 'NO', '060606060606', '2020-11-30'),
('2020-10-14', 149, 4, '', 124, 4, 'APERTURA', 'HABER', 0, 200, 'NO', '050505050505', '2020-11-30'),
('2020-10-14', 149, 5, ' ', 124, 0, 'RESUMEN', ' ', 500, 500, 'NO', '999999999999', '2020-11-30'),
('2020-10-14', 150, 1, '', 124, 3, 'APERTURA', 'DEBE', 123456, 0, 'NO', '010101010101', '2020-12-01'),
('2020-10-14', 150, 2, '', 124, 4, 'APERTURA', 'HABER', 0, 12345678, 'NO', '010101010101', '2020-12-01'),
('2020-10-14', 150, 3, '', 124, 3, 'APERTURA', 'DEBE', 500, 0, 'NO', '010101010101', '2020-12-01'),
('2020-10-14', 150, 4, '', 124, 3, 'APERTURA', 'DEBE', 123332833, 0, 'NO', '010101010101', '2020-12-01'),
('2020-10-14', 150, 5, '', 124, 15, '', 'DEBE', 0, 0, 'NO', '010101010101', '2020-12-01'),
('2020-10-14', 151, 1, '', 124, 10, 'aaaaaaaaaaaa', 'DEBE', 125, 0, 'NO', '010101010102', '2020-12-01'),
('2020-10-14', 151, 2, '', 124, 11, 'VBCVBXCVB', 'HABER', 0, 125, 'NO', '070707070707', '2020-12-01'),
('2020-10-14', 151, 3, ' ', 124, 0, 'RESUMEN', ' ', 125, 125, 'NO', '999999999999', '2020-12-01'),
('2020-10-14', 152, 1, '', 124, 4, 'APERTURA', 'HABER', 0, 500, 'NO', '010101010102', '2020-12-01'),
('2020-10-14', 152, 2, '', 124, 3, 'APERTURA', 'DEBE', 500, 0, 'NO', '060606060606', '2020-12-01'),
('2020-10-14', 152, 3, ' ', 124, 0, 'RESUMEN', ' ', 500, 500, 'NO', '999999999999', '2020-12-01'),
('2020-10-14', 153, 1, 'doumento contab', 124, 3, 'APERTURA', 'DEBE', 10, 0, 'NO', '010101010102', '2020-12-02'),
('2020-10-14', 153, 2, 'otro documento', 124, 3, 'APERTURA', 'DEBE', 150, 0, 'NO', '010101010102', '2020-12-02'),
('2020-10-14', 153, 3, 'tercer docto', 124, 4, 'APERTURA', 'HABER', 0, 160, 'NO', '010101010101', '2020-12-02'),
('2020-10-14', 153, 4, ' ', 124, 0, 'RESUMEN', ' ', 160, 160, 'NO', '999999999999', '2020-12-02'),
('2020-10-14', 154, 1, 'el cuarto', 124, 10, 'aaaaaaaaaaaa', 'DEBE', 500, 0, 'NO', '010101010101', '2020-12-02'),
('2020-10-14', 154, 2, 'recibo y tal', 124, 12, 'VVVVV', 'DEBE', 100, 0, 'NO', '070707070707', '2020-12-02'),
('2020-10-14', 154, 3, 'documento vario', 124, 3, 'APERTURA', 'DEBE', 500, 0, 'NO', '070707070707', '2020-12-02'),
('2020-10-14', 154, 4, 'cuadra asiento', 124, 4, 'APERTURA', 'HABER', 0, 1100, 'NO', '010101010101', '2020-12-02'),
('2020-10-14', 154, 5, ' ', 124, 0, 'RESUMEN', ' ', 1100, 1100, 'NO', '999999999999', '2020-12-02'),
('2020-10-14', 155, 1, '', 124, 5, 'SU COMPRA', 'DEBE', 20, 0, 'NO', '010101010101', '2020-12-02'),
('2020-10-14', 155, 2, 'xxxx', 124, 3, 'APERTURA', 'DEBE', 150, 0, 'NO', '010101010102', '2020-12-02'),
('2020-10-14', 155, 3, 'ssssssss', 124, 5, 'SU COMPRA', 'DEBE', 600, 0, 'NO', '010101010104', '2020-12-02'),
('2020-10-14', 155, 4, 'sssss', 124, 5, 'SU COMPRA', 'DEBE', 10, 0, 'NO', '010101010104', '2020-12-02'),
('2020-10-14', 155, 5, 'asdasdfa', 124, 9, 'xxxxx', 'DEBE', 500, 0, 'NO', '010101010101', '2020-12-02'),
('2020-10-14', 155, 6, 'aasaasas', 124, 5, 'SU COMPRA', 'DEBE', 30, 0, 'NO', '030303030303', '2020-12-02'),
('2020-10-14', 155, 7, 'recibo', 124, 8, 'SU ENTREGA EN EFECTIVO', 'HABER', 0, 90, 'NO', '030303030303', '2020-12-02'),
('2020-10-14', 155, 8, 'nnnnnnnfffffff', 124, 5, 'SU COMPRA', 'DEBE', 80, 0, 'NO', '070707070707', '2020-12-02'),
('2020-10-14', 155, 9, 'ccccccccc', 124, 3, 'APERTURA', 'DEBE', 200, 0, 'NO', '060606060606', '2020-12-02'),
('2020-10-14', 155, 10, 'trvfgdfsfg', 124, 8, 'SU ENTREGA EN EFECTIVO', 'HABER', 0, 100, 'NO', '030303030303', '2020-12-02'),
('2020-10-14', 155, 11, 'document.getEle', 124, 11, 'VBCVBXCVB', 'HABER', 0, 1400, 'NO', '010101010103', '2020-12-02'),
('2020-10-14', 155, 12, ' ', 124, 0, 'RESUMEN', ' ', 1590, 1590, 'NO', '999999999999', '2020-12-02'),
('2020-10-14', 156, 1, '', 124, 4, 'APERTURA', 'HABER', 0, 10, 'NO', '010101010101', '2020-12-02'),
('2020-10-14', 156, 2, '', 124, 3, 'APERTURA', 'DEBE', 10, 0, 'NO', '010101010103', '2020-12-02'),
('2020-10-14', 156, 3, '', 124, 5, 'SU COMPRA', 'DEBE', 10, 0, 'NO', '020202020202', '2020-12-02'),
('2020-10-14', 156, 4, '', 124, 10, 'aaaaaaaaaaaa', 'DEBE', 50, 0, 'NO', '020202020202', '2020-12-02'),
('2020-10-14', 156, 5, '', 124, 3, 'APERTURA', 'DEBE', 50, 0, 'NO', '040404040404', '2020-12-02'),
('2020-10-14', 156, 6, '', 124, 5, 'SU COMPRA', 'DEBE', 60, 0, 'NO', '040404040404', '2020-12-02'),
('2020-10-14', 156, 7, '', 124, 11, 'VBCVBXCVB', 'HABER', 0, 600, 'NO', '070707070707', '2020-12-02'),
('2020-10-14', 156, 8, '', 124, 3, 'APERTURA', 'DEBE', 400, 0, 'NO', '050505050505', '2020-12-02'),
('2020-10-14', 156, 9, '', 124, 3, 'APERTURA', 'DEBE', 1000, 0, 'NO', '070707070707', '2020-12-02'),
('2020-10-14', 156, 10, '', 124, 4, 'APERTURA', 'HABER', 0, 600, 'NO', '010101010102', '2020-12-02'),
('2020-10-14', 156, 11, '', 124, 3, 'APERTURA', 'DEBE', 80, 0, 'NO', '050505050506', '2020-12-02'),
('2020-10-14', 156, 12, '', 124, 4, 'APERTURA', 'HABER', 0, 450, 'NO', '010101010102', '2020-12-02'),
('2020-10-14', 156, 13, ' ', 124, 0, 'RESUMEN', ' ', 1660, 1660, 'NO', '999999999999', '2020-12-02'),
('2020-10-14', 157, 1, '', 124, 3, 'APERTURA', 'DEBE', 500, 0, 'NO', '010101010104', '2020-12-02'),
('2020-10-14', 157, 2, '', 124, 12, 'VVVVV', 'DEBE', 500, 0, 'NO', '030303030303', '2020-12-02'),
('2020-10-14', 157, 3, '', 124, 4, 'APERTURA', 'HABER', 0, 1000, 'NO', '010101010104', '2020-12-02'),
('2020-10-14', 157, 4, ' ', 124, 0, 'RESUMEN', ' ', 1000, 1000, 'NO', '999999999999', '2020-12-02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `ID` tinyint(5) UNSIGNED NOT NULL,
  `NOMBRE` varchar(20) NOT NULL,
  `APELLIDO _1` varchar(20) NOT NULL,
  `APELLIDO_2` varchar(20) NOT NULL,
  `DIR_CALLE` varchar(20) NOT NULL,
  `DIR_NUM` tinyint(3) NOT NULL,
  `DIR_PORTAL` varchar(3) NOT NULL,
  `DIR_PISO` int(3) NOT NULL,
  `DIR_PUERTA` varchar(5) NOT NULL,
  `COD_POSTAL` tinyint(5) NOT NULL,
  `MUNICIPIO` varchar(20) NOT NULL,
  `PROVINCIA` varchar(20) NOT NULL,
  `COMUNIDAD_AUTO` varchar(20) NOT NULL,
  `DEPARTAMENTO` varchar(20) NOT NULL,
  `CARGO` varchar(20) NOT NULL,
  `ID_ALMACEN` varchar(20) NOT NULL COMMENT 'ALMACEN O SEDE',
  `FECHA_ALTA` date NOT NULL,
  `TELEFONO_1` varchar(11) NOT NULL,
  `TELEFONO_2` varchar(11) NOT NULL,
  `E_MAIL_1` varchar(20) NOT NULL,
  `E_MAIL_2` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `nombre`) VALUES
(1, 'Restaurante Acaymo, S.L.'),
(2, 'AER ON LINE'),
(3, 'ibm');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `extractos`
--

DROP TABLE IF EXISTS `extractos`;
CREATE TABLE IF NOT EXISTS `extractos` (
  `EXT_CUENTA` varchar(12) NOT NULL,
  `EXT_FECHA` date NOT NULL,
  `EXT_ASIENTO` tinyint(6) UNSIGNED NOT NULL,
  `EXT_APUNTE` tinyint(6) UNSIGNED NOT NULL,
  `EXT_ID_USUARIO` tinyint(5) NOT NULL,
  `EXT_DOCUMENTO` varchar(15) NOT NULL,
  `EXT_ID_CONCEPTO` tinyint(5) UNSIGNED NOT NULL,
  `EXT_CONCEPTO` varchar(40) NOT NULL,
  `EXT_DEBE_HABER` varchar(5) NOT NULL,
  `EXT_IMPORTE_DEBE` int(10) NOT NULL,
  `EXT_IMPORTE_HABER` int(10) NOT NULL,
  `EXT_CONCILIADO` char(2) NOT NULL DEFAULT 'NO',
  `EXT_SALDO_ANTERIOR` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`EXT_CUENTA`,`EXT_FECHA`,`EXT_ASIENTO`,`EXT_APUNTE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `extractos`
--

INSERT INTO `extractos` (`EXT_CUENTA`, `EXT_FECHA`, `EXT_ASIENTO`, `EXT_APUNTE`, `EXT_ID_USUARIO`, `EXT_DOCUMENTO`, `EXT_ID_CONCEPTO`, `EXT_CONCEPTO`, `EXT_DEBE_HABER`, `EXT_IMPORTE_DEBE`, `EXT_IMPORTE_HABER`, `EXT_CONCILIADO`, `EXT_SALDO_ANTERIOR`) VALUES
('010101010101', '2020-10-14', 147, 3, 124, '', 3, 'APERTURA', 'DEBE', 20, 0, 'NO', 100),
('010101010102', '2020-10-14', 147, 2, 124, '', 4, 'APERTURA', 'HABER', 0, 100, 'NO', 0),
('010101010101', '2020-10-14', 147, 1, 124, '', 3, 'APERTURA', 'DEBE', 100, 0, 'NO', 0),
('010101010102', '2020-10-14', 147, 4, 124, '', 4, 'APERTURA', 'HABER', 0, 20, 'NO', -100),
('010101010102', '2020-10-14', 148, 2, 124, '', 3, 'APERTURA', 'DEBE', 500, 0, 'NO', -120),
('010101010101', '2020-10-14', 148, 1, 124, '', 4, 'APERTURA', 'HABER', 0, 500, 'NO', 120),
('050505050505', '2020-10-14', 149, 4, 124, '', 4, 'APERTURA', 'HABER', 0, 200, 'NO', 788),
('060606060606', '2020-10-14', 149, 3, 124, '', 12, 'VVVVV', 'DEBE', 200, 0, 'NO', -1014),
('010101010103', '2020-10-14', 149, 1, 124, '', 4, 'APERTURA', 'HABER', 0, 300, 'NO', 522),
('070707070707', '2020-10-14', 149, 2, 124, '', 3, 'APERTURA', 'DEBE', 300, 0, 'NO', 48),
('010101010101', '2020-10-14', 150, 5, 124, '', 15, '', 'DEBE', 0, 0, 'NO', 111110731),
('010101010101', '2020-10-14', 150, 4, 124, '', 3, 'APERTURA', 'DEBE', 123332833, 0, 'NO', -12222102),
('010101010101', '2020-10-14', 150, 2, 124, '', 4, 'APERTURA', 'HABER', 0, 12345678, 'NO', 123076),
('010101010101', '2020-10-14', 150, 3, 124, '', 3, 'APERTURA', 'DEBE', 500, 0, 'NO', -12222602),
('010101010101', '2020-10-14', 150, 1, 124, '', 3, 'APERTURA', 'DEBE', 123456, 0, 'NO', -380),
('010101010102', '2020-10-14', 151, 1, 124, '', 10, 'aaaaaaaaaaaa', 'DEBE', 125, 0, 'NO', 380),
('070707070707', '2020-10-14', 151, 2, 124, '', 11, 'VBCVBXCVB', 'HABER', 0, 125, 'NO', 348),
('060606060606', '2020-10-14', 152, 2, 124, '', 3, 'APERTURA', 'DEBE', 500, 0, 'NO', -814),
('010101010102', '2020-10-14', 152, 1, 124, '', 4, 'APERTURA', 'HABER', 0, 500, 'NO', 505),
('010101010102', '2020-10-14', 153, 2, 124, 'otro documento', 3, 'APERTURA', 'DEBE', 150, 0, 'NO', 10),
('010101010102', '2020-10-14', 153, 1, 124, 'doumento contab', 3, 'APERTURA', 'DEBE', 10, 0, 'NO', 0),
('010101010101', '2020-10-14', 153, 3, 124, 'tercer docto', 4, 'APERTURA', 'HABER', 0, 160, 'NO', 0),
('010101010101', '2020-10-14', 154, 4, 124, 'cuadra asiento', 4, 'APERTURA', 'HABER', 0, 1100, 'NO', 340),
('070707070707', '2020-10-14', 154, 2, 124, 'recibo y tal', 12, 'VVVVV', 'DEBE', 100, 0, 'NO', 0),
('070707070707', '2020-10-14', 154, 3, 124, 'documento vario', 3, 'APERTURA', 'DEBE', 500, 0, 'NO', 100),
('010101010101', '2020-10-14', 154, 1, 124, 'el cuarto', 10, 'aaaaaaaaaaaa', 'DEBE', 500, 0, 'NO', -160),
('010101010101', '2020-10-14', 155, 5, 124, 'asdasdfa', 9, 'xxxxx', 'DEBE', 500, 0, 'NO', -740),
('010101010104', '2020-10-14', 155, 4, 124, 'sssss', 5, 'SU COMPRA', 'DEBE', 10, 0, 'NO', 600),
('010101010102', '2020-10-14', 155, 2, 124, 'xxxx', 3, 'APERTURA', 'DEBE', 150, 0, 'NO', 160),
('010101010104', '2020-10-14', 155, 3, 124, 'ssssssss', 5, 'SU COMPRA', 'DEBE', 600, 0, 'NO', 0),
('010101010101', '2020-10-14', 155, 1, 124, '', 5, 'SU COMPRA', 'DEBE', 20, 0, 'NO', -760),
('030303030303', '2020-10-14', 155, 6, 124, 'aasaasas', 5, 'SU COMPRA', 'DEBE', 30, 0, 'NO', 0),
('030303030303', '2020-10-14', 155, 7, 124, 'recibo', 8, 'SU ENTREGA EN EFECTIVO', 'HABER', 0, 90, 'NO', 30),
('070707070707', '2020-10-14', 155, 8, 124, 'nnnnnnnfffffff', 5, 'SU COMPRA', 'DEBE', 80, 0, 'NO', 600),
('060606060606', '2020-10-14', 155, 9, 124, 'ccccccccc', 3, 'APERTURA', 'DEBE', 200, 0, 'NO', 0),
('030303030303', '2020-10-14', 155, 10, 124, 'trvfgdfsfg', 8, 'SU ENTREGA EN EFECTIVO', 'HABER', 0, 100, 'NO', -60),
('010101010103', '2020-10-14', 155, 11, 124, 'document.getEle', 11, 'VBCVBXCVB', 'HABER', 0, 1400, 'NO', 0),
('010101010102', '2020-10-14', 156, 12, 124, '', 4, 'APERTURA', 'HABER', 0, 450, 'NO', -290),
('050505050506', '2020-10-14', 156, 11, 124, '', 3, 'APERTURA', 'DEBE', 80, 0, 'NO', 0),
('010101010102', '2020-10-14', 156, 10, 124, '', 4, 'APERTURA', 'HABER', 0, 600, 'NO', 310),
('070707070707', '2020-10-14', 156, 7, 124, '', 11, 'VBCVBXCVB', 'HABER', 0, 600, 'NO', 680),
('050505050505', '2020-10-14', 156, 8, 124, '', 3, 'APERTURA', 'DEBE', 400, 0, 'NO', 0),
('070707070707', '2020-10-14', 156, 9, 124, '', 3, 'APERTURA', 'DEBE', 1000, 0, 'NO', 80),
('040404040404', '2020-10-14', 156, 6, 124, '', 5, 'SU COMPRA', 'DEBE', 60, 0, 'NO', 50),
('040404040404', '2020-10-14', 156, 5, 124, '', 3, 'APERTURA', 'DEBE', 50, 0, 'NO', 0),
('020202020202', '2020-10-14', 156, 4, 124, '', 10, 'aaaaaaaaaaaa', 'DEBE', 50, 0, 'NO', 10),
('020202020202', '2020-10-14', 156, 3, 124, '', 5, 'SU COMPRA', 'DEBE', 10, 0, 'NO', 0),
('010101010103', '2020-10-14', 156, 2, 124, '', 3, 'APERTURA', 'DEBE', 10, 0, 'NO', -1400),
('010101010101', '2020-10-14', 156, 1, 124, '', 4, 'APERTURA', 'HABER', 0, 10, 'NO', -240),
('010101010104', '2020-10-14', 157, 3, 124, '', 4, 'APERTURA', 'HABER', 0, 1000, 'NO', 1110),
('030303030303', '2020-10-14', 157, 2, 124, '', 12, 'VVVVV', 'DEBE', 500, 0, 'NO', -160),
('010101010104', '2020-10-14', 157, 1, 124, '', 3, 'APERTURA', 'DEBE', 500, 0, 'NO', 610);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

DROP TABLE IF EXISTS `libros`;
CREATE TABLE IF NOT EXISTS `libros` (
  `ID` smallint(10) NOT NULL AUTO_INCREMENT,
  `Autor` varchar(30) NOT NULL,
  `Editorial` varchar(30) NOT NULL,
  `isbn` varchar(25) DEFAULT NULL,
  `ubicacion` varchar(15) NOT NULL,
  `titulo` varchar(40) NOT NULL,
  `genero` varchar(20) NOT NULL,
  `sub_genero` varchar(20) NOT NULL,
  `propietario` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`ID`, `Autor`, `Editorial`, `isbn`, `ubicacion`, `titulo`, `genero`, `sub_genero`, `propietario`) VALUES
(9, 'a', 'b', 'c', 'd', 'e   ', 'f', 'g', 'h'),
(10, 'a', 'b', 'cd', 'd', 'd ', 'd', 'd', 'd'),
(11, 'axxxxxxxxx', 'aa', 'a', 'a', 'zxxxxxxxxxxxxxxxxxxxx', 'azzxxxxxxxxxxxxxxxxx', 'azzzzzzzzzzzzzzzzzzz', 'azzzzzzzzzzzzzzzzzzzzzzzzzzzzz'),
(12, '111', '22', '3', '4', '5', '6', '7', '8'),
(13, 'a', 'aA', 'A', 'A', 'A', 'A', 'A', 'A'),
(14, 'S', 'S', 'S', 'S', 'S', 'D', 'S', 'D'),
(15, ',M', '0', 'M', 'Maaaaaaaaaaaaaa', 'M  ', 'M', 'M', 'M'),
(16, 'GG', 'G', 'G', 'G', 'G  ', 'G', 'Gcccc', 'G'),
(17, '222222', '11111111', 'N', 'N', 'N', 'N', 'N', 'N'),
(18, 'NGG', 'G', 'G', 'GG', 'GG ', 'B', 'B', 'B'),
(19, 'CCC', 'CCCC', 'CCC', 'CC', 'CCC ', 'CC', 'CC', 'CCC'),
(20, 'DH', 'FGF', 'GHHH', 'NNN', 'GGG ', 'FFF', 'FFF', 'FFF');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `masas`
--

DROP TABLE IF EXISTS `masas`;
CREATE TABLE IF NOT EXISTS `masas` (
  `MASAS_ID` int(2) NOT NULL,
  `MASAS_TITULO` varchar(25) NOT NULL,
  `MASAS_DEBE` float(9,2) NOT NULL DEFAULT 0.00,
  `MASA_HABER` float(9,2) NOT NULL DEFAULT 0.00
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `masas`
--

INSERT INTO `masas` (`MASAS_ID`, `MASAS_TITULO`, `MASAS_DEBE`, `MASA_HABER`) VALUES
(10, 'ACTIVO', 0.00, 0.00),
(20, 'PASIVO', 0.00, 0.00),
(30, 'NETO', 0.00, 0.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

DROP TABLE IF EXISTS `perfil`;
CREATE TABLE IF NOT EXISTS `perfil` (
  `ID` tinyint(5) NOT NULL,
  `APERTURA` tinyint(1) NOT NULL,
  `CIERRE` tinyint(1) NOT NULL,
  `ALTA_CUENTAS` tinyint(1) NOT NULL,
  `ALTA_CUENTAS_MAYOR` tinyint(1) NOT NULL,
  `CONSULTA_SALDO_CUENTAS` tinyint(1) NOT NULL,
  `CONSULTA_MAYOR` tinyint(1) NOT NULL,
  `FACTURACION` tinyint(1) NOT NULL,
  `PEDIDOS_PROVEEDORES` tinyint(1) NOT NULL,
  `PEDIDOS_CLIENTES` tinyint(1) NOT NULL,
  `ALBARANES_CLIENTES` tinyint(1) NOT NULL,
  `CONFECCION_BALANCES` tinyint(1) NOT NULL,
  `CONFECCION_TARFIFAS` tinyint(1) NOT NULL,
  `CONFECCION_INVENTARIOS` tinyint(1) NOT NULL,
  `CONSULTA_ARTICULOS` tinyint(1) NOT NULL,
  `BORRAR_CUENTAS` tinyint(1) NOT NULL,
  `BORRAR_CLIENTES` tinyint(1) NOT NULL,
  `BORRAR_ARTICULOS` tinyint(1) NOT NULL,
  `MODIFICAR_ARTICULOS` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referencias`
--

DROP TABLE IF EXISTS `referencias`;
CREATE TABLE IF NOT EXISTS `referencias` (
  `ID_USUARIO` tinyint(5) NOT NULL,
  `FECHA_CONTABLE` date NOT NULL,
  `ASIENTO_CONTABLE` tinyint(6) UNSIGNED NOT NULL DEFAULT 0,
  `APUNTE_CONTABLE` tinyint(6) UNSIGNED NOT NULL DEFAULT 0,
  `APERTURA_DEBE` int(9) NOT NULL DEFAULT 0,
  `APERTURA_HABER` int(9) NOT NULL DEFAULT 0,
  `DEBE_ASIENTO_ACTUAL` decimal(11,2) NOT NULL DEFAULT 0.00,
  `HABER_ASIENTO_ACTUAL` decimal(11,2) NOT NULL DEFAULT 0.00,
  `NUM_FACTURA` int(6) NOT NULL DEFAULT 0,
  `NUM_PEDIDO` int(6) NOT NULL DEFAULT 0,
  `NUM_ALBARAN` int(6) NOT NULL DEFAULT 0,
  `NUM_RECIBO` int(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID_USUARIO`)
) ENGINE=MyISAM AUTO_INCREMENT=128 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `referencias`
--

INSERT INTO `referencias` (`ID_USUARIO`, `FECHA_CONTABLE`, `ASIENTO_CONTABLE`, `APUNTE_CONTABLE`, `APERTURA_DEBE`, `APERTURA_HABER`, `DEBE_ASIENTO_ACTUAL`, `HABER_ASIENTO_ACTUAL`, `NUM_FACTURA`, `NUM_PEDIDO`, `NUM_ALBARAN`, `NUM_RECIBO`) VALUES
(116, '1999-12-16', 16, 16, 0, 0, '0.00', '0.00', 0, 0, 0, 0),
(109, '2020-11-01', 4, 22, 0, 0, '0.00', '0.00', 0, 0, 0, 0),
(117, '1991-11-11', 5, 22, 0, 0, '0.00', '0.00', 0, 0, 0, 0),
(110, '1234-12-11', 6, 22, 0, 0, '0.00', '0.00', 0, 0, 0, 0),
(111, '4321-11-21', 7, 22, 0, 0, '0.00', '0.00', 0, 0, 0, 0),
(112, '1111-11-22', 8, 22, 0, 0, '0.00', '0.00', 0, 0, 0, 0),
(113, '2222-11-01', 9, 22, 0, 0, '0.00', '0.00', 0, 0, 0, 0),
(114, '3333-11-22', 10, 22, 0, 0, '0.00', '0.00', 0, 0, 0, 0),
(115, '5555-11-11', 15, 60, 0, 0, '0.00', '0.00', 0, 0, 0, 0),
(118, '2020-10-14', 12, 0, 0, 0, '0.00', '0.00', 0, 0, 0, 0),
(119, '2020-10-14', 12, 0, 0, 0, '0.00', '0.00', 0, 0, 0, 0),
(120, '2020-10-14', 14, 0, 0, 0, '0.00', '0.00', 0, 0, 0, 0),
(121, '2020-10-14', 15, 0, 0, 0, '0.00', '0.00', 0, 0, 0, 0),
(122, '2020-10-14', 16, 0, 0, 0, '0.00', '0.00', 0, 0, 0, 0),
(123, '2020-10-14', 17, 0, 0, 0, '0.00', '0.00', 0, 0, 0, 0),
(125, '1221-12-21', 23, 0, 0, 0, '0.00', '0.00', 0, 0, 0, 0),
(126, '1234-12-13', 141, 0, 0, 0, '0.00', '0.00', 0, 0, 0, 0),
(124, '2020-12-04', 1, 0, 0, 0, '0.00', '0.00', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

DROP TABLE IF EXISTS `sedes`;
CREATE TABLE IF NOT EXISTS `sedes` (
  `ID_SEDE` int(3) UNSIGNED NOT NULL,
  `NOMBRE` varchar(30) NOT NULL,
  `DESCRIPCION` varchar(40) NOT NULL,
  `DIRECCION` varchar(40) NOT NULL,
  `ID_RESPONSABLE` tinyint(5) NOT NULL,
  PRIMARY KEY (`ID_SEDE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sedes`
--

INSERT INTO `sedes` (`ID_SEDE`, `NOMBRE`, `DESCRIPCION`, `DIRECCION`, `ID_RESPONSABLE`) VALUES
(10, 'Sede Central', 'Domicilio Social. JJestora', 'Av. de las Tribulaciones, X', 1),
(30, 'Sede Central', 'Domicilio Social. Gestora', 'Av. de las Tribulaciones, X', 1),
(44, 'ASDFADF', '', 'ASDS', 3),
(21, 'Sucursal del Sur', 'DepÃ³sito regulador', 'Mas alla', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `ID_USUARIO` tinyint(5) UNSIGNED NOT NULL,
  `NOMBRE` varchar(40) NOT NULL,
  `PASSWORD` varchar(15) NOT NULL,
  `ID_PERFIL` tinyint(5) UNSIGNED NOT NULL,
  `ID_EMPLEADO` tinyint(5) UNSIGNED NOT NULL,
  PRIMARY KEY (`ID_USUARIO`)
) ENGINE=MyISAM AUTO_INCREMENT=125 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_USUARIO`, `NOMBRE`, `PASSWORD`, `ID_PERFIL`, `ID_EMPLEADO`) VALUES
(124, 'Feliciano', 'tatoacaymo1945', 1, 1),
(3, 'Maribel', 'tapon458', 1, 2),
(5, 'Feli', 'tatoacaymo1945', 1, 3),
(7, 'ElCuarto', 'tatoacaymo1945', 1, 2),
(8, 'ElCuarto', 'tatoacaymo1945', 1, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios` ADD FULLTEXT KEY `NOMBRE` (`NOMBRE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
