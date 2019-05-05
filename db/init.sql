CREATE DATABASE  IF NOT EXISTS `exam`;
USE `exam`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: exam
-- ------------------------------------------------------
-- Server version	8.0.16

 SET NAMES utf8 ;
--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question` (
  `id` varchar(50) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `userid` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='问题';

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
INSERT INTO `question` VALUES ('42b49d84-6e96-11e9-8862-309c2367f1c9','用户1','user1','2019-05-05 01:58:45','<p>11111</p>','33b4d4ab-6e95-11e9-8862-309c2367f1c9'),('4f75fa4c-6e96-11e9-8862-309c2367f1c9','用户2','user2','2019-05-05 01:59:06','<p>22222222</p>','b7ee7fb7-6e95-11e9-8862-309c2367f1c9'),('7d721508-6e92-11e9-8862-309c2367f1c9','测试流程信息','admin','2019-05-05 01:31:46','<p>123123</p>','fec2a6ae-6cdd-11e9-afa9-408d5c509072'),('a54a8622-6e92-11e9-8862-309c2367f1c9','测试流程信息12','admin','2019-05-05 01:32:52','<p>324534534</p>','fec2a6ae-6cdd-11e9-afa9-408d5c509072');
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PASSWORD` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE KEY `NAME` (`NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES ('33b4d4ab-6e95-11e9-8862-309c2367f1c9','user1','c4ca4238a0b923820dcc509a6f75849b'),('b7ee7fb7-6e95-11e9-8862-309c2367f1c9','user2','c4ca4238a0b923820dcc509a6f75849b'),('fec2a6ae-6cdd-11e9-afa9-408d5c509072','admin','c4ca4238a0b923820dcc509a6f75849b'),('fec2a6ae-6cdd-11e9-afa9-408d5c509073','guest','c4ca4238a0b923820dcc509a6f75849b');
UNLOCK TABLES;