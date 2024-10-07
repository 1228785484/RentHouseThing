-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ry_vue
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (2,'landlord','房东信息表',NULL,NULL,'Landlord','crud','element-ui','com.ruoyi.system','system','landlord','房东信息','ruoyi','0','/','{}','admin','2024-09-30 16:55:10','','2024-09-30 18:36:08',NULL),(3,'tenant','租户信息表',NULL,NULL,'Tenant','crud','element-ui','com.ruoyi.system','system','tenant','租户信息','ruoyi','0','/','{}','admin','2024-09-30 18:48:45','','2024-09-30 19:13:05',NULL),(4,'propertyattributes','房源属性信息表',NULL,NULL,'Propertyattributes','crud','','com.ruoyi.system','system','propertyattributes','房源属性信息','ruoyi','0','/',NULL,'admin','2024-09-30 20:05:59','',NULL,NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (10,2,'landlord_id','房东ID，主键，自动增长','int','Long','landlordId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-09-30 16:55:10','','2024-09-30 18:36:08'),(11,2,'name','房东姓名','varchar(100)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2024-09-30 16:55:10','','2024-09-30 18:36:08'),(12,2,'contact_number','联系电话','varchar(15)','String','contactNumber','0','0','1','1','1','1','1','EQ','input','',3,'admin','2024-09-30 16:55:10','','2024-09-30 18:36:08'),(13,2,'email','邮箱地址','varchar(100)','String','email','0','0','0','1','1','1','1','EQ','input','',4,'admin','2024-09-30 16:55:10','','2024-09-30 18:36:08'),(14,2,'identification_number','身份证号','varchar(20)','String','identificationNumber','0','0','0','1','1','1','1','EQ','input','',5,'admin','2024-09-30 16:55:10','','2024-09-30 18:36:08'),(15,2,'created_at','创建时间','timestamp','Date','createdAt','0','0','0','1','1','1','1','EQ','datetime','',6,'admin','2024-09-30 16:55:10','','2024-09-30 18:36:08'),(16,3,'tenant_id','租户ID','int','Long','tenantId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-09-30 18:48:45','','2024-09-30 19:13:05'),(17,3,'name','租户姓名','varchar(100)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2024-09-30 18:48:45','','2024-09-30 19:13:05'),(18,3,'contact_number','联系电话','varchar(15)','String','contactNumber','0','0','1','1','1','1','1','EQ','input','',3,'admin','2024-09-30 18:48:45','','2024-09-30 19:13:05'),(19,3,'email','邮箱地址','varchar(100)','String','email','0','0','0','1','1','1','1','EQ','input','',4,'admin','2024-09-30 18:48:45','','2024-09-30 19:13:05'),(20,3,'identification_number','身份证号','varchar(20)','String','identificationNumber','0','0','0','1','1','1','1','EQ','input','',5,'admin','2024-09-30 18:48:45','','2024-09-30 19:13:05'),(21,3,'viewing_demand','看房需求','tinyint(1)','Integer','viewingDemand','0','0','0','1','1','1','1','EQ','input','',6,'admin','2024-09-30 18:48:45','','2024-09-30 19:13:05'),(22,3,'created_at','创建时间','timestamp','Date','createdAt','0','0','0','1','1','1','1','EQ','datetime','',7,'admin','2024-09-30 18:48:45','','2024-09-30 19:13:05'),(23,4,'attribute_id','属性ID','int','Long','attributeId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-09-30 20:05:59','',NULL),(24,4,'property_id','房源ID','int','Long','propertyId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2024-09-30 20:05:59','',NULL),(25,4,'orientation','朝向','enum(\'North\',\'South\',\'East\',\'West\',\'Northeast\',\'Northwest\',\'Southeast\',\'Southwest\')','String','orientation','0','0','0','1','1','1','1','EQ',NULL,'',3,'admin','2024-09-30 20:05:59','',NULL),(26,4,'has_independent_bathroom','是否有独立卫浴','tinyint(1)','Integer','hasIndependentBathroom','0','0','0','1','1','1','1','EQ','input','',4,'admin','2024-09-30 20:05:59','',NULL),(27,4,'has_air_conditioning','是否有空调','tinyint(1)','Integer','hasAirConditioning','0','0','0','1','1','1','1','EQ','input','',5,'admin','2024-09-30 20:05:59','',NULL),(28,4,'number_of_beds','几人间','int','Long','numberOfBeds','0','0','0','1','1','1','1','EQ','input','',6,'admin','2024-09-30 20:05:59','',NULL),(29,4,'room_structure','房间结构','varchar(50)','String','roomStructure','0','0','0','1','1','1','1','EQ','input','',7,'admin','2024-09-30 20:05:59','',NULL),(30,4,'has_balcony','是否有阳台','tinyint(1)','Integer','hasBalcony','0','0','0','1','1','1','1','EQ','input','',8,'admin','2024-09-30 20:05:59','',NULL),(31,4,'furniture_types','家具种类','text','String','furnitureTypes','0','0','0','1','1','1','1','EQ','textarea','',9,'admin','2024-09-30 20:05:59','',NULL),(32,4,'created_at','创建时间','timestamp','Date','createdAt','0','0','0','1','1','1','1','EQ','datetime','',10,'admin','2024-09-30 20:05:59','',NULL);
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landlord`
--

DROP TABLE IF EXISTS `landlord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `landlord` (
  `landlord_id` int NOT NULL AUTO_INCREMENT COMMENT '房东ID',
  `name` varchar(100) NOT NULL COMMENT '房东姓名',
  `contact_number` varchar(15) NOT NULL COMMENT '联系电话',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱地址',
  `identification_number` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`landlord_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='房东信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landlord`
--

LOCK TABLES `landlord` WRITE;
/*!40000 ALTER TABLE `landlord` DISABLE KEYS */;
/*!40000 ALTER TABLE `landlord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaseagreement`
--

DROP TABLE IF EXISTS `leaseagreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaseagreement` (
  `agreement_id` int NOT NULL AUTO_INCREMENT COMMENT '合同ID',
  `tenant_id` int DEFAULT NULL COMMENT '租户ID',
  `property_id` int DEFAULT NULL COMMENT '房源ID',
  `start_date` date NOT NULL COMMENT '合同开始日期',
  `end_date` date NOT NULL COMMENT '合同结束日期',
  `monthly_rent` decimal(10,2) NOT NULL COMMENT '每月租金',
  `agreement_type` varchar(50) DEFAULT NULL COMMENT '合同押金支付方式',
  `status` enum('Active','Inactive','Expired') DEFAULT 'Active' COMMENT '合同状态',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`agreement_id`),
  KEY `tenant_id` (`tenant_id`),
  KEY `property_id` (`property_id`),
  CONSTRAINT `leaseagreement_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`tenant_id`),
  CONSTRAINT `leaseagreement_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='租赁合同信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaseagreement`
--

LOCK TABLES `leaseagreement` WRITE;
/*!40000 ALTER TABLE `leaseagreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaseagreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property` (
  `property_id` int NOT NULL AUTO_INCREMENT COMMENT '房源ID',
  `landlord_id` int DEFAULT NULL COMMENT '房东ID',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `rent_price` decimal(10,2) NOT NULL COMMENT '租金价格',
  `deposit` decimal(10,2) DEFAULT NULL COMMENT '押金',
  `available` int DEFAULT '1' COMMENT '是否可用，1为可用，0为不可用',
  `image_url` varchar(255) DEFAULT NULL COMMENT '图片路径或URL',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`property_id`),
  KEY `landlord_id` (`landlord_id`),
  CONSTRAINT `property_ibfk_1` FOREIGN KEY (`landlord_id`) REFERENCES `landlord` (`landlord_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='房源信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propertyattributes`
--

DROP TABLE IF EXISTS `propertyattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propertyattributes` (
  `attribute_id` int NOT NULL AUTO_INCREMENT COMMENT '属性ID',
  `property_id` int NOT NULL COMMENT '房源ID',
  `orientation` enum('North','South','East','West','Northeast','Northwest','Southeast','Southwest') DEFAULT NULL COMMENT '朝向',
  `has_independent_bathroom` tinyint(1) DEFAULT '0' COMMENT '是否有独立卫浴',
  `has_air_conditioning` tinyint(1) DEFAULT '0' COMMENT '是否有空调',
  `number_of_beds` int DEFAULT NULL COMMENT '几人间',
  `room_structure` varchar(50) DEFAULT NULL COMMENT '房间结构',
  `has_balcony` tinyint(1) DEFAULT '0' COMMENT '是否有阳台',
  `furniture_types` text COMMENT '家具种类',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`attribute_id`),
  KEY `property_id` (`property_id`),
  CONSTRAINT `propertyattributes_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='房源属性信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propertyattributes`
--

LOCK TABLES `propertyattributes` WRITE;
/*!40000 ALTER TABLE `propertyattributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `propertyattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Blob类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日历信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cron类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='已触发的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='存储的悲观锁信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='暂停的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='调度器状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='简单触发器的信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='同步机制的行锁表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='触发器详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `renewal`
--

DROP TABLE IF EXISTS `renewal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `renewal` (
  `renewal_id` int NOT NULL AUTO_INCREMENT COMMENT '续租ID',
  `agreement_id` int DEFAULT NULL COMMENT '合同ID',
  `new_start_date` date NOT NULL COMMENT '新的开始日期',
  `new_end_date` date NOT NULL COMMENT '新的结束日期',
  `renewed_monthly_rent` decimal(10,2) NOT NULL COMMENT '续租后每月租金',
  `renewed_status` enum('Pending','Approved','Rejected') DEFAULT 'Pending' COMMENT '续租状态',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`renewal_id`),
  KEY `agreement_id` (`agreement_id`),
  CONSTRAINT `renewal_ibfk_1` FOREIGN KEY (`agreement_id`) REFERENCES `leaseagreement` (`agreement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='续租信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `renewal`
--

LOCK TABLES `renewal` WRITE;
/*!40000 ALTER TABLE `renewal` DISABLE KEYS */;
/*!40000 ALTER TABLE `renewal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2024-09-26 11:12:39','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2024-09-26 11:12:39','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2024-09-26 11:12:39','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','false','Y','admin','2024-09-26 11:12:39','admin','2024-09-28 19:40:58','是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2024-09-26 11:12:39','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2024-09-26 11:12:39','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2024-09-26 11:12:36','',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-09-26 11:12:36','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-09-26 11:12:36','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-09-26 11:12:36','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-09-26 11:12:36','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2024-09-26 11:12:36','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2024-09-26 11:12:36','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2024-09-26 11:12:36','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-09-26 11:12:36','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-09-26 11:12:36','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男性','0','sys_user_sex','','','Y','0','admin','2024-09-26 11:12:38','admin','2024-09-26 18:53:47','性别男'),(2,2,'女性','1','sys_user_sex','','','N','0','admin','2024-09-26 11:12:38','admin','2024-09-26 18:53:55','性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-09-26 11:12:38','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-09-26 11:12:38','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-09-26 11:12:38','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-09-26 11:12:38','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-09-26 11:12:38','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2024-09-26 11:12:38','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2024-09-26 11:12:38','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2024-09-26 11:12:38','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2024-09-26 11:12:38','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-09-26 11:12:38','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-09-26 11:12:38','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-09-26 11:12:38','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-09-26 11:12:38','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-09-26 11:12:38','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-09-26 11:12:38','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-09-26 11:12:38','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-09-26 11:12:38','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-09-26 11:12:38','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-09-26 11:12:38','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-09-26 11:12:38','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-09-26 11:12:38','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-09-26 11:12:38','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-09-26 11:12:38','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-09-26 11:12:38','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-09-26 11:12:38','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-09-26 11:12:38','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-09-26 11:12:38','',NULL,'停用状态'),(100,1,'javaEE','0','course_subject',NULL,'default','N','0','admin','2024-09-26 18:59:30','',NULL,NULL),(101,2,'Python+大数据','2','course_subject',NULL,'default','N','0','admin','2024-09-26 19:00:14','',NULL,'Python+大数据');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2024-09-26 11:12:38','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2024-09-26 11:12:38','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2024-09-26 11:12:38','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2024-09-26 11:12:38','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2024-09-26 11:12:38','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2024-09-26 11:12:38','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2024-09-26 11:12:38','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2024-09-26 11:12:38','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2024-09-26 11:12:38','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2024-09-26 11:12:38','',NULL,'登录状态列表'),(100,'学科','course_subject','0','admin','2024-09-26 18:58:36','',NULL,'课程学科');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2024-09-26 11:12:39','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2024-09-26 11:12:39','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2024-09-26 11:12:39','',NULL,''),(100,'输出时间','DEFAULT','myTask.showtime()','0/5 * * * * ?','1','1','1','admin','2024-09-28 20:15:04','','2024-09-28 20:17:11','');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
INSERT INTO `sys_job_log` VALUES (1,'输出时间','DEFAULT','myTask.showtime()','输出时间 总共耗时：1毫秒','0','','2024-09-28 20:16:02'),(2,'输出时间','DEFAULT','myTask.showtime()','输出时间 总共耗时：0毫秒','0','','2024-09-28 20:16:02'),(3,'输出时间','DEFAULT','myTask.showtime()','输出时间 总共耗时：0毫秒','0','','2024-09-28 20:16:02'),(4,'输出时间','DEFAULT','myTask.showtime()','输出时间 总共耗时：0毫秒','0','','2024-09-28 20:16:02'),(5,'输出时间','DEFAULT','myTask.showtime()','输出时间 总共耗时：0毫秒','0','','2024-09-28 20:16:02'),(6,'输出时间','DEFAULT','myTask.showtime()','输出时间 总共耗时：0毫秒','0','','2024-09-28 20:16:02'),(7,'输出时间','DEFAULT','myTask.showtime()','输出时间 总共耗时：0毫秒','0','','2024-09-28 20:16:02'),(8,'输出时间','DEFAULT','myTask.showtime()','输出时间 总共耗时：1毫秒','0','','2024-09-28 20:16:03'),(9,'输出时间','DEFAULT','myTask.showtime()','输出时间 总共耗时：0毫秒','0','','2024-09-28 20:16:03'),(10,'输出时间','DEFAULT','myTask.showtime()','输出时间 总共耗时：0毫秒','0','','2024-09-28 20:16:03'),(11,'输出时间','DEFAULT','myTask.showtime()','输出时间 总共耗时：1毫秒','0','','2024-09-28 20:16:03'),(12,'输出时间','DEFAULT','myTask.showtime()','输出时间 总共耗时：0毫秒','0','','2024-09-28 20:16:03'),(13,'输出时间','DEFAULT','myTask.showtime()','输出时间 总共耗时：0毫秒','0','','2024-09-28 20:16:05'),(14,'输出时间','DEFAULT','myTask.showtime()','输出时间 总共耗时：0毫秒','0','','2024-09-28 20:16:10'),(15,'输出时间','DEFAULT','myTask.showtime()','输出时间 总共耗时：0毫秒','0','','2024-09-28 20:16:15'),(16,'输出时间','DEFAULT','myTask.showtime()','输出时间 总共耗时：8毫秒','0','','2024-09-28 20:17:05'),(17,'输出时间','DEFAULT','myTask.showtime()','输出时间 总共耗时：0毫秒','0','','2024-09-28 20:17:10'),(18,'输出时间','DEFAULT','myTask.showtime()','输出时间 总共耗时：0毫秒','0','','2024-09-28 20:18:46');
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (1,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-28 20:19:35'),(2,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-29 14:03:48'),(3,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-29 16:36:07'),(4,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-30 16:43:01'),(5,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-30 18:15:36'),(6,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-09-30 20:01:53');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) DEFAULT '' COMMENT '路由名称',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2042 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'','',1,0,'M','0','0','','system','admin','2024-09-26 11:12:38','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'','',1,0,'M','0','0','','monitor','admin','2024-09-26 11:12:38','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'','',1,0,'M','0','0','','tool','admin','2024-09-26 11:12:38','',NULL,'系统工具目录'),(4,'若依官网',0,4,'http://ruoyi.vip',NULL,'','',0,0,'M','0','0','','guide','admin','2024-09-26 11:12:38','',NULL,'若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','','',1,0,'C','0','0','system:user:list','user','admin','2024-09-26 11:12:38','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','','',1,0,'C','0','0','system:role:list','peoples','admin','2024-09-26 11:12:38','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','','',1,0,'C','0','0','system:menu:list','tree-table','admin','2024-09-26 11:12:38','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','','',1,0,'C','0','0','system:dept:list','tree','admin','2024-09-26 11:12:38','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','','',1,0,'C','0','0','system:post:list','post','admin','2024-09-26 11:12:38','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','','',1,0,'C','0','0','system:dict:list','dict','admin','2024-09-26 11:12:38','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','','',1,0,'C','0','0','system:config:list','edit','admin','2024-09-26 11:12:38','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','','',1,0,'C','0','0','system:notice:list','message','admin','2024-09-26 11:12:38','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','','',1,0,'M','0','0','','log','admin','2024-09-26 11:12:38','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','','',1,0,'C','0','0','monitor:online:list','online','admin','2024-09-26 11:12:38','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','','',1,0,'C','0','0','monitor:job:list','job','admin','2024-09-26 11:12:38','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','','',1,0,'C','0','0','monitor:druid:list','druid','admin','2024-09-26 11:12:38','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','','',1,0,'C','0','0','monitor:server:list','server','admin','2024-09-26 11:12:38','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','','',1,0,'C','0','0','monitor:cache:list','redis','admin','2024-09-26 11:12:38','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2024-09-26 11:12:38','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','','',1,0,'C','0','0','tool:build:list','build','admin','2024-09-26 11:12:38','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','','',1,0,'C','0','0','tool:gen:list','code','admin','2024-09-26 11:12:38','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2024-09-26 11:12:38','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','','',1,0,'C','0','0','monitor:operlog:list','form','admin','2024-09-26 11:12:38','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2024-09-26 11:12:38','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','','',1,0,'F','0','0','system:user:query','#','admin','2024-09-26 11:12:38','',NULL,''),(1001,'用户新增',100,2,'','','','',1,0,'F','0','0','system:user:add','#','admin','2024-09-26 11:12:38','',NULL,''),(1002,'用户修改',100,3,'','','','',1,0,'F','0','0','system:user:edit','#','admin','2024-09-26 11:12:38','',NULL,''),(1003,'用户删除',100,4,'','','','',1,0,'F','0','0','system:user:remove','#','admin','2024-09-26 11:12:38','',NULL,''),(1004,'用户导出',100,5,'','','','',1,0,'F','0','0','system:user:export','#','admin','2024-09-26 11:12:38','',NULL,''),(1005,'用户导入',100,6,'','','','',1,0,'F','0','0','system:user:import','#','admin','2024-09-26 11:12:38','',NULL,''),(1006,'重置密码',100,7,'','','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-09-26 11:12:38','',NULL,''),(1007,'角色查询',101,1,'','','','',1,0,'F','0','0','system:role:query','#','admin','2024-09-26 11:12:38','',NULL,''),(1008,'角色新增',101,2,'','','','',1,0,'F','0','0','system:role:add','#','admin','2024-09-26 11:12:38','',NULL,''),(1009,'角色修改',101,3,'','','','',1,0,'F','0','0','system:role:edit','#','admin','2024-09-26 11:12:38','',NULL,''),(1010,'角色删除',101,4,'','','','',1,0,'F','0','0','system:role:remove','#','admin','2024-09-26 11:12:38','',NULL,''),(1011,'角色导出',101,5,'','','','',1,0,'F','0','0','system:role:export','#','admin','2024-09-26 11:12:38','',NULL,''),(1012,'菜单查询',102,1,'','','','',1,0,'F','0','0','system:menu:query','#','admin','2024-09-26 11:12:38','',NULL,''),(1013,'菜单新增',102,2,'','','','',1,0,'F','0','0','system:menu:add','#','admin','2024-09-26 11:12:38','',NULL,''),(1014,'菜单修改',102,3,'','','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-09-26 11:12:38','',NULL,''),(1015,'菜单删除',102,4,'','','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-09-26 11:12:38','',NULL,''),(1016,'部门查询',103,1,'','','','',1,0,'F','0','0','system:dept:query','#','admin','2024-09-26 11:12:38','',NULL,''),(1017,'部门新增',103,2,'','','','',1,0,'F','0','0','system:dept:add','#','admin','2024-09-26 11:12:38','',NULL,''),(1018,'部门修改',103,3,'','','','',1,0,'F','0','0','system:dept:edit','#','admin','2024-09-26 11:12:38','',NULL,''),(1019,'部门删除',103,4,'','','','',1,0,'F','0','0','system:dept:remove','#','admin','2024-09-26 11:12:38','',NULL,''),(1020,'岗位查询',104,1,'','','','',1,0,'F','0','0','system:post:query','#','admin','2024-09-26 11:12:38','',NULL,''),(1021,'岗位新增',104,2,'','','','',1,0,'F','0','0','system:post:add','#','admin','2024-09-26 11:12:38','',NULL,''),(1022,'岗位修改',104,3,'','','','',1,0,'F','0','0','system:post:edit','#','admin','2024-09-26 11:12:38','',NULL,''),(1023,'岗位删除',104,4,'','','','',1,0,'F','0','0','system:post:remove','#','admin','2024-09-26 11:12:38','',NULL,''),(1024,'岗位导出',104,5,'','','','',1,0,'F','0','0','system:post:export','#','admin','2024-09-26 11:12:38','',NULL,''),(1025,'字典查询',105,1,'#','','','',1,0,'F','0','0','system:dict:query','#','admin','2024-09-26 11:12:38','',NULL,''),(1026,'字典新增',105,2,'#','','','',1,0,'F','0','0','system:dict:add','#','admin','2024-09-26 11:12:38','',NULL,''),(1027,'字典修改',105,3,'#','','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-09-26 11:12:38','',NULL,''),(1028,'字典删除',105,4,'#','','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-09-26 11:12:38','',NULL,''),(1029,'字典导出',105,5,'#','','','',1,0,'F','0','0','system:dict:export','#','admin','2024-09-26 11:12:38','',NULL,''),(1030,'参数查询',106,1,'#','','','',1,0,'F','0','0','system:config:query','#','admin','2024-09-26 11:12:38','',NULL,''),(1031,'参数新增',106,2,'#','','','',1,0,'F','0','0','system:config:add','#','admin','2024-09-26 11:12:38','',NULL,''),(1032,'参数修改',106,3,'#','','','',1,0,'F','0','0','system:config:edit','#','admin','2024-09-26 11:12:38','',NULL,''),(1033,'参数删除',106,4,'#','','','',1,0,'F','0','0','system:config:remove','#','admin','2024-09-26 11:12:38','',NULL,''),(1034,'参数导出',106,5,'#','','','',1,0,'F','0','0','system:config:export','#','admin','2024-09-26 11:12:38','',NULL,''),(1035,'公告查询',107,1,'#','','','',1,0,'F','0','0','system:notice:query','#','admin','2024-09-26 11:12:38','',NULL,''),(1036,'公告新增',107,2,'#','','','',1,0,'F','0','0','system:notice:add','#','admin','2024-09-26 11:12:38','',NULL,''),(1037,'公告修改',107,3,'#','','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-09-26 11:12:38','',NULL,''),(1038,'公告删除',107,4,'#','','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-09-26 11:12:38','',NULL,''),(1039,'操作查询',500,1,'#','','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2024-09-26 11:12:38','',NULL,''),(1040,'操作删除',500,2,'#','','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2024-09-26 11:12:38','',NULL,''),(1041,'日志导出',500,3,'#','','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2024-09-26 11:12:38','',NULL,''),(1042,'登录查询',501,1,'#','','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2024-09-26 11:12:38','',NULL,''),(1043,'登录删除',501,2,'#','','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2024-09-26 11:12:38','',NULL,''),(1044,'日志导出',501,3,'#','','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2024-09-26 11:12:38','',NULL,''),(1045,'账户解锁',501,4,'#','','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2024-09-26 11:12:38','',NULL,''),(1046,'在线查询',109,1,'#','','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-09-26 11:12:38','',NULL,''),(1047,'批量强退',109,2,'#','','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-09-26 11:12:38','',NULL,''),(1048,'单条强退',109,3,'#','','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-09-26 11:12:38','',NULL,''),(1049,'任务查询',110,1,'#','','','',1,0,'F','0','0','monitor:job:query','#','admin','2024-09-26 11:12:38','',NULL,''),(1050,'任务新增',110,2,'#','','','',1,0,'F','0','0','monitor:job:add','#','admin','2024-09-26 11:12:38','',NULL,''),(1051,'任务修改',110,3,'#','','','',1,0,'F','0','0','monitor:job:edit','#','admin','2024-09-26 11:12:38','',NULL,''),(1052,'任务删除',110,4,'#','','','',1,0,'F','0','0','monitor:job:remove','#','admin','2024-09-26 11:12:38','',NULL,''),(1053,'状态修改',110,5,'#','','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2024-09-26 11:12:38','',NULL,''),(1054,'任务导出',110,6,'#','','','',1,0,'F','0','0','monitor:job:export','#','admin','2024-09-26 11:12:38','',NULL,''),(1055,'生成查询',116,1,'#','','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-09-26 11:12:38','',NULL,''),(1056,'生成修改',116,2,'#','','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-09-26 11:12:38','',NULL,''),(1057,'生成删除',116,3,'#','','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-09-26 11:12:38','',NULL,''),(1058,'导入代码',116,4,'#','','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-09-26 11:12:38','',NULL,''),(1059,'预览代码',116,5,'#','','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-09-26 11:12:38','',NULL,''),(1060,'生成代码',116,6,'#','','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-09-26 11:12:38','',NULL,''),(2006,'统计',0,1,'statistics',NULL,NULL,'',1,0,'M','0','0',NULL,'dashboard','admin','2024-09-26 18:38:07','',NULL,''),(2007,'客户统计',2006,1,'customer',NULL,NULL,'',1,0,'C','0','0',NULL,'cascader','admin','2024-09-26 18:40:06','',NULL,''),(2015,'房东管理',1,10,'landlord','system/landlord/index',NULL,'',1,0,'C','0','0','system:landlord:list','peoples','admin','2024-09-30 18:29:17','',NULL,''),(2016,'租户管理',1,11,'tenant','system/tenant/index',NULL,'',1,0,'C','0','0','system:tenant:list','peoples','admin','2024-09-30 18:48:09','',NULL,''),(2029,'房东信息',3,1,'landlord','landlord/landlord/index',NULL,'',1,0,'C','0','0','landlord:landlord:list','#','admin','2024-09-30 19:23:47','',NULL,'房东信息菜单'),(2030,'房东信息查询',2029,1,'#','',NULL,'',1,0,'F','0','0','landlord:landlord:query','#','admin','2024-09-30 19:23:47','',NULL,''),(2031,'房东信息新增',2029,2,'#','',NULL,'',1,0,'F','0','0','landlord:landlord:add','#','admin','2024-09-30 19:23:47','',NULL,''),(2032,'房东信息修改',2029,3,'#','',NULL,'',1,0,'F','0','0','landlord:landlord:edit','#','admin','2024-09-30 19:23:47','',NULL,''),(2033,'房东信息删除',2029,4,'#','',NULL,'',1,0,'F','0','0','landlord:landlord:remove','#','admin','2024-09-30 19:23:47','',NULL,''),(2034,'房东信息导出',2029,5,'#','',NULL,'',1,0,'F','0','0','landlord:landlord:export','#','admin','2024-09-30 19:23:47','',NULL,''),(2035,'房源管理',1,12,'property','system/property/index',NULL,'',1,0,'C','0','0','system:property:list','clipboard','admin','2024-09-30 20:04:24','',NULL,''),(2036,'房源属性信息',3,1,'propertyattributes','system/propertyattributes/index',NULL,'',1,0,'C','0','0','system:propertyattributes:list','#','admin','2024-09-30 20:11:57','',NULL,'房源属性信息菜单'),(2037,'房源属性信息查询',2036,1,'#','',NULL,'',1,0,'F','0','0','system:propertyattributes:query','#','admin','2024-09-30 20:11:57','',NULL,''),(2038,'房源属性信息新增',2036,2,'#','',NULL,'',1,0,'F','0','0','system:propertyattributes:add','#','admin','2024-09-30 20:11:57','',NULL,''),(2039,'房源属性信息修改',2036,3,'#','',NULL,'',1,0,'F','0','0','system:propertyattributes:edit','#','admin','2024-09-30 20:11:57','',NULL,''),(2040,'房源属性信息删除',2036,4,'#','',NULL,'',1,0,'F','0','0','system:propertyattributes:remove','#','admin','2024-09-30 20:11:57','',NULL,''),(2041,'房源属性信息导出',2036,5,'#','',NULL,'',1,0,'F','0','0','system:propertyattributes:export','#','admin','2024-09-30 20:11:57','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2024-09-26 11:12:39','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2024-09-26 11:12:39','',NULL,'管理员'),(10,'国庆节放假通知','1',_binary '<p><img src=\"https://tse1-mm.cn.bing.net/th/id/OIP-C.YjbZ-r--FhsOWkGQBgKnYQHaFg?rs=1&amp;pid=ImgDetMain\" alt=\"国庆节\"></p>','0','admin','2024-09-28 19:50:28','',NULL,NULL);
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"tb_course\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-26 17:15:49',130),(101,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"course\",\"className\":\"Course\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"课ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-09-26 17:15:49\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"课程码\",\"columnId\":2,\"columnName\":\"code\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-26 17:15:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"code\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Subject\",\"columnComment\":\"课程学科\",\"columnId\":3,\"columnName\":\"subject\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-26 17:15:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"subject\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"课程名称\",\"columnId\":4,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-26 17:15:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-26 17:20:07',55),(102,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"tb_course\"}',NULL,0,NULL,'2024-09-26 17:20:14',250),(103,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"course\",\"className\":\"Course\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"课ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-09-26 17:15:49\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 17:20:07\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"课程码\",\"columnId\":2,\"columnName\":\"code\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-26 17:15:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"code\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 17:20:07\",\"usableColumn\":false},{\"capJavaField\":\"Subject\",\"columnComment\":\"课程学科\",\"columnId\":3,\"columnName\":\"subject\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-26 17:15:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"subject\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 17:20:07\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"课程名称\",\"columnId\":4,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-26 17:15:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-26 17:39:45',78),(104,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"tb_course\"}',NULL,0,NULL,'2024-09-26 17:39:50',236),(105,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"course\",\"className\":\"Course\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"课ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-09-26 17:15:49\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 17:39:45\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"课程码\",\"columnId\":2,\"columnName\":\"code\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-26 17:15:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"code\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 17:39:45\",\"usableColumn\":false},{\"capJavaField\":\"Subject\",\"columnComment\":\"课程学科\",\"columnId\":3,\"columnName\":\"subject\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-26 17:15:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"subject\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 17:39:45\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"课程名称\",\"columnId\":4,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-26 17:15:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-26 18:26:16',57),(106,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"tb_course\"}',NULL,0,NULL,'2024-09-26 18:26:18',76),(107,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"统计\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"statistics\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-26 18:38:07',161),(108,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"客户统计\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"customer\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-26 18:40:06',14),(109,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2006,2007],\"params\":{},\"roleId\":100,\"roleKey\":\"research\",\"roleName\":\"科研人员\",\"roleSort\":3,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-26 18:42:00',52),(110,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"小智\",\"params\":{},\"postIds\":[],\"roleIds\":[100],\"status\":\"0\",\"userId\":100,\"userName\":\"xiaozhi\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-26 18:43:01',134),(111,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-09-26 11:12:38\",\"cssClass\":\"\",\"default\":true,\"dictCode\":1,\"dictLabel\":\"男性\",\"dictSort\":1,\"dictType\":\"sys_user_sex\",\"dictValue\":\"0\",\"isDefault\":\"Y\",\"listClass\":\"\",\"params\":{},\"remark\":\"性别男\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-26 18:53:47',15),(112,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-09-26 11:12:38\",\"cssClass\":\"\",\"default\":false,\"dictCode\":2,\"dictLabel\":\"女性\",\"dictSort\":2,\"dictType\":\"sys_user_sex\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"\",\"params\":{},\"remark\":\"性别女\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-26 18:53:55',15),(113,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"学科\",\"dictType\":\"course_subject\",\"params\":{},\"remark\":\"课程学科\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-26 18:58:36',10),(114,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"javaEE\",\"dictSort\":1,\"dictType\":\"course_subject\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-26 18:59:30',19),(115,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"Python+大数据\",\"dictSort\":2,\"dictType\":\"course_subject\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"remark\":\"Python+大数据\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-26 19:00:14',13),(116,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"course\",\"className\":\"Course\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"课ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-09-26 17:15:49\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 18:26:16\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"课程码\",\"columnId\":2,\"columnName\":\"code\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-26 17:15:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"code\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 18:26:16\",\"usableColumn\":false},{\"capJavaField\":\"Subject\",\"columnComment\":\"课程学科\",\"columnId\":3,\"columnName\":\"subject\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-26 17:15:49\",\"dictType\":\"course_subject\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"subject\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 18:26:16\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"课程名称\",\"columnId\":4,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-26 17:15:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-26 19:00:47',57),(117,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"tb_course\"}',NULL,0,NULL,'2024-09-26 19:00:56',225),(118,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2000','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2024-09-27 09:47:48',11),(119,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2000','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2024-09-27 09:48:11',3),(120,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2005','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-27 09:48:24',21),(121,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2004','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-27 09:48:28',21),(122,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2003','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-27 09:48:33',11),(123,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2002','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-27 09:48:36',18),(124,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2001','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-27 09:48:40',16),(125,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2000','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-27 09:48:45',11),(126,'课程管理',1,'com.ruoyi.course.controller.CourseController.add()','POST',1,'admin','研发部门','/course/course','127.0.0.1','内网IP','{\"applicablePerson\":\"大学生\",\"code\":\"1\",\"createTime\":\"2024-09-27 17:05:41\",\"info\":\"java架构\",\"name\":\"Spring\",\"params\":{},\"price\":89,\"subject\":\"计算机\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\workspace\\Spring\\bizhan\\ruoyi_vue\\ruoyi-admin\\target\\classes\\mapper\\course\\CourseMapper.xml]\r\n### The error may involve com.ruoyi.course.mapper.CourseMapper.insertCourse-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_course          ( code,             subject,             name,             price,             applicable_person,             info,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value','2024-09-27 17:05:41',257),(127,'课程管理',1,'com.ruoyi.course.controller.CourseController.add()','POST',1,'admin','研发部门','/course/course','127.0.0.1','内网IP','{\"applicablePerson\":\"大学生\",\"code\":\"1\",\"createTime\":\"2024-09-27 17:05:46\",\"info\":\"java架构\",\"name\":\"Spring\",\"params\":{},\"price\":89,\"subject\":\"计算机\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\workspace\\Spring\\bizhan\\ruoyi_vue\\ruoyi-admin\\target\\classes\\mapper\\course\\CourseMapper.xml]\r\n### The error may involve com.ruoyi.course.mapper.CourseMapper.insertCourse-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_course          ( code,             subject,             name,             price,             applicable_person,             info,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value','2024-09-27 17:05:46',6),(128,'课程管理',1,'com.ruoyi.course.controller.CourseController.add()','POST',1,'admin','研发部门','/course/course','127.0.0.1','内网IP','{\"applicablePerson\":\"大学生\",\"code\":\"1\",\"createTime\":\"2024-09-27 17:05:49\",\"info\":\"java架构\",\"name\":\"Spring\",\"params\":{},\"price\":89,\"subject\":\"计算机\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\workspace\\Spring\\bizhan\\ruoyi_vue\\ruoyi-admin\\target\\classes\\mapper\\course\\CourseMapper.xml]\r\n### The error may involve com.ruoyi.course.mapper.CourseMapper.insertCourse-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_course          ( code,             subject,             name,             price,             applicable_person,             info,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value','2024-09-27 17:05:49',5),(129,'课程管理',1,'com.ruoyi.course.controller.CourseController.add()','POST',1,'admin','研发部门','/course/course','127.0.0.1','内网IP','{\"applicablePerson\":\"大学生\",\"code\":\"1\",\"createTime\":\"2024-09-27 17:05:52\",\"info\":\"java架构\",\"name\":\"Spring\",\"params\":{},\"price\":89,\"subject\":\"计算机\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\workspace\\Spring\\bizhan\\ruoyi_vue\\ruoyi-admin\\target\\classes\\mapper\\course\\CourseMapper.xml]\r\n### The error may involve com.ruoyi.course.mapper.CourseMapper.insertCourse-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_course          ( code,             subject,             name,             price,             applicable_person,             info,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value','2024-09-27 17:05:52',5),(130,'课程管理',1,'com.ruoyi.course.controller.CourseController.add()','POST',1,'admin','研发部门','/course/course','127.0.0.1','内网IP','{\"applicablePerson\":\"大学生\",\"code\":\"1\",\"createTime\":\"2024-09-27 17:06:00\",\"info\":\"java架构\",\"name\":\"Spring\",\"params\":{},\"price\":89,\"subject\":\"计算机\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\workspace\\Spring\\bizhan\\ruoyi_vue\\ruoyi-admin\\target\\classes\\mapper\\course\\CourseMapper.xml]\r\n### The error may involve com.ruoyi.course.mapper.CourseMapper.insertCourse-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_course          ( code,             subject,             name,             price,             applicable_person,             info,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value','2024-09-27 17:06:00',6),(131,'课程管理',1,'com.ruoyi.course.controller.CourseController.add()','POST',1,'admin','研发部门','/course/course','127.0.0.1','内网IP','{\"applicablePerson\":\"大学生\",\"code\":\"1\",\"createTime\":\"2024-09-27 17:11:44\",\"info\":\"java架构\",\"name\":\"Spring\",\"params\":{},\"price\":89,\"subject\":\"计算机\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\workspace\\Spring\\bizhan\\ruoyi_vue\\ruoyi-admin\\target\\classes\\mapper\\course\\CourseMapper.xml]\r\n### The error may involve com.ruoyi.course.mapper.CourseMapper.insertCourse-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_course          ( code,             subject,             name,             price,             applicable_person,             info,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value','2024-09-27 17:11:45',148),(132,'课程管理',1,'com.ruoyi.course.controller.CourseController.add()','POST',1,'admin','研发部门','/course/course','127.0.0.1','内网IP','{\"applicablePerson\":\"1\",\"code\":\"1\",\"createTime\":\"2024-09-27 17:12:02\",\"info\":\"1\",\"name\":\"1\",\"params\":{},\"price\":1,\"subject\":\"1\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\workspace\\Spring\\bizhan\\ruoyi_vue\\ruoyi-admin\\target\\classes\\mapper\\course\\CourseMapper.xml]\r\n### The error may involve com.ruoyi.course.mapper.CourseMapper.insertCourse-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_course          ( code,             subject,             name,             price,             applicable_person,             info,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value','2024-09-27 17:12:02',5),(133,'课程管理',1,'com.ruoyi.course.controller.CourseController.add()','POST',1,'admin','研发部门','/course/course','127.0.0.1','内网IP','{\"applicablePerson\":\"1\",\"code\":\"1\",\"createTime\":\"2024-09-27 17:12:13\",\"info\":\"1\",\"name\":\"1\",\"params\":{},\"price\":1,\"subject\":\"1\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\workspace\\Spring\\bizhan\\ruoyi_vue\\ruoyi-admin\\target\\classes\\mapper\\course\\CourseMapper.xml]\r\n### The error may involve com.ruoyi.course.mapper.CourseMapper.insertCourse-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_course          ( code,             subject,             name,             price,             applicable_person,             info,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value','2024-09-27 17:12:13',7),(134,'课程管理',1,'com.ruoyi.course.controller.CourseController.add()','POST',1,'admin','研发部门','/course/course','127.0.0.1','内网IP','{\"applicablePerson\":\"1\",\"code\":\"1\",\"createTime\":\"2024-09-27 17:12:17\",\"info\":\"1\",\"name\":\"1\",\"params\":{},\"price\":1,\"subject\":\"1\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\workspace\\Spring\\bizhan\\ruoyi_vue\\ruoyi-admin\\target\\classes\\mapper\\course\\CourseMapper.xml]\r\n### The error may involve com.ruoyi.course.mapper.CourseMapper.insertCourse-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into tb_course          ( code,             subject,             name,             price,             applicable_person,             info,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value','2024-09-27 17:12:17',4),(135,'课程管理',1,'com.ruoyi.course.controller.CourseController.add()','POST',1,'admin','研发部门','/course/course','127.0.0.1','内网IP','{\"applicablePerson\":\"1\",\"code\":\"1\",\"createTime\":\"2024-09-27 20:13:15\",\"info\":\"1\",\"name\":\"1\",\"params\":{},\"price\":1,\"subject\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-27 20:13:15',20),(136,'课程管理',3,'com.ruoyi.course.controller.CourseController.remove()','DELETE',1,'admin','研发部门','/course/course/1','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-27 20:13:19',10),(137,'课程管理',1,'com.ruoyi.course.controller.CourseController.add()','POST',1,'admin','研发部门','/course/course','127.0.0.1','内网IP','{\"applicablePerson\":\"软件八班\",\"code\":\"1\",\"createTime\":\"2024-09-27 20:14:16\",\"info\":\"苏烨主讲\",\"name\":\"Spring\",\"params\":{},\"price\":55,\"subject\":\"计算机\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-27 20:14:16',9),(138,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"dictName\":\"学科\",\"dictType\":\"course_subject\",\"params\":{},\"remark\":\"课程学科\",\"status\":\"0\"}','{\"msg\":\"新增字典\'学科\'失败，字典类型已存在\",\"code\":500}',0,NULL,'2024-09-28 19:25:48',15),(139,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"dictName\":\"学科\",\"dictType\":\"course_subject\",\"params\":{},\"remark\":\"课程学科\",\"status\":\"0\"}','{\"msg\":\"新增字典\'学科\'失败，字典类型已存在\",\"code\":500}',0,NULL,'2024-09-28 19:26:46',5),(140,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"学科\",\"dictType\":\"discipline\",\"params\":{},\"remark\":\"课程学科\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-28 19:27:14',16),(141,'字典类型',9,'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()','DELETE',1,'admin','研发部门','/system/dict/type/refreshCache','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-28 19:27:24',20),(142,'字典类型',3,'com.ruoyi.web.controller.system.SysDictTypeController.remove()','DELETE',1,'admin','研发部门','/system/dict/type/101','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-28 19:27:38',20),(143,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"cssClass\":\"1\",\"default\":false,\"dictLabel\":\"javaEE\",\"dictSort\":1,\"dictType\":\"course_subject\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-28 19:31:08',12),(144,'字典类型',3,'com.ruoyi.web.controller.system.SysDictDataController.remove()','DELETE',1,'admin','研发部门','/system/dict/data/102','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-28 19:32:08',15),(145,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"course\",\"className\":\"Course\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"课ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-09-26 17:15:49\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 19:00:47\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"课程码\",\"columnId\":2,\"columnName\":\"code\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-26 17:15:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"code\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 19:00:47\",\"usableColumn\":false},{\"capJavaField\":\"Subject\",\"columnComment\":\"课程学科\",\"columnId\":3,\"columnName\":\"subject\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-26 17:15:49\",\"dictType\":\"course_subject\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"subject\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-09-26 19:00:47\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"课程名称\",\"columnId\":4,\"columnName\":\"name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-26 17:15:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-28 19:32:51',69),(146,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"tb_course\"}',NULL,0,NULL,'2024-09-28 19:32:54',237),(147,'参数管理',2,'com.ruoyi.web.controller.system.SysConfigController.edit()','PUT',1,'admin','研发部门','/system/config','127.0.0.1','内网IP','{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"Y\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2024-09-26 11:12:39\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-28 19:40:58',17),(148,'通知公告',1,'com.ruoyi.web.controller.system.SysNoticeController.add()','POST',1,'admin','研发部门','/system/notice','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"noticeContent\":\"<p><img src=\\\"https://tse1-mm.cn.bing.net/th/id/OIP-C.YjbZ-r--FhsOWkGQBgKnYQHaFg?rs=1&amp;pid=ImgDetMain\\\" alt=\\\"国庆节\\\"></p>\",\"noticeTitle\":\"国庆节放假通知\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-28 19:50:28',14),(149,'登录日志',9,'com.ruoyi.web.controller.monitor.SysLogininforController.clean()','DELETE',1,'admin','研发部门','/monitor/logininfor/clean','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-28 19:52:09',38),(150,'定时任务',1,'com.ruoyi.quartz.controller.SysJobController.add()','POST',1,'admin','研发部门','/monitor/job','127.0.0.1','内网IP','{\"concurrent\":\"1\",\"cronExpression\":\"0/5 * * * * ?\",\"invokeTarget\":\"mytask.showtime()\",\"jobName\":\"输出时间\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2024-09-28 20:14:15\",\"params\":{},\"status\":\"0\"}',NULL,1,'No bean named \'mytask\' available','2024-09-28 20:14:13',8),(151,'定时任务',1,'com.ruoyi.quartz.controller.SysJobController.add()','POST',1,'admin','研发部门','/monitor/job','127.0.0.1','内网IP','{\"concurrent\":\"1\",\"cronExpression\":\"0/5 * * * * ?\",\"invokeTarget\":\"mytask.showtime()\",\"jobName\":\"输出时间\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2024-09-28 20:14:20\",\"params\":{},\"status\":\"0\"}',NULL,1,'No bean named \'mytask\' available','2024-09-28 20:14:18',1),(152,'定时任务',1,'com.ruoyi.quartz.controller.SysJobController.add()','POST',1,'admin','研发部门','/monitor/job','127.0.0.1','内网IP','{\"concurrent\":\"1\",\"cronExpression\":\"0/5 * * * * ?\",\"invokeTarget\":\"mytask.showtime()\",\"jobGroup\":\"DEFAULT\",\"jobName\":\"输出时间\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2024-09-28 20:14:30\",\"params\":{},\"status\":\"0\"}',NULL,1,'No bean named \'mytask\' available','2024-09-28 20:14:25',0),(153,'定时任务',1,'com.ruoyi.quartz.controller.SysJobController.add()','POST',1,'admin','研发部门','/monitor/job','127.0.0.1','内网IP','{\"concurrent\":\"1\",\"createBy\":\"admin\",\"cronExpression\":\"0/5 * * * * ?\",\"invokeTarget\":\"myTask.showtime()\",\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"jobName\":\"输出时间\",\"misfirePolicy\":\"1\",\"nextValidTime\":\"2024-09-28 20:15:05\",\"params\":{},\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-28 20:15:04',30),(154,'定时任务',2,'com.ruoyi.quartz.controller.SysJobController.changeStatus()','PUT',1,'admin','研发部门','/monitor/job/changeStatus','127.0.0.1','内网IP','{\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-28 20:16:02',22),(155,'定时任务',2,'com.ruoyi.quartz.controller.SysJobController.changeStatus()','PUT',1,'admin','研发部门','/monitor/job/changeStatus','127.0.0.1','内网IP','{\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-28 20:17:11',36),(156,'定时任务',2,'com.ruoyi.quartz.controller.SysJobController.run()','PUT',1,'admin','研发部门','/monitor/job/run','127.0.0.1','内网IP','{\"jobGroup\":\"DEFAULT\",\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-28 20:18:46',10),(157,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2013','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-29 16:48:42',36),(158,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2012','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-29 16:48:45',16),(159,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2011','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-29 16:48:48',14),(160,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2010','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-29 16:48:50',14),(161,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2009','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-29 16:48:52',10),(162,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2008','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-29 16:48:56',13),(163,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/115','127.0.0.1','内网IP','{}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2024-09-29 16:48:58',8),(164,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/landlord/index\",\"createBy\":\"admin\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"房东管理\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":1,\"path\":\"landlord\",\"perms\":\"system:landlord:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 16:54:47',31),(165,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/1','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 16:55:04',24),(166,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"landlord\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 16:55:10',69),(167,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"landlord\"}',NULL,0,NULL,'2024-09-30 16:55:13',232),(168,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2014','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 18:16:04',24),(169,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/landlord/index\",\"createBy\":\"admin\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"房东管理\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":1,\"path\":\"landlord\",\"perms\":\"system:landlord:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 18:29:17',30),(170,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"landlord\",\"className\":\"Landlord\",\"columns\":[{\"capJavaField\":\"LandlordId\",\"columnComment\":\"房东ID，主键，自动增长\",\"columnId\":10,\"columnName\":\"landlord_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-30 16:55:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"landlordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"房东姓名\",\"columnId\":11,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-30 16:55:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ContactNumber\",\"columnComment\":\"联系电话\",\"columnId\":12,\"columnName\":\"contact_number\",\"columnType\":\"varchar(15)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-30 16:55:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"contactNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Email\",\"columnComment\":\"邮箱地址\",\"columnId\":13,\"columnName\":\"email\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-30 16:55:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 18:30:39',62),(171,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"landlord\"}',NULL,0,NULL,'2024-09-30 18:30:43',81),(172,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"landlord\",\"className\":\"Landlord\",\"columns\":[{\"capJavaField\":\"LandlordId\",\"columnComment\":\"房东ID，主键，自动增长\",\"columnId\":10,\"columnName\":\"landlord_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-30 16:55:10\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"landlordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-09-30 18:30:39\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"房东姓名\",\"columnId\":11,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-30 16:55:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-09-30 18:30:39\",\"usableColumn\":false},{\"capJavaField\":\"ContactNumber\",\"columnComment\":\"联系电话\",\"columnId\":12,\"columnName\":\"contact_number\",\"columnType\":\"varchar(15)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-30 16:55:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"contactNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-09-30 18:30:39\",\"usableColumn\":false},{\"capJavaField\":\"Email\",\"columnComment\":\"邮箱地址\",\"columnId\":13,\"columnName\":\"email\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-30 16:55:10\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 18:36:08',78),(173,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"landlord\"}',NULL,0,NULL,'2024-09-30 18:36:10',76),(174,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/tenant/index\",\"createBy\":\"admin\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"租户管理\",\"menuType\":\"C\",\"orderNum\":11,\"params\":{},\"parentId\":1,\"path\":\"tenant\",\"perms\":\"system:tenant:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 18:48:09',106),(175,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"tenant\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 18:48:45',63),(176,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"tenant\",\"className\":\"Tenant\",\"columns\":[{\"capJavaField\":\"TenantId\",\"columnComment\":\"租户ID\",\"columnId\":16,\"columnName\":\"tenant_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-30 18:48:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"tenantId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"租户姓名\",\"columnId\":17,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-30 18:48:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ContactNumber\",\"columnComment\":\"联系电话\",\"columnId\":18,\"columnName\":\"contact_number\",\"columnType\":\"varchar(15)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-30 18:48:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"contactNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Email\",\"columnComment\":\"邮箱地址\",\"columnId\":19,\"columnName\":\"email\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-30 18:48:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 18:49:43',34),(177,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"tenant\"}',NULL,0,NULL,'2024-09-30 18:50:02',158),(178,'房东信息',1,'com.ruoyi.web.controller.system.LandlordController.add()','POST',1,'admin','研发部门','/system/landlord','127.0.0.1','内网IP','{\"contactNumber\":\"w\",\"createdAt\":\"2024-09-23\",\"email\":\"w\",\"identificationNumber\":\"1\",\"landlordId\":1,\"name\":\"w\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 19:00:51',17),(179,'房东信息',3,'com.ruoyi.web.controller.system.LandlordController.remove()','DELETE',1,'admin','研发部门','/system/landlord/1','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 19:01:01',7),(180,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"tenant\",\"className\":\"Tenant\",\"columns\":[{\"capJavaField\":\"TenantId\",\"columnComment\":\"租户ID\",\"columnId\":16,\"columnName\":\"tenant_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-30 18:48:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"tenantId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-30 18:49:43\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"租户姓名\",\"columnId\":17,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-30 18:48:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-30 18:49:43\",\"usableColumn\":false},{\"capJavaField\":\"ContactNumber\",\"columnComment\":\"联系电话\",\"columnId\":18,\"columnName\":\"contact_number\",\"columnType\":\"varchar(15)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-30 18:48:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"contactNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-30 18:49:43\",\"usableColumn\":false},{\"capJavaField\":\"Email\",\"columnComment\":\"邮箱地址\",\"columnId\":19,\"columnName\":\"email\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-30 18:48:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 19:08:02',75),(181,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"tenant\",\"className\":\"Tenant\",\"columns\":[{\"capJavaField\":\"TenantId\",\"columnComment\":\"租户ID\",\"columnId\":16,\"columnName\":\"tenant_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-09-30 18:48:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"tenantId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-30 19:08:02\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"租户姓名\",\"columnId\":17,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-30 18:48:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-30 19:08:02\",\"usableColumn\":false},{\"capJavaField\":\"ContactNumber\",\"columnComment\":\"联系电话\",\"columnId\":18,\"columnName\":\"contact_number\",\"columnType\":\"varchar(15)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-30 18:48:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"contactNumber\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-09-30 19:08:02\",\"usableColumn\":false},{\"capJavaField\":\"Email\",\"columnComment\":\"邮箱地址\",\"columnId\":19,\"columnName\":\"email\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2024-09-30 18:48:45\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 19:13:05',40),(182,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"tenant\"}',NULL,0,NULL,'2024-09-30 19:13:08',228),(183,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2017','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2024-09-30 19:21:06',11),(184,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2018','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 19:21:46',22),(185,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2019','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 19:21:50',20),(186,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2020','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 19:21:52',16),(187,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2021','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 19:21:55',18),(188,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2022','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 19:21:58',19),(189,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2017','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 19:22:02',17),(190,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2025','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 19:22:05',16),(191,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2024','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 19:22:08',11),(192,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2026','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 19:22:11',10),(193,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2027','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 19:22:14',9),(194,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2028','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 19:22:16',11),(195,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2023','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 19:22:20',10),(196,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/property/index\",\"createBy\":\"admin\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"房源管理\",\"menuType\":\"C\",\"orderNum\":12,\"params\":{},\"parentId\":1,\"path\":\"property\",\"perms\":\"system:property:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 20:04:24',26),(197,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"propertyattributes\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-09-30 20:05:59',83),(198,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"propertyattributes\"}',NULL,0,NULL,'2024-09-30 20:06:16',259);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2024-09-26 11:12:37','',NULL,''),(2,'se','项目经理',2,'0','admin','2024-09-26 11:12:37','',NULL,''),(3,'hr','人力资源',3,'0','admin','2024-09-26 11:12:37','',NULL,''),(4,'user','普通员工',4,'0','admin','2024-09-26 11:12:37','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2024-09-26 11:12:37','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2024-09-26 11:12:37','',NULL,'普通角色'),(100,'科研人员','research',3,'1',1,1,'0','0','admin','2024-09-26 18:42:00','',NULL,NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060),(100,2006),(100,2007);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','若依','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-09-30 20:01:53','admin','2024-09-26 11:12:36','','2024-09-30 20:01:53','管理员'),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-09-26 11:12:36','admin','2024-09-26 11:12:36','',NULL,'测试员'),(100,NULL,'xiaozhi','小智','00','','','0','','$2a$10$Y0BgpIgJlxh8QoHMJnrcHOgqP.en/ndWCanZA8VIlqTKX9p/i1ZUm','0','0','127.0.0.1','2024-09-26 18:43:30','admin','2024-09-26 18:43:01','','2024-09-26 18:43:30',NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(100,100);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_course`
--

DROP TABLE IF EXISTS `tb_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(32) DEFAULT NULL COMMENT '课程码',
  `subject` varchar(64) DEFAULT NULL COMMENT '课程学科',
  `name` varchar(64) DEFAULT NULL COMMENT '课程名称',
  `price` int DEFAULT NULL COMMENT '价格（元）',
  `applicable_person` varchar(32) DEFAULT NULL COMMENT '适用人群',
  `info` varchar(255) DEFAULT NULL COMMENT '课程介绍',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_course`
--

LOCK TABLES `tb_course` WRITE;
/*!40000 ALTER TABLE `tb_course` DISABLE KEYS */;
INSERT INTO `tb_course` VALUES (2,'1','0','Spring',55,'软件八班','苏烨主讲','2024-09-27 12:14:16',NULL);
/*!40000 ALTER TABLE `tb_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant`
--

DROP TABLE IF EXISTS `tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenant` (
  `tenant_id` int NOT NULL AUTO_INCREMENT COMMENT '租户ID',
  `name` varchar(100) NOT NULL COMMENT '租户姓名',
  `contact_number` varchar(15) NOT NULL COMMENT '联系电话',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱地址',
  `identification_number` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `viewing_demand` tinyint(1) DEFAULT '0' COMMENT '看房需求',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='租户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant`
--

LOCK TABLES `tenant` WRITE;
/*!40000 ALTER TABLE `tenant` DISABLE KEYS */;
/*!40000 ALTER TABLE `tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermanagement`
--

DROP TABLE IF EXISTS `usermanagement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usermanagement` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `role` enum('Admin','Agent','User') NOT NULL COMMENT '角色类型',
  `contact_number` varchar(15) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱地址',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='人员管理信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermanagement`
--

LOCK TABLES `usermanagement` WRITE;
/*!40000 ALTER TABLE `usermanagement` DISABLE KEYS */;
/*!40000 ALTER TABLE `usermanagement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viewing`
--

DROP TABLE IF EXISTS `viewing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viewing` (
  `viewing_id` int NOT NULL AUTO_INCREMENT COMMENT '看房ID',
  `tenant_id` int DEFAULT NULL COMMENT '租户ID',
  `property_id` int DEFAULT NULL COMMENT '房源ID',
  `scheduled_time` datetime NOT NULL COMMENT '预约看房时间',
  `status` enum('Scheduled','Confirmed','Cancelled') DEFAULT 'Scheduled' COMMENT '看房状态',
  `notes` text COMMENT '备注信息',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`viewing_id`),
  KEY `tenant_id` (`tenant_id`),
  KEY `property_id` (`property_id`),
  CONSTRAINT `viewing_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`tenant_id`),
  CONSTRAINT `viewing_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='看房信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viewing`
--

LOCK TABLES `viewing` WRITE;
/*!40000 ALTER TABLE `viewing` DISABLE KEYS */;
/*!40000 ALTER TABLE `viewing` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-30 20:39:18
