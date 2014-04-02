-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.27 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4208
-- Date/time:                    2014-04-01 20:39:49
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for cometpark
CREATE DATABASE IF NOT EXISTS `cometpark` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cometpark`;


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
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
