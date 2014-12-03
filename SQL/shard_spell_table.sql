/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.6.21-log : Database - characters
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`characters` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `characters`;

/*Table structure for table `shard_spell_table` */

DROP TABLE IF EXISTS `shard_spell_table`;

CREATE TABLE `shard_spell_table` (
  `SpellID` int(11) DEFAULT NULL,
  `SkillID` int(11) DEFAULT NULL,
  `Type` int(11) DEFAULT NULL,
  `Comment` text,
  `Data1` int(11) DEFAULT NULL,
  `Data2` int(11) DEFAULT NULL,
  `Data3` int(11) DEFAULT NULL,
  `Data4` int(11) DEFAULT NULL,
  `Data5` int(11) DEFAULT NULL,
  `EffectMult` int(11) DEFAULT NULL,
  `BaseCooldown` int(11) DEFAULT NULL,
  `CooldownMult` int(11) DEFAULT NULL,
  `ExEffect1` int(11) DEFAULT NULL,
  `ExEffect2` int(11) DEFAULT NULL,
  `ExEffect3` int(11) DEFAULT NULL,
  `ExDuration1` int(11) DEFAULT NULL,
  `ExDuration2` int(11) DEFAULT NULL,
  `ExDuration3` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
