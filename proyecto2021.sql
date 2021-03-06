-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-05-2022 a las 05:31:40
-- Versión del servidor: 5.7.11
-- Versión de PHP: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto2021`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buscaempleado`
--

CREATE TABLE `buscaempleado` (
  `idbusqueda` int(5) NOT NULL,
  `idsucursal` int(8) NOT NULL,
  `edadmin` int(3) NOT NULL,
  `edadmax` int(3) NOT NULL,
  `carrera` int(2) NOT NULL,
  `genero` int(1) NOT NULL,
  `sueldo` int(10) NOT NULL,
  `requisitos` varchar(240) NOT NULL,
  `disponibilidad` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `buscaempleado`
--

INSERT INTO `buscaempleado` (`idbusqueda`, `idsucursal`, `edadmin`, `edadmax`, `carrera`, `genero`, `sueldo`, `requisitos`, `disponibilidad`) VALUES
(10, 16, 18, 30, 3, 1, 20000, 'Caminar', 1),
(11, 16, 18, 45, 4, 1, 9500, 'Existir', 2),
(12, 17, 24, 32, 4, 1, 12000, 'Ser trans', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `idcar` int(3) NOT NULL,
  `carrera` varchar(50) NOT NULL,
  `duracion` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`idcar`, `carrera`, `duracion`) VALUES
(1, 'Analista de Sistemas', 3),
(2, 'Turismo y Gestion Hotelera', 3),
(3, 'Administración de Empresas', 3),
(4, 'Régimen Aduanero  ', 3),
(5, 'Recursos Humanos', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carxuser`
--

CREATE TABLE `carxuser` (
  `idcar` int(3) NOT NULL,
  `iduser` int(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `carxuser`
--

INSERT INTO `carxuser` (`idcar`, `iduser`) VALUES
(1, 1),
(3, 2),
(1, 3),
(2, 2),
(4, 6),
(1, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `idep` int(3) NOT NULL,
  `departamento` varchar(50) NOT NULL,
  `idpro` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`idep`, `departamento`, `idpro`) VALUES
(1, 'Libertador General San Martin', 1),
(2, 'Montecarlo', 1),
(3, 'San Ignacio', 1),
(4, 'Candelaria', 1),
(5, 'Capital', 1),
(6, 'Eldorado', 1),
(7, 'Iguazu', 1),
(8, 'Apostoles', 1),
(9, 'Concepcion', 1),
(10, 'Obera', 1),
(11, 'Leandro N Alem', 1),
(12, 'San Javier', 1),
(13, 'Cainguas', 1),
(14, 'Veinticinco de Mayo', 1),
(15, 'Guarani', 1),
(16, 'San Pedro', 1),
(17, 'General Manuel Belgrano', 1),
(23, 'SD', 1),
(22, 'SD', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `idempresa` int(8) NOT NULL,
  `logo` varchar(20) NOT NULL,
  `empresa` varchar(100) NOT NULL,
  `cuit` int(12) NOT NULL,
  `presidente` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` int(17) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`idempresa`, `logo`, `empresa`, `cuit`, `presidente`, `correo`, `telefono`) VALUES
(34, 'descarga (1).jpg', 'Todo ceramica', 454654, '454654', 'TD@gan.om', 878787878),
(35, 'descar0ga.png', 'Todo rocas', 454654, '454654', 'TD', 23232332);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experiencia`
--

CREATE TABLE `experiencia` (
  `idexp` int(11) NOT NULL,
  `iduser` int(8) NOT NULL,
  `empresa` varchar(100) NOT NULL,
  `puesto` varchar(50) NOT NULL,
  `desde` date DEFAULT NULL,
  `hasta` date NOT NULL,
  `contacto` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `experiencia`
--

INSERT INTO `experiencia` (`idexp`, `iduser`, `empresa`, `puesto`, `desde`, `hasta`, `contacto`) VALUES
(3, 8, 'sdfsd', 'asdasd', '1111-11-11', '1111-11-11', '2222'),
(31, 6, 'yghjgh', 'ghjghj', '0111-11-11', '0111-11-11', '1'),
(30, 6, 'sdfsd', 'asdasd', '0001-11-11', '0001-11-11', '1'),
(32, 7, 'Todo ceramica', 'sdfsd', '2022-03-01', '2022-03-15', '234234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `idgenero` int(1) NOT NULL,
  `tipo` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`idgenero`, `tipo`) VALUES
(1, 'hombre'),
(2, 'mujer'),
(3, 'nobinarix'),
(4, 'otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idiomas`
--

CREATE TABLE `idiomas` (
  `idi` int(2) NOT NULL,
  `idioma` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `idiomas`
--

INSERT INTO `idiomas` (`idi`, `idioma`) VALUES
(1, 'ingles'),
(2, 'español'),
(3, 'portugues'),
(4, 'frances'),
(5, 'aleman'),
(6, 'guarani');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idioxuser`
--

CREATE TABLE `idioxuser` (
  `iduser` int(8) NOT NULL,
  `idi` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `idioxuser`
--

INSERT INTO `idioxuser` (`iduser`, `idi`) VALUES
(6, 1),
(7, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `idloc` int(3) NOT NULL,
  `localidad` varchar(50) NOT NULL,
  `idep` int(3) NOT NULL,
  `idpro` int(8) NOT NULL,
  `idpais` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `localidad`
--

INSERT INTO `localidad` (`idloc`, `localidad`, `idep`, `idpro`, `idpais`) VALUES
(1, 'Puerto Rico', 1, 1, 1),
(2, 'Garuhapé', 1, 1, 1),
(3, 'Capiovi', 1, 1, 1),
(4, 'El Alcazar', 1, 1, 1),
(5, 'Jardin America', 3, 1, 1),
(6, 'Montecarlo', 2, 1, 1),
(7, 'Puerto Iguazu', 7, 1, 1),
(8, 'Eldorado', 6, 1, 1),
(9, 'Posadas', 5, 1, 1),
(10, 'Garupa', 5, 1, 1),
(11, 'Obera', 10, 1, 1),
(12, 'San Ignacio', 3, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `idlog` int(8) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `rol` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`idlog`, `username`, `password`, `rol`) VALUES
(1, 'martin', '$2y$10$r7dyAxL3qa1ScLOcEsjPEOxn0Ss9xMb7DomAwBV3iOTtPylMWOsya', 3),
(3, 'test', '$2y$10$F45nV5H8Pg0mwtyptMyefeSxU4TYqzgm/pfgH/Yvinhv9/AJdhCCu', 3),
(4, 'Admin', '$2y$10$9tti6lrdIduuYLz9PVJ3CuFgXoO7p.Qh3VmD1MhI7jy8FbD6HWGtG', 1),
(5, 'test', '$2y$10$77aUT/P38UafC.Gj8nhNxOrb0aApPeNd3nEdG9ZAFSlMApY8HvZy.', 1),
(6, 'martin', '$2y$10$1drPKbdQOeuuwDMnY/SZYOgHiXjKTGdGWg.ju4PAUZl0wgZng9q22', 3),
(7, 'user1', '$2y$10$U5UIKJk2/fKw/xZDXgawwusP.6d6uPWlxmPPwaedNMBy5/4vuceoW', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalidades`
--

CREATE TABLE `modalidades` (
  `idmodalidad` int(2) NOT NULL,
  `descripcion` varchar(30) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `modalidades`
--

INSERT INTO `modalidades` (`idmodalidad`, `descripcion`) VALUES
(1, 'full-time'),
(2, 'part-time'),
(3, 'trainee'),
(4, 'pasantias'),
(5, 'sin preferencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `idpais` int(11) NOT NULL,
  `pais` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`idpais`, `pais`) VALUES
(1, 'Argentina'),
(2, 'Paraguay'),
(3, 'Brasil'),
(4, 'Uruguay');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `idpro` int(2) NOT NULL,
  `provincia` varchar(50) NOT NULL,
  `idpais` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`idpro`, `provincia`, `idpais`) VALUES
(1, 'Misiones', 1),
(2, 'Corrientes', 1),
(3, 'Formosa', 1),
(4, 'Chaco', 1),
(5, 'Entre Rios', 1),
(6, 'Buenos Aires', 1),
(7, 'Cordoba', 1),
(8, 'Santa Fe', 1),
(9, 'Tierra del Fuego', 1),
(10, 'hola', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idrol` int(2) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idrol`, `descripcion`) VALUES
(1, 'Admin'),
(2, 'Secretaria'),
(3, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `idsucursal` int(3) NOT NULL,
  `empresa` int(8) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `localidad` int(3) NOT NULL,
  `departamento` int(3) NOT NULL,
  `provincia` int(3) NOT NULL,
  `pais` int(11) NOT NULL,
  `telefono` int(17) NOT NULL,
  `gerente` varchar(50) NOT NULL,
  `central` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`idsucursal`, `empresa`, `direccion`, `localidad`, `departamento`, `provincia`, `pais`, `telefono`, `gerente`, `central`) VALUES
(16, 35, 'Lapachos', 1, 1, 1, 1, 986322, 'dgfdg', 1),
(17, 34, 'Americas', 1, 1, 1, 1, 986322, 'dgfdg23', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `iduser` int(8) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `fechanacimiento` date NOT NULL,
  `dni` int(8) NOT NULL,
  `genero` int(1) NOT NULL DEFAULT '4',
  `discapacidades` varchar(200) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contacto` varchar(30) NOT NULL,
  `domicilio` varchar(100) NOT NULL,
  `localidad` int(3) NOT NULL,
  `departamento` int(3) NOT NULL,
  `provincia` int(2) NOT NULL,
  `idpais` int(4) NOT NULL,
  `idloc` int(8) NOT NULL,
  `cursos` varchar(200) DEFAULT NULL,
  `pdf` varchar(100) DEFAULT NULL,
  `licencia` int(1) NOT NULL,
  `auto` int(1) NOT NULL,
  `situacionlab` int(1) NOT NULL,
  `modalidad` int(2) NOT NULL,
  `area` varchar(200) NOT NULL,
  `salariomin` decimal(8,0) NOT NULL,
  `dispoviajar` int(1) NOT NULL,
  `dispomuda` int(1) NOT NULL,
  `habilidades` varchar(200) DEFAULT NULL,
  `foto` varchar(200) DEFAULT NULL,
  `progs` varchar(200) NOT NULL,
  `ecivil` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`iduser`, `usuario`, `apellido`, `fechanacimiento`, `dni`, `genero`, `discapacidades`, `correo`, `contacto`, `domicilio`, `localidad`, `departamento`, `provincia`, `idpais`, `idloc`, `cursos`, `pdf`, `licencia`, `auto`, `situacionlab`, `modalidad`, `area`, `salariomin`, `dispoviajar`, `dispomuda`, `habilidades`, `foto`, `progs`, `ecivil`) VALUES
(1, 'Javier', 'Pineyro', '1999-05-22', 41872061, 1, 'no', 'javi@gmail.com', '3743-121293', 'Eldorado 521', 2, 1, 1, 1, 1, 'Front end', NULL, 1, 1, 1, 1, 'informatica', '50000', 1, 1, NULL, NULL, '', 0),
(2, 'Lore', 'Lopez', '1998-11-02', 40768326, 2, 'no', 'lore@gail', '3784-322454', 'Calle 12', 1, 1, 1, 1, 1, 'No', NULL, 2, 2, 1, 1, 'administracion', '45000', 1, 2, NULL, NULL, '', 0),
(3, 'Pedro', 'Henrriquez', '2000-09-13', 3123233, 1, 'no', 'pedro@gmail', '3754-944382', 'Av roques', 1, 1, 1, 1, 1, 'react js', NULL, 1, 2, 2, 2, 'informatica', '45000', 1, 1, NULL, NULL, '', 0),
(14, 'martin', 'sdsd', '2000-11-11', 232323, 1, '', 'martinchoo_13@hotmail.com', '22', 'xsad', 8, 11, 2, 1, 6, 'dhdfh', 'Sin título 1.pdf', 1, 1, 2, 5, 'direccion', '2222', 2, 2, 'dfhdfh', 'consola.png', 'dfhdfh', 2),
(15, 'marcelo', 'antoni', '1998-09-18', 12442345, 1, '', 'fhfhfhfhf@gmail.com', '323232', 'sarmiento 443', 1, 1, 1, 1, 7, '', '', 1, 1, 2, 1, 'recursos humanos', '62999', 2, 1, 'mirar para adentro', '', 'word,excel, paint', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `buscaempleado`
--
ALTER TABLE `buscaempleado`
  ADD PRIMARY KEY (`idbusqueda`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`idcar`);

--
-- Indices de la tabla `carxuser`
--
ALTER TABLE `carxuser`
  ADD KEY `idcar` (`idcar`),
  ADD KEY `iduser` (`iduser`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`idep`),
  ADD KEY `idpro` (`idpro`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`idempresa`);

--
-- Indices de la tabla `experiencia`
--
ALTER TABLE `experiencia`
  ADD PRIMARY KEY (`idexp`),
  ADD KEY `iduser` (`iduser`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`idgenero`);

--
-- Indices de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  ADD PRIMARY KEY (`idi`);

--
-- Indices de la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`idloc`),
  ADD KEY `idmun` (`idep`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`idlog`);

--
-- Indices de la tabla `modalidades`
--
ALTER TABLE `modalidades`
  ADD PRIMARY KEY (`idmodalidad`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`idpais`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`idpro`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`idsucursal`),
  ADD KEY `idempresa` (`empresa`),
  ADD KEY `provincia` (`provincia`),
  ADD KEY `departamento` (`departamento`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`iduser`),
  ADD KEY `localidad` (`localidad`),
  ADD KEY `departamento` (`departamento`),
  ADD KEY `provincia` (`provincia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `buscaempleado`
--
ALTER TABLE `buscaempleado`
  MODIFY `idbusqueda` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `carrera`
--
ALTER TABLE `carrera`
  MODIFY `idcar` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `idep` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `idempresa` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT de la tabla `experiencia`
--
ALTER TABLE `experiencia`
  MODIFY `idexp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `idgenero` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `idiomas`
--
ALTER TABLE `idiomas`
  MODIFY `idi` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `localidad`
--
ALTER TABLE `localidad`
  MODIFY `idloc` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `idlog` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `modalidades`
--
ALTER TABLE `modalidades`
  MODIFY `idmodalidad` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `idpais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `idpro` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idrol` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `idsucursal` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `iduser` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
