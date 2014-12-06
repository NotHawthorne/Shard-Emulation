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

/*Table structure for table `shard_class_info` */

DROP TABLE IF EXISTS `shard_class_info`;

CREATE TABLE `shard_class_info` (
  `id` int(11) NOT NULL,
  `name` varchar(22) NOT NULL,
  `skill1` int(11) NOT NULL,
  `skill2` int(11) NOT NULL,
  `req_gender` int(11) NOT NULL,
  `req_class` int(11) NOT NULL,
  `desc` varchar(255) NOT NULL DEFAULT '[No Description]',
  `icon_path` varchar(255) NOT NULL,
  `archetype` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `armor_class` varchar(255) NOT NULL,
  `item` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shard_class_info` */

insert  into `shard_class_info`(`id`,`name`,`skill1`,`skill2`,`req_gender`,`req_class`,`desc`,`icon_path`,`archetype`,`role`,`armor_class`,`item`) values (1,'Liturgist',789,0,0,6,'[No Description]','Interface/ICONS/Spell_Holy_BlessedResillience','Caster','Damage/Utility','Cloth',0),(2,'Elementalist',790,0,0,4,'[No Description]','','Caster','Damage/Utility','Cloth',0),(3,'Berserker',793,0,0,1,'[No Description]','','Melee','Burst Damage','Leather',0),(4,'Crusader',789,806,0,3,'[No Description]','','Melee','Damage/Utility','Chainmail',0),(5,'Raider',807,0,0,9,'[No Description]','','Melee','Damage (Burst)','Leather',0),(6,'Assassin',791,808,0,8,'[No Description]','','Melee','Damage (Burst)','Leather',0),(7,'Lancer',792,809,0,1,'[No Description]','','Melee','Tank/Damage','Platemail',0),(8,'Prelate',794,0,0,2,'[No Description]','','Caster','Healing','Cloth',0),(9,'Changeling',795,0,0,15,'[No Description]','','Hybrid','Damage/Utility','Leather',0),(10,'Amazon',810,796,1,9,'[No Description]','','Melee','Damage/Utility','Leather',0),(11,'Dragoon',810,0,0,1,'[No Description]','','Melee','Damage/Utility','Platemail',0),(12,'Ranger',797,0,0,9,'[No Description]','','Archer','Damage (Sustained)','Leather',0),(13,'Corsair',807,792,0,9,'[No Description]','','Melee','Tank (Evasion)','Leather',0),(14,'Witch Doctor',798,0,0,6,'[No Description]','','Caster','Healing/Debuffer','Cloth',0),(15,'Diabolist',799,0,0,4,'[No Description]','','Caster','Summoner','Cloth',0),(16,'Bard',800,0,0,12,'[No Description]','','Caster','Buffer','Leather',0),(17,'Guardian',792,0,0,1,'[No Description]','','Melee','Tank','Platemail',0),(18,'Blood Drinker',801,0,0,4,'[No Description]','','Caster','Damage/Healing','Cloth',0),(19,'Primalist',796,0,0,15,'[No Description]','','Hybrid','Damage/Utility','Leather',0),(20,'Disciple',794,0,0,2,'[No Description]','','Caster','Healing/Buffer','Cloth',0),(21,'Necromancer',802,0,0,4,'[No Description]','','Caster','Summoner','Cloth',0),(22,'Sentinel',792,811,0,1,'[No Description]','','Melee','Tank','Chainmail',0),(23,'Spellbreaker',803,811,0,9,'[No Description]','','Hybrid','Anti-Caster','Chainmail',0),(24,'Seer',790,0,0,4,'[No Description]','','Caster','Summoner','Leather',0),(25,'Scoundrel',791,793,0,8,'[No Description]','','Melee','Damage/Utility','Leather',0),(26,'Wizard',804,0,0,4,'[No Description]','','Caster','Burst Damage','Cloth',0),(27,'Pugilist',805,0,0,9,'[No Description]','','Melee','Sustained Damage','Leather',0);

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

/*Data for the table `shard_spell_table` */

insert  into `shard_spell_table`(`SpellID`,`SkillID`,`Type`,`Comment`,`Data1`,`Data2`,`Data3`,`Data4`,`Data5`,`EffectMult`,`BaseCooldown`,`CooldownMult`,`ExEffect1`,`ExEffect2`,`ExEffect3`,`ExDuration1`,`ExDuration2`,`ExDuration3`) values (34346,789,1,'Censure',15,17,1,NULL,NULL,2,10000,50,NULL,NULL,NULL,NULL,NULL,NULL),(62872,789,1,'Brilliance',7,9,1,NULL,NULL,1,5000,0,31292,NULL,NULL,5000,NULL,NULL),(9484,789,5,'Sacred Bonds',NULL,NULL,NULL,NULL,NULL,NULL,10000,50,11444,NULL,NULL,5000,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
