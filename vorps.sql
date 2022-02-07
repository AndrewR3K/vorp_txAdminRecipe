DROP TABLE IF EXISTS `whitelist`;
CREATE TABLE `whitelist`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `identifier`(`identifier`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `group` varchar(50) DEFAULT 'user',
  `warnings` int(11) DEFAULT 0,
  `banned` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters`  (
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `charidentifier` int(11) NOT NULL AUTO_INCREMENT,
  `group` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'user',
  `money` double(11, 2) NULL DEFAULT 0,
  `gold` double(11, 2) NULL DEFAULT 0,
  `rol` double(11, 2) NOT NULL DEFAULT 0,
  `xp` int(11) NULL DEFAULT 0,
  `inventory` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `job` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT 'unemployed',
  `status` varchar(140) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '{}',
  `firstname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT ' ',
  `lastname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT ' ',
  `skinPlayer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `compPlayer` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `jobgrade` int(11) NULL DEFAULT 0,
  `coords` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '{}',
  `isdead` tinyint(1) NULL DEFAULT 0,
  UNIQUE INDEX `identifier_charidentifier`(`identifier`, `charidentifier`) USING BTREE,
  INDEX `charidentifier`(`charidentifier`) USING BTREE,
  CONSTRAINT `FK_characters_users` FOREIGN KEY (`identifier`) REFERENCES `users` (`identifier`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

DROP TABLE IF EXISTS `loadout`;
CREATE TABLE `loadout` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`identifier` VARCHAR(50) NOT NULL,
	`charidentifier` INT(11) NULL,
	`name` VARCHAR(50) NULL DEFAULT NULL,
	`ammo` VARCHAR(255) NOT NULL DEFAULT '{}',
	`components` VARCHAR(255) NOT NULL DEFAULT '[]',
	`dirtlevel` DOUBLE NULL DEFAULT 0,
	`mudlevel` DOUBLE NULL DEFAULT 0,
	`conditionlevel` DOUBLE NULL DEFAULT 0,
	`rustlevel` DOUBLE NULL DEFAULT 0,
	`used` TINYINT(4) NULL DEFAULT 0,
  `dropped` INT(11) NOT NULL DEFAULT 0,
  `comps` LONGTEXT NOT NULL 
  `used2` tinyint(4) NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`),
	INDEX `id` (`id`)
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB;

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
	`item` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) NOT NULL,
	`limit` INT(11) NOT NULL DEFAULT 1,
	`can_remove` TINYINT(1) NOT NULL DEFAULT 1,
	`type` VARCHAR(50) NULL DEFAULT NULL,
	`usable` TINYINT(1) NULL DEFAULT NULL,
	PRIMARY KEY (`item`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
ROW_FORMAT=DYNAMIC
;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for outfits
-- ----------------------------
DROP TABLE IF EXISTS `outfits`;
CREATE TABLE `outfits`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `charidentifier` int(11) NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `comps` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for stables
-- ----------------------------
DROP TABLE IF EXISTS `stables`;
CREATE TABLE `stables`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `charidentifier` int(11) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `modelname` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `xp` int(11) NULL DEFAULT 0,
  `injured` int(11) NULL DEFAULT 0,
  `gear` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `isDefault` int(11) NOT NULL DEFAULT 0,
  `inventory` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `horse_complements`;
CREATE TABLE `horse_complements`  (
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `charidentifier` int(11) NOT NULL,
  `complements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  UNIQUE INDEX `identifier`(`identifier`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;


SET FOREIGN_KEY_CHECKS = 1;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `banneds` (
  `b_id` int(11) NOT NULL,
  `b_steam` varchar(100) NOT NULL,
  `b_license` varchar(255) DEFAULT NULL,
  `b_discord` varchar(100) DEFAULT NULL,
  `b_reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `b_banned` varchar(100) NOT NULL,
  `b_unban` varchar(100) NOT NULL,
  `b_permanent` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;


ALTER TABLE `banneds`
  ADD PRIMARY KEY (`b_id`) USING BTREE;


ALTER TABLE `banneds`
  MODIFY `b_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for housing
-- ----------------------------
DROP TABLE IF EXISTS `housing`;
CREATE TABLE `housing`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `charidentifier` int(11) NOT NULL,
  `inventory` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `furniture` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `open` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34307 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interiorId` int(11) NOT NULL,
  `inventory` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `identifier` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `charidentifier` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

-- Insert data for items
INSERT INTO `items` (`item`, `label`, `limit`, `can_remove`, `type`, `usable`) VALUES
('consumable_coffee', 'Cafe', 5, 1, 'item_standard', 1),
('consumable_haycube', 'Heno', 50, 1, 'item_standard', 1),
('consumable_kidneybeans_can', 'Lata de alubias', 5, 1, 'item_standard', 1),
('consumable_medicine', 'Medicina', 3, 1, 'item_standard', 1),
('consumable_peach', 'Melocoton', 5, 1, 'item_standard', 1),
('consumable_salmon_can', 'Lata de Salmon', 5, 1, 'item_standard', 1),
('ammo_bullet_pistol', 'Pistol Ammo', 10, 1, 'item_standard', 1),
('ammo_bullet_revolver', 'Revolver Ammo', 10, 1, 'item_standard', 1),
('ammo_bullet_rifle', 'Rifle Ammo', 1, 1, 'item_standard', 1),
('ammo_bullet_varmint', 'Varmint Ammo', 1, 1, 'item_standard', 1),
('ammo_shotgun', 'Shotgun Shells', 10, 1, 'item_standard', 1),
('ammo_bullet_repeater', 'Repeater Ammo', 10, 1, 'item_standard', 1),
('wood', 'Wood', 50, 1, 'item_standard', 0),
('wooden_boards', 'Wooden Boards', 25, 1, 'item_standard', 0),
('ammorepeaterexplosive', 'Repeater Ammo Explosive', 10, 1, 'item_standard', 1),
('ammorepeaterexpress', 'Repeater Ammo Express', 10, 1, 'item_standard', 1),
('ammorepeaternormal', 'Repeater Ammo Normal', 10, 1, 'item_standard', 1),
('ammorepeatervelocity', 'Repeater Ammo Velocity', 10, 1, 'item_standard', 1),
('ammorepeatersplitpoint', 'Repeater Ammo Splitpoint', 10, 1, 'item_standard', 1),
('ammorevolverexplosive', 'Revolver Ammo Explosive', 10, 1, 'item_standard', 1),
('ammorevolverexpress', 'Revolver Ammo Express', 10, 1, 'item_standard', 1),
('ammorevolvernormal', 'Revolver Ammo Normal', 10, 1, 'item_standard', 1),
('ammorevolvervelocity', 'Revolver Ammo Velocity', 10, 1, 'item_standard', 1),
('ammorevolversplitpoint', 'Revolver Ammo Splitpoint', 10, 1, 'item_standard', 1),
('ammorifleexplosive', 'Rifle Ammo Explosive', 10, 1, 'item_standard', 1),
('ammorifleexpress', 'Rifle Ammo Express', 10, 1, 'item_standard', 1),
('ammoriflenormal', 'Rifle Ammo Normal', 10, 1, 'item_standard', 1),
('ammoriflevelocity', 'Rifle Ammo Velocity', 10, 1, 'item_standard', 1),
('ammoriflesplitpoint', 'Rifle Ammo Splitpoint', 10, 1, 'item_standard', 1),
('ammoelephant', 'Elephant Rifle Ammo', 10, 1, 'item_standard', 1),
('ammoshotgunincendiary', 'Shotgun Ammo Incendiary', 10, 1, 'item_standard', 1),
('ammoshotgunexplosive', 'Shotgun Ammo Explosive', 10, 1, 'item_standard', 1),
('ammoshotgunnormal', 'Shotgun Ammo Normal', 10, 1, 'item_standard', 1),
('ammoshotgunslug', 'Shotgun Ammo Slug', 10, 1, 'item_standard', 1),
('ammopistolexplosive', 'Pistol Ammo Explosive', 10, 1, 'item_standard', 1),
('ammopistolexpress', 'Pistol Ammo Express', 10, 1, 'item_standard', 1),
('ammopistolnormal', 'Pistol Ammo Normal', 10, 1, 'item_standard', 1),
('ammopistolvelocity', 'Pistol Ammo Velocity', 10, 1, 'item_standard', 1),
('ammopistolsplitpoint', 'Pistol Ammo Splitpoint', 10, 1, 'item_standard', 1),
('ammoarrowdynamite', 'Arrow Dynamite', 10, 1, 'item_standard', 1),
('ammoarrowfire', 'Arrow Fire', 10, 1, 'item_standard', 1),
('ammoarrmownormal', 'Arrow Normal', 10, 1, 'item_standard', 1),
('ammoarrowimproved', 'Arrow Improved', 10, 1, 'item_standard', 1),
('ammoarrowsmallgame', 'Arrow Small Game', 10, 1, 'item_standard', 1),
('ammoarrowpoison', 'Arrow Poison', 10, 1, 'item_standard', 1),
('ammovarmint', 'Varmint Ammo', 10, 1, 'item_standard', 1),
('ammovarminttranq', 'Varmint Tranquilizer Ammo', 10, 1, 'item_standard', 1),
('ammoknives', 'Knives Ammo', 10, 1, 'item_standard', 1),
('ammotomahawk', 'Tonmahawk Ammo', 10, 1, 'item_standard', 1),
('ammopoisonbottle', 'Poison Bottle Ammo', 10, 1, 'item_standard', 1),
('ammobolla', 'Bolla Ammo', 10, 1, 'item_standard', 1),
('ammodynamite', 'Dynamite Ammo', 10, 1, 'item_standard', 1),
('ammovoldynamite', 'Volatile Dynamite Ammo', 10, 1, 'item_standard', 1),
('ammomolotov', 'Molotov Ammo', 10, 1, 'item_standard', 1),
('ammovolmolotov', 'Volatile Molotov Ammo', 10, 1, 'item_standard', 1);
