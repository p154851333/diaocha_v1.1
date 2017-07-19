/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50150
Source Host           : localhost:3306
Source Database       : diaocha

Target Server Type    : MYSQL
Target Server Version : 50150
File Encoding         : 65001

Date: 2014-01-22 14:25:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admins`
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_user` varchar(50) DEFAULT NULL,
  `a_pass` varchar(50) DEFAULT NULL,
  `a_email` varchar(100) DEFAULT NULL,
  `a_phone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'admin', 'admin', 'friday.pei@gmail.com', '15485133323');

-- ----------------------------
-- Table structure for `answersheet`
-- ----------------------------
DROP TABLE IF EXISTS `answersheet`;
CREATE TABLE `answersheet` (
  `as_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) NOT NULL,
  `as_result` varchar(8000) DEFAULT NULL,
  `as_postdate` date DEFAULT NULL,
  `as_userIP` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`as_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `config`
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_siteName` varchar(500) DEFAULT NULL,
  `c_siteURL` varchar(500) DEFAULT NULL,
  `c_isOpen` tinyint(1) DEFAULT NULL,
  `c_closeWord` varchar(1000) DEFAULT NULL,
  `copyright` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', 'darlingMonkey问卷调查管理系统', 'http://localhost:8080/diaocha', '0', '数据维护', 'Copyright&copy;2013');

-- ----------------------------
-- Table structure for `link`
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT,
  `l_url` varchar(500) DEFAULT NULL,
  `l_name` varchar(50) DEFAULT NULL,
  `l_img` varchar(500) DEFAULT NULL,
  `l_info` varchar(1000) DEFAULT NULL,
  `l_isLock` tinyint(1) DEFAULT NULL,
  `l_addtime` date DEFAULT NULL,
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES ('1', 'http://www.baidu.com', '百度网站', null, '搜索', '0', '2013-11-29');
INSERT INTO `link` VALUES ('2', 'http://www.google.com', '谷歌', null, '谷歌', '0', '2013-11-29');

-- ----------------------------
-- Table structure for `question`
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `q_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` int(11) NOT NULL,
  `q_type` int(11) DEFAULT NULL,
  `q_head` varchar(1000) DEFAULT NULL,
  `q_body` varchar(8000) DEFAULT NULL,
  `q_result` varchar(1000) DEFAULT NULL,
  `q_img` varchar(1000) DEFAULT NULL,
  `q_jdtz` varchar(1000) DEFAULT NULL,
  `q_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`q_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `survey`
-- ----------------------------
DROP TABLE IF EXISTS `survey`;
CREATE TABLE `survey` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(100) DEFAULT NULL,
  `s_desc` varchar(500) DEFAULT NULL,
  `s_author` varchar(100) DEFAULT NULL,
  `s_img` varchar(1000) DEFAULT NULL,
  `s_createDate` date DEFAULT NULL,
  `s_password` varchar(100) DEFAULT NULL,
  `s_isOpen` tinyint(1) DEFAULT NULL,
  `s_expireDate` date DEFAULT NULL,
  `s_isAudited` tinyint(1) DEFAULT NULL,
  `s_usehits` int(11) DEFAULT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

