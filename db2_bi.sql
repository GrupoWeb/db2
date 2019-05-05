-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 01-04-2019 a las 18:46:28
-- Versión del servidor: 5.7.17-log
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db2_bi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alimento`
--

CREATE TABLE `alimento` (
  `id_alimento` float NOT NULL,
  `alimento` varchar(128) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `banco`
--

CREATE TABLE `banco` (
  `id_banco` int(11) NOT NULL,
  `banco` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `id_cita` int(11) NOT NULL,
  `id_seguro` int(11) NOT NULL,
  `id_persona_paciente` int(11) NOT NULL,
  `cita` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `usuario_registro` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_cita` date DEFAULT NULL,
  `hora_cita` date DEFAULT NULL,
  `id_clinica` int(11) NOT NULL,
  `activo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita_persona`
--

CREATE TABLE `cita_persona` (
  `id_cita` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_razon_social_p` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clinica`
--

CREATE TABLE `clinica` (
  `id_clinica` int(11) NOT NULL,
  `id_sede` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colonia`
--

CREATE TABLE `colonia` (
  `id_colonia` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `colonia` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compania_telefono`
--

CREATE TABLE `compania_telefono` (
  `id_compania` int(11) NOT NULL,
  `compania` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id_compra` int(11) NOT NULL,
  `id_lote` int(11) DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `no_factura` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `recargos` int(11) DEFAULT NULL,
  `descuentos` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_por_pagar`
--

CREATE TABLE `cuentas_por_pagar` (
  `id_cuenta` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `id_compra` int(11) DEFAULT NULL,
  `id_pago_realizado` int(11) NOT NULL,
  `id_status_pago` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta_proveedore`
--

CREATE TABLE `cuenta_proveedore` (
  `id_cuenta_prov` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `id_banco_cuenta` int(11) NOT NULL,
  `cuenta` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id_departamento` int(11) NOT NULL,
  `id_pais` int(11) NOT NULL,
  `departamento` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `id_compra` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unidad` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_dieta`
--

CREATE TABLE `detalle_dieta` (
  `id_detalle_dieta` float NOT NULL,
  `id_dieta` float NOT NULL,
  `id_alimento` float NOT NULL,
  `cantidad` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `id_tiempo_comida` float NOT NULL,
  `descripcion` varchar(1024) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `id_detalle_factura` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL,
  `id_tipo_servicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pago`
--

CREATE TABLE `detalle_pago` (
  `id_detalle_pago` int(11) NOT NULL,
  `id_pago` int(11) DEFAULT NULL,
  `id_compra` int(11) NOT NULL,
  `id_medio_pago` int(11) DEFAULT NULL,
  `id_cuenta_proveedor` int(11) DEFAULT NULL,
  `id_tipo_documento_pago` int(11) DEFAULT NULL,
  `no_doc_pago` int(11) DEFAULT NULL,
  `monto_pago` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnostico`
--

CREATE TABLE `diagnostico` (
  `id_diagnostico` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_historial_clinico` int(11) NOT NULL,
  `diagnostico` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `id_enfermedad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dieta`
--

CREATE TABLE `dieta` (
  `id_dieta` float NOT NULL,
  `id_cita` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `id_diagnostico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `id_direccion` int(11) NOT NULL,
  `id_zona` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `id_colonia` int(11) NOT NULL,
  `calle_avenida` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `numero` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `edificio` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion_persona`
--

CREATE TABLE `direccion_persona` (
  `id_direccion` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion_proveedores`
--

CREATE TABLE `direccion_proveedores` (
  `id_direccion_prov` int(11) NOT NULL,
  `id_proveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento_persona`
--

CREATE TABLE `documento_persona` (
  `id_tipo_documento` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encargado_sede`
--

CREATE TABLE `encargado_sede` (
  `id_persona` int(11) NOT NULL,
  `id_sede` int(11) NOT NULL,
  `id_encargado_sede` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enfermedad`
--

CREATE TABLE `enfermedad` (
  `id_enfermedad` int(11) NOT NULL,
  `id_tipo_enfermedad` int(11) NOT NULL,
  `enfermedad` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usuario_registro` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `solucion` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id_especialidad` int(11) NOT NULL,
  `especialidad` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad_medico`
--

CREATE TABLE `especialidad_medico` (
  `id_medico` int(11) NOT NULL,
  `id_especialidad` int(11) NOT NULL,
  `fecha_registro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examenes`
--

CREATE TABLE `examenes` (
  `id_examen` int(11) NOT NULL,
  `examen` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `observaciones` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen_persona`
--

CREATE TABLE `examen_persona` (
  `id_persona` int(11) NOT NULL,
  `id_examen` int(11) NOT NULL,
  `resultado` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacion`
--

CREATE TABLE `facturacion` (
  `id_factura` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_tipo_servicio` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `total` float(5,2) DEFAULT NULL,
  `fecha_transaccion` date DEFAULT NULL,
  `usuario_registro` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_transaccion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `farmacia`
--

CREATE TABLE `farmacia` (
  `id_farmacia` int(11) NOT NULL,
  `id_sede` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_clinico`
--

CREATE TABLE `historial_clinico` (
  `id_historial_clinico` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_signos_vitales` int(11) NOT NULL,
  `via_ingreso` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usuario_registro` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `clinica` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `observaciones` varchar(1000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `altura` int(5) DEFAULT NULL,
  `peso_actual` int(4) DEFAULT NULL,
  `peso_anterior` int(4) DEFAULT NULL,
  `medida_cintura` int(5) DEFAULT NULL,
  `masa_muscular` int(4) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumo`
--

CREATE TABLE `insumo` (
  `id_insumo` int(11) NOT NULL,
  `id_lote` int(11) DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_laboratorio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumo_clinicas`
--

CREATE TABLE `insumo_clinicas` (
  `id_clinica` int(11) NOT NULL,
  `id_insumo` int(11) NOT NULL,
  `id_lote` int(11) NOT NULL,
  `cantidad` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumo_laboratorios`
--

CREATE TABLE `insumo_laboratorios` (
  `id_insumo` int(11) NOT NULL,
  `cantidad` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lab_farmaceuticos_insumos`
--

CREATE TABLE `lab_farmaceuticos_insumos` (
  `id_laboratorio` int(11) NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lotes`
--

CREATE TABLE `lotes` (
  `id_insumo` int(11) NOT NULL,
  `id_lote` int(11) NOT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `insumo_clinicas_id_insumo` int(11) NOT NULL,
  `insumo_clinicas_id_lote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

CREATE TABLE `medico` (
  `id_persona` int(11) NOT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `id_especialidad` int(11) NOT NULL,
  `fecha_ingreso` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `url` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_padre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_historial`
--

CREATE TABLE `movimientos_historial` (
  `id_movimiento_historial` int(11) NOT NULL,
  `id_enfermedad` int(11) NOT NULL,
  `id_examen` int(11) NOT NULL,
  `id_suspencion` int(11) DEFAULT NULL,
  `fallecimiento` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `altas` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usuario_registro` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE `municipios` (
  `id_municipio` int(11) NOT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `id_pais` int(11) DEFAULT NULL,
  `municipio` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente_odontologia`
--

CREATE TABLE `paciente_odontologia` (
  `id_persona` int(11) NOT NULL,
  `id_paciente_odontologia` int(11) DEFAULT NULL,
  `id_medico` int(11) DEFAULT NULL,
  `id_clinica` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos_clientes`
--

CREATE TABLE `pagos_clientes` (
  `id_pago` int(11) NOT NULL,
  `id_transaccion` int(11) NOT NULL,
  `id_tipo_pago` int(11) NOT NULL,
  `monto_cancelado` float(5,2) DEFAULT NULL,
  `usuario_registro` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_proveedores`
--

CREATE TABLE `pago_proveedores` (
  `id_pago` int(11) NOT NULL,
  `fecha_pago` date DEFAULT NULL,
  `id_proveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `id_pais` int(11) NOT NULL,
  `pais` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL,
  `id_telefono` int(11) DEFAULT NULL,
  `id_seguro` int(11) DEFAULT NULL,
  `id_tipo_sangre` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `primer_nombre` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `segundo_nombre` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `primer_apellido` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `segundo_apellido` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido_casada` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero` varchar(1) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_tecnico`
--

CREATE TABLE `personal_tecnico` (
  `id_personal_t` int(11) NOT NULL,
  `id_tipo_personal_tecnico` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_farmacia`
--

CREATE TABLE `producto_farmacia` (
  `id_farmacia` int(11) NOT NULL,
  `id_insumo` int(11) NOT NULL,
  `cantidad` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `razon_social` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nit` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `representante_legal_id_persona` int(11) DEFAULT NULL,
  `status_proveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `razon_social_persona`
--

CREATE TABLE `razon_social_persona` (
  `id_razon_social` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_tipo_razon_social` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nit` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados_laboratorios`
--

CREATE TABLE `resultados_laboratorios` (
  `id_examen` int(11) NOT NULL,
  `id_laboratorista` int(11) NOT NULL,
  `resultado` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol_usuario` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion_rol` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `usuario_creacion` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_aplicacion`
--

CREATE TABLE `rol_aplicacion` (
  `id_rol_aplicacion` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_persona`
--

CREATE TABLE `rol_persona` (
  `id_rol` int(11) NOT NULL,
  `rol` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usuario_registro` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_usuario`
--

CREATE TABLE `rol_usuario` (
  `id_usuario` int(11) NOT NULL,
  `id_rol_usuario` int(11) NOT NULL,
  `id_rol_aplicacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--

CREATE TABLE `sede` (
  `id_sede` int(11) NOT NULL,
  `id_direccion` int(11) DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguro`
--

CREATE TABLE `seguro` (
  `id_seguro` int(11) NOT NULL,
  `id_tipo_seguro` int(11) NOT NULL,
  `seguro` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `vigencia_seguro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `signos_vitales`
--

CREATE TABLE `signos_vitales` (
  `id_signos_vitales` int(11) NOT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `usuario_registro` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `presion` float(5,2) DEFAULT NULL,
  `pulso` float(5,2) DEFAULT NULL,
  `respiracion` float(5,2) DEFAULT NULL,
  `peso` float(5,2) DEFAULT NULL,
  `altura` float(5,2) DEFAULT NULL,
  `temperatura` float(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status`
--

CREATE TABLE `status` (
  `id_status` int(11) NOT NULL,
  `nombre_status` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suspencion_medica`
--

CREATE TABLE `suspencion_medica` (
  `id_suspencion` int(11) NOT NULL,
  `id_tipo_suspencion` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `suspencion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usuario_registro` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `motivo` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suspencion_persona`
--

CREATE TABLE `suspencion_persona` (
  `id_suspencion` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

CREATE TABLE `telefono` (
  `id_telefono` int(11) NOT NULL,
  `id_tipo_telefono` int(11) DEFAULT NULL,
  `id_compania` int(11) DEFAULT NULL,
  `telefono` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono_persona`
--

CREATE TABLE `telefono_persona` (
  `id_telefono` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono_proveedores`
--

CREATE TABLE `telefono_proveedores` (
  `id_telefono` int(11) NOT NULL,
  `id_proveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiempo_comida`
--

CREATE TABLE `tiempo_comida` (
  `id_tiempo_comida` float NOT NULL,
  `tiempo` varchar(128) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `id_tipo_documento` int(11) NOT NULL,
  `tipo_documento` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documentos_pago`
--

CREATE TABLE `tipo_documentos_pago` (
  `id_tipo_documento` int(11) NOT NULL,
  `documento` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_enfermedad`
--

CREATE TABLE `tipo_enfermedad` (
  `id_tipo_enfermedad` int(11) NOT NULL,
  `tipo_enfermedad` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usuario_registro` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_odontologia`
--

CREATE TABLE `tipo_odontologia` (
  `id_Odontologia` float NOT NULL,
  `descripcion` varchar(1000) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_paciente_o`
--

CREATE TABLE `tipo_paciente_o` (
  `idTipoPaciente` float NOT NULL,
  `idPaciente` int(11) NOT NULL,
  `idTipoOdontologia` float NOT NULL,
  `idDiagnostico` int(11) NOT NULL,
  `observacion` varchar(1000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fechaRegistro` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pago_clientes`
--

CREATE TABLE `tipo_pago_clientes` (
  `id_tipo_pago` int(11) NOT NULL,
  `tipo_pago_cliente` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_personal_tecnico`
--

CREATE TABLE `tipo_personal_tecnico` (
  `id_tipo_personal_t` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_razon_social`
--

CREATE TABLE `tipo_razon_social` (
  `id_tipo_razon_social` int(11) NOT NULL,
  `tipo_razon_social` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_sangre`
--

CREATE TABLE `tipo_sangre` (
  `id_tipo_sangre` int(11) NOT NULL,
  `tipo_sangre` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usuario_registro` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_seguro`
--

CREATE TABLE `tipo_seguro` (
  `id_tipo_seguro` int(11) NOT NULL,
  `tipo_seguro` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_servicio`
--

CREATE TABLE `tipo_servicio` (
  `id_tipo_servicio` int(11) NOT NULL,
  `tipo_servicio` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `precio_publico` float DEFAULT NULL,
  `precio_costo` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_suspencion`
--

CREATE TABLE `tipo_suspencion` (
  `id_tipo_suspencion` int(11) NOT NULL,
  `tipo_suspencion` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_telefono`
--

CREATE TABLE `tipo_telefono` (
  `id_tipo_telefono` int(11) NOT NULL,
  `tipo_telefono` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transacciones`
--

CREATE TABLE `transacciones` (
  `id_transaccion` int(11) NOT NULL,
  `id_factura` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_caja` int(11) DEFAULT NULL,
  `id_pago` int(11) DEFAULT NULL,
  `usuario_registro` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zonas`
--

CREATE TABLE `zonas` (
  `id_zona` int(11) NOT NULL,
  `id_municipio` int(11) DEFAULT NULL,
  `zona` float DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `usuario_registro` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alimento`
--
ALTER TABLE `alimento`
  ADD PRIMARY KEY (`id_alimento`),
  ADD UNIQUE KEY `alimento` (`alimento`);

--
-- Indices de la tabla `banco`
--
ALTER TABLE `banco`
  ADD PRIMARY KEY (`id_banco`);

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `cita_clinicas_fk` (`id_clinica`),
  ADD KEY `cita_persona_fk` (`id_persona_paciente`),
  ADD KEY `cita_seguro_fk` (`id_seguro`);

--
-- Indices de la tabla `cita_persona`
--
ALTER TABLE `cita_persona`
  ADD PRIMARY KEY (`id_cita`,`id_persona`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `cliente_persona_fk` (`id_persona`),
  ADD KEY `cliente_rsocialp` (`id_razon_social_p`);

--
-- Indices de la tabla `clinica`
--
ALTER TABLE `clinica`
  ADD PRIMARY KEY (`id_clinica`),
  ADD KEY `clinicas_sede_fk` (`id_sede`);

--
-- Indices de la tabla `colonia`
--
ALTER TABLE `colonia`
  ADD PRIMARY KEY (`id_colonia`),
  ADD KEY `colonia_municipios_fk` (`id_municipio`);

--
-- Indices de la tabla `compania_telefono`
--
ALTER TABLE `compania_telefono`
  ADD PRIMARY KEY (`id_compania`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id_compra`);

--
-- Indices de la tabla `cuentas_por_pagar`
--
ALTER TABLE `cuentas_por_pagar`
  ADD PRIMARY KEY (`id_cuenta`),
  ADD KEY `cuentas_por_pagar_status_fk` (`id_status_pago`),
  ADD KEY `porpagaryprovee` (`id_proveedor`);

--
-- Indices de la tabla `cuenta_proveedore`
--
ALTER TABLE `cuenta_proveedore`
  ADD PRIMARY KEY (`id_cuenta_prov`),
  ADD KEY `cuenta_proveedores_bancos_fk` (`id_banco_cuenta`),
  ADD KEY `cuentayproveedore` (`id_proveedor`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_departamento`),
  ADD KEY `departamento_pais_fk` (`id_pais`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`id_compra`);

--
-- Indices de la tabla `detalle_dieta`
--
ALTER TABLE `detalle_dieta`
  ADD PRIMARY KEY (`id_detalle_dieta`),
  ADD KEY `detalle_dieta_fk` (`id_dieta`),
  ADD KEY `detalle_alimento_fk` (`id_alimento`),
  ADD KEY `detalle_tiempo_fk` (`id_tiempo_comida`);

--
-- Indices de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`id_detalle_factura`),
  ADD KEY `detalle_factura_facturacion_fk` (`id_factura`),
  ADD KEY `detalle_tiposervicio` (`id_tipo_servicio`);

--
-- Indices de la tabla `detalle_pago`
--
ALTER TABLE `detalle_pago`
  ADD PRIMARY KEY (`id_detalle_pago`),
  ADD KEY `detalle_pago_compras_fk` (`id_compra`);

--
-- Indices de la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD PRIMARY KEY (`id_diagnostico`),
  ADD KEY `diagnostico_enfermedad_fk` (`id_enfermedad`),
  ADD KEY `diagnostico_persona_fk` (`id_persona`),
  ADD KEY `diagnosticoehistclinc` (`id_historial_clinico`);

--
-- Indices de la tabla `dieta`
--
ALTER TABLE `dieta`
  ADD PRIMARY KEY (`id_dieta`),
  ADD KEY `dieta_cita_fk` (`id_cita`),
  ADD KEY `dieta_medico_fk` (`id_medico`),
  ADD KEY `dieta_diagnostico_fk` (`id_diagnostico`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id_direccion`),
  ADD KEY `direccion_municipios_fk` (`id_municipio`),
  ADD KEY `direccion_zonas_fk` (`id_zona`),
  ADD KEY `direccion_colonia_fk` (`id_colonia`);

--
-- Indices de la tabla `direccion_persona`
--
ALTER TABLE `direccion_persona`
  ADD PRIMARY KEY (`id_direccion`,`id_persona`),
  ADD KEY `direccion_persona_persona_fk` (`id_persona`);

--
-- Indices de la tabla `direccion_proveedores`
--
ALTER TABLE `direccion_proveedores`
  ADD PRIMARY KEY (`id_direccion_prov`);

--
-- Indices de la tabla `documento_persona`
--
ALTER TABLE `documento_persona`
  ADD PRIMARY KEY (`id_tipo_documento`),
  ADD KEY `documento_persona_persona_fk` (`id_persona`);

--
-- Indices de la tabla `encargado_sede`
--
ALTER TABLE `encargado_sede`
  ADD PRIMARY KEY (`id_sede`),
  ADD KEY `encargado_sede_persona_fk` (`id_persona`);

--
-- Indices de la tabla `enfermedad`
--
ALTER TABLE `enfermedad`
  ADD PRIMARY KEY (`id_enfermedad`),
  ADD KEY `enfermedad_tipo_enfermedad_fk` (`id_tipo_enfermedad`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id_especialidad`);

--
-- Indices de la tabla `especialidad_medico`
--
ALTER TABLE `especialidad_medico`
  ADD PRIMARY KEY (`id_medico`,`id_especialidad`),
  ADD KEY `especialidad_especiamd` (`id_especialidad`);

--
-- Indices de la tabla `examenes`
--
ALTER TABLE `examenes`
  ADD PRIMARY KEY (`id_examen`);

--
-- Indices de la tabla `examen_persona`
--
ALTER TABLE `examen_persona`
  ADD PRIMARY KEY (`id_persona`,`id_examen`),
  ADD KEY `examen_persona_examenes_fk` (`id_examen`);

--
-- Indices de la tabla `facturacion`
--
ALTER TABLE `facturacion`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `facturacion_cliente_fk` (`id_cliente`),
  ADD KEY `facturacion_transacciones_fk` (`id_transaccion`);

--
-- Indices de la tabla `farmacia`
--
ALTER TABLE `farmacia`
  ADD PRIMARY KEY (`id_farmacia`),
  ADD KEY `farmacias_sede_fk` (`id_sede`);

--
-- Indices de la tabla `historial_clinico`
--
ALTER TABLE `historial_clinico`
  ADD PRIMARY KEY (`id_historial_clinico`),
  ADD KEY `historial_clinico_persona_fk` (`id_persona`),
  ADD KEY `historial_signos` (`id_signos_vitales`);

--
-- Indices de la tabla `insumo`
--
ALTER TABLE `insumo`
  ADD PRIMARY KEY (`id_insumo`),
  ADD KEY `insumo_laboratorios_insumos_fk` (`id_laboratorio`);

--
-- Indices de la tabla `insumo_clinicas`
--
ALTER TABLE `insumo_clinicas`
  ADD PRIMARY KEY (`id_insumo`,`id_lote`),
  ADD KEY `insumo_clinicas_clinicas_fk` (`id_clinica`);

--
-- Indices de la tabla `insumo_laboratorios`
--
ALTER TABLE `insumo_laboratorios`
  ADD PRIMARY KEY (`id_insumo`);

--
-- Indices de la tabla `lab_farmaceuticos_insumos`
--
ALTER TABLE `lab_farmaceuticos_insumos`
  ADD PRIMARY KEY (`id_laboratorio`);

--
-- Indices de la tabla `lotes`
--
ALTER TABLE `lotes`
  ADD PRIMARY KEY (`id_insumo`,`id_lote`),
  ADD KEY `lotes_compras_fk` (`id_lote`),
  ADD KEY `lotes_insumo_clinicas_fk` (`insumo_clinicas_id_insumo`,`insumo_clinicas_id_lote`);

--
-- Indices de la tabla `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id_persona`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indices de la tabla `movimientos_historial`
--
ALTER TABLE `movimientos_historial`
  ADD PRIMARY KEY (`id_movimiento_historial`),
  ADD KEY `historial_enfer` (`id_enfermedad`),
  ADD KEY `movimiento_examenes` (`id_examen`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`id_municipio`),
  ADD KEY `municipio_departamento_fk` (`id_departamento`);

--
-- Indices de la tabla `paciente_odontologia`
--
ALTER TABLE `paciente_odontologia`
  ADD PRIMARY KEY (`id_persona`),
  ADD KEY `odonto_clinicas` (`id_clinica`);

--
-- Indices de la tabla `pagos_clientes`
--
ALTER TABLE `pagos_clientes`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `pago_tipopagos` (`id_tipo_pago`),
  ADD KEY `pagos_transac` (`id_transaccion`);

--
-- Indices de la tabla `pago_proveedores`
--
ALTER TABLE `pago_proveedores`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `pago_proveedores_fk` (`id_proveedor`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id_pais`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`),
  ADD KEY `persona_rol_fk` (`id_rol`),
  ADD KEY `persona_tipo_sangre_fk` (`id_tipo_sangre`);

--
-- Indices de la tabla `personal_tecnico`
--
ALTER TABLE `personal_tecnico`
  ADD PRIMARY KEY (`id_personal_t`),
  ADD KEY `personal_tecnico` (`id_tipo_personal_tecnico`),
  ADD KEY `personal_tecnico_persona_fk` (`id_persona`);

--
-- Indices de la tabla `producto_farmacia`
--
ALTER TABLE `producto_farmacia`
  ADD KEY `farmacia_farmacias_fk` (`id_farmacia`),
  ADD KEY `farmacia_insumo_fk` (`id_insumo`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `razon_social_persona`
--
ALTER TABLE `razon_social_persona`
  ADD PRIMARY KEY (`id_razon_social`),
  ADD KEY `razonsocial_persona` (`id_persona`);

--
-- Indices de la tabla `resultados_laboratorios`
--
ALTER TABLE `resultados_laboratorios`
  ADD KEY `laboratorio_examen` (`id_examen`),
  ADD KEY `resultado_personaltecnico` (`id_laboratorista`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol_usuario`);

--
-- Indices de la tabla `rol_aplicacion`
--
ALTER TABLE `rol_aplicacion`
  ADD PRIMARY KEY (`id_rol_aplicacion`),
  ADD KEY `rol_aplicacion_menu_fk` (`id_menu`);

--
-- Indices de la tabla `rol_persona`
--
ALTER TABLE `rol_persona`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `rol_usuario`
--
ALTER TABLE `rol_usuario`
  ADD PRIMARY KEY (`id_rol_usuario`,`id_usuario`,`id_rol_aplicacion`),
  ADD KEY `id_rolaplicacion_usuario` (`id_rol_aplicacion`);

--
-- Indices de la tabla `sede`
--
ALTER TABLE `sede`
  ADD PRIMARY KEY (`id_sede`);

--
-- Indices de la tabla `seguro`
--
ALTER TABLE `seguro`
  ADD PRIMARY KEY (`id_seguro`),
  ADD KEY `seguro_tipo_seguro_fk` (`id_tipo_seguro`);

--
-- Indices de la tabla `signos_vitales`
--
ALTER TABLE `signos_vitales`
  ADD PRIMARY KEY (`id_signos_vitales`);

--
-- Indices de la tabla `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`);

--
-- Indices de la tabla `suspencion_medica`
--
ALTER TABLE `suspencion_medica`
  ADD PRIMARY KEY (`id_suspencion`),
  ADD KEY `suspen_tiposuspen` (`id_tipo_suspencion`),
  ADD KEY `suspencion_medica_persona_fk` (`id_persona`);

--
-- Indices de la tabla `suspencion_persona`
--
ALTER TABLE `suspencion_persona`
  ADD PRIMARY KEY (`id_suspencion`),
  ADD KEY `suspencion_persona_persona_fk` (`id_persona`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`id_telefono`),
  ADD KEY `telefono_compania_fk` (`id_compania`),
  ADD KEY `telefono_tipo_fk` (`id_tipo_telefono`);

--
-- Indices de la tabla `telefono_persona`
--
ALTER TABLE `telefono_persona`
  ADD PRIMARY KEY (`id_telefono`),
  ADD KEY `telefono_persona_persona_fk` (`id_persona`);

--
-- Indices de la tabla `telefono_proveedores`
--
ALTER TABLE `telefono_proveedores`
  ADD PRIMARY KEY (`id_telefono`);

--
-- Indices de la tabla `tiempo_comida`
--
ALTER TABLE `tiempo_comida`
  ADD PRIMARY KEY (`id_tiempo_comida`),
  ADD UNIQUE KEY `tiempo` (`tiempo`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`id_tipo_documento`);

--
-- Indices de la tabla `tipo_documentos_pago`
--
ALTER TABLE `tipo_documentos_pago`
  ADD PRIMARY KEY (`id_tipo_documento`);

--
-- Indices de la tabla `tipo_enfermedad`
--
ALTER TABLE `tipo_enfermedad`
  ADD PRIMARY KEY (`id_tipo_enfermedad`);

--
-- Indices de la tabla `tipo_odontologia`
--
ALTER TABLE `tipo_odontologia`
  ADD PRIMARY KEY (`id_Odontologia`);

--
-- Indices de la tabla `tipo_paciente_o`
--
ALTER TABLE `tipo_paciente_o`
  ADD PRIMARY KEY (`idTipoPaciente`),
  ADD KEY `Paciente_fk` (`idPaciente`),
  ADD KEY `tipo_fk` (`idTipoOdontologia`),
  ADD KEY `diagnostico_fk` (`idDiagnostico`);

--
-- Indices de la tabla `tipo_pago_clientes`
--
ALTER TABLE `tipo_pago_clientes`
  ADD PRIMARY KEY (`id_tipo_pago`);

--
-- Indices de la tabla `tipo_personal_tecnico`
--
ALTER TABLE `tipo_personal_tecnico`
  ADD PRIMARY KEY (`id_tipo_personal_t`);

--
-- Indices de la tabla `tipo_razon_social`
--
ALTER TABLE `tipo_razon_social`
  ADD PRIMARY KEY (`id_tipo_razon_social`);

--
-- Indices de la tabla `tipo_sangre`
--
ALTER TABLE `tipo_sangre`
  ADD PRIMARY KEY (`id_tipo_sangre`);

--
-- Indices de la tabla `tipo_seguro`
--
ALTER TABLE `tipo_seguro`
  ADD PRIMARY KEY (`id_tipo_seguro`);

--
-- Indices de la tabla `tipo_servicio`
--
ALTER TABLE `tipo_servicio`
  ADD PRIMARY KEY (`id_tipo_servicio`);

--
-- Indices de la tabla `tipo_suspencion`
--
ALTER TABLE `tipo_suspencion`
  ADD PRIMARY KEY (`id_tipo_suspencion`);

--
-- Indices de la tabla `tipo_telefono`
--
ALTER TABLE `tipo_telefono`
  ADD PRIMARY KEY (`id_tipo_telefono`);

--
-- Indices de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD PRIMARY KEY (`id_transaccion`);

--
-- Indices de la tabla `zonas`
--
ALTER TABLE `zonas`
  ADD PRIMARY KEY (`id_zona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `banco`
--
ALTER TABLE `banco`
  MODIFY `id_banco` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cita_persona`
--
ALTER TABLE `cita_persona`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `clinica`
--
ALTER TABLE `clinica`
  MODIFY `id_clinica` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `colonia`
--
ALTER TABLE `colonia`
  MODIFY `id_colonia` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `compania_telefono`
--
ALTER TABLE `compania_telefono`
  MODIFY `id_compania` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cuentas_por_pagar`
--
ALTER TABLE `cuentas_por_pagar`
  MODIFY `id_cuenta` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cuenta_proveedore`
--
ALTER TABLE `cuenta_proveedore`
  MODIFY `id_cuenta_prov` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  MODIFY `id_detalle_factura` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `detalle_pago`
--
ALTER TABLE `detalle_pago`
  MODIFY `id_detalle_pago` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  MODIFY `id_diagnostico` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id_direccion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `direccion_persona`
--
ALTER TABLE `direccion_persona`
  MODIFY `id_direccion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `direccion_proveedores`
--
ALTER TABLE `direccion_proveedores`
  MODIFY `id_direccion_prov` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `documento_persona`
--
ALTER TABLE `documento_persona`
  MODIFY `id_tipo_documento` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `enfermedad`
--
ALTER TABLE `enfermedad`
  MODIFY `id_enfermedad` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id_especialidad` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `especialidad_medico`
--
ALTER TABLE `especialidad_medico`
  MODIFY `id_medico` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `examenes`
--
ALTER TABLE `examenes`
  MODIFY `id_examen` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `examen_persona`
--
ALTER TABLE `examen_persona`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `farmacia`
--
ALTER TABLE `farmacia`
  MODIFY `id_farmacia` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_clinicas_fk` FOREIGN KEY (`id_clinica`) REFERENCES `clinica` (`id_clinica`),
  ADD CONSTRAINT `cita_persona_fk` FOREIGN KEY (`id_persona_paciente`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `cita_seguro_fk` FOREIGN KEY (`id_seguro`) REFERENCES `seguro` (`id_seguro`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_persona_fk` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `cliente_rsocialp` FOREIGN KEY (`id_razon_social_p`) REFERENCES `razon_social_persona` (`id_razon_social`);

--
-- Filtros para la tabla `clinica`
--
ALTER TABLE `clinica`
  ADD CONSTRAINT `clinicas_sede_fk` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`id_sede`);

--
-- Filtros para la tabla `colonia`
--
ALTER TABLE `colonia`
  ADD CONSTRAINT `colonia_municipios_fk` FOREIGN KEY (`id_municipio`) REFERENCES `municipios` (`id_municipio`);

--
-- Filtros para la tabla `cuentas_por_pagar`
--
ALTER TABLE `cuentas_por_pagar`
  ADD CONSTRAINT `cuentas_por_pagar_status_fk` FOREIGN KEY (`id_status_pago`) REFERENCES `status` (`id_status`),
  ADD CONSTRAINT `porpagaryprovee` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`);

--
-- Filtros para la tabla `cuenta_proveedore`
--
ALTER TABLE `cuenta_proveedore`
  ADD CONSTRAINT `cuenta_proveedores_bancos_fk` FOREIGN KEY (`id_banco_cuenta`) REFERENCES `banco` (`id_banco`),
  ADD CONSTRAINT `cuentayproveedore` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`),
  ADD CONSTRAINT `relacion_cuentas` FOREIGN KEY (`id_cuenta_prov`) REFERENCES `cuentas_por_pagar` (`id_cuenta`);

--
-- Filtros para la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `departamento_pais_fk` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`);

--
-- Filtros para la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD CONSTRAINT `detalle_compra_compras_fk` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`);

--
-- Filtros para la tabla `detalle_dieta`
--
ALTER TABLE `detalle_dieta`
  ADD CONSTRAINT `detalle_alimento_fk` FOREIGN KEY (`id_alimento`) REFERENCES `alimento` (`id_alimento`),
  ADD CONSTRAINT `detalle_dieta_fk` FOREIGN KEY (`id_dieta`) REFERENCES `dieta` (`id_dieta`),
  ADD CONSTRAINT `detalle_tiempo_fk` FOREIGN KEY (`id_tiempo_comida`) REFERENCES `tiempo_comida` (`id_tiempo_comida`);

--
-- Filtros para la tabla `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD CONSTRAINT `detalle_factura_facturacion_fk` FOREIGN KEY (`id_factura`) REFERENCES `facturacion` (`id_factura`),
  ADD CONSTRAINT `detalle_tiposervicio` FOREIGN KEY (`id_tipo_servicio`) REFERENCES `tipo_servicio` (`id_tipo_servicio`);

--
-- Filtros para la tabla `detalle_pago`
--
ALTER TABLE `detalle_pago`
  ADD CONSTRAINT `detalle_pago_compras_fk` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`);

--
-- Filtros para la tabla `diagnostico`
--
ALTER TABLE `diagnostico`
  ADD CONSTRAINT `diagnostico_enfermedad_fk` FOREIGN KEY (`id_enfermedad`) REFERENCES `enfermedad` (`id_enfermedad`),
  ADD CONSTRAINT `diagnostico_persona_fk` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `diagnosticoehistclinc` FOREIGN KEY (`id_historial_clinico`) REFERENCES `historial_clinico` (`id_historial_clinico`);

--
-- Filtros para la tabla `dieta`
--
ALTER TABLE `dieta`
  ADD CONSTRAINT `dieta_cita_fk` FOREIGN KEY (`id_cita`) REFERENCES `cita` (`id_cita`),
  ADD CONSTRAINT `dieta_diagnostico_fk` FOREIGN KEY (`id_diagnostico`) REFERENCES `diagnostico` (`id_diagnostico`),
  ADD CONSTRAINT `dieta_medico_fk` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id_persona`);

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `direccion_colonia_fk` FOREIGN KEY (`id_colonia`) REFERENCES `colonia` (`id_colonia`),
  ADD CONSTRAINT `direccion_municipios_fk` FOREIGN KEY (`id_municipio`) REFERENCES `municipios` (`id_municipio`),
  ADD CONSTRAINT `direccion_zonas_fk` FOREIGN KEY (`id_zona`) REFERENCES `zonas` (`id_zona`);

--
-- Filtros para la tabla `direccion_persona`
--
ALTER TABLE `direccion_persona`
  ADD CONSTRAINT `direccion_persona_direccion_fk` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`),
  ADD CONSTRAINT `direccion_persona_persona_fk` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `direccion_proveedores`
--
ALTER TABLE `direccion_proveedores`
  ADD CONSTRAINT `direcc_provee` FOREIGN KEY (`id_direccion_prov`) REFERENCES `direccion` (`id_direccion`);

--
-- Filtros para la tabla `documento_persona`
--
ALTER TABLE `documento_persona`
  ADD CONSTRAINT `documento_persona_persona_fk` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `encargado_sede`
--
ALTER TABLE `encargado_sede`
  ADD CONSTRAINT `encargado_sede_persona_fk` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `encargado_sede_sede_fk` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`id_sede`);

--
-- Filtros para la tabla `enfermedad`
--
ALTER TABLE `enfermedad`
  ADD CONSTRAINT `enfermedad_tipo_enfermedad_fk` FOREIGN KEY (`id_tipo_enfermedad`) REFERENCES `tipo_enfermedad` (`id_tipo_enfermedad`);

--
-- Filtros para la tabla `especialidad_medico`
--
ALTER TABLE `especialidad_medico`
  ADD CONSTRAINT `especialidad_especiamd` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id_especialidad`);

--
-- Filtros para la tabla `examen_persona`
--
ALTER TABLE `examen_persona`
  ADD CONSTRAINT `examen_persona_examenes_fk` FOREIGN KEY (`id_examen`) REFERENCES `examenes` (`id_examen`),
  ADD CONSTRAINT `examen_persona_persona_fk` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `facturacion`
--
ALTER TABLE `facturacion`
  ADD CONSTRAINT `facturacion_cliente_fk` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `facturacion_transacciones_fk` FOREIGN KEY (`id_transaccion`) REFERENCES `transacciones` (`id_transaccion`);

--
-- Filtros para la tabla `farmacia`
--
ALTER TABLE `farmacia`
  ADD CONSTRAINT `farmacias_sede_fk` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`id_sede`);

--
-- Filtros para la tabla `historial_clinico`
--
ALTER TABLE `historial_clinico`
  ADD CONSTRAINT `historial_clinico_persona_fk` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `historial_signos` FOREIGN KEY (`id_signos_vitales`) REFERENCES `signos_vitales` (`id_signos_vitales`);

--
-- Filtros para la tabla `insumo`
--
ALTER TABLE `insumo`
  ADD CONSTRAINT `insumo_laboratorios_insumos_fk` FOREIGN KEY (`id_laboratorio`) REFERENCES `lab_farmaceuticos_insumos` (`id_laboratorio`);

--
-- Filtros para la tabla `insumo_clinicas`
--
ALTER TABLE `insumo_clinicas`
  ADD CONSTRAINT `insumo_clinicas_clinicas_fk` FOREIGN KEY (`id_clinica`) REFERENCES `clinica` (`id_clinica`),
  ADD CONSTRAINT `insumo_clinicas_insumo_fk` FOREIGN KEY (`id_insumo`) REFERENCES `insumo` (`id_insumo`);

--
-- Filtros para la tabla `insumo_laboratorios`
--
ALTER TABLE `insumo_laboratorios`
  ADD CONSTRAINT `insumo_laboratorios_insumo_fk` FOREIGN KEY (`id_insumo`) REFERENCES `insumo` (`id_insumo`);

--
-- Filtros para la tabla `lotes`
--
ALTER TABLE `lotes`
  ADD CONSTRAINT `lotes_compras_fk` FOREIGN KEY (`id_lote`) REFERENCES `compra` (`id_compra`),
  ADD CONSTRAINT `lotes_insumo_clinicas_fk` FOREIGN KEY (`insumo_clinicas_id_insumo`,`insumo_clinicas_id_lote`) REFERENCES `insumo_clinicas` (`id_insumo`, `id_lote`);

--
-- Filtros para la tabla `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `medico_persona_fk` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `movimientos_historial`
--
ALTER TABLE `movimientos_historial`
  ADD CONSTRAINT `historial_enfer` FOREIGN KEY (`id_enfermedad`) REFERENCES `enfermedad` (`id_enfermedad`),
  ADD CONSTRAINT `movimiento_examenes` FOREIGN KEY (`id_examen`) REFERENCES `examenes` (`id_examen`);

--
-- Filtros para la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `municipio_departamento_fk` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`);

--
-- Filtros para la tabla `paciente_odontologia`
--
ALTER TABLE `paciente_odontologia`
  ADD CONSTRAINT `odonto_clinicas` FOREIGN KEY (`id_clinica`) REFERENCES `clinica` (`id_clinica`),
  ADD CONSTRAINT `odonto_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `pagos_clientes`
--
ALTER TABLE `pagos_clientes`
  ADD CONSTRAINT `pago_tipopagos` FOREIGN KEY (`id_tipo_pago`) REFERENCES `tipo_pago_clientes` (`id_tipo_pago`),
  ADD CONSTRAINT `pagos_transac` FOREIGN KEY (`id_transaccion`) REFERENCES `transacciones` (`id_transaccion`);

--
-- Filtros para la tabla `pago_proveedores`
--
ALTER TABLE `pago_proveedores`
  ADD CONSTRAINT `pago_detalle_pago_fk` FOREIGN KEY (`id_pago`) REFERENCES `detalle_pago` (`id_detalle_pago`),
  ADD CONSTRAINT `pago_proveedores_fk` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_rol_fk` FOREIGN KEY (`id_rol`) REFERENCES `rol_persona` (`id_rol`),
  ADD CONSTRAINT `persona_tipo_sangre_fk` FOREIGN KEY (`id_tipo_sangre`) REFERENCES `tipo_sangre` (`id_tipo_sangre`);

--
-- Filtros para la tabla `personal_tecnico`
--
ALTER TABLE `personal_tecnico`
  ADD CONSTRAINT `personal_tecnico` FOREIGN KEY (`id_tipo_personal_tecnico`) REFERENCES `tipo_personal_tecnico` (`id_tipo_personal_t`),
  ADD CONSTRAINT `personal_tecnico_persona_fk` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `producto_farmacia`
--
ALTER TABLE `producto_farmacia`
  ADD CONSTRAINT `farmacia_farmacias_fk` FOREIGN KEY (`id_farmacia`) REFERENCES `farmacia` (`id_farmacia`),
  ADD CONSTRAINT `farmacia_insumo_fk` FOREIGN KEY (`id_insumo`) REFERENCES `insumo` (`id_insumo`);

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `prov_direccion` FOREIGN KEY (`id_proveedor`) REFERENCES `direccion_proveedores` (`id_direccion_prov`),
  ADD CONSTRAINT `prov_telefono` FOREIGN KEY (`id_proveedor`) REFERENCES `telefono_proveedores` (`id_telefono`);

--
-- Filtros para la tabla `razon_social_persona`
--
ALTER TABLE `razon_social_persona`
  ADD CONSTRAINT `razonsocial_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `resultados_laboratorios`
--
ALTER TABLE `resultados_laboratorios`
  ADD CONSTRAINT `laboratorio_examen` FOREIGN KEY (`id_examen`) REFERENCES `examenes` (`id_examen`),
  ADD CONSTRAINT `resultado_personaltecnico` FOREIGN KEY (`id_laboratorista`) REFERENCES `personal_tecnico` (`id_personal_t`);

--
-- Filtros para la tabla `rol_aplicacion`
--
ALTER TABLE `rol_aplicacion`
  ADD CONSTRAINT `rol_aplicacion_menu_fk` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`);

--
-- Filtros para la tabla `rol_usuario`
--
ALTER TABLE `rol_usuario`
  ADD CONSTRAINT `id_rolaplicacion_usuario` FOREIGN KEY (`id_rol_aplicacion`) REFERENCES `rol_aplicacion` (`id_rol_aplicacion`),
  ADD CONSTRAINT `rol_usuario_rol_fk` FOREIGN KEY (`id_rol_usuario`) REFERENCES `rol` (`id_rol_usuario`);

--
-- Filtros para la tabla `seguro`
--
ALTER TABLE `seguro`
  ADD CONSTRAINT `seguro_tipo_seguro_fk` FOREIGN KEY (`id_tipo_seguro`) REFERENCES `tipo_seguro` (`id_tipo_seguro`);

--
-- Filtros para la tabla `suspencion_medica`
--
ALTER TABLE `suspencion_medica`
  ADD CONSTRAINT `suspen_tiposuspen` FOREIGN KEY (`id_tipo_suspencion`) REFERENCES `tipo_suspencion` (`id_tipo_suspencion`),
  ADD CONSTRAINT `suspencion_medica_persona_fk` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `suspencion_persona`
--
ALTER TABLE `suspencion_persona`
  ADD CONSTRAINT `suspencion_persona_persona_fk` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Filtros para la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `telefono_compania_fk` FOREIGN KEY (`id_compania`) REFERENCES `compania_telefono` (`id_compania`),
  ADD CONSTRAINT `telefono_tipo_fk` FOREIGN KEY (`id_tipo_telefono`) REFERENCES `tipo_telefono` (`id_tipo_telefono`);

--
-- Filtros para la tabla `telefono_persona`
--
ALTER TABLE `telefono_persona`
  ADD CONSTRAINT `telefono_persona_persona_fk` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `telefono_telefono_persona_fk` FOREIGN KEY (`id_telefono`) REFERENCES `telefono` (`id_telefono`);

--
-- Filtros para la tabla `telefono_proveedores`
--
ALTER TABLE `telefono_proveedores`
  ADD CONSTRAINT `telprov_tel` FOREIGN KEY (`id_telefono`) REFERENCES `telefono` (`id_telefono`);

--
-- Filtros para la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD CONSTRAINT `tipodoc_docpersona` FOREIGN KEY (`id_tipo_documento`) REFERENCES `documento_persona` (`id_tipo_documento`);

--
-- Filtros para la tabla `tipo_documentos_pago`
--
ALTER TABLE `tipo_documentos_pago`
  ADD CONSTRAINT `tipodocpag_detpago` FOREIGN KEY (`id_tipo_documento`) REFERENCES `detalle_pago` (`id_detalle_pago`);

--
-- Filtros para la tabla `tipo_paciente_o`
--
ALTER TABLE `tipo_paciente_o`
  ADD CONSTRAINT `Paciente_fk` FOREIGN KEY (`idPaciente`) REFERENCES `paciente_odontologia` (`id_persona`),
  ADD CONSTRAINT `diagnostico_fk` FOREIGN KEY (`idDiagnostico`) REFERENCES `diagnostico` (`id_diagnostico`),
  ADD CONSTRAINT `tipo_fk` FOREIGN KEY (`idTipoOdontologia`) REFERENCES `tipo_odontologia` (`id_Odontologia`);

--
-- Filtros para la tabla `tipo_razon_social`
--
ALTER TABLE `tipo_razon_social`
  ADD CONSTRAINT `id_razonsocial` FOREIGN KEY (`id_tipo_razon_social`) REFERENCES `razon_social_persona` (`id_razon_social`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
