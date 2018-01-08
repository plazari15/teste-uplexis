# ************************************************************
# Sequel Pro SQL dump
# Versão 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.01 (MySQL 5.7.16)
# Base de Dados: sandbox
# Tempo de Geração: 2018-01-08 04:40:59 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump da tabela migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2018_01_07_021207_create_sintegras_table',1),
	(4,'2016_06_01_000001_create_oauth_auth_codes_table',2),
	(5,'2016_06_01_000002_create_oauth_access_tokens_table',2),
	(6,'2016_06_01_000003_create_oauth_refresh_tokens_table',2),
	(7,'2016_06_01_000004_create_oauth_clients_table',2),
	(8,'2016_06_01_000005_create_oauth_personal_access_clients_table',2);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela oauth_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`)
VALUES
	('f89c550689c9df2b9e7c53c4d564ec24465e9b1b83dc0c5d5097e93e353c3d1d2fb5c7aefc1ef96b',1,2,NULL,'[]',0,'2018-01-08 03:22:44','2018-01-08 03:22:44','2018-01-23 03:22:44');

/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela oauth_auth_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump da tabela oauth_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`)
VALUES
	(1,NULL,'Laravel Personal Access Client','McUlvFxT0PTPFQzKJQ4CfmNi1E0tqhsFLAowxSfZ','http://localhost',1,0,0,'2018-01-08 03:18:25','2018-01-08 03:18:25'),
	(2,NULL,'Laravel Password Grant Client','0VSmDJzPITBE2nj7nq3kFqDShrpMSsiVFw37Wcpa','http://localhost',0,1,0,'2018-01-08 03:18:25','2018-01-08 03:18:25');

/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela oauth_personal_access_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_personal_access_clients`;

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`)
VALUES
	(1,1,'2018-01-08 03:18:25','2018-01-08 03:18:25');

/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela oauth_refresh_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`)
VALUES
	('7a007fb84af332800c570363c1a3ea762113d9917248590d725313aef49feb98adcd320d75569c3a','f89c550689c9df2b9e7c53c4d564ec24465e9b1b83dc0c5d5097e93e353c3d1d2fb5c7aefc1ef96b',0,'2018-02-07 03:22:44');

/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump da tabela sintegras
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sintegras`;

CREATE TABLE `sintegras` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `cnpj` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `json` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sintegras_user_id_foreign` (`user_id`),
  CONSTRAINT `sintegras_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `sintegras` WRITE;
/*!40000 ALTER TABLE `sintegras` DISABLE KEYS */;

INSERT INTO `sintegras` (`id`, `user_id`, `cnpj`, `json`, `created_at`, `updated_at`)
VALUES
	(2,1,'31804115000243','[\n    \"31.804.115\\/0002-43\",\n    \"CEREAIS DO NICO LTDA\",\n    \"RUA IPE\",\n    \"10\",\n    \"MOVELAR\",\n    \"LINHARES\",\n    \"29906-120\",\n    \"COMERCIO ATACADISTA DE CEREAIS E LEGUMINOSAS BENEFICIADAS\",\n    \"26\\/03\\/2004\",\n    \"HABILITADO\",\n    \"26\\/03\\/2004\",\n    \"ORDINARIO\",\n    \" \",\n    \" \",\n    \"Emitente de NFe desde:\",\n    \"31.804.115\\/0002-43\",\n    \"CEREAIS DO NICO LTDA\",\n    \"RUA IPE\",\n    \"10\",\n    \"MOVELAR\",\n    \"LINHARES\",\n    \"29906-120\",\n    \"COMERCIO ATACADISTA DE CEREAIS E LEGUMINOSAS BENEFICIADAS\",\n    \"26\\/03\\/2004\",\n    \"HABILITADO\",\n    \"26\\/03\\/2004\",\n    \"ORDINARIO\",\n    \" \",\n    \" \",\n    \"Emitente de NFe desde:\"\n]','2018-01-08 03:38:40','2018-01-08 03:38:40'),
	(17,1,'31804115000243','[\n    \"31.804.115\\/0002-43\",\n    \"CEREAIS DO NICO LTDA\",\n    \"RUA IPE\",\n    \"10\",\n    \"MOVELAR\",\n    \"LINHARES\",\n    \"29906-120\",\n    \"COMERCIO ATACADISTA DE CEREAIS E LEGUMINOSAS BENEFICIADAS\",\n    \"26\\/03\\/2004\",\n    \"HABILITADO\",\n    \"26\\/03\\/2004\",\n    \"ORDINARIO\",\n    \" \",\n    \" \",\n    \"Emitente de NFe desde:\",\n    \"31.804.115\\/0002-43\",\n    \"CEREAIS DO NICO LTDA\",\n    \"RUA IPE\",\n    \"10\",\n    \"MOVELAR\",\n    \"LINHARES\",\n    \"29906-120\",\n    \"COMERCIO ATACADISTA DE CEREAIS E LEGUMINOSAS BENEFICIADAS\",\n    \"26\\/03\\/2004\",\n    \"HABILITADO\",\n    \"26\\/03\\/2004\",\n    \"ORDINARIO\",\n    \" \",\n    \" \",\n    \"Emitente de NFe desde:\"\n]','2018-01-08 04:31:11','2018-01-08 04:31:11'),
	(18,1,'323232','[\n    \"\\r\\n        \\t<input type=\\\"text\\\" name=\\\"num_cnpj\\\" maxlength=\\\"18\\\" size=\\\"19\\\" onkeypress=\\\"return SomenteNumero(event);\\\" onfocus=\\\"form.num_ie.value=\'\';\\\" \\/>\\r\\n\\t\\t\",\n    \"\\r\\n        \\t<input type=\\\"text\\\" name=\\\"num_ie\\\" maxlength=\\\"12\\\" size=\\\"19\\\" onkeypress=\\\"return SomenteNumero(event);\\\" onfocus=\\\"form.num_cnpj.value=\'\';\\\" \\/>\\r\\n\\t\\t\",\n    \"\\r\\n        \\t<input type=\\\"text\\\" name=\\\"num_cnpj\\\" maxlength=\\\"18\\\" size=\\\"19\\\" onkeypress=\\\"return SomenteNumero(event);\\\" onfocus=\\\"form.num_ie.value=\'\';\\\" \\/>\\r\\n\\t\\t\",\n    \"\\r\\n        \\t<input type=\\\"text\\\" name=\\\"num_ie\\\" maxlength=\\\"12\\\" size=\\\"19\\\" onkeypress=\\\"return SomenteNumero(event);\\\" onfocus=\\\"form.num_cnpj.value=\'\';\\\" \\/>\\r\\n\\t\\t\"\n]','2018-01-08 04:33:10','2018-01-08 04:33:10');

/*!40000 ALTER TABLE `sintegras` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'PEdro','plazari96@gmail.com','$2y$10$ymAWNB8TXxijy0sRw2IJIu6hZMS3wNn3rEvZEa422RYqwIVv6aH1W',NULL,'2018-01-08 03:12:33','2018-01-08 04:36:30');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
