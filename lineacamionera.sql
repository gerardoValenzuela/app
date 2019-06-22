-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-06-2019 a las 07:43:40
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `lineacamionera`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boletos`
--
use lineacamionera;

CREATE TABLE `boletos` (
  `id` bigint(20) NOT NULL,
  `idCorrida` int(11) NOT NULL,
  `curpBoletero` varchar(18) NOT NULL,
  `curp` varchar(18) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidoPaterno` varchar(30) NOT NULL,
  `apellidoMaterno` varchar(30) NOT NULL,
  `lugardeVenta` varchar(20) NOT NULL,
  `asiento` int(11) NOT NULL,
  `edad` int(11) NOT NULL,
  `tipoPasajero` varchar(20) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `precioRuta` decimal(10,0) NOT NULL,
  `descuentoAplicado` decimal(10,0) NOT NULL,
  `saldo` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `camiones`
--

CREATE TABLE `camiones` (
  `placa` varchar(20) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `modelo` varchar(30) NOT NULL,
  `numerodeAsientos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corridas`
--

CREATE TABLE `corridas` (
  `id` int(11) NOT NULL,
  `idRuta` int(20) NOT NULL,
  `consecutivo` int(11) NOT NULL,
  `horadeSalida` timestamp NULL DEFAULT NULL,
  `horadeLlegada` timestamp NULL DEFAULT NULL,
  `placaCamion` int(11) DEFAULT NULL,
  `curpChofer` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuentos`
--

CREATE TABLE `descuentos` (
  `tipo` varchar(20) NOT NULL,
  `porcentaje` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `descuentos`
--

INSERT INTO `descuentos` (`tipo`, `porcentaje`) VALUES
('General', '100'),
('Adulto Mayor', '50'),
('General', '100'),
('Adulto Mayor', '50'),
('Maestro', '75'),
('Estudiante', '50'),
('Maestro', '75'),
('Estudiante', '50'),
('Menor de Edad', '50'),
('Menor de Edad', '50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagosdesalario`
--

CREATE TABLE `pagosdesalario` (
  `curp` varchar(18) NOT NULL,
  `consecutivo` int(11) NOT NULL,
  `iniciodePeriodo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `findePeriodo` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pagoBase` decimal(10,0) NOT NULL,
  `comisiones` decimal(10,0) NOT NULL,
  `descuentos` decimal(10,0) NOT NULL,
  `saldo` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodosvacacionales`
--

CREATE TABLE `periodosvacacionales` (
  `id` varchar(50) NOT NULL,
  `fechadeInicio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fechadeTerminacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutas`
--

CREATE TABLE `rutas` (
  `id` int(11) NOT NULL,
  `origen` varchar(20) NOT NULL,
  `destino` varchar(20) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `tiempoEstimadodeRecorrido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rutas`
--

INSERT INTO `rutas` (`id`, `origen`, `destino`, `precio`, `tiempoEstimadodeRecorrido`) VALUES
(1, 'Jalapa', 'Misantla', '100', 90),
(2, 'Jalapa', 'Perote', '90', 90),
(3, 'Jalapa', 'Cardel', '100', 90),
(4, 'Jalapa', 'Totutla', '120', 120),
(5, 'Jalapa', 'Alto Lucero', '100', 90),
(6, 'Misantla', 'Jalapa', '100', 90),
(7, 'Misantla', 'Perote', '100', 90),
(8, 'Misantla', 'Cardel', '100', 90),
(9, 'Misantla', 'Totutla', '100', 90),
(10, 'Misantla', 'Alto Lucero', '100', 90),
(11, 'Perote', 'Jalapa', '100', 90),
(12, 'Perote', 'Misantla', '100', 90),
(13, 'Perote', 'Cardel', '100', 90),
(14, 'Perote', 'Totutla', '100', 90),
(15, 'Perote', 'Alto Lucero', '100', 90),
(16, 'Cardel', 'Jalapa', '100', 90),
(17, 'Cardel', 'Misantla', '100', 90),
(18, 'Cardel', 'Perote', '100', 90),
(19, 'Cardel', 'Totutla', '100', 90),
(20, 'Cardel', 'Alto Lucero', '100', 90),
(21, 'Totutla', 'Jalapa', '100', 90),
(22, 'Totutla', 'Misantla', '100', 90),
(23, 'Totutla', 'Perote', '100', 90),
(24, 'Totutla', 'Cardel', '100', 90),
(25, 'Totutla', 'Alto Lucero', '100', 90),
(26, 'Alto Lucero', 'Jalapa', '100', 90),
(27, 'Alto Lucero', 'Misantla', '100', 90),
(28, 'Alto Lucero', 'Perote', '100', 90),
(29, 'Alto Lucero', 'Cardel', '100', 90),
(30, 'Alto Lucero', 'Totutla', '100', 90);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `terminales`
--

CREATE TABLE `terminales` (
  `idTerminal` int(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `tipo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `terminales`
--

INSERT INTO `terminales` (`idTerminal`, `nombre`, `tipo`) VALUES
(1, 'Jalapa', 'Central'),
(2, 'Misantla', 'Destino'),
(3, 'Perote', 'Destino'),
(4, 'Cardel', 'Destino'),
(5, 'Totutla', 'Destino'),
(6, 'Alto Lucero', 'Destino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajadores`
--

CREATE TABLE `trabajadores` (
  `CURP` varchar(18) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidoPaterno` varchar(50) NOT NULL,
  `apellidoMaterno` varchar(50) NOT NULL,
  `tipodeTrabajo` varchar(30) NOT NULL,
  `RFC` varchar(13) NOT NULL,
  `salario` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `boletos`
--
ALTER TABLE `boletos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `camiones`
--
ALTER TABLE `camiones`
  ADD PRIMARY KEY (`placa`);

--
-- Indices de la tabla `corridas`
--
ALTER TABLE `corridas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagosdesalario`
--
ALTER TABLE `pagosdesalario`
  ADD PRIMARY KEY (`curp`,`consecutivo`);

--
-- Indices de la tabla `periodosvacacionales`
--
ALTER TABLE `periodosvacacionales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rutas`
--
ALTER TABLE `rutas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `terminales`
--
ALTER TABLE `terminales`
  ADD PRIMARY KEY (`idTerminal`);

--
-- Indices de la tabla `trabajadores`
--
ALTER TABLE `trabajadores`
  ADD PRIMARY KEY (`CURP`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `boletos`
--
ALTER TABLE `boletos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rutas`
--
ALTER TABLE `rutas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
