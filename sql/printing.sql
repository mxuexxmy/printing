/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : printing

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 08/12/2020 11:26:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_order_day
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_day`;
CREATE TABLE `tb_order_day`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `stats_day` datetime(0) NULL DEFAULT NULL COMMENT '统计日期',
  `print_number` int(0) NULL DEFAULT NULL COMMENT '每日打印份数',
  `total_amount` double NULL DEFAULT NULL COMMENT '每日统计的费用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order_day
-- ----------------------------
INSERT INTO `tb_order_day` VALUES (4, '2020-12-07 00:00:00', 1, 2, '2020-12-07 23:03:07', '2020-12-07 23:03:07');
INSERT INTO `tb_order_day` VALUES (5, '2020-12-08 00:00:00', 11, 28.6, '2020-12-08 02:02:09', '2020-12-08 02:53:25');

-- ----------------------------
-- Table structure for tb_order_month
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_month`;
CREATE TABLE `tb_order_month`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `stats_month` datetime(0) NULL DEFAULT NULL COMMENT '统计月份',
  `print_number` int(0) NULL DEFAULT NULL COMMENT '月份数',
  `total_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '费用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '月记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order_month
-- ----------------------------
INSERT INTO `tb_order_month` VALUES (3, '2020-12-01 00:00:00', 12, '30.6', '2020-12-07 23:03:08', '2020-12-08 02:53:27');

-- ----------------------------
-- Table structure for tb_order_year
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_year`;
CREATE TABLE `tb_order_year`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `stats_year` datetime(0) NULL DEFAULT NULL COMMENT '统计年',
  `print_number` int(0) NULL DEFAULT NULL COMMENT '统计年打印的份数',
  `total_amount` double NULL DEFAULT NULL COMMENT '统计年费用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '年记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order_year
-- ----------------------------
INSERT INTO `tb_order_year` VALUES (2, '2020-01-01 00:00:00', 12, 30.6, '2020-12-07 23:03:09', '2020-12-08 02:53:27');

-- ----------------------------
-- Table structure for tb_print_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_print_order`;
CREATE TABLE `tb_print_order`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '打印人的名字',
  `user_qq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '打印人的QQ',
  `user_wxchat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '打印人的微信',
  `user_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '打印人的电话',
  `print_file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '打印的文件名',
  `prinf_number` int(0) NULL DEFAULT NULL COMMENT '打印的份数',
  `paper_number` int(0) NULL DEFAULT NULL COMMENT '打印的页数',
  `amount` double NULL DEFAULT NULL COMMENT '价格',
  `total_amount` double NULL DEFAULT NULL COMMENT '总的价格',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `order_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单状态',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地点',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '打印订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_print_order
-- ----------------------------
INSERT INTO `tb_print_order` VALUES (26, '李东', NULL, NULL, NULL, NULL, 1, 10, 0.2, 2, NULL, '否', NULL, '2020-12-07 22:59:45', '2020-12-07 22:59:45');
INSERT INTO `tb_print_order` VALUES (27, '李东', NULL, NULL, NULL, NULL, 10, 13, 0.2, 26, NULL, '否', NULL, '2020-12-08 00:28:37', '2020-12-08 00:28:37');
INSERT INTO `tb_print_order` VALUES (28, '李东', '1112', NULL, '111', '', 1, 13, 0.2, 2.6, '', '否', '', '2020-12-08 00:28:50', '2020-12-08 00:28:50');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `user_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `user_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '1为系统管理员，2为管理，3为用户',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '收货地址',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, '荣荣', 'e10adc3949ba59abbe56e057f20f883e', '14728655447', '1', NULL, '2020-12-08 01:18:08', '2020-12-08 01:18:11');
INSERT INTO `tb_user` VALUES (2, '龙兴', 'e10adc3949ba59abbe56e057f20f883e', '18744981143', '2', NULL, '2020-12-08 01:18:30', '2020-12-08 01:18:32');

SET FOREIGN_KEY_CHECKS = 1;
