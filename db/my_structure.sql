CREATE DATABASE  IF NOT EXISTS `geocloud` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `geocloud`;
-- MySQL dump 10.13  Distrib 5.6.17, for osx10.6 (i386)
--
-- Host: localhost    Database: geocloud
-- ------------------------------------------------------
-- Server version	5.5.48

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `con_project_stasi`
--

DROP TABLE IF EXISTS `con_project_stasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `con_project_stasi` (
  `id` bigint(20) NOT NULL,
  `project` bigint(20) NOT NULL,
  `stasi` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `con_user_tablet`
--

DROP TABLE IF EXISTS `con_user_tablet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `con_user_tablet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `tabcode` text NOT NULL,
  `mytime` bigint(20) NOT NULL,
  `ys` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `line`
--

DROP TABLE IF EXISTS `line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line` (
  `id` bigint(20) NOT NULL,
  `p1` bigint(20) NOT NULL,
  `m1` bigint(20) NOT NULL,
  `p2` bigint(20) NOT NULL,
  `m2` bigint(20) NOT NULL,
  `project` bigint(20) NOT NULL,
  `line` linestring NOT NULL,
  `user` text NOT NULL,
  `mydate` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `metrisi`
--

DROP TABLE IF EXISTS `metrisi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metrisi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stasi` bigint(20) NOT NULL COMMENT 'id tis stasis, an i skopefsi afora stasi',
  `periodos` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `hZ` double NOT NULL,
  `vZ` double NOT NULL,
  `sD` double NOT NULL,
  `hD` double NOT NULL,
  `ys` float NOT NULL,
  `obtype` int(11) NOT NULL,
  `obid` bigint(20) NOT NULL,
  `sxolia` text NOT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `mydate` bigint(20) NOT NULL,
  `odefsi_use` tinyint(1) NOT NULL,
  `od_skop` tinyint(1) NOT NULL,
  `local_date` int(11) NOT NULL,
  `_t_tabId` int(11) NOT NULL,
  `computed` tinyint(1) NOT NULL,
  `drawn` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pairrequest`
--

DROP TABLE IF EXISTS `pairrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pairrequest` (
  `mytime` bigint(20) NOT NULL,
  `code` text NOT NULL,
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `periodos`
--

DROP TABLE IF EXISTS `periodos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periodos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stasi` bigint(20) NOT NULL,
  `stasi_0` bigint(20) NOT NULL,
  `stasi_0_angle` double NOT NULL,
  `project` bigint(20) NOT NULL,
  `user` text CHARACTER SET utf8 NOT NULL,
  `yo` float NOT NULL,
  `organo` bigint(20) NOT NULL,
  `mydate` bigint(20) NOT NULL,
  `sxolia` text CHARACTER SET utf8 NOT NULL,
  `_t_tabId` int(11) NOT NULL,
  `_t_id` int(11) NOT NULL,
  `data_staseis` text CHARACTER SET utf8 NOT NULL,
  `data` text CHARACTER SET utf8 NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `local_date` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100256 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `point`
--

DROP TABLE IF EXISTS `point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `point` (
  `id` bigint(20) NOT NULL,
  `point` point NOT NULL,
  `p` bigint(20) NOT NULL,
  `m` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `mydate` bigint(20) NOT NULL,
  `project` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` bigint(20) NOT NULL,
  `name` text NOT NULL,
  `user` text NOT NULL,
  `sxolia` text NOT NULL,
  `start_stasi` bigint(20) NOT NULL,
  `stasi_0` bigint(20) NOT NULL,
  `date` bigint(20) NOT NULL,
  `ergodotis` text NOT NULL,
  `params_system` int(11) NOT NULL COMMENT '0 tipota,1 local,2 egsa',
  `params_scale_factor` double NOT NULL DEFAULT '1',
  `drawing_scale` double NOT NULL COMMENT 'zoompan param',
  `drawing_x0` double NOT NULL COMMENT 'zoompan param',
  `drawing_y0` double NOT NULL COMMENT 'zoompan param',
  `lout_lkadroset` tinyint(1) NOT NULL COMMENT 'an iparxei to Layout',
  `lout_scale` double NOT NULL,
  `lout_visible` tinyint(1) NOT NULL COMMENT 'an einai visible',
  `lout_lp1x` double NOT NULL,
  `lout_lp1y` double NOT NULL,
  `lout_lp2x` double NOT NULL,
  `lout_lp2y` double NOT NULL,
  `layer_labels` tinyint(1) NOT NULL,
  `layer_taximetrika` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `staseis`
--

DROP TABLE IF EXISTS `staseis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staseis` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `type` int(11) NOT NULL COMMENT '0:added on field, 1:gps, 2:solved',
  `fixed` tinyint(1) NOT NULL,
  `shor` float NOT NULL,
  `sh` float NOT NULL,
  `sx` float NOT NULL,
  `sy` float NOT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `f` double NOT NULL,
  `l` double NOT NULL,
  `mydate` bigint(20) NOT NULL,
  `foto` text NOT NULL,
  `h_ort` float NOT NULL,
  `user` text NOT NULL,
  `sxolia` text NOT NULL,
  `h` float NOT NULL,
  `base_id` int(11) NOT NULL,
  `_t_project` int(11) NOT NULL,
  `_t_tabId` int(11) NOT NULL,
  `_t_id` int(11) NOT NULL COMMENT '_id sto tablet (local)',
  `_t_base` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `local_date` int(11) NOT NULL,
  `is_fixed` tinyint(1) NOT NULL,
  `is_solved` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10653 DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `_id` int(11) NOT NULL,
  `mail` text NOT NULL,
  `pass` text NOT NULL,
  `tablet` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-17 12:47:01
