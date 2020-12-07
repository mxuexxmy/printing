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

 Date: 07/12/2020 11:30:49
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order_day
-- ----------------------------
INSERT INTO `tb_order_day` VALUES (3, '2020-12-07 00:00:00', 22, 95.6, '2020-12-07 10:33:52', '2020-12-07 10:34:46');

-- ----------------------------
-- Table structure for tb_order_month
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_month`;
CREATE TABLE `tb_order_month`  (
  `id` bigint(0) NOT NULL,
  `stats_month` datetime(0) NULL DEFAULT NULL COMMENT '统计月份',
  `print_number` int(0) NULL DEFAULT NULL COMMENT '统计每月打印份数',
  `total_amount` double NULL DEFAULT NULL COMMENT '统计每月的钱',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '月记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order_month
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '年记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order_year
-- ----------------------------

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
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地点',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '打印订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_print_order
-- ----------------------------
INSERT INTO `tb_print_order` VALUES (1, '龙兴', '11', NULL, '18744981143', '是地地道道', 1, 2, 0.2, 0.4, '测试', '创业园', '2020-12-06 22:32:08', NULL);
INSERT INTO `tb_print_order` VALUES (2, '龙兴', '1980718921', NULL, '18744981143', '地地道道', 1, 10, 0.2, 2, '测试', '创业园', '2020-12-06 22:33:15', NULL);
INSERT INTO `tb_print_order` VALUES (3, '', '', NULL, '', '', 2, 20, 0.2, 8, '', '', '2020-12-06 22:37:24', NULL);
INSERT INTO `tb_print_order` VALUES (4, '', '', NULL, '', '', 2, 10, 0.2, 4, '', '', '2020-12-06 22:38:59', NULL);
INSERT INTO `tb_print_order` VALUES (5, '', '', NULL, '', '', 2, 2, 2, 8, '22', '', '2020-12-07 00:45:06', '2020-12-07 00:45:06');
INSERT INTO `tb_print_order` VALUES (6, '', '', NULL, '', '', 2, 10, 0.2, 4, '', '', '2020-12-07 00:45:43', '2020-12-07 00:45:43');
INSERT INTO `tb_print_order` VALUES (7, '', '', NULL, '', '', 2, 10, 0.2, 4, '', '', '2020-12-07 00:45:51', '2020-12-07 00:45:51');
INSERT INTO `tb_print_order` VALUES (8, '', '', NULL, '', '', 1, 2, 0.2, 0.4, '', '', '2020-12-07 00:46:14', '2020-12-07 00:46:14');
INSERT INTO `tb_print_order` VALUES (9, '', '', NULL, '', '', 1, 2, 0.2, 0.4, '', '', '2020-12-07 00:46:55', '2020-12-07 00:46:55');
INSERT INTO `tb_print_order` VALUES (10, '', '', NULL, '', '', 2, 10, 0.2, 4, '', '', '2020-12-07 00:48:11', '2020-12-07 00:48:11');
INSERT INTO `tb_print_order` VALUES (11, '', '', NULL, '', '', 1, 10, 2, 20, '', '', '2020-12-07 00:48:17', '2020-12-07 00:48:17');
INSERT INTO `tb_print_order` VALUES (12, '', '', NULL, '', '', 1, 10, 0.2, 2, '', '', '2020-12-07 00:53:32', '2020-12-07 00:53:32');
INSERT INTO `tb_print_order` VALUES (13, '', '', NULL, '', '', 2, 22, 0.2, 8.8, '', '', '2020-12-07 00:53:39', '2020-12-07 00:53:39');
INSERT INTO `tb_print_order` VALUES (14, '', '', NULL, '', '', 1, 2, 0.2, 0.4, '', '', '2020-12-07 01:33:45', '2020-12-07 01:33:45');
INSERT INTO `tb_print_order` VALUES (15, NULL, NULL, NULL, NULL, NULL, 2, 2, 0.2, 0.8, NULL, NULL, '2020-12-07 01:45:48', '2020-12-07 01:45:48');
INSERT INTO `tb_print_order` VALUES (16, NULL, NULL, NULL, NULL, NULL, 1, 10, 0.2, 2, NULL, NULL, '2020-12-07 01:50:40', '2020-12-07 01:50:40');
INSERT INTO `tb_print_order` VALUES (17, NULL, NULL, NULL, NULL, NULL, 1, 2, 0.2, 0.4, NULL, NULL, '2020-12-07 02:05:55', '2020-12-07 02:05:55');
INSERT INTO `tb_print_order` VALUES (18, NULL, NULL, NULL, NULL, NULL, 1, 2, 0.2, 0.4, NULL, NULL, '2020-12-07 02:14:31', '2020-12-07 02:14:31');
INSERT INTO `tb_print_order` VALUES (19, NULL, NULL, NULL, NULL, NULL, 2, 100, 0.2, 40, NULL, NULL, '2020-12-07 03:05:09', '2020-12-07 03:05:09');

SET FOREIGN_KEY_CHECKS = 1;
