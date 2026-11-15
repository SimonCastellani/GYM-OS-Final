
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `usuario_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `accion` varchar(100) NOT NULL,
  `modulo` varchar(100) NOT NULL,
  `descripcion` text,
  `fecha_hora` datetime(3) NOT NULL,
  `resultado` enum('exitoso','fallido','advertencia') NOT NULL DEFAULT 'exitoso',
  `dvh` char(64) GENERATED ALWAYS AS (SHA2(CAST(JSON_ARRAY(`accion`, `descripcion`, `fecha_hora`, `id`, `modulo`, `resultado`, `usuario_id`) AS CHAR), 256)) VIRTUAL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `comidas_consumidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comidas_consumidas` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `usuario_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `nombre_comida` varchar(150) NOT NULL,
  `tipo_comida` varchar(50) DEFAULT NULL,
  `fecha_consumo` datetime(3) NOT NULL,
  `cantidad_consumida` decimal(6,2) DEFAULT NULL,
  `unidad` varchar(30) DEFAULT NULL,
  `calorias_totales` int NOT NULL DEFAULT '0',
  `proteinas_totales_g` decimal(6,2) DEFAULT NULL,
  `carbohidratos_totales_g` decimal(6,2) DEFAULT NULL,
  `grasas_totales_g` decimal(6,2) DEFAULT NULL,
  `alimentos` json NOT NULL,
  `dvh` char(64) GENERATED ALWAYS AS (SHA2(CAST(JSON_ARRAY(`alimentos`, `calorias_totales`, `cantidad_consumida`, `carbohidratos_totales_g`, `fecha_consumo`, `grasas_totales_g`, `id`, `nombre_comida`, `proteinas_totales_g`, `tipo_comida`, `unidad`, `usuario_id`) AS CHAR), 256)) VIRTUAL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `comidas_consumidas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `conversaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversaciones` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `usuario_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `modo` enum('entrenador','soporte') NOT NULL DEFAULT 'entrenador',
  `titulo` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime(3) NOT NULL,
  `dvh` char(64) GENERATED ALWAYS AS (SHA2(CAST(JSON_ARRAY(`fecha_creacion`, `id`, `modo`, `titulo`, `usuario_id`) AS CHAR), 256)) VIRTUAL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `conversaciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `dieta_comidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dieta_comidas` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `dieta_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `nombre_comida` varchar(150) NOT NULL,
  `tipo_comida` varchar(50) DEFAULT NULL,
  `hora` varchar(5) DEFAULT NULL,
  `cantidad` decimal(6,2) DEFAULT NULL,
  `unidad` varchar(30) DEFAULT NULL,
  `calorias` int NOT NULL DEFAULT '0',
  `proteinas_g` decimal(6,2) DEFAULT NULL,
  `carbohidratos_g` decimal(6,2) DEFAULT NULL,
  `grasas_g` decimal(6,2) DEFAULT NULL,
  `alimentos` json NOT NULL,
  `observaciones` text,
  `dvh` char(64) GENERATED ALWAYS AS (SHA2(CAST(JSON_ARRAY(`alimentos`, `calorias`, `cantidad`, `carbohidratos_g`, `dieta_id`, `grasas_g`, `hora`, `id`, `nombre_comida`, `observaciones`, `proteinas_g`, `tipo_comida`, `unidad`) AS CHAR), 256)) VIRTUAL,
  PRIMARY KEY (`id`),
  KEY `dieta_id` (`dieta_id`),
  CONSTRAINT `dieta_comidas_ibfk_1` FOREIGN KEY (`dieta_id`) REFERENCES `dietas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `dietas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dietas` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `usuario_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `objetivo_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `tipo_generacion` enum('manual','ia') NOT NULL DEFAULT 'manual',
  `calorias_objetivo` int NOT NULL DEFAULT '0',
  `proteinas_objetivo_g` decimal(6,2) DEFAULT NULL,
  `carbohidratos_objetivo_g` decimal(6,2) DEFAULT NULL,
  `grasas_objetivo_g` decimal(6,2) DEFAULT NULL,
  `estado` enum('activa','eliminada','finalizada') NOT NULL DEFAULT 'activa',
  `fecha_creacion` datetime(3) NOT NULL,
  `fecha_actualizacion` datetime(3) DEFAULT NULL,
  `dvh` char(64) GENERATED ALWAYS AS (SHA2(CAST(JSON_ARRAY(`calorias_objetivo`, `carbohidratos_objetivo_g`, `descripcion`, `estado`, `fecha_actualizacion`, `fecha_creacion`, `grasas_objetivo_g`, `id`, `nombre`, `objetivo_id`, `proteinas_objetivo_g`, `tipo_generacion`, `usuario_id`) AS CHAR), 256)) VIRTUAL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `objetivo_id` (`objetivo_id`),
  CONSTRAINT `dietas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dietas_ibfk_2` FOREIGN KEY (`objetivo_id`) REFERENCES `objetivos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `entrenamiento_ejercicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrenamiento_ejercicios` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `entrenamiento_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `nombre_ejercicio` varchar(150) NOT NULL,
  `ejercicio_id` varchar(40) DEFAULT NULL,
  `orden` int NOT NULL DEFAULT '0',
  `series` int NOT NULL DEFAULT '0',
  `repeticiones` int NOT NULL DEFAULT '0',
  `peso_utilizado_kg` decimal(6,2) DEFAULT NULL,
  `realizado` tinyint(1) NOT NULL DEFAULT '0',
  `observaciones` text,
  `dvh` char(64) GENERATED ALWAYS AS (SHA2(CAST(JSON_ARRAY(`ejercicio_id`, `entrenamiento_id`, `id`, `nombre_ejercicio`, `observaciones`, `orden`, `peso_utilizado_kg`, `realizado`, `repeticiones`, `series`) AS CHAR), 256)) VIRTUAL,
  PRIMARY KEY (`id`),
  KEY `entrenamiento_id` (`entrenamiento_id`),
  CONSTRAINT `entrenamiento_ejercicios_ibfk_1` FOREIGN KEY (`entrenamiento_id`) REFERENCES `entrenamientos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `entrenamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrenamientos` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `usuario_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `rutina_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `fecha` date NOT NULL,
  `fecha_inicio` datetime(3) NOT NULL,
  `fecha_fin` datetime(3) DEFAULT NULL,
  `dia_semana` varchar(20) DEFAULT NULL,
  `estado` enum('iniciado','completado','incompleto','cancelado') NOT NULL DEFAULT 'iniciado',
  `observaciones` text,
  `usuario_en_curso` varchar(36) DEFAULT NULL,
  `distancia_km` decimal(6,2) DEFAULT NULL,
  `dvh` char(64) GENERATED ALWAYS AS (SHA2(CAST(JSON_ARRAY(`dia_semana`, `distancia_km`, `estado`, `fecha_fin`, `fecha_inicio`, `fecha`, `id`, `observaciones`, `rutina_id`, `usuario_en_curso`, `usuario_id`) AS CHAR), 256)) VIRTUAL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_en_curso` (`usuario_en_curso`),
  KEY `usuario_id` (`usuario_id`),
  KEY `rutina_id` (`rutina_id`),
  CONSTRAINT `entrenamientos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `entrenamientos_ibfk_2` FOREIGN KEY (`rutina_id`) REFERENCES `rutinas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `mediciones_fisicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mediciones_fisicas` (
  `usuario_inicial` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `usuario_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `peso_kg` decimal(5,2) NOT NULL,
  `altura_cm` decimal(5,2) DEFAULT NULL,
  `grasa_corporal` decimal(5,2) DEFAULT NULL,
  `musculo_corporal` decimal(5,2) DEFAULT NULL,
  `nivel_actividad` varchar(50) DEFAULT NULL,
  `fecha_medicion` datetime(3) NOT NULL,
  `cintura_cm` decimal(5,2) DEFAULT NULL,
  `pecho_cm` decimal(5,2) DEFAULT NULL,
  `brazos_cm` decimal(5,2) DEFAULT NULL,
  `piernas_cm` decimal(5,2) DEFAULT NULL,
  `dvh` char(64) GENERATED ALWAYS AS (SHA2(CAST(JSON_ARRAY(`altura_cm`, `brazos_cm`, `cintura_cm`, `fecha_medicion`, `grasa_corporal`, `id`, `musculo_corporal`, `nivel_actividad`, `pecho_cm`, `peso_kg`, `piernas_cm`, `usuario_id`, `usuario_inicial`) AS CHAR), 256)) VIRTUAL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_inicial` (`usuario_inicial`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `mediciones_fisicas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensajes` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `conversacion_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `rol` enum('user','assistant') NOT NULL DEFAULT 'user',
  `contenido` text NOT NULL,
  `fecha_creacion` datetime(3) NOT NULL,
  `dvh` char(64) GENERATED ALWAYS AS (SHA2(CAST(JSON_ARRAY(`contenido`, `conversacion_id`, `fecha_creacion`, `id`, `rol`) AS CHAR), 256)) VIRTUAL,
  PRIMARY KEY (`id`),
  KEY `conversacion_id` (`conversacion_id`),
  CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`conversacion_id`) REFERENCES `conversaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `objetivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objetivos` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `usuario_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `medicion_inicio_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `tipo` enum('bajar_peso','ganar_masa_muscular','mejorar_resistencia','aumentar_frecuencia_entrenamiento','definir','mantener_peso') NOT NULL DEFAULT 'mantener_peso',
  `valor_objetivo` decimal(8,2) DEFAULT NULL,
  `unidad` varchar(30) DEFAULT NULL,
  `actividad_objetivo` varchar(50) DEFAULT NULL,
  `frecuencia_semanal` int NOT NULL DEFAULT '3',
  `peso_inicial` decimal(8,2) DEFAULT NULL,
  `estado` enum('activo','completado','eliminado') NOT NULL DEFAULT 'activo',
  `fecha_inicio` date NOT NULL,
  `fecha_fin_estimada` date DEFAULT NULL,
  `fecha_completado` date DEFAULT NULL,
  `fecha_cierre` datetime(3) DEFAULT NULL,
  `usuario_activo` varchar(36) DEFAULT NULL,
  `valor_inicial` decimal(8,2) DEFAULT NULL,
  `dvh` char(64) GENERATED ALWAYS AS (SHA2(CAST(JSON_ARRAY(`actividad_objetivo`, `descripcion`, `estado`, `fecha_cierre`, `fecha_completado`, `fecha_fin_estimada`, `fecha_inicio`, `frecuencia_semanal`, `id`, `medicion_inicio_id`, `nombre`, `peso_inicial`, `tipo`, `unidad`, `usuario_activo`, `usuario_id`, `valor_inicial`, `valor_objetivo`) AS CHAR), 256)) VIRTUAL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_activo` (`usuario_activo`),
  KEY `usuario_id` (`usuario_id`),
  KEY `medicion_inicio_id` (`medicion_inicio_id`),
  CONSTRAINT `objetivos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `objetivos_ibfk_2` FOREIGN KEY (`medicion_inicio_id`) REFERENCES `mediciones_fisicas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `recuperaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recuperaciones` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `usuario_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `token_hash` varchar(64) NOT NULL,
  `fecha_expiracion` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_id` (`usuario_id`),
  UNIQUE KEY `token_hash` (`token_hash`),
  CONSTRAINT `recuperaciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` datetime(3) NOT NULL,
  `permisos` json NOT NULL,
  `sistema` tinyint(1) NOT NULL DEFAULT '0',
  `dvh` char(64) GENERATED ALWAYS AS (SHA2(CAST(JSON_ARRAY(`descripcion`, `fecha_creacion`, `id`, `nombre`, `permisos`, `sistema`) AS CHAR), 256)) VIRTUAL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `rutina_ejercicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rutina_ejercicios` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `rutina_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ejercicio_id` varchar(40) DEFAULT NULL,
  `nombre_ejercicio` varchar(150) NOT NULL,
  `grupo_muscular` varchar(100) DEFAULT NULL,
  `dia_semana` varchar(20) DEFAULT NULL,
  `orden` int NOT NULL DEFAULT '0',
  `series` int NOT NULL DEFAULT '3',
  `repeticiones` int NOT NULL DEFAULT '10',
  `peso_sugerido_kg` decimal(6,2) DEFAULT NULL,
  `descanso_segundos` int NOT NULL DEFAULT '90',
  `observaciones` text,
  `dvh` char(64) GENERATED ALWAYS AS (SHA2(CAST(JSON_ARRAY(`descanso_segundos`, `dia_semana`, `ejercicio_id`, `grupo_muscular`, `id`, `nombre_ejercicio`, `observaciones`, `orden`, `peso_sugerido_kg`, `repeticiones`, `rutina_id`, `series`) AS CHAR), 256)) VIRTUAL,
  PRIMARY KEY (`id`),
  KEY `rutina_id` (`rutina_id`),
  CONSTRAINT `rutina_ejercicios_ibfk_1` FOREIGN KEY (`rutina_id`) REFERENCES `rutinas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `rutinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rutinas` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `usuario_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `objetivo_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `tipo_generacion` enum('manual','ia') NOT NULL DEFAULT 'manual',
  `estado` enum('activa','eliminada','finalizada') NOT NULL DEFAULT 'activa',
  `fecha_creacion` datetime(3) NOT NULL,
  `fecha_actualizacion` datetime(3) DEFAULT NULL,
  `dvh` char(64) GENERATED ALWAYS AS (SHA2(CAST(JSON_ARRAY(`descripcion`, `estado`, `fecha_actualizacion`, `fecha_creacion`, `id`, `nombre`, `objetivo_id`, `tipo_generacion`, `usuario_id`) AS CHAR), 256)) VIRTUAL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `objetivo_id` (`objetivo_id`),
  CONSTRAINT `rutinas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rutinas_ibfk_2` FOREIGN KEY (`objetivo_id`) REFERENCES `objetivos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `sesiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sesiones` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `usuario_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `token_hash` varchar(64) NOT NULL,
  `fecha_creacion` datetime(3) NOT NULL,
  `fecha_expiracion` datetime(3) NOT NULL,
  `dvh` char(64) GENERATED ALWAYS AS (SHA2(CAST(JSON_ARRAY(`fecha_creacion`, `fecha_expiracion`, `id`, `token_hash`, `usuario_id`) AS CHAR), 256)) VIRTUAL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_hash` (`token_hash`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `sesiones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `usuario_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_roles` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `usuario_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `rol_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `fecha_asignacion` datetime(3) NOT NULL,
  `dvh` char(64) GENERATED ALWAYS AS (SHA2(CAST(JSON_ARRAY(`fecha_asignacion`, `id`, `rol_id`, `usuario_id`) AS CHAR), 256)) VIRTUAL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_roles_rol_id_usuario_id_unique` (`usuario_id`,`rol_id`),
  KEY `rol_id` (`rol_id`),
  CONSTRAINT `usuario_roles_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuario_roles_ibfk_2` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `telefono_cifrado` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero` enum('masculino','femenino','otro') NOT NULL DEFAULT 'otro',
  `estado` enum('activo','bloqueado','eliminado') NOT NULL DEFAULT 'activo',
  `fecha_registro` datetime(3) NOT NULL,
  `ultima_conexion` datetime(3) DEFAULT NULL,
  `zona_horaria` varchar(80) NOT NULL DEFAULT 'America/Argentina/Buenos_Aires',
  `consentimiento_ia` tinyint(1) NOT NULL DEFAULT '0',
  `intentos_fallidos` int NOT NULL DEFAULT '0',
  `ultimo_intento_fallido` datetime(3) DEFAULT NULL,
  `bloqueado_hasta` datetime(3) DEFAULT NULL,
  `dvh` char(64) GENERATED ALWAYS AS (SHA2(CAST(JSON_ARRAY(`apellido`, `bloqueado_hasta`, `consentimiento_ia`, `email`, `estado`, `fecha_nacimiento`, `fecha_registro`, `genero`, `id`, `intentos_fallidos`, `nombre`, `password_hash`, `telefono_cifrado`, `ultima_conexion`, `ultimo_intento_fallido`, `zona_horaria`) AS CHAR), 256)) VIRTUAL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

CREATE OR REPLACE VIEW digitos_verificadores AS
SELECT 'bitacora' AS nombre_tabla, COUNT(*) AS filas, SHA2(CONCAT(COUNT(*), ':', HEX(BIT_XOR(CAST(UNHEX(dvh) AS BINARY(32))))), 256) AS dvv FROM `bitacora`
UNION ALL
SELECT 'comidas_consumidas' AS nombre_tabla, COUNT(*) AS filas, SHA2(CONCAT(COUNT(*), ':', HEX(BIT_XOR(CAST(UNHEX(dvh) AS BINARY(32))))), 256) AS dvv FROM `comidas_consumidas`
UNION ALL
SELECT 'conversaciones' AS nombre_tabla, COUNT(*) AS filas, SHA2(CONCAT(COUNT(*), ':', HEX(BIT_XOR(CAST(UNHEX(dvh) AS BINARY(32))))), 256) AS dvv FROM `conversaciones`
UNION ALL
SELECT 'dieta_comidas' AS nombre_tabla, COUNT(*) AS filas, SHA2(CONCAT(COUNT(*), ':', HEX(BIT_XOR(CAST(UNHEX(dvh) AS BINARY(32))))), 256) AS dvv FROM `dieta_comidas`
UNION ALL
SELECT 'dietas' AS nombre_tabla, COUNT(*) AS filas, SHA2(CONCAT(COUNT(*), ':', HEX(BIT_XOR(CAST(UNHEX(dvh) AS BINARY(32))))), 256) AS dvv FROM `dietas`
UNION ALL
SELECT 'entrenamiento_ejercicios' AS nombre_tabla, COUNT(*) AS filas, SHA2(CONCAT(COUNT(*), ':', HEX(BIT_XOR(CAST(UNHEX(dvh) AS BINARY(32))))), 256) AS dvv FROM `entrenamiento_ejercicios`
UNION ALL
SELECT 'entrenamientos' AS nombre_tabla, COUNT(*) AS filas, SHA2(CONCAT(COUNT(*), ':', HEX(BIT_XOR(CAST(UNHEX(dvh) AS BINARY(32))))), 256) AS dvv FROM `entrenamientos`
UNION ALL
SELECT 'mediciones_fisicas' AS nombre_tabla, COUNT(*) AS filas, SHA2(CONCAT(COUNT(*), ':', HEX(BIT_XOR(CAST(UNHEX(dvh) AS BINARY(32))))), 256) AS dvv FROM `mediciones_fisicas`
UNION ALL
SELECT 'mensajes' AS nombre_tabla, COUNT(*) AS filas, SHA2(CONCAT(COUNT(*), ':', HEX(BIT_XOR(CAST(UNHEX(dvh) AS BINARY(32))))), 256) AS dvv FROM `mensajes`
UNION ALL
SELECT 'objetivos' AS nombre_tabla, COUNT(*) AS filas, SHA2(CONCAT(COUNT(*), ':', HEX(BIT_XOR(CAST(UNHEX(dvh) AS BINARY(32))))), 256) AS dvv FROM `objetivos`
UNION ALL
SELECT 'roles' AS nombre_tabla, COUNT(*) AS filas, SHA2(CONCAT(COUNT(*), ':', HEX(BIT_XOR(CAST(UNHEX(dvh) AS BINARY(32))))), 256) AS dvv FROM `roles`
UNION ALL
SELECT 'rutina_ejercicios' AS nombre_tabla, COUNT(*) AS filas, SHA2(CONCAT(COUNT(*), ':', HEX(BIT_XOR(CAST(UNHEX(dvh) AS BINARY(32))))), 256) AS dvv FROM `rutina_ejercicios`
UNION ALL
SELECT 'rutinas' AS nombre_tabla, COUNT(*) AS filas, SHA2(CONCAT(COUNT(*), ':', HEX(BIT_XOR(CAST(UNHEX(dvh) AS BINARY(32))))), 256) AS dvv FROM `rutinas`
UNION ALL
SELECT 'sesiones' AS nombre_tabla, COUNT(*) AS filas, SHA2(CONCAT(COUNT(*), ':', HEX(BIT_XOR(CAST(UNHEX(dvh) AS BINARY(32))))), 256) AS dvv FROM `sesiones`
UNION ALL
SELECT 'usuario_roles' AS nombre_tabla, COUNT(*) AS filas, SHA2(CONCAT(COUNT(*), ':', HEX(BIT_XOR(CAST(UNHEX(dvh) AS BINARY(32))))), 256) AS dvv FROM `usuario_roles`
UNION ALL
SELECT 'usuarios' AS nombre_tabla, COUNT(*) AS filas, SHA2(CONCAT(COUNT(*), ':', HEX(BIT_XOR(CAST(UNHEX(dvh) AS BINARY(32))))), 256) AS dvv FROM `usuarios`;
