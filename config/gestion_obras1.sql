-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 12-03-2025 a las 11:57:30
-- Versión del servidor: 9.1.0
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestion_obras`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avances`
--

DROP TABLE IF EXISTS `avances`;
CREATE TABLE IF NOT EXISTS `avances` (
  `id_avance` int NOT NULL AUTO_INCREMENT,
  `id_item` int NOT NULL,
  `cantidad_avance` decimal(10,0) NOT NULL,
  `f_avance` date NOT NULL,
  `estado_avance` int NOT NULL,
  `observaciones_avance` varchar(255) NOT NULL,
  PRIMARY KEY (`id_avance`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_recurso`
--

DROP TABLE IF EXISTS `categoria_recurso`;
CREATE TABLE IF NOT EXISTS `categoria_recurso` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `descripcion_categoria` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `estado_categoria` int NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computo_obra`
--

DROP TABLE IF EXISTS `computo_obra`;
CREATE TABLE IF NOT EXISTS `computo_obra` (
  `id_computo` int NOT NULL AUTO_INCREMENT,
  `id_obra` int NOT NULL,
  `id_item` int NOT NULL,
  `id_unidad` int NOT NULL,
  `cantidad_computo` decimal(10,0) NOT NULL,
  `observaciones_computo` varchar(100) NOT NULL,
  `estado_computo` int NOT NULL,
  PRIMARY KEY (`id_computo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `costo_item`
--

DROP TABLE IF EXISTS `costo_item`;
CREATE TABLE IF NOT EXISTS `costo_item` (
  `id_costo_item` int NOT NULL AUTO_INCREMENT,
  `id_item` int NOT NULL,
  `id_recurso` int NOT NULL,
  `rendimiento` decimal(5,0) NOT NULL,
  `costo_item` decimal(12,2) NOT NULL,
  `estado_costo_item` int NOT NULL,
  `descripcion_costo_item` varchar(255) NOT NULL,
  PRIMARY KEY (`id_costo_item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `costo_obra`
--

DROP TABLE IF EXISTS `costo_obra`;
CREATE TABLE IF NOT EXISTS `costo_obra` (
  `id_costo_obra` int NOT NULL AUTO_INCREMENT,
  `id_obra` int NOT NULL,
  `id_item` int NOT NULL,
  `cantidad_computo` int NOT NULL,
  `costo_item` int NOT NULL,
  `costo_item_obra` int NOT NULL,
  `estado_costo_obra` int NOT NULL,
  `descripcion_costo_obra` varchar(255) NOT NULL,
  PRIMARY KEY (`id_costo_obra`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `id_empresa` int NOT NULL AUTO_INCREMENT,
  `cuit` varchar(11) NOT NULL,
  `razon_social` varchar(50) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `estado_empresa` int NOT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impuestos`
--

DROP TABLE IF EXISTS `impuestos`;
CREATE TABLE IF NOT EXISTS `impuestos` (
  `id_impuesto` int NOT NULL AUTO_INCREMENT,
  `descripcion_impuesto` varchar(255) NOT NULL,
  `monto_impuesto` decimal(9,2) NOT NULL,
  `porcentaje_impuesto` decimal(10,0) NOT NULL,
  `id_subcategoria` int NOT NULL,
  `id_categoria` int NOT NULL,
  `estado_impuesto` int NOT NULL,
  PRIMARY KEY (`id_impuesto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `id_item` int NOT NULL AUTO_INCREMENT,
  `id_rubro` int NOT NULL,
  `descripcion_item` int NOT NULL,
  `id_unidad` int NOT NULL,
  `estado_item` int NOT NULL,
  PRIMARY KEY (`id_item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obra`
--

DROP TABLE IF EXISTS `obra`;
CREATE TABLE IF NOT EXISTS `obra` (
  `id_obra` int NOT NULL AUTO_INCREMENT,
  `descripcion_obra` varchar(255) NOT NULL,
  `id_cliente` int NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ubicacion` varchar(255) NOT NULL,
  `id_empresa` int NOT NULL,
  `estado_obra` int NOT NULL,
  PRIMARY KEY (`id_obra`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

DROP TABLE IF EXISTS `permisos`;
CREATE TABLE IF NOT EXISTS `permisos` (
  `id_permiso` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_permiso`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos_roles`
--

DROP TABLE IF EXISTS `permisos_roles`;
CREATE TABLE IF NOT EXISTS `permisos_roles` (
  `id_rol` int NOT NULL,
  `id_permiso` int NOT NULL,
  PRIMARY KEY (`id_rol`,`id_permiso`),
  KEY `id_permiso` (`id_permiso`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos_usuarios`
--

DROP TABLE IF EXISTS `permisos_usuarios`;
CREATE TABLE IF NOT EXISTS `permisos_usuarios` (
  `id_usuario` int NOT NULL,
  `id_permiso` int NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_permiso`),
  KEY `id_permiso` (`id_permiso`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

DROP TABLE IF EXISTS `personal`;
CREATE TABLE IF NOT EXISTS `personal` (
  `id_personal` int NOT NULL AUTO_INCREMENT,
  `id_persona` int NOT NULL,
  `id_rol` int NOT NULL,
  `observaciones` varchar(255) NOT NULL,
  `f_ingreso` date NOT NULL,
  `f_despido` date NOT NULL,
  `estado_personal` int NOT NULL,
  PRIMARY KEY (`id_personal`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

DROP TABLE IF EXISTS `personas`;
CREATE TABLE IF NOT EXISTS `personas` (
  `id_persona` int NOT NULL AUTO_INCREMENT,
  `dni` int NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `estado_persona` int NOT NULL,
  PRIMARY KEY (`id_persona`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_obra`
--

DROP TABLE IF EXISTS `persona_obra`;
CREATE TABLE IF NOT EXISTS `persona_obra` (
  `id_persona` int NOT NULL,
  `id_obra` int NOT NULL,
  `id_rol` int NOT NULL,
  `estado_persona_obra` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recursos`
--

DROP TABLE IF EXISTS `recursos`;
CREATE TABLE IF NOT EXISTS `recursos` (
  `id_recurso` int NOT NULL AUTO_INCREMENT,
  `id_subcategoria` int NOT NULL,
  `id_categoria` int NOT NULL,
  `descripcion_recurso` int NOT NULL,
  `id_unidad` int NOT NULL,
  `costo_base` decimal(12,2) NOT NULL,
  `estado_recurso` int NOT NULL,
  PRIMARY KEY (`id_recurso`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre`) VALUES
(1, 'super_admin'),
(2, 'admin'),
(3, 'profesional'),
(4, 'capataz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rubro`
--

DROP TABLE IF EXISTS `rubro`;
CREATE TABLE IF NOT EXISTS `rubro` (
  `id_rubro` int NOT NULL AUTO_INCREMENT,
  `descripcion_rubro` varchar(255) NOT NULL,
  `estado_rubro` int NOT NULL,
  PRIMARY KEY (`id_rubro`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategoria_recurso`
--

DROP TABLE IF EXISTS `subcategoria_recurso`;
CREATE TABLE IF NOT EXISTS `subcategoria_recurso` (
  `id_subcategoria` int NOT NULL AUTO_INCREMENT,
  `id_categoria` int NOT NULL,
  `descripcion_scategoria` varchar(255) NOT NULL,
  `estado_scategoria` int NOT NULL,
  PRIMARY KEY (`id_subcategoria`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

DROP TABLE IF EXISTS `unidades`;
CREATE TABLE IF NOT EXISTS `unidades` (
  `id_unidad` int NOT NULL AUTO_INCREMENT,
  `abreviatura` varchar(6) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `observaciones` int NOT NULL,
  `estado_unidad` int NOT NULL,
  PRIMARY KEY (`id_unidad`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `id_empresa` int DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`),
  KEY `id_empresa` (`id_empresa`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
