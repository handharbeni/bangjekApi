-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.58-0ubuntu0.14.04.1 - (Ubuntu)
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table bangjek_merchant.merchant
CREATE TABLE IF NOT EXISTS `merchant` (
  `id_merchant` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT 'nothing',
  `address` varchar(100) NOT NULL DEFAULT 'nothing',
  `email` varchar(50) NOT NULL DEFAULT 'nothing',
  `password` varchar(150) NOT NULL DEFAULT 'nothing',
  `phone` varchar(15) NOT NULL DEFAULT 'nothing',
  `photo` varchar(255) NOT NULL DEFAULT 'nothing',
  `latitude` varchar(50) NOT NULL DEFAULT 'nothing',
  `longitude` varchar(50) NOT NULL DEFAULT 'nothing',
  `id_merchant_category` int(11) NOT NULL,
  `max_upload` int(11) NOT NULL DEFAULT '1',
  `open_at` time NOT NULL DEFAULT '08:00:00',
  `close_at` time NOT NULL DEFAULT '16:00:00',
  `point` varchar(50) NOT NULL DEFAULT 'nothing',
  `open_status` varchar(50) NOT NULL DEFAULT 'nothing',
  `join_at` date NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'nothing',
  `deleted` enum('Y','N') NOT NULL DEFAULT 'N',
  `imei1` varchar(150) NOT NULL DEFAULT 'nothing',
  `imei2` varchar(150) NOT NULL DEFAULT 'nothing',
  `key` varchar(255) DEFAULT NULL,
  `sha` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_merchant`),
  KEY `FK_merchant_merchant_category` (`id_merchant_category`),
  CONSTRAINT `FK_merchant_merchant_category` FOREIGN KEY (`id_merchant_category`) REFERENCES `merchant_category` (`id_merchant_category`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table bangjek_merchant.merchant: ~3 rows (approximately)
/*!40000 ALTER TABLE `merchant` DISABLE KEYS */;
INSERT INTO `merchant` (`id_merchant`, `name`, `address`, `email`, `password`, `phone`, `photo`, `latitude`, `longitude`, `id_merchant_category`, `max_upload`, `open_at`, `close_at`, `point`, `open_status`, `join_at`, `status`, `deleted`, `imei1`, `imei2`, `key`, `sha`) VALUES
	(6, 'nothing', 'nothing', 'nothing', 'nothing', 'nothing', 'nothing', 'nothing', 'nothing', 3, 1, '08:00:00', '16:00:00', 'nothing', 'nothing', '0000-00-00', 'nothing', 'Y', 'nothing', '123', '59870b6354b917ff6207efaa10061cda599b08a0', 'f769bda11c2c925571bb10b7b3e7f30e00d02bd2'),
	(10, 'Test Ganti Nama', 'Test Ganti Alamat', 'waralaba@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '12345', 'https://pbs.twimg.com/profile_images/658332899335258112/6RSo0UwJ_400x400.jpg', '123', '123', 3, 1, '08:00:00', '16:00:00', 'haha', 'yalah', '0000-00-00', '12345', 'N', '12345', '5432a', 'dc0c3b03290c65442eeda5e5c3145e785c57ff14', '000bec74bfd8a4e2daef506272e37194510f21ed'),
	(11, 'Waralaba', 'Malang', 'waralaba@gmail.coms', '827ccb0eea8a706c4c34a16891f84e7b', '12345', 'haha', '123', '123', 3, 1, '08:00:00', '16:00:00', 'haha', 'yalah', '2017-11-24', '12345', 'N', '12345', '54321', '0cbad627672df5c11bc7d15ceeca83044de0a5cb', NULL);
/*!40000 ALTER TABLE `merchant` ENABLE KEYS */;

-- Dumping structure for table bangjek_merchant.merchant_category
CREATE TABLE IF NOT EXISTS `merchant_category` (
  `id_merchant_category` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_category` varchar(100) NOT NULL DEFAULT 'nothing',
  `max_upload` int(11) NOT NULL DEFAULT '1',
  `date_add` date NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'nothing',
  `deleted` enum('Y','N') NOT NULL DEFAULT 'N',
  `sha` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_merchant_category`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table bangjek_merchant.merchant_category: ~2 rows (approximately)
/*!40000 ALTER TABLE `merchant_category` DISABLE KEYS */;
INSERT INTO `merchant_category` (`id_merchant_category`, `merchant_category`, `max_upload`, `date_add`, `status`, `deleted`, `sha`) VALUES
	(3, 'Testz', 1, '2017-11-23', '1', 'Y', '12853c540a58b6a6fb97721334b11fdd3443d676'),
	(4, 'nothingsx', 1, '2017-11-23', 'nothing', 'Y', 'c22ed37df41514eff693fe8a5c78ac1fd2c3b8d0');
/*!40000 ALTER TABLE `merchant_category` ENABLE KEYS */;

-- Dumping structure for table bangjek_merchant.merchant_menu
CREATE TABLE IF NOT EXISTS `merchant_menu` (
  `id_merchant_menu` int(11) NOT NULL AUTO_INCREMENT,
  `id_merchant` int(11) NOT NULL DEFAULT '0',
  `merchant_menu` varchar(100) NOT NULL DEFAULT 'nothing',
  `id_merchant_menu_category` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL DEFAULT 'nothing',
  `price` varchar(100) NOT NULL DEFAULT 'nothing',
  `discount` varchar(10) NOT NULL DEFAULT 'nothing',
  `discount_variant` enum('%','FIX') NOT NULL DEFAULT '%',
  `description` varchar(255) NOT NULL DEFAULT 'nothing',
  `date_add` date NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'nothing',
  `deleted` enum('Y','N') NOT NULL DEFAULT 'N',
  `sha` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_merchant_menu`),
  KEY `FK__merchant_menu_category` (`id_merchant_menu_category`),
  KEY `FK_merchant_menu_merchant` (`id_merchant`),
  CONSTRAINT `FK_merchant_menu_merchant` FOREIGN KEY (`id_merchant`) REFERENCES `merchant` (`id_merchant`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK__merchant_menu_category` FOREIGN KEY (`id_merchant_menu_category`) REFERENCES `merchant_menu_category` (`id_merchant_menu_category`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table bangjek_merchant.merchant_menu: ~3 rows (approximately)
/*!40000 ALTER TABLE `merchant_menu` DISABLE KEYS */;
INSERT INTO `merchant_menu` (`id_merchant_menu`, `id_merchant`, `merchant_menu`, `id_merchant_menu_category`, `photo`, `price`, `discount`, `discount_variant`, `description`, `date_add`, `status`, `deleted`, `sha`) VALUES
	(1, 10, 'Celana Dalam', 2, 'nothing', 'nothing', 'nothing', '%', 'nothing', '0000-00-00', 'nothing', 'Y', '4c2d0d8d0dc97fe8366faa5baa03ea79c41845ce'),
	(2, 10, 'Nasi Goreng', 1, 'haha', '20000', '20', '%', 'test description', '0000-00-00', '123', 'Y', 'b4e26599a0d0b79009b026ff8fbfcbde2acb59b2'),
	(3, 10, 'Nasi Goreng', 1, 'haha', '20000', '20', '%', 'test description', '2017-11-26', '123', 'N', '3f4e1cd09944f34c3c59b2b28faf82f05ce4e584');
/*!40000 ALTER TABLE `merchant_menu` ENABLE KEYS */;

-- Dumping structure for table bangjek_merchant.merchant_menu_category
CREATE TABLE IF NOT EXISTS `merchant_menu_category` (
  `id_merchant_menu_category` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_menu_category` varchar(100) NOT NULL DEFAULT 'nothing',
  `date_add` date NOT NULL,
  `status` varchar(100) NOT NULL DEFAULT 'nothing',
  `deleted` enum('Y','N') NOT NULL DEFAULT 'N',
  `sha` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_merchant_menu_category`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table bangjek_merchant.merchant_menu_category: ~2 rows (approximately)
/*!40000 ALTER TABLE `merchant_menu_category` DISABLE KEYS */;
INSERT INTO `merchant_menu_category` (`id_merchant_menu_category`, `merchant_menu_category`, `date_add`, `status`, `deleted`, `sha`) VALUES
	(1, 'Sepatu', '2017-11-23', 'nothing', 'N', 'c86b55083c6d95e51e6c7ac3ad97607f0189d55d'),
	(2, 'Celana', '2017-11-22', 'nothing', 'Y', '7d6665a424438a7fb64537cee7876978d66d813b');
/*!40000 ALTER TABLE `merchant_menu_category` ENABLE KEYS */;

-- Dumping structure for trigger bangjek_merchant.merchant_before_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `merchant_before_insert` BEFORE INSERT ON `merchant` FOR EACH ROW BEGIN
	SET @id_merchant = NEW.id_merchant;
	SET @name = NEW.name;
	SET @address = NEW.address;
	SET @email = NEW.email;
	SET @password = NEW.password;
	SET @phone = NEW.phone;
	SET @photo = NEW.photo;
	SET @latitude = NEW.latitude;
	SET @longitude = NEW.longitude;
	SET @id_merchant_category = NEW.id_merchant_category;
	SET @max_upload = NEW.max_upload;
	SET @open_at = NEW.open_at;
	SET @close_at = NEW.close_at;
	SET @open_status = NEW.open_status;
	SET @status = NEW.status;
	SET @deleted = NEW.deleted;
	SET @IMEI1 = NEW.IMEI1;
	SET @IMEI2 = NEW.IMEI2;
	SET @key = CONCAT("-", @id_merchant, @name, @address, @email, @password, @IMEI1, @IMEI2);
	SET @sha = CONCAT("-", @id_merchant, @name, @address, @email, @password,
											@phone, @photo, @latitude, @longitude, 
											@id_merchant_category, @max_upload, @open_at, 
											@close_at, @open_status,
											@status, @deleted, @IMEI1, @IMEI2);
	SET NEW.join_at = NOW();											
	SET NEW.key = SHA1(@key);
	SET NEW.sha = SHA1(@sha);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger bangjek_merchant.merchant_before_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `merchant_before_update` BEFORE UPDATE ON `merchant` FOR EACH ROW BEGIN
	SET @name = NEW.name;
	SET @address = NEW.address;
	SET @email = NEW.email;
	SET @password = NEW.password;
	SET @phone = NEW.phone;
	SET @photo = NEW.photo;
	SET @latitude = NEW.latitude;
	SET @longitude = NEW.longitude;
	SET @id_merchant_category = NEW.id_merchant_category;
	SET @max_upload = NEW.max_upload;
	SET @open_at = NEW.open_at;
	SET @close_at = NEW.close_at;
	SET @open_status = NEW.open_status;
	SET @status = NEW.status;
	SET @deleted = NEW.deleted;
	SET @IMEI1 = NEW.IMEI1;
	SET @IMEI2 = NEW.IMEI2;
	SET @key = CONCAT("-", @name, @address, @email, @password, @IMEI1, @IMEI2);
	SET @sha = CONCAT("-", @name, @address, @email, @password,
											@phone, @photo, @latitude, @longitude, 
											@id_merchant_category, @max_upload, @open_at, 
											@close_at, @open_status,
											@status, @deleted, @IMEI1, @IMEI2);
	SET NEW.sha = SHA1(@sha);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger bangjek_merchant.merchant_category_before_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `merchant_category_before_insert` BEFORE INSERT ON `merchant_category` FOR EACH ROW BEGIN
	SET @id_merchant_category = NEW.id_merchant_category;
	SET @merchant_category = NEW.merchant_category;
	SET @max_upload = NEW.max_upload;
	SET @date_add = NEW.date_add;
	SET @status = NEW.status;
	SET @deleted = NEW.deleted;
	SET @sha = CONCAT("-", @id_merchant_category, @merchant_category, @max_upload, @date_add, @status, @deleted);
	SET NEW.date_add = NOW();	
	SET NEW.sha = SHA1(@sha);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger bangjek_merchant.merchant_category_before_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `merchant_category_before_update` BEFORE UPDATE ON `merchant_category` FOR EACH ROW BEGIN
	SET @merchant_category = NEW.merchant_category;
	SET @max_upload = NEW.max_upload;
	SET @date_add = NEW.date_add;
	SET @status = NEW.status;
	SET @deleted = NEW.deleted;
	SET @sha = CONCAT("-", @id_merchant_category, @merchant_category, @max_upload, @date_add, @status, @deleted);
	SET NEW.sha = SHA1(@sha);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger bangjek_merchant.merchant_menu_before_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `merchant_menu_before_insert` BEFORE INSERT ON `merchant_menu` FOR EACH ROW BEGIN
	SET @id_merchant_menu = NEW.id_merchant_menu;
	SET @merchant_menu = NEW.merchant_menu;
	SET @id_merchant_menu_category = NEW.id_merchant_menu_category;
	SET @photo = NEW.photo;
	SET @price = NEW.price;
	SET @discount = NEW.discount;
	SET @discount_variant = NEW.discount_variant;
	SET @description = NEW.description;
	SET @date_add = NEW.date_add;
	SET @status = NEW.status;
	SET @deleted = NEW.deleted;
	SET @sha = CONCAT("-", @id_merchant_menu, @merchant_menu, @id_merchant_menu_category, 
								@photo, @price, @discount, @discount_variant, @date_add, @status, @deleted);
	SET NEW.date_add = NOW();								
	SET NEW.sha = SHA1(@sha);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger bangjek_merchant.merchant_menu_before_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `merchant_menu_before_update` BEFORE UPDATE ON `merchant_menu` FOR EACH ROW BEGIN
	SET @merchant_menu = NEW.merchant_menu;
	SET @id_merchant_menu_category = NEW.id_merchant_menu_category;
	SET @photo = NEW.photo;
	SET @price = NEW.price;
	SET @discount = NEW.discount;
	SET @discount_variant = NEW.discount_variant;
	SET @description = NEW.description;
	SET @date_add = NEW.date_add;
	SET @status = NEW.status;
	SET @deleted = NEW.deleted;
	SET @sha = CONCAT("-", @merchant_menu, @id_merchant_menu_category, 
								@photo, @price, @discount, @discount_variant, @date_add, @status, @deleted);
	SET NEW.sha = SHA1(@sha);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger bangjek_merchant.merchant_menu_category_before_insert
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `merchant_menu_category_before_insert` BEFORE INSERT ON `merchant_menu_category` FOR EACH ROW BEGIN
	SET @id_merchant_menu_category = NEW.id_merchant_menu_category;
	SET @merchant_menu_category = NEW.merchant_menu_category;
	SET @date_add = NEW.date_add;
	SET @status = NEW.status;
	SET @deleted = NEW.deleted;
	SET @sha = CONCAT("-", @id_merchant_menu_category, @merchant_menu_category, @merchant_menu_category, @status, @deleted);
	SET NEW.date_add = NOW();	
	SET NEW.sha = SHA1(@sha);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger bangjek_merchant.merchant_menu_category_before_update
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='';
DELIMITER //
CREATE TRIGGER `merchant_menu_category_before_update` BEFORE UPDATE ON `merchant_menu_category` FOR EACH ROW BEGIN
	SET @merchant_menu_category = NEW.merchant_menu_category;
	SET @date_add = NEW.date_add;
	SET @status = NEW.status;
	SET @deleted = NEW.deleted;
	SET @sha = CONCAT("-", @merchant_menu_category, @date_add, @status, @deleted);
	SET NEW.sha = SHA1(@sha);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
