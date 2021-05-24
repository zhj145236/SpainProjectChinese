-- MySQL dump 10.13  Distrib 5.6.44, for Win64 (x86_64)
--
-- Host: localhost    Database: xbyshop
-- ------------------------------------------------------
-- Server version	5.6.44-log

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
-- Table structure for table `ds_activity`
--

DROP TABLE IF EXISTS `ds_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_activity` (
  `activity_id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '活动自增ID',
  `activity_title` varchar(255) NOT NULL COMMENT '活动标题',
  `activity_type` enum('1','2') DEFAULT NULL COMMENT '活动类型 1:商品 2:抢购',
  `activity_banner` varchar(255) NOT NULL COMMENT '活动图片',
  `activity_banner_mobile` varchar(255) NOT NULL COMMENT '手机活动图片',
  `activity_style` varchar(255) NOT NULL DEFAULT 'default' COMMENT '活动页面样式',
  `activity_desc` varchar(1000) NOT NULL COMMENT '活动描述',
  `activity_startdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '活动开始时间',
  `activity_enddate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '活动结束时间',
  `activity_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '活动排序',
  `activity_state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '活动状态 0为关闭 1为开启',
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_activity`
--

LOCK TABLES `ds_activity` WRITE;
/*!40000 ALTER TABLE `ds_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_activitydetail`
--

DROP TABLE IF EXISTS `ds_activitydetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_activitydetail` (
  `activitydetail_id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '活动详情自增ID',
  `activity_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '活动ID',
  `item_id` int(11) NOT NULL COMMENT '商品或抢购的编号',
  `item_name` varchar(255) NOT NULL COMMENT '商品或抢购名称',
  `store_id` int(11) NOT NULL COMMENT '店铺ID',
  `store_name` varchar(255) NOT NULL COMMENT '店铺名称',
  `activitydetail_state` enum('0','1','2','3') NOT NULL DEFAULT '0' COMMENT '审核状态 0:(默认)待审核 1:通过 2:未通过 3:再次申请',
  `activitydetail_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '活动详情排序',
  PRIMARY KEY (`activitydetail_id`),
  KEY `activity_id` (`activity_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='活动详情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_activitydetail`
--

LOCK TABLES `ds_activitydetail` WRITE;
/*!40000 ALTER TABLE `ds_activitydetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_activitydetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_address`
--

DROP TABLE IF EXISTS `ds_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_address` (
  `address_id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '地址ID',
  `member_id` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `address_realname` varchar(50) NOT NULL COMMENT '会员姓名',
  `city_id` mediumint(9) NOT NULL DEFAULT '0' COMMENT '市级ID',
  `area_id` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '地区ID',
  `area_info` varchar(255) NOT NULL DEFAULT '' COMMENT '地区内容',
  `address_detail` varchar(255) NOT NULL COMMENT '详细地址',
  `address_tel_phone` varchar(20) DEFAULT NULL COMMENT '座机',
  `address_mob_phone` varchar(15) DEFAULT NULL COMMENT '手机',
  `address_is_default` enum('0','1') NOT NULL DEFAULT '0' COMMENT '1默认收货地址',
  `chain_id` int(11) DEFAULT '0' COMMENT '门店ID',
  `address_longitude` varchar(20) DEFAULT '' COMMENT '经度',
  `address_latitude` varchar(20) DEFAULT '' COMMENT '纬度',
  PRIMARY KEY (`address_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='买家地址信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_address`
--

LOCK TABLES `ds_address` WRITE;
/*!40000 ALTER TABLE `ds_address` DISABLE KEYS */;
INSERT INTO `ds_address` VALUES (1,3,'测试',36,37,'北京	北京市	东城区','测试地区','','13813813800','0',0,'116.604522','40.12757'),(2,3,'测试2',0,0,'','国外地址国外地址','','13800000130','1',0,'',''),(3,3,'测试3',0,0,'','国外地址的','','13800013800','0',0,'',''),(4,5,'wangyu',0,0,'','北京市北京区','','18000000000','0',0,'',''),(5,3,'测试6',0,0,'','测试国外地址',NULL,'13456597966','0',0,'',''),(6,3,'测试7',0,0,'','测试地址66',NULL,'13477788811','0',0,'',''),(7,6,'duomitxt',0,0,'','北京北京','','13000000000','0',0,'',''),(8,31,'jorge',0,0,'','jose mari 84','18096032304','18096032304','0',0,'','');
/*!40000 ALTER TABLE `ds_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_admin`
--

DROP TABLE IF EXISTS `ds_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_admin` (
  `admin_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员自增ID',
  `admin_name` varchar(20) NOT NULL COMMENT '管理员名称',
  `admin_password` varchar(32) NOT NULL DEFAULT '' COMMENT '管理员密码',
  `admin_login_time` int(10) NOT NULL DEFAULT '0' COMMENT '登录时间',
  `admin_login_num` int(11) NOT NULL DEFAULT '0' COMMENT '登录次数',
  `admin_is_super` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否超级管理员',
  `admin_gid` smallint(6) DEFAULT '0' COMMENT '权限组ID',
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_admin`
--

LOCK TABLES `ds_admin` WRITE;
/*!40000 ALTER TABLE `ds_admin` DISABLE KEYS */;
INSERT INTO `ds_admin` VALUES (1,'admin','0192023a7bbd73250516f069df18b500',1618215304,72,1,0);
/*!40000 ALTER TABLE `ds_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_adminlog`
--

DROP TABLE IF EXISTS `ds_adminlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_adminlog` (
  `adminlog_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员记录自增ID',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `admin_name` char(20) NOT NULL COMMENT '管理员名称',
  `adminlog_content` varchar(255) NOT NULL COMMENT '操作内容',
  `adminlog_time` int(10) unsigned DEFAULT NULL COMMENT '发生时间',
  `adminlog_ip` char(15) NOT NULL COMMENT '管理员操作IP',
  `adminlog_url` varchar(50) NOT NULL DEFAULT '' COMMENT 'controller/action',
  PRIMARY KEY (`adminlog_id`)
) ENGINE=MyISAM AUTO_INCREMENT=178 DEFAULT CHARSET=utf8 COMMENT='管理员操作日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_adminlog`
--

LOCK TABLES `ds_adminlog` WRITE;
/*!40000 ALTER TABLE `ds_adminlog` DISABLE KEYS */;
INSERT INTO `ds_adminlog` VALUES (1,1,'admin','编辑站点设置',1605514452,'14.120.77.49','Config&base'),(2,1,'admin','编辑站点设置',1605514525,'14.120.77.49','Config&base'),(3,1,'admin','编辑站点设置',1605514549,'14.120.77.49','Config&base'),(4,1,'admin','分销设置',1605609541,'14.120.79.121','Inviter&setting'),(5,1,'admin','禁用[ID:1]',1605609621,'14.120.79.121','Inviter&memberstate'),(6,1,'admin','编辑Facebook同步登录',1605689718,'14.120.79.121','Account&fb'),(7,1,'admin','编辑Twitter同步登录',1605689725,'14.120.79.121','Account&tw'),(8,1,'admin','编辑站点设置',1605837028,'14.120.79.110','Config&base'),(9,1,'admin','编辑站点设置',1605837111,'14.120.79.110','Config&base'),(10,1,'admin','编辑品牌排序[ID:10)',1605852617,'14.120.79.110','Banks&ajax'),(11,1,'admin','编辑品牌名称[测试10]',1605852618,'14.120.79.110','Banks&ajax'),(12,1,'admin','编辑品牌排序[ID:10)',1605852625,'14.120.79.110','Banks&ajax'),(13,1,'admin','编辑银行管理状态[ID:10)',1605858882,'14.120.79.110','Banks&ajax'),(14,1,'admin','编辑银行管理状态[ID:10)',1605858887,'14.120.79.110','Banks&ajax'),(15,1,'admin','添加银行管理[中国银行]',1605868693,'14.120.79.110','Banks&banks_add'),(16,1,'admin','删除银行管理[ID:11]',1605869034,'14.120.79.110','Banks&banks_del'),(17,1,'admin','添加银行管理[中国银行]',1605869055,'14.120.79.110','Banks&banks_add'),(18,1,'admin','编辑银行管理[中国银行]',1605869657,'14.120.79.110','Banks&banks_edit'),(19,1,'admin','编辑银行名称[工商银行]',1606095645,'14.120.79.50','Banks&ajax'),(20,1,'admin','编辑银行管理[工商银行]',1606095696,'14.120.79.50','Banks&banks_edit'),(21,1,'admin','编辑银行管理[工商银行]',1606096185,'14.120.79.50','Banks&banks_edit'),(22,1,'admin','编辑银行管理[工商银行]',1606096285,'14.120.79.50','Banks&banks_edit'),(23,1,'admin','编辑Facebook同步登录',1606103125,'14.120.79.50','Account&fb'),(24,1,'admin','编辑站点设置',1606361787,'14.120.79.163','Config&base'),(25,1,'admin','编辑IM设置',1606383295,'14.120.79.163','Config&im'),(26,1,'admin','修改充值单状态,充值单号:20112616542286475001',1606728886,'14.120.76.218','Predeposit&recharge_info'),(27,1,'admin','修改充值单状态,充值单号:20112616371451798001',1606728961,'14.120.76.218','Predeposit&recharge_info'),(28,1,'admin','修改充值单状态,充值单号:20113017485663035003',1606729922,'14.120.76.218','Predeposit&recharge_info'),(29,1,'admin','添加添加面额[100]',1606983271,'120.235.59.205','Voucher&priceadd'),(30,1,'admin','添加添加面额[200]',1606983325,'120.235.59.205','Voucher&priceadd'),(31,1,'admin','修改充值单状态,充值单号:20120517331539816003',1607160855,'125.94.27.207','Predeposit&recharge_info'),(32,1,'admin','修改充值单状态,充值单号:20120517351085829003',1607160954,'125.94.27.207','Predeposit&recharge_info'),(33,1,'admin','编辑站点设置',1607163622,'125.94.27.207','Config&base'),(34,1,'admin','编辑站点设置',1607163688,'125.94.27.207','Config&base'),(35,1,'admin','编辑站点设置',1607163733,'125.94.27.207','Config&base'),(36,1,'admin','编辑站点设置',1607308453,'14.120.77.98','Config&base'),(37,1,'admin','编辑站点设置',1607308531,'14.120.77.98','Config&base'),(38,1,'admin','更新可编辑模块[23]',1608545799,'14.120.79.49','EditablePage&model_add'),(39,1,'admin','更新可编辑模块[23]',1608545876,'14.120.79.49','EditablePage&model_del'),(40,1,'admin','更新可编辑模块[24]',1608545884,'14.120.79.49','EditablePage&model_add'),(41,1,'admin','更新可编辑模块[24]',1608545887,'14.120.79.49','EditablePage&model_del'),(42,1,'admin','更新可编辑模块[25]',1608545893,'14.120.79.49','EditablePage&model_add'),(43,1,'admin','添加H5装修[flex_4:h5首页]',1608546041,'14.120.79.49','EditablePage&page_add'),(44,1,'admin','更新可编辑模块[26]',1608546066,'14.120.79.49','EditablePage&model_add'),(45,1,'admin','更新可编辑模块[26]',1608546125,'14.120.79.49','EditablePage&model_image'),(46,1,'admin','编辑站点设置',1608599062,'14.120.79.49','Config&base'),(47,1,'admin','将订单改为已收款状态,订单编号:202012221742331142',1608708061,'14.120.76.183','Order&change_state'),(48,1,'admin','删除H5装修[ID:4:h5首页]',1608709751,'14.120.76.183','EditablePage&page_del'),(49,1,'admin','添加成功[首页分类精选背景图]',1608793528,'14.120.76.125','Appadv&ap_add'),(50,1,'admin','添加成功[首页分类精选背景图]',1608793646,'14.120.76.125','Appadv&appadv_add'),(51,1,'admin','编辑商品分类[荣耀]',1608803689,'14.120.76.125','Goodsclass&goods_class_edit'),(52,1,'admin','编辑站点设置',1609234707,'14.120.77.52','Config&base'),(53,1,'admin','编辑站点设置',1609234941,'14.120.77.52','Config&base'),(54,1,'admin','编辑站点设置',1609235323,'14.120.77.52','Config&base'),(55,1,'admin','编辑站点设置',1609316729,'172.69.33.82','Config&base'),(56,1,'admin','编辑站点设置',1609317246,'172.69.33.230','Config&base'),(57,1,'admin','取消了订单,订单编号:202012311414046880',1609395672,'108.162.215.121','Order&change_state'),(58,1,'admin','取消了订单,订单编号:202012221715276233',1609395677,'108.162.215.121','Order&change_state'),(59,1,'admin','取消了订单,订单编号:202012221557442281',1609395681,'108.162.215.121','Order&change_state'),(60,1,'admin','广告成功删除[1]',1609740837,'172.69.33.16','Adv&adv_del'),(61,1,'admin','编辑IM设置',1610768428,'172.68.143.149','Config&im'),(62,1,'admin','添加商品分类[汽车]',1612579604,'172.69.35.47','Goodsclass&goods_class_add'),(63,1,'admin','添加商品分类[脚垫]',1612579916,'172.69.34.32','Goodsclass&goods_class_add'),(64,1,'admin','编辑站点设置',1616596499,'172.69.33.107','Config&base'),(65,1,'admin','EditarConfigurar del sitio',1617188492,'172.69.35.161','Config&base'),(66,1,'admin','编辑分类导航，celular',1617646926,'108.162.210.128','Goodsclass&nav_edit'),(67,1,'admin','EliminarClasificación del producto[ID:325]',1617647082,'108.162.210.128','Goodsclass&goods_class_del'),(68,1,'admin','EliminarClasificación del producto[ID:328]',1617647086,'108.162.210.128','Goodsclass&goods_class_del'),(69,1,'admin','EliminarClasificación del producto[ID:329]',1617647091,'108.162.210.128','Goodsclass&goods_class_del'),(70,1,'admin','EliminarClasificación del producto[ID:330]',1617647095,'108.162.210.128','Goodsclass&goods_class_del'),(71,1,'admin','EliminarClasificación del producto[ID:332]',1617647100,'108.162.210.128','Goodsclass&goods_class_del'),(72,1,'admin','EliminarClasificación del producto[ID:333]',1617647104,'108.162.210.128','Goodsclass&goods_class_del'),(73,1,'admin','EliminarClasificación del producto[ID:333]',1617647105,'108.162.210.128','Goodsclass&goods_class_del'),(74,1,'admin','EliminarClasificación del producto[ID:335]',1617647108,'108.162.210.128','Goodsclass&goods_class_del'),(75,1,'admin','编辑分类导航，AccesorioFalló',1617647578,'108.162.212.199','Goodsclass&nav_edit'),(76,1,'admin','编辑分类导航，AccesorioFalló',1617647620,'162.158.79.59','Goodsclass&nav_edit'),(77,1,'admin','EliminarClasificación del producto[ID:75]',1617647675,'108.162.210.244','Goodsclass&goods_class_del'),(78,1,'admin','EliminarClasificación del producto[ID:76]',1617647680,'108.162.210.244','Goodsclass&goods_class_del'),(79,1,'admin','EliminarClasificación del producto[ID:324]',1617647706,'108.162.210.244','Goodsclass&goods_class_del'),(80,1,'admin','EliminarClasificación del producto[ID:324]',1617647707,'108.162.210.245','Goodsclass&goods_class_del'),(81,1,'admin','EliminarClasificación del producto[ID:298]',1617647714,'108.162.210.244','Goodsclass&goods_class_del'),(82,1,'admin','EliminarClasificación del producto[ID:298]',1617647715,'108.162.210.244','Goodsclass&goods_class_del'),(83,1,'admin','EliminarClasificación del producto[ID:295]',1617647719,'108.162.210.244','Goodsclass&goods_class_del'),(84,1,'admin','EliminarClasificación del producto[ID:288]',1617647724,'108.162.210.244','Goodsclass&goods_class_del'),(85,1,'admin','EliminarClasificación del producto[ID:288]',1617647725,'108.162.210.244','Goodsclass&goods_class_del'),(86,1,'admin','EliminarClasificación del producto[ID:287]',1617647730,'108.162.210.244','Goodsclass&goods_class_del'),(87,1,'admin','EliminarClasificación del producto[ID:285]',1617647734,'108.162.210.244','Goodsclass&goods_class_del'),(88,1,'admin','EliminarClasificación del producto[ID:77]',1617647959,'162.158.79.59','Goodsclass&goods_class_del'),(89,1,'admin','EliminarClasificación del producto[ID:77]',1617647960,'172.69.170.152','Goodsclass&goods_class_del'),(90,1,'admin','EliminarClasificación del producto[ID:78]',1617647963,'172.69.170.152','Goodsclass&goods_class_del'),(91,1,'admin','EliminarClasificación del producto[ID:79]',1617647967,'172.69.170.152','Goodsclass&goods_class_del'),(92,1,'admin','EliminarClasificación del producto[ID:282]',1617647972,'172.69.170.152','Goodsclass&goods_class_del'),(93,1,'admin','EliminarClasificación del producto[ID:284]',1617647976,'172.69.170.152','Goodsclass&goods_class_del'),(94,1,'admin','EliminarClasificación del producto[ID:70]',1617647986,'172.69.170.152','Goodsclass&goods_class_del'),(95,1,'admin','EliminarClasificación del producto[ID:72]',1617647990,'172.69.170.152','Goodsclass&goods_class_del'),(96,1,'admin','EliminarClasificación del producto[ID:73]',1617647993,'172.69.170.152','Goodsclass&goods_class_del'),(97,1,'admin','EliminarClasificación del producto[ID:74]',1617647998,'172.69.170.152','Goodsclass&goods_class_del'),(98,1,'admin','EliminarClasificación del producto[ID:74]',1617647999,'172.69.170.152','Goodsclass&goods_class_del'),(99,1,'admin','EliminarClasificación del producto[ID:71]',1617648003,'172.69.170.152','Goodsclass&goods_class_del'),(100,1,'admin','EliminarClasificación del producto[ID:291]',1617648007,'172.69.170.152','Goodsclass&goods_class_del'),(101,1,'admin','EliminarClasificación del producto[ID:293]',1617648011,'172.69.170.152','Goodsclass&goods_class_del'),(102,1,'admin','EliminarClasificación del producto[ID:296]',1617648014,'172.69.170.152','Goodsclass&goods_class_del'),(103,1,'admin','EliminarClasificación del producto[ID:297]',1617648018,'172.69.170.152','Goodsclass&goods_class_del'),(104,1,'admin','EliminarClasificación del producto[ID:299]',1617648021,'172.69.170.152','Goodsclass&goods_class_del'),(105,1,'admin','EliminarClasificación del producto[ID:80]',1617648036,'172.69.170.152','Goodsclass&goods_class_del'),(106,1,'admin','EliminarClasificación del producto[ID:81]',1617648040,'172.69.170.152','Goodsclass&goods_class_del'),(107,1,'admin','EliminarClasificación del producto[ID:81]',1617648040,'172.69.170.152','Goodsclass&goods_class_del'),(108,1,'admin','EliminarClasificación del producto[ID:82]',1617648043,'172.69.170.152','Goodsclass&goods_class_del'),(109,1,'admin','EliminarClasificación del producto[ID:83]',1617648047,'172.69.170.152','Goodsclass&goods_class_del'),(110,1,'admin','EliminarClasificación del producto[ID:84]',1617648051,'172.69.170.152','Goodsclass&goods_class_del'),(111,1,'admin','EliminarClasificación del producto[ID:302]',1617648056,'172.69.170.152','Goodsclass&goods_class_del'),(112,1,'admin','EliminarClasificación del producto[ID:304]',1617648059,'172.69.170.152','Goodsclass&goods_class_del'),(113,1,'admin','EliminarClasificación del producto[ID:305]',1617648064,'172.69.170.152','Goodsclass&goods_class_del'),(114,1,'admin','EliminarClasificación del producto[ID:307]',1617648071,'172.69.170.152','Goodsclass&goods_class_del'),(115,1,'admin','EliminarClasificación del producto[ID:309]',1617648075,'172.69.170.152','Goodsclass&goods_class_del'),(116,1,'admin','EliminarClasificación del producto[ID:310]',1617648079,'172.69.170.152','Goodsclass&goods_class_del'),(117,1,'admin','EliminarClasificación del producto[ID:313]',1617648083,'172.69.170.152','Goodsclass&goods_class_del'),(118,1,'admin','EliminarClasificación del producto[ID:314]',1617648086,'172.69.170.152','Goodsclass&goods_class_del'),(119,1,'admin','EliminarClasificación del producto[ID:316]',1617648090,'172.69.170.152','Goodsclass&goods_class_del'),(120,1,'admin','EliminarClasificación del producto[ID:317]',1617648094,'172.69.170.152','Goodsclass&goods_class_del'),(121,1,'admin','EliminarClasificación del producto[ID:319]',1617648098,'172.69.170.152','Goodsclass&goods_class_del'),(122,1,'admin','EliminarClasificación del producto[ID:85]',1617648112,'172.69.170.152','Goodsclass&goods_class_del'),(123,1,'admin','EliminarClasificación del producto[ID:86]',1617648118,'172.69.170.152','Goodsclass&goods_class_del'),(124,1,'admin','EliminarClasificación del producto[ID:87]',1617648124,'172.69.170.152','Goodsclass&goods_class_del'),(125,1,'admin','EliminarClasificación del producto[ID:88]',1617648128,'172.69.170.152','Goodsclass&goods_class_del'),(126,1,'admin','EliminarClasificación del producto[ID:89]',1617648132,'172.69.170.152','Goodsclass&goods_class_del'),(127,1,'admin','EliminarClasificación del producto[ID:468]',1617648155,'172.69.170.152','Goodsclass&goods_class_del'),(128,1,'admin','EliminarClasificación del producto[ID:8,9,10,11,12,15,16,764]',1617648172,'172.69.170.152','Goodsclass&goods_class_del'),(129,1,'admin','EliminarClasificación del producto[ID:8,9,10,11,12,15,16,764]',1617648173,'172.69.170.152','Goodsclass&goods_class_del'),(130,1,'admin','EliminarClasificación del producto[ID:4]',1617648179,'172.69.170.152','Goodsclass&goods_class_del'),(131,1,'admin','EliminarClasificación del producto[ID:338]',1617648213,'172.69.170.152','Goodsclass&goods_class_del'),(132,1,'admin','编辑分类导航，Accesorio',1617648258,'172.69.170.152','Goodsclass&nav_edit'),(133,1,'admin','AgregarClasificación del producto[Hogar]',1617648332,'172.69.170.152','Goodsclass&goods_class_add'),(134,1,'admin','AgregarClasificación del producto[Alfombra]',1617648415,'172.69.170.152','Goodsclass&goods_class_add'),(135,1,'admin','AgregarClasificación del producto[Organizador]',1617648435,'172.69.170.152','Goodsclass&goods_class_add'),(136,1,'admin','AgregarClasificación del producto[Sofa]',1617648450,'172.69.170.152','Goodsclass&goods_class_add'),(137,1,'admin','AgregarClasificación del producto[Papel Tapiz]',1617648503,'108.162.210.222','Goodsclass&goods_class_add'),(138,1,'admin','AgregarClasificación del producto[Espejo]',1617648549,'172.69.170.136','Goodsclass&goods_class_add'),(139,1,'admin','AgregarClasificación del producto[Belleza]',1617648803,'172.69.170.136','Goodsclass&goods_class_add'),(140,1,'admin','AgregarClasificación del producto[Brochas]',1617648817,'172.69.170.136','Goodsclass&goods_class_add'),(141,1,'admin','AgregarClasificación del producto[Maquillaje]',1617648886,'172.69.170.152','Goodsclass&goods_class_add'),(142,1,'admin','AgregarClasificación del producto[Otros]',1617648927,'172.69.170.152','Goodsclass&goods_class_add'),(143,1,'admin','AgregarClasificación del producto[Juguete]',1617648969,'172.69.170.132','Goodsclass&goods_class_add'),(144,1,'admin','EditarClasificación del producto[Accesorio]',1617648987,'172.69.170.132','Goodsclass&goods_class_edit'),(145,1,'admin','AgregarClasificación del producto[Termo]',1617649445,'172.69.170.152','Goodsclass&goods_class_add'),(146,1,'admin','编辑分类导航，Hogar',1617649534,'172.69.170.132','Goodsclass&nav_edit'),(147,1,'admin','编辑分类导航，Hogar',1617649561,'172.69.170.132','Goodsclass&nav_edit'),(148,1,'admin','编辑分类导航，Accesorio',1617649652,'108.162.212.43','Goodsclass&nav_edit'),(149,1,'admin','AgregarClasificación del producto[Area de Fiesta]',1617649891,'172.69.170.118','Goodsclass&goods_class_add'),(150,1,'admin','编辑分类导航，Decoracio',1617649931,'172.69.170.118','Goodsclass&nav_edit'),(151,1,'admin','编辑分类导航，DecoracioFalló',1617649941,'172.69.170.118','Goodsclass&nav_edit'),(152,1,'admin','AgregarClasificación del producto[Cumpleaños]',1617650029,'172.69.170.118','Goodsclass&goods_class_add'),(153,1,'admin','EditarConfigurar del sitio',1617650189,'108.162.210.244','Config&base'),(154,1,'admin','EditarConfigurar del sitio',1617650513,'172.69.170.136','Config&base'),(155,1,'admin','EditarConfigurar del sitio',1617650634,'172.69.170.132','Config&base'),(156,1,'admin','编辑分类导航，Decoración',1617651997,'172.69.170.118','Goodsclass&nav_edit'),(157,1,'admin','AgregarClasificación del producto[Globo]',1617652118,'172.69.170.118','Goodsclass&goods_class_add'),(158,1,'admin','AgregarClasificación del producto[Mujer]',1617652187,'172.69.170.118','Goodsclass&goods_class_add'),(159,1,'admin','AgregarClasificación del producto[Cartera]',1617652197,'172.69.170.118','Goodsclass&goods_class_add'),(160,1,'admin','AgregarClasificación del producto[Mochila]',1617652211,'172.69.170.119','Goodsclass&goods_class_add'),(161,1,'admin','AgregarClasificación del producto[Calcetines]',1617652224,'172.69.170.118','Goodsclass&goods_class_add'),(162,1,'admin','AgregarClasificación del producto[Cangurera]',1617652269,'172.69.170.118','Goodsclass&goods_class_add'),(163,1,'admin','AgregarClasificación del producto[Hombre]',1617652283,'172.69.170.118','Goodsclass&goods_class_add'),(164,1,'admin','AgregarClasificación del producto[Cangurera]',1617652297,'172.69.170.118','Goodsclass&goods_class_add'),(165,1,'admin','AgregarClasificación del producto[Calcetines]',1617652326,'172.69.170.118','Goodsclass&goods_class_add'),(166,1,'admin','EditarClasificación del producto[Hombre]',1617652409,'108.162.210.128','Goodsclass&goods_class_edit'),(167,1,'admin','编辑分类导航，HogarFalló',1617652484,'172.69.170.118','Goodsclass&nav_edit'),(168,1,'admin','AgregarGestión banco[Banreserva]',1617653132,'172.69.170.136','Banks&banks_add'),(169,1,'admin','AgregarGestión banco[Banco BHD]',1617653237,'172.69.170.132','Banks&banks_add'),(170,1,'admin','AgregarGestión banco[Banreservas]',1617653294,'172.69.170.118','Banks&banks_add'),(171,1,'admin','EliminarMarca[ID:10,9,8,7,6,5,4,3,2,1]',1617653552,'172.69.170.136','Brand&brand_del'),(172,1,'admin','EditarConfigurar del sitio',1617654671,'172.69.170.136','Config&base'),(173,1,'admin','AgregarClasificación del producto[Caja de Zapatos]',1617658925,'108.162.210.134','Goodsclass&goods_class_add'),(174,1,'admin','编辑分类导航，Hombre',1617658942,'108.162.210.134','Goodsclass&nav_edit'),(175,1,'admin','编辑分类导航，HombreFalló',1617658980,'108.162.210.134','Goodsclass&nav_edit'),(176,1,'admin','AgregarClasificación del producto[Cuidado de Cabello]',1617659038,'108.162.210.134','Goodsclass&goods_class_add'),(177,1,'admin','AgregarClasificación del producto[Cocina]',1617659156,'172.69.170.136','Goodsclass&goods_class_add');
/*!40000 ALTER TABLE `ds_adminlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_adv`
--

DROP TABLE IF EXISTS `ds_adv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_adv` (
  `adv_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告自增ID',
  `ap_id` mediumint(8) unsigned NOT NULL COMMENT '广告位ID',
  `adv_title` varchar(255) NOT NULL COMMENT '广告内容描述',
  `adv_link` varchar(255) NOT NULL COMMENT '广告链接地址',
  `adv_code` varchar(1000) DEFAULT NULL COMMENT '广告图片地址',
  `adv_startdate` int(10) DEFAULT NULL COMMENT '广告开始时间',
  `adv_enddate` int(10) DEFAULT NULL COMMENT '广告结束时间',
  `adv_sort` tinyint(3) unsigned DEFAULT '255' COMMENT '广告图片排序',
  `adv_enabled` tinyint(1) unsigned DEFAULT '1' COMMENT '广告是否有效',
  `adv_clicknum` int(10) unsigned DEFAULT '0' COMMENT '广告点击次数',
  `adv_bgcolor` varchar(50) DEFAULT NULL COMMENT '广告背景颜色',
  PRIMARY KEY (`adv_id`),
  KEY `ap_id` (`ap_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='广告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_adv`
--

LOCK TABLES `ds_adv` WRITE;
/*!40000 ALTER TABLE `ds_adv` DISABLE KEYS */;
INSERT INTO `ds_adv` VALUES (2,1,'首页轮播图2','','5a4341c011073.jpg',1199116800,1830268800,0,1,5,NULL),(3,2,'首页促销图-1','','5a4355443eaad.jpg',1199116800,1830268800,0,1,0,NULL),(4,2,'首页促销图-2','','5a43555f3590a.jpg',1199116800,1830268800,0,1,6,NULL),(5,2,'首页促销图-3','','5a43556e94bb6.jpg',1199116800,1830268800,0,1,7,NULL),(6,2,'首页促销图-4','','5a43557f91fb5.jpg',1199116800,1830268800,0,1,6,NULL),(7,2,'首页促销图-5','','5a43558d3d004.jpg',1199116800,1830268800,0,1,3,NULL),(8,2,'首页促销图-6','','5a4355999c09c.jpg',1199116800,1830268800,0,1,5,NULL),(9,2,'首页促销图-7','','5a4355a53c2d4.jpg',1199116800,1830268800,0,1,2,NULL),(10,2,'首页促销图-8','','5a4355b51b338.jpg',1199116800,1830268800,0,1,2,NULL),(11,3,'首页-楼层1底部广告','','5c07551df18ec.jpg',1514304000,1830268800,0,1,2,NULL),(12,4,'首页-楼层2底部广告','','5c07552da2194.jpg',1514304000,1830268800,0,1,1,NULL),(13,5,'首页-楼层3底部广告','','5c0755264e32d.jpg',1514304000,1830268800,0,1,1,NULL),(14,6,'首页-楼层4底部广告','','5c0755356c311.jpg',1514304000,1830268800,0,1,1,NULL),(15,7,'首页-楼层5底部广告','','5c07551683f36.jpg',1514304000,1830268800,0,1,0,NULL),(16,8,'首页-楼层1侧边广告','','5c07553eeca3a.jpg',1514304000,1830268800,0,1,1,NULL),(17,9,'首页-楼层2侧边广告','','5c07555395d8f.png',1514304000,1830268800,0,1,3,NULL),(18,10,'首页-楼层3侧边广告','','5c07553eeca3a.jpg',1514304000,1830268800,0,1,1,NULL),(19,11,'首页-楼层4侧边广告','','5c07555395d8f.png',1514304000,1830268800,0,1,1,NULL),(20,12,'首页-楼层5侧边广告','','5c07553eeca3a.jpg',1514304000,1830268800,0,1,1,NULL),(27,15,'分类','mall/product_first_categroy.html','5a4600c518da81.png',1514476800,1546012800,0,1,0,NULL),(28,15,'购物车','mall/cart_list.html','5a4600c518da82.png',1514476800,1546012800,0,1,0,NULL),(29,15,'我的商城','member/member.html','5a4600c518da83.png',1514476800,1546012800,0,1,0,NULL),(30,15,'每日签到','member/signin.html','5a4600c518da84.png',1514476800,1546012800,0,1,0,NULL),(31,15,'商城拼团','mall/pintuan_list.html','5a4600c518da85.png',1514476800,1546012800,0,1,0,NULL),(32,15,'积分兑换','mall/pointspro_list.html','5a4600c518da86.png',1514476800,1546012800,0,1,0,NULL),(33,15,'附近店铺','mall/store_nearby.html','5a4600c518da87.png',1514476800,1546012800,0,1,0,NULL),(34,15,'商城帮助','mall/article_class.html','5a4600c518da88.png',1514476800,1546012800,0,1,0,NULL),(35,21,'首页-顶部广告图1','','5d5f86eb3119b.jpg',1566489600,1974816000,0,1,2,'#db001c');
/*!40000 ALTER TABLE `ds_adv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_advposition`
--

DROP TABLE IF EXISTS `ds_advposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_advposition` (
  `ap_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告位置自增ID',
  `ap_name` varchar(100) NOT NULL COMMENT '广告位名称',
  `ap_intro` varchar(255) NOT NULL DEFAULT '' COMMENT '广告位简介',
  `ap_isuse` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '广告位是否启用：0不启用1启用',
  `ap_width` int(10) DEFAULT '0' COMMENT '广告位宽度',
  `ap_height` int(10) DEFAULT '0' COMMENT '广告位高度',
  PRIMARY KEY (`ap_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='广告位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_advposition`
--

LOCK TABLES `ds_advposition` WRITE;
/*!40000 ALTER TABLE `ds_advposition` DISABLE KEYS */;
INSERT INTO `ds_advposition` VALUES (1,'首页-轮播图','',1,1920,400),(2,'首页-促销图','',1,240,164),(3,'首页-楼层1底部广告','',1,1200,125),(4,'首页-楼层2底部广告','',1,1200,125),(5,'首页-楼层3底部广告','',1,1200,125),(6,'首页-楼层4底部广告','',1,1200,125),(7,'首页-楼层5底部广告','',1,1200,125),(8,'首页-楼层1侧边广告','',1,229,614),(9,'首页-楼层2侧边广告','',1,229,614),(10,'首页-楼层3侧边广告','',1,229,614),(11,'首页-楼层4侧边广告','',1,229,614),(12,'首页-楼层5侧边广告','',1,229,614),(13,'手机-首页-促销','',1,0,0),(14,'手机-首页-轮播图','',1,720,320),(15,'手机-首页-快捷导航','',1,80,80),(16,'闲置首页中部横栏广告','',1,1200,61),(17,'闲置首页中部短栏广告1','',1,290,100),(18,'闲置首页中部短栏广告2','',1,290,100),(19,'闲置首页中部短栏广告3','',1,290,100),(20,'闲置首页中部短栏广告4','',1,290,100),(21,'首页-顶部广告图','',1,1200,100);
/*!40000 ALTER TABLE `ds_advposition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_albumclass`
--

DROP TABLE IF EXISTS `ds_albumclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_albumclass` (
  `aclass_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册自增ID',
  `aclass_name` varchar(100) NOT NULL COMMENT '相册名称',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `aclass_des` varchar(255) NOT NULL COMMENT '相册描述',
  `aclass_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '相册排序',
  `aclass_cover` varchar(255) DEFAULT NULL COMMENT '相册封面',
  `aclass_uploadtime` int(10) unsigned NOT NULL COMMENT '图片上传时间',
  `aclass_isdefault` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为默认相册,1代表默认',
  PRIMARY KEY (`aclass_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='相册表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_albumclass`
--

LOCK TABLES `ds_albumclass` WRITE;
/*!40000 ALTER TABLE `ds_albumclass` DISABLE KEYS */;
INSERT INTO `ds_albumclass` VALUES (1,'默认相册',1,'',255,'',1506020826,1);
/*!40000 ALTER TABLE `ds_albumclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_albumpic`
--

DROP TABLE IF EXISTS `ds_albumpic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_albumpic` (
  `apic_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册图片自增ID',
  `apic_name` varchar(100) NOT NULL COMMENT '图片名称',
  `apic_tag` varchar(255) NOT NULL COMMENT '图片标签',
  `aclass_id` int(10) unsigned NOT NULL COMMENT '相册ID',
  `apic_cover` varchar(255) NOT NULL COMMENT '图片路径',
  `apic_size` int(10) unsigned NOT NULL COMMENT '图片大小',
  `apic_spec` varchar(100) NOT NULL COMMENT '图片规格',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `apic_uploadtime` int(10) unsigned NOT NULL COMMENT '图片上传时间',
  PRIMARY KEY (`apic_id`),
  KEY `aclass_id` (`aclass_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=211 DEFAULT CHARSET=utf8 COMMENT='相册图片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_albumpic`
--

LOCK TABLES `ds_albumpic` WRITE;
/*!40000 ALTER TABLE `ds_albumpic` DISABLE KEYS */;
INSERT INTO `ds_albumpic` VALUES (1,'1_2017092120144795113.jpg','',0,'1_2017092120144795113.jpg',0,'800x800',1,1505996087),(2,'1_2017092120244885492.jpg','',0,'1_2017092120244885492.jpg',0,'800x800',1,1505996688),(3,'1_2017092120312320763.jpg','',0,'1_2017092120312320763.jpg',0,'800x800',1,1505997083),(4,'1_2017092120345719915.jpg','',0,'1_2017092120345719915.jpg',0,'800x800',1,1505997297),(5,'1_2017092120365848023.jpg','',0,'1_2017092120365848023.jpg',0,'800x800',1,1505997418),(6,'1_2017092120382376796.jpg','',0,'1_2017092120382376796.jpg',0,'800x800',1,1505997503),(7,'1_2017092120445748551.jpg','',0,'1_2017092120445748551.jpg',0,'800x800',1,1505997897),(8,'1_2017092120480147477.jpg','',0,'1_2017092120480147477.jpg',0,'800x800',1,1505998081),(9,'1_2017092120493430154.jpg','',0,'1_2017092120493430154.jpg',0,'800x800',1,1505998174),(10,'1_2017092120564717575.jpg','',0,'1_2017092120564717575.jpg',0,'800x800',1,1505998607),(11,'1_2017092121050988491.jpg','',0,'1_2017092121050988491.jpg',0,'800x800',1,1505999109),(12,'1_2017092121142556524.jpg','',0,'1_2017092121142556524.jpg',0,'800x800',1,1505999665),(13,'1_2017092121225164684.jpg','',0,'1_2017092121225164684.jpg',0,'800x800',1,1506000171),(14,'1_2017092121260662503.jpg','',0,'1_2017092121260662503.jpg',0,'800x800',1,1506000366),(15,'1_2017092121492327671.jpg','',0,'1_2017092121492327671.jpg',0,'800x800',1,1506001763),(16,'1_2017092121542617701.jpg','',0,'1_2017092121542617701.jpg',0,'800x800',1,1506002066),(17,'1_2017092121564484910.jpg','',0,'1_2017092121564484910.jpg',0,'800x800',1,1506002204),(18,'1_2017092122005521920.jpg','',0,'1_2017092122005521920.jpg',0,'800x800',1,1506002455),(19,'1_2017092122035543274.jpg','',0,'1_2017092122035543274.jpg',0,'800x800',1,1506002635),(20,'1_2017092123585272874.jpg','',0,'1_2017092123585272874.jpg',0,'800x800',1,1506009532),(21,'1_2017092200403659812.jpg','',0,'1_2017092200403659812.jpg',0,'800x800',1,1506012036),(22,'1_2017092201034951336.jpg','',0,'1_2017092201034951336.jpg',0,'800x800',1,1506013429),(23,'1_2017092201084565859.jpg','',0,'1_2017092201084565859.jpg',0,'800x800',1,1506013725),(24,'1_2017092201381015306.jpg','',0,'1_2017092201381015306.jpg',0,'220x220',1,1506015490),(25,'1_2017092201461861948.jpg','',0,'1_2017092201461861948.jpg',0,'800x800',1,1506015978),(26,'1_2017092201523177266.jpg','',0,'1_2017092201523177266.jpg',0,'800x800',1,1506016351),(27,'1_2017092202022516767.jpg','',0,'1_2017092202022516767.jpg',0,'800x800',1,1506016945),(28,'1_2017092202082283957.jpg','',0,'1_2017092202082283957.jpg',0,'800x800',1,1506017302),(29,'1_2017092202112937358.jpg','',0,'1_2017092202112937358.jpg',0,'800x800',1,1506017489),(30,'1_2017092202162519571.jpg','',0,'1_2017092202162519571.jpg',0,'800x800',1,1506017785),(31,'1_2017092202215519250.jpg','',0,'1_2017092202215519250.jpg',0,'800x800',1,1506018115),(32,'1_2017092202310929808.jpg','',0,'1_2017092202310929808.jpg',0,'800x800',1,1506018669),(33,'1_2017092202323192694.jpg','',0,'1_2017092202323192694.jpg',0,'800x800',1,1506018751),(34,'1_2017092202350299027.jpg','',0,'1_2017092202350299027.jpg',0,'800x800',1,1506018902),(35,'1_2017092202382291274.jpg','',0,'1_2017092202382291274.jpg',0,'800x800',1,1506019102),(36,'1_2017092202443553519.jpg','',0,'1_2017092202443553519.jpg',0,'800x800',1,1506019475),(37,'1_2017092202461115940.jpg','',0,'1_2017092202461115940.jpg',0,'800x800',1,1506019571),(38,'1_2017092202492958131.jpg','',0,'1_2017092202492958131.jpg',0,'800x800',1,1506019769),(39,'1_2017092202514891485.jpg','',0,'1_2017092202514891485.jpg',0,'800x800',1,1506019908),(40,'1_2017092202553367071.jpg','',0,'1_2017092202553367071.jpg',0,'800x800',1,1506020133),(41,'1_2017092202585843151.jpg','',0,'1_2017092202585843151.jpg',0,'800x800',1,1506020338),(42,'1_2017092203045216863.jpg','',0,'1_2017092203045216863.jpg',0,'800x800',1,1506020692),(43,'1_2017092203062937149.jpg','',0,'1_2017092203062937149.jpg',0,'800x800',1,1506020789),(44,'1_2017092203072292427.jpg','',1,'1_2017092203072292427.jpg',131950,'800x800',1,1506020842),(45,'1_2017092203072777906.jpg','',1,'1_2017092203072777906.jpg',120853,'800x800',1,1506020847),(46,'1_2017092203083967214.jpg','',1,'1_2017092203083967214.jpg',0,'800x800',1,1506020919),(47,'1_2017092203123417256.jpg','',1,'1_2017092203123417256.jpg',0,'800x800',1,1506021154),(48,'1_2017092203151752294.jpg','',1,'1_2017092203151752294.jpg',0,'800x800',1,1506021317),(49,'1_2017092203175020843.jpg','',1,'1_2017092203175020843.jpg',0,'800x800',1,1506021470),(50,'1_2017092203201884569.jpg','',1,'1_2017092203201884569.jpg',0,'800x800',1,1506021618),(51,'1_2017092203242754461.jpg','',1,'1_2017092203242754461.jpg',0,'800x800',1,1506021867),(52,'1_2017092203261873185.jpg','',1,'1_2017092203261873185.jpg',0,'800x800',1,1506021978),(53,'1_2017092203275599920.jpg','',1,'1_2017092203275599920.jpg',0,'800x800',1,1506022075),(54,'1_2017092203294765362.jpg','',1,'1_2017092203294765362.jpg',0,'800x800',1,1506022187),(55,'1_2017092203321969628.jpg','',1,'1_2017092203321969628.jpg',0,'800x800',1,1506022339),(56,'1_2017092203335981358.jpg','',1,'1_2017092203335981358.jpg',0,'800x800',1,1506022439),(57,'1_2017092203371485168.jpg','',1,'1_2017092203371485168.jpg',0,'800x800',1,1506022634),(58,'1_2017092821352360295.jpg','',1,'1_2017092821352360295.jpg',0,'430x430',1,1506605723),(59,'1_2017092821383373641.jpg','',1,'1_2017092821383373641.jpg',0,'430x430',1,1506605913),(60,'1_2017092821403589442.jpg','',1,'1_2017092821403589442.jpg',0,'379x400',1,1506606035),(61,'1_2017092821431519588.jpg','',1,'1_2017092821431519588.jpg',0,'400x400',1,1506606195),(62,'1_2017092821510935694.jpg','',1,'1_2017092821510935694.jpg',0,'430x430',1,1506606669),(63,'1_2017092821530372212.jpg','',1,'1_2017092821530372212.jpg',0,'430x430',1,1506606783),(64,'1_2017092821544898610.jpg','',1,'1_2017092821544898610.jpg',0,'430x430',1,1506606888),(65,'1_2017092821585013652.jpg','',1,'1_2017092821585013652.jpg',0,'400x380',1,1506607130),(66,'1_2017092822032535526.jpg','',1,'1_2017092822032535526.jpg',0,'430x430',1,1506607405),(67,'1_2017092822050083427.jpg','',1,'1_2017092822050083427.jpg',0,'430x430',1,1506607500),(68,'1_2017092822064182226.jpg','',1,'1_2017092822064182226.jpg',0,'430x430',1,1506607601),(69,'1_2017092823485490716.jpg','',1,'1_2017092823485490716.jpg',0,'430x430',1,1506613734),(70,'1_2017092823501155931.jpg','',1,'1_2017092823501155931.jpg',0,'400x400',1,1506613811),(71,'1_2017092823531033711.jpg','',1,'1_2017092823531033711.jpg',0,'430x430',1,1506613990),(72,'1_2017092900001256656.jpg','',1,'1_2017092900001256656.jpg',0,'430x430',1,1506614412),(73,'1_2017092900022214210.jpg','',1,'1_2017092900022214210.jpg',0,'430x430',1,1506614542),(74,'1_2017092900033832502.jpg','',1,'1_2017092900033832502.jpg',0,'430x430',1,1506614618),(75,'1_2017092900052977159.jpg','',1,'1_2017092900052977159.jpg',0,'430x430',1,1506614729),(76,'1_2017092900064438234.jpg','',1,'1_2017092900064438234.jpg',0,'430x430',1,1506614804),(77,'1_2017092900081355788.jpg','',1,'1_2017092900081355788.jpg',0,'430x430',1,1506614893),(78,'1_2017092900095941942.jpg','',1,'1_2017092900095941942.jpg',0,'430x430',1,1506614999),(79,'1_2017092900115721538.jpg','',1,'1_2017092900115721538.jpg',0,'430x430',1,1506615117),(80,'1_2017092900132832208.jpg','',1,'1_2017092900132832208.jpg',0,'400x400',1,1506615208),(81,'1_2017092900144267524.jpg','',1,'1_2017092900144267524.jpg',0,'430x430',1,1506615282),(82,'1_2017092900175249561.jpg','',1,'1_2017092900175249561.jpg',0,'400x400',1,1506615472),(83,'1_2017092900220838539.jpg','',1,'1_2017092900220838539.jpg',0,'800x800',1,1506615728),(84,'1_2017092900242419538.jpg','',1,'1_2017092900242419538.jpg',0,'800x800',1,1506615864),(85,'1_2017092900261952044.jpg','',1,'1_2017092900261952044.jpg',0,'430x430',1,1506615979),(86,'1_2017092900363278117.jpg','',1,'1_2017092900363278117.jpg',0,'400x400',1,1506616592),(87,'1_2017092900412680293.jpg','',1,'1_2017092900412680293.jpg',0,'400x400',1,1506616886),(88,'1_2017092900450210134.jpg','',1,'1_2017092900450210134.jpg',0,'800x800',1,1506617102),(89,'1_2017092900501117171.jpg','',1,'1_2017092900501117171.jpg',0,'430x430',1,1506617411),(90,'1_2017092900544928056.jpg','',1,'1_2017092900544928056.jpg',0,'430x430',1,1506617689),(91,'1_2017092901044975398.jpg','',1,'1_2017092901044975398.jpg',0,'430x430',1,1506618290),(92,'1_2017092901063965472.jpg','',1,'1_2017092901063965472.jpg',0,'430x430',1,1506618399),(93,'1_2017092901082884641.jpg','',1,'1_2017092901082884641.jpg',0,'430x430',1,1506618508),(94,'1_2017092901111615092.jpg','',1,'1_2017092901111615092.jpg',0,'400x400',1,1506618676),(95,'1_2017092901182073726.jpg','',1,'1_2017092901182073726.jpg',0,'400x400',1,1506619100),(96,'1_2017092901201262580.jpg','',1,'1_2017092901201262580.jpg',0,'430x430',1,1506619212),(97,'1_2017092901242476412.jpg','',1,'1_2017092901242476412.jpg',0,'430x430',1,1506619464),(98,'1_2017092901271966752.jpg','',1,'1_2017092901271966752.jpg',0,'400x400',1,1506619639),(99,'1_2017092901284880537.jpg','',1,'1_2017092901284880537.jpg',0,'430x430',1,1506619728),(100,'1_2017092901314252467.jpg','',1,'1_2017092901314252467.jpg',0,'430x430',1,1506619902),(101,'1_2017092901331891773.jpg','',1,'1_2017092901331891773.jpg',0,'430x430',1,1506619998),(102,'1_2017092901395681652.jpg','',1,'1_2017092901395681652.jpg',0,'430x430',1,1506620396),(103,'1_2017092901414663050.jpg','',1,'1_2017092901414663050.jpg',0,'400x400',1,1506620506),(104,'1_2017092901444780977.jpg','',1,'1_2017092901444780977.jpg',0,'430x430',1,1506620687),(105,'1_2017092901470136191.jpg','',1,'1_2017092901470136191.jpg',0,'1200x1200',1,1506620821),(106,'1_2017092901492561069.jpg','',1,'1_2017092901492561069.jpg',0,'430x430',1,1506620965),(107,'1_2017092901531025952.jpg','',1,'1_2017092901531025952.jpg',0,'430x430',1,1506621190),(108,'1_2017092901561798176.jpg','',1,'1_2017092901561798176.jpg',0,'400x400',1,1506621377),(109,'1_2017092901584247144.jpg','',1,'1_2017092901584247144.jpg',0,'430x430',1,1506621522),(110,'1_2017092902070476170.jpg','',1,'1_2017092902070476170.jpg',0,'430x430',1,1506622024),(111,'1_2017092902123493954.jpg','',1,'1_2017092902123493954.jpg',0,'430x430',1,1506622354),(112,'1_2017092902135876412.jpg','',1,'1_2017092902135876412.jpg',0,'400x400',1,1506622438),(113,'1_2017092902182426089.jpg','',1,'1_2017092902182426089.jpg',0,'430x430',1,1506622704),(114,'1_2017092902201298747.jpg','',1,'1_2017092902201298747.jpg',0,'430x430',1,1506622812),(115,'1_2017092902341762945.jpg','',1,'1_2017092902341762945.jpg',0,'430x430',1,1506623657),(116,'1_2017092902405679397.jpg','',1,'1_2017092902405679397.jpg',0,'430x430',1,1506624056),(117,'1_2017092902485560056.jpg','',1,'1_2017092902485560056.jpg',0,'430x430',1,1506624535),(118,'1_2021032606051941216.png','',1,'1_2021032606051941216.png',93557,'800x800',1,1616709918),(119,'1_2021040604002646954.png','',1,'1_2021040604002646954.png',11810,'537x537',1,1617652825),(120,'1_2021040604005184976.png','',1,'1_2021040604005184976.png',8612,'500x500',1,1617652851),(121,'1_2021040604025042183.png','',1,'1_2021040604025042183.png',21301,'500x500',1,1617652970),(122,'1_2021040604031640855.png','',1,'1_2021040604031640855.png',8612,'500x500',1,1617652995),(123,'1_2021040604443022136.png','',1,'1_2021040604443022136.png',195361,'1024x651',1,1617655469),(124,'1_2021040604444918766.png','',1,'1_2021040604444918766.png',195361,'1024x651',1,1617655489),(125,'1_2021040605053674673.png','',1,'1_2021040605053674673.png',104693,'993x1024',1,1617656736),(126,'1_2021040605071135464.png','',1,'1_2021040605071135464.png',80915,'1024x1024',1,1617656830),(127,'1_2021040605091998482.png','',1,'1_2021040605091998482.png',86280,'1022x1024',1,1617656959),(128,'1_2021040605241516376.png','',1,'1_2021040605241516376.png',74163,'1024x1014',1,1617657855),(129,'1_2021040605271432570.png','',1,'1_2021040605271432570.png',213191,'1024x697',1,1617658033),(130,'1_2021040605380126814.png','',1,'1_2021040605380126814.png',51097,'825x1024',1,1617658681),(131,'1_2021040605381938815.png','',1,'1_2021040605381938815.png',118880,'768x1024',1,1617658698),(132,'1_2021040605530867977.png','',1,'1_2021040605530867977.png',74163,'1024x1014',1,1617659587),(133,'1_2021040605542320929.png','',1,'1_2021040605542320929.png',74163,'1024x1014',1,1617659662),(134,'1_2021040822481574622.png','',1,'1_2021040822481574622.png',219987,'1024x785',1,1617893295),(135,'1_2021040822485958357.png','',1,'1_2021040822485958357.png',219987,'1024x785',1,1617893339),(136,'1_2021040904460766897.png','',1,'1_2021040904460766897.png',54440,'869x1024',1,1617914766),(137,'1_2021040905412572593.png','',1,'1_2021040905412572593.png',54440,'869x1024',1,1617918085),(138,'1_2021040920552259843.png','',1,'1_2021040920552259843.png',244826,'991x1024',1,1617972922),(139,'1_2021040921173889786.png','',1,'1_2021040921173889786.png',109243,'1024x1024',1,1617974258),(140,'1_2021040921332596242.png','',1,'1_2021040921332596242.png',202377,'948x1024',1,1617975204),(141,'1_2021040921465271189.png','',1,'1_2021040921465271189.png',85463,'869x1024',1,1617976011),(142,'1_2021040922004293287.png','',1,'1_2021040922004293287.png',239264,'903x1024',1,1617976841),(143,'1_2021040922050523275.png','',1,'1_2021040922050523275.png',195584,'896x1024',1,1617977104),(144,'1_2021040922094456374.png','',1,'1_2021040922094456374.png',216401,'1024x992',1,1617977384),(145,'1_2021040922122255921.png','',1,'1_2021040922122255921.png',201545,'1024x1024',1,1617977542),(146,'1_2021040922250392074.png','',1,'1_2021040922250392074.png',93284,'894x1024',1,1617978303),(147,'1_2021040922291721264.png','',1,'1_2021040922291721264.png',137597,'1024x1018',1,1617978557),(148,'1_2021040922375871880.png','',1,'1_2021040922375871880.png',183947,'1024x1024',1,1617979077),(149,'1_2021040922444325202.png','',1,'1_2021040922444325202.png',151275,'867x1024',1,1617979483),(150,'1_2021040922475725571.png','',1,'1_2021040922475725571.png',157742,'1024x1024',1,1617979676),(151,'1_2021040922491147671.png','',1,'1_2021040922491147671.png',257243,'1024x1024',1,1617979751),(152,'1_2021040922561014870.png','',1,'1_2021040922561014870.png',257243,'1024x1024',1,1617980170),(153,'1_2021040923000421960.png','',1,'1_2021040923000421960.png',180541,'1024x1024',1,1617980404),(154,'1_2021041003201145253.png','',1,'1_2021041003201145253.png',51631,'1080x1050',1,1617996011),(155,'1_2021041003240910750.png','',1,'1_2021041003240910750.png',49600,'1072x1048',1,1617996248),(156,'1_2021041022523144032.png','',1,'1_2021041022523144032.png',230118,'1080x722',1,1618066351),(157,'1_2021041022571359920.png','',1,'1_2021041022571359920.png',204265,'1080x662',1,1618066633),(158,'1_2021041022591267048.png','',1,'1_2021041022591267048.png',204672,'1080x672',1,1618066752),(159,'1_2021041023003813230.png','',1,'1_2021041023003813230.png',189003,'1080x689',1,1618066838),(160,'1_2021041023284260124.png','',1,'1_2021041023284260124.png',67407,'1080x1072',1,1618068522),(161,'1_2021041023294781366.png','',1,'1_2021041023294781366.png',74417,'1078x1043',1,1618068587),(162,'1_2021041023295656316.png','',1,'1_2021041023295656316.png',93559,'1080x1041',1,1618068596),(163,'1_2021041023300744425.png','',1,'1_2021041023300744425.png',61913,'1080x1043',1,1618068606),(164,'1_2021041023302013477.png','',1,'1_2021041023302013477.png',83700,'1080x1032',1,1618068620),(165,'1_2021041023303165773.png','',1,'1_2021041023303165773.png',85123,'1080x1046',1,1618068631),(166,'1_2021041023330964382.png','',1,'1_2021041023330964382.png',67407,'1080x1072',1,1618068788),(167,'1_2021041023342223839.png','',1,'1_2021041023342223839.png',74417,'1078x1043',1,1618068862),(168,'1_2021041023343035640.png','',1,'1_2021041023343035640.png',93559,'1080x1041',1,1618068870),(169,'1_2021041023344263646.png','',1,'1_2021041023344263646.png',61913,'1080x1043',1,1618068881),(170,'1_2021041023345794166.png','',1,'1_2021041023345794166.png',85123,'1080x1046',1,1618068897),(171,'1_2021041023380076553.png','',1,'1_2021041023380076553.png',67407,'1080x1072',1,1618069079),(172,'1_2021041023391441489.png','',1,'1_2021041023391441489.png',83700,'1080x1032',1,1618069154),(173,'1_2021041023402351301.png','',1,'1_2021041023402351301.png',93559,'1080x1041',1,1618069223),(174,'1_2021041023403350697.png','',1,'1_2021041023403350697.png',85123,'1080x1046',1,1618069233),(175,'1_2021041023410032161.png','',1,'1_2021041023410032161.png',74417,'1078x1043',1,1618069260),(176,'1_2021041023434143389.png','',1,'1_2021041023434143389.png',93559,'1080x1041',1,1618069420),(177,'1_2021041023452059600.png','',1,'1_2021041023452059600.png',74417,'1078x1043',1,1618069520),(178,'1_2021041023453325768.png','',1,'1_2021041023453325768.png',61913,'1080x1043',1,1618069533),(179,'1_2021041023454826536.png','',1,'1_2021041023454826536.png',85123,'1080x1046',1,1618069548),(180,'1_2021041023455889511.png','',1,'1_2021041023455889511.png',83700,'1080x1032',1,1618069558),(181,'1_2021041023493328894.png','',1,'1_2021041023493328894.png',142553,'1080x1049',1,1618069772),(182,'1_2021041023514097137.png','',1,'1_2021041023514097137.png',142553,'1080x1049',1,1618069900),(183,'1_2021041023535398568.png','',1,'1_2021041023535398568.png',142553,'1080x1049',1,1618070032),(184,'1_2021041023570344950.png','',1,'1_2021041023570344950.png',142553,'1080x1049',1,1618070223),(185,'1_2021041023592150229.png','',1,'1_2021041023592150229.png',90147,'1080x1047',1,1618070361),(186,'1_2021041100021099343.png','',1,'1_2021041100021099343.png',90147,'1080x1047',1,1618070529),(187,'1_2021041100084181391.png','',1,'1_2021041100084181391.png',90147,'1080x1047',1,1618070920),(188,'1_2021041100114876270.png','',1,'1_2021041100114876270.png',90147,'1080x1047',1,1618071108),(189,'1_2021041101084085686.png','',1,'1_2021041101084085686.png',130851,'1080x1057',1,1618074519),(190,'1_2021041101131373447.png','',1,'1_2021041101131373447.png',83178,'1080x1039',1,1618074793),(191,'1_2021041101145153751.png','',1,'1_2021041101145153751.png',168508,'1073x1048',1,1618074891),(192,'1_2021041101170768564.png','',1,'1_2021041101170768564.png',139471,'1080x1018',1,1618075027),(193,'1_2021041101184532347.png','',1,'1_2021041101184532347.png',112780,'1080x1069',1,1618075125),(194,'1_2021041101202157818.png','',1,'1_2021041101202157818.png',155964,'1080x1054',1,1618075221),(195,'1_2021041101222135624.png','',1,'1_2021041101222135624.png',83474,'1080x1048',1,1618075341),(196,'1_2021041101241814050.png','',1,'1_2021041101241814050.png',137122,'1080x1062',1,1618075457),(197,'1_2021041101271760343.png','',1,'1_2021041101271760343.png',147832,'1080x1072',1,1618075637),(198,'1_2021041101290290240.png','',1,'1_2021041101290290240.png',128951,'1080x1036',1,1618075742),(199,'1_2021041101304958984.png','',1,'1_2021041101304958984.png',101353,'1080x1045',1,1618075849),(200,'1_2021041101340320467.png','',1,'1_2021041101340320467.png',144581,'1080x1185',1,1618076043),(201,'1_2021041103183829799.png','',1,'1_2021041103183829799.png',125449,'1080x1054',1,1618082318),(202,'1_2021041103221224650.png','',1,'1_2021041103221224650.png',108212,'1080x1054',1,1618082532),(203,'1_2021041103234468045.png','',1,'1_2021041103234468045.png',122691,'1080x1060',1,1618082624),(204,'1_2021041103361952435.png','',1,'1_2021041103361952435.png',146713,'1080x1056',1,1618083378),(205,'1_2021041103392210025.png','',1,'1_2021041103392210025.png',178184,'1080x1049',1,1618083561),(206,'1_2021041103424329236.png','',1,'1_2021041103424329236.png',107400,'1080x1059',1,1618083763),(207,'1_2021041103450534383.png','',1,'1_2021041103450534383.png',177892,'1080x1061',1,1618083904),(208,'1_2021041103473750367.png','',1,'1_2021041103473750367.png',59963,'1074x1047',1,1618084056),(209,'1_2021041104011460879.png','',1,'1_2021041104011460879.png',124292,'1080x1058',1,1618084873),(210,'1_2021041216051767808.png','',1,'1_2021041216051767808.png',769854,'922x782',1,1618214716);
/*!40000 ALTER TABLE `ds_albumpic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_appadv`
--

DROP TABLE IF EXISTS `ds_appadv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_appadv` (
  `adv_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'APP广告自增ID',
  `ap_id` mediumint(8) unsigned NOT NULL COMMENT 'APP广告位ID',
  `adv_title` varchar(255) NOT NULL COMMENT 'APP广告内容描述',
  `adv_type` varchar(255) DEFAULT NULL COMMENT 'APP广告类型,goods,store,article',
  `adv_typedate` varchar(255) DEFAULT NULL COMMENT 'APP广告类型对应的值,判断具体跳转内容',
  `adv_code` varchar(1000) DEFAULT NULL COMMENT 'APP广告图片地址',
  `adv_startdate` int(10) DEFAULT NULL COMMENT 'APP广告开始时间',
  `adv_enddate` int(10) DEFAULT NULL COMMENT 'APP广告结束时间',
  `adv_sort` int(10) unsigned DEFAULT '255' COMMENT 'APP广告图片排序',
  `adv_enabled` tinyint(1) unsigned DEFAULT '1' COMMENT 'APP广告是否有效',
  PRIMARY KEY (`adv_id`),
  KEY `ap_id` (`ap_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='APP广告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_appadv`
--

LOCK TABLES `ds_appadv` WRITE;
/*!40000 ALTER TABLE `ds_appadv` DISABLE KEYS */;
INSERT INTO `ds_appadv` VALUES (1,1,'首页轮播图',NULL,NULL,'5a460095839c8.jpg',1514476800,1599012800,255,0),(2,1,'首页轮播图',NULL,NULL,'5a4600a260e0f.jpg',1514476800,1599012800,255,0),(3,1,'首页轮播图',NULL,NULL,'5a4600c518da8.jpg',1514476800,1599012800,255,0),(4,2,'首页促销左(320X260)',NULL,NULL,'5a44c828b411b.jpg',1514476800,1599012800,255,1),(5,2,'首页促销右上(320X130)',NULL,NULL,'5a44c84ace6ca.jpg',1514476800,1599012800,255,1),(6,2,'首页促销右下(320X130)',NULL,NULL,'5a44c85ca3b46.jpg',1514476800,1599012800,255,1),(7,4,'首页横图广告1','store','1','5cb590f2ae5c6.gif',1555344000,1902412800,1,1),(8,4,'首页横图广告2','store','1','5cb5980bbac26.jpg',1555344000,1902412800,2,1),(9,4,'首页横图广告3','store','1','5cb59d7e78073.gif',1555344000,1902412800,255,1),(10,5,'首页分类精选背景图','goods','','5fe43e2e45dd7.jpg',1608739200,1640275200,255,0);
/*!40000 ALTER TABLE `ds_appadv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_appadvposition`
--

DROP TABLE IF EXISTS `ds_appadvposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_appadvposition` (
  `ap_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'APP广告位自增ID',
  `ap_name` varchar(100) NOT NULL COMMENT 'APP广告位名称',
  `ap_intro` varchar(255) NOT NULL DEFAULT '' COMMENT 'APP广告位简介',
  `ap_isuse` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'APP广告位是否启用：0不启用1启用',
  `ap_width` int(10) DEFAULT '0' COMMENT 'APP广告位宽度',
  `ap_height` int(10) DEFAULT '0' COMMENT 'APP广告位高度',
  PRIMARY KEY (`ap_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='APP广告位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_appadvposition`
--

LOCK TABLES `ds_appadvposition` WRITE;
/*!40000 ALTER TABLE `ds_appadvposition` DISABLE KEYS */;
INSERT INTO `ds_appadvposition` VALUES (1,'首页轮播图','首页轮播图',1,720,350),(2,'首页促销','首页促销',1,375,160),(3,'首页导航图','',1,60,60),(4,'首页横图广告','',1,375,115),(5,'首页分类精选背景图','',1,1200,469);
/*!40000 ALTER TABLE `ds_appadvposition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_area`
--

DROP TABLE IF EXISTS `ds_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_area` (
  `area_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '地区自增ID',
  `area_name` varchar(50) NOT NULL COMMENT '地区名称',
  `area_parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '地区上级ID',
  `area_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '地区排序',
  `area_deep` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '地区深度',
  `area_region` varchar(3) DEFAULT NULL COMMENT '大区名称',
  PRIMARY KEY (`area_id`),
  KEY `area_parent_id` (`area_parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45056 DEFAULT CHARSET=utf8 COMMENT='地区表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_area`
--

LOCK TABLES `ds_area` WRITE;
/*!40000 ALTER TABLE `ds_area` DISABLE KEYS */;
INSERT INTO `ds_area` VALUES (1,'北京',0,0,1,'华北'),(2,'天津',0,0,1,'华北'),(3,'河北',0,0,1,'华北'),(4,'山西',0,0,1,'华北'),(5,'内蒙古',0,0,1,'华北'),(6,'辽宁',0,0,1,'东北'),(7,'吉林',0,0,1,'东北'),(8,'黑龙江',0,0,1,'东北'),(9,'上海',0,0,1,'华东'),(10,'江苏',0,0,1,'华东'),(11,'浙江',0,0,1,'华东'),(12,'安徽',0,0,1,'华东'),(13,'福建',0,0,1,'华南'),(14,'江西',0,0,1,'华东'),(15,'山东',0,0,1,'华东'),(16,'河南',0,0,1,'华中'),(17,'湖北',0,0,1,'华中'),(18,'湖南',0,0,1,'华中'),(19,'广东',0,0,1,'华南'),(20,'广西',0,0,1,'华南'),(21,'海南',0,0,1,'华南'),(22,'重庆',0,0,1,'西南'),(23,'四川',0,0,1,'西南'),(24,'贵州',0,0,1,'西南'),(25,'云南',0,0,1,'西南'),(26,'西藏',0,0,1,'西南'),(27,'陕西',0,0,1,'西北'),(28,'甘肃',0,0,1,'西北'),(29,'青海',0,0,1,'西北'),(30,'宁夏',0,0,1,'西北'),(31,'新疆',0,0,1,'西北'),(32,'台湾',0,0,1,'港澳台'),(33,'香港',0,0,1,'港澳台'),(34,'澳门',0,0,1,'港澳台'),(35,'海外',0,0,1,'海外'),(36,'北京市',1,0,2,''),(37,'东城区',36,0,3,NULL),(38,'西城区',36,0,3,NULL),(39,'上海市',9,0,2,NULL),(40,'天津市',2,0,2,NULL),(41,'朝阳区',36,0,3,NULL),(42,'丰台区',36,0,3,NULL),(43,'石景山区',36,0,3,NULL),(44,'海淀区',36,0,3,NULL),(45,'门头沟区',36,0,3,NULL),(46,'房山区',36,0,3,NULL),(47,'通州区',36,0,3,NULL),(48,'顺义区',36,0,3,NULL),(49,'昌平区',36,0,3,NULL),(50,'大兴区',36,0,3,NULL),(51,'怀柔区',36,0,3,NULL),(52,'平谷区',36,0,3,NULL),(53,'密云县',36,0,3,NULL),(54,'延庆县',36,0,3,NULL),(55,'和平区',40,0,3,NULL),(56,'河东区',40,0,3,NULL),(57,'河西区',40,0,3,NULL),(58,'南开区',40,0,3,NULL),(59,'河北区',40,0,3,NULL),(60,'红桥区',40,0,3,NULL),(61,'塘沽区',40,0,3,NULL),(62,'重庆市',22,0,2,NULL),(64,'东丽区',40,0,3,NULL),(65,'西青区',40,0,3,NULL),(66,'津南区',40,0,3,NULL),(67,'北辰区',40,0,3,NULL),(68,'武清区',40,0,3,NULL),(69,'宝坻区',40,0,3,NULL),(70,'宁河县',40,0,3,NULL),(71,'静海县',40,0,3,NULL),(72,'蓟县',40,0,3,NULL),(73,'石家庄市',3,0,2,NULL),(74,'唐山市',3,0,2,NULL),(75,'秦皇岛市',3,0,2,NULL),(76,'邯郸市',3,0,2,NULL),(77,'邢台市',3,0,2,NULL),(78,'保定市',3,0,2,NULL),(79,'张家口市',3,0,2,NULL),(80,'承德市',3,0,2,NULL),(81,'衡水市',3,0,2,NULL),(82,'廊坊市',3,0,2,NULL),(83,'沧州市',3,0,2,NULL),(84,'太原市',4,0,2,NULL),(85,'大同市',4,0,2,NULL),(86,'阳泉市',4,0,2,NULL),(87,'长治市',4,0,2,NULL),(88,'晋城市',4,0,2,NULL),(89,'朔州市',4,0,2,NULL),(90,'晋中市',4,0,2,NULL),(91,'运城市',4,0,2,NULL),(92,'忻州市',4,0,2,NULL),(93,'临汾市',4,0,2,NULL),(94,'吕梁市',4,0,2,NULL),(95,'呼和浩特市',5,0,2,NULL),(96,'包头市',5,0,2,NULL),(97,'乌海市',5,0,2,NULL),(98,'赤峰市',5,0,2,NULL),(99,'通辽市',5,0,2,NULL),(100,'鄂尔多斯市',5,0,2,NULL),(101,'呼伦贝尔市',5,0,2,NULL),(102,'巴彦淖尔市',5,0,2,NULL),(103,'乌兰察布市',5,0,2,NULL),(104,'兴安盟',5,0,2,NULL),(105,'锡林郭勒盟',5,0,2,NULL),(106,'阿拉善盟',5,0,2,NULL),(107,'沈阳市',6,0,2,NULL),(108,'大连市',6,0,2,NULL),(109,'鞍山市',6,0,2,NULL),(110,'抚顺市',6,0,2,NULL),(111,'本溪市',6,0,2,NULL),(112,'丹东市',6,0,2,NULL),(113,'锦州市',6,0,2,NULL),(114,'营口市',6,0,2,NULL),(115,'阜新市',6,0,2,NULL),(116,'辽阳市',6,0,2,NULL),(117,'盘锦市',6,0,2,NULL),(118,'铁岭市',6,0,2,NULL),(119,'朝阳市',6,0,2,NULL),(120,'葫芦岛市',6,0,2,NULL),(121,'长春市',7,0,2,NULL),(122,'吉林市',7,0,2,NULL),(123,'四平市',7,0,2,NULL),(124,'辽源市',7,0,2,NULL),(125,'通化市',7,0,2,NULL),(126,'白山市',7,0,2,NULL),(127,'松原市',7,0,2,NULL),(128,'白城市',7,0,2,NULL),(129,'延边朝鲜族自治州',7,0,2,NULL),(130,'哈尔滨市',8,0,2,NULL),(131,'齐齐哈尔市',8,0,2,NULL),(132,'鸡西市',8,0,2,NULL),(133,'鹤岗市',8,0,2,NULL),(134,'双鸭山市',8,0,2,NULL),(135,'大庆市',8,0,2,NULL),(136,'伊春市',8,0,2,NULL),(137,'佳木斯市',8,0,2,NULL),(138,'七台河市',8,0,2,NULL),(139,'牡丹江市',8,0,2,NULL),(140,'黑河市',8,0,2,NULL),(141,'绥化市',8,0,2,NULL),(142,'大兴安岭地区',8,0,2,NULL),(143,'黄浦区',39,0,3,NULL),(144,'卢湾区',39,0,3,NULL),(145,'徐汇区',39,0,3,NULL),(146,'长宁区',39,0,3,NULL),(147,'静安区',39,0,3,NULL),(148,'普陀区',39,0,3,NULL),(149,'闸北区',39,0,3,NULL),(150,'虹口区',39,0,3,NULL),(151,'杨浦区',39,0,3,NULL),(152,'闵行区',39,0,3,NULL),(153,'宝山区',39,0,3,NULL),(154,'嘉定区',39,0,3,NULL),(155,'浦东新区',39,0,3,NULL),(156,'金山区',39,0,3,NULL),(157,'松江区',39,0,3,NULL),(158,'青浦区',39,0,3,NULL),(159,'南汇区',39,0,3,NULL),(160,'奉贤区',39,0,3,NULL),(161,'崇明县',39,0,3,NULL),(162,'南京市',10,0,2,NULL),(163,'无锡市',10,0,2,NULL),(164,'徐州市',10,0,2,NULL),(165,'常州市',10,0,2,NULL),(166,'苏州市',10,0,2,NULL),(167,'南通市',10,0,2,NULL),(168,'连云港市',10,0,2,NULL),(169,'淮安市',10,0,2,NULL),(170,'盐城市',10,0,2,NULL),(171,'扬州市',10,0,2,NULL),(172,'镇江市',10,0,2,NULL),(173,'泰州市',10,0,2,NULL),(174,'宿迁市',10,0,2,NULL),(175,'杭州市',11,0,2,NULL),(176,'宁波市',11,0,2,NULL),(177,'温州市',11,0,2,NULL),(178,'嘉兴市',11,0,2,NULL),(179,'湖州市',11,0,2,NULL),(180,'绍兴市',11,0,2,NULL),(181,'舟山市',11,0,2,NULL),(182,'衢州市',11,0,2,NULL),(183,'金华市',11,0,2,NULL),(184,'台州市',11,0,2,NULL),(185,'丽水市',11,0,2,NULL),(186,'合肥市',12,0,2,NULL),(187,'芜湖市',12,0,2,NULL),(188,'蚌埠市',12,0,2,NULL),(189,'淮南市',12,0,2,NULL),(190,'马鞍山市',12,0,2,NULL),(191,'淮北市',12,0,2,NULL),(192,'铜陵市',12,0,2,NULL),(193,'安庆市',12,0,2,NULL),(194,'黄山市',12,0,2,NULL),(195,'滁州市',12,0,2,NULL),(196,'阜阳市',12,0,2,NULL),(197,'宿州市',12,0,2,NULL),(198,'巢湖市',12,0,2,NULL),(199,'六安市',12,0,2,NULL),(200,'亳州市',12,0,2,NULL),(201,'池州市',12,0,2,NULL),(202,'宣城市',12,0,2,NULL),(203,'福州市',13,0,2,NULL),(204,'厦门市',13,0,2,NULL),(205,'莆田市',13,0,2,NULL),(206,'三明市',13,0,2,NULL),(207,'泉州市',13,0,2,NULL),(208,'漳州市',13,0,2,NULL),(209,'南平市',13,0,2,NULL),(210,'龙岩市',13,0,2,NULL),(211,'宁德市',13,0,2,NULL),(212,'南昌市',14,0,2,NULL),(213,'景德镇市',14,0,2,NULL),(214,'萍乡市',14,0,2,NULL),(215,'九江市',14,0,2,NULL),(216,'新余市',14,0,2,NULL),(217,'鹰潭市',14,0,2,NULL),(218,'赣州市',14,0,2,NULL),(219,'吉安市',14,0,2,NULL),(220,'宜春市',14,0,2,NULL),(221,'抚州市',14,0,2,NULL),(222,'上饶市',14,0,2,NULL),(223,'济南市',15,0,2,NULL),(224,'青岛市',15,0,2,NULL),(225,'淄博市',15,0,2,NULL),(226,'枣庄市',15,0,2,NULL),(227,'东营市',15,0,2,NULL),(228,'烟台市',15,0,2,NULL),(229,'潍坊市',15,0,2,NULL),(230,'济宁市',15,0,2,NULL),(231,'泰安市',15,0,2,NULL),(232,'威海市',15,0,2,NULL),(233,'日照市',15,0,2,NULL),(234,'莱芜市',15,0,2,NULL),(235,'临沂市',15,0,2,NULL),(236,'德州市',15,0,2,NULL),(237,'聊城市',15,0,2,NULL),(238,'滨州市',15,0,2,NULL),(239,'菏泽市',15,0,2,NULL),(240,'郑州市',16,0,2,NULL),(241,'开封市',16,0,2,NULL),(242,'洛阳市',16,0,2,NULL),(243,'平顶山市',16,0,2,NULL),(244,'安阳市',16,0,2,NULL),(245,'鹤壁市',16,0,2,NULL),(246,'新乡市',16,0,2,NULL),(247,'焦作市',16,0,2,NULL),(248,'濮阳市',16,0,2,NULL),(249,'许昌市',16,0,2,NULL),(250,'漯河市',16,0,2,NULL),(251,'三门峡市',16,0,2,NULL),(252,'南阳市',16,0,2,NULL),(253,'商丘市',16,0,2,NULL),(254,'信阳市',16,0,2,NULL),(255,'周口市',16,0,2,NULL),(256,'驻马店市',16,0,2,NULL),(257,'济源市',16,0,2,NULL),(258,'武汉市',17,0,2,NULL),(259,'黄石市',17,0,2,NULL),(260,'十堰市',17,0,2,NULL),(261,'宜昌市',17,0,2,NULL),(262,'襄樊市',17,0,2,NULL),(263,'鄂州市',17,0,2,NULL),(264,'荆门市',17,0,2,NULL),(265,'孝感市',17,0,2,NULL),(266,'荆州市',17,0,2,NULL),(267,'黄冈市',17,0,2,NULL),(268,'咸宁市',17,0,2,NULL),(269,'随州市',17,0,2,NULL),(270,'恩施土家族苗族自治州',17,0,2,NULL),(271,'仙桃市',17,0,2,NULL),(272,'潜江市',17,0,2,NULL),(273,'天门市',17,0,2,NULL),(274,'神农架林区',17,0,2,NULL),(275,'长沙市',18,0,2,NULL),(276,'株洲市',18,0,2,NULL),(277,'湘潭市',18,0,2,NULL),(278,'衡阳市',18,0,2,NULL),(279,'邵阳市',18,0,2,NULL),(280,'岳阳市',18,0,2,NULL),(281,'常德市',18,0,2,NULL),(282,'张家界市',18,0,2,NULL),(283,'益阳市',18,0,2,NULL),(284,'郴州市',18,0,2,NULL),(285,'永州市',18,0,2,NULL),(286,'怀化市',18,0,2,NULL),(287,'娄底市',18,0,2,NULL),(288,'湘西土家族苗族自治州',18,0,2,NULL),(289,'广州市',19,0,2,NULL),(290,'韶关市',19,0,2,NULL),(291,'深圳市',19,0,2,NULL),(292,'珠海市',19,0,2,NULL),(293,'汕头市',19,0,2,NULL),(294,'佛山市',19,0,2,NULL),(295,'江门市',19,0,2,NULL),(296,'湛江市',19,0,2,NULL),(297,'茂名市',19,0,2,NULL),(298,'肇庆市',19,0,2,NULL),(299,'惠州市',19,0,2,NULL),(300,'梅州市',19,0,2,NULL),(301,'汕尾市',19,0,2,NULL),(302,'河源市',19,0,2,NULL),(303,'阳江市',19,0,2,NULL),(304,'清远市',19,0,2,NULL),(305,'东莞市',19,0,2,NULL),(306,'中山市',19,0,2,NULL),(307,'潮州市',19,0,2,NULL),(308,'揭阳市',19,0,2,NULL),(309,'云浮市',19,0,2,NULL),(310,'南宁市',20,0,2,NULL),(311,'柳州市',20,0,2,NULL),(312,'桂林市',20,0,2,NULL),(313,'梧州市',20,0,2,NULL),(314,'北海市',20,0,2,NULL),(315,'防城港市',20,0,2,NULL),(316,'钦州市',20,0,2,NULL),(317,'贵港市',20,0,2,NULL),(318,'玉林市',20,0,2,NULL),(319,'百色市',20,0,2,NULL),(320,'贺州市',20,0,2,NULL),(321,'河池市',20,0,2,NULL),(322,'来宾市',20,0,2,NULL),(323,'崇左市',20,0,2,NULL),(324,'海口市',21,0,2,NULL),(325,'三亚市',21,0,2,NULL),(326,'五指山市',21,0,2,NULL),(327,'琼海市',21,0,2,NULL),(328,'儋州市',21,0,2,NULL),(329,'文昌市',21,0,2,NULL),(330,'万宁市',21,0,2,NULL),(331,'东方市',21,0,2,NULL),(332,'定安县',21,0,2,NULL),(333,'屯昌县',21,0,2,NULL),(334,'澄迈县',21,0,2,NULL),(335,'临高县',21,0,2,NULL),(336,'白沙黎族自治县',21,0,2,NULL),(337,'昌江黎族自治县',21,0,2,NULL),(338,'乐东黎族自治县',21,0,2,NULL),(339,'陵水黎族自治县',21,0,2,NULL),(340,'保亭黎族苗族自治县',21,0,2,NULL),(341,'琼中黎族苗族自治县',21,0,2,NULL),(342,'西沙群岛',21,0,2,NULL),(343,'南沙群岛',21,0,2,NULL),(344,'中沙群岛的岛礁及其海域',21,0,2,NULL),(345,'万州区',62,0,3,NULL),(346,'涪陵区',62,0,3,NULL),(347,'渝中区',62,0,3,NULL),(348,'大渡口区',62,0,3,NULL),(349,'江北区',62,0,3,NULL),(350,'沙坪坝区',62,0,3,NULL),(351,'九龙坡区',62,0,3,NULL),(352,'南岸区',62,0,3,NULL),(353,'北碚区',62,0,3,NULL),(354,'双桥区',62,0,3,NULL),(355,'万盛区',62,0,3,NULL),(356,'渝北区',62,0,3,NULL),(357,'巴南区',62,0,3,NULL),(358,'黔江区',62,0,3,NULL),(359,'长寿区',62,0,3,NULL),(360,'綦江县',62,0,3,NULL),(361,'潼南县',62,0,3,NULL),(362,'铜梁县',62,0,3,NULL),(363,'大足县',62,0,3,NULL),(364,'荣昌县',62,0,3,NULL),(365,'璧山县',62,0,3,NULL),(366,'梁平县',62,0,3,NULL),(367,'城口县',62,0,3,NULL),(368,'丰都县',62,0,3,NULL),(369,'垫江县',62,0,3,NULL),(370,'武隆县',62,0,3,NULL),(371,'忠县',62,0,3,NULL),(372,'开县',62,0,3,NULL),(373,'云阳县',62,0,3,NULL),(374,'奉节县',62,0,3,NULL),(375,'巫山县',62,0,3,NULL),(376,'巫溪县',62,0,3,NULL),(377,'石柱土家族自治县',62,0,3,NULL),(378,'秀山土家族苗族自治县',62,0,3,NULL),(379,'酉阳土家族苗族自治县',62,0,3,NULL),(380,'彭水苗族土家族自治县',62,0,3,NULL),(381,'江津市',62,0,3,NULL),(382,'合川市',62,0,3,NULL),(383,'永川市',62,0,3,NULL),(384,'南川市',62,0,3,NULL),(385,'成都市',23,0,2,NULL),(386,'自贡市',23,0,2,NULL),(387,'攀枝花市',23,0,2,NULL),(388,'泸州市',23,0,2,NULL),(389,'德阳市',23,0,2,NULL),(390,'绵阳市',23,0,2,NULL),(391,'广元市',23,0,2,NULL),(392,'遂宁市',23,0,2,NULL),(393,'内江市',23,0,2,NULL),(394,'乐山市',23,0,2,NULL),(395,'南充市',23,0,2,NULL),(396,'眉山市',23,0,2,NULL),(397,'宜宾市',23,0,2,NULL),(398,'广安市',23,0,2,NULL),(399,'达州市',23,0,2,NULL),(400,'雅安市',23,0,2,NULL),(401,'巴中市',23,0,2,NULL),(402,'资阳市',23,0,2,NULL),(403,'阿坝藏族羌族自治州',23,0,2,NULL),(404,'甘孜藏族自治州',23,0,2,NULL),(405,'凉山彝族自治州',23,0,2,NULL),(406,'贵阳市',24,0,2,NULL),(407,'六盘水市',24,0,2,NULL),(408,'遵义市',24,0,2,NULL),(409,'安顺市',24,0,2,NULL),(410,'铜仁地区',24,0,2,NULL),(411,'黔西南布依族苗族自治州',24,0,2,NULL),(412,'毕节地区',24,0,2,NULL),(413,'黔东南苗族侗族自治州',24,0,2,NULL),(414,'黔南布依族苗族自治州',24,0,2,NULL),(415,'昆明市',25,0,2,NULL),(416,'曲靖市',25,0,2,NULL),(417,'玉溪市',25,0,2,NULL),(418,'保山市',25,0,2,NULL),(419,'昭通市',25,0,2,NULL),(420,'丽江市',25,0,2,NULL),(421,'思茅市',25,0,2,NULL),(422,'临沧市',25,0,2,NULL),(423,'楚雄彝族自治州',25,0,2,NULL),(424,'红河哈尼族彝族自治州',25,0,2,NULL),(425,'文山壮族苗族自治州',25,0,2,NULL),(426,'西双版纳傣族自治州',25,0,2,NULL),(427,'大理白族自治州',25,0,2,NULL),(428,'德宏傣族景颇族自治州',25,0,2,NULL),(429,'怒江傈僳族自治州',25,0,2,NULL),(430,'迪庆藏族自治州',25,0,2,NULL),(431,'拉萨市',26,0,2,NULL),(432,'昌都地区',26,0,2,NULL),(433,'山南地区',26,0,2,NULL),(434,'日喀则地区',26,0,2,NULL),(435,'那曲地区',26,0,2,NULL),(436,'阿里地区',26,0,2,NULL),(437,'林芝地区',26,0,2,NULL),(438,'西安市',27,0,2,NULL),(439,'铜川市',27,0,2,NULL),(440,'宝鸡市',27,0,2,NULL),(441,'咸阳市',27,0,2,NULL),(442,'渭南市',27,0,2,NULL),(443,'延安市',27,0,2,NULL),(444,'汉中市',27,0,2,NULL),(445,'榆林市',27,0,2,NULL),(446,'安康市',27,0,2,NULL),(447,'商洛市',27,0,2,NULL),(448,'兰州市',28,0,2,NULL),(449,'嘉峪关市',28,0,2,NULL),(450,'金昌市',28,0,2,NULL),(451,'白银市',28,0,2,NULL),(452,'天水市',28,0,2,NULL),(453,'武威市',28,0,2,NULL),(454,'张掖市',28,0,2,NULL),(455,'平凉市',28,0,2,NULL),(456,'酒泉市',28,0,2,NULL),(457,'庆阳市',28,0,2,NULL),(458,'定西市',28,0,2,NULL),(459,'陇南市',28,0,2,NULL),(460,'临夏回族自治州',28,0,2,NULL),(461,'甘南藏族自治州',28,0,2,NULL),(462,'西宁市',29,0,2,NULL),(463,'海东地区',29,0,2,NULL),(464,'海北藏族自治州',29,0,2,NULL),(465,'黄南藏族自治州',29,0,2,NULL),(466,'海南藏族自治州',29,0,2,NULL),(467,'果洛藏族自治州',29,0,2,NULL),(468,'玉树藏族自治州',29,0,2,NULL),(469,'海西蒙古族藏族自治州',29,0,2,NULL),(470,'银川市',30,0,2,NULL),(471,'石嘴山市',30,0,2,NULL),(472,'吴忠市',30,0,2,NULL),(473,'固原市',30,0,2,NULL),(474,'中卫市',30,0,2,NULL),(475,'乌鲁木齐市',31,0,2,NULL),(476,'克拉玛依市',31,0,2,NULL),(477,'吐鲁番地区',31,0,2,NULL),(478,'哈密地区',31,0,2,NULL),(479,'昌吉回族自治州',31,0,2,NULL),(480,'博尔塔拉蒙古自治州',31,0,2,NULL),(481,'巴音郭楞蒙古自治州',31,0,2,NULL),(482,'阿克苏地区',31,0,2,NULL),(483,'克孜勒苏柯尔克孜自治州',31,0,2,NULL),(484,'喀什地区',31,0,2,NULL),(485,'和田地区',31,0,2,NULL),(486,'伊犁哈萨克自治州',31,0,2,NULL),(487,'塔城地区',31,0,2,NULL),(488,'阿勒泰地区',31,0,2,NULL),(489,'石河子市',31,0,2,NULL),(490,'阿拉尔市',31,0,2,NULL),(491,'图木舒克市',31,0,2,NULL),(492,'五家渠市',31,0,2,NULL),(493,'台北市',32,0,2,NULL),(494,'高雄市',32,0,2,NULL),(495,'基隆市',32,0,2,NULL),(496,'台中市',32,0,2,NULL),(497,'台南市',32,0,2,NULL),(498,'新竹市',32,0,2,NULL),(499,'嘉义市',32,0,2,NULL),(500,'台北县',32,0,2,NULL),(501,'宜兰县',32,0,2,NULL),(502,'桃园县',32,0,2,NULL),(503,'新竹县',32,0,2,NULL),(504,'苗栗县',32,0,2,NULL),(505,'台中县',32,0,2,NULL),(506,'彰化县',32,0,2,NULL),(507,'南投县',32,0,2,NULL),(508,'云林县',32,0,2,NULL),(509,'嘉义县',32,0,2,NULL),(510,'台南县',32,0,2,NULL),(511,'高雄县',32,0,2,NULL),(512,'屏东县',32,0,2,NULL),(513,'澎湖县',32,0,2,NULL),(514,'台东县',32,0,2,NULL),(515,'花莲县',32,0,2,NULL),(516,'中西区',33,0,2,NULL),(517,'东区',33,0,2,NULL),(518,'九龙城区',33,0,2,NULL),(519,'观塘区',33,0,2,NULL),(520,'南区',33,0,2,NULL),(521,'深水埗区',33,0,2,NULL),(522,'黄大仙区',33,0,2,NULL),(523,'湾仔区',33,0,2,NULL),(524,'油尖旺区',33,0,2,NULL),(525,'离岛区',33,0,2,NULL),(526,'葵青区',33,0,2,NULL),(527,'北区',33,0,2,NULL),(528,'西贡区',33,0,2,NULL),(529,'沙田区',33,0,2,NULL),(530,'屯门区',33,0,2,NULL),(531,'大埔区',33,0,2,NULL),(532,'荃湾区',33,0,2,NULL),(533,'元朗区',33,0,2,NULL),(534,'澳门特别行政区',34,0,2,NULL),(535,'美国',45055,0,3,NULL),(536,'加拿大',45055,0,3,NULL),(537,'澳大利亚',45055,0,3,NULL),(538,'新西兰',45055,0,3,NULL),(539,'英国',45055,0,3,NULL),(540,'法国',45055,0,3,NULL),(541,'德国',45055,0,3,NULL),(542,'捷克',45055,0,3,NULL),(543,'荷兰',45055,0,3,NULL),(544,'瑞士',45055,0,3,NULL),(545,'希腊',45055,0,3,NULL),(546,'挪威',45055,0,3,NULL),(547,'瑞典',45055,0,3,NULL),(548,'丹麦',45055,0,3,NULL),(549,'芬兰',45055,0,3,NULL),(550,'爱尔兰',45055,0,3,NULL),(551,'奥地利',45055,0,3,NULL),(552,'意大利',45055,0,3,NULL),(553,'乌克兰',45055,0,3,NULL),(554,'俄罗斯',45055,0,3,NULL),(555,'西班牙',45055,0,3,NULL),(556,'韩国',45055,0,3,NULL),(557,'新加坡',45055,0,3,NULL),(558,'马来西亚',45055,0,3,NULL),(559,'印度',45055,0,3,NULL),(560,'泰国',45055,0,3,NULL),(561,'日本',45055,0,3,NULL),(562,'巴西',45055,0,3,NULL),(563,'阿根廷',45055,0,3,NULL),(564,'南非',45055,0,3,NULL),(565,'埃及',45055,0,3,NULL),(566,'其他',36,0,3,NULL),(1126,'井陉县',73,0,3,NULL),(1127,'井陉矿区',73,0,3,NULL),(1128,'元氏县',73,0,3,NULL),(1129,'平山县',73,0,3,NULL),(1130,'新乐市',73,0,3,NULL),(1131,'新华区',73,0,3,NULL),(1132,'无极县',73,0,3,NULL),(1133,'晋州市',73,0,3,NULL),(1134,'栾城县',73,0,3,NULL),(1135,'桥东区',73,0,3,NULL),(1136,'桥西区',73,0,3,NULL),(1137,'正定县',73,0,3,NULL),(1138,'深泽县',73,0,3,NULL),(1139,'灵寿县',73,0,3,NULL),(1140,'藁城市',73,0,3,NULL),(1141,'行唐县',73,0,3,NULL),(1142,'裕华区',73,0,3,NULL),(1143,'赞皇县',73,0,3,NULL),(1144,'赵县',73,0,3,NULL),(1145,'辛集市',73,0,3,NULL),(1146,'长安区',73,0,3,NULL),(1147,'高邑县',73,0,3,NULL),(1148,'鹿泉市',73,0,3,NULL),(1149,'丰南区',74,0,3,NULL),(1150,'丰润区',74,0,3,NULL),(1151,'乐亭县',74,0,3,NULL),(1152,'古冶区',74,0,3,NULL),(1153,'唐海县',74,0,3,NULL),(1154,'开平区',74,0,3,NULL),(1155,'滦南县',74,0,3,NULL),(1156,'滦县',74,0,3,NULL),(1157,'玉田县',74,0,3,NULL),(1158,'路北区',74,0,3,NULL),(1159,'路南区',74,0,3,NULL),(1160,'迁安市',74,0,3,NULL),(1161,'迁西县',74,0,3,NULL),(1162,'遵化市',74,0,3,NULL),(1163,'北戴河区',75,0,3,NULL),(1164,'卢龙县',75,0,3,NULL),(1165,'山海关区',75,0,3,NULL),(1166,'抚宁县',75,0,3,NULL),(1167,'昌黎县',75,0,3,NULL),(1168,'海港区',75,0,3,NULL),(1169,'青龙满族自治县',75,0,3,NULL),(1170,'丛台区',76,0,3,NULL),(1171,'临漳县',76,0,3,NULL),(1172,'复兴区',76,0,3,NULL),(1173,'大名县',76,0,3,NULL),(1174,'峰峰矿区',76,0,3,NULL),(1175,'广平县',76,0,3,NULL),(1176,'成安县',76,0,3,NULL),(1177,'曲周县',76,0,3,NULL),(1178,'武安市',76,0,3,NULL),(1179,'永年县',76,0,3,NULL),(1180,'涉县',76,0,3,NULL),(1181,'磁县',76,0,3,NULL),(1182,'肥乡县',76,0,3,NULL),(1183,'邯山区',76,0,3,NULL),(1184,'邯郸县',76,0,3,NULL),(1185,'邱县',76,0,3,NULL),(1186,'馆陶县',76,0,3,NULL),(1187,'魏县',76,0,3,NULL),(1188,'鸡泽县',76,0,3,NULL),(1189,'临城县',77,0,3,NULL),(1190,'临西县',77,0,3,NULL),(1191,'任县',77,0,3,NULL),(1192,'内丘县',77,0,3,NULL),(1193,'南和县',77,0,3,NULL),(1194,'南宫市',77,0,3,NULL),(1195,'威县',77,0,3,NULL),(1196,'宁晋县',77,0,3,NULL),(1197,'巨鹿县',77,0,3,NULL),(1198,'平乡县',77,0,3,NULL),(1199,'广宗县',77,0,3,NULL),(1200,'新河县',77,0,3,NULL),(1201,'柏乡县',77,0,3,NULL),(1202,'桥东区',77,0,3,NULL),(1203,'桥西区',77,0,3,NULL),(1204,'沙河市',77,0,3,NULL),(1205,'清河县',77,0,3,NULL),(1206,'邢台县',77,0,3,NULL),(1207,'隆尧县',77,0,3,NULL),(1208,'北市区',78,0,3,NULL),(1209,'南市区',78,0,3,NULL),(1210,'博野县',78,0,3,NULL),(1211,'唐县',78,0,3,NULL),(1212,'安国市',78,0,3,NULL),(1213,'安新县',78,0,3,NULL),(1214,'定兴县',78,0,3,NULL),(1215,'定州市',78,0,3,NULL),(1216,'容城县',78,0,3,NULL),(1217,'徐水县',78,0,3,NULL),(1218,'新市区',78,0,3,NULL),(1219,'易县',78,0,3,NULL),(1220,'曲阳县',78,0,3,NULL),(1221,'望都县',78,0,3,NULL),(1222,'涞水县',78,0,3,NULL),(1223,'涞源县',78,0,3,NULL),(1224,'涿州市',78,0,3,NULL),(1225,'清苑县',78,0,3,NULL),(1226,'满城县',78,0,3,NULL),(1227,'蠡县',78,0,3,NULL),(1228,'阜平县',78,0,3,NULL),(1229,'雄县',78,0,3,NULL),(1230,'顺平县',78,0,3,NULL),(1231,'高碑店市',78,0,3,NULL),(1232,'高阳县',78,0,3,NULL),(1233,'万全县',79,0,3,NULL),(1234,'下花园区',79,0,3,NULL),(1235,'宣化区',79,0,3,NULL),(1236,'宣化县',79,0,3,NULL),(1237,'尚义县',79,0,3,NULL),(1238,'崇礼县',79,0,3,NULL),(1239,'康保县',79,0,3,NULL),(1240,'张北县',79,0,3,NULL),(1241,'怀安县',79,0,3,NULL),(1242,'怀来县',79,0,3,NULL),(1243,'桥东区',79,0,3,NULL),(1244,'桥西区',79,0,3,NULL),(1245,'沽源县',79,0,3,NULL),(1246,'涿鹿县',79,0,3,NULL),(1247,'蔚县',79,0,3,NULL),(1248,'赤城县',79,0,3,NULL),(1249,'阳原县',79,0,3,NULL),(1250,'丰宁满族自治县',80,0,3,NULL),(1251,'兴隆县',80,0,3,NULL),(1252,'双桥区',80,0,3,NULL),(1253,'双滦区',80,0,3,NULL),(1254,'围场满族蒙古族自治县',80,0,3,NULL),(1255,'宽城满族自治县',80,0,3,NULL),(1256,'平泉县',80,0,3,NULL),(1257,'承德县',80,0,3,NULL),(1258,'滦平县',80,0,3,NULL),(1259,'隆化县',80,0,3,NULL),(1260,'鹰手营子矿区',80,0,3,NULL),(1261,'冀州市',81,0,3,NULL),(1262,'安平县',81,0,3,NULL),(1263,'故城县',81,0,3,NULL),(1264,'景县',81,0,3,NULL),(1265,'枣强县',81,0,3,NULL),(1266,'桃城区',81,0,3,NULL),(1267,'武强县',81,0,3,NULL),(1268,'武邑县',81,0,3,NULL),(1269,'深州市',81,0,3,NULL),(1270,'阜城县',81,0,3,NULL),(1271,'饶阳县',81,0,3,NULL),(1272,'三河市',82,0,3,NULL),(1273,'固安县',82,0,3,NULL),(1274,'大厂回族自治县',82,0,3,NULL),(1275,'大城县',82,0,3,NULL),(1276,'安次区',82,0,3,NULL),(1277,'广阳区',82,0,3,NULL),(1278,'文安县',82,0,3,NULL),(1279,'永清县',82,0,3,NULL),(1280,'霸州市',82,0,3,NULL),(1281,'香河县',82,0,3,NULL),(1282,'东光县',83,0,3,NULL),(1283,'任丘市',83,0,3,NULL),(1284,'南皮县',83,0,3,NULL),(1285,'吴桥县',83,0,3,NULL),(1286,'孟村回族自治县',83,0,3,NULL),(1287,'新华区',83,0,3,NULL),(1288,'沧县',83,0,3,NULL),(1289,'河间市',83,0,3,NULL),(1290,'泊头市',83,0,3,NULL),(1291,'海兴县',83,0,3,NULL),(1292,'献县',83,0,3,NULL),(1293,'盐山县',83,0,3,NULL),(1294,'肃宁县',83,0,3,NULL),(1295,'运河区',83,0,3,NULL),(1296,'青县',83,0,3,NULL),(1297,'黄骅市',83,0,3,NULL),(1298,'万柏林区',84,0,3,NULL),(1299,'古交市',84,0,3,NULL),(1300,'娄烦县',84,0,3,NULL),(1301,'小店区',84,0,3,NULL),(1302,'尖草坪区',84,0,3,NULL),(1303,'晋源区',84,0,3,NULL),(1304,'杏花岭区',84,0,3,NULL),(1305,'清徐县',84,0,3,NULL),(1306,'迎泽区',84,0,3,NULL),(1307,'阳曲县',84,0,3,NULL),(1308,'南郊区',85,0,3,NULL),(1309,'城区',85,0,3,NULL),(1310,'大同县',85,0,3,NULL),(1311,'天镇县',85,0,3,NULL),(1312,'左云县',85,0,3,NULL),(1313,'广灵县',85,0,3,NULL),(1314,'新荣区',85,0,3,NULL),(1315,'浑源县',85,0,3,NULL),(1316,'灵丘县',85,0,3,NULL),(1317,'矿区',85,0,3,NULL),(1318,'阳高县',85,0,3,NULL),(1319,'城区',86,0,3,NULL),(1320,'平定县',86,0,3,NULL),(1321,'盂县',86,0,3,NULL),(1322,'矿区',86,0,3,NULL),(1323,'郊区',86,0,3,NULL),(1324,'城区',87,0,3,NULL),(1325,'壶关县',87,0,3,NULL),(1326,'屯留县',87,0,3,NULL),(1327,'平顺县',87,0,3,NULL),(1328,'武乡县',87,0,3,NULL),(1329,'沁县',87,0,3,NULL),(1330,'沁源县',87,0,3,NULL),(1331,'潞城市',87,0,3,NULL),(1332,'襄垣县',87,0,3,NULL),(1333,'郊区',87,0,3,NULL),(1334,'长子县',87,0,3,NULL),(1335,'长治县',87,0,3,NULL),(1336,'黎城县',87,0,3,NULL),(1337,'城区',88,0,3,NULL),(1338,'沁水县',88,0,3,NULL),(1339,'泽州县',88,0,3,NULL),(1340,'阳城县',88,0,3,NULL),(1341,'陵川县',88,0,3,NULL),(1342,'高平市',88,0,3,NULL),(1343,'右玉县',89,0,3,NULL),(1344,'山阴县',89,0,3,NULL),(1345,'平鲁区',89,0,3,NULL),(1346,'应县',89,0,3,NULL),(1347,'怀仁县',89,0,3,NULL),(1348,'朔城区',89,0,3,NULL),(1349,'介休市',90,0,3,NULL),(1350,'和顺县',90,0,3,NULL),(1351,'太谷县',90,0,3,NULL),(1352,'寿阳县',90,0,3,NULL),(1353,'左权县',90,0,3,NULL),(1354,'平遥县',90,0,3,NULL),(1355,'昔阳县',90,0,3,NULL),(1356,'榆次区',90,0,3,NULL),(1357,'榆社县',90,0,3,NULL),(1358,'灵石县',90,0,3,NULL),(1359,'祁县',90,0,3,NULL),(1360,'万荣县',91,0,3,NULL),(1361,'临猗县',91,0,3,NULL),(1362,'垣曲县',91,0,3,NULL),(1363,'夏县',91,0,3,NULL),(1364,'平陆县',91,0,3,NULL),(1365,'新绛县',91,0,3,NULL),(1366,'永济市',91,0,3,NULL),(1367,'河津市',91,0,3,NULL),(1368,'盐湖区',91,0,3,NULL),(1369,'稷山县',91,0,3,NULL),(1370,'绛县',91,0,3,NULL),(1371,'芮城县',91,0,3,NULL),(1372,'闻喜县',91,0,3,NULL),(1373,'五台县',92,0,3,NULL),(1374,'五寨县',92,0,3,NULL),(1375,'代县',92,0,3,NULL),(1376,'保德县',92,0,3,NULL),(1377,'偏关县',92,0,3,NULL),(1378,'原平市',92,0,3,NULL),(1379,'宁武县',92,0,3,NULL),(1380,'定襄县',92,0,3,NULL),(1381,'岢岚县',92,0,3,NULL),(1382,'忻府区',92,0,3,NULL),(1383,'河曲县',92,0,3,NULL),(1384,'神池县',92,0,3,NULL),(1385,'繁峙县',92,0,3,NULL),(1386,'静乐县',92,0,3,NULL),(1387,'乡宁县',93,0,3,NULL),(1388,'侯马市',93,0,3,NULL),(1389,'古县',93,0,3,NULL),(1390,'吉县',93,0,3,NULL),(1391,'大宁县',93,0,3,NULL),(1392,'安泽县',93,0,3,NULL),(1393,'尧都区',93,0,3,NULL),(1394,'曲沃县',93,0,3,NULL),(1395,'永和县',93,0,3,NULL),(1396,'汾西县',93,0,3,NULL),(1397,'洪洞县',93,0,3,NULL),(1398,'浮山县',93,0,3,NULL),(1399,'翼城县',93,0,3,NULL),(1400,'蒲县',93,0,3,NULL),(1401,'襄汾县',93,0,3,NULL),(1402,'隰县',93,0,3,NULL),(1403,'霍州市',93,0,3,NULL),(1404,'中阳县',94,0,3,NULL),(1405,'临县',94,0,3,NULL),(1406,'交口县',94,0,3,NULL),(1407,'交城县',94,0,3,NULL),(1408,'兴县',94,0,3,NULL),(1409,'孝义市',94,0,3,NULL),(1410,'岚县',94,0,3,NULL),(1411,'文水县',94,0,3,NULL),(1412,'方山县',94,0,3,NULL),(1413,'柳林县',94,0,3,NULL),(1414,'汾阳市',94,0,3,NULL),(1415,'石楼县',94,0,3,NULL),(1416,'离石区',94,0,3,NULL),(1417,'和林格尔县',95,0,3,NULL),(1418,'回民区',95,0,3,NULL),(1419,'土默特左旗',95,0,3,NULL),(1420,'托克托县',95,0,3,NULL),(1421,'新城区',95,0,3,NULL),(1422,'武川县',95,0,3,NULL),(1423,'清水河县',95,0,3,NULL),(1424,'玉泉区',95,0,3,NULL),(1425,'赛罕区',95,0,3,NULL),(1426,'东河区',96,0,3,NULL),(1427,'九原区',96,0,3,NULL),(1428,'固阳县',96,0,3,NULL),(1429,'土默特右旗',96,0,3,NULL),(1430,'昆都仑区',96,0,3,NULL),(1431,'白云矿区',96,0,3,NULL),(1432,'石拐区',96,0,3,NULL),(1433,'达尔罕茂明安联合旗',96,0,3,NULL),(1434,'青山区',96,0,3,NULL),(1435,'乌达区',97,0,3,NULL),(1436,'海勃湾区',97,0,3,NULL),(1437,'海南区',97,0,3,NULL),(1438,'元宝山区',98,0,3,NULL),(1439,'克什克腾旗',98,0,3,NULL),(1440,'喀喇沁旗',98,0,3,NULL),(1441,'宁城县',98,0,3,NULL),(1442,'巴林右旗',98,0,3,NULL),(1443,'巴林左旗',98,0,3,NULL),(1444,'敖汉旗',98,0,3,NULL),(1445,'松山区',98,0,3,NULL),(1446,'林西县',98,0,3,NULL),(1447,'红山区',98,0,3,NULL),(1448,'翁牛特旗',98,0,3,NULL),(1449,'阿鲁科尔沁旗',98,0,3,NULL),(1450,'奈曼旗',99,0,3,NULL),(1451,'库伦旗',99,0,3,NULL),(1452,'开鲁县',99,0,3,NULL),(1453,'扎鲁特旗',99,0,3,NULL),(1454,'科尔沁区',99,0,3,NULL),(1455,'科尔沁左翼中旗',99,0,3,NULL),(1456,'科尔沁左翼后旗',99,0,3,NULL),(1457,'霍林郭勒市',99,0,3,NULL),(1458,'东胜区',100,0,3,NULL),(1459,'乌审旗',100,0,3,NULL),(1460,'伊金霍洛旗',100,0,3,NULL),(1461,'准格尔旗',100,0,3,NULL),(1462,'杭锦旗',100,0,3,NULL),(1463,'达拉特旗',100,0,3,NULL),(1464,'鄂东胜区',100,0,3,NULL),(1465,'鄂托克前旗',100,0,3,NULL),(1466,'鄂托克旗',100,0,3,NULL),(1467,'扎兰屯市',101,0,3,NULL),(1468,'新巴尔虎右旗',101,0,3,NULL),(1469,'新巴尔虎左旗',101,0,3,NULL),(1470,'根河市',101,0,3,NULL),(1471,'海拉尔区',101,0,3,NULL),(1472,'满洲里市',101,0,3,NULL),(1473,'牙克石市',101,0,3,NULL),(1474,'莫力达瓦达斡尔族自治旗',101,0,3,NULL),(1475,'鄂伦春自治旗',101,0,3,NULL),(1476,'鄂温克族自治旗',101,0,3,NULL),(1477,'阿荣旗',101,0,3,NULL),(1478,'陈巴尔虎旗',101,0,3,NULL),(1479,'额尔古纳市',101,0,3,NULL),(1480,'临河区',102,0,3,NULL),(1481,'乌拉特中旗',102,0,3,NULL),(1482,'乌拉特前旗',102,0,3,NULL),(1483,'乌拉特后旗',102,0,3,NULL),(1484,'五原县',102,0,3,NULL),(1485,'杭锦后旗',102,0,3,NULL),(1486,'磴口县',102,0,3,NULL),(1487,'丰镇市',103,0,3,NULL),(1488,'兴和县',103,0,3,NULL),(1489,'凉城县',103,0,3,NULL),(1490,'化德县',103,0,3,NULL),(1491,'卓资县',103,0,3,NULL),(1492,'商都县',103,0,3,NULL),(1493,'四子王旗',103,0,3,NULL),(1494,'察哈尔右翼中旗',103,0,3,NULL),(1495,'察哈尔右翼前旗',103,0,3,NULL),(1496,'察哈尔右翼后旗',103,0,3,NULL),(1497,'集宁区',103,0,3,NULL),(1498,'乌兰浩特市',104,0,3,NULL),(1499,'扎赉特旗',104,0,3,NULL),(1500,'科尔沁右翼中旗',104,0,3,NULL),(1501,'科尔沁右翼前旗',104,0,3,NULL),(1502,'突泉县',104,0,3,NULL),(1503,'阿尔山市',104,0,3,NULL),(1504,'东乌珠穆沁旗',105,0,3,NULL),(1505,'二连浩特市',105,0,3,NULL),(1506,'多伦县',105,0,3,NULL),(1507,'太仆寺旗',105,0,3,NULL),(1508,'正蓝旗',105,0,3,NULL),(1509,'正镶白旗',105,0,3,NULL),(1510,'苏尼特右旗',105,0,3,NULL),(1511,'苏尼特左旗',105,0,3,NULL),(1512,'西乌珠穆沁旗',105,0,3,NULL),(1513,'锡林浩特市',105,0,3,NULL),(1514,'镶黄旗',105,0,3,NULL),(1515,'阿巴嘎旗',105,0,3,NULL),(1516,'阿拉善右旗',106,0,3,NULL),(1517,'阿拉善左旗',106,0,3,NULL),(1518,'额济纳旗',106,0,3,NULL),(1519,'东陵区',107,0,3,NULL),(1520,'于洪区',107,0,3,NULL),(1521,'和平区',107,0,3,NULL),(1522,'大东区',107,0,3,NULL),(1523,'康平县',107,0,3,NULL),(1524,'新民市',107,0,3,NULL),(1525,'沈北新区',107,0,3,NULL),(1526,'沈河区',107,0,3,NULL),(1527,'法库县',107,0,3,NULL),(1528,'皇姑区',107,0,3,NULL),(1529,'苏家屯区',107,0,3,NULL),(1530,'辽中县',107,0,3,NULL),(1531,'铁西区',107,0,3,NULL),(1532,'中山区',108,0,3,NULL),(1533,'庄河市',108,0,3,NULL),(1534,'旅顺口区',108,0,3,NULL),(1535,'普兰店市',108,0,3,NULL),(1536,'沙河口区',108,0,3,NULL),(1537,'瓦房店市',108,0,3,NULL),(1538,'甘井子区',108,0,3,NULL),(1539,'西岗区',108,0,3,NULL),(1540,'金州区',108,0,3,NULL),(1541,'长海县',108,0,3,NULL),(1542,'千山区',109,0,3,NULL),(1543,'台安县',109,0,3,NULL),(1544,'岫岩满族自治县',109,0,3,NULL),(1545,'海城市',109,0,3,NULL),(1546,'立山区',109,0,3,NULL),(1547,'铁东区',109,0,3,NULL),(1548,'铁西区',109,0,3,NULL),(1549,'东洲区',110,0,3,NULL),(1550,'抚顺县',110,0,3,NULL),(1551,'新宾满族自治县',110,0,3,NULL),(1552,'新抚区',110,0,3,NULL),(1553,'望花区',110,0,3,NULL),(1554,'清原满族自治县',110,0,3,NULL),(1555,'顺城区',110,0,3,NULL),(1556,'南芬区',111,0,3,NULL),(1557,'平山区',111,0,3,NULL),(1558,'明山区',111,0,3,NULL),(1559,'本溪满族自治县',111,0,3,NULL),(1560,'桓仁满族自治县',111,0,3,NULL),(1561,'溪湖区',111,0,3,NULL),(1562,'东港市',112,0,3,NULL),(1563,'元宝区',112,0,3,NULL),(1564,'凤城市',112,0,3,NULL),(1565,'宽甸满族自治县',112,0,3,NULL),(1566,'振兴区',112,0,3,NULL),(1567,'振安区',112,0,3,NULL),(1568,'义县',113,0,3,NULL),(1569,'凌河区',113,0,3,NULL),(1570,'凌海市',113,0,3,NULL),(1571,'北镇市',113,0,3,NULL),(1572,'古塔区',113,0,3,NULL),(1573,'太和区',113,0,3,NULL),(1574,'黑山县',113,0,3,NULL),(1575,'大石桥市',114,0,3,NULL),(1576,'盖州市',114,0,3,NULL),(1577,'站前区',114,0,3,NULL),(1578,'老边区',114,0,3,NULL),(1579,'西市区',114,0,3,NULL),(1580,'鲅鱼圈区',114,0,3,NULL),(1581,'太平区',115,0,3,NULL),(1582,'彰武县',115,0,3,NULL),(1583,'新邱区',115,0,3,NULL),(1584,'海州区',115,0,3,NULL),(1585,'清河门区',115,0,3,NULL),(1586,'细河区',115,0,3,NULL),(1587,'蒙古族自治县',115,0,3,NULL),(1588,'太子河区',116,0,3,NULL),(1589,'宏伟区',116,0,3,NULL),(1590,'弓长岭区',116,0,3,NULL),(1591,'文圣区',116,0,3,NULL),(1592,'灯塔市',116,0,3,NULL),(1593,'白塔区',116,0,3,NULL),(1594,'辽阳县',116,0,3,NULL),(1595,'兴隆台区',117,0,3,NULL),(1596,'双台子区',117,0,3,NULL),(1597,'大洼县',117,0,3,NULL),(1598,'盘山县',117,0,3,NULL),(1599,'开原市',118,0,3,NULL),(1600,'昌图县',118,0,3,NULL),(1601,'清河区',118,0,3,NULL),(1602,'西丰县',118,0,3,NULL),(1603,'调兵山市',118,0,3,NULL),(1604,'铁岭县',118,0,3,NULL),(1605,'银州区',118,0,3,NULL),(1606,'凌源市',119,0,3,NULL),(1607,'北票市',119,0,3,NULL),(1608,'双塔区',119,0,3,NULL),(1609,'喀喇沁左翼蒙古族自治县',119,0,3,NULL),(1610,'建平县',119,0,3,NULL),(1611,'朝阳县',119,0,3,NULL),(1612,'龙城区',119,0,3,NULL),(1613,'兴城市',120,0,3,NULL),(1614,'南票区',120,0,3,NULL),(1615,'建昌县',120,0,3,NULL),(1616,'绥中县',120,0,3,NULL),(1617,'连山区',120,0,3,NULL),(1618,'龙港区',120,0,3,NULL),(1619,'九台市',121,0,3,NULL),(1620,'二道区',121,0,3,NULL),(1621,'农安县',121,0,3,NULL),(1622,'南关区',121,0,3,NULL),(1623,'双阳区',121,0,3,NULL),(1624,'宽城区',121,0,3,NULL),(1625,'德惠市',121,0,3,NULL),(1626,'朝阳区',121,0,3,NULL),(1627,'榆树市',121,0,3,NULL),(1628,'绿园区',121,0,3,NULL),(1629,'丰满区',122,0,3,NULL),(1630,'昌邑区',122,0,3,NULL),(1631,'桦甸市',122,0,3,NULL),(1632,'永吉县',122,0,3,NULL),(1633,'磐石市',122,0,3,NULL),(1634,'舒兰市',122,0,3,NULL),(1635,'船营区',122,0,3,NULL),(1636,'蛟河市',122,0,3,NULL),(1637,'龙潭区',122,0,3,NULL),(1638,'伊通满族自治县',123,0,3,NULL),(1639,'公主岭市',123,0,3,NULL),(1640,'双辽市',123,0,3,NULL),(1641,'梨树县',123,0,3,NULL),(1642,'铁东区',123,0,3,NULL),(1643,'铁西区',123,0,3,NULL),(1644,'东丰县',124,0,3,NULL),(1645,'东辽县',124,0,3,NULL),(1646,'西安区',124,0,3,NULL),(1647,'龙山区',124,0,3,NULL),(1648,'东昌区',125,0,3,NULL),(1649,'二道江区',125,0,3,NULL),(1650,'柳河县',125,0,3,NULL),(1651,'梅河口市',125,0,3,NULL),(1652,'辉南县',125,0,3,NULL),(1653,'通化县',125,0,3,NULL),(1654,'集安市',125,0,3,NULL),(1655,'临江市',126,0,3,NULL),(1656,'八道江区',126,0,3,NULL),(1657,'抚松县',126,0,3,NULL),(1658,'江源区',126,0,3,NULL),(1659,'长白朝鲜族自治县',126,0,3,NULL),(1660,'靖宇县',126,0,3,NULL),(1661,'干安县',127,0,3,NULL),(1662,'前郭尔罗斯蒙古族自治县',127,0,3,NULL),(1663,'宁江区',127,0,3,NULL),(1664,'扶余县',127,0,3,NULL),(1665,'长岭县',127,0,3,NULL),(1666,'大安市',128,0,3,NULL),(1667,'洮北区',128,0,3,NULL),(1668,'洮南市',128,0,3,NULL),(1669,'通榆县',128,0,3,NULL),(1670,'镇赉县',128,0,3,NULL),(1671,'和龙市',129,0,3,NULL),(1672,'图们市',129,0,3,NULL),(1673,'安图县',129,0,3,NULL),(1674,'延吉市',129,0,3,NULL),(1675,'敦化市',129,0,3,NULL),(1676,'汪清县',129,0,3,NULL),(1677,'珲春市',129,0,3,NULL),(1678,'龙井市',129,0,3,NULL),(1679,'五常市',130,0,3,NULL),(1680,'依兰县',130,0,3,NULL),(1681,'南岗区',130,0,3,NULL),(1682,'双城市',130,0,3,NULL),(1683,'呼兰区',130,0,3,NULL),(1684,'哈尔滨市道里区',130,0,3,NULL),(1685,'宾县',130,0,3,NULL),(1686,'尚志市',130,0,3,NULL),(1687,'巴彦县',130,0,3,NULL),(1688,'平房区',130,0,3,NULL),(1689,'延寿县',130,0,3,NULL),(1690,'方正县',130,0,3,NULL),(1691,'木兰县',130,0,3,NULL),(1692,'松北区',130,0,3,NULL),(1693,'通河县',130,0,3,NULL),(1694,'道外区',130,0,3,NULL),(1695,'阿城区',130,0,3,NULL),(1696,'香坊区',130,0,3,NULL),(1697,'依安县',131,0,3,NULL),(1698,'克东县',131,0,3,NULL),(1699,'克山县',131,0,3,NULL),(1700,'富拉尔基区',131,0,3,NULL),(1701,'富裕县',131,0,3,NULL),(1702,'建华区',131,0,3,NULL),(1703,'拜泉县',131,0,3,NULL),(1704,'昂昂溪区',131,0,3,NULL),(1705,'梅里斯达斡尔族区',131,0,3,NULL),(1706,'泰来县',131,0,3,NULL),(1707,'甘南县',131,0,3,NULL),(1708,'碾子山区',131,0,3,NULL),(1709,'讷河市',131,0,3,NULL),(1710,'铁锋区',131,0,3,NULL),(1711,'龙江县',131,0,3,NULL),(1712,'龙沙区',131,0,3,NULL),(1713,'城子河区',132,0,3,NULL),(1714,'密山市',132,0,3,NULL),(1715,'恒山区',132,0,3,NULL),(1716,'梨树区',132,0,3,NULL),(1717,'滴道区',132,0,3,NULL),(1718,'虎林市',132,0,3,NULL),(1719,'鸡东县',132,0,3,NULL),(1720,'鸡冠区',132,0,3,NULL),(1721,'麻山区',132,0,3,NULL),(1722,'东山区',133,0,3,NULL),(1723,'兴安区',133,0,3,NULL),(1724,'兴山区',133,0,3,NULL),(1725,'南山区',133,0,3,NULL),(1726,'向阳区',133,0,3,NULL),(1727,'工农区',133,0,3,NULL),(1728,'绥滨县',133,0,3,NULL),(1729,'萝北县',133,0,3,NULL),(1730,'友谊县',134,0,3,NULL),(1731,'四方台区',134,0,3,NULL),(1732,'宝山区',134,0,3,NULL),(1733,'宝清县',134,0,3,NULL),(1734,'尖山区',134,0,3,NULL),(1735,'岭东区',134,0,3,NULL),(1736,'集贤县',134,0,3,NULL),(1737,'饶河县',134,0,3,NULL),(1738,'大同区',135,0,3,NULL),(1739,'杜尔伯特蒙古族自治县',135,0,3,NULL),(1740,'林甸县',135,0,3,NULL),(1741,'红岗区',135,0,3,NULL),(1742,'肇州县',135,0,3,NULL),(1743,'肇源县',135,0,3,NULL),(1744,'胡路区',135,0,3,NULL),(1745,'萨尔图区',135,0,3,NULL),(1746,'龙凤区',135,0,3,NULL),(1747,'上甘岭区',136,0,3,NULL),(1748,'乌伊岭区',136,0,3,NULL),(1749,'乌马河区',136,0,3,NULL),(1750,'五营区',136,0,3,NULL),(1751,'伊春区',136,0,3,NULL),(1752,'南岔区',136,0,3,NULL),(1753,'友好区',136,0,3,NULL),(1754,'嘉荫县',136,0,3,NULL),(1755,'带岭区',136,0,3,NULL),(1756,'新青区',136,0,3,NULL),(1757,'汤旺河区',136,0,3,NULL),(1758,'红星区',136,0,3,NULL),(1759,'美溪区',136,0,3,NULL),(1760,'翠峦区',136,0,3,NULL),(1761,'西林区',136,0,3,NULL),(1762,'金山屯区',136,0,3,NULL),(1763,'铁力市',136,0,3,NULL),(1764,'东风区',137,0,3,NULL),(1765,'前进区',137,0,3,NULL),(1766,'同江市',137,0,3,NULL),(1767,'向阳区',137,0,3,NULL),(1768,'富锦市',137,0,3,NULL),(1769,'抚远县',137,0,3,NULL),(1770,'桦南县',137,0,3,NULL),(1771,'桦川县',137,0,3,NULL),(1772,'汤原县',137,0,3,NULL),(1773,'郊区',137,0,3,NULL),(1774,'勃利县',138,0,3,NULL),(1775,'新兴区',138,0,3,NULL),(1776,'桃山区',138,0,3,NULL),(1777,'茄子河区',138,0,3,NULL),(1778,'东宁县',139,0,3,NULL),(1779,'东安区',139,0,3,NULL),(1780,'宁安市',139,0,3,NULL),(1781,'林口县',139,0,3,NULL),(1782,'海林市',139,0,3,NULL),(1783,'爱民区',139,0,3,NULL),(1784,'穆棱市',139,0,3,NULL),(1785,'绥芬河市',139,0,3,NULL),(1786,'西安区',139,0,3,NULL),(1787,'阳明区',139,0,3,NULL),(1788,'五大连池市',140,0,3,NULL),(1789,'北安市',140,0,3,NULL),(1790,'嫩江县',140,0,3,NULL),(1791,'孙吴县',140,0,3,NULL),(1792,'爱辉区',140,0,3,NULL),(1793,'车逊克县',140,0,3,NULL),(1794,'逊克县',140,0,3,NULL),(1795,'兰西县',141,0,3,NULL),(1796,'安达市',141,0,3,NULL),(1797,'庆安县',141,0,3,NULL),(1798,'明水县',141,0,3,NULL),(1799,'望奎县',141,0,3,NULL),(1800,'海伦市',141,0,3,NULL),(1801,'绥化市北林区',141,0,3,NULL),(1802,'绥棱县',141,0,3,NULL),(1803,'肇东市',141,0,3,NULL),(1804,'青冈县',141,0,3,NULL),(1805,'呼玛县',142,0,3,NULL),(1806,'塔河县',142,0,3,NULL),(1807,'大兴安岭地区加格达奇区',142,0,3,NULL),(1808,'大兴安岭地区呼中区',142,0,3,NULL),(1809,'大兴安岭地区新林区',142,0,3,NULL),(1810,'大兴安岭地区松岭区',142,0,3,NULL),(1811,'漠河县',142,0,3,NULL),(2027,'下关区',162,0,3,NULL),(2028,'六合区',162,0,3,NULL),(2029,'建邺区',162,0,3,NULL),(2030,'栖霞区',162,0,3,NULL),(2031,'江宁区',162,0,3,NULL),(2032,'浦口区',162,0,3,NULL),(2033,'溧水县',162,0,3,NULL),(2034,'玄武区',162,0,3,NULL),(2035,'白下区',162,0,3,NULL),(2036,'秦淮区',162,0,3,NULL),(2037,'雨花台区',162,0,3,NULL),(2038,'高淳县',162,0,3,NULL),(2039,'鼓楼区',162,0,3,NULL),(2040,'北塘区',163,0,3,NULL),(2041,'南长区',163,0,3,NULL),(2042,'宜兴市',163,0,3,NULL),(2043,'崇安区',163,0,3,NULL),(2044,'惠山区',163,0,3,NULL),(2045,'江阴市',163,0,3,NULL),(2046,'滨湖区',163,0,3,NULL),(2047,'锡山区',163,0,3,NULL),(2048,'丰县',164,0,3,NULL),(2049,'九里区',164,0,3,NULL),(2050,'云龙区',164,0,3,NULL),(2051,'新沂市',164,0,3,NULL),(2052,'沛县',164,0,3,NULL),(2053,'泉山区',164,0,3,NULL),(2054,'睢宁县',164,0,3,NULL),(2055,'贾汪区',164,0,3,NULL),(2056,'邳州市',164,0,3,NULL),(2057,'铜山县',164,0,3,NULL),(2058,'鼓楼区',164,0,3,NULL),(2059,'天宁区',165,0,3,NULL),(2060,'戚墅堰区',165,0,3,NULL),(2061,'新北区',165,0,3,NULL),(2062,'武进区',165,0,3,NULL),(2063,'溧阳市',165,0,3,NULL),(2064,'金坛市',165,0,3,NULL),(2065,'钟楼区',165,0,3,NULL),(2066,'吴中区',166,0,3,NULL),(2067,'吴江市',166,0,3,NULL),(2068,'太仓市',166,0,3,NULL),(2069,'常熟市',166,0,3,NULL),(2070,'平江区',166,0,3,NULL),(2071,'张家港市',166,0,3,NULL),(2072,'昆山市',166,0,3,NULL),(2073,'沧浪区',166,0,3,NULL),(2074,'相城区',166,0,3,NULL),(2075,'苏州工业园区',166,0,3,NULL),(2076,'虎丘区',166,0,3,NULL),(2077,'金阊区',166,0,3,NULL),(2078,'启东市',167,0,3,NULL),(2079,'如东县',167,0,3,NULL),(2080,'如皋市',167,0,3,NULL),(2081,'崇川区',167,0,3,NULL),(2082,'海安县',167,0,3,NULL),(2083,'海门市',167,0,3,NULL),(2084,'港闸区',167,0,3,NULL),(2085,'通州市',167,0,3,NULL),(2086,'东海县',168,0,3,NULL),(2087,'新浦区',168,0,3,NULL),(2088,'海州区',168,0,3,NULL),(2089,'灌云县',168,0,3,NULL),(2090,'灌南县',168,0,3,NULL),(2091,'赣榆县',168,0,3,NULL),(2092,'连云区',168,0,3,NULL),(2093,'楚州区',169,0,3,NULL),(2094,'洪泽县',169,0,3,NULL),(2095,'涟水县',169,0,3,NULL),(2096,'淮阴区',169,0,3,NULL),(2097,'清河区',169,0,3,NULL),(2098,'清浦区',169,0,3,NULL),(2099,'盱眙县',169,0,3,NULL),(2100,'金湖县',169,0,3,NULL),(2101,'东台市',170,0,3,NULL),(2102,'亭湖区',170,0,3,NULL),(2103,'响水县',170,0,3,NULL),(2104,'大丰市',170,0,3,NULL),(2105,'射阳县',170,0,3,NULL),(2106,'建湖县',170,0,3,NULL),(2107,'滨海县',170,0,3,NULL),(2108,'盐都区',170,0,3,NULL),(2109,'阜宁县',170,0,3,NULL),(2110,'仪征市',171,0,3,NULL),(2111,'宝应县',171,0,3,NULL),(2112,'广陵区',171,0,3,NULL),(2113,'江都市',171,0,3,NULL),(2114,'维扬区',171,0,3,NULL),(2115,'邗江区',171,0,3,NULL),(2116,'高邮市',171,0,3,NULL),(2117,'丹徒区',172,0,3,NULL),(2118,'丹阳市',172,0,3,NULL),(2119,'京口区',172,0,3,NULL),(2120,'句容市',172,0,3,NULL),(2121,'扬中市',172,0,3,NULL),(2122,'润州区',172,0,3,NULL),(2123,'兴化市',173,0,3,NULL),(2124,'姜堰市',173,0,3,NULL),(2125,'泰兴市',173,0,3,NULL),(2126,'海陵区',173,0,3,NULL),(2127,'靖江市',173,0,3,NULL),(2128,'高港区',173,0,3,NULL),(2129,'宿城区',174,0,3,NULL),(2130,'宿豫区',174,0,3,NULL),(2131,'沭阳县',174,0,3,NULL),(2132,'泗洪县',174,0,3,NULL),(2133,'泗阳县',174,0,3,NULL),(2134,'上城区',175,0,3,NULL),(2135,'下城区',175,0,3,NULL),(2136,'临安市',175,0,3,NULL),(2137,'余杭区',175,0,3,NULL),(2138,'富阳市',175,0,3,NULL),(2139,'建德市',175,0,3,NULL),(2140,'拱墅区',175,0,3,NULL),(2141,'桐庐县',175,0,3,NULL),(2142,'江干区',175,0,3,NULL),(2143,'淳安县',175,0,3,NULL),(2144,'滨江区',175,0,3,NULL),(2145,'萧山区',175,0,3,NULL),(2146,'西湖区',175,0,3,NULL),(2147,'余姚市',176,0,3,NULL),(2148,'北仑区',176,0,3,NULL),(2149,'奉化市',176,0,3,NULL),(2150,'宁海县',176,0,3,NULL),(2151,'慈溪市',176,0,3,NULL),(2152,'江东区',176,0,3,NULL),(2153,'江北区',176,0,3,NULL),(2154,'海曙区',176,0,3,NULL),(2155,'象山县',176,0,3,NULL),(2156,'鄞州区',176,0,3,NULL),(2157,'镇海区',176,0,3,NULL),(2158,'乐清市',177,0,3,NULL),(2159,'平阳县',177,0,3,NULL),(2160,'文成县',177,0,3,NULL),(2161,'永嘉县',177,0,3,NULL),(2162,'泰顺县',177,0,3,NULL),(2163,'洞头县',177,0,3,NULL),(2164,'瑞安市',177,0,3,NULL),(2165,'瓯海区',177,0,3,NULL),(2166,'苍南县',177,0,3,NULL),(2167,'鹿城区',177,0,3,NULL),(2168,'龙湾区',177,0,3,NULL),(2169,'南湖区',178,0,3,NULL),(2170,'嘉善县',178,0,3,NULL),(2171,'平湖市',178,0,3,NULL),(2172,'桐乡市',178,0,3,NULL),(2173,'海宁市',178,0,3,NULL),(2174,'海盐县',178,0,3,NULL),(2175,'秀洲区',178,0,3,NULL),(2176,'南浔区',179,0,3,NULL),(2177,'吴兴区',179,0,3,NULL),(2178,'安吉县',179,0,3,NULL),(2179,'德清县',179,0,3,NULL),(2180,'长兴县',179,0,3,NULL),(2181,'上虞市',180,0,3,NULL),(2182,'嵊州市',180,0,3,NULL),(2183,'新昌县',180,0,3,NULL),(2184,'绍兴县',180,0,3,NULL),(2185,'诸暨市',180,0,3,NULL),(2186,'越城区',180,0,3,NULL),(2187,'定海区',181,0,3,NULL),(2188,'岱山县',181,0,3,NULL),(2189,'嵊泗县',181,0,3,NULL),(2190,'普陀区',181,0,3,NULL),(2191,'常山县',182,0,3,NULL),(2192,'开化县',182,0,3,NULL),(2193,'柯城区',182,0,3,NULL),(2194,'江山市',182,0,3,NULL),(2195,'衢江区',182,0,3,NULL),(2196,'龙游县',182,0,3,NULL),(2197,'东阳市',183,0,3,NULL),(2198,'义乌市',183,0,3,NULL),(2199,'兰溪市',183,0,3,NULL),(2200,'婺城区',183,0,3,NULL),(2201,'武义县',183,0,3,NULL),(2202,'永康市',183,0,3,NULL),(2203,'浦江县',183,0,3,NULL),(2204,'磐安县',183,0,3,NULL),(2205,'金东区',183,0,3,NULL),(2206,'三门县',184,0,3,NULL),(2207,'临海市',184,0,3,NULL),(2208,'仙居县',184,0,3,NULL),(2209,'天台县',184,0,3,NULL),(2210,'椒江区',184,0,3,NULL),(2211,'温岭市',184,0,3,NULL),(2212,'玉环县',184,0,3,NULL),(2213,'路桥区',184,0,3,NULL),(2214,'黄岩区',184,0,3,NULL),(2215,'云和县',185,0,3,NULL),(2216,'庆元县',185,0,3,NULL),(2217,'景宁畲族自治县',185,0,3,NULL),(2218,'松阳县',185,0,3,NULL),(2219,'缙云县',185,0,3,NULL),(2220,'莲都区',185,0,3,NULL),(2221,'遂昌县',185,0,3,NULL),(2222,'青田县',185,0,3,NULL),(2223,'龙泉市',185,0,3,NULL),(2224,'包河区',186,0,3,NULL),(2225,'庐阳区',186,0,3,NULL),(2226,'瑶海区',186,0,3,NULL),(2227,'肥东县',186,0,3,NULL),(2228,'肥西县',186,0,3,NULL),(2229,'蜀山区',186,0,3,NULL),(2230,'长丰县',186,0,3,NULL),(2231,'三山区',187,0,3,NULL),(2232,'南陵县',187,0,3,NULL),(2233,'弋江区',187,0,3,NULL),(2234,'繁昌县',187,0,3,NULL),(2235,'芜湖县',187,0,3,NULL),(2236,'镜湖区',187,0,3,NULL),(2237,'鸠江区',187,0,3,NULL),(2238,'五河县',188,0,3,NULL),(2239,'固镇县',188,0,3,NULL),(2240,'怀远县',188,0,3,NULL),(2241,'淮上区',188,0,3,NULL),(2242,'禹会区',188,0,3,NULL),(2243,'蚌山区',188,0,3,NULL),(2244,'龙子湖区',188,0,3,NULL),(2245,'八公山区',189,0,3,NULL),(2246,'凤台县',189,0,3,NULL),(2247,'大通区',189,0,3,NULL),(2248,'潘集区',189,0,3,NULL),(2249,'田家庵区',189,0,3,NULL),(2250,'谢家集区',189,0,3,NULL),(2251,'当涂县',190,0,3,NULL),(2252,'花山区',190,0,3,NULL),(2253,'金家庄区',190,0,3,NULL),(2254,'雨山区',190,0,3,NULL),(2255,'杜集区',191,0,3,NULL),(2256,'濉溪县',191,0,3,NULL),(2257,'烈山区',191,0,3,NULL),(2258,'相山区',191,0,3,NULL),(2259,'狮子山区',192,0,3,NULL),(2260,'郊区',192,0,3,NULL),(2261,'铜官山区',192,0,3,NULL),(2262,'铜陵县',192,0,3,NULL),(2263,'大观区',193,0,3,NULL),(2264,'太湖县',193,0,3,NULL),(2265,'宜秀区',193,0,3,NULL),(2266,'宿松县',193,0,3,NULL),(2267,'岳西县',193,0,3,NULL),(2268,'怀宁县',193,0,3,NULL),(2269,'望江县',193,0,3,NULL),(2270,'枞阳县',193,0,3,NULL),(2271,'桐城市',193,0,3,NULL),(2272,'潜山县',193,0,3,NULL),(2273,'迎江区',193,0,3,NULL),(2274,'休宁县',194,0,3,NULL),(2275,'屯溪区',194,0,3,NULL),(2276,'徽州区',194,0,3,NULL),(2277,'歙县',194,0,3,NULL),(2278,'祁门县',194,0,3,NULL),(2279,'黄山区',194,0,3,NULL),(2280,'黟县',194,0,3,NULL),(2281,'全椒县',195,0,3,NULL),(2282,'凤阳县',195,0,3,NULL),(2283,'南谯区',195,0,3,NULL),(2284,'天长市',195,0,3,NULL),(2285,'定远县',195,0,3,NULL),(2286,'明光市',195,0,3,NULL),(2287,'来安县',195,0,3,NULL),(2288,'琅玡区',195,0,3,NULL),(2289,'临泉县',196,0,3,NULL),(2290,'太和县',196,0,3,NULL),(2291,'界首市',196,0,3,NULL),(2292,'阜南县',196,0,3,NULL),(2293,'颍东区',196,0,3,NULL),(2294,'颍州区',196,0,3,NULL),(2295,'颍泉区',196,0,3,NULL),(2296,'颖上县',196,0,3,NULL),(2297,'埇桥区',197,0,3,NULL),(2298,'泗县辖',197,0,3,NULL),(2299,'灵璧县',197,0,3,NULL),(2300,'砀山县',197,0,3,NULL),(2301,'萧县',197,0,3,NULL),(2302,'含山县',198,0,3,NULL),(2303,'和县',198,0,3,NULL),(2304,'居巢区',198,0,3,NULL),(2305,'庐江县',198,0,3,NULL),(2306,'无为县',198,0,3,NULL),(2307,'寿县',199,0,3,NULL),(2308,'舒城县',199,0,3,NULL),(2309,'裕安区',199,0,3,NULL),(2310,'金安区',199,0,3,NULL),(2311,'金寨县',199,0,3,NULL),(2312,'霍山县',199,0,3,NULL),(2313,'霍邱县',199,0,3,NULL),(2314,'利辛县',200,0,3,NULL),(2315,'涡阳县',200,0,3,NULL),(2316,'蒙城县',200,0,3,NULL),(2317,'谯城区',200,0,3,NULL),(2318,'东至县',201,0,3,NULL),(2319,'石台县',201,0,3,NULL),(2320,'贵池区',201,0,3,NULL),(2321,'青阳县',201,0,3,NULL),(2322,'宁国市',202,0,3,NULL),(2323,'宣州区',202,0,3,NULL),(2324,'广德县',202,0,3,NULL),(2325,'旌德县',202,0,3,NULL),(2326,'泾县',202,0,3,NULL),(2327,'绩溪县',202,0,3,NULL),(2328,'郎溪县',202,0,3,NULL),(2329,'仓山区',203,0,3,NULL),(2330,'台江区',203,0,3,NULL),(2331,'平潭县',203,0,3,NULL),(2332,'晋安区',203,0,3,NULL),(2333,'永泰县',203,0,3,NULL),(2334,'福清市',203,0,3,NULL),(2335,'罗源县',203,0,3,NULL),(2336,'连江县',203,0,3,NULL),(2337,'长乐市',203,0,3,NULL),(2338,'闽侯县',203,0,3,NULL),(2339,'闽清县',203,0,3,NULL),(2340,'马尾区',203,0,3,NULL),(2341,'鼓楼区',203,0,3,NULL),(2342,'同安区',204,0,3,NULL),(2343,'思明区',204,0,3,NULL),(2344,'海沧区',204,0,3,NULL),(2345,'湖里区',204,0,3,NULL),(2346,'翔安区',204,0,3,NULL),(2347,'集美区',204,0,3,NULL),(2348,'仙游县',205,0,3,NULL),(2349,'城厢区',205,0,3,NULL),(2350,'涵江区',205,0,3,NULL),(2351,'秀屿区',205,0,3,NULL),(2352,'荔城区',205,0,3,NULL),(2353,'三元区',206,0,3,NULL),(2354,'大田县',206,0,3,NULL),(2355,'宁化县',206,0,3,NULL),(2356,'将乐县',206,0,3,NULL),(2357,'尤溪县',206,0,3,NULL),(2358,'建宁县',206,0,3,NULL),(2359,'明溪县',206,0,3,NULL),(2360,'梅列区',206,0,3,NULL),(2361,'永安市',206,0,3,NULL),(2362,'沙县',206,0,3,NULL),(2363,'泰宁县',206,0,3,NULL),(2364,'清流县',206,0,3,NULL),(2365,'丰泽区',207,0,3,NULL),(2366,'南安市',207,0,3,NULL),(2367,'安溪县',207,0,3,NULL),(2368,'德化县',207,0,3,NULL),(2369,'惠安县',207,0,3,NULL),(2370,'晋江市',207,0,3,NULL),(2371,'永春县',207,0,3,NULL),(2372,'泉港区',207,0,3,NULL),(2373,'洛江区',207,0,3,NULL),(2374,'石狮市',207,0,3,NULL),(2375,'金门县',207,0,3,NULL),(2376,'鲤城区',207,0,3,NULL),(2377,'东山县',208,0,3,NULL),(2378,'云霄县',208,0,3,NULL),(2379,'华安县',208,0,3,NULL),(2380,'南靖县',208,0,3,NULL),(2381,'平和县',208,0,3,NULL),(2382,'漳浦县',208,0,3,NULL),(2383,'芗城区',208,0,3,NULL),(2384,'诏安县',208,0,3,NULL),(2385,'长泰县',208,0,3,NULL),(2386,'龙文区',208,0,3,NULL),(2387,'龙海市',208,0,3,NULL),(2388,'光泽县',209,0,3,NULL),(2389,'延平区',209,0,3,NULL),(2390,'建瓯市',209,0,3,NULL),(2391,'建阳市',209,0,3,NULL),(2392,'政和县',209,0,3,NULL),(2393,'松溪县',209,0,3,NULL),(2394,'武夷山市',209,0,3,NULL),(2395,'浦城县',209,0,3,NULL),(2396,'邵武市',209,0,3,NULL),(2397,'顺昌县',209,0,3,NULL),(2398,'上杭县',210,0,3,NULL),(2399,'新罗区',210,0,3,NULL),(2400,'武平县',210,0,3,NULL),(2401,'永定县',210,0,3,NULL),(2402,'漳平市',210,0,3,NULL),(2403,'连城县',210,0,3,NULL),(2404,'长汀县',210,0,3,NULL),(2405,'古田县',211,0,3,NULL),(2406,'周宁县',211,0,3,NULL),(2407,'寿宁县',211,0,3,NULL),(2408,'屏南县',211,0,3,NULL),(2409,'柘荣县',211,0,3,NULL),(2410,'福安市',211,0,3,NULL),(2411,'福鼎市',211,0,3,NULL),(2412,'蕉城区',211,0,3,NULL),(2413,'霞浦县',211,0,3,NULL),(2414,'东湖区',212,0,3,NULL),(2415,'南昌县',212,0,3,NULL),(2416,'安义县',212,0,3,NULL),(2417,'新建县',212,0,3,NULL),(2418,'湾里区',212,0,3,NULL),(2419,'西湖区',212,0,3,NULL),(2420,'进贤县',212,0,3,NULL),(2421,'青云谱区',212,0,3,NULL),(2422,'青山湖区',212,0,3,NULL),(2423,'乐平市',213,0,3,NULL),(2424,'昌江区',213,0,3,NULL),(2425,'浮梁县',213,0,3,NULL),(2426,'珠山区',213,0,3,NULL),(2427,'上栗县',214,0,3,NULL),(2428,'安源区',214,0,3,NULL),(2429,'湘东区',214,0,3,NULL),(2430,'芦溪县',214,0,3,NULL),(2431,'莲花县',214,0,3,NULL),(2432,'九江县',215,0,3,NULL),(2433,'修水县',215,0,3,NULL),(2434,'庐山区',215,0,3,NULL),(2435,'彭泽县',215,0,3,NULL),(2436,'德安县',215,0,3,NULL),(2437,'星子县',215,0,3,NULL),(2438,'武宁县',215,0,3,NULL),(2439,'永修县',215,0,3,NULL),(2440,'浔阳区',215,0,3,NULL),(2441,'湖口县',215,0,3,NULL),(2442,'瑞昌市',215,0,3,NULL),(2443,'都昌县',215,0,3,NULL),(2444,'分宜县',216,0,3,NULL),(2445,'渝水区',216,0,3,NULL),(2446,'余江县',217,0,3,NULL),(2447,'月湖区',217,0,3,NULL),(2448,'贵溪市',217,0,3,NULL),(2449,'上犹县',218,0,3,NULL),(2450,'于都县',218,0,3,NULL),(2451,'会昌县',218,0,3,NULL),(2452,'信丰县',218,0,3,NULL),(2453,'全南县',218,0,3,NULL),(2454,'兴国县',218,0,3,NULL),(2455,'南康市',218,0,3,NULL),(2456,'大余县',218,0,3,NULL),(2457,'宁都县',218,0,3,NULL),(2458,'安远县',218,0,3,NULL),(2459,'定南县',218,0,3,NULL),(2460,'寻乌县',218,0,3,NULL),(2461,'崇义县',218,0,3,NULL),(2462,'瑞金市',218,0,3,NULL),(2463,'石城县',218,0,3,NULL),(2464,'章贡区',218,0,3,NULL),(2465,'赣县',218,0,3,NULL),(2466,'龙南县',218,0,3,NULL),(2467,'万安县',219,0,3,NULL),(2468,'井冈山市',219,0,3,NULL),(2469,'吉安县',219,0,3,NULL),(2470,'吉州区',219,0,3,NULL),(2471,'吉水县',219,0,3,NULL),(2472,'安福县',219,0,3,NULL),(2473,'峡江县',219,0,3,NULL),(2474,'新干县',219,0,3,NULL),(2475,'永丰县',219,0,3,NULL),(2476,'永新县',219,0,3,NULL),(2477,'泰和县',219,0,3,NULL),(2478,'遂川县',219,0,3,NULL),(2479,'青原区',219,0,3,NULL),(2480,'万载县',220,0,3,NULL),(2481,'上高县',220,0,3,NULL),(2482,'丰城市',220,0,3,NULL),(2483,'奉新县',220,0,3,NULL),(2484,'宜丰县',220,0,3,NULL),(2485,'樟树市',220,0,3,NULL),(2486,'袁州区',220,0,3,NULL),(2487,'铜鼓县',220,0,3,NULL),(2488,'靖安县',220,0,3,NULL),(2489,'高安市',220,0,3,NULL),(2490,'东乡县',221,0,3,NULL),(2491,'临川区',221,0,3,NULL),(2492,'乐安县',221,0,3,NULL),(2493,'南丰县',221,0,3,NULL),(2494,'南城县',221,0,3,NULL),(2495,'宜黄县',221,0,3,NULL),(2496,'崇仁县',221,0,3,NULL),(2497,'广昌县',221,0,3,NULL),(2498,'资溪县',221,0,3,NULL),(2499,'金溪县',221,0,3,NULL),(2500,'黎川县',221,0,3,NULL),(2501,'万年县',222,0,3,NULL),(2502,'上饶县',222,0,3,NULL),(2503,'余干县',222,0,3,NULL),(2504,'信州区',222,0,3,NULL),(2505,'婺源县',222,0,3,NULL),(2506,'广丰县',222,0,3,NULL),(2507,'弋阳县',222,0,3,NULL),(2508,'德兴市',222,0,3,NULL),(2509,'横峰县',222,0,3,NULL),(2510,'玉山县',222,0,3,NULL),(2511,'鄱阳县',222,0,3,NULL),(2512,'铅山县',222,0,3,NULL),(2513,'历下区',223,0,3,NULL),(2514,'历城区',223,0,3,NULL),(2515,'商河县',223,0,3,NULL),(2516,'天桥区',223,0,3,NULL),(2517,'市中区',223,0,3,NULL),(2518,'平阴县',223,0,3,NULL),(2519,'槐荫区',223,0,3,NULL),(2520,'济阳县',223,0,3,NULL),(2521,'章丘市',223,0,3,NULL),(2522,'长清区',223,0,3,NULL),(2523,'即墨市',224,0,3,NULL),(2524,'四方区',224,0,3,NULL),(2525,'城阳区',224,0,3,NULL),(2526,'崂山区',224,0,3,NULL),(2527,'市北区',224,0,3,NULL),(2528,'市南区',224,0,3,NULL),(2529,'平度市',224,0,3,NULL),(2530,'李沧区',224,0,3,NULL),(2531,'胶南市',224,0,3,NULL),(2532,'胶州市',224,0,3,NULL),(2533,'莱西市',224,0,3,NULL),(2534,'黄岛区',224,0,3,NULL),(2535,'临淄区',225,0,3,NULL),(2536,'博山区',225,0,3,NULL),(2537,'周村区',225,0,3,NULL),(2538,'张店区',225,0,3,NULL),(2539,'桓台县',225,0,3,NULL),(2540,'沂源县',225,0,3,NULL),(2541,'淄川区',225,0,3,NULL),(2542,'高青县',225,0,3,NULL),(2543,'台儿庄区',226,0,3,NULL),(2544,'山亭区',226,0,3,NULL),(2545,'峄城区',226,0,3,NULL),(2546,'市中区',226,0,3,NULL),(2547,'滕州市',226,0,3,NULL),(2548,'薛城区',226,0,3,NULL),(2549,'东营区',227,0,3,NULL),(2550,'利津县',227,0,3,NULL),(2551,'垦利县',227,0,3,NULL),(2552,'广饶县',227,0,3,NULL),(2553,'河口区',227,0,3,NULL),(2554,'招远市',228,0,3,NULL),(2555,'栖霞市',228,0,3,NULL),(2556,'海阳市',228,0,3,NULL),(2557,'牟平区',228,0,3,NULL),(2558,'福山区',228,0,3,NULL),(2559,'芝罘区',228,0,3,NULL),(2560,'莱山区',228,0,3,NULL),(2561,'莱州市',228,0,3,NULL),(2562,'莱阳市',228,0,3,NULL),(2563,'蓬莱市',228,0,3,NULL),(2564,'长岛县',228,0,3,NULL),(2565,'龙口市',228,0,3,NULL),(2566,'临朐县',229,0,3,NULL),(2567,'坊子区',229,0,3,NULL),(2568,'奎文区',229,0,3,NULL),(2569,'安丘市',229,0,3,NULL),(2570,'寒亭区',229,0,3,NULL),(2571,'寿光市',229,0,3,NULL),(2572,'昌乐县',229,0,3,NULL),(2573,'昌邑市',229,0,3,NULL),(2574,'潍城区',229,0,3,NULL),(2575,'诸城市',229,0,3,NULL),(2576,'青州市',229,0,3,NULL),(2577,'高密市',229,0,3,NULL),(2578,'任城区',230,0,3,NULL),(2579,'兖州市',230,0,3,NULL),(2580,'嘉祥县',230,0,3,NULL),(2581,'市中区',230,0,3,NULL),(2582,'微山县',230,0,3,NULL),(2583,'曲阜市',230,0,3,NULL),(2584,'梁山县',230,0,3,NULL),(2585,'汶上县',230,0,3,NULL),(2586,'泗水县',230,0,3,NULL),(2587,'邹城市',230,0,3,NULL),(2588,'金乡县',230,0,3,NULL),(2589,'鱼台县',230,0,3,NULL),(2590,'东平县',231,0,3,NULL),(2591,'宁阳县',231,0,3,NULL),(2592,'岱岳区',231,0,3,NULL),(2593,'新泰市',231,0,3,NULL),(2594,'泰山区',231,0,3,NULL),(2595,'肥城市',231,0,3,NULL),(2596,'乳山市',232,0,3,NULL),(2597,'文登市',232,0,3,NULL),(2598,'环翠区',232,0,3,NULL),(2599,'荣成市',232,0,3,NULL),(2600,'东港区',233,0,3,NULL),(2601,'五莲县',233,0,3,NULL),(2602,'岚山区',233,0,3,NULL),(2603,'莒县',233,0,3,NULL),(2604,'莱城区',234,0,3,NULL),(2605,'钢城区',234,0,3,NULL),(2606,'临沭县',235,0,3,NULL),(2607,'兰山区',235,0,3,NULL),(2608,'平邑县',235,0,3,NULL),(2609,'沂南县',235,0,3,NULL),(2610,'沂水县',235,0,3,NULL),(2611,'河东区',235,0,3,NULL),(2612,'罗庄区',235,0,3,NULL),(2613,'苍山县',235,0,3,NULL),(2614,'莒南县',235,0,3,NULL),(2615,'蒙阴县',235,0,3,NULL),(2616,'费县',235,0,3,NULL),(2617,'郯城县',235,0,3,NULL),(2618,'临邑县',236,0,3,NULL),(2619,'乐陵市',236,0,3,NULL),(2620,'夏津县',236,0,3,NULL),(2621,'宁津县',236,0,3,NULL),(2622,'平原县',236,0,3,NULL),(2623,'庆云县',236,0,3,NULL),(2624,'德城区',236,0,3,NULL),(2625,'武城县',236,0,3,NULL),(2626,'禹城市',236,0,3,NULL),(2627,'陵县',236,0,3,NULL),(2628,'齐河县',236,0,3,NULL),(2629,'东昌府区',237,0,3,NULL),(2630,'东阿县',237,0,3,NULL),(2631,'临清市',237,0,3,NULL),(2632,'冠县',237,0,3,NULL),(2633,'茌平县',237,0,3,NULL),(2634,'莘县',237,0,3,NULL),(2635,'阳谷县',237,0,3,NULL),(2636,'高唐县',237,0,3,NULL),(2637,'博兴县',238,0,3,NULL),(2638,'惠民县',238,0,3,NULL),(2639,'无棣县',238,0,3,NULL),(2640,'沾化县',238,0,3,NULL),(2641,'滨城区',238,0,3,NULL),(2642,'邹平县',238,0,3,NULL),(2643,'阳信县',238,0,3,NULL),(2644,'东明县',239,0,3,NULL),(2645,'单县',239,0,3,NULL),(2646,'定陶县',239,0,3,NULL),(2647,'巨野县',239,0,3,NULL),(2648,'成武县',239,0,3,NULL),(2649,'曹县',239,0,3,NULL),(2650,'牡丹区',239,0,3,NULL),(2651,'郓城县',239,0,3,NULL),(2652,'鄄城县',239,0,3,NULL),(2653,'上街区',240,0,3,NULL),(2654,'中原区',240,0,3,NULL),(2655,'中牟县',240,0,3,NULL),(2656,'二七区',240,0,3,NULL),(2657,'巩义市',240,0,3,NULL),(2658,'惠济区',240,0,3,NULL),(2659,'新密市',240,0,3,NULL),(2660,'新郑市',240,0,3,NULL),(2661,'登封市',240,0,3,NULL),(2662,'管城回族区',240,0,3,NULL),(2663,'荥阳市',240,0,3,NULL),(2664,'金水区',240,0,3,NULL),(2665,'兰考县',241,0,3,NULL),(2666,'尉氏县',241,0,3,NULL),(2667,'开封县',241,0,3,NULL),(2668,'杞县',241,0,3,NULL),(2669,'禹王台区',241,0,3,NULL),(2670,'通许县',241,0,3,NULL),(2671,'金明区',241,0,3,NULL),(2672,'顺河回族区',241,0,3,NULL),(2673,'鼓楼区',241,0,3,NULL),(2674,'龙亭区',241,0,3,NULL),(2675,'伊川县',242,0,3,NULL),(2676,'偃师市',242,0,3,NULL),(2677,'吉利区',242,0,3,NULL),(2678,'孟津县',242,0,3,NULL),(2679,'宜阳县',242,0,3,NULL),(2680,'嵩县',242,0,3,NULL),(2681,'新安县',242,0,3,NULL),(2682,'栾川县',242,0,3,NULL),(2683,'汝阳县',242,0,3,NULL),(2684,'洛宁县',242,0,3,NULL),(2685,'洛龙区',242,0,3,NULL),(2686,'涧西区',242,0,3,NULL),(2687,'瀍河回族区',242,0,3,NULL),(2688,'老城区',242,0,3,NULL),(2689,'西工区',242,0,3,NULL),(2690,'卫东区',243,0,3,NULL),(2691,'叶县',243,0,3,NULL),(2692,'宝丰县',243,0,3,NULL),(2693,'新华区',243,0,3,NULL),(2694,'汝州市',243,0,3,NULL),(2695,'湛河区',243,0,3,NULL),(2696,'石龙区',243,0,3,NULL),(2697,'舞钢市',243,0,3,NULL),(2698,'郏县',243,0,3,NULL),(2699,'鲁山县',243,0,3,NULL),(2700,'内黄县',244,0,3,NULL),(2701,'北关区',244,0,3,NULL),(2702,'安阳县',244,0,3,NULL),(2703,'文峰区',244,0,3,NULL),(2704,'林州市',244,0,3,NULL),(2705,'殷都区',244,0,3,NULL),(2706,'汤阴县',244,0,3,NULL),(2707,'滑县',244,0,3,NULL),(2708,'龙安区',244,0,3,NULL),(2709,'山城区',245,0,3,NULL),(2710,'浚县',245,0,3,NULL),(2711,'淇县',245,0,3,NULL),(2712,'淇滨区',245,0,3,NULL),(2713,'鹤山区',245,0,3,NULL),(2714,'凤泉区',246,0,3,NULL),(2715,'卫滨区',246,0,3,NULL),(2716,'卫辉市',246,0,3,NULL),(2717,'原阳县',246,0,3,NULL),(2718,'封丘县',246,0,3,NULL),(2719,'延津县',246,0,3,NULL),(2720,'新乡县',246,0,3,NULL),(2721,'牧野区',246,0,3,NULL),(2722,'红旗区',246,0,3,NULL),(2723,'获嘉县',246,0,3,NULL),(2724,'辉县市',246,0,3,NULL),(2725,'长垣县',246,0,3,NULL),(2726,'中站区',247,0,3,NULL),(2727,'修武县',247,0,3,NULL),(2728,'博爱县',247,0,3,NULL),(2729,'孟州市',247,0,3,NULL),(2730,'山阳区',247,0,3,NULL),(2731,'武陟县',247,0,3,NULL),(2732,'沁阳市',247,0,3,NULL),(2733,'温县',247,0,3,NULL),(2734,'解放区',247,0,3,NULL),(2735,'马村区',247,0,3,NULL),(2736,'华龙区',248,0,3,NULL),(2737,'南乐县',248,0,3,NULL),(2738,'台前县',248,0,3,NULL),(2739,'清丰县',248,0,3,NULL),(2740,'濮阳县',248,0,3,NULL),(2741,'范县',248,0,3,NULL),(2742,'禹州市',249,0,3,NULL),(2743,'襄城县',249,0,3,NULL),(2744,'许昌县',249,0,3,NULL),(2745,'鄢陵县',249,0,3,NULL),(2746,'长葛市',249,0,3,NULL),(2747,'魏都区',249,0,3,NULL),(2748,'临颍县',250,0,3,NULL),(2749,'召陵区',250,0,3,NULL),(2750,'源汇区',250,0,3,NULL),(2751,'舞阳县',250,0,3,NULL),(2752,'郾城区',250,0,3,NULL),(2753,'义马市',251,0,3,NULL),(2754,'卢氏县',251,0,3,NULL),(2755,'渑池县',251,0,3,NULL),(2756,'湖滨区',251,0,3,NULL),(2757,'灵宝市',251,0,3,NULL),(2758,'陕县',251,0,3,NULL),(2759,'内乡县',252,0,3,NULL),(2760,'南召县',252,0,3,NULL),(2761,'卧龙区',252,0,3,NULL),(2762,'唐河县',252,0,3,NULL),(2763,'宛城区',252,0,3,NULL),(2764,'新野县',252,0,3,NULL),(2765,'方城县',252,0,3,NULL),(2766,'桐柏县',252,0,3,NULL),(2767,'淅川县',252,0,3,NULL),(2768,'社旗县',252,0,3,NULL),(2769,'西峡县',252,0,3,NULL),(2770,'邓州市',252,0,3,NULL),(2771,'镇平县',252,0,3,NULL),(2772,'夏邑县',253,0,3,NULL),(2773,'宁陵县',253,0,3,NULL),(2774,'柘城县',253,0,3,NULL),(2775,'民权县',253,0,3,NULL),(2776,'永城市',253,0,3,NULL),(2777,'睢县',253,0,3,NULL),(2778,'睢阳区',253,0,3,NULL),(2779,'粱园区',253,0,3,NULL),(2780,'虞城县',253,0,3,NULL),(2781,'光山县',254,0,3,NULL),(2782,'商城县',254,0,3,NULL),(2783,'固始县',254,0,3,NULL),(2784,'平桥区',254,0,3,NULL),(2785,'息县',254,0,3,NULL),(2786,'新县',254,0,3,NULL),(2787,'浉河区',254,0,3,NULL),(2788,'淮滨县',254,0,3,NULL),(2789,'潢川县',254,0,3,NULL),(2790,'罗山县',254,0,3,NULL),(2791,'商水县',255,0,3,NULL),(2792,'太康县',255,0,3,NULL),(2793,'川汇区',255,0,3,NULL),(2794,'扶沟县',255,0,3,NULL),(2795,'沈丘县',255,0,3,NULL),(2796,'淮阳县',255,0,3,NULL),(2797,'西华县',255,0,3,NULL),(2798,'郸城县',255,0,3,NULL),(2799,'项城市',255,0,3,NULL),(2800,'鹿邑县',255,0,3,NULL),(2801,'上蔡县',256,0,3,NULL),(2802,'平舆县',256,0,3,NULL),(2803,'新蔡县',256,0,3,NULL),(2804,'正阳县',256,0,3,NULL),(2805,'汝南县',256,0,3,NULL),(2806,'泌阳县',256,0,3,NULL),(2807,'确山县',256,0,3,NULL),(2808,'西平县',256,0,3,NULL),(2809,'遂平县',256,0,3,NULL),(2810,'驿城区',256,0,3,NULL),(2811,'济源市',257,0,3,NULL),(2812,'东西湖区',258,0,3,NULL),(2813,'新洲区',258,0,3,NULL),(2814,'武昌区',258,0,3,NULL),(2815,'汉南区',258,0,3,NULL),(2816,'汉阳区',258,0,3,NULL),(2817,'江夏区',258,0,3,NULL),(2818,'江岸区',258,0,3,NULL),(2819,'江汉区',258,0,3,NULL),(2820,'洪山区',258,0,3,NULL),(2821,'硚口区',258,0,3,NULL),(2822,'蔡甸区',258,0,3,NULL),(2823,'青山区',258,0,3,NULL),(2824,'黄陂区',258,0,3,NULL),(2825,'下陆区',259,0,3,NULL),(2826,'大冶市',259,0,3,NULL),(2827,'西塞山区',259,0,3,NULL),(2828,'铁山区',259,0,3,NULL),(2829,'阳新县',259,0,3,NULL),(2830,'黄石港区',259,0,3,NULL),(2831,'丹江口市',260,0,3,NULL),(2832,'张湾区',260,0,3,NULL),(2833,'房县',260,0,3,NULL),(2834,'竹山县',260,0,3,NULL),(2835,'竹溪县',260,0,3,NULL),(2836,'茅箭区',260,0,3,NULL),(2837,'郧县',260,0,3,NULL),(2838,'郧西县',260,0,3,NULL),(2839,'五峰土家族自治县',261,0,3,NULL),(2840,'伍家岗区',261,0,3,NULL),(2841,'兴山县',261,0,3,NULL),(2842,'夷陵区',261,0,3,NULL),(2843,'宜都市',261,0,3,NULL),(2844,'当阳市',261,0,3,NULL),(2845,'枝江市',261,0,3,NULL),(2846,'点军区',261,0,3,NULL),(2847,'秭归县',261,0,3,NULL),(2848,'虢亭区',261,0,3,NULL),(2849,'西陵区',261,0,3,NULL),(2850,'远安县',261,0,3,NULL),(2851,'长阳土家族自治县',261,0,3,NULL),(2852,'保康县',262,0,3,NULL),(2853,'南漳县',262,0,3,NULL),(2854,'宜城市',262,0,3,NULL),(2855,'枣阳市',262,0,3,NULL),(2856,'樊城区',262,0,3,NULL),(2857,'老河口市',262,0,3,NULL),(2858,'襄城区',262,0,3,NULL),(2859,'襄阳区',262,0,3,NULL),(2860,'谷城县',262,0,3,NULL),(2861,'华容区',263,0,3,NULL),(2862,'粱子湖',263,0,3,NULL),(2863,'鄂城区',263,0,3,NULL),(2864,'东宝区',264,0,3,NULL),(2865,'京山县',264,0,3,NULL),(2866,'掇刀区',264,0,3,NULL),(2867,'沙洋县',264,0,3,NULL),(2868,'钟祥市',264,0,3,NULL),(2869,'云梦县',265,0,3,NULL),(2870,'大悟县',265,0,3,NULL),(2871,'孝南区',265,0,3,NULL),(2872,'孝昌县',265,0,3,NULL),(2873,'安陆市',265,0,3,NULL),(2874,'应城市',265,0,3,NULL),(2875,'汉川市',265,0,3,NULL),(2876,'公安县',266,0,3,NULL),(2877,'松滋市',266,0,3,NULL),(2878,'江陵县',266,0,3,NULL),(2879,'沙市区',266,0,3,NULL),(2880,'洪湖市',266,0,3,NULL),(2881,'监利县',266,0,3,NULL),(2882,'石首市',266,0,3,NULL),(2883,'荆州区',266,0,3,NULL),(2884,'团风县',267,0,3,NULL),(2885,'武穴市',267,0,3,NULL),(2886,'浠水县',267,0,3,NULL),(2887,'红安县',267,0,3,NULL),(2888,'罗田县',267,0,3,NULL),(2889,'英山县',267,0,3,NULL),(2890,'蕲春县',267,0,3,NULL),(2891,'麻城市',267,0,3,NULL),(2892,'黄州区',267,0,3,NULL),(2893,'黄梅县',267,0,3,NULL),(2894,'咸安区',268,0,3,NULL),(2895,'嘉鱼县',268,0,3,NULL),(2896,'崇阳县',268,0,3,NULL),(2897,'赤壁市',268,0,3,NULL),(2898,'通城县',268,0,3,NULL),(2899,'通山县',268,0,3,NULL),(2900,'广水市',269,0,3,NULL),(2901,'曾都区',269,0,3,NULL),(2902,'利川市',270,0,3,NULL),(2903,'咸丰县',270,0,3,NULL),(2904,'宣恩县',270,0,3,NULL),(2905,'巴东县',270,0,3,NULL),(2906,'建始县',270,0,3,NULL),(2907,'恩施市',270,0,3,NULL),(2908,'来凤县',270,0,3,NULL),(2909,'鹤峰县',270,0,3,NULL),(2910,'仙桃市',271,0,3,NULL),(2911,'潜江市',272,0,3,NULL),(2912,'天门市',273,0,3,NULL),(2913,'神农架林区',274,0,3,NULL),(2914,'天心区',275,0,3,NULL),(2915,'宁乡县',275,0,3,NULL),(2916,'岳麓区',275,0,3,NULL),(2917,'开福区',275,0,3,NULL),(2918,'望城县',275,0,3,NULL),(2919,'浏阳市',275,0,3,NULL),(2920,'芙蓉区',275,0,3,NULL),(2921,'长沙县',275,0,3,NULL),(2922,'雨花区',275,0,3,NULL),(2923,'天元区',276,0,3,NULL),(2924,'攸县',276,0,3,NULL),(2925,'株洲县',276,0,3,NULL),(2926,'炎陵县',276,0,3,NULL),(2927,'石峰区',276,0,3,NULL),(2928,'芦淞区',276,0,3,NULL),(2929,'茶陵县',276,0,3,NULL),(2930,'荷塘区',276,0,3,NULL),(2931,'醴陵市',276,0,3,NULL),(2932,'岳塘区',277,0,3,NULL),(2933,'湘乡市',277,0,3,NULL),(2934,'湘潭县',277,0,3,NULL),(2935,'雨湖区',277,0,3,NULL),(2936,'韶山市',277,0,3,NULL),(2937,'南岳区',278,0,3,NULL),(2938,'常宁市',278,0,3,NULL),(2939,'珠晖区',278,0,3,NULL),(2940,'石鼓区',278,0,3,NULL),(2941,'祁东县',278,0,3,NULL),(2942,'耒阳市',278,0,3,NULL),(2943,'蒸湘区',278,0,3,NULL),(2944,'衡东县',278,0,3,NULL),(2945,'衡南县',278,0,3,NULL),(2946,'衡山县',278,0,3,NULL),(2947,'衡阳县',278,0,3,NULL),(2948,'雁峰区',278,0,3,NULL),(2949,'北塔区',279,0,3,NULL),(2950,'双清区',279,0,3,NULL),(2951,'城步苗族自治县',279,0,3,NULL),(2952,'大祥区',279,0,3,NULL),(2953,'新宁县',279,0,3,NULL),(2954,'新邵县',279,0,3,NULL),(2955,'武冈市',279,0,3,NULL),(2956,'洞口县',279,0,3,NULL),(2957,'绥宁县',279,0,3,NULL),(2958,'邵东县',279,0,3,NULL),(2959,'邵阳县',279,0,3,NULL),(2960,'隆回县',279,0,3,NULL),(2961,'临湘市',280,0,3,NULL),(2962,'云溪区',280,0,3,NULL),(2963,'华容县',280,0,3,NULL),(2964,'君山区',280,0,3,NULL),(2965,'岳阳县',280,0,3,NULL),(2966,'岳阳楼区',280,0,3,NULL),(2967,'平江县',280,0,3,NULL),(2968,'汨罗市',280,0,3,NULL),(2969,'湘阴县',280,0,3,NULL),(2970,'临澧县',281,0,3,NULL),(2971,'安乡县',281,0,3,NULL),(2972,'桃源县',281,0,3,NULL),(2973,'武陵区',281,0,3,NULL),(2974,'汉寿县',281,0,3,NULL),(2975,'津市市',281,0,3,NULL),(2976,'澧县',281,0,3,NULL),(2977,'石门县',281,0,3,NULL),(2978,'鼎城区',281,0,3,NULL),(2979,'慈利县',282,0,3,NULL),(2980,'桑植县',282,0,3,NULL),(2981,'武陵源区',282,0,3,NULL),(2982,'永定区',282,0,3,NULL),(2983,'南县',283,0,3,NULL),(2984,'安化县',283,0,3,NULL),(2985,'桃江县',283,0,3,NULL),(2986,'沅江市',283,0,3,NULL),(2987,'资阳区',283,0,3,NULL),(2988,'赫山区',283,0,3,NULL),(2989,'临武县',284,0,3,NULL),(2990,'北湖区',284,0,3,NULL),(2991,'嘉禾县',284,0,3,NULL),(2992,'安仁县',284,0,3,NULL),(2993,'宜章县',284,0,3,NULL),(2994,'桂东县',284,0,3,NULL),(2995,'桂阳县',284,0,3,NULL),(2996,'永兴县',284,0,3,NULL),(2997,'汝城县',284,0,3,NULL),(2998,'苏仙区',284,0,3,NULL),(2999,'资兴市',284,0,3,NULL),(3000,'东安县',285,0,3,NULL),(3001,'冷水滩区',285,0,3,NULL),(3002,'双牌县',285,0,3,NULL),(3003,'宁远县',285,0,3,NULL),(3004,'新田县',285,0,3,NULL),(3005,'江华瑶族自治县',285,0,3,NULL),(3006,'江永县',285,0,3,NULL),(3007,'祁阳县',285,0,3,NULL),(3008,'蓝山县',285,0,3,NULL),(3009,'道县',285,0,3,NULL),(3010,'零陵区',285,0,3,NULL),(3011,'中方县',286,0,3,NULL),(3012,'会同县',286,0,3,NULL),(3013,'新晃侗族自治县',286,0,3,NULL),(3014,'沅陵县',286,0,3,NULL),(3015,'洪江市/洪江区',286,0,3,NULL),(3016,'溆浦县',286,0,3,NULL),(3017,'芷江侗族自治县',286,0,3,NULL),(3018,'辰溪县',286,0,3,NULL),(3019,'通道侗族自治县',286,0,3,NULL),(3020,'靖州苗族侗族自治县',286,0,3,NULL),(3021,'鹤城区',286,0,3,NULL),(3022,'麻阳苗族自治县',286,0,3,NULL),(3023,'冷水江市',287,0,3,NULL),(3024,'双峰县',287,0,3,NULL),(3025,'娄星区',287,0,3,NULL),(3026,'新化县',287,0,3,NULL),(3027,'涟源市',287,0,3,NULL),(3028,'保靖县',288,0,3,NULL),(3029,'凤凰县',288,0,3,NULL),(3030,'古丈县',288,0,3,NULL),(3031,'吉首市',288,0,3,NULL),(3032,'永顺县',288,0,3,NULL),(3033,'泸溪县',288,0,3,NULL),(3034,'花垣县',288,0,3,NULL),(3035,'龙山县',288,0,3,NULL),(3036,'萝岗区',289,0,3,NULL),(3037,'南沙区',289,0,3,NULL),(3038,'从化市',289,0,3,NULL),(3039,'增城市',289,0,3,NULL),(3040,'天河区',289,0,3,NULL),(3041,'海珠区',289,0,3,NULL),(3042,'番禺区',289,0,3,NULL),(3043,'白云区',289,0,3,NULL),(3044,'花都区',289,0,3,NULL),(3045,'荔湾区',289,0,3,NULL),(3046,'越秀区',289,0,3,NULL),(3047,'黄埔区',289,0,3,NULL),(3048,'乐昌市',290,0,3,NULL),(3049,'乳源瑶族自治县',290,0,3,NULL),(3050,'仁化县',290,0,3,NULL),(3051,'南雄市',290,0,3,NULL),(3052,'始兴县',290,0,3,NULL),(3053,'新丰县',290,0,3,NULL),(3054,'曲江区',290,0,3,NULL),(3055,'武江区',290,0,3,NULL),(3056,'浈江区',290,0,3,NULL),(3057,'翁源县',290,0,3,NULL),(3058,'南山区',291,0,3,NULL),(3059,'宝安区',291,0,3,NULL),(3060,'盐田区',291,0,3,NULL),(3061,'福田区',291,0,3,NULL),(3062,'罗湖区',291,0,3,NULL),(3063,'龙岗区',291,0,3,NULL),(3064,'斗门区',292,0,3,NULL),(3065,'金湾区',292,0,3,NULL),(3066,'香洲区',292,0,3,NULL),(3067,'南澳县',293,0,3,NULL),(3068,'潮南区',293,0,3,NULL),(3069,'潮阳区',293,0,3,NULL),(3070,'澄海区',293,0,3,NULL),(3071,'濠江区',293,0,3,NULL),(3072,'金平区',293,0,3,NULL),(3073,'龙湖区',293,0,3,NULL),(3074,'三水区',294,0,3,NULL),(3075,'南海区',294,0,3,NULL),(3076,'禅城区',294,0,3,NULL),(3077,'顺德区',294,0,3,NULL),(3078,'高明区',294,0,3,NULL),(3079,'台山市',295,0,3,NULL),(3080,'开平市',295,0,3,NULL),(3081,'恩平市',295,0,3,NULL),(3082,'新会区',295,0,3,NULL),(3083,'江海区',295,0,3,NULL),(3084,'蓬江区',295,0,3,NULL),(3085,'鹤山市',295,0,3,NULL),(3086,'吴川市',296,0,3,NULL),(3087,'坡头区',296,0,3,NULL),(3088,'廉江市',296,0,3,NULL),(3089,'徐闻县',296,0,3,NULL),(3090,'赤坎区',296,0,3,NULL),(3091,'遂溪县',296,0,3,NULL),(3092,'雷州市',296,0,3,NULL),(3093,'霞山区',296,0,3,NULL),(3094,'麻章区',296,0,3,NULL),(3095,'信宜市',297,0,3,NULL),(3096,'化州市',297,0,3,NULL),(3097,'电白县',297,0,3,NULL),(3098,'茂南区',297,0,3,NULL),(3099,'茂港区',297,0,3,NULL),(3100,'高州市',297,0,3,NULL),(3101,'四会市',298,0,3,NULL),(3102,'封开县',298,0,3,NULL),(3103,'广宁县',298,0,3,NULL),(3104,'德庆县',298,0,3,NULL),(3105,'怀集县',298,0,3,NULL),(3106,'端州区',298,0,3,NULL),(3107,'高要市',298,0,3,NULL),(3108,'鼎湖区',298,0,3,NULL),(3109,'博罗县',299,0,3,NULL),(3110,'惠东县',299,0,3,NULL),(3111,'惠城区',299,0,3,NULL),(3112,'惠阳区',299,0,3,NULL),(3113,'龙门县',299,0,3,NULL),(3114,'丰顺县',300,0,3,NULL),(3115,'五华县',300,0,3,NULL),(3116,'兴宁市',300,0,3,NULL),(3117,'大埔县',300,0,3,NULL),(3118,'平远县',300,0,3,NULL),(3119,'梅县',300,0,3,NULL),(3120,'梅江区',300,0,3,NULL),(3121,'蕉岭县',300,0,3,NULL),(3122,'城区',301,0,3,NULL),(3123,'海丰县',301,0,3,NULL),(3124,'陆丰市',301,0,3,NULL),(3125,'陆河县',301,0,3,NULL),(3126,'东源县',302,0,3,NULL),(3127,'和平县',302,0,3,NULL),(3128,'源城区',302,0,3,NULL),(3129,'紫金县',302,0,3,NULL),(3130,'连平县',302,0,3,NULL),(3131,'龙川县',302,0,3,NULL),(3132,'江城区',303,0,3,NULL),(3133,'阳东县',303,0,3,NULL),(3134,'阳春市',303,0,3,NULL),(3135,'阳西县',303,0,3,NULL),(3136,'佛冈县',304,0,3,NULL),(3137,'清城区',304,0,3,NULL),(3138,'清新县',304,0,3,NULL),(3139,'英德市',304,0,3,NULL),(3140,'连南瑶族自治县',304,0,3,NULL),(3141,'连山壮族瑶族自治县',304,0,3,NULL),(3142,'连州市',304,0,3,NULL),(3143,'阳山县',304,0,3,NULL),(3144,'东莞市',305,0,3,NULL),(3145,'中山市',306,0,3,NULL),(3146,'湘桥区',307,0,3,NULL),(3147,'潮安县',307,0,3,NULL),(3148,'饶平县',307,0,3,NULL),(3149,'惠来县',308,0,3,NULL),(3150,'揭东县',308,0,3,NULL),(3151,'揭西县',308,0,3,NULL),(3152,'普宁市',308,0,3,NULL),(3153,'榕城区',308,0,3,NULL),(3154,'云城区',309,0,3,NULL),(3155,'云安县',309,0,3,NULL),(3156,'新兴县',309,0,3,NULL),(3157,'罗定市',309,0,3,NULL),(3158,'郁南县',309,0,3,NULL),(3159,'上林县',310,0,3,NULL),(3160,'兴宁区',310,0,3,NULL),(3161,'宾阳县',310,0,3,NULL),(3162,'横县',310,0,3,NULL),(3163,'武鸣县',310,0,3,NULL),(3164,'江南区',310,0,3,NULL),(3165,'良庆区',310,0,3,NULL),(3166,'西乡塘区',310,0,3,NULL),(3167,'邕宁区',310,0,3,NULL),(3168,'隆安县',310,0,3,NULL),(3169,'青秀区',310,0,3,NULL),(3170,'马山县',310,0,3,NULL),(3171,'三江侗族自治县',311,0,3,NULL),(3172,'城中区',311,0,3,NULL),(3173,'柳北区',311,0,3,NULL),(3174,'柳南区',311,0,3,NULL),(3175,'柳城县',311,0,3,NULL),(3176,'柳江县',311,0,3,NULL),(3177,'融安县',311,0,3,NULL),(3178,'融水苗族自治县',311,0,3,NULL),(3179,'鱼峰区',311,0,3,NULL),(3180,'鹿寨县',311,0,3,NULL),(3181,'七星区',312,0,3,NULL),(3182,'临桂县',312,0,3,NULL),(3183,'全州县',312,0,3,NULL),(3184,'兴安县',312,0,3,NULL),(3185,'叠彩区',312,0,3,NULL),(3186,'平乐县',312,0,3,NULL),(3187,'恭城瑶族自治县',312,0,3,NULL),(3188,'永福县',312,0,3,NULL),(3189,'灌阳县',312,0,3,NULL),(3190,'灵川县',312,0,3,NULL),(3191,'秀峰区',312,0,3,NULL),(3192,'荔浦县',312,0,3,NULL),(3193,'象山区',312,0,3,NULL),(3194,'资源县',312,0,3,NULL),(3195,'阳朔县',312,0,3,NULL),(3196,'雁山区',312,0,3,NULL),(3197,'龙胜各族自治县',312,0,3,NULL),(3198,'万秀区',313,0,3,NULL),(3199,'岑溪市',313,0,3,NULL),(3200,'苍梧县',313,0,3,NULL),(3201,'蒙山县',313,0,3,NULL),(3202,'藤县',313,0,3,NULL),(3203,'蝶山区',313,0,3,NULL),(3204,'长洲区',313,0,3,NULL),(3205,'合浦县',314,0,3,NULL),(3206,'海城区',314,0,3,NULL),(3207,'铁山港区',314,0,3,NULL),(3208,'银海区',314,0,3,NULL),(3209,'上思县',315,0,3,NULL),(3210,'东兴市',315,0,3,NULL),(3211,'港口区',315,0,3,NULL),(3212,'防城区',315,0,3,NULL),(3213,'浦北县',316,0,3,NULL),(3214,'灵山县',316,0,3,NULL),(3215,'钦北区',316,0,3,NULL),(3216,'钦南区',316,0,3,NULL),(3217,'平南县',317,0,3,NULL),(3218,'桂平市',317,0,3,NULL),(3219,'港北区',317,0,3,NULL),(3220,'港南区',317,0,3,NULL),(3221,'覃塘区',317,0,3,NULL),(3222,'兴业县',318,0,3,NULL),(3223,'北流市',318,0,3,NULL),(3224,'博白县',318,0,3,NULL),(3225,'容县',318,0,3,NULL),(3226,'玉州区',318,0,3,NULL),(3227,'陆川县',318,0,3,NULL),(3228,'乐业县',319,0,3,NULL),(3229,'凌云县',319,0,3,NULL),(3230,'右江区',319,0,3,NULL),(3231,'平果县',319,0,3,NULL),(3232,'德保县',319,0,3,NULL),(3233,'田东县',319,0,3,NULL),(3234,'田林县',319,0,3,NULL),(3235,'田阳县',319,0,3,NULL),(3236,'西林县',319,0,3,NULL),(3237,'那坡县',319,0,3,NULL),(3238,'隆林各族自治县',319,0,3,NULL),(3239,'靖西县',319,0,3,NULL),(3240,'八步区',320,0,3,NULL),(3241,'富川瑶族自治县',320,0,3,NULL),(3242,'昭平县',320,0,3,NULL),(3243,'钟山县',320,0,3,NULL),(3244,'东兰县',321,0,3,NULL),(3245,'凤山县',321,0,3,NULL),(3246,'南丹县',321,0,3,NULL),(3247,'大化瑶族自治县',321,0,3,NULL),(3248,'天峨县',321,0,3,NULL),(3249,'宜州市',321,0,3,NULL),(3250,'巴马瑶族自治县',321,0,3,NULL),(3251,'环江毛南族自治县',321,0,3,NULL),(3252,'罗城仫佬族自治县',321,0,3,NULL),(3253,'都安瑶族自治县',321,0,3,NULL),(3254,'金城江区',321,0,3,NULL),(3255,'兴宾区',322,0,3,NULL),(3256,'合山市',322,0,3,NULL),(3257,'忻城县',322,0,3,NULL),(3258,'武宣县',322,0,3,NULL),(3259,'象州县',322,0,3,NULL),(3260,'金秀瑶族自治县',322,0,3,NULL),(3261,'凭祥市',323,0,3,NULL),(3262,'大新县',323,0,3,NULL),(3263,'天等县',323,0,3,NULL),(3264,'宁明县',323,0,3,NULL),(3265,'扶绥县',323,0,3,NULL),(3266,'江州区',323,0,3,NULL),(3267,'龙州县',323,0,3,NULL),(3268,'琼山区',324,0,3,NULL),(3269,'秀英区',324,0,3,NULL),(3270,'美兰区',324,0,3,NULL),(3271,'龙华区',324,0,3,NULL),(3272,'三亚市',325,0,3,NULL),(3273,'五指山市',326,0,3,NULL),(3274,'琼海市',327,0,3,NULL),(3275,'儋州市',328,0,3,NULL),(3276,'文昌市',329,0,3,NULL),(3277,'万宁市',330,0,3,NULL),(3278,'东方市',331,0,3,NULL),(3279,'定安县',332,0,3,NULL),(3280,'屯昌县',333,0,3,NULL),(3281,'澄迈县',334,0,3,NULL),(3282,'临高县',335,0,3,NULL),(3283,'白沙黎族自治县',336,0,3,NULL),(3284,'昌江黎族自治县',337,0,3,NULL),(3285,'乐东黎族自治县',338,0,3,NULL),(3286,'陵水黎族自治县',339,0,3,NULL),(3287,'保亭黎族苗族自治县',340,0,3,NULL),(3288,'琼中黎族苗族自治县',341,0,3,NULL),(4209,'双流县',385,0,3,NULL),(4210,'大邑县',385,0,3,NULL),(4211,'崇州市',385,0,3,NULL),(4212,'彭州市',385,0,3,NULL),(4213,'成华区',385,0,3,NULL),(4214,'新津县',385,0,3,NULL),(4215,'新都区',385,0,3,NULL),(4216,'武侯区',385,0,3,NULL),(4217,'温江区',385,0,3,NULL),(4218,'蒲江县',385,0,3,NULL),(4219,'邛崃市',385,0,3,NULL),(4220,'郫县',385,0,3,NULL),(4221,'都江堰市',385,0,3,NULL),(4222,'金堂县',385,0,3,NULL),(4223,'金牛区',385,0,3,NULL),(4224,'锦江区',385,0,3,NULL),(4225,'青白江区',385,0,3,NULL),(4226,'青羊区',385,0,3,NULL),(4227,'龙泉驿区',385,0,3,NULL),(4228,'大安区',386,0,3,NULL),(4229,'富顺县',386,0,3,NULL),(4230,'沿滩区',386,0,3,NULL),(4231,'自流井区',386,0,3,NULL),(4232,'荣县',386,0,3,NULL),(4233,'贡井区',386,0,3,NULL),(4234,'东区',387,0,3,NULL),(4235,'仁和区',387,0,3,NULL),(4236,'盐边县',387,0,3,NULL),(4237,'米易县',387,0,3,NULL),(4238,'西区',387,0,3,NULL),(4239,'叙永县',388,0,3,NULL),(4240,'古蔺县',388,0,3,NULL),(4241,'合江县',388,0,3,NULL),(4242,'江阳区',388,0,3,NULL),(4243,'泸县',388,0,3,NULL),(4244,'纳溪区',388,0,3,NULL),(4245,'龙马潭区',388,0,3,NULL),(4246,'中江县',389,0,3,NULL),(4247,'什邡市',389,0,3,NULL),(4248,'广汉市',389,0,3,NULL),(4249,'旌阳区',389,0,3,NULL),(4250,'绵竹市',389,0,3,NULL),(4251,'罗江县',389,0,3,NULL),(4252,'三台县',390,0,3,NULL),(4253,'北川羌族自治县',390,0,3,NULL),(4254,'安县',390,0,3,NULL),(4255,'平武县',390,0,3,NULL),(4256,'梓潼县',390,0,3,NULL),(4257,'江油市',390,0,3,NULL),(4258,'涪城区',390,0,3,NULL),(4259,'游仙区',390,0,3,NULL),(4260,'盐亭县',390,0,3,NULL),(4261,'元坝区',391,0,3,NULL),(4262,'利州区',391,0,3,NULL),(4263,'剑阁县',391,0,3,NULL),(4264,'旺苍县',391,0,3,NULL),(4265,'朝天区',391,0,3,NULL),(4266,'苍溪县',391,0,3,NULL),(4267,'青川县',391,0,3,NULL),(4268,'大英县',392,0,3,NULL),(4269,'安居区',392,0,3,NULL),(4270,'射洪县',392,0,3,NULL),(4271,'船山区',392,0,3,NULL),(4272,'蓬溪县',392,0,3,NULL),(4273,'东兴区',393,0,3,NULL),(4274,'威远县',393,0,3,NULL),(4275,'市中区',393,0,3,NULL),(4276,'资中县',393,0,3,NULL),(4277,'隆昌县',393,0,3,NULL),(4278,'五通桥区',394,0,3,NULL),(4279,'井研县',394,0,3,NULL),(4280,'夹江县',394,0,3,NULL),(4281,'峨眉山市',394,0,3,NULL),(4282,'峨边彝族自治县',394,0,3,NULL),(4283,'市中区',394,0,3,NULL),(4284,'沐川县',394,0,3,NULL),(4285,'沙湾区',394,0,3,NULL),(4286,'犍为县',394,0,3,NULL),(4287,'金口河区',394,0,3,NULL),(4288,'马边彝族自治县',394,0,3,NULL),(4289,'仪陇县',395,0,3,NULL),(4290,'南充市嘉陵区',395,0,3,NULL),(4291,'南部县',395,0,3,NULL),(4292,'嘉陵区',395,0,3,NULL),(4293,'营山县',395,0,3,NULL),(4294,'蓬安县',395,0,3,NULL),(4295,'西充县',395,0,3,NULL),(4296,'阆中市',395,0,3,NULL),(4297,'顺庆区',395,0,3,NULL),(4298,'高坪区',395,0,3,NULL),(4299,'东坡区',396,0,3,NULL),(4300,'丹棱县',396,0,3,NULL),(4301,'仁寿县',396,0,3,NULL),(4302,'彭山县',396,0,3,NULL),(4303,'洪雅县',396,0,3,NULL),(4304,'青神县',396,0,3,NULL),(4305,'兴文县',397,0,3,NULL),(4306,'南溪县',397,0,3,NULL),(4307,'宜宾县',397,0,3,NULL),(4308,'屏山县',397,0,3,NULL),(4309,'江安县',397,0,3,NULL),(4310,'珙县',397,0,3,NULL),(4311,'筠连县',397,0,3,NULL),(4312,'翠屏区',397,0,3,NULL),(4313,'长宁县',397,0,3,NULL),(4314,'高县',397,0,3,NULL),(4315,'华蓥市',398,0,3,NULL),(4316,'岳池县',398,0,3,NULL),(4317,'广安区',398,0,3,NULL),(4318,'武胜县',398,0,3,NULL),(4319,'邻水县',398,0,3,NULL),(4320,'万源市',399,0,3,NULL),(4321,'大竹县',399,0,3,NULL),(4322,'宣汉县',399,0,3,NULL),(4323,'开江县',399,0,3,NULL),(4324,'渠县',399,0,3,NULL),(4325,'达县',399,0,3,NULL),(4326,'通川区',399,0,3,NULL),(4327,'名山县',400,0,3,NULL),(4328,'天全县',400,0,3,NULL),(4329,'宝兴县',400,0,3,NULL),(4330,'汉源县',400,0,3,NULL),(4331,'石棉县',400,0,3,NULL),(4332,'芦山县',400,0,3,NULL),(4333,'荥经县',400,0,3,NULL),(4334,'雨城区',400,0,3,NULL),(4335,'南江县',401,0,3,NULL),(4336,'巴州区',401,0,3,NULL),(4337,'平昌县',401,0,3,NULL),(4338,'通江县',401,0,3,NULL),(4339,'乐至县',402,0,3,NULL),(4340,'安岳县',402,0,3,NULL),(4341,'简阳市',402,0,3,NULL),(4342,'雁江区',402,0,3,NULL),(4343,'九寨沟县',403,0,3,NULL),(4344,'壤塘县',403,0,3,NULL),(4345,'小金县',403,0,3,NULL),(4346,'松潘县',403,0,3,NULL),(4347,'汶川县',403,0,3,NULL),(4348,'理县',403,0,3,NULL),(4349,'红原县',403,0,3,NULL),(4350,'若尔盖县',403,0,3,NULL),(4351,'茂县',403,0,3,NULL),(4352,'金川县',403,0,3,NULL),(4353,'阿坝县',403,0,3,NULL),(4354,'马尔康县',403,0,3,NULL),(4355,'黑水县',403,0,3,NULL),(4356,'丹巴县',404,0,3,NULL),(4357,'乡城县',404,0,3,NULL),(4358,'巴塘县',404,0,3,NULL),(4359,'康定县',404,0,3,NULL),(4360,'得荣县',404,0,3,NULL),(4361,'德格县',404,0,3,NULL),(4362,'新龙县',404,0,3,NULL),(4363,'泸定县',404,0,3,NULL),(4364,'炉霍县',404,0,3,NULL),(4365,'理塘县',404,0,3,NULL),(4366,'甘孜县',404,0,3,NULL),(4367,'白玉县',404,0,3,NULL),(4368,'石渠县',404,0,3,NULL),(4369,'稻城县',404,0,3,NULL),(4370,'色达县',404,0,3,NULL),(4371,'道孚县',404,0,3,NULL),(4372,'雅江县',404,0,3,NULL),(4373,'会东县',405,0,3,NULL),(4374,'会理县',405,0,3,NULL),(4375,'冕宁县',405,0,3,NULL),(4376,'喜德县',405,0,3,NULL),(4377,'宁南县',405,0,3,NULL),(4378,'布拖县',405,0,3,NULL),(4379,'德昌县',405,0,3,NULL),(4380,'昭觉县',405,0,3,NULL),(4381,'普格县',405,0,3,NULL),(4382,'木里藏族自治县',405,0,3,NULL),(4383,'甘洛县',405,0,3,NULL),(4384,'盐源县',405,0,3,NULL),(4385,'美姑县',405,0,3,NULL),(4386,'西昌',405,0,3,NULL),(4387,'越西县',405,0,3,NULL),(4388,'金阳县',405,0,3,NULL),(4389,'雷波县',405,0,3,NULL),(4390,'乌当区',406,0,3,NULL),(4391,'云岩区',406,0,3,NULL),(4392,'修文县',406,0,3,NULL),(4393,'南明区',406,0,3,NULL),(4394,'小河区',406,0,3,NULL),(4395,'开阳县',406,0,3,NULL),(4396,'息烽县',406,0,3,NULL),(4397,'清镇市',406,0,3,NULL),(4398,'白云区',406,0,3,NULL),(4399,'花溪区',406,0,3,NULL),(4400,'六枝特区',407,0,3,NULL),(4401,'水城县',407,0,3,NULL),(4402,'盘县',407,0,3,NULL),(4403,'钟山区',407,0,3,NULL),(4404,'习水县',408,0,3,NULL),(4405,'仁怀市',408,0,3,NULL),(4406,'余庆县',408,0,3,NULL),(4407,'凤冈县',408,0,3,NULL),(4408,'务川仡佬族苗族自治县',408,0,3,NULL),(4409,'桐梓县',408,0,3,NULL),(4410,'正安县',408,0,3,NULL),(4411,'汇川区',408,0,3,NULL),(4412,'湄潭县',408,0,3,NULL),(4413,'红花岗区',408,0,3,NULL),(4414,'绥阳县',408,0,3,NULL),(4415,'赤水市',408,0,3,NULL),(4416,'道真仡佬族苗族自治县',408,0,3,NULL),(4417,'遵义县',408,0,3,NULL),(4418,'关岭布依族苗族自治县',409,0,3,NULL),(4419,'平坝县',409,0,3,NULL),(4420,'普定县',409,0,3,NULL),(4421,'紫云苗族布依族自治县',409,0,3,NULL),(4422,'西秀区',409,0,3,NULL),(4423,'镇宁布依族苗族自治县',409,0,3,NULL),(4424,'万山特区',410,0,3,NULL),(4425,'印江土家族苗族自治县',410,0,3,NULL),(4426,'德江县',410,0,3,NULL),(4427,'思南县',410,0,3,NULL),(4428,'松桃苗族自治县',410,0,3,NULL),(4429,'江口县',410,0,3,NULL),(4430,'沿河土家族自治县',410,0,3,NULL),(4431,'玉屏侗族自治县',410,0,3,NULL),(4432,'石阡县',410,0,3,NULL),(4433,'铜仁市',410,0,3,NULL),(4434,'兴义市',411,0,3,NULL),(4435,'兴仁县',411,0,3,NULL),(4436,'册亨县',411,0,3,NULL),(4437,'安龙县',411,0,3,NULL),(4438,'普安县',411,0,3,NULL),(4439,'晴隆县',411,0,3,NULL),(4440,'望谟县',411,0,3,NULL),(4441,'贞丰县',411,0,3,NULL),(4442,'大方县',412,0,3,NULL),(4443,'威宁彝族回族苗族自治县',412,0,3,NULL),(4444,'毕节市',412,0,3,NULL),(4445,'纳雍县',412,0,3,NULL),(4446,'织金县',412,0,3,NULL),(4447,'赫章县',412,0,3,NULL),(4448,'金沙县',412,0,3,NULL),(4449,'黔西县',412,0,3,NULL),(4450,'三穗县',413,0,3,NULL),(4451,'丹寨县',413,0,3,NULL),(4452,'从江县',413,0,3,NULL),(4453,'凯里市',413,0,3,NULL),(4454,'剑河县',413,0,3,NULL),(4455,'台江县',413,0,3,NULL),(4456,'天柱县',413,0,3,NULL),(4457,'岑巩县',413,0,3,NULL),(4458,'施秉县',413,0,3,NULL),(4459,'榕江县',413,0,3,NULL),(4460,'锦屏县',413,0,3,NULL),(4461,'镇远县',413,0,3,NULL),(4462,'雷山县',413,0,3,NULL),(4463,'麻江县',413,0,3,NULL),(4464,'黄平县',413,0,3,NULL),(4465,'黎平县',413,0,3,NULL),(4466,'三都水族自治县',414,0,3,NULL),(4467,'平塘县',414,0,3,NULL),(4468,'惠水县',414,0,3,NULL),(4469,'独山县',414,0,3,NULL),(4470,'瓮安县',414,0,3,NULL),(4471,'福泉市',414,0,3,NULL),(4472,'罗甸县',414,0,3,NULL),(4473,'荔波县',414,0,3,NULL),(4474,'贵定县',414,0,3,NULL),(4475,'都匀市',414,0,3,NULL),(4476,'长顺县',414,0,3,NULL),(4477,'龙里县',414,0,3,NULL),(4478,'东川区',415,0,3,NULL),(4479,'五华区',415,0,3,NULL),(4480,'呈贡县',415,0,3,NULL),(4481,'安宁市',415,0,3,NULL),(4482,'官渡区',415,0,3,NULL),(4483,'宜良县',415,0,3,NULL),(4484,'富民县',415,0,3,NULL),(4485,'寻甸回族彝族自治县',415,0,3,NULL),(4486,'嵩明县',415,0,3,NULL),(4487,'晋宁县',415,0,3,NULL),(4488,'盘龙区',415,0,3,NULL),(4489,'石林彝族自治县',415,0,3,NULL),(4490,'禄劝彝族苗族自治县',415,0,3,NULL),(4491,'西山区',415,0,3,NULL),(4492,'会泽县',416,0,3,NULL),(4493,'宣威市',416,0,3,NULL),(4494,'富源县',416,0,3,NULL),(4495,'师宗县',416,0,3,NULL),(4496,'沾益县',416,0,3,NULL),(4497,'罗平县',416,0,3,NULL),(4498,'陆良县',416,0,3,NULL),(4499,'马龙县',416,0,3,NULL),(4500,'麒麟区',416,0,3,NULL),(4501,'元江哈尼族彝族傣族自治县',417,0,3,NULL),(4502,'华宁县',417,0,3,NULL),(4503,'峨山彝族自治县',417,0,3,NULL),(4504,'新平彝族傣族自治县',417,0,3,NULL),(4505,'易门县',417,0,3,NULL),(4506,'江川县',417,0,3,NULL),(4507,'澄江县',417,0,3,NULL),(4508,'红塔区',417,0,3,NULL),(4509,'通海县',417,0,3,NULL),(4510,'施甸县',418,0,3,NULL),(4511,'昌宁县',418,0,3,NULL),(4512,'腾冲县',418,0,3,NULL),(4513,'隆阳区',418,0,3,NULL),(4514,'龙陵县',418,0,3,NULL),(4515,'大关县',419,0,3,NULL),(4516,'威信县',419,0,3,NULL),(4517,'巧家县',419,0,3,NULL),(4518,'彝良县',419,0,3,NULL),(4519,'昭阳区',419,0,3,NULL),(4520,'水富县',419,0,3,NULL),(4521,'永善县',419,0,3,NULL),(4522,'盐津县',419,0,3,NULL),(4523,'绥江县',419,0,3,NULL),(4524,'镇雄县',419,0,3,NULL),(4525,'鲁甸县',419,0,3,NULL),(4526,'华坪县',420,0,3,NULL),(4527,'古城区',420,0,3,NULL),(4528,'宁蒗彝族自治县',420,0,3,NULL),(4529,'永胜县',420,0,3,NULL),(4530,'玉龙纳西族自治县',420,0,3,NULL),(4531,'临翔区',422,0,3,NULL),(4532,'云县',422,0,3,NULL),(4533,'凤庆县',422,0,3,NULL),(4534,'双江拉祜族佤族布朗族傣族自治县',422,0,3,NULL),(4535,'永德县',422,0,3,NULL),(4536,'沧源佤族自治县',422,0,3,NULL),(4537,'耿马傣族佤族自治县',422,0,3,NULL),(4538,'镇康县',422,0,3,NULL),(4539,'元谋县',423,0,3,NULL),(4540,'南华县',423,0,3,NULL),(4541,'双柏县',423,0,3,NULL),(4542,'大姚县',423,0,3,NULL),(4543,'姚安县',423,0,3,NULL),(4544,'楚雄市',423,0,3,NULL),(4545,'武定县',423,0,3,NULL),(4546,'永仁县',423,0,3,NULL),(4547,'牟定县',423,0,3,NULL),(4548,'禄丰县',423,0,3,NULL),(4549,'个旧市',424,0,3,NULL),(4550,'元阳县',424,0,3,NULL),(4551,'屏边苗族自治县',424,0,3,NULL),(4552,'建水县',424,0,3,NULL),(4553,'开远市',424,0,3,NULL),(4554,'弥勒县',424,0,3,NULL),(4555,'河口瑶族自治县',424,0,3,NULL),(4556,'泸西县',424,0,3,NULL),(4557,'石屏县',424,0,3,NULL),(4558,'红河县',424,0,3,NULL),(4559,'绿春县',424,0,3,NULL),(4560,'蒙自县',424,0,3,NULL),(4561,'金平苗族瑶族傣族自治县',424,0,3,NULL),(4562,'丘北县',425,0,3,NULL),(4563,'富宁县',425,0,3,NULL),(4564,'广南县',425,0,3,NULL),(4565,'文山县',425,0,3,NULL),(4566,'砚山县',425,0,3,NULL),(4567,'西畴县',425,0,3,NULL),(4568,'马关县',425,0,3,NULL),(4569,'麻栗坡县',425,0,3,NULL),(4570,'勐海县',426,0,3,NULL),(4571,'勐腊县',426,0,3,NULL),(4572,'景洪市',426,0,3,NULL),(4573,'云龙县',427,0,3,NULL),(4574,'剑川县',427,0,3,NULL),(4575,'南涧彝族自治县',427,0,3,NULL),(4576,'大理市',427,0,3,NULL),(4577,'宾川县',427,0,3,NULL),(4578,'巍山彝族回族自治县',427,0,3,NULL),(4579,'弥渡县',427,0,3,NULL),(4580,'永平县',427,0,3,NULL),(4581,'洱源县',427,0,3,NULL),(4582,'漾濞彝族自治县',427,0,3,NULL),(4583,'祥云县',427,0,3,NULL),(4584,'鹤庆县',427,0,3,NULL),(4585,'梁河县',428,0,3,NULL),(4586,'潞西市',428,0,3,NULL),(4587,'瑞丽市',428,0,3,NULL),(4588,'盈江县',428,0,3,NULL),(4589,'陇川县',428,0,3,NULL),(4590,'德钦县',430,0,3,NULL),(4591,'维西傈僳族自治县',430,0,3,NULL),(4592,'香格里拉县',430,0,3,NULL),(4593,'城关区',431,0,3,NULL),(4594,'堆龙德庆县',431,0,3,NULL),(4595,'墨竹工卡县',431,0,3,NULL),(4596,'尼木县',431,0,3,NULL),(4597,'当雄县',431,0,3,NULL),(4598,'曲水县',431,0,3,NULL),(4599,'林周县',431,0,3,NULL),(4600,'达孜县',431,0,3,NULL),(4601,'丁青县',432,0,3,NULL),(4602,'八宿县',432,0,3,NULL),(4603,'察雅县',432,0,3,NULL),(4604,'左贡县',432,0,3,NULL),(4605,'昌都县',432,0,3,NULL),(4606,'江达县',432,0,3,NULL),(4607,'洛隆县',432,0,3,NULL),(4608,'类乌齐县',432,0,3,NULL),(4609,'芒康县',432,0,3,NULL),(4610,'贡觉县',432,0,3,NULL),(4611,'边坝县',432,0,3,NULL),(4612,'乃东县',433,0,3,NULL),(4613,'加查县',433,0,3,NULL),(4614,'扎囊县',433,0,3,NULL),(4615,'措美县',433,0,3,NULL),(4616,'曲松县',433,0,3,NULL),(4617,'桑日县',433,0,3,NULL),(4618,'洛扎县',433,0,3,NULL),(4619,'浪卡子县',433,0,3,NULL),(4620,'琼结县',433,0,3,NULL),(4621,'贡嘎县',433,0,3,NULL),(4622,'错那县',433,0,3,NULL),(4623,'隆子县',433,0,3,NULL),(4624,'亚东县',434,0,3,NULL),(4625,'仁布县',434,0,3,NULL),(4626,'仲巴县',434,0,3,NULL),(4627,'南木林县',434,0,3,NULL),(4628,'吉隆县',434,0,3,NULL),(4629,'定日县',434,0,3,NULL),(4630,'定结县',434,0,3,NULL),(4631,'岗巴县',434,0,3,NULL),(4632,'康马县',434,0,3,NULL),(4633,'拉孜县',434,0,3,NULL),(4634,'日喀则市',434,0,3,NULL),(4635,'昂仁县',434,0,3,NULL),(4636,'江孜县',434,0,3,NULL),(4637,'白朗县',434,0,3,NULL),(4638,'聂拉木县',434,0,3,NULL),(4639,'萨嘎县',434,0,3,NULL),(4640,'萨迦县',434,0,3,NULL),(4641,'谢通门县',434,0,3,NULL),(4642,'嘉黎县',435,0,3,NULL),(4643,'安多县',435,0,3,NULL),(4644,'尼玛县',435,0,3,NULL),(4645,'巴青县',435,0,3,NULL),(4646,'比如县',435,0,3,NULL),(4647,'班戈县',435,0,3,NULL),(4648,'申扎县',435,0,3,NULL),(4649,'索县',435,0,3,NULL),(4650,'聂荣县',435,0,3,NULL),(4651,'那曲县',435,0,3,NULL),(4652,'噶尔县',436,0,3,NULL),(4653,'措勤县',436,0,3,NULL),(4654,'改则县',436,0,3,NULL),(4655,'日土县',436,0,3,NULL),(4656,'普兰县',436,0,3,NULL),(4657,'札达县',436,0,3,NULL),(4658,'革吉县',436,0,3,NULL),(4659,'墨脱县',437,0,3,NULL),(4660,'察隅县',437,0,3,NULL),(4661,'工布江达县',437,0,3,NULL),(4662,'朗县',437,0,3,NULL),(4663,'林芝县',437,0,3,NULL),(4664,'波密县',437,0,3,NULL),(4665,'米林县',437,0,3,NULL),(4666,'临潼区',438,0,3,NULL),(4667,'周至县',438,0,3,NULL),(4668,'户县',438,0,3,NULL),(4669,'新城区',438,0,3,NULL),(4670,'未央区',438,0,3,NULL),(4671,'灞桥区',438,0,3,NULL),(4672,'碑林区',438,0,3,NULL),(4673,'莲湖区',438,0,3,NULL),(4674,'蓝田县',438,0,3,NULL),(4675,'长安区',438,0,3,NULL),(4676,'阎良区',438,0,3,NULL),(4677,'雁塔区',438,0,3,NULL),(4678,'高陵县',438,0,3,NULL),(4679,'印台区',439,0,3,NULL),(4680,'宜君县',439,0,3,NULL),(4681,'王益区',439,0,3,NULL),(4682,'耀州区',439,0,3,NULL),(4683,'凤县',440,0,3,NULL),(4684,'凤翔县',440,0,3,NULL),(4685,'千阳县',440,0,3,NULL),(4686,'太白县',440,0,3,NULL),(4687,'岐山县',440,0,3,NULL),(4688,'扶风县',440,0,3,NULL),(4689,'渭滨区',440,0,3,NULL),(4690,'眉县',440,0,3,NULL),(4691,'金台区',440,0,3,NULL),(4692,'陇县',440,0,3,NULL),(4693,'陈仓区',440,0,3,NULL),(4694,'麟游县',440,0,3,NULL),(4695,'三原县',441,0,3,NULL),(4696,'干县',441,0,3,NULL),(4697,'兴平市',441,0,3,NULL),(4698,'彬县',441,0,3,NULL),(4699,'旬邑县',441,0,3,NULL),(4700,'杨陵区',441,0,3,NULL),(4701,'武功县',441,0,3,NULL),(4702,'永寿县',441,0,3,NULL),(4703,'泾阳县',441,0,3,NULL),(4704,'淳化县',441,0,3,NULL),(4705,'渭城区',441,0,3,NULL),(4706,'礼泉县',441,0,3,NULL),(4707,'秦都区',441,0,3,NULL),(4708,'长武县',441,0,3,NULL),(4709,'临渭区',442,0,3,NULL),(4710,'华县',442,0,3,NULL),(4711,'华阴市',442,0,3,NULL),(4712,'合阳县',442,0,3,NULL),(4713,'大荔县',442,0,3,NULL),(4714,'富平县',442,0,3,NULL),(4715,'潼关县',442,0,3,NULL),(4716,'澄城县',442,0,3,NULL),(4717,'白水县',442,0,3,NULL),(4718,'蒲城县',442,0,3,NULL),(4719,'韩城市',442,0,3,NULL),(4720,'吴起县',443,0,3,NULL),(4721,'子长县',443,0,3,NULL),(4722,'安塞县',443,0,3,NULL),(4723,'宜川县',443,0,3,NULL),(4724,'宝塔区',443,0,3,NULL),(4725,'富县',443,0,3,NULL),(4726,'延川县',443,0,3,NULL),(4727,'延长县',443,0,3,NULL),(4728,'志丹县',443,0,3,NULL),(4729,'洛川县',443,0,3,NULL),(4730,'甘泉县',443,0,3,NULL),(4731,'黄陵县',443,0,3,NULL),(4732,'黄龙县',443,0,3,NULL),(4733,'佛坪县',444,0,3,NULL),(4734,'勉县',444,0,3,NULL),(4735,'南郑县',444,0,3,NULL),(4736,'城固县',444,0,3,NULL),(4737,'宁强县',444,0,3,NULL),(4738,'汉台区',444,0,3,NULL),(4739,'洋县',444,0,3,NULL),(4740,'留坝县',444,0,3,NULL),(4741,'略阳县',444,0,3,NULL),(4742,'西乡县',444,0,3,NULL),(4743,'镇巴县',444,0,3,NULL),(4744,'佳县',445,0,3,NULL),(4745,'吴堡县',445,0,3,NULL),(4746,'子洲县',445,0,3,NULL),(4747,'定边县',445,0,3,NULL),(4748,'府谷县',445,0,3,NULL),(4749,'榆林市榆阳区',445,0,3,NULL),(4750,'横山县',445,0,3,NULL),(4751,'清涧县',445,0,3,NULL),(4752,'神木县',445,0,3,NULL),(4753,'米脂县',445,0,3,NULL),(4754,'绥德县',445,0,3,NULL),(4755,'靖边县',445,0,3,NULL),(4756,'宁陕县',446,0,3,NULL),(4757,'岚皋县',446,0,3,NULL),(4758,'平利县',446,0,3,NULL),(4759,'旬阳县',446,0,3,NULL),(4760,'汉滨区',446,0,3,NULL),(4761,'汉阴县',446,0,3,NULL),(4762,'白河县',446,0,3,NULL),(4763,'石泉县',446,0,3,NULL),(4764,'紫阳县',446,0,3,NULL),(4765,'镇坪县',446,0,3,NULL),(4766,'丹凤县',447,0,3,NULL),(4767,'商南县',447,0,3,NULL),(4768,'商州区',447,0,3,NULL),(4769,'山阳县',447,0,3,NULL),(4770,'柞水县',447,0,3,NULL),(4771,'洛南县',447,0,3,NULL),(4772,'镇安县',447,0,3,NULL),(4773,'七里河区',448,0,3,NULL),(4774,'城关区',448,0,3,NULL),(4775,'安宁区',448,0,3,NULL),(4776,'榆中县',448,0,3,NULL),(4777,'永登县',448,0,3,NULL),(4778,'皋兰县',448,0,3,NULL),(4779,'红古区',448,0,3,NULL),(4780,'西固区',448,0,3,NULL),(4781,'嘉峪关市',449,0,3,NULL),(4782,'永昌县',450,0,3,NULL),(4783,'金川区',450,0,3,NULL),(4784,'会宁县',451,0,3,NULL),(4785,'平川区',451,0,3,NULL),(4786,'景泰县',451,0,3,NULL),(4787,'白银区',451,0,3,NULL),(4788,'靖远县',451,0,3,NULL),(4789,'张家川回族自治县',452,0,3,NULL),(4790,'武山县',452,0,3,NULL),(4791,'清水县',452,0,3,NULL),(4792,'甘谷县',452,0,3,NULL),(4793,'秦安县',452,0,3,NULL),(4794,'秦州区',452,0,3,NULL),(4795,'麦积区',452,0,3,NULL),(4796,'凉州区',453,0,3,NULL),(4797,'古浪县',453,0,3,NULL),(4798,'天祝藏族自治县',453,0,3,NULL),(4799,'民勤县',453,0,3,NULL),(4800,'临泽县',454,0,3,NULL),(4801,'山丹县',454,0,3,NULL),(4802,'民乐县',454,0,3,NULL),(4803,'甘州区',454,0,3,NULL),(4804,'肃南裕固族自治县',454,0,3,NULL),(4805,'高台县',454,0,3,NULL),(4806,'华亭县',455,0,3,NULL),(4807,'崆峒区',455,0,3,NULL),(4808,'崇信县',455,0,3,NULL),(4809,'庄浪县',455,0,3,NULL),(4810,'泾川县',455,0,3,NULL),(4811,'灵台县',455,0,3,NULL),(4812,'静宁县',455,0,3,NULL),(4813,'敦煌市',456,0,3,NULL),(4814,'玉门市',456,0,3,NULL),(4815,'瓜州县（原安西县）',456,0,3,NULL),(4816,'肃北蒙古族自治县',456,0,3,NULL),(4817,'肃州区',456,0,3,NULL),(4818,'金塔县',456,0,3,NULL),(4819,'阿克塞哈萨克族自治县',456,0,3,NULL),(4820,'华池县',457,0,3,NULL),(4821,'合水县',457,0,3,NULL),(4822,'宁县',457,0,3,NULL),(4823,'庆城县',457,0,3,NULL),(4824,'正宁县',457,0,3,NULL),(4825,'环县',457,0,3,NULL),(4826,'西峰区',457,0,3,NULL),(4827,'镇原县',457,0,3,NULL),(4828,'临洮县',458,0,3,NULL),(4829,'安定区',458,0,3,NULL),(4830,'岷县',458,0,3,NULL),(4831,'渭源县',458,0,3,NULL),(4832,'漳县',458,0,3,NULL),(4833,'通渭县',458,0,3,NULL),(4834,'陇西县',458,0,3,NULL),(4835,'两当县',459,0,3,NULL),(4836,'宕昌县',459,0,3,NULL),(4837,'康县',459,0,3,NULL),(4838,'徽县',459,0,3,NULL),(4839,'成县',459,0,3,NULL),(4840,'文县',459,0,3,NULL),(4841,'武都区',459,0,3,NULL),(4842,'礼县',459,0,3,NULL),(4843,'西和县',459,0,3,NULL),(4844,'东乡族自治县',460,0,3,NULL),(4845,'临夏县',460,0,3,NULL),(4846,'临夏市',460,0,3,NULL),(4847,'和政县',460,0,3,NULL),(4848,'广河县',460,0,3,NULL),(4849,'康乐县',460,0,3,NULL),(4850,'永靖县',460,0,3,NULL),(4851,'积石山保安族东乡族撒拉族自治县',460,0,3,NULL),(4852,'临潭县',461,0,3,NULL),(4853,'卓尼县',461,0,3,NULL),(4854,'合作市',461,0,3,NULL),(4855,'夏河县',461,0,3,NULL),(4856,'玛曲县',461,0,3,NULL),(4857,'碌曲县',461,0,3,NULL),(4858,'舟曲县',461,0,3,NULL),(4859,'迭部县',461,0,3,NULL),(4860,'城东区',462,0,3,NULL),(4861,'城中区',462,0,3,NULL),(4862,'城北区',462,0,3,NULL),(4863,'城西区',462,0,3,NULL),(4864,'大通回族土族自治县',462,0,3,NULL),(4865,'湟中县',462,0,3,NULL),(4866,'湟源县',462,0,3,NULL),(4867,'乐都县',463,0,3,NULL),(4868,'互助土族自治县',463,0,3,NULL),(4869,'化隆回族自治县',463,0,3,NULL),(4870,'平安县',463,0,3,NULL),(4871,'循化撒拉族自治县',463,0,3,NULL),(4872,'民和回族土族自治县',463,0,3,NULL),(4873,'刚察县',464,0,3,NULL),(4874,'海晏县',464,0,3,NULL),(4875,'祁连县',464,0,3,NULL),(4876,'门源回族自治县',464,0,3,NULL),(4877,'同仁县',465,0,3,NULL),(4878,'尖扎县',465,0,3,NULL),(4879,'河南蒙古族自治县',465,0,3,NULL),(4880,'泽库县',465,0,3,NULL),(4881,'共和县',466,0,3,NULL),(4882,'兴海县',466,0,3,NULL),(4883,'同德县',466,0,3,NULL),(4884,'贵南县',466,0,3,NULL),(4885,'贵德县',466,0,3,NULL),(4886,'久治县',467,0,3,NULL),(4887,'玛多县',467,0,3,NULL),(4888,'玛沁县',467,0,3,NULL),(4889,'班玛县',467,0,3,NULL),(4890,'甘德县',467,0,3,NULL),(4891,'达日县',467,0,3,NULL),(4892,'囊谦县',468,0,3,NULL),(4893,'曲麻莱县',468,0,3,NULL),(4894,'杂多县',468,0,3,NULL),(4895,'治多县',468,0,3,NULL),(4896,'玉树县',468,0,3,NULL),(4897,'称多县',468,0,3,NULL),(4898,'乌兰县',469,0,3,NULL),(4899,'冷湖行委',469,0,3,NULL),(4900,'大柴旦行委',469,0,3,NULL),(4901,'天峻县',469,0,3,NULL),(4902,'德令哈市',469,0,3,NULL),(4903,'格尔木市',469,0,3,NULL),(4904,'茫崖行委',469,0,3,NULL),(4905,'都兰县',469,0,3,NULL),(4906,'兴庆区',470,0,3,NULL),(4907,'永宁县',470,0,3,NULL),(4908,'灵武市',470,0,3,NULL),(4909,'西夏区',470,0,3,NULL),(4910,'贺兰县',470,0,3,NULL),(4911,'金凤区',470,0,3,NULL),(4912,'大武口区',471,0,3,NULL),(4913,'平罗县',471,0,3,NULL),(4914,'惠农区',471,0,3,NULL),(4915,'利通区',472,0,3,NULL),(4916,'同心县',472,0,3,NULL),(4917,'盐池县',472,0,3,NULL),(4918,'青铜峡市',472,0,3,NULL),(4919,'原州区',473,0,3,NULL),(4920,'彭阳县',473,0,3,NULL),(4921,'泾源县',473,0,3,NULL),(4922,'西吉县',473,0,3,NULL),(4923,'隆德县',473,0,3,NULL),(4924,'中宁县',474,0,3,NULL),(4925,'沙坡头区',474,0,3,NULL),(4926,'海原县',474,0,3,NULL),(4927,'东山区',475,0,3,NULL),(4928,'乌鲁木齐县',475,0,3,NULL),(4929,'天山区',475,0,3,NULL),(4930,'头屯河区',475,0,3,NULL),(4931,'新市区',475,0,3,NULL),(4932,'水磨沟区',475,0,3,NULL),(4933,'沙依巴克区',475,0,3,NULL),(4934,'达坂城区',475,0,3,NULL),(4935,'乌尔禾区',476,0,3,NULL),(4936,'克拉玛依区',476,0,3,NULL),(4937,'独山子区',476,0,3,NULL),(4938,'白碱滩区',476,0,3,NULL),(4939,'吐鲁番市',477,0,3,NULL),(4940,'托克逊县',477,0,3,NULL),(4941,'鄯善县',477,0,3,NULL),(4942,'伊吾县',478,0,3,NULL),(4943,'哈密市',478,0,3,NULL),(4944,'巴里坤哈萨克自治县',478,0,3,NULL),(4945,'吉木萨尔县',479,0,3,NULL),(4946,'呼图壁县',479,0,3,NULL),(4947,'奇台县',479,0,3,NULL),(4948,'昌吉市',479,0,3,NULL),(4949,'木垒哈萨克自治县',479,0,3,NULL),(4950,'玛纳斯县',479,0,3,NULL),(4951,'米泉市',479,0,3,NULL),(4952,'阜康市',479,0,3,NULL),(4953,'博乐市',480,0,3,NULL),(4954,'温泉县',480,0,3,NULL),(4955,'精河县',480,0,3,NULL),(4956,'博湖县',481,0,3,NULL),(4957,'和硕县',481,0,3,NULL),(4958,'和静县',481,0,3,NULL),(4959,'尉犁县',481,0,3,NULL),(4960,'库尔勒市',481,0,3,NULL),(4961,'焉耆回族自治县',481,0,3,NULL),(4962,'若羌县',481,0,3,NULL),(4963,'轮台县',481,0,3,NULL),(4964,'乌什县',482,0,3,NULL),(4965,'库车县',482,0,3,NULL),(4966,'拜城县',482,0,3,NULL),(4967,'新和县',482,0,3,NULL),(4968,'柯坪县',482,0,3,NULL),(4969,'沙雅县',482,0,3,NULL),(4970,'温宿县',482,0,3,NULL),(4971,'阿克苏市',482,0,3,NULL),(4972,'阿瓦提县',482,0,3,NULL),(4973,'乌恰县',483,0,3,NULL),(4974,'阿克陶县',483,0,3,NULL),(4975,'阿合奇县',483,0,3,NULL),(4976,'阿图什市',483,0,3,NULL),(4977,'伽师县',484,0,3,NULL),(4978,'叶城县',484,0,3,NULL),(4979,'喀什市',484,0,3,NULL),(4980,'塔什库尔干塔吉克自治县',484,0,3,NULL),(4981,'岳普湖县',484,0,3,NULL),(4982,'巴楚县',484,0,3,NULL),(4983,'泽普县',484,0,3,NULL),(4984,'疏勒县',484,0,3,NULL),(4985,'疏附县',484,0,3,NULL),(4986,'英吉沙县',484,0,3,NULL),(4987,'莎车县',484,0,3,NULL),(4988,'麦盖提县',484,0,3,NULL),(4989,'于田县',485,0,3,NULL),(4990,'和田县',485,0,3,NULL),(4991,'和田市',485,0,3,NULL),(4992,'墨玉县',485,0,3,NULL),(4993,'民丰县',485,0,3,NULL),(4994,'洛浦县',485,0,3,NULL),(4995,'皮山县',485,0,3,NULL),(4996,'策勒县',485,0,3,NULL),(4997,'伊宁县',486,0,3,NULL),(4998,'伊宁市',486,0,3,NULL),(4999,'奎屯市',486,0,3,NULL),(5000,'察布查尔锡伯自治县',486,0,3,NULL),(5001,'尼勒克县',486,0,3,NULL),(5002,'巩留县',486,0,3,NULL),(5003,'新源县',486,0,3,NULL),(5004,'昭苏县',486,0,3,NULL),(5005,'特克斯县',486,0,3,NULL),(5006,'霍城县',486,0,3,NULL),(5007,'乌苏市',487,0,3,NULL),(5008,'和布克赛尔蒙古自治县',487,0,3,NULL),(5009,'塔城市',487,0,3,NULL),(5010,'托里县',487,0,3,NULL),(5011,'沙湾县',487,0,3,NULL),(5012,'裕民县',487,0,3,NULL),(5013,'额敏县',487,0,3,NULL),(5014,'吉木乃县',488,0,3,NULL),(5015,'哈巴河县',488,0,3,NULL),(5016,'富蕴县',488,0,3,NULL),(5017,'布尔津县',488,0,3,NULL),(5018,'福海县',488,0,3,NULL),(5019,'阿勒泰市',488,0,3,NULL),(5020,'青河县',488,0,3,NULL),(5021,'石河子市',489,0,3,NULL),(5022,'阿拉尔市',490,0,3,NULL),(5023,'图木舒克市',491,0,3,NULL),(5024,'五家渠市',492,0,3,NULL),(45055,'海外',35,0,2,NULL);
/*!40000 ALTER TABLE `ds_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_arrivalnotice`
--

DROP TABLE IF EXISTS `ds_arrivalnotice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_arrivalnotice` (
  `arrivalnotice_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '到货通知自增ID',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `arrivalnotice_addtime` int(10) unsigned NOT NULL COMMENT '到货通知添加时间',
  `arrivalnotice_email` varchar(100) NOT NULL COMMENT '邮箱',
  `arrivalnotice_mobile` varchar(11) NOT NULL COMMENT '手机号',
  `arrivalnotice_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1:到货通知 2:预售',
  `arrivalnotice_state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '到货通知状态 1:未通知 2:已通知',
  `arrivalnotice_time` int(10) DEFAULT '0' COMMENT '通知时间',
  PRIMARY KEY (`arrivalnotice_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品到货通知表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_arrivalnotice`
--

LOCK TABLES `ds_arrivalnotice` WRITE;
/*!40000 ALTER TABLE `ds_arrivalnotice` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_arrivalnotice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_article`
--

DROP TABLE IF EXISTS `ds_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章自增ID',
  `ac_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `article_url` varchar(100) DEFAULT NULL COMMENT '文章跳转链接',
  `article_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文章是否显示，0为否，1为是，默认为1',
  `article_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '文章排序',
  `article_title` varchar(100) DEFAULT NULL COMMENT '文章标题',
  `article_content` text COMMENT '内容',
  `article_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章发布时间',
  `article_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '文章主图',
  PRIMARY KEY (`article_id`),
  KEY `ac_id` (`ac_id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_article`
--

LOCK TABLES `ds_article` WRITE;
/*!40000 ALTER TABLE `ds_article` DISABLE KEYS */;
INSERT INTO `ds_article` VALUES (6,2,'',1,255,'如何注册成为会员','如何注册成为会员',1435672310,''),(7,2,'',1,255,'如何搜索','如何搜索',1435672310,''),(8,2,'',1,255,'忘记密码','忘记密码',1435672310,''),(9,2,'',1,255,'我要买','我要买',1435672310,''),(10,2,'',1,255,'查看已购买商品','查看已购买商品',1435672310,''),(11,3,'',1,255,'如何管理店铺','如何管理店铺',1435672310,''),(12,3,'',1,255,'查看售出商品','查看售出商品',1435672310,''),(13,3,'',1,255,'如何发货','如何发货',1435672310,''),(14,3,'',1,255,'商城商品推荐','商城商品推荐',1435672310,''),(15,3,'',1,255,'如何申请开店','如何申请开店',1435672310,''),(16,4,'',1,255,'在线充值','&lt;p&gt;如何在线充值&lt;/p&gt;',1605605834,''),(18,6,'',1,255,'会员修改密码','会员修改密码',1435672310,''),(19,6,'',1,255,'会员修改个人资料','会员修改个人资料',1435672310,''),(20,6,'',1,255,'商品发布','商品发布',1435672310,''),(21,6,'',1,255,'修改收货地址','修改收货地址',1435672310,''),(22,7,'',1,255,'关于我们','关于我们',1435672310,''),(23,7,'',1,255,'联系我们','联系我们',1435672310,''),(24,7,'',1,255,'招聘英才','招聘英才',1435672310,''),(25,7,'',1,255,'合作及洽谈','合作及洽谈',1435672310,''),(26,5,'',1,255,'联系卖家','联系卖家',1435672310,''),(31,5,'',1,255,'退换货政策','退换货政策',1435672310,''),(32,5,'',1,255,'退换货流程','退换货流程',1435672310,''),(33,5,'',1,255,'返修/退换货','返修/退换货',1435672310,''),(34,5,'',1,255,'退款申请','退款申请',1435672310,''),(35,1,'',1,1,'火爆销售中','&lt;p&gt;火爆销售中&lt;br/&gt;&lt;/p&gt;',1610591228,'5fffabfca722a.jpg'),(36,1,'',1,255,'管理功能说明','&lt;p&gt;管理功能说明&lt;/p&gt;',1610591346,'5fffac7216b72.jpg'),(37,1,'',1,255,'如何扩充水印字体库','&lt;p&gt;如何扩充水印字体库&lt;/p&gt;',1610591283,'5fffac3320cb4.jpg'),(38,1,'',1,255,'提示信息','提示信息',1435672310,''),(39,2,'',1,255,'积分细则','积分细则积分细则',1435672310,''),(40,2,'',1,255,'积分兑换说明','积分兑换说明',1435672310,''),(41,1,'',1,255,'功能使用说明','&lt;p&gt;功能使用说明&lt;/p&gt;',1610591368,'5fffac88d5345.jpg');
/*!40000 ALTER TABLE `ds_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_articleclass`
--

DROP TABLE IF EXISTS `ds_articleclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_articleclass` (
  `ac_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章分类自增ID',
  `ac_code` varchar(20) DEFAULT NULL COMMENT '文章分类标识码',
  `ac_name` varchar(100) NOT NULL COMMENT '文章分类名称',
  `ac_parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章分类父ID',
  `ac_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '文章分类排序',
  PRIMARY KEY (`ac_id`),
  KEY `ac_parent_id` (`ac_parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='文章分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_articleclass`
--

LOCK TABLES `ds_articleclass` WRITE;
/*!40000 ALTER TABLE `ds_articleclass` DISABLE KEYS */;
INSERT INTO `ds_articleclass` VALUES (1,'notice','商城公告',0,255),(2,'member','帮助中心',0,255),(3,'store','店主之家',0,255),(4,'payment','支付方式',0,255),(5,'sold','售后服务',0,255),(6,'service','客服中心',0,255),(7,'about','关于我们',0,255);
/*!40000 ALTER TABLE `ds_articleclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_attribute`
--

DROP TABLE IF EXISTS `ds_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_attribute` (
  `attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性自增ID',
  `attr_name` varchar(100) NOT NULL COMMENT '属性名称',
  `type_id` int(10) unsigned NOT NULL COMMENT '所属类型id',
  `attr_value` text NOT NULL COMMENT '属性值',
  `attr_show` tinyint(1) unsigned NOT NULL COMMENT '属性是否显示。0不显示、1显示',
  `attr_sort` tinyint(1) unsigned NOT NULL COMMENT '属性排序',
  PRIMARY KEY (`attr_id`),
  KEY `attr_id` (`attr_id`,`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_attribute`
--

LOCK TABLES `ds_attribute` WRITE;
/*!40000 ALTER TABLE `ds_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_attributevalue`
--

DROP TABLE IF EXISTS `ds_attributevalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_attributevalue` (
  `attrvalue_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性值id',
  `attrvalue_name` varchar(100) NOT NULL COMMENT '属性值名称',
  `attr_id` int(10) unsigned NOT NULL COMMENT '所属属性id',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `attrvalue_sort` tinyint(1) unsigned NOT NULL COMMENT '属性值排序',
  PRIMARY KEY (`attrvalue_id`),
  KEY `attr_id` (`attr_id`),
  KEY `type_id` (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品属性值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_attributevalue`
--

LOCK TABLES `ds_attributevalue` WRITE;
/*!40000 ALTER TABLE `ds_attributevalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_attributevalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_banks`
--

DROP TABLE IF EXISTS `ds_banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_banks` (
  `banks_id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '银行自增ID',
  `banks_name` varchar(100) DEFAULT '' COMMENT '银行名称',
  `banks_pic` varchar(100) DEFAULT '' COMMENT '银行图片',
  `banks_url` varchar(100) NOT NULL DEFAULT '' COMMENT '银行官网地址',
  `banks_sort` tinyint(3) unsigned DEFAULT '255' COMMENT '排序',
  `banks_state` tinyint(1) DEFAULT '1' COMMENT '状态 0表示隐藏 1表示显示',
  `banks_apply` tinyint(1) DEFAULT '1' COMMENT '审核',
  PRIMARY KEY (`banks_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_banks`
--

LOCK TABLES `ds_banks` WRITE;
/*!40000 ALTER TABLE `ds_banks` DISABLE KEYS */;
INSERT INTO `ds_banks` VALUES (1,'银行1','5d3c18344bb6c.jpg','http://www.baidu.com/',255,1,1),(2,'银行2','5d3c1841e8213.jpg','http://www.baidu.com/',255,1,1),(3,'银行3','5d3c185179873.jpg','http://www.baidu.com/',255,1,1),(4,'银行4','5d3c18604ab12.jpg','http://www.baidu.com/',255,1,1),(5,'银行5','5d3c1874664eb.jpg','http://www.baidu.com/',255,1,1),(6,'银行6','5d3c1887c8bb0.jpg','http://www.baidu.com/',255,1,1),(7,'银行7','5d3c1895e0a2f.jpg','http://www.baidu.com/',255,1,1),(8,'银行8','5d3c18a6731be.jpg','http://www.baidu.com/',255,1,1),(9,'银行9','5d3c18b7bc313.jpg','http://www.baidu.com/',255,1,1),(10,'工商银行','5fbb159d94b4c.png','http://www.icbc.com.cn/',255,1,1),(12,'中国银行','5fb7a059c39a8.png','https://www.boc.cn/',255,1,1),(13,'Banreserva','606b6d8ca07a1.png','https://www.banreservas.com/',255,1,1),(14,'Banco BHD','606b6df5e297f.png','https://www.bhdleon.com.do/',255,1,1),(15,'Banreservas','606b6e2eae7c0.png','https://www.banreservas.com/',255,1,1);
/*!40000 ALTER TABLE `ds_banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_bonus`
--

DROP TABLE IF EXISTS `ds_bonus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_bonus` (
  `bonus_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '红包自增ID',
  `bonus_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '红包类型 1活动红包 2关注红包 3奖品红包',
  `bonus_name` varchar(20) NOT NULL DEFAULT '' COMMENT '红包名称',
  `bonus_blessing` varchar(255) NOT NULL DEFAULT '' COMMENT '红包祝福语',
  `bonus_totalprice` decimal(10,2) NOT NULL COMMENT '总面额',
  `bonus_pricetype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否固定金额 1固定金额',
  `bonus_fixedprice` decimal(10,2) NOT NULL COMMENT '固定金额',
  `bonus_randomprice_start` decimal(10,2) NOT NULL COMMENT '金额范围',
  `bonus_randomprice_end` decimal(10,2) NOT NULL COMMENT '金额范围',
  `bonus_receivecount` int(11) NOT NULL DEFAULT '0' COMMENT '领取人数',
  `bonus_receiveprice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '领取金额',
  `bonus_state` tinyint(2) NOT NULL DEFAULT '0' COMMENT '红包状态 1正在进行 2过期 3失效',
  `bonus_begintime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `bonus_endtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `bonus_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '红包备注',
  PRIMARY KEY (`bonus_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='吸粉红包表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_bonus`
--

LOCK TABLES `ds_bonus` WRITE;
/*!40000 ALTER TABLE `ds_bonus` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_bonus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_bonusreceive`
--

DROP TABLE IF EXISTS `ds_bonusreceive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_bonusreceive` (
  `bonusreceive_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `bonus_id` int(11) NOT NULL COMMENT '吸粉红包ID',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `member_name` varchar(50) NOT NULL DEFAULT '' COMMENT '会员名',
  `bonusreceive_time` int(11) NOT NULL DEFAULT '0' COMMENT '领取时间',
  `bonusreceive_price` decimal(10,2) NOT NULL COMMENT '领取金额',
  `bonusreceive_transformed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否转入预存款',
  PRIMARY KEY (`bonusreceive_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='吸粉红包领取信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_bonusreceive`
--

LOCK TABLES `ds_bonusreceive` WRITE;
/*!40000 ALTER TABLE `ds_bonusreceive` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_bonusreceive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_brand`
--

DROP TABLE IF EXISTS `ds_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_brand` (
  `brand_id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '品牌自增ID',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `gc_id` int(10) unsigned DEFAULT '0' COMMENT '商品分类id',
  `brand_name` varchar(100) DEFAULT NULL COMMENT '品牌名称',
  `brand_initial` varchar(1) DEFAULT NULL COMMENT '品牌首字母',
  `brand_class` varchar(50) DEFAULT NULL COMMENT '类别名称',
  `brand_pic` varchar(100) DEFAULT NULL COMMENT '品牌图片',
  `brand_sort` tinyint(3) unsigned DEFAULT '255' COMMENT '品牌排序',
  `brand_recommend` tinyint(1) DEFAULT '0' COMMENT '品牌推荐，0为否，1为是',
  `brand_apply` tinyint(1) NOT NULL DEFAULT '1' COMMENT '品牌申请，0为申请中，1为通过，默认为1，申请功能是会员使用',
  `brand_showtype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '品牌展示类型 0表示图片 1表示文字 ',
  PRIMARY KEY (`brand_id`),
  KEY `store_id` (`store_id`),
  KEY `gc_id` (`gc_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='品牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_brand`
--

LOCK TABLES `ds_brand` WRITE;
/*!40000 ALTER TABLE `ds_brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_cart`
--

DROP TABLE IF EXISTS `ds_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车自增ID',
  `buyer_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '买家ID',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `option_name` varchar(250) NOT NULL DEFAULT '' COMMENT '规格名称',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `goods_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '商品数量',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `bl_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '组合套装ID',
  `goods_selected` tinyint(1) DEFAULT '1' COMMENT '是否选中',
  PRIMARY KEY (`cart_id`),
  KEY `member_id` (`buyer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='购物车数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_cart`
--

LOCK TABLES `ds_cart` WRITE;
/*!40000 ALTER TABLE `ds_cart` DISABLE KEYS */;
INSERT INTO `ds_cart` VALUES (3,6,1,'官方自营店铺',77,'乐创冷藏工作台冷冻冰箱平冷保鲜不锈钢商用厨房奶茶店操作台冰柜','',1478.00,1,'1_2017092823531033711.jpg',0,1),(4,3,1,'官方自营店铺',127,'新西兰进口牛奶纽仕兰高钙低脂纯牛奶250ml*24盒*1箱','',85.00,8,'1_2017092902485560056.jpg',0,1),(5,24,1,'官方自营店铺',20,'苏泊尔（supor)家用真空保温壶·晶韵系列KC20AP1(摩卡金)','',199.00,1,'1_2017092122035543274.jpg',0,1),(6,24,1,'官方自营店铺',113,'舒思盾经络按摩仪数码家用多功能针灸穴位电子理疗腰椎颈椎电疗仪','',168.00,1,'1_2017092901414663050.jpg',0,1);
/*!40000 ALTER TABLE `ds_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_chain`
--

DROP TABLE IF EXISTS `ds_chain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_chain` (
  `chain_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '门店自增ID',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `chain_name` varchar(50) NOT NULL COMMENT '门店登录名',
  `chain_passwd` varchar(32) NOT NULL COMMENT '门店登录密码',
  `chain_truename` varchar(20) NOT NULL COMMENT '真实姓名',
  `chain_mobile` varchar(11) NOT NULL COMMENT '手机号码',
  `chain_telephony` varchar(20) DEFAULT NULL COMMENT '座机号码',
  `chain_addressname` varchar(20) NOT NULL COMMENT '服务站名称',
  `chain_area_2` int(10) unsigned NOT NULL COMMENT '二级地区id',
  `chain_area_3` int(10) unsigned NOT NULL COMMENT '三级地区id',
  `chain_area_info` varchar(255) NOT NULL COMMENT '门店地区内容',
  `chain_address` varchar(255) NOT NULL COMMENT '门店详细地址',
  `chain_idcard` varchar(18) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `chain_idcardimage` varchar(255) NOT NULL DEFAULT '' COMMENT '身份证照片',
  `chain_addtime` int(10) unsigned NOT NULL COMMENT '门店添加时间',
  `chain_state` tinyint(3) unsigned NOT NULL COMMENT '门店状态 0关闭，1开启，10等待审核, 20审核失败',
  `chain_failreason` varchar(255) DEFAULT NULL COMMENT '失败原因',
  `chain_longitude` varchar(20) DEFAULT '' COMMENT '经度',
  `chain_latitude` varchar(20) DEFAULT '' COMMENT '纬度',
  `chain_if_pickup` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否支持自提',
  `chain_if_collect` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否支持代收',
  PRIMARY KEY (`chain_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='门店表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_chain`
--

LOCK TABLES `ds_chain` WRITE;
/*!40000 ALTER TABLE `ds_chain` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_chain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_chain_goods`
--

DROP TABLE IF EXISTS `ds_chain_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_chain_goods` (
  `chain_goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共ID',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `chain_id` int(10) unsigned NOT NULL COMMENT '门店ID',
  `goods_storage` int(10) unsigned NOT NULL COMMENT '库存',
  PRIMARY KEY (`chain_goods_id`),
  UNIQUE KEY `goods_id_2` (`goods_id`,`chain_id`),
  KEY `goods_id` (`goods_id`),
  KEY `goods_commonid` (`goods_commonid`),
  KEY `store_id` (`store_id`),
  KEY `chain_id` (`chain_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='门店商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_chain_goods`
--

LOCK TABLES `ds_chain_goods` WRITE;
/*!40000 ALTER TABLE `ds_chain_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_chain_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_chain_order`
--

DROP TABLE IF EXISTS `ds_chain_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_chain_order` (
  `chain_order_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `order_goods_id` int(10) unsigned DEFAULT '0' COMMENT '订单商品ID,0:全部商品',
  `chain_order_type` tinyint(11) unsigned NOT NULL DEFAULT '0' COMMENT '门店订单类型（1代收2自提）',
  `chain_order_pickup_code` varchar(4) DEFAULT NULL COMMENT '订单提货码',
  `chain_order_add_time` int(11) DEFAULT '0' COMMENT '订单生成时间',
  `order_sn` varchar(20) DEFAULT NULL COMMENT '订单号',
  `chain_id` int(11) DEFAULT NULL COMMENT '门店ID',
  `store_id` int(11) unsigned NOT NULL COMMENT '卖家店铺ID',
  `payment_code` char(20) NOT NULL DEFAULT '' COMMENT '支付方式名称代码',
  `shipping_code` varchar(50) DEFAULT NULL COMMENT '物流单号',
  `express_code` varchar(30) DEFAULT NULL COMMENT '快递公司编码',
  `express_name` varchar(30) DEFAULT NULL COMMENT '快递公司名称',
  `chain_order_state` tinyint(1) unsigned NOT NULL DEFAULT '10' COMMENT '门店订单状态（0:取消 10:默认 20:未到站 30:已发货 35:待自提 40:已收货）',
  `chain_order_refund_state` tinyint(1) unsigned DEFAULT '0' COMMENT '退款状态 0:无退款 2:全部退款',
  `chain_order_lock_state` tinyint(1) unsigned DEFAULT '0' COMMENT '锁定状态:0:正常,大于0:锁定',
  PRIMARY KEY (`chain_order_id`),
  KEY `order_id` (`order_id`),
  KEY `order_goods_id` (`order_goods_id`),
  KEY `chain_id` (`chain_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='门店订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_chain_order`
--

LOCK TABLES `ds_chain_order` WRITE;
/*!40000 ALTER TABLE `ds_chain_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_chain_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_chatlog`
--

DROP TABLE IF EXISTS `ds_chatlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_chatlog` (
  `m_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '消息记录自增ID',
  `f_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `f_name` varchar(50) NOT NULL COMMENT '会员名',
  `f_ip` varchar(15) NOT NULL COMMENT '发自IP',
  `t_id` int(10) unsigned NOT NULL COMMENT '接收会员ID',
  `t_name` varchar(50) NOT NULL COMMENT '接收会员名',
  `t_msg` text COMMENT '消息内容',
  `chatlog_addtime` int(10) unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`m_id`),
  KEY `f_id` (`f_id`),
  KEY `t_id` (`t_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='消息记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_chatlog`
--

LOCK TABLES `ds_chatlog` WRITE;
/*!40000 ALTER TABLE `ds_chatlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_chatlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_chatmsg`
--

DROP TABLE IF EXISTS `ds_chatmsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_chatmsg` (
  `m_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '消息自增ID',
  `f_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `f_name` varchar(50) NOT NULL COMMENT '会员名',
  `f_ip` varchar(15) NOT NULL COMMENT '发自IP',
  `t_id` int(10) unsigned NOT NULL COMMENT '接收会员ID',
  `t_name` varchar(50) NOT NULL COMMENT '接收会员名',
  `t_msg` text COMMENT '消息内容',
  `r_state` tinyint(1) unsigned DEFAULT '2' COMMENT '状态:1为已读,2为未读,默认为2',
  `chatmsg_addtime` int(10) unsigned DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`m_id`),
  KEY `f_id` (`f_id`),
  KEY `t_id` (`t_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_chatmsg`
--

LOCK TABLES `ds_chatmsg` WRITE;
/*!40000 ALTER TABLE `ds_chatmsg` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_chatmsg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_complain`
--

DROP TABLE IF EXISTS `ds_complain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_complain` (
  `complain_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉自增ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `order_goods_id` int(10) unsigned DEFAULT '0' COMMENT '订单商品ID',
  `accuser_id` int(11) NOT NULL COMMENT '原告ID',
  `accuser_name` varchar(50) NOT NULL COMMENT '原告用户名',
  `accused_id` int(11) NOT NULL COMMENT '被告ID',
  `accused_name` varchar(50) NOT NULL COMMENT '被告名称',
  `complain_subject_content` varchar(50) NOT NULL COMMENT '投诉主题',
  `complain_subject_id` int(11) NOT NULL COMMENT '投诉主题id',
  `complain_content` varchar(255) NOT NULL COMMENT '投诉内容',
  `complain_pic1` varchar(100) DEFAULT NULL COMMENT '投诉图片1',
  `complain_pic2` varchar(100) DEFAULT NULL COMMENT '投诉图片2',
  `complain_pic3` varchar(100) DEFAULT NULL COMMENT '投诉图片3',
  `complain_datetime` int(11) DEFAULT NULL COMMENT '投诉时间',
  `complain_handle_datetime` int(11) DEFAULT NULL COMMENT '投诉处理时间',
  `complain_handle_member_id` int(11) DEFAULT NULL COMMENT '投诉处理人ID',
  `appeal_message` varchar(255) DEFAULT NULL COMMENT '申诉内容',
  `appeal_datetime` int(11) DEFAULT NULL COMMENT '申诉时间',
  `appeal_pic1` varchar(100) DEFAULT NULL COMMENT '申诉图片1',
  `appeal_pic2` varchar(100) DEFAULT NULL COMMENT '申诉图片2',
  `appeal_pic3` varchar(100) DEFAULT NULL COMMENT '申诉图片3',
  `final_handle_message` varchar(255) DEFAULT NULL COMMENT '最终处理意见',
  `final_handle_datetime` int(11) DEFAULT NULL COMMENT '最终处理时间',
  `final_handle_member_id` int(11) DEFAULT NULL COMMENT '最终处理人ID',
  `complain_state` tinyint(4) DEFAULT NULL COMMENT '投诉状态 10:新投诉 20:投诉通过转给被投诉人 30:被投诉人已申诉 40:提交仲裁 99:已关闭',
  `complain_active` tinyint(4) DEFAULT '1' COMMENT '投诉是否通过平台审批 1:未通过 2:通过',
  PRIMARY KEY (`complain_id`),
  KEY `accuser_id` (`accuser_id`),
  KEY `accused_id` (`accused_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='投诉表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_complain`
--

LOCK TABLES `ds_complain` WRITE;
/*!40000 ALTER TABLE `ds_complain` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_complain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_complainsubject`
--

DROP TABLE IF EXISTS `ds_complainsubject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_complainsubject` (
  `complainsubject_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉主题id',
  `complainsubject_content` varchar(50) NOT NULL COMMENT '投诉主题',
  `complainsubject_desc` varchar(100) NOT NULL COMMENT '投诉主题描述',
  `complainsubject_state` tinyint(4) NOT NULL COMMENT '投诉主题状态 1:有效 2:失效',
  PRIMARY KEY (`complainsubject_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='投诉主题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_complainsubject`
--

LOCK TABLES `ds_complainsubject` WRITE;
/*!40000 ALTER TABLE `ds_complainsubject` DISABLE KEYS */;
INSERT INTO `ds_complainsubject` VALUES (1,'商家不同意退款','买家申请退款被拒绝。',2),(2,'未收到货','交易成功，未收到货，钱已经付给商家，可进行维权。',1),(3,'售后保障服务','交易完成后30天内，在使用商品过程中，发现商品有质量问题或无法正常使用，可进行维权。',1);
/*!40000 ALTER TABLE `ds_complainsubject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_complaintalk`
--

DROP TABLE IF EXISTS `ds_complaintalk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_complaintalk` (
  `talk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '投诉对话自增ID',
  `complain_id` int(11) NOT NULL COMMENT '投诉ID',
  `talk_member_id` int(11) NOT NULL COMMENT '发言人ID',
  `talk_member_name` varchar(50) NOT NULL COMMENT '发言人用户名',
  `talk_member_type` varchar(10) NOT NULL COMMENT '发言人类型(1-投诉人/2-被投诉人/3-平台)',
  `talk_content` varchar(255) NOT NULL COMMENT '发言内容',
  `talk_state` tinyint(4) NOT NULL COMMENT '发言状态(1-显示/2-不显示)',
  `talk_admin` int(11) NOT NULL DEFAULT '0' COMMENT '对话管理员，屏蔽对话人的id',
  `talk_datetime` int(11) NOT NULL COMMENT '对话发表时间',
  PRIMARY KEY (`talk_id`),
  KEY `complain_id` (`complain_id`),
  KEY `talk_member_id` (`talk_member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='投诉对话表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_complaintalk`
--

LOCK TABLES `ds_complaintalk` WRITE;
/*!40000 ALTER TABLE `ds_complaintalk` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_complaintalk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_config`
--

DROP TABLE IF EXISTS `ds_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_config` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `value` text,
  `remark` varchar(100) DEFAULT '解释,备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=778 DEFAULT CHARSET=utf8 COMMENT='配置参数表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_config`
--

LOCK TABLES `ds_config` WRITE;
/*!40000 ALTER TABLE `ds_config` DISABLE KEYS */;
INSERT INTO `ds_config` VALUES (1,'site_name','Domi Buy','商城名称'),(2,'site_phone','3','商城客服服务电话'),(3,'site_state','1','商城状态'),(4,'site_logo','site_logo.png','商城logo图'),(5,'member_logo','member_logo.png','默认会员图'),(6,'seller_center_logo','seller_center_logo.png','默认卖家中心logo'),(7,'site_mobile_logo','site_mobile_logo.png','默认商城手机端logo'),(8,'site_logowx','site_logowx.png','微信商城二维码'),(9,'icp_number',NULL,'ICP备案号'),(10,'site_tel400','40002541852','解释,备注'),(11,'site_email','858761000@qq.com','电子邮件'),(12,'flow_static_code','Copyright © 2020 Domi Buy Copyright todos los derechos reservados','底部版权信息'),(13,'closed_reason','商城暂时关闭','商城关闭原因'),(14,'guest_comment','1','是否允许游客咨询'),(15,'captcha_status_login','1','会员登录是否需要验证码'),(16,'captcha_status_register','1','会员注册是否验证码'),(17,'captcha_status_goodsqa','1','商品咨询是否验证码'),(18,'captcha_status_storelogin','1','店铺登录是否验证码'),(19,'cache_open','0','是否开启缓存'),(21,'default_goods_image','default_goods_image.jpg','默认商品图'),(22,'default_store_logo','default_store_logo.jpg','默认店铺图'),(23,'default_store_avatar','default_store_avatar.png','默认店铺图像'),(24,'default_user_portrait','default_user_portrait.gif','默认会员图像'),(25,'fixed_suspension_state',NULL,'是否开启首次访问悬浮'),(26,'fixed_suspension_img','fixed_suspension_img.png','首次访问悬浮图像'),(27,'fixed_suspension_url',NULL,'悬浮图像跳转地址'),(28,'admin_logo','logo.png','后台登录中心Logo'),(29,'admin_backlogo','backlogo.png','后台管理中心Logo'),(31,'store_joinin_pic','a:2:{s:3:\"pic\";a:3:{i:1;s:18:\"store_joinin_1.jpg\";i:2;s:18:\"store_joinin_2.jpg\";i:3;s:18:\"store_joinin_3.jpg\";}s:8:\"show_txt\";s:6:\"测试\";}','解释,备注'),(32,'store_joinin_open','1','店铺入驻开启（0不开启1全部开启2仅企业3仅个人）'),(40,'smscf_wj_username','','短信平台账号'),(41,'smscf_wj_key','','短信平台密钥'),(42,'smscf_sign','','短信签名'),(43,'smscf_type','wj','短信服务商'),(44,'smscf_ali_id','','阿里云短信AccessKeyId'),(45,'smscf_ali_secret','','阿里云短信AccessKeySecret'),(46,'smscf_ten_id','','腾讯云短信AccessKeyId'),(47,'smscf_ten_secret','','腾讯云短信AccessKeySecret'),(51,'email_host','smtp.126.com','邮箱地址'),(52,'email_port','25','邮箱端口'),(53,'email_addr','','邮箱发件人地址'),(54,'email_id','','身份验证用户名'),(55,'email_pass','','用户名密码'),(56,'email_secure','','邮箱发送协议'),(60,'setup_date','2020-11-16 16:06:45','安装时间'),(61,'upload_type','local','图片上传保存方式'),(62,'alioss_accessid',NULL,'accessid'),(63,'alioss_accesssecret',NULL,'oss_accesssecret'),(64,'alioss_bucket',NULL,'oss_bucket'),(65,'alioss_endpoint',NULL,'oss_endpoint'),(66,'aliendpoint_type','0','aliendpoint_type'),(70,'node_site_url','http://shops.domibuy.com/','站内IM服务器地址'),(71,'node_site_use','1','是否启用im'),(80,'flea_site_title','',''),(81,'flea_site_description','',''),(82,'flea_site_keywords','',''),(83,'flea_loginpic','',''),(91,'order_auto_receive_day','7','自动确认收货的天数'),(92,'order_auto_cancel_day','3','自动取消订单的天数'),(93,'code_invalid_refund','7','兑换码过期自动退款的天数'),(101,'qq_isuse','1','是否使用QQ互联'),(102,'qq_appid','','qq互联id'),(103,'qq_appkey','','qq秘钥'),(111,'sina_isuse','1','是的使用微博登录'),(112,'sina_wb_akey','','新浪id'),(113,'sina_wb_skey','','新浪秘钥'),(121,'sms_register','0','是否手机注册'),(122,'sms_login','0','是否手机登录'),(123,'sms_password','0','是否手机找回密码'),(131,'weixin_isuse',NULL,'是否微信登录'),(132,'weixin_appid',NULL,'微信appid'),(133,'weixin_secret',NULL,'微信appserite'),(135,'complain_time_limit','864000','商品详情页咨询文字提示'),(136,'malbum_max_sum','10','个人相册数量'),(137,'hot_search','','热门搜索关键字'),(138,'image_allow_ext','gif,jpg,jpeg,bmp,png,swf','允许后缀'),(139,'image_max_filesize','1024','允许上传最大值'),(140,'expresscf_kdn_id','','快递鸟-用户ID'),(141,'expresscf_kdn_key','','快递鸟-API key'),(150,'vod_tencent_secret_id','','腾讯Secret_id'),(151,'vod_tencent_secret_key','','腾讯Secret_key'),(201,'flea_isuse','1','闲置市场'),(202,'promotion_allow','1','商品促销'),(203,'groupbuy_allow','1','抢购'),(204,'points_isuse','1','开启积分机制'),(205,'pointshop_isuse','1','积分中心'),(206,'pointprod_isuse','1','积分兑换'),(207,'voucher_allow','1','代金券'),(208,'mgdiscount_allow','1','会员等级折扣'),(209,'mgdiscount_price','1','会员等级折扣价格'),(230,'points_reg','5','注册赠送积分数'),(231,'points_login','10','登录赠送积分数'),(232,'points_comments','10','评论赠送积分数'),(233,'points_signin','10','会员签到赠送积分'),(234,'points_invite','10','邀请注册积分'),(235,'points_rebate','1','返佣比例'),(236,'points_orderrate','4','消费额与赠送积分比例'),(237,'points_ordermax','4','每单最多赠送积分'),(238,'points_signin_isuse','1','开启签到送积分'),(239,'points_signin_cycle','7','签到持续周期'),(240,'points_signin_reward','7','签到持续周期额外奖励'),(241,'groupbuy_price','20','抢购价格'),(242,'groupbuy_review_day','3','抢购审核期'),(350,'live_pic1','','抢购默认幻灯片'),(351,'live_link1','','抢购幻灯片跳转地址'),(352,'live_pic2','','抢购默认幻灯片'),(353,'live_link2','','抢购幻灯片跳转地址'),(354,'live_pic3','','抢购默认幻灯片'),(355,'live_link3','','抢购幻灯片跳转地址'),(356,'live_pic4','','抢购默认幻灯片'),(357,'live_link4','','抢购幻灯片跳转地址'),(359,'promotion_wholesale_price','10','批发价格'),(360,'promotion_xianshi_price','10','限时促销价格'),(361,'promotion_mansong_price','16','满送活动价格'),(362,'promotion_bundling_price','15','优惠活动价格'),(363,'promotion_bundling_sum','10','允许活动数量'),(364,'promotion_bundling_goods_sum','3','活动最大商品发布数量'),(365,'promotion_booth_price','10','推荐展位价格'),(366,'promotion_booth_goods_sum','10','允许设置最大推荐商品数量'),(367,'promotion_voucher_price','10','代金券价格'),(368,'promotion_pintuan_price','10','拼团套餐价格'),(369,'promotion_bargain_price','10','砍价套餐价格'),(370,'voucher_storetimes_limit','20','代金券活动数'),(371,'voucher_buyertimes_limit','20','卖家最大领取数'),(380,'chain_isuse','1','代收是否开启'),(390,'goods_verify','0','商品审核'),(401,'stat_pricerange','a:3:{i:0;a:2:{s:1:\"s\";s:1:\"5\";s:1:\"e\";s:2:\"10\";}i:1;a:2:{s:1:\"s\";s:2:\"11\";s:1:\"e\";s:2:\"20\";}i:2;a:2:{s:1:\"s\";s:2:\"21\";s:1:\"e\";s:2:\"25\";}}','统计商品价格区间'),(402,'stat_orderpricerange','a:1:{i:0;a:2:{s:1:\"s\";s:2:\"21\";s:1:\"e\";s:2:\"30\";}}','订单金额区间'),(501,'expset','a:4:{s:9:\"login_exp\";s:3:\"151\";s:11:\"comment_exp\";s:1:\"1\";s:7:\"buy_exp\";s:1:\"1\";s:11:\"buy_exp_max\";s:2:\"50\";}','解释,备注'),(502,'exppoints_rule','a:4:{s:9:\"exp_login\";s:2:\"20\";s:12:\"exp_comments\";s:2:\"10\";s:13:\"exp_orderrate\";s:2:\"10\";s:12:\"exp_ordermax\";s:2:\"10\";}','解释,备注'),(601,'member_grade','a:4:{i:1;a:3:{s:5:\"level\";i:1;s:10:\"level_name\";s:2:\"V1\";s:9:\"exppoints\";i:0;}i:2;a:3:{s:5:\"level\";i:2;s:10:\"level_name\";s:2:\"V2\";s:9:\"exppoints\";i:150;}i:3;a:3:{s:5:\"level\";i:3;s:10:\"level_name\";s:2:\"V3\";s:9:\"exppoints\";i:200;}i:4;a:3:{s:5:\"level\";i:4;s:10:\"level_name\";s:2:\"V4\";s:9:\"exppoints\";i:500;}}','解释,备注'),(701,'inviter_back','inviter_back.png','会员推广背景图片'),(702,'inviter_ratio_1','0.5','会员一级推广佣金比例'),(703,'inviter_ratio_2','0.3','会员二级推广佣金比例'),(704,'inviter_ratio_3','0.2','会员三级推广佣金比例'),(705,'baidu_ak',NULL,'百度地图AK密钥'),(706,'inviter_open','0','推广开关'),(707,'inviter_level','3','推广级别'),(708,'inviter_show','0','详情页显示推广佣金'),(709,'inviter_return','0','推广员返佣'),(710,'inviter_view','0','推广员审核'),(711,'inviter_condition','0','推广员条件'),(712,'inviter_condition_amount','0','成为推广员的消费门槛'),(713,'store_bill_cycle','7','店铺结算周期（天）'),(714,'store_withdraw_cycle','1','店铺提现周期（天）'),(715,'store_withdraw_min','100','店铺最小提现金额（元）'),(716,'store_withdraw_max','10000','店铺最大提现金额（元）'),(717,'auto_register','0','自动注册'),(718,'business_licence','','营业执照'),(719,'member_auth','0','实名认证'),(730,'h5_site_url','http://m.domibuy.com','手机端地址'),(731,'h5_force_redirect','0','强制跳转到手机端'),(740,'member_withdraw_cycle','1','用户提现周期（天）'),(741,'member_withdraw_min','100','用户最小提现金额（元）'),(742,'member_withdraw_max','10000','用户最大提现金额（元）'),(752,'instant_message_verify','0','直播聊天审核'),(753,'instant_message_gateway_url','','直播聊天gateway地址'),(754,'instant_message_register_url','','直播聊天register地址'),(755,'live_push_domain','','推流域名'),(756,'live_push_key','','推流key'),(757,'live_play_domain','','拉流域名'),(758,'vod_tencent_appid','','腾讯云appid'),(759,'vod_tencent_play_domain','','点播域名'),(760,'vod_tencent_play_key','','点播key'),(761,'video_type','tencent','视频类型'),(762,'aliyun_user_id','','阿里云账号ID'),(763,'aliyun_access_key_id','','阿里云账号AccessKeyID'),(764,'aliyun_access_key_secret','','阿里云账号AccessKeySecret'),(765,'aliyun_live_push_key','','阿里云推流鉴权key'),(766,'aliyun_live_push_domain','','阿里云推流域名'),(767,'aliyun_live_play_domain','','阿里云播流域名'),(768,'aliyun_live_play_key','','阿里云播流鉴权key'),(769,'live_type','0','直播类型（0小程序原生直播1小程序组件直播）'),(770,'fb_isuse','1','是否使用Facebook登陆'),(771,'fb_appid','675767013129844','Facebook应用id'),(772,'fb_appkey','3d8247410111cc1a5db2503e181c3cd2','Facebook应用密钥'),(773,'tw_isuse','1','是否使用Twitter登陆'),(774,'tw_appid','2','Twitter应用id'),(775,'tw_appkey','2','Twitter应用密钥'),(776,'site_bankname','Banreserva','收款银行名称'),(777,'site_bank','6900137407','收款银行卡号');
/*!40000 ALTER TABLE `ds_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_consult`
--

DROP TABLE IF EXISTS `ds_consult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_consult` (
  `consult_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '咨询自增ID',
  `goods_id` int(11) unsigned DEFAULT '0' COMMENT '商品编号',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '咨询发布者会员ID 0:游客',
  `member_name` varchar(100) DEFAULT NULL COMMENT '会员名称',
  `store_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `consulttype_id` int(10) unsigned NOT NULL COMMENT '咨询类型',
  `consult_content` varchar(255) DEFAULT NULL COMMENT '咨询内容',
  `consult_addtime` int(10) DEFAULT NULL COMMENT '咨询发布时间',
  `consult_reply` varchar(255) DEFAULT '' COMMENT '咨询回复内容',
  `consult_replytime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '咨询回复时间',
  `consult_isanonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0表示不匿名 1表示匿名',
  PRIMARY KEY (`consult_id`),
  KEY `goods_id` (`goods_id`),
  KEY `seller_id` (`store_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品咨询表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_consult`
--

LOCK TABLES `ds_consult` WRITE;
/*!40000 ALTER TABLE `ds_consult` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_consult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_consulttype`
--

DROP TABLE IF EXISTS `ds_consulttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_consulttype` (
  `consulttype_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '咨询类型ID',
  `consulttype_name` varchar(10) NOT NULL COMMENT '咨询类型名称',
  `consulttype_introduce` text NOT NULL COMMENT '咨询类型详细介绍',
  `consulttype_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '咨询类型排序',
  PRIMARY KEY (`consulttype_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='咨询类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_consulttype`
--

LOCK TABLES `ds_consulttype` WRITE;
/*!40000 ALTER TABLE `ds_consulttype` DISABLE KEYS */;
INSERT INTO `ds_consulttype` VALUES (1,'商品咨询','后台->交易->咨询管理->咨询类型->编辑',1),(2,'支付问题','后台->交易->咨询管理->咨询类型->编辑',2),(3,'发票及保修','后台->交易->咨询管理->咨询类型->编辑',3),(4,'促销及赠品','后台->交易->咨询管理->咨询类型->编辑',4);
/*!40000 ALTER TABLE `ds_consulttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_cron`
--

DROP TABLE IF EXISTS `ds_cron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_cron` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '执行自增ID',
  `type` tinyint(3) unsigned DEFAULT NULL COMMENT '任务类型 1商品上架 2根据商品id更新商品促销价格 3优惠套装过期 4推荐展位过期 5抢购开始更新商品促销价格 6抢购过期 7限时折扣过期 8批发过期',
  `exeid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联任务的ID[如商品ID,会员ID]',
  `exetime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执行时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='任务队列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_cron`
--

LOCK TABLES `ds_cron` WRITE;
/*!40000 ALTER TABLE `ds_cron` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_cron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_daddress`
--

DROP TABLE IF EXISTS `ds_daddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_daddress` (
  `daddress_id` mediumint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '发货地址ID',
  `store_id` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `seller_name` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人',
  `city_id` mediumint(9) DEFAULT NULL COMMENT '市级ID',
  `area_id` mediumint(10) unsigned NOT NULL DEFAULT '0' COMMENT '地区ID',
  `area_info` varchar(100) DEFAULT NULL COMMENT '省市县',
  `daddress_detail` varchar(100) NOT NULL COMMENT '发货地址',
  `daddress_telphone` varchar(40) DEFAULT NULL COMMENT '发货电话',
  `daddress_company` varchar(50) NOT NULL COMMENT '发货公司',
  `daddress_isdefault` enum('0','1') NOT NULL DEFAULT '0' COMMENT '是否默认 1:是0:不是',
  PRIMARY KEY (`daddress_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='卖家发货地址信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_daddress`
--

LOCK TABLES `ds_daddress` WRITE;
/*!40000 ALTER TABLE `ds_daddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_daddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_document`
--

DROP TABLE IF EXISTS `ds_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_document` (
  `document_id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '系统文章自增ID',
  `document_code` varchar(255) NOT NULL COMMENT '调用标识码',
  `document_title` varchar(255) NOT NULL COMMENT '系统文章标题',
  `document_content` text NOT NULL COMMENT '系统文章内容',
  `document_time` int(10) unsigned NOT NULL COMMENT '添加时间/修改时间',
  PRIMARY KEY (`document_id`),
  UNIQUE KEY `document_code` (`document_code`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='系统文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_document`
--

LOCK TABLES `ds_document` WRITE;
/*!40000 ALTER TABLE `ds_document` DISABLE KEYS */;
INSERT INTO `ds_document` VALUES (1,'agreement','用户服务协议','&lt;p&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;本协议是您与网站所有者（以下简称为&amp;quot;商城&amp;quot;）之间就商城网站服务等相关事宜所订立的契约，请您仔细阅读本注册协议，您点击&amp;quot;同意并继续&amp;quot;按钮后，本协议即构成对双方有约束力的法律文件。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;第1条 本站服务条款的确认和接纳&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;1.1本站的各项电子服务的所有权和运作权归商城所有。用户同意所有注册协议条款并完成注册程序，才能成为本站的正式用户。用户确认：本协议条款是处理双方权利义务的契约，始终有效，法律另有强制性规定或双方另有特别约定的，依其规定。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;1.2用户点击同意本协议的，即视为用户确认自己具有享受本站服务、下单购物等相应的权利能力和行为能力，能够独立承担法律责任。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;1.3如果您在18周岁以下，您只能在父母或监护人的监护参与下才能使用本站。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;1.4商城保留在中华人民共和国大陆地区法施行之法律允许的范围内独自决定拒绝服务、关闭用户账户、清除或编辑内容或取消订单的权利。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;第2条 本站服务&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;2.1商城通过互联网依法为用户提供互联网信息等服务，用户在完全同意本协议及本站规定的情况下，方有权使用本站的相关服务。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;2.2用户必须自行准备如下设备和承担如下开支：（1）上网设备，包括并不限于电脑或者其他上网终端、调制解调器及其他必备的上网装置；（2）上网开支，包括并不限于网络接入费、上网设备租用费、手机流量费等。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;第3条 用户信息&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;3.1用户应自行诚信向本站提供注册资料，用户同意其提供的注册资料真实、准确、完整、合法有效，用户注册资料如有变动的，应及时更新其注册资料。如果用户提供的注册资料不合法、不真实、不准确、不详尽的，用户需承担因此引起的相应责任及后果，并且商城保留终止用户使用商城各项服务的权利。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;3.2用户在本站进行浏览、下单购物等活动时，涉及用户真实姓名/名称、通信地址、联系电话、电子邮箱等隐私信息的，本站将予以严格保密，除非得到用户的授权或法律另有规定，本站不会向外界披露用户隐私信息。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;3.3用户注册成功后，将产生用户名和密码等账户信息，您可以根据本站规定改变您的密码。用户应谨慎合理的保存、使用其用户名和密码。用户若发现任何非法使用用户账号或存在安全漏洞的情况，请立即通知本站并向公安机关报案。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;3.4用户同意，商城拥有通过邮件、短信电话等形式，向在本站注册、购物用户、收货人发送订单信息、促销活动等告知信息的权利。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;3.5用户不得将在本站注册获得的账户借给他人使用，否则用户应承担由此产生的全部责任，并与实际使用人承担连带责任。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;3.6用户同意，商城有权使用用户的注册信息、用户名、密码等信息，登录进入用户的注册账户，进行证据保全，包括但不限于公证、见证等。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;第4条 用户依法言行义务&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;本协议依据国家相关法律法规规章制定，用户同意严格遵守以下义务：&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;（1）不得传输或发表：煽动抗拒、破坏宪法和法律、行政法规实施的言论，煽动颠覆国家政权，推翻社会主义制度的言论，煽动分裂国家、破坏国家统一的的言论，煽动民族仇恨、民族歧视、破坏民族团结的言论；&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;（2）从中国大陆向境外传输资料信息时必须符合中国有关法规；&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;（3）不得利用本站从事洗钱、窃取商业秘密、窃取个人信息等违法犯罪活动；&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;（4）不得干扰本站的正常运转，不得侵入本站及国家计算机信息系统；&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;（5）不得传输或发表任何违法犯罪的、骚扰性的、中伤他人的、辱骂性的、恐吓性的、伤害性的、庸俗的，淫秽的、不文明的等信息资料；&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;（6）不得传输或发表损害国家社会公共利益和涉及国家安全的信息资料或言论；&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;（7）不得教唆他人从事本条所禁止的行为；&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;（8）不得利用在本站注册的账户进行牟利性经营活动；&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;（9）不得发布任何侵犯他人著作权、商标权等知识产权或合法权利的内容；&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;用户应不时关注并遵守本站不时公布或修改的各类合法规则规定。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;本站保有删除站内各类不符合法律政策或不真实的信息内容而无须通知用户的权利。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;若用户未遵守以上规定的，本站有权作出独立判断并采取暂停或关闭用户帐号等措施。用户须对自己在网上的言论和行为承担法律责任。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;第5条 商品信息&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;本站上的商品价格、数量、是否有货等商品信息随时都有可能发生变动，本站不作特别通知。由于网站上商品信息的数量极其庞大，虽然本站会尽最大努力保证您所浏览商品信息的准确性，但由于众所周知的互联网技术因素等客观原因存在，本站网页显示的信息可能会有一定的滞后性或差错，对此情形您知悉并理解；商城欢迎纠错，并会视情况给予纠错者一定的奖励。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;为表述便利，商品和服务简称为&amp;quot;商品&amp;quot;或&amp;quot;货物&amp;quot;。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;第6条 订单&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;6.1在您下订单时，请您仔细确认所购商品的名称、价格、数量、型号、规格、尺寸、联系地址、电话、收货人等信息。收货人与用户本人不一致的，收货人的行为和意思表示视为用户的行为和意思表示，用户应对收货人的行为及意思表示的法律后果承担连带责任。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;6.2除法律另有强制性规定外，双方约定如下：本站上销售方展示的商品和价格等信息仅仅是交易信息的发布，您下单时须填写您希望购买的商品数量、价款及支付方式、收货人、联系方式、收货地址等内容；系统生成的订单信息是计算机信息系统根据您填写的内容自动生成的数据，仅是您向销售方发出的交易诉求；销售方收到您的订单信息后，只有在销售方将您在订单中订购的商品从仓库实际直接向您发出时（ 以商品出库为标志），方视为您与销售方之间就实际直接向您发出的商品建立了交易关系；如果您在一份订单里订购了多种商品并且销售方只给您发出了部分商品时，您与销售方之间仅就实际直接向您发出的商品建立了交易关系；只有在销售方实际直接向您发出了订单中订购的其他商品时，您和销售方之间就订单中该其他已实际直接向您发出的商品才成立交易关系。您可以随时登录您在本站注册的账户，查询您的订单状态。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;6.3由于市场变化及各种以合理商业努力难以控制的因素的影响，本站无法保证您提交的订单信息中希望购买的商品都会有货；如您拟购买的商品，发生缺货，您有权取消订单。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;第7条 配送&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;7.1销售方将会把商品（货物）送到您所指定的收货地址，所有在本站上列出的送货时间为参考时间，参考时间的计算是根据库存状况、正常的处理过程和送货时间、送货地点的基础上估计得出的。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;7.2因如下情况造成订单延迟或无法配送等，销售方不承担延迟配送的责任：&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;（1）用户提供的信息错误、地址不详细等原因导致的；&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;（2）货物送达后无人签收，导致无法配送或延迟配送的；&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;（3）情势变更因素导致的；&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;（4）不可抗力因素导致的，例如：自然灾害、交通戒严、突发战争等。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;第8条 所有权及知识产权条款&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;8.1用户一旦接受本协议，即表明该用户主动将其在任何时间段在本站发表的任何形式的信息内容（包括但不限于客户评价、客户咨询、各类话题文章等信息内容）的财产性权利等任何可转让的权利，如著作权财产权（包括并不限于：复制权、发行权、出租权、展览权、表演权、放映权、广播权、信息网络传播权、摄制权、改编权、翻译权、汇编权以及应当由著作权人享有的其他可转让权利），全部独家且不可撤销地转让给商城所有，用户同意商城有权就任何主体侵权而单独提起诉讼。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;8.2本协议已经构成《中华人民共和国著作权法》第二十五条（条文序号依照2011年版著作权法确定）及相关法律规定的著作财产权等权利转让书面协议，其效力及于用户在商城网站上发布的任何受著作权法保护的作品内容，无论该等内容形成于本协议订立前还是本协议订立后。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;8.3用户同意并已充分了解本协议的条款，承诺不将已发表于本站的信息，以任何形式发布或授权其它主体以任何方式使用（包括但不限于在各类网站、媒体上使用）。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;8.4商城是本站的制作者,拥有此网站内容及资源的著作权等合法权利,受国家法律保护,有权不时地对本协议及本站的内容进行修改，并在本站张贴，无须另行通知用户。在法律允许的最大限度范围内，商城对本协议及本站内容拥有解释权。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;8.5除法律另有强制性规定外，未经商城明确的特别书面许可,任何单位或个人不得以任何方式非法地全部或部分复制、转载、引用、链接、抓取或以其他方式使用本站的信息内容，否则，商城有权追究其法律责任。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;8.6本站所刊登的资料信息（诸如文字、图表、标识、按钮图标、图像、声音文件片段、数字下载、数据编辑和软件），均是商城或其内容提供者的财产，受中国和国际版权法的保护。本站上所有内容的汇编是商城的排他财产，受中国和国际版权法的保护。本站上所有软件都是商城或其关联公司或其软件供应商的财产，受中国和国际版权法的保护。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;第9条 责任限制及不承诺担保&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;除非另有明确的书面说明,本站及其所包含的或以其它方式通过本站提供给您的全部信息、内容、材料、产品（包括软件）和服务，均是在&amp;quot;按现状&amp;quot;和&amp;quot;按现有&amp;quot;的基础上提供的。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;除非另有明确的书面说明,商城不对本站的运营及其包含在本网站上的信息、内容、材料、产品（包括软件）或服务作任何形式的、明示或默示的声明或担保（根据中华人民共和国法律另有规定的以外）。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;商城不担保本站所包含的或以其它方式通过本站提供给您的全部信息、内容、材料、产品（包括软件）和服务、其服务器或从本站发出的电子信件、信息没有病毒或其他有害成分。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;如因不可抗力或其它本站无法控制的原因使本站销售系统崩溃或无法正常使用导致网上交易无法完成或丢失有关的信息、记录等，商城会合理地尽力协助处理善后事宜。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;第10条 协议更新及用户关注义务&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;根据国家法律法规变化及网站运营需要，商城有权对本协议条款不时地进行修改，修改后的协议一旦被张贴在本站上即生效，并代替原来的协议。用户可随时登录查阅最新协议；用户有义务不时关注并阅读最新版的协议及网站公告。如用户不同意更新后的协议，可以且应立即停止接受商城网站依据本协议提供的服务；如用户继续使用本网站提供的服务的，即视为同意更新后的协议。商城建议您在使用本站之前阅读本协议及本站的公告。 如果本协议中任何一条被视为废止、无效或因任何理由不可执行，该条应视为可分的且并不影响任何其余条款的有效性和可执行性。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;第11条 法律管辖和适用&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;本协议的订立、执行和解释及争议的解决均应适用在中华人民共和国大陆地区适用之有效法律（但不包括其冲突法规则）。 如发生本协议与适用之法律相抵触时，则这些条款将完全按法律规定重新解释，而其它有效条款继续有效。 如缔约方就本协议内容或其执行发生任何争议，双方应尽力友好协商解决；协商不成时，任何一方均可向有管辖权的中华人民共和国大陆地区法院提起诉讼。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;第12条 其他&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;12.1商城网站所有者是指在政府部门依法许可或备案的商城网站经营主体。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;12.2商城尊重用户和消费者的合法权利，本协议及本网站上发布的各类规则、声明等其他内容，均是为了更好的、更加便利的为用户和消费者提供服务。本站欢迎用户和社会各界提出意见和建议，商城将虚心接受并适时修改本协议及本站上的各类规则。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;12.3本协议内容中以黑体、加粗、下划线、斜体等方式显著标识的条款，请用户着重阅读。&lt;/span&gt;&lt;br/&gt;&lt;br/&gt;&lt;span style=&quot;color: rgb(102, 102, 102); font-size: 12px; background-color: rgb(255, 255, 255);&quot;&gt;12.4您点击本协议下方的&amp;quot;同意并继续&amp;quot;按钮即视为您完全接受本协议，在点击之前请您再次确认已知悉并完全理解本协议的全部内容。&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;',1435672310),(4,'open_store','开店协议','&lt;h2 style=&quot;padding: 0px; margin: 0px; font-size: 16px; font-weight: normal; color: rgb(51, 51, 51); line-height: 30px;&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 12px;&quot;&gt;1.本协议的订立&lt;/span&gt;&lt;/h2&gt;&lt;p class=&quot;cont&quot; style=&quot;padding: 0px; margin-top: 0px; margin-bottom: 0px; line-height: 28px;&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 12px;&quot;&gt;在本网站（&lt;/span&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://www.ecmoban.com/&quot; class=&quot;link&quot; style=&quot;padding: 0px; margin: 0px; text-decoration: underline; color: rgb(85, 85, 85); font-family: 宋体, SimSun; font-size: 12px;&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 12px;&quot;&gt;dsmall.csdeshang.com&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 12px;&quot;&gt;）依据《德尚商城网站用户注册协议》登记注册，且符合本网站 商家入驻标准的用户（以下简称&amp;quot;商 家&amp;quot;），在同意本协议全部条款后，方有资格使用&amp;quot;德尚商城商家在线入驻系统&amp;quot;（以 下简称&amp;quot;入驻系统&amp;quot;）申请入驻。一经商家点击&amp;quot;同意以上协议，下一步&amp;quot;按键， 即意味着商家同意与本网站签订本协议并同意受本协议约束。&lt;/span&gt;&lt;/p&gt;&lt;h2 style=&quot;padding: 0px; margin: 0px; font-size: 16px; font-weight: normal; color: rgb(51, 51, 51); line-height: 30px;&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 12px;&quot;&gt;2.入驻系统使用说明&lt;/span&gt;&lt;/h2&gt;&lt;p class=&quot;cont&quot; style=&quot;padding: 0px; margin-top: 0px; margin-bottom: 0px; line-height: 28px;&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 12px;&quot;&gt;2.1 商家通过入驻系统提出入驻申请，并按照要求填写商家信息、提供商家资质资料后，由 本网站审核并与有合作意向的商家联系协商合作相关事宜，经双方协商一致线下签订书面《开放平台 供应商合作运营协议》（以下简称&amp;quot;运营协议&amp;quot;），且商家按照&amp;quot;运营协议&amp;quot;约定 支付相应平台使用费及保证金等必要费用后，商家正式入驻本网站。本网站将为入驻商家开通商家后 台系统，商家可通过商家后台系统在本网站运营 自己的入驻店铺。&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;cont&quot; style=&quot;padding: 0px; margin-top: 0px; margin-bottom: 0px; line-height: 28px;&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 12px;&quot;&gt;2.2 商家以及本网站通过入驻系统做出的申请、资料提交及确认等各类沟通，仅为双方合作 的意向以及本网站对商家资格审核的必备程序，除遵守本协议各项约定外，对双方不产生法律约束力 。双方间最终合作事宜及运营规则均以&amp;quot;运营协议&amp;quot;的约定及商家后台系统公示的各项规则 为准。&lt;/span&gt;&lt;/p&gt;&lt;h2 style=&quot;padding: 0px; margin: 0px; font-size: 16px; font-weight: normal; color: rgb(51, 51, 51); line-height: 30px;&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 12px;&quot;&gt;3.商家权利义务&lt;/span&gt;&lt;/h2&gt;&lt;p style=&quot;padding: 0px; margin-top: 0px; margin-bottom: 0px; line-height: 28px;&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun; font-size: 12px;&quot;&gt;用户使用&amp;quot;德尚商城商家在线入驻系统&amp;quot;前请认真阅读并理解本协议内容，本协议 内容中以加粗方式显著标识的条款，请用户着重阅读、慎重考虑。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;',1435672310),(5,'groupbuy','抢购活动协议','&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(94, 94, 94); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Tahoma, Helvetica, Arial, 宋体, sans-serif, 宋体; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;在您报名参加随缘客平台推广活动之前，请您仔细阅读本协议的全部内容。如果您对本协议的条款有疑问，请通过随缘客客服渠道进行询问，我们将向您解释条款内容。如果您不同意本协议的任何内容，或者无法准确理解随缘客对条款的解释，请不要点选“接受/同意”，也不要参与随缘客平台推广活动。&lt;br/&gt;本协议内容包括协议正文及所有随缘客已经发布或将来可能发布的各类规则。所有规则为协议不可分割的一部分，与协议正文具有同等法律效力。以任何方式进入随缘客网站并使用服务即表示您已充分阅读、理解并同意接受本协议的条款和条件(以下合称“条款”)。&amp;nbsp;随缘客有权根据业务需要，在不违反国家有关法律法规的前提下修订“条款”，并以网站公告的形式进行公示，不再单独通知您。经修订的“条款”一经在随缘客网站公布，即产生效力。如您不同意相关修订，请您立即停止使用“服务”。如您继续使用“服务”，则将视为您已接受经修订的“条款”，当您与随缘客发生争议时，应以最新的“条款”为准。&lt;br/&gt;在本协议中，“随缘客”指随缘客平台及其关联公司，“商家”指您，即申请人。&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;fontbold&quot; style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(94, 94, 94); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Tahoma, Helvetica, Arial, 宋体, sans-serif, 宋体; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;1、报名商品&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(94, 94, 94); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Tahoma, Helvetica, Arial, 宋体, sans-serif, 宋体; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;商家需按照活动的要求选择自己账号关联店铺内的商品进行报名，请仔细确认填写商品的分类、活动价、库存及包邮、发货信息，针对不符合要求的商品或商家，随缘客有权利直接拒绝报名申请。&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;fontbold&quot; style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(94, 94, 94); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Tahoma, Helvetica, Arial, 宋体, sans-serif, 宋体; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2、活动审核&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(94, 94, 94); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Tahoma, Helvetica, Arial, 宋体, sans-serif, 宋体; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2.1、商家提交活动报名后随缘客审核专员会按照提交顺序、活动类型进行审核，整个审核的范围包括但不限于商品质量、价格、历史评价，以及商家信誉等级、当季热销品类、同行业同类型商品的性价比等方面内容。随缘客在商家提交报名申请之日起在20个工作日内给予结果，在此期间您可随时登录报名系统查询审核状态。&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2.2、审核通过的，系统会提示您进行相应的下一步操作，请根据系统提示尽快补充相应的资料信息，超时未处理的随缘客有权取消本次活动审核。&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2.3、如果您的活动报名申请被设置为“未通过”，请根据随缘客审核专员的审核留言对活动进行调整、或更换符合要求的其他商品再来报名，经3次未通过后频繁重复提交的，随缘客有权锁定对应的报名信息填报系统，您将无法继续报名。&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;fontbold&quot; style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(94, 94, 94); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Tahoma, Helvetica, Arial, 宋体, sans-serif, 宋体; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;3、审核状态说明&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(94, 94, 94); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Tahoma, Helvetica, Arial, 宋体, sans-serif, 宋体; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 随缘客审核条件非常严格，先后经过7道工序，全部通过后再发布上线，即：初审-复审-洽谈-样品邮寄-样品体验-样品备案-排期-上线。商家应保证其提供的商品不违反法律法规，不侵犯任何第三人的知识产权或其他合法权利。&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;3.1、招商专员会经过两轮的活动筛选，即初审、复审，确定您的商品是否适合参加本站活动；&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;3.2、在待洽谈状态时，请主动点击与该活动对应的招商专员QQ与其取得联系（必须是该活动对应的店铺的QQ）；&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;3.3、在样品邮寄状态时，请寄送活动报名对应商品的样品，将快递（含快递名称、快递单号、寄出时间等）信息填写到系统中，以便招商专员能够第一时间反馈样品接收状态并核对样品信息；&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;3.4、您确认并同意：随缘客招商专员在收到样品时，将您的活动状态改为“样品体验”，“样品体验”即随缘客招商专员仅以普通或非专业人员的知识水平标准评估您寄来样品并结合活动条件和规模确定是否符合您所报名的活动推广条件；无论样品是否符合易购活动推广条件，样品均不予退还，随缘客有权对样品进行任何方式的支配和处理。&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;3.5、经随缘客判断符合活动条件的样品，由随缘客留样备案。您确认并同意在活动期间及活动结束后，如随缘客发现消费者投诉或经易购抽检的商品质量有争议的，随缘客有权仅以此样品与争议商品进行比对，您对样品无异议。争议商品与样品是否存在差异以及差异程度以易购主观判断为准。您应保证当次活动所有发货的商品与样品完全一致（包括且不限于商品批次、商品包装、商品分量、同色商品颜色、同规格/尺码商品的规格/尺码及商品材质等各个方面）。&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;3.6、样品体验符合随缘客活动条件的，招商专员会将对应的活动进行初步的排期，如果您对排期问题有异议也可以直接联系招商专员进行调整，确认排期后需要您按照随缘客的指示根据活动商品的活动价、库存销量、技术服务费率和保证金要求进行支付相应的活动保证金和技术服务费。&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;3.7、您已缴纳活动保证金后，即进入随缘客排期时间，您的活动将根据系统排期发布上线，您可以登录随缘客首页查看您的活动详情；商家未按时缴纳保证金导致活动未能按时发布上线的由商家自行承担一切后果；在活动进行中请勿私自修改商品信息或状态，包括但不限于商品标题、图片、SKU信息、价格、库存、邮费设置、宝贝详情信息以及设置商品下架或卖光状态。如商家私自变更商品信息或状态的，随缘客有权将活动商品下架并扣除相应的保证金作为处罚。&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;fontbold&quot; style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(94, 94, 94); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Tahoma, Helvetica, Arial, 宋体, sans-serif, 宋体; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;4、活动保证金&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(94, 94, 94); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Tahoma, Helvetica, Arial, 宋体, sans-serif, 宋体; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;商家的具体应缴保证金数额根据随缘客招商标准及商家的具体情况由随缘客确定。随缘客有权根据商家之业务变化及实际履约情况通知商家调整保证金金额，商家应在收到随缘客通知后的5个自然日内向随缘客交齐保证金，否则，随缘客有权中止或解除本协议。有关保证金的具体内容详见&lt;/span&gt;&lt;a href=&quot;http://www.waanwang.com/help-read-id-8.html&quot; target=&quot;_blank&quot; style=&quot;color: rgb(94, 94, 94); text-decoration: underline; outline: none medium; font-family: 宋体, SimSun;&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;《随缘客商家保证金协议》&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;。&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;4.1、商家在报名参加随缘客推广活动交纳保证金，保证金主要用于保证商家按照随缘客的规则进行经营，商家有任何违规行为或违约行为的，随缘客有权扣除保证金。保证金扣除相关情形具体参见&lt;/span&gt;&lt;a href=&quot;http://www.waanwang.com/help-read-id-9.html&quot; target=&quot;_blank&quot; style=&quot;color: rgb(94, 94, 94); text-decoration: underline; outline: none medium; font-family: 宋体, SimSun;&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;《随缘客商家违规/违约处罚条例》&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;。&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;4.2、随缘客招商专员会根据商家报名活动商品的类型、活动数量综合计算该商家需要缴纳的保证金额度，具体标准可参见&lt;/span&gt;&lt;a href=&quot;http://www.waanwang.com/help-read-id-8.html&quot; target=&quot;_blank&quot; style=&quot;color: rgb(94, 94, 94); text-decoration: underline; outline: none medium; font-family: 宋体, SimSun;&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;《随缘客家保证金协议》&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;。在保证金额度不足的情况下,随缘客有权要求商家限期补足保证金。商家需在收到易购通知后十（10）个自然日内补足保证金金额。如果没有及时交齐保证金的易购有权中止提供相应的技术推广服务，直至商家交齐保证金。&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;4.3、由于保证金不充抵服务费用或其他费用，非因商家原因被扣除的，保证金始终存于商家的易购账户中并处于冻结状态，如合作终止且商家无任何违规或违约行为，则保证金仍无息退还商家。因此随缘客对商家缴纳的保证金不提供收据或发票，敬请谅解。&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;span style=&quot;font-family: 宋体, SimSun; color: red;&quot;&gt;4.4、商家在随缘客网活动期间无任何违规或违约行为的，最后一个活动结束超过17天，且所有交易环节（包括：交易、费用结算、售后处理及买家维权处理）完成，商家可自行申请解冻保证金至商家的易购网账户内。此期间，若随缘客发现商家存在或可能存在违规或违约行为且在该17天内无法处理完毕的，随缘客有权将保证金冻结时间延长30天或操作紧急扣除保证金，待商家违规/违约行为处理完毕后视具体情况解冻或退还。但商家有欠款未向易购付清的，保证金仍无法解冻或退还。&lt;/span&gt;&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;4.5、因资质、商品造假等原因被清退的违规商家，随缘客将不返还保证金，因违规或违约行为扣除的保证金亦不予返还，如扣除保证金仍不足以弥补因其行为给随缘客及消费用户造成的损失的，违规商家还应承担相应的损失赔偿责任。具体保证金扣取情况参见&lt;/span&gt;&lt;a href=&quot;http://www.waanwang.com/help-read-id-8.html&quot; target=&quot;_blank&quot; style=&quot;color: rgb(94, 94, 94); text-decoration: underline; outline: none medium; font-family: 宋体, SimSun;&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;《随缘客商家违规/违约处罚条例》&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;。&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;4.6、随缘客将根据国家经济情况、市场状况及随缘客经营情况适时适当调整保证金制度及保证金标准。保证金的调整会提前以公告形式在易购网站公布。&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;fontbold&quot; style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(94, 94, 94); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Tahoma, Helvetica, Arial, 宋体, sans-serif, 宋体; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;5、商家账户充值及提现规则&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;fontbold&quot; style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(94, 94, 94); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Tahoma, Helvetica, Arial, 宋体, sans-serif, 宋体; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;5.1充值&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(94, 94, 94); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Tahoma, Helvetica, Arial, 宋体, sans-serif, 宋体; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;（1）充值须以活动为目的，随缘客账户仅限充值活动保证金。保证金具体金额根据随缘客招商标准及商家的具体情况如商家资质、信誉状况、预估销售规模、单月销售额水平、合作次数、历史活动评分、商品类目及商品单价等由随缘客招商专员在商家提交报名审核时具体确定；&lt;br/&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;（2）随缘客确定的与活动相关的充值产生的相应手续费由随缘客承担。商家不得利用随缘客平台向易购账户充入与活动无关的任何费用，否则一经发现，随缘客有权采取相应措施，包括但不限于冻结账号余额、拒绝提现。因此产生的手续费由商家自行承担，随缘客已经支付的手续费有权向商家追偿。因此给随缘客造成的任何损失，商家应承担赔偿责任；&lt;br/&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;（3）采用信用卡方式充值的，自充值之日起超过90日申请提现的，付款无法原路退回，随缘客将以转账方式付款到您充值时使用的信用卡账户，转账手续费将在转账时从您的提现金额中即时扣除，手续费费率以银行转账手续费费率为准；&lt;br/&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;（4）商家在随缘客平台的一切活动均应遵守国家法律、法规及国家政策，易购随缘客有理由怀疑商家充入资金来源不合法或存在其他不正当目的的，有权向相关部门举报，并将积极配合有关部门调查；&lt;br/&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;（5）如商家充值资金来源不合法或存在其他不正当目的，被相关部门查处的，一切责任由商家承担；因此造成随缘客任何损失的，商家应承担赔偿责任。&lt;br/&gt;&amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;fontbold&quot; style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(94, 94, 94); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Tahoma, Helvetica, Arial, 宋体, sans-serif, 宋体; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;5.2余额提现&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(94, 94, 94); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Tahoma, Helvetica, Arial, 宋体, sans-serif, 宋体; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;（1）活动期间或活动结束后您可对您已充值的随缘客账户余额办理提现。您申请余额提现时，将一律以原路退回方式付款到您充值时使用的支付账户。采用信用卡方式充值的，自充值之日起超过90日申请提现的，付款无法原路退回，随缘客将以转账方式付款到您充值时使用的信用卡账户，转账手续费将在转账时从您的提现金额中即时扣除，手续费费率以银行转账手续费费率为准。&lt;br/&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;（2）系统仅允许一笔处理中的提现申请，如申请提现时仍有上一笔提现未处理完毕的，将无法继续提交提现申请；每个自然月内最多允许成功提现两次；单笔提现金额不得超出账户内余额；&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;（3）通过支付宝账户申请提现的，因提现产生的相应手续费由商家承担，即：商家提现时将从提现金额中即时扣除小额手续费，具体以支付宝有关手续费的规定比例为准；&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;（4）为了更好的保护您的账户和资金安全，避免因您的账号信息泄露导致恶意提现或变更，请您务必妥善保管好自己的易购账户信息。如因您个人原因导致账号被盗或余额被提现的，随缘客不承担任何责任。&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;fontbold&quot; style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(94, 94, 94); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Tahoma, Helvetica, Arial, 宋体, sans-serif, 宋体; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;6、违约责任&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(94, 94, 94); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Tahoma, Helvetica, Arial, 宋体, sans-serif, 宋体; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;商家有任何违反本协议条款之行为的，按照&lt;/span&gt;&lt;a href=&quot;http://www.waanwang.com/help-read-id-7.html&quot; target=&quot;_blank&quot; style=&quot;color: rgb(94, 94, 94); text-decoration: underline; outline: none medium; font-family: 宋体, SimSun;&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;《随缘客商家违规处罚条例》&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;的规定扣除相应保证金并（或）进行其他相应的处罚。&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;fontbold&quot; style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(94, 94, 94); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Tahoma, Helvetica, Arial, 宋体, sans-serif, 宋体; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;7、责任免除情形&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(94, 94, 94); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Tahoma, Helvetica, Arial, 宋体, sans-serif, 宋体; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;（1）因战争、自然灾害、政府行为、互联网灾难、互联网通讯提供商等导致随缘客网络平台服务器不能正常运行的；&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;（2）因随缘客网站遭遇不法分子攻击或非法劫持导致随缘客网络平台服务器临时性不能正常运行或随缘客网站不能正常访问的。&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;（3）您理解并同意，如遇大型促销活动期间，用户访问量巨大时，网络环境可能存在一定的不稳定性，易购随缘客系统平台偶尔出现短时无法访问属正常现象。&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;fontbold&quot; style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(94, 94, 94); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Tahoma, Helvetica, Arial, 宋体, sans-serif, 宋体; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;8、协议效力&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(94, 94, 94); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Tahoma, Helvetica, Arial, 宋体, sans-serif, 宋体; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;本协议适用于以任何形式参加随缘客平台推广活动的所有商家，商家在任何时候参加随缘客活动均受本协议约束，本协议对双方均发生法律效力。&lt;br/&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;fontbold&quot; style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(94, 94, 94); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Tahoma, Helvetica, Arial, 宋体, sans-serif, 宋体; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;9、法律适用及争议解决&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(94, 94, 94); font-family: &amp;quot;Microsoft Yahei&amp;quot;, Tahoma, Helvetica, Arial, 宋体, sans-serif, 宋体; font-size: 12px; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;font-family: 宋体, SimSun;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 本协议的生效、解释、执行、管辖、争议的解决均适用中华人民共和国法律。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;',1435672310);
/*!40000 ALTER TABLE `ds_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_editable_page`
--

DROP TABLE IF EXISTS `ds_editable_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_editable_page` (
  `editable_page_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '页面类型id',
  `editable_page_name` varchar(60) NOT NULL COMMENT '页面名称',
  `editable_page_path` varchar(60) NOT NULL DEFAULT '' COMMENT 'index/index商场首页store/index店铺首页special/index专题活动页',
  `editable_page_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '页面项目id',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `editable_page_client` varchar(10) NOT NULL COMMENT '客户端pc、h5',
  `editable_page_theme` varchar(60) NOT NULL COMMENT '页面主题',
  `editable_page_theme_config` text NOT NULL COMMENT '页面主题配置',
  `editable_page_edit_time` int(10) unsigned NOT NULL COMMENT '页面编辑时间',
  PRIMARY KEY (`editable_page_id`),
  KEY `store_id` (`store_id`),
  KEY `editable_page_item_id` (`editable_page_item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='可编辑页面表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_editable_page`
--

LOCK TABLES `ds_editable_page` WRITE;
/*!40000 ALTER TABLE `ds_editable_page` DISABLE KEYS */;
INSERT INTO `ds_editable_page` VALUES (2,'京东清爽专题页','',0,0,'pc','style_1','{\"back_color\":\"rgb(239,239,247)\"}',1564203449),(3,'京东灵动专题页','',0,0,'h5','style_1','{\"back_color\":\"rgb(246, 246, 246)\"}',1608545893);
/*!40000 ALTER TABLE `ds_editable_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_editable_page_config`
--

DROP TABLE IF EXISTS `ds_editable_page_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_editable_page_config` (
  `editable_page_config_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '页面配置id',
  `editable_page_id` int(10) unsigned NOT NULL COMMENT '页面id',
  `editable_page_model_id` int(10) unsigned NOT NULL COMMENT '页面模块id',
  `editable_page_config_sort_order` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  `editable_page_config_content` text NOT NULL COMMENT '配置内容',
  PRIMARY KEY (`editable_page_config_id`),
  KEY `editable_page_id` (`editable_page_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='可编辑页面配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_editable_page_config`
--

LOCK TABLES `ds_editable_page_config` WRITE;
/*!40000 ALTER TABLE `ds_editable_page_config` DISABLE KEYS */;
INSERT INTO `ds_editable_page_config` VALUES (1,1,3,1,'{\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"20px\",\"goods\":[{\"gc_id\":0,\"sort\":\"new\",\"if_fix\":0,\"count\":3,\"goods_id\":[]}]}'),(2,1,1,0,'{\"width\":\"100%\",\"height\":\"700px\",\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"20px\",\"image\":[{\"count\":2,\"list\":{\"1\":{\"path\":\"\\/uploads\\/home\\/editable_page\\/5d3a7c20a5597.jpg\",\"sort\":\"9\"},\"0\":{\"path\":\"\\/uploads\\/home\\/editable_page\\/5d3a7c1de5082.jpg\",\"sort\":\"9\"}}}],\"link\":[{\"count\":2,\"list\":[]}]}'),(3,1,2,2,'{\"width\":\"1200px\",\"height\":\"370px\",\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"20px\",\"editor\":[\"&lt;p style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 36px;&quot;&gt;&lt;br\\/&gt;&lt;\\/span&gt;&lt;\\/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 36px;&quot;&gt;\\u8d2d\\u673a\\u4eab\\u6743\\u76ca&lt;\\/span&gt;&lt;br\\/&gt;&lt;\\/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 36px;&quot;&gt;&lt;br\\/&gt;&lt;\\/span&gt;&lt;\\/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 36px;&quot;&gt;&lt;img src=&quot;\\/uploads\\/home\\/editable_page\\/5d3a7f70e10bc.jpg&quot;\\/&gt;&lt;\\/span&gt;&lt;\\/p&gt;\"]}'),(5,1,4,3,'{\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"20px\",\"image\":[{\"count\":1,\"list\":[{\"path\":\"\\/uploads\\/home\\/editable_page\\/5d3a8aaea1789.jpg\",\"sort\":\"9\"}]}],\"goods\":[{\"gc_id\":0,\"sort\":\"new\",\"if_fix\":0,\"count\":1,\"goods_id\":[]}]}'),(6,1,5,4,'{\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"20px\",\"goods\":[{\"gc_id\":0,\"sort\":\"new\",\"if_fix\":0,\"count\":4,\"goods_id\":[]}]}'),(7,1,7,6,'{\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"20px\",\"goods\":[{\"gc_id\":0,\"sort\":\"hot\",\"if_fix\":0,\"count\":1,\"goods_id\":[]}]}'),(9,1,3,8,'{\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"20px\",\"goods\":[{\"gc_id\":0,\"sort\":\"new\",\"if_fix\":0,\"count\":3,\"goods_id\":[]}]}'),(10,1,2,5,'{\"width\":\"1200px\",\"height\":\"60px\",\"back_color\":\"unset\",\"margin_top\":\"50px\",\"margin_bottom\":\"0\",\"editor\":[\"&lt;p style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 36px;&quot;&gt;\\u95ea\\u5145\\u5bb6\\u65cf&lt;\\/span&gt;&lt;\\/p&gt;\"]}'),(11,1,7,7,'{\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"20px\",\"goods\":[{\"gc_id\":0,\"sort\":\"new\",\"if_fix\":0,\"count\":1,\"goods_id\":[]}]}'),(12,1,2,9,'{\"width\":\"1200px\",\"height\":\"500px\",\"back_color\":\"#fff\",\"margin_top\":\"0\",\"margin_bottom\":\"0\",\"editor\":[\"&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;br\\/&gt;&lt;\\/span&gt;&lt;\\/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;br\\/&gt;&lt;\\/span&gt;&lt;\\/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;br\\/&gt;&lt;\\/span&gt;&lt;\\/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;&lt;br\\/&gt;&lt;\\/span&gt;&lt;\\/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;\\u6d3b\\u52a8\\u89c4\\u5219&lt;\\/span&gt;&lt;\\/p&gt;&lt;p&gt;&lt;br\\/&gt;&lt;\\/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;1.\\u4ee5\\u65e7\\u6362\\u65b0&lt;\\/span&gt;&lt;\\/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;7\\u67081\\u65e5-7\\u670831\\u65e5\\u671f\\u95f4\\uff0c\\u7528\\u6237\\u5728\\u6d3b\\u52a8\\u671f\\u95f4\\u8d2d\\u4e70OPPO\\u5b98\\u65b9\\u65d7\\u8230\\u5e97\\u624b\\u673a\\u4ea7\\u54c1\\uff08\\u4e03\\u5929\\u5185\\u65e0\\u9000\\u8d27\\uff09\\uff0c\\u4e14\\u4e8e\\u6d3b\\u52a8\\u671f\\u5185\\u63d0\\u4ea4\\u5e76\\u5b8c\\u6210\\u65e7\\u624b\\u673a\\u56de\\u6536\\u8ba2\\u5355\\uff0c\\u5355\\u7b14\\u56de\\u6536\\u91d1\\u989d\\u6ee14000\\u5143\\u8fd4320\\u5143\\u3001\\u5355\\u7b14\\u56de\\u6536\\u91d1\\u989d\\u6ee12000\\u5143\\u8fd4120\\u5143\\u3002&lt;\\/span&gt;&lt;\\/p&gt;&lt;p&gt;&lt;br\\/&gt;&lt;\\/p&gt;&lt;p&gt;&lt;br\\/&gt;&lt;\\/p&gt;&lt;p&gt;&lt;br\\/&gt;&lt;\\/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;2.\\u6652\\u5355\\u6709\\u5229&lt;\\/span&gt;&lt;\\/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;7\\u67081\\u65e5-7\\u670831\\u65e5\\u671f\\u95f4\\u6210\\u529f\\u8d2d\\u4e70OPPO\\u624b\\u673a\\u7684\\u7528\\u6237\\uff0c\\u5e76\\u4e8e8\\u670815\\u65e5\\u4e4b\\u524d\\u786e\\u8ba4\\u6536\\u8d27\\u4e14\\u53c2\\u4e0e\\u8bc4\\u4ef7\\uff083\\u5f20\\u4ee5\\u4e0a\\u624b\\u673a\\u5b9e\\u7269\\u56fe+25\\u5b57\\u4ee5\\u4e0a\\u4f7f\\u7528\\u4f53\\u9a8c\\uff09\\uff0c\\u53ef\\u83b7\\u8d60\\u817e\\u8baf\\u89c6\\u9891\\u4f1a\\u5458\\u6708\\u5361\\u3002&lt;br\\/&gt;&lt;\\/span&gt;&lt;\\/p&gt;&lt;p&gt;&lt;br\\/&gt;&lt;\\/p&gt;&lt;p&gt;&lt;br\\/&gt;&lt;\\/p&gt;&lt;p&gt;&lt;br\\/&gt;&lt;\\/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;3.\\u63a8\\u8350\\u6709\\u793c&lt;\\/span&gt;&lt;\\/p&gt;&lt;p&gt;&lt;span style=&quot;font-size: 16px;&quot;&gt;\\u8001\\u7528\\u6237\\u4ecb\\u7ecd\\u670b\\u53cb\\u6210\\u529f\\u8d2d\\u673a\\u5373\\u53ef\\u83b7\\u5f97OPPOx\\u91ce\\u517d\\u6d3e\\u5b9a\\u5236\\u793c\\u76d2\\uff0c\\u8be6\\u8be2\\u5ba2\\u670d\\u3002&lt;\\/span&gt;&lt;\\/p&gt;\"]}'),(18,2,8,0,'{\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"40px\",\"image\":{\"0\":{\"count\":5,\"list\":{\"4\":{\"path\":\"\\/uploads\\/home\\/editable_page\\/5d3bd1592e1a3.gif\",\"sort\":\"9\"},\"3\":{\"path\":\"\\/uploads\\/home\\/editable_page\\/5d3bd1565fde3.gif\",\"sort\":\"9\"},\"2\":{\"path\":\"\\/uploads\\/home\\/editable_page\\/5d3bd1539d1be.gif\",\"sort\":\"9\"},\"1\":{\"path\":\"\\/uploads\\/home\\/editable_page\\/5d3bd15072958.gif\",\"sort\":\"9\"},\"0\":{\"path\":\"\\/uploads\\/home\\/editable_page\\/5d3bd14d7d0a7.gif\",\"sort\":\"9\"}}},\"1\":{\"count\":3,\"list\":{\"2\":{\"path\":\"\\/uploads\\/home\\/editable_page\\/5d3bd20c38e74.jpg\",\"sort\":\"9\"},\"1\":{\"path\":\"\\/uploads\\/home\\/editable_page\\/5d3bd20a2651d.jpg\",\"sort\":\"9\"},\"0\":{\"path\":\"\\/uploads\\/home\\/editable_page\\/5d3bd20841649.jpg\",\"sort\":\"9\"}}},\"4\":{\"count\":1,\"list\":[{\"path\":\"\\/uploads\\/home\\/editable_page\\/5d3bd25f761fd.png\",\"sort\":\"9\"}]}},\"cate\":[{\"gc_id\":0,\"list\":{\"1\":{\"gc_id\":\"1\",\"sort\":\"9\"},\"4\":{\"gc_id\":\"4\",\"sort\":\"9\"},\"8\":{\"gc_id\":\"8\",\"sort\":\"9\"},\"9\":{\"gc_id\":\"9\",\"sort\":\"9\"},\"10\":{\"gc_id\":\"10\",\"sort\":\"9\"},\"11\":{\"sort\":\"9\"},\"12\":{\"sort\":\"9\"},\"15\":{\"sort\":\"9\"},\"16\":{\"sort\":\"9\"},\"468\":{\"sort\":\"9\"}}}],\"link\":{\"1\":{\"count\":3,\"list\":[]},\"3\":{\"count\":3,\"list\":[]},\"4\":{\"count\":1,\"list\":[]}},\"text\":{\"2\":{\"count\":2,\"list\":{\"1\":{\"content\":\"\\u5934\\u6761\",\"sort\":\"9\"},\"0\":{\"content\":\"\\u751f\\u9c9c\",\"sort\":\"9\"}}},\"3\":{\"count\":3,\"list\":{\"2\":{\"content\":\"\\u4e00\\u952e\\u7acb\\u4eab \\u7528\\u5fc3\\u505a\\u987f\\u597d\\u996d\",\"sort\":\"9\"},\"1\":{\"content\":\"0\\u5143\\u8bd5\\u5403 \\u5168\\u65b0\\u4e0a\\u7ebf \\u6293\\u7d27\\u5c1d\\u9c9c\",\"sort\":\"9\"},\"0\":{\"content\":\"\\u7cbe\\u6311\\u7ec6\\u9009100\\u5206\\u8425\\u517b\\u7f8e\\u5473\",\"sort\":\"9\"}}}}}'),(20,2,9,1,'{\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"40px\",\"image\":[{\"count\":1,\"list\":[{\"path\":\"\\/uploads\\/home\\/editable_page\\/5d3c16f97ba58.png\",\"sort\":\"9\"}]},{\"count\":1,\"list\":[{\"path\":\"\\/uploads\\/home\\/editable_page\\/5d3c17024328f.jpg\",\"sort\":\"9\"}]},{\"count\":1,\"list\":[{\"path\":\"\\/uploads\\/home\\/editable_page\\/5d3c170c8227d.png\",\"sort\":\"9\"}]}],\"cate\":[{\"gc_id\":1,\"list\":{\"321\":{\"gc_id\":\"321\",\"sort\":\"9\"},\"338\":{\"gc_id\":\"338\",\"sort\":\"9\"},\"49\":{\"gc_id\":\"49\",\"sort\":\"9\"},\"48\":{\"gc_id\":\"48\",\"sort\":\"9\"},\"3\":{\"gc_id\":\"3\",\"sort\":\"9\"},\"2\":{\"gc_id\":\"2\",\"sort\":\"9\"}}}],\"link\":{\"1\":{\"count\":1,\"list\":[]},\"2\":{\"count\":1,\"list\":[]}},\"text\":[{\"count\":2,\"list\":{\"1\":{\"content\":\"\\u5e94\\u65f6\\u800c\\u91c7\\uff0c\\u65b0\\u9c9c\\u7279\\u4f9b\",\"sort\":\"9\"},\"0\":{\"content\":\"\\u65b0\\u9c9c\\u6c34\\u679c\",\"sort\":\"9\"}}}],\"goods\":{\"3\":{\"count\":6,\"gc_id\":0,\"sort\":\"new\",\"if_fix\":0,\"goods_id\":[]}},\"brand\":{\"4\":{\"count\":10,\"gc_id\":0,\"if_fix\":0,\"brand_id\":[]}}}'),(21,2,10,2,'{\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"40px\",\"image\":{\"0\":{\"count\":1,\"list\":[{\"path\":\"\\/uploads\\/home\\/editable_page\\/5d3c1f61a3a52.png\",\"sort\":\"9\"}]},\"1\":{\"count\":1,\"list\":[{\"path\":\"\\/uploads\\/home\\/editable_page\\/5d3c20d295ed8.png\",\"sort\":\"9\"}]},\"5\":{\"count\":1,\"list\":[{\"path\":\"\\/uploads\\/home\\/editable_page\\/5d3c20e36ed8d.png\",\"sort\":\"9\"}]},\"6\":{\"count\":1,\"list\":[{\"path\":\"\\/uploads\\/home\\/editable_page\\/5d3c20ea2911e.png\",\"sort\":\"9\"}]}},\"cate\":{\"0\":{\"gc_id\":4,\"list\":{\"54\":{\"gc_id\":\"54\",\"sort\":\"9\"},\"392\":{\"gc_id\":\"392\",\"sort\":\"9\"},\"51\":{\"gc_id\":\"51\",\"sort\":\"9\"},\"7\":{\"gc_id\":\"7\",\"sort\":\"9\"},\"6\":{\"gc_id\":\"6\",\"sort\":\"9\"},\"5\":{\"gc_id\":\"5\",\"sort\":\"9\"}}},\"5\":{\"gc_id\":10,\"list\":{\"420\":{\"gc_id\":\"420\",\"sort\":\"9\"},\"422\":{\"sort\":\"9\"},\"434\":{\"sort\":\"9\"},\"59\":{\"gc_id\":\"59\",\"sort\":\"9\"},\"58\":{\"gc_id\":\"58\",\"sort\":\"9\"},\"26\":{\"gc_id\":\"26\",\"sort\":\"9\"},\"27\":{\"gc_id\":\"27\",\"sort\":\"9\"},\"25\":{\"gc_id\":\"25\",\"sort\":\"9\"}}}},\"link\":{\"1\":{\"count\":1,\"list\":[]},\"6\":{\"count\":1,\"list\":[]}},\"text\":{\"0\":{\"count\":2,\"list\":{\"1\":{\"content\":\"\\u901f\\u51bb\\u7f8e\\u5473\\uff0c\\u4e50\\u4eab\\u751f\\u6d3b\",\"sort\":\"9\"},\"0\":{\"content\":\"\\u51b7\\u51bb\\u996e\\u54c1\",\"sort\":\"9\"}}},\"5\":{\"count\":2,\"list\":{\"1\":{\"content\":\"\\u6765\\u81ea\\u7530\\u95f4\\uff0c\\u6e05\\u9999\\u72b9\\u5b58\",\"sort\":\"9\"},\"0\":{\"content\":\"\\u65b0\\u9c9c\\u852c\\u83dc\",\"sort\":\"9\"}}}},\"goods\":{\"3\":{\"count\":3,\"gc_id\":0,\"sort\":\"new\",\"if_fix\":0,\"goods_id\":[]},\"7\":{\"count\":3,\"gc_id\":0,\"sort\":\"new\",\"if_fix\":0,\"goods_id\":[]}},\"brand\":{\"4\":{\"count\":5,\"gc_id\":0,\"if_fix\":0,\"brand_id\":[]},\"8\":{\"count\":5,\"gc_id\":0,\"if_fix\":0,\"brand_id\":[]}}}'),(22,2,11,3,'{\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"40px\",\"image\":[{\"count\":4,\"list\":[{\"path\":\"\\/uploads\\/home\\/editable_page\\/5d3c280be7e0f.gif\",\"sort\":\"1\"},{\"path\":\"\\/uploads\\/home\\/editable_page\\/5d3c280f3fdce.gif\",\"sort\":\"2\"},{\"path\":\"\\/uploads\\/home\\/editable_page\\/5d3c2812c0652.gif\",\"sort\":\"3\"},{\"path\":\"\\/uploads\\/home\\/editable_page\\/5d3c2818e1d7f.gif\",\"sort\":\"4\"},{\"path\":\"\\/uploads\\/home\\/editable_page\\/5d3c37607b932.jpg\",\"sort\":\"9\"}]}],\"goods\":[{\"count\":40,\"gc_id\":1,\"sort\":\"new\",\"if_fix\":0,\"goods_id\":[]},{\"count\":40,\"gc_id\":4,\"sort\":\"new\",\"if_fix\":0,\"goods_id\":[]},{\"count\":40,\"gc_id\":8,\"sort\":\"new\",\"if_fix\":0,\"goods_id\":[]},{\"count\":40,\"gc_id\":1,\"sort\":\"new\",\"if_fix\":0,\"goods_id\":[]}],\"link\":[{\"count\":4}]}'),(25,3,1,0,'{\"width\":\"100%\",\"height\":\"188px\",\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"0\",\"image\":[{\"count\":2,\"list\":{\"1\":{\"path\":\"\\/uploads\\/home\\/common\\/page-model-h5-1-1.png\",\"sort\":\"9\"},\"0\":{\"path\":\"\\/uploads\\/home\\/common\\/page-model-h5-1-1.png\",\"sort\":\"9\"}}}],\"link\":[{\"count\":2,\"list\":[]}]}');
/*!40000 ALTER TABLE `ds_editable_page_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_editable_page_model`
--

DROP TABLE IF EXISTS `ds_editable_page_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_editable_page_model` (
  `editable_page_model_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '页面模块id',
  `editable_page_model_name` varchar(60) NOT NULL COMMENT '页面模块名称',
  `editable_page_model_intro` varchar(255) NOT NULL DEFAULT '' COMMENT '页面模块简介',
  `editable_page_model_type` text NOT NULL COMMENT 'mall商城store店铺，空表示通用',
  `editable_page_theme` text NOT NULL COMMENT '页面主题，多个用|分隔，空表示通用',
  `editable_page_model_client` varchar(10) NOT NULL DEFAULT '' COMMENT '客户端pc、h5，空表示通用',
  `editable_page_model_content` text NOT NULL COMMENT '配置内容',
  PRIMARY KEY (`editable_page_model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='可编辑页面模块表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_editable_page_model`
--

LOCK TABLES `ds_editable_page_model` WRITE;
/*!40000 ALTER TABLE `ds_editable_page_model` DISABLE KEYS */;
INSERT INTO `ds_editable_page_model` VALUES (1,'轮播图','','','','','{\"width\":\"100%\",\"height\":\"700px\",\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"0\",\"image\":[{\"count\":2,\"list\":{\"1\":{\"path\":\"\\/uploads\\/home\\/common\\/page-model-1-1.png\",\"sort\":\"9\"},\"0\":{\"path\":\"\\/uploads\\/home\\/common\\/page-model-1-1.png\",\"sort\":\"9\"}}}],\"link\":[{\"count\":2,\"list\":[]}]}'),(2,'富文本','','','','','{\"width\":\"1200px\",\"height\":\"450px\",\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"0\",\"editor\":[\"&lt;p style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;font-size: 24px;&quot;&gt;\\u7c89\\u4e1d\\u4e13\\u4eab&lt;\\/span&gt;&lt;br\\/&gt;&lt;\\/p&gt;&lt;p style=&quot;text-align: center;&quot;&gt;\\u524d\\u5f80APP\\u5e97\\u94fa\\u9996\\u9875\\u53c2\\u4e0e\\u6d3b\\u52a8&lt;\\/p&gt;&lt;p&gt;&lt;br\\/&gt;&lt;\\/p&gt;&lt;table&gt;&lt;tbody&gt;&lt;tr class=&quot;firstRow&quot;&gt;&lt;td valign=&quot;middle&quot; rowspan=&quot;1&quot; colspan=&quot;4&quot; style=&quot;word-break: break-all;&quot; align=&quot;center&quot;&gt;&lt;img src=&quot;\\/uploads\\/home\\/common\\/page-model-2-1.png&quot;\\/&gt;&lt;\\/td&gt;&lt;\\/tr&gt;&lt;tr&gt;&lt;td width=&quot;175&quot; valign=&quot;middle&quot; style=&quot;word-break: break-all;&quot; align=&quot;left&quot;&gt;&lt;img src=&quot;\\/uploads\\/home\\/common\\/page-model-2-2.png&quot;\\/&gt;&lt;\\/td&gt;&lt;td width=&quot;175&quot; valign=&quot;middle&quot; style=&quot;word-break: break-all;&quot; align=&quot;center&quot;&gt;&lt;img src=&quot;\\/uploads\\/home\\/common\\/page-model-2-2.png&quot;\\/&gt;&lt;\\/td&gt;&lt;td width=&quot;175&quot; valign=&quot;middle&quot; style=&quot;word-break: break-all;&quot; align=&quot;center&quot;&gt;&lt;img src=&quot;\\/uploads\\/home\\/common\\/page-model-2-2.png&quot;\\/&gt;&lt;\\/td&gt;&lt;td width=&quot;175&quot; valign=&quot;middle&quot; style=&quot;word-break: break-all;&quot; align=&quot;right&quot;&gt;&lt;img src=&quot;\\/uploads\\/home\\/common\\/page-model-2-2.png&quot;\\/&gt;&lt;\\/td&gt;&lt;\\/tr&gt;&lt;\\/tbody&gt;&lt;\\/table&gt;&lt;p&gt;&lt;br\\/&gt;&lt;\\/p&gt;\"]}'),(3,'三列商品','','store','','pc','{\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"0\",\"goods\":[{\"gc_id\":0,\"sort\":\"new\",\"if_fix\":0,\"count\":3,\"goods_id\":[]}]}'),(4,'一个商品','','store','','pc','{\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"0\",\"image\":[{\"count\":1,\"list\":[]}],\"goods\":[{\"gc_id\":0,\"sort\":\"new\",\"if_fix\":0,\"count\":1,\"goods_id\":[]}]}'),(5,'两列商品','','store','','pc','{\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"0\",\"goods\":[{\"gc_id\":0,\"sort\":\"new\",\"if_fix\":0,\"count\":2,\"goods_id\":[]}]}'),(6,'两列商品','','','','h5','{\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"0\",\"text\":[{\"count\":1,\"list\":[{\"content\":\"\\u6807\\u9898\",\"sort\":\"9\"}]}],\"goods\":[{\"gc_id\":0,\"sort\":\"new\",\"if_fix\":0,\"count\":2,\"goods_id\":[]}]}'),(7,'一个商品','','store','','pc','{\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"0\",\"goods\":[{\"gc_id\":0,\"sort\":\"new\",\"if_fix\":0,\"count\":1,\"goods_id\":[]}]}'),(8,'商品分类和轮播图','分类小图标尺寸26*26px，轮播图800*400px，右下广告图188*245px','mall','','pc','{\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"0\",\"image\":{\"0\":{\"count\":5,\"list\":{\"4\":{\"path\":\"\\/uploads\\/home\\/common\\/page-model-8-1.png\",\"sort\":\"9\"},\"3\":{\"path\":\"\\/uploads\\/home\\/common\\/page-model-8-1.png\",\"sort\":\"9\"},\"2\":{\"path\":\"\\/uploads\\/home\\/common\\/page-model-8-1.png\",\"sort\":\"9\"},\"1\":{\"path\":\"\\/uploads\\/home\\/common\\/page-model-8-1.png\",\"sort\":\"9\"},\"0\":{\"path\":\"\\/uploads\\/home\\/common\\/page-model-8-1.png\",\"sort\":\"9\"}}},\"1\":{\"count\":3,\"list\":{\"2\":{\"path\":\"\\/uploads\\/home\\/common\\/page-model-8-2.png\",\"sort\":\"9\"},\"1\":{\"path\":\"\\/uploads\\/home\\/common\\/page-model-8-2.png\",\"sort\":\"9\"},\"0\":{\"path\":\"\\/uploads\\/home\\/common\\/page-model-8-2.png\",\"sort\":\"9\"}}},\"4\":{\"count\":1,\"list\":[{\"path\":\"\\/uploads\\/home\\/common\\/page-model-8-3.png\",\"sort\":\"9\"}]}},\"cate\":[{\"gc_id\":0,\"list\":{\"15\":{\"gc_id\":\"15\",\"sort\":\"9\"},\"16\":{\"gc_id\":\"16\",\"sort\":\"9\"},\"468\":{\"gc_id\":\"468\",\"sort\":\"9\"},\"12\":{\"gc_id\":\"12\",\"sort\":\"9\"},\"11\":{\"gc_id\":\"11\",\"sort\":\"9\"},\"8\":{\"gc_id\":\"8\",\"sort\":\"9\"},\"9\":{\"gc_id\":\"9\",\"sort\":\"9\"},\"10\":{\"gc_id\":\"10\",\"sort\":\"9\"},\"4\":{\"gc_id\":\"4\",\"sort\":\"9\"}}}],\"link\":{\"1\":{\"count\":3,\"list\":[]},\"3\":{\"count\":3,\"list\":[]},\"4\":{\"count\":1,\"list\":[]}},\"text\":{\"2\":{\"count\":2,\"list\":{\"1\":{\"content\":\"\\u6807\\u9898\",\"sort\":\"9\"},\"0\":{\"content\":\"\\u6807\\u9898\",\"sort\":\"9\"}}},\"3\":{\"count\":3,\"list\":{\"2\":{\"content\":\"\\u6587\\u7ae03\",\"sort\":\"9\"},\"1\":{\"content\":\"\\u6587\\u7ae02\",\"sort\":\"9\"},\"0\":{\"content\":\"\\u6587\\u7ae01\",\"sort\":\"9\"}}}}}'),(9,'分类商品列表','左侧产品分类背景图尺寸200*300px，中间广告图600*300px，右侧广告图400*300px','mall','','pc','{\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"0\",\"image\":[{\"count\":1,\"list\":[{\"path\":\"\\/uploads\\/home\\/common\\/page-model-9-1.png\",\"sort\":\"9\"}]},{\"count\":1,\"list\":[{\"path\":\"\\/uploads\\/home\\/common\\/page-model-9-2.png\",\"sort\":\"9\"}]},{\"count\":1,\"list\":[{\"path\":\"\\/uploads\\/home\\/common\\/page-model-9-3.png\",\"sort\":\"9\"}]}],\"cate\":[{\"gc_id\":0,\"list\":[]}],\"link\":{\"1\":{\"count\":1,\"list\":[]},\"2\":{\"count\":1,\"list\":[]}},\"text\":[{\"count\":2,\"list\":{\"1\":{\"content\":\"\\u5c0f\\u6807\\u9898\",\"sort\":\"9\"},\"0\":{\"content\":\"\\u5927\\u6807\\u9898\",\"sort\":\"9\"}}}],\"goods\":{\"3\":{\"count\":6,\"gc_id\":0,\"sort\":\"new\",\"if_fix\":0,\"goods_id\":[]}},\"brand\":{\"4\":{\"count\":10,\"gc_id\":0,\"if_fix\":0,\"brand_id\":[]}}}'),(10,'两列分类商品列表','左侧产品分类背景图尺寸200*300px，右侧广告图395*300px','mall','','pc','{\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"0\",\"image\":{\"0\":{\"count\":1,\"list\":[{\"path\":\"\\/uploads\\/home\\/common\\/page-model-10-1.png\",\"sort\":\"9\"}]},\"1\":{\"count\":1,\"list\":[{\"path\":\"\\/uploads\\/home\\/common\\/page-model-10-2.png\",\"sort\":\"9\"}]},\"5\":{\"count\":1,\"list\":[{\"path\":\"\\/uploads\\/home\\/common\\/page-model-10-1.png\",\"sort\":\"9\"}]},\"6\":{\"count\":1,\"list\":[{\"path\":\"\\/uploads\\/home\\/common\\/page-model-10-2.png\",\"sort\":\"9\"}]}},\"cate\":{\"0\":{\"gc_id\":0,\"list\":[]},\"5\":{\"gc_id\":0,\"list\":[]}},\"link\":{\"1\":{\"count\":1,\"list\":[]},\"6\":{\"count\":1,\"list\":[]}},\"text\":{\"0\":{\"count\":2,\"list\":{\"1\":{\"content\":\"\\u5c0f\\u6807\\u9898\",\"sort\":\"9\"},\"0\":{\"content\":\"\\u5927\\u6807\\u9898\",\"sort\":\"9\"}}},\"5\":{\"count\":2,\"list\":{\"1\":{\"content\":\"\\u5c0f\\u6807\\u9898\",\"sort\":\"9\"},\"0\":{\"content\":\"\\u5927\\u6807\\u9898\",\"sort\":\"9\"}}}},\"goods\":{\"3\":{\"count\":3,\"gc_id\":0,\"sort\":\"new\",\"if_fix\":0,\"goods_id\":[]},\"7\":{\"count\":3,\"gc_id\":0,\"sort\":\"new\",\"if_fix\":0,\"goods_id\":[]}},\"brand\":{\"4\":{\"count\":5,\"gc_id\":0,\"if_fix\":0,\"brand_id\":[]},\"8\":{\"count\":5,\"gc_id\":0,\"if_fix\":0,\"brand_id\":[]}}}'),(11,'分类切换商品列表','分类图标尺寸90*90px，上下结构，上部分为初始状态图标，下部分为活动状态图标','mall','','pc','{\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"0\",\"image\":[{\"count\":4,\"list\":{\"3\":{\"path\":\"\\/uploads\\/home\\/common\\/page-model-11-1.png\",\"sort\":\"9\"},\"2\":{\"path\":\"\\/uploads\\/home\\/common\\/page-model-11-1.png\",\"sort\":\"9\"},\"1\":{\"path\":\"\\/uploads\\/home\\/common\\/page-model-11-1.png\",\"sort\":\"9\"},\"0\":{\"path\":\"\\/uploads\\/home\\/common\\/page-model-11-1.png\",\"sort\":\"9\"}}}],\"goods\":[{\"count\":40,\"gc_id\":0,\"sort\":\"new\",\"if_fix\":0,\"goods_id\":[]},{\"count\":40,\"gc_id\":0,\"sort\":\"new\",\"if_fix\":0,\"goods_id\":[]},{\"count\":40,\"gc_id\":0,\"sort\":\"new\",\"if_fix\":0,\"goods_id\":[]},{\"count\":40,\"gc_id\":0,\"sort\":\"new\",\"if_fix\":0,\"goods_id\":[]}]}'),(12,'导航列表','','','','h5','{\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"0\",\"image\":[{\"count\":5,\"list\":{\"4\":{\"path\":\"\\/uploads\\/home\\/common\\/page-model-h5-12-1.png\",\"sort\":\"9\"},\"3\":{\"path\":\"\\/uploads\\/home\\/common\\/page-model-h5-12-1.png\",\"sort\":\"9\"},\"2\":{\"path\":\"\\/uploads\\/home\\/common\\/page-model-h5-12-1.png\",\"sort\":\"9\"},\"1\":{\"path\":\"\\/uploads\\/home\\/common\\/page-model-h5-12-1.png\",\"sort\":\"9\"},\"0\":{\"path\":\"\\/uploads\\/home\\/common\\/page-model-h5-12-1.png\",\"sort\":\"9\"}}}],\"text\":[{\"count\":5,\"list\":{\"4\":{\"content\":\"\\u83dc\\u5355\",\"sort\":\"9\"},\"3\":{\"content\":\"\\u83dc\\u5355\",\"sort\":\"9\"},\"2\":{\"content\":\"\\u83dc\\u5355\",\"sort\":\"9\"},\"1\":{\"content\":\"\\u83dc\\u5355\",\"sort\":\"9\"},\"0\":{\"content\":\"\\u83dc\\u5355\",\"sort\":\"9\"}}}],\"link\":[{\"count\":5,\"list\":[]}]}'),(13,'滚动通知','左侧图片94*44px','','','h5','{\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"0\",\"image\":[{\"count\":1,\"list\":[{\"path\":\"\\/uploads\\/home\\/common\\/editable-page-model-h5-13-1.png\",\"sort\":\"9\"}]}],\"text\":{\"1\":{\"count\":1,\"list\":[{\"content\":\"\\u8bf7\\u8bbe\\u7f6e\\u901a\\u77e5\\u6587\\u5b57\",\"sort\":\"9\"}]}},\"link\":{\"1\":{\"count\":1,\"list\":[{\"content\":\"\\u901a\\u77e5\",\"sort\":\"9\"}]}}}'),(14,'分类切换图片','分类图片100*100px，上下结构，上部分为初始状态图标，下部分为活动状态图标。下方广告图尺寸112*154px','','','h5','{\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"0\",\"image\":[{\"count\":2,\"list\":{\"1\":{\"path\":\"\\/uploads\\/home\\/common\\/editable-page-model-h5-14-1.png\",\"sort\":\"9\"},\"0\":{\"path\":\"\\/uploads\\/home\\/common\\/editable-page-model-h5-14-1.png\",\"sort\":\"9\"}}},{\"count\":3,\"list\":{\"2\":{\"path\":\"\\/uploads\\/home\\/common\\/page-model-h5-14-2.png\",\"sort\":\"9\"},\"1\":{\"path\":\"\\/uploads\\/home\\/common\\/page-model-h5-14-2.png\",\"sort\":\"9\"},\"0\":{\"path\":\"\\/uploads\\/home\\/common\\/page-model-h5-14-2.png\",\"sort\":\"9\"}}},{\"count\":3,\"list\":[]}],\"link\":{\"1\":{\"count\":3,\"list\":[]},\"2\":{\"count\":3,\"list\":[]}}}'),(15,'商品排行','','mall','','h5','{\"back_color\":\"unset\",\"margin_top\":\"0\",\"margin_bottom\":\"0\",\"goods\":[{\"count\":10,\"gc_id\":0,\"sort\":\"new\",\"if_fix\":0,\"goods_id\":[]}]}');
/*!40000 ALTER TABLE `ds_editable_page_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_evaluategoods`
--

DROP TABLE IF EXISTS `ds_evaluategoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_evaluategoods` (
  `geval_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '信誉评价自增ID',
  `geval_orderid` int(11) NOT NULL COMMENT '订单表ID',
  `geval_orderno` varchar(20) NOT NULL COMMENT '订单编号',
  `geval_ordergoodsid` int(11) NOT NULL COMMENT '订单商品表编号',
  `geval_goodsid` int(11) NOT NULL COMMENT '商品表编号',
  `geval_goodsname` varchar(100) NOT NULL COMMENT '商品名称',
  `geval_goodsprice` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
  `geval_goodsimage` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `geval_scores` tinyint(1) NOT NULL COMMENT '1-5分',
  `geval_content` varchar(255) DEFAULT NULL COMMENT '信誉评价内容',
  `geval_isanonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:不是 1:匿名评价',
  `geval_addtime` int(11) NOT NULL COMMENT '评价时间',
  `geval_storeid` int(11) NOT NULL COMMENT '店铺编号',
  `geval_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `geval_frommemberid` int(11) NOT NULL COMMENT '评价人编号',
  `geval_frommembername` varchar(100) NOT NULL COMMENT '评价人名称',
  `geval_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '评价信息的状态 0为正常 1为禁止显示',
  `geval_remark` varchar(255) DEFAULT NULL COMMENT '管理员对评价的处理备注',
  `geval_explain` varchar(255) DEFAULT NULL COMMENT '解释内容',
  `geval_image` varchar(255) DEFAULT NULL COMMENT '晒单图片',
  PRIMARY KEY (`geval_id`),
  KEY `geval_orderid` (`geval_orderid`),
  KEY `geval_ordergoodsid` (`geval_ordergoodsid`),
  KEY `geval_goodsid` (`geval_goodsid`),
  KEY `geval_storeid` (`geval_storeid`),
  KEY `geval_frommemberid` (`geval_frommemberid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='信誉评价表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_evaluategoods`
--

LOCK TABLES `ds_evaluategoods` WRITE;
/*!40000 ALTER TABLE `ds_evaluategoods` DISABLE KEYS */;
INSERT INTO `ds_evaluategoods` VALUES (1,2,'202012011528054808',2,123,'景德镇陶瓷花瓶摆件客厅装饰品摆设中式家居新房装饰品酒柜摆件',36.00,'1_2017092902182426089.jpg',5,'不错，ok的',0,1606982120,1,'官方自营店铺',3,'ceshi123',0,NULL,NULL,NULL),(2,5,'202012051739047836',5,85,'铨聚臭氧发生器果蔬解毒杀菌洗菜多功能负离子活氧净化消毒机家用',399.00,'1_2017092900115721538.jpg',5,'商品收到了，感觉很好',0,1607309081,1,'官方自营店铺',3,'ceshi123',0,NULL,NULL,NULL),(3,13,'202012221742331142',13,127,'新西兰进口牛奶纽仕兰高钙低脂纯牛奶250ml*24盒*1箱',89.00,'1_2017092902485560056.jpg',4,'服务挺好，物流速度快',0,1609898419,1,'官方自营店铺',3,'ceshi123',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ds_evaluategoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_evaluatestore`
--

DROP TABLE IF EXISTS `ds_evaluatestore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_evaluatestore` (
  `seval_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺评分自增ID',
  `seval_orderid` int(11) unsigned NOT NULL COMMENT '订单ID',
  `seval_orderno` varchar(100) NOT NULL COMMENT '订单编号',
  `seval_addtime` int(11) unsigned NOT NULL COMMENT '评价时间',
  `seval_storeid` int(11) unsigned NOT NULL COMMENT '店铺ID',
  `seval_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `seval_memberid` int(11) unsigned NOT NULL COMMENT '买家ID',
  `seval_membername` varchar(100) NOT NULL COMMENT '买家名称',
  `seval_desccredit` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '描述相符评分',
  `seval_servicecredit` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '服务态度评分',
  `seval_deliverycredit` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '发货速度评分',
  PRIMARY KEY (`seval_id`),
  KEY `seval_orderid` (`seval_orderid`),
  KEY `seval_storeid` (`seval_storeid`),
  KEY `seval_memberid` (`seval_memberid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺评分表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_evaluatestore`
--

LOCK TABLES `ds_evaluatestore` WRITE;
/*!40000 ALTER TABLE `ds_evaluatestore` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_evaluatestore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_exppointslog`
--

DROP TABLE IF EXISTS `ds_exppointslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_exppointslog` (
  `explog_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '经验值日志自增ID',
  `explog_memberid` int(11) NOT NULL COMMENT '会员ID',
  `explog_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `explog_points` int(11) NOT NULL DEFAULT '0' COMMENT '经验值负数表示扣除',
  `explog_addtime` int(11) NOT NULL COMMENT '经验值添加时间',
  `explog_desc` varchar(100) NOT NULL COMMENT '经验值操作描述',
  `explog_stage` varchar(50) NOT NULL COMMENT '经验值操作状态',
  PRIMARY KEY (`explog_id`),
  KEY `explog_memberid` (`explog_memberid`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='经验值日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_exppointslog`
--

LOCK TABLES `ds_exppointslog` WRITE;
/*!40000 ALTER TABLE `ds_exppointslog` DISABLE KEYS */;
INSERT INTO `ds_exppointslog` VALUES (1,1,'buyer',20,1605681678,'会员登录','login'),(2,1,'buyer',20,1605774881,'会员登录','login'),(3,1,'buyer',20,1605835758,'会员登录','login'),(4,1,'buyer',20,1606095801,'会员登录','login'),(5,1,'buyer',20,1606361741,'会员登录','login'),(6,1,'buyer',20,1606439304,'会员登录','login'),(7,1,'buyer',20,1606701400,'会员登录','login'),(8,3,'ceshi123',20,1606786484,'会员登录','login'),(9,3,'ceshi123',20,1606893944,'会员登录','login'),(10,3,'ceshi123',20,1606980187,'会员登录','login'),(11,3,'ceshi123',3,1606981945,'订单202012011528054808购物消费','order'),(12,3,'ceshi123',10,1606982120,'评论商品','comments'),(13,3,'ceshi123',20,1607087843,'会员登录','login'),(14,3,'ceshi123',20,1607162603,'会员登录','login'),(15,3,'ceshi123',10,1607162887,'订单202012051739047836购物消费','order'),(16,3,'ceshi123',20,1607308651,'会员登录','login'),(17,2,'helly',20,1607308814,'会员登录','login'),(18,3,'ceshi123',10,1607309081,'评论商品','comments'),(19,3,'ceshi123',20,1608600986,'会员登录','login'),(20,3,'ceshi123',20,1608686015,'会员登录','login'),(21,3,'ceshi123',20,1609232326,'会员登录','login'),(22,3,'ceshi123',20,1609291824,'会员登录','login'),(23,3,'ceshi123',20,1609379870,'会员登录','login'),(24,3,'ceshi123',20,1609641169,'会员登录','login'),(25,3,'ceshi123',20,1609725068,'会员登录','login'),(26,3,'ceshi123',20,1609810491,'会员登录','login'),(27,3,'ceshi123',20,1609898142,'会员登录','login'),(28,3,'ceshi123',8,1609898380,'订单202012221742331142购物消费','order'),(29,3,'ceshi123',10,1609898419,'评论商品','comments'),(30,4,'hfai001',20,1609976869,'会员登录','login'),(31,3,'ceshi123',20,1609983664,'会员登录','login'),(32,3,'ceshi123',20,1610069230,'会员登录','login'),(33,3,'ceshi123',20,1610180988,'会员登录','login'),(34,3,'ceshi123',20,1610270468,'会员登录','login'),(35,3,'ceshi123',20,1610333179,'会员登录','login'),(36,3,'ceshi123',20,1610505366,'会员登录','login'),(37,3,'ceshi123',20,1610588938,'会员登录','login'),(38,3,'ceshi123',20,1610678374,'会员登录','login'),(39,3,'ceshi123',20,1610768062,'会员登录','login'),(40,3,'ceshi123',20,1612518080,'会员登录','login'),(41,4,'hfai001',20,1612535535,'会员登录','login'),(42,3,'ceshi123',20,1612705747,'会员登录','login'),(43,3,'ceshi123',20,1616028363,'会员登录','login'),(44,3,'ceshi123',20,1617194986,'会员登录','login'),(45,3,'ceshi123',20,1617551024,'会员登录','login'),(46,3,'ceshi123',20,1617590708,'会员登录','login'),(47,3,'ceshi123',20,1618112752,'会员登录','login');
/*!40000 ALTER TABLE `ds_exppointslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_express`
--

DROP TABLE IF EXISTS `ds_express`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_express` (
  `express_id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT COMMENT '快递公司自增ID',
  `express_name` varchar(50) NOT NULL COMMENT '快递公司名称',
  `express_state` enum('0','1') NOT NULL DEFAULT '1' COMMENT '快递公司状态',
  `express_code` varchar(50) NOT NULL COMMENT '快递公司编号',
  `express_letter` char(1) NOT NULL COMMENT '快递公司首字母',
  `express_order` enum('1','2') NOT NULL DEFAULT '2' COMMENT '1:常用2:不常用',
  `express_url` varchar(100) NOT NULL COMMENT '快递公司网址',
  PRIMARY KEY (`express_id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='快递公司';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_express`
--

LOCK TABLES `ds_express` WRITE;
/*!40000 ALTER TABLE `ds_express` DISABLE KEYS */;
INSERT INTO `ds_express` VALUES (1,'安信达','0','AXD','A','2','http://www.anxinda.com'),(2,'包裹平邮','1','YZPY','B','2','http://yjcx.chinapost.com.cn'),(3,'CCES','1','CCES','C','2','http://www.cces.com.cn'),(4,'传喜物流','1','CXHY','C','2','http://www.cxcod.com'),(5,'DHL快递','1','DHL','D','2','http://www.cn.dhl.com'),(6,'大田物流','1','DTWL','D','2','http://www.dtw.com.cn'),(7,'德邦物流','1','DBL','D','2','http://www.deppon.com'),(8,'EMS','1','EMS','E','2','http://www.ems.com.cn'),(9,'EMS国际','1','EMSGJ','E','2','###'),(10,'飞康达','1','FKD','F','2','http://www.fkd.com.cn'),(11,'FedEx(国际)','1','FKD_GJ','F','2','http://fedex.com/cn'),(12,'凡客如风达','1','rufengda','F','2','http://www.rufengda.com'),(13,'迦递快递','1','GAI','G','2','https://www.trackingmore.com'),(14,'广通','1','GTONG','G','2','http://gto315.com'),(15,'共速达','1','GSD','G','2','http://www.gongsuda.com/mall/Search.aspx'),(16,'华宇物流','1','HOAU','H','2','http://www.hoau.net'),(17,'京东快递','1','JD','J','2','http://www.jdwl.com'),(18,'佳吉快运','1','JJKY','J','2','http://www.jiaji.com'),(19,'佳怡物流','1','JYWL','J','2','http://www.jiayi56.com'),(20,'急先达','1','JXD','J','2','http://www.joust.cn'),(21,'快捷速递','1','FAST','K','2','http://www.fastexpress.com.cn'),(22,'龙邦快递','1','LB','L','2','http://www.lbex.com.cn'),(23,'联邦快递','1','FEDEX','L','2','http://cndxp.apac.fedex.com/dxp.html'),(24,'联昊通','1','LHT','L','2','http://www.lhtex.com.cn'),(25,'全一快递','1','UAPEX','Q','2','http://www.apex100.com'),(26,'全峰快递','1','QFKD','Q','2','http://www.qfkd.com.cn'),(27,'全日通','1','QRT','Q','2','http://www.at-express.com'),(28,'申通快递','1','STO','S','2','http://www.sto.cn'),(29,'顺丰快递','1','SF','S','1','http://www.sf-express.com'),(30,'速尔快递','1','SURE','S','2','http://www.sure56.com'),(31,'TNT快递','1','TNT','T','2','http://www.tnt.com.cn'),(32,'天天快递','1','HHTT','T','2','http://www.ttkdex.com'),(33,'天地华宇','1','HOAU','T','2','http://www.hoau.net'),(34,'UPS快递','1','UPS','U','2','http://www.ups.com/cn'),(35,'USPS','1','USPS','U','2','http://www.kuaidi100.com/all/usps.shtml'),(36,'迅驰物流','1','XCWL','X','2','https://cn.made-in-china.com'),(37,'信丰物流','1','XFEX','X','2','http://www.xf-express.com.cn'),(38,'希优特','1','XYT','X','2','http://www.hqepay.com'),(39,'新杰物流','1','XJ','X','2','http://www.sunjex.com/'),(40,'圆通快递','1','YTO','Y','1','http://www.yto.net.cn'),(41,'韵达快递','1','YD','Y','1','http://www.yundaex.com'),(42,'邮政包裹','1','YZPY','Y','2','http://yjcx.chinapost.com.cn'),(43,'优速快递','1','UC','Y','2','http://www.uc56.com'),(44,'中通快递','1','ZTO','Z','1','http://www.zto.cn'),(45,'中铁快运','1','ZTKY','Z','2','http://www.cre.cn'),(46,'宅急送','1','ZJS','Z','2','http://www.zjs.com.cn'),(47,'中邮物流','1','ZYWL','Z','2','http://www.cnpl.com.cn');
/*!40000 ALTER TABLE `ds_express` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_favorites`
--

DROP TABLE IF EXISTS `ds_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_favorites` (
  `favlog_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏记录自增ID',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `member_name` varchar(50) NOT NULL COMMENT '会员名',
  `fav_id` int(10) unsigned NOT NULL COMMENT '商品ID或店铺ID',
  `fav_type` char(5) NOT NULL DEFAULT 'goods' COMMENT '类型:goods为商品,store为店铺',
  `fav_time` int(10) unsigned NOT NULL COMMENT '收藏时间',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(20) NOT NULL COMMENT '店铺名称',
  `storeclass_id` int(10) unsigned DEFAULT '0' COMMENT '店铺分类ID',
  `goods_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `gc_id` int(10) unsigned DEFAULT '0' COMMENT '商品分类ID',
  `favlog_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品收藏时价格',
  `favlog_msg` varchar(20) DEFAULT NULL COMMENT '收藏备注',
  PRIMARY KEY (`favlog_id`),
  KEY `member_id` (`member_id`),
  KEY `fav_id` (`fav_id`,`fav_type`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_favorites`
--

LOCK TABLES `ds_favorites` WRITE;
/*!40000 ALTER TABLE `ds_favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_feedback`
--

DROP TABLE IF EXISTS `ds_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_feedback` (
  `fb_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '反馈自增ID',
  `fb_content` varchar(500) DEFAULT NULL COMMENT '反馈内容',
  `fb_type` varchar(50) DEFAULT NULL COMMENT '1:手机端 2:PC端',
  `fb_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '反馈时间',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  PRIMARY KEY (`fb_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='意见反馈';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_feedback`
--

LOCK TABLES `ds_feedback` WRITE;
/*!40000 ALTER TABLE `ds_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_flea`
--

DROP TABLE IF EXISTS `ds_flea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_flea` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '闲置自增ID',
  `goods_name` varchar(200) NOT NULL COMMENT '闲置名称',
  `fleaclass_id` int(11) NOT NULL COMMENT '闲置分类ID',
  `fleaclass_name` varchar(200) NOT NULL COMMENT '闲置分类名称',
  `member_id` int(11) NOT NULL COMMENT '店铺ID',
  `member_name` varchar(110) NOT NULL COMMENT '会员名称',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '闲置默认封面图片',
  `goods_tag` varchar(100) NOT NULL COMMENT '闲置标签',
  `goods_price` decimal(10,2) NOT NULL COMMENT '闲置原价',
  `goods_store_price` decimal(10,2) NOT NULL COMMENT '闲置转让价格',
  `goods_show` tinyint(1) NOT NULL COMMENT '闲置上架',
  `goods_click` int(11) NOT NULL DEFAULT '0' COMMENT '闲置浏览数',
  `flea_collect_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '闲置物品总收藏次数',
  `goods_commend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '闲置推荐',
  `goods_addtime` varchar(10) NOT NULL COMMENT '闲置添加时间',
  `goods_keywords` varchar(255) NOT NULL COMMENT '闲置关键字',
  `goods_description` varchar(255) NOT NULL COMMENT '闲置描述',
  `goods_body` text NOT NULL COMMENT '商品详细内容',
  `flea_commentnum` int(11) NOT NULL DEFAULT '0' COMMENT '评论次数',
  `flea_salenum` int(11) NOT NULL DEFAULT '0' COMMENT '售出数量',
  `flea_quality` tinyint(4) NOT NULL DEFAULT '0' COMMENT '闲置物品成色，0未选择，9-5九五成新，3是低于五成新',
  `flea_pname` varchar(20) DEFAULT NULL COMMENT '闲置商品联系人',
  `flea_pphone` varchar(20) DEFAULT NULL COMMENT '闲置商品联系人电话',
  `fleaarea_id` int(11) unsigned NOT NULL COMMENT '闲置物品地区id',
  `fleaarea_name` varchar(50) NOT NULL COMMENT '闲置物品地区名称',
  PRIMARY KEY (`goods_id`),
  KEY `goods_name` (`goods_name`,`fleaclass_id`,`member_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='闲置商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_flea`
--

LOCK TABLES `ds_flea` WRITE;
/*!40000 ALTER TABLE `ds_flea` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_flea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_fleaarea`
--

DROP TABLE IF EXISTS `ds_fleaarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_fleaarea` (
  `fleaarea_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '闲置地区自增ID',
  `fleaarea_name` varchar(50) NOT NULL COMMENT '闲置地区名称',
  `fleaarea_parent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '闲置地区上级地区ID',
  `fleaarea_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '闲置地区排序',
  `fleaarea_deep` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '闲置地区层级',
  `fleaarea_hot` int(11) NOT NULL DEFAULT '0' COMMENT '地区检索热度',
  PRIMARY KEY (`fleaarea_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='闲置地区';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_fleaarea`
--

LOCK TABLES `ds_fleaarea` WRITE;
/*!40000 ALTER TABLE `ds_fleaarea` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_fleaarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_fleaclass`
--

DROP TABLE IF EXISTS `ds_fleaclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_fleaclass` (
  `fleaclass_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '闲置分类自增ID',
  `fleaclass_name` varchar(100) NOT NULL COMMENT '闲置分类名称',
  `fleaclass_name_index` varchar(100) DEFAULT NULL COMMENT '闲置首页显示的名称',
  `fleaclass_parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级ID',
  `fleaclass_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '闲置分类排序',
  `fleaclass_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '前台显示 0:否 1:是',
  `fleaclass_index_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '首页显示 1:显示 0:不显示',
  PRIMARY KEY (`fleaclass_id`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COMMENT='闲置分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_fleaclass`
--

LOCK TABLES `ds_fleaclass` WRITE;
/*!40000 ALTER TABLE `ds_fleaclass` DISABLE KEYS */;
INSERT INTO `ds_fleaclass` VALUES (1,'手机','',0,1,1,1),(2,'手机','',1,255,1,1),(3,'配件','',1,255,1,1),(4,'相机/摄像机','',0,2,1,1),(5,'单反镜头','',4,255,1,1),(6,'数码单反','',4,255,1,1),(7,'普通数码相机','',4,255,1,1),(8,'胶片相机','',4,255,1,1),(9,'摄像机','',4,255,1,1),(10,'其他','',4,255,1,1),(11,'电脑/电脑配件','',0,3,1,1),(12,'笔记本电脑','',11,255,1,1),(13,'平板电脑','',11,255,1,1),(14,'台式机','',11,255,1,1),(15,'显示器','',11,255,1,1),(16,'台式机配件','',11,255,1,1),(17,'网络设备','',11,255,1,1),(18,'笔记本配件','',11,255,1,1),(19,'数码3C产品','',0,4,1,1),(20,'MP3/MP4/录音笔','',19,255,1,1),(21,'游戏机','',19,255,1,1),(22,'游戏软件','',19,255,1,1),(23,'U盘','',19,255,1,1),(24,'移动硬盘','',19,255,1,1),(25,'闪存卡','',19,255,1,1),(26,'其他','',19,255,1,1),(27,'服装/服饰','',0,5,1,1),(28,'女装','',27,255,1,1),(29,'男装','',27,255,1,1),(30,'男鞋','',27,255,1,1),(31,'女鞋','',27,255,1,1),(32,'饰品','',27,255,1,1),(33,'箱包','',27,255,1,1),(34,'其他','',27,255,1,1),(35,'美容/美颜/香水','',0,6,1,1),(36,'美容护肤','',35,255,1,1),(37,'彩妆','',35,255,1,1),(38,'美容工具','',35,255,1,1),(39,'香水','',35,255,1,1),(40,'美容护发','',35,255,1,1),(41,'其他','',35,255,1,1),(42,'家居/日用品','',0,7,1,1),(43,'家具','',42,255,1,1),(44,'日用日化','',42,255,1,1),(45,'建材','',42,255,1,1),(46,'家饰家纺','',42,255,1,1),(47,'其他','',42,255,1,1),(48,'食品/保健品','',0,8,1,1),(49,'食品','',48,255,1,1),(50,'保健品','',48,255,1,1),(51,'家用电器/影音设备','',0,9,1,1),(52,'电视机','',51,255,1,1),(53,'洗衣机','',51,255,1,1),(54,'空调','',51,255,1,1),(55,'冰箱','',51,255,1,1),(56,'其他大家电','',51,255,1,1),(57,'厨房电器','',51,255,1,1),(58,'影音/耳机/HIFI','',51,255,1,1),(59,'生活小家电','',51,255,1,1),(60,'母婴/儿童用品/玩具','',0,10,1,1),(61,'孕产妇用品/营养','',60,255,1,1),(62,'婴儿装/童装','',60,255,1,1),(63,'玩具/早教/益智','',60,255,1,1),(64,'婴儿用品','',60,255,1,1),(65,'奶粉/宝宝营养','',60,255,1,1),(66,'其他','',60,255,1,1),(67,'宠物/宠物用品','',0,11,1,1),(68,'宠物','',67,255,1,1),(69,'宠物用品','',67,255,1,1),(70,'宠物食品','',67,255,1,1),(71,'其他','',67,255,1,1),(72,'生活服务/票务/卡券','',0,12,1,1),(73,'电影票','',72,255,1,1),(74,'演出赛事','',72,255,1,1),(75,'折扣券/购物卡','',72,255,1,1),(76,'餐饮美食','',72,255,1,1),(77,'休闲娱乐','',72,255,1,1),(78,'生活服务','',72,255,1,1),(79,'其他','',72,255,1,1),(80,'书刊音像/问题用品','',0,13,1,1),(81,'书籍','',80,255,1,1),(82,'CD/DVD','',80,255,1,1),(83,'期刊杂志','',80,255,1,1),(84,'乐器','',80,255,1,1),(85,'运动器材','',80,255,1,1),(86,'文具','',80,255,1,1),(87,'其他','',80,255,1,1),(88,'汽摩/电动车/自行车','',0,14,1,1),(89,'二手整车','',88,255,1,1),(90,'骑车配件','',88,255,1,1),(91,'摩托/电动车','',88,255,1,1),(92,'摩托/电动配件','',88,255,1,1),(93,'自行车','',88,255,1,1),(94,'其他','',88,255,1,1),(95,'珠宝/黄金/手表','',0,15,1,1),(96,'裴翠','',95,255,1,1),(97,'黄金','',95,255,1,1),(98,'玉石','',95,255,1,1),(99,'钻石','',95,255,1,1),(100,'手表','',95,255,1,1),(101,'其他','',95,255,1,1),(102,'艺术品/收藏品/古董古玩','',0,16,1,1),(103,'书画','',102,255,1,1),(104,'收藏品','',102,255,1,1),(105,'古玩','',102,255,1,1),(106,'其他','',102,255,1,1),(107,'其他闲置','',0,17,1,1);
/*!40000 ALTER TABLE `ds_fleaclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_fleaclassindex`
--

DROP TABLE IF EXISTS `ds_fleaclassindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_fleaclassindex` (
  `fcindex_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `fcindex_class` varchar(50) NOT NULL COMMENT '类别名称',
  `fcindex_code` varchar(50) NOT NULL COMMENT '类别code',
  `fcindex_id1` varchar(50) NOT NULL DEFAULT '0' COMMENT '分类id1',
  `fcindex_name1` varchar(50) NOT NULL,
  `fcindex_id2` varchar(50) NOT NULL DEFAULT '0' COMMENT '分类id2',
  `fcindex_name2` varchar(50) NOT NULL,
  `fcindex_id3` varchar(50) NOT NULL DEFAULT '0' COMMENT '分类id3',
  `fcindex_name3` varchar(50) NOT NULL,
  `fcindex_id4` varchar(50) NOT NULL DEFAULT '0' COMMENT '分类id4',
  `fcindex_name4` varchar(50) NOT NULL,
  PRIMARY KEY (`fcindex_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='闲置首页分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_fleaclassindex`
--

LOCK TABLES `ds_fleaclassindex` WRITE;
/*!40000 ALTER TABLE `ds_fleaclassindex` DISABLE KEYS */;
INSERT INTO `ds_fleaclassindex` VALUES (1,'数码','shuma','1','手机','4','相机/摄像','11','电脑/配件','19','数码3C'),(2,'装扮','zhuangban','27','服装/服饰','35','美容/美颜','42','家具/日用','48','食品/保健'),(3,'居家','jujia','51','电器/影音','60','母婴/玩具','67','宠物/用品','72','生活/卡券'),(4,'兴趣','xingqu','80','书刊/音像','88','汽摩/电动','95','珠宝/黄金','102','艺术/收藏'),(5,'母婴','muying','107','其他闲置','4','相机/摄像','19','数码3C','27','服装/服饰');
/*!40000 ALTER TABLE `ds_fleaclassindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_fleaconsult`
--

DROP TABLE IF EXISTS `ds_fleaconsult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_fleaconsult` (
  `fleaconsult_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '闲置咨询自增ID',
  `goods_id` int(11) DEFAULT '0' COMMENT '商品ID',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '咨询发布者会员编号(0：游客)',
  `seller_id` int(11) NOT NULL COMMENT '信息发布者编号',
  `fleaconsult_email` varchar(255) DEFAULT NULL COMMENT '闲置咨询发布者邮箱',
  `fleaconsult_content` varchar(4000) DEFAULT NULL COMMENT '闲置咨询内容',
  `fleaconsult_addtime` int(10) DEFAULT NULL COMMENT '闲置咨询发布时间',
  `fleaconsult_reply` varchar(4000) DEFAULT NULL COMMENT '闲置咨询回复内容',
  `fleaconsult_reply_time` int(10) DEFAULT NULL COMMENT '闲置咨询回复时间',
  `fleaconsult_type` varchar(20) NOT NULL DEFAULT 'flea' COMMENT '闲置咨询类型',
  PRIMARY KEY (`fleaconsult_id`),
  KEY `member_id` (`member_id`),
  KEY `seller_id` (`seller_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='闲置咨询';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_fleaconsult`
--

LOCK TABLES `ds_fleaconsult` WRITE;
/*!40000 ALTER TABLE `ds_fleaconsult` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_fleaconsult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_fleafavorites`
--

DROP TABLE IF EXISTS `ds_fleafavorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_fleafavorites` (
  `member_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `fleafav_id` int(10) unsigned NOT NULL COMMENT '收藏ID',
  `fleafav_type` varchar(20) NOT NULL COMMENT '闲置收藏类型',
  `fleafav_time` varchar(10) NOT NULL COMMENT '闲置收藏时间',
  KEY `member_id` (`member_id`),
  KEY `fleafav_id` (`fleafav_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='买家闲置收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_fleafavorites`
--

LOCK TABLES `ds_fleafavorites` WRITE;
/*!40000 ALTER TABLE `ds_fleafavorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_fleafavorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_fleaupload`
--

DROP TABLE IF EXISTS `ds_fleaupload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_fleaupload` (
  `fleaupload_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '闲置上传文件自增ID',
  `fleafile_name` varchar(100) DEFAULT NULL COMMENT '文件名',
  `fleafile_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `fleaupload_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认为0，12为商品切换图片，13为商品内容图片',
  `fleaupload_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '信息ID',
  PRIMARY KEY (`fleaupload_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='闲置上传文件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_fleaupload`
--

LOCK TABLES `ds_fleaupload` WRITE;
/*!40000 ALTER TABLE `ds_fleaupload` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_fleaupload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_flowstat`
--

DROP TABLE IF EXISTS `ds_flowstat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_flowstat` (
  `flowstat_stattime` int(11) unsigned NOT NULL COMMENT '访问日期',
  `flowstat_clicknum` int(11) unsigned NOT NULL COMMENT '访问量',
  `flowstat_type` varchar(10) NOT NULL COMMENT '类型',
  `store_id` int(11) unsigned NOT NULL COMMENT '店铺ID',
  `goods_id` int(11) unsigned NOT NULL COMMENT '商品ID',
  KEY `store_id` (`store_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问量统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_flowstat`
--

LOCK TABLES `ds_flowstat` WRITE;
/*!40000 ALTER TABLE `ds_flowstat` DISABLE KEYS */;
INSERT INTO `ds_flowstat` VALUES (1605542400,4,'sum',1,0),(1605542400,1,'goods',1,99),(1605542400,1,'goods',1,2),(1605628800,18,'sum',1,0),(1605628800,2,'goods',1,99),(1605628800,8,'goods',1,102),(1605628800,1,'goods',1,31),(1605628800,1,'goods',1,29),(1605628800,1,'goods',1,32),(1605628800,1,'goods',1,98),(1605628800,1,'goods',1,28),(1606665600,7,'sum',1,0),(1606665600,3,'goods',1,123),(1606665600,1,'goods',1,124),(1606665600,1,'goods',1,8),(1606665600,2,'goods',1,3),(1606752000,6,'sum',1,0),(1606752000,5,'goods',1,123),(1606924800,1,'sum',1,0),(1606924800,1,'goods',1,31),(1607011200,4,'sum',1,0),(1607011200,1,'goods',1,105),(1607011200,1,'goods',1,64),(1607011200,1,'goods',1,86),(1607011200,1,'goods',1,121),(1607097600,4,'sum',1,0),(1607097600,1,'goods',1,115),(1607097600,1,'goods',1,85),(1607097600,2,'goods',1,24),(1607184000,1,'sum',1,0),(1607184000,1,'goods',1,123),(1607270400,7,'sum',1,0),(1607270400,1,'goods',1,85),(1607270400,2,'goods',1,63),(1607270400,1,'goods',1,24),(1607270400,3,'goods',1,71),(1608566400,3,'sum',1,0),(1608566400,1,'goods',1,123),(1608566400,1,'goods',1,124),(1608566400,1,'goods',1,127),(1608739200,1,'sum',1,0),(1608739200,1,'goods',1,2),(1609344000,12,'sum',1,0),(1609344000,2,'goods',1,16),(1609344000,1,'goods',1,72),(1609344000,1,'goods',1,100),(1609344000,1,'goods',1,123),(1609344000,2,'goods',1,67),(1609344000,1,'goods',1,96),(1609344000,2,'goods',1,2),(1609344000,1,'goods',1,91),(1609344000,1,'goods',1,77),(1609689600,5,'sum',1,0),(1609689600,1,'goods',1,109),(1609689600,1,'goods',1,67),(1609689600,1,'goods',1,112),(1609689600,1,'goods',1,82),(1609689600,1,'goods',1,127),(1609776000,12,'sum',1,0),(1609776000,7,'goods',1,127),(1609776000,1,'goods',1,2),(1609776000,1,'goods',1,4),(1609776000,1,'goods',1,10),(1609776000,1,'goods',1,11),(1609776000,1,'goods',1,54),(1609862400,6,'sum',1,0),(1609862400,2,'goods',1,127),(1609862400,1,'goods',1,54),(1609862400,1,'goods',1,118),(1609948800,4,'sum',1,0),(1609948800,2,'goods',1,114),(1609948800,2,'goods',1,37),(1610035200,3,'sum',1,0),(1610035200,3,'goods',1,37),(1612454400,1,'sum',1,0),(1612454400,1,'goods',1,73),(1612540800,120,'sum',1,0),(1612540800,1,'goods',1,72),(1612540800,1,'goods',1,60),(1612540800,1,'goods',1,40),(1612540800,1,'goods',1,92),(1612540800,1,'goods',1,105),(1612540800,1,'goods',1,15),(1612540800,1,'goods',1,87),(1612540800,1,'goods',1,73),(1612540800,1,'goods',1,117),(1612540800,1,'goods',1,27),(1612540800,1,'goods',1,67),(1612540800,1,'goods',1,81),(1612540800,1,'goods',1,103),(1612540800,1,'goods',1,2),(1612540800,1,'goods',1,26),(1612540800,1,'goods',1,34),(1612540800,1,'goods',1,86),(1612540800,1,'goods',1,100),(1612540800,1,'goods',1,58),(1612540800,1,'goods',1,66),(1612540800,1,'goods',1,23),(1612540800,1,'goods',1,44),(1612540800,1,'goods',1,99),(1612540800,1,'goods',1,82),(1612540800,1,'goods',1,107),(1612540800,1,'goods',1,110),(1612540800,1,'goods',1,112),(1612540800,1,'goods',1,89),(1612540800,1,'goods',1,51),(1612540800,1,'goods',1,127),(1612540800,1,'goods',1,84),(1612540800,1,'goods',1,41),(1612540800,1,'goods',1,14),(1612540800,1,'goods',1,43),(1612540800,1,'goods',1,119),(1612540800,1,'goods',1,45),(1612540800,1,'goods',1,71),(1612540800,1,'goods',1,6),(1612540800,1,'goods',1,116),(1612540800,1,'goods',1,21),(1612540800,1,'goods',1,57),(1612540800,1,'goods',1,104),(1612540800,1,'goods',1,115),(1612540800,1,'goods',1,61),(1612540800,1,'goods',1,75),(1612540800,1,'goods',1,125),(1612540800,1,'goods',1,122),(1612540800,1,'goods',1,31),(1612540800,1,'goods',1,32),(1612540800,1,'goods',1,108),(1612540800,1,'goods',1,65),(1612540800,1,'goods',1,90),(1612540800,1,'goods',1,9),(1612540800,1,'goods',1,36),(1612540800,1,'goods',1,29),(1612540800,1,'goods',1,8),(1612540800,1,'goods',1,39),(1612540800,1,'goods',1,13),(1612540800,1,'goods',1,59),(1612540800,1,'goods',1,121),(1612540800,1,'goods',1,80),(1612540800,1,'goods',1,79),(1612540800,1,'goods',1,55),(1612540800,1,'goods',1,53),(1612540800,1,'goods',1,126),(1612540800,1,'goods',1,70),(1612540800,1,'goods',1,33),(1612540800,1,'goods',1,120),(1612540800,1,'goods',1,83),(1612540800,1,'goods',1,69),(1612540800,1,'goods',1,62),(1612540800,2,'goods',1,68),(1612540800,1,'goods',1,30),(1612540800,1,'goods',1,102),(1612540800,1,'goods',1,101),(1612540800,1,'goods',1,4),(1612540800,1,'goods',1,77),(1612540800,1,'goods',1,11),(1612540800,1,'goods',1,12),(1612540800,1,'goods',1,118),(1612540800,1,'goods',1,113),(1612540800,1,'goods',1,5),(1612540800,1,'goods',1,18),(1612540800,1,'goods',1,42),(1612540800,1,'goods',1,37),(1612540800,1,'goods',1,16),(1612540800,1,'goods',1,91),(1612540800,1,'goods',1,106),(1612540800,1,'goods',1,88),(1612540800,1,'goods',1,25),(1612627200,28,'sum',1,0),(1612627200,1,'goods',1,58),(1612627200,1,'goods',1,129),(1612627200,1,'goods',1,128),(1612627200,1,'goods',1,108),(1612627200,1,'goods',1,44),(1612627200,1,'goods',1,116),(1612627200,1,'goods',1,56),(1612627200,1,'goods',1,7),(1612627200,1,'goods',1,109),(1612627200,1,'goods',1,63),(1612627200,1,'goods',1,54),(1612627200,1,'goods',1,24),(1612713600,85,'sum',1,0),(1612713600,1,'goods',1,81),(1612713600,1,'goods',1,68),(1612713600,1,'goods',1,113),(1612713600,1,'goods',1,15),(1612713600,1,'goods',1,125),(1612713600,1,'goods',1,80),(1612713600,1,'goods',1,111),(1612713600,1,'goods',1,123),(1612713600,1,'goods',1,34),(1612713600,1,'goods',1,55),(1612713600,1,'goods',1,19),(1612713600,1,'goods',1,22),(1612713600,1,'goods',1,64),(1612713600,1,'goods',1,17),(1612800000,28,'sum',1,0),(1612800000,1,'goods',1,20),(1612800000,1,'goods',1,114),(1612886400,57,'sum',1,0),(1612886400,1,'goods',1,118),(1612972800,47,'sum',1,0),(1612972800,1,'goods',1,129),(1612972800,1,'goods',1,19),(1612972800,1,'goods',1,111),(1613059200,52,'sum',1,0),(1613059200,1,'goods',1,22),(1613145600,28,'sum',1,0),(1613145600,1,'goods',1,44),(1613145600,1,'goods',1,31),(1613145600,1,'goods',1,113),(1613145600,1,'goods',1,24),(1613145600,1,'goods',1,58),(1613145600,1,'goods',1,34),(1613145600,1,'goods',1,108),(1613145600,1,'goods',1,103),(1613145600,1,'goods',1,54),(1613145600,1,'goods',1,81),(1613145600,1,'goods',1,15),(1613145600,1,'goods',1,80),(1613318400,8,'sum',1,0),(1613404800,4,'sum',1,0),(1613491200,2,'sum',1,0),(1613577600,5,'sum',1,0),(1613577600,2,'goods',1,77),(1613664000,3,'sum',1,0),(1613750400,2,'sum',1,0),(1613750400,1,'goods',1,40),(1613836800,7,'sum',1,0),(1613836800,2,'goods',1,37),(1613836800,1,'goods',1,21),(1614096000,1,'sum',1,0),(1614096000,1,'goods',1,69),(1614268800,4,'sum',1,0),(1614268800,1,'goods',1,37),(1614268800,1,'goods',1,21),(1614355200,7,'sum',1,0),(1614355200,1,'goods',1,10),(1614355200,2,'goods',1,127),(1614355200,1,'goods',1,73),(1614355200,3,'goods',1,24),(1614528000,2,'sum',1,0),(1614528000,2,'goods',1,105),(1614700800,1,'sum',1,0),(1614787200,1,'sum',1,0),(1614787200,1,'goods',1,90),(1614873600,8,'sum',1,0),(1614873600,1,'goods',1,98),(1614873600,2,'goods',1,37),(1614873600,1,'goods',1,105),(1614873600,1,'goods',1,21),(1614960000,9,'sum',1,0),(1614960000,1,'goods',1,91),(1614960000,1,'goods',1,108),(1615046400,1,'sum',1,0),(1615392000,1,'sum',1,0),(1615392000,1,'goods',1,11),(1615478400,3,'sum',1,0),(1615478400,2,'goods',1,105),(1615564800,2,'sum',1,0),(1615564800,1,'goods',1,10),(1615564800,1,'goods',1,67),(1615737600,3,'sum',1,0),(1615737600,2,'goods',1,105),(1615824000,4,'sum',1,0),(1615824000,1,'goods',1,105),(1615824000,1,'goods',1,98),(1615910400,3,'sum',1,0),(1615910400,1,'goods',1,90),(1615996800,16,'sum',1,0),(1615996800,1,'goods',1,73),(1615996800,14,'goods',1,127),(1616083200,3,'sum',1,0),(1616083200,1,'goods',1,105),(1616083200,1,'goods',1,52),(1616169600,2,'sum',1,0),(1616169600,1,'goods',1,105),(1616169600,1,'goods',1,127),(1616256000,1,'sum',1,0),(1616256000,1,'goods',1,20),(1616342400,3,'sum',1,0),(1616342400,1,'goods',1,105),(1616515200,4,'sum',1,0),(1616515200,1,'goods',1,79),(1616515200,1,'goods',1,75),(1616601600,5,'sum',1,0),(1616601600,1,'goods',1,42),(1616601600,1,'goods',1,105),(1616601600,1,'goods',1,79),(1616688000,9,'sum',1,0),(1616688000,1,'goods',1,79),(1616688000,1,'goods',1,75),(1616688000,1,'goods',1,12),(1616688000,1,'goods',1,103),(1616774400,7,'sum',1,0),(1616774400,1,'goods',1,103),(1616774400,1,'goods',1,110),(1616774400,1,'goods',1,111),(1616860800,11,'sum',1,0),(1616860800,2,'goods',1,60),(1616860800,1,'goods',1,41),(1616860800,1,'goods',1,89),(1616860800,1,'goods',1,42),(1616860800,1,'goods',1,86),(1616860800,2,'goods',1,105),(1616860800,1,'goods',1,103),(1616947200,14,'sum',1,0),(1616947200,1,'goods',1,106),(1616947200,1,'goods',1,5),(1616947200,1,'goods',1,61),(1616947200,1,'goods',1,60),(1616947200,1,'goods',1,36),(1616947200,1,'goods',1,6),(1616947200,1,'goods',1,124),(1616947200,1,'goods',1,52),(1616947200,1,'goods',1,59),(1616947200,1,'goods',1,123),(1616947200,1,'goods',1,4),(1616947200,1,'goods',1,108),(1616947200,1,'goods',1,20),(1616947200,1,'goods',1,37),(1617033600,6,'sum',1,0),(1617033600,1,'goods',1,32),(1617033600,1,'goods',1,101),(1617033600,1,'goods',1,65),(1617033600,1,'goods',1,4),(1617033600,1,'goods',1,6),(1617120000,8,'sum',1,0),(1617120000,1,'goods',1,37),(1617120000,1,'goods',1,99),(1617120000,1,'goods',1,60),(1617120000,1,'goods',1,5),(1617120000,1,'goods',1,56),(1617206400,14,'sum',1,0),(1617206400,1,'goods',1,19),(1617206400,1,'goods',1,103),(1617206400,1,'goods',1,104),(1617206400,1,'goods',1,47),(1617206400,1,'goods',1,127),(1617206400,1,'goods',1,46),(1617206400,1,'goods',1,60),(1617206400,1,'goods',1,99),(1617206400,1,'goods',1,48),(1617206400,1,'goods',1,87),(1617206400,1,'goods',1,107),(1617206400,1,'goods',1,36),(1617292800,2,'sum',1,0),(1617292800,1,'goods',1,14),(1617379200,42,'sum',1,0),(1617379200,1,'goods',1,65),(1617379200,1,'goods',1,111),(1617379200,1,'goods',1,41),(1617379200,1,'goods',1,75),(1617379200,1,'goods',1,79),(1617379200,1,'goods',1,36),(1617379200,1,'goods',1,42),(1617379200,2,'goods',1,56),(1617379200,1,'goods',1,87),(1617379200,1,'goods',1,89),(1617379200,1,'goods',1,92),(1617379200,1,'goods',1,112),(1617379200,1,'goods',1,58),(1617379200,2,'goods',1,69),(1617379200,1,'goods',1,72),(1617379200,1,'goods',1,34),(1617379200,1,'goods',1,66),(1617379200,1,'goods',1,99),(1617379200,1,'goods',1,82),(1617379200,1,'goods',1,126),(1617379200,1,'goods',1,117),(1617379200,2,'goods',1,115),(1617379200,1,'goods',1,14),(1617379200,1,'goods',1,22),(1617379200,1,'goods',1,68),(1617379200,2,'goods',1,63),(1617379200,1,'goods',1,30),(1617379200,1,'goods',1,16),(1617465600,19,'sum',1,0),(1617465600,1,'goods',1,100),(1617465600,1,'goods',1,89),(1617465600,1,'goods',1,2),(1617465600,1,'goods',1,64),(1617465600,1,'goods',1,60),(1617465600,1,'goods',1,66),(1617465600,1,'goods',1,25),(1617465600,1,'goods',1,118),(1617465600,1,'goods',1,78),(1617465600,1,'goods',1,52),(1617465600,1,'goods',1,10),(1617465600,2,'goods',1,86),(1617465600,1,'goods',1,77),(1617465600,1,'goods',1,19),(1617465600,1,'goods',1,47),(1617465600,3,'goods',1,83),(1617552000,13,'sum',1,0),(1617552000,1,'goods',1,27),(1617552000,3,'goods',1,78),(1617552000,1,'goods',1,25),(1617552000,1,'goods',1,77),(1617552000,1,'goods',1,59),(1617552000,1,'goods',1,23),(1617552000,2,'goods',1,83),(1617552000,1,'goods',1,52),(1617552000,1,'goods',1,19),(1617552000,1,'goods',1,10),(1617638400,36,'sum',1,0),(1617638400,1,'goods',1,52),(1617638400,1,'goods',1,25),(1617638400,1,'goods',1,10),(1617638400,1,'goods',1,77),(1617638400,2,'goods',1,83),(1617638400,3,'goods',1,130),(1617638400,4,'goods',1,135),(1617638400,3,'goods',1,136),(1617638400,2,'goods',1,134),(1617638400,3,'goods',1,133),(1617638400,4,'goods',1,138),(1617638400,3,'goods',1,131),(1617638400,2,'goods',1,137),(1617638400,2,'goods',1,139),(1617638400,1,'goods',1,19),(1617638400,1,'goods',1,43),(1617638400,1,'goods',1,55),(1617638400,1,'goods',1,26),(1617724800,5,'sum',1,0),(1617724800,1,'goods',1,59),(1617724800,1,'goods',1,130),(1617724800,1,'goods',1,73),(1617724800,1,'goods',1,83),(1617724800,1,'goods',1,45),(1617811200,14,'sum',1,0),(1617811200,2,'goods',1,130),(1617811200,3,'goods',1,134),(1617811200,1,'goods',1,138),(1617811200,1,'goods',1,139),(1617811200,1,'goods',1,135),(1617811200,1,'goods',1,63),(1617811200,1,'goods',1,57),(1617897600,37,'sum',1,0),(1617897600,3,'goods',1,141),(1617897600,4,'goods',1,142),(1617897600,1,'goods',1,140),(1617897600,1,'goods',1,14),(1617897600,1,'goods',1,131),(1617897600,2,'goods',1,135),(1617897600,1,'goods',1,133),(1617897600,1,'goods',1,137),(1617897600,1,'goods',1,130),(1617897600,2,'goods',1,65),(1617897600,1,'goods',1,134),(1617897600,1,'goods',1,56),(1617897600,1,'goods',1,138),(1617897600,1,'goods',1,136),(1617897600,1,'goods',1,64),(1617897600,2,'goods',1,143),(1617897600,1,'goods',1,147),(1617897600,1,'goods',1,148),(1617897600,1,'goods',1,146),(1617897600,1,'goods',1,151),(1617984000,11,'sum',1,0),(1617984000,1,'goods',1,147),(1617984000,1,'goods',1,158),(1617984000,1,'goods',1,145),(1617984000,1,'goods',1,134),(1617984000,1,'goods',1,133),(1617984000,2,'goods',1,135),(1617984000,1,'goods',1,131),(1617984000,1,'goods',1,136),(1617984000,1,'goods',1,6),(1617984000,1,'goods',1,163),(1618070400,67,'sum',1,0),(1618070400,4,'goods',1,164),(1618070400,2,'goods',1,21),(1618070400,2,'goods',1,162),(1618070400,4,'goods',1,174),(1618070400,1,'goods',1,136),(1618070400,3,'goods',1,161),(1618070400,1,'goods',1,176),(1618070400,3,'goods',1,143),(1618070400,3,'goods',1,187),(1618070400,4,'goods',1,149),(1618070400,1,'goods',1,193),(1618070400,2,'goods',1,168),(1618070400,1,'goods',1,148),(1618070400,2,'goods',1,180),(1618070400,2,'goods',1,181),(1618070400,2,'goods',1,192),(1618070400,1,'goods',1,188),(1618070400,2,'goods',1,178),(1618070400,1,'goods',1,191),(1618070400,2,'goods',1,189),(1618070400,1,'goods',1,155),(1618070400,2,'goods',1,196),(1618070400,3,'goods',1,157),(1618070400,1,'goods',1,151),(1618070400,2,'goods',1,183),(1618070400,2,'goods',1,170),(1618070400,1,'goods',1,177),(1618070400,2,'goods',1,195),(1618070400,2,'goods',1,150),(1618070400,2,'goods',1,182),(1618070400,2,'goods',1,163),(1618156800,24,'sum',1,0),(1618156800,1,'goods',1,55),(1618156800,2,'goods',1,54),(1618156800,2,'goods',1,189),(1618156800,1,'goods',1,149),(1618156800,2,'goods',1,174),(1618156800,1,'goods',1,161),(1618156800,1,'goods',1,190),(1618156800,1,'goods',1,184),(1618156800,1,'goods',1,171),(1618156800,1,'goods',1,158),(1618156800,2,'goods',1,196),(1618156800,1,'goods',1,165),(1618156800,1,'goods',1,185),(1618156800,1,'goods',1,186),(1618156800,1,'goods',1,34);
/*!40000 ALTER TABLE `ds_flowstat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_gadmin`
--

DROP TABLE IF EXISTS `ds_gadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_gadmin` (
  `gid` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限自增id',
  `gname` varchar(50) DEFAULT NULL COMMENT '权限组名',
  `glimits` text COMMENT '权限组序列',
  PRIMARY KEY (`gid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_gadmin`
--

LOCK TABLES `ds_gadmin` WRITE;
/*!40000 ALTER TABLE `ds_gadmin` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_gadmin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_goods`
--

DROP TABLE IF EXISTS `ds_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品自增ID(SKU)',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表id',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称+规格名称',
  `goods_advword` varchar(150) DEFAULT NULL COMMENT '商品广告词',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类ID',
  `gc_id_1` int(10) DEFAULT NULL COMMENT '一级分类ID',
  `gc_id_2` int(10) DEFAULT NULL COMMENT '二级分类ID',
  `gc_id_3` int(10) DEFAULT NULL COMMENT '三级分类ID',
  `brand_id` int(10) unsigned DEFAULT '0' COMMENT '品牌ID',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_promotion_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品促销价格',
  `goods_promotion_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '促销类型 0:无促销 1:抢购 2:限时折扣',
  `goods_marketprice` decimal(10,2) DEFAULT NULL COMMENT '商品市场价',
  `goods_ispifa` tinyint(1) DEFAULT '0' COMMENT '是否批发，1表示是',
  `goods_serial` varchar(50) NOT NULL COMMENT '商家编号',
  `goods_storage_alarm` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品库存报警值',
  `goods_click` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品点击数量',
  `goods_salenum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品销售数量',
  `goods_collect` int(10) NOT NULL DEFAULT '0' COMMENT '商品收藏数量',
  `goods_spec` text NOT NULL COMMENT '商品规格序列化',
  `goods_storage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品库存',
  `goods_weight` decimal(5,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '商品重量',
  `goods_image` varchar(100) DEFAULT '' COMMENT '商品主图',
  `goods_lock` tinyint(3) unsigned DEFAULT '0' COMMENT '商品锁定 0未锁，1已锁',
  `goods_state` tinyint(3) unsigned DEFAULT '0' COMMENT '商品状态 0:下架 1:正常，10:违规（禁售）',
  `goods_verify` tinyint(3) unsigned DEFAULT NULL COMMENT '商品审核 1:通过 0:未通过 10:审核中',
  `goods_addtime` int(10) unsigned NOT NULL COMMENT '商品添加时间',
  `goods_edittime` int(10) unsigned NOT NULL COMMENT '商品编辑时间',
  `areaid_1` int(10) unsigned DEFAULT NULL COMMENT '一级地区id',
  `areaid_2` int(10) unsigned DEFAULT NULL COMMENT '二级地区id',
  `region_id` int(10) unsigned DEFAULT '0' COMMENT '一级地区id',
  `color_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '颜色规格id',
  `transport_id` mediumint(8) unsigned DEFAULT '0' COMMENT '售卖区域id',
  `goods_freight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '运费 0:免运费',
  `goods_vat` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否开具增值税发票 1:是 0:否',
  `goods_commend` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品推荐 1:是 0:否',
  `goods_stcids` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分类ID 首尾用,隔开',
  `evaluation_good_star` tinyint(3) unsigned NOT NULL DEFAULT '5' COMMENT '好评星级',
  `evaluation_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评价数',
  `is_virtual` tinyint(3) DEFAULT '0' COMMENT '是否为虚拟商品 1:是 0:否',
  `virtual_indate` int(10) DEFAULT NULL COMMENT '虚拟商品有效期',
  `virtual_limit` tinyint(3) unsigned DEFAULT NULL COMMENT '虚拟商品购买上限',
  `virtual_invalid_refund` tinyint(3) unsigned DEFAULT '1' COMMENT '是否允许过期退款 1:是 0:否',
  `is_goodsfcode` tinyint(4) DEFAULT '0' COMMENT '是否为F码商品 1:是 0:否',
  `is_appoint` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否是预约商品 1:是 0:否',
  `is_presell` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否是预售商品 1:是 0:否',
  `is_have_gift` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否拥有赠品',
  `is_platform_store` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为平台自营',
  `goods_mgdiscount` text COMMENT '序列化会员等级折扣(商品)',
  `goods_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '店铺排序',
  PRIMARY KEY (`goods_id`),
  KEY `store_id` (`store_id`),
  KEY `gc_id` (`gc_id`),
  KEY `gc_id_1` (`gc_id_1`),
  KEY `gc_id_2` (`gc_id_2`),
  KEY `gc_id_3` (`gc_id_3`),
  KEY `brand_id` (`brand_id`),
  KEY `goods_commonid` (`goods_commonid`)
) ENGINE=MyISAM AUTO_INCREMENT=197 DEFAULT CHARSET=utf8 COMMENT='商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_goods`
--

LOCK TABLES `ds_goods` WRITE;
/*!40000 ALTER TABLE `ds_goods` DISABLE KEYS */;
INSERT INTO `ds_goods` VALUES (2,2,'荣耀V9 play 标配版 3+32G 全网通4G手机 铂光金','北欧极简设计，EMUI5.1',1,'官方自营店铺',2,1,2,0,0,998.00,998.00,0,1290.00,0,'1',0,96,0,0,'N;',900,0.000,'1_2017092120144795113.jpg',0,10,1,1505996432,1617550277,0,0,0,0,0,0.00,0,1,'',5,0,1,1514476799,1,0,0,0,0,0,1,'',255),(3,3,'Apple/苹果 iPhone 7plus 128GB 玫瑰金色 移动联通电信4G手机','购机即送精美防尘塞+便捷支架+鱼骨绕线器+店铺延保一年',1,'官方自营店铺',2,1,2,0,0,6999.00,6999.00,0,7100.00,0,'2',10,84,0,0,'N;',899,0.000,'1_2017092120244885492.jpg',0,0,1,1505996810,1617550422,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(4,4,'nubia/努比亚Z17 6G+64G 全网通4G手机 烈焰红 无边框','烈焰红 无边框',1,'官方自营店铺',2,1,2,0,0,2699.00,2699.00,0,3000.00,0,'3',10,12,0,0,'N;',899,0.000,'1_2017092120312320763.jpg',0,0,1,1505997092,1617550422,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(5,5,'智能电动代步车','长续航蓝牙遥控 轻小便携',1,'官方自营店铺',3,1,3,0,0,1990.00,1990.00,0,2000.00,0,'4',0,54,0,0,'N;',99,0.000,'1_2017092120345719915.jpg',0,0,1,1505997303,1617550422,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(6,6,'灵动Lite版 NV3012 视频通话智能机器人','人工智能 视频聊天儿童早教益智娱乐 智能家居',1,'官方自营店铺',3,1,3,0,0,149.00,149.00,0,150.00,0,'5',10,29,0,0,'N;',56,0.000,'1_2017092120365848023.jpg',0,0,1,1505997421,1618044530,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(7,7,'HOST好帅智能云教育机器人二蛋Q6 ','早教机英语学习机国学儿童陪护 玩具礼物百科全书正版音乐播放机京剧粤剧儿歌国学',1,'官方自营店铺',3,1,3,0,0,1699.00,1699.00,0,2000.00,0,'6',0,27,0,0,'N;',199,0.000,'1_2017092120382376796.jpg',0,0,1,1505997509,1617550417,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(8,8,'先锋(Pioneer)LED-39B700S 39英寸 高清 网络 智能 液晶电视','六核高速处理器 智能系统 高清解码 聚力影视资源  ',1,'官方自营店铺',5,4,5,0,0,1599.00,1599.00,0,1699.00,0,'7',0,17,0,0,'N;',399,0.000,'1_2017092120445748551.jpg',0,10,1,1505997903,1617648179,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(9,9,'长虹（CHANGHONG）39M1 39英寸 窄边高清液晶电视（黑色）','蓝光护眼电视，卧室精选',1,'官方自营店铺',5,4,5,0,0,1399.00,1399.00,0,1500.00,0,'8',0,6,0,0,'N;',69,0.000,'1_2017092120480147477.jpg',0,10,1,1505998084,1617648179,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(10,10,'39英寸64位24核安卓智能平板液晶电视（黑色）','炫彩A+屏看的更清晰，2K电视4K芯！HDR10让画面栩栩如生',1,'官方自营店铺',5,4,5,0,0,1200.00,1200.00,0,1399.00,0,'',0,16,0,0,'N;',45,0.000,'1_2017092120493430154.jpg',0,10,1,1505998176,1617679387,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(11,11,'1.5匹 变频 智能 二级能效极速侠 空调挂机','60秒暖房，wifi智控，18分贝静音，焕新家，就是这么简单！',1,'官方自营店铺',6,4,6,0,0,2699.00,2699.00,0,2780.00,0,'9',0,14,0,0,'N;',700,0.000,'1_2017092120564717575.jpg',0,10,1,1505998723,1617648179,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(12,12,'扬子(YAIR) 小2匹 冷暖 自动清洗 定频空调柜机','日立压缩机，全网比价，柜机中的战斗机',1,'官方自营店铺',6,4,6,0,0,2999.00,2999.00,0,3200.00,0,'10',0,4,0,0,'N;',390,0.000,'1_2017092121050988491.jpg',0,10,1,1505999121,1617648179,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(13,13,'变频风冷无霜 独立双循环 LED显示 对开门冰箱（白色)','   变频压缩机，双独立循环，满足对空气、温度、湿度要求，创造大容量保鲜奇迹！并联双循环+智能精准控温',1,'官方自营店铺',7,4,7,0,0,5380.00,5380.00,0,5399.00,0,'11',0,22,0,0,'N;',180,0.000,'1_2017092121142556524.jpg',0,10,1,1505999668,1617648179,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(14,14,'三门冰箱',' 家用节能 中门软冷冻 红色玻璃面板 静音低噪',1,'官方自营店铺',7,4,7,0,0,1433.00,1433.00,0,1699.00,0,'12',0,10,0,0,'N;',69,0.000,'1_2017092121225164684.jpg',0,10,1,1506000181,1617961890,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(15,15,'方太（FOTILE）云魔方欧式 烟灶套餐','18立方 天然气',1,'官方自营店铺',20,8,20,0,0,4299.00,4299.00,0,4380.00,0,'13',0,14,0,0,'N;',58,0.000,'1_2017092121260662503.jpg',0,10,1,1506000371,1617648172,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(16,16,'美的(Midea)台嵌两用燃气灶JZT-Q360B防爆钢化玻璃面板','4.2KW强劲火力；五档精控；时尚方灶，高端厨房品质之选！  ',1,'官方自营店铺',20,8,20,0,0,1190.00,1190.00,0,1200.00,0,'14',0,21,0,0,'N;',140,0.000,'1_2017092121492327671.jpg',0,10,1,1506001770,1617648172,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(17,17,'飞科(FLYCO) 电动剃须刀','全身水洗，USB充电系统，优雅充电底座，刀架可浮动，1小时快充',1,'官方自营店铺',21,8,21,0,0,145.00,145.00,0,160.00,0,'15',0,4,0,0,'N;',456,0.000,'1_2017092121542617701.jpg',0,10,1,1506002071,1617648172,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(18,18,'美的（Midea）电饭煲','不锈钢外壳 智能一键通 24小时预约3-4-5-6人电饭锅',1,'官方自营店铺',21,8,21,0,0,199.00,199.00,0,210.00,0,'16',0,27,0,0,'N;',132,0.000,'1_2017092121564484910.jpg',0,10,1,1506002220,1617648172,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(19,19,'孔雀尾 菜刀套装','刀具齐全 优质钢材 经久耐用 耐腐蚀高强度',1,'官方自营店铺',22,8,22,0,0,368.00,368.00,0,400.00,0,'17',0,22,0,0,'N;',454,0.000,'1_2017092122005521920.jpg',0,10,1,1506002467,1617679358,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(20,20,'苏泊尔（supor)家用真空保温壶·晶韵系列KC20AP1(摩卡金)','2L大容量 真空保温 304不锈钢 保冷保热  ',1,'官方自营店铺',22,8,22,0,0,199.00,199.00,0,250.00,0,'',0,11,0,0,'N;',248,0.000,'1_2017092122035543274.jpg',0,10,1,1506002646,1617648172,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(21,21,'联想(Lenovo)拯救者Y520 15.6英寸游戏笔记本电脑','R720同模具，加128SSD混合硬盘，GTX1050显卡，背光键盘',1,'官方自营店铺',23,9,23,0,0,5400.00,5400.00,0,5499.00,0,'20',0,22,0,0,'N;',459,0.000,'1_2017092123585272874.jpg',0,10,1,1506009741,1618076695,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(22,22,'华硕（ASUS）FH5900 顽石电竞版15.6英寸游戏笔记本电脑','1T 940MX-2G独显',1,'官方自营店铺',23,9,23,0,0,4499.00,4499.00,0,4500.00,0,'20',0,9,0,0,'N;',168,0.000,'1_2017092200403659812.jpg',0,10,1,1506012042,1617648172,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(23,23,'戴尔(DELL)灵越Ins15MR-7528SS 15.6英寸笔记本电脑','',1,'官方自营店铺',23,9,23,0,0,3999.00,3999.00,0,4200.00,0,'21',0,7,0,0,'N;',230,0.000,'1_2017092201034951336.jpg',0,10,1,1506013470,1617648172,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(24,24,'佳能(Canon) EOS M10 微单套机','时尚翻屏设计-超赞屏幕取景-WiFi随拍随秀',1,'官方自营店铺',24,9,24,0,0,2290.00,2290.00,0,2999.00,0,'22',0,18,0,0,'N;',145,0.000,'1_2017092201084565859.jpg',0,10,1,1506013739,1617648172,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(25,25,' 数码单反相机','下单赠送主图大礼包 内存卡 相机包 三脚架',1,'官方自营店铺',24,9,24,0,0,4280.00,4280.00,0,4300.00,0,'23',0,12,0,0,'N;',128,0.000,'1_2017092201381015306.jpg',0,10,1,1506015501,1617673650,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(26,26,'南极人(NanJiren) 加高蒙古包蚊帐','开门支架学生宿舍单人双人B',1,'官方自营店铺',25,10,25,0,0,59.00,59.00,0,66.00,0,'10',0,7,0,0,'N;',78,0.000,'1_2017092201461861948.jpg',0,10,1,1506015989,1617724594,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(27,27,'小狮子抱枕',' 带给你专宠的美好',1,'官方自营店铺',25,10,25,0,0,39.00,39.00,0,45.00,0,'28',10,6,0,0,'N;',99,0.000,'1_2017092201523177266.jpg',0,10,1,1506016354,1617648172,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(28,28,'南极人(NanJiren)纯棉床单四件套全棉床上用品婚庆被套4件套','夏日约“惠”南极人',1,'官方自营店铺',26,10,26,0,0,109.00,109.00,0,120.00,0,'',0,11,0,0,'N;',147,0.000,'1_2017092202022516767.jpg',0,10,1,1506016948,1617648172,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(29,29,'欧式美式实木雕花沙发 高档大户型客厅真皮沙发头层牛皮沙发组合','头层牛皮+全实木',1,'官方自营店铺',26,10,26,0,0,1320.00,1320.00,0,1400.00,0,'26',0,8,0,0,'N;',99,0.000,'1_2017092202082283957.jpg',0,10,1,1506017336,1617648172,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(30,30,'北欧简约现代日式可拆洗布艺床','小户型实木婚床软床',1,'官方自营店铺',26,10,26,0,0,1980.00,1980.00,0,2100.00,0,'',0,11,0,0,'N;',49,0.000,'1_2017092202112937358.jpg',0,10,1,1506017493,1617648172,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(31,31,'宜莱芙 吸盘挂壁式牙刷架漱口杯套装（4口之家）','',1,'官方自营店铺',27,10,27,0,0,49.00,49.00,0,55.00,0,'27',0,7,0,0,'N;',78,0.000,'1_2017092202162519571.jpg',0,10,1,1506017804,1617648172,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(32,32,'日用浴室用品现代时尚家居家用浴帘','宽150*高180+环 一个装',1,'官方自营店铺',27,10,27,0,0,22.50,22.50,0,25.00,0,'28',0,6,0,0,'N;',59,0.000,'1_2017092202215519250.jpg',0,10,1,1506018119,1617648172,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(33,33,'益达 木糖醇清爽西瓜味40粒瓶装56g','关爱牙齿，更关心您',1,'官方自营店铺',28,11,28,0,0,12.80,12.80,0,13.00,0,'10',0,2,0,0,'N;',998,0.000,'1_2017092202310929808.jpg',0,10,1,1506018671,1617648172,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(34,34,'三只松鼠_小贱串烧味拉面丸子85g','闲膨化零食拉面丸子休闲丸子串烧味',1,'官方自营店铺',28,11,28,0,0,13.80,13.80,0,14.00,0,'',0,7,0,0,'N;',546,0.000,'1_2017092202323192694.jpg',0,10,1,1506018762,1618236255,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(36,36,'洋河 梦之蓝M3-52度500ml','',1,'官方自营店铺',29,11,29,0,0,528.00,528.00,0,570.00,0,'',0,5,0,0,'N;',85,0.000,'1_2017092202350299027.jpg',0,10,1,1506018905,1617648172,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(37,37,'五粮液 红 52度','孝敬长辈，推荐用酒',1,'官方自营店铺',29,11,29,0,0,695.00,695.00,0,820.00,0,'31',0,65,1,0,'a:2:{i:1;s:3:\"红\";i:37;s:5:\"52度\";}',449,0.000,'1_2017092202382291274.jpg',0,10,1,1506019112,1617648172,0,0,0,1,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(39,39,'自然堂 水润保湿两件套 补水保湿套装','',1,'官方自营店铺',30,12,30,0,0,69.40,69.40,0,70.00,0,'',0,12,0,0,'N;',148,0.000,'1_2017092202443553519.jpg',0,10,1,1506019477,1617648172,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(40,40,'百雀羚水能量焕耀套装补水保湿护肤套装 两件套 翠绿 200ml','补水修复 宛若新生  ',1,'官方自营店铺',30,12,30,0,0,369.00,369.00,0,400.00,0,'34',0,10,0,0,'a:3:{i:42;s:9:\"两件套\";i:45;s:6:\"翠绿\";i:46;s:5:\"200ml\";}',25,0.000,'1_2017092202461115940.jpg',0,10,1,1506019573,1617648172,0,0,0,42,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(41,41,' 小黑裙香水洗发水+沐浴露 500ml',' 风魔欧美 持久留香 洗护套装',1,'官方自营店铺',31,12,31,0,0,45.90,45.90,0,40.00,0,'38',0,7,0,0,'a:1:{i:1;s:5:\"500ml\";}',58,0.000,'1_2017092202492958131.jpg',0,10,1,1506019782,1617648172,0,0,0,1,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(42,42,'滋源无硅油洗发水氨基酸生姜535洗护发套装 两件套 紫 500ml','',1,'官方自营店铺',31,12,31,0,0,179.00,179.00,0,189.00,0,'39',0,8,0,0,'a:3:{i:49;s:9:\"两件套\";i:1;s:3:\"紫\";i:47;s:5:\"500ml\";}',45,0.000,'1_2017092202514891485.jpg',0,10,1,1506019911,1617648172,0,0,0,49,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(43,43,'宠物用品出行牵引带','',1,'官方自营店铺',32,12,32,0,0,14.90,14.90,0,25.00,0,'39',0,10,0,0,'N;',126,0.000,'1_2017092202553367071.jpg',0,10,1,1506020205,1617700993,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(44,44,'家用宠物日用品饮水器喝水瓶','',1,'官方自营店铺',32,12,32,0,0,14.90,14.90,0,15.00,0,'35',10,14,0,0,'N;',120,0.000,'1_2017092202585843151.jpg',0,10,1,1506020341,1617648172,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(45,45,'与牧2017韩版短款 针织 黑 M','',1,'官方自营店铺',39,15,39,0,0,39.00,39.00,0,42.00,0,'',0,11,0,0,'a:3:{i:1;s:6:\"针织\";i:3;s:3:\"黑\";i:8;s:1:\"M\";}',100,0.000,'1_2017092203045216863.jpg',0,10,1,1506020705,1617797973,0,0,0,1,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(46,45,'与牧2017韩版短款 针织 黑 L','',1,'官方自营店铺',39,15,39,0,0,39.00,39.00,0,42.00,0,'',0,2,0,0,'a:3:{i:1;s:6:\"针织\";i:3;s:3:\"黑\";i:9;s:1:\"L\";}',100,0.000,'1_2017092203045216863.jpg',0,10,1,1506020705,1617648172,0,0,0,1,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(47,45,'与牧2017韩版短款 针织 黑 XL','',1,'官方自营店铺',39,15,39,0,0,39.00,39.00,0,42.00,0,'',0,2,0,0,'a:3:{i:1;s:6:\"针织\";i:3;s:3:\"黑\";i:10;s:2:\"XL\";}',100,0.000,'1_2017092203045216863.jpg',0,10,1,1506020705,1617648172,0,0,0,1,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(48,45,'与牧2017韩版短款 针织 白 M','',1,'官方自营店铺',39,15,39,0,0,39.00,39.00,0,42.00,0,'',0,1,0,0,'a:3:{i:1;s:6:\"针织\";i:4;s:3:\"白\";i:8;s:1:\"M\";}',140,0.000,'1_2017092203045216863.jpg',0,10,1,1506020705,1617648172,0,0,0,1,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(49,45,'与牧2017韩版短款 针织 白 L','',1,'官方自营店铺',39,15,39,0,0,39.00,39.00,0,42.00,0,'',0,0,0,0,'a:3:{i:1;s:6:\"针织\";i:4;s:3:\"白\";i:9;s:1:\"L\";}',100,0.000,'1_2017092203045216863.jpg',0,10,1,1506020705,1617648172,0,0,0,1,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(50,45,'与牧2017韩版短款 针织 白 XL','',1,'官方自营店铺',39,15,39,0,0,39.00,39.00,0,42.00,0,'',0,0,0,0,'a:3:{i:1;s:6:\"针织\";i:4;s:3:\"白\";i:10;s:2:\"XL\";}',100,0.000,'1_2017092203045216863.jpg',0,10,1,1506020705,1617648172,0,0,0,1,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(51,46,'蔚缇2017夏季小花网纱+吊带+喇叭裤三件套女','限时促销',1,'官方自营店铺',39,15,39,0,0,139.50,139.50,0,145.00,0,'1610',0,7,0,0,'N;',169,0.000,'1_2017092203062937149.jpg',0,10,1,1506020790,1617648172,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(52,47,'2017夏季百搭吊带背心女新款修身纯棉吊带衫蕾丝打底背心','宽松小吊带 白色',1,'官方自营店铺',39,15,39,0,0,39.90,39.90,0,45.00,0,'1620',0,15,0,0,'N;',466,0.000,'1_2017092203083967214.jpg',0,10,1,1506020928,1617673676,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(53,48,'2017秋季新款男士外套休闲潮牛仔夹克衫帅气棒球服学生韩版','秋季新款',1,'官方自营店铺',41,15,41,0,0,159.00,159.00,0,169.00,0,'1630',10,13,0,0,'N;',258,0.000,'1_2017092203123417256.jpg',0,10,1,1506021154,1617648172,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(54,49,'丹杰仕 夏季男女情侣防晒衣潮男时尚韩版修身连帽薄款印花夹克上衣','',1,'官方自营店铺',41,15,41,0,0,59.00,59.00,0,69.00,0,'1640',0,14,0,0,'N;',540,0.000,'1_2017092203151752294.jpg',0,10,1,1506021320,1618169004,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(55,50,'轻颦双黛 男士内裤透气吸汗男内裤','　男士舒适透气内裤 柔软舒适不易变形  ',1,'官方自营店铺',44,15,44,0,0,29.80,29.80,0,36.00,0,'1650',10,8,0,0,'N;',128,0.000,'1_2017092203175020843.jpg',0,10,1,1506021473,1618158133,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(56,51,'北极绒女士内裤','性感轻薄中低腰透气女内裤',1,'官方自营店铺',44,15,44,0,0,49.00,49.00,0,58.00,0,'1660',0,6,0,0,'N;',999,0.000,'1_2017092203201884569.jpg',0,10,1,1506021621,1617965538,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(57,52,'尖头粗跟高跟鞋一字扣单鞋 性感窜珠脚链高跟浅口凉鞋女鞋','',1,'官方自营店铺',45,16,45,0,0,49.00,49.00,0,52.00,0,'1068',10,5,0,0,'N;',586,0.000,'1_2017092203242754461.jpg',0,10,1,1506021871,1617893370,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(58,53,'品点新款平底轻便蛋卷鞋防滑牛筋底舒适女鞋','防滑舒适，轻便时尚，标准尺码！',1,'官方自营店铺',45,16,45,0,0,78.00,78.00,0,82.00,0,'2017',10,9,0,0,'N;',410,0.000,'1_2017092203261873185.jpg',0,10,1,1506021982,1617648172,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(59,54,'贝美芬 925银心心相印女士项链 女生饰品 时尚流行','时尚简约',1,'官方自营店铺',46,16,46,0,0,88.00,88.00,0,98.00,0,'',0,6,0,0,'N;',140,0.000,'1_2017092203275599920.jpg',0,10,1,1506022081,1617728711,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(60,55,'幸运四叶草纯银吊坠','',1,'官方自营店铺',46,16,46,0,0,75.00,75.00,0,89.00,0,'2016',10,10,0,0,'N;',45,0.000,'1_2017092203294765362.jpg',0,10,1,1506022193,1617648172,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(61,56,'施诺绮心梦爱心型925纯银水晶项链采用施华洛世奇元素水晶吊坠','',1,'官方自营店铺',46,16,46,0,0,108.00,108.00,0,120.00,0,'2018',10,5,0,0,'N;',186,0.000,'1_2017092203321969628.jpg',0,10,1,1506022343,1617648172,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(62,57,'封后皮皮虾韩国单肩包女韩版帆布手提袋','简约帆布袋',1,'官方自营店铺',47,16,47,0,0,39.00,39.00,0,49.00,0,'2049',10,1,0,0,'N;',99,0.000,'1_2017092203335981358.jpg',0,10,1,1506022442,1617648172,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(63,58,'迈克.科尔斯(Michael Kors/MK)小号女包手提单肩斜跨包','海外采购',1,'官方自营店铺',47,16,47,0,0,1096.00,1096.00,0,1200.00,0,'1068',0,29,0,0,'N;',58,0.000,'1_2017092203371485168.jpg',0,10,1,1506022638,1617867457,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(64,59,'蜂苹果6s数据线iphone6二合一拖安卓通用手机8P充电线器快充线','闪电快充 提速40% 一年换新',1,'官方自营店铺',48,1,48,0,0,19.90,19.90,0,21.00,0,'10123',0,8,0,0,'N;',99,0.000,'1_2017092821352360295.jpg',0,0,1,1506605735,1617967268,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(65,60,'手机散热器华为苹果通用充电宝式架子桌面游戏手柄支驾冷却降温器','双风扇快速降温 可供电持久续航',1,'官方自营店铺',48,1,48,0,0,58.00,58.00,0,66.00,0,'',0,8,0,0,'N;',99,0.000,'1_2017092821383373641.jpg',0,0,1,1506605915,1617967167,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(66,61,'手机充电宝带蓝牙音响三合一多功能平坂支架1毫安5移动电源20000M','二合一 [支架+充电宝] 三合一 [支架+充电宝+蓝牙音响]',1,'官方自营店铺',48,1,48,0,0,55.00,55.00,0,80.00,0,'',0,13,0,0,'N;',99,0.000,'1_2017092821403589442.jpg',0,0,1,1506606045,1617550394,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(67,62,'苹果无线HDMI同屏器airplay推送宝高清安卓手机电视投影视频传输','无需软件不需要安装app即可实现无线同屏',1,'官方自营店铺',49,1,49,0,0,158.00,158.00,0,158.00,0,'',0,7,0,0,'N;',99,0.000,'1_2017092821431519588.jpg',0,0,1,1506606198,1617550394,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(68,63,'唐麦 F3耳机入耳式 重低音炮手机电脑音乐有线耳塞式金属通用带麦','15天无理由退换货一年质保换新',1,'官方自营店铺',49,1,49,0,0,55.00,55.00,0,59.00,0,'',0,5,0,0,'N;',99,0.000,'1_2017092821510935694.jpg',0,0,1,1506606673,1617550394,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(69,64,'森狗SimDog sim2.0手机k歌耳机入耳式通用男女生耳塞式耳麦重低音','专利产品 支持语音 支持接听电话',1,'官方自营店铺',49,1,49,0,0,19.80,19.80,0,20.00,0,'',0,10,0,0,'N;',999,0.000,'1_2017092821530372212.jpg',0,0,1,1506606785,1617550394,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(70,65,'达尔优 进化者D3带麦克风震动电脑游戏耳机头戴式耳麦绝地求生lol','头戴式震动发光耳麦 电竞赛事耳机金属头梁',1,'官方自营店铺',49,1,49,0,0,158.00,158.00,0,160.00,0,'',0,5,0,0,'N;',99,0.000,'1_2017092821544898610.jpg',0,0,1,1506606891,1617550394,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(71,66,'uoluo特价21 22 24 32 40 42 50 55寸60智能wifi网络小液晶电视机 50','高清电视接口：闭路+AV+HDMI+电脑VGA+DVD+音频+USB多媒体【不含网络功能】； 智能电视接口：含高清电视所有的功能接口+有线网络+无线wifi。',1,'官方自营店铺',5,4,5,0,0,2099.00,2099.00,0,2099.00,0,'',0,4,0,0,'a:1:{i:1;s:11:\"50寸高清\";}',99,0.000,'1_2017092821585013652.jpg',0,10,1,1506607133,1617648179,0,0,0,1,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(72,67,'Hisense/海信 KFR-35GW/ER22N3(1L04) 大1.5p匹家用冷暖空调挂机','',1,'官方自营店铺',6,4,6,0,0,1999.00,1999.00,0,1999.00,0,'',0,6,0,0,'N;',99,0.000,'1_2017092822032535526.jpg',0,10,1,1506607408,1617648179,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(73,68,'先锋工业冷风扇 移动空调扇家用 冷风机商用小空调 加湿水冷气扇','先锋新品工业冷风扇',1,'官方自营店铺',6,4,6,0,0,1199.00,1199.00,0,1200.00,0,'',0,11,0,0,'N;',999,0.000,'1_2017092822050083427.jpg',0,10,1,1506607504,1617733528,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(75,70,'荣事达空调扇冷暖两用家用静音遥控冷风机制冷风扇加湿移动小空调','强劲制冷 触摸屏 智能遥控 净化加湿',1,'官方自营店铺',6,4,6,0,0,358.00,358.00,0,358.00,0,'',0,6,0,0,'N;',99,0.000,'1_2017092823485490716.jpg',0,10,1,1506613743,1617648179,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(76,71,'美菱可移动式空调一体机1.5匹1 P单冷型小制冷厨房窗式冷暖免安装','',1,'官方自营店铺',6,4,6,0,0,1299.00,1299.00,0,1299.00,0,'',0,2,0,0,'N;',9,0.000,'1_2017092823501155931.jpg',0,10,1,1506613814,1617648179,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(77,72,'乐创冷藏工作台冷冻冰箱平冷保鲜不锈钢商用厨房奶茶店操作台冰柜','优质商家热销2万无磁不锈钢加厚全发泡',1,'官方自营店铺',7,4,7,0,0,1478.00,1478.00,0,1478.00,0,'',0,16,0,0,'N;',99,0.000,'1_2017092823531033711.jpg',0,10,1,1506613995,1617679331,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(78,73,'Midea/美的 BCD-169CM(E)双门冰箱家用冷藏冷冻对开门小型冰箱','对开门小型冰箱',1,'官方自营店铺',7,4,7,0,0,1099.00,1099.00,0,1100.00,0,'',0,11,0,0,'N;',99,0.000,'1_2017092900001256656.jpg',0,10,1,1506614415,1617673625,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(79,74,'志高全自动洗衣机 家用 小型 5.5公斤波轮 静音宿舍 迷你风干预约','小家优选 节能静音 顺丰入户 预约童锁',1,'官方自营店铺',51,4,51,0,0,498.00,498.00,0,500.00,0,'',0,10,0,0,'N;',999,0.000,'1_2017092900022214210.jpg',0,10,1,1506614544,1617648179,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(80,75,'Chigo/志高全自动洗衣机 15KG宾馆酒店商用大容量不锈钢顺丰入户','顺丰入户 下单送荣事达电烤箱一个',1,'官方自营店铺',51,4,51,0,0,2500.00,2500.00,0,2600.00,0,'',0,10,0,0,'N;',99,0.000,'1_2017092900033832502.jpg',0,10,1,1506614620,1617648179,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(81,76,'集成灶自动清洗正品 侧吸下排式油烟机一体环保灶 双电磁炉威士伯','天然气5000火力！断电应急！烟机延时',1,'官方自营店铺',20,8,20,0,0,3180.00,3180.00,0,3400.00,0,'',0,24,0,0,'N;',450,0.000,'1_2017092900052977159.jpg',0,10,1,1506614732,1617648172,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(82,77,'威士伯J2集成灶 翻盖 一体 自动清洗烤箱蒸汽炉烟灶消套装 环保灶','上门安装 双电机 漏气保护',1,'官方自营店铺',20,8,20,0,0,4590.00,4590.00,0,4700.00,0,'',0,4,0,0,'N;',99,0.000,'1_2017092900064438234.jpg',0,10,1,1506614807,1617648172,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(83,78,'红心大蒸汽挂烫机家用熨斗手持挂烫机烫衣服熨烫机电熨斗正品包邮','2000W大功率 超强蒸汽 快速熨衣',1,'官方自营店铺',21,8,21,0,0,139.00,139.00,0,145.00,0,'',0,17,2,0,'N;',97,0.000,'1_2017092900081355788.jpg',0,10,1,1506614894,1617794370,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,'',255),(130,121,'audifono inalambrico d3','tiene ubicacion \r\ntiene sensor tactir ',1,'官方自营店铺',48,1,48,0,0,0.00,0.00,0,0.00,1,'',0,44,0,0,'N;',100,1.000,'1_2021040604002646954.png',0,1,1,1617652950,1618094124,0,0,0,0,0,1500.00,1,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(131,122,'Alfombra de Cocina','Alfombra de Cocina',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,1,'',200,28,0,0,'N;',100,1.000,'1_2021040604443022136.png',0,1,1,1617655522,1618218316,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(133,124,'brochas ','brochas ',1,'官方自营店铺',774,772,773,774,0,0.00,0.00,0,0.00,0,'',0,16,0,0,'N;',100,1.000,'1_2021040605053674673.png',0,1,1,1617656857,1618181563,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(134,125,'organizador ','Organizador de Cepillo ',1,'官方自营店铺',768,766,768,0,0,550.00,550.00,0,1000.00,1,'',0,24,0,0,'N;',100,1.000,'1_2021040605091998482.png',0,1,1,1617657161,1618086290,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(135,126,'Alfombra de Cocina','Alfombra para tu cocina ',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,1,'',0,14,1,0,'N;',99,1.000,'1_2021040605271432570.png',0,1,1,1617658182,1618062652,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(136,127,'caja mediana','caja para almacenamiento de zapatos',1,'官方自营店铺',788,786,788,0,0,0.00,0.00,0,0.00,0,'',0,17,0,0,'N;',100,1.000,'1_2021040605380126814.png',0,1,1,1617658766,1618076465,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(137,128,'Caja Mediana','caja para almacenamiento de zapatos',1,'官方自营店铺',789,786,789,0,0,0.00,0.00,0,0.00,1,'',0,8,0,0,'N;',100,1.000,'1_2021040605380126814.png',0,1,1,1617658768,1618181586,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(138,129,'Cepillo Electrico One Step','Cepillo para secar tu pelo',1,'官方自营店铺',790,781,790,0,0,500.00,500.00,0,0.00,0,'',0,16,0,0,'N;',100,1.000,'1_2021040605530867977.png',0,1,1,1617659681,1618013273,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(139,130,'Cepillo Electrico One Step','Cepillo para secar tu pelo',1,'官方自营店铺',790,781,790,0,0,500.00,500.00,0,0.00,0,'',0,9,0,0,'N;',100,1.000,'1_2021040605530867977.png',0,1,1,1617659681,1618025004,0,0,0,0,0,0.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(140,131,'Alfombra de Cocina','',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,0,'',0,5,0,0,'N;',100,0.000,'1_2021040822481574622.png',0,1,1,1617893373,1618065445,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(143,134,'Alfombra con diseños ','Av. Duarte casi esq. 27 de febrero, antiguo hiper 1.',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,1,'',0,12,0,0,'N;',100,0.000,'1_2021040920552259843.png',0,1,1,1617973132,1618218663,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(142,133,'Alfombra con diseños ','Av. Duarte casi esq. 27 de febrero, antiguo hiper 1.',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,0,'',0,9,0,0,'N;',100,0.000,'1_2021040905412572593.png',0,1,1,1617918392,1617974902,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(144,135,'Alfombras con diseños','Av. Duarte casi esq. 27 de febrero, antiguo hiper 1.',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,0,'',0,1,0,0,'N;',100,0.000,'1_2021040921173889786.png',0,1,1,1617974524,1617974888,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(145,136,'Alfombras con diseños','',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,0,'',0,4,0,0,'N;',100,0.000,'1_2021040921332596242.png',0,1,1,1617975255,1618203504,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(146,137,'Alfombras con diseños','',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,0,'',0,1,0,0,'N;',100,0.000,'1_2021040921465271189.png',0,1,1,1617976069,1617977941,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(147,138,'Alfombras con diseños','',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,0,'',0,3,0,0,'N;',100,0.000,'1_2021040922004293287.png',0,1,1,1617976877,1618235988,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(148,139,'Alfombras con diseños','',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,0,'',0,2,0,0,'N;',100,0.000,'1_2021040922050523275.png',0,1,1,1617977138,1618087468,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(149,140,'Alfombras con diseños','',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,0,'',0,7,0,0,'N;',100,0.000,'1_2021040922094456374.png',0,1,1,1617977397,1618233763,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(150,141,'Alfombras con diseños','',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,0,'',0,2,0,0,'N;',100,0.000,'1_2021040922122255921.png',0,1,1,1617977582,1618113468,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(151,142,'Alfombras con diseños','',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,0,'',0,3,0,0,'N;',100,0.000,'1_2021040922250392074.png',0,1,1,1617978319,1618113531,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(152,143,'Alfombras con diseños','',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,0,'',0,1,0,0,'N;',100,0.000,'1_2021040922291721264.png',0,1,1,1617978594,1618200857,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(153,144,'Alfombras con diseños','',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,0,'',0,1,0,0,'N;',100,0.000,'1_2021040922375871880.png',0,1,1,1617979087,1618235833,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(154,145,'Alfombras con diseños','',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,0,'',0,1,0,0,'N;',100,0.000,'1_2021040922444325202.png',0,1,1,1617979527,1618225731,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(155,146,'Alfombras con diseños','',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,0,'',0,1,0,0,'N;',100,0.000,'1_2021040922475725571.png',0,1,1,1617979687,1618100799,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(156,147,'Alfombras con diseños','',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,0,'',0,0,0,0,'N;',100,0.000,'1_2021040922491147671.png',0,1,1,1617979828,1617979847,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(157,148,'Alfombras con diseños','',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,0,'',0,3,0,0,'N;',100,0.000,'1_2021040922561014870.png',0,1,1,1617980184,1618118373,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(158,149,'Alfombras con diseños','',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,0,'',0,3,0,0,'N;',100,0.000,'1_2021040923000421960.png',0,1,1,1617982430,1618211662,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(159,150,'Reloj Inteligente T500 Plus ','',1,'官方自营店铺',3,1,3,0,0,0.00,0.00,0,0.00,1,'',0,7,0,0,'N;',100,0.000,'1_2021041003201145253.png',0,1,1,1617996167,1618181214,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(160,151,'Alfombra de Cocina','',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,0,'',0,3,0,0,'N;',100,0.000,'1_2021041022523144032.png',0,1,1,1618066480,1618235855,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(161,152,'Alfombra de Cocina','',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,0,'',0,9,0,0,'N;',100,0.000,'1_2021041022571359920.png',0,1,1,1618066651,1618216299,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(162,153,'Alfombra de Cocina','',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,0,'',0,2,0,0,'N;',100,0.000,'1_2021041022591267048.png',0,1,1,1618066772,1618083298,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(163,154,'Alfombra de Cocina','',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,0,'',0,3,0,0,'N;',100,0.000,'1_2021041023003813230.png',0,1,1,1618066855,1618113493,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(164,155,'Funda para sofa de 1','',1,'官方自营店铺',769,766,769,0,0,0.00,0.00,0,0.00,0,'',0,5,0,0,'N;',100,0.000,'1_2021041023284260124.png',0,1,1,1618068558,1618126660,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(165,156,'Funda para sofa de 2','',1,'官方自营店铺',769,766,769,0,0,0.00,0.00,0,0.00,0,'',0,1,0,0,'N;',100,0.000,'1_2021041023330964382.png',0,1,1,1618068849,1618223471,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(166,157,'Funda para sofa de 3','',1,'官方自营店铺',769,766,769,0,0,0.00,0.00,0,0.00,0,'',0,1,0,0,'N;',100,0.000,'1_2021041023380076553.png',0,1,1,1618069100,1618235880,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(167,158,'Funda para sofa de 4','',1,'官方自营店铺',769,766,769,0,0,0.00,0.00,0,0.00,0,'',0,2,0,0,'N;',100,0.000,'1_2021041023434143389.png',0,1,1,1618069477,1618227133,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(168,159,'Funda para sofa de 4','',1,'官方自营店铺',769,766,769,0,0,0.00,0.00,0,0.00,0,'',0,2,0,0,'N;',100,0.000,'1_2021041023493328894.png',0,1,1,1618069789,1618100904,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(169,160,'Funda para sofa de 1','',1,'官方自营店铺',769,766,769,0,0,0.00,0.00,0,0.00,0,'',0,1,0,0,'N;',100,0.000,'1_2021041023514097137.png',0,1,1,1618069886,1618076124,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(170,161,'Funda para sofa de 2','',1,'官方自营店铺',769,766,769,0,0,0.00,0.00,0,0.00,0,'',0,6,0,0,'N;',100,0.000,'1_2021041023535398568.png',0,1,1,1618070049,1618233890,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(171,162,'Funda para sofa de 3','',1,'官方自营店铺',769,766,769,0,0,0.00,0.00,0,0.00,0,'',0,2,0,0,'N;',100,0.000,'1_2021041023570344950.png',0,1,1,1618070236,1618211558,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(172,163,'Funda para sofa de 1','',1,'官方自营店铺',769,766,769,0,0,0.00,0.00,0,0.00,0,'',0,1,0,0,'N;',100,0.000,'1_2021041023592150229.png',0,1,1,1618070378,1618235906,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(173,164,'Funda para sofa de 2','',1,'官方自营店铺',769,766,769,0,0,0.00,0.00,0,0.00,0,'',0,1,0,0,'N;',100,0.000,'1_2021041100021099343.png',0,1,1,1618070596,1618235931,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(174,165,'Funda para sofa de 3','',1,'官方自营店铺',769,766,769,0,0,0.00,0.00,0,0.00,0,'',0,9,0,0,'N;',100,0.000,'1_2021041100084181391.png',0,1,1,1618070980,1618216214,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(175,166,'Funda para sofa de 4','',1,'官方自营店铺',769,766,769,0,0,0.00,0.00,0,0.00,0,'',0,0,0,0,'N;',100,0.000,'1_2021041100114876270.png',0,1,1,1618071123,1618071127,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(176,167,'Papel   Tapiz ','',1,'官方自营店铺',770,766,770,0,0,0.00,0.00,0,0.00,0,'',0,2,0,0,'N;',100,0.000,'1_2021041101084085686.png',0,1,1,1618074597,1618103388,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(177,168,'Papel Tapiz ','',1,'官方自营店铺',770,766,770,0,0,0.00,0.00,0,0.00,0,'',0,1,0,0,'N;',100,0.000,'1_2021041101131373447.png',0,1,1,1618074811,1618103641,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(178,169,'Papel Tapiz ','',1,'官方自营店铺',770,766,770,0,0,0.00,0.00,0,0.00,0,'',0,6,0,0,'N;',100,0.000,'1_2021041101145153751.png',0,1,1,1618074907,1618223029,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(179,170,'Papel Tapiz ','',1,'官方自营店铺',770,766,770,0,0,0.00,0.00,0,0.00,0,'',0,1,0,0,'N;',100,0.000,'1_2021041101170768564.png',0,1,1,1618075038,1618235867,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(180,171,'Papel Tapiz ','',1,'官方自营店铺',770,766,770,0,0,0.00,0.00,0,0.00,0,'',0,3,0,0,'N;',100,0.000,'1_2021041101184532347.png',0,1,1,1618075138,1618210408,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(181,172,'Papel Tapiz','',1,'官方自营店铺',770,766,770,0,0,0.00,0.00,0,0.00,0,'',0,2,0,0,'N;',100,0.000,'1_2021041101202157818.png',0,1,1,1618075237,1618100811,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(182,173,'Papel Tapiz','',1,'官方自营店铺',770,766,770,0,0,0.00,0.00,0,0.00,0,'',0,2,0,0,'N;',100,0.000,'1_2021041101222135624.png',0,1,1,1618075369,1618113511,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(183,174,'Papel Tapiz','',1,'官方自营店铺',770,766,770,0,0,0.00,0.00,0,0.00,0,'',0,2,0,0,'N;',100,0.000,'1_2021041101241814050.png',0,1,1,1618075548,1618113476,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(184,175,'Papel Tapiz','',1,'官方自营店铺',770,766,770,0,0,0.00,0.00,0,0.00,0,'',0,1,0,0,'N;',100,0.000,'1_2021041101271760343.png',0,1,1,1618075650,1618200859,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(185,176,'Papel Tapiz ','',1,'官方自营店铺',770,766,770,0,0,0.00,0.00,0,0.00,0,'',0,2,0,0,'N;',100,0.000,'1_2021041101290290240.png',0,1,1,1618075761,1618235844,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(186,177,'Papel Tapiz','',1,'官方自营店铺',770,766,770,0,0,0.00,0.00,0,0.00,0,'',0,2,0,0,'N;',100,0.000,'1_2021041101304958984.png',0,1,1,1618075868,1618235399,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(187,178,'Papel Tapiz','',1,'官方自营店铺',770,766,770,0,0,0.00,0.00,0,0.00,0,'',0,6,0,0,'N;',100,0.000,'1_2021041101340320467.png',0,1,1,1618076056,1618218665,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(188,179,'Alfombra Suave ','',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,0,'',0,2,0,0,'N;',100,0.000,'1_2021041103183829799.png',0,1,1,1618082414,1618124284,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(189,180,'Alfombra Suave ','',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,0,'',0,7,0,0,'N;',100,0.000,'1_2021041103221224650.png',0,1,1,1618082549,1618230143,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(190,181,'Alfombra Suave ','',1,'官方自营店铺',767,766,767,0,0,0.00,0.00,0,0.00,0,'',0,2,0,0,'N;',100,0.000,'1_2021041103234468045.png',0,1,1,1618082637,1618200868,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(191,182,'Papel Tapiz','',1,'官方自营店铺',770,766,770,0,0,0.00,0.00,0,0.00,0,'',0,1,0,0,'N;',100,0.000,'1_2021041103361952435.png',0,1,1,1618083402,1618093946,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(192,183,'Papel Tapiz','',1,'官方自营店铺',770,766,770,0,0,0.00,0.00,0,0.00,0,'',0,2,0,0,'N;',100,0.000,'1_2021041103392210025.png',0,1,1,1618083585,1618124432,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(193,184,'Papel Tapiz ','',1,'官方自营店铺',770,766,770,0,0,0.00,0.00,0,0.00,0,'',0,1,0,0,'N;',100,0.000,'1_2021041103424329236.png',0,1,1,1618083778,1618087405,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(194,185,'Papel Tapiz','',1,'官方自营店铺',770,766,770,0,0,0.00,0.00,0,0.00,0,'',0,0,0,0,'N;',100,0.000,'1_2021041103450534383.png',0,1,1,1618083920,1618083928,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(195,186,'Papel Tapiz','',1,'官方自营店铺',770,766,770,0,0,0.00,0.00,0,0.00,0,'',0,2,0,0,'N;',100,0.000,'1_2021041103473750367.png',0,1,1,1618084077,1618113592,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255),(196,187,'Escurridor de Platos ','',1,'官方自营店铺',768,766,768,0,0,0.00,0.00,0,0.00,1,'',0,7,0,0,'N;',100,0.000,'1_2021041104011460879.png',0,1,1,1618085092,1618232637,0,0,0,0,0,50.00,0,1,'',5,0,0,0,0,0,0,0,0,0,1,NULL,255);
/*!40000 ALTER TABLE `ds_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_goods_pifa`
--

DROP TABLE IF EXISTS `ds_goods_pifa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_goods_pifa` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品批发',
  `goods_id` int(11) DEFAULT '0' COMMENT '商品ID',
  `startnum1` int(11) DEFAULT '0' COMMENT '开始数量',
  `endnum1` int(11) DEFAULT '0' COMMENT '结束数量',
  `pifaprice1` decimal(10,2) DEFAULT '0.00' COMMENT '批发价',
  `startnum2` int(11) DEFAULT '0',
  `endnum2` int(11) DEFAULT '0',
  `pifaprice2` decimal(10,2) DEFAULT '0.00',
  `startnum3` int(11) DEFAULT '0',
  `endnum3` int(11) DEFAULT '0',
  `pifaprice3` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `member_id` (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_goods_pifa`
--

LOCK TABLES `ds_goods_pifa` WRITE;
/*!40000 ALTER TABLE `ds_goods_pifa` DISABLE KEYS */;
INSERT INTO `ds_goods_pifa` VALUES (1,118,1,10,85.00,11,20,75.00,21,30,65.00),(2,121,1,1,1500.00,3,11,1300.00,12,99,1200.00),(3,122,1,2,400.00,3,11,350.00,12,99,300.00),(4,123,1,1,400.00,3,11,350.00,12,99,300.00),(5,124,1,1,400.00,3,11,350.00,12,999,320.00),(6,125,1,2,550.00,3,11,500.00,12,999,480.00),(7,126,1,2,400.00,3,11,350.00,12,99,300.00),(8,127,1,2,550.00,3,11,500.00,12,99,450.00),(9,128,1,2,550.00,3,11,500.00,12,99,450.00),(10,131,1,2,400.00,3,11,350.00,12,99,300.00),(11,132,1,2,0.00,3,11,0.00,12,99,0.00),(12,133,1,2,400.00,3,11,350.00,12,99,300.00),(13,134,1,2,1100.00,3,11,1000.00,12,99,900.00),(14,135,1,2,1100.00,3,11,1000.00,12,99,900.00),(15,136,1,2,1100.00,3,11,1000.00,12,99,900.00),(16,137,1,2,1100.00,3,11,1000.00,12,99,900.00),(17,138,1,2,1100.00,3,11,1000.00,12,99,900.00),(18,139,1,2,1100.00,3,11,1000.00,12,99,900.00),(19,140,1,2,1100.00,3,11,1000.00,12,99,900.00),(20,141,1,2,1100.00,3,11,1000.00,12,99,900.00),(21,142,1,2,1100.00,3,11,1000.00,12,99,900.00),(22,143,1,2,1100.00,3,11,1000.00,12,99,900.00),(23,144,1,2,1100.00,3,11,1000.00,12,99,900.00),(24,145,1,2,1100.00,3,11,1000.00,12,99,900.00),(25,146,1,2,1100.00,3,11,1000.00,12,99,900.00),(26,147,1,2,1100.00,3,11,1000.00,12,99,900.00),(27,148,1,2,1100.00,3,11,1000.00,12,99,900.00),(28,149,1,2,1100.00,3,11,1000.00,12,99,900.00),(29,150,1,2,1800.00,3,11,1500.00,12,99,1200.00),(30,151,1,2,400.00,3,11,350.00,12,99,300.00),(31,152,1,2,400.00,3,11,350.00,12,99,300.00),(32,153,1,2,400.00,3,11,350.00,12,99,300.00),(33,154,1,2,400.00,3,11,350.00,12,99,300.00),(34,155,1,2,800.00,3,11,750.00,12,99,700.00),(35,156,1,2,850.00,3,11,800.00,12,99,750.00),(36,157,1,2,900.00,3,11,850.00,12,99,800.00),(37,158,1,2,1200.00,3,11,1100.00,12,99,1000.00),(38,159,1,2,1200.00,3,11,1100.00,12,99,1000.00),(39,160,1,2,800.00,3,11,750.00,12,99,700.00),(40,161,1,2,850.00,3,11,800.00,12,99,750.00),(41,162,1,2,900.00,3,11,850.00,12,99,800.00),(42,163,1,2,800.00,3,11,750.00,12,99,700.00),(43,164,1,2,850.00,3,11,800.00,12,99,750.00),(44,165,1,2,900.00,3,11,850.00,12,99,800.00),(45,166,1,2,1200.00,3,11,1100.00,12,99,1000.00),(46,167,1,2,420.00,3,11,375.00,12,99,350.00),(47,168,1,2,420.00,3,11,375.00,12,99,350.00),(48,169,1,2,420.00,3,11,375.00,12,99,350.00),(49,170,1,2,420.00,3,11,375.00,12,99,350.00),(50,171,1,2,420.00,3,11,375.00,12,99,350.00),(51,172,1,2,420.00,3,11,375.00,12,99,350.00),(52,173,1,2,420.00,3,11,375.00,12,99,350.00),(53,174,1,2,420.00,3,11,375.00,12,99,350.00),(54,175,1,2,420.00,3,11,375.00,12,99,350.00),(55,176,1,2,420.00,3,11,375.00,12,99,350.00),(56,177,1,2,420.00,3,11,375.00,12,99,350.00),(57,178,1,2,420.00,3,11,375.00,12,99,350.00),(58,179,1,2,1200.00,3,11,1100.00,12,99,1000.00),(59,180,1,2,1200.00,3,11,1100.00,12,99,1000.00),(60,181,1,2,1200.00,3,11,1100.00,12,99,1000.00),(61,182,1,2,420.00,3,11,375.00,12,99,350.00),(62,183,1,2,420.00,3,11,375.00,12,99,350.00),(63,184,1,2,0.00,3,11,0.00,12,99,0.00),(64,185,1,2,420.00,3,11,375.00,12,99,350.00),(65,186,1,2,420.00,3,11,375.00,12,99,350.00),(66,187,1,2,600.00,3,11,550.00,12,99,500.00);
/*!40000 ALTER TABLE `ds_goods_pifa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_goods_searchlog`
--

DROP TABLE IF EXISTS `ds_goods_searchlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_goods_searchlog` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '历史搜索ID',
  `member_id` int(11) DEFAULT '0' COMMENT '会员ID',
  `searchname` varchar(255) DEFAULT '' COMMENT '搜索名称',
  `isdelete` tinyint(1) DEFAULT '0' COMMENT '是否删除，默认否，1删除',
  `createtime` int(10) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_goods_searchlog`
--

LOCK TABLES `ds_goods_searchlog` WRITE;
/*!40000 ALTER TABLE `ds_goods_searchlog` DISABLE KEYS */;
INSERT INTO `ds_goods_searchlog` VALUES (1,3,'手机',0,1610270087),(2,3,'电器',0,1609385308),(3,3,'家具',0,1609384757),(4,3,'护肤品',0,1610269174),(5,0,'护肤品',0,1606729630),(6,0,'护肤品',0,1606729630),(7,0,'护肤品',0,1606729630),(8,3,'家电',0,1610269183);
/*!40000 ALTER TABLE `ds_goods_searchlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_goodsattrindex`
--

DROP TABLE IF EXISTS `ds_goodsattrindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_goodsattrindex` (
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表ID',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类ID',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型ID',
  `attr_id` int(10) unsigned NOT NULL COMMENT '属性ID',
  `attrvalue_id` int(10) unsigned NOT NULL COMMENT '属性值ID',
  PRIMARY KEY (`goods_id`,`gc_id`,`attrvalue_id`),
  KEY `goods_id` (`goods_id`),
  KEY `attrvalue_id` (`attrvalue_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品与属性对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_goodsattrindex`
--

LOCK TABLES `ds_goodsattrindex` WRITE;
/*!40000 ALTER TABLE `ds_goodsattrindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_goodsattrindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_goodsbrowse`
--

DROP TABLE IF EXISTS `ds_goodsbrowse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_goodsbrowse` (
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `goodsbrowse_time` int(11) NOT NULL COMMENT '浏览时间',
  `gc_id` int(11) NOT NULL COMMENT '商品分类',
  `gc_id_1` int(11) NOT NULL COMMENT '商品一级分类',
  `gc_id_2` int(11) NOT NULL COMMENT '商品二级分类',
  `gc_id_3` int(11) NOT NULL COMMENT '商品三级分类',
  PRIMARY KEY (`goods_id`,`member_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品浏览历史表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_goodsbrowse`
--

LOCK TABLES `ds_goodsbrowse` WRITE;
/*!40000 ALTER TABLE `ds_goodsbrowse` DISABLE KEYS */;
INSERT INTO `ds_goodsbrowse` VALUES (8,3,1610270167,5,4,5,0),(3,3,1606733040,2,1,2,0),(31,3,1606982749,27,10,27,0),(135,31,1617659259,767,766,767,0),(24,5,1607312153,24,9,24,0),(63,5,1607312068,47,16,47,0),(71,5,1607313913,5,4,5,0),(16,3,1609382590,20,8,20,0),(72,3,1609382616,6,4,6,0),(67,3,1609732934,49,1,49,0),(130,31,1617654593,48,1,48,0),(2,3,1616206571,2,1,2,0),(83,31,1617647916,21,8,21,0),(77,6,1609396255,7,4,7,0),(4,3,1609814408,2,1,2,0),(10,3,1609814416,5,4,5,0),(11,3,1609814421,6,4,6,0),(54,3,1609898278,41,15,41,0),(37,3,1610376234,29,11,29,0),(5,3,1610265626,3,1,3,0),(42,3,1610184423,31,12,31,0),(73,4,1612535586,6,4,6,0),(20,24,1616509880,22,8,22,0);
/*!40000 ALTER TABLE `ds_goodsbrowse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_goodsclass`
--

DROP TABLE IF EXISTS `ds_goodsclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_goodsclass` (
  `gc_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品分类自增ID',
  `gc_name` varchar(100) NOT NULL COMMENT '商品分类名称',
  `gc_image` varchar(100) DEFAULT '' COMMENT '商品分类图',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `type_name` varchar(100) NOT NULL COMMENT '类型名称',
  `gc_parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类上级ID',
  `commis_rate` float unsigned NOT NULL DEFAULT '0' COMMENT '商品分类佣金比例',
  `gc_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '商品分类排序',
  `gc_virtual` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布虚拟商品 1:是 0:否',
  `gc_title` varchar(200) DEFAULT NULL COMMENT '商品分类名称',
  `gc_keywords` varchar(255) DEFAULT '' COMMENT '商品分类关键词',
  `gc_description` varchar(255) DEFAULT '' COMMENT '商品分类描述',
  `gc_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '商品分类前台显示 0:否 1:是',
  PRIMARY KEY (`gc_id`),
  KEY `store_id` (`gc_parent_id`),
  KEY `gc_parent_id` (`gc_parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=792 DEFAULT CHARSET=utf8 COMMENT='商品分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_goodsclass`
--

LOCK TABLES `ds_goodsclass` WRITE;
/*!40000 ALTER TABLE `ds_goodsclass` DISABLE KEYS */;
INSERT INTO `ds_goodsclass` VALUES (1,'Accesorio','',0,'',0,5,255,1,NULL,'','',1),(2,'Celular','',0,'',1,5,0,1,NULL,'','',1),(3,'Reloj','',0,'',1,5,0,1,NULL,'','',1),(48,'Audifono','',0,'',1,5,0,1,NULL,'','',1),(49,'Cover','',0,'',1,5,0,1,NULL,'','',1),(321,'Bocina','',0,'',1,5,255,1,NULL,'','',1),(779,'Cumpleaños','',0,'',778,5,255,0,NULL,'','',1),(777,'Termo','',0,'',766,5,255,0,NULL,'','',1),(778,'Decoración','',0,'',0,5,255,0,NULL,'','',1),(775,'Otros','',0,'',772,5,255,0,NULL,'','',1),(776,'Juguete','',0,'',766,5,255,0,NULL,'','',1),(774,'Accesorios','',0,'',773,5,255,0,NULL,'','',1),(773,'Maquillaje','',0,'',772,5,255,0,NULL,'','',1),(771,'Espejo','',0,'',766,5,255,0,NULL,'','',1),(772,'Cosméticos','',0,'',0,5,255,0,NULL,'','',1),(769,'Sofa','',0,'',766,5,255,0,NULL,'','',1),(770,'Papel Tapiz','',0,'',766,5,255,0,NULL,'','',1),(766,'Hogar','',0,'',0,5,255,0,NULL,'','',1),(767,'Alfombra','',0,'',766,5,255,0,NULL,'','',1),(768,'Organizador','',0,'',766,5,255,0,NULL,'','',1),(791,'Cocina','',0,'',766,5,255,0,NULL,'','',1),(790,'Cuidado de Cabello','',0,'',781,5,255,0,NULL,'','',1),(789,'Caja de Zapatos','',0,'',786,5,255,0,NULL,'','',1),(788,'Calcetines','',0,'',786,5,255,0,NULL,'','',1),(787,'Cangurera','',0,'',786,5,255,0,NULL,'','',1),(786,'Hombre','',0,'',0,5,255,0,NULL,'','',1),(780,'Globo','',0,'',779,5,255,0,NULL,'','',1),(781,'Mujer','',0,'',0,5,255,0,NULL,'','',1),(782,'Cartera','',0,'',781,5,255,0,NULL,'','',1),(783,'Mochila','',0,'',781,5,255,0,NULL,'','',1),(784,'Calcetines','',0,'',781,5,255,0,NULL,'','',1),(785,'Cangurera','',0,'',781,5,255,0,NULL,'','',1);
/*!40000 ALTER TABLE `ds_goodsclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_goodsclassnav`
--

DROP TABLE IF EXISTS `ds_goodsclassnav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_goodsclassnav` (
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类ID',
  `goodscn_alias` varchar(100) DEFAULT '' COMMENT '商品分类别名',
  `goodscn_classids` varchar(100) DEFAULT '' COMMENT '推荐子级分类',
  `goodscn_brandids` varchar(100) DEFAULT '' COMMENT '推荐的品牌',
  `goodscn_pic` varchar(100) DEFAULT '' COMMENT '分类图片',
  `goodscn_adv1` varchar(100) DEFAULT '' COMMENT '广告图1',
  `goodscn_adv1_link` varchar(100) DEFAULT '' COMMENT '广告1链接',
  `goodscn_adv2` varchar(100) DEFAULT '' COMMENT '广告图2',
  `goodscn_adv2_link` varchar(100) NOT NULL COMMENT '广告2链接',
  PRIMARY KEY (`gc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分类导航表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_goodsclassnav`
--

LOCK TABLES `ds_goodsclassnav` WRITE;
/*!40000 ALTER TABLE `ds_goodsclassnav` DISABLE KEYS */;
INSERT INTO `ds_goodsclassnav` VALUES (1,'Electrónico','75','','','','','',''),(766,'Hogar','','','','','','',''),(778,'Decoración','','','','','','',''),(786,'','','','','','','','');
/*!40000 ALTER TABLE `ds_goodsclassnav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_goodsclassstaple`
--

DROP TABLE IF EXISTS `ds_goodsclassstaple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_goodsclassstaple` (
  `staple_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '常用分类id',
  `staple_counter` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '计数器',
  `staple_name` varchar(255) NOT NULL COMMENT '常用分类名称',
  `gc_id_1` int(10) unsigned NOT NULL COMMENT '一级分类id',
  `gc_id_2` int(10) unsigned NOT NULL COMMENT '二级商品分类',
  `gc_id_3` int(10) unsigned NOT NULL COMMENT '三级商品分类',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型id',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员id',
  PRIMARY KEY (`staple_id`),
  KEY `store_id` (`member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='店铺常用分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_goodsclassstaple`
--

LOCK TABLES `ds_goodsclassstaple` WRITE;
/*!40000 ALTER TABLE `ds_goodsclassstaple` DISABLE KEYS */;
INSERT INTO `ds_goodsclassstaple` VALUES (8,1,'Cosméticos >Maquillaje >Accesorios',772,773,774,0,1),(5,3,'Accesorio >Cover',1,49,0,0,1),(6,1,'Accesorio >Audifono',1,48,0,0,1),(7,31,'Hogar >Alfombra',766,767,0,0,1),(9,2,'Hogar >Organizador',766,768,0,0,1),(10,1,'Accesorio >Bocina',1,321,0,0,1),(11,1,'Hogar >Termo',766,777,0,0,1),(12,1,'Hombre >Calcetines',786,788,0,0,1),(13,2,'Hombre >Caja de Zapatos',786,789,0,0,1),(14,1,'Mujer >Cuidado de Cabello',781,790,0,0,1),(15,1,'Accesorio >Reloj',1,3,0,0,1),(16,12,'Hogar >Sofa',766,769,0,0,1),(17,17,'Hogar >Papel Tapiz',766,770,0,0,1);
/*!40000 ALTER TABLE `ds_goodsclassstaple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_goodsclasstag`
--

DROP TABLE IF EXISTS `ds_goodsclasstag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_goodsclasstag` (
  `gctag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'TAG自增ID',
  `gctag_name` varchar(255) NOT NULL COMMENT '分类TAG名称',
  `gctag_value` text NOT NULL COMMENT '分类TAG值',
  `type_id` int(10) unsigned NOT NULL COMMENT '类型ID',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类ID',
  `gc_id_1` int(10) unsigned NOT NULL COMMENT '一级分类ID',
  `gc_id_2` int(10) unsigned NOT NULL COMMENT '二级分类ID',
  `gc_id_3` int(10) unsigned NOT NULL COMMENT '三级分类ID',
  PRIMARY KEY (`gctag_id`),
  KEY `gc_id` (`gc_id`),
  KEY `type_id` (`type_id`),
  KEY `gc_id_1` (`gc_id_1`),
  KEY `gc_id_2` (`gc_id_2`),
  KEY `gc_id_3` (`gc_id_3`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品分类TAG表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_goodsclasstag`
--

LOCK TABLES `ds_goodsclasstag` WRITE;
/*!40000 ALTER TABLE `ds_goodsclasstag` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_goodsclasstag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_goodscombo`
--

DROP TABLE IF EXISTS `ds_goodscombo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_goodscombo` (
  `combo_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '推荐组合自增ID ',
  `goods_id` int(10) unsigned NOT NULL COMMENT '主商品ID',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '主商品公共ID',
  `combo_goodsid` int(10) unsigned NOT NULL COMMENT '推荐组合商品ID',
  PRIMARY KEY (`combo_id`),
  KEY `goods_id` (`goods_id`),
  KEY `combo_goodsid` (`combo_goodsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品推荐组合表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_goodscombo`
--

LOCK TABLES `ds_goodscombo` WRITE;
/*!40000 ALTER TABLE `ds_goodscombo` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_goodscombo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_goodscommon`
--

DROP TABLE IF EXISTS `ds_goodscommon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_goodscommon` (
  `goods_commonid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品公共表id',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `goods_advword` varchar(150) DEFAULT NULL COMMENT '商品广告词',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类',
  `gc_id_1` int(10) unsigned DEFAULT NULL COMMENT '一级分类id',
  `gc_id_2` int(10) unsigned DEFAULT NULL COMMENT '二级分类id',
  `gc_id_3` int(10) unsigned DEFAULT NULL COMMENT '三级分类id',
  `gc_name` varchar(200) NOT NULL COMMENT '商品分类',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `spec_name` varchar(255) NOT NULL COMMENT '规格名称',
  `spec_value` text NOT NULL COMMENT '规格值',
  `brand_id` int(10) unsigned DEFAULT '0' COMMENT '品牌id',
  `brand_name` varchar(100) DEFAULT NULL COMMENT '品牌名称',
  `type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '类型id',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品主图',
  `goodsvideo_name` varchar(100) DEFAULT NULL COMMENT '商品视频名称',
  `goods_attr` text NOT NULL COMMENT '商品属性',
  `goods_body` text COMMENT '商品内容',
  `mobile_body` text COMMENT '手机端商品描述',
  `goods_state` tinyint(3) unsigned DEFAULT '0' COMMENT '商品状态 0:下架 1:正常 10:违规（禁售）',
  `goods_stateremark` varchar(255) DEFAULT NULL COMMENT '违规原因',
  `goods_verify` tinyint(3) unsigned DEFAULT NULL COMMENT '商品审核 1通过，0未通过，10审核中',
  `goods_verifyremark` varchar(255) DEFAULT NULL COMMENT '审核失败原因',
  `goods_lock` tinyint(3) unsigned DEFAULT '0' COMMENT '商品锁定 0未锁，1已锁',
  `goods_addtime` int(10) unsigned NOT NULL COMMENT '商品添加时间',
  `goods_shelftime` int(10) unsigned NOT NULL COMMENT '上架时间',
  `goods_specname` text COMMENT '规格名称序列化（下标为规格id）',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_marketprice` decimal(10,2) DEFAULT NULL COMMENT '商品市场价',
  `goods_costprice` decimal(10,2) NOT NULL COMMENT '商品成本价',
  `goods_ispifa` tinyint(1) DEFAULT '0' COMMENT '是否批发，1表示是',
  `goods_discount` float unsigned NOT NULL COMMENT '商品折扣',
  `goods_serial` varchar(50) NOT NULL COMMENT '商家编号',
  `goods_storage_alarm` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品库存报警值',
  `transport_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品售卖区域',
  `transport_title` varchar(60) DEFAULT '' COMMENT '商品售卖区域名称',
  `goods_commend` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品推荐 1:是 0:否',
  `goods_freight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品运费 0为免运费',
  `goods_vat` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品是否开具增值税发票 1:是 0:否',
  `areaid_1` int(10) DEFAULT NULL COMMENT '一级地区id',
  `areaid_2` int(10) DEFAULT NULL COMMENT '二级地区id',
  `goods_stcids` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分类id 首尾用,隔开',
  `plateid_top` int(10) unsigned DEFAULT NULL COMMENT '顶部关联板式',
  `plateid_bottom` int(10) unsigned DEFAULT NULL COMMENT '底部关联板式',
  `is_virtual` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为虚拟商品 1:是 0:否',
  `virtual_indate` int(10) unsigned DEFAULT NULL COMMENT '虚拟商品有效期',
  `virtual_limit` tinyint(3) unsigned DEFAULT NULL COMMENT '虚拟商品购买上限',
  `virtual_invalid_refund` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否允许过期退款 1:是 0:否',
  `is_goodsfcode` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为F码商品 1:是 0:否',
  `is_appoint` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否是预约商品 1:是 0:否',
  `appoint_satedate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '预约商品出售时间',
  `is_presell` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否是预售商品 1:是 0:否',
  `presell_deliverdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '预售商品发货时间',
  `is_platform_store` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为平台自营',
  `goods_mgdiscount` text COMMENT '序列化会员等级折扣(商品)',
  `inviter_ratio_1` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '一级分销比例',
  `inviter_ratio_2` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '二级分销比例',
  `inviter_ratio_3` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '三级分销比例',
  `inviter_total_quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已分销的商品数量',
  `inviter_total_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '已分销的商品金额',
  `inviter_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品已结算的分销佣金',
  `inviter_open` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '开启推广',
  `mall_goods_commend` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品推荐 1:是 0:否',
  `mall_goods_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '商品推荐排序',
  `goods_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '店铺排序',
  PRIMARY KEY (`goods_commonid`),
  KEY `store_id` (`store_id`),
  KEY `gc_id` (`gc_id`),
  KEY `gc_id_1` (`gc_id_1`),
  KEY `gc_id_2` (`gc_id_2`),
  KEY `gc_id_3` (`gc_id_3`)
) ENGINE=MyISAM AUTO_INCREMENT=188 DEFAULT CHARSET=utf8 COMMENT='商品公共内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_goodscommon`
--

LOCK TABLES `ds_goodscommon` WRITE;
/*!40000 ALTER TABLE `ds_goodscommon` DISABLE KEYS */;
INSERT INTO `ds_goodscommon` VALUES (2,'荣耀V9 play 标配版 3+32G 全网通4G手机 铂光金','北欧极简设计，EMUI5.1',2,1,2,0,'手机/ 运营商/ 智能数码 >手机通讯',1,'官方自营店铺','N;','N;',0,'',0,'1_2017092120144795113.jpg',NULL,'N;','','',10,'',1,NULL,0,1505996432,0,NULL,998.00,1290.00,0.00,0,77,'1',0,0,'',1,0.00,0,0,0,'',0,0,1,1514476799,1,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(3,'Apple/苹果 iPhone 7plus 128GB 玫瑰金色 移动联通电信4G手机','购机即送精美防尘塞+便捷支架+鱼骨绕线器+店铺延保一年',2,1,2,0,'手机/ 运营商/ 智能数码 >手机通讯',1,'官方自营店铺','N;','N;',0,'',0,'1_2017092120244885492.jpg',NULL,'N;','','',0,NULL,1,NULL,0,1505996810,0,NULL,6999.00,7100.00,0.00,0,98,'2',10,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(4,'nubia/努比亚Z17 6G+64G 全网通4G手机 烈焰红 无边框','烈焰红 无边框',2,1,2,0,'手机/ 运营商/ 智能数码 >手机通讯',1,'官方自营店铺','N;','N;',0,'',0,'1_2017092120312320763.jpg',NULL,'N;','','',0,NULL,1,NULL,0,1505997092,0,NULL,2699.00,3000.00,0.00,0,89,'3',10,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(5,'智能电动代步车','长续航蓝牙遥控 轻小便携',3,1,3,0,'手机/ 运营商/ 智能数码 >智能设备',1,'官方自营店铺','N;','N;',0,'',0,'1_2017092120345719915.jpg',NULL,'N;','','',0,NULL,1,NULL,0,1505997303,0,NULL,1990.00,2000.00,0.00,0,99,'4',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(6,'灵动Lite版 NV3012 视频通话智能机器人','人工智能 视频聊天儿童早教益智娱乐 智能家居',3,1,3,0,'手机/ 运营商/ 智能数码 >智能设备',1,'官方自营店铺','N;','N;',0,'',0,'1_2017092120365848023.jpg',NULL,'N;','','',0,NULL,1,NULL,0,1505997421,0,NULL,149.00,150.00,0.00,0,99,'5',10,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(7,'HOST好帅智能云教育机器人二蛋Q6 ','早教机英语学习机国学儿童陪护 玩具礼物百科全书正版音乐播放机京剧粤剧儿歌国学',3,1,3,0,'手机/ 运营商/ 智能数码 >智能设备',1,'官方自营店铺','N;','N;',0,'',0,'1_2017092120382376796.jpg',NULL,'N;','','',0,NULL,1,NULL,0,1505997509,0,NULL,1699.00,2000.00,0.00,0,84,'6',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(8,'先锋(Pioneer)LED-39B700S 39英寸 高清 网络 智能 液晶电视','六核高速处理器 智能系统 高清解码 聚力影视资源  ',5,4,5,0,'电视/ 空调/ 冰箱/ 洗衣机 >电视',1,'官方自营店铺','N;','N;',0,'',0,'1_2017092120445748551.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1505997903,0,NULL,1599.00,1699.00,0.00,0,94,'7',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(9,'长虹（CHANGHONG）39M1 39英寸 窄边高清液晶电视（黑色）','蓝光护眼电视，卧室精选',5,4,5,0,'电视/ 空调/ 冰箱/ 洗衣机 >电视',1,'官方自营店铺','N;','N;',0,'',0,'1_2017092120480147477.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1505998084,0,NULL,1399.00,1500.00,0.00,0,93,'8',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(10,'39英寸64位24核安卓智能平板液晶电视（黑色）','炫彩A+屏看的更清晰，2K电视4K芯！HDR10让画面栩栩如生',5,4,5,0,'电视/ 空调/ 冰箱/ 洗衣机 >电视',1,'官方自营店铺','N;','N;',0,'',0,'1_2017092120493430154.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1505998176,0,NULL,1200.00,1399.00,0.00,0,85,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(11,'1.5匹 变频 智能 二级能效极速侠 空调挂机','60秒暖房，wifi智控，18分贝静音，焕新家，就是这么简单！',6,4,6,0,'电视/ 空调/ 冰箱/ 洗衣机 >空调',1,'官方自营店铺','N;','N;',0,'',0,'1_2017092120564717575.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1505998723,0,NULL,2699.00,2780.00,0.00,0,97,'9',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(12,'扬子(YAIR) 小2匹 冷暖 自动清洗 定频空调柜机','日立压缩机，全网比价，柜机中的战斗机',6,4,6,0,'电视/ 空调/ 冰箱/ 洗衣机 >空调',1,'官方自营店铺','N;','N;',0,'',0,'1_2017092121050988491.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1505999121,0,NULL,2999.00,3200.00,0.00,0,93,'10',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(13,'变频风冷无霜 独立双循环 LED显示 对开门冰箱（白色)','   变频压缩机，双独立循环，满足对空气、温度、湿度要求，创造大容量保鲜奇迹！并联双循环+智能精准控温',7,4,7,0,'电视/ 空调/ 冰箱/ 洗衣机 >冰箱',1,'官方自营店铺','N;','N;',0,'',0,'1_2017092121142556524.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1505999668,0,NULL,5380.00,5399.00,0.00,0,99,'11',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(14,'三门冰箱',' 家用节能 中门软冷冻 红色玻璃面板 静音低噪',7,4,7,0,'电视/ 空调/ 冰箱/ 洗衣机 >冰箱',1,'官方自营店铺','N;','N;',0,'',0,'1_2017092121225164684.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506000181,0,NULL,1433.00,1699.00,0.00,0,84,'12',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(15,'方太（FOTILE）云魔方欧式 烟灶套餐','18立方 天然气',20,8,20,0,'厨卫电器/ 生活家电/ 厨具 >厨房大电',1,'官方自营店铺','N;','N;',0,'',0,'1_2017092121260662503.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506000371,0,NULL,4299.00,4380.00,0.00,0,98,'13',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(16,'美的(Midea)台嵌两用燃气灶JZT-Q360B防爆钢化玻璃面板','4.2KW强劲火力；五档精控；时尚方灶，高端厨房品质之选！  ',20,8,20,0,'厨卫电器/ 生活家电/ 厨具 >厨房大电',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092121492327671.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506001770,0,NULL,1190.00,1200.00,0.00,0,99,'14',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(17,'飞科(FLYCO) 电动剃须刀','全身水洗，USB充电系统，优雅充电底座，刀架可浮动，1小时快充',21,8,21,0,'厨卫电器/ 生活家电/ 厨具 >生活家电',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092121542617701.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506002071,0,NULL,145.00,160.00,0.00,0,90,'15',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(18,'美的（Midea）电饭煲','不锈钢外壳 智能一键通 24小时预约3-4-5-6人电饭锅',21,8,21,0,'厨卫电器/ 生活家电/ 厨具 >生活家电',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092121564484910.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506002220,0,NULL,199.00,210.00,0.00,0,94,'16',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(19,'孔雀尾 菜刀套装','刀具齐全 优质钢材 经久耐用 耐腐蚀高强度',22,8,22,0,'厨卫电器/ 生活家电/ 厨具 >厨具',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092122005521920.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506002467,0,NULL,368.00,400.00,0.00,0,92,'17',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(20,'苏泊尔（supor)家用真空保温壶·晶韵系列KC20AP1(摩卡金)','2L大容量 真空保温 304不锈钢 保冷保热  ',22,8,22,0,'厨卫电器/ 生活家电/ 厨具 >厨具',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092122035543274.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506002646,0,NULL,199.00,250.00,0.00,0,79,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(21,'联想(Lenovo)拯救者Y520 15.6英寸游戏笔记本电脑','R720同模具，加128SSD混合硬盘，GTX1050显卡，背光键盘',23,9,23,0,'电脑办公/ 相机/ DIY >电脑整机',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092123585272874.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506009741,0,NULL,5400.00,5499.00,0.00,0,0,'20',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(22,'华硕（ASUS）FH5900 顽石电竞版15.6英寸游戏笔记本电脑','1T 940MX-2G独显',23,9,23,0,'电脑办公/ 相机/ DIY >电脑整机',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092200403659812.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506012042,0,NULL,4499.00,4500.00,0.00,0,99,'20',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(23,'戴尔(DELL)灵越Ins15MR-7528SS 15.6英寸笔记本电脑','',23,9,23,0,'电脑办公/ 相机/ DIY >电脑整机',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092201034951336.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506013470,0,NULL,3999.00,4200.00,0.00,0,95,'21',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(24,'佳能(Canon) EOS M10 微单套机','时尚翻屏设计-超赞屏幕取景-WiFi随拍随秀',24,9,24,0,'电脑办公/ 相机/ DIY >相机',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092201084565859.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506013739,0,NULL,2290.00,2999.00,0.00,0,76,'22',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(25,' 数码单反相机','下单赠送主图大礼包 内存卡 相机包 三脚架',24,9,24,0,'电脑办公/ 相机/ DIY >相机',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092201381015306.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506015501,0,NULL,4280.00,4300.00,0.00,0,99,'23',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(26,'南极人(NanJiren) 加高蒙古包蚊帐','开门支架学生宿舍单人双人B',25,10,25,0,'家居/ 家具/ 家装 >家纺',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092201461861948.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506015989,0,NULL,59.00,66.00,0.00,0,89,'10',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(27,'小狮子抱枕',' 带给你专宠的美好',25,10,25,0,'家居/ 家具/ 家装 >家纺',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092201523177266.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506016354,0,NULL,39.00,45.00,0.00,0,86,'28',10,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(28,'南极人(NanJiren)纯棉床单四件套全棉床上用品婚庆被套4件套','夏日约“惠”南极人',26,10,26,0,'家居/ 家具/ 家装 >家具',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092202022516767.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506016948,0,NULL,109.00,120.00,0.00,0,90,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(29,'欧式美式实木雕花沙发 高档大户型客厅真皮沙发头层牛皮沙发组合','头层牛皮+全实木',26,10,26,0,'家居/ 家具/ 家装 >家具',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092202082283957.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506017336,0,NULL,1320.00,1400.00,0.00,0,94,'26',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(30,'北欧简约现代日式可拆洗布艺床','小户型实木婚床软床',26,10,26,0,'家居/ 家具/ 家装 >家具',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092202112937358.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506017493,0,NULL,1980.00,2100.00,0.00,0,94,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(31,'宜莱芙 吸盘挂壁式牙刷架漱口杯套装（4口之家）','',27,10,27,0,'家居/ 家具/ 家装 >生活日用',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092202162519571.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506017804,0,NULL,49.00,55.00,0.00,0,89,'27',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(32,'日用浴室用品现代时尚家居家用浴帘','宽150*高180+环 一个装',27,10,27,0,'家居/ 家具/ 家装 >生活日用',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092202215519250.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506018119,0,NULL,22.50,25.00,0.00,0,90,'28',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(33,'益达 木糖醇清爽西瓜味40粒瓶装56g','关爱牙齿，更关心您',28,11,28,0,'食品/ 酒水/ 生鲜/ 特产 >食品',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092202310929808.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506018671,0,NULL,12.80,13.00,0.00,0,98,'10',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(34,'三只松鼠_小贱串烧味拉面丸子85g','闲膨化零食拉面丸子休闲丸子串烧味',28,11,28,0,'食品/ 酒水/ 生鲜/ 特产 >食品',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092202323192694.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506018762,0,NULL,13.80,14.00,0.00,0,98,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(36,'洋河 梦之蓝M3-52度500ml','',29,11,29,0,'食品/ 酒水/ 生鲜/ 特产 >酒水',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092202350299027.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506018905,0,NULL,528.00,570.00,0.00,0,92,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(37,'五粮液','孝敬长辈，推荐用酒',29,11,29,0,'食品/ 酒水/ 生鲜/ 特产 >酒水',1,'官方自营店铺','a:3:{i:1;s:6:\"样式\";i:2;s:6:\"颜色\";i:3;s:6:\"大小\";}','a:3:{i:1;a:1:{i:1;s:5:\"400ml\";}i:2;a:1:{i:1;s:3:\"红\";}i:3;a:1:{i:37;s:5:\"52度\";}}',0,'',1,'1_2017092202382291274.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506019112,0,NULL,695.00,820.00,0.00,0,84,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(39,'自然堂 水润保湿两件套 补水保湿套装','',30,12,30,0,'个护化妆/ 纸品清洁/ 宠物 >护肤品',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092202443553519.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506019477,0,NULL,69.40,70.00,0.00,0,99,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(40,'百雀羚水能量焕耀套装补水保湿护肤套装','补水修复 宛若新生  ',30,12,30,0,'个护化妆/ 纸品清洁/ 宠物 >护肤品',1,'官方自营店铺','a:3:{i:1;s:6:\"样式\";i:2;s:6:\"颜色\";i:3;s:6:\"大小\";}','a:3:{i:1;a:1:{i:42;s:9:\"两件套\";}i:2;a:1:{i:45;s:6:\"翠绿\";}i:3;a:1:{i:46;s:5:\"200ml\";}}',0,'',1,'1_2017092202461115940.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506019573,0,NULL,369.00,400.00,0.00,0,92,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(41,' 小黑裙香水洗发水+沐浴露',' 风魔欧美 持久留香 洗护套装',31,12,31,0,'个护化妆/ 纸品清洁/ 宠物 >清洁洗护',1,'官方自营店铺','a:3:{i:1;s:6:\"样式\";i:2;s:6:\"颜色\";i:3;s:6:\"大小\";}','a:3:{i:1;a:1:{i:1;s:9:\"两件套\";}i:2;a:1:{i:1;s:3:\"白\";}i:3;a:1:{i:1;s:5:\"500ml\";}}',0,'',1,'1_2017092202492958131.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506019782,0,NULL,45.90,56.00,0.00,0,81,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(42,'滋源无硅油洗发水氨基酸生姜535洗护发套装','',31,12,31,0,'个护化妆/ 纸品清洁/ 宠物 >清洁洗护',1,'官方自营店铺','a:3:{i:1;s:6:\"样式\";i:2;s:6:\"颜色\";i:3;s:6:\"大小\";}','a:3:{i:1;a:1:{i:49;s:9:\"两件套\";}i:2;a:1:{i:1;s:3:\"紫\";}i:3;a:1:{i:47;s:5:\"500ml\";}}',0,'',1,'1_2017092202514891485.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506019911,0,NULL,179.00,189.00,0.00,0,94,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(43,'宠物用品出行牵引带','',32,12,32,0,'个护化妆/ 纸品清洁/ 宠物 >宠物生活',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092202553367071.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506020205,0,NULL,14.90,25.00,0.00,0,59,'39',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(44,'家用宠物日用品饮水器喝水瓶','',32,12,32,0,'个护化妆/ 纸品清洁/ 宠物 >宠物生活',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092202585843151.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506020341,0,NULL,14.90,15.00,0.00,0,99,'35',10,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(45,'与牧2017韩版短款','',39,15,39,0,'男装/ 女装/ 内衣 >女装',1,'官方自营店铺','a:3:{i:1;s:6:\"样式\";i:2;s:6:\"颜色\";i:3;s:6:\"大小\";}','a:3:{i:1;a:1:{i:1;s:6:\"针织\";}i:2;a:2:{i:3;s:3:\"黑\";i:4;s:3:\"白\";}i:3;a:3:{i:8;s:1:\"M\";i:9;s:1:\"L\";i:10;s:2:\"XL\";}}',0,'',1,'1_2017092203045216863.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506020705,0,NULL,39.00,42.00,0.00,0,92,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(46,'蔚缇2017夏季小花网纱+吊带+喇叭裤三件套女','限时促销',39,15,39,0,'男装/ 女装/ 内衣 >女装',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092203062937149.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506020790,0,NULL,139.50,145.00,0.00,0,96,'1610',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(47,'2017夏季百搭吊带背心女新款修身纯棉吊带衫蕾丝打底背心','宽松小吊带 白色',39,15,39,0,'男装/ 女装/ 内衣 >女装',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092203083967214.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506020928,0,NULL,39.90,45.00,0.00,0,88,'1620',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(48,'2017秋季新款男士外套休闲潮牛仔夹克衫帅气棒球服学生韩版','秋季新款',41,15,41,0,'男装/ 女装/ 内衣 >男装',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092203123417256.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506021154,0,NULL,159.00,169.00,0.00,0,94,'1630',10,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(49,'丹杰仕 夏季男女情侣防晒衣潮男时尚韩版修身连帽薄款印花夹克上衣','',41,15,41,0,'男装/ 女装/ 内衣 >男装',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092203151752294.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506021320,0,NULL,59.00,69.00,0.00,0,85,'1640',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(50,'轻颦双黛 男士内裤透气吸汗男内裤','　男士舒适透气内裤 柔软舒适不易变形  ',44,15,44,0,'男装/ 女装/ 内衣 >内衣内裤',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092203175020843.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506021473,0,NULL,29.80,36.00,0.00,0,82,'1650',10,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(51,'北极绒女士内裤','性感轻薄中低腰透气女内裤',44,15,44,0,'男装/ 女装/ 内衣 >内衣内裤',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092203201884569.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506021621,0,NULL,49.00,58.00,0.00,0,84,'1660',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(52,'尖头粗跟高跟鞋一字扣单鞋 性感窜珠脚链高跟浅口凉鞋女鞋','',45,16,45,0,'鞋靴/ 箱包/ 钟表/ 珠宝 >时尚鞋靴',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092203242754461.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506021871,0,NULL,49.00,52.00,0.00,0,94,'1068',10,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(53,'品点新款平底轻便蛋卷鞋防滑牛筋底舒适女鞋','防滑舒适，轻便时尚，标准尺码！',45,16,45,0,'鞋靴/ 箱包/ 钟表/ 珠宝 >时尚鞋靴',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092203261873185.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506021982,0,NULL,78.00,82.00,0.00,0,95,'2017',10,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(54,'贝美芬 925银心心相印女士项链 女生饰品 时尚流行','时尚简约',46,16,46,0,'鞋靴/ 箱包/ 钟表/ 珠宝 >珠宝饰品',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092203275599920.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506022081,0,NULL,88.00,98.00,0.00,0,89,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(55,'幸运四叶草纯银吊坠','',46,16,46,0,'鞋靴/ 箱包/ 钟表/ 珠宝 >珠宝饰品',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092203294765362.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506022193,0,NULL,75.00,89.00,0.00,0,84,'2016',10,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(56,'施诺绮心梦爱心型925纯银水晶项链采用施华洛世奇元素水晶吊坠','',46,16,46,0,'鞋靴/ 箱包/ 钟表/ 珠宝 >珠宝饰品',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092203321969628.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506022343,0,NULL,108.00,120.00,0.00,0,90,'2018',10,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(57,'封后皮皮虾韩国单肩包女韩版帆布手提袋','简约帆布袋',47,16,47,0,'鞋靴/ 箱包/ 钟表/ 珠宝 >时尚皮包',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092203335981358.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506022442,0,NULL,39.00,49.00,0.00,0,79,'2049',10,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(58,'迈克.科尔斯(Michael Kors/MK)小号女包手提单肩斜跨包','海外采购',47,16,47,0,'鞋靴/ 箱包/ 钟表/ 珠宝 >时尚皮包',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092203371485168.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506022638,0,NULL,1096.00,1200.00,0.00,0,91,'1068',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(59,'蜂苹果6s数据线iphone6二合一拖安卓通用手机8P充电线器快充线','闪电快充 提速40% 一年换新',48,1,48,0,'手机/ 运营商/ 智能数码 >手机配件',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092821352360295.jpg',NULL,'N;','','',0,NULL,1,NULL,0,1506605735,0,NULL,19.90,21.00,0.00,0,94,'10123',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(60,'手机散热器华为苹果通用充电宝式架子桌面游戏手柄支驾冷却降温器','双风扇快速降温 可供电持久续航',48,1,48,0,'手机/ 运营商/ 智能数码 >手机配件',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092821383373641.jpg',NULL,'N;','','',0,NULL,1,NULL,0,1506605915,0,NULL,58.00,66.00,0.00,0,87,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(61,'手机充电宝带蓝牙音响三合一多功能平坂支架1毫安5移动电源20000M','二合一 [支架+充电宝] 三合一 [支架+充电宝+蓝牙音响]',48,1,48,0,'手机/ 运营商/ 智能数码 >手机配件',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092821403589442.jpg',NULL,'N;','','',0,NULL,1,NULL,0,1506606045,0,NULL,55.00,80.00,0.00,0,68,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(62,'苹果无线HDMI同屏器airplay推送宝高清安卓手机电视投影视频传输','无需软件不需要安装app即可实现无线同屏',49,1,49,0,'手机/ 运营商/ 智能数码 >影音电子',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092821431519588.jpg',NULL,'N;','','',0,NULL,1,NULL,0,1506606198,0,NULL,158.00,158.00,0.00,0,100,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(63,'唐麦 F3耳机入耳式 重低音炮手机电脑音乐有线耳塞式金属通用带麦','15天无理由退换货一年质保换新',49,1,49,0,'手机/ 运营商/ 智能数码 >影音电子',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092821510935694.jpg',NULL,'N;','','',0,NULL,1,NULL,0,1506606673,0,NULL,55.00,59.00,0.00,0,93,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(64,'森狗SimDog sim2.0手机k歌耳机入耳式通用男女生耳塞式耳麦重低音','专利产品 支持语音 支持接听电话',49,1,49,0,'手机/ 运营商/ 智能数码 >影音电子',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092821530372212.jpg',NULL,'N;','','',0,NULL,1,NULL,0,1506606785,0,NULL,19.80,20.00,0.00,0,99,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(65,'达尔优 进化者D3带麦克风震动电脑游戏耳机头戴式耳麦绝地求生lol','头戴式震动发光耳麦 电竞赛事耳机金属头梁',49,1,49,0,'手机/ 运营商/ 智能数码 >影音电子',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092821544898610.jpg',NULL,'N;','','',0,NULL,1,NULL,0,1506606891,0,NULL,158.00,160.00,0.00,0,98,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(66,'uoluo特价21 22 24 32 40 42 50 55寸60智能wifi网络小液晶电视机','高清电视接口：闭路+AV+HDMI+电脑VGA+DVD+音频+USB多媒体【不含网络功能】； 智能电视接口：含高清电视所有的功能接口+有线网络+无线wifi。',5,4,5,0,'电视/ 空调/ 冰箱/ 洗衣机 >电视',1,'官方自营店铺','a:3:{i:1;s:6:\"样式\";i:2;s:6:\"颜色\";i:3;s:6:\"大小\";}','a:3:{i:1;a:1:{i:1;s:6:\"液晶\";}i:2;a:1:{i:1;s:3:\"黑\";}i:3;a:1:{i:1;s:11:\"50寸高清\";}}',0,'',1,'1_2017092821585013652.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506607133,0,NULL,1299.00,1500.00,0.00,0,86,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(67,'Hisense/海信 KFR-35GW/ER22N3(1L04) 大1.5p匹家用冷暖空调挂机','',6,4,6,0,'电视/ 空调/ 冰箱/ 洗衣机 >空调',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092822032535526.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506607408,0,NULL,1999.00,1999.00,0.00,0,100,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(68,'先锋工业冷风扇 移动空调扇家用 冷风机商用小空调 加湿水冷气扇','先锋新品工业冷风扇',6,4,6,0,'电视/ 空调/ 冰箱/ 洗衣机 >空调',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092822050083427.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506607504,0,NULL,1199.00,1200.00,0.00,0,99,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(70,'荣事达空调扇冷暖两用家用静音遥控冷风机制冷风扇加湿移动小空调','强劲制冷 触摸屏 智能遥控 净化加湿',6,4,6,0,'电视/ 空调/ 冰箱/ 洗衣机 >空调',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092823485490716.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506613743,0,NULL,358.00,358.00,0.00,0,100,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(71,'美菱可移动式空调一体机1.5匹1 P单冷型小制冷厨房窗式冷暖免安装','',6,4,6,0,'电视/ 空调/ 冰箱/ 洗衣机 >空调',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092823501155931.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506613814,0,NULL,1299.00,1299.00,0.00,0,100,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(72,'乐创冷藏工作台冷冻冰箱平冷保鲜不锈钢商用厨房奶茶店操作台冰柜','优质商家热销2万无磁不锈钢加厚全发泡',7,4,7,0,'电视/ 空调/ 冰箱/ 洗衣机 >冰箱',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092823531033711.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506613995,0,NULL,1478.00,1478.00,0.00,0,100,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(73,'Midea/美的 BCD-169CM(E)双门冰箱家用冷藏冷冻对开门小型冰箱','对开门小型冰箱',7,4,7,0,'电视/ 空调/ 冰箱/ 洗衣机 >冰箱',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092900001256656.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506614415,0,NULL,1099.00,1100.00,0.00,0,99,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(74,'志高全自动洗衣机 家用 小型 5.5公斤波轮 静音宿舍 迷你风干预约','小家优选 节能静音 顺丰入户 预约童锁',51,4,51,0,'电视/ 空调/ 冰箱/ 洗衣机 >洗衣机',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092900022214210.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506614544,0,NULL,498.00,500.00,0.00,0,99,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(75,'Chigo/志高全自动洗衣机 15KG宾馆酒店商用大容量不锈钢顺丰入户','顺丰入户 下单送荣事达电烤箱一个',51,4,51,0,'电视/ 空调/ 冰箱/ 洗衣机 >洗衣机',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092900033832502.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506614620,0,NULL,2500.00,2600.00,0.00,0,96,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(76,'集成灶自动清洗正品 侧吸下排式油烟机一体环保灶 双电磁炉威士伯','天然气5000火力！断电应急！烟机延时',20,8,20,0,'厨卫电器/ 生活家电/ 厨具 >厨房大电',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092900052977159.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506614732,0,NULL,3180.00,3400.00,0.00,0,93,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(77,'威士伯J2集成灶 翻盖 一体 自动清洗烤箱蒸汽炉烟灶消套装 环保灶','上门安装 双电机 漏气保护',20,8,20,0,'厨卫电器/ 生活家电/ 厨具 >厨房大电',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092900064438234.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506614807,0,NULL,4590.00,4700.00,0.00,0,97,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(78,'红心大蒸汽挂烫机家用熨斗手持挂烫机烫衣服熨烫机电熨斗正品包邮','2000W大功率 超强蒸汽 快速熨衣',21,8,21,0,'厨卫电器/ 生活家电/ 厨具 >生活家电',1,'官方自营店铺','N;','N;',0,'',1,'1_2017092900081355788.jpg',NULL,'N;','','',10,'商品分类被删除，需要重新选择分类',1,NULL,0,1506614894,0,NULL,139.00,145.00,0.00,0,95,'',0,0,'',1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,'',0.00,0.00,0.00,0,0.00,0.00,0,1,255,255),(121,'audifono inalambrico d3','tiene ubicacion \r\ntiene sensor tactir ',48,1,48,0,'Accesorio &gt;Audifono',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040604002646954.png','','','&lt;p&gt;&lt;img src=&quot;https://fyshops.domibuy.com/public/uploads/home/store/goods/1/1_2021040604005184976.png&quot;/&gt;&lt;img src=&quot;https://fyshops.domibuy.com/public/uploads/home/store/goods/1/1_2021040604002646954.png&quot;/&gt;&lt;/p&gt;','',1,NULL,1,NULL,0,1617652950,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,1500.00,1,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(122,'Alfombra de Cocina','Alfombra de Cocina',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040604443022136.png','','','&lt;p&gt;&lt;img src=&quot;https://fyshops.domibuy.com/public/uploads/home/store/goods/1/1_2021040604444918766.png&quot;/&gt;&lt;img src=&quot;https://fyshops.domibuy.com/public/uploads/home/store/goods/1/1_2021040604444918766.png&quot;/&gt;&lt;img src=&quot;https://fyshops.domibuy.com/public/uploads/home/store/goods/1/1_2021040604443022136.png&quot;/&gt;&lt;/p&gt;','',1,NULL,1,NULL,0,1617655522,0,NULL,0.00,0.00,0.00,1,0,'',200,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(124,'brochas ','brochas ',774,772,773,774,'Cosméticos &gt;Maquillaje &gt;Accesorios',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040605053674673.png','','N;','&lt;p&gt;&lt;img src=&quot;https://fyshops.domibuy.com/public/uploads/home/store/goods/1/1_2021040605071135464.png&quot;/&gt;&lt;img src=&quot;https://fyshops.domibuy.com/public/uploads/home/store/goods/1/1_2021040605053674673.png&quot;/&gt;&lt;img src=&quot;https://fyshops.domibuy.com/public/uploads/home/store/goods/1/1_2021040605053674673.png&quot;/&gt;&lt;/p&gt;','',1,NULL,1,NULL,0,1617656857,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(125,'organizador ','Organizador de Cepillo ',768,766,768,0,'Hogar &gt;Organizador',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040605091998482.png','','','&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;Manten el desorden de tu baño en un solo lugar y ordena la zona de la encimera colocando todos los productos de igiene en este organizador para almacenamiento.&lt;/p&gt;','',1,NULL,1,NULL,0,1617657161,0,NULL,550.00,1000.00,0.00,1,55,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(126,'Alfombra de Cocina','Alfombra para tu cocina ',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040605271432570.png','','','&lt;p&gt;&lt;img src=&quot;https://fyshops.domibuy.com/public/uploads/home/store/goods/1/1_2021040605271432570.png&quot;/&gt;&lt;/p&gt;','',1,NULL,1,NULL,0,1617658182,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(127,'caja mediana','caja para almacenamiento de zapatos',788,786,788,0,'Hombre &gt;Calcetines',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040605380126814.png','','N;','&lt;p&gt;&lt;img src=&quot;https://fyshops.domibuy.com/public/uploads/home/store/goods/1/1_2021040605381938815.png&quot;/&gt;&lt;img src=&quot;https://fyshops.domibuy.com/public/uploads/home/store/goods/1/1_2021040605381938815.png&quot;/&gt;&lt;/p&gt;','',1,NULL,1,NULL,0,1617658766,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(128,'Caja Mediana','caja para almacenamiento de zapatos',789,786,789,0,'Hombre &gt;Caja de Zapatos',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040605380126814.png','','','&lt;p&gt;&lt;img src=&quot;https://fyshops.domibuy.com/public/uploads/home/store/goods/1/1_2021040605381938815.png&quot;/&gt;&lt;img src=&quot;https://fyshops.domibuy.com/public/uploads/home/store/goods/1/1_2021040605381938815.png&quot;/&gt;&lt;/p&gt;','',1,NULL,1,NULL,0,1617658768,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(129,'Cepillo Electrico One Step','Cepillo para secar tu pelo',790,781,790,0,'Mujer &gt;Cuidado de Cabello',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040605530867977.png','','N;','&lt;p&gt;&lt;img src=&quot;https://fyshops.domibuy.com/public/uploads/home/store/goods/1/1_2021040605542320929.png&quot;/&gt;&lt;/p&gt;','',1,NULL,1,NULL,0,1617659681,0,NULL,500.00,0.00,0.00,0,0,'',0,0,NULL,1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(130,'Cepillo Electrico One Step','Cepillo para secar tu pelo',790,781,790,0,'Mujer &gt;Cuidado de Cabello',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040605530867977.png','','N;','&lt;p&gt;&lt;img src=&quot;https://fyshops.domibuy.com/public/uploads/home/store/goods/1/1_2021040605542320929.png&quot;/&gt;&lt;/p&gt;','',1,NULL,1,NULL,0,1617659681,0,NULL,500.00,0.00,0.00,0,0,'',0,0,NULL,1,0.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(131,'Alfombra de Cocina','',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040822481574622.png','','N;','&lt;p&gt;&lt;img src=&quot;https://fyshops.domibuy.com/public/uploads/home/store/goods/1/1_2021040822485958357.png&quot;/&gt;&lt;/p&gt;','',1,NULL,1,NULL,0,1617893373,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(134,'Alfombra con diseños ','Av. Duarte casi esq. 27 de febrero, antiguo hiper 1.',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040920552259843.png','','','&lt;p&gt;Diseñado con resistencia contra el desgaste diario. Esta alfombra cuenta con un aspecto elegante y permite una comoda colocacion en entradas, debajo de muebles y no obstruye puertas.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1617973132,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(135,'Alfombras con diseños','Av. Duarte casi esq. 27 de febrero, antiguo hiper 1.',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040921173889786.png','','N;','&lt;p&gt;Diseñado con resistencia contra el desgaste diario. Esta alfombra cuenta con un aspecto elegante y permiteuna comoda colocacion en entradas, debajo de muebles y no obstruye puertas.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1617974524,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(133,'Alfombra con diseños ','Av. Duarte casi esq. 27 de febrero, antiguo hiper 1.',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040905412572593.png','','N;','&lt;p&gt;Las alfombras de cocina YoMe estan perfectamente diseñadas, proporciona un comodo apoyo para garantizar&amp;nbsp; que puedas estar de pie comodamente mientras trabajas en la cocina. Perfecto para uso domestico y para uso comercial. Facil de limpiar y duraderas, nuestros tapetes y alfobras de cocina son antideslizantes y resistentes al agua.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1617918392,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(136,'Alfombras con diseños','',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040921332596242.png','','N;','&lt;p&gt;Diseñado con resistencia contra el desgaste diario. Esta alfombra cuenta con un aspecto elegante y permiteuna comoda colocacion en entradas, debajo de muebles y no obstruye puertas.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1617975255,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(137,'Alfombras con diseños','',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040921465271189.png','','N;','&lt;p&gt;Diseñado con resistencia contra el desgaste diario. Esta alfombra cuenta con un aspecto elegante y permiteuna comoda colocacion en entradas, debajo de muebles y no obstruye puertas.&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;','',1,NULL,1,NULL,0,1617976069,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(138,'Alfombras con diseños','',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040922004293287.png','','N;','&lt;p&gt;Diseñado con resistencia contra el desgaste diario. Esta alfombra cuenta con un aspecto elegante y permiteuna comoda colocacion en entradas, debajo de muebles y no obstruye puertas.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1617976877,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(139,'Alfombras con diseños','',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040922050523275.png','','N;','&lt;p&gt;Diseñado con resistencia contra el desgaste diario. Esta alfombra cuenta con un aspecto elegante y permiteuna comoda colocacion en entradas, debajo de muebles y no obstruye puertas.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1617977138,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(140,'Alfombras con diseños','',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040922094456374.png','','N;','&lt;p&gt;Diseñado con resistencia contra el desgaste diario. Esta alfombra cuenta con un aspecto elegante y permiteuna comoda colocacion en entradas, debajo de muebles y no obstruye puertas.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1617977397,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(141,'Alfombras con diseños','',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040922122255921.png','','N;','&lt;p&gt;Diseñado con resistencia contra el desgaste diario. Esta alfombra cuenta con un aspecto elegante y permiteuna comoda colocacion en entradas, debajo de muebles y no obstruye puertas.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1617977582,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(142,'Alfombras con diseños','',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040922250392074.png','','N;','&lt;p&gt;Diseñado con resistencia contra el desgaste diario. Esta alfombra cuenta con un aspecto elegante y permiteuna comoda colocacion en entradas, debajo de muebles y no obstruye puertas.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1617978319,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(143,'Alfombras con diseños','',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040922291721264.png','','N;','&lt;p&gt;Diseñado con resistencia contra el desgaste diario. Esta alfombra cuenta con un aspecto elegante y permiteuna comoda colocacion en entradas, debajo de muebles y no obstruye puertas.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1617978594,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(144,'Alfombras con diseños','',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040922375871880.png','','N;','&lt;p&gt;Diseñado con resistencia contra el desgaste diario. Esta alfombra cuenta con un aspecto elegante y permiteuna comoda colocacion en entradas, debajo de muebles y no obstruye puertas.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1617979087,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(145,'Alfombras con diseños','',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040922444325202.png','','N;','&lt;p&gt;Diseñado con resistencia contra el desgaste diario. Esta alfombra cuenta con un aspecto elegante y permiteuna comoda colocacion en entradas, debajo de muebles y no obstruye puertas.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1617979527,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(146,'Alfombras con diseños','',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040922475725571.png','','N;','&lt;p&gt;Diseñado con resistencia contra el desgaste diario. Esta alfombra cuenta con un aspecto elegante y permiteuna comoda colocacion en entradas, debajo de muebles y no obstruye puertas.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1617979687,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(147,'Alfombras con diseños','',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040922491147671.png','','N;','&lt;p&gt;Diseñado con resistencia contra el desgaste diario. Esta alfombra cuenta con un aspecto elegante y permiteuna comoda colocacion en entradas, debajo de muebles y no obstruye puertas.&lt;/p&gt;','',1,NULL,1,NULL,0,1617979828,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(148,'Alfombras con diseños','',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040922561014870.png','','N;','&lt;p&gt;Diseñado con resistencia contra el desgaste diario. Esta alfombra cuenta con un aspecto elegante y permiteuna comoda colocacion en entradas, debajo de muebles y no obstruye puertas.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1617980184,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(149,'Alfombras con diseños','',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021040923000421960.png','','N;','&lt;p&gt;Diseñado con resistencia contra el desgaste diario. Esta alfombra cuenta con un aspecto elegante y permiteuna comoda colocacion en entradas, debajo de muebles y no obstruye puertas.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1617982430,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(150,'Reloj Inteligente T500 Plus ','',3,1,3,0,'Accesorio &gt;Reloj',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041003201145253.png','','','&lt;p&gt;Puedes recibir llamadas entrantes, mensajes SMS, notificaciones de facebook, Twitter y otras aplicaciones atraves de su smartwatch. Hara tu vida mas facil y mas conveniente.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1617996167,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(151,'Alfombra de Cocina','',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041022523144032.png','','N;','&lt;p&gt;Las alfombras de cocina YoMe estan perfectamente diseñadas, proporciona un comodo apoyo para garantizar&amp;nbsp; que puedas estar de pie comodamente mientras trabajas en la cocina. Perfecto para uso domestico y para uso comercial. Facil de limpiar y duraderas, nuestros tapetes y alfobras de cocina son antideslizantes y resistentes al agua.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1618066480,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(152,'Alfombra de Cocina','',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041022571359920.png','','N;','&lt;p&gt;Las alfombras de cocina YoMe estan perfectamente diseñadas, proporciona un comodo apoyo para garantizar&amp;nbsp; que puedas estar de pie comodamente mientras trabajas en la cocina. Perfecto para uso domestico y para uso comercial. Facil de limpiar y duraderas, nuestros tapetes y alfobras de cocina son antideslizantes y resistentes al agua.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1618066651,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(153,'Alfombra de Cocina','',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041022591267048.png','','N;','&lt;p&gt;Las alfombras de cocina YoMe estan perfectamente diseñadas, proporciona un comodo apoyo para garantizar&amp;nbsp; que puedas estar de pie comodamente mientras trabajas en la cocina. Perfecto para uso domestico y para uso comercial. Facil de limpiar y duraderas, nuestros tapetes y alfobras de cocina son antideslizantes y resistentes al agua.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1618066772,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(154,'Alfombra de Cocina','',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041023003813230.png','','N;','&lt;p&gt;Las alfombras de cocina YoMe estan perfectamente diseñadas, proporciona un comodo apoyo para garantizar&amp;nbsp; que puedas estar de pie comodamente mientras trabajas en la cocina. Perfecto para uso domestico y para uso comercial. Facil de limpiar y duraderas, nuestros tapetes y alfobras de cocina son antideslizantes y resistentes al agua.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1618066855,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(155,'Funda para sofa de 1','',769,766,769,0,'Hogar &gt;Sofa',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041023284260124.png','','N;','&lt;p&gt;La funda de sofa proporciona una cobertura completa incluso en la parte posterior de tu sofa, mantiene a tu sofa libre del polvo, manchas y el desgaste diario. Alarga la vida util de tu sofa y protege tu costosa inversion. Reemplaza el viejo aspecto de tu sofa destenido o desgastado. Las fundas de sofa estan dosponibles en tamaños diversos, para sofas de un asiento, dos, tres, y cuatro asientos.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1618068558,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(156,'Funda para sofa de 2','',769,766,769,0,'Hogar &gt;Sofa',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041023330964382.png','','N;','&lt;p&gt;La funda para sofa proporciona una cobertura completa incluso en la parte posterior de tu sofa, mantiene a tu sofa libre del polvo, manchas y el desgaste diario. Alarga la vida util de tu sofa y protege tu costosa inversion. Reemplaza el viejo aspecto de tu sofa destenido o desgastado. Las fundas de sofa estan dosponibles en tamaños diversos, para sofas de un asiento, dos, tres, y cuatro asientos.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1618068849,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(157,'Funda para sofa de 3','',769,766,769,0,'Hogar &gt;Sofa',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041023380076553.png','','N;','&lt;p&gt;La funda para sofa proporciona una cobertura completa incluso en la parte posterior de tu sofa, mantiene a tu sofa libre del polvo, manchas y el desgaste diario. Alarga la vida util de tu sofa y protege tu costosa inversion. Reemplaza el viejo aspecto de tu sofa destenido o desgastado. Las fundas de sofa estan dosponibles en tamaños diversos, para sofas de un asiento, dos, tres, y cuatro asientos.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1618069100,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(158,'Funda para sofa de 4','',769,766,769,0,'Hogar &gt;Sofa',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041023434143389.png','','N;','&lt;p&gt;La funda para sofa proporciona una cobertura completa incluso en la parte posterior de tu sofa, mantiene a tu sofa libre del polvo, manchas y el desgaste diario. Alarga la vida util de tu sofa y protege tu costosa inversion. Reemplaza el viejo aspecto de tu sofa destenido o desgastado. Las fundas de sofa estan dosponibles en tamaños diversos, para sofas de un asiento, dos, tres, y cuatro asientos.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1618069477,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(159,'Funda para sofa de 4','',769,766,769,0,'Hogar &gt;Sofa',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041023493328894.png','','N;','&lt;p&gt;La funda para sofa proporciona una cobertura completa incluso en la parte posterior de tu sofa, mantiene a tu sofa libre del polvo, manchas y el desgaste diario. Alarga la vida util de tu sofa y protege tu costosa inversion. Reemplaza el viejo aspecto de tu sofa destenido o desgastado. Las fundas de sofa estan dosponibles en tamaños diversos, para sofas de un asiento, dos, tres, y cuatro asientos.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1618069789,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(160,'Funda para sofa de 1','',769,766,769,0,'Hogar &gt;Sofa',1,'官方自营店铺','N;','N;',0,'',0,'','','N;','&lt;p&gt;La funda para sofa proporciona una cobertura completa incluso en la parte posterior de tu sofa, mantiene a tu sofa libre del polvo, manchas y el desgaste diario. Alarga la vida util de tu sofa y protege tu costosa inversion. Reemplaza el viejo aspecto de tu sofa destenido o desgastado. Las fundas de sofa estan dosponibles en tamaños diversos, para sofas de un asiento, dos, tres, y cuatro asientos.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1618069886,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(161,'Funda para sofa de 2','',769,766,769,0,'Hogar &gt;Sofa',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041023535398568.png','','N;','&lt;p&gt;La funda para sofa proporciona una cobertura completa incluso en la parte posterior de tu sofa, mantiene a tu sofa libre del polvo, manchas y el desgaste diario. Alarga la vida util de tu sofa y protege tu costosa inversion. Reemplaza el viejo aspecto de tu sofa destenido o desgastado. Las fundas de sofa estan dosponibles en tamaños diversos, para sofas de un asiento, dos, tres, y cuatro asientos.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1618070049,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(162,'Funda para sofa de 3','',769,766,769,0,'Hogar &gt;Sofa',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041023570344950.png','','N;','&lt;p&gt;La funda para sofa proporciona una cobertura completa incluso en la parte posterior de tu sofa, mantiene a tu sofa libre del polvo, manchas y el desgaste diario. Alarga la vida util de tu sofa y protege tu costosa inversion. Reemplaza el viejo aspecto de tu sofa destenido o desgastado. Las fundas de sofa estan dosponibles en tamaños diversos, para sofas de un asiento, dos, tres, y cuatro asientos.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1618070236,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(163,'Funda para sofa de 1','',769,766,769,0,'Hogar &gt;Sofa',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041023592150229.png','','N;','&lt;p&gt;La funda para sofa proporciona una cobertura completa incluso en la parte posterior de tu sofa, mantiene a tu sofa libre del polvo, manchas y el desgaste diario. Alarga la vida util de tu sofa y protege tu costosa inversion. Reemplaza el viejo aspecto de tu sofa destenido o desgastado. Las fundas de sofa estan dosponibles en tamaños diversos, para sofas de un asiento, dos, tres, y cuatro asientos.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1618070378,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(164,'Funda para sofa de 2','',769,766,769,0,'Hogar &gt;Sofa',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041100021099343.png','','N;','&lt;p&gt;La funda para sofa proporciona una cobertura completa incluso en la parte posterior de tu sofa, mantiene a tu sofa libre del polvo, manchas y el desgaste diario. Alarga la vida util de tu sofa y protege tu costosa inversion. Reemplaza el viejo aspecto de tu sofa destenido o desgastado. Las fundas de sofa estan dosponibles en tamaños diversos, para sofas de un asiento, dos, tres, y cuatro asientos.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1618070596,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(165,'Funda para sofa de 3','',769,766,769,0,'Hogar &gt;Sofa',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041100084181391.png','','N;','&lt;p&gt;La funda para sofa proporciona una cobertura completa incluso en la parte posterior de tu sofa, mantiene a tu sofa libre del polvo, manchas y el desgaste diario. Alarga la vida util de tu sofa y protege tu costosa inversion. Reemplaza el viejo aspecto de tu sofa destenido o desgastado. Las fundas de sofa estan dosponibles en tamaños diversos, para sofas de un asiento, dos, tres, y cuatro asientos.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1618070980,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(166,'Funda para sofa de 4','',769,766,769,0,'Hogar &gt;Sofa',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041100114876270.png','','N;','&lt;p&gt;La funda para sofa proporciona una cobertura completa incluso en la parte posterior de tu sofa, mantiene a tu sofa libre del polvo, manchas y el desgaste diario. Alarga la vida util de tu sofa y protege tu costosa inversion. Reemplaza el viejo aspecto de tu sofa destenido o desgastado. Las fundas de sofa estan dosponibles en tamaños diversos, para sofas de un asiento, dos, tres, y cuatro asientos.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1618071123,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(167,'Papel   Tapiz ','',770,766,770,0,'Hogar &gt;Papel Tapiz',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041101084085686.png','','N;','&lt;p&gt;&amp;nbsp; Esta lamina decorativa trasforma superficies planas, hace que tu pared sea mas hermosa y elegante. Es segura para aplicar en paredes, armarios de cocina, muebles, estantes y mas creando un aspecto unico y personalizado.&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;Rapido y facil de instalar.&lt;/p&gt;','',1,NULL,1,NULL,0,1618074597,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(168,'Papel Tapiz ','',770,766,770,0,'Hogar &gt;Papel Tapiz',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041101131373447.png','','N;','&lt;p&gt;&amp;nbsp; Esta lamina decorativa trasforma superficies planas, hace que tu pared sea mas hermosa y elegante. Es segura para aplicar en paredes,armarios de cocina, muebles, estantes y mas creando un aspecto unico y personalizado. Rapido y facil de instalar.&lt;/p&gt;','',1,NULL,1,NULL,0,1618074811,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(169,'Papel Tapiz ','',770,766,770,0,'Hogar &gt;Papel Tapiz',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041101145153751.png','','N;','&lt;p&gt;&amp;nbsp; Esta lamina decorativa trasforma superficies planas, hace que tu pared sea mas hermosa y elegante. Es segura para aplicar en paredes,armarios de cocina, muebles, estantes y mas creando un aspecto unico y personalizado. Rapido y facil de instalar.&lt;/p&gt;','',1,NULL,1,NULL,0,1618074907,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(170,'Papel Tapiz ','',770,766,770,0,'Hogar &gt;Papel Tapiz',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041101170768564.png','','N;','&lt;p&gt;&amp;nbsp; Esta lamina decorativa trasforma superficies planas, hace que tu pared sea mas hermosa y elegante. Es segura para aplicar en paredes,armarios de cocina, muebles, estantes y mas creando un aspecto unico y personalizado. Rapido y facil de instalar.&lt;/p&gt;','',1,NULL,1,NULL,0,1618075038,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(171,'Papel Tapiz ','',770,766,770,0,'Hogar &gt;Papel Tapiz',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041101184532347.png','','N;','&lt;p&gt;&amp;nbsp; Esta lamina decorativa trasforma superficies planas, hace que tu pared sea mas hermosa y elegante. Es segura para aplicar en paredes,armarios de cocina, muebles, estantes y mas creando un aspecto unico y personalizado. Rapido y facil de instalar.&lt;/p&gt;','',1,NULL,1,NULL,0,1618075138,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(172,'Papel Tapiz','',770,766,770,0,'Hogar &gt;Papel Tapiz',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041101202157818.png','','N;','&lt;p&gt;&amp;nbsp; Esta lamina decorativa trasforma superficies planas, hace que tu pared sea mas hermosa y elegante. Es segura para aplicar en paredes,armarios de cocina, muebles, estantes y mas creando un aspecto unico y personalizado. Rapido y facil de instalar.&lt;/p&gt;','',1,NULL,1,NULL,0,1618075237,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(173,'Papel Tapiz','',770,766,770,0,'Hogar &gt;Papel Tapiz',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041101222135624.png','','N;','&lt;p&gt;&amp;nbsp; Esta lamina decorativa trasforma superficies planas, hace que tu pared sea mas hermosa y elegante. Es segura para aplicar en paredes,armarios de cocina, muebles, estantes y mas creando un aspecto unico y personalizado. Rapido y facil de instalar.&lt;/p&gt;','',1,NULL,1,NULL,0,1618075369,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(174,'Papel Tapiz','',770,766,770,0,'Hogar &gt;Papel Tapiz',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041101241814050.png','','N;','&lt;p&gt;&amp;nbsp; Esta lamina decorativa trasforma superficies planas, hace que tu pared sea mas hermosa y elegante. Es segura para aplicar en paredes,armarios de cocina, muebles, estantes y mas creando un aspecto unico y personalizado. Rapido y facil de instalar.&lt;/p&gt;','',1,NULL,1,NULL,0,1618075548,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(175,'Papel Tapiz','',770,766,770,0,'Hogar &gt;Papel Tapiz',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041101271760343.png','','N;','&lt;p&gt;&amp;nbsp; Esta lamina decorativa trasforma superficies planas, hace que tu pared sea mas hermosa y elegante. Es segura para aplicar en paredes,armarios de cocina, muebles, estantes y mas creando un aspecto unico y personalizado. Rapido y facil de instalar.&lt;/p&gt;','',1,NULL,1,NULL,0,1618075650,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(176,'Papel Tapiz ','',770,766,770,0,'Hogar &gt;Papel Tapiz',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041101290290240.png','','N;','&lt;p&gt;&amp;nbsp; Esta lamina decorativa trasforma superficies planas, hace que tu pared sea mas hermosa y elegante. Es segura para aplicar en paredes,armarios de cocina, muebles, estantes y mas creando un aspecto unico y personalizado. Rapido y facil de instalar.&lt;/p&gt;','',1,NULL,1,NULL,0,1618075761,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(177,'Papel Tapiz','',770,766,770,0,'Hogar &gt;Papel Tapiz',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041101304958984.png','','N;','&lt;p&gt;&amp;nbsp; Esta lamina decorativa trasforma superficies planas, hace que tu pared sea mas hermosa y elegante. Es segura para aplicar en paredes,armarios de cocina, muebles, estantes y mas creando un aspecto unico y personalizado. Rapido y facil de instalar.&lt;/p&gt;','',1,NULL,1,NULL,0,1618075868,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(178,'Papel Tapiz','',770,766,770,0,'Hogar &gt;Papel Tapiz',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041101340320467.png','','N;','&lt;p&gt;&amp;nbsp; Esta lamina decorativa trasforma superficies planas, hace que tu pared sea mas hermosa y elegante. Es segura para aplicar en paredes,armarios de cocina, muebles, estantes y mas creando un aspecto unico y personalizado. Rapido y facil de instalar.&lt;/p&gt;','',1,NULL,1,NULL,0,1618076056,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(179,'Alfombra Suave ','',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041103183829799.png','','N;','&lt;p&gt;&amp;nbsp; Sensacion suave al tacto. Mantiene caliente durante el frio. Prorporciona una sensacion de lujo ultra suave.&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;Hecho de lana artificial de alta calidad que garantiza una gran textura. Facil delimpiar.&lt;br/&gt;&lt;/p&gt;','',1,NULL,1,NULL,0,1618082414,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(180,'Alfombra Suave ','',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041103221224650.png','','N;','&lt;p&gt;&amp;nbsp; Sensacion suave al tacto. Mantiene caliente durante el frio. Prorporciona una sensacion de lujo ultra suave. Hecho de lana artificial de alta calidad que garantiza una gran textura. Facil delimpiar.&lt;/p&gt;','',1,NULL,1,NULL,0,1618082549,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(181,'Alfombra Suave ','',767,766,767,0,'Hogar &gt;Alfombra',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041103234468045.png','','N;','&lt;p&gt;&amp;nbsp; Sensacion suave al tacto. Mantiene caliente durante el frio. Prorporciona una sensacion de lujo ultra suave. Hecho de lana artificial de alta calidad que garantiza una gran textura. Facil delimpiar.&lt;/p&gt;','',1,NULL,1,NULL,0,1618082637,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(182,'Papel Tapiz','',770,766,770,0,'Hogar &gt;Papel Tapiz',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041103361952435.png','','N;','&lt;p&gt;&amp;nbsp; Esta lamina decorativa trasforma superficies planas, hace que tu pared sea mas hermosa y elegante. Es segura para aplicar en paredes,armarios de cocina, muebles, estantes y mas creando un aspecto unico y personalizado. Rapido y facil de instalar.&lt;/p&gt;','',1,NULL,1,NULL,0,1618083402,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(183,'Papel Tapiz','',770,766,770,0,'Hogar &gt;Papel Tapiz',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041103392210025.png','','N;','&lt;p&gt;&amp;nbsp; Esta lamina decorativa trasforma superficies planas, hace que tu pared sea mas hermosa y elegante. Es segura para aplicar en paredes,armarios de cocina, muebles, estantes y mas creando un aspecto unico y personalizado. Rapido y facil de instalar.&lt;/p&gt;','',1,NULL,1,NULL,0,1618083585,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(184,'Papel Tapiz ','',770,766,770,0,'Hogar &gt;Papel Tapiz',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041103424329236.png','','N;','&lt;p&gt;&amp;nbsp; Esta lamina decorativa trasforma superficies planas, hace que tu pared sea mas hermosa y elegante. Es segura para aplicar en paredes,armarios de cocina, muebles, estantes y mas creando un aspecto unico y personalizado. Rapido y facil de instalar.&lt;/p&gt;','',1,NULL,1,NULL,0,1618083778,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(185,'Papel Tapiz','',770,766,770,0,'Hogar &gt;Papel Tapiz',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041103450534383.png','','N;','&lt;p&gt;&amp;nbsp; Esta lamina decorativa trasforma superficies planas, hace que tu pared sea mas hermosa y elegante. Es segura para aplicar en paredes,armarios de cocina, muebles, estantes y mas creando un aspecto unico y personalizado. Rapido y facil de instalar.&lt;/p&gt;','',1,NULL,1,NULL,0,1618083920,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(186,'Papel Tapiz','',770,766,770,0,'Hogar &gt;Papel Tapiz',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041103473750367.png','','N;','&lt;p&gt;&amp;nbsp; Esta lamina decorativa trasforma superficies planas, hace que tu pared sea mas hermosa y elegante. Es segura para aplicar en paredes,armarios de cocina, muebles, estantes y mas creando un aspecto unico y personalizado. Rapido y facil de instalar.&lt;/p&gt;','',1,NULL,1,NULL,0,1618084077,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255),(187,'Escurridor de Platos ','',768,766,768,0,'Hogar &gt;Organizador',1,'官方自营店铺','N;','N;',0,'',0,'1_2021041216051767808.png','','','&lt;p&gt;&amp;nbsp;Simple, resistente y elegante.&amp;nbsp; Soporte para cubiertos y utensilios. El escurridor es una manera simple y elegante de secar platos directamente en tu fregadero, o en tu encimera mientras sigues con tu dia.&amp;nbsp;&lt;/p&gt;','',1,NULL,1,NULL,0,1618085092,0,NULL,0.00,0.00,0.00,1,0,'',0,0,NULL,1,50.00,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,1,NULL,0.00,0.00,0.00,0,0.00,0.00,0,0,255,255);
/*!40000 ALTER TABLE `ds_goodscommon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_goodsfcode`
--

DROP TABLE IF EXISTS `ds_goodsfcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_goodsfcode` (
  `goodsfcode_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'F码自增ID',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共ID',
  `goodsfcode_code` varchar(20) NOT NULL COMMENT 'F码内容',
  `goodsfcode_state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0:未使用 1:已使用',
  PRIMARY KEY (`goodsfcode_id`),
  KEY `goods_commonid` (`goods_commonid`),
  KEY `goodsfcode_code` (`goodsfcode_code`)
) ENGINE=MyISAM AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COMMENT='商品F码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_goodsfcode`
--

LOCK TABLES `ds_goodsfcode` WRITE;
/*!40000 ALTER TABLE `ds_goodsfcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_goodsfcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_goodsgift`
--

DROP TABLE IF EXISTS `ds_goodsgift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_goodsgift` (
  `gift_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '赠品ID',
  `gift_goodsid` int(10) unsigned NOT NULL COMMENT '赠品商品ID',
  `gift_goodsname` varchar(50) NOT NULL COMMENT '主商品名称',
  `gift_goodsimage` varchar(100) NOT NULL COMMENT '主商品图片',
  `gift_amount` tinyint(3) unsigned NOT NULL COMMENT '赠品数量',
  `goods_id` int(10) unsigned NOT NULL COMMENT '主商品ID',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '主商品公共ID',
  PRIMARY KEY (`gift_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品赠品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_goodsgift`
--

LOCK TABLES `ds_goodsgift` WRITE;
/*!40000 ALTER TABLE `ds_goodsgift` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_goodsgift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_goodsimages`
--

DROP TABLE IF EXISTS `ds_goodsimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_goodsimages` (
  `goodsimage_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品图片自增ID',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共ID',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `color_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '颜色规格值ID',
  `goodsimage_url` varchar(1000) NOT NULL COMMENT '商品图片',
  `goodsimage_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '商品图片排序',
  `goodsimage_isdefault` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '商品图片默认主图，1是，0否',
  PRIMARY KEY (`goodsimage_id`),
  KEY `goods_commonid` (`goods_commonid`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=209 DEFAULT CHARSET=utf8 COMMENT='商品图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_goodsimages`
--

LOCK TABLES `ds_goodsimages` WRITE;
/*!40000 ALTER TABLE `ds_goodsimages` DISABLE KEYS */;
INSERT INTO `ds_goodsimages` VALUES (1,2,1,0,'1_2017092120144795113.jpg',0,1),(2,3,1,0,'1_2017092120244885492.jpg',0,1),(3,4,1,0,'1_2017092120312320763.jpg',0,1),(4,5,1,0,'1_2017092120345719915.jpg',0,1),(5,6,1,0,'1_2017092120365848023.jpg',0,1),(6,7,1,0,'1_2017092120382376796.jpg',0,1),(7,8,1,0,'1_2017092120445748551.jpg',0,1),(8,9,1,0,'1_2017092120480147477.jpg',0,1),(9,10,1,0,'1_2017092120493430154.jpg',0,1),(10,11,1,0,'1_2017092120564717575.jpg',0,1),(11,12,1,0,'1_2017092121050988491.jpg',0,1),(12,13,1,0,'1_2017092121142556524.jpg',0,1),(13,14,1,0,'1_2017092121225164684.jpg',0,1),(14,15,1,0,'1_2017092121260662503.jpg',0,1),(15,16,1,0,'1_2017092121492327671.jpg',0,1),(16,17,1,0,'1_2017092121542617701.jpg',0,1),(17,18,1,0,'1_2017092121564484910.jpg',0,1),(18,19,1,0,'1_2017092122005521920.jpg',0,1),(19,20,1,0,'1_2017092122035543274.jpg',0,1),(20,21,1,0,'1_2017092123585272874.jpg',0,1),(21,22,1,0,'1_2017092200403659812.jpg',0,1),(22,23,1,0,'1_2017092201034951336.jpg',0,1),(23,24,1,0,'1_2017092201084565859.jpg',0,1),(24,25,1,0,'1_2017092201381015306.jpg',0,1),(25,26,1,0,'1_2017092201461861948.jpg',0,1),(26,27,1,0,'1_2017092201523177266.jpg',0,1),(27,28,1,0,'1_2017092202022516767.jpg',0,1),(28,29,1,0,'1_2017092202082283957.jpg',0,1),(29,30,1,0,'1_2017092202112937358.jpg',0,1),(30,31,1,0,'1_2017092202162519571.jpg',0,1),(31,32,1,0,'1_2017092202215519250.jpg',0,1),(32,33,1,0,'1_2017092202310929808.jpg',0,1),(33,34,1,0,'1_2017092202323192694.jpg',0,1),(34,36,1,0,'1_2017092202350299027.jpg',0,1),(35,37,1,1,'1_2017092202382291274.jpg',0,1),(36,39,1,0,'1_2017092202443553519.jpg',0,1),(37,40,1,42,'1_2017092202461115940.jpg',0,1),(38,41,1,1,'1_2017092202492958131.jpg',0,1),(39,42,1,49,'1_2017092202514891485.jpg',0,1),(40,43,1,0,'1_2017092202553367071.jpg',0,1),(41,44,1,0,'1_2017092202585843151.jpg',0,1),(42,45,1,1,'1_2017092203045216863.jpg',0,1),(43,46,1,0,'1_2017092203062937149.jpg',0,1),(44,47,1,0,'1_2017092203083967214.jpg',0,1),(45,47,1,0,'1_2017092203072292427.jpg',0,0),(47,48,1,0,'1_2017092203123417256.jpg',0,1),(48,49,1,0,'1_2017092203151752294.jpg',0,1),(49,50,1,0,'1_2017092203175020843.jpg',0,1),(50,51,1,0,'1_2017092203201884569.jpg',0,1),(51,52,1,0,'1_2017092203242754461.jpg',0,1),(52,53,1,0,'1_2017092203261873185.jpg',0,1),(53,54,1,0,'1_2017092203275599920.jpg',0,1),(54,55,1,0,'1_2017092203294765362.jpg',0,1),(55,56,1,0,'1_2017092203321969628.jpg',0,1),(56,57,1,0,'1_2017092203335981358.jpg',0,1),(57,58,1,0,'1_2017092203371485168.jpg',0,1),(58,59,1,0,'1_2017092821352360295.jpg',0,1),(59,60,1,0,'1_2017092821383373641.jpg',0,1),(60,61,1,0,'1_2017092821403589442.jpg',0,1),(61,62,1,0,'1_2017092821431519588.jpg',0,1),(62,63,1,0,'1_2017092821510935694.jpg',0,1),(63,64,1,0,'1_2017092821530372212.jpg',0,1),(64,65,1,0,'1_2017092821544898610.jpg',0,1),(65,66,1,1,'1_2017092821585013652.jpg',0,1),(66,67,1,0,'1_2017092822032535526.jpg',0,1),(67,68,1,0,'1_2017092822050083427.jpg',0,1),(69,70,1,0,'1_2017092823485490716.jpg',0,1),(70,71,1,0,'1_2017092823501155931.jpg',0,1),(71,72,1,0,'1_2017092823531033711.jpg',0,1),(72,73,1,0,'1_2017092900001256656.jpg',0,1),(73,74,1,0,'1_2017092900022214210.jpg',0,1),(74,75,1,0,'1_2017092900033832502.jpg',0,1),(75,76,1,0,'1_2017092900052977159.jpg',0,1),(76,77,1,0,'1_2017092900064438234.jpg',0,1),(77,78,1,0,'1_2017092900081355788.jpg',0,1),(135,135,1,0,'1_2021040921173889786.png',0,1),(134,134,1,0,'1_2021040920552259843.png',0,1),(133,131,1,0,'1_2021040822481574622.png',0,1),(132,130,1,0,'1_2021040605530867977.png',0,1),(131,128,1,0,'1_2021040605380126814.png',0,1),(130,128,1,0,'1_2021040605380126814.png',0,1),(129,126,1,0,'1_2021040605271432570.png',0,1),(128,125,1,0,'1_2021040605091998482.png',0,1),(127,124,1,0,'1_2021040605071135464.png',0,0),(126,124,1,0,'1_2021040605053674673.png',0,1),(124,121,1,0,'1_2021040604031640855.png',0,0),(122,121,1,0,'1_2021040604002646954.png',0,1),(123,121,1,0,'1_2021040604025042183.png',0,0),(143,142,1,0,'1_2021040922250392074.png',0,1),(142,141,1,0,'1_2021040922122255921.png',0,1),(141,141,1,0,'1_2021040922122255921.png',0,1),(140,140,1,0,'1_2021040922094456374.png',0,1),(139,139,1,0,'1_2021040922050523275.png',0,1),(138,138,1,0,'1_2021040922004293287.png',0,1),(137,137,1,0,'1_2021040921465271189.png',0,1),(136,136,1,0,'1_2021040921332596242.png',0,1),(152,150,1,0,'1_2021041003240910750.png',0,0),(151,150,1,0,'1_2021041003201145253.png',0,1),(150,149,1,0,'1_2021040923000421960.png',0,1),(149,148,1,0,'1_2021040922561014870.png',0,1),(148,147,1,0,'1_2021040922491147671.png',0,1),(147,146,1,0,'1_2021040922475725571.png',0,1),(146,145,1,0,'1_2021040922444325202.png',0,1),(145,144,1,0,'1_2021040922375871880.png',0,1),(144,143,1,0,'1_2021040922291721264.png',0,1),(161,155,1,0,'1_2021041023295656316.png',0,0),(160,155,1,0,'1_2021041023294781366.png',0,0),(159,155,1,0,'1_2021041023284260124.png',0,1),(158,154,1,0,'1_2021041023003813230.png',0,1),(157,153,1,0,'1_2021041022591267048.png',0,1),(156,152,1,0,'1_2021041022571359920.png',0,1),(155,151,1,0,'1_2021041022523144032.png',0,1),(154,151,1,0,'1_2021041022523144032.png',0,1),(153,151,1,0,'1_2021041022523144032.png',0,1),(162,155,1,0,'1_2021041023302013477.png',0,0),(163,155,1,0,'1_2021041023303165773.png',0,0),(164,156,1,0,'1_2021041023330964382.png',0,1),(165,156,1,0,'1_2021041023342223839.png',0,0),(166,156,1,0,'1_2021041023343035640.png',0,0),(167,156,1,0,'1_2021041023344263646.png',0,0),(168,156,1,0,'1_2021041023345794166.png',0,0),(169,157,1,0,'1_2021041023380076553.png',0,1),(170,157,1,0,'1_2021041023391441489.png',0,0),(171,157,1,0,'1_2021041023402351301.png',0,0),(172,157,1,0,'1_2021041023403350697.png',0,0),(173,157,1,0,'1_2021041023410032161.png',0,0),(174,158,1,0,'1_2021041023434143389.png',0,1),(175,158,1,0,'1_2021041023452059600.png',0,0),(176,158,1,0,'1_2021041023453325768.png',0,0),(177,158,1,0,'1_2021041023454826536.png',0,0),(178,158,1,0,'1_2021041023455889511.png',0,0),(179,159,1,0,'1_2021041023493328894.png',0,1),(180,160,1,0,'1_2021041023514097137.png',0,1),(181,161,1,0,'1_2021041023535398568.png',0,1),(182,162,1,0,'1_2021041023570344950.png',0,1),(183,163,1,0,'1_2021041023592150229.png',0,1),(184,164,1,0,'1_2021041100021099343.png',0,1),(185,165,1,0,'1_2021041100084181391.png',0,1),(186,166,1,0,'1_2021041100114876270.png',0,1),(187,167,1,0,'1_2021041101084085686.png',0,1),(188,168,1,0,'1_2021041101131373447.png',0,1),(189,169,1,0,'1_2021041101145153751.png',0,1),(190,170,1,0,'1_2021041101170768564.png',0,1),(191,171,1,0,'1_2021041101184532347.png',0,1),(192,172,1,0,'1_2021041101202157818.png',0,1),(193,173,1,0,'1_2021041101222135624.png',0,1),(194,174,1,0,'1_2021041101241814050.png',0,1),(195,175,1,0,'1_2021041101271760343.png',0,1),(196,176,1,0,'1_2021041101290290240.png',0,1),(197,177,1,0,'1_2021041101304958984.png',0,1),(198,178,1,0,'1_2021041101340320467.png',0,1),(199,179,1,0,'1_2021041103183829799.png',0,1),(200,180,1,0,'1_2021041103221224650.png',0,1),(201,181,1,0,'1_2021041103234468045.png',0,1),(202,182,1,0,'1_2021041103361952435.png',0,1),(203,183,1,0,'1_2021041103392210025.png',0,1),(204,184,1,0,'1_2021041103424329236.png',0,1),(205,185,1,0,'1_2021041103450534383.png',0,1),(206,185,1,0,'1_2021041103450534383.png',0,1),(207,186,1,0,'1_2021041103473750367.png',0,1),(208,187,1,0,'1_2021041104011460879.png',0,1);
/*!40000 ALTER TABLE `ds_goodsimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_goodsvideo`
--

DROP TABLE IF EXISTS `ds_goodsvideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_goodsvideo` (
  `goodsvideo_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品视频id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `goodsvideo_name` varchar(100) NOT NULL COMMENT '视频文件名',
  `goodsvideo_add_time` int(10) unsigned NOT NULL COMMENT '新增时间',
  PRIMARY KEY (`goodsvideo_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品视频';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_goodsvideo`
--

LOCK TABLES `ds_goodsvideo` WRITE;
/*!40000 ALTER TABLE `ds_goodsvideo` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_goodsvideo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_groupbuy`
--

DROP TABLE IF EXISTS `ds_groupbuy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_groupbuy` (
  `groupbuy_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '抢购自增ID',
  `groupbuy_name` varchar(255) NOT NULL COMMENT '抢购活动名称',
  `groupbuy_starttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '抢购开始时间',
  `groupbuy_endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '抢购结束时间',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表ID',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品原价',
  `groupbuy_price` decimal(10,2) NOT NULL COMMENT '抢购价格',
  `groupbuy_rebate` decimal(10,2) NOT NULL COMMENT '折扣',
  `virtual_quantity` int(10) unsigned NOT NULL COMMENT '虚拟购买数量',
  `groupbuy_upper_limit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '购买上限',
  `groupbuy_buyer_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已购买人数',
  `groupbuy_buy_quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '购买数量',
  `groupbuy_intro` text COMMENT '本团介绍',
  `groupbuy_state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '抢购状态 10-审核中 20-正常 30-审核失败 31-管理员关闭 32-已结束',
  `groupbuy_recommended` tinyint(1) unsigned NOT NULL COMMENT '是否推荐 0.未推荐 1.已推荐',
  `groupbuy_views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '查看次数',
  `gclass_id` int(10) unsigned NOT NULL COMMENT '抢购类别编号',
  `s_gclass_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '抢购2级分类id',
  `groupbuy_image` varchar(100) NOT NULL COMMENT '抢购图片',
  `groupbuy_image1` varchar(100) DEFAULT NULL COMMENT '抢购图片1',
  `groupbuy_remark` varchar(255) NOT NULL COMMENT '备注',
  `groupbuy_is_vr` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否虚拟抢购 1是0否',
  `vr_class_id` int(11) DEFAULT NULL COMMENT '虚拟抢购大分类id',
  `vr_s_class_id` int(11) DEFAULT NULL COMMENT '虚拟抢购小分类id',
  PRIMARY KEY (`groupbuy_id`),
  KEY `goods_id` (`goods_id`),
  KEY `store_id` (`store_id`),
  KEY `gclass_id` (`gclass_id`),
  KEY `s_gclass_id` (`s_gclass_id`),
  KEY `vr_class_id` (`vr_class_id`),
  KEY `vr_s_class_id` (`vr_s_class_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='抢购商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_groupbuy`
--

LOCK TABLES `ds_groupbuy` WRITE;
/*!40000 ALTER TABLE `ds_groupbuy` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_groupbuy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_groupbuyclass`
--

DROP TABLE IF EXISTS `ds_groupbuyclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_groupbuyclass` (
  `gclass_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '抢购类别自增ID',
  `gclass_name` varchar(20) NOT NULL COMMENT '抢购类别名称',
  `gclass_parent_id` int(10) unsigned NOT NULL COMMENT '抢购上级类别ID',
  `gclass_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '抢购类别排序',
  `gclass_deep` tinyint(1) unsigned DEFAULT NULL COMMENT '抢购类别深度',
  PRIMARY KEY (`gclass_id`),
  KEY `gclass_parent_id` (`gclass_parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='抢购类别表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_groupbuyclass`
--

LOCK TABLES `ds_groupbuyclass` WRITE;
/*!40000 ALTER TABLE `ds_groupbuyclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_groupbuyclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_groupbuypricerange`
--

DROP TABLE IF EXISTS `ds_groupbuypricerange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_groupbuypricerange` (
  `gprange_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '抢购价格区间ID',
  `gprange_name` varchar(20) NOT NULL COMMENT '抢购价格区间名称',
  `gprange_start` int(10) unsigned NOT NULL COMMENT '抢购价格区间下限',
  `gprange_end` int(10) unsigned NOT NULL COMMENT '抢购价格区间上限',
  PRIMARY KEY (`gprange_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='抢购价格区间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_groupbuypricerange`
--

LOCK TABLES `ds_groupbuypricerange` WRITE;
/*!40000 ALTER TABLE `ds_groupbuypricerange` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_groupbuypricerange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_groupbuyquota`
--

DROP TABLE IF EXISTS `ds_groupbuyquota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_groupbuyquota` (
  `groupbuyquota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '抢购套餐ID',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `groupbuyquota_starttime` int(10) unsigned NOT NULL COMMENT '抢购套餐开始时间',
  `groupbuyquota_endtime` int(10) unsigned NOT NULL COMMENT '抢购套餐结束时间',
  PRIMARY KEY (`groupbuyquota_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='抢购套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_groupbuyquota`
--

LOCK TABLES `ds_groupbuyquota` WRITE;
/*!40000 ALTER TABLE `ds_groupbuyquota` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_groupbuyquota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_help`
--

DROP TABLE IF EXISTS `ds_help`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_help` (
  `help_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '帮助自增ID',
  `help_sort` tinyint(3) unsigned DEFAULT '255' COMMENT '帮助排序',
  `help_title` varchar(100) NOT NULL COMMENT '帮助标题',
  `help_info` text COMMENT '帮助内容',
  `help_url` varchar(100) DEFAULT '' COMMENT '帮助跳转链接',
  `help_updatetime` int(10) unsigned NOT NULL COMMENT '帮助更新时间',
  `helptype_id` int(10) unsigned NOT NULL COMMENT '帮助类型',
  `page_show` tinyint(1) unsigned DEFAULT '1' COMMENT '页面类型 1:店铺 2:会员',
  PRIMARY KEY (`help_id`),
  KEY `helptype_id` (`helptype_id`)
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='帮助内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_help`
--

LOCK TABLES `ds_help` WRITE;
/*!40000 ALTER TABLE `ds_help` DISABLE KEYS */;
INSERT INTO `ds_help` VALUES (96,1,'招商方向','后台->店铺->开店首页->入驻指南->编辑内容','',1399284217,1,1),(97,2,'招商标准','后台->店铺->开店首页->入驻指南->编辑内容','',1399281053,1,1),(98,3,'资质要求','后台->店铺->开店首页->入驻指南->编辑内容','',1399282350,1,1),(99,4,'资费标准','后台->店铺->开店首页->入驻指南->编辑内容','',1399282379,1,1),(101,155,'签署入驻协议','签署入驻协议(后台->店铺->店铺帮助->帮助内容->编辑内容)','',1392949932,99,1),(102,156,'商家信息提交','商家信息提交(后台->店铺->店铺帮助->帮助内容->编辑内容)','',1392949961,99,1),(103,157,'平台审核资质','平台审核资质(后台->店铺->店铺帮助->帮助内容->编辑内容)','',1392949991,99,1),(104,158,'商家缴纳费用','商家缴纳费用(后台->店铺->店铺帮助->帮助内容->编辑内容)','',1392950031,99,1),(105,159,'店铺开通','店铺开通(后台->店铺->店铺帮助->帮助内容->编辑内容)','',1392950076,99,1),(106,255,'商品发布规则','商品发布规则(后台->店铺->店铺帮助->帮助内容->编辑内容)','',1392950396,91,1),(107,255,'商品规格及属性','商品规格及属性(后台->店铺->店铺帮助->帮助内容->编辑内容)','',1392950481,92,1),(108,255,'限时折扣说明','限时折扣说明(后台->店铺->店铺帮助->帮助内容->编辑内容)','',1392950523,93,1),(109,255,'订单商品退款','订单商品退款(后台->店铺->店铺帮助->帮助内容->编辑内容)','',1392950670,94,1),(110,255,'续约流程及费用','续约流程及费用(后台->店铺->店铺帮助->帮助内容->编辑内容)','',1392950739,95,1);
/*!40000 ALTER TABLE `ds_help` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_helptype`
--

DROP TABLE IF EXISTS `ds_helptype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_helptype` (
  `helptype_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '帮助类型自增ID',
  `helptype_name` varchar(50) NOT NULL COMMENT '帮助类型名称',
  `helptype_sort` tinyint(3) unsigned DEFAULT '255' COMMENT '帮助类型',
  `helptype_code` varchar(10) DEFAULT 'auto' COMMENT '调用编号(auto的可删除)',
  `helptype_show` tinyint(1) unsigned DEFAULT '1' COMMENT '帮助类型是否显示 0:否 1:是',
  `page_show` tinyint(1) unsigned DEFAULT '1' COMMENT '页面类型:1:店铺 2:会员',
  PRIMARY KEY (`helptype_id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='帮助类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_helptype`
--

LOCK TABLES `ds_helptype` WRITE;
/*!40000 ALTER TABLE `ds_helptype` DISABLE KEYS */;
INSERT INTO `ds_helptype` VALUES (91,'规则体系',91,'sys_rules',1,1),(92,'商品管理',92,'sys_goods',1,1),(93,'促销方式',93,'sys_sales',1,1),(94,'订单及售后',94,'sys_order',1,1),(95,'店铺续约',95,'sys_renew',1,1),(99,'入驻流程',99,'store_in',1,1);
/*!40000 ALTER TABLE `ds_helptype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_inform`
--

DROP TABLE IF EXISTS `ds_inform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_inform` (
  `inform_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报自增ID',
  `inform_member_id` int(11) NOT NULL COMMENT '举报人ID',
  `inform_member_name` varchar(50) NOT NULL COMMENT '举报人会员名',
  `inform_goods_id` int(11) NOT NULL COMMENT '被举报的商品ID',
  `inform_goods_name` varchar(200) NOT NULL COMMENT '被举报的商品名称',
  `informsubject_id` int(11) NOT NULL COMMENT '举报主题ID',
  `informsubject_content` varchar(50) NOT NULL COMMENT '举报主题',
  `inform_content` varchar(100) NOT NULL COMMENT '举报信息',
  `inform_pic1` varchar(100) NOT NULL COMMENT '图片1',
  `inform_pic2` varchar(100) NOT NULL COMMENT '图片2',
  `inform_pic3` varchar(100) NOT NULL COMMENT '图片3',
  `inform_datetime` int(11) NOT NULL COMMENT '举报时间',
  `inform_store_id` int(11) NOT NULL COMMENT '被举报商品的店铺ID',
  `inform_state` tinyint(4) NOT NULL COMMENT '举报状态(1未处理/2已处理)',
  `inform_handle_type` tinyint(4) DEFAULT NULL COMMENT '举报处理结果(1无效举报/2恶意举报/3有效举报)',
  `inform_handle_message` varchar(100) NOT NULL COMMENT '举报处理信息',
  `inform_handle_datetime` int(11) NOT NULL DEFAULT '0' COMMENT '举报处理时间',
  `inform_handle_member_id` int(11) NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `inform_goods_image` varchar(150) DEFAULT NULL COMMENT '商品图',
  `inform_store_name` varchar(100) DEFAULT NULL COMMENT '店铺名',
  PRIMARY KEY (`inform_id`),
  KEY `inform_member_id` (`inform_member_id`),
  KEY `inform_store_id` (`inform_store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='举报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_inform`
--

LOCK TABLES `ds_inform` WRITE;
/*!40000 ALTER TABLE `ds_inform` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_inform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_informsubject`
--

DROP TABLE IF EXISTS `ds_informsubject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_informsubject` (
  `informsubject_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报主题自增ID',
  `informsubject_content` varchar(100) NOT NULL COMMENT '举报主题内容',
  `informsubject_type_id` int(11) NOT NULL COMMENT '举报类型ID',
  `informsubject_type_name` varchar(50) NOT NULL COMMENT '举报类型名称 ',
  `informsubject_state` tinyint(3) NOT NULL COMMENT '举报主题状态 1:可用 2:失效',
  PRIMARY KEY (`informsubject_id`),
  KEY `informsubject_type_id` (`informsubject_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='举报主题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_informsubject`
--

LOCK TABLES `ds_informsubject` WRITE;
/*!40000 ALTER TABLE `ds_informsubject` DISABLE KEYS */;
INSERT INTO `ds_informsubject` VALUES (1,'管制刀具、弓弩类、其他武器等',1,'出售禁售品',1),(2,'赌博用具类',1,'出售禁售品',1),(3,'枪支弹药',1,'出售禁售品',1),(4,'毒品及吸毒工具',1,'出售禁售品',1),(5,'色差大，质量差。',2,'产品质量问题',1);
/*!40000 ALTER TABLE `ds_informsubject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_informsubjecttype`
--

DROP TABLE IF EXISTS `ds_informsubjecttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_informsubjecttype` (
  `informtype_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '举报类型自增ID',
  `informtype_name` varchar(50) NOT NULL COMMENT '举报类型名称 ',
  `informtype_desc` varchar(100) NOT NULL COMMENT '举报类型描述',
  `informtype_state` tinyint(4) NOT NULL COMMENT '举报类型状态 1:有效 2:失效',
  PRIMARY KEY (`informtype_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='举报类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_informsubjecttype`
--

LOCK TABLES `ds_informsubjecttype` WRITE;
/*!40000 ALTER TABLE `ds_informsubjecttype` DISABLE KEYS */;
INSERT INTO `ds_informsubjecttype` VALUES (1,'出售禁售品','销售商城禁止和限制交易规则下所规定的所有商品。',1),(2,'产品质量问题','产品质量差，与描述严重不相符。',1);
/*!40000 ALTER TABLE `ds_informsubjecttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_instant_message`
--

DROP TABLE IF EXISTS `ds_instant_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_instant_message` (
  `instant_message_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '消息自增ID',
  `instant_message_from_id` int(10) unsigned NOT NULL COMMENT '发送ID',
  `instant_message_from_type` tinyint(1) unsigned NOT NULL COMMENT '发送类型（0用户1商家2直播）',
  `instant_message_from_name` varchar(500) NOT NULL COMMENT '发送名称',
  `instant_message_from_ip` varchar(15) NOT NULL COMMENT '发自IP',
  `instant_message_to_id` int(10) unsigned NOT NULL COMMENT '接收ID',
  `instant_message_to_type` tinyint(1) unsigned NOT NULL COMMENT '接收类型（0用户1商家2直播）',
  `instant_message_to_name` varchar(500) NOT NULL COMMENT '接收名称',
  `instant_message` text COMMENT '消息内容',
  `instant_message_type` tinyint(1) unsigned DEFAULT '0' COMMENT '消息类型',
  `instant_message_state` tinyint(1) unsigned DEFAULT '2' COMMENT '状态:1为已读,2为未读,默认为2',
  `instant_message_verify` tinyint(1) unsigned DEFAULT '0' COMMENT '审核:0审核中,1为已通过,2为未通过',
  `instant_message_add_time` int(10) unsigned DEFAULT '0' COMMENT '添加时间',
  `instant_message_verify_time` int(10) unsigned DEFAULT '0' COMMENT '审核时间',
  PRIMARY KEY (`instant_message_id`),
  KEY `instant_message_from_id` (`instant_message_from_id`,`instant_message_from_type`),
  KEY `instant_message_to_id` (`instant_message_to_id`,`instant_message_to_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_instant_message`
--

LOCK TABLES `ds_instant_message` WRITE;
/*!40000 ALTER TABLE `ds_instant_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_instant_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_inviter`
--

DROP TABLE IF EXISTS `ds_inviter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_inviter` (
  `inviter_id` int(10) unsigned NOT NULL COMMENT '推广员id即会员id',
  `inviter_state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '推广员状态（0审核中1已审核2已清退）',
  `inviter_total_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '总共结算的佣金 ',
  `inviter_1_quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '1级成员数量',
  `inviter_2_quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '2级成员数量',
  `inviter_3_quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '3级成员数量',
  `inviter_applytime` int(10) unsigned NOT NULL COMMENT '申请时间',
  `inviter_goods_quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总共分销的商品件数',
  `inviter_goods_amount` decimal(10,0) unsigned NOT NULL DEFAULT '0' COMMENT '总共分销的商品金额',
  PRIMARY KEY (`inviter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='推广员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_inviter`
--

LOCK TABLES `ds_inviter` WRITE;
/*!40000 ALTER TABLE `ds_inviter` DISABLE KEYS */;
INSERT INTO `ds_inviter` VALUES (1,2,0.00,0,0,0,1605609462,0,0);
/*!40000 ALTER TABLE `ds_inviter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_inviterclass`
--

DROP TABLE IF EXISTS `ds_inviterclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_inviterclass` (
  `inviterclass_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '推广员等级id',
  `inviterclass_name` varchar(60) NOT NULL COMMENT '等级名',
  `inviterclass_amount` decimal(10,2) NOT NULL COMMENT '等级门槛',
  PRIMARY KEY (`inviterclass_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='推广等级表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_inviterclass`
--

LOCK TABLES `ds_inviterclass` WRITE;
/*!40000 ALTER TABLE `ds_inviterclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_inviterclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_invoice`
--

DROP TABLE IF EXISTS `ds_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '发票信息ID',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `invoice_state` enum('1','2') DEFAULT NULL COMMENT '发票类型 1:普通发票 2:增值税发票',
  `invoice_title` varchar(50) DEFAULT '' COMMENT '发票抬头[普通发票]',
  `invoice_code` varchar(50) DEFAULT '' COMMENT '纳税人识别号[普通发票]',
  `invoice_content` varchar(10) DEFAULT '' COMMENT '发票内容[普通发票]',
  `invoice_company` varchar(50) DEFAULT '' COMMENT '单位名称',
  `invoice_company_code` varchar(50) DEFAULT '' COMMENT '纳税人识别号',
  `invoice_reg_addr` varchar(50) DEFAULT '' COMMENT '注册地址',
  `invoice_reg_phone` varchar(30) DEFAULT '' COMMENT '注册电话',
  `invoice_reg_bname` varchar(30) DEFAULT '' COMMENT '开户银行',
  `invoice_reg_baccount` varchar(30) DEFAULT '' COMMENT '银行帐户',
  `invoice_rec_name` varchar(20) DEFAULT '' COMMENT '收票人姓名',
  `invoice_rec_mobphone` varchar(15) DEFAULT '' COMMENT '收票人手机号',
  `invoice_rec_province` varchar(30) DEFAULT '' COMMENT '收票人省份',
  `invoice_goto_addr` varchar(50) DEFAULT '' COMMENT '送票地址',
  PRIMARY KEY (`invoice_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='买家发票信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_invoice`
--

LOCK TABLES `ds_invoice` WRITE;
/*!40000 ALTER TABLE `ds_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_link`
--

DROP TABLE IF EXISTS `ds_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '友情链接自增ID',
  `link_title` varchar(100) DEFAULT NULL COMMENT '友情链接标题',
  `link_url` varchar(100) DEFAULT NULL COMMENT '友情链接地址',
  `link_pic` varchar(100) DEFAULT NULL COMMENT '友情链接图片',
  `link_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '友情链接排序',
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='友情链接';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_link`
--

LOCK TABLES `ds_link` WRITE;
/*!40000 ALTER TABLE `ds_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_live_apply`
--

DROP TABLE IF EXISTS `ds_live_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_live_apply` (
  `live_apply_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '直播申请id',
  `live_apply_name` varchar(255) NOT NULL COMMENT '直播标题',
  `live_apply_state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '直播申请状态(0申请中1已通过2已拒绝)',
  `live_apply_push_state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '推流状态（0主播未进入直播间1主播已进入2主播停止直播）',
  `live_apply_push_message` varchar(255) NOT NULL DEFAULT '' COMMENT '断流提示信息',
  `live_apply_play_time` int(10) unsigned NOT NULL COMMENT '直播时间',
  `live_apply_end_time` int(10) unsigned DEFAULT NULL COMMENT '过期时间',
  `live_apply_video` varchar(500) DEFAULT NULL COMMENT '回放视频',
  `live_apply_cover_image` varchar(255) DEFAULT NULL COMMENT '封面图片',
  `live_apply_cover_video` varchar(255) DEFAULT NULL COMMENT '封面视频',
  `live_apply_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '申请类别 0:无 1:课程 2:商品',
  `live_apply_type_id` int(10) NOT NULL DEFAULT '0' COMMENT '申请类别id',
  `live_apply_add_time` int(10) unsigned NOT NULL COMMENT '申请时间',
  `live_apply_user_type` tinyint(1) unsigned NOT NULL COMMENT '申请用户类型（1用户2商家）',
  `live_apply_user_id` int(10) unsigned NOT NULL COMMENT '申请用户id',
  `live_apply_remark` varchar(255) NOT NULL COMMENT '备注',
  `live_apply_like_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '喜欢数',
  `live_apply_view_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '观看数',
  PRIMARY KEY (`live_apply_id`),
  KEY `live_apply_state` (`live_apply_state`),
  KEY `live_apply_type_id` (`live_apply_type_id`,`live_apply_user_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='直播申请';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_live_apply`
--

LOCK TABLES `ds_live_apply` WRITE;
/*!40000 ALTER TABLE `ds_live_apply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_live_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_live_apply_goods`
--

DROP TABLE IF EXISTS `ds_live_apply_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_live_apply_goods` (
  `live_apply_id` int(10) unsigned NOT NULL COMMENT '直播申请id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `store_name` varchar(200) NOT NULL COMMENT '店铺名称',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类',
  `gc_id_1` int(10) unsigned DEFAULT NULL COMMENT '一级分类id',
  `gc_id_2` int(10) unsigned DEFAULT NULL COMMENT '二级分类id',
  `gc_id_3` int(10) unsigned DEFAULT NULL COMMENT '三级分类id',
  `gc_name` varchar(200) NOT NULL COMMENT '商品分类',
  PRIMARY KEY (`live_apply_id`,`goods_commonid`),
  KEY `goods_commonid` (`goods_commonid`),
  KEY `gc_id` (`gc_id`),
  KEY `gc_id_1` (`gc_id_1`),
  KEY `gc_id_2` (`gc_id_2`),
  KEY `gc_id_3` (`gc_id_3`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='直播申请商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_live_apply_goods`
--

LOCK TABLES `ds_live_apply_goods` WRITE;
/*!40000 ALTER TABLE `ds_live_apply_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_live_apply_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_mailcron`
--

DROP TABLE IF EXISTS `ds_mailcron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_mailcron` (
  `mailcron_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息任务计划自增ID',
  `mailcron_address` varchar(100) NOT NULL COMMENT '邮箱地址',
  `mailcron_subject` varchar(255) NOT NULL COMMENT '邮件标题',
  `mailcron_contnet` text NOT NULL COMMENT '邮件内容',
  PRIMARY KEY (`mailcron_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邮件任务计划表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_mailcron`
--

LOCK TABLES `ds_mailcron` WRITE;
/*!40000 ALTER TABLE `ds_mailcron` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_mailcron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_mailmsgtemlates`
--

DROP TABLE IF EXISTS `ds_mailmsgtemlates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_mailmsgtemlates` (
  `mailmt_name` varchar(100) NOT NULL COMMENT '模板名称',
  `mailmt_title` varchar(100) DEFAULT NULL COMMENT '模板标题',
  `mailmt_code` varchar(30) NOT NULL COMMENT '模板调用代码',
  `mailmt_content` text NOT NULL COMMENT '模板内容',
  `ali_template_code` varchar(255) DEFAULT NULL COMMENT '阿里云短信模板ID',
  `ten_template_code` varchar(255) DEFAULT NULL COMMENT '腾讯云短信模板ID',
  PRIMARY KEY (`mailmt_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邮件模板表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_mailmsgtemlates`
--

LOCK TABLES `ds_mailmsgtemlates` WRITE;
/*!40000 ALTER TABLE `ds_mailmsgtemlates` DISABLE KEYS */;
INSERT INTO `ds_mailmsgtemlates` VALUES ('<strong>[用户]</strong>账号注册通知','账号注册通知 - ${site_name}','register','您正在申请注册会员，动态码：${code}。',NULL,NULL),('<strong>[用户]</strong>账号登录通知','账号登录通知 - ${site_name}','login','您正在申请登录，动态码：${code}。',NULL,NULL),('<strong>[用户]</strong>重置密码通知','重置密码通知 - ${site_name}','reset_password','您正在申请重置登录密码，动态码：${code}。',NULL,NULL),('<strong>[用户]</strong>身份验证通知','账户安全认证 - ${site_name}','authenticate','您正在提交账户安全验证，验证码是：${code}。',NULL,NULL),('<strong>[用户]</strong>邮箱验证通知','邮箱验证通知 - ${site_name}','bind_email','<p>您好！</p>\r\n<p>请在24小时内点击以下链接完成邮箱验证</p>\r\n<p><a href=\"${verify_url}\" target=\"_blank\">马上验证</a></p>\r\n<p>如果您不能点击上面链接，还可以将以下链接复制到浏览器地址栏中访问</p>\r\n<p>${verify_url}</p>',NULL,NULL),('<strong>[用户]</strong>手机验证通知','手机验证通知 - ${site_name}','modify_mobile','您正在申请绑定手机号，验证码是：${code}。',NULL,NULL),('<strong>[用户]</strong>代收通知','门店代收通知 - ${site_name}','send_pickup_code','您的订单已到达门店，请上门取货！提货时请提供手机号/订单号/运单号及提货码：${pickup_code}。',NULL,NULL),('<strong>[用户]</strong>虚拟兑换码通知','虚拟兑换码通知 - ${site_name}','send_vr_code','您的虚拟兑换码是：${vr_code}。',NULL,NULL);
/*!40000 ALTER TABLE `ds_mailmsgtemlates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_mallconsult`
--

DROP TABLE IF EXISTS `ds_mallconsult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_mallconsult` (
  `mallconsult_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '平台客服咨询自增ID',
  `mallconsulttype_id` int(10) unsigned NOT NULL COMMENT '咨询类型ID',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `mallconsult_content` varchar(500) NOT NULL COMMENT '咨询内容',
  `mallconsult_addtime` int(10) unsigned NOT NULL COMMENT '咨询时间',
  `mallconsult_isreply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否回复 1:是 0:否',
  `mallconsult_reply_content` varchar(500) NOT NULL DEFAULT '' COMMENT '平台回复内容',
  `mallconsult_replytime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '平台回复时间',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员id',
  `admin_name` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员名称',
  PRIMARY KEY (`mallconsult_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='平台客服咨询表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_mallconsult`
--

LOCK TABLES `ds_mallconsult` WRITE;
/*!40000 ALTER TABLE `ds_mallconsult` DISABLE KEYS */;
INSERT INTO `ds_mallconsult` VALUES (1,2,3,'ceshi123','这个订单： 202012011528054808，什么时候发货',1606813899,0,'',0,0,''),(2,1,6,'duomitxt','请问现在能发货吗',1609395522,0,'',0,0,''),(3,1,6,'duomitxt','请问现在能发货吗',1609395536,0,'',0,0,'');
/*!40000 ALTER TABLE `ds_mallconsult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_mallconsulttype`
--

DROP TABLE IF EXISTS `ds_mallconsulttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_mallconsulttype` (
  `mallconsulttype_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '平台客服咨询类型ID',
  `mallconsulttype_name` varchar(50) NOT NULL COMMENT '咨询类型名称',
  `mallconsulttype_introduce` text NOT NULL COMMENT '平台客服咨询类型备注',
  `mallconsulttype_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '咨询类型排序',
  PRIMARY KEY (`mallconsulttype_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='平台客服咨询类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_mallconsulttype`
--

LOCK TABLES `ds_mallconsulttype` WRITE;
/*!40000 ALTER TABLE `ds_mallconsulttype` DISABLE KEYS */;
INSERT INTO `ds_mallconsulttype` VALUES (1,'商品咨询','&lt;p&gt;\r\n	请写明商品链接，或平台货号。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	如果您对商品规格、介绍等有疑问，可以在商品详情页“购买咨询”处发起咨询，会得到及时专业的回复。\r\n&lt;/p&gt;',255),(2,'订单咨询','&lt;p&gt;\r\n	请写明要咨询的订单编号。\r\n&lt;/p&gt;\r\n&lt;p&gt;\r\n	如需处理交易中产生的纠纷，请选择投诉。\r\n&lt;/p&gt;',255);
/*!40000 ALTER TABLE `ds_mallconsulttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_marketmanage`
--

DROP TABLE IF EXISTS `ds_marketmanage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_marketmanage` (
  `marketmanage_id` int(11) NOT NULL AUTO_INCREMENT,
  `marketmanage_name` varchar(100) NOT NULL DEFAULT '' COMMENT '营销活动活动名称',
  `marketmanage_detail` varchar(255) NOT NULL DEFAULT '' COMMENT '营销活动详情',
  `marketmanage_begintime` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `marketmanage_endtime` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `marketmanage_jointype` tinyint(2) NOT NULL DEFAULT '0' COMMENT '参与类型 0共几次 1每天几次 2无限制',
  `marketmanage_joincount` int(11) NOT NULL DEFAULT '0' COMMENT '参与次数限制',
  `marketmanage_totalcount` int(11) NOT NULL DEFAULT '0' COMMENT '总参与次数',
  `marketmanage_totalwin` int(11) NOT NULL DEFAULT '0' COMMENT '总中奖次数',
  `marketmanage_point` int(11) NOT NULL DEFAULT '0' COMMENT '0不消耗积分 大于0消耗积分',
  `marketmanage_addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `marketmanage_failed` varchar(255) NOT NULL DEFAULT '' COMMENT '未中奖说明',
  `marketmanage_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '营销活动类型 1刮刮卡2大转盘3砸金蛋4生肖翻翻看',
  PRIMARY KEY (`marketmanage_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='营销活动活动 刮刮卡大转盘砸金蛋生肖翻翻看';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_marketmanage`
--

LOCK TABLES `ds_marketmanage` WRITE;
/*!40000 ALTER TABLE `ds_marketmanage` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_marketmanage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_marketmanageaward`
--

DROP TABLE IF EXISTS `ds_marketmanageaward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_marketmanageaward` (
  `marketmanageaward_id` int(11) NOT NULL AUTO_INCREMENT,
  `marketmanage_id` int(11) NOT NULL DEFAULT '0' COMMENT '营销活动ID',
  `marketmanageaward_level` tinyint(3) NOT NULL COMMENT '奖品等级',
  `marketmanageaward_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '奖品类型 1积分 2红包 3优惠券',
  `marketmanageaward_count` int(11) NOT NULL DEFAULT '0' COMMENT '奖品数量',
  `marketmanageaward_send` int(11) NOT NULL DEFAULT '0' COMMENT '中奖数量',
  `marketmanageaward_probability` int(3) NOT NULL DEFAULT '0' COMMENT '奖品概率',
  `marketmanageaward_point` int(11) NOT NULL DEFAULT '0' COMMENT '奖品积分',
  `bonus_id` int(11) NOT NULL DEFAULT '0' COMMENT '红包ID',
  `vouchertemplate_id` int(11) NOT NULL DEFAULT '0' COMMENT '优惠券ID',
  PRIMARY KEY (`marketmanageaward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='营销活动活动奖品记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_marketmanageaward`
--

LOCK TABLES `ds_marketmanageaward` WRITE;
/*!40000 ALTER TABLE `ds_marketmanageaward` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_marketmanageaward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_marketmanagelog`
--

DROP TABLE IF EXISTS `ds_marketmanagelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_marketmanagelog` (
  `marketmanagelog_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `member_name` varchar(50) NOT NULL COMMENT '会员名',
  `marketmanage_id` int(11) NOT NULL DEFAULT '0' COMMENT '营销活动活动ID',
  `marketmanageaward_id` int(11) NOT NULL DEFAULT '0' COMMENT '中奖的奖品ID',
  `marketmanagelog_win` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否中奖 0未中奖 1中奖',
  `marketmanagelog_time` int(11) NOT NULL DEFAULT '0' COMMENT '参与时间',
  `marketmanagelog_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注领取信息',
  PRIMARY KEY (`marketmanagelog_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='营销活动活动领取记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_marketmanagelog`
--

LOCK TABLES `ds_marketmanagelog` WRITE;
/*!40000 ALTER TABLE `ds_marketmanagelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_marketmanagelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_mbchaintoken`
--

DROP TABLE IF EXISTS `ds_mbchaintoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_mbchaintoken` (
  `chain_token_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '令牌编号',
  `chain_id` int(10) unsigned NOT NULL COMMENT '门店编号',
  `chain_name` varchar(60) NOT NULL COMMENT '门店登录名',
  `chain_token` varchar(60) NOT NULL COMMENT 'token',
  `chain_logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  `chain_clienttype` varchar(10) NOT NULL COMMENT '客户端类型',
  PRIMARY KEY (`chain_token_id`),
  UNIQUE KEY `chain_token` (`chain_token`),
  UNIQUE KEY `chain_id` (`chain_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='门店登录token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_mbchaintoken`
--

LOCK TABLES `ds_mbchaintoken` WRITE;
/*!40000 ALTER TABLE `ds_mbchaintoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_mbchaintoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_mbsellertoken`
--

DROP TABLE IF EXISTS `ds_mbsellertoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_mbsellertoken` (
  `seller_token_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '令牌编号',
  `seller_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `seller_name` varchar(50) NOT NULL COMMENT '用户名',
  `seller_token` varchar(50) NOT NULL COMMENT '登录令牌',
  `seller_logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  `seller_clienttype` varchar(10) NOT NULL COMMENT '客户端类型 windows',
  PRIMARY KEY (`seller_token_id`),
  KEY `seller_token` (`seller_token`),
  KEY `seller_id` (`seller_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='客户端商家登录令牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_mbsellertoken`
--

LOCK TABLES `ds_mbsellertoken` WRITE;
/*!40000 ALTER TABLE `ds_mbsellertoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_mbsellertoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_mbusertoken`
--

DROP TABLE IF EXISTS `ds_mbusertoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_mbusertoken` (
  `member_token_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '令牌编号',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `member_token` varchar(50) NOT NULL COMMENT '登录令牌',
  `member_logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  `member_clienttype` varchar(10) NOT NULL COMMENT '客户端类型 android wap',
  `member_openid` varchar(50) DEFAULT NULL COMMENT '微信支付jsapi的openid缓存',
  PRIMARY KEY (`member_token_id`),
  KEY `member_id` (`member_id`),
  KEY `member_token` (`member_token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='移动端登录令牌表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_mbusertoken`
--

LOCK TABLES `ds_mbusertoken` WRITE;
/*!40000 ALTER TABLE `ds_mbusertoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_mbusertoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_member`
--

DROP TABLE IF EXISTS `ds_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员自增ID',
  `member_name` varchar(50) DEFAULT '' COMMENT '会员用户名',
  `member_truename` varchar(20) DEFAULT '' COMMENT '会员真实姓名',
  `member_nickname` varchar(20) DEFAULT '' COMMENT '会员昵称',
  `member_auth_state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '实名认证状态（0默认1审核中2未通过3已认证）',
  `member_idcard` varchar(255) DEFAULT '' COMMENT '实名认证身份证号',
  `member_idcard_image1` varchar(255) DEFAULT '' COMMENT '手持身份证照',
  `member_idcard_image2` varchar(255) DEFAULT '' COMMENT '身份证正面照',
  `member_idcard_image3` varchar(255) DEFAULT '' COMMENT '身份证反面照',
  `member_avatar` varchar(255) DEFAULT '' COMMENT '会员头像',
  `member_sex` tinyint(1) DEFAULT NULL COMMENT '会员性别',
  `member_birthday` int(11) DEFAULT NULL COMMENT '会员生日',
  `member_password` varchar(32) NOT NULL DEFAULT '' COMMENT '会员密码',
  `member_paypwd` varchar(32) DEFAULT '' COMMENT '支付密码',
  `member_email` varchar(50) DEFAULT '' COMMENT '会员邮箱',
  `member_emailbind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否绑定邮箱',
  `member_mobile` varchar(11) DEFAULT '' COMMENT '手机号码',
  `member_mobilebind` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否绑定手机',
  `member_qq` varchar(20) DEFAULT '' COMMENT '会员QQ',
  `member_ww` varchar(20) DEFAULT '' COMMENT '会员旺旺',
  `member_loginnum` int(11) NOT NULL DEFAULT '0' COMMENT '会员登录次数',
  `member_addtime` int(11) NOT NULL COMMENT '会员添加时间',
  `member_logintime` int(11) DEFAULT '0' COMMENT '会员当前登录时间',
  `member_old_logintime` int(11) DEFAULT '0' COMMENT '会员上次登录时间',
  `member_login_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '会员当前登录IP',
  `member_old_login_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '会员上次登录IP',
  `member_fbopenid` varchar(100) DEFAULT '' COMMENT 'Facebook互联id',
  `member_fbinfo` text COMMENT 'Facebook账号相关信息',
  `member_twopenid` varchar(100) DEFAULT '' COMMENT 'Twitter互联id',
  `member_twinfo` text COMMENT 'Twitter账号相关信息',
  `member_qqopenid` varchar(100) DEFAULT '' COMMENT 'qq互联id',
  `member_qqinfo` text COMMENT 'qq账号相关信息',
  `member_sinaopenid` varchar(100) DEFAULT '' COMMENT '新浪微博登录id',
  `member_sinainfo` text COMMENT '新浪账号相关信息序列化值',
  `member_wxopenid` varchar(100) DEFAULT '' COMMENT '微信互联openid',
  `member_wxunionid` varchar(100) DEFAULT '' COMMENT '微信用户统一标识',
  `member_wxinfo` text COMMENT '微信用户相关信息',
  `member_points` int(11) NOT NULL DEFAULT '0' COMMENT '会员积分',
  `available_predeposit` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '预存款可用金额',
  `freeze_predeposit` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '预存款冻结金额',
  `available_rc_balance` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '可用充值卡余额',
  `freeze_rc_balance` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '冻结充值卡余额',
  `inform_allow` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许举报(1可以/2不可以)',
  `is_buylimit` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员是否有购买权限 1为开启 0为关闭',
  `is_allowtalk` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员是否有咨询和发送站内信的权限 1为开启 0为关闭',
  `member_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员的开启状态 1为开启 0为关闭',
  `member_areaid` int(11) DEFAULT NULL COMMENT '地区ID',
  `member_cityid` int(11) DEFAULT NULL COMMENT '城市ID',
  `member_provinceid` int(11) DEFAULT NULL COMMENT '省份ID',
  `member_areainfo` varchar(255) DEFAULT '' COMMENT '地区内容',
  `member_privacy` text COMMENT '隐私设定',
  `member_exppoints` int(11) NOT NULL DEFAULT '0' COMMENT '会员经验值',
  `inviter_id` int(11) DEFAULT NULL COMMENT '邀请人ID',
  `member_signin_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次签到时间',
  `member_signin_days_cycle` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '持续签到天数，每周期后清零',
  `member_signin_days_total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '签到总天数',
  `member_signin_days_series` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '持续签到天数总数，非连续周期清零',
  PRIMARY KEY (`member_id`),
  KEY `member_name` (`member_name`),
  KEY `member_email` (`member_email`,`member_emailbind`),
  KEY `member_mobile` (`member_mobile`,`member_mobilebind`),
  KEY `member_wxunionid` (`member_wxunionid`),
  KEY `member_qqopenid` (`member_qqopenid`),
  KEY `member_sinaopenid` (`member_sinaopenid`),
  KEY `inviter_id` (`inviter_id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_member`
--

LOCK TABLES `ds_member` WRITE;
/*!40000 ALTER TABLE `ds_member` DISABLE KEYS */;
INSERT INTO `ds_member` VALUES (1,'buyer',NULL,'爱购商城_123456',0,NULL,NULL,NULL,NULL,NULL,3,-28800,'e10adc3949ba59abbe56e057f20f883e',NULL,'',0,NULL,0,'','',9,1605514005,1606701400,1606439304,'14.120.76.218','14.120.79.15',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,70,0.00,0.00,0.00,0.00,1,1,1,1,0,0,0,'','a:7:{s:5:\"email\";s:1:\"0\";s:8:\"nickname\";s:1:\"0\";s:3:\"sex\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:4:\"area\";s:1:\"0\";s:2:\"qq\";s:1:\"0\";s:2:\"ww\";s:1:\"0\";}',140,NULL,0,0,0,0),(2,'helly','','爱购商城_950963',0,NULL,NULL,NULL,NULL,NULL,0,NULL,'12a2ccb92a0874e9e69757859ed3d540','e10adc3949ba59abbe56e057f20f883e','',0,'',0,'','',1,1606382639,1607308814,1606382639,'14.120.77.98','14.120.79.163',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,10,0.00,0.00,0.00,0.00,1,1,1,1,0,0,0,'',NULL,20,NULL,0,0,0,0),(3,'ceshi123','','爱购商城_301218',0,NULL,NULL,NULL,NULL,NULL,0,NULL,'059d38a8c888d5109fa33a9815866013','e10adc3949ba59abbe56e057f20f883e','',0,'',0,'','',56,1606729630,1618112752,1617590908,'172.69.34.98','172.69.33.19',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,357,9514.00,0.00,0.00,0.00,1,1,1,1,0,0,0,'',NULL,671,NULL,0,0,0,0),(5,'WANGYU',NULL,'爱购商城_927663',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'e10adc3949ba59abbe56e057f20f883e','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,0,NULL,NULL,2,1607311708,1607313838,1607311708,'14.120.77.98','14.120.77.98',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,5,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0),(4,'hfai001',NULL,'爱购商城_612529',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7523a42c64d0b24fcbe4bda3d4b574e6','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,0,NULL,NULL,3,1607086531,1612535535,1609976869,'108.162.237.42','108.162.237.175',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,25,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,NULL,NULL,40,NULL,0,0,0,0),(6,'duomitxt',NULL,'爱购商城_689793',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'e10adc3949ba59abbe56e057f20f883e','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,0,NULL,NULL,1,1609395011,1609395011,1609395011,'172.69.35.196','172.69.35.196',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,5,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0),(7,'TINA Fashion',NULL,'_759352',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'54a1dbfb6827e372a4ca9f7476ea2cf5','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,0,NULL,NULL,0,1610481918,1610481918,1610481918,'108.162.212.148','108.162.212.148',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,0,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0),(8,'TINA Fashion SRL',NULL,'_798293',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'259504cfc18f38f8ec661006814c61d5','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,0,NULL,NULL,0,1610493740,1610493740,1610493740,'108.162.237.37','108.162.237.37',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,0,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0),(9,'TINA Tina Fashion SRL',NULL,'_278672',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'259504cfc18f38f8ec661006814c61d5','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,0,NULL,NULL,0,1610493757,1610493757,1610493757,'108.162.237.37','108.162.237.37',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,0,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0),(10,'TINA',NULL,'_899477',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'259504cfc18f38f8ec661006814c61d5','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,0,NULL,NULL,0,1610493773,1610493773,1610493773,'108.162.237.37','108.162.237.37',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,0,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0),(11,'Jorge',NULL,'_611254',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7523a42c64d0b24fcbe4bda3d4b574e6','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,0,NULL,NULL,0,1610498072,1610498072,1610498072,'162.158.187.210','162.158.187.210',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,0,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0),(12,'Ari',NULL,'_332541',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'87df9781c43de74e9b4c3c2fe0230f51','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,0,NULL,NULL,0,1614598663,1614598663,1614598663,'162.158.122.183','162.158.122.183',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,0,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0),(13,'Ari81',NULL,'_970041',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'87df9781c43de74e9b4c3c2fe0230f51','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,0,NULL,NULL,0,1614598687,1614598687,1614598687,'162.158.122.184','162.158.122.184',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,0,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0),(14,'Alphap',NULL,'_986048',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'87df9781c43de74e9b4c3c2fe0230f51','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,0,NULL,NULL,0,1614598712,1614598712,1614598712,'162.158.122.183','162.158.122.183',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,0,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0),(15,'Taino29',NULL,'_743954',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'74624c171cebc43594434bb36e94eb48','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,0,NULL,NULL,0,1615143298,1615143298,1615143298,'162.158.187.177','162.158.187.177',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,0,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0),(16,'allison2816@gmail.com',NULL,'_556768',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ec2d4e2cdf77da89694ed921f6fa7a8c','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,0,NULL,NULL,0,1615172692,1615172692,1615172692,'108.162.237.132','108.162.237.132',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,0,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0),(17,'allison2816@hotmail.com',NULL,'_179845',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'658b300eebed51d69f1442ef75408408','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,0,NULL,NULL,0,1615172743,1615172743,1615172743,'108.162.237.132','108.162.237.132',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,0,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0),(18,'BrandysRoselis',NULL,'_668997',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'d2e7545cc730a92b1f2f7c02fbdc5770','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,0,NULL,NULL,0,1615836236,1615836236,1615836236,'162.158.123.5','162.158.123.5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,0,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0),(19,'Ivannia15',NULL,'_434971',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6fb42da0e32e07b61c9f0251fe627a9c','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,0,NULL,NULL,0,1615930071,1615930071,1615930071,'108.162.237.92','108.162.237.92',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,0,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0),(20,'Yamel',NULL,'_744380',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'cc8954d52bfd47b93456fdc9d1a4e34f','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,0,NULL,NULL,0,1616074410,1616074410,1616074410,'162.158.187.233','162.158.187.233',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,0,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0),(21,'Mpdr',NULL,'_723534',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'da7b4b22d4bc633110ea24687159efe8','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,0,NULL,NULL,0,1616262581,1616262581,1616262581,'108.162.210.128','108.162.210.128',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,0,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0),(22,'Scarlet',NULL,'_218833',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'e6957adedc3b50139f5dfcfc397ce788','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,0,NULL,NULL,0,1616446324,1616446324,1616446324,'172.69.170.62','172.69.170.62',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,0,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0),(23,'Scarletmarie1906@gmail.com',NULL,'_968589',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'e6957adedc3b50139f5dfcfc397ce788','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,0,NULL,NULL,0,1616446336,1616446336,1616446336,'172.69.170.62','172.69.170.62',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,0,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0),(24,'Fiordaliza',NULL,'_956651',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ea28d33ead8e0be4ed1d3a8f49f35aa1','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,0,NULL,NULL,0,1616509264,1616509264,1616509264,'172.68.141.140','172.68.141.140',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,0,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0),(25,'Jorgezheng',NULL,'_154189',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ccfd5d5b83a7c568f71a291129d6acbf','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,0,NULL,NULL,0,1616530831,1616530831,1616530831,'162.158.62.79','162.158.62.79',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,0,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0),(26,'Jorgezheng01',NULL,'_325527',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ccfd5d5b83a7c568f71a291129d6acbf','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,0,NULL,NULL,0,1616530836,1616530836,1616530836,'162.158.62.79','162.158.62.79',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,0,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0),(27,'18096032304',NULL,'_235078',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ccfd5d5b83a7c568f71a291129d6acbf','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,0,NULL,NULL,0,1617552784,1617552784,1617552784,'108.162.210.204','108.162.210.204',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,0,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0),(28,'19950612',NULL,'_328764',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ccfd5d5b83a7c568f71a291129d6acbf','e10adc3949ba59abbe56e057f20f883e',NULL,0,NULL,0,NULL,NULL,0,1617552797,1617552797,1617552797,'108.162.210.204','108.162.210.204',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,0,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0),(32,'Yome','Yome','Yome',0,'','','','','',0,NULL,'49a195acfd507403dcb2fe51593ed7a5','e10adc3949ba59abbe56e057f20f883e','297142955@qq.com',0,'',0,'','',0,1617654114,1617654114,1617654114,'108.162.210.244','108.162.210.244','',NULL,'',NULL,'',NULL,'',NULL,'','',NULL,0,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,'',NULL,0,NULL,0,0,0,0),(31,'jorge123','','jorge123',0,'','','','','',NULL,NULL,'ccfd5d5b83a7c568f71a291129d6acbf','e10adc3949ba59abbe56e057f20f883e','',0,'',0,'','',2,1617647891,1617654298,1617647891,'162.158.123.253','172.69.170.152','',NULL,'',NULL,'',NULL,'',NULL,'','',NULL,5,0.00,0.00,0.00,0.00,1,1,1,1,NULL,NULL,NULL,'',NULL,0,NULL,0,0,0,0);
/*!40000 ALTER TABLE `ds_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_memberbank`
--

DROP TABLE IF EXISTS `ds_memberbank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_memberbank` (
  `memberbank_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `memberbank_type` varchar(10) NOT NULL DEFAULT 'bank' COMMENT 'bank银行 alipay 支付宝收款',
  `memberbank_truename` varchar(20) NOT NULL COMMENT '收款方真实姓名',
  `memberbank_name` varchar(20) NOT NULL DEFAULT '' COMMENT '收款银行',
  `memberbank_no` varchar(30) NOT NULL COMMENT '收款银行卡号/支付宝账户',
  `member_id` int(11) NOT NULL COMMENT '所属用户id',
  PRIMARY KEY (`memberbank_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收款账户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_memberbank`
--

LOCK TABLES `ds_memberbank` WRITE;
/*!40000 ALTER TABLE `ds_memberbank` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_memberbank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_membermsgsetting`
--

DROP TABLE IF EXISTS `ds_membermsgsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_membermsgsetting` (
  `membermt_code` varchar(50) NOT NULL COMMENT '用户消息模板代码',
  `membermt_isreceive` tinyint(3) unsigned NOT NULL COMMENT '是否接收 1是，0否',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  PRIMARY KEY (`membermt_code`,`member_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户消息接收设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_membermsgsetting`
--

LOCK TABLES `ds_membermsgsetting` WRITE;
/*!40000 ALTER TABLE `ds_membermsgsetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_membermsgsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_membermsgtpl`
--

DROP TABLE IF EXISTS `ds_membermsgtpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_membermsgtpl` (
  `membermt_code` varchar(50) NOT NULL COMMENT '用户消息模板编号',
  `membermt_name` varchar(50) NOT NULL COMMENT '模板名称',
  `membermt_message_switch` tinyint(3) unsigned NOT NULL COMMENT '站内信接收开关',
  `membermt_message_content` varchar(255) NOT NULL COMMENT '站内信消息内容',
  `membermt_short_switch` tinyint(3) unsigned NOT NULL COMMENT '短信接收开关',
  `membermt_short_content` varchar(255) NOT NULL COMMENT '短信接收内容',
  `membermt_mail_switch` tinyint(3) unsigned NOT NULL COMMENT '邮件接收开关',
  `membermt_mail_subject` varchar(255) NOT NULL COMMENT '邮件标题',
  `membermt_mail_content` text NOT NULL COMMENT '邮件内容',
  `membermt_weixin_switch` tinyint(3) unsigned NOT NULL COMMENT '微信接收开关',
  `membermt_weixin_code` varchar(255) NOT NULL COMMENT '微信消息code',
  `ali_template_code` varchar(255) DEFAULT NULL COMMENT '阿里云短信模板ID',
  `ten_template_code` varchar(255) DEFAULT NULL COMMENT '腾讯云短信模板ID',
  PRIMARY KEY (`membermt_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户消息模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_membermsgtpl`
--

LOCK TABLES `ds_membermsgtpl` WRITE;
/*!40000 ALTER TABLE `ds_membermsgtpl` DISABLE KEYS */;
INSERT INTO `ds_membermsgtpl` VALUES ('arrival_notice','到货通知提醒',1,'您关注的商品 “${goods_name}” 已经到货。<a href=\"${goods_url}\" target=\"_blank\">点击查看商品</a>',1,'您关注的商品 “${goods_name}” 已经到货。',0,'${site_name}提醒：您关注的商品  “${goods_name}” 已经到货。','<p>\r\n	${site_name}提醒：\r\n</p>\r\n<p>\r\n	您关注的商品 “${goods_name}” 已经到货。\r\n</p>\r\n<p>\r\n	<a href=\"${goods_url}\" target=\"_blank\">点击查看商品</a> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${mail_send_time}\r\n</p>',0,'',NULL,NULL),('consult_goods_reply','商品咨询回复提醒',1,'您关于商品 “${goods_name}”的咨询，商家已经回复。<a href=\"${consult_url}\" target=\"_blank\">点击查看回复</a>',0,'您关于商品 “${goods_name}” 的咨询，商家已经回复。',0,'${site_name}提醒：您关于商品 “${goods_name}”的咨询，商家已经回复。','<p>\r\n	${site_name}提醒：\r\n</p>\r\n<p>\r\n	您关注的商品“${goods_name}” 已经到货。\r\n</p>\r\n<p>\r\n	<a href=\"${consult_url}\" target=\"_blank\">点击查看回复</a> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${mail_send_time}\r\n</p>\r\n<br />\r\n<div class=\"firebugResetStyles firebugBlockBackgroundColor\">\r\n	<div style=\"background-color:transparent ! important;\" class=\"firebugResetStyles\">\r\n	</div>\r\n</div>',0,'',NULL,NULL),('consult_mall_reply','平台客服回复提醒',1,'您的平台客服咨询已经回复。<a href=\"${consult_url}\" target=\"_blank\">点击查看回复</a>',0,'您的平台客服咨询已经回复。',0,'${site_name}提醒：您的平台客服咨询已经回复。','<p>\r\n	${site_name}提醒：\r\n</p>\r\n<p>\r\n	您的平台客服咨询已经回复。\r\n</p>\r\n<p>\r\n	<a href=\"${consult_url}\" target=\"_blank\">点击查看回复</a> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${mail_send_time}\r\n</p>',0,'',NULL,NULL),('order_deliver_success','商品出库提醒',1,'您的订单已经出库。<a href=\"${order_url}\" target=\"_blank\">点击查看订单</a>',1,'您的订单已经出库。订单编号 ${order_sn}。',0,'${site_name}提醒：您的订单已经出库。订单编号 ${order_sn}。','<p>\r\n	${site_name}提醒：\r\n</p>\r\n<p>\r\n	您的订单已经出库。订单编号 ${order_sn}。<br />\r\n<a href=\"${order_url}\" target=\"_blank\">点击查看订单</a>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${mail_send_time}\r\n</p>\r\n<br />',0,'',NULL,NULL),('order_payment_success','付款成功提醒',1,'关于订单：${order_sn}的款项已经收到，请留意出库通知。<a href=\"${order_url}\" target=\"_blank\">点击查看订单详情</a>',1,'${order_sn}的款项已经收到，请留意出库通知。',0,'${site_name}提醒：${order_sn}的款项已经收到，请留意出库通知。','<p>\r\n	${site_name}提醒：\r\n</p>\r\n<p>\r\n	${order_sn}的款项已经收到，请留意出库通知。\r\n</p>\r\n<p>\r\n	<a href=\"${order_url}\" target=\"_blank\">点击查看订单详情</a>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${mail_send_time}\r\n</p>\r\n<br />',0,'',NULL,NULL),('predeposit_change','余额变动提醒',1,'你的账户于 ${time} 账户资金有变化，描述：${desc}，可用金额变化 ：${av_amount}元，冻结金额变化：${freeze_amount}元。<a href=\"${pd_url}\" target=\"_blank\">点击查看余额</a>',0,'你的账户于 ${time} 账户资金有变化，描述：${desc}，可用金额变化： ${av_amount}元，冻结金额变化：${freeze_amount}元。',0,'${site_name}提醒：你的账户于 ${time} 账户资金有变化，描述：${desc}，可用金额变化： ${av_amount}元，冻结金额变化：${freeze_amount}元。','<p>\r\n	${site_name}提醒：\r\n</p>\r\n<p>\r\n	你的账户于 ${time} 账户资金有变化，描述：${desc}，可用金额变化：${av_amount}元，冻结金额变化：${freeze_amount}元。\r\n</p>\r\n<p>\r\n	<a href=\"${pd_url}\" target=\"_blank\">点击查看余额</a> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${mail_send_time}\r\n</p>',0,'',NULL,NULL),('recharge_card_balance_change','充值卡余额变动提醒',1,'你的账户于 ${time} 充值卡余额有变化，描述：${description}，可用充值卡余额变化 ：${available_amount}元，冻结充值卡余额变化：${freeze_amount}元。<a href=\"${url}\" target=\"_blank\">点击查看充值卡余额</a>',0,'你的账户于 ${time} 充值卡余额有变化，描述：${description}，可用充值卡余额变化： ${available_amount}元，冻结充值卡余额变化：${freeze_amount}元。',0,'${site_name}提醒：你的账户于 ${time} 充值卡余额有变化，描述：${description}，可用充值卡余额变化： ${available_amount}元，冻结充值卡余额变化：${freeze_amount}元。','<p>\r\n    ${site_name}提醒：\r\n</p>\r\n<p>\r\n  你的账户于 ${time} 充值卡余额有变化，描述：${description}，可用充值卡余额变化：${available_amount}元，冻结充值卡余额变化：${freeze_amount}元。\r\n</p>\r\n<p>\r\n  <a href=\"${url}\" target=\"_blank\">点击查看余额</a> \r\n</p>\r\n<p>\r\n  <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p>\r\n   <br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n ${site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n   ${mail_send_time}\r\n</p>',0,'',NULL,NULL),('refund_return_notice','退款退货提醒',1,'您的退款退货单有了变化。<a href=\"${refund_url}\" target=\"_blank\">点击查看</a>',1,'您的退款退货单有了变化。退款退货单编号：${refund_sn}。',0,'${site_name}提醒：您的退款退货单有了变化。','<p>\r\n	${site_name}提醒：\r\n</p>\r\n<p>\r\n	您的退款退货单有了变化。退款退货单编号：${refund_sn}。\r\n</p>\r\n<p>\r\n	&lt;a href=\"${refund_url}\" target=\"_blank\"&gt;点击查看&lt;/a&gt;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${mail_send_time}\r\n</p>\r\n<br />',0,'',NULL,NULL),('voucher_use','代金券使用提醒',1,'您有代金券已经使用，代金券编号：${voucher_code}。<a href=\"${voucher_url}\" target=\"_blank\">点击查看</a>',0,'您有代金券已经使用，代金券编号：${voucher_code}。',0,'${site_name}提醒：您有代金券已经使用，代金券编号：${voucher_code}。','<p>\r\n	${site_name}提醒：\r\n</p>\r\n<p>\r\n	您有代金券已经使用，代金券编号：${voucher_code}。\r\n</p>\r\n<p>\r\n	&lt;a href=\"${voucher_url}\" target=\"_blank\"&gt;点击查看&lt;/a&gt;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>',0,'',NULL,NULL),('voucher_will_expire','代金券即将到期提醒',1,'您有一个代金券即将在${indate}过期，请记得使用。<a href=\"${voucher_url}\" target=\"_blank\">点击查看</a>',0,'您有一个代金券即将在${indate}过期，请记得使用。',0,'${site_name}提醒：您有一个代金券即将在${indate}过期，请记得使用。','<p>\r\n	${site_name}提醒：\r\n</p>\r\n<p>\r\n	您有一个代金券即将在${indate}过期，请记得使用。\r\n</p>\r\n<p>\r\n	<a href=\"${voucher_url}\" target=\"_blank\">点击查看</a> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>',0,'',NULL,NULL),('vr_code_will_expire','兑换码即将到期提醒',1,'您有一组兑换码即将在${indate}过期，请记得使用。<a href=\"${vr_order_url}\" target=\"_blank\">点击查看</a>',0,'您有一组兑换码即将在${indate}过期，请记得使用。',0,'${site_name}提醒：您有一组兑换码即将在${indate}过期，请记得使用。','<p>\r\n	${site_name}提醒：\r\n</p>\r\n<p>\r\n	您有一组兑换码即将在${indate}过期，请记得使用。\r\n</p>\r\n<p>\r\n	&lt;a href=\"${vr_order_url}\" target=\"_blank\"&gt;点击查看&lt;/a&gt;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>',0,'',NULL,NULL);
/*!40000 ALTER TABLE `ds_membermsgtpl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_message`
--

DROP TABLE IF EXISTS `ds_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '短消息自增ID',
  `message_parent_id` int(11) NOT NULL COMMENT '回复短消息message_id',
  `from_member_id` int(11) NOT NULL COMMENT '短消息发送人',
  `to_member_id` varchar(1000) NOT NULL COMMENT '短消息接收人',
  `message_title` varchar(50) DEFAULT NULL COMMENT '短消息标题',
  `message_body` varchar(255) NOT NULL COMMENT '短消息内容',
  `message_time` varchar(10) NOT NULL COMMENT '短消息发送时间',
  `message_update_time` varchar(10) DEFAULT NULL COMMENT '短消息回复更新时间',
  `message_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '短消息打开状态',
  `message_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '短消息状态，0为正常状态，1为发送人删除状态，2为接收人删除状态',
  `message_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0为私信、1为系统消息、2为留言',
  `read_member_id` varchar(1000) DEFAULT NULL COMMENT '已经读过该消息的会员id',
  `del_member_id` varchar(1000) DEFAULT NULL COMMENT '已经删除该消息的会员id',
  `message_ismore` tinyint(1) NOT NULL DEFAULT '0' COMMENT '站内信是否为一条发给多个用户 0为否 1为多条 ',
  `from_member_name` varchar(100) DEFAULT NULL COMMENT '发信息人用户名',
  `to_member_name` varchar(100) DEFAULT NULL COMMENT '接收人用户名',
  PRIMARY KEY (`message_id`),
  KEY `from_member_id` (`from_member_id`),
  KEY `to_member_id` (`to_member_id`(255)),
  KEY `message_ismore` (`message_ismore`),
  KEY `message_parent_id` (`message_parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='短消息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_message`
--

LOCK TABLES `ds_message` WRITE;
/*!40000 ALTER TABLE `ds_message` DISABLE KEYS */;
INSERT INTO `ds_message` VALUES (1,0,0,'1',NULL,'你的账户于 2020-11-30 17:36:01 账户资金有变化，描述：充值，充值单号: 20112616371451798001，可用金额变化 ：1.00元，冻结金额变化：0.00元。<a href=\"/public/index.php/home/Predeposit/pd_log_list.html\" target=\"_blank\">点击查看余额</a>','1606728961','1606728961',0,0,1,'','',0,'',''),(2,0,0,'3',NULL,'你的账户于 2020-11-30 17:52:02 账户资金有变化，描述：充值，充值单号: 20113017485663035003，可用金额变化 ：100.00元，冻结金额变化：0.00元。<a href=\"/public/index.php/home/Predeposit/pd_log_list.html\" target=\"_blank\">点击查看余额</a>','1606729922','1606729922',0,0,1,'','',0,'',''),(3,0,0,'3',NULL,'你的账户于 2020-11-30 18:49:28 账户资金有变化，描述：下单，支付预存款，订单号: 3000000000000101，可用金额变化 ：-36.00元，冻结金额变化：0.00元。<a href=\"/public/index.php/home/Predeposit/pd_log_list.html\" target=\"_blank\">点击查看余额</a>','1606733368','1606733368',0,0,1,'','',0,'',''),(4,0,0,'3',NULL,'关于订单：3000000000000101的款项已经收到，请留意出库通知。<a href=\"/public/index.php/home/Memberorder/show_order.html?order_id=1\" target=\"_blank\">点击查看订单详情</a>','1606733368','1606733368',0,0,1,'','',0,'',''),(5,0,0,'3',NULL,'你的账户于 2020-12-01 15:28:05 账户资金有变化，描述：下单，支付预存款，订单号: 202012011528054808，可用金额变化 ：-36.00元，冻结金额变化：0.00元。<a href=\"/public/index.php/home/Predeposit/pd_log_list.html\" target=\"_blank\">点击查看余额</a>','1606807684','1606807684',0,0,1,'','',0,'',''),(6,0,0,'3',NULL,'关于订单：202012011528054808的款项已经收到，请留意出库通知。<a href=\"/public/index.php/home/Memberorder/show_order.html?order_id=2\" target=\"_blank\">点击查看订单详情</a>','1606807684','1606807684',0,0,1,'','',0,'',''),(7,0,0,'3',NULL,'您的订单已经出库。<a href=\"/public/index.php/home/Memberorder/show_order.html?order_id=2\" target=\"_blank\">点击查看订单</a>','1606894646','1606894646',0,0,1,'','',0,'',''),(8,0,0,'3',NULL,'您的订单已经出库。<a href=\"/public/index.php/home/Memberorder/show_order.html?order_id=2\" target=\"_blank\">点击查看订单</a>','1606897612','1606897612',0,0,1,'','',0,'',''),(9,0,0,'3',NULL,'您的订单已经出库。<a href=\"/public/index.php/home/Memberorder/show_order.html?order_id=2\" target=\"_blank\">点击查看订单</a>','1606898128','1606898128',0,0,1,'','',0,'',''),(10,0,0,'3',NULL,'你的账户于 2020-12-05 17:30:06 账户资金有变化，描述：下单，冻结预存款，订单号: 202012051730066624，可用金额变化 ：-64.00元，冻结金额变化：64.00元。<a href=\"/public/index.php/home/Predeposit/pd_log_list.html\" target=\"_blank\">点击查看余额</a>','1607160606','1607160606',0,0,1,'','',0,'',''),(11,0,0,'3',NULL,'你的账户于 2020-12-05 17:35:54 账户资金有变化，描述：充值，充值单号: 20120517351085829003，可用金额变化 ：10000.00元，冻结金额变化：0.00元。<a href=\"/public/index.php/home/Predeposit/pd_log_list.html\" target=\"_blank\">点击查看余额</a>','1607160954','1607160954',0,0,1,'','',0,'',''),(12,0,0,'3',NULL,'你的账户于 2020-12-05 17:39:04 账户资金有变化，描述：下单，支付预存款，订单号: 202012051739047836，可用金额变化 ：-399.00元，冻结金额变化：0.00元。<a href=\"/public/index.php/home/Predeposit/pd_log_list.html\" target=\"_blank\">点击查看余额</a>','1607161144','1607161144',0,0,1,'','',0,'',''),(13,0,0,'3',NULL,'关于订单：202012051739047836的款项已经收到，请留意出库通知。<a href=\"/public/index.php/home/Memberorder/show_order.html?order_id=5\" target=\"_blank\">点击查看订单详情</a>','1607161144','1607161144',0,0,1,'','',0,'',''),(14,0,0,'3',NULL,'你的账户于 2020-12-05 17:41:05 账户资金有变化，描述：取消订单，解冻预存款，订单号: 202012051730066624，可用金额变化 ：64.00元，冻结金额变化：-64.00元。<a href=\"/public/index.php/home/Predeposit/pd_log_list.html\" target=\"_blank\">点击查看余额</a>','1607161265','1607161265',0,0,1,'','',0,'',''),(15,0,0,'3',NULL,'您的订单已经出库。<a href=\"/public/index.php/home/Memberorder/show_order.html?order_id=5\" target=\"_blank\">点击查看订单</a>','1607161290','1607161290',0,0,1,'','',0,'',''),(16,0,0,'3',NULL,'你的账户于 2020-12-22 17:17:30 账户资金有变化，描述：下单，支付预存款，订单号: 202012221717303805，可用金额变化 ：-36.00元，冻结金额变化：0.00元。<a href=\"/public/index.php/home/Predeposit/pd_log_list.html\" target=\"_blank\">点击查看余额</a>','1608628650','1608628650',0,0,1,'','',0,'',''),(17,0,0,'3',NULL,'关于订单：202012221717303805的款项已经收到，请留意出库通知。<a href=\"/public/index.php/home/Memberorder/show_order.html?order_id=11\" target=\"_blank\">点击查看订单详情</a>','1608628650','1608628650',0,0,1,'','',0,'',''),(18,0,0,'3',NULL,'你的账户于 2020-12-22 17:30:05 账户资金有变化，描述：下单，支付预存款，订单号: 202012221730055546，可用金额变化 ：-79.00元，冻结金额变化：0.00元。<a href=\"/public/index.php/home/Predeposit/pd_log_list.html\" target=\"_blank\">点击查看余额</a>','1608629405','1608629405',0,0,1,'','',0,'',''),(19,0,0,'3',NULL,'关于订单：202012221730055546的款项已经收到，请留意出库通知。<a href=\"/public/index.php/home/Memberorder/show_order.html?order_id=12\" target=\"_blank\">点击查看订单详情</a>','1608629405','1608629405',0,0,1,'','',0,'',''),(20,0,0,'3',NULL,'关于订单：202012221742331142的款项已经收到，请留意出库通知。<a href=\"/public/index.php/home/Memberorder/show_order.html?order_id=13\" target=\"_blank\">点击查看订单详情</a>','1608708061','1608708061',0,0,1,'','',0,'',''),(21,0,0,'3',NULL,'您的订单已经出库。<a href=\"/public/index.php/home/Memberorder/show_order.html?order_id=13\" target=\"_blank\">点击查看订单</a>','1609898327','1609898327',0,0,1,'','',0,'',''),(22,0,0,'3',NULL,'您的订单已经出库。<a href=\"/public/index.php/home/Memberorder/show_order.html?order_id=12\" target=\"_blank\">点击查看订单</a>','1609898345','1609898345',0,0,1,'','',0,'',''),(23,0,0,'3',NULL,'你的账户于 2021-01-09 16:18:40 账户资金有变化，描述：下单，支付预存款，订单号: 202101091618408848，可用金额变化 ：-36.00元，冻结金额变化：0.00元。<a href=\"/public/index.php/home/Predeposit/pd_log_list.html\" target=\"_blank\">点击查看余额</a>','1610180320','1610180320',0,0,1,'','',0,'',''),(24,0,0,'3',NULL,'关于订单：202101091618408848的款项已经收到，请留意出库通知。<a href=\"/public/index.php/home/Memberorder/show_order.html?order_id=16\" target=\"_blank\">点击查看订单详情</a>','1610180320','1610180320',0,0,1,'','',0,'',''),(25,0,0,'3',NULL,'你的账户于 2021-01-09 16:37:00 账户资金有变化，描述：下单，支付预存款，订单号: 202101091637004659，可用金额变化 ：-36.00元，冻结金额变化：0.00元。<a href=\"/public/index.php/home/Predeposit/pd_log_list.html\" target=\"_blank\">点击查看余额</a>','1610181420','1610181420',0,0,1,'','',0,'',''),(26,0,0,'3',NULL,'关于订单：202101091637004659的款项已经收到，请留意出库通知。<a href=\"/public/index.php/home/Memberorder/show_order.html?order_id=17\" target=\"_blank\">点击查看订单详情</a>','1610181420','1610181420',0,0,1,'','',0,'','');
/*!40000 ALTER TABLE `ds_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_minipro_live`
--

DROP TABLE IF EXISTS `ds_minipro_live`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_minipro_live` (
  `minipro_live_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `minipro_live_name` varchar(60) NOT NULL COMMENT '直播间名称',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `minipro_live_wxid` varchar(60) NOT NULL COMMENT '微信号',
  `minipro_live_nickname` varchar(60) NOT NULL COMMENT '微信昵称',
  `minipro_live_start_time` int(10) unsigned NOT NULL COMMENT '开始时间',
  `minipro_live_end_time` int(10) unsigned NOT NULL COMMENT '结束时间',
  `minipro_live_image` varchar(60) NOT NULL COMMENT '封面图地址',
  `minipro_live_add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `minipro_live_room_id` int(10) unsigned NOT NULL COMMENT '直播间id',
  `minipro_live_video` text NOT NULL COMMENT '回放视频',
  PRIMARY KEY (`minipro_live_id`),
  KEY `member_id` (`member_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='小程序直播';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_minipro_live`
--

LOCK TABLES `ds_minipro_live` WRITE;
/*!40000 ALTER TABLE `ds_minipro_live` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_minipro_live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_minipro_live_goods`
--

DROP TABLE IF EXISTS `ds_minipro_live_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_minipro_live_goods` (
  `minipro_live_goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `store_name` varchar(60) NOT NULL COMMENT '店铺名称',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共id',
  `goods_name` varchar(255) NOT NULL COMMENT '商品名称',
  `goods_image` varchar(255) NOT NULL COMMENT '商品图片',
  `goods_price` decimal(10,2) unsigned NOT NULL COMMENT '商品价格',
  `minipro_live_goods_add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `minipro_live_goods_state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `minipro_live_goods_result_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '直播商品id',
  `minipro_live_goods_verify_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '直播商品审核id',
  `minipro_live_goods_close` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '关闭',
  PRIMARY KEY (`minipro_live_goods_id`),
  KEY `store_id` (`store_id`),
  KEY `minipro_live_goods_result_id` (`minipro_live_goods_result_id`),
  KEY `goods_id` (`goods_id`),
  KEY `goods_commonid` (`goods_commonid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='小程序直播商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_minipro_live_goods`
--

LOCK TABLES `ds_minipro_live_goods` WRITE;
/*!40000 ALTER TABLE `ds_minipro_live_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_minipro_live_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_minipro_live_room_goods`
--

DROP TABLE IF EXISTS `ds_minipro_live_room_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_minipro_live_room_goods` (
  `minipro_live_room_goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `minipro_live_id` int(10) unsigned NOT NULL COMMENT '直播间id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `store_name` varchar(60) NOT NULL COMMENT '店铺名称',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共id',
  `goods_name` varchar(255) NOT NULL COMMENT '商品名称',
  `goods_image` varchar(255) NOT NULL COMMENT '商品图片',
  `goods_price` decimal(10,2) unsigned NOT NULL COMMENT '商品价格',
  `minipro_live_goods_result_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '直播商品id',
  `gc_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品分类',
  `gc_id_1` int(10) unsigned DEFAULT '0' COMMENT '一级分类id',
  `gc_id_2` int(10) unsigned DEFAULT '0' COMMENT '二级分类id',
  `gc_id_3` int(10) unsigned DEFAULT '0' COMMENT '三级分类id',
  `gc_name` varchar(200) NOT NULL DEFAULT '' COMMENT '商品分类',
  PRIMARY KEY (`minipro_live_room_goods_id`),
  KEY `store_id` (`store_id`),
  KEY `minipro_live_goods_result_id` (`minipro_live_goods_result_id`),
  KEY `goods_id` (`goods_id`),
  KEY `goods_commonid` (`goods_commonid`),
  KEY `gc_id` (`gc_id`),
  KEY `gc_id_1` (`gc_id_1`),
  KEY `gc_id_2` (`gc_id_2`),
  KEY `gc_id_3` (`gc_id_3`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='小程序直播商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_minipro_live_room_goods`
--

LOCK TABLES `ds_minipro_live_room_goods` WRITE;
/*!40000 ALTER TABLE `ds_minipro_live_room_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_minipro_live_room_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_navigation`
--

DROP TABLE IF EXISTS `ds_navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_navigation` (
  `nav_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '页面导航自增ID',
  `nav_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '页面导航类别，0自定义导航，1商品分类，2文章导航，3活动导航，默认为0',
  `nav_title` varchar(100) DEFAULT NULL COMMENT '页面导航标题',
  `nav_url` varchar(255) DEFAULT NULL COMMENT '页面导航链接',
  `nav_location` varchar(10) NOT NULL COMMENT '页面导航位置，header头部，middle中部，footer底部',
  `nav_new_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否以新窗口打开，0为否，1为是，默认为0',
  `nav_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '页面导航排序',
  `item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '页面导航类别ID，对应着nav_type中的内容，默认为0',
  `nav_is_close` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否前台显示，0为否，1为是，默认为1',
  PRIMARY KEY (`nav_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='页面导航表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_navigation`
--

LOCK TABLES `ds_navigation` WRITE;
/*!40000 ALTER TABLE `ds_navigation` DISABLE KEYS */;
INSERT INTO `ds_navigation` VALUES (7,0,'Vales','https://shops.domibuy.com/public/index.php/home/Pointvoucher/index.html','middle',0,24,0,0),(11,0,'关于我们','https://shops.domibuy.com/public/index.php/home/Index/index.html','footer',1,255,0,0),(12,0,'联系我们','https://shops.domibuy.com/public/index.php/home/Index/index.html','footer',1,255,0,0),(13,0,'友情链接','https://shops.domibuy.com/public/index.php/home/Index/index.html','footer',1,255,0,0),(14,0,'商城公益','https://shops.domibuy.com/public/index.php/home/Index/index.html','footer',1,255,0,0),(15,0,'商城社区','https://shops.domibuy.com/public/index.php/home/Index/index.html','footer',1,255,0,0),(16,0,'营销中心','https://shops.domibuy.com/public/index.php/home/Index/index.html','footer',1,255,0,0);
/*!40000 ALTER TABLE `ds_navigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_offpayarea`
--

DROP TABLE IF EXISTS `ds_offpayarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_offpayarea` (
  `store_id` int(8) unsigned NOT NULL COMMENT '商家ID',
  `area_id` text COMMENT '县ID组合',
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='货到付款支持地区表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_offpayarea`
--

LOCK TABLES `ds_offpayarea` WRITE;
/*!40000 ALTER TABLE `ds_offpayarea` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_offpayarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_order`
--

DROP TABLE IF EXISTS `ds_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单自增id',
  `order_sn` varchar(20) NOT NULL COMMENT '订单编号',
  `pay_sn` varchar(20) NOT NULL COMMENT '支付单号',
  `store_id` int(11) unsigned NOT NULL COMMENT '卖家店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '卖家店铺名称',
  `buyer_id` int(11) unsigned NOT NULL COMMENT '买家ID',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家姓名',
  `buyer_email` varchar(80) DEFAULT NULL COMMENT '买家电子邮箱',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单生成时间',
  `payment_code` char(20) NOT NULL DEFAULT '' COMMENT '支付方式名称代码',
  `payment_time` int(10) unsigned DEFAULT '0' COMMENT '支付(付款)时间',
  `trade_no` varchar(255) NOT NULL DEFAULT '' COMMENT '第三方平台交易号，或银行转账交易号',
  `confirm_trade_no` varchar(255) NOT NULL DEFAULT '' COMMENT '平台确认第三方平台交易号，或银行转账交易号',
  `finnshed_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单完成时间',
  `goods_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品总价格',
  `order_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价格',
  `rcb_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '充值卡支付金额',
  `pd_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '预存款支付金额',
  `shipping_fee` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '运费',
  `evaluation_state` tinyint(4) DEFAULT '0' COMMENT '评价状态 0：未评价 1：已评价 2:已过期未评价',
  `order_state` tinyint(4) NOT NULL DEFAULT '10' COMMENT '订单状态：0:已取消 10:未付款 20:待发货 30:已发货 35:待自提 40:已收货',
  `refund_state` tinyint(1) unsigned DEFAULT '0' COMMENT '退款状态 0:无退款 1:部分退款 2:全部退款',
  `lock_state` tinyint(1) unsigned DEFAULT '0' COMMENT '锁定状态:0:正常,大于0:锁定',
  `delete_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态 0:未删除 1:放入回收站 2:彻底删除',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `delay_time` int(10) unsigned DEFAULT '0' COMMENT '延迟时间,默认为0',
  `order_from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单来源，1:PC 2:手机',
  `shipping_code` varchar(50) DEFAULT '' COMMENT '订单物流单号',
  `order_type` tinyint(4) DEFAULT NULL COMMENT '订单类型',
  `ob_no` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '相关结算单号',
  PRIMARY KEY (`order_id`),
  KEY `store_id` (`store_id`),
  KEY `buyer_id` (`buyer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_order`
--

LOCK TABLES `ds_order` WRITE;
/*!40000 ALTER TABLE `ds_order` DISABLE KEYS */;
INSERT INTO `ds_order` VALUES (2,'202012011528054808','20120115280402457003',1,'官方自营店铺',3,'ceshi123',NULL,1606807684,'predeposit',1606807684,'','',1606981945,36.00,36.00,0.00,36.00,0.00,1,40,0,0,0,0.00,1606898128,1,'',NULL,0),(3,'202012042118532286','20120421185390563003',1,'官方自营店铺',3,'ceshi123',NULL,1607087933,'online',0,'','',0,45.00,45.00,0.00,0.00,0.00,0,0,0,0,0,0.00,0,1,'',NULL,0),(4,'202012051730066624','20120517300625531003',1,'官方自营店铺',3,'ceshi123',NULL,1607160606,'online',0,'','',0,500.00,500.00,0.00,0.00,0.00,0,0,0,0,0,0.00,0,1,'',NULL,0),(5,'202012051739047836','20120517390457874003',1,'官方自营店铺',3,'ceshi123',NULL,1607161144,'predeposit',1607161144,'','',1607162887,399.00,399.00,0.00,399.00,0.00,1,40,0,0,0,0.00,1607161290,1,'',NULL,0),(6,'202012071134332412','20120711343340697005',1,'官方自营店铺',5,'WANGYU',NULL,1607312073,'online',0,'','',0,1096.00,1096.00,0.00,0.00,0.00,0,0,0,0,1,0.00,0,1,'',NULL,0),(7,'202012071159009908','20120711590016953005',1,'官方自营店铺',5,'WANGYU',NULL,1607313540,'online',0,'','',0,2290.00,2290.00,0.00,0.00,0.00,0,0,0,0,1,0.00,0,1,'',NULL,0),(8,'202012071204268168','20120712042616850005',1,'官方自营店铺',5,'WANGYU',NULL,1607313866,'online',0,'','',0,2099.00,2099.00,0.00,0.00,0.00,0,0,0,0,1,0.00,0,1,'',NULL,0),(9,'202012221557442281','20122215574465515003',1,'官方自营店铺',3,'ceshi123',NULL,1608623864,'bankpay',0,'','',0,36.00,36.00,0.00,0.00,0.00,0,0,0,0,0,0.00,0,1,'',NULL,0),(10,'202012221715276233','20122217152743324003',1,'官方自营店铺',3,'ceshi123',NULL,1608628527,'bankpay',0,'','',0,36.00,36.00,0.00,0.00,0.00,0,0,0,0,0,0.00,0,1,'',NULL,0),(11,'202012221717303805','20122217173069367003',1,'官方自营店铺',3,'ceshi123',NULL,1608628650,'predeposit',1608628650,'','',0,36.00,36.00,0.00,36.00,0.00,0,20,0,0,0,0.00,0,1,'',NULL,0),(12,'202012221730055546','20122217300592231003',1,'官方自营店铺',3,'ceshi123',NULL,1608629405,'predeposit',1608629405,'','',0,79.00,79.00,0.00,79.00,0.00,0,30,0,0,0,0.00,1609898345,1,'',NULL,0),(13,'202012221742331142','20122217423339940003',1,'官方自营店铺',3,'ceshi123',NULL,1608630153,'bankpay',1608652800,'4658998813346','4658998813346',1609898380,89.00,89.00,0.00,0.00,0.00,1,40,0,0,0,0.00,1609898327,1,'',NULL,0),(14,'202012311414046880','20123114140451192006',1,'官方自营店铺',6,'duomitxt',NULL,1609395244,'bankpay',0,'45456568989878565656','',0,39.00,39.00,0.00,0.00,0.00,0,0,0,0,0,0.00,0,1,'',NULL,0),(18,'202101091646198447','21010916461912894003',1,'官方自营店铺',3,'ceshi123','',1610181979,'bankpay',0,'','',0,695.00,695.00,0.00,0.00,0.00,0,0,0,0,0,0.00,0,2,'',NULL,0),(17,'202101091637004659','21010916370031418003',1,'官方自营店铺',3,'ceshi123','',1610181420,'predeposit',1610181420,'','',0,36.00,36.00,0.00,36.00,0.00,0,20,0,0,0,0.00,0,2,'',NULL,0),(25,'202104051153484198','21040511534700299003',1,'官方自营店铺',3,'ceshi123',NULL,1617594827,'bankpay',0,'123456','',0,139.00,139.00,0.00,0.00,0.00,0,10,0,0,0,0.00,0,1,'',NULL,0),(26,'202104060550163128','21040605501530735031',1,'官方自营店铺',31,'jorge123',NULL,1617659415,'bankpay',0,'','',0,400.00,400.00,0.00,0.00,0.00,0,10,0,0,0,0.00,0,1,'',NULL,0),(24,'202104051148295182','21040511482857138003',1,'官方自营店铺',3,'ceshi123',NULL,1617594508,'bankpay',0,'123456789','',0,139.00,139.00,0.00,0.00,0.00,0,10,0,0,0,0.00,0,1,'',NULL,0);
/*!40000 ALTER TABLE `ds_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_orderbill`
--

DROP TABLE IF EXISTS `ds_orderbill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_orderbill` (
  `ob_no` int(11) NOT NULL AUTO_INCREMENT COMMENT '结算单编号(年月店铺ID)',
  `ob_startdate` int(11) NOT NULL COMMENT '开始日期',
  `ob_enddate` int(11) NOT NULL COMMENT '结束日期',
  `ob_order_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '结算订单金额',
  `ob_shipping_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '结算运费',
  `ob_order_return_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '结算退单金额',
  `ob_commis_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '结算佣金金额',
  `ob_commis_return_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '结算退还佣金',
  `ob_store_cost_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺促销活动费用',
  `ob_vr_order_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '虚拟订单金额',
  `ob_vr_order_return_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '虚拟订单退款金额',
  `ob_vr_commis_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '虚拟佣金金额',
  `ob_vr_commis_return_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '虚拟退还佣金金额',
  `ob_vr_inviter_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '虚拟分销佣金金额',
  `ob_result_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应结金额',
  `ob_createdate` int(11) DEFAULT '0' COMMENT '生成结算单日期',
  `ob_state` enum('1','2','3','4') DEFAULT '1' COMMENT '结算状态 1，默认2，店家已确认3，平台已审核4，结算完成',
  `ob_store_id` int(11) NOT NULL COMMENT '店铺ID',
  `ob_store_name` varchar(50) DEFAULT NULL COMMENT '店铺名',
  `ob_inviter_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '分销的佣金',
  `ob_seller_content` varchar(255) NOT NULL DEFAULT '' COMMENT '商家备注',
  `ob_admin_content` varchar(255) NOT NULL DEFAULT '' COMMENT '管理员备注',
  PRIMARY KEY (`ob_no`),
  KEY `ob_store_id` (`ob_store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='结算表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_orderbill`
--

LOCK TABLES `ds_orderbill` WRITE;
/*!40000 ALTER TABLE `ds_orderbill` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_orderbill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_ordercommon`
--

DROP TABLE IF EXISTS `ds_ordercommon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_ordercommon` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `shipping_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配送时间',
  `shipping_express_id` tinyint(1) NOT NULL DEFAULT '0' COMMENT '配送公司ID',
  `evaluation_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评价时间',
  `evalseller_state` enum('0','1') NOT NULL DEFAULT '0' COMMENT '卖家是否已评价买家',
  `evalseller_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '卖家评价买家的时间',
  `order_message` varchar(300) DEFAULT NULL COMMENT '订单留言',
  `order_pointscount` int(11) NOT NULL DEFAULT '0' COMMENT '订单赠送积分',
  `voucher_price` int(11) DEFAULT NULL COMMENT '代金券面额',
  `voucher_code` varchar(32) DEFAULT NULL COMMENT '代金券编码',
  `deliver_explain` text COMMENT '订单发货备注',
  `daddress_id` mediumint(9) NOT NULL DEFAULT '0' COMMENT '发货地址ID',
  `reciver_name` varchar(50) NOT NULL COMMENT '收货人姓名',
  `reciver_info` varchar(500) NOT NULL COMMENT '收货人其它信息',
  `reciver_province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '收货人省级ID',
  `reciver_city_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '收货人市级ID',
  `invoice_info` varchar(500) DEFAULT NULL COMMENT '订单发票信息',
  `promotion_info` varchar(500) DEFAULT NULL COMMENT '订单促销信息备注',
  PRIMARY KEY (`order_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='订单信息扩展表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_ordercommon`
--

LOCK TABLES `ds_ordercommon` WRITE;
/*!40000 ALTER TABLE `ds_ordercommon` DISABLE KEYS */;
INSERT INTO `ds_ordercommon` VALUES (2,1,1606898128,0,1606982120,'0',0,'',4,NULL,NULL,'',0,'测试2','a:7:{s:7:\"address\";s:25:\" 国外地址国外地址\";s:5:\"phone\";s:11:\"13800000130\";s:4:\"area\";N;s:6:\"street\";s:24:\"国外地址国外地址\";s:9:\"mob_phone\";s:11:\"13800000130\";s:9:\"tel_phone\";s:0:\"\";s:5:\"chain\";N;}',0,0,NULL,NULL),(3,1,0,0,0,'0',0,'',0,NULL,NULL,NULL,0,'测试2','a:6:{s:5:\"phone\";s:11:\"13800000130\";s:9:\"mob_phone\";s:11:\"13800000130\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:25:\" 国外地址国外地址\";s:4:\"area\";s:0:\"\";s:6:\"street\";s:24:\"国外地址国外地址\";}',0,0,NULL,NULL),(4,1,0,0,0,'0',0,'请尽快发货',0,NULL,NULL,NULL,0,'测试2','a:6:{s:5:\"phone\";s:11:\"13800000130\";s:9:\"mob_phone\";s:11:\"13800000130\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:25:\" 国外地址国外地址\";s:4:\"area\";s:0:\"\";s:6:\"street\";s:24:\"国外地址国外地址\";}',0,0,NULL,NULL),(5,1,1607161290,0,1607309081,'0',0,'请尽快发货',4,NULL,NULL,'收到货后请确认收货谢谢！',0,'测试','a:7:{s:7:\"address\";s:13:\" 测试地区\";s:5:\"phone\";s:11:\"13813813800\";s:4:\"area\";N;s:6:\"street\";s:12:\"测试地区\";s:9:\"mob_phone\";s:11:\"13813813800\";s:9:\"tel_phone\";s:0:\"\";s:5:\"chain\";N;}',0,0,NULL,NULL),(6,1,0,0,0,'0',0,'',0,NULL,NULL,NULL,0,'wangyu','a:6:{s:5:\"phone\";s:11:\"18000000000\";s:9:\"mob_phone\";s:11:\"18000000000\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:19:\" 北京市北京区\";s:4:\"area\";s:0:\"\";s:6:\"street\";s:18:\"北京市北京区\";}',0,0,NULL,NULL),(7,1,0,0,0,'0',0,'',0,NULL,NULL,NULL,0,'wangyu','a:6:{s:5:\"phone\";s:11:\"18000000000\";s:9:\"mob_phone\";s:11:\"18000000000\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:19:\" 北京市北京区\";s:4:\"area\";s:0:\"\";s:6:\"street\";s:18:\"北京市北京区\";}',0,0,NULL,NULL),(8,1,0,0,0,'0',0,'',0,NULL,NULL,NULL,0,'wangyu','a:6:{s:5:\"phone\";s:11:\"18000000000\";s:9:\"mob_phone\";s:11:\"18000000000\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:19:\" 北京市北京区\";s:4:\"area\";s:0:\"\";s:6:\"street\";s:18:\"北京市北京区\";}',0,0,NULL,NULL),(9,1,0,0,0,'0',0,'',0,NULL,NULL,NULL,0,'测试2','a:6:{s:5:\"phone\";s:11:\"13800000130\";s:9:\"mob_phone\";s:11:\"13800000130\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:25:\" 国外地址国外地址\";s:4:\"area\";s:0:\"\";s:6:\"street\";s:24:\"国外地址国外地址\";}',0,0,NULL,NULL),(10,1,0,0,0,'0',0,'',0,NULL,NULL,NULL,0,'测试2','a:6:{s:5:\"phone\";s:11:\"13800000130\";s:9:\"mob_phone\";s:11:\"13800000130\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:25:\" 国外地址国外地址\";s:4:\"area\";s:0:\"\";s:6:\"street\";s:24:\"国外地址国外地址\";}',0,0,NULL,NULL),(11,1,0,0,0,'0',0,'',0,NULL,NULL,NULL,0,'测试2','a:6:{s:5:\"phone\";s:11:\"13800000130\";s:9:\"mob_phone\";s:11:\"13800000130\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:25:\" 国外地址国外地址\";s:4:\"area\";s:0:\"\";s:6:\"street\";s:24:\"国外地址国外地址\";}',0,0,NULL,NULL),(12,1,1609898345,0,0,'0',0,'',0,NULL,NULL,'',0,'测试2','a:7:{s:7:\"address\";s:25:\" 国外地址国外地址\";s:5:\"phone\";s:11:\"13800000130\";s:4:\"area\";N;s:6:\"street\";s:24:\"国外地址国外地址\";s:9:\"mob_phone\";s:11:\"13800000130\";s:9:\"tel_phone\";s:0:\"\";s:5:\"chain\";N;}',0,0,NULL,NULL),(13,1,1609898327,0,1609898419,'0',0,'',4,NULL,NULL,'',0,'测试2','a:7:{s:7:\"address\";s:25:\" 国外地址国外地址\";s:5:\"phone\";s:11:\"13800000130\";s:4:\"area\";N;s:6:\"street\";s:24:\"国外地址国外地址\";s:9:\"mob_phone\";s:11:\"13800000130\";s:9:\"tel_phone\";s:0:\"\";s:5:\"chain\";N;}',0,0,NULL,NULL),(14,1,0,0,0,'0',0,'',0,NULL,NULL,NULL,0,'duomitxt','a:6:{s:5:\"phone\";s:11:\"13000000000\";s:9:\"mob_phone\";s:11:\"13000000000\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:13:\" 北京北京\";s:4:\"area\";s:0:\"\";s:6:\"street\";s:12:\"北京北京\";}',0,0,NULL,NULL),(17,1,0,0,0,'0',0,'测试备注',0,NULL,NULL,NULL,0,'测试2','a:6:{s:5:\"phone\";s:11:\"13800000130\";s:9:\"mob_phone\";s:11:\"13800000130\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:25:\" 国外地址国外地址\";s:4:\"area\";s:0:\"\";s:6:\"street\";s:24:\"国外地址国外地址\";}',0,0,NULL,NULL),(18,1,0,0,0,'0',0,'备注备注',0,NULL,NULL,NULL,0,'测试2','a:6:{s:5:\"phone\";s:11:\"13800000130\";s:9:\"mob_phone\";s:11:\"13800000130\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:25:\" 国外地址国外地址\";s:4:\"area\";s:0:\"\";s:6:\"street\";s:24:\"国外地址国外地址\";}',0,0,NULL,NULL),(25,1,0,0,0,'0',0,'',0,NULL,NULL,NULL,0,'测试2','a:6:{s:5:\"phone\";s:11:\"13800000130\";s:9:\"mob_phone\";s:11:\"13800000130\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:25:\" 国外地址国外地址\";s:4:\"area\";s:0:\"\";s:6:\"street\";s:24:\"国外地址国外地址\";}',0,0,NULL,NULL),(26,1,0,0,0,'0',0,'',0,NULL,NULL,NULL,0,'jorge','a:6:{s:5:\"phone\";s:23:\"18096032304,18096032304\";s:9:\"mob_phone\";s:11:\"18096032304\";s:9:\"tel_phone\";s:11:\"18096032304\";s:7:\"address\";s:13:\" jose mari 84\";s:4:\"area\";s:0:\"\";s:6:\"street\";s:12:\"jose mari 84\";}',0,0,NULL,NULL),(24,1,0,0,0,'0',0,'',0,NULL,NULL,NULL,0,'测试2','a:6:{s:5:\"phone\";s:11:\"13800000130\";s:9:\"mob_phone\";s:11:\"13800000130\";s:9:\"tel_phone\";s:0:\"\";s:7:\"address\";s:25:\" 国外地址国外地址\";s:4:\"area\";s:0:\"\";s:6:\"street\";s:24:\"国外地址国外地址\";}',0,0,NULL,NULL);
/*!40000 ALTER TABLE `ds_ordercommon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_ordergoods`
--

DROP TABLE IF EXISTS `ds_ordergoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_ordergoods` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单商品表自增ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `chain_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '门店ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(200) NOT NULL DEFAULT '' COMMENT '商品名称',
  `option_name` varchar(255) NOT NULL DEFAULT '' COMMENT '规格名称',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '商品数量',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `goods_pay_price` decimal(10,2) unsigned NOT NULL COMMENT '商品实际成交价',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '买家ID',
  `goods_type` enum('1','2','3','4','5','6','7','8','9') NOT NULL DEFAULT '1' COMMENT '1默认2抢购商品3限时折扣商品4组合套装5赠品6拼团7会员等级折扣8砍价9批发',
  `promotions_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '促销活动ID（抢购ID/限时折扣ID/优惠套装ID）与goods_type搭配使用',
  `commis_rate` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '佣金比例',
  `gc_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品最底级分类ID',
  PRIMARY KEY (`rec_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='订单商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_ordergoods`
--

LOCK TABLES `ds_ordergoods` WRITE;
/*!40000 ALTER TABLE `ds_ordergoods` DISABLE KEYS */;
INSERT INTO `ds_ordergoods` VALUES (2,2,0,123,'景德镇陶瓷花瓶摆件客厅装饰品摆设中式家居新房装饰品酒柜摆件','',36.00,1,'1_2017092902182426089.jpg',36.00,1,3,'1',0,0,69),(3,3,0,121,'拜斯特台式放大镜带LED灯10倍20倍老人阅读电子检验钟表手机维修','',45.00,1,'1_2017092902123493954.jpg',45.00,1,3,'1',0,0,68),(4,4,0,115,'上海名古智能家居别墅智能正品控制系统家庭影院装修设计上门安装','',500.00,1,'1_2017092901470136191.jpg',500.00,1,3,'1',0,0,73),(5,5,0,85,'铨聚臭氧发生器果蔬解毒杀菌洗菜多功能负离子活氧净化消毒机家用','',399.00,1,'1_2017092900115721538.jpg',399.00,1,3,'1',0,0,21),(6,6,0,63,'迈克.科尔斯(Michael Kors/MK)小号女包手提单肩斜跨包','',1096.00,1,'1_2017092203371485168.jpg',1096.00,1,5,'1',0,0,47),(7,7,0,24,'佳能(Canon) EOS M10 微单套机','',2290.00,1,'1_2017092201084565859.jpg',2290.00,1,5,'1',0,0,24),(8,8,0,71,'uoluo特价21 22 24 32 40 42 50 55寸60智能wifi网络小液晶电视机 50','',2099.00,1,'1_2017092821585013652.jpg',2099.00,1,5,'1',0,0,5),(9,9,0,123,'景德镇陶瓷花瓶摆件客厅装饰品摆设中式家居新房装饰品酒柜摆件','',36.00,1,'1_2017092902182426089.jpg',36.00,1,3,'1',0,0,69),(10,10,0,123,'景德镇陶瓷花瓶摆件客厅装饰品摆设中式家居新房装饰品酒柜摆件','',36.00,1,'1_2017092902182426089.jpg',36.00,1,3,'1',0,0,69),(11,11,0,123,'景德镇陶瓷花瓶摆件客厅装饰品摆设中式家居新房装饰品酒柜摆件','',36.00,1,'1_2017092902182426089.jpg',36.00,1,3,'1',0,0,69),(12,12,0,124,'财富节节高电视柜酒柜客厅摆件装饰品竹子家居饰品工艺品招财摆设','',79.00,1,'1_2017092902201298747.jpg',79.00,1,3,'1',0,0,69),(13,13,0,127,'新西兰进口牛奶纽仕兰高钙低脂纯牛奶250ml*24盒*1箱','',89.00,1,'1_2017092902485560056.jpg',89.00,1,3,'1',0,0,231),(14,14,0,91,'南极人颈椎热敷护颈带护颈椎套保暖保护肩颈理疗自发热护颈椎脖套','',39.00,1,'1_2017092900261952044.jpg',39.00,1,6,'1',0,0,55),(17,17,0,123,'景德镇陶瓷花瓶摆件客厅装饰品摆设中式家居新房装饰品酒柜摆件','',36.00,1,'1_2017092902182426089.jpg',36.00,1,3,'1',0,0,69),(18,18,0,37,'五粮液 红 52度','400ml 红 52度 ',695.00,1,'1_2017092202382291274.jpg',695.00,1,3,'1',0,0,29),(19,24,0,83,'红心大蒸汽挂烫机家用熨斗手持挂烫机烫衣服熨烫机电熨斗正品包邮','',139.00,1,'1_2017092900081355788.jpg',139.00,1,3,'1',0,0,21),(20,25,0,83,'红心大蒸汽挂烫机家用熨斗手持挂烫机烫衣服熨烫机电熨斗正品包邮','',139.00,1,'1_2017092900081355788.jpg',139.00,1,3,'1',0,0,21),(21,26,0,135,'Alfombra de Cocina','',400.00,1,'1_2021040605271432570.png',400.00,1,31,'1',0,0,767);
/*!40000 ALTER TABLE `ds_ordergoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_orderinviter`
--

DROP TABLE IF EXISTS `ds_orderinviter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_orderinviter` (
  `orderinviter_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分销详情自增ID',
  `orderinviter_order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `orderinviter_member_id` int(10) unsigned NOT NULL COMMENT '推荐人ID',
  `orderinviter_money` decimal(10,2) unsigned NOT NULL COMMENT '佣金',
  `orderinviter_remark` varchar(255) NOT NULL COMMENT '分销详情备注',
  `orderinviter_member_name` varchar(60) NOT NULL COMMENT '推荐人用户名',
  `orderinviter_order_sn` varchar(20) NOT NULL COMMENT '订单号',
  `orderinviter_goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共id',
  `orderinviter_goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `orderinviter_level` int(10) unsigned NOT NULL COMMENT '分销级别',
  `orderinviter_goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `orderinviter_valid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有效',
  `orderinviter_store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `orderinviter_order_type` tinyint(1) unsigned NOT NULL COMMENT '订单类型（0实物订单1虚拟订单）',
  `orderinviter_goods_quantity` int(10) unsigned NOT NULL COMMENT '商品数量',
  `orderinviter_goods_amount` decimal(10,2) unsigned NOT NULL COMMENT '商品金额',
  `orderinviter_store_name` varchar(60) NOT NULL COMMENT '店铺名',
  `orderinviter_addtime` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`orderinviter_id`),
  KEY `orderinviter_member_id` (`orderinviter_member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='分销详情表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_orderinviter`
--

LOCK TABLES `ds_orderinviter` WRITE;
/*!40000 ALTER TABLE `ds_orderinviter` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_orderinviter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_orderlog`
--

DROP TABLE IF EXISTS `ds_orderlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_orderlog` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单记录自增ID',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `log_msg` varchar(150) DEFAULT '' COMMENT '订单记录文字描述',
  `log_time` int(10) unsigned NOT NULL COMMENT '订单记录处理时间',
  `log_role` char(2) NOT NULL COMMENT '操作角色',
  `log_user` varchar(30) DEFAULT '' COMMENT '操作人',
  `log_orderstate` enum('0','10','20','30','35','40') DEFAULT NULL COMMENT '订单状态：0:已取消10:未付款;20:已付款;30:已发货;35:待自提;40:已收货;',
  PRIMARY KEY (`log_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='订单记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_orderlog`
--

LOCK TABLES `ds_orderlog` WRITE;
/*!40000 ALTER TABLE `ds_orderlog` DISABLE KEYS */;
INSERT INTO `ds_orderlog` VALUES (2,2,'完成了付款',1606807684,'买家','','20'),(5,2,'发出了货物 ( 编辑了发货信息 )',1606898128,'商家','seller','30'),(6,2,'签收了货物',1606981945,'买家','ceshi123','40'),(7,2,'评价了交易',1606982120,'买家','',NULL),(8,3,'取消了订单 ( 改买其他商品 )',1607087951,'买家','ceshi123','0'),(9,5,'完成了付款',1607161144,'买家','','20'),(10,4,'取消了订单 ( 不是有效的订单 )',1607161265,'商家','buyer','0'),(11,5,'发出了货物 ( 编辑了发货信息 )',1607161290,'商家','seller','30'),(12,5,'签收了货物',1607162887,'买家','ceshi123','40'),(13,5,'评价了交易',1607309081,'买家','',NULL),(14,6,'取消了订单 ( 改用其他配送方式 )',1607313706,'买家','WANGYU','0'),(15,7,'取消了订单 ( 改用其他配送方式 )',1607313715,'买家','WANGYU','0'),(16,8,'取消了订单 ( 从其他店铺购买 )',1607313883,'买家','WANGYU','0'),(17,11,'完成了付款',1608628650,'买家','','20'),(18,12,'完成了付款',1608629405,'买家','','20'),(19,13,'收到了货款 ( 支付平台交易号 : 4658998813346 )',1608708061,'系统','admin','20'),(20,14,'取消了订单',1609395672,'系统','admin','0'),(21,10,'取消了订单',1609395677,'系统','admin','0'),(22,9,'取消了订单',1609395681,'系统','admin','0'),(23,13,'发出了货物 ( 编辑了发货信息 )',1609898327,'商家','seller','30'),(24,12,'发出了货物 ( 编辑了发货信息 )',1609898345,'商家','seller','30'),(25,13,'签收了货物',1609898380,'买家','ceshi123','40'),(26,13,'评价了交易',1609898419,'买家','',NULL),(28,17,'order_log_pay',1610181420,'买家','','20'),(29,18,'取消了订单 ( 不是有效的订单 )',1612642449,'商家','buyer','0');
/*!40000 ALTER TABLE `ds_orderlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_orderpay`
--

DROP TABLE IF EXISTS `ds_orderpay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_orderpay` (
  `pay_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单支付自增ID',
  `pay_sn` varchar(20) NOT NULL COMMENT '支付单号',
  `buyer_id` int(10) unsigned NOT NULL COMMENT '买家ID',
  `api_paystate` enum('0','1') DEFAULT '0' COMMENT '0默认未支付1已支付(只有第三方支付接口通知到时才会更改此状态)',
  PRIMARY KEY (`pay_id`),
  KEY `pay_sn` (`pay_sn`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='订单支付表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_orderpay`
--

LOCK TABLES `ds_orderpay` WRITE;
/*!40000 ALTER TABLE `ds_orderpay` DISABLE KEYS */;
INSERT INTO `ds_orderpay` VALUES (2,'20120115280402457003',3,'0'),(3,'20120421185390563003',3,'0'),(4,'20120517300625531003',3,'0'),(5,'20120517390457874003',3,'0'),(6,'20120711343340697005',5,'0'),(7,'20120711590016953005',5,'0'),(8,'20120712042616850005',5,'0'),(9,'20122215574465515003',3,'0'),(10,'20122217152743324003',3,'0'),(11,'20122217173069367003',3,'0'),(12,'20122217300592231003',3,'0'),(13,'20122217423339940003',3,'1'),(14,'20123114140451192006',6,'0'),(15,'21010711542005628003',3,'0'),(17,'21010916370031418003',3,'0'),(18,'21010916461912894003',3,'0'),(19,'21040423443947190003',3,'0'),(20,'21040423451269759003',3,'0'),(21,'21040423463158270003',3,'0'),(22,'21040510462812851003',3,'0'),(23,'21040510582674675003',3,'0'),(24,'21040510591041965003',3,'0'),(25,'21040511064657877003',3,'0'),(26,'21040511154400477003',3,'0'),(27,'21040511351150768003',3,'0'),(28,'21040511424312332003',3,'0'),(29,'21040511460421197003',3,'0'),(30,'21040511482857138003',3,'0'),(31,'21040511534700299003',3,'0'),(32,'21040605501530735031',31,'0');
/*!40000 ALTER TABLE `ds_orderpay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_orderstatis`
--

DROP TABLE IF EXISTS `ds_orderstatis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_orderstatis` (
  `os_month` mediumint(9) unsigned NOT NULL DEFAULT '0' COMMENT '统计编号(年月)',
  `os_order_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单金额',
  `os_shipping_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `os_order_returntotals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退单金额',
  `os_commis_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '佣金金额',
  `os_commis_returntotals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退还佣金',
  `os_store_costtotals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '店铺促销活动费用',
  `os_vr_order_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '虚拟订单金额',
  `os_vr_order_return_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '虚拟订单退款金额',
  `os_vr_commis_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '虚拟佣金金额',
  `os_vr_commis_return_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '虚拟退还佣金金额',
  `os_vr_inviter_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '虚拟分销佣金金额',
  `os_result_totals` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本期应结',
  `os_createdate` int(11) DEFAULT NULL COMMENT '创建记录日期',
  `os_inviter_totals` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '分销佣金',
  PRIMARY KEY (`os_month`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='月销量统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_orderstatis`
--

LOCK TABLES `ds_orderstatis` WRITE;
/*!40000 ALTER TABLE `ds_orderstatis` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_orderstatis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_payment`
--

DROP TABLE IF EXISTS `ds_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_payment` (
  `payment_code` char(20) NOT NULL COMMENT '支付代码',
  `payment_name` char(20) NOT NULL COMMENT '支付名称',
  `payment_config` text COMMENT '支付接口配置信息',
  `payment_platform` char(10) NOT NULL COMMENT '支付方式所适应平台 pc h5 app',
  `payment_state` enum('0','1') NOT NULL DEFAULT '0' COMMENT '接口状态0禁用1启用',
  PRIMARY KEY (`payment_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='支付方式表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_payment`
--

LOCK TABLES `ds_payment` WRITE;
/*!40000 ALTER TABLE `ds_payment` DISABLE KEYS */;
INSERT INTO `ds_payment` VALUES ('bankpay','银行汇款/转账','a:2:{s:8:\"bankname\";s:12:\"中国银行\";s:6:\"banksn\";s:6:\"123456\";}','pc','1'),('predeposit','余额支付','a:0:{}','pc','1');
/*!40000 ALTER TABLE `ds_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_pbargain`
--

DROP TABLE IF EXISTS `ds_pbargain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_pbargain` (
  `bargain_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '砍价活动自增ID',
  `member_id` int(11) unsigned NOT NULL COMMENT '卖家用户ID',
  `member_name` varchar(50) NOT NULL COMMENT '卖家用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `store_id` int(11) unsigned NOT NULL COMMENT '店铺ID',
  `bargain_name` varchar(50) NOT NULL COMMENT '砍价名称',
  `bargain_goods_id` int(11) unsigned NOT NULL COMMENT '商品ID',
  `bargain_goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `bargain_goods_image` varchar(100) DEFAULT '' COMMENT '商品图片',
  `bargain_goods_price` decimal(10,2) NOT NULL COMMENT '商品原价',
  `bargain_goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表ID',
  `bargain_limit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '砍价限购数量',
  `bargain_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '砍价有效期/小时',
  `bargain_floorprice` decimal(10,2) NOT NULL COMMENT '商品底价',
  `bargain_total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '共多少刀砍至底价',
  `bargain_max` decimal(10,2) NOT NULL COMMENT '每刀最多可砍金额',
  `bargain_remark` varchar(50) NOT NULL COMMENT '分享描述',
  `bargain_begintime` int(10) unsigned NOT NULL COMMENT '砍价开始时间',
  `bargain_endtime` int(10) unsigned NOT NULL COMMENT '砍价结束时间',
  `bargain_state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态，0:已取消 1:未开始 2:进行中 3:已结束',
  PRIMARY KEY (`bargain_id`),
  KEY `member_id` (`member_id`),
  KEY `store_id` (`store_id`),
  KEY `bargain_goods_id` (`bargain_goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺砍价活动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_pbargain`
--

LOCK TABLES `ds_pbargain` WRITE;
/*!40000 ALTER TABLE `ds_pbargain` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_pbargain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_pbargainlog`
--

DROP TABLE IF EXISTS `ds_pbargainlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_pbargainlog` (
  `pbargainlog_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '砍价记录自增ID',
  `pbargainlog_member_id` int(11) unsigned NOT NULL COMMENT '帮砍价ID',
  `pbargainlog_member_name` varchar(50) NOT NULL COMMENT '帮砍价用户名',
  `pbargainlog_price` decimal(10,2) NOT NULL COMMENT '砍掉的价格',
  `pbargainlog_time` int(10) unsigned NOT NULL COMMENT '砍价时间',
  `bargain_id` int(10) unsigned NOT NULL COMMENT '砍价活动ID',
  `bargainorder_id` int(10) unsigned NOT NULL COMMENT '砍价订单ID',
  PRIMARY KEY (`pbargainlog_id`),
  KEY `pbargainlog_member_id` (`pbargainlog_member_id`,`bargainorder_id`),
  KEY `bargain_id` (`bargain_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='砍价记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_pbargainlog`
--

LOCK TABLES `ds_pbargainlog` WRITE;
/*!40000 ALTER TABLE `ds_pbargainlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_pbargainlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_pbargainorder`
--

DROP TABLE IF EXISTS `ds_pbargainorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_pbargainorder` (
  `bargainorder_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '砍价订单自增ID',
  `bargainorder_initiator_id` int(11) unsigned NOT NULL COMMENT '砍价订单发起人ID',
  `bargainorder_initiator_name` varchar(50) NOT NULL COMMENT '砍价订单发起人用户名',
  `store_id` int(11) unsigned NOT NULL COMMENT '店铺ID',
  `bargain_id` int(10) unsigned NOT NULL COMMENT '砍价活动ID',
  `bargain_name` varchar(50) NOT NULL COMMENT '砍价名称',
  `bargain_total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '共多少刀砍至底价',
  `bargain_goods_id` int(11) unsigned NOT NULL COMMENT '商品ID',
  `bargain_goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `bargain_goods_price` decimal(10,2) NOT NULL COMMENT '商品原价',
  `bargain_goods_image` varchar(100) DEFAULT '' COMMENT '商品图片',
  `bargainorder_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '砍价次数',
  `bargainorder_current_price` decimal(10,2) NOT NULL COMMENT '砍价后价格',
  `bargainorder_begintime` int(10) unsigned NOT NULL COMMENT '开始时间',
  `bargainorder_endtime` int(10) unsigned NOT NULL COMMENT '结束时间',
  `bargainorder_state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态，0:取消 1:正常 2:砍价成功 3:砍价失败',
  `order_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '订单ID',
  PRIMARY KEY (`bargainorder_id`),
  KEY `bargainorder_initiator_id` (`bargainorder_initiator_id`),
  KEY `store_id` (`store_id`),
  KEY `bargain_id` (`bargain_id`),
  KEY `bargain_goods_id` (`bargain_goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='砍价订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_pbargainorder`
--

LOCK TABLES `ds_pbargainorder` WRITE;
/*!40000 ALTER TABLE `ds_pbargainorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_pbargainorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_pbargainquota`
--

DROP TABLE IF EXISTS `ds_pbargainquota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_pbargainquota` (
  `bargainquota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '砍价套餐ID',
  `member_id` int(11) unsigned NOT NULL COMMENT '卖家用户ID',
  `member_name` varchar(50) NOT NULL COMMENT '卖家用户名',
  `store_id` int(11) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `bargainquota_starttime` int(10) unsigned NOT NULL COMMENT '砍价套餐开始时间',
  `bargainquota_endtime` int(10) unsigned NOT NULL COMMENT '砍价套餐结束时间',
  PRIMARY KEY (`bargainquota_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='砍价套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_pbargainquota`
--

LOCK TABLES `ds_pbargainquota` WRITE;
/*!40000 ALTER TABLE `ds_pbargainquota` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_pbargainquota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_pboothgoods`
--

DROP TABLE IF EXISTS `ds_pboothgoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_pboothgoods` (
  `boothgoods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '展位商品ID',
  `store_id` int(10) unsigned NOT NULL COMMENT '展位店铺id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '展位商品id',
  `gc_id` int(10) unsigned NOT NULL COMMENT '商品分类id',
  `boothgoods_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '展位商品状态 1开启 0关闭 默认1',
  PRIMARY KEY (`boothgoods_id`),
  KEY `store_id` (`store_id`),
  KEY `gc_id` (`gc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='展位商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_pboothgoods`
--

LOCK TABLES `ds_pboothgoods` WRITE;
/*!40000 ALTER TABLE `ds_pboothgoods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_pboothgoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_pboothquota`
--

DROP TABLE IF EXISTS `ds_pboothquota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_pboothquota` (
  `boothquota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '展位套餐自增ID',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `boothquota_starttime` int(10) unsigned NOT NULL COMMENT '展位开始时间',
  `boothquota_endtime` int(10) unsigned NOT NULL COMMENT '展位结束时间',
  `boothquota_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '套餐状态 1:开启 0:关闭',
  PRIMARY KEY (`boothquota_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='展位套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_pboothquota`
--

LOCK TABLES `ds_pboothquota` WRITE;
/*!40000 ALTER TABLE `ds_pboothquota` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_pboothquota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_pbundling`
--

DROP TABLE IF EXISTS `ds_pbundling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_pbundling` (
  `bl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合ID',
  `store_id` int(11) NOT NULL COMMENT '店铺名称',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `bl_name` varchar(50) NOT NULL COMMENT '组合名称',
  `bl_discount_price` decimal(10,2) NOT NULL COMMENT '组合价格',
  `bl_freight_choose` tinyint(1) NOT NULL COMMENT '运费承担方式',
  `bl_freight` decimal(10,2) NOT NULL COMMENT '运费',
  `bl_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '组合状态 0:关闭 1:开启',
  PRIMARY KEY (`bl_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='组合销售活动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_pbundling`
--

LOCK TABLES `ds_pbundling` WRITE;
/*!40000 ALTER TABLE `ds_pbundling` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_pbundling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_pbundlinggoods`
--

DROP TABLE IF EXISTS `ds_pbundlinggoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_pbundlinggoods` (
  `blgoods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合商品id',
  `blgoods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `blgoods_appoint` tinyint(3) unsigned NOT NULL COMMENT '指定商品 1是，0否',
  `bl_id` int(11) NOT NULL COMMENT '组合id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表ID',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `goods_image` varchar(100) NOT NULL COMMENT '商品图片',
  PRIMARY KEY (`blgoods_id`),
  KEY `bl_id` (`bl_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='组合销售活动商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_pbundlinggoods`
--

LOCK TABLES `ds_pbundlinggoods` WRITE;
/*!40000 ALTER TABLE `ds_pbundlinggoods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_pbundlinggoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_pbundlingquota`
--

DROP TABLE IF EXISTS `ds_pbundlingquota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_pbundlingquota` (
  `blquota_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合套餐自增ID',
  `store_id` int(11) NOT NULL COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `blquota_month` tinyint(3) unsigned NOT NULL COMMENT '组合套餐购买数量（单位月）',
  `blquota_starttime` varchar(10) NOT NULL COMMENT '组合套餐开始时间',
  `blquota_endtime` varchar(10) NOT NULL COMMENT '组合套餐结束时间',
  `blquota_state` tinyint(1) unsigned NOT NULL COMMENT '组合套餐状态：0关闭，1开启。默认为 1',
  PRIMARY KEY (`blquota_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='组合销售套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_pbundlingquota`
--

LOCK TABLES `ds_pbundlingquota` WRITE;
/*!40000 ALTER TABLE `ds_pbundlingquota` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_pbundlingquota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_pdcash`
--

DROP TABLE IF EXISTS `ds_pdcash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_pdcash` (
  `pdc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '提现记录自增ID',
  `pdc_sn` varchar(20) NOT NULL COMMENT '记录唯一标示',
  `pdc_member_id` int(11) NOT NULL COMMENT '会员ID',
  `pdc_member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `pdc_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `pdc_bank_type` varchar(10) NOT NULL DEFAULT 'bank' COMMENT 'bank银行 alipay 支付宝 weixin 微信收款',
  `pdc_bank_name` varchar(40) NOT NULL COMMENT '收款银行',
  `pdc_bank_no` varchar(30) DEFAULT NULL COMMENT '收款账号',
  `pdc_bank_user` varchar(10) DEFAULT NULL COMMENT '开户人姓名',
  `pdc_addtime` int(11) NOT NULL COMMENT '添加时间',
  `pdc_payment_time` int(11) DEFAULT NULL COMMENT '付款时间',
  `pdc_payment_state` enum('0','1') NOT NULL DEFAULT '0' COMMENT '提现支付状态 0:默认1:支付完成',
  `pdc_payment_admin` varchar(30) DEFAULT NULL COMMENT '支付管理员',
  `pdc_payment_code` varchar(20) DEFAULT '' COMMENT '支付方式',
  `pdc_trade_sn` varchar(50) DEFAULT '' COMMENT '第三方支付接口交易号',
  PRIMARY KEY (`pdc_id`),
  KEY `pdc_member_id` (`pdc_member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='预存款提现记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_pdcash`
--

LOCK TABLES `ds_pdcash` WRITE;
/*!40000 ALTER TABLE `ds_pdcash` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_pdcash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_pdlog`
--

DROP TABLE IF EXISTS `ds_pdlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_pdlog` (
  `lg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '预存款变更日志自增ID',
  `lg_member_id` int(11) NOT NULL COMMENT '会员ID',
  `lg_member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `lg_admin_name` varchar(50) DEFAULT NULL COMMENT '管理员名称',
  `lg_type` varchar(50) NOT NULL DEFAULT '' COMMENT 'order_pay下单支付预存款,order_freeze下单冻结预存款,order_cancel取消订单解冻预存款,order_comb_pay下单支付被冻结的预存款,recharge充值,cash_apply申请提现冻结预存款,cash_pay提现成功,cash_del取消提现申请，解冻预存款,refund退款',
  `lg_av_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '可用金额变更0:未变更',
  `lg_freeze_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '冻结金额变更0:未变更',
  `lg_addtime` int(11) NOT NULL COMMENT '变更添加时间',
  `lg_desc` varchar(150) DEFAULT NULL COMMENT '变更描述',
  PRIMARY KEY (`lg_id`),
  KEY `lg_member_id` (`lg_member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='预存款变更日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_pdlog`
--

LOCK TABLES `ds_pdlog` WRITE;
/*!40000 ALTER TABLE `ds_pdlog` DISABLE KEYS */;
INSERT INTO `ds_pdlog` VALUES (1,1,'','admin','recharge',1.00,0.00,1606728961,'充值，充值单号: 20112616371451798001'),(2,3,'','admin','recharge',100.00,0.00,1606729922,'充值，充值单号: 20113017485663035003'),(4,3,'',NULL,'order_pay',-36.00,0.00,1606807684,'下单，支付预存款，订单号: 202012011528054808'),(5,3,'',NULL,'order_freeze',-64.00,64.00,1607160606,'下单，冻结预存款，订单号: 202012051730066624'),(6,3,'','admin','recharge',10000.00,0.00,1607160954,'充值，充值单号: 20120517351085829003'),(7,3,'',NULL,'order_pay',-399.00,0.00,1607161144,'下单，支付预存款，订单号: 202012051739047836'),(8,3,'',NULL,'order_cancel',64.00,-64.00,1607161265,'取消订单，解冻预存款，订单号: 202012051730066624'),(9,3,'',NULL,'order_pay',-36.00,0.00,1608628650,'下单，支付预存款，订单号: 202012221717303805'),(10,3,'',NULL,'order_pay',-79.00,0.00,1608629405,'下单，支付预存款，订单号: 202012221730055546'),(11,3,'',NULL,'order_pay',-36.00,0.00,1610180320,'下单，支付预存款，订单号: 202101091618408848'),(12,3,'',NULL,'order_pay',-36.00,0.00,1610181420,'下单，支付预存款，订单号: 202101091637004659');
/*!40000 ALTER TABLE `ds_pdlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_pdrecharge`
--

DROP TABLE IF EXISTS `ds_pdrecharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_pdrecharge` (
  `pdr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '充值自增ID',
  `pdr_sn` varchar(20) NOT NULL COMMENT '记录唯一标示',
  `pdr_member_id` int(11) NOT NULL COMMENT '会员ID',
  `pdr_member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `pdr_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '充值金额',
  `pdr_payment_code` varchar(20) DEFAULT '' COMMENT '支付方式',
  `pdr_trade_sn` varchar(50) DEFAULT '' COMMENT '第三方支付接口交易号',
  `pdr_addtime` int(11) NOT NULL COMMENT '充值添加时间',
  `pdr_payment_state` enum('0','1') NOT NULL DEFAULT '0' COMMENT '支付状态 0未支付1支付',
  `pdr_paymenttime` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pdr_admin` varchar(30) DEFAULT '' COMMENT '管理员名',
  `pdr_paymentbankname` varchar(100) DEFAULT '' COMMENT '转账银行名称',
  `pdr_paymentbank` varchar(100) DEFAULT '' COMMENT '转账银行',
  `pdr_paymentimgs` text NOT NULL COMMENT '转账截图',
  `pdr_admin_remark` text NOT NULL COMMENT '管理员备注',
  `pdr_status` tinyint(2) DEFAULT '0' COMMENT '处理状态 0待处理1已处理-1拒绝处理',
  `pdr_confirmimgs` text NOT NULL COMMENT '管理员确认到账截图',
  `pdr_serialnumber` varchar(100) DEFAULT '' COMMENT '管理员确认流水号',
  `pdr_confirmtime` int(10) NOT NULL COMMENT '管理员确认时间',
  PRIMARY KEY (`pdr_id`),
  KEY `pdr_member_id` (`pdr_member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='预存款充值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_pdrecharge`
--

LOCK TABLES `ds_pdrecharge` WRITE;
/*!40000 ALTER TABLE `ds_pdrecharge` DISABLE KEYS */;
INSERT INTO `ds_pdrecharge` VALUES (7,'20120517351085829003',3,'ceshi123',10000.00,'','',1607160910,'0',0,'admin','中国银行','123456','recharge_3_20201205173510.jpg','',1,'rechargeid_7_20201205173554.jpg','123456',1607160954),(6,'20120517331539816003',3,'ceshi123',0.00,'','',1607160795,'0',0,'admin','中国银行','123456','recharge_3_20201205173315.jpg','尚未收到充值金额',-1,'','',1607160855),(5,'20113017485663035003',3,'ceshi123',100.00,'','',1606729736,'0',0,'admin','中国银行','123456','recharge_3_20201130174856.jpg','',1,'rechargeid_5_20201130175202.jpg','13467956',1606729922);
/*!40000 ALTER TABLE `ds_pdrecharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_pmansong`
--

DROP TABLE IF EXISTS `ds_pmansong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_pmansong` (
  `mansong_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '满送活动编号',
  `mansong_name` varchar(50) NOT NULL COMMENT '活动名称',
  `mansongquota_id` int(10) unsigned NOT NULL COMMENT '套餐编号',
  `mansong_starttime` int(10) unsigned NOT NULL COMMENT '活动开始时间',
  `mansong_endtime` int(10) unsigned NOT NULL COMMENT '活动结束时间',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `mansong_state` tinyint(1) unsigned NOT NULL COMMENT '活动状态 1:未发布 2:正常 3:取消 4:失效 5:结束',
  `mansong_remark` varchar(200) NOT NULL COMMENT '满就送备注',
  PRIMARY KEY (`mansong_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='满就送活动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_pmansong`
--

LOCK TABLES `ds_pmansong` WRITE;
/*!40000 ALTER TABLE `ds_pmansong` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_pmansong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_pmansongquota`
--

DROP TABLE IF EXISTS `ds_pmansongquota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_pmansongquota` (
  `mansongquota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '满就送套餐编号',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `mansongquota_apply_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '申请ID',
  `mansongquota_starttime` int(10) unsigned NOT NULL COMMENT '开始时间',
  `mansongquota_endtime` int(10) unsigned NOT NULL COMMENT '结束时间',
  `mansongquota_state` tinyint(1) unsigned DEFAULT NULL COMMENT '配额状态 1:可用 2:取消 3:结束',
  PRIMARY KEY (`mansongquota_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='满就送套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_pmansongquota`
--

LOCK TABLES `ds_pmansongquota` WRITE;
/*!40000 ALTER TABLE `ds_pmansongquota` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_pmansongquota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_pmansongrule`
--

DROP TABLE IF EXISTS `ds_pmansongrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_pmansongrule` (
  `mansongrule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '满就送规则ID',
  `mansong_id` int(10) unsigned NOT NULL COMMENT '满就送活动ID',
  `mansongrule_price` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '满就送级别价格',
  `mansongrule_discount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '满就送减现金优惠金额',
  `mansong_goods_name` varchar(200) DEFAULT NULL COMMENT '满就送礼品名称',
  `goods_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '满就送商品ID',
  PRIMARY KEY (`mansongrule_id`),
  KEY `mansong_id` (`mansong_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='满就送活动规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_pmansongrule`
--

LOCK TABLES `ds_pmansongrule` WRITE;
/*!40000 ALTER TABLE `ds_pmansongrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_pmansongrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_pmgdiscountquota`
--

DROP TABLE IF EXISTS `ds_pmgdiscountquota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_pmgdiscountquota` (
  `mgdiscountquota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员等级折扣套餐ID',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `mgdiscountquota_starttime` int(10) unsigned NOT NULL COMMENT '会员等级折扣套餐开始时间',
  `mgdiscountquota_endtime` int(10) unsigned NOT NULL COMMENT '会员等级折扣套餐结束时间',
  PRIMARY KEY (`mgdiscountquota_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员等级折扣套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_pmgdiscountquota`
--

LOCK TABLES `ds_pmgdiscountquota` WRITE;
/*!40000 ALTER TABLE `ds_pmgdiscountquota` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_pmgdiscountquota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_pointscart`
--

DROP TABLE IF EXISTS `ds_pointscart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_pointscart` (
  `pcart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分购物车自增ID',
  `pmember_id` int(11) NOT NULL COMMENT '会员ID',
  `pgoods_id` int(11) NOT NULL COMMENT '积分礼品序号',
  `pgoods_name` varchar(200) NOT NULL COMMENT '积分礼品名称',
  `pgoods_points` int(11) NOT NULL COMMENT '积分礼品兑换积分',
  `pgoods_choosenum` int(11) NOT NULL COMMENT '选择积分礼品数量',
  `pgoods_image` varchar(100) DEFAULT NULL COMMENT '积分礼品图片',
  PRIMARY KEY (`pcart_id`),
  KEY `pmember_id` (`pmember_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='积分礼品兑换购物车';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_pointscart`
--

LOCK TABLES `ds_pointscart` WRITE;
/*!40000 ALTER TABLE `ds_pointscart` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_pointscart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_pointsgoods`
--

DROP TABLE IF EXISTS `ds_pointsgoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_pointsgoods` (
  `pgoods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分礼品自增ID',
  `pgoods_name` varchar(200) NOT NULL COMMENT '积分礼品名称',
  `pgoods_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '积分礼品原价',
  `pgoods_points` int(11) NOT NULL COMMENT '积分礼品兑换积分',
  `pgoods_image` varchar(100) DEFAULT NULL COMMENT '积分礼品封面图片',
  `pgoods_tag` varchar(100) NOT NULL COMMENT '积分礼品标签',
  `pgoods_serial` varchar(50) NOT NULL COMMENT '积分礼品货号',
  `pgoods_storage` int(11) NOT NULL DEFAULT '0' COMMENT '积分礼品库存',
  `pgoods_show` tinyint(1) NOT NULL COMMENT '积分礼品上架 0:下架 1:上架',
  `pgoods_commend` tinyint(1) NOT NULL COMMENT '积分礼品是否推荐',
  `pgoods_addtime` int(11) NOT NULL COMMENT '积分礼品添加时间',
  `pgoods_keywords` varchar(100) DEFAULT NULL COMMENT '积分礼品关键字',
  `pgoods_description` varchar(200) DEFAULT NULL COMMENT '积分礼品描述',
  `pgoods_body` text COMMENT '积分礼品内容',
  `pgoods_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '积分礼品状态 0:开启 1:禁售',
  `pgoods_close_reason` varchar(255) DEFAULT NULL COMMENT '积分礼品禁售原因',
  `pgoods_salenum` int(11) NOT NULL DEFAULT '0' COMMENT '积分礼品售出数量',
  `pgoods_view` int(11) NOT NULL DEFAULT '0' COMMENT '积分商品浏览量',
  `pgoods_islimit` tinyint(1) NOT NULL COMMENT '是否限制兑换数量',
  `pgoods_limitnum` int(11) DEFAULT NULL COMMENT '限制兑换数量',
  `pgoods_islimittime` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制兑换时间 0:不限制 1:限制',
  `pgoods_limitmgrade` int(11) NOT NULL DEFAULT '0' COMMENT '限制参与兑换的会员级别',
  `pgoods_starttime` int(11) DEFAULT NULL COMMENT '积分兑换开始时间',
  `pgoods_endtime` int(11) DEFAULT NULL COMMENT '积分兑换结束时间',
  `pgoods_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '积分礼品排序',
  PRIMARY KEY (`pgoods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='积分礼品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_pointsgoods`
--

LOCK TABLES `ds_pointsgoods` WRITE;
/*!40000 ALTER TABLE `ds_pointsgoods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_pointsgoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_pointslog`
--

DROP TABLE IF EXISTS `ds_pointslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_pointslog` (
  `pl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分日志自增ID',
  `pl_memberid` int(11) NOT NULL COMMENT '会员ID',
  `pl_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `pl_adminid` int(11) DEFAULT NULL COMMENT '管理员ID',
  `pl_adminname` varchar(100) DEFAULT NULL COMMENT '管理员名称',
  `pl_points` int(11) NOT NULL DEFAULT '0' COMMENT '积分数 负数为扣除',
  `pl_addtime` int(11) NOT NULL COMMENT '积分添加时间',
  `pl_desc` varchar(100) NOT NULL COMMENT '积分操作描述',
  `pl_stage` varchar(50) NOT NULL COMMENT '积分操作阶段',
  PRIMARY KEY (`pl_id`),
  KEY `pl_memberid` (`pl_memberid`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='会员积分日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_pointslog`
--

LOCK TABLES `ds_pointslog` WRITE;
/*!40000 ALTER TABLE `ds_pointslog` DISABLE KEYS */;
INSERT INTO `ds_pointslog` VALUES (1,1,'buyer',NULL,NULL,10,1605681678,'会员登录','login'),(2,1,'buyer',NULL,NULL,10,1605774881,'会员登录','login'),(3,1,'buyer',NULL,NULL,10,1605835758,'会员登录','login'),(4,1,'buyer',NULL,NULL,10,1606095801,'会员登录','login'),(5,1,'buyer',NULL,NULL,10,1606361741,'会员登录','login'),(6,1,'buyer',NULL,NULL,10,1606439304,'会员登录','login'),(7,1,'buyer',NULL,NULL,10,1606701400,'会员登录','login'),(8,3,'ceshi123',NULL,NULL,5,1606729630,'注册会员','regist'),(9,3,'ceshi123',NULL,NULL,10,1606786484,'会员登录','login'),(10,3,'ceshi123',NULL,NULL,10,1606893944,'会员登录','login'),(11,3,'ceshi123',NULL,NULL,10,1606980187,'会员登录','login'),(12,3,'ceshi123',NULL,NULL,4,1606981945,'订单202012011528054808购物消费','order'),(13,3,'ceshi123',NULL,NULL,10,1606982120,'评论商品','comments'),(14,4,'hfai001',NULL,NULL,5,1607086531,'注册会员','regist'),(15,3,'ceshi123',NULL,NULL,10,1607087843,'会员登录','login'),(16,3,'ceshi123',NULL,NULL,10,1607162603,'会员登录','login'),(17,3,'ceshi123',NULL,NULL,4,1607162887,'订单202012051739047836购物消费','order'),(18,3,'ceshi123',NULL,NULL,10,1607308651,'会员登录','login'),(19,2,'helly',NULL,NULL,10,1607308814,'会员登录','login'),(20,3,'ceshi123',NULL,NULL,10,1607309081,'评论商品','comments'),(21,5,'WANGYU',NULL,NULL,5,1607311708,'注册会员','regist'),(22,3,'ceshi123',NULL,NULL,10,1608600986,'会员登录','login'),(23,3,'ceshi123',NULL,NULL,10,1608686015,'会员登录','login'),(24,3,'ceshi123',NULL,NULL,10,1609232326,'会员登录','login'),(25,3,'ceshi123',NULL,NULL,10,1609291824,'会员登录','login'),(26,3,'ceshi123',NULL,NULL,10,1609379870,'会员登录','login'),(27,6,'duomitxt',NULL,NULL,5,1609395011,'注册会员','regist'),(28,3,'ceshi123',NULL,NULL,10,1609641169,'会员登录','login'),(29,3,'ceshi123',NULL,NULL,10,1609725068,'会员登录','login'),(30,3,'ceshi123',NULL,NULL,10,1609810491,'会员登录','login'),(31,3,'ceshi123',NULL,NULL,10,1609898142,'会员登录','login'),(32,3,'ceshi123',NULL,NULL,4,1609898380,'订单202012221742331142购物消费','order'),(33,3,'ceshi123',NULL,NULL,10,1609898419,'评论商品','comments'),(34,4,'hfai001',NULL,NULL,10,1609976869,'会员登录','login'),(35,3,'ceshi123',NULL,NULL,10,1609983664,'会员登录','login'),(36,3,'ceshi123',NULL,NULL,10,1610069230,'会员登录','login'),(37,3,'ceshi123',NULL,NULL,10,1610180988,'会员登录','login'),(38,3,'ceshi123',NULL,NULL,10,1610270468,'会员登录','login'),(39,3,'ceshi123',NULL,NULL,10,1610333179,'会员登录','login'),(40,3,'ceshi123',NULL,NULL,10,1610505366,'会员登录','login'),(41,3,'ceshi123',NULL,NULL,10,1610588938,'会员登录','login'),(42,3,'ceshi123',NULL,NULL,10,1610678374,'会员登录','login'),(43,3,'ceshi123',NULL,NULL,10,1610768062,'会员登录','login'),(44,3,'ceshi123',NULL,NULL,10,1612518080,'会员登录','login'),(45,4,'hfai001',NULL,NULL,10,1612535535,'会员登录','login'),(46,3,'ceshi123',NULL,NULL,10,1612705747,'会员登录','login'),(47,3,'ceshi123',NULL,NULL,10,1616028363,'会员登录','login'),(48,3,'ceshi123',NULL,NULL,10,1617194986,'会员登录','login'),(49,3,'ceshi123',NULL,NULL,10,1617551024,'会员登录','login'),(50,3,'ceshi123',NULL,NULL,10,1617590708,'会员登录','login'),(51,29,'ceshi666',NULL,NULL,5,1617628168,'注册会员','regist'),(52,30,'ceshi666',NULL,NULL,5,1617628560,'注册会员','regist'),(53,31,'jorge123',NULL,NULL,5,1617647891,'注册会员','regist'),(54,3,'ceshi123',NULL,NULL,10,1618112752,'会员登录','login');
/*!40000 ALTER TABLE `ds_pointslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_pointsorder`
--

DROP TABLE IF EXISTS `ds_pointsorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_pointsorder` (
  `point_orderid` int(11) NOT NULL AUTO_INCREMENT COMMENT '兑换订单自增ID',
  `point_ordersn` varchar(20) NOT NULL COMMENT '兑换订单编号',
  `point_buyerid` int(11) NOT NULL COMMENT '兑换会员ID',
  `point_buyername` varchar(50) NOT NULL COMMENT '兑换会员姓名',
  `point_buyeremail` varchar(100) DEFAULT NULL COMMENT '兑换会员email',
  `point_addtime` int(11) NOT NULL COMMENT '兑换订单添加时间',
  `point_shippingtime` int(11) DEFAULT NULL COMMENT '兑换配送时间',
  `point_shippingcode` varchar(50) DEFAULT NULL COMMENT '兑换物流单号',
  `point_shipping_ecode` varchar(30) DEFAULT NULL COMMENT '兑换物流公司编码',
  `point_finnshedtime` int(11) DEFAULT NULL COMMENT '兑换订单完成时间',
  `point_allpoint` int(11) NOT NULL DEFAULT '0' COMMENT '兑换总积分',
  `point_ordermessage` varchar(300) DEFAULT NULL COMMENT '兑换订单留言',
  `point_orderstate` int(11) NOT NULL DEFAULT '20' COMMENT '订单状态：20:已兑换并扣除积分;30:已发货;40:已收货;50:已完成;2:已取消',
  PRIMARY KEY (`point_orderid`),
  KEY `point_buyerid` (`point_buyerid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='兑换订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_pointsorder`
--

LOCK TABLES `ds_pointsorder` WRITE;
/*!40000 ALTER TABLE `ds_pointsorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_pointsorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_pointsorderaddress`
--

DROP TABLE IF EXISTS `ds_pointsorderaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_pointsorderaddress` (
  `pointoa_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分兑换地址自增ID',
  `pointoa_orderid` int(11) NOT NULL COMMENT '订单id',
  `pointoa_truename` varchar(50) NOT NULL COMMENT '收货人姓名',
  `pointoa_areaid` int(11) NOT NULL COMMENT '地区id',
  `pointoa_areainfo` varchar(100) NOT NULL COMMENT '地区内容',
  `pointoa_address` varchar(200) NOT NULL COMMENT '详细地址',
  `pointoa_zipcode` varchar(20) NOT NULL COMMENT '邮政编码',
  `pointoa_telphone` varchar(20) NOT NULL COMMENT '电话号码',
  `pointoa_mobphone` varchar(20) NOT NULL COMMENT '手机号码',
  PRIMARY KEY (`pointoa_id`),
  KEY `pointoa_orderid` (`pointoa_orderid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='积分兑换地址表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_pointsorderaddress`
--

LOCK TABLES `ds_pointsorderaddress` WRITE;
/*!40000 ALTER TABLE `ds_pointsorderaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_pointsorderaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_pointsordergoods`
--

DROP TABLE IF EXISTS `ds_pointsordergoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_pointsordergoods` (
  `pointog_recid` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分订单商品自增ID',
  `pointog_orderid` int(11) NOT NULL COMMENT '订单ID',
  `pointog_goodsid` int(11) NOT NULL COMMENT '礼品ID',
  `pointog_goodsname` varchar(100) NOT NULL COMMENT '礼品名称',
  `pointog_goodspoints` int(11) NOT NULL COMMENT '礼品兑换积分',
  `pointog_goodsnum` int(11) NOT NULL COMMENT '礼品数量',
  `pointog_goodsimage` varchar(100) DEFAULT NULL COMMENT '礼品图片',
  PRIMARY KEY (`pointog_recid`),
  KEY `pointog_orderid` (`pointog_orderid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='兑换订单商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_pointsordergoods`
--

LOCK TABLES `ds_pointsordergoods` WRITE;
/*!40000 ALTER TABLE `ds_pointsordergoods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_pointsordergoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_ppintuan`
--

DROP TABLE IF EXISTS `ds_ppintuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_ppintuan` (
  `pintuan_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '拼团自增ID',
  `member_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `store_id` int(11) unsigned NOT NULL COMMENT '店铺ID',
  `pintuanquota_id` int(10) unsigned NOT NULL COMMENT '拼团套餐ID',
  `pintuan_name` varchar(50) NOT NULL COMMENT '拼团名称',
  `pintuan_goods_id` int(11) unsigned NOT NULL COMMENT '商品ID',
  `pintuan_goods_name` varchar(200) NOT NULL COMMENT '拼团名称',
  `pintuan_goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表ID',
  `pintuan_goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `pintuan_is_virtual` tinyint(3) DEFAULT '0' COMMENT '是否为虚拟商品 1:是 0:否',
  `pintuan_zhe` int(10) unsigned NOT NULL COMMENT '拼团折扣',
  `pintuan_image` varchar(50) DEFAULT NULL COMMENT '拼团图片',
  `pintuan_starttime` int(10) unsigned NOT NULL COMMENT '拼团开始时间',
  `pintuan_end_time` int(10) unsigned NOT NULL COMMENT '拼团结束时间',
  `pintuan_limit_number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '成团人数',
  `pintuan_limit_hour` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '成团时限',
  `pintuan_limit_quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '成团数量限制',
  `pintuan_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '组团数量',
  `pintuan_ok_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '成功组团数量',
  `pintuan_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态，0:取消 1:正常',
  PRIMARY KEY (`pintuan_id`),
  KEY `store_id` (`store_id`),
  KEY `pintuan_goods_id` (`pintuan_goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺拼团表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_ppintuan`
--

LOCK TABLES `ds_ppintuan` WRITE;
/*!40000 ALTER TABLE `ds_ppintuan` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_ppintuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_ppintuangroup`
--

DROP TABLE IF EXISTS `ds_ppintuangroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_ppintuangroup` (
  `pintuangroup_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '拼团开团ID',
  `pintuan_id` int(10) unsigned NOT NULL COMMENT '拼团ID',
  `pintuangroup_goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `pintuangroup_is_virtual` tinyint(3) DEFAULT '0' COMMENT '是否为虚拟商品 1:是 0:否',
  `pintuangroup_limit_number` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '成团人数',
  `pintuangroup_limit_hour` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '成团时限',
  `pintuangroup_joined` int(10) unsigned NOT NULL COMMENT '己参团人数',
  `pintuangroup_headid` int(10) unsigned NOT NULL COMMENT '团长用户编号',
  `pintuangroup_starttime` int(10) unsigned NOT NULL COMMENT '开团时间',
  `pintuangroup_endtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间 成功或失败',
  `pintuangroup_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态，0:取消 1:参团中 2:成功',
  PRIMARY KEY (`pintuangroup_id`),
  KEY `pintuan_id` (`pintuan_id`),
  KEY `pintuangroup_goods_id` (`pintuangroup_goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='拼团开团表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_ppintuangroup`
--

LOCK TABLES `ds_ppintuangroup` WRITE;
/*!40000 ALTER TABLE `ds_ppintuangroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_ppintuangroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_ppintuanorder`
--

DROP TABLE IF EXISTS `ds_ppintuanorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_ppintuanorder` (
  `pintuanorder_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '拼团开团ID',
  `pintuan_id` int(10) unsigned NOT NULL COMMENT '拼团ID',
  `pintuangroup_id` int(11) unsigned NOT NULL COMMENT '拼团开团ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `order_sn` varchar(20) NOT NULL COMMENT '订单编号',
  `pintuanorder_isfirst` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否首团订单，0:否 1:是',
  `pintuanorder_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态，0:取消 1:参团中 2:成功',
  `pintuanorder_type` tinyint(1) unsigned NOT NULL COMMENT '订单类型（0实物1虚拟）',
  PRIMARY KEY (`pintuanorder_id`),
  KEY `pintuan_id` (`pintuan_id`),
  KEY `pintuangroup_id` (`pintuangroup_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='拼团订单辅助表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_ppintuanorder`
--

LOCK TABLES `ds_ppintuanorder` WRITE;
/*!40000 ALTER TABLE `ds_ppintuanorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_ppintuanorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_ppintuanquota`
--

DROP TABLE IF EXISTS `ds_ppintuanquota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_ppintuanquota` (
  `pintuanquota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '拼团套餐ID',
  `member_id` int(11) unsigned NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_id` int(11) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `pintuanquota_starttime` int(10) unsigned NOT NULL COMMENT '拼团套餐开始时间',
  `pintuanquota_endtime` int(10) unsigned NOT NULL COMMENT '拼团套餐结束时间',
  PRIMARY KEY (`pintuanquota_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='拼团套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_ppintuanquota`
--

LOCK TABLES `ds_ppintuanquota` WRITE;
/*!40000 ALTER TABLE `ds_ppintuanquota` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_ppintuanquota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_pxianshi`
--

DROP TABLE IF EXISTS `ds_pxianshi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_pxianshi` (
  `xianshi_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '限时折扣自增ID',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `xianshiquota_id` int(10) unsigned NOT NULL COMMENT '套餐ID',
  `xianshi_name` varchar(50) NOT NULL COMMENT '活动名称',
  `xianshi_title` varchar(10) DEFAULT NULL COMMENT '活动标题',
  `xianshi_explain` varchar(50) DEFAULT NULL COMMENT '活动说明',
  `xianshi_starttime` int(10) unsigned NOT NULL COMMENT '活动开始时间',
  `xianshi_end_time` int(10) unsigned NOT NULL COMMENT '活动结束时间',
  `xianshi_lower_limit` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '购买下限，1:不限制',
  `xianshi_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态，0:取消 1:正常',
  PRIMARY KEY (`xianshi_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='限时折扣活动表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_pxianshi`
--

LOCK TABLES `ds_pxianshi` WRITE;
/*!40000 ALTER TABLE `ds_pxianshi` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_pxianshi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_pxianshigoods`
--

DROP TABLE IF EXISTS `ds_pxianshigoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_pxianshigoods` (
  `xianshigoods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '限时折扣商品表',
  `xianshi_id` int(10) unsigned NOT NULL COMMENT '限时折扣ID',
  `xianshi_name` varchar(50) NOT NULL COMMENT '限时折扣名称',
  `xianshi_title` varchar(10) DEFAULT NULL COMMENT '限时折扣标题',
  `xianshi_explain` varchar(50) DEFAULT NULL COMMENT '限时折扣说明',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '主商品公共ID',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL COMMENT '店铺价格',
  `goods_image` varchar(100) NOT NULL COMMENT '商品图片',
  `xianshigoods_price` decimal(10,2) NOT NULL COMMENT '限时折扣价格',
  `xianshigoods_starttime` int(10) unsigned NOT NULL COMMENT '限时折扣开始时间',
  `xianshigoods_end_time` int(10) unsigned NOT NULL COMMENT '限时折扣结束时间',
  `xianshigoods_lower_limit` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '购买下限，0为不限制',
  `xianshigoods_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '限时折扣状态，0-取消 1-正常',
  `xianshigoods_recommend` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '限时折扣推荐标志 0-未推荐 1-已推荐',
  `gc_id_1` mediumint(9) DEFAULT '0' COMMENT '商品分类一级ID',
  PRIMARY KEY (`xianshigoods_id`),
  KEY `store_id` (`store_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='限时折扣商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_pxianshigoods`
--

LOCK TABLES `ds_pxianshigoods` WRITE;
/*!40000 ALTER TABLE `ds_pxianshigoods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_pxianshigoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_pxianshiquota`
--

DROP TABLE IF EXISTS `ds_pxianshiquota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_pxianshiquota` (
  `xianshiquota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '限时折扣套餐ID',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `xianshiquota_starttime` int(10) unsigned NOT NULL COMMENT '限时折扣套餐开始时间',
  `xianshiquota_endtime` int(10) unsigned NOT NULL COMMENT '限时折扣套餐结束时间',
  PRIMARY KEY (`xianshiquota_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='限时折扣套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_pxianshiquota`
--

LOCK TABLES `ds_pxianshiquota` WRITE;
/*!40000 ALTER TABLE `ds_pxianshiquota` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_pxianshiquota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_rcblog`
--

DROP TABLE IF EXISTS `ds_rcblog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_rcblog` (
  `rcblog_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '余额变更日志自增ID',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `member_name` varchar(50) NOT NULL COMMENT '会员名称',
  `rcblog_type` varchar(15) NOT NULL DEFAULT '' COMMENT 'order_pay:下单使用 order_freeze:下单冻结 order_cancel:取消订单解冻 order_comb_pay:下单扣除被冻结 recharge:平台充值卡充值 refund:确认退款 vr_refund:虚拟兑码退款',
  `rcblog_addtime` int(11) NOT NULL COMMENT '变更添加时间',
  `available_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '可用充值卡余额变更 0表示未变更',
  `freeze_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '冻结充值卡余额变更 0表示未变更',
  `rcblog_description` varchar(150) DEFAULT NULL COMMENT '变更描述',
  PRIMARY KEY (`rcblog_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='充值卡余额变更日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_rcblog`
--

LOCK TABLES `ds_rcblog` WRITE;
/*!40000 ALTER TABLE `ds_rcblog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_rcblog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_rechargecard`
--

DROP TABLE IF EXISTS `ds_rechargecard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_rechargecard` (
  `rc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '充值卡自增ID',
  `rc_sn` varchar(50) NOT NULL COMMENT '充值卡卡号',
  `rc_denomination` decimal(10,2) NOT NULL COMMENT '充值卡面额',
  `rc_batchflag` varchar(20) NOT NULL COMMENT '充值卡批次标识',
  `rc_admin_name` varchar(50) DEFAULT NULL COMMENT '充值卡创建者名称',
  `rc_tscreated` int(10) unsigned NOT NULL COMMENT '充值卡创建时间',
  `rc_tsused` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '充值卡使用时间',
  `rc_state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '充值卡状态 0可用 1已用 2已删',
  `member_id` int(11) NOT NULL DEFAULT '0' COMMENT '使用者会员ID',
  `member_name` varchar(50) DEFAULT NULL COMMENT '使用者会员名称',
  PRIMARY KEY (`rc_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='平台充值卡';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_rechargecard`
--

LOCK TABLES `ds_rechargecard` WRITE;
/*!40000 ALTER TABLE `ds_rechargecard` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_rechargecard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_refundreason`
--

DROP TABLE IF EXISTS `ds_refundreason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_refundreason` (
  `reason_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '原因自增ID',
  `reason_info` varchar(50) NOT NULL COMMENT '原因内容',
  `reason_sort` tinyint(3) unsigned DEFAULT '255' COMMENT '退款退货原因排序',
  `reason_updatetime` int(10) unsigned NOT NULL COMMENT '退款退货原因更新时间',
  PRIMARY KEY (`reason_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='退款退货原因表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_refundreason`
--

LOCK TABLES `ds_refundreason` WRITE;
/*!40000 ALTER TABLE `ds_refundreason` DISABLE KEYS */;
INSERT INTO `ds_refundreason` VALUES (1,'效果不好不喜欢',1,1393480261),(2,'商品破损、有污渍',2,1393480261),(3,'保质期不符',3,1393480261),(4,'认为是假货',4,1393480261),(5,'不能按时发货',5,1393480261);
/*!40000 ALTER TABLE `ds_refundreason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_refundreturn`
--

DROP TABLE IF EXISTS `ds_refundreturn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_refundreturn` (
  `refund_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '退款退货记录自增ID',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `order_sn` varchar(20) NOT NULL COMMENT '订单编号',
  `refund_sn` varchar(50) NOT NULL COMMENT '申请编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(20) NOT NULL COMMENT '店铺名称',
  `buyer_id` int(10) unsigned NOT NULL COMMENT '买家ID',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家会员名',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID,0:全部退款',
  `order_goods_id` int(10) unsigned DEFAULT '0' COMMENT '订单商品ID,0:全部退款',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `goods_num` int(10) unsigned DEFAULT '1' COMMENT '商品数量',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `order_goods_type` tinyint(1) unsigned DEFAULT '1' COMMENT '订单商品类型:1:默认2:抢购商品3:限时折扣商品4:组合套装 5:赠品6:拼团7:会员等级折扣8:砍价',
  `refund_type` tinyint(1) unsigned DEFAULT '1' COMMENT '申请类型:1:退款,2:退货',
  `seller_state` tinyint(1) unsigned DEFAULT '1' COMMENT '卖家处理状态:1:待审核,2:同意,3:不同意',
  `refund_state` tinyint(1) unsigned DEFAULT '1' COMMENT '申请状态:1:处理中,2:待管理员处理,3:已完成,4:已拒绝',
  `return_type` tinyint(1) unsigned DEFAULT '1' COMMENT '退货类型:1:不用退货,2:需要退货',
  `order_lock` tinyint(1) unsigned DEFAULT '1' COMMENT '订单锁定类型:1:不用锁定,2:需要锁定',
  `goods_state` tinyint(1) unsigned DEFAULT '1' COMMENT '物流状态:1:待发货,2:待收货,3:未收到,4:已收货',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `seller_time` int(10) unsigned DEFAULT '0' COMMENT '卖家处理时间',
  `admin_time` int(10) unsigned DEFAULT '0' COMMENT '管理员处理时间',
  `reason_id` int(10) unsigned DEFAULT '0' COMMENT '原因ID:0:其它',
  `reason_info` varchar(300) DEFAULT '' COMMENT '原因内容',
  `pic_info` varchar(300) DEFAULT '' COMMENT '退款退货图片',
  `buyer_message` varchar(300) DEFAULT NULL COMMENT '退款退货申请原因',
  `seller_message` varchar(300) DEFAULT NULL COMMENT '卖家备注',
  `admin_message` varchar(300) DEFAULT NULL COMMENT '管理员备注',
  `express_id` tinyint(1) unsigned DEFAULT '0' COMMENT '物流公司编号',
  `invoice_no` varchar(50) DEFAULT NULL COMMENT '物流单号',
  `ship_time` int(10) unsigned DEFAULT '0' COMMENT '发货时间,默认为0',
  `delay_time` int(10) unsigned DEFAULT '0' COMMENT '收货延迟时间,默认为0',
  `receive_time` int(10) unsigned DEFAULT '0' COMMENT '收货时间,默认为0',
  `receive_message` varchar(300) DEFAULT NULL COMMENT '收货备注',
  `commis_rate` smallint(6) DEFAULT '0' COMMENT '佣金比例',
  PRIMARY KEY (`refund_id`),
  KEY `order_id` (`order_id`),
  KEY `store_id` (`store_id`),
  KEY `buyer_id` (`buyer_id`),
  KEY `order_goods_id` (`order_goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='退款退货表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_refundreturn`
--

LOCK TABLES `ds_refundreturn` WRITE;
/*!40000 ALTER TABLE `ds_refundreturn` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_refundreturn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_seller`
--

DROP TABLE IF EXISTS `ds_seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_seller` (
  `seller_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '卖家自增ID',
  `seller_name` varchar(50) NOT NULL COMMENT '卖家用户名',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `sellergroup_id` int(10) unsigned NOT NULL COMMENT '卖家组ID',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `is_admin` tinyint(3) unsigned NOT NULL COMMENT '是否管理员 0:不是 1:是',
  `last_logintime` int(10) unsigned DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`seller_id`),
  KEY `member_id` (`member_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='卖家用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_seller`
--

LOCK TABLES `ds_seller` WRITE;
/*!40000 ALTER TABLE `ds_seller` DISABLE KEYS */;
INSERT INTO `ds_seller` VALUES (1,'seller',1,0,1,1,1618220106),(2,'helly123',2,1,1,0,1607308814);
/*!40000 ALTER TABLE `ds_seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_sellergroup`
--

DROP TABLE IF EXISTS `ds_sellergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_sellergroup` (
  `sellergroup_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '卖家组自增ID',
  `sellergroup_name` varchar(50) NOT NULL COMMENT '卖家组名称',
  `sellergroup_limits` text NOT NULL COMMENT '卖家组权限',
  `smt_limits` text NOT NULL COMMENT '消卖家组息权限范围',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  PRIMARY KEY (`sellergroup_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='卖家用户组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_sellergroup`
--

LOCK TABLES `ds_sellergroup` WRITE;
/*!40000 ALTER TABLE `ds_sellergroup` DISABLE KEYS */;
INSERT INTO `ds_sellergroup` VALUES (1,'售后组','Sellerconsult|Sellercomplain|Sellerrefund|Sellerreturn','',1);
/*!40000 ALTER TABLE `ds_sellergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_sellerlog`
--

DROP TABLE IF EXISTS `ds_sellerlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_sellerlog` (
  `sellerlog_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '卖家日志自增ID',
  `sellerlog_content` varchar(100) NOT NULL COMMENT '卖家日志内容',
  `sellerlog_time` int(10) unsigned NOT NULL COMMENT '卖家日志时间',
  `sellerlog_seller_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '卖家ID',
  `sellerlog_seller_name` varchar(50) NOT NULL COMMENT '卖家帐号',
  `sellerlog_store_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `sellerlog_seller_ip` varchar(50) NOT NULL COMMENT '卖家ip',
  `sellerlog_url` varchar(100) NOT NULL COMMENT '卖家日志url',
  `sellerlog_state` tinyint(3) unsigned NOT NULL COMMENT '日志状态 0:失败 1:成功',
  PRIMARY KEY (`sellerlog_id`),
  KEY `sellerlog_seller_id` (`sellerlog_seller_id`),
  KEY `sellerlog_store_id` (`sellerlog_store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COMMENT='卖家日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_sellerlog`
--

LOCK TABLES `ds_sellerlog` WRITE;
/*!40000 ALTER TABLE `ds_sellerlog` DISABLE KEYS */;
INSERT INTO `ds_sellerlog` VALUES (1,'登录成功',1605515952,1,'seller',1,'14.120.77.49','home/Sellerlogin/login',1),(2,'登录成功',1605606510,1,'seller',1,'14.120.79.121','home/Sellerlogin/login',1),(3,'登录成功',1605669431,1,'seller',1,'14.120.79.121','home/Sellerlogin/login',1),(4,'登录成功',1606382418,1,'seller',1,'14.120.79.163','home/Sellerlogin/login',1),(5,'添加组成功，组编号1',1606382721,1,'seller',1,'14.120.79.163','home/Selleraccountgroup/group_save',1),(6,'添加账号成功，账号编号2',1606382903,1,'seller',1,'14.120.79.163','home/Selleraccount/account_add',1),(7,'注销成功',1606382946,1,'seller',1,'14.120.79.163','home/Sellerlogin/logout',1),(8,'登录成功',1606383499,1,'seller',1,'14.120.79.163','home/Sellerlogin/login',1),(9,'注销成功',1606386218,1,'seller',1,'14.120.79.163','home/Sellerlogin/logout',1),(10,'登录成功',1606733758,1,'seller',1,'14.120.76.218','home/Sellerlogin/login',1),(11,'登录成功',1606817540,1,'seller',1,'14.120.78.255','home/Sellerlogin/login',1),(12,'登录成功',1606894000,1,'seller',1,'120.235.59.205','home/Sellerlogin/login',1),(13,'登录成功',1606980115,1,'seller',1,'120.235.59.205','home/Sellerlogin/login',1),(14,'登录成功',1607087860,1,'seller',1,'120.235.59.205','home/Sellerlogin/login',1),(15,'注销成功',1607088903,1,'seller',1,'120.235.59.205','home/Sellerlogin/logout',1),(16,'登录成功',1607161222,1,'seller',1,'125.94.27.207','home/Sellerlogin/login',1),(17,'登录成功',1607162142,1,'seller',1,'125.94.27.207','home/Sellerlogin/login',1),(18,'注销成功',1607163789,1,'seller',1,'125.94.27.207','home/Sellerlogin/logout',1),(19,'登录成功',1607163820,1,'seller',1,'125.94.27.207','home/Sellerlogin/login',1),(20,'登录成功',1607309264,1,'seller',1,'14.120.77.98','home/Sellerlogin/login',1),(21,'登录成功',1608704576,1,'seller',1,'14.120.76.183','home/Sellerlogin/login',1),(22,'注销成功',1608704957,1,'seller',1,'14.120.76.183','home/Sellerlogin/logout',1),(23,'登录成功',1609236772,1,'seller',1,'14.120.77.52','home/Sellerlogin/login',1),(24,'注销成功',1609237438,1,'seller',1,'14.120.77.52','home/Sellerlogin/logout',1),(25,'登录成功',1609380971,1,'seller',1,'108.162.215.61','home/Sellerlogin/login',1),(26,'注销成功',1609381803,1,'seller',1,'172.69.35.196','home/Sellerlogin/logout',1),(27,'登录成功',1609396963,1,'seller',1,'172.69.35.196','home/Sellerlogin/login',1),(28,'登录成功',1609741383,1,'seller',1,'108.162.215.225','home/Sellerlogin/login',1),(29,'登录成功',1609742099,1,'seller',1,'172.69.35.194','home/Sellerlogin/login',1),(30,'登录成功',1609815504,1,'seller',1,'172.69.33.208','home/Sellerlogin/login',1),(31,'编辑商品，平台货号：118',1609815634,1,'seller',1,'172.69.33.208','home/Sellergoodsonline/edit_save_goods',1),(32,'登录成功',1609816739,1,'seller',1,'172.69.34.15','home/Sellerlogin/login',1),(33,'登录成功',1609828892,1,'seller',1,'108.162.215.119','home/Sellerlogin/login',1),(34,'编辑商品，平台货号：118',1609828958,1,'seller',1,'172.69.33.208','home/Sellergoodsonline/edit_save_goods',1),(35,'编辑商品，平台货号：118',1609829923,1,'seller',1,'172.69.34.247','home/Sellergoodsonline/edit_save_goods',1),(36,'编辑商品，平台货号：118',1609829957,1,'seller',1,'108.162.215.111','home/Sellergoodsonline/edit_save_goods',1),(37,'编辑商品，平台货号：118',1609830541,1,'seller',1,'108.162.215.119','home/Sellergoodsonline/edit_save_goods',1),(38,'登录成功',1609898181,1,'seller',1,'172.69.34.207','home/Sellerlogin/login',1),(39,'登录成功',1609983746,1,'seller',1,'172.69.34.15','home/Sellerlogin/login',1),(40,'登录成功',1610069278,1,'seller',1,'108.162.215.119','home/Sellerlogin/login',1),(41,'登录成功',1610251012,1,'seller',1,'162.158.167.77','home/Sellerlogin/login',1),(42,'登录成功',1610333208,1,'seller',1,'162.158.166.122','home/Sellerlogin/login',1),(43,'登录成功',1612578970,1,'seller',1,'172.69.35.77','home/Sellerlogin/login',1),(44,'登录成功',1612641933,1,'seller',1,'108.162.212.147','home/Sellerlogin/login',1),(45,'添加商品，平台货号:119',1612642178,1,'seller',1,'108.162.212.147','home/Sellergoodsadd/save_goods',1),(46,'添加商品，平台货号:120',1612642180,1,'seller',1,'108.162.212.147','home/Sellergoodsadd/save_goods',1),(47,'登录成功',1612792009,1,'seller',1,'172.68.189.221','home/Sellerlogin/login',1),(48,'登录成功',1614395578,1,'seller',1,'162.158.179.122','home/Sellerlogin/login',1),(49,'登录成功',1614396417,1,'seller',1,'162.158.179.122','home/Sellerlogin/login',1),(50,'登录成功',1614434570,1,'seller',1,'162.158.165.192','home/Sellerlogin/login',1),(51,'登录成功',1615817418,1,'seller',1,'172.69.34.150','home/Sellerlogin/login',1),(52,'登录成功',1615944630,1,'seller',1,'172.69.34.194','home/Sellerlogin/login',1),(53,'删除商品，平台货号：119',1615947352,1,'seller',1,'172.69.33.37','home/Sellergoodsonline/drop_goods',1),(54,'删除商品，平台货号：120',1615947358,1,'seller',1,'172.69.33.37','home/Sellergoodsonline/drop_goods',1),(55,'登录成功',1615990460,1,'seller',1,'172.69.33.139','home/Sellerlogin/login',1),(56,'编辑商品，平台货号：118',1616004072,1,'seller',1,'172.69.33.37','home/Sellergoodsonline/edit_save_goods',1),(57,'登录成功',1616036120,1,'seller',1,'172.69.33.131','home/Sellerlogin/login',1),(58,'登录成功',1616709261,1,'seller',1,'172.69.170.152','home/Sellerlogin/login',1),(59,'登录成功',1616709622,1,'seller',1,'172.69.170.152','home/Sellerlogin/login',1),(60,'登录成功',1617200297,1,'seller',1,'172.69.35.6','home/Sellerlogin/login',1),(61,'登录成功',1617200334,1,'seller',1,'172.69.35.84','home/Sellerlogin/login',1),(62,'登录成功',1617550307,1,'seller',1,'172.69.170.62','home/Sellerlogin/login',1),(63,'登录成功',1617550308,1,'seller',1,'172.69.170.62','home/Sellerlogin/login',1),(64,'删除商品，平台货号：118,117,116,115,114,113,112,111,110,109',1617550347,1,'seller',1,'172.69.170.62','home/Sellergoodsonline/drop_goods',1),(65,'删除商品，平台货号：108,107,106,105,104,103,102,101,100,99',1617550365,1,'seller',1,'172.69.170.62','home/Sellergoodsonline/drop_goods',1),(66,'删除商品，平台货号：98,97,96,95,94,93,92,91,90,89',1617550375,1,'seller',1,'172.69.170.62','home/Sellergoodsonline/drop_goods',1),(67,'删除商品，平台货号：88,87,86,85,84,83,82,81,80,79',1617550382,1,'seller',1,'172.69.170.62','home/Sellergoodsonline/drop_goods',1),(68,'商品下架，平台货号：78,77,76,75,74,73,72,71,70,68',1617550390,1,'seller',1,'172.69.170.62','home/Sellergoodsonline/goods_unshow',1),(69,'商品下架，平台货号：67,66,65,64,63,62,61,60,59,58',1617550394,1,'seller',1,'172.69.170.62','home/Sellergoodsonline/goods_unshow',1),(70,'商品下架，平台货号：57,56,55,54,53,52,51,50,49,48',1617550399,1,'seller',1,'172.69.170.62','home/Sellergoodsonline/goods_unshow',1),(71,'商品下架，平台货号：47,46,45,44,43,42,41,40,39,37',1617550403,1,'seller',1,'172.69.170.62','home/Sellergoodsonline/goods_unshow',1),(72,'商品下架，平台货号：36,34,33,32,31,30,29,28,27,26',1617550408,1,'seller',1,'172.69.170.62','home/Sellergoodsonline/goods_unshow',1),(73,'商品下架，平台货号：25,24,23,22,21,20,19,18,17,16',1617550412,1,'seller',1,'172.69.170.62','home/Sellergoodsonline/goods_unshow',1),(74,'商品下架，平台货号：15,14,13,12,11,10,9,8,7,6',1617550417,1,'seller',1,'172.69.170.62','home/Sellergoodsonline/goods_unshow',1),(75,'商品下架，平台货号：5,4,3',1617550422,1,'seller',1,'172.69.170.62','home/Sellergoodsonline/goods_unshow',1),(76,'商品上架，平台货号：78',1617550769,1,'seller',1,'172.69.170.62','home/Sellergoodsoffline/goods_show',1),(77,'登录成功',1617652269,1,'seller',1,'108.162.237.134','home/Sellerlogin/login',1),(78,'登录成功',1617652271,1,'seller',1,'108.162.237.134','home/Sellerlogin/login',1),(79,'添加商品，平台货号:121',1617652950,1,'seller',1,'108.162.237.134','home/Sellergoodsadd/save_goods',1),(80,'登录成功',1617653109,1,'seller',1,'108.162.237.134','home/Sellerlogin/login',1),(81,'登录成功',1617653111,1,'seller',1,'108.162.237.134','home/Sellerlogin/login',1),(82,'编辑商品，平台货号：121',1617653180,1,'seller',1,'108.162.237.134','home/Sellergoodsonline/edit_save_goods',1),(83,'编辑商品，平台货号：121',1617653181,1,'seller',1,'108.162.237.134','home/Sellergoodsonline/edit_save_goods',1),(84,'编辑商品，平台货号：121',1617653366,1,'seller',1,'108.162.237.134','home/Sellergoodsonline/edit_save_goods',1),(85,'添加商品，平台货号:122',1617655522,1,'seller',1,'172.68.65.76','home/Sellergoodsadd/save_goods',1),(86,'添加商品，平台货号:123',1617655524,1,'seller',1,'172.68.65.76','home/Sellergoodsadd/save_goods',1),(87,'删除商品，平台货号：123',1617655615,1,'seller',1,'172.68.65.76','home/Sellergoodsonline/drop_goods',1),(88,'编辑商品，平台货号：122',1617655667,1,'seller',1,'172.68.65.76','home/Sellergoodsonline/edit_save_goods',1),(89,'编辑商品，平台货号：122',1617655717,1,'seller',1,'172.68.65.76','home/Sellergoodsonline/edit_save_goods',1),(90,'登录成功',1617655884,1,'seller',1,'172.68.65.226','home/Sellerlogin/login',1),(91,'登录成功',1617656623,1,'seller',1,'172.68.77.4','home/Sellerlogin/login',1),(92,'添加商品，平台货号:124',1617656857,1,'seller',1,'172.68.77.4','home/Sellergoodsadd/save_goods',1),(93,'添加商品，平台货号:125',1617657161,1,'seller',1,'172.68.77.4','home/Sellergoodsadd/save_goods',1),(94,'添加商品，平台货号:126',1617658182,1,'seller',1,'172.68.77.4','home/Sellergoodsadd/save_goods',1),(95,'添加商品，平台货号:127',1617658766,1,'seller',1,'172.68.77.4','home/Sellergoodsadd/save_goods',1),(96,'添加商品，平台货号:128',1617658768,1,'seller',1,'172.68.77.4','home/Sellergoodsadd/save_goods',1),(97,'编辑商品，平台货号：128',1617659289,1,'seller',1,'172.68.77.4','home/Sellergoodsonline/edit_save_goods',1),(98,'编辑商品，平台货号：126',1617659364,1,'seller',1,'172.68.77.4','home/Sellergoodsonline/edit_save_goods',1),(99,'编辑商品，平台货号：126',1617659364,1,'seller',1,'172.68.77.4','home/Sellergoodsonline/edit_save_goods',1),(100,'编辑商品，平台货号：126',1617659365,1,'seller',1,'172.68.77.4','home/Sellergoodsonline/edit_save_goods',1),(101,'添加商品，平台货号:129',1617659681,1,'seller',1,'172.68.77.4','home/Sellergoodsadd/save_goods',1),(102,'添加商品，平台货号:130',1617659681,1,'seller',1,'172.68.77.4','home/Sellergoodsadd/save_goods',1),(103,'登录成功',1617722782,1,'seller',1,'172.69.35.84','home/Sellerlogin/login',1),(104,'登录成功',1617892920,1,'seller',1,'162.158.63.248','home/Sellerlogin/login',1),(105,'登录成功',1617892921,1,'seller',1,'162.158.63.248','home/Sellerlogin/login',1),(106,'添加商品，平台货号:131',1617893373,1,'seller',1,'162.158.63.248','home/Sellergoodsadd/save_goods',1),(107,'添加商品，平台货号:132',1617914958,1,'seller',1,'108.162.237.254','home/Sellergoodsadd/save_goods',1),(108,'添加商品，平台货号:133',1617918392,1,'seller',1,'172.69.170.136','home/Sellergoodsadd/save_goods',1),(109,'登录成功',1617972079,1,'seller',1,'172.69.170.136','home/Sellerlogin/login',1),(110,'登录成功',1617972080,1,'seller',1,'172.69.170.136','home/Sellerlogin/login',1),(111,'删除商品，平台货号：132',1617972107,1,'seller',1,'172.69.170.136','home/Sellergoodsonline/drop_goods',1),(112,'添加商品，平台货号:134',1617973132,1,'seller',1,'172.69.170.136','home/Sellergoodsadd/save_goods',1),(113,'编辑商品，平台货号：134',1617973355,1,'seller',1,'172.69.170.136','home/Sellergoodsonline/edit_save_goods',1),(114,'登录成功',1617973919,1,'seller',1,'172.69.170.136','home/Sellerlogin/login',1),(115,'添加商品，平台货号:135',1617974524,1,'seller',1,'172.69.170.137','home/Sellergoodsadd/save_goods',1),(116,'登录成功',1617974720,1,'seller',1,'172.69.170.136','home/Sellerlogin/login',1),(117,'登录成功',1617974761,1,'seller',1,'172.69.170.136','home/Sellerlogin/login',1),(118,'登录成功',1617974952,1,'seller',1,'172.69.170.136','home/Sellerlogin/login',1),(119,'编辑商品，平台货号：134',1617975091,1,'seller',1,'172.69.170.136','home/Sellergoodsonline/edit_save_goods',1),(120,'添加商品，平台货号:136',1617975255,1,'seller',1,'172.69.170.136','home/Sellergoodsadd/save_goods',1),(121,'添加商品，平台货号:137',1617976069,1,'seller',1,'172.69.170.136','home/Sellergoodsadd/save_goods',1),(122,'添加商品，平台货号:138',1617976877,1,'seller',1,'172.69.170.118','home/Sellergoodsadd/save_goods',1),(123,'添加商品，平台货号:139',1617977138,1,'seller',1,'172.69.170.118','home/Sellergoodsadd/save_goods',1),(124,'添加商品，平台货号:140',1617977397,1,'seller',1,'172.69.170.118','home/Sellergoodsadd/save_goods',1),(125,'添加商品，平台货号:141',1617977582,1,'seller',1,'172.69.170.118','home/Sellergoodsadd/save_goods',1),(126,'添加商品，平台货号:142',1617978319,1,'seller',1,'172.69.170.118','home/Sellergoodsadd/save_goods',1),(127,'添加商品，平台货号:143',1617978594,1,'seller',1,'172.69.170.118','home/Sellergoodsadd/save_goods',1),(128,'添加商品，平台货号:144',1617979087,1,'seller',1,'172.69.170.118','home/Sellergoodsadd/save_goods',1),(129,'添加商品，平台货号:145',1617979527,1,'seller',1,'172.69.170.118','home/Sellergoodsadd/save_goods',1),(130,'添加商品，平台货号:146',1617979687,1,'seller',1,'172.69.170.118','home/Sellergoodsadd/save_goods',1),(131,'添加商品，平台货号:147',1617979828,1,'seller',1,'172.69.170.118','home/Sellergoodsadd/save_goods',1),(132,'添加商品，平台货号:148',1617980184,1,'seller',1,'172.69.170.118','home/Sellergoodsadd/save_goods',1),(133,'添加商品，平台货号:149',1617982430,1,'seller',1,'172.69.170.119','home/Sellergoodsadd/save_goods',1),(134,'添加商品，平台货号:150',1617996167,1,'seller',1,'162.158.63.20','home/Sellergoodsadd/save_goods',1),(135,'登录成功',1618060770,1,'seller',1,'108.162.210.220','home/Sellerlogin/login',1),(136,'编辑商品，平台货号：150',1618060851,1,'seller',1,'108.162.210.220','home/Sellergoodsonline/edit_save_goods',1),(137,'编辑商品，平台货号：150',1618060871,1,'seller',1,'108.162.210.220','home/Sellergoodsonline/edit_save_goods',1),(138,'编辑商品，平台货号：150',1618060871,1,'seller',1,'108.162.210.220','home/Sellergoodsonline/edit_save_goods',1),(139,'编辑商品，平台货号：150',1618060903,1,'seller',1,'108.162.210.220','home/Sellergoodsonline/edit_save_goods',1),(140,'编辑商品，平台货号：150',1618060904,1,'seller',1,'108.162.210.220','home/Sellergoodsonline/edit_save_goods',1),(141,'注销成功',1618060915,1,'seller',1,'108.162.210.221','home/Sellerlogin/logout',1),(142,'登录成功',1618060937,1,'seller',1,'108.162.210.220','home/Sellerlogin/login',1),(143,'登录成功',1618060988,1,'seller',1,'108.162.210.220','home/Sellerlogin/login',1),(144,'添加商品，平台货号:151',1618066480,1,'seller',1,'172.70.34.74','home/Sellergoodsadd/save_goods',1),(145,'添加商品，平台货号:152',1618066651,1,'seller',1,'172.70.34.74','home/Sellergoodsadd/save_goods',1),(146,'添加商品，平台货号:153',1618066772,1,'seller',1,'172.70.34.74','home/Sellergoodsadd/save_goods',1),(147,'添加商品，平台货号:154',1618066855,1,'seller',1,'172.70.34.74','home/Sellergoodsadd/save_goods',1),(148,'添加商品，平台货号:155',1618068558,1,'seller',1,'172.70.34.74','home/Sellergoodsadd/save_goods',1),(149,'添加商品，平台货号:156',1618068849,1,'seller',1,'172.70.34.74','home/Sellergoodsadd/save_goods',1),(150,'添加商品，平台货号:157',1618069100,1,'seller',1,'172.70.34.74','home/Sellergoodsadd/save_goods',1),(151,'添加商品，平台货号:158',1618069477,1,'seller',1,'172.70.34.74','home/Sellergoodsadd/save_goods',1),(152,'添加商品，平台货号:159',1618069789,1,'seller',1,'172.70.34.74','home/Sellergoodsadd/save_goods',1),(153,'添加商品，平台货号:160',1618069886,1,'seller',1,'172.70.34.74','home/Sellergoodsadd/save_goods',1),(154,'添加商品，平台货号:161',1618070049,1,'seller',1,'172.70.34.74','home/Sellergoodsadd/save_goods',1),(155,'添加商品，平台货号:162',1618070236,1,'seller',1,'172.70.34.74','home/Sellergoodsadd/save_goods',1),(156,'添加商品，平台货号:163',1618070378,1,'seller',1,'172.70.34.74','home/Sellergoodsadd/save_goods',1),(157,'添加商品，平台货号:164',1618070596,1,'seller',1,'172.70.34.74','home/Sellergoodsadd/save_goods',1),(158,'添加商品，平台货号:165',1618070980,1,'seller',1,'172.70.34.75','home/Sellergoodsadd/save_goods',1),(159,'添加商品，平台货号:166',1618071123,1,'seller',1,'172.70.34.74','home/Sellergoodsadd/save_goods',1),(160,'添加商品，平台货号:167',1618074597,1,'seller',1,'108.162.212.79','home/Sellergoodsadd/save_goods',1),(161,'添加商品，平台货号:168',1618074811,1,'seller',1,'108.162.212.79','home/Sellergoodsadd/save_goods',1),(162,'添加商品，平台货号:169',1618074907,1,'seller',1,'108.162.212.79','home/Sellergoodsadd/save_goods',1),(163,'添加商品，平台货号:170',1618075038,1,'seller',1,'108.162.212.79','home/Sellergoodsadd/save_goods',1),(164,'添加商品，平台货号:171',1618075138,1,'seller',1,'108.162.212.79','home/Sellergoodsadd/save_goods',1),(165,'添加商品，平台货号:172',1618075237,1,'seller',1,'108.162.212.79','home/Sellergoodsadd/save_goods',1),(166,'添加商品，平台货号:173',1618075369,1,'seller',1,'108.162.212.79','home/Sellergoodsadd/save_goods',1),(167,'添加商品，平台货号:174',1618075548,1,'seller',1,'108.162.212.79','home/Sellergoodsadd/save_goods',1),(168,'添加商品，平台货号:175',1618075650,1,'seller',1,'108.162.212.79','home/Sellergoodsadd/save_goods',1),(169,'添加商品，平台货号:176',1618075761,1,'seller',1,'108.162.212.79','home/Sellergoodsadd/save_goods',1),(170,'添加商品，平台货号:177',1618075868,1,'seller',1,'108.162.212.79','home/Sellergoodsadd/save_goods',1),(171,'添加商品，平台货号:178',1618076056,1,'seller',1,'108.162.212.79','home/Sellergoodsadd/save_goods',1),(172,'添加商品，平台货号:179',1618082414,1,'seller',1,'162.158.122.8','home/Sellergoodsadd/save_goods',1),(173,'添加商品，平台货号:180',1618082549,1,'seller',1,'162.158.122.8','home/Sellergoodsadd/save_goods',1),(174,'添加商品，平台货号:181',1618082637,1,'seller',1,'162.158.122.8','home/Sellergoodsadd/save_goods',1),(175,'添加商品，平台货号:182',1618083402,1,'seller',1,'162.158.122.8','home/Sellergoodsadd/save_goods',1),(176,'添加商品，平台货号:183',1618083585,1,'seller',1,'162.158.122.8','home/Sellergoodsadd/save_goods',1),(177,'添加商品，平台货号:184',1618083778,1,'seller',1,'162.158.122.8','home/Sellergoodsadd/save_goods',1),(178,'添加商品，平台货号:185',1618083920,1,'seller',1,'162.158.122.8','home/Sellergoodsadd/save_goods',1),(179,'添加商品，平台货号:186',1618084077,1,'seller',1,'162.158.122.8','home/Sellergoodsadd/save_goods',1),(180,'添加商品，平台货号:187',1618085092,1,'seller',1,'162.158.122.8','home/Sellergoodsadd/save_goods',1),(181,'登录成功',1618085162,1,'seller',1,'162.158.122.8','home/Sellerlogin/login',1),(182,'编辑商品，平台货号：187',1618085217,1,'seller',1,'162.158.122.8','home/Sellergoodsonline/edit_save_goods',1),(183,'登录成功',1618086165,1,'seller',1,'162.158.122.8','home/Sellerlogin/login',1),(184,'编辑商品，平台货号：125',1618086290,1,'seller',1,'162.158.122.8','home/Sellergoodsonline/edit_save_goods',1),(185,'登录成功',1618113051,1,'seller',1,'172.69.33.241','home/Sellerlogin/login',1),(186,'登录成功',1618214586,1,'seller',1,'172.69.34.76','home/Sellerlogin/login',1),(187,'编辑商品，平台货号：187',1618215089,1,'seller',1,'172.69.22.246','home/Sellergoodsonline/edit_save_goods',1),(188,'编辑商品，平台货号：187',1618215425,1,'seller',1,'172.69.34.36','home/Sellergoodsonline/edit_save_goods',1),(189,'登录成功',1618219462,1,'seller',1,'172.69.22.101','home/Sellerlogin/login',1),(190,'登录成功',1618219463,1,'seller',1,'172.69.22.102','home/Sellerlogin/login',1),(191,'注销成功',1618219797,1,'seller',1,'172.69.35.51','home/Sellerlogin/logout',1),(192,'登录成功',1618220106,1,'seller',1,'172.69.35.51','home/Sellerlogin/login',1),(193,'注销成功',1618220125,1,'seller',1,'172.69.35.51','home/Sellerlogin/logout',1);
/*!40000 ALTER TABLE `ds_sellerlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_seo`
--

DROP TABLE IF EXISTS `ds_seo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_seo` (
  `seo_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT 'SEO自增ID',
  `seo_title` varchar(255) NOT NULL COMMENT 'SEO标题',
  `seo_keywords` varchar(255) NOT NULL COMMENT 'SEO关键词',
  `seo_description` text NOT NULL COMMENT 'SEO描述',
  `seo_type` varchar(20) NOT NULL COMMENT 'SEO类型',
  PRIMARY KEY (`seo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='SEO信息存放表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_seo`
--

LOCK TABLES `ds_seo` WRITE;
/*!40000 ALTER TABLE `ds_seo` DISABLE KEYS */;
INSERT INTO `ds_seo` VALUES (1,'{sitename}','{sitename}','{sitename}','index'),(2,'{sitename} - 抢购','{sitename}','{sitename} - 抢购','group'),(3,'{sitename} - {name}','{name},{sitename}','{name},{sitename}','group_content'),(4,'{sitename} - 品牌','{sitename}','{sitename}','brand'),(5,'{sitename} - {name}','{sitename},{name}','{sitename},{name}','brand_list'),(7,'{sitename} - {name}','DSMALL,{sitename},{name}','DSMALL,{sitename},{name}','coupon_content'),(8,'{sitename} - 积分商城','{sitename}','{sitename}','point'),(9,'{sitename} - {name}','{sitename},{key}','{sitename},{description}','point_content'),(10,'{sitename} - {article_class}','{sitename}','{sitename}','article'),(11,'{sitename} - {name}','{sitename},{key}','{sitename},{description}','article_content'),(12,'{sitename} - {shopname}','{sitename},{key}','{sitename},{description}','shop'),(13,'{name} - {sitename}','{sitename},{key}','{sitename},{description}','product'),(14,'看{name}怎么淘到好的宝贝-{sitename}','DSMALL,{sitename},{name}','DSMALL,{sitename},{name}','sns');
/*!40000 ALTER TABLE `ds_seo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_smslog`
--

DROP TABLE IF EXISTS `ds_smslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_smslog` (
  `smslog_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '短信记录自增ID',
  `smslog_phone` char(11) NOT NULL COMMENT '短信手机号',
  `smslog_captcha` char(6) NOT NULL COMMENT '短信动态码',
  `smslog_ip` varchar(15) NOT NULL COMMENT '短信请求IP',
  `smslog_msg` varchar(300) NOT NULL COMMENT '短信内容',
  `smslog_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '短信类型:1为注册,2为登录,3为找回密码,4绑定手机,5安全验证,默认为1',
  `smslog_smstime` int(10) unsigned NOT NULL COMMENT '短信添加时间',
  `member_id` int(10) unsigned DEFAULT '0' COMMENT '短信会员ID,注册为0',
  `member_name` varchar(50) DEFAULT '' COMMENT '短信会员名',
  PRIMARY KEY (`smslog_id`),
  KEY `smslog_phone` (`smslog_phone`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='手机短信记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_smslog`
--

LOCK TABLES `ds_smslog` WRITE;
/*!40000 ALTER TABLE `ds_smslog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_smslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_snsalbumclass`
--

DROP TABLE IF EXISTS `ds_snsalbumclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_snsalbumclass` (
  `ac_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册自增ID',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `ac_name` varchar(100) NOT NULL COMMENT '相册名称',
  `ac_des` varchar(255) NOT NULL COMMENT '相册描述',
  `ac_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '相册排序',
  `ac_cover` varchar(255) DEFAULT NULL COMMENT '相册封面',
  `ac_uploadtime` int(10) unsigned NOT NULL COMMENT '图片上传时间',
  `ac_isdefault` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为买家秀相册  1:是 0:否',
  PRIMARY KEY (`ac_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='相册表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_snsalbumclass`
--

LOCK TABLES `ds_snsalbumclass` WRITE;
/*!40000 ALTER TABLE `ds_snsalbumclass` DISABLE KEYS */;
INSERT INTO `ds_snsalbumclass` VALUES (1,2,'买家秀','买家秀默认相册',255,NULL,1606382639,1),(2,3,'买家秀','买家秀默认相册',255,NULL,1606729630,1),(3,4,'买家秀','买家秀默认相册',255,NULL,1607086531,1),(4,5,'买家秀','买家秀默认相册',255,NULL,1607311708,1),(5,6,'买家秀','买家秀默认相册',255,NULL,1609395011,1),(6,7,'买家秀','买家秀默认相册',255,NULL,1610481918,1),(7,8,'买家秀','买家秀默认相册',255,NULL,1610493740,1),(8,9,'买家秀','买家秀默认相册',255,NULL,1610493757,1),(9,10,'买家秀','买家秀默认相册',255,NULL,1610493773,1),(10,11,'买家秀','买家秀默认相册',255,NULL,1610498072,1),(11,12,'买家秀','买家秀默认相册',255,NULL,1614598663,1),(12,13,'买家秀','买家秀默认相册',255,NULL,1614598687,1),(13,14,'买家秀','买家秀默认相册',255,NULL,1614598712,1),(14,15,'买家秀','买家秀默认相册',255,NULL,1615143298,1),(15,16,'买家秀','买家秀默认相册',255,NULL,1615172692,1),(16,17,'买家秀','买家秀默认相册',255,NULL,1615172743,1),(17,18,'买家秀','买家秀默认相册',255,NULL,1615836236,1),(18,19,'买家秀','买家秀默认相册',255,NULL,1615930071,1),(19,20,'买家秀','买家秀默认相册',255,NULL,1616074410,1),(20,21,'买家秀','买家秀默认相册',255,NULL,1616262581,1),(21,22,'买家秀','买家秀默认相册',255,NULL,1616446324,1),(22,23,'买家秀','买家秀默认相册',255,NULL,1616446336,1),(23,24,'买家秀','买家秀默认相册',255,NULL,1616509264,1),(24,25,'买家秀','买家秀默认相册',255,NULL,1616530831,1),(25,26,'买家秀','买家秀默认相册',255,NULL,1616530836,1),(26,27,'买家秀','买家秀默认相册',255,NULL,1617552784,1),(27,28,'买家秀','买家秀默认相册',255,NULL,1617552797,1),(28,29,'买家秀','买家秀默认相册',255,NULL,1617628168,1),(29,30,'Comprar un espectáculo familiar','álbum predeterminado del programa del comprador',255,NULL,1617628560,1),(30,31,'Comprar un espectáculo familiar','álbum predeterminado del programa del comprador',255,NULL,1617647891,1),(31,32,'Comprar un espectáculo familiar','álbum predeterminado del programa del comprador',255,NULL,1617654114,1),(32,33,'Comprar un espectáculo familiar','álbum predeterminado del programa del comprador',255,NULL,1617654115,1);
/*!40000 ALTER TABLE `ds_snsalbumclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_snsalbumpic`
--

DROP TABLE IF EXISTS `ds_snsalbumpic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_snsalbumpic` (
  `ap_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册图片自增ID',
  `ac_id` int(10) unsigned DEFAULT NULL COMMENT '相册ID',
  `member_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `ap_name` varchar(100) NOT NULL COMMENT '图片名称',
  `ap_cover` varchar(255) NOT NULL COMMENT '图片路径',
  `ap_size` int(10) unsigned NOT NULL COMMENT '图片大小',
  `ap_spec` varchar(100) NOT NULL COMMENT '图片规格',
  `ap_uploadtime` int(10) unsigned NOT NULL COMMENT '图片上传时间',
  `ap_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '图片类型，0为无、1为买家秀',
  `item_id` tinyint(4) NOT NULL DEFAULT '0' COMMENT '信息ID',
  PRIMARY KEY (`ap_id`),
  KEY `member_id` (`member_id`),
  KEY `ac_id` (`ac_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='相册图片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_snsalbumpic`
--

LOCK TABLES `ds_snsalbumpic` WRITE;
/*!40000 ALTER TABLE `ds_snsalbumpic` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_snsalbumpic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_snsfriend`
--

DROP TABLE IF EXISTS `ds_snsfriend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_snsfriend` (
  `friend_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '好友自增ID',
  `friend_frommid` int(11) NOT NULL COMMENT '会员ID',
  `friend_frommname` varchar(100) DEFAULT NULL COMMENT '会员名称',
  `friend_frommavatar` varchar(100) DEFAULT NULL COMMENT '会员头像',
  `friend_tomid` int(11) NOT NULL COMMENT '朋友ID',
  `friend_tomname` varchar(100) NOT NULL COMMENT '好友会员名称',
  `friend_tomavatar` varchar(100) DEFAULT NULL COMMENT '好友头像',
  `friend_addtime` int(11) NOT NULL COMMENT '好友添加时间',
  `friend_followstate` tinyint(1) NOT NULL DEFAULT '1' COMMENT '关注状态 1:单方关注 2:双方关注',
  PRIMARY KEY (`friend_id`),
  KEY `friend_frommid` (`friend_frommid`),
  KEY `friend_tomid` (`friend_tomid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='好友数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_snsfriend`
--

LOCK TABLES `ds_snsfriend` WRITE;
/*!40000 ALTER TABLE `ds_snsfriend` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_snsfriend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_snsmembertag`
--

DROP TABLE IF EXISTS `ds_snsmembertag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_snsmembertag` (
  `mtag_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '会员标签自增ID',
  `mtag_name` varchar(20) NOT NULL COMMENT '会员标签名称',
  `mtag_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '会员标签排序',
  `mtag_recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '标签推荐 0:未推荐 1:已推荐',
  `mtag_desc` varchar(50) NOT NULL COMMENT '标签描述',
  `mtag_img` varchar(50) DEFAULT NULL COMMENT '标签图片',
  PRIMARY KEY (`mtag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_snsmembertag`
--

LOCK TABLES `ds_snsmembertag` WRITE;
/*!40000 ALTER TABLE `ds_snsmembertag` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_snsmembertag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_snsmtagmember`
--

DROP TABLE IF EXISTS `ds_snsmtagmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_snsmtagmember` (
  `mtag_id` int(11) NOT NULL COMMENT '会员标签表ID',
  `member_id` int(11) NOT NULL COMMENT '会员ID',
  `recommend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '推荐，默认为0',
  PRIMARY KEY (`mtag_id`,`member_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员标签会员对照表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_snsmtagmember`
--

LOCK TABLES `ds_snsmtagmember` WRITE;
/*!40000 ALTER TABLE `ds_snsmtagmember` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_snsmtagmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_spec`
--

DROP TABLE IF EXISTS `ds_spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_spec` (
  `sp_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格自增ID',
  `sp_name` varchar(100) NOT NULL COMMENT '规格名称',
  `sp_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '规格排序',
  `gc_id` int(10) unsigned DEFAULT '0' COMMENT '所属商品分类id',
  `gc_name` varchar(100) DEFAULT NULL COMMENT '所属商品分类名称',
  PRIMARY KEY (`sp_id`),
  KEY `gc_id` (`gc_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商品规格表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_spec`
--

LOCK TABLES `ds_spec` WRITE;
/*!40000 ALTER TABLE `ds_spec` DISABLE KEYS */;
INSERT INTO `ds_spec` VALUES (1,'Estilo',0,4,'电视/ 空调/ 冰箱/ 洗衣机'),(2,'Color',0,39,'女装'),(3,'Talla',0,15,'男装/ 女装/ 内衣');
/*!40000 ALTER TABLE `ds_spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_specvalue`
--

DROP TABLE IF EXISTS `ds_specvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_specvalue` (
  `spvalue_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格值自增ID',
  `spvalue_name` varchar(100) NOT NULL COMMENT '规格值名称',
  `sp_id` int(10) unsigned NOT NULL COMMENT '所属规格ID',
  `gc_id` int(10) unsigned NOT NULL COMMENT '分类ID',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `spvalue_color` varchar(10) DEFAULT NULL COMMENT '规格颜色',
  `spvalue_sort` tinyint(1) unsigned NOT NULL COMMENT '规格排序',
  PRIMARY KEY (`spvalue_id`),
  KEY `store_id` (`store_id`),
  KEY `sp_id` (`sp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 COMMENT='商品规格值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_specvalue`
--

LOCK TABLES `ds_specvalue` WRITE;
/*!40000 ALTER TABLE `ds_specvalue` DISABLE KEYS */;
INSERT INTO `ds_specvalue` VALUES (1,'红',2,39,1,NULL,0),(2,'蓝',2,39,1,NULL,0),(3,'黑',2,39,1,NULL,0),(4,'白',2,39,1,NULL,0),(8,'M',3,39,1,NULL,0),(9,'L',3,39,1,NULL,0),(10,'XL',3,39,1,NULL,0),(11,'蓝',2,21,1,NULL,0),(12,'黑',2,21,1,NULL,0),(13,'红',2,21,1,NULL,0),(14,'黑',2,23,1,NULL,0),(15,'4G',1,23,1,NULL,0),(16,'3G',1,23,1,NULL,0),(17,'黑',2,24,1,NULL,0),(18,'白',2,24,1,NULL,0),(19,'粉色',2,25,1,NULL,0),(20,'紫色',2,25,1,NULL,0),(21,'蓝色',2,25,1,NULL,0),(22,'1.5M',3,25,1,NULL,0),(23,'1.6',3,25,1,NULL,0),(24,'1.7',3,25,1,NULL,0),(25,'黄',2,25,1,NULL,0),(26,'1.5',3,26,1,NULL,0),(27,'1.8',3,26,1,NULL,0),(28,'红',2,26,1,NULL,0),(29,'紫',2,26,1,NULL,0),(30,'白',2,26,1,NULL,0),(31,'两口之家',1,27,1,NULL,0),(32,'三口之家',1,27,1,NULL,0),(33,'四口之家',1,27,1,NULL,0),(34,'清爽西瓜味',2,28,1,NULL,0),(35,'草莓味',2,28,1,NULL,0),(36,'45度',3,29,1,NULL,0),(37,'52度',3,29,1,NULL,0),(38,'蓝',2,29,1,NULL,0),(39,'红',2,29,1,NULL,0),(40,'500ml',1,29,1,NULL,0),(41,'400ml',1,29,1,NULL,0),(42,'两件套',1,30,1,NULL,0),(43,'三件套',1,30,1,NULL,0),(44,'四件套',1,30,1,NULL,0),(45,'翠绿',2,30,1,NULL,0),(46,'200ml',3,30,1,NULL,0),(47,'500ml',3,31,1,NULL,0),(48,'白',2,31,1,NULL,0),(49,'两件套',1,31,1,NULL,0),(50,'紫',2,31,1,NULL,0),(51,'S',3,32,1,NULL,0),(52,'M',3,32,1,NULL,0),(53,'L',3,32,1,NULL,0),(54,'红',2,32,1,NULL,0),(55,'紫',2,32,1,NULL,0),(56,'蓝',2,32,1,NULL,0),(57,'黑',2,32,1,NULL,0),(58,'牛奶丝棉',1,39,1,NULL,0),(59,'针织',1,39,1,NULL,0),(60,'M',3,41,1,NULL,0),(61,'L',3,41,1,NULL,0),(62,'XL',3,41,1,NULL,0),(63,'黑',2,41,1,NULL,0),(64,'白',2,41,1,NULL,0),(65,'蓝',2,41,1,NULL,0),(66,'黑',2,44,1,NULL,0),(67,'蓝',2,44,1,NULL,0),(68,'M',3,44,1,NULL,0),(69,'L',3,44,1,NULL,0),(70,'XL',3,44,1,NULL,0),(71,'红',2,44,1,NULL,0),(72,'35',3,45,1,NULL,0),(73,'36',3,45,1,NULL,0),(74,'37',3,45,1,NULL,0),(75,'38',3,45,1,NULL,0),(76,'粉红',2,45,1,NULL,0),(77,'黑色',2,45,1,NULL,0),(78,'灰色',2,45,1,NULL,0),(79,'金色',2,45,1,NULL,0),(80,'黑',2,47,1,NULL,0),(81,'白',2,47,1,NULL,0),(82,'银',2,47,1,NULL,0),(83,'金',2,47,1,NULL,0),(84,'红',2,48,1,NULL,0),(85,'白',2,48,1,NULL,0),(86,'玫瑰金',2,48,1,NULL,0),(87,'黑',2,48,1,NULL,0),(88,'黑',2,49,1,NULL,0),(89,'白',2,49,1,NULL,0),(90,'蓝',2,49,1,NULL,0),(91,'20寸高清',3,5,1,NULL,0),(92,'25寸高清',3,5,1,NULL,0),(93,'30寸高清',3,5,1,NULL,0),(94,'40寸高清',3,5,1,NULL,0),(95,'50寸高清',3,5,1,NULL,0),(96,'黑',2,5,1,NULL,0),(97,'液晶',1,5,1,NULL,0),(98,'白',2,6,1,NULL,0),(99,'蓝',2,6,1,NULL,0),(100,'白',2,7,1,NULL,0),(101,'白',2,51,1,NULL,0),(102,'灰',2,51,1,NULL,0),(103,'白',2,21,1,NULL,0),(104,'S',3,55,1,NULL,0),(105,'M',3,55,1,NULL,0),(106,'L',3,55,1,NULL,0),(107,'红',2,55,1,NULL,0),(108,'灰',2,55,1,NULL,0),(109,'蓝',2,55,1,NULL,0),(110,'黑',2,55,1,NULL,0),(111,'白',2,23,1,NULL,0),(112,'硬盘120G',3,23,1,NULL,0),(113,'硬盘500G',3,23,1,NULL,0),(114,'1T',3,24,1,NULL,0),(115,'2T',3,24,1,NULL,0),(116,'3T',3,24,1,NULL,0),(117,'香槟金',2,75,1,NULL,0),(118,'16G',3,75,1,NULL,0),(119,'32G',3,75,1,NULL,0),(120,'黑',2,75,1,NULL,0),(121,'白',2,75,1,NULL,0),(122,'64G',3,75,1,NULL,0),(123,'128G',3,75,1,NULL,0),(124,'全网通',1,75,1,NULL,0),(125,'蓝',2,68,1,NULL,0),(126,'黑',2,68,1,NULL,0),(127,'白',2,68,1,NULL,0),(128,'单框镜',1,68,1,NULL,0),(129,'变色镜',1,68,1,NULL,0);
/*!40000 ALTER TABLE `ds_specvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_statmember`
--

DROP TABLE IF EXISTS `ds_statmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_statmember` (
  `statm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '统计自增ID',
  `statm_memberid` int(11) NOT NULL COMMENT '会员ID',
  `statm_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `statm_time` int(11) NOT NULL COMMENT '统计时间',
  `statm_ordernum` int(11) NOT NULL DEFAULT '0' COMMENT '下单量',
  `statm_orderamount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '下单金额',
  `statm_goodsnum` int(11) NOT NULL DEFAULT '0' COMMENT '下单商品件数',
  `statm_predincrease` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预存款增加额',
  `statm_predreduce` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预存款减少额',
  `statm_pointsincrease` int(11) NOT NULL DEFAULT '0' COMMENT '积分增加额',
  `statm_pointsreduce` int(11) NOT NULL DEFAULT '0' COMMENT '积分减少额',
  `statm_updatetime` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`statm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员相关数据统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_statmember`
--

LOCK TABLES `ds_statmember` WRITE;
/*!40000 ALTER TABLE `ds_statmember` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_statmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_statorder`
--

DROP TABLE IF EXISTS `ds_statorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_statorder` (
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_sn` varchar(20) NOT NULL COMMENT '订单编号',
  `order_add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单生成时间',
  `payment_code` char(20) DEFAULT '' COMMENT '支付方式',
  `order_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价格',
  `shipping_fee` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '运费',
  `evaluation_state` enum('0','1') DEFAULT '0' COMMENT '评价状态 0未评价，1已评价',
  `order_state` enum('0','10','20','30','35','40') NOT NULL DEFAULT '10' COMMENT '订单状态：0(已取消)10(默认):未付款;20:已付款;30:已发货;35:待自提;40:已收货;',
  `refund_state` tinyint(1) unsigned DEFAULT '0' COMMENT '退款状态:0是无退款,1是部分退款,2是全部退款',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `order_from` enum('1','2') NOT NULL DEFAULT '1' COMMENT '订单来源，1:PC 2:手机',
  `order_isvalid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为计入统计的有效订单，0为无效 1为有效',
  `reciver_province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '收货人省级ID',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '卖家店铺名称',
  `grade_id` int(11) NOT NULL COMMENT '店铺等级',
  `storeclass_id` int(11) NOT NULL COMMENT '店铺分类',
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '买家ID',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家姓名',
  UNIQUE KEY `order_id` (`order_id`),
  KEY `order_add_time` (`order_add_time`),
  KEY `order_isvalid` (`order_isvalid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='统计功能订单缓存表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_statorder`
--

LOCK TABLES `ds_statorder` WRITE;
/*!40000 ALTER TABLE `ds_statorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_statorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_statordergoods`
--

DROP TABLE IF EXISTS `ds_statordergoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_statordergoods` (
  `rec_id` int(11) NOT NULL COMMENT '订单商品表索引ID',
  `stat_updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '缓存生成时间',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_sn` varchar(20) NOT NULL COMMENT '订单编号',
  `order_add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单生成时间',
  `payment_code` char(20) DEFAULT '' COMMENT '支付方式',
  `order_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价格',
  `shipping_fee` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '运费',
  `evaluation_state` enum('0','1') DEFAULT '0' COMMENT '评价状态 0:未评价，1:已评价',
  `order_state` enum('0','10','20','30','35','40') NOT NULL DEFAULT '10' COMMENT '订单状态 0:已取消;10:未付款;20:已付款;30:已发货;35:待自提;40:已收货;',
  `refund_state` tinyint(1) unsigned DEFAULT '0' COMMENT '退款状态:0:无退款,1:部分退款,2:全部退款',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `order_from` enum('1','2') NOT NULL DEFAULT '1' COMMENT '来源 1:PC 2:手机',
  `order_isvalid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为计入统计的有效订单，0为无效 1为有效',
  `reciver_province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '收货人省级ID',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '卖家店铺名称',
  `grade_id` int(11) NOT NULL COMMENT '店铺等级',
  `storeclass_id` int(11) NOT NULL COMMENT '店铺分类',
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '买家ID',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家姓名',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称+规格',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '商品公共表id',
  `goods_commonname` varchar(50) NOT NULL COMMENT '商品公共表中商品名称',
  `gc_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品最底级分类ID',
  `gc_parentid_1` int(11) NOT NULL DEFAULT '0' COMMENT '一级父类ID',
  `gc_parentid_2` int(11) NOT NULL DEFAULT '0' COMMENT '二级父类ID',
  `gc_parentid_3` int(11) NOT NULL DEFAULT '0' COMMENT '三级父类ID',
  `brand_id` int(10) unsigned NOT NULL COMMENT '品牌id',
  `brand_name` varchar(100) NOT NULL COMMENT '品牌名称',
  `goods_serial` varchar(50) NOT NULL COMMENT '商家编号',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '商品数量',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `goods_pay_price` decimal(10,2) unsigned NOT NULL COMMENT '商品实际成交价',
  `goods_type` enum('1','2','3','4','5','6','7','8','9') NOT NULL DEFAULT '1' COMMENT '1:默认 2:抢购商品 3:限时折扣商品 4:优惠套装 5:赠品 6:拼团 7:会员等级折扣 8:砍价',
  `promotions_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '促销活动ID（抢购ID/限时折扣ID/优惠套装ID）与goods_type搭配使用',
  `commis_rate` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '佣金比例',
  UNIQUE KEY `rec_id` (`rec_id`),
  KEY `order_id` (`order_id`),
  KEY `order_add_time` (`order_add_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='统计功能订单商品缓存表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_statordergoods`
--

LOCK TABLES `ds_statordergoods` WRITE;
/*!40000 ALTER TABLE `ds_statordergoods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_statordergoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_store`
--

DROP TABLE IF EXISTS `ds_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺自增ID',
  `store_name` varchar(100) NOT NULL COMMENT '店铺名称',
  `grade_id` int(11) DEFAULT '0' COMMENT '店铺等级ID',
  `member_id` int(11) NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `seller_name` varchar(50) NOT NULL COMMENT '店主卖家用户名',
  `storeclass_id` int(11) DEFAULT '0' COMMENT '店铺分类ID',
  `store_company_name` varchar(50) DEFAULT NULL COMMENT '店铺公司名称',
  `region_id` int(10) DEFAULT NULL COMMENT '地区ID',
  `area_info` varchar(100) DEFAULT NULL COMMENT '地区名称',
  `store_address` varchar(100) DEFAULT NULL COMMENT '店铺地址',
  `store_zip` varchar(10) DEFAULT NULL COMMENT '邮政编码',
  `store_state` tinyint(1) NOT NULL DEFAULT '2' COMMENT '店铺状态:0关闭，1开启，2审核中',
  `store_close_info` varchar(255) DEFAULT NULL COMMENT '店铺关闭原因',
  `store_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '店铺排序',
  `store_addtime` int(11) NOT NULL DEFAULT '0' COMMENT '店铺时间',
  `store_endtime` int(11) NOT NULL DEFAULT '0' COMMENT '店铺关闭时间',
  `store_logo` varchar(255) DEFAULT NULL COMMENT '店铺LOGO',
  `store_banner` varchar(255) DEFAULT NULL COMMENT '店铺Banner',
  `store_avatar` varchar(255) DEFAULT NULL COMMENT '店铺头像',
  `store_keywords` varchar(255) DEFAULT NULL COMMENT '店铺SEO关键字',
  `store_description` varchar(255) DEFAULT NULL COMMENT '店铺SEO描述',
  `store_qq` varchar(50) DEFAULT NULL COMMENT '店铺QQ',
  `store_ww` varchar(50) DEFAULT NULL COMMENT '店铺WW',
  `store_phone` varchar(20) DEFAULT NULL COMMENT '商家电话',
  `store_mainbusiness` text COMMENT '主营商品',
  `store_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐:0否 1是',
  `store_theme` varchar(50) NOT NULL DEFAULT 'default' COMMENT '店铺当前主题',
  `store_credit` int(11) NOT NULL DEFAULT '100' COMMENT '店铺信用',
  `store_desccredit` float unsigned NOT NULL DEFAULT '5' COMMENT '描述相符度分数',
  `store_servicecredit` float unsigned NOT NULL DEFAULT '5' COMMENT '服务态度分数',
  `store_deliverycredit` float unsigned NOT NULL DEFAULT '5' COMMENT '发货速度分数',
  `store_collect` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺收藏数量',
  `store_slide` text COMMENT '店铺幻灯片',
  `store_slide_url` text COMMENT '店铺幻灯片链接',
  `store_seal` varchar(255) DEFAULT NULL COMMENT '店铺印章',
  `store_printexplain` varchar(500) DEFAULT NULL COMMENT '打印订单页面下方说明文字',
  `store_sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺销量',
  `store_presales` text COMMENT '售前客服',
  `store_aftersales` text COMMENT '售后客服',
  `store_workingtime` varchar(100) DEFAULT NULL COMMENT '工作时间',
  `store_free_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '超出该金额免运费，大于0才表示该值有效',
  `store_decoration_switch` int(10) unsigned DEFAULT '0' COMMENT '店铺装修开关(0-关闭 装修编号-开启)',
  `store_decoration_only` tinyint(1) unsigned DEFAULT '0' COMMENT '开启店铺装修时，仅显示店铺装修(1-是 0-否',
  `store_decoration_image_count` int(10) unsigned DEFAULT '0' COMMENT '店铺装修相册图片数量',
  `live_store_name` varchar(255) DEFAULT NULL COMMENT '商铺名称',
  `live_store_address` varchar(255) DEFAULT NULL COMMENT '商家地址',
  `live_store_tel` varchar(255) DEFAULT NULL COMMENT '商铺电话',
  `live_store_bus` varchar(255) DEFAULT NULL COMMENT '公交线路',
  `is_platform_store` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否自营店铺 1是 0否',
  `bind_all_gc` tinyint(1) NOT NULL DEFAULT '0' COMMENT '自营店是否绑定全部分类 0否1是',
  `store_vrcode_prefix` char(3) DEFAULT NULL COMMENT '商家兑换码前缀',
  `store_baozh` tinyint(1) DEFAULT '0' COMMENT '保证服务开关',
  `store_qtian` tinyint(1) DEFAULT '0' COMMENT '7天退换',
  `store_zhping` tinyint(1) DEFAULT '0' COMMENT '正品保障',
  `store_erxiaoshi` tinyint(1) DEFAULT '0' COMMENT '两小时发货',
  `store_tuihuo` tinyint(1) DEFAULT '0' COMMENT '退货承诺',
  `store_shiyong` tinyint(1) DEFAULT '0' COMMENT '试用中心',
  `store_shiti` tinyint(1) DEFAULT '0' COMMENT '实体验证',
  `store_xiaoxie` tinyint(1) DEFAULT '0' COMMENT '消协保证',
  `store_huodaofk` tinyint(1) DEFAULT '0' COMMENT '货到付款',
  `store_free_time` varchar(10) DEFAULT NULL COMMENT '商家配送时间',
  `store_longitude` varchar(20) DEFAULT '' COMMENT '经度',
  `store_latitude` varchar(20) DEFAULT '' COMMENT '纬度',
  `mb_title_img` varchar(150) DEFAULT NULL COMMENT '手机店铺背景图',
  `mb_sliders` text COMMENT '手机店铺轮播图',
  `deliver_region` varchar(50) DEFAULT NULL COMMENT '店铺默认配送区域',
  `store_mgdiscount` text COMMENT '序列化会员等级折扣(店铺)',
  `store_mgdiscount_state` tinyint(1) DEFAULT '0' COMMENT '店铺是否开启序列化会员等级折扣',
  `store_bill_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上一期结算时间',
  `store_avaliable_deposit` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '店铺已缴保证金',
  `store_freeze_deposit` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '店铺审核保证金',
  `store_payable_deposit` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '店铺应缴保证金',
  `store_avaliable_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '店铺可用金额',
  `store_freeze_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '店铺冻结金额',
  `store_whatsappurl` text NOT NULL COMMENT '店铺客服链接（whatsApp链接）',
  PRIMARY KEY (`store_id`),
  KEY `seller_name` (`seller_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='店铺数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_store`
--

LOCK TABLES `ds_store` WRITE;
/*!40000 ALTER TABLE `ds_store` DISABLE KEYS */;
INSERT INTO `ds_store` VALUES (1,'官方自营店铺',1,1,'buyer','seller',0,NULL,NULL,NULL,NULL,NULL,1,NULL,255,1605514005,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'default',100,5,5,5,0,NULL,NULL,NULL,NULL,0,'a:1:{i:0;a:3:{s:4:\"name\";s:7:\"售前1\";s:4:\"type\";i:3;s:3:\"num\";s:1:\"2\";}}','a:1:{i:0;a:3:{s:4:\"name\";s:7:\"售后1\";s:4:\"type\";i:3;s:3:\"num\";s:1:\"2\";}}','10:00 - 22:00',0.00,0,0,0,NULL,NULL,NULL,NULL,1,1,NULL,0,0,0,0,0,0,0,0,0,NULL,'','',NULL,NULL,NULL,NULL,0,0,0.00,0.00,0.00,0.00,0.00,'https://wa.me/message/JJQTSMK7TSZKG1');
/*!40000 ALTER TABLE `ds_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_storebindclass`
--

DROP TABLE IF EXISTS `ds_storebindclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_storebindclass` (
  `storebindclass_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '类目自增ID',
  `store_id` int(11) unsigned DEFAULT '0' COMMENT '店铺ID',
  `commis_rate` tinyint(4) unsigned DEFAULT '0' COMMENT '佣金比例',
  `class_1` mediumint(9) unsigned DEFAULT '0' COMMENT '一级分类',
  `class_2` mediumint(9) unsigned DEFAULT '0' COMMENT '二级分类',
  `class_3` mediumint(9) unsigned DEFAULT '0' COMMENT '三级分类',
  `storebindclass_state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态0:审核中1:已审核 2:平台自营店铺',
  PRIMARY KEY (`storebindclass_id`),
  KEY `store_id` (`store_id`),
  KEY `class_1` (`class_1`),
  KEY `class_2` (`class_2`),
  KEY `class_3` (`class_3`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺可发布商品类目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_storebindclass`
--

LOCK TABLES `ds_storebindclass` WRITE;
/*!40000 ALTER TABLE `ds_storebindclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_storebindclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_storeclass`
--

DROP TABLE IF EXISTS `ds_storeclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_storeclass` (
  `storeclass_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '店铺分类自增ID',
  `storeclass_name` varchar(50) NOT NULL COMMENT '店铺分类名称',
  `storeclass_bail` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '店铺分类保证金数额',
  `storeclass_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '店铺分类排序',
  PRIMARY KEY (`storeclass_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='店铺分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_storeclass`
--

LOCK TABLES `ds_storeclass` WRITE;
/*!40000 ALTER TABLE `ds_storeclass` DISABLE KEYS */;
INSERT INTO `ds_storeclass` VALUES (1,'珠宝/首饰',0,8),(2,'服装鞋包',0,1),(3,'3C数码',0,2),(4,'美容护理',0,3),(5,'家居用品',0,4),(6,'食品/保健',0,5),(7,'母婴用品',0,6),(8,'文体/汽车',0,7),(9,'收藏/爱好',0,9),(10,'生活/服务',0,10);
/*!40000 ALTER TABLE `ds_storeclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_storecost`
--

DROP TABLE IF EXISTS `ds_storecost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_storecost` (
  `storecost_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '店铺消费自增ID',
  `storecost_store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `storecost_seller_id` int(10) unsigned NOT NULL COMMENT '卖家ID',
  `storecost_price` int(10) unsigned NOT NULL COMMENT '店铺消费价格',
  `storecost_remark` varchar(255) NOT NULL COMMENT '店铺消费备注',
  `storecost_state` tinyint(3) unsigned NOT NULL COMMENT '费用状态 0:未结算 1:已结算',
  `storecost_time` int(10) unsigned NOT NULL COMMENT '费用发生时间',
  PRIMARY KEY (`storecost_id`),
  KEY `storecost_store_id` (`storecost_store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺消费表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_storecost`
--

LOCK TABLES `ds_storecost` WRITE;
/*!40000 ALTER TABLE `ds_storecost` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_storecost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_storedepositlog`
--

DROP TABLE IF EXISTS `ds_storedepositlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_storedepositlog` (
  `storedepositlog_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '保证金日志id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `store_name` varchar(60) NOT NULL COMMENT '店铺名称',
  `store_avaliable_deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已缴保证金',
  `store_freeze_deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '审核保证金',
  `store_payable_deposit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '应缴保证金',
  `storedepositlog_state` tinyint(1) unsigned NOT NULL COMMENT '状态（0无效1有效2待审核3已同意4已拒绝5已缴纳6已取消）',
  `storedepositlog_type` smallint(5) unsigned NOT NULL COMMENT '日志类型',
  `storedepositlog_desc` varchar(255) NOT NULL COMMENT '日志详情',
  `storedepositlog_add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`storedepositlog_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺保证金日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_storedepositlog`
--

LOCK TABLES `ds_storedepositlog` WRITE;
/*!40000 ALTER TABLE `ds_storedepositlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_storedepositlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_storeextend`
--

DROP TABLE IF EXISTS `ds_storeextend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_storeextend` (
  `store_id` mediumint(8) unsigned NOT NULL COMMENT '店铺ID',
  `express` text COMMENT '快递公司ID的组合',
  `pricerange` text COMMENT '店铺统计设置的商品价格区间',
  `orderpricerange` text COMMENT '店铺统计设置的订单价格区间',
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺信息扩展表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_storeextend`
--

LOCK TABLES `ds_storeextend` WRITE;
/*!40000 ALTER TABLE `ds_storeextend` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_storeextend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_storegoodsclass`
--

DROP TABLE IF EXISTS `ds_storegoodsclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_storegoodsclass` (
  `storegc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺商品分类ID',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `storegc_name` varchar(50) NOT NULL COMMENT '店铺商品分类名称',
  `storegc_parent_id` int(11) NOT NULL COMMENT '上级ID',
  `storegc_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '店铺商品分类状态',
  `storegc_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '商品分类排序',
  PRIMARY KEY (`storegc_id`),
  KEY `storegc_parent_id` (`storegc_parent_id`,`storegc_sort`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺商品分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_storegoodsclass`
--

LOCK TABLES `ds_storegoodsclass` WRITE;
/*!40000 ALTER TABLE `ds_storegoodsclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_storegoodsclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_storegrade`
--

DROP TABLE IF EXISTS `ds_storegrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_storegrade` (
  `storegrade_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '店铺等级自增ID',
  `storegrade_name` varchar(50) NOT NULL COMMENT '店铺等级名称',
  `storegrade_goods_limit` int(10) DEFAULT '0' COMMENT '允许发布商品数量',
  `storegrade_album_limit` int(10) DEFAULT '0' COMMENT '允许发布图片数量',
  `storegrade_space_limit` int(10) DEFAULT '0' COMMENT '允许上传空间大小,单位MB',
  `storegrade_template_number` tinyint(3) DEFAULT '0' COMMENT '店铺等级选择店铺模板套数',
  `storegrade_template` varchar(255) DEFAULT NULL COMMENT '店铺等级模板内容',
  `storegrade_price` int(10) DEFAULT '0' COMMENT '店铺等级费用',
  `storegrade_confirm` tinyint(1) DEFAULT '1' COMMENT '店铺等级审核,0为否 1为是',
  `storegrade_description` text COMMENT '店铺等级申请说明',
  `storegrade_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '店铺等级排序',
  PRIMARY KEY (`storegrade_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='店铺等级表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_storegrade`
--

LOCK TABLES `ds_storegrade` WRITE;
/*!40000 ALTER TABLE `ds_storegrade` DISABLE KEYS */;
INSERT INTO `ds_storegrade` VALUES (1,'系统默认',100,500,100,6,'default|style1|style2|style3|style4|style5',100,1,'用户选择“默认等级”，可以立即开通。',0),(2,'白金店铺',200,1000,100,6,'default|style1|style2|style3|style4|style5',200,1,'享受更多特权',2),(3,'钻石店铺',0,1000,100,6,'default|style1|style2|style3|style4|style5',1000,1,'',100);
/*!40000 ALTER TABLE `ds_storegrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_storejoinin`
--

DROP TABLE IF EXISTS `ds_storejoinin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_storejoinin` (
  `member_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) DEFAULT NULL COMMENT '店主用户名',
  `store_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '店铺类型:0公司，1个人',
  `company_name` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `company_province_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '所在地省ID',
  `company_address` varchar(50) DEFAULT NULL COMMENT '公司地址',
  `company_address_detail` varchar(50) DEFAULT NULL COMMENT '公司详细地址',
  `company_registered_capital` int(10) unsigned DEFAULT NULL COMMENT '注册资金',
  `contacts_name` varchar(50) DEFAULT NULL COMMENT '联系人姓名',
  `contacts_phone` varchar(20) DEFAULT NULL COMMENT '联系人电话',
  `contacts_email` varchar(50) DEFAULT NULL COMMENT '联系人邮箱',
  `business_licence_number` varchar(50) DEFAULT NULL COMMENT '营业执照号',
  `business_licence_address` varchar(50) DEFAULT NULL COMMENT '营业执所在地',
  `business_licence_start` date DEFAULT NULL COMMENT '营业执照有效期开始',
  `business_licence_end` date DEFAULT NULL COMMENT '营业执照有效期结束',
  `business_sphere` varchar(1000) DEFAULT NULL COMMENT '法定经营范围',
  `business_licence_number_electronic` varchar(50) DEFAULT NULL COMMENT '营业执照电子版',
  `bank_account_name` varchar(50) DEFAULT NULL COMMENT '银行开户名',
  `bank_account_number` varchar(50) DEFAULT NULL COMMENT '公司银行账号',
  `bank_name` varchar(50) DEFAULT NULL COMMENT '开户银行支行名称',
  `bank_address` varchar(50) DEFAULT NULL COMMENT '开户银行所在地',
  `is_settlement_account` tinyint(1) DEFAULT NULL COMMENT '开户行账号是否为结算账号 1-开户行就是结算账号 2-独立的计算账号',
  `settlement_bank_account_name` varchar(50) DEFAULT NULL COMMENT '结算银行开户名',
  `settlement_bank_account_number` varchar(50) DEFAULT NULL COMMENT '结算公司银行账号',
  `settlement_bank_name` varchar(50) DEFAULT NULL COMMENT '结算开户银行支行名称',
  `settlement_bank_address` varchar(50) DEFAULT NULL COMMENT '结算开户银行所在地',
  `seller_name` varchar(50) DEFAULT NULL COMMENT '卖家帐号',
  `store_name` varchar(50) DEFAULT NULL COMMENT '店铺名称',
  `store_class_ids` varchar(1000) DEFAULT NULL COMMENT '店铺分类编号集合',
  `store_class_names` varchar(1000) DEFAULT NULL COMMENT '店铺分类名称集合',
  `store_longitude` varchar(20) DEFAULT '' COMMENT '经度',
  `store_latitude` varchar(20) DEFAULT '' COMMENT '纬度',
  `joinin_state` varchar(50) DEFAULT NULL COMMENT '申请状态 10-已提交申请 11-缴费完成  20-审核成功 30-审核失败 31-缴费审核失败 40-审核通过开店',
  `joinin_message` varchar(200) DEFAULT NULL COMMENT '管理员审核信息',
  `joinin_year` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '开店时长(年)',
  `storegrade_name` varchar(50) DEFAULT NULL COMMENT '店铺等级名称',
  `storegrade_id` int(10) unsigned DEFAULT NULL COMMENT '店铺等级编号',
  `sg_info` varchar(200) DEFAULT NULL COMMENT '店铺等级下的收费等信息',
  `storeclass_name` varchar(50) DEFAULT NULL COMMENT '店铺分类名称',
  `storeclass_id` int(10) unsigned DEFAULT NULL COMMENT '店铺分类编号',
  `storeclass_bail` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '店铺分类保证金',
  `store_class_commis_rates` varchar(200) DEFAULT NULL COMMENT '分类佣金比例',
  `paying_money_certificate` varchar(50) DEFAULT NULL COMMENT '付款凭证',
  `paying_money_certificate_explain` varchar(200) DEFAULT NULL COMMENT '付款凭证说明',
  `paying_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '付款金额'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺入住表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_storejoinin`
--

LOCK TABLES `ds_storejoinin` WRITE;
/*!40000 ALTER TABLE `ds_storejoinin` DISABLE KEYS */;
INSERT INTO `ds_storejoinin` VALUES (1,'buyer',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'seller','官方自营店铺',NULL,NULL,'','','40',NULL,1,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0.00);
/*!40000 ALTER TABLE `ds_storejoinin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_storemoneylog`
--

DROP TABLE IF EXISTS `ds_storemoneylog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_storemoneylog` (
  `storemoneylog_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '金额日志id',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `store_name` varchar(60) NOT NULL COMMENT '店铺名称',
  `store_avaliable_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变动可用金额',
  `store_freeze_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变动冻结金额',
  `storemoneylog_type` smallint(5) unsigned NOT NULL COMMENT '日志类型',
  `storemoneylog_desc` varchar(255) NOT NULL COMMENT '日志详情',
  `storemoneylog_state` tinyint(1) unsigned NOT NULL COMMENT '状态（0无效1有效2待审核3已同意4已拒绝）',
  `storemoneylog_add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  `storemoneylog_payment_code` varchar(20) DEFAULT '' COMMENT '支付方式',
  `storemoneylog_trade_sn` varchar(50) DEFAULT '' COMMENT '第三方支付接口交易号',
  PRIMARY KEY (`storemoneylog_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺金额日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_storemoneylog`
--

LOCK TABLES `ds_storemoneylog` WRITE;
/*!40000 ALTER TABLE `ds_storemoneylog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_storemoneylog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_storemsg`
--

DROP TABLE IF EXISTS `ds_storemsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_storemsg` (
  `storemsg_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '店铺消息自增ID',
  `storemt_code` varchar(100) NOT NULL COMMENT '模板编码',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `storemsg_content` varchar(255) NOT NULL COMMENT '消息内容',
  `storemsg_addtime` int(10) unsigned NOT NULL COMMENT '发送时间',
  `storemsg_readids` varchar(255) DEFAULT NULL COMMENT '已读卖家id',
  PRIMARY KEY (`storemsg_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='店铺消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_storemsg`
--

LOCK TABLES `ds_storemsg` WRITE;
/*!40000 ALTER TABLE `ds_storemsg` DISABLE KEYS */;
INSERT INTO `ds_storemsg` VALUES (1,'new_order',1,'您有订单需要处理，订单编号：3000000000000101。',1606733368,NULL),(2,'new_order',1,'您有订单需要处理，订单编号：202012011528054808。',1606807684,NULL),(3,'refund',1,'您有一个售前退款单需要处理，退款编号：699101201201175517。',1606816517,NULL),(4,'new_order',1,'您有订单需要处理，订单编号：202012051739047836。',1607161144,NULL),(5,'new_order',1,'您有订单需要处理，订单编号：202012221717303805。',1608628650,NULL),(6,'new_order',1,'您有订单需要处理，订单编号：202012221730055546。',1608629405,NULL),(7,'new_order',1,'您有订单需要处理，订单编号：202012221742331142。',1608708061,NULL),(8,'new_order',1,'您有订单需要处理，订单编号：202101091618408848。',1610180320,NULL),(9,'new_order',1,'您有订单需要处理，订单编号：202101091637004659。',1610181420,NULL),(10,'goods_violation',1,'您的商品被违规下架，原因：“”。平台货号：2。',1617550269,NULL),(11,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：78。',1617648172,NULL),(12,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：77。',1617648172,NULL),(13,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：76。',1617648172,NULL),(14,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：58。',1617648172,NULL),(15,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：57。',1617648172,NULL),(16,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：56。',1617648172,NULL),(17,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：55。',1617648172,NULL),(18,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：54。',1617648172,NULL),(19,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：53。',1617648172,NULL),(20,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：52。',1617648172,NULL),(21,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：51。',1617648172,NULL),(22,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：50。',1617648172,NULL),(23,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：49。',1617648172,NULL),(24,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：48。',1617648172,NULL),(25,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：47。',1617648172,NULL),(26,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：46。',1617648172,NULL),(27,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：45。',1617648172,NULL),(28,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：44。',1617648172,NULL),(29,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：43。',1617648172,NULL),(30,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：42。',1617648172,NULL),(31,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：41。',1617648172,NULL),(32,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：40。',1617648172,NULL),(33,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：39。',1617648172,NULL),(34,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：37。',1617648172,NULL),(35,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：36。',1617648172,NULL),(36,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：34。',1617648172,NULL),(37,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：33。',1617648172,NULL),(38,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：32。',1617648172,NULL),(39,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：31。',1617648172,NULL),(40,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：30。',1617648172,NULL),(41,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：29。',1617648172,NULL),(42,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：28。',1617648172,NULL),(43,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：27。',1617648172,NULL),(44,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：26。',1617648172,NULL),(45,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：25。',1617648172,NULL),(46,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：24。',1617648172,NULL),(47,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：23。',1617648172,NULL),(48,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：22。',1617648172,NULL),(49,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：21。',1617648172,NULL),(50,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：20。',1617648172,NULL),(51,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：19。',1617648172,NULL),(52,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：18。',1617648172,NULL),(53,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：17。',1617648172,NULL),(54,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：16。',1617648172,NULL),(55,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：15。',1617648172,NULL),(56,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：75。',1617648179,NULL),(57,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：74。',1617648179,NULL),(58,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：73。',1617648179,NULL),(59,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：72。',1617648179,NULL),(60,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：71。',1617648179,NULL),(61,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：70。',1617648179,NULL),(62,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：68。',1617648179,NULL),(63,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：67。',1617648179,NULL),(64,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：66。',1617648179,NULL),(65,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：14。',1617648179,NULL),(66,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：13。',1617648179,NULL),(67,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：12。',1617648179,NULL),(68,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：11。',1617648179,NULL),(69,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：10。',1617648179,NULL),(70,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：9。',1617648179,NULL),(71,'goods_violation',1,'您的商品被违规下架，原因：“商品分类被删除，需要重新选择分类”。平台货号：8。',1617648179,NULL);
/*!40000 ALTER TABLE `ds_storemsg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_storemsgread`
--

DROP TABLE IF EXISTS `ds_storemsgread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_storemsgread` (
  `storemsg_id` int(11) NOT NULL COMMENT '店铺消息ID',
  `seller_id` int(11) NOT NULL COMMENT '卖家ID',
  `storemsg_readtime` int(11) NOT NULL COMMENT '阅读时间',
  PRIMARY KEY (`storemsg_id`,`seller_id`),
  KEY `seller_id` (`seller_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺消息阅读表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_storemsgread`
--

LOCK TABLES `ds_storemsgread` WRITE;
/*!40000 ALTER TABLE `ds_storemsgread` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_storemsgread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_storemsgsetting`
--

DROP TABLE IF EXISTS `ds_storemsgsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_storemsgsetting` (
  `storemt_code` varchar(100) NOT NULL COMMENT '模板编码',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺id',
  `storems_message_switch` tinyint(3) unsigned NOT NULL COMMENT '站内信接收开关 0:关闭 1:开启',
  `storems_short_switch` tinyint(3) unsigned NOT NULL COMMENT '短消息接收开关 0:关闭 1:开启',
  `storems_mail_switch` tinyint(3) unsigned NOT NULL COMMENT '邮件接收开关 0:关闭 1:开启',
  `storems_weixin_switch` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '微信接收开关 0:关闭 1:开启',
  `storems_short_number` varchar(11) NOT NULL COMMENT '手机号码',
  `storems_mail_number` varchar(100) NOT NULL COMMENT '邮箱号码',
  PRIMARY KEY (`storemt_code`,`store_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺消息接收设置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_storemsgsetting`
--

LOCK TABLES `ds_storemsgsetting` WRITE;
/*!40000 ALTER TABLE `ds_storemsgsetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_storemsgsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_storemsgtpl`
--

DROP TABLE IF EXISTS `ds_storemsgtpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_storemsgtpl` (
  `storemt_code` varchar(100) NOT NULL COMMENT '商家消息模板编码',
  `storemt_name` varchar(100) NOT NULL COMMENT '商家消息模板名称',
  `storemt_message_switch` tinyint(3) unsigned NOT NULL COMMENT '站内信默认开关 0:关 1:开',
  `storemt_message_content` varchar(255) NOT NULL COMMENT '站内信内容',
  `storemt_message_forced` tinyint(3) unsigned NOT NULL COMMENT '站内信强制接收 0:否 1:是',
  `storemt_short_switch` tinyint(3) unsigned NOT NULL COMMENT '短信默认开关 0:关 1:开',
  `storemt_short_content` varchar(255) NOT NULL COMMENT '短信内容',
  `smt_short_forced` tinyint(3) unsigned NOT NULL COMMENT '短信强制接收 0:否 1:是',
  `storemt_mail_switch` tinyint(3) unsigned NOT NULL COMMENT '邮件默认开 0:关 1:开',
  `storemt_mail_subject` varchar(255) NOT NULL COMMENT '邮件标题',
  `storemt_mail_content` text NOT NULL COMMENT '邮件内容',
  `storemt_mail_forced` tinyint(3) unsigned NOT NULL COMMENT '邮件强制接收 0:否 1:是',
  `storemt_weixin_switch` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '微信默认开关 0:关 1:开',
  `storemt_weixin_code` varchar(255) NOT NULL DEFAULT '' COMMENT '微信code',
  `storemt_weixin_forced` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '微信强制接收 0:否 1:是',
  `ali_template_code` varchar(255) DEFAULT NULL COMMENT '阿里云短信模板ID',
  `ten_template_code` varchar(255) DEFAULT NULL COMMENT '腾讯云短信模板ID',
  PRIMARY KEY (`storemt_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商家消息模板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_storemsgtpl`
--

LOCK TABLES `ds_storemsgtpl` WRITE;
/*!40000 ALTER TABLE `ds_storemsgtpl` DISABLE KEYS */;
INSERT INTO `ds_storemsgtpl` VALUES ('complain','商品被投诉提醒',1,'您售出的商品被投诉，等待商家申诉。投诉单编号：${complain_id}。',1,1,'您售出的商品被投诉，等待商家申诉。投诉单编号：${complain_id}。',1,1,'${site_name}提醒：您售出的商品被投诉，等待商家申诉。投诉单编号：${complain_id}。','<p>\r\n	${site_name}提醒：\r\n</p>\r\n<p>\r\n	您售出的商品被投诉，等待商家申诉。投诉单编号：${complain_id}。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>',1,0,'',0,NULL,NULL),('goods_storage_alarm','商品库存预警',1,'您的商品库存不足，请及时补货。平台货号：${common_id}，SKU：${sku_id}。',1,0,'您的商品库存不足，请及时补货。平台货号：${common_id}，SKU：${sku_id}。',0,0,'${site_name}提醒：您的商品库存不足，请及时补货。','<p>\r\n	${site_name}提醒：\r\n</p>\r\n<p>\r\n	您的商品库存不足，请及时补货。平台货号：${common_id}，SKU：${sku_id}。\r\n</p>\r\n<p>\r\n	点击下面链接查看商品详细信息\r\n</p>\r\n<p>\r\n	<a href=\"http://${shop_site_url}/goods/index.html?goods_id=${sku_id}\" target=\"_blank\">http://${shop_site_url}/goods/index.html?goods_id=${sku_id}</a> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<br />',0,0,'',0,NULL,NULL),('goods_verify','商品审核失败提醒',1,'您的商品没有通过管理员审核，原因：“${remark}”。平台货号：${common_id}。',1,0,'您的商品没有通过管理员审核，原因：“${remark}”。平台货号：${common_id}。',0,0,'${site_name}提醒：您的商品没有通过管理员审核。','<p>\r\n	${site_name}提醒：\r\n</p>\r\n<p>\r\n	您的商品没有通过管理员审核，原因：“${remark}”。平台货号：${common_id}。\r\n	</p><p>\r\n		<br />\r\n	</p>\r\n	<p>\r\n		<br />\r\n	</p>\r\n	<p style=\"text-align:right;\">\r\n		${site_name}\r\n	</p>\r\n	<p style=\"text-align:right;\">\r\n		${mail_send_time}\r\n	</p>',0,0,'',0,NULL,NULL),('goods_violation','商品违规被下架',1,'您的商品被违规下架，原因：“${remark}”。平台货号：${common_id}。',1,0,'您的商品被违规下架，原因：“${remark}”。平台货号：${common_id}。',0,0,'${site_name}提醒：您的商品被违规下架。','<p>\r\n	${site_name}提醒：\r\n</p>\r\n<p>\r\n	您的商品被违规下架。，原因：“${remark}”。平台货号：${common_id}。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>',0,0,'',0,NULL,NULL),('new_order','新订单提醒',1,'您有订单需要处理，订单编号：${order_sn}。',1,1,'您有订单需要处理，订单编号：${order_sn}。',1,0,'${site_name}提醒：您有订单需要处理。','<p>\r\n	${site_name}提醒：\r\n</p>\r\n<p>\r\n	您有订单需要处理，订单编号：${order_sn}。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${mail_send_time}\r\n</p>\r\n<br />',0,0,'',0,NULL,NULL),('refund','退款提醒',1,'您有一个${type}退款单需要处理，退款编号：${refund_sn}。',1,0,'您有一个${type}退款单需要处理，退款编号：${refund_sn}。',1,0,'${site_name}提醒：您有一个${type}退款单需要处理，退款编号：${refund_sn}。','<p>\r\n	${site_name}提醒：\r\n</p>\r\n<p>\r\n	您有一个${type}退款单需要处理，退款编号：${refund_sn}。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>',1,0,'',0,NULL,NULL),('refund_auto_process','退款自动处理提醒',1,'您的${type}退款单超期未处理，已自动同意买家退款申请。退款单编号：${refund_sn}。',1,0,'您的${type}退款单超期未处理，已自动同意买家退款申请。退款单编号：${refund_sn}。',0,0,'{site_name}提醒：您的${type}退款单超期未处理，已自动同意买家退款申请。退款单编号：${refund_sn}。','<p>\r\n	{site_name}提醒：\r\n</p>\r\n<p>\r\n	您的${type}退款单超期未处理，已自动同意买家退款申请。退款单编号：${refund_sn}。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>',0,0,'',0,NULL,NULL),('return','退货提醒',1,'您有一个${type}退货单需要处理。退货编号：${refund_sn}。',1,0,'您有一个${type}退货单需要处理。退货编号：${refund_sn}。',0,0,'${site_name}提醒：您有一个${type}退货单需要处理。退货编号：${refund_sn}。','<p>\r\n	${site_name}提醒：\r\n</p>\r\n<p>\r\n	您有一个${type}退货单需要处理。退货编号：${refund_sn}。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<br />',0,0,'',0,NULL,NULL),('return_auto_process','退货自动处理提醒',1,'您的${type}退货单超期未处理，已自动同意买家退货申请（弃货）。退货单编号：${refund_sn}。',1,0,'您的${type}退货单超期未处理，已自动同意买家退货申请（弃货）。退货单编号：${refund_sn}。',0,0,'${site_name}提醒：您的${type}退货单超期未处理，已自动同意买家退货申请（弃货）。退货单编号：${refund_sn}。','<p>\r\n	${site_name}提醒：\r\n</p>\r\n<p>\r\n	您的${type}退货单超期未处理，已自动同意买家退货申请（弃货）。退货单编号：${refund_sn}。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${mail_send_time}\r\n</p>',0,0,'',0,NULL,NULL),('return_auto_receipt','退货未收货自动处理提醒',1,'您的${type}退货单不处理收货超期未处理，已自动按弃货处理。退货单编号：${refund_sn}。',1,0,'您的${type}退货单不处理收货超期未处理，已自动按弃货处理。退货单编号：${refund_sn}。',0,0,'${site_name}提醒：您的${type}退货单超期未处理，已自动同意买家退货申请（弃货）。退货单编号：${refund_sn}。','<p>\r\n	${site_name}提醒：\r\n</p>\r\n<p>\r\n	您的${type}退货单超期未处理，已自动同意买家退货申请（弃货）。退货单编号：${refund_sn}。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>',0,0,'',0,NULL,NULL),('store_bill_affirm','结算单等待确认提醒',1,'您有新的结算单等待确认，开始时间：${state_time}，结束时间：${end_time}，结算单号：${bill_no}。',1,0,'您有新的结算单等待确认，开始时间：${state_time}，结束时间：${end_time}，结算单号：${bill_no}。',0,0,'${site_name}提醒：您有新的结算单等待确认。','<p>\r\n	${site_name}提醒：\r\n</p>\r\n<p>\r\n	您有新的结算单等待确认，起止时间：开始时间：${state_time}，结束时间：${end_time}，结算单号：${bill_no}。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>',0,0,'',0,NULL,NULL),('store_bill_gathering','结算单已经付款提醒',1,'您的结算单平台已付款，请注意查收，结算单编号：${bill_no}。',1,0,'您的结算单平台已付款，请注意查收，结算单编号：${bill_no}。',0,0,'${site_name}提醒：您的结算单平台已付款，请注意查收。','<p>\r\n	</p><p>\r\n		${site_name}提醒：\r\n	</p>\r\n\r\n<p>\r\n	您的结算单平台已付款，请注意查收，结算单编号：${bill_no}。\r\n	</p><p>\r\n		<br />\r\n	</p>\r\n	<p>\r\n		<br />\r\n	</p>\r\n	<p>\r\n		<br />\r\n	</p>\r\n	<p style=\"text-align:right;\">\r\n		${site_name}\r\n	</p>\r\n	<p style=\"text-align:right;\">\r\n		${mail_send_time}\r\n	</p>\r\n\r\n<br />',0,0,'',0,NULL,NULL),('store_cost','店铺消费提醒',1,'您有一条新的店铺消费记录，金额：${price}，操作人：${seller_name}，备注：${remark}。',1,1,'您有一条新的店铺消费记录，金额：${price}，操作人：${seller_name}，备注：${remark}。',1,0,'${site_name}提醒：您有一条新的店铺消费记录。','<p>\r\n	${site_name}提醒：\r\n</p>\r\n<p>\r\n	您有一条新的店铺消费记录，金额：${price}，操作人：${seller_name}，备注：${remark}。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${mail_send_time}\r\n</p>',0,0,'',0,NULL,NULL),('store_expire','店铺到期提醒',1,'你的店铺即将到期，请及时续期。',1,0,'你的店铺即将到期，请及时续期。',0,0,'${site_name}提醒：你的店铺即将到期，请及时续期。','<p>\r\n	${site_name}提醒：\r\n</p>\r\n<p>\r\n	你的店铺即将到期，请及时续期。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${site_name}\r\n</p>\r\n<p style=\"text-align:right;\">\r\n	${mail_send_time}\r\n</p>\r\n<p>\r\n	<br />\r\n</p>',0,0,'',0,NULL,NULL);
/*!40000 ALTER TABLE `ds_storemsgtpl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_storenavigation`
--

DROP TABLE IF EXISTS `ds_storenavigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_storenavigation` (
  `storenav_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '卖家店铺导航自增ID',
  `storenav_title` varchar(50) NOT NULL COMMENT '卖家店铺导航名称',
  `storenav_store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '卖家店铺ID',
  `storenav_content` text COMMENT '卖家店铺导航内容',
  `storenav_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '卖家店铺导航排序',
  `storenav_url` varchar(255) DEFAULT NULL COMMENT '店铺导航的外链URL',
  PRIMARY KEY (`storenav_id`),
  KEY `storenav_store_id` (`storenav_store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='卖家店铺导航信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_storenavigation`
--

LOCK TABLES `ds_storenavigation` WRITE;
/*!40000 ALTER TABLE `ds_storenavigation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_storenavigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_storeplate`
--

DROP TABLE IF EXISTS `ds_storeplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_storeplate` (
  `storeplate_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '关联板式id',
  `storeplate_name` varchar(10) NOT NULL COMMENT '关联板式名称',
  `storeplate_position` tinyint(3) unsigned NOT NULL COMMENT '关联板式位置 1:顶部 0:底部',
  `storeplate_content` text NOT NULL COMMENT '关联板式内容',
  `store_id` int(10) unsigned NOT NULL COMMENT '所属店铺ID',
  PRIMARY KEY (`storeplate_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='关联板式表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_storeplate`
--

LOCK TABLES `ds_storeplate` WRITE;
/*!40000 ALTER TABLE `ds_storeplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_storeplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_storereopen`
--

DROP TABLE IF EXISTS `ds_storereopen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_storereopen` (
  `storereopen_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '续签自增ID',
  `storereopen_grade_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '店铺等级ID',
  `storereopen_grade_name` varchar(30) DEFAULT NULL COMMENT '等级名称',
  `storereopen_grade_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '等级收费(元/年)',
  `storereopen_year` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '续签时长(年)',
  `storereopen_pay_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '应付总金额',
  `storereopen_store_name` varchar(50) DEFAULT NULL COMMENT '店铺名字',
  `storereopen_store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `storereopen_state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0:未上传凭证 1:审核中 2:审核通过',
  `storereopen_pay_cert` varchar(50) DEFAULT NULL COMMENT '付款凭证',
  `storereopen_pay_cert_explain` varchar(200) DEFAULT NULL COMMENT '付款说明',
  PRIMARY KEY (`storereopen_id`),
  KEY `storereopen_store_id` (`storereopen_store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='续签内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_storereopen`
--

LOCK TABLES `ds_storereopen` WRITE;
/*!40000 ALTER TABLE `ds_storereopen` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_storereopen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_storesnscomment`
--

DROP TABLE IF EXISTS `ds_storesnscomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_storesnscomment` (
  `storesnscomm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺动态评论自增ID',
  `stracelog_id` int(11) NOT NULL COMMENT '店铺动态ID',
  `storesnscomm_content` varchar(150) DEFAULT NULL COMMENT '评论内容',
  `storesnscomm_memberid` int(11) DEFAULT NULL COMMENT '会员ID',
  `storesnscomm_membername` varchar(45) DEFAULT NULL COMMENT '会员名称',
  `storesnscomm_memberavatar` varchar(50) DEFAULT NULL COMMENT '会员头像',
  `storesnscomm_time` varchar(11) DEFAULT NULL COMMENT '评论时间',
  `storesnscomm_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '评论状态 1:正常 0:屏蔽',
  PRIMARY KEY (`storesnscomm_id`),
  KEY `stracelog_id` (`stracelog_id`),
  KEY `storesnscomm_memberid` (`storesnscomm_memberid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺动态评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_storesnscomment`
--

LOCK TABLES `ds_storesnscomment` WRITE;
/*!40000 ALTER TABLE `ds_storesnscomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_storesnscomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_storesnssetting`
--

DROP TABLE IF EXISTS `ds_storesnssetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_storesnssetting` (
  `storesnsset_storeid` int(11) NOT NULL COMMENT '店铺ID',
  `storesnsset_new` tinyint(4) NOT NULL DEFAULT '1' COMMENT '新品 0:关闭 1:开启',
  `storesnsset_newtitle` varchar(150) NOT NULL COMMENT '新品内容',
  `storesnsset_coupon` tinyint(4) NOT NULL DEFAULT '1' COMMENT '优惠券 0:关闭 1:开启',
  `storesnsset_coupontitle` varchar(150) NOT NULL COMMENT '优惠券内容',
  `storesnsset_xianshi` tinyint(4) NOT NULL DEFAULT '1' COMMENT '限时折扣 0:关闭 1:开启',
  `storesnsset_xianshititle` varchar(150) NOT NULL COMMENT '限时折扣内容',
  `storesnsset_mansong` tinyint(4) NOT NULL DEFAULT '1' COMMENT '满即送 0:关闭 1:开启',
  `storesnsset_mansongtitle` varchar(150) NOT NULL COMMENT '满即送内容',
  `storesnsset_bundling` tinyint(4) NOT NULL DEFAULT '1' COMMENT '组合销售 0:关闭 1:开启',
  `storesnsset_bundlingtitle` varchar(150) NOT NULL COMMENT '组合销售内容',
  `storesnsset_groupbuy` tinyint(4) NOT NULL DEFAULT '1' COMMENT '抢购,0:关闭 1:开启',
  `storesnsset_groupbuytitle` varchar(150) NOT NULL COMMENT '抢购内容',
  PRIMARY KEY (`storesnsset_storeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺自动发布动态设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_storesnssetting`
--

LOCK TABLES `ds_storesnssetting` WRITE;
/*!40000 ALTER TABLE `ds_storesnssetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_storesnssetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_storesnstracelog`
--

DROP TABLE IF EXISTS `ds_storesnstracelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_storesnstracelog` (
  `stracelog_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺动态自增ID',
  `stracelog_storeid` int(11) DEFAULT NULL COMMENT '店铺ID',
  `stracelog_storename` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `stracelog_storelogo` varchar(255) NOT NULL COMMENT '店标',
  `stracelog_title` varchar(150) DEFAULT NULL COMMENT '动态标题',
  `stracelog_content` text COMMENT '发表内容',
  `stracelog_time` varchar(11) DEFAULT NULL COMMENT '动态发表时间',
  `stracelog_cool` int(11) DEFAULT '0' COMMENT '动态赞数量',
  `stracelog_spread` int(11) DEFAULT '0' COMMENT '动态转播数量',
  `stracelog_comment` int(11) DEFAULT '0' COMMENT '动态评论数量',
  `stracelog_type` tinyint(4) DEFAULT '1' COMMENT '1:relay,2:normal,3:new,4:coupon,5:xianshi,6:mansong,7:bundling,8:groupbuy,9:recommend,10:hotsell',
  `stracelog_goodsdata` text COMMENT '商品信息',
  `stracelog_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '动态状态 1:正常 0:屏蔽',
  PRIMARY KEY (`stracelog_id`),
  KEY `stracelog_storeid` (`stracelog_storeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺动态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_storesnstracelog`
--

LOCK TABLES `ds_storesnstracelog` WRITE;
/*!40000 ALTER TABLE `ds_storesnstracelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_storesnstracelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_storewatermark`
--

DROP TABLE IF EXISTS `ds_storewatermark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_storewatermark` (
  `swm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '水印自增ID',
  `swm_quality` int(3) NOT NULL DEFAULT '90' COMMENT '水印图片质量',
  `swm_image_name` varchar(255) DEFAULT NULL COMMENT '水印文件名',
  `swm_image_pos` tinyint(1) NOT NULL DEFAULT '1' COMMENT '水印图片存放位置',
  `swm_image_transition` int(3) NOT NULL DEFAULT '20' COMMENT '水印图片融合度 ',
  `swm_text` text COMMENT '水印文字',
  `swm_text_size` int(3) NOT NULL DEFAULT '20' COMMENT '水印文字大小',
  `swm_text_angle` tinyint(1) NOT NULL DEFAULT '4' COMMENT '水印文字角度',
  `swm_text_pos` tinyint(1) NOT NULL DEFAULT '3' COMMENT '水印文字位置',
  `swm_text_font` varchar(50) DEFAULT NULL COMMENT '水印文字字体',
  `swm_text_color` varchar(7) NOT NULL DEFAULT '#CCCCCC' COMMENT '水印字体颜色值',
  `store_id` int(11) DEFAULT NULL COMMENT '店铺ID',
  PRIMARY KEY (`swm_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='店铺水印图片表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_storewatermark`
--

LOCK TABLES `ds_storewatermark` WRITE;
/*!40000 ALTER TABLE `ds_storewatermark` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_storewatermark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_transport`
--

DROP TABLE IF EXISTS `ds_transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_transport` (
  `transport_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '售卖区域自增ID',
  `transport_title` varchar(30) NOT NULL COMMENT '售卖区域名称',
  `send_tpl_id` mediumint(8) unsigned DEFAULT NULL COMMENT '发货地区模板ID',
  `store_id` mediumint(8) unsigned NOT NULL COMMENT '店铺ID',
  `transport_updatetime` int(10) unsigned DEFAULT '0' COMMENT '最后更新时间',
  `transport_is_limited` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否限制配送',
  `transport_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '计费方式（0件1重量）',
  PRIMARY KEY (`transport_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='售卖区域';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_transport`
--

LOCK TABLES `ds_transport` WRITE;
/*!40000 ALTER TABLE `ds_transport` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_transport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_transportextend`
--

DROP TABLE IF EXISTS `ds_transportextend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_transportextend` (
  `transportext_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '运费模板扩展ID',
  `transportext_area_id` text COMMENT '市级地区ID组成的串，以，隔开，两端也有，',
  `transportext_top_area_id` text COMMENT '省级地区ID组成的串，以，隔开，两端也有，',
  `transportext_area_name` text COMMENT '地区name组成的串，以，隔开',
  `transportext_sprice` decimal(10,2) DEFAULT '0.00' COMMENT '首件运费',
  `transport_id` mediumint(8) unsigned NOT NULL COMMENT '运费模板ID',
  `transport_title` varchar(60) DEFAULT NULL COMMENT '运费模板',
  `transportext_is_default` tinyint(2) NOT NULL DEFAULT '0',
  `transportext_snum` int(11) DEFAULT '1' COMMENT '起始件数',
  `transportext_xnum` int(11) DEFAULT NULL,
  `transportext_xprice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`transportext_id`),
  KEY `transport_id` (`transport_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='运费模板扩展表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_transportextend`
--

LOCK TABLES `ds_transportextend` WRITE;
/*!40000 ALTER TABLE `ds_transportextend` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_transportextend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_type`
--

DROP TABLE IF EXISTS `ds_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_type` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '类型自增ID',
  `type_name` varchar(100) NOT NULL COMMENT '类型名称',
  `type_sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '类型排序',
  `class_id` int(10) unsigned DEFAULT '0' COMMENT '所属商品分类id',
  `class_name` varchar(100) NOT NULL COMMENT '所属商品分类名称',
  PRIMARY KEY (`type_id`),
  KEY `class_id` (`class_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商品类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_type`
--

LOCK TABLES `ds_type` WRITE;
/*!40000 ALTER TABLE `ds_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_typebrand`
--

DROP TABLE IF EXISTS `ds_typebrand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_typebrand` (
  `type_id` int(10) unsigned NOT NULL COMMENT '类型ID',
  `brand_id` int(10) unsigned NOT NULL COMMENT '品牌ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品类型与品牌对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_typebrand`
--

LOCK TABLES `ds_typebrand` WRITE;
/*!40000 ALTER TABLE `ds_typebrand` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_typebrand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_typespec`
--

DROP TABLE IF EXISTS `ds_typespec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_typespec` (
  `type_id` int(10) unsigned NOT NULL COMMENT '类型ID',
  `sp_id` int(10) unsigned NOT NULL COMMENT '规格ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品类型与规格对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_typespec`
--

LOCK TABLES `ds_typespec` WRITE;
/*!40000 ALTER TABLE `ds_typespec` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_typespec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_upload`
--

DROP TABLE IF EXISTS `ds_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_upload` (
  `upload_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '上传文件自增ID',
  `file_name` varchar(100) DEFAULT NULL COMMENT '上传文件名',
  `file_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传文件大小',
  `upload_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '上传文件类别 0:无 1:后台文章图片 2:帮助内容图片 3:店铺幻灯片 4:会员协议图片 5:积分礼品切换图片 6:积分礼品内容图片 7:可视化编辑模块图片',
  `upload_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传文件添加时间',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '信息ID',
  PRIMARY KEY (`upload_id`),
  KEY `upload_type` (`upload_type`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='上传文件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_upload`
--

LOCK TABLES `ds_upload` WRITE;
/*!40000 ALTER TABLE `ds_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_verify_code`
--

DROP TABLE IF EXISTS `ds_verify_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_verify_code` (
  `verify_code_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '验证码id',
  `verify_code_type` tinyint(1) unsigned NOT NULL COMMENT '验证码类型（1登录2注册3修改密码4绑定手机5绑定邮箱6安全验证）',
  `verify_code` char(6) NOT NULL COMMENT '验证码',
  `verify_code_user_type` tinyint(1) unsigned NOT NULL COMMENT '发送验证码的用户类型（1会员2店长3配送员）',
  `verify_code_user_id` int(10) unsigned NOT NULL COMMENT '发送验证码的用户id',
  `verify_code_user_name` varchar(60) NOT NULL COMMENT '发送验证码的用户名',
  `verify_code_add_time` int(10) unsigned NOT NULL COMMENT '发送时间',
  `verify_code_ip` varchar(15) NOT NULL COMMENT 'ip地址',
  PRIMARY KEY (`verify_code_id`),
  KEY `verify_code_type` (`verify_code_type`,`verify_code_user_type`,`verify_code_user_id`,`verify_code`,`verify_code_add_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='验证码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_verify_code`
--

LOCK TABLES `ds_verify_code` WRITE;
/*!40000 ALTER TABLE `ds_verify_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_verify_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_voucher`
--

DROP TABLE IF EXISTS `ds_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '代金券自增ID',
  `voucher_code` varchar(32) NOT NULL COMMENT '代金券编码',
  `vouchertemplate_id` int(11) NOT NULL COMMENT '代金券模版编号',
  `voucher_title` varchar(50) NOT NULL COMMENT '代金券标题',
  `voucher_desc` varchar(255) NOT NULL COMMENT '代金券描述',
  `voucher_startdate` int(11) NOT NULL COMMENT '代金券有效期开始时间',
  `voucher_enddate` int(11) NOT NULL COMMENT '代金券有效期结束时间',
  `voucher_price` int(11) NOT NULL COMMENT '代金券面额',
  `voucher_limit` decimal(10,2) NOT NULL COMMENT '代金券使用时的订单限额',
  `voucher_store_id` int(11) NOT NULL COMMENT '代金券的店铺id',
  `voucher_state` tinyint(4) NOT NULL COMMENT '代金券状态 1:未用 2:已用 3:过期 4:收回 ',
  `voucher_activedate` int(11) NOT NULL COMMENT '代金券发放日期',
  `voucher_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '代金券类别',
  `voucher_owner_id` int(11) NOT NULL COMMENT '代金券所有者ID',
  `voucher_owner_name` varchar(50) NOT NULL COMMENT '代金券所有者名称',
  `voucher_order_id` int(11) DEFAULT NULL COMMENT '使用该代金券的订单编号',
  PRIMARY KEY (`voucher_id`),
  KEY `voucher_store_id` (`voucher_store_id`),
  KEY `voucher_owner_id` (`voucher_owner_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='代金券表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_voucher`
--

LOCK TABLES `ds_voucher` WRITE;
/*!40000 ALTER TABLE `ds_voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_voucherprice`
--

DROP TABLE IF EXISTS `ds_voucherprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_voucherprice` (
  `voucherprice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '代金券面值自增ID',
  `voucherprice_describe` varchar(255) NOT NULL COMMENT '代金券描述',
  `voucherprice` int(11) NOT NULL COMMENT '代金券面值',
  `voucherprice_defaultpoints` int(11) NOT NULL DEFAULT '0' COMMENT '代金劵默认的兑换所需积分可以为0',
  PRIMARY KEY (`voucherprice_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='代金券面额表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_voucherprice`
--

LOCK TABLES `ds_voucherprice` WRITE;
/*!40000 ALTER TABLE `ds_voucherprice` DISABLE KEYS */;
INSERT INTO `ds_voucherprice` VALUES (1,'满1000元可用',100,10),(2,'满3000元可用',200,10);
/*!40000 ALTER TABLE `ds_voucherprice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_voucherquota`
--

DROP TABLE IF EXISTS `ds_voucherquota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_voucherquota` (
  `voucherquota_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '代金券套餐自增ID',
  `voucherquota_applyid` int(11) DEFAULT NULL COMMENT '代金券套餐申请编号',
  `voucherquota_memberid` int(11) NOT NULL COMMENT '会员ID',
  `voucherquota_membername` varchar(100) NOT NULL COMMENT '会员名称',
  `voucherquota_storeid` int(11) NOT NULL COMMENT '店铺ID',
  `voucherquota_storename` varchar(100) NOT NULL COMMENT '店铺名称',
  `voucherquota_starttime` int(11) NOT NULL COMMENT '代金券套餐开始时间',
  `voucherquota_endtime` int(11) NOT NULL COMMENT '代金券套餐结束时间',
  `voucherquota_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1:可用 2:取消 3:结束',
  PRIMARY KEY (`voucherquota_id`),
  KEY `voucherquota_storeid` (`voucherquota_storeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='代金券套餐表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_voucherquota`
--

LOCK TABLES `ds_voucherquota` WRITE;
/*!40000 ALTER TABLE `ds_voucherquota` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_voucherquota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_vouchertemplate`
--

DROP TABLE IF EXISTS `ds_vouchertemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_vouchertemplate` (
  `vouchertemplate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '代金券模版自增ID',
  `vouchertemplate_title` varchar(50) NOT NULL COMMENT '代金券模版名称',
  `vouchertemplate_desc` varchar(255) NOT NULL COMMENT '代金券模版描述',
  `vouchertemplate_startdate` int(11) NOT NULL COMMENT '代金券模版有效期开始时间',
  `vouchertemplate_enddate` int(11) NOT NULL COMMENT '代金券模版有效期结束时间',
  `vouchertemplate_price` int(11) NOT NULL COMMENT '代金券模版面额',
  `vouchertemplate_limit` decimal(10,2) NOT NULL COMMENT '代金券使用时的订单限额',
  `vouchertemplate_store_id` int(11) NOT NULL COMMENT '代金券模版的店铺ID',
  `vouchertemplate_storename` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `vouchertemplate_sc_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属店铺分类ID',
  `vouchertemplate_creator_id` int(11) NOT NULL COMMENT '代金券模版的创建者ID',
  `vouchertemplate_state` tinyint(4) NOT NULL COMMENT '代金券模版状态 1:有效 2:失效',
  `vouchertemplate_total` int(11) NOT NULL COMMENT '模版可发放的代金券总数',
  `vouchertemplate_giveout` int(11) NOT NULL COMMENT '模版已发放的代金券数量',
  `vouchertemplate_used` int(11) NOT NULL COMMENT '模版已经使用过的代金券',
  `vouchertemplate_adddate` int(11) NOT NULL COMMENT '模版的创建时间',
  `vouchertemplate_quotaid` int(11) NOT NULL COMMENT '套餐编号',
  `vouchertemplate_points` int(11) NOT NULL DEFAULT '0' COMMENT '兑换所需积分',
  `vouchertemplate_eachlimit` int(11) NOT NULL DEFAULT '1' COMMENT '每人限领张数',
  `vouchertemplate_styleimg` varchar(200) DEFAULT NULL COMMENT '样式模版图片',
  `vouchertemplate_customimg` varchar(200) DEFAULT NULL COMMENT '自定义代金券模板图片',
  `vouchertemplate_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐 0:不推荐 1:推荐',
  `vouchertemplate_gettype` tinyint(1) NOT NULL COMMENT '代金券类型',
  PRIMARY KEY (`vouchertemplate_id`),
  KEY `vouchertemplate_store_id` (`vouchertemplate_store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='代金券模版表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_vouchertemplate`
--

LOCK TABLES `ds_vouchertemplate` WRITE;
/*!40000 ALTER TABLE `ds_vouchertemplate` DISABLE KEYS */;
INSERT INTO `ds_vouchertemplate` VALUES (1,'100元代金券','满1000元可用',1606983450,1609575450,100,1000.00,1,'官方自营店铺',0,1,2,10000,0,0,1606983450,0,10,1,NULL,NULL,0,1),(2,'200元代金券','满3000元可用',1606983493,1609575493,200,3000.00,1,'官方自营店铺',0,1,2,10000,0,0,1606983493,0,10,1,NULL,NULL,0,1);
/*!40000 ALTER TABLE `ds_vouchertemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_vrgroupbuyclass`
--

DROP TABLE IF EXISTS `ds_vrgroupbuyclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_vrgroupbuyclass` (
  `vrgclass_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '虚拟抢购分类自增ID',
  `vrgclass_name` varchar(100) NOT NULL COMMENT '分类名称',
  `vrgclass_parent_id` int(11) NOT NULL COMMENT '上级分类ID',
  `vrgclass_sort` tinyint(3) unsigned DEFAULT '255' COMMENT '虚拟抢购分类排序',
  PRIMARY KEY (`vrgclass_id`),
  KEY `vrgclass_parent_id` (`vrgclass_parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='虚拟抢购分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_vrgroupbuyclass`
--

LOCK TABLES `ds_vrgroupbuyclass` WRITE;
/*!40000 ALTER TABLE `ds_vrgroupbuyclass` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_vrgroupbuyclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_vrorder`
--

DROP TABLE IF EXISTS `ds_vrorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_vrorder` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '虚拟订单自增ID',
  `order_sn` varchar(20) NOT NULL COMMENT '虚拟订单编号',
  `store_id` int(11) unsigned NOT NULL COMMENT '卖家店铺ID',
  `store_name` varchar(50) NOT NULL COMMENT '卖家店铺名称',
  `buyer_id` int(11) unsigned NOT NULL COMMENT '买家ID',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家登录名',
  `buyer_phone` varchar(11) NOT NULL COMMENT '买家手机',
  `add_time` int(10) unsigned NOT NULL COMMENT '虚拟订单生成时间',
  `payment_code` char(20) NOT NULL DEFAULT '' COMMENT '虚拟订单支付方式名称代码',
  `payment_time` int(10) unsigned DEFAULT '0' COMMENT '虚拟订单支付(付款)时间',
  `trade_no` varchar(35) DEFAULT NULL COMMENT '第三方平台交易号',
  `close_time` int(10) unsigned DEFAULT '0' COMMENT '虚拟订单关闭时间',
  `close_reason` varchar(50) DEFAULT NULL COMMENT '虚拟订单关闭原因',
  `finnshed_time` int(11) DEFAULT NULL COMMENT '虚拟订单完成时间',
  `order_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '订单总价格(支付金额)',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `rcb_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '充值卡支付金额',
  `pd_amount` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '预存款支付金额',
  `order_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单状态 0:已取消 10:未付款 20:已付款 40:已完成',
  `refund_state` tinyint(1) unsigned DEFAULT '0' COMMENT '退款状态 0:无退款 1:部分退款 2:全部退款',
  `buyer_msg` varchar(150) DEFAULT NULL COMMENT '虚拟订单买家留言',
  `delete_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态 0:未删除1:放入回收站2:彻底删除',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `goods_num` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '商品数量',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `commis_rate` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '佣金比例',
  `gc_id` mediumint(9) DEFAULT '0' COMMENT '商品最底级分类ID',
  `vr_indate` int(11) DEFAULT NULL COMMENT '虚拟订单有效期',
  `vr_send_times` tinyint(4) NOT NULL DEFAULT '0' COMMENT '兑换码发送次数',
  `vr_invalid_refund` tinyint(4) NOT NULL DEFAULT '1' COMMENT '允许过期退款 1:是 0:否',
  `order_promotion_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '订单参加的促销类型 0:无促销 1:抢购 2:拼团',
  `promotions_id` mediumint(9) DEFAULT '0' COMMENT '促销ID，与order_promotion_type配合使用',
  `order_from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单来源 1:PC 2:手机',
  `evaluation_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '评价状态 0:默认 1:已评价 2:禁止评价',
  `evaluation_time` int(11) NOT NULL DEFAULT '0' COMMENT '评价时间',
  `use_state` tinyint(4) DEFAULT '0' COMMENT '使用状态 0:未使用 1:已使用',
  `ob_no` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '相关结算单号',
  PRIMARY KEY (`order_id`),
  KEY `store_id` (`store_id`),
  KEY `buyer_id` (`buyer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='虚拟订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_vrorder`
--

LOCK TABLES `ds_vrorder` WRITE;
/*!40000 ALTER TABLE `ds_vrorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_vrorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_vrordercode`
--

DROP TABLE IF EXISTS `ds_vrordercode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_vrordercode` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '兑换码自增ID',
  `order_id` int(11) NOT NULL COMMENT '虚拟订单ID',
  `store_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺ID',
  `buyer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '买家ID',
  `vr_code` varchar(18) NOT NULL COMMENT '兑换码',
  `vr_state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '使用状态 0:(默认)未使用1:已使用2:已过期',
  `vr_usetime` int(11) DEFAULT NULL COMMENT '使用时间',
  `pay_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际支付金额(结算)',
  `vr_indate` int(11) DEFAULT NULL COMMENT '过期时间',
  `commis_rate` smallint(6) NOT NULL DEFAULT '0' COMMENT '佣金比例',
  `refund_lock` tinyint(1) unsigned DEFAULT '0' COMMENT '退款锁定状态:0:正常,1:锁定,2:同意',
  `vr_invalid_refund` tinyint(4) NOT NULL DEFAULT '1' COMMENT '允许过期退款1:是0:否',
  PRIMARY KEY (`rec_id`),
  KEY `order_id` (`order_id`),
  KEY `store_id` (`store_id`),
  KEY `buyer_id` (`buyer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='兑换码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_vrordercode`
--

LOCK TABLES `ds_vrordercode` WRITE;
/*!40000 ALTER TABLE `ds_vrordercode` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_vrordercode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_vrrefund`
--

DROP TABLE IF EXISTS `ds_vrrefund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_vrrefund` (
  `refund_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '虚拟退款记录自增ID',
  `order_id` int(10) unsigned NOT NULL COMMENT '虚拟订单ID',
  `order_sn` varchar(20) NOT NULL COMMENT '虚拟订单编号',
  `refund_sn` varchar(50) NOT NULL COMMENT '申请编号',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `store_name` varchar(20) NOT NULL COMMENT '店铺名称',
  `buyer_id` int(10) unsigned NOT NULL COMMENT '买家ID',
  `buyer_name` varchar(50) NOT NULL COMMENT '买家会员名',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `goods_num` int(10) unsigned DEFAULT '1' COMMENT '退款商品数量',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `goods_image` varchar(100) DEFAULT NULL COMMENT '商品图片',
  `redeemcode_sn` varchar(300) NOT NULL COMMENT '兑换码编号',
  `refund_amount` decimal(10,2) DEFAULT '0.00' COMMENT '退款金额',
  `admin_state` tinyint(1) unsigned DEFAULT '1' COMMENT '退款状态 1:待审核 2:同意 3:不同意',
  `add_time` int(10) unsigned NOT NULL COMMENT '虚拟退款添加时间',
  `admin_time` int(10) unsigned DEFAULT '0' COMMENT '管理员处理时间',
  `buyer_message` varchar(300) DEFAULT NULL COMMENT '虚拟退款申请原因',
  `admin_message` varchar(300) DEFAULT NULL COMMENT '管理员备注',
  `commis_rate` smallint(6) DEFAULT '0' COMMENT '佣金比例',
  PRIMARY KEY (`refund_id`),
  KEY `order_id` (`order_id`),
  KEY `store_id` (`store_id`),
  KEY `buyer_id` (`buyer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='虚拟退款表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_vrrefund`
--

LOCK TABLES `ds_vrrefund` WRITE;
/*!40000 ALTER TABLE `ds_vrrefund` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_vrrefund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_wholesale`
--

DROP TABLE IF EXISTS `ds_wholesale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_wholesale` (
  `wholesale_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '批发ID',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) NOT NULL COMMENT '用户名',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '主商品公共ID',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `wholesalequota_id` int(10) unsigned NOT NULL COMMENT '批发套餐ID',
  `wholesale_starttime` int(10) unsigned NOT NULL COMMENT '活动开始时间',
  `wholesale_end_time` int(10) unsigned NOT NULL COMMENT '活动结束时间',
  `wholesale_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态，0:取消 1:正常',
  `wholesale_if_mix` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否混批',
  PRIMARY KEY (`wholesale_id`),
  KEY `store_id` (`store_id`),
  KEY `goods_commonid` (`goods_commonid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='批发表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_wholesale`
--

LOCK TABLES `ds_wholesale` WRITE;
/*!40000 ALTER TABLE `ds_wholesale` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_wholesale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_wholesalegoods`
--

DROP TABLE IF EXISTS `ds_wholesalegoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_wholesalegoods` (
  `wholesalegoods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '批发商品表',
  `wholesale_id` int(10) unsigned NOT NULL COMMENT '批发ID',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `goods_commonid` int(10) unsigned NOT NULL COMMENT '主商品公共ID',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL COMMENT '店铺价格',
  `goods_image` varchar(100) NOT NULL COMMENT '商品图片',
  `wholesalegoods_price` text NOT NULL COMMENT '批发价格',
  `wholesale_starttime` int(10) unsigned NOT NULL COMMENT '开始时间',
  `wholesale_end_time` int(10) unsigned NOT NULL COMMENT '结束时间',
  `wholesalegoods_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态，0-取消 1-正常',
  PRIMARY KEY (`wholesalegoods_id`),
  KEY `store_id` (`store_id`),
  KEY `goods_id` (`goods_id`),
  KEY `goods_commonid` (`goods_commonid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='批发商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_wholesalegoods`
--

LOCK TABLES `ds_wholesalegoods` WRITE;
/*!40000 ALTER TABLE `ds_wholesalegoods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_wholesalegoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_wholesalequota`
--

DROP TABLE IF EXISTS `ds_wholesalequota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_wholesalequota` (
  `wholesalequota_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '批发套餐ID',
  `member_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `store_id` int(10) unsigned NOT NULL COMMENT '店铺ID',
  `member_name` varchar(50) NOT NULL COMMENT '用户名称',
  `store_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `wholesalequota_starttime` int(10) unsigned NOT NULL COMMENT '开始时间',
  `wholesalequota_endtime` int(10) unsigned NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`wholesalequota_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='批发套餐';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_wholesalequota`
--

LOCK TABLES `ds_wholesalequota` WRITE;
/*!40000 ALTER TABLE `ds_wholesalequota` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_wholesalequota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_wxconfig`
--

DROP TABLE IF EXISTS `ds_wxconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_wxconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '微信配置自增ID',
  `wxname` varchar(60) NOT NULL DEFAULT '' COMMENT '公众号名称',
  `appid` varchar(50) NOT NULL DEFAULT '' COMMENT 'appid',
  `appsecret` varchar(50) NOT NULL DEFAULT '' COMMENT 'appsecret',
  `token` char(255) NOT NULL COMMENT 'token',
  `qrcode` varchar(200) NOT NULL DEFAULT '' COMMENT '公众号二维码',
  `access_token` varchar(250) DEFAULT NULL COMMENT '令牌',
  `expires_in` int(15) DEFAULT NULL COMMENT '过期时间',
  `xcx_appid` varchar(50) NOT NULL DEFAULT '' COMMENT '小程序appid',
  `xcx_appsecret` varchar(50) NOT NULL DEFAULT '' COMMENT '小程序appsecret',
  `xcx_access_token` varchar(250) DEFAULT NULL COMMENT '小程序令牌',
  `xcx_expires_in` int(15) DEFAULT NULL COMMENT '小程序过期时间',
  `ticket` varchar(250) DEFAULT NULL COMMENT 'ticket',
  `ticket_expires_in` int(15) DEFAULT NULL COMMENT 'ticket过期时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_wxconfig`
--

LOCK TABLES `ds_wxconfig` WRITE;
/*!40000 ALTER TABLE `ds_wxconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_wxconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_wxkeyword`
--

DROP TABLE IF EXISTS `ds_wxkeyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_wxkeyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `keyword` char(255) NOT NULL COMMENT '关键词',
  `pid` int(11) NOT NULL COMMENT '对应表ID',
  `type` varchar(30) DEFAULT 'TEXT' COMMENT '关键词操作类型',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信关键词表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_wxkeyword`
--

LOCK TABLES `ds_wxkeyword` WRITE;
/*!40000 ALTER TABLE `ds_wxkeyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_wxkeyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_wxmenu`
--

DROP TABLE IF EXISTS `ds_wxmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_wxmenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '微信菜单id',
  `pid` int(11) NOT NULL COMMENT '父菜单id',
  `name` varchar(32) NOT NULL COMMENT '微信菜单名称',
  `type` varchar(10) NOT NULL COMMENT '微信菜单类型',
  `value` varchar(200) NOT NULL COMMENT '微信菜单值',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_wxmenu`
--

LOCK TABLES `ds_wxmenu` WRITE;
/*!40000 ALTER TABLE `ds_wxmenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_wxmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_wxmsg`
--

DROP TABLE IF EXISTS `ds_wxmsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_wxmsg` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '推送ID',
  `member_id` int(11) DEFAULT NULL COMMENT '为空则推送全体微信用户',
  `content` text NOT NULL COMMENT '推送内容',
  `createtime` int(15) NOT NULL COMMENT '创建时间',
  `issend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未发送1成功2失败',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信推送表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_wxmsg`
--

LOCK TABLES `ds_wxmsg` WRITE;
/*!40000 ALTER TABLE `ds_wxmsg` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_wxmsg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ds_wxtext`
--

DROP TABLE IF EXISTS `ds_wxtext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ds_wxtext` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `keyword` char(255) NOT NULL COMMENT '关键词',
  `text` text NOT NULL COMMENT 'text',
  `createtime` varchar(13) NOT NULL DEFAULT '' COMMENT '创建时间',
  `updatetime` varchar(13) NOT NULL DEFAULT '' COMMENT '更新时间',
  `click` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信文本回复表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ds_wxtext`
--

LOCK TABLES `ds_wxtext` WRITE;
/*!40000 ALTER TABLE `ds_wxtext` DISABLE KEYS */;
/*!40000 ALTER TABLE `ds_wxtext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'xbyshop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-12 22:52:20
