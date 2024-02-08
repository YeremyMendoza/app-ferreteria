-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-02-2024 a las 00:30:07
-- Versión del servidor: 10.1.29-MariaDB
-- Versión de PHP: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ferreteria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `COD_ARTICULO` int(11) NOT NULL,
  `DESCRIPCION` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PRECIO_UNITARIO` int(11) DEFAULT NULL,
  `DIAS_VIDA_UTIL` int(11) DEFAULT NULL,
  `COD_MARCA` int(11) DEFAULT NULL,
  `COD_PROVEEDOR` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`COD_ARTICULO`, `DESCRIPCION`, `PRECIO_UNITARIO`, `DIAS_VIDA_UTIL`, `COD_MARCA`, `COD_PROVEEDOR`) VALUES
(1, 'Articulo1', 100, 100, 4, 2),
(2, 'Articulo2', 10, 10, 2, 2),
(3, 'Articulo3', 10, 10, 1, 2),
(4, 'Articulo4', 10, 10, 1, 1),
(5, 'Articulo5', 10, 10, 1, 1),
(6, 'Articulo6', 10, 10, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `COD_BITACORA` int(11) NOT NULL,
  `FECHA` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NOMBRE_FORMULARIO` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `COD_EMPLEADO` int(11) DEFAULT NULL,
  `COD_CARGO` int(11) DEFAULT NULL,
  `COD_SUCURSAL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `COD_CARGO` int(11) NOT NULL,
  `NOMBRE` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`COD_CARGO`, `NOMBRE`) VALUES
(1, 'administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `COD_CLIENTE` int(11) NOT NULL,
  `CI` varchar(13) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NOMBRE` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TELEFONO` double DEFAULT NULL,
  `DIRECCION` varchar(120) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NIT` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CORREO` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `COD_TIPO_CLIENTE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`COD_CLIENTE`, `CI`, `NOMBRE`, `TELEFONO`, `DIRECCION`, `NIT`, `CORREO`, `COD_TIPO_CLIENTE`) VALUES
(1, '123456', 'Cliente1', 2312311, 'Direccion', NULL, NULL, 2),
(2, '3213123', 'Cliente2', 2231312, 'Direccion2', '2312312', 'cliente2@gmail,com', 1),
(3, 'Proveedor3', 'Direccion3', 890890, 'proveedor3@gmail.com', '10101010', 'asdasd', 1),
(4, 'Proveedor4', 'Direccion4', 89089, 'proveedor4@gmail.com', '1010101', 'asdadsd', 1),
(5, 'Proveedor5', 'Direccion5', 890891, 'proveedor5@gmail.com', '1010100', 'asdadsda', 1),
(6, '6136265', 'Yeremy Brayan', 32131, 'Direccion6', '8312001', 'juda740@gmail.com', 1),
(7, '7', 'Nombre7', 77777, 'proveedor7@gmail.com', '7777777', 'cliente7@gmail.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `id` int(11) NOT NULL,
  `CANT_ARTICULOS_COMPRADOS` int(11) DEFAULT NULL,
  `COSTO_UNITARIO` int(11) DEFAULT NULL,
  `COSTO_ACUMULADO` int(11) DEFAULT NULL,
  `COD_ARTICULO` int(11) DEFAULT NULL,
  `COD_FACTURA` int(11) DEFAULT NULL,
  `COD_SUCURSAL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `detalle_factura`
--

INSERT INTO `detalle_factura` (`id`, `CANT_ARTICULOS_COMPRADOS`, `COSTO_UNITARIO`, `COSTO_ACUMULADO`, `COD_ARTICULO`, `COD_FACTURA`, `COD_SUCURSAL`) VALUES
(6, 1, 1, 1, 1, 12102, 1001),
(8, 7, 7, 7, 1, 12102, 1001),
(10, 1, 1, 1, 1, 12101, 1001),
(11, 10, 1, 10, 1, 12103, 1001),
(12, 2, 100, 200, 1, 12101, 1001),
(13, 10, 100, 1000, 1, 12101, 1001);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_planilla`
--

CREATE TABLE `detalle_planilla` (
  `COD_PLANILLA` int(11) NOT NULL,
  `COD_EMPLEADO` int(11) NOT NULL,
  `IVA` int(11) DEFAULT NULL,
  `RC_IVA` int(11) DEFAULT NULL,
  `BONIFICACION` int(11) DEFAULT NULL,
  `SUELDO_NETO` int(11) DEFAULT NULL,
  `COD_CARGO` int(11) DEFAULT NULL,
  `COD_SUCURSAL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `COD_EMPLEADO` int(11) NOT NULL,
  `COD_CARGO` int(11) NOT NULL,
  `COD_SUCURSAL` int(11) NOT NULL,
  `CI` varchar(13) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NOMBRE` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `SUELDO_BASE` int(11) DEFAULT NULL,
  `DIRECCION` varchar(120) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TELEFONO_FIJO` int(11) DEFAULT NULL,
  `TELEFONO_MOVIL` int(11) DEFAULT NULL,
  `CORREO` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`COD_EMPLEADO`, `COD_CARGO`, `COD_SUCURSAL`, `CI`, `NOMBRE`, `SUELDO_BASE`, `DIRECCION`, `TELEFONO_FIJO`, `TELEFONO_MOVIL`, `CORREO`) VALUES
(1, 1, 1001, '6136265', 'Yeremy Brayan', 2000, 'Z. Nuevos Horizontes', 2675657, 73503077, 'juda740@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `COD_FACTURA` int(11) NOT NULL,
  `COD_SUCURSAL` int(11) NOT NULL,
  `FECHA` date DEFAULT NULL,
  `DESCUENTO` int(11) DEFAULT NULL,
  `SUBTOTAL` int(11) DEFAULT NULL,
  `IMPUESTO_COBRADO` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `COD_EMPLEADO` int(11) DEFAULT NULL,
  `COD_CARGO` int(11) DEFAULT NULL,
  `COD_CLIENTE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`COD_FACTURA`, `COD_SUCURSAL`, `FECHA`, `DESCUENTO`, `SUBTOTAL`, `IMPUESTO_COBRADO`, `TOTAL`, `COD_EMPLEADO`, `COD_CARGO`, `COD_CLIENTE`) VALUES
(12101, 1001, '2022-07-15', 10, 120, 15, 105, 1, 1, 1),
(12102, 1001, '2022-07-15', 10, 120, 15, 105, 1, 1, 1),
(12103, 1001, '2022-07-15', 10, 120, 15, 105, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventarios`
--

CREATE TABLE `inventarios` (
  `COD_SUCURSAL` int(11) NOT NULL,
  `COD_ARTICULO` int(11) NOT NULL,
  `CANT_BODEGA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `COD_MARCA` int(11) NOT NULL,
  `NOMBRE` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`COD_MARCA`, `NOMBRE`) VALUES
(1, 'Marca1'),
(2, 'Marca2'),
(3, 'Marca3'),
(4, 'Marca4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `COD_CARGO` int(11) DEFAULT NULL,
  `PERMISO_INVENTARIO` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PERMISO_FACTURACION` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PERMISO_REPORTES` char(1) COLLATE utf8_spanish_ci DEFAULT NULL,
  `PERMISO_PLANILLA` char(1) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planillas`
--

CREATE TABLE `planillas` (
  `COD_PLANILLA` int(11) NOT NULL,
  `FECHA` date DEFAULT NULL,
  `COD_EMPLEADO` int(11) DEFAULT NULL,
  `COD_CARGO` int(11) DEFAULT NULL,
  `COD_SUCURSAL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `COD_PROVEEDOR` int(11) NOT NULL,
  `NOMBRE` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DIRECCION` varchar(120) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TELEFONO` int(11) DEFAULT NULL,
  `CORREO` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `NIT` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`COD_PROVEEDOR`, `NOMBRE`, `DIRECCION`, `TELEFONO`, `CORREO`, `NIT`) VALUES
(1, 'Proveedor 1', 'La Paz', 2812318, 'proveedor1@gmail.com', '81311231'),
(2, 'Proveedor2', 'La Paz', 2121211, 'proveedor2@gmail.com', '8317271');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `COD_SUCURSAL` int(11) NOT NULL,
  `NOMBRE` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `TELEFONO` int(11) DEFAULT NULL,
  `NIT` varchar(14) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`COD_SUCURSAL`, `NOMBRE`, `TELEFONO`, `NIT`) VALUES
(1001, 'INCOS', 2231231, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cliente`
--

CREATE TABLE `tipo_cliente` (
  `COD_TIPO_CLIENTE` int(11) NOT NULL,
  `DESCRIPCION` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `DESCUENTO` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_cliente`
--

INSERT INTO `tipo_cliente` (`COD_TIPO_CLIENTE`, `DESCRIPCION`, `DESCUENTO`) VALUES
(1, 'Antiguo', 15),
(2, 'Nuevo', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_sistema`
--

CREATE TABLE `usuarios_sistema` (
  `COD_EMPLEADO` int(11) NOT NULL,
  `COD_CARGO` int(11) NOT NULL,
  `COD_SUCURSAL` int(11) NOT NULL,
  `USUARIO` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `CONTRASEÑA` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios_sistema`
--

INSERT INTO `usuarios_sistema` (`COD_EMPLEADO`, `COD_CARGO`, `COD_SUCURSAL`, `USUARIO`, `CONTRASEÑA`) VALUES
(1, 1, 1001, 'Yeremy', '1234');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`COD_ARTICULO`),
  ADD KEY `FK_ARTICULOS_COD_MARCA` (`COD_MARCA`),
  ADD KEY `FK_ARTICULOS_COD_PROVEEDOR` (`COD_PROVEEDOR`);

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`COD_BITACORA`),
  ADD KEY `FK_BITACORA` (`COD_EMPLEADO`,`COD_CARGO`,`COD_SUCURSAL`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`COD_CARGO`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`COD_CLIENTE`),
  ADD UNIQUE KEY `CI` (`CI`),
  ADD UNIQUE KEY `NIT` (`NIT`),
  ADD UNIQUE KEY `CORREO` (`CORREO`),
  ADD KEY `FK_COD_TIPO_CLIENTE` (`COD_TIPO_CLIENTE`);

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_DET_FAC` (`COD_FACTURA`,`COD_SUCURSAL`),
  ADD KEY `FK_DET_FAC_COD_ARTICULO` (`COD_ARTICULO`);

--
-- Indices de la tabla `detalle_planilla`
--
ALTER TABLE `detalle_planilla`
  ADD PRIMARY KEY (`COD_PLANILLA`,`COD_EMPLEADO`),
  ADD KEY `FK_DET_PLN` (`COD_EMPLEADO`,`COD_CARGO`,`COD_SUCURSAL`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`COD_EMPLEADO`,`COD_CARGO`,`COD_SUCURSAL`),
  ADD UNIQUE KEY `CI` (`CI`),
  ADD UNIQUE KEY `CORREO` (`CORREO`),
  ADD KEY `COD_CARGO` (`COD_CARGO`),
  ADD KEY `COD_SUCURSAL` (`COD_SUCURSAL`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`COD_FACTURA`,`COD_SUCURSAL`),
  ADD KEY `FK_FACTURA` (`COD_EMPLEADO`,`COD_CARGO`,`COD_SUCURSAL`);

--
-- Indices de la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD PRIMARY KEY (`COD_SUCURSAL`,`COD_ARTICULO`),
  ADD KEY `FK_INVENTARIOS_COD_ARTICULO` (`COD_ARTICULO`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`COD_MARCA`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD KEY `FK_PERMISOS_COD_CARGO` (`COD_CARGO`);

--
-- Indices de la tabla `planillas`
--
ALTER TABLE `planillas`
  ADD PRIMARY KEY (`COD_PLANILLA`),
  ADD KEY `FK_PLANILLAS` (`COD_EMPLEADO`,`COD_CARGO`,`COD_SUCURSAL`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`COD_PROVEEDOR`),
  ADD UNIQUE KEY `CORREO` (`CORREO`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`COD_SUCURSAL`),
  ADD UNIQUE KEY `NIT` (`NIT`);

--
-- Indices de la tabla `tipo_cliente`
--
ALTER TABLE `tipo_cliente`
  ADD PRIMARY KEY (`COD_TIPO_CLIENTE`);

--
-- Indices de la tabla `usuarios_sistema`
--
ALTER TABLE `usuarios_sistema`
  ADD PRIMARY KEY (`COD_EMPLEADO`,`COD_CARGO`,`COD_SUCURSAL`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD CONSTRAINT `FK_ARTICULOS_COD_MARCA` FOREIGN KEY (`COD_MARCA`) REFERENCES `marcas` (`COD_MARCA`),
  ADD CONSTRAINT `FK_ARTICULOS_COD_PROVEEDOR` FOREIGN KEY (`COD_PROVEEDOR`) REFERENCES `proveedores` (`COD_PROVEEDOR`);

--
-- Filtros para la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD CONSTRAINT `FK_BITACORA` FOREIGN KEY (`COD_EMPLEADO`,`COD_CARGO`,`COD_SUCURSAL`) REFERENCES `usuarios_sistema` (`COD_EMPLEADO`, `COD_CARGO`, `COD_SUCURSAL`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `FK_COD_TIPO_CLIENTE` FOREIGN KEY (`COD_TIPO_CLIENTE`) REFERENCES `tipo_cliente` (`COD_TIPO_CLIENTE`);

--
-- Filtros para la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD CONSTRAINT `FK_DET_FAC` FOREIGN KEY (`COD_FACTURA`,`COD_SUCURSAL`) REFERENCES `facturas` (`COD_FACTURA`, `COD_SUCURSAL`),
  ADD CONSTRAINT `FK_DET_FAC_COD_ARTICULO` FOREIGN KEY (`COD_ARTICULO`) REFERENCES `articulos` (`COD_ARTICULO`);

--
-- Filtros para la tabla `detalle_planilla`
--
ALTER TABLE `detalle_planilla`
  ADD CONSTRAINT `FK_DET_PLN` FOREIGN KEY (`COD_EMPLEADO`,`COD_CARGO`,`COD_SUCURSAL`) REFERENCES `empleado` (`COD_EMPLEADO`, `COD_CARGO`, `COD_SUCURSAL`),
  ADD CONSTRAINT `FK_DET_PLN_COD_PLANILLA` FOREIGN KEY (`COD_PLANILLA`) REFERENCES `planillas` (`COD_PLANILLA`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`COD_CARGO`) REFERENCES `cargos` (`COD_CARGO`),
  ADD CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`COD_SUCURSAL`) REFERENCES `sucursales` (`COD_SUCURSAL`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `FK_FACTURA` FOREIGN KEY (`COD_EMPLEADO`,`COD_CARGO`,`COD_SUCURSAL`) REFERENCES `usuarios_sistema` (`COD_EMPLEADO`, `COD_CARGO`, `COD_SUCURSAL`);

--
-- Filtros para la tabla `inventarios`
--
ALTER TABLE `inventarios`
  ADD CONSTRAINT `FK_INVENTARIOS_COD_ARTICULO` FOREIGN KEY (`COD_ARTICULO`) REFERENCES `articulos` (`COD_ARTICULO`),
  ADD CONSTRAINT `FK_INVENTARIOS_COD_SUCURSAL` FOREIGN KEY (`COD_SUCURSAL`) REFERENCES `sucursales` (`COD_SUCURSAL`);

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `FK_PERMISOS_COD_CARGO` FOREIGN KEY (`COD_CARGO`) REFERENCES `cargos` (`COD_CARGO`);

--
-- Filtros para la tabla `planillas`
--
ALTER TABLE `planillas`
  ADD CONSTRAINT `FK_PLANILLAS` FOREIGN KEY (`COD_EMPLEADO`,`COD_CARGO`,`COD_SUCURSAL`) REFERENCES `empleado` (`COD_EMPLEADO`, `COD_CARGO`, `COD_SUCURSAL`);

--
-- Filtros para la tabla `usuarios_sistema`
--
ALTER TABLE `usuarios_sistema`
  ADD CONSTRAINT `FK_USUARIOS_SISTEMAS` FOREIGN KEY (`COD_EMPLEADO`,`COD_CARGO`,`COD_SUCURSAL`) REFERENCES `empleado` (`COD_EMPLEADO`, `COD_CARGO`, `COD_SUCURSAL`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
