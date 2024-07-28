-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for db_kmeans
CREATE DATABASE IF NOT EXISTS `db_kmeans` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_kmeans`;

-- Dumping structure for table db_kmeans.auth_groups_users
CREATE TABLE IF NOT EXISTS `auth_groups_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `auth_groups_users_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_kmeans.auth_groups_users: ~0 rows (approximately)
REPLACE INTO `auth_groups_users` (`id`, `user_id`, `group`, `created_at`) VALUES
	(1, 1, 'admin', '2024-05-30 07:38:41');

-- Dumping structure for table db_kmeans.auth_identities
CREATE TABLE IF NOT EXISTS `auth_identities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `secret2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `force_reset` tinyint(1) NOT NULL DEFAULT '0',
  `last_used_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `type_secret` (`type`,`secret`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `auth_identities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_kmeans.auth_identities: ~0 rows (approximately)
REPLACE INTO `auth_identities` (`id`, `user_id`, `type`, `name`, `secret`, `secret2`, `expires`, `extra`, `force_reset`, `last_used_at`, `created_at`, `updated_at`) VALUES
	(1, 1, 'email_password', NULL, 'admin@plagiat.com', '$2y$12$DsOC8pOriEPS6QWddfdJTuDo2owdobshbtf0SkUuAxDmHNGCxn5uS', NULL, NULL, 0, '2024-07-28 14:52:20', '2024-05-30 07:38:40', '2024-07-28 14:52:20'),
	(2, 2, 'email_password', NULL, 'dosen@plagiat.com', '$2y$12$J507/x2T7p9O/ik5YiFPtOocyJV9KfJ9F4fBQ.4oTK8gWmjhS6Hjm', NULL, NULL, 0, NULL, '2024-07-21 08:42:54', NULL),
	(3, 3, 'email_password', NULL, 'dosen1@plagiat.com', '$2y$12$O0OiWoC/bspQqyPcRrSwce7/gyynfDjmbcqykJSgLbNCdAgN6BIzy', NULL, NULL, 0, '2024-07-21 09:14:54', '2024-07-21 09:14:34', '2024-07-21 09:14:54'),
	(4, 4, 'email_password', NULL, 'dosn3@plagiat.com', '$2y$12$9/lowUoIQO1H/JieOWBKH.kJOAIw3DsujBOR0gTroNsY6TMHFIClu', NULL, NULL, 0, '2024-07-21 10:28:36', '2024-07-21 10:28:22', '2024-07-21 10:28:36');

-- Dumping structure for table db_kmeans.auth_logins
CREATE TABLE IF NOT EXISTS `auth_logins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_type_identifier` (`id_type`,`identifier`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_kmeans.auth_logins: ~8 rows (approximately)
REPLACE INTO `auth_logins` (`id`, `ip_address`, `user_agent`, `id_type`, `identifier`, `user_id`, `date`, `success`) VALUES
	(1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'email_password', 'admin@rmtahfiz.com', 1, '2024-05-30 17:46:17', 1),
	(2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'email_password', 'admin@rmtahfiz.com', NULL, '2024-05-31 11:56:38', 0),
	(3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'email_password', 'admin@rmtahfiz.com', 1, '2024-05-31 11:56:41', 1),
	(4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'email_password', 'admin@rmtahfiz.com', 1, '2024-05-31 18:35:52', 1),
	(5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'email_password', 'admin@rmtahfiz.com', NULL, '2024-06-03 08:41:49', 0),
	(6, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'email_password', 'admin@rmtahfiz.com', 1, '2024-06-03 08:41:52', 1),
	(7, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'email_password', 'admin@rmtahfiz.com', 1, '2024-06-03 11:21:00', 1),
	(8, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'email_password', 'A001@tes.com', 2, '2024-06-03 14:18:58', 1),
	(9, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'email_password', 'admin@rmtahfiz.com', 1, '2024-06-03 14:28:28', 1),
	(10, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'email_password', 'A001@tes.com', 2, '2024-06-03 14:32:04', 1),
	(11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'email_password', 'admin@rmtahfiz.com', 1, '2024-06-03 14:39:35', 1),
	(12, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'email_password', 'A001@tes.coom', NULL, '2024-06-03 14:41:24', 0),
	(13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'email_password', 'A001@tes.com', 2, '2024-06-03 14:41:31', 1),
	(14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'email_password', 'A001@tes.com', 2, '2024-06-03 15:52:10', 1),
	(15, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'email_password', 'A001@tes.com', 2, '2024-06-03 16:05:37', 1),
	(16, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'email_password', 'A001@tes.com', 2, '2024-06-03 16:11:38', 1),
	(17, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'email_password', 'A001@tes.com', 2, '2024-06-03 16:13:00', 1),
	(18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'email_password', 'A001@tes.com', 2, '2024-06-03 16:13:32', 1),
	(19, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'username', 'A001', 2, '2024-06-04 08:36:50', 1),
	(20, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'username', 'admin', 1, '2024-06-04 10:18:56', 1),
	(21, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'username', 'admin', 1, '2024-06-07 08:20:06', 1),
	(22, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'username', 'A001', NULL, '2024-06-07 08:20:44', 0),
	(23, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'username', 'A001', NULL, '2024-06-07 08:21:22', 0),
	(24, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'username', 'A001', NULL, '2024-06-07 08:21:35', 0),
	(25, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'username', 'A001', NULL, '2024-06-07 08:21:39', 0),
	(26, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'username', 'A001', NULL, '2024-06-07 08:21:42', 0),
	(27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'username', 'A001', NULL, '2024-06-07 08:22:03', 0),
	(28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'username', 'A001', NULL, '2024-06-07 08:22:07', 0),
	(29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'username', 'admin', 1, '2024-06-07 08:22:18', 1),
	(30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'username', 'A001', 2, '2024-06-07 08:22:26', 1),
	(31, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'username', 'A001', 2, '2024-06-07 08:22:45', 1),
	(32, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'username', 'A007', NULL, '2024-06-07 08:44:36', 0),
	(33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'username', 'A007', NULL, '2024-06-07 08:45:06', 0),
	(34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'username', 'A001', NULL, '2024-06-07 08:45:11', 0),
	(35, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'username', 'A007', NULL, '2024-06-07 08:45:35', 0),
	(36, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'username', 'A001', NULL, '2024-06-07 08:46:06', 0),
	(37, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'username', 'A001', NULL, '2024-06-07 08:46:11', 0),
	(38, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'username', 'A001', 2, '2024-06-07 08:46:18', 1),
	(39, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'username', 'A001', NULL, '2024-06-07 08:46:36', 0),
	(40, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'username', 'A001', 2, '2024-06-07 08:46:39', 1),
	(41, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'username', 'A007', 15, '2024-06-07 08:46:47', 1),
	(42, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'username', '1304047101930001', NULL, '2024-06-07 08:53:24', 0),
	(43, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'username', 'admin', 1, '2024-06-07 08:58:56', 1),
	(44, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'username', 'admin', 1, '2024-06-07 14:27:21', 1),
	(45, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'username', 'admin', 1, '2024-06-12 18:45:18', 1),
	(46, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'username', '1306030501910001', 12, '2024-06-12 18:46:28', 1),
	(47, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'username', 'admin', 1, '2024-06-12 18:54:30', 1),
	(48, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'username', '1306030501910001', 12, '2024-06-12 18:55:27', 1),
	(49, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'username', 'admin', 1, '2024-06-12 19:49:57', 1),
	(50, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'username', '1306030501910001', 12, '2024-06-12 19:56:34', 1),
	(51, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'username', 'admin', NULL, '2024-06-12 19:59:39', 0),
	(52, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'username', 'admin', NULL, '2024-06-12 19:59:42', 0),
	(53, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36 Edg/125.0.0.0', 'username', 'admin', 1, '2024-06-12 19:59:45', 1),
	(54, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'username', 'admin', 1, '2024-06-22 10:54:44', 1),
	(55, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'username', 'admin', 1, '2024-07-10 19:36:54', 1),
	(56, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'username', 'admin', 1, '2024-07-18 12:23:17', 1),
	(57, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'username', 'admin', 1, '2024-07-18 20:35:14', 1),
	(58, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'username', 'admin', 1, '2024-07-19 19:57:17', 1),
	(59, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'username', 'admin', 1, '2024-07-20 04:47:47', 1),
	(60, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'username', 'admin', 1, '2024-07-20 10:06:46', 1),
	(61, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'username', 'admin', 1, '2024-07-20 11:27:01', 1),
	(62, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'username', 'admin', 1, '2024-07-20 16:12:20', 1),
	(63, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'username', 'admin', NULL, '2024-07-21 05:49:23', 0),
	(64, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'username', 'admin', 1, '2024-07-21 05:49:28', 1),
	(65, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'username', 'admin', 1, '2024-07-21 08:32:08', 1),
	(66, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'username', 'admin', 1, '2024-07-21 08:35:20', 1),
	(67, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'username', 'admin', 1, '2024-07-21 08:35:38', 1),
	(68, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'username', 'admin', 1, '2024-07-21 08:39:19', 1),
	(69, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'username', 'admin', 1, '2024-07-21 08:45:17', 1),
	(70, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'username', 'dosen1', NULL, '2024-07-21 09:14:49', 0),
	(71, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'username', 'dosen1', 3, '2024-07-21 09:14:54', 1),
	(72, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'username', 'admin', 1, '2024-07-21 10:21:47', 1),
	(73, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'username', 'dosen3', 4, '2024-07-21 10:28:36', 1),
	(74, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'username', 'admin', 1, '2024-07-21 18:13:35', 1),
	(75, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'username', 'admin', 1, '2024-07-26 15:09:43', 1),
	(76, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'username', 'admin', NULL, '2024-07-27 12:40:53', 0),
	(77, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'username', 'admin', 1, '2024-07-27 12:40:58', 1),
	(78, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36 Edg/126.0.0.0', 'username', 'admin', 1, '2024-07-27 16:44:31', 1),
	(79, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'username', 'admin', 1, '2024-07-28 06:19:20', 1),
	(80, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'username', 'admin', 1, '2024-07-28 11:56:54', 1),
	(81, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0', 'username', 'admin', 1, '2024-07-28 14:52:20', 1);

-- Dumping structure for table db_kmeans.auth_permissions_users
CREATE TABLE IF NOT EXISTS `auth_permissions_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `auth_permissions_users_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `auth_permissions_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_kmeans.auth_permissions_users: ~0 rows (approximately)

-- Dumping structure for table db_kmeans.auth_remember_tokens
CREATE TABLE IF NOT EXISTS `auth_remember_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `selector` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hashedValidator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int unsigned NOT NULL,
  `expires` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `selector` (`selector`) USING BTREE,
  KEY `auth_remember_tokens_user_id_foreign` (`user_id`) USING BTREE,
  CONSTRAINT `auth_remember_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_kmeans.auth_remember_tokens: ~0 rows (approximately)

-- Dumping structure for table db_kmeans.auth_token_logins
CREATE TABLE IF NOT EXISTS `auth_token_logins` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_type_identifier` (`id_type`,`identifier`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_kmeans.auth_token_logins: ~0 rows (approximately)

-- Dumping structure for table db_kmeans.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `namespace` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time` int NOT NULL,
  `batch` int unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_kmeans.migrations: ~0 rows (approximately)
REPLACE INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
	(1, '2020-12-28-223112', 'CodeIgniter\\Shield\\Database\\Migrations\\CreateAuthTables', 'default', 'CodeIgniter\\Shield', 1717049774, 1),
	(2, '2021-07-04-041948', 'CodeIgniter\\Settings\\Database\\Migrations\\CreateSettingsTable', 'default', 'CodeIgniter\\Settings', 1717049774, 1),
	(3, '2021-11-14-143905', 'CodeIgniter\\Settings\\Database\\Migrations\\AddContextColumn', 'default', 'CodeIgniter\\Settings', 1717049774, 1);

-- Dumping structure for table db_kmeans.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `type` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'string',
  `context` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_kmeans.settings: ~0 rows (approximately)

-- Dumping structure for table db_kmeans.tbl_bidang_studi
CREATE TABLE IF NOT EXISTS `tbl_bidang_studi` (
  `id_bidang_studi` int NOT NULL AUTO_INCREMENT,
  `bidang_studi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deskripsi` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id_bidang_studi`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table db_kmeans.tbl_bidang_studi: ~0 rows (approximately)
REPLACE INTO `tbl_bidang_studi` (`id_bidang_studi`, `bidang_studi`, `deskripsi`) VALUES
	(1, 'Perancangan dan Pengembangan Sistem Informasi', 'Analisis Sistem,Pemrograman,Basis Data, Perancangan Antarmuka Pengguna (UI/UX)'),
	(2, 'Jaringan Komputer dan Keamanan Informasi', 'Jaringan Komputer, Keamanan Jaringan, Kriptografi'),
	(3, 'Sistem Informasi Manajemen (SIM)', 'Analisis Bisnis, Sistem Pendukung Keputusan (SPK), Sistem Informasi Manajemen Sumber Daya Manusia'),
	(4, 'E-commerce dan Bisnis Online', 'Pemasaran Digital, Pembayaran Elektronik, Logistik dan Rantai Pasok'),
	(5, 'Kecerdasan Buatan', 'Pembelajaran Mesin, Kecerdasan Buatan, Pemrosesan Bahasa Alami (NLP)'),
	(7, 'Ilmu Hacking', 'deskripsi s');

-- Dumping structure for table db_kmeans.tbl_prodi
CREATE TABLE IF NOT EXISTS `tbl_prodi` (
  `id_prodi` int NOT NULL AUTO_INCREMENT,
  `id_fakultas` int DEFAULT NULL,
  `prodi` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_prodi`),
  KEY `FK_tbl_prodi_tbl_fakultas` (`id_fakultas`),
  CONSTRAINT `FK_tbl_prodi_tbl_fakultas` FOREIGN KEY (`id_fakultas`) REFERENCES `tbl_fakultas` (`id_fakultas`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table db_kmeans.tbl_prodi: ~0 rows (approximately)
REPLACE INTO `tbl_prodi` (`id_prodi`, `id_fakultas`, `prodi`) VALUES
	(1, 1, 'Manajemen Informatika'),
	(2, 1, 'Perbankan Syariah');

-- Dumping structure for table db_kmeans.tbl_tugas_akhir
CREATE TABLE IF NOT EXISTS `tbl_tugas_akhir` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_prodi` int NOT NULL DEFAULT '0',
  `judul` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deskripsi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `jumlah_halaman` int DEFAULT NULL,
  `tahun_terbit` int DEFAULT NULL,
  `id_bidang_studi` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tbl_tugas_akhir_tbl_prodi` (`id_prodi`),
  KEY `FK_tbl_tugas_akhir_tbl_bidang_studi` (`id_bidang_studi`),
  CONSTRAINT `FK_tbl_tugas_akhir_tbl_bidang_studi` FOREIGN KEY (`id_bidang_studi`) REFERENCES `tbl_bidang_studi` (`id_bidang_studi`),
  CONSTRAINT `FK_tbl_tugas_akhir_tbl_prodi` FOREIGN KEY (`id_prodi`) REFERENCES `tbl_prodi` (`id_prodi`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table db_kmeans.tbl_tugas_akhir: ~6 rows (approximately)
REPLACE INTO `tbl_tugas_akhir` (`id`, `id_prodi`, `judul`, `deskripsi`, `jumlah_halaman`, `tahun_terbit`, `id_bidang_studi`) VALUES
	(1, 1, 'Analisis Data Besar', 'Menganalisis data besar', 100, 22, 1),
	(2, 1, 'Pengembangan Aplikasi Web', 'Pengembangan web modern', 112, 22, 1),
	(3, 1, 'Optimasi Algoritma', 'Mengoptimalkan algoritma', 113, 23, 1),
	(4, 1, 'Sistem Keamanan Jaringan', 'Keamanan jaringan komputer', 87, 24, 2),
	(5, 1, 'Machine Learning', 'Penerapan ML', 68, 20, 5),
	(6, 1, 'Aplikasi Sistem Penunjang Keputusan menggunakan SA', 'Sistem Penunjang Keputusan', 121, 21, 1),
	(7, 2, 'Pengembangan Sistem Informasi Manajemen berbasis Cloud Computing untuk Meningkatkan Efisiensi Proses Bisnis pada PT ABC', NULL, 133, 23, 1),
	(8, 1, 'Implementasi Blockchain untuk Meningkatkan Transparansi dan Keamanan Data', NULL, 129, 24, 2);

-- Dumping structure for table db_kmeans.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `last_active` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table db_kmeans.users: ~2 rows (approximately)
REPLACE INTO `users` (`id`, `username`, `status`, `status_message`, `active`, `last_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'admin', NULL, NULL, 1, '2024-07-28 15:44:07', '2024-05-30 07:38:40', '2024-07-21 08:45:29', NULL),
	(2, 'dosen', 'banned', 'Maaf, Anda tidak bisa login saat ini. Hubungi Administrator', 0, NULL, '2024-07-21 08:41:39', '2024-07-21 08:46:01', NULL),
	(3, 'dosen1', NULL, NULL, 0, '2024-07-21 10:06:24', '2024-07-21 09:14:33', '2024-07-21 09:14:33', NULL),
	(4, 'dosen3', NULL, NULL, 0, '2024-07-21 10:28:36', '2024-07-21 10:28:22', '2024-07-21 10:28:22', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
