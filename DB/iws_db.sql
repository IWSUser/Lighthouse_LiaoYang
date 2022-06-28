/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : iws_db

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 28/06/2022 16:31:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for m_demander
-- ----------------------------
DROP TABLE IF EXISTS `m_demander`;
CREATE TABLE `m_demander`  (
  `Id` int(0) NOT NULL AUTO_INCREMENT,
  `DemanderId` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '需求方编号',
  `CompanyName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '需求方企业名称',
  `CompanyAddress` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '需求方企业地址',
  `PostCode1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮政编号1',
  `PostCode2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮政编号2',
  `Website` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '企业网址',
  `NatureEnterprise` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '企业性质',
  `Tel` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `Fax` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '传真',
  `IsDelete` int(0) NOT NULL DEFAULT 0,
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `CreateTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UpdateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `UpdateTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `Remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '需求方基本信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for m_jurisdiction
-- ----------------------------
DROP TABLE IF EXISTS `m_jurisdiction`;
CREATE TABLE `m_jurisdiction`  (
  `JurisdictionId` int(0) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `JurisdictionLevel` int(0) NOT NULL COMMENT '权限层级',
  `ParentID` int(0) NOT NULL COMMENT '父级权限ID',
  `JurisdictionName` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限名称',
  `JurisdictionPath` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限路径',
  `Icon` tinyint(0) NULL DEFAULT 0 COMMENT '图标',
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `CreateTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `UpdateTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `IsDelete` tinyint(0) NULL DEFAULT 0 COMMENT '物理删除标志',
  PRIMARY KEY (`JurisdictionId`, `JurisdictionLevel`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_jurisdiction
-- ----------------------------
INSERT INTO `m_jurisdiction` VALUES (1, 1, 0, '主数据管理', '', 0, 'SYSTEM', '2022-06-27 15:46:19', 'SYSTEM', '2022-06-27 15:46:19', 0);
INSERT INTO `m_jurisdiction` VALUES (1, 2, 1, '车辆信息数据', '/car/carinfodata', 0, 'SYSTEM', '2022-06-27 15:46:19', 'SYSTEM', '2022-06-27 15:46:19', 0);
INSERT INTO `m_jurisdiction` VALUES (2, 1, 0, '入场申请', '', 0, 'SYSTEM', '2022-06-27 15:46:19', 'SYSTEM', '2022-06-27 15:46:19', 0);
INSERT INTO `m_jurisdiction` VALUES (2, 2, 1, '基本用户管理', '/user/usermanagement', 0, 'SYSTEM', '2022-06-27 15:46:19', 'SYSTEM', '2022-06-27 15:46:19', 0);
INSERT INTO `m_jurisdiction` VALUES (3, 1, 0, '称重流程管理', '', 0, 'SYSTEM', '2022-06-27 15:46:19', 'SYSTEM', '2022-06-27 15:46:19', 0);
INSERT INTO `m_jurisdiction` VALUES (3, 2, 1, '物料基本信息', '/material/materialdata', 0, 'SYSTEM', '2022-06-27 15:46:19', 'SYSTEM', '2022-06-27 15:46:19', 0);
INSERT INTO `m_jurisdiction` VALUES (4, 1, 0, '人脸识别门禁', '', 0, 'SYSTEM', '2022-06-27 15:46:20', 'SYSTEM', '2022-06-27 15:46:20', 0);
INSERT INTO `m_jurisdiction` VALUES (4, 2, 1, '系统参数设置', '/system/parameter', 0, 'SYSTEM', '2022-06-27 15:46:19', 'SYSTEM', '2022-06-27 15:46:19', 0);
INSERT INTO `m_jurisdiction` VALUES (5, 1, 0, '车牌识别门禁', '', 0, 'SYSTEM', '2022-06-27 15:46:20', 'SYSTEM', '2022-06-27 15:46:20', 0);
INSERT INTO `m_jurisdiction` VALUES (5, 2, 1, '地磅管理', '/wagon_balance/wagon_balance_data', 0, 'SYSTEM', '2022-06-27 15:46:19', 'SYSTEM', '2022-06-27 15:46:19', 0);
INSERT INTO `m_jurisdiction` VALUES (6, 2, 1, '权限管理', '/right/rightdata', 0, 'SYSTEM', '2022-06-27 15:46:19', 'SYSTEM', '2022-06-27 15:46:19', 0);
INSERT INTO `m_jurisdiction` VALUES (7, 2, 1, '角色管理', '/role/roledata', 0, 'SYSTEM', '2022-06-27 15:46:19', 'SYSTEM', '2022-06-27 15:46:19', 0);
INSERT INTO `m_jurisdiction` VALUES (8, 2, 1, '供应商管理', '/supplier/supplier_data', 0, 'SYSTEM', '2022-06-27 15:46:19', 'SYSTEM', '2022-06-27 15:46:19', 0);
INSERT INTO `m_jurisdiction` VALUES (9, 2, 1, '需求方管理', '/demander/demander_data', 0, 'SYSTEM', '2022-06-27 15:46:19', 'SYSTEM', '2022-06-27 15:46:19', 0);
INSERT INTO `m_jurisdiction` VALUES (10, 2, 2, '过磅申请', '/request/requestweighing', 0, 'SYSTEM', '2022-06-27 15:46:19', 'SYSTEM', '2022-06-27 15:46:19', 0);
INSERT INTO `m_jurisdiction` VALUES (11, 2, 2, '进场车辆申请审批', '/request/requestweighing/approve', 0, 'SYSTEM', '2022-06-27 15:46:19', 'SYSTEM', '2022-06-27 15:46:19', 0);
INSERT INTO `m_jurisdiction` VALUES (12, 2, 3, '车辆进场验证', '', 0, 'SYSTEM', '2022-06-27 15:46:19', 'SYSTEM', '2022-06-27 15:46:19', 0);
INSERT INTO `m_jurisdiction` VALUES (13, 2, 3, '排队数量管理', '', 0, 'SYSTEM', '2022-06-27 15:46:19', 'SYSTEM', '2022-06-27 15:46:19', 0);
INSERT INTO `m_jurisdiction` VALUES (14, 2, 3, '称重数据检验', '', 0, 'SYSTEM', '2022-06-27 15:46:19', 'SYSTEM', '2022-06-27 15:46:19', 0);
INSERT INTO `m_jurisdiction` VALUES (15, 2, 3, '称重结果下发', '', 0, 'SYSTEM', '2022-06-27 15:46:19', 'SYSTEM', '2022-06-27 15:46:19', 0);
INSERT INTO `m_jurisdiction` VALUES (16, 2, 3, '称重结果争议处理', '', 0, 'SYSTEM', '2022-06-27 15:46:20', 'SYSTEM', '2022-06-27 15:46:20', 0);
INSERT INTO `m_jurisdiction` VALUES (17, 2, 4, '设备管理', '', 0, 'SYSTEM', '2022-06-27 15:46:20', 'SYSTEM', '2022-06-27 15:46:20', 0);
INSERT INTO `m_jurisdiction` VALUES (18, 2, 4, '设备控制', '', 0, 'SYSTEM', '2022-06-27 15:46:20', 'SYSTEM', '2022-06-27 15:46:20', 0);
INSERT INTO `m_jurisdiction` VALUES (19, 2, 4, '人脸信息审核', '', 0, 'SYSTEM', '2022-06-27 15:46:20', 'SYSTEM', '2022-06-27 15:46:20', 0);
INSERT INTO `m_jurisdiction` VALUES (20, 2, 4, '人脸信息导入', '', 0, 'SYSTEM', '2022-06-27 15:46:20', 'SYSTEM', '2022-06-27 15:46:20', 0);
INSERT INTO `m_jurisdiction` VALUES (21, 2, 4, '人脸信息维护', '', 0, 'SYSTEM', '2022-06-27 15:46:20', 'SYSTEM', '2022-06-27 15:46:20', 0);
INSERT INTO `m_jurisdiction` VALUES (22, 2, 4, '黑名单设置', '', 0, 'SYSTEM', '2022-06-27 15:46:20', 'SYSTEM', '2022-06-27 15:46:20', 0);
INSERT INTO `m_jurisdiction` VALUES (23, 2, 4, '报表查询，导出', '', 0, 'SYSTEM', '2022-06-27 15:46:20', 'SYSTEM', '2022-06-27 15:46:20', 0);
INSERT INTO `m_jurisdiction` VALUES (24, 2, 5, '车道管理', '', 0, 'SYSTEM', '2022-06-27 15:46:20', 'SYSTEM', '2022-06-27 15:46:20', 0);
INSERT INTO `m_jurisdiction` VALUES (25, 2, 5, '车道控制', '', 0, 'SYSTEM', '2022-06-27 15:46:20', 'SYSTEM', '2022-06-27 15:46:20', 0);
INSERT INTO `m_jurisdiction` VALUES (26, 2, 5, '车道监控', '', 0, 'SYSTEM', '2022-06-27 15:46:20', 'SYSTEM', '2022-06-27 15:46:20', 0);
INSERT INTO `m_jurisdiction` VALUES (27, 2, 5, '黑白名单设置', '', 0, 'SYSTEM', '2022-06-27 15:46:20', 'SYSTEM', '2022-06-27 15:46:20', 0);
INSERT INTO `m_jurisdiction` VALUES (28, 2, 5, '报表查询、导出', '', 0, 'SYSTEM', '2022-06-27 15:46:20', 'SYSTEM', '2022-06-27 15:46:20', 0);

-- ----------------------------
-- Table structure for m_material
-- ----------------------------
DROP TABLE IF EXISTS `m_material`;
CREATE TABLE `m_material`  (
  `Id` int(0) NOT NULL AUTO_INCREMENT,
  `MaterialId` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物料编号',
  `MaterialName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物料名称',
  `MaterialEnglishName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物料英文名称',
  `SpecificationsModel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规格型号',
  `Material` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '材质',
  `MaterialKind` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物料类别',
  `Unit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '计量单位',
  `IsDelete` int(0) NOT NULL DEFAULT 0,
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `CreateTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UpdateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `UpdateTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `Remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '物料表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for m_role
-- ----------------------------
DROP TABLE IF EXISTS `m_role`;
CREATE TABLE `m_role`  (
  `RoleId` int(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `RoleName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `RoleDesc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色描述',
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `CreateTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `UpdateTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `IsDelete` tinyint(0) NULL DEFAULT 0 COMMENT '物理删除标志',
  PRIMARY KEY (`RoleId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_role
-- ----------------------------
INSERT INTO `m_role` VALUES (1, '部长', '负责公司日常业务', 'SYSTEM', '2022-06-27 15:47:47', 'SYSTEM', '2022-06-27 15:47:47', 0);
INSERT INTO `m_role` VALUES (2, '一般用户', '一般数据录入', 'SYSTEM', '2022-06-27 15:47:47', 'SYSTEM', '2022-06-27 15:47:47', 0);

-- ----------------------------
-- Table structure for m_role_jurisdiction
-- ----------------------------
DROP TABLE IF EXISTS `m_role_jurisdiction`;
CREATE TABLE `m_role_jurisdiction`  (
  `RoleId` int(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `JurisdictionId` int(0) NOT NULL COMMENT '权限ID',
  `JurisdictionLevel` int(0) NOT NULL COMMENT '权限ID',
  `ParentID` int(0) NOT NULL COMMENT '父级权限ID',
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `CreateTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `UpdateTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `IsDelete` tinyint(0) NULL DEFAULT 0 COMMENT '物理删除标志',
  PRIMARY KEY (`RoleId`, `JurisdictionId`, `JurisdictionLevel`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_role_jurisdiction
-- ----------------------------
INSERT INTO `m_role_jurisdiction` VALUES (1, 1, 1, 0, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 1, 2, 1, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 2, 1, 0, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 2, 2, 1, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 3, 1, 0, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 3, 2, 1, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 4, 1, 0, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 4, 2, 1, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 5, 1, 0, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 5, 2, 1, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 6, 2, 1, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 7, 2, 1, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 8, 2, 1, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 9, 2, 1, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 10, 2, 2, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 11, 2, 2, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 12, 2, 3, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 13, 2, 3, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 14, 2, 3, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 15, 2, 3, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 16, 2, 3, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 17, 2, 4, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 18, 2, 4, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 19, 2, 4, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 20, 2, 4, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 21, 2, 4, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 22, 2, 4, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 23, 2, 4, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 24, 2, 5, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 25, 2, 5, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 26, 2, 5, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 27, 2, 5, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (1, 28, 2, 5, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (2, 2, 1, 0, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (2, 10, 2, 2, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);
INSERT INTO `m_role_jurisdiction` VALUES (2, 11, 2, 2, 'SYSTEM', '2022-06-27 15:48:16', 'SYSTEM', '2022-06-27 15:48:16', 0);

-- ----------------------------
-- Table structure for m_supplier
-- ----------------------------
DROP TABLE IF EXISTS `m_supplier`;
CREATE TABLE `m_supplier`  (
  `Id` int(0) NOT NULL AUTO_INCREMENT,
  `SupplierId` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '供应商编号',
  `CompanyName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '供应商企业名称',
  `CompanyAddress` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '供应商企业地址',
  `PostCode1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮政编号1',
  `PostCode2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮政编号2',
  `Website` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '企业网址',
  `NatureEnterprise` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '企业性质',
  `Tel` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `Fax` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '传真',
  `IsDelete` int(0) NOT NULL DEFAULT 0,
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `CreateTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UpdateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `UpdateTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `Remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '供应商基本信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for m_user
-- ----------------------------
DROP TABLE IF EXISTS `m_user`;
CREATE TABLE `m_user`  (
  `Id` int(0) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `UserName` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名称',
  `Password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `RoleId` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色',
  `Telephone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '电话',
  `IdCard` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '身份证',
  `CompanyName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单位名称',
  `Age` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '年龄',
  `Sex` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '性别',
  `Email` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `IsDelete` int(0) NOT NULL DEFAULT 0,
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `CreateTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UpdateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `UpdateTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `Remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户基本信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_user
-- ----------------------------
INSERT INTO `m_user` VALUES (1, '1001', '张鹏宇1', '123', '1', '13610840161', '21021319830514301x', '物业', '39', '男', NULL, 0, NULL, '2022-06-23 14:01:03', NULL, '2022-06-23 14:01:03', NULL);
INSERT INTO `m_user` VALUES (2, '1002', '张鹏宇2', '123', '1', '13610840161', '21021319830514301x', '物业', '39', '男', NULL, 0, NULL, '2022-06-23 14:01:03', NULL, '2022-06-23 14:01:03', NULL);
INSERT INTO `m_user` VALUES (3, '1003', '张鹏宇3', '123', '1', '13610840161', '21021319830514301x', '物业', '39', '男', NULL, 0, NULL, '2022-06-23 14:01:03', NULL, '2022-06-23 14:01:03', NULL);
INSERT INTO `m_user` VALUES (4, '1004', '张鹏宇4', '123', '1', '13610840161', '21021319830514301x', '物业', '39', '男', NULL, 0, NULL, '2022-06-23 14:01:03', NULL, '2022-06-23 14:01:03', NULL);
INSERT INTO `m_user` VALUES (5, '1005', 'a ', 'a', 'a', 'a', 'a', 'a', 'a', 'a', NULL, 0, NULL, '2022-06-28 13:58:21', NULL, '2022-06-28 13:58:21', NULL);

-- ----------------------------
-- Table structure for m_vehicle
-- ----------------------------
DROP TABLE IF EXISTS `m_vehicle`;
CREATE TABLE `m_vehicle`  (
  `Id` int(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `VehicleNumber` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '车牌号码',
  `CompanyName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '经营企业名称',
  `BrandModel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '品牌型号',
  `Color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '车身颜色',
  `weight` double(10, 0) NULL DEFAULT NULL COMMENT '车身重量（公斤）',
  `FullLoadWeight` double(10, 0) NULL DEFAULT NULL COMMENT '满载重量（公斤）',
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `CreateTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `UpdateTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP,
  `Remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `IsDelete` int(0) NULL DEFAULT 0 COMMENT '物理删除标志',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '车辆基本信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_vehicle
-- ----------------------------
INSERT INTO `m_vehicle` VALUES (1, '辽B 11111', '大达运输', '东风', '红色', 5000, 6000, 'SYSTEM', '2022-06-27 15:49:33', 'SYSTEM', '2022-06-27 15:49:33', '新车，1000公里', 0);
INSERT INTO `m_vehicle` VALUES (2, '辽B 22222', '大达运输', '东风', '红色', 5000, 6000, 'SYSTEM', '2022-06-27 15:49:33', 'SYSTEM', '2022-06-27 15:49:33', '新车，1000公里', 0);
INSERT INTO `m_vehicle` VALUES (3, '辽B 33333', '大达运输', '东风', '红色', 5000, 6000, 'SYSTEM', '2022-06-27 15:49:33', 'SYSTEM', '2022-06-27 15:49:33', '新车，1000公里', 0);
INSERT INTO `m_vehicle` VALUES (4, '辽B 44444', '大达运输', '东风', '红色', 5000, 6000, 'SYSTEM', '2022-06-27 15:49:33', 'SYSTEM', '2022-06-27 15:49:33', '新车，1000公里', 0);
INSERT INTO `m_vehicle` VALUES (5, '辽B 55555', '大达运输', '东风', '红色', 5000, 6000, 'SYSTEM', '2022-06-27 15:49:33', 'SYSTEM', '2022-06-27 15:49:33', '新车，1000公里', 0);
INSERT INTO `m_vehicle` VALUES (6, '辽B 66666', '大达运输', '东风', '红色', 5000, 6000, 'SYSTEM', '2022-06-27 15:49:34', 'SYSTEM', '2022-06-27 15:49:34', '新车，1000公里', 0);
INSERT INTO `m_vehicle` VALUES (7, '辽B 77777', '大达运输', '东风', '红色', 5000, 6000, 'SYSTEM', '2022-06-27 15:49:34', 'SYSTEM', '2022-06-27 15:49:34', '新车，1000公里', 0);
INSERT INTO `m_vehicle` VALUES (8, '辽B 88888', '大达运输', '东风', '红色', 5000, 6000, 'SYSTEM', '2022-06-27 15:49:34', 'SYSTEM', '2022-06-27 15:49:34', '新车，1000公里', 0);
INSERT INTO `m_vehicle` VALUES (9, '辽B 99999', '大达运输', '东风', '红色', 5000, 6000, 'SYSTEM', '2022-06-27 15:49:34', 'SYSTEM', '2022-06-27 15:49:34', '新车，1000公里', 0);
INSERT INTO `m_vehicle` VALUES (10, '辽B 00000', '大达运输', '东风', '红色', 5000, 6000, 'SYSTEM', '2022-06-27 15:49:34', 'SYSTEM', '2022-06-27 15:49:34', '新车，1000公里', 0);
INSERT INTO `m_vehicle` VALUES (11, '辽B 01010', '大达运输', '东风', '红色', 5000, 6000, 'SYSTEM', '2022-06-27 15:49:34', 'SYSTEM', '2022-06-27 15:49:34', '新车，1000公里', 0);

-- ----------------------------
-- Table structure for t_approval
-- ----------------------------
DROP TABLE IF EXISTS `t_approval`;
CREATE TABLE `t_approval`  (
  `Id` int(0) NOT NULL AUTO_INCREMENT COMMENT '审批序号',
  `AdmisionType` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入场类型',
  `CompanyName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公司名称',
  `UserName` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入场人员',
  `VehicleNumber` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '车牌号',
  `EntranceGate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入场大门',
  `Accption` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '接受单位',
  `ApprovalState` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审批状态',
  `IsDelete` int(0) NOT NULL DEFAULT 0,
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `CreateTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UpdateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `UpdateTime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `Remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '入场审批' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_registration
-- ----------------------------
DROP TABLE IF EXISTS `t_registration`;
CREATE TABLE `t_registration`  (
  `Id` int(0) NOT NULL AUTO_INCREMENT COMMENT '入场序号',
  `CompanyId` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公司编号',
  `CompanyName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公司名称',
  `UserId` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '人员编号',
  `UserName` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '人员名称',
  `VehicleNumber` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '车牌号',
  `EntranceGate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入场大门',
  `EntranceDate` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入场日期',
  `EntranceTime` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入场时段',
  `Overseer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '监工单位',
  `Reason` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入场事由',
  `IsDelete` int(0) NOT NULL DEFAULT 0,
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `CreateTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UpdateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `UpdateTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `Remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '入场登记' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
