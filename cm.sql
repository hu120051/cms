/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : cm

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 27/04/2021 09:39:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cm_application
-- ----------------------------
DROP TABLE IF EXISTS `cm_application`;
CREATE TABLE `cm_application`  (
  `applyid` bigint(30) NOT NULL AUTO_INCREMENT,
  `userid` bigint(30) NULL DEFAULT NULL,
  `carid` bigint(20) NULL DEFAULT NULL,
  `apply_time` datetime NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'applying',
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`applyid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  INDEX `carid`(`carid`) USING BTREE,
  CONSTRAINT `cm_application_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `cm_user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cm_application_ibfk_2` FOREIGN KEY (`carid`) REFERENCES `cm_car` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cm_application
-- ----------------------------
INSERT INTO `cm_application` VALUES (1, 7, 3, '2021-04-13 11:02:25', '2021-04-13', '2021-04-13', 'pass', NULL);
INSERT INTO `cm_application` VALUES (2, 3, 2, '2021-04-13 11:13:11', '2021-04-14', '2021-04-16', 'fail', NULL);
INSERT INTO `cm_application` VALUES (8, 4, 1, '2021-04-13 11:13:24', '2021-04-14', '2021-04-15', 'pass', NULL);
INSERT INTO `cm_application` VALUES (9, 5, 4, '2021-04-15 17:49:26', '2021-04-16', '2021-04-20', 'pass', NULL);
INSERT INTO `cm_application` VALUES (10, 6, 5, '2021-04-21 16:14:09', '2021-04-22', '2021-04-23', 'pass', NULL);
INSERT INTO `cm_application` VALUES (11, 2, 1, '2021-04-25 14:51:13', '2021-04-26', '2021-04-26', 'fail', NULL);
INSERT INTO `cm_application` VALUES (12, 2, 3, '2021-04-25 14:51:34', '2021-04-26', '2021-04-26', 'pass', NULL);
INSERT INTO `cm_application` VALUES (13, 2, 4, '2021-04-25 15:38:18', '2021-04-26', '2021-04-26', 'fail', NULL);
INSERT INTO `cm_application` VALUES (14, 2, 5, '2021-04-25 15:39:20', '2021-04-28', '2021-04-29', 'fail', NULL);
INSERT INTO `cm_application` VALUES (15, 1, 2, '2021-04-25 16:03:06', '2021-04-27', '2021-04-29', 'fail', NULL);
INSERT INTO `cm_application` VALUES (16, 1, 1, '2021-04-26 14:01:01', '2021-04-26', '2021-04-27', 'fail', '');
INSERT INTO `cm_application` VALUES (17, 1, 1, '2021-04-26 14:01:49', '2021-04-26', '2021-04-27', 'pass', '111');
INSERT INTO `cm_application` VALUES (18, 1, 1, '2021-04-26 14:02:54', '2021-04-26', '2021-04-27', 'fail', '1112');
INSERT INTO `cm_application` VALUES (19, 1, 1, '2021-04-26 14:03:04', '2021-04-26', '2021-04-27', 'fail', '1112');
INSERT INTO `cm_application` VALUES (20, 1, 3, '2021-04-26 14:04:01', '2021-04-26', '2021-04-27', 'applying', '54');
INSERT INTO `cm_application` VALUES (21, 1, 1, '2021-04-26 14:05:33', '2021-04-26', '2021-04-27', 'applying', '12');
INSERT INTO `cm_application` VALUES (22, 1, 3, '2021-04-26 14:06:17', '2021-04-26', '2021-04-27', 'applying', '132');
INSERT INTO `cm_application` VALUES (23, 1, 5, '2021-04-26 14:13:40', '2021-04-28', '2021-04-30', 'applying', 'test');
INSERT INTO `cm_application` VALUES (24, 1, 3, '2021-04-26 14:39:53', '2021-05-03', '2021-05-07', 'applying', 'test2');
INSERT INTO `cm_application` VALUES (25, 1, 4, '2021-04-26 14:41:05', '2021-04-29', '2021-04-30', 'applying', 'test3');

-- ----------------------------
-- Table structure for cm_car
-- ----------------------------
DROP TABLE IF EXISTS `cm_car`;
CREATE TABLE `cm_car`  (
  `cid` bigint(20) NOT NULL AUTO_INCREMENT,
  `license` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'free',
  `bought_time` date NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(5, 2) NULL DEFAULT NULL COMMENT '万元',
  `brand` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userid` bigint(30) NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  CONSTRAINT `cm_car_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `cm_user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cm_car
-- ----------------------------
INSERT INTO `cm_car` VALUES (1, '渝A·7Q523', 'using', '2021-04-12', 'large_cargo', 29.00, '东风', 1);
INSERT INTO `cm_car` VALUES (2, '渝B·32124', 'free', '2021-04-12', 'mid_passenger', 40.00, '丰田', NULL);
INSERT INTO `cm_car` VALUES (3, '渝C·78025', 'using', '2021-04-12', 'small_passenger', 7.00, '五菱', 7);
INSERT INTO `cm_car` VALUES (4, '渝A·B12S3', 'using', '2021-04-15', 'mid_cargo', 22.00, '一汽', 3);
INSERT INTO `cm_car` VALUES (5, '渝A·JL23K', 'free', '2021-04-21', 'large_cargo', 29.30, '东风', NULL);

-- ----------------------------
-- Table structure for cm_car_use
-- ----------------------------
DROP TABLE IF EXISTS `cm_car_use`;
CREATE TABLE `cm_car_use`  (
  `logid` bigint(30) NOT NULL AUTO_INCREMENT,
  `userid` bigint(30) NULL DEFAULT NULL,
  `carid` bigint(20) NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  PRIMARY KEY (`logid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  INDEX `carid`(`carid`) USING BTREE,
  CONSTRAINT `cm_car_use_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `cm_user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cm_car_use_ibfk_2` FOREIGN KEY (`carid`) REFERENCES `cm_car` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cm_car_use
-- ----------------------------
INSERT INTO `cm_car_use` VALUES (1, 3, 2, '2021-04-12', '2021-04-12');
INSERT INTO `cm_car_use` VALUES (2, 4, 1, '2021-04-12', '2021-04-13');
INSERT INTO `cm_car_use` VALUES (3, 7, 3, '2021-04-13', '2021-04-13');
INSERT INTO `cm_car_use` VALUES (6, 5, 4, '2021-04-16', '2021-04-20');
INSERT INTO `cm_car_use` VALUES (7, 6, 5, '2021-04-22', '2021-04-23');
INSERT INTO `cm_car_use` VALUES (8, 4, 1, '2021-04-14', '2021-04-15');

-- ----------------------------
-- Table structure for cm_emergency
-- ----------------------------
DROP TABLE IF EXISTS `cm_emergency`;
CREATE TABLE `cm_emergency`  (
  `mid` bigint(20) NOT NULL AUTO_INCREMENT,
  `carid` bigint(20) NOT NULL,
  `userid` bigint(30) NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lng` decimal(10, 7) NULL DEFAULT NULL,
  `lat` decimal(10, 7) NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  PRIMARY KEY (`mid`) USING BTREE,
  INDEX `carid`(`carid`) USING BTREE,
  INDEX `userid`(`userid`) USING BTREE,
  CONSTRAINT `cm_emergency_ibfk_1` FOREIGN KEY (`carid`) REFERENCES `cm_car` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cm_emergency_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `cm_user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cm_emergency
-- ----------------------------
INSERT INTO `cm_emergency` VALUES (1, 3, 6, '车祸', 106.4667340, 29.5693180, '2021-04-24 09:38:46', '0');
INSERT INTO `cm_emergency` VALUES (2, 4, 1, '堵车', 106.4767340, 29.5593180, '2021-04-26 23:44:01', '0');
INSERT INTO `cm_emergency` VALUES (3, 2, 1, 'test', 104.1953970, 35.8616600, '2021-04-27 09:03:30', '0');

-- ----------------------------
-- Table structure for cm_location
-- ----------------------------
DROP TABLE IF EXISTS `cm_location`;
CREATE TABLE `cm_location`  (
  `lid` bigint(30) NOT NULL AUTO_INCREMENT,
  `userid` bigint(30) NULL DEFAULT NULL,
  `carid` bigint(20) NULL DEFAULT NULL,
  `lng` decimal(10, 7) NULL DEFAULT NULL COMMENT '经度',
  `lat` decimal(10, 7) NULL DEFAULT NULL COMMENT '纬度',
  `time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`lid`) USING BTREE,
  INDEX `cm_location_ibfk_1`(`userid`) USING BTREE,
  INDEX `cm_location_ibfk_2`(`carid`) USING BTREE,
  CONSTRAINT `cm_location_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `cm_user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cm_location_ibfk_2` FOREIGN KEY (`carid`) REFERENCES `cm_car` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cm_location
-- ----------------------------
INSERT INTO `cm_location` VALUES (1, 7, 3, 106.4766920, 29.5658390, '2021-04-13 10:45:46');
INSERT INTO `cm_location` VALUES (2, 7, 3, 106.4737810, 29.5675670, '2021-04-13 10:46:19');
INSERT INTO `cm_location` VALUES (3, 1, 1, 106.4747810, 29.5775670, '2021-04-23 09:43:10');
INSERT INTO `cm_location` VALUES (4, 1, 1, 106.4847810, 29.5775670, '2021-04-23 13:32:14');
INSERT INTO `cm_location` VALUES (5, 7, 3, 106.4766920, 29.5658390, '2021-04-23 13:49:24');
INSERT INTO `cm_location` VALUES (6, 3, 4, 106.4666920, 29.5523562, '2021-04-26 17:21:36');
INSERT INTO `cm_location` VALUES (7, 1, 2, 113.7632828, 23.3790333, '2021-04-26 17:39:27');

-- ----------------------------
-- Table structure for cm_user
-- ----------------------------
DROP TABLE IF EXISTS `cm_user`;
CREATE TABLE `cm_user`  (
  `uid` bigint(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'MD5加密32位',
  `creat_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'offline',
  `group` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `count` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cm_user
-- ----------------------------
INSERT INTO `cm_user` VALUES (1, '胡寒阳', 'hu120051', 'aa80064af613c4b057d5a4c1a397e140', '2021-04-12 17:08:47', '2021-04-27 08:41:51', 'online', 'superadmin', 63);
INSERT INTO `cm_user` VALUES (2, '管理员', 'admin', '21232f297a57a5a743894a0e4a801fc3', '2021-04-12 17:10:17', '2021-04-23 14:31:03', 'offline', 'admin', 114);
INSERT INTO `cm_user` VALUES (3, '张三', 'zhangsan', '3ab7873060b6de9ca93b664e752bca6f', '2021-04-12 18:21:57', '2021-04-25 13:52:08', 'online', 'staff', 5);
INSERT INTO `cm_user` VALUES (4, '李四', 'lisi', 'ada6f2b5b7ba3f1531e4c1e291cbe7b0', '2021-04-12 18:22:42', '2021-04-23 14:31:06', 'online', 'staff', 1);
INSERT INTO `cm_user` VALUES (5, '王五', 'wangwu', 'b52c0992c2d18eddbad0c05bac922cee', '2021-04-13 10:08:40', '2021-04-23 14:31:07', 'offline', 'staff', 4);
INSERT INTO `cm_user` VALUES (6, '赵六', 'zhaoliu', 'ad324eb585496327017b46f1b1d526de', '2021-04-13 10:31:03', '2021-04-23 14:31:08', 'online', 'admin', 7);
INSERT INTO `cm_user` VALUES (7, '高磊', 'gaolei', '8f85e32f11b1e4cfcbe353b5b646bf0f', '2021-04-13 10:34:54', '2021-04-23 14:31:10', 'online', 'staff', 22);
INSERT INTO `cm_user` VALUES (9, '方晓萌', 'fxm', '33f5b0123d2749770c2dd63007e9fb1d', '2021-04-13 11:07:01', '2021-04-23 14:31:12', 'offline', 'admin', 41);
INSERT INTO `cm_user` VALUES (13, '刘义良', 'liuyiliang', '3ae09f1e3ceb295a239c352461a6ca6f', '2021-04-13 13:48:07', '2021-04-23 14:31:15', 'offline', 'admin', 8);
INSERT INTO `cm_user` VALUES (14, '杨肇谦', 'yangzhaoqian', 'a63ee944347161d3f3b55a3e0320e3aa', '2021-04-13 13:59:42', '2021-04-23 14:31:16', 'offline', 'staff', 11);
INSERT INTO `cm_user` VALUES (15, '杨令', 'yangling', '2dd373cd649afdad040d2c414003ce71', '2021-04-20 17:11:04', '2021-04-23 14:31:18', 'offline', 'staff', 27);
INSERT INTO `cm_user` VALUES (17, '郭旭', 'guoxu', '4963908eaa34eb2107f519b8dd298188', '2021-04-20 17:13:52', '2021-04-23 14:31:20', 'offline', 'admin', 11);
INSERT INTO `cm_user` VALUES (18, '李彦霖', 'liyanlin', '3ae09f1e3ceb295a239c352461a6ca6f', '2021-04-20 17:15:30', '2021-04-23 14:31:22', 'offline', 'staff', 1);
INSERT INTO `cm_user` VALUES (19, '何菁鑫', 'hejingxin', '94f611ae3a813c9c3fa2f7be4ab045a2', '2021-04-20 17:16:02', '2021-04-23 14:31:24', 'offline', 'admin', 0);

-- ----------------------------
-- Triggers structure for table cm_application
-- ----------------------------
DROP TRIGGER IF EXISTS `apply_time`;
delimiter ;;
CREATE TRIGGER `apply_time` BEFORE INSERT ON `cm_application` FOR EACH ROW begin
         set new.apply_time = now();
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table cm_emergency
-- ----------------------------
DROP TRIGGER IF EXISTS `time`;
delimiter ;;
CREATE TRIGGER `time` BEFORE INSERT ON `cm_emergency` FOR EACH ROW begin
         set new.time = now();
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table cm_user
-- ----------------------------
DROP TRIGGER IF EXISTS `creat_time`;
delimiter ;;
CREATE TRIGGER `creat_time` BEFORE INSERT ON `cm_user` FOR EACH ROW begin
         set new.creat_time = now();
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
