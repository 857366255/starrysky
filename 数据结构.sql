drop database starrysky;
create database starrysky;
/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : starrysky

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-10-11 16:35:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for s_field
-- ----------------------------
DROP TABLE IF EXISTS `s_field`;
CREATE TABLE `s_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_id` int(11) DEFAULT NULL COMMENT '表id',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `id_name` varchar(255) DEFAULT NULL COMMENT 'id名称',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `size` double DEFAULT NULL COMMENT '大小',
  `type_size` varchar(255) DEFAULT NULL,
  `is_null` tinyint(1) DEFAULT NULL COMMENT '是否允许未空',
  PRIMARY KEY (`id`),
  KEY `fk_field_table_id` (`table_id`),
  CONSTRAINT `fk_field_table_id` FOREIGN KEY (`table_id`) REFERENCES `s_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='字段';

-- ----------------------------
-- Records of s_field
-- ----------------------------
INSERT INTO `s_field` VALUES ('4', '1', '自行车', 'zxc', 'varchar', '255', 'varchar(255)', null);

-- ----------------------------
-- Table structure for s_table
-- ----------------------------
DROP TABLE IF EXISTS `s_table`;
CREATE TABLE `s_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `id_name` varchar(255) DEFAULT NULL COMMENT 'id名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='表';

-- ----------------------------
-- Records of s_table
-- ----------------------------
INSERT INTO `s_table` VALUES ('1', '自行车', 'zxc');

-- ----------------------------
-- Table structure for t_employees
-- ----------------------------
DROP TABLE IF EXISTS `t_employees`;
CREATE TABLE `t_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `man_id` int(11) DEFAULT NULL COMMENT '人id',
  `role` varchar(255) DEFAULT NULL COMMENT '角色',
  `user` varchar(255) DEFAULT NULL COMMENT '账号',
  `password` varchar(255) DEFAULT NULL,
  `is_enable` tinyint(1) DEFAULT NULL COMMENT '是否启用',
  PRIMARY KEY (`id`),
  KEY `employees_man_id` (`man_id`),
  CONSTRAINT `employees_man_id` FOREIGN KEY (`man_id`) REFERENCES `t_man` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='员工';

-- ----------------------------
-- Records of t_employees
-- ----------------------------
INSERT INTO `t_employees` VALUES ('1', '1', '打', 'zxc', 'asdsa', '1');
INSERT INTO `t_employees` VALUES ('2', null, '私教', 'zqq', '123456', '0');
INSERT INTO `t_employees` VALUES ('8', '2', '私教123', 'zqq', '123456', '0');
INSERT INTO `t_employees` VALUES ('9', '2', '私教123', 'zqq', '123456', '0');
INSERT INTO `t_employees` VALUES ('10', '2', '私教123', 'zqq', '123456', '0');
INSERT INTO `t_employees` VALUES ('11', '2', '私教123', 'zqq', '123456', '1');
INSERT INTO `t_employees` VALUES ('12', '2', '私教123', 'zqq', '123456', '1');
INSERT INTO `t_employees` VALUES ('13', '2', '私教123', 'zqq', '123456', '1');
INSERT INTO `t_employees` VALUES ('14', '2', '私教123', 'zqq', '123456', '1');
INSERT INTO `t_employees` VALUES ('15', '2', '私教123', 'zqq', '123456', '1');
INSERT INTO `t_employees` VALUES ('16', '2', '私教123', 'zqq', '123456', '1');
INSERT INTO `t_employees` VALUES ('17', '2', '私教123', 'zqq', '123456', '1');
INSERT INTO `t_employees` VALUES ('18', '2', '私教123', 'zqq', '123456', '1');

-- ----------------------------
-- Table structure for t_man
-- ----------------------------
DROP TABLE IF EXISTS `t_man`;
CREATE TABLE `t_man` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL COMMENT '名称',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别',
  `age` int(3) DEFAULT NULL COMMENT '年龄',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='人';

-- ----------------------------
-- Records of t_man
-- ----------------------------
INSERT INTO `t_man` VALUES ('1', '自行车', '0', '10', '1256786', '阿斯顿');
INSERT INTO `t_man` VALUES ('2', 'zxc', '1', '12', '12354456', '额外全额');
INSERT INTO `t_man` VALUES ('3', 'zz2', '1', '1000', '125asdasd1', '阿adsasd1');
