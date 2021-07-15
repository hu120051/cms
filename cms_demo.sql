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

 Date: 13/07/2021 15:52:54
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appraisal
-- ----------------------------
INSERT INTO `appraisal` VALUES ('21-06/03', 50001, 10001, 20, 0, '2021-07-04');
INSERT INTO `appraisal` VALUES ('21-07/05', 50002, 10002, 600, 357, '2021-07-05');

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
INSERT INTO `client` VALUES (10001, 'Client1');
INSERT INTO `client` VALUES (10002, 'Client2_demo');
INSERT INTO `client` VALUES (10003, 'test');

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
INSERT INTO `ingredient` VALUES (50001, 200001, 23.6262);
INSERT INTO `ingredient` VALUES (50001, 200002, 1.6524);
INSERT INTO `ingredient` VALUES (50002, 200001, 62.5624);
INSERT INTO `ingredient` VALUES (50002, 200002, 3.2616);
INSERT INTO `ingredient` VALUES (50002, 200003, 1.0000);
INSERT INTO `ingredient` VALUES (50003, 200001, 12.5262);
INSERT INTO `ingredient` VALUES (50003, 200003, 2.6260);
INSERT INTO `ingredient` VALUES (50004, 200002, 12.5650);

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
  INDEX `SupplierName02`(`SupplierName02`) USING BTREE,
  INDEX `SupplierName03`(`SupplierName03`) USING BTREE,
  CONSTRAINT `material_ibfk_1` FOREIGN KEY (`SupplierName01`) REFERENCES `supplier` (`SupplierName`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `material_ibfk_2` FOREIGN KEY (`SupplierName02`) REFERENCES `supplier` (`SupplierName`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `material_ibfk_3` FOREIGN KEY (`SupplierName03`) REFERENCES `supplier` (`SupplierName`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES (200001, NULL, 'Material01', 'kg', 5.2340, NULL, NULL, NULL, 15041.0000, 10344.7366);
INSERT INTO `material` VALUES (200002, NULL, 'Material', 'mg', 56.2000, NULL, NULL, NULL, 15544.6161, 51556.6930);
INSERT INTO `material` VALUES (200003, NULL, 'test', '个', 12.1200, NULL, NULL, NULL, 6155.5860, 6149.1600);

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
  INDEX `ClientName02`(`ClientName02`) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`ClientName01`) REFERENCES `client` (`ClientName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`ClientName02`) REFERENCES `client` (`ClientName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (50001, 'Product01', NULL, NULL, 20, '个', NULL, NULL);
INSERT INTO `product` VALUES (50002, 'Product02', NULL, NULL, 10, '件', NULL, NULL);
INSERT INTO `product` VALUES (50003, 'Test', NULL, NULL, 0, 'test', NULL, NULL);
INSERT INTO `product` VALUES (50004, 'Product04', NULL, NULL, 0, '块', NULL, NULL);

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
INSERT INTO `product_in` VALUES (90001, 50001, '21-06/03', 20, '2021-07-04');
INSERT INTO `product_in` VALUES (90002, 50002, '21-07/05', 30, '2021-07-11');

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
INSERT INTO `sale` VALUES (60001, '21-06/03', 50001, 20, '2021-07-04');
INSERT INTO `sale` VALUES (60002, '21-07/05', 50002, 20, '2021-07-12');

-- ----------------------------
-- Table structure for stock_in
-- ----------------------------
DROP TABLE IF EXISTS `stock_in`;
CREATE TABLE `stock_in`  (
  `PurchaseID` bigint(30) NOT NULL COMMENT '进货记录编号',
  `SupplierID` bigint(30) NULL DEFAULT NULL COMMENT '供应商编号',
  `MaterialID` bigint(30) NULL DEFAULT NULL COMMENT '物料编号',
  `Date` date NULL DEFAULT NULL COMMENT '进货时间',
  `Quantity` double(30, 4) NULL DEFAULT NULL COMMENT '进货数量',
  `Amount` double(30, 4) NULL DEFAULT NULL COMMENT '花费金额',
  PRIMARY KEY (`PurchaseID`) USING BTREE,
  INDEX `stock_in_ibfk_1`(`SupplierID`) USING BTREE,
  INDEX `stock_in_ibfk_2`(`MaterialID`) USING BTREE,
  CONSTRAINT `stock_in_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `stock_in_ibfk_2` FOREIGN KEY (`MaterialID`) REFERENCES `material` (`MaterialID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock_in
-- ----------------------------
INSERT INTO `stock_in` VALUES (40001, 100001, 200001, '2021-07-04', 50.2152, 165125.2340);
INSERT INTO `stock_in` VALUES (40002, 100002, 200002, '2021-07-04', 236.3000, 2000.0000);
INSERT INTO `stock_in` VALUES (40003, 100001, 200002, '2021-07-05', 23.6420, 200.6210);
INSERT INTO `stock_in` VALUES (40004, 100001, 200002, '2021-07-05', 23.6640, 200.7950);
INSERT INTO `stock_in` VALUES (40005, 100002, 200003, '2021-07-05', 5260.0260, 905.5000);
INSERT INTO `stock_in` VALUES (40006, 100001, 200003, '2021-07-06', 1.0000, 20.0000);
INSERT INTO `stock_in` VALUES (40007, 100001, 200002, '2021-07-06', 1.9999, 136.1000);
INSERT INTO `stock_in` VALUES (40008, 100001, 200001, '2021-07-06', 12.6631, 52.2600);
INSERT INTO `stock_in` VALUES (40009, 100002, 200002, '2021-07-06', 56.3000, 23.3000);
INSERT INTO `stock_in` VALUES (40010, 100001, 200003, '2021-07-06', 923.5600, 565.6600);
INSERT INTO `stock_in` VALUES (40011, 100001, 200001, '2021-07-06', 52.6000, 113.6500);

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
INSERT INTO `stock_out` VALUES (51361, '21-07/05', '2021-07-12');
INSERT INTO `stock_out` VALUES (80001, '21-06/03', '2021-07-06');
INSERT INTO `stock_out` VALUES (80002, '21-06/03', '2021-07-10');
INSERT INTO `stock_out` VALUES (80003, '21-06/03', '2021-07-11');
INSERT INTO `stock_out` VALUES (80004, '21-07/05', '2021-07-10');
INSERT INTO `stock_out` VALUES (80005, '21-07/05', '2021-07-12');
INSERT INTO `stock_out` VALUES (80006, '21-07/05', '2021-07-12');
INSERT INTO `stock_out` VALUES (80007, '21-07/05', '2021-07-13');
INSERT INTO `stock_out` VALUES (80008, '21-07/05', '2021-07-13');

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
INSERT INTO `stock_out_quantity` VALUES (51361, 200001, 1.0000);
INSERT INTO `stock_out_quantity` VALUES (51361, 200002, 1.0000);
INSERT INTO `stock_out_quantity` VALUES (51361, 200003, 2.0000);
INSERT INTO `stock_out_quantity` VALUES (80001, 200001, 23.4562);
INSERT INTO `stock_out_quantity` VALUES (80001, 200002, 1.6524);
INSERT INTO `stock_out_quantity` VALUES (80002, 200001, 469.0000);
INSERT INTO `stock_out_quantity` VALUES (80002, 200002, 33.0000);
INSERT INTO `stock_out_quantity` VALUES (80003, 200001, 266.0000);
INSERT INTO `stock_out_quantity` VALUES (80003, 200002, 5.2999);
INSERT INTO `stock_out_quantity` VALUES (80004, 200001, 812.0000);
INSERT INTO `stock_out_quantity` VALUES (80004, 200002, 215.0000);
INSERT INTO `stock_out_quantity` VALUES (80004, 200003, 12.0000);
INSERT INTO `stock_out_quantity` VALUES (80005, 200001, 1.0000);
INSERT INTO `stock_out_quantity` VALUES (80005, 200002, 1.0000);
INSERT INTO `stock_out_quantity` VALUES (80006, 200001, 1.0000);
INSERT INTO `stock_out_quantity` VALUES (80006, 200003, 3.0000);
INSERT INTO `stock_out_quantity` VALUES (80007, 200001, 12.0000);
INSERT INTO `stock_out_quantity` VALUES (80007, 200002, 12.0000);
INSERT INTO `stock_out_quantity` VALUES (80008, 200001, 12.0000);
INSERT INTO `stock_out_quantity` VALUES (80008, 200002, 12.0000);
INSERT INTO `stock_out_quantity` VALUES (80008, 200003, 12.0000);

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `SupplierID` bigint(30) NOT NULL COMMENT '供应商编号',
  `SupplierName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商名称',
  PRIMARY KEY (`SupplierID`) USING BTREE,
  INDEX `SupplierName`(`SupplierName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (100001, 'Supplier01');
INSERT INTO `supplier` VALUES (100002, 'Supplier02');
INSERT INTO `supplier` VALUES (100003, 'test');

SET FOREIGN_KEY_CHECKS = 1;
