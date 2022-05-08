-- MySQL dump 10.13  Distrib 5.6.44, for Linux (x86_64)
--
-- Host: localhost    Database: bx_keku_wang
-- ------------------------------------------------------
-- Server version	5.6.44-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `value` varchar(256) NOT NULL,
  `other` varchar(256) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'appname','报修服务平台','小程序名称'),(2,'isreg','1','是否强制注册，0：不需要注册，直接跳转到报修页面，1：需要注册，未注册用户跳到注册页面。'),(3,'waittime','-1','欢迎页面显示时间（毫秒），-1：不自动跳转');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danwei`
--

DROP TABLE IF EXISTS `danwei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `danwei` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '单位名',
  `status` int(1) unsigned NOT NULL DEFAULT '1',
  `other` varchar(256) NOT NULL DEFAULT '0' COMMENT '0：内部单位；1：外部单位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danwei`
--

LOCK TABLES `danwei` WRITE;
/*!40000 ALTER TABLE `danwei` DISABLE KEYS */;
INSERT INTO `danwei` VALUES (1,'办公室',1,'0'),(35,'正奇商行',1,'1');
/*!40000 ALTER TABLE `danwei` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fenlei`
--

DROP TABLE IF EXISTS `fenlei`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fenlei` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '维修项目名称',
  `shang` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属上级分类ID',
  `other` varchar(256) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fenlei`
--

LOCK TABLES `fenlei` WRITE;
/*!40000 ALTER TABLE `fenlei` DISABLE KEYS */;
INSERT INTO `fenlei` VALUES (1,'电脑',0,''),(2,'打（复）印机',0,''),(3,'电话',0,''),(4,'其他',0,''),(5,'系统故障（无法开机等）',1,''),(6,'网络问题',1,''),(7,'应用软件问题（WPS、360等）',1,''),(8,'业务软件问题（金三、数字人事等）',1,''),(9,'耗材申请（键鼠等）',1,''),(10,'其他电脑问题',1,''),(11,'耗材申请（加粉、换鼓等）',2,''),(12,'打印机安装调试',2,''),(13,'打（复）印机维修',2,''),(14,'其他打（复）印机问题',2,''),(15,'固话新增移机',3,''),(16,'电话故障',3,''),(17,'其他电话问题',3,''),(18,'WiFi增改',4,''),(19,'其他软件问题',4,''),(20,'其他硬件问题',4,'');
/*!40000 ALTER TABLE `fenlei` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(100) DEFAULT NULL COMMENT '微信OPENID',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名，手机号',
  `password` varchar(1024) DEFAULT NULL COMMENT '后台登录密码',
  `juese` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '角色，0：未绑定微信的初始账号；1：报修者；2：管理员；3：维修者',
  `status` int(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，0：禁用；1：启用',
  `ming` varchar(10) DEFAULT NULL COMMENT '真实姓名',
  `tel` varchar(20) DEFAULT NULL COMMENT '电话',
  `danwei` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '单位ID',
  `qianming` varchar(256) DEFAULT NULL COMMENT '签名图片地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'oZBrn5CV6k-pZcrlBu5s4IxB-zRk','18888888888','sha512:10000:24:Zs9JtQkqmRw1INgevf6w8L4iNwuav3Z4:umF7LCm7/dhKRxEOEYd8YXgLOMf4Eo35',2,1,'人名','18888888888',2,'3fbe0a6c8097e31e35fd97f4af06c2fa.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wenti`
--

DROP TABLE IF EXISTS `wenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wenti` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL COMMENT '提报者OPENID',
  `bmid` int(10) unsigned NOT NULL COMMENT '部门ID',
  `bm` varchar(20) DEFAULT NULL COMMENT '部门名',
  `dz` varchar(256) NOT NULL COMMENT '地址',
  `lxr` varchar(10) NOT NULL COMMENT '联系人',
  `tel` varchar(20) NOT NULL COMMENT '电话',
  `xmid` int(10) unsigned NOT NULL COMMENT '故障项目ID',
  `xm` varchar(20) DEFAULT NULL COMMENT '故障项目',
  `gzid` int(10) unsigned NOT NULL COMMENT '故障ID',
  `gz` varchar(20) DEFAULT NULL COMMENT '故障名',
  `ms` varchar(256) DEFAULT NULL COMMENT '故障描述',
  `img` varchar(512) DEFAULT NULL COMMENT '故障图',
  `yysj` varchar(20) DEFAULT NULL COMMENT '预约时间',
  `tbsj` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '报修时间',
  `status` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `xxzx` varchar(50) DEFAULT NULL COMMENT '审批者OPENID',
  `xxzxyj` varchar(256) DEFAULT NULL COMMENT '审批者意见',
  `pdsj` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '派单时间 ',
  `wxz` varchar(50) DEFAULT NULL COMMENT '维修者OPENID，推送给谁维修',
  `clyj` varchar(256) DEFAULT NULL COMMENT '审批者结单、工程师拒单意见',
  `clsj` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员结单、工程师拒单、接单时间',
  `wxxm` text COMMENT '维修项目，维修者填写，JSON格式，项目名，数量，单价',
  `zj` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '维修总价',
  `wxsj` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '维修时间',
  `xxzxshz` varchar(50) DEFAULT NULL COMMENT '审批者费用单审核者',
  `xxzxqm` varchar(256) DEFAULT NULL COMMENT '审批者签名',
  `shsj` int(10) unsigned NOT NULL COMMENT '审批者审核时间',
  `shyj` varchar(256) DEFAULT NULL COMMENT '费用信息中心审核意见',
  `wxzqm` varchar(256) DEFAULT NULL COMMENT '维修者签名',
  `bxzqm` varchar(256) DEFAULT NULL COMMENT '报修者（接受维修者）签名',
  `daochu` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已经导出',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wenti`
--

LOCK TABLES `wenti` WRITE;
/*!40000 ALTER TABLE `wenti` DISABLE KEYS */;
INSERT INTO `wenti` VALUES (1,'oZBrn5CV6k-oZcr1Bu5P4IxB-zRk',16,'机关党委','呕呕呕','人名','18888888888',1,'电脑',5,'系统故障（无法开机等）','不知道怎么了','[\"8f3ed9c25deed58f77b0068adec6a91d.jpg\"]','2020-3-24 21:52',18888888888,8,'oZBrn5CV6k-oZcr1Bu5P4IxB-zRk','快点',18888888888,'oWBin5EKVZ00JAaGZsgmgiO-ZG8Y','',18888888888,'[]',0.00,18888888888,'oWBin5K0TOeRsbGh4W3Du4_0vdQE','d61c437cef4134187b949cfe9c9a203a.jpg',1888888888,'','abaa43a4c19ca18e4db6ba584d95c59a.jpg','89574652f3892c3a228e3425f3d89318.jpg',0);
/*!40000 ALTER TABLE `wenti` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-01  5:20:01
