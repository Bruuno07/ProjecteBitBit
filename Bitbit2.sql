-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.19-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para noticies
CREATE DATABASE IF NOT EXISTS `noticies` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `noticies`;

-- Volcando estructura para tabla noticies.captcha
CREATE TABLE IF NOT EXISTS `captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `captcha_time` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla noticies.captcha: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `captcha` DISABLE KEYS */;
INSERT INTO `captcha` (`captcha_id`, `captcha_time`, `ip_address`, `word`) VALUES
	(89, 1620658213, '::1', 'kquivxhy');
/*!40000 ALTER TABLE `captcha` ENABLE KEYS */;

-- Volcando estructura para tabla noticies.groups
CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla noticies.groups: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` (`id`, `name`, `description`) VALUES
	(1, 'admin', 'Administrator'),
	(2, 'client', 'Client'),
	(3, 'tecnico', 'Tecnico'),
	(4, 'gestor', 'Gestor');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;

-- Volcando estructura para tabla noticies.incidencia
CREATE TABLE IF NOT EXISTS `incidencia` (
  `id_user` int(11) DEFAULT NULL,
  `desc_averia` varchar(50) DEFAULT NULL,
  `Estado_averia` longtext DEFAULT NULL,
  `Fecha_entrada` date DEFAULT NULL,
  `Salida_entrada` date DEFAULT NULL,
  `uuid` varchar(50) DEFAULT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `Modelo` varchar(50) DEFAULT NULL,
  `Numero_serie` varchar(50) DEFAULT NULL,
  `Diagnostico_prev` longtext DEFAULT NULL,
  `Telf` varchar(50) DEFAULT NULL,
  `tiempo_reparcion` varchar(50) DEFAULT NULL,
  `FechaEntrada` date DEFAULT NULL,
  `id_incidencia` int(11) NOT NULL,
  PRIMARY KEY (`id_incidencia`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla noticies.incidencia: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `incidencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `incidencia` ENABLE KEYS */;

-- Volcando estructura para tabla noticies.infocontacto
CREATE TABLE IF NOT EXISTS `infocontacto` (
  `id_InfoContacto` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `tipo_solicitut` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_InfoContacto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla noticies.infocontacto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `infocontacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `infocontacto` ENABLE KEYS */;

-- Volcando estructura para tabla noticies.keys
CREATE TABLE IF NOT EXISTS `keys` (
  `id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla noticies.keys: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `keys` ENABLE KEYS */;

-- Volcando estructura para tabla noticies.login_attempts
CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla noticies.login_attempts: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
	(17, '::1', 'Tecnic', 1620806270),
	(18, '::1', 'tecnico', 1620806276),
	(19, '::1', 'administrador', 1620850810),
	(20, '::1', 'admin', 1620852897),
	(21, '::1', 'administrador', 1620852910),
	(22, '::1', 'Administrador', 1620857072);
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;

-- Volcando estructura para tabla noticies.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `method` varchar(6) NOT NULL,
  `params` text DEFAULT NULL,
  `api_key` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `time` int(11) NOT NULL,
  `rtime` float DEFAULT NULL,
  `authorized` varchar(1) NOT NULL,
  `response_code` smallint(3) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla noticies.logs: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;

-- Volcando estructura para tabla noticies.mail
CREATE TABLE IF NOT EXISTS `mail` (
  `id_mail` int(11) NOT NULL,
  `de:` varchar(50) DEFAULT NULL,
  `para:` varchar(50) DEFAULT NULL,
  `mensaje` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla noticies.mail: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail` ENABLE KEYS */;

-- Volcando estructura para tabla noticies.material
CREATE TABLE IF NOT EXISTS `material` (
  `id_material` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_material`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla noticies.material: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
/*!40000 ALTER TABLE `material` ENABLE KEYS */;

-- Volcando estructura para tabla noticies.material_incidencia
CREATE TABLE IF NOT EXISTS `material_incidencia` (
  `descrip` varchar(50) DEFAULT NULL,
  `id_material` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_material`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla noticies.material_incidencia: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `material_incidencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `material_incidencia` ENABLE KEYS */;

-- Volcando estructura para tabla noticies.noticia
CREATE TABLE IF NOT EXISTS `noticia` (
  `Descripcion` varchar(50) DEFAULT NULL,
  `id_Usuario` int(11) NOT NULL,
  `id_Notcia` int(11) NOT NULL,
  PRIMARY KEY (`id_Notcia`),
  KEY `id_Usuario` (`id_Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla noticies.noticia: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `noticia` DISABLE KEYS */;
/*!40000 ALTER TABLE `noticia` ENABLE KEYS */;

-- Volcando estructura para tabla noticies.noticies
CREATE TABLE IF NOT EXISTS `noticies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `data` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla noticies.noticies: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `noticies` DISABLE KEYS */;
INSERT INTO `noticies` (`id`, `title`, `subtitle`, `content`, `data`) VALUES
	(2, 'Segona noticia', 'Subtitol segona noticia', 'Contingut segona noticia', '2021-03-01'),
	(3, 'Tercera noticia\r\n', 'Subtitol tercera noticia', 'Contingut tercera noticia', '2021-03-01');
/*!40000 ALTER TABLE `noticies` ENABLE KEYS */;

-- Volcando estructura para tabla noticies.tipo_estado
CREATE TABLE IF NOT EXISTS `tipo_estado` (
  `Descrip` int(11) DEFAULT NULL,
  `id_Estado` int(11) NOT NULL,
  PRIMARY KEY (`id_Estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla noticies.tipo_estado: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipo_estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_estado` ENABLE KEYS */;

-- Volcando estructura para tabla noticies.tokens
CREATE TABLE IF NOT EXISTS `tokens` (
  `tokenid` varchar(36) NOT NULL,
  `subject` varchar(36) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`tokenid`,`subject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla noticies.tokens: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;

-- Volcando estructura para tabla noticies.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_email` (`email`),
  UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  UNIQUE KEY `uc_remember_selector` (`remember_selector`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla noticies.users: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
	(1, '127.0.0.1', 'administrator', '$2y$10$.gQBTIc.W1pmHeSVzYB6pudj2aO.V6bHmFGmIL1ngdxoMLokCUhLC', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1620819515, 1, 'Admin', 'istrator', 'ADMIN', 0),
	(28, '', 'Gestor', '$2y$10$IPCPdTC4DONvezgCxL42CuCES40Je9aEql0l8t/L7mGydA5NI5pxe', 'gestor@gestor.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1620819541, 1, 'gestor', 'gestor', NULL, 611111111),
	(29, '', 'Trabajador', '$2y$10$2NvNaYNNpurimaScEtw/tuvnKoensNWS4Yd0ETYiAWfrvQiQ22PD2', 'trabajador@trabajador.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1620817586, 1, 'Trabajador', 'trabajador', NULL, 611111111),
	(31, '', 'Client', '$2y$10$ULNVB5imJXDBU0n2KVkqmOBE9xC2UNzyUolZquDRsTz2TYUJnxqa6', 'aaa@uuu.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1620857031, 1, 'Client', 'client', NULL, 611111111);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla noticies.users_groups
CREATE TABLE IF NOT EXISTS `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`),
  CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla noticies.users_groups: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(4, 1, 3),
	(3, 1, 4),
	(16, 28, 4),
	(15, 29, 3),
	(14, 31, 2);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;

-- Volcando estructura para tabla noticies.usuario_incidencia
CREATE TABLE IF NOT EXISTS `usuario_incidencia` (
  `id_usuario` int(11) NOT NULL,
  `id_incidencia` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_incidencia` (`id_incidencia`),
  CONSTRAINT `id_incidencia` FOREIGN KEY (`id_incidencia`) REFERENCES `incidencia` (`id_incidencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla noticies.usuario_incidencia: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario_incidencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_incidencia` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;