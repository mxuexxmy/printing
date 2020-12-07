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

 Date: 07/12/2020 17:05:06
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

SET FOREIGN_KEY_CHECKS = 1;
