/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云
 Source Server Type    : MySQL
 Source Server Version : 50173
 Source Host           : 120.79.233.52:3306
 Source Schema         : new-printing

 Target Server Type    : MySQL
 Target Server Version : 50173
 File Encoding         : 65001

 Date: 24/03/2021 07:44:10
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_account_book
-- ----------------------------
DROP TABLE IF EXISTS `tb_account_book`;
CREATE TABLE `tb_account_book`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `money` decimal(10, 2) NOT NULL COMMENT '金额',
  `categories_id` bigint(20) NOT NULL COMMENT '类别名id',
  `spend_type` int(255) NULL DEFAULT NULL COMMENT '消费类型：0支出，1收入',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_account_book
-- ----------------------------
INSERT INTO `tb_account_book` VALUES (2, 8.00, 2, 0, '', '2021-03-16 16:39:51', '2021-03-16 16:39:51');
INSERT INTO `tb_account_book` VALUES (3, 13.00, 2, 0, '吃饭饭', '2021-03-17 12:23:29', '2021-03-17 12:23:29');
INSERT INTO `tb_account_book` VALUES (4, 9.00, 2, 0, '买饺子和饭', '2021-03-17 18:23:53', '2021-03-17 18:23:53');
INSERT INTO `tb_account_book` VALUES (5, 15.00, 1, 0, '打印纸', '2021-03-17 20:29:43', '2021-03-17 20:29:43');
INSERT INTO `tb_account_book` VALUES (6, 7.00, 8, 0, '日历', '2021-03-17 20:42:27', '2021-03-17 20:42:27');
INSERT INTO `tb_account_book` VALUES (7, 7.00, 9, 0, '', '2021-03-17 20:44:17', '2021-03-17 20:44:17');
INSERT INTO `tb_account_book` VALUES (8, 5.00, 2, 0, '', '2021-03-18 11:51:49', '2021-03-18 11:51:49');
INSERT INTO `tb_account_book` VALUES (9, 2.00, 2, 0, '豆腐', '2021-03-18 18:27:01', '2021-03-18 18:27:01');
INSERT INTO `tb_account_book` VALUES (10, 7.00, 9, 0, '荣荣吃饭饭', '2021-03-18 20:21:09', '2021-03-18 20:21:09');
INSERT INTO `tb_account_book` VALUES (11, 9.00, 2, 0, '', '2021-03-19 12:21:29', '2021-03-19 12:21:29');
INSERT INTO `tb_account_book` VALUES (12, 95.00, 2, 0, '95', '2021-03-19 20:13:44', '2021-03-19 20:18:07');
INSERT INTO `tb_account_book` VALUES (13, 14.00, 2, 0, '辣椒面', '2021-03-19 23:16:44', '2021-03-19 23:16:44');
INSERT INTO `tb_account_book` VALUES (14, 4.00, 2, 0, '豆汤和白菜', '2021-03-20 12:25:07', '2021-03-20 12:25:07');
INSERT INTO `tb_account_book` VALUES (15, 30.00, 13, 0, '英语四级', '2021-03-20 18:07:07', '2021-03-20 18:07:07');
INSERT INTO `tb_account_book` VALUES (16, 1500.00, 14, 1, '兴武哥', '2021-03-20 18:29:10', '2021-03-20 18:29:10');
INSERT INTO `tb_account_book` VALUES (17, 620.04, 15, 0, '美团', '2021-03-20 18:46:18', '2021-03-20 18:46:39');
INSERT INTO `tb_account_book` VALUES (18, 140.89, 15, 0, '京东-金条', '2021-03-20 19:51:43', '2021-03-20 19:51:43');
INSERT INTO `tb_account_book` VALUES (19, 10.50, 2, 0, '', '2021-03-21 12:49:28', '2021-03-21 12:49:28');
INSERT INTO `tb_account_book` VALUES (20, 500.00, 16, 0, '补交房费', '2021-03-21 13:29:47', '2021-03-21 13:29:47');
INSERT INTO `tb_account_book` VALUES (21, 34.00, 17, 0, '一个', '2021-03-21 20:38:54', '2021-03-21 20:38:54');
INSERT INTO `tb_account_book` VALUES (22, 68.00, 4, 0, '两个', '2021-03-21 20:40:12', '2021-03-21 20:40:12');
INSERT INTO `tb_account_book` VALUES (23, 5.00, 18, 0, '从驾校打车回学校', '2021-03-21 20:44:54', '2021-03-21 20:44:54');
INSERT INTO `tb_account_book` VALUES (24, 4.00, 6, 0, '面筋4跟', '2021-03-21 20:45:40', '2021-03-21 20:45:40');
INSERT INTO `tb_account_book` VALUES (25, 5.00, 7, 0, '扫码充电', '2021-03-21 20:47:57', '2021-03-21 20:47:57');
INSERT INTO `tb_account_book` VALUES (26, 2.00, 20, 0, '空泉水', '2021-03-21 20:49:34', '2021-03-21 20:49:34');
INSERT INTO `tb_account_book` VALUES (27, 1.00, 2, 0, '买辣椒', '2021-03-21 20:50:04', '2021-03-21 20:50:04');
INSERT INTO `tb_account_book` VALUES (28, 5.00, 2, 0, '', '2021-03-22 11:56:47', '2021-03-22 11:56:47');
INSERT INTO `tb_account_book` VALUES (29, 300.00, 10, 1, '跟教练借来考科三的', '2021-03-22 18:18:22', '2021-03-22 18:18:22');
INSERT INTO `tb_account_book` VALUES (30, 280.00, 10, 0, '考科三', '2021-03-22 18:18:48', '2021-03-22 18:18:48');
INSERT INTO `tb_account_book` VALUES (31, 15.00, 18, 0, '打车去驾校考试', '2021-03-22 18:19:21', '2021-03-22 18:21:16');
INSERT INTO `tb_account_book` VALUES (32, 4.00, 18, 0, '坐驾校到学校的快四路公交车', '2021-03-22 18:20:05', '2021-03-22 18:21:25');
INSERT INTO `tb_account_book` VALUES (33, 7.00, 2, 0, '', '2021-03-22 18:39:02', '2021-03-22 18:39:02');
INSERT INTO `tb_account_book` VALUES (34, 4.00, 6, 0, '面筋', '2021-03-22 20:01:01', '2021-03-22 20:01:01');
INSERT INTO `tb_account_book` VALUES (35, 4.00, 9, 0, '饭', '2021-03-22 20:01:14', '2021-03-22 20:01:14');
INSERT INTO `tb_account_book` VALUES (36, 5.00, 9, 0, '早餐', '2021-03-23 09:09:31', '2021-03-23 09:09:31');
INSERT INTO `tb_account_book` VALUES (37, 3.50, 7, 0, '洗发水', '2021-03-23 09:09:51', '2021-03-23 09:09:51');
INSERT INTO `tb_account_book` VALUES (38, 2.00, 6, 0, '晚上买面筋，犒劳疲劳的自己', '2021-03-23 09:10:26', '2021-03-23 09:10:26');
INSERT INTO `tb_account_book` VALUES (39, 2.00, 2, 0, '', '2021-03-23 17:38:58', '2021-03-23 17:38:58');
INSERT INTO `tb_account_book` VALUES (40, 3.00, 2, 0, '', '2021-03-23 20:31:05', '2021-03-23 20:31:05');
INSERT INTO `tb_account_book` VALUES (41, 6.00, 9, 0, '', '2021-03-23 20:31:16', '2021-03-23 20:31:16');

-- ----------------------------
-- Table structure for tb_categories
-- ----------------------------
DROP TABLE IF EXISTS `tb_categories`;
CREATE TABLE `tb_categories`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类别名',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '账单分类类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_categories
-- ----------------------------
INSERT INTO `tb_categories` VALUES (1, 'A4纸', '打印使用', '2021-03-16 16:21:20', '2021-03-16 16:21:22');
INSERT INTO `tb_categories` VALUES (2, '买菜', '做饭吃', '2021-03-16 16:21:39', '2021-03-16 16:21:41');
INSERT INTO `tb_categories` VALUES (3, '卫生纸', '生活用品', '2021-03-16 16:22:13', '2021-03-16 16:22:16');
INSERT INTO `tb_categories` VALUES (4, '墨粉盒', '打印用的', '2021-03-17 13:00:46', '2021-03-17 13:00:46');
INSERT INTO `tb_categories` VALUES (5, '买衣服', '好看的衣服', '2021-03-17 20:30:02', '2021-03-17 20:30:02');
INSERT INTO `tb_categories` VALUES (6, '零食', '想吃吃', '2021-03-17 20:39:24', '2021-03-17 20:39:24');
INSERT INTO `tb_categories` VALUES (7, '生活用品', '各类生活用品', '2021-03-17 20:40:41', '2021-03-17 20:40:41');
INSERT INTO `tb_categories` VALUES (8, '学习用品', '各类学习工具', '2021-03-17 20:41:06', '2021-03-17 20:41:06');
INSERT INTO `tb_categories` VALUES (9, '吃饭', '在外就餐', '2021-03-17 20:43:59', '2021-03-17 20:43:59');
INSERT INTO `tb_categories` VALUES (10, '荣荣专属', '私人用品', '2021-03-17 20:44:58', '2021-03-17 20:44:58');
INSERT INTO `tb_categories` VALUES (11, '兴兴专属', '私人用品', '2021-03-17 20:45:18', '2021-03-17 20:45:18');
INSERT INTO `tb_categories` VALUES (12, '电话费', '手机电话费', '2021-03-17 20:46:43', '2021-03-17 20:46:43');
INSERT INTO `tb_categories` VALUES (13, '报名费', '各种各类考试报名费', '2021-03-20 18:05:13', '2021-03-20 18:05:13');
INSERT INTO `tb_categories` VALUES (14, '借钱', '万不得已', '2021-03-20 18:27:27', '2021-03-20 18:27:27');
INSERT INTO `tb_categories` VALUES (15, '还钱', '理所应当', '2021-03-20 18:27:43', '2021-03-20 18:27:43');
INSERT INTO `tb_categories` VALUES (16, '房租', '租房子', '2021-03-21 13:29:24', '2021-03-21 13:29:24');
INSERT INTO `tb_categories` VALUES (17, '硒鼓', '打印用的', '2021-03-21 20:38:40', '2021-03-21 20:38:40');
INSERT INTO `tb_categories` VALUES (18, '车费', '各种车费', '2021-03-21 20:43:06', '2021-03-21 20:43:06');
INSERT INTO `tb_categories` VALUES (19, '电费', '兴兴专属（家里交电费）', '2021-03-21 20:46:51', '2021-03-21 20:47:19');
INSERT INTO `tb_categories` VALUES (20, '饮料', '各种“水”', '2021-03-21 20:49:01', '2021-03-21 20:49:01');

-- ----------------------------
-- Table structure for tb_order_day
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_day`;
CREATE TABLE `tb_order_day`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stats_day` datetime NULL DEFAULT NULL COMMENT '统计日期',
  `printf_number` int(11) NULL DEFAULT NULL COMMENT '每日打印份数',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '每日统计的费用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日记录' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of tb_order_day
-- ----------------------------

-- ----------------------------
-- Table structure for tb_order_month
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_month`;
CREATE TABLE `tb_order_month`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stats_month` datetime NULL DEFAULT NULL COMMENT '统计月份',
  `printf_number` int(11) NULL DEFAULT NULL COMMENT '月份数',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '费用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '月记录' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of tb_order_month
-- ----------------------------

-- ----------------------------
-- Table structure for tb_order_year
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_year`;
CREATE TABLE `tb_order_year`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stats_year` datetime NULL DEFAULT NULL COMMENT '统计年',
  `printf_number` int(11) NULL DEFAULT NULL COMMENT '统计年打印的份数',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '统计年费用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '年记录' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of tb_order_year
-- ----------------------------

-- ----------------------------
-- Table structure for tb_print_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_print_order`;
CREATE TABLE `tb_print_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打印人的名字',
  `user_qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打印人的QQ',
  `user_wxchat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打印人的微信',
  `user_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打印人的电话',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '总的价格',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `order_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单状态：是否完成',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地点',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 252 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '打印订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_print_order
-- ----------------------------

-- ----------------------------
-- Table structure for tb_printf_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_printf_info`;
CREATE TABLE `tb_printf_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '打印订单ID',
  `amount` decimal(10, 2) NOT NULL COMMENT '打印一张的价格',
  `printf_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '打印的钱',
  `pages_number` int(11) NOT NULL COMMENT '打印的页数',
  `printf_number` int(11) NULL DEFAULT NULL COMMENT '打印的份数',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打印文件名',
  `single_double_sided` int(255) NOT NULL COMMENT '1是单面。2是双面',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '打印信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_printf_info
-- ----------------------------

-- ----------------------------
-- Table structure for tb_statistics
-- ----------------------------
DROP TABLE IF EXISTS `tb_statistics`;
CREATE TABLE `tb_statistics`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `statistics_time` datetime NULL DEFAULT NULL COMMENT '统计时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '统计盈亏每月' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of tb_statistics
-- ----------------------------
INSERT INTO `tb_statistics` VALUES (1, '2021-03-01 00:00:00', '2021-03-21 22:11:55', '2021-03-21 22:11:55');

-- ----------------------------
-- Table structure for tb_statistics_year
-- ----------------------------
DROP TABLE IF EXISTS `tb_statistics_year`;
CREATE TABLE `tb_statistics_year`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `statistics_time` datetime NULL DEFAULT NULL COMMENT '统计时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '统计盈亏每年' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of tb_statistics_year
-- ----------------------------
INSERT INTO `tb_statistics_year` VALUES (1, '2021-01-01 00:00:00', '2021-03-21 21:59:19', '2021-03-21 21:59:19');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `user_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `user_type` int(255) NULL DEFAULT NULL COMMENT '1为系统管理员，2为管理，3为用户',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1, '荣荣', 'e10adc3949ba59abbe56e057f20f883e', '14728655447', 1, '绣四—624', '2020-12-08 03:05:03', '2020-12-08 03:05:05');
INSERT INTO `tb_user` VALUES (2, '龙兴', 'e10adc3949ba59abbe56e057f20f883e', '18744981143', 2, '公二434', '2020-12-08 03:05:23', '2020-12-08 03:05:25');

SET FOREIGN_KEY_CHECKS = 1;
