/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : cms

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 13/07/2021 17:24:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for appraisal
-- ----------------------------
DROP TABLE IF EXISTS `appraisal`;
CREATE TABLE `appraisal`  (
  `AppraisalID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评审编号',
  `ProductID` bigint(30) NULL DEFAULT NULL COMMENT '产品编号',
  `ClientID` bigint(30) NULL DEFAULT NULL COMMENT '客户编号',
  `Quantity` bigint(30) NULL DEFAULT NULL COMMENT '产品数量',
  `Left_Quantity` bigint(30) NULL DEFAULT NULL COMMENT '剩余订单需求',
  `Date` date NULL DEFAULT NULL COMMENT '评审时间',
  PRIMARY KEY (`AppraisalID`) USING BTREE,
  INDEX `appraisal_ibfk_1`(`ProductID`) USING BTREE,
  INDEX `appraisal_ibfk_2`(`ClientID`) USING BTREE,
  CONSTRAINT `appraisal_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `appraisal_ibfk_2` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ClientID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of appraisal
-- ----------------------------

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client`  (
  `ClientID` bigint(30) NOT NULL COMMENT '客户编号',
  `ClientName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '客户名称',
  PRIMARY KEY (`ClientID`) USING BTREE,
  INDEX `ClientName`(`ClientName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES (2023, '中午');
INSERT INTO `client` VALUES (2024, '众智宝');
INSERT INTO `client` VALUES (2013, '凯斯');
INSERT INTO `client` VALUES (2012, '凯舜');
INSERT INTO `client` VALUES (2007, '和美');
INSERT INTO `client` VALUES (2004, '国宝');
INSERT INTO `client` VALUES (2019, '小熊');
INSERT INTO `client` VALUES (2002, '川本');
INSERT INTO `client` VALUES (2010, '巨佳');
INSERT INTO `client` VALUES (2015, '康宝');
INSERT INTO `client` VALUES (2014, '康百事');
INSERT INTO `client` VALUES (2020, '新宝');
INSERT INTO `client` VALUES (2021, '新宝3A');
INSERT INTO `client` VALUES (2009, '杰灵');
INSERT INTO `client` VALUES (2006, '毫米');
INSERT INTO `client` VALUES (2003, '港成');
INSERT INTO `client` VALUES (2022, '源穗');
INSERT INTO `client` VALUES (2016, '科锐玛');
INSERT INTO `client` VALUES (2018, '索奇');
INSERT INTO `client` VALUES (2008, '红盛/精亿');
INSERT INTO `client` VALUES (2017, '美的');
INSERT INTO `client` VALUES (2005, '翰唐');
INSERT INTO `client` VALUES (2011, '聚英');
INSERT INTO `client` VALUES (2001, '诚通冠');

-- ----------------------------
-- Table structure for ingredient
-- ----------------------------
DROP TABLE IF EXISTS `ingredient`;
CREATE TABLE `ingredient`  (
  `ProductID` bigint(30) NOT NULL COMMENT '产品编号',
  `MaterialID` bigint(30) NOT NULL COMMENT '材料编号',
  `BOM` double(30, 4) NULL DEFAULT NULL COMMENT 'BOM数',
  PRIMARY KEY (`ProductID`, `MaterialID`) USING BTREE,
  INDEX `MaterialID`(`MaterialID`) USING BTREE,
  CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ingredient_ibfk_2` FOREIGN KEY (`MaterialID`) REFERENCES `material` (`MaterialID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ingredient
-- ----------------------------

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material`  (
  `MaterialID` bigint(30) NOT NULL COMMENT '物料编号',
  `Type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MaterialName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品名规格',
  `Unit` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `Univalence` double(30, 4) NULL DEFAULT NULL COMMENT '单价',
  `SupplierName01` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SupplierName02` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SupplierName03` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Stock` double(30, 4) NULL DEFAULT 0.0000 COMMENT '库存量',
  `Using` double(30, 4) NULL DEFAULT 0.0000 COMMENT '在制仓中数量',
  PRIMARY KEY (`MaterialID`) USING BTREE,
  INDEX `SupplierName01`(`SupplierName01`) USING BTREE,
  INDEX `SupplierName03`(`SupplierName03`) USING BTREE,
  INDEX `SupplierName02`(`SupplierName02`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES (58010001, '骨架', 'H518-01 骨架', '个', 0.0850, '创新', '士诚', NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010002, '骨架', 'H735-13 骨架', '个', 0.1300, '创新', '士诚', NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010003, '骨架', 'H524-01 骨架', '个', 0.1000, '士诚', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010004, '骨架', 'H627-01 骨架', '个', 0.1500, '广进利', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010005, '骨架', 'H630-01 骨架', '个', 0.2000, '广进利', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010006, '骨架', 'H921-01 骨架', '个', 0.2000, '士诚', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010007, '骨架', 'H837-01 骨架', '个', 0.2600, '士诚', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010008, '骨架', 'H837-01A （PPS）骨架', '个', 0.3600, '士诚', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010009, '骨架', 'H2520-01 骨架', '个', 0.2500, '士诚', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010010, '骨架', 'H1057-14（PA66）骨架', '个', 0.1500, '雄森', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010011, '骨架', 'H1058-13（PA66）骨架', '个', 0.1600, '雄森', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010012, '骨架', 'H523-10（PET)骨架', '个', 0.1400, '士诚', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010013, '骨架', 'H8633-18 骨架', '个', 0.2400, '凯舜', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010014, '骨架', 'H8866-12（单扣）骨架', '个', 0.2070, '凯舜', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010015, '骨架', 'H8866-12（双扣）骨架', '个', 0.2070, '凯舜', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010016, '骨架', 'H8866-13（单扣）骨架', '个', 0.2070, '凯舜', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010017, '骨架', 'H5403-01 （PA66） 骨架', '个', 0.1600, '雄森', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010018, '骨架', 'H5403-01 （PA66） 上盖', '个', 0.1200, '雄森', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010019, '骨架', 'H420-01 骨架', '个', 0.1100, '士城', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010020, '骨架', 'H726L-01骨架', '个', 0.1100, '雄森', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010021, '骨架', 'H1059-13骨架 （港城）', '个', 0.1500, '雄森', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010022, '骨架', 'H1060-14骨架 （港城）', '个', 0.1500, '雄森', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010023, '骨架', 'H4814-01 骨架', '个', 0.2300, NULL, NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010024, '骨架', 'H8866-2 骨架', '个', 0.2070, NULL, NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010025, '骨架', 'H315-01骨架', '个', 0.1100, NULL, NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010026, '骨架', 'H8866-A02（单扣13片）骨架', '个', 0.1600, NULL, NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010027, '骨架', 'H24300-02骨架', '个', 0.1500, NULL, NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010028, '骨架', 'H1057-14A（PA66）骨架', '个', 0.1600, '雄森', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58010029, '骨架', 'H829-01骨架', '个', 0.1600, NULL, NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58020001, '外壳', 'H524-02外壳', '个', 0.2500, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58020002, '外壳', 'H627-02 外壳', '个', 0.3000, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58020003, '外壳', 'H630-02 外壳', '个', 0.4500, '志诚', '金容', NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58020004, '外壳', 'H921-02B 外壳', '个', 0.6000, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58020005, '外壳', 'H921-02A 外壳', '个', 0.5300, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58020006, '外壳', 'H920-02 外壳', '个', 0.6000, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58020007, '外壳', 'H2520-02 外壳', '个', 2.0000, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58020008, '外壳', 'H837-02 外壳(无孔）', '个', 0.6200, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58020009, '外壳', 'H837-02A （两边两孔） 外壳', '个', 0.6800, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58020010, '外壳', 'H837-02B （一边四孔；开线槽） 外壳', '个', 0.6800, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58020011, '外壳', 'H837-02C （两边四孔） 外壳', '个', 0.6800, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58020012, '外壳', 'H837-02D （锌镍合金无孔） 外壳', '个', 0.8200, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58020013, '外壳', 'H630-02B （一面四孔） 外壳', '个', 0.4500, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58020014, '外壳', 'H630-02A （一面两孔） 外壳', '个', 0.4500, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58020015, '外壳', 'H420-02外壳', '个', 0.2500, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58020016, '外壳', 'H726L-02外壳', '个', 0.4300, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58020017, '外壳', 'H4814-02 外壳', '个', 0.9500, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58020018, '外壳', 'H315-02外壳', '个', 0.2500, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58020019, '外壳', 'H18A80-02外壳', '个', NULL, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58020020, '外壳', 'H829-02外壳', '个', 0.6200, NULL, NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58030001, '盖板', 'H524-03A 下盖板', '个', 0.1000, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58030002, '盖板', 'H524-03B 上盖板', '个', 0.1000, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58030003, '盖板', 'H627-03 盖板', '个', 0.1000, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58030004, '盖板', 'H630-03 盖板', '个', 0.1000, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58030005, '盖板', 'H837-03 盖板', '个', 0.1000, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58030006, '盖板', 'H837-03B （镀锌镍合金） 盖板', '个', 0.1500, '志诚', '金容', NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58030007, '盖板', 'H920-03 盖板', '个', 0.5300, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58030008, '盖板', 'H921-03A  (120C) 盖板', '个', 0.4000, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58030009, '盖板', 'H921-03B  (110C) 盖板', '个', 0.5300, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58030010, '盖板', 'H921-03E  (E48) 盖板', '个', 0.5300, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58030011, '盖板', 'H921-03D  （B48） 盖板', '个', 0.5300, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58030012, '盖板', 'H921-03F （100D下） 盖板', '个', 0.5300, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58030013, '盖板', 'H420-03 盖板', '个', 0.1000, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58030014, '盖板', 'H726L-03盖板', '个', 0.1000, '金容', '精艺', NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58030015, '盖板', 'H4814-03 盖板', '个', 0.8000, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58030016, '盖板', 'H315-03盖板', NULL, 0.1000, '金容', '志城', NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58030017, '盖板', 'H24300-01上盖板', '个', 0.1600, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58030018, '盖板', 'H827-03', '个', NULL, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040001, '铁芯', 'H524-04 铁芯', '个', 0.1800, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040002, '铁芯', 'H627-04  铁芯', '个', 0.2300, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040003, '铁芯', 'H921-04  铁芯', '个', 0.3500, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040004, '铁芯', 'H630-12A32-04 铁芯', '个', 0.2100, '志诚', '精艺', NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040005, '铁芯', 'H630-12A28-04 铁芯', '个', 0.2000, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040006, '铁芯', 'H630-12A60-04 铁芯', '个', 0.2800, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040007, '铁芯', 'H630-12A48-04 铁芯', '个', 0.2300, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040008, '铁芯', 'H630-110A640-04 铁芯', '个', 0.2000, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040009, '铁芯', 'H630-220A900-04 铁芯', '个', 0.1800, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040010, '铁芯', 'H837-12A24-04 铁芯', '个', 0.3000, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040011, '铁芯', 'H837-12A2700-04  铁芯', '个', 0.2900, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040012, '铁芯', 'H837-220A1000-04 铁芯', '个', 0.3000, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040013, '铁芯', 'H837-220B8500-04 铁芯', '个', 0.3100, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040014, '铁芯', 'H837-85A950-04 铁芯', '个', 0.3000, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040015, '铁芯', 'H837-220A9500-04 铁芯', '个', 0.3100, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040016, '铁芯', 'H837-12B22-04 铁芯', '个', 0.3100, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040017, '铁芯', 'H837-12A30-04 铁芯', '个', 0.2200, '精艺', '得雅电镀', NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040018, '铁芯', 'H837-24A72-04 铁芯', '个', 0.3000, '精艺', '得雅电镀', NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040019, '铁芯', 'H837-12C24-04 铁芯', '个', 0.3200, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040020, '铁芯', 'H837-18A55-04 锌镍合金 铁芯', '个', 0.3400, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040021, '铁芯', 'H837-12B22-04B 锌镍合金 铁芯', '个', 0.2900, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040022, '铁芯', 'H420-04 铁芯', '个', 0.1900, '志诚', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040023, '铁芯', 'H726-110A500-04铁芯', '个', 0.2100, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040024, '铁芯', 'H630-12A14-04 铁芯', '个', 0.2800, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040025, '铁芯', 'H2520-04铁芯', '个', 0.6300, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040026, '铁芯', 'H630-12A36-04铁芯', '个', 0.2100, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040027, '铁芯', 'H627-S220A220-04 铁芯', '个', 0.1900, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040028, '铁芯', 'H315-04铁芯', '个', 0.1900, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040029, '铁芯', '0837S-18A80-04铁芯', '个', NULL, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040030, '铁芯', 'H829S12A20-04铁芯', '个', 0.3100, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58040031, NULL, '0837S-12A35-04铁芯', '个', 0.3800, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050001, '滑杆', 'H524-05 滑杆', '个', 0.2400, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050002, '滑杆', 'H627-05  滑杆', '个', 0.2300, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050003, '滑杆', 'H630-12A36-05 滑杆', '个', 0.3000, '志诚', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050004, '滑杆', 'H630-12A32-05 滑杆', '个', 0.2900, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050005, '滑杆', 'H630-12A28-05 滑杆', '个', 0.2800, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050006, '滑杆', 'H630-12A60-05 滑杆', '个', 0.3900, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050007, '滑杆', 'H630-12A48-05 滑杆', '个', 0.3300, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050008, '滑杆', 'H630-110A640-05 滑杆', '个', 0.2700, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050009, '滑杆', 'H837-220A9000-05 滑杆', '个', 0.6000, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050010, '滑杆', 'H837-12A24-05  滑杆', '个', 1.0500, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050011, '滑杆', 'H837-12A2700-05 滑杆', '个', 0.4000, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050012, '滑杆', 'H837-220A1000-05 滑杆', '个', 0.4500, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050013, '滑杆', 'H837-220B8500-05 滑杆', '个', 0.5300, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050014, '滑杆', 'H837-85A950-05 滑杆', '个', 0.8000, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050015, '滑杆', 'H837-220A9500-05 滑杆', '个', 0.6000, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050016, '滑杆', 'H837-12B22-05B 滑杆（镀锌镍合金）', '个', 1.2500, '精艺', '得雅电镀', NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050017, '滑杆', 'H837-12A30-05 滑杆', '个', 0.5000, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050018, '滑杆', 'H837-24A72-05 滑杆', '个', 0.5600, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050019, '滑杆', 'H837-12C24-05 滑杆', '个', 0.5600, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050020, '滑杆', 'H837-18A55-05 锌镍合金 滑杆', '个', 0.4800, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050021, '滑杆', 'H630-220A900-05 滑杆', '个', 0.2900, '精艺', '得雅电镀', NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050022, '滑杆', 'H837-24A36-05 滑杆', '个', 1.0200, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050023, '滑杆', 'H837-12B22-05 滑杆', '个', 1.2500, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050024, '滑杆', 'H837-220C1000-05 滑杆', '个', 0.4800, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050025, '滑杆', 'H837-12B22-05C 锌镍合金 滑杆', '个', 1.1500, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050026, '滑杆', 'H420-05 滑杆', '个', 0.2300, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050027, '滑杆', 'H726-110A500-05滑杆', '个', 0.3200, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050028, '滑杆', 'H630-12A14-05 滑杆', '个', 0.4300, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050029, '滑杆', 'H627-S220A220-05 滑杆', '个', 0.2600, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050030, '滑杆', 'H315-05滑杆', '个', 0.2300, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050031, '滑杆', 'H837S-18A80-05滑杆', '个', NULL, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050032, '滑杆', 'H1701-05', '个', 0.6000, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050033, '滑杆', 'H827-12A18-05 滑杆', '个', 0.4500, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58050034, NULL, 'H837-12A35-05 滑杆', '个', 0.6500, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58060001, '弹簧', 'H420-06弹簧', '个', 0.1500, '坤联', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58060002, '弹簧', 'H627-06 弹簧', '个', 0.0460, '坤联', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58060003, '弹簧', 'H630-06 弹簧  (0.35)', '个', 0.0530, '坤联', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58060004, '弹簧', 'H837-06A 弹簧(0.5X19)', '个', 0.0460, '坤联', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58060005, '弹簧', 'H921-06 弹簧', '个', 0.0430, '坤联', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58060006, '弹簧', 'H837-06B 弹簧(0.4X15)', '个', 0.0460, '坤联', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58060007, '弹簧', 'H837-06C 弹簧', '个', 0.0650, '诚发', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58060008, '弹簧', 'H524-06A 弹簧', '个', 0.0430, NULL, NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58060009, '弹簧', 'H630-06G 弹簧', '个', 0.0530, '豪欧', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58060010, '弹簧', 'H837-06D 弹簧', '个', 0.0650, '豪欧', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58060011, '弹簧', 'H726-07弹簧', '个', 0.0550, '豪欧', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58060012, '弹簧', 'H420-08弹簧', '个', 0.1500, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58060013, '弹簧', 'H315-06弹簧', '个', 0.1359, '豪欧', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58060014, '弹簧', 'H837-06D 弹簧', '个', 0.0530, '坤联', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58060015, '弹簧', 'H827-06 弹簧', '个', 0.0460, '坤联', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58070001, '垫片', NULL, '个', NULL, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58070002, '垫片', 'F4*1.5MM 垫片', '个', 0.1500, '豪欧', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58070003, '垫片', 'F2*1 70°丁青橡胶 消音垫', '个', 0.0700, '豪欧', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58070004, '垫片', 'F2*1 0524气阀 消音垫', '个', 0.0700, '豪欧', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58070005, '垫片', 'H0920-07 隔磁片', '个', 0.0200, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58070006, '垫片', 'F2*1 60°硅胶 消音垫524', '个', 0.0700, '豪欧', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58080001, '挡帽', 'H837-12A22-08 挡帽', '个', 0.2800, '士城', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58080002, '挡帽', 'H630-12A48-08 挡帽', '个', 0.4500, '士城', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58080003, '挡帽', 'H627-220D390-08 挡帽', '个', 0.0300, '广进利', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58080004, '挡帽', 'H630-12A32-08 挡帽', '个', 0.4800, NULL, NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58080005, '挡帽', 'H630-12A28-08 挡帽', '个', 0.3600, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58080006, '挡帽', 'H630-12A60-08 挡帽', '个', 0.2200, NULL, NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58080007, '挡帽', 'H837-220A9000-08 挡帽', '个', 0.0500, '士诚', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58080008, '挡帽', 'H837-12A30-08 挡帽', '个', 0.0600, '士诚', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58080009, '挡帽', 'H837-220A9500-08 挡帽', '个', 0.0450, '士诚', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58080010, '挡帽', 'H1701-08 挡帽', '个', 0.3800, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58080011, '挡帽', 'H837-24A72-08 挡帽', '个', 0.2600, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58080012, '挡帽', NULL, '个', NULL, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58080013, '挡帽', 'H837-18A55-08 挡帽', '个', 0.2800, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58080014, '挡帽', 'H726-110A500-08 档帽', '个', 0.1000, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58080015, '挡帽', 'H630-12A14-08 档帽', '个', 1.1000, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58080016, '挡帽', 'H837-220B1000-08A 档帽', '个', 0.1000, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58080017, NULL, 'H837-12A35-08 挡帽', '个', 0.2600, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58090001, '顶杆', 'H627-220D390-09 顶杆', '个', 0.2600, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58090002, '顶杆', 'H837-12A24-09 顶杆', '个', 0.2800, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58090003, '顶杆', 'H837-220A2700-09 顶杆', '个', 0.2600, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58090004, '顶杆', 'H630-12A32-09 顶杆', '个', 0.2600, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58090005, '顶杆', 'H630-12A28-09 顶杆', '个', 0.2400, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58090006, '顶杆', 'H630-12A48-09 顶杆', '个', 0.2800, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58090007, '顶杆', 'H837-220B8500-09顶杆', '个', 0.2900, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58090008, '顶杆', 'H627-220D390-09A 顶杆', '个', 0.2600, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58090009, '顶杆', 'H630-110A640-09 顶杆', '个', 0.2600, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58090010, '顶杆', 'H837-220A1000-09 顶杆', '个', 0.2000, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58090011, '顶杆', 'H630-220A900-09 顶杆', '个', 0.2600, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58090012, '顶杆', 'H837-220A9500-09顶杆', '个', 0.3700, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58090013, '顶杆', 'H837-220A9000-09顶杆', '个', 0.3800, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58090014, '顶杆', 'H837-12B22-09 顶杆', '个', 0.3200, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58090015, '顶杆', 'H837-12A30-09 顶杆', '个', 0.2900, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58090016, '顶杆', 'H837-24A72-09 顶杆', '个', 0.2600, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58090017, '顶杆', 'H837-12C24-09 顶杆', '个', 0.3100, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58090018, '顶杆', 'H630-12A36-09 顶杆', '个', 0.2600, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58090019, '顶杆', 'H726-110A500-09顶杆', '个', 0.2600, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58090020, '顶杆', 'H837-18A55-09顶杆', '个', 0.2600, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58090021, '顶杆', 'H627-S220A220-09 顶杆', '个', 0.2600, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58090022, '顶杆', 'H827-12A18-09 顶杆', '个', 0.2600, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58090023, '顶杆', 'H837-12A35-09 顶杆', '个', 0.2600, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58100001, '开口挡圈', 'F4*0.6MM*9MM 开口挡圈', '个', 0.0250, '创盈', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58100002, '开口挡圈', 'F6*0.88MM*12MM 开口挡圈', '个', 0.0550, '创盈', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58100003, '开口挡圈', 'F5*0.6MM*11MM 开口挡圈', '个', 0.0500, '创盈', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58100004, '开口挡圈', 'F3*0.6MM*7MM 开口挡圈', '个', NULL, '创盈', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58110001, '套管', 'F6玻纤管', '个', NULL, '泉盛', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58110002, '套管', 'F5玻纤管', '个', NULL, '泉盛', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58110003, '套管', 'F3白色纤维管', '个', NULL, '泉盛', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58110004, '套管', 'F4白色纤维管', '个', NULL, '泉盛', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58110005, '套管', 'F5白色纤维管', '个', NULL, '泉盛', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58110006, '套管', 'F4纤维硅油管(1500V)', '个', NULL, '泉盛', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58110007, '套管', 'F6硅胶管', '个', NULL, '泉盛', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58110008, '套管', 'F6*F4.2加厚硅胶玻纤管', '个', NULL, '泉盛', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58110009, '套管', 'F3內胶外纤管', '个', NULL, '泉盛', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58110010, '套管', 'F6.5*F4.5内胶外纤管', '个', NULL, '泉盛', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58110011, '套管', 'F4*F3*0.5透明硅胶管', '个', NULL, '凯河', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58110012, '套管', 'F6*4*1透明硅胶管', '个', NULL, '凯河', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58110013, '套管', 'F2*400M热缩管', '个', NULL, '凯河', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58110014, '套管', 'F7热缩管', '个', NULL, '凯河', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58110015, '套管', 'F3热缩管', '个', NULL, '凯河', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58110016, '套管', 'F5.5热缩管', '个', NULL, '凯河', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58110017, '套管', 'F19X1.5热缩管', '个', NULL, '凯河', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58110018, '套管', 'F4.5热缩管', '个', NULL, '凯河', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58110019, '套管', 'F9热缩管', '个', NULL, '凯河', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58110020, '套管', 'F1.5热缩管', '个', NULL, '凯河', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58110021, '套管', 'F5.5白色透明热缩管', '个', NULL, '嘉宏建', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58110022, '套管', 'F6白色纤维管', '个', NULL, NULL, NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58110023, '套管', 'F3.5热缩管', NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58110024, '套管', '内径F3硅质玻纤套管', NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58110025, '套管', 'F13热缩管', '个', NULL, '凯河', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58150001, 'O型圈', 'F4*1MM O型圈', '个', NULL, '中江', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58150002, 'O型圈', 'F5*1MM O型圈', '个', NULL, '中江', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58150003, 'O型圈', 'F7.5*1.9MM O型圈', '个', NULL, '中江', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58150004, 'O型圈', 'F12*F8*2MM O型圈', '个', NULL, '中江', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58150005, 'O型圈', 'F19*1.5MM O型圈', '个', NULL, '中江', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58160001, '漆包线', 'QA0.055 2UEW 漆包线', '公斤', NULL, '一致', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58160002, '漆包线', 'QA0.06 2UEW 漆包线', '公斤', NULL, '一致', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58160003, '漆包线', 'QA0.07 2UEW 漆包线', '公斤', NULL, '一致', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58160004, '漆包线', 'QA0.08 2UEW 漆包线', '公斤', NULL, '一致', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58160005, '漆包线', 'QA0.09 2UEW 漆包线', '公斤', NULL, '一致', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58160006, '漆包线', 'QA0.10 2UEW 漆包线', '公斤', NULL, '健记', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58160007, '漆包线', 'QA0.11 2UEW 漆包线', '公斤', NULL, '健记', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58160008, '漆包线', 'QA0.12 2UEW 漆包线', '公斤', NULL, '健记', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58160009, '漆包线', 'QA0.13 2UEW 漆包线', '公斤', NULL, '健记', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58160010, '漆包线', 'QA0.14 2UEW 漆包线', '公斤', NULL, '健记', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58160011, '漆包线', 'QA0.15 2UEW 漆包线', '公斤', NULL, '健记', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58160012, '漆包线', 'QA0.16 2UEW 漆包线', '公斤', NULL, '健记', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58160013, '漆包线', 'QA0.17 2UEW 漆包线', '公斤', NULL, '健记', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58160014, '漆包线', 'QA0.18 2UEW 漆包线', '公斤', NULL, '健记', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58160015, '漆包线', 'QA0.19 2UEW 漆包线', '公斤', NULL, '健记', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58160016, '漆包线', 'QA0.20 2UEW 漆包线', '公斤', NULL, '健记', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58160017, '漆包线', 'QA0.21 2UEW 漆包线', '公斤', NULL, '健记', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58160018, '漆包线', 'QA0.22 2UEW 漆包线', '公斤', NULL, '健记', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58160019, '漆包线', 'QA0.23 2UEW 漆包线', '公斤', NULL, '健记', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58160020, '漆包线', 'QA0.24 2UEW 漆包线', '公斤', NULL, '健记', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58160021, '漆包线', 'QA0.25 2UEW 漆包线', '公斤', NULL, '健记', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58160022, '漆包线', 'QA0.26 2UEW 漆包线', '公斤', NULL, '健记', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58160023, '漆包线', 'QA0.27 2UEW 漆包线', '公斤', NULL, '健记', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58160024, '漆包线', 'QA0.28 2UEW 漆包线', '公斤', NULL, '健记', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58160025, '漆包线', 'QA0.42 2UEW 漆包线', '公斤', NULL, '健记', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58160026, '漆包线', 'QA0.21 2UEW H级/180 漆包线', '公斤', NULL, '环球', '环球', NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170001, '电源线', '电源线UL-1007#20红色', '米', NULL, '博宇', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170002, '电源线', '电源线UL-1007#20黑色', '米', NULL, '博宇', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170003, '电源线', '电源线UL-1007#20黄色', '米', NULL, '博宇', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170004, '电源线', '电源线UL-1007#22红色', '米', NULL, '博宇', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170005, '电源线', '电源线UL-1007#22黑色', '米', NULL, '博宇', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170006, '电源线', '电源线UL-1007#22黄色', '米', NULL, '博宇', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170007, '电源线', '电源线UL-1007#22蓝色', '米', NULL, '博宇', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170008, '电源线', '电源线UL-1332#24黑色', '米', NULL, '至和', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170009, '电源线', '电源线UL-1332#24白色', '米', NULL, '至和', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170010, '电源线', '电源线UL-1332#24棕色', '米', NULL, '至和', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170011, '电源线', '电源线UL-1332#24绿色', '米', NULL, '至和', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170012, '电源线', '电源线UL-1332#24黄色', '米', NULL, '至和', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170013, '电源线', '电源线UL-1332#24红色', '米', NULL, '至和', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170014, '电源线', '电源线UL-1332#24蓝色', '米', NULL, '至和', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170015, '电源线', '电源线UL-1332#22 60芯黑色', '米', NULL, '正贯', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170016, '电源线', '电源线UL-1332#26 黑色', '米', NULL, '科菱', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170017, '电源线', '电源线UL-1007#24红色', '米', NULL, '科菱', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170018, '电源线', '电源线UL-1007#24黑色', '米', NULL, '科菱', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170019, '电源线', '电源线UL-1007#26红色', '米', NULL, '科菱', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170020, '电源线', '电源线UL-1007#26白色', '米', NULL, '科菱', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170021, '电源线', '电源线UL-1007#26黄色', '米', NULL, '科菱', '博宇', NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170022, '电源线', '电源线UL-1007#26黑色', '米', NULL, '科菱', '博宇', NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170023, '电源线', '电源线UL-1569#24黑色', '米', NULL, '科菱', '博宇', NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170024, '电源线', '电源线UL-1569#24白色', '米', NULL, '科菱', '博宇', NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170025, '电源线', '电源线UL-3122#18#200°蓝色编织硅胶线', '米', NULL, '科菱', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170026, '电源线', '电源线UL-3122#18-200°红色编织硅胶线 ', '米', NULL, '科菱', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170027, '电源线', '电源线UL-1569#22黑色', '米', NULL, '科菱', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170028, '电源线', '电源线UL1015#18黄绿地线', '米', NULL, '博宇', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170029, '电源线', '电源线60227IEC08(RV-90)黑色', '米', NULL, '科菱', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170030, '电源线', '电源线60227IEC08(RV-90)黑色电源线(裸铜）25支', '米', NULL, '科菱', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170031, '电源线', '电源线UL-2468#26白色2P', '米', NULL, '博宇', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170032, '电源线', '电源线UL-2468#24白色5P', '米', NULL, '博宇', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170033, '电源线', '电源线UL-2468#26白色9P', '米', NULL, '博宇', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170034, '电源线', '电源线UL-2468#26白色5P', '米', NULL, '博宇', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170035, '电源线', '电源线UL-2468*22  红黑色并线', '米', NULL, '博宇', '科菱', NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170036, '电源线', '电源线UL-2678 AWG30黑色 并线', '米', NULL, '博耀', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170037, '电源线', '电源线UL-60227IEC08(RV-90)绿色电源线(裸铜）25支', '米', NULL, '科菱', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170038, '电源线', '电源线UL-1569#24红色', '米', NULL, NULL, NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170039, '电源线', '电源线UL-1569#24绿色', '米', NULL, NULL, NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170040, '电源线', '电源线UL-1007#24红色', '米', NULL, '新隆', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170041, '电源线', NULL, '米', NULL, NULL, NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170042, '电源线', '电源线UL-1332#24黑色（科菱）', '米', NULL, '科菱', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170043, '电源线', '电源线UL-1332#24黄色（科菱）', '米', NULL, '科菱', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170044, '电源线', '电源线UL-1332#24红色（科菱）', '米', NULL, '科菱', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58170045, '电源线', '电源线UL-1332#24蓝色（科菱）', '米', NULL, '科菱', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58180001, '胶带', '5MM*100M 蓝色玛拉胶带', '卷', NULL, NULL, NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58180002, '胶带', '7MM*100M 蓝色玛拉胶带', '卷', NULL, '靖阳', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58180003, '胶带', '9.5MM*100M 蓝色玛拉胶带', '卷', NULL, '靖阳', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58180004, '胶带', '10MM*100M 蓝色玛拉胶带', '卷', NULL, '靖阳', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58180005, '胶带', '10MM*150M 蓝色玛拉胶带', '卷', NULL, '靖阳', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58180006, '胶带', '10.5MM*100M 黄色玛拉胶带', '卷', NULL, '靖阳', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58180007, '胶带', '16MM*100M 黄色玛拉胶带', '卷', NULL, '靖阳', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58180008, '胶带', '16MM*100M 蓝色玛拉胶带', '卷', NULL, '靖阳', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58180009, '胶带', '20MM*100M 蓝色玛拉胶带', '卷', NULL, '靖阳', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58180010, '胶带', '21MM*100M 蓝色玛拉胶带', '卷', NULL, '靖阳', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58180011, '胶带', '25MM*100M 蓝玛拉胶带', '卷', NULL, '靖阳', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58180012, '胶带', '8.5MM*100M 绿色玛拉胶带', '卷', NULL, '靖阳', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58180013, '胶带', '19MM*30M 醋酸胶带', '卷', NULL, '靖阳', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58180014, '胶带', '21mm*30m 醋酸胶带', '卷', NULL, '靖阳', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58180015, '胶带', '24MM*30M 醋酸胶带', '卷', NULL, '靖阳', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58180016, '胶带', '29MM*30M  黑色醋酸胶带', '卷', NULL, '靖阳', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58180017, '胶带', '21MM*17MM 电工胶布', '卷', NULL, '靖阳', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58180018, '胶带', '10MM*50金手指胶带', '卷', NULL, '靖阳', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58180019, '胶带', '10MM*100M 黄色玛拉胶带', '卷', NULL, '靖阳', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58180020, '胶带', '9.5MM*100M 黄色玛拉胶带', '卷', NULL, '靖阳', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58180021, '胶带', '9.5MM*150M 黄色玛拉胶带', '卷', NULL, '靖阳', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58190001, '青稞纸', '15MM*12MM 青稞纸', '个', NULL, '新飞达', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58190002, '青稞纸', '17MM*18MM 青稞纸', '个', NULL, '新飞达', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58190003, '青稞纸', '22MM*26MM 青稞纸', '个', NULL, '新飞达', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58190004, '青稞纸', '121.6MM*30MM*0.2MM 青稞纸', '个', NULL, '新飞达', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58200001, '端子', '6.9MM*14.5MM 不锈铁端子', '个', NULL, '凯汇', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58200002, '端子', 'XH-T端子', '个', NULL, '博成', '亨利', NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58200003, '端子', 'XH-T端子(嘉得）', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58200004, '端子', 'VH-T端子', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58200005, '端子', 'VH-T端子（富华）', '个', NULL, '靖阳', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58200006, '端子', 'SM-TA端子（公）', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58200007, '端子', 'SM-TY端子（母）', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58200008, '端子', 'JC25端子（博成）', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58200009, '端子', 'JC25端子（快利）', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58200010, '端子', 'JC25端子(双成）', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58200011, '端子', 'JC20端子', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58200012, '端子', 'Z250端子中脚锁扣04*08', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58200013, '端子', 'HY-T端子', '个', NULL, '双成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58200014, '端子', '250直型碰焊端子', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58200015, '端子', 'PH-T端子', '个', NULL, '森特', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58200016, '端子', 'YL-1R（母）', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58200017, '端子', 'SCN端子', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58200018, '端子', '圆形碰焊端子（源穗）', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58200019, '端子', '旗形端子(凯斯）', '个', NULL, '信昇/雨乐', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58200020, '端子', '碰焊端子4X8X0.5( TT4000003-S）', '个', NULL, '力干', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58200021, '端子', 'SIN-1.8叉嘴端子', '个', NULL, '红成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58200022, '端子', 'XH-公端', '个', NULL, '红成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210001, '端子壳', 'XH-2Y 带扣 白色 端子壳', '个', NULL, '红成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210002, '端子壳', 'XHB-2Y带扣黑色端子壳', '个', NULL, '红成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210003, '端子壳', 'XHB-2Y带扣紫色端子壳', '个', NULL, '红成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210004, '端子壳', 'XH-2Y不带扣红色端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210005, '端子壳', 'XH-2Y不带扣黑色端子壳', '个', NULL, '红成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210006, '端子壳', 'XH-2Y不带扣白色端子壳', '个', NULL, '红成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210007, '端子壳', 'XH-3Y不带扣白色端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210008, '端子壳', 'XH-3Y不带扣蓝色端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210009, '端子壳', 'XH-3Y不带扣红色端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210010, '端子壳', 'XH-3Y带扣黑色端子壳', '个', NULL, '亨利', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210011, '端子壳', 'XH-4Y 带扣 白色端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210012, '端子壳', 'XHB-4Y不带扣端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210013, '端子壳', 'XH-4Y不带扣端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210014, '端子壳', 'XH-7Y带扣白色端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210015, '端子壳', 'XHB-6Y带扣端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210016, '端子壳', 'XHB-8Y带扣端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210017, '端子壳', 'XH-5Y不带扣白色端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210018, '端子壳', 'XHB-4Y 宽扣 白色 端子壳', '个', NULL, '红成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210019, '端子壳', 'XHB-9Y带扣白色端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210020, '端子壳', 'XHC-9Y不带扣黑色端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210021, '端子壳', 'VH-T-3Y带扣白色端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210022, '端子壳', 'VH-T-3Y带扣绿色端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210023, '端子壳', 'VH-T-3Y带扣绿色端子壳(富华）750°', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210024, '端子壳', 'VH-T-3Y带扣白色端子壳(富华）750°', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210025, '端子壳', 'VH-T-2Y带扣白色端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210026, '端子壳', 'VH-T-2Y带扣黑色端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210027, '端子壳', 'JC25-6P端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210028, '端子壳', 'JC25-2Y端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210029, '端子壳', 'JC25-3Y端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210030, '端子壳', 'JC25-4Y端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210031, '端子壳', 'JZ20-5Y端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210032, '端子壳', 'JZ20-3Y端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210033, '端子壳', 'JZ20 -2Y端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210034, '端子壳', 'JZ20-4Y端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210035, '端子壳', 'XH-2Y 带扣 蓝色端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210036, '端子壳', 'PH-2Y白色端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210037, '端子壳', 'PH-2Y不带扣蓝色端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210038, '端子壳', 'SM-2A带扣公端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210039, '端子壳', 'SM-2Y带扣母端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210040, '端子壳', 'SM-2A带扣公端子壳（蓝色公）', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210041, '端子壳', 'SM-4A带扣公端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210042, '端子壳', 'SM-4Y带扣黑色端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210043, '端子壳', 'SM-4Y带扣白色端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210044, '端子壳', 'SCN-2Y端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210045, '端子壳', 'SMR-03V-B黑色端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210046, '端子壳', 'HY-3Y带扣端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210047, '端子壳', 'YL-1R母端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210048, '端子壳', '端子壳XHS-2Y宽扣(白色）（5735）', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210049, '端子壳', 'SM-3Y带扣黑色端子壳', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58210050, '端子壳', 'XHB-2R空接', '个', NULL, '博成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58220001, 'E型片', 'H518-10 E型片', '个', NULL, '恒惠', '源穗', NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58220002, 'E型片', 'H735-13 E型片', '个', NULL, '恒惠', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58220003, 'E型片', 'H1057-14 E型片', '个', NULL, '恒惠', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58220004, 'E型片', 'H1058-13 E型片', '个', NULL, '源穗', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58220005, 'E型片', 'H8866-12 E型片', '个', NULL, '凯舜', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58220006, 'E型片', 'H8633-18 E型片', '个', NULL, '凯舜', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58220007, 'E型片', 'H523-10 E型片', '个', NULL, '恒惠', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58220008, 'E型片', 'H623-12 E型片', '个', NULL, '凯舜', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58220009, 'E型片', 'H626-13 E型片', '个', NULL, '恒惠', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58220010, 'E型片', 'H1057-13 E型片', '个', NULL, '恒惠', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58220011, 'E型片', 'H1057-14A E型片(25.7)', '个', NULL, '源穗', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58220012, 'E型片', 'H735-13A E型片', '个', NULL, '恒惠', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58220013, 'E型片', 'H623-11 E型片', '个', NULL, '源穗', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58220014, 'E型片', 'H25.7-11 E型片', '个', NULL, NULL, NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58230001, '螺母', 'H837-23 尼龙锁紧螺母', '个', NULL, '五金城', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58230002, '螺母', 'M3*4 镀锌自锁螺母', '个', NULL, '五金城', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58230003, '螺母', 'M3*4不锈钢 自锁螺母', '个', NULL, '五金城', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58240001, '吸塑盒', 'H1057-24 300*200*5MM 吸塑盒', '个', NULL, '飞启', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58240002, '吸塑盒', 'H1058-24 300*200*5MM 吸塑盒', '个', NULL, '飞启', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58240003, '吸塑盒', 'H837-24 300*200*7MM 吸塑盒', '个', NULL, '飞启', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58240004, '吸塑盒', 'H920 400MM*240MM*25MM 吸塑盒', '个', NULL, '飞启', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58250001, '纸箱', '310MM*220MM*190MM 纸箱', '个', NULL, '帅兴', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58250002, '纸箱', '310MM*220MM*135MM 纸箱', '个', NULL, '帅兴', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58250003, '纸箱', '306MM*270MM*20MM 纸箱', '个', NULL, '帅兴', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58250004, '纸箱', '300MM*210MM*5MM 隔板', '个', NULL, '帅兴', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58250005, '纸箱', '400MM*240MM*5MM 隔板', '个', NULL, '帅兴', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58250006, '纸箱', '420MM*250MM*200MM 纸箱', '个', NULL, '帅兴', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58270001, '螺钉', 'H920-27 圆头螺钉', '个', NULL, '蒙东', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58270002, '螺钉', 'H920-27 销钉', '个', NULL, '精艺', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58280001, '密封帽', 'H524-28 密封帽', NULL, NULL, '大观', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58290001, '阀座', 'H524-29 阀座', '个', NULL, '士诚', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58300001, 'PCB板', 'H837-9500 PCB板', '个', NULL, '明伦', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58310001, '锡条', '无铅锡条', '公斤', NULL, '中铖', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58320001, '吸磁片', 'H5403-32 吸磁片', '个', NULL, '金容', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58330001, '缓冲垫圈', 'HTX-8.1A12-1', '个', NULL, NULL, NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58340001, '美纹胶带', '8MM*33MM美纹胶', NULL, NULL, '靖阳', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58350001, '胶水', '黑色808液体硅胶胶水', '个', NULL, '五金成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58350002, '胶水', '螺纹胶277', '个', NULL, '五金成', NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58360001, '消音垫', 'F4X1.5 消音垫', NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0000);
INSERT INTO `material` VALUES (58360002, '消音垫', 'F2X1.5 消音垫', NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0000);

-- ----------------------------
-- Table structure for material_return
-- ----------------------------
DROP TABLE IF EXISTS `material_return`;
CREATE TABLE `material_return`  (
  `ReturnID` bigint(30) NOT NULL COMMENT '返库记录编号',
  `MaterialID` bigint(30) NULL DEFAULT NULL COMMENT '原材料编号',
  `Quantity` double(30, 4) NULL DEFAULT NULL COMMENT '返库材料数量',
  PRIMARY KEY (`ReturnID`) USING BTREE,
  INDEX `material_return_ibfk_1`(`MaterialID`) USING BTREE,
  CONSTRAINT `material_return_ibfk_1` FOREIGN KEY (`MaterialID`) REFERENCES `material` (`MaterialID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of material_return
-- ----------------------------

-- ----------------------------
-- Table structure for password
-- ----------------------------
DROP TABLE IF EXISTS `password`;
CREATE TABLE `password`  (
  `ID` int(3) NOT NULL COMMENT '编号',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '口令',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password
-- ----------------------------
INSERT INTO `password` VALUES (1, 'e10adc3949ba59abbe56e057f20f883e');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `ProductID` bigint(30) NOT NULL COMMENT '产品编号',
  `ProductName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品型号（名称）',
  `Type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ProductClientID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Stock` bigint(30) NULL DEFAULT 0 COMMENT '库存量',
  `Unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `ClientName01` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ClientName02` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ProductID`) USING BTREE,
  INDEX `product_ibfk_1`(`ClientName01`) USING BTREE,
  INDEX `ClientName02`(`ClientName02`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (59100001, 'H5728C', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100002, 'H5102-01', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100003, 'H5102-02', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100004, 'H5715', '电吸铁', '23100002866', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100005, 'H5006', '电吸铁', '23100003557', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100006, 'H5710', '电吸铁', '23100002965', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100007, 'H5015', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100008, 'H8301-3C', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100009, 'H7009-3', '电吸铁', '23100005497', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100010, 'H8160', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100011, 'H8301', '电吸铁', '23100000986', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100012, 'H8215', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100013, 'H8150', '电吸铁', '23100000993', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100014, 'H7001', '电吸铁', '23100001157', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100015, 'H8159-1', '电吸铁', '23100000972', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100016, 'H4000', '电吸铁', '23100001322', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100017, 'H8201', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100018, 'H1011', '电吸铁', '23100001466', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100019, 'H8583', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100020, 'H8172', '电吸铁', '23100001101', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100021, 'H8590', '电吸铁', '23100002671', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100022, 'H8211', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100023, 'H1049', '电吸铁', '23100003644', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100024, 'H7009-2', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100025, 'H5705', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100026, 'H8561-B', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100027, 'H1710', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100028, 'H1723-1', '电吸铁', '23100003636', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100029, 'H8586', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100030, 'H1025', '电吸铁', '23100002858', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100031, 'H8172AB', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100032, 'H5005-1', '电吸铁', '23100003303', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100033, 'H1715', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100034, 'H8268AB', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100035, 'H8268', '电吸铁', '23100002913', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100036, 'H5005-2', '电吸铁', '23100003304', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100037, 'H5009', '电吸铁', '23100004094', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100038, 'H5729', '电吸铁', '23100005279', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100039, 'H5015', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100040, 'H5731', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100041, 'H1723-2', '电吸铁', '23100004829', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100042, 'H8172', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100043, 'H4401', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100044, 'H4405', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100045, 'H8159-3', '电吸铁', '23100005255', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100046, 'H7001-2', '电吸铁', '23100002801', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100051, 'H8138', '电吸铁', '23100001073', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100052, '8216', '电吸铁', '23100000446', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100053, 'H8002', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100054, 'H8580', '电吸铁', '23100000995', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100055, 'H1033', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100056, 'H1056', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100057, 'H1735', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100058, 'H5700-1', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100059, 'H1018', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100060, 'H8523-1', '电吸铁', '23100001825', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100061, 'H5735-1', '电吸铁', '23100005219', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100062, 'H7401', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100063, 'H4001', '电吸铁', '23100001441', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100064, 'H8133ET-1', '电吸铁', '23100001265', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100065, 'H8149', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100066, 'H1008', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100067, 'H1018', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100068, 'H5703-1', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100069, 'H5703-2', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100070, 'H8209', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100071, 'H8883', '电吸铁', '23100001019', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100072, 'H5700-2', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100073, 'H8111', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100074, 'H1018A', '电吸铁', '23100001833', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100075, 'H8523-2', '电吸铁', '23100001826', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100076, 'H8133AB', '电吸铁', '23100002730', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100077, 'H8506', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100078, 'H7701', '电吸铁', '23100002176', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100079, 'H8091', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100080, 'H8573', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100081, 'H8519', '电吸铁', '23100000994', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100082, 'H8575', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100083, 'H8117', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100084, 'H1016', '电吸铁', '23100004346', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100085, 'H1016A', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100086, 'H1706', '电吸铁', '23100002058', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100087, 'H1412', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100088, 'H1019', '电吸铁', '23100002177', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100089, 'H4709', '电吸铁', '23100001781', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100090, 'H7009', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100091, 'H8095', '电吸铁', '23100003929', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100092, 'HY-127', '电吸铁', NULL, 0, NULL, '源穗', NULL);
INSERT INTO `product` VALUES (59100093, 'H8226-B', '电吸铁', '23100005434', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100094, 'H1418', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100095, 'H1065', '电吸铁', '23100005377', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100096, 'H5020-1', '电吸铁', '23100005379', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100097, 'H5020-2', '电吸铁', '23100005380', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100098, 'H5403', '电吸铁', '23100005383', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100099, 'HY-128', '电吸铁', NULL, 0, NULL, '源穗', NULL);
INSERT INTO `product` VALUES (59100100, 'H523-54', '电吸铁', '2401020000054', 0, NULL, '聚英', NULL);
INSERT INTO `product` VALUES (59100101, 'H523-64', '电吸铁', '2401020000064', 0, NULL, '聚英', NULL);
INSERT INTO `product` VALUES (59100102, 'H523-63', '电吸铁', '2401020000063', 0, NULL, '聚英', NULL);
INSERT INTO `product` VALUES (59100103, 'H1057', '电吸铁', '61823-0034', 0, NULL, '红盛/精亿', NULL);
INSERT INTO `product` VALUES (59100104, 'H1057-1300', '电吸铁', NULL, 0, NULL, '翰唐', NULL);
INSERT INTO `product` VALUES (59100105, 'H8633', '电吸铁', NULL, 0, NULL, '众智宝', NULL);
INSERT INTO `product` VALUES (59100106, 'H8580F', '电吸铁', NULL, 0, NULL, NULL, NULL);
INSERT INTO `product` VALUES (59100107, 'H8866-1', '电吸铁', NULL, 0, NULL, '众智宝', NULL);
INSERT INTO `product` VALUES (59100108, 'HA170', '电吸铁', '403010000411', 0, NULL, '小熊', NULL);
INSERT INTO `product` VALUES (59100109, 'H1058', '电吸铁', NULL, 0, NULL, '诚通冠', NULL);
INSERT INTO `product` VALUES (59100110, 'HSKT81', '电吸铁', NULL, 0, NULL, '凯斯', NULL);
INSERT INTO `product` VALUES (59100111, 'HL130', '电吸铁', '403010000391', 0, NULL, '小熊', NULL);
INSERT INTO `product` VALUES (59100112, 'H1059(HT038)', '电吸铁', '42413T038000', 0, NULL, '港成', NULL);
INSERT INTO `product` VALUES (59100113, 'H007-5', '电吸铁', '42413T007005', 0, NULL, '港成', NULL);
INSERT INTO `product` VALUES (59100114, 'H007-2', '电吸铁', '42413T007002', 0, NULL, '港成', NULL);
INSERT INTO `product` VALUES (59100115, 'H8226', '电吸铁', '23100005495', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100116, 'H8866-2', '电吸铁', NULL, 0, NULL, '众智宝', NULL);
INSERT INTO `product` VALUES (59100117, 'H8133ET-2', '电吸铁', '23100005494', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100118, 'H5735-2', '电吸铁', '23100005554', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100121, 'H1057-25.7', '电吸铁', '61823-0034', 0, NULL, '红盛/精亿', NULL);
INSERT INTO `product` VALUES (59100122, 'H8159', '电吸铁', '23100003075', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100123, 'H8091P', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59100124, 'H127-2', '电吸铁', NULL, 0, NULL, '源穗', NULL);
INSERT INTO `product` VALUES (59100125, 'H735-01', '电吸铁', NULL, 0, NULL, '凯舜', NULL);
INSERT INTO `product` VALUES (59100126, 'H007-4', '电吸铁', '42413T007004', 0, NULL, '港成', NULL);
INSERT INTO `product` VALUES (59100127, 'H1058-150', '电吸铁', NULL, 0, NULL, '毫米', NULL);
INSERT INTO `product` VALUES (59100128, 'H1058-300', '电吸铁', NULL, 0, NULL, '毫米', NULL);
INSERT INTO `product` VALUES (59100129, 'H1073', '电吸铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59200001, 'H4106(H12A22)', '电磁铁', NULL, 0, NULL, '科锐玛', NULL);
INSERT INTO `product` VALUES (59200002, 'HA310', '电磁铁', '1010053', 0, NULL, '康百事', NULL);
INSERT INTO `product` VALUES (59200003, 'HA1000', '电磁铁', '1010023', 0, NULL, '康百事', NULL);
INSERT INTO `product` VALUES (59200004, 'HB9500', '电磁铁', '813878', 0, NULL, '索奇', NULL);
INSERT INTO `product` VALUES (59200005, 'H420-40', '电磁铁', NULL, 0, NULL, '国宝', NULL);
INSERT INTO `product` VALUES (59200006, 'H9001', '电磁铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59200007, 'H12A24', '电磁铁', NULL, 0, NULL, NULL, NULL);
INSERT INTO `product` VALUES (59200008, 'H524', '电磁铁', NULL, 0, NULL, '中午', NULL);
INSERT INTO `product` VALUES (59200009, 'H315-50', NULL, NULL, 0, NULL, '国宝', NULL);
INSERT INTO `product` VALUES (59200019, 'H1888-B', '电磁铁', '1010212', 0, NULL, '康百事', NULL);
INSERT INTO `product` VALUES (59200020, 'H1888-A', '电磁铁', NULL, 0, NULL, '康百事', NULL);
INSERT INTO `product` VALUES (59200021, 'HCM1442', '电磁铁', '626040000278', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59200022, NULL, '电磁铁', NULL, 0, NULL, '杰灵', NULL);
INSERT INTO `product` VALUES (59200023, NULL, '电磁铁', NULL, 0, NULL, NULL, NULL);
INSERT INTO `product` VALUES (59200024, 'H9002', '电磁铁', '23100000306', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59200025, NULL, '电磁铁', NULL, 0, NULL, NULL, NULL);
INSERT INTO `product` VALUES (59200026, 'H1191-3C', '电磁铁', '23100005286', 0, NULL, '新宝3A', NULL);
INSERT INTO `product` VALUES (59200031, 'H1309-D', '电磁铁', '62604000001', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59200032, 'H1316', '电磁铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59200033, 'H1333-A', '电磁铁', '23100000722', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59200034, 'H1333-A-青', '电磁铁', '23100003413', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59200035, 'H1350-A-纤', '电磁铁', '23100002991', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59200036, 'H1350-A', '电磁铁', '23100000897', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59200037, 'H1350-高', '电磁铁', '23100001568', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59200038, 'H1333-VA', '电磁铁', '23100000895', 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59200039, 'H1358', '电磁铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59200088, 'HA632', '低压锁', NULL, 0, NULL, '索奇', NULL);
INSERT INTO `product` VALUES (59200089, 'HA633', '低压锁', '813911', 0, NULL, '索奇', NULL);
INSERT INTO `product` VALUES (59200090, 'H120L', '低压锁', NULL, 0, NULL, '川本', NULL);
INSERT INTO `product` VALUES (59200091, 'H110L', '低压锁', NULL, 0, NULL, '川本', NULL);
INSERT INTO `product` VALUES (59200092, 'H100C', '低压锁', NULL, 0, NULL, '川本', NULL);
INSERT INTO `product` VALUES (59200093, 'H100D上', '低压锁', NULL, 0, NULL, '川本', NULL);
INSERT INTO `product` VALUES (59200094, 'H18A55', '电磁铁', '17461100004684', 0, NULL, '诚通冠', NULL);
INSERT INTO `product` VALUES (59200095, 'H2520', '电磁铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59200096, 'H120C', '低压锁', NULL, 0, NULL, '川本', NULL);
INSERT INTO `product` VALUES (59200097, 'H100D下', '低压锁', NULL, 0, NULL, '川本', NULL);
INSERT INTO `product` VALUES (59200098, 'H1887', '电磁铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59200099, 'H4237', '低压锁', NULL, 0, NULL, '康宝', NULL);
INSERT INTO `product` VALUES (59200100, 'H6146', '低压锁', NULL, 0, NULL, '康宝', NULL);
INSERT INTO `product` VALUES (59200101, 'H6144', '低压锁', NULL, 0, NULL, '康宝', NULL);
INSERT INTO `product` VALUES (59200103, 'H1889', '电磁铁', NULL, 0, NULL, '美的', NULL);
INSERT INTO `product` VALUES (59200104, 'H420-210', '电磁铁', NULL, 0, NULL, '巨佳', NULL);
INSERT INTO `product` VALUES (59200105, 'H1701', '电磁铁', NULL, 0, NULL, '科锐玛', NULL);
INSERT INTO `product` VALUES (59200106, 'H3700', '电磁铁', NULL, 0, NULL, '新宝', NULL);
INSERT INTO `product` VALUES (59200107, NULL, '电磁铁', NULL, 0, NULL, '和美', NULL);

-- ----------------------------
-- Table structure for product_in
-- ----------------------------
DROP TABLE IF EXISTS `product_in`;
CREATE TABLE `product_in`  (
  `ProductInID` bigint(30) NOT NULL COMMENT '产品入库记录编号',
  `ProductID` bigint(30) NULL DEFAULT NULL COMMENT '产品编号',
  `AppraisalID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Quantity` bigint(30) NULL DEFAULT NULL COMMENT '产品数量',
  `Date` date NULL DEFAULT NULL COMMENT '入库时间',
  PRIMARY KEY (`ProductInID`) USING BTREE,
  INDEX `product_in_ibfk_1`(`ProductID`) USING BTREE,
  INDEX `AppraisalID`(`AppraisalID`) USING BTREE,
  CONSTRAINT `product_in_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `product_in_ibfk_2` FOREIGN KEY (`AppraisalID`) REFERENCES `appraisal` (`AppraisalID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_in
-- ----------------------------

-- ----------------------------
-- Table structure for sale
-- ----------------------------
DROP TABLE IF EXISTS `sale`;
CREATE TABLE `sale`  (
  `SaleID` bigint(30) NOT NULL COMMENT '销售表编号',
  `AppraisalID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评审表编号',
  `ProductID` bigint(30) NULL DEFAULT NULL COMMENT '产品编号',
  `Quantity` bigint(30) NULL DEFAULT NULL COMMENT '销售数量',
  `Date` date NULL DEFAULT NULL COMMENT '销售完成时间',
  PRIMARY KEY (`SaleID`) USING BTREE,
  INDEX `sale_ibfk_1`(`AppraisalID`) USING BTREE,
  INDEX `sale_ibfk_2`(`ProductID`) USING BTREE,
  CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`AppraisalID`) REFERENCES `appraisal` (`AppraisalID`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `sale_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale
-- ----------------------------

-- ----------------------------
-- Table structure for stock_in
-- ----------------------------
DROP TABLE IF EXISTS `stock_in`;
CREATE TABLE `stock_in`  (
  `PurchaseID` bigint(30) NOT NULL COMMENT '进货记录编号',
  `SupplierName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商编号',
  `MaterialID` bigint(30) NULL DEFAULT NULL COMMENT '物料编号',
  `Date` date NULL DEFAULT NULL COMMENT '进货时间',
  `Quantity` double(30, 4) NULL DEFAULT NULL COMMENT '进货数量',
  `Amount` double(30, 4) NULL DEFAULT NULL COMMENT '花费金额',
  PRIMARY KEY (`PurchaseID`) USING BTREE,
  INDEX `stock_in_ibfk_2`(`MaterialID`) USING BTREE,
  INDEX `SupplierID`(`SupplierName`) USING BTREE,
  CONSTRAINT `stock_in_ibfk_2` FOREIGN KEY (`MaterialID`) REFERENCES `material` (`MaterialID`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `stock_in_ibfk_3` FOREIGN KEY (`SupplierName`) REFERENCES `supplier` (`SupplierName`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_in
-- ----------------------------

-- ----------------------------
-- Table structure for stock_out
-- ----------------------------
DROP TABLE IF EXISTS `stock_out`;
CREATE TABLE `stock_out`  (
  `StockOutID` bigint(30) NOT NULL COMMENT '出库记录信息编号',
  `AppraisalID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单评审编号',
  `Datetime` date NULL DEFAULT NULL COMMENT '出库时间',
  PRIMARY KEY (`StockOutID`) USING BTREE,
  INDEX `stock_out_ibfk_1`(`AppraisalID`) USING BTREE,
  CONSTRAINT `stock_out_ibfk_1` FOREIGN KEY (`AppraisalID`) REFERENCES `appraisal` (`AppraisalID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_out
-- ----------------------------

-- ----------------------------
-- Table structure for stock_out_quantity
-- ----------------------------
DROP TABLE IF EXISTS `stock_out_quantity`;
CREATE TABLE `stock_out_quantity`  (
  `StockOutID` bigint(30) NOT NULL COMMENT '出库记录信息编号',
  `MaterialID` bigint(30) NOT NULL COMMENT '原材料编号',
  `Qty` double(30, 4) NULL DEFAULT NULL COMMENT '出库数量',
  PRIMARY KEY (`StockOutID`, `MaterialID`) USING BTREE,
  INDEX `MaterialID`(`MaterialID`) USING BTREE,
  CONSTRAINT `stock_out_quantity_ibfk_1` FOREIGN KEY (`StockOutID`) REFERENCES `stock_out` (`StockOutID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stock_out_quantity_ibfk_2` FOREIGN KEY (`MaterialID`) REFERENCES `material` (`MaterialID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_out_quantity
-- ----------------------------

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `SupplierID` bigint(30) NOT NULL AUTO_INCREMENT COMMENT '供应商编号',
  `SupplierName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商名称',
  PRIMARY KEY (`SupplierID`) USING BTREE,
  INDEX `SupplierName`(`SupplierName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1048 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (1040, '一致');
INSERT INTO `supplier` VALUES (1046, '中江');
INSERT INTO `supplier` VALUES (1045, '中铖');
INSERT INTO `supplier` VALUES (1035, '五金城');
INSERT INTO `supplier` VALUES (1034, '五金成');
INSERT INTO `supplier` VALUES (1011, '亨利');
INSERT INTO `supplier` VALUES (1038, '信昇/雨乐');
INSERT INTO `supplier` VALUES (1016, '健记');
INSERT INTO `supplier` VALUES (1021, '凯汇');
INSERT INTO `supplier` VALUES (1020, '凯河');
INSERT INTO `supplier` VALUES (1022, '凯舜');
INSERT INTO `supplier` VALUES (1005, '创新');
INSERT INTO `supplier` VALUES (1006, '创盈');
INSERT INTO `supplier` VALUES (1025, '力干');
INSERT INTO `supplier` VALUES (1003, '博宇');
INSERT INTO `supplier` VALUES (1001, '博成');
INSERT INTO `supplier` VALUES (1002, '博耀');
INSERT INTO `supplier` VALUES (1033, '双成');
INSERT INTO `supplier` VALUES (1015, '嘉宏建');
INSERT INTO `supplier` VALUES (1024, '坤联');
INSERT INTO `supplier` VALUES (1031, '士城');
INSERT INTO `supplier` VALUES (1030, '士诚');
INSERT INTO `supplier` VALUES (1007, '大观');
INSERT INTO `supplier` VALUES (1032, '帅兴');
INSERT INTO `supplier` VALUES (1009, '广进利');
INSERT INTO `supplier` VALUES (1047, '得雅电镀');
INSERT INTO `supplier` VALUES (1044, '志诚');
INSERT INTO `supplier` VALUES (1012, '恒惠');
INSERT INTO `supplier` VALUES (1037, '新隆');
INSERT INTO `supplier` VALUES (1036, '新飞达');
INSERT INTO `supplier` VALUES (1027, '明伦');
INSERT INTO `supplier` VALUES (1029, '森特');
INSERT INTO `supplier` VALUES (1042, '正贯');
INSERT INTO `supplier` VALUES (1028, '泉盛');
INSERT INTO `supplier` VALUES (1041, '源穗');
INSERT INTO `supplier` VALUES (1014, '环球');
INSERT INTO `supplier` VALUES (1023, '科菱');
INSERT INTO `supplier` VALUES (1018, '精艺');
INSERT INTO `supplier` VALUES (1013, '红成');
INSERT INTO `supplier` VALUES (1043, '至和');
INSERT INTO `supplier` VALUES (1026, '蒙东');
INSERT INTO `supplier` VALUES (1004, '诚发');
INSERT INTO `supplier` VALUES (1010, '豪欧');
INSERT INTO `supplier` VALUES (1017, '金容');
INSERT INTO `supplier` VALUES (1039, '雄森');
INSERT INTO `supplier` VALUES (1019, '靖阳');
INSERT INTO `supplier` VALUES (1008, '飞启');

SET FOREIGN_KEY_CHECKS = 1;
