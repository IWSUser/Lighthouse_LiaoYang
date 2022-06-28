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

 Date: 17/06/2022 16:41:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for m_demander
-- ----------------------------
DROP TABLE IF EXISTS `m_demander`;
CREATE TABLE `m_demander`  (
  `DemanderId` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '需求方编号',
  `CompanyName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '需求方企业名称',
  `CompanyAddress` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '需求方企业地址',
  `PostCode1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮政编号1',
  `PostCode2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮政编号2',
  `Website` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '企业网址',
  `NatureEnterprise` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '企业性质',
  `Tel` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `Fax` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '传真',
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `CreateTime` TIMESTAMP COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NOW(),
  `UpdateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `UpdateTime` TIMESTAMP COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NOW(),
  `Remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `IsDelete` tinyint NULL DEFAULT 0 COMMENT '物理删除标志',
  PRIMARY KEY (`DemanderId`) USING BTREE
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
  `Icon` TINYINT NULL DEFAULT 0 COMMENT '图标',
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `CreateTime` TIMESTAMP COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NOW(),
  `UpdateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `UpdateTime` TIMESTAMP COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NOW(),
  `IsDelete` tinyint NULL DEFAULT 0 COMMENT '物理删除标志',
  PRIMARY KEY (`JurisdictionId`,`JurisdictionLevel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_jurisdiction
-- ----------------------------

INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('1', '1', '0', '主数据管理', '');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('1', '2', '1', '车辆信息数据', '/car/carinfodata');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('2', '2', '1', '基本用户管理', '/user/usermanagement');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('3', '2', '1', '物料基本信息', '/material/materialdata');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('4', '2', '1', '系统参数设置', '/system/parameter');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('5', '2', '1', '地磅管理', '/wagon_balance/wagon_balance_data');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('6', '2', '1', '权限管理', '/right/rightdata');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('7', '2', '1', '角色管理', '/role/roledata');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('8', '2', '1', '供应商管理', '/supplier/supplier_data');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('9', '2', '1', '需求方管理', '/demander/demander_data');


INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('2', '1', '0', '入场申请', '');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('10', '2', '2', '过磅申请', '/request/requestweighing');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('11', '2', '2', '进场车辆申请审批', '/request/requestweighing/approve');


INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('3', '1', '0', '称重流程管理', '');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('12', '2', '3', '车辆进场验证', '');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('13', '2', '3', '排队数量管理', '');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('14', '2', '3', '称重数据检验', '');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('15', '2', '3', '称重结果下发', '');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('16', '2', '3', '称重结果争议处理', '');

INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('4', '1', '0', '人脸识别门禁', '');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('17', '2', '4', '设备管理', '');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('18', '2', '4', '设备控制', '');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('19', '2', '4', '人脸信息审核', '');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('20', '2', '4', '人脸信息导入', '');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('21', '2', '4', '人脸信息维护', '');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('22', '2', '4', '黑名单设置', '');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('23', '2', '4', '报表查询，导出', '');


INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('5', '1', '0', '车牌识别门禁', '');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('24', '2', '5', '车道管理', '');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('25', '2', '5', '车道控制', '');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('26', '2', '5', '车道监控', '');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('27', '2', '5', '黑白名单设置', '');
INSERT INTO `iws_db`.`m_jurisdiction` (`JurisdictionId`, `JurisdictionLevel`, `ParentID`, `JurisdictionName`, `JurisdictionPath`) VALUES ('28', '2', '5', '报表查询、导出', '');

-- ----------------------------
-- Table structure for m_material
-- ----------------------------
DROP TABLE IF EXISTS `m_material`;
CREATE TABLE `m_material`  (
  `MaterialId` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物料编号',
  `MaterialName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '物料名称',
  `MaterialEnglishName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物料英文名称',
  `SpecificationsModel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规格型号',
  `Material` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '材质',
  `MaterialKind` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '物料类别',
  `Unit` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '计量单位',
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `CreateTime` TIMESTAMP COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NOW(),
  `UpdateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `UpdateTime` TIMESTAMP COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NOW(),
  `Remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `IsDelete` tinyint NULL DEFAULT 0 COMMENT '物理删除标志',
  PRIMARY KEY (`MaterialId`) USING BTREE
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
  `CreateTime`  TIMESTAMP COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NOW(),
  `UpdateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `UpdateTime`  TIMESTAMP COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NOW(),
  `IsDelete` tinyint NULL DEFAULT 0 COMMENT '物理删除标志',
  PRIMARY KEY (`RoleId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_role
-- ----------------------------
INSERT INTO `m_role` 
(RoleId, RoleName, RoleDesc)
VALUES 
(1, '部长', '负责公司日常业务');

INSERT INTO `m_role` 
(RoleId, RoleName, RoleDesc)
VALUES 
(2, '一般用户', '一般数据录入');

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
  `CreateTime`  TIMESTAMP COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NOW(),
  `UpdateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `UpdateTime`  TIMESTAMP COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NOW(),
  `IsDelete` tinyint NULL DEFAULT 0 COMMENT '物理删除标志',
  PRIMARY KEY (`RoleId`,`JurisdictionId`,`JurisdictionLevel`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_role_jurisdiction
-- ----------------------------
-- 添加部长权限,所有权限
insert into m_role_jurisdiction (RoleId, JurisdictionId, JurisdictionLevel, ParentID)
select 1, JurisdictionId, JurisdictionLevel, ParentID
from m_jurisdiction;

-- 添加一般员工权限,入场申请权限
insert into m_role_jurisdiction (RoleId, JurisdictionId, JurisdictionLevel, ParentID)
select 2, JurisdictionId, JurisdictionLevel, ParentID
from m_jurisdiction where jurisdictionlevel = 2 and ParentID = 2;

insert into m_role_jurisdiction (RoleId, JurisdictionId, JurisdictionLevel, ParentID)
select 2, JurisdictionId, JurisdictionLevel, ParentID
from m_jurisdiction where jurisdictionlevel = 1 and JurisdictionId = 2;

-- ----------------------------
-- Table structure for m_supplier
-- ----------------------------
DROP TABLE IF EXISTS `m_supplier`;
CREATE TABLE `m_supplier`  (
  `SupplierId` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '供应商编号',
  `CompanyName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '供应商企业名称',
  `CompanyAddress` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '供应商企业地址',
  `PostCode1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮政编号1',
  `PostCode2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮政编号2',
  `Website` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '企业网址',
  `NatureEnterprise` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '企业性质',
  `Tel` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `Fax` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '传真',
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `CreateTime` TIMESTAMP COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NOW(),
  `UpdateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `UpdateTime` TIMESTAMP COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NOW(),
  `Remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `IsDelete` tinyint NULL DEFAULT 0 COMMENT '物理删除标志',
  PRIMARY KEY (`SupplierId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '供应商基本信息' ROW_FORMAT = Dynamic;

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
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `CreateTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UpdateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `UpdateTime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `Remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`Id`, `UserId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户基本信息表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

-- ----------------------------
-- Records of m_user
-- ----------------------------
INSERT INTO `m_user` 
(UserId, UserName, Password, RoleId, Telephone, IdCard, CompanyName, Age, Sex, Email)
VALUES 
('10001', '张鹏宇', '12345', 1, '13610840161', '21021319830514301x', '无业', '39', '男', 'test@163.com');

-- ----------------------------
-- Table structure for m_vehicle
-- ----------------------------
DROP TABLE IF EXISTS `m_vehicle`;
CREATE TABLE `m_vehicle`  (
  `VehicleId` int(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `VehicleNumber` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '车牌号码',
  `CompanyName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '经营企业名称',
  `BrandModel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '品牌型号',
  `Color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '车身颜色',
  `weight` double(10, 0) NULL DEFAULT NULL COMMENT '车身重量（公斤）',
  `FullLoadWeight` double(10, 0) NULL DEFAULT NULL COMMENT '满载重量（公斤）',
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `CreateTime` TIMESTAMP COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NOW(),
  `UpdateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `UpdateTime` TIMESTAMP COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NOW(),
  `Remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `IsDelete` tinyint NULL DEFAULT 0 COMMENT '物理删除标志',
  PRIMARY KEY (`VehicleId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '车辆基本信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_vehicle
-- ----------------------------
INSERT INTO `m_vehicle` 
(VehicleNumber, CompanyName, BrandModel, Color, weight, FullLoadWeight, Remark)
VALUES 
('辽B 11111', '大达运输', '东风','红色' , '5000', '6000', '新车，1000公里');

INSERT INTO `m_vehicle` 
(VehicleNumber, CompanyName, BrandModel, Color, weight, FullLoadWeight, Remark)
VALUES 
('辽B 22222', '大达运输', '东风','红色' , '5000', '6000', '新车，1000公里');

INSERT INTO `m_vehicle` 
(VehicleNumber, CompanyName, BrandModel, Color, weight, FullLoadWeight, Remark)
VALUES 
('辽B 33333', '大达运输', '东风','红色' , '5000', '6000', '新车，1000公里');

INSERT INTO `m_vehicle` 
(VehicleNumber, CompanyName, BrandModel, Color, weight, FullLoadWeight, Remark)
VALUES 
('辽B 44444', '大达运输', '东风','红色' , '5000', '6000', '新车，1000公里');

INSERT INTO `m_vehicle` 
(VehicleNumber, CompanyName, BrandModel, Color, weight, FullLoadWeight, Remark)
VALUES 
('辽B 55555', '大达运输', '东风','红色' , '5000', '6000', '新车，1000公里');

INSERT INTO `m_vehicle` 
(VehicleNumber, CompanyName, BrandModel, Color, weight, FullLoadWeight, Remark)
VALUES 
('辽B 66666', '大达运输', '东风','红色' , '5000', '6000', '新车，1000公里');

INSERT INTO `m_vehicle` 
(VehicleNumber, CompanyName, BrandModel, Color, weight, FullLoadWeight, Remark)
VALUES 
('辽B 77777', '大达运输', '东风','红色' , '5000', '6000', '新车，1000公里');

INSERT INTO `m_vehicle` 
(VehicleNumber, CompanyName, BrandModel, Color, weight, FullLoadWeight, Remark)
VALUES 
('辽B 88888', '大达运输', '东风','红色' , '5000', '6000', '新车，1000公里');

INSERT INTO `m_vehicle` 
(VehicleNumber, CompanyName, BrandModel, Color, weight, FullLoadWeight, Remark)
VALUES 
('辽B 99999', '大达运输', '东风','红色' , '5000', '6000', '新车，1000公里');

INSERT INTO `m_vehicle` 
(VehicleNumber, CompanyName, BrandModel, Color, weight, FullLoadWeight, Remark)
VALUES 
('辽B 00000', '大达运输', '东风','红色' , '5000', '6000', '新车，1000公里');

INSERT INTO `m_vehicle` 
(VehicleNumber, CompanyName, BrandModel, Color, weight, FullLoadWeight, Remark)
VALUES 
('辽B 01010', '大达运输', '东风','红色' , '5000', '6000', '新车，1000公里');
-- ----------------------------
-- Table structure for t_approval
-- ----------------------------
DROP TABLE IF EXISTS `t_approval`;
CREATE TABLE `t_approval`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '审批序号',
  `AdmisionType` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入场类型',
  `CompanyName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公司名称',
  `UserName` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入场人员',
  `VehicleNumber` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '车牌号',
  `EntranceGate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入场大门',
  `Accption` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '接受单位',
  `ApprovalState` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审批状态',
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `CreateTime` TIMESTAMP COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NOW(),
  `UpdateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `UpdateTime` TIMESTAMP COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NOW(),
  `Remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `IsDelete` tinyint NULL DEFAULT 0 COMMENT '物理删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '入场审批' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_registration
-- ----------------------------
DROP TABLE IF EXISTS `t_registration`;
CREATE TABLE `t_registration`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '入场序号',
  `CompanyId` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公司编号',
  `CompanyName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公司名称',
  `UserId` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '人员编号',
  `UserName` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '人员名称',
  `VehicleNumber` varchar(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '车牌号',
  `EntranceGate` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入场大门',
  `EntranceDate` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入场日期',
  `EntranceTime` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入场时段',
  `Overseer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '监工单位',
  `Reason` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入场事由',
  `CreateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `CreateTime` TIMESTAMP COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NOW(),
  `UpdateUser` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'SYSTEM',
  `UpdateTime` TIMESTAMP COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NOW(),
  `Remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `IsDelete` tinyint NULL DEFAULT 0 COMMENT '物理删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
