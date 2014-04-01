-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.27 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4208
-- Date/time:                    2014-03-31 23:22:21
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for cometpark
CREATE DATABASE IF NOT EXISTS `cometpark` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cometpark`;


-- Dumping structure for table cometpark.app_user
CREATE TABLE IF NOT EXISTS `app_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_expired` bit(1) NOT NULL,
  `account_locked` bit(1) NOT NULL,
  `address` varchar(150) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postal_code` varchar(15) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `credentials_expired` bit(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `account_enabled` bit(1) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `password_hint` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cometpark.app_user: ~3 rows (approximately)
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` (`id`, `account_expired`, `account_locked`, `address`, `city`, `country`, `postal_code`, `province`, `credentials_expired`, `email`, `account_enabled`, `first_name`, `last_name`, `password`, `password_hint`, `phone_number`, `username`, `version`, `website`) VALUES
	(-3, b'00000000', b'00000000', '', 'Denver', 'US', '80210', 'CO', b'00000000', 'two_roles_user@appfuse.org', b'10000000', 'Two Roles', 'User', '$2a$10$bH/ssqW8OhkTlIso9/yakubYODUOmh.6m5HEJvcBq3t3VdBh7ebqO', 'Not a female kitty.', '', 'two_roles_user', 1, 'http://raibledesigns.com'),
	(-2, b'00000000', b'00000000', '', 'Denver', 'US', '80210', 'CO', b'00000000', 'matt@raibledesigns.com', b'10000000', 'Matt', 'Raible', '$2a$10$bH/ssqW8OhkTlIso9/yakubYODUOmh.6m5HEJvcBq3t3VdBh7ebqO', 'Not a female kitty.', '', 'admin', 1, 'http://raibledesigns.com'),
	(-1, b'00000000', b'00000000', '', 'Denver', 'US', '80210', 'CO', b'00000000', 'matt_raible@yahoo.com', b'10000000', 'Tomcat', 'User', '$2a$10$CnQVJ9bsWBjMpeSKrrdDEeuIptZxXrwtI6CZ/OgtNxhIgpKxXeT9y', 'A male kitty.', '', 'user', 1, 'http://tomcat.apache.org');
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;


-- Dumping structure for table cometpark.controller
CREATE TABLE IF NOT EXISTS `controller` (
  `ControllerId` int(10) NOT NULL,
  `LastLiveUpdate` datetime NOT NULL,
  `Lat` double NOT NULL,
  `Lng` double NOT NULL,
  PRIMARY KEY (`ControllerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cometpark.controller: ~0 rows (approximately)
/*!40000 ALTER TABLE `controller` DISABLE KEYS */;
/*!40000 ALTER TABLE `controller` ENABLE KEYS */;


-- Dumping structure for table cometpark.parkinglot
CREATE TABLE IF NOT EXISTS `parkinglot` (
  `ParkingLotId` int(10) NOT NULL,
  `ParkingLotName` varchar(50) NOT NULL,
  `CenterLat` double NOT NULL,
  `CenterLng` double NOT NULL,
  PRIMARY KEY (`ParkingLotId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cometpark.parkinglot: ~3 rows (approximately)
/*!40000 ALTER TABLE `parkinglot` DISABLE KEYS */;
INSERT INTO `parkinglot` (`ParkingLotId`, `ParkingLotName`, `CenterLat`, `CenterLng`) VALUES
	(1, 'Lot A', 32.989962, -96.745673),
	(2, 'Lot B', 32.989026, -96.744858),
	(3, 'Lot H', 0, 0);
/*!40000 ALTER TABLE `parkinglot` ENABLE KEYS */;


-- Dumping structure for table cometpark.parkingspot
CREATE TABLE IF NOT EXISTS `parkingspot` (
  `ParkingSpotId` int(10) NOT NULL,
  `ParkingLotId` int(10) NOT NULL,
  `SpotNumber` int(10) NOT NULL,
  `PermitLevelId` int(10) NOT NULL,
  `Lat` double NOT NULL,
  `Lng` double NOT NULL,
  `IsVacant` tinyint(1) NOT NULL,
  `LastUpdate` datetime NOT NULL,
  PRIMARY KEY (`ParkingSpotId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cometpark.parkingspot: ~4 rows (approximately)
/*!40000 ALTER TABLE `parkingspot` DISABLE KEYS */;
INSERT INTO `parkingspot` (`ParkingSpotId`, `ParkingLotId`, `SpotNumber`, `PermitLevelId`, `Lat`, `Lng`, `IsVacant`, `LastUpdate`) VALUES
	(1, 2, 100, 1, 32.98709, -96.752503, 0, '2014-03-31 23:20:19'),
	(2, 2, 101, 1, 32.987092, -96.752556, 1, '2014-03-31 23:19:47'),
	(3, 3, 201, 2, 32.988759, -96.744825, 0, '2014-03-31 23:06:29'),
	(4, 3, 202, 2, 32.988716, -96.744769, 1, '2014-03-31 23:07:03');
/*!40000 ALTER TABLE `parkingspot` ENABLE KEYS */;


-- Dumping structure for table cometpark.permitlevel
CREATE TABLE IF NOT EXISTS `permitlevel` (
  `PermitLevelId` int(10) NOT NULL,
  `PermitLevelName` varchar(50) NOT NULL,
  PRIMARY KEY (`PermitLevelId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cometpark.permitlevel: ~5 rows (approximately)
/*!40000 ALTER TABLE `permitlevel` DISABLE KEYS */;
INSERT INTO `permitlevel` (`PermitLevelId`, `PermitLevelName`) VALUES
	(1, 'Visitor'),
	(2, 'Green'),
	(3, 'Gold'),
	(4, 'Orange'),
	(5, 'Purple');
/*!40000 ALTER TABLE `permitlevel` ENABLE KEYS */;


-- Dumping structure for table cometpark.role
CREATE TABLE IF NOT EXISTS `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(64) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cometpark.role: ~2 rows (approximately)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `description`, `name`) VALUES
	(-2, 'Default role for all Users', 'ROLE_USER'),
	(-1, 'Administrator role (can edit Users)', 'ROLE_ADMIN');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


-- Dumping structure for table cometpark.user_role
CREATE TABLE IF NOT EXISTS `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK143BF46A4FD90D75` (`role_id`),
  KEY `FK143BF46AF503D155` (`user_id`),
  CONSTRAINT `FK143BF46A4FD90D75` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FK143BF46AF503D155` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cometpark.user_role: ~4 rows (approximately)
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
	(-3, -2),
	(-1, -2),
	(-3, -1),
	(-2, -1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
