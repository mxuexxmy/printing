/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云
 Source Server Type    : MySQL
 Source Server Version : 50173
 Source Host           : 120.79.233.52:3306
 Source Schema         : printing

 Target Server Type    : MySQL
 Target Server Version : 50173
 File Encoding         : 65001

 Date: 24/03/2021 07:43:52
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
INSERT INTO `tb_order_day` VALUES (2, '2020-12-07 00:00:00', 33, 101.00, '2020-12-07 21:37:44', '2020-12-17 07:16:17');
INSERT INTO `tb_order_day` VALUES (3, '2020-12-08 00:00:00', 10, 24.00, '2020-12-08 00:11:11', '2020-12-09 00:10:00');
INSERT INTO `tb_order_day` VALUES (4, '2020-12-09 00:00:00', 9, 28.00, '2020-12-09 00:10:00', '2020-12-10 00:10:00');
INSERT INTO `tb_order_day` VALUES (5, '2020-12-10 00:00:00', 61, 128.00, '2020-12-10 00:00:00', '2020-12-11 08:46:49');
INSERT INTO `tb_order_day` VALUES (6, '2020-12-11 00:00:00', 9, 4.00, '2020-12-11 00:00:00', '2020-12-12 14:12:01');
INSERT INTO `tb_order_day` VALUES (7, '2020-12-12 00:00:00', 1, 5.00, '2020-12-12 00:00:00', '2020-12-13 00:10:00');
INSERT INTO `tb_order_day` VALUES (8, '2020-12-13 00:00:00', 11, 55.00, '2020-12-13 00:00:00', '2020-12-16 22:39:27');
INSERT INTO `tb_order_day` VALUES (9, '2020-12-14 00:00:00', 2, 27.00, '2020-12-14 00:00:00', '2020-12-16 22:39:26');
INSERT INTO `tb_order_day` VALUES (10, '2020-12-15 00:00:00', 6, 11.00, '2020-12-15 00:00:00', '2020-12-17 11:15:30');
INSERT INTO `tb_order_day` VALUES (11, '2020-12-16 00:00:00', 23, 67.00, '2020-12-16 00:00:00', '2020-12-17 11:15:29');
INSERT INTO `tb_order_day` VALUES (12, '2020-12-17 00:00:00', 8, 27.00, '2020-12-17 00:00:00', '2020-12-18 00:10:00');
INSERT INTO `tb_order_day` VALUES (13, '2020-12-18 00:00:00', 5, 21.00, '2020-12-18 00:00:00', '2020-12-19 00:10:00');
INSERT INTO `tb_order_day` VALUES (14, '2020-12-19 00:00:00', 1, 2.00, '2020-12-19 00:00:00', '2020-12-20 00:10:00');
INSERT INTO `tb_order_day` VALUES (15, '2020-12-20 00:00:00', 8, 47.00, '2020-12-20 00:00:00', '2020-12-21 00:10:00');
INSERT INTO `tb_order_day` VALUES (16, '2020-12-21 00:00:00', 15, 74.00, '2020-12-21 00:00:00', '2020-12-22 00:10:00');
INSERT INTO `tb_order_day` VALUES (17, '2020-12-22 00:00:00', 30, 151.00, '2020-12-22 00:00:00', '2020-12-23 09:12:51');
INSERT INTO `tb_order_day` VALUES (18, '2020-12-23 00:00:00', 25, 63.00, '2020-12-23 00:00:00', '2020-12-24 12:09:46');
INSERT INTO `tb_order_day` VALUES (19, '2020-12-24 00:00:00', 16, 80.00, '2020-12-24 00:00:00', '2020-12-25 00:10:00');
INSERT INTO `tb_order_day` VALUES (20, '2020-12-25 00:00:00', 0, 0.00, '2020-12-25 00:00:00', '2020-12-26 15:46:21');
INSERT INTO `tb_order_day` VALUES (21, '2020-12-26 00:00:00', 11, 32.00, '2020-12-26 00:00:00', '2020-12-27 00:10:00');
INSERT INTO `tb_order_day` VALUES (22, '2020-12-27 00:00:00', 0, 0.00, '2020-12-27 00:00:00', '2020-12-28 00:10:00');
INSERT INTO `tb_order_day` VALUES (23, '2020-12-28 00:00:00', 0, 0.00, '2020-12-28 00:00:00', '2020-12-29 20:02:11');
INSERT INTO `tb_order_day` VALUES (24, '2020-12-29 00:00:00', 8, 40.00, '2020-12-29 00:00:00', '2020-12-30 00:10:00');
INSERT INTO `tb_order_day` VALUES (25, '2020-12-30 00:00:00', 5, 44.00, '2020-12-30 00:00:00', '2020-12-31 00:10:00');
INSERT INTO `tb_order_day` VALUES (26, '2020-12-31 00:00:00', 1, 35.00, '2020-12-31 00:00:00', '2021-01-01 00:10:00');
INSERT INTO `tb_order_day` VALUES (27, '2021-01-01 00:00:00', 0, 0.00, '2021-01-01 00:00:00', '2021-01-02 00:10:00');
INSERT INTO `tb_order_day` VALUES (28, '2021-01-02 00:00:00', 0, 0.00, '2021-01-02 00:00:00', '2021-01-03 00:10:00');
INSERT INTO `tb_order_day` VALUES (29, '2021-01-03 00:00:00', 3, 66.00, '2021-01-03 00:00:00', '2021-01-04 00:10:00');
INSERT INTO `tb_order_day` VALUES (30, '2021-01-04 00:00:00', 1, 17.00, '2021-01-04 00:00:00', '2021-01-05 00:10:00');
INSERT INTO `tb_order_day` VALUES (31, '2021-01-05 00:00:00', 2, 35.00, '2021-01-05 00:00:00', '2021-01-06 00:10:00');
INSERT INTO `tb_order_day` VALUES (32, '2021-01-06 00:00:00', 2, 27.00, '2021-01-06 00:00:00', '2021-01-07 00:10:00');
INSERT INTO `tb_order_day` VALUES (33, '2021-01-07 00:00:00', 0, 0.00, '2021-01-07 00:00:00', '2021-01-08 00:10:00');
INSERT INTO `tb_order_day` VALUES (34, '2021-01-08 00:00:00', 0, 0.00, '2021-01-08 00:00:00', '2021-01-09 00:10:00');
INSERT INTO `tb_order_day` VALUES (35, '2021-01-09 00:00:00', 0, 0.00, '2021-01-09 00:00:00', '2021-01-10 00:10:00');
INSERT INTO `tb_order_day` VALUES (36, '2021-01-10 00:00:00', 0, 0.00, '2021-01-10 00:00:00', '2021-01-11 00:10:00');
INSERT INTO `tb_order_day` VALUES (37, '2021-01-11 00:00:00', 0, 0.00, '2021-01-11 00:00:00', '2021-01-12 00:10:00');
INSERT INTO `tb_order_day` VALUES (38, '2021-01-12 00:00:00', 0, 0.00, '2021-01-12 00:00:00', '2021-01-13 00:10:00');
INSERT INTO `tb_order_day` VALUES (39, '2021-01-13 00:00:00', 0, 0.00, '2021-01-13 00:00:00', '2021-01-14 00:10:00');
INSERT INTO `tb_order_day` VALUES (40, '2021-01-14 00:00:00', 0, 0.00, '2021-01-14 00:00:00', '2021-01-15 00:10:00');
INSERT INTO `tb_order_day` VALUES (41, '2021-01-15 00:00:00', 0, 0.00, '2021-01-15 00:00:00', '2021-01-16 00:10:00');
INSERT INTO `tb_order_day` VALUES (42, '2021-01-16 00:00:00', 0, 0.00, '2021-01-16 00:00:00', '2021-01-17 00:10:00');
INSERT INTO `tb_order_day` VALUES (43, '2021-01-17 00:00:00', 0, 0.00, '2021-01-17 00:00:00', '2021-01-18 00:10:00');
INSERT INTO `tb_order_day` VALUES (44, '2021-01-18 00:00:00', 0, 0.00, '2021-01-18 00:00:00', '2021-01-19 00:10:00');
INSERT INTO `tb_order_day` VALUES (45, '2021-01-19 00:00:00', 0, 0.00, '2021-01-19 00:00:00', '2021-01-20 00:10:00');
INSERT INTO `tb_order_day` VALUES (46, '2021-01-20 00:00:00', 0, 0.00, '2021-01-20 00:00:00', '2021-01-21 00:10:00');
INSERT INTO `tb_order_day` VALUES (47, '2021-01-21 00:00:00', 0, 0.00, '2021-01-21 00:00:00', '2021-01-22 00:10:00');
INSERT INTO `tb_order_day` VALUES (48, '2021-01-22 00:00:00', 0, 0.00, '2021-01-22 00:00:00', '2021-01-23 00:10:00');
INSERT INTO `tb_order_day` VALUES (49, '2021-01-23 00:00:00', 0, 0.00, '2021-01-23 00:00:00', '2021-01-24 00:10:00');
INSERT INTO `tb_order_day` VALUES (50, '2021-01-24 00:00:00', 0, 0.00, '2021-01-24 00:00:00', '2021-01-25 00:10:00');
INSERT INTO `tb_order_day` VALUES (51, '2021-01-25 00:00:00', 0, 0.00, '2021-01-25 00:00:00', '2021-01-26 00:10:00');
INSERT INTO `tb_order_day` VALUES (52, '2021-01-26 00:00:00', 0, 0.00, '2021-01-26 00:00:00', '2021-01-27 00:10:00');
INSERT INTO `tb_order_day` VALUES (53, '2021-01-27 00:00:00', 0, 0.00, '2021-01-27 00:00:00', '2021-01-28 00:10:00');
INSERT INTO `tb_order_day` VALUES (54, '2021-01-28 00:00:00', 0, 0.00, '2021-01-28 00:00:00', '2021-01-29 00:10:00');
INSERT INTO `tb_order_day` VALUES (55, '2021-01-29 00:00:00', 0, 0.00, '2021-01-29 00:00:00', '2021-01-30 00:10:00');
INSERT INTO `tb_order_day` VALUES (56, '2021-01-30 00:00:00', 0, 0.00, '2021-01-30 00:00:00', '2021-01-31 00:10:00');
INSERT INTO `tb_order_day` VALUES (57, '2021-01-31 00:00:00', 0, 0.00, '2021-01-31 00:00:00', '2021-02-01 00:10:00');
INSERT INTO `tb_order_day` VALUES (58, '2021-02-01 00:00:00', 0, 0.00, '2021-02-01 00:00:00', '2021-02-02 00:10:00');
INSERT INTO `tb_order_day` VALUES (59, '2021-02-02 00:00:00', 0, 0.00, '2021-02-02 00:00:00', '2021-02-03 00:10:00');
INSERT INTO `tb_order_day` VALUES (60, '2021-02-03 00:00:00', 0, 0.00, '2021-02-03 00:00:00', '2021-02-04 00:10:00');
INSERT INTO `tb_order_day` VALUES (61, '2021-02-04 00:00:00', 0, 0.00, '2021-02-04 00:00:00', '2021-02-05 00:10:00');
INSERT INTO `tb_order_day` VALUES (62, '2021-02-05 00:00:00', 0, 0.00, '2021-02-05 00:00:00', '2021-02-06 00:10:00');
INSERT INTO `tb_order_day` VALUES (63, '2021-02-06 00:00:00', 0, 0.00, '2021-02-06 00:00:00', '2021-02-07 00:10:00');
INSERT INTO `tb_order_day` VALUES (64, '2021-02-07 00:00:00', 0, 0.00, '2021-02-07 00:00:00', '2021-02-08 00:10:00');
INSERT INTO `tb_order_day` VALUES (65, '2021-02-08 00:00:00', 0, 0.00, '2021-02-08 00:00:00', '2021-02-09 00:10:00');
INSERT INTO `tb_order_day` VALUES (66, '2021-02-09 00:00:00', 0, 0.00, '2021-02-09 00:00:00', '2021-02-10 00:10:00');
INSERT INTO `tb_order_day` VALUES (67, '2021-02-10 00:00:00', 0, 0.00, '2021-02-10 00:00:00', '2021-02-11 00:10:00');
INSERT INTO `tb_order_day` VALUES (68, '2021-02-11 00:00:00', 0, 0.00, '2021-02-11 00:00:00', '2021-02-12 00:10:00');
INSERT INTO `tb_order_day` VALUES (69, '2021-02-12 00:00:00', 0, 0.00, '2021-02-12 00:00:00', '2021-02-13 00:10:00');
INSERT INTO `tb_order_day` VALUES (70, '2021-02-13 00:00:00', 0, 0.00, '2021-02-13 00:00:00', '2021-02-18 11:45:16');
INSERT INTO `tb_order_day` VALUES (71, '2021-02-14 00:00:00', 0, 0.00, '2021-02-14 00:00:00', '2021-02-15 00:10:00');
INSERT INTO `tb_order_day` VALUES (72, '2021-02-15 00:00:00', 0, 0.00, '2021-02-15 00:00:00', '2021-02-16 00:10:00');
INSERT INTO `tb_order_day` VALUES (73, '2021-02-16 00:00:00', 0, 0.00, '2021-02-16 00:00:00', '2021-02-17 00:10:00');
INSERT INTO `tb_order_day` VALUES (74, '2021-02-17 00:00:00', 0, 0.00, '2021-02-17 00:00:00', '2021-02-18 00:10:00');
INSERT INTO `tb_order_day` VALUES (75, '2021-02-18 00:00:00', 0, 0.00, '2021-02-18 00:00:00', '2021-02-19 00:10:00');
INSERT INTO `tb_order_day` VALUES (76, '2021-02-19 00:00:00', 0, 0.00, '2021-02-19 00:00:00', '2021-02-20 00:10:00');
INSERT INTO `tb_order_day` VALUES (77, '2021-02-20 00:00:00', 0, 0.00, '2021-02-20 00:00:00', '2021-02-21 00:10:00');
INSERT INTO `tb_order_day` VALUES (78, '2021-02-21 00:00:00', 0, 0.00, '2021-02-21 00:00:00', '2021-02-22 00:10:00');
INSERT INTO `tb_order_day` VALUES (79, '2021-02-22 00:00:00', 0, 0.00, '2021-02-22 00:00:00', '2021-02-23 00:10:00');
INSERT INTO `tb_order_day` VALUES (80, '2021-02-23 00:00:00', 0, 0.00, '2021-02-23 00:00:00', '2021-02-24 00:10:00');
INSERT INTO `tb_order_day` VALUES (81, '2021-02-24 00:00:00', 0, 0.00, '2021-02-24 00:00:00', '2021-02-25 00:10:00');
INSERT INTO `tb_order_day` VALUES (82, '2021-02-25 00:00:00', 0, 0.00, '2021-02-25 00:00:00', '2021-02-26 00:10:00');
INSERT INTO `tb_order_day` VALUES (83, '2021-02-26 00:00:00', 0, 0.00, '2021-02-26 00:00:00', '2021-02-27 00:10:00');
INSERT INTO `tb_order_day` VALUES (84, '2021-02-27 00:00:00', 0, 0.00, '2021-02-27 00:00:00', '2021-02-28 00:10:00');
INSERT INTO `tb_order_day` VALUES (85, '2021-02-28 00:00:00', 0, 0.00, '2021-02-28 00:00:00', '2021-03-01 00:10:00');
INSERT INTO `tb_order_day` VALUES (86, '2021-03-01 00:00:00', 0, 0.00, '2021-03-01 00:00:00', '2021-03-02 00:10:00');
INSERT INTO `tb_order_day` VALUES (87, '2021-03-02 00:00:00', 0, 0.00, '2021-03-02 00:00:00', '2021-03-03 00:10:00');
INSERT INTO `tb_order_day` VALUES (88, '2021-03-03 00:00:00', 0, 0.00, '2021-03-03 00:00:00', '2021-03-04 00:10:00');
INSERT INTO `tb_order_day` VALUES (89, '2021-03-04 00:00:00', 0, 0.00, '2021-03-04 00:00:00', '2021-03-05 00:10:00');
INSERT INTO `tb_order_day` VALUES (90, '2021-03-05 00:00:00', 0, 0.00, '2021-03-05 00:00:00', '2021-03-06 00:10:00');
INSERT INTO `tb_order_day` VALUES (91, '2021-03-06 00:00:00', 0, 0.00, '2021-03-06 00:00:00', '2021-03-07 00:10:00');
INSERT INTO `tb_order_day` VALUES (92, '2021-03-07 00:00:00', 3, 20.00, '2021-03-07 00:00:00', '2021-03-08 00:10:00');
INSERT INTO `tb_order_day` VALUES (93, '2021-03-08 00:00:00', 0, 0.00, '2021-03-08 00:00:00', '2021-03-09 00:10:00');
INSERT INTO `tb_order_day` VALUES (94, '2021-03-09 00:00:00', 605, 219.00, '2021-03-09 00:00:00', '2021-03-10 00:10:00');
INSERT INTO `tb_order_day` VALUES (95, '2021-03-10 00:00:00', 8, 83.00, '2021-03-10 00:00:00', '2021-03-11 21:56:56');
INSERT INTO `tb_order_day` VALUES (96, '2021-03-11 00:00:00', 30, 75.00, '2021-03-11 00:00:00', '2021-03-12 00:10:00');
INSERT INTO `tb_order_day` VALUES (97, '2021-03-12 00:00:00', 0, 0.00, '2021-03-12 00:00:00', '2021-03-13 00:10:00');
INSERT INTO `tb_order_day` VALUES (98, '2021-03-13 00:00:00', 0, 0.00, '2021-03-13 00:00:00', '2021-03-14 00:10:00');
INSERT INTO `tb_order_day` VALUES (99, '2021-03-14 00:00:00', 0, 0.00, '2021-03-14 00:00:00', '2021-03-15 00:10:00');
INSERT INTO `tb_order_day` VALUES (100, '2021-03-15 00:00:00', 0, 0.00, '2021-03-15 00:00:00', '2021-03-16 00:10:00');
INSERT INTO `tb_order_day` VALUES (101, '2021-03-16 00:00:00', 1, 10.00, '2021-03-16 00:00:00', '2021-03-17 00:10:00');
INSERT INTO `tb_order_day` VALUES (102, '2021-03-17 00:00:00', 2, 15.00, '2021-03-17 00:00:00', '2021-03-18 00:10:00');
INSERT INTO `tb_order_day` VALUES (103, '2021-03-18 00:00:00', 2, 32.00, '2021-03-18 00:00:00', '2021-03-19 00:10:00');
INSERT INTO `tb_order_day` VALUES (104, '2021-03-19 00:00:00', 1, 1.00, '2021-03-19 00:00:00', '2021-03-20 00:10:00');
INSERT INTO `tb_order_day` VALUES (105, '2021-03-20 00:00:00', 0, 0.00, '2021-03-20 00:00:00', '2021-03-21 00:10:00');
INSERT INTO `tb_order_day` VALUES (106, '2021-03-21 00:00:00', 0, 0.00, '2021-03-21 00:00:00', '2021-03-22 00:10:00');
INSERT INTO `tb_order_day` VALUES (107, '2021-03-22 00:00:00', 14, 8.30, '2021-03-22 00:00:00', '2021-03-23 07:33:30');
INSERT INTO `tb_order_day` VALUES (108, '2021-03-23 00:00:00', 1, 0.80, '2021-03-23 00:00:00', '2021-03-24 00:10:00');
INSERT INTO `tb_order_day` VALUES (109, '2021-03-24 00:00:00', 0, 0.00, '2021-03-24 00:00:00', '2021-03-24 00:10:00');

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
INSERT INTO `tb_order_month` VALUES (2, '2020-12-01 00:00:00', 298, 1079.00, '2020-12-07 21:39:29', '2021-03-20 15:11:31');
INSERT INTO `tb_order_month` VALUES (3, '2021-01-01 00:00:00', 8, 145.00, '2021-01-01 00:00:00', '2021-03-20 15:11:30');
INSERT INTO `tb_order_month` VALUES (4, '2021-02-01 00:00:00', 0, 0.00, '2021-02-01 00:00:00', '2021-03-17 10:39:00');
INSERT INTO `tb_order_month` VALUES (5, '2021-03-01 00:00:00', 667, 463.10, '2021-03-01 00:00:00', '2021-03-24 00:10:00');

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
INSERT INTO `tb_order_year` VALUES (2, '2020-01-01 00:00:00', 298, 1079.00, '2020-12-07 21:39:30', '2021-03-21 20:52:23');
INSERT INTO `tb_order_year` VALUES (3, '2021-01-01 00:00:00', 675, 608.10, '2021-01-01 00:00:00', '2021-03-24 00:10:00');

-- ----------------------------
-- Table structure for tb_print_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_print_order`;
CREATE TABLE `tb_print_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打印人的名字',
  `user_qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打印人的QQ',
  `user_wxchat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打印人的微信',
  `print_file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `user_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打印人的电话',
  `printf_number` int(11) NULL DEFAULT NULL COMMENT '打印的份数',
  `paper_number` int(11) NULL DEFAULT NULL COMMENT '打印的页数',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
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
INSERT INTO `tb_print_order` VALUES (5, '杨娇', '', NULL, '', '', 1, 10, 0.00, 3.00, '', '是', '', '2020-12-07 21:27:56', '2020-12-07 21:27:56');
INSERT INTO `tb_print_order` VALUES (6, '刘瑞雪', '', NULL, '', '', 1, 16, 0.00, 4.00, '', '是', '', '2020-12-07 21:28:34', '2020-12-07 21:28:34');
INSERT INTO `tb_print_order` VALUES (7, '李斌荣', '', NULL, '', '', 1, 13, 0.00, 3.00, '', '是', '', '2020-12-07 21:29:09', '2020-12-07 21:29:09');
INSERT INTO `tb_print_order` VALUES (8, '肖坐曾', '', NULL, '', '', 1, 14, 0.00, 4.00, '', '是', '', '2020-12-07 21:30:15', '2020-12-07 21:30:15');
INSERT INTO `tb_print_order` VALUES (9, '刘婷', '', NULL, '', '', 1, 16, 0.00, 4.00, '', '是', '', '2020-12-07 21:30:57', '2020-12-07 21:30:57');
INSERT INTO `tb_print_order` VALUES (10, '田洪明', '', NULL, '', '', 1, 10, 0.00, 3.00, '', '是', '', '2020-12-07 21:31:26', '2020-12-07 21:31:26');
INSERT INTO `tb_print_order` VALUES (11, '赵景腾', '', NULL, '', '', 1, 13, 0.00, 3.00, '', '是', '', '2020-12-07 21:31:51', '2020-12-07 21:31:51');
INSERT INTO `tb_print_order` VALUES (12, '田梦雨', '', NULL, '', '', 1, 13, 0.00, 3.00, '', '是', '', '2020-12-07 21:32:19', '2020-12-07 21:32:19');
INSERT INTO `tb_print_order` VALUES (13, '李进', '', NULL, '', '', 1, 11, 0.00, 3.00, '', '是', '', '2020-12-07 21:32:52', '2020-12-07 21:32:52');
INSERT INTO `tb_print_order` VALUES (14, '蒋盼', '', NULL, '', '', 1, 10, 0.00, 3.00, '', '是', '', '2020-12-07 21:33:30', '2020-12-07 21:33:30');
INSERT INTO `tb_print_order` VALUES (15, '焉凯', '', NULL, '', '', 1, 10, 0.00, 3.00, '', '是', '', '2020-12-07 21:34:05', '2020-12-07 21:34:05');
INSERT INTO `tb_print_order` VALUES (16, '王洪瑞', '', NULL, '', '', 1, 10, 0.00, 3.00, '', '是', '', '2020-12-07 21:34:23', '2020-12-07 21:34:23');
INSERT INTO `tb_print_order` VALUES (17, '潘红波', '', NULL, '', '', 1, 10, 0.00, 3.00, '', '是', '', '2020-12-07 21:34:44', '2020-12-07 21:34:44');
INSERT INTO `tb_print_order` VALUES (18, '姜萍', '', NULL, '', '', 1, 13, 0.00, 3.00, '', '是', '', '2020-12-07 21:35:09', '2020-12-07 21:35:09');
INSERT INTO `tb_print_order` VALUES (19, '宫洪彦', '', NULL, '', '', 1, 13, 0.00, 3.00, '', '是', '', '2020-12-07 21:35:48', '2020-12-07 21:35:48');
INSERT INTO `tb_print_order` VALUES (20, '王大洋', '', NULL, '', '', 1, 13, 0.00, 3.00, '', '是', '', '2020-12-07 21:36:25', '2020-12-07 21:36:25');
INSERT INTO `tb_print_order` VALUES (21, '赵璐', '', NULL, '', '', 1, 10, 0.00, 3.00, '', '是', '', '2020-12-07 21:36:49', '2020-12-07 21:36:49');
INSERT INTO `tb_print_order` VALUES (22, '陈鲜行', '', NULL, '', '', 1, 10, 0.00, 3.00, '', '是', '', '2020-12-07 21:37:14', '2020-12-07 21:37:14');
INSERT INTO `tb_print_order` VALUES (23, '李东', '', NULL, '', '', 1, 13, 0.00, 3.00, '', '是', '', '2020-12-07 21:42:19', '2020-12-07 21:42:19');
INSERT INTO `tb_print_order` VALUES (24, '杨胜彪', '', NULL, '', '', 1, 10, 0.00, 3.00, '', '是', '', '2020-12-07 21:48:09', '2020-12-07 21:48:09');
INSERT INTO `tb_print_order` VALUES (25, '莫明', '', NULL, '', '', 1, 13, 0.00, 3.00, '', '是', '', '2020-12-07 21:52:08', '2020-12-07 21:52:08');
INSERT INTO `tb_print_order` VALUES (26, '梁兴运', '', NULL, '', '', 1, 10, 0.00, 3.00, '', '是', '', '2020-12-07 21:56:32', '2020-12-07 21:56:32');
INSERT INTO `tb_print_order` VALUES (27, '伍虹雨', '', NULL, '', '', 1, 10, 0.00, 3.00, '', '是', '', '2020-12-07 22:04:37', '2020-12-07 22:04:37');
INSERT INTO `tb_print_order` VALUES (28, '杨波', '', NULL, '', '', 1, 10, 0.00, 3.00, '', '是', '', '2020-12-07 22:08:00', '2020-12-07 22:08:00');
INSERT INTO `tb_print_order` VALUES (29, '喻舟义', '', NULL, '', '', 1, 10, 0.00, 3.00, '', '是', '', '2020-12-07 22:17:46', '2020-12-07 22:17:46');
INSERT INTO `tb_print_order` VALUES (30, '聂鑫', '', NULL, '', '', 1, 10, 0.00, 3.00, '', '是', '', '2020-12-07 22:28:44', '2020-12-07 22:28:44');
INSERT INTO `tb_print_order` VALUES (31, '黄在磊', '', NULL, '', '', 1, 13, 0.00, 3.00, '', '是', '', '2020-12-07 22:35:56', '2020-12-07 22:35:56');
INSERT INTO `tb_print_order` VALUES (32, '刘 洪', '', NULL, '', '', 1, 9, 0.00, 2.00, '', '是', '', '2020-12-07 22:49:12', '2020-12-07 22:49:12');
INSERT INTO `tb_print_order` VALUES (33, '韩惠芬', '', NULL, '', '', 1, 10, 0.00, 3.00, '', '是', '', '2020-12-07 22:54:11', '2020-12-07 22:54:11');
INSERT INTO `tb_print_order` VALUES (34, '舒月', '', NULL, '', '', 1, 41, 0.00, 10.00, '', '是', '', '2020-12-07 23:01:24', '2020-12-07 23:01:24');
INSERT INTO `tb_print_order` VALUES (35, '田应币', '', NULL, '', '', 1, 10, 0.00, 3.00, '', '是', '', '2020-12-07 23:09:00', '2020-12-07 23:09:00');
INSERT INTO `tb_print_order` VALUES (36, '杨行行', '', NULL, '', '', 1, 10, 0.00, 3.00, '', '是', '', '2020-12-07 23:16:13', '2020-12-07 23:16:13');
INSERT INTO `tb_print_order` VALUES (37, '余龙', '', NULL, '', '', 1, 10, 0.00, 3.00, '', '是', '', '2020-12-07 23:16:43', '2020-12-07 23:16:43');
INSERT INTO `tb_print_order` VALUES (43, '刘瑞雪', NULL, NULL, NULL, NULL, 1, 10, 0.00, 3.00, NULL, '是', NULL, '2020-12-08 10:52:44', '2020-12-08 10:52:44');
INSERT INTO `tb_print_order` VALUES (64, '绣3—526', NULL, NULL, NULL, NULL, 1, 11, 0.00, 3.00, NULL, '是', NULL, '2020-12-09 20:24:29', '2020-12-09 20:24:29');
INSERT INTO `tb_print_order` VALUES (50, '林璐璐', NULL, NULL, NULL, NULL, 1, 1, 1.00, 1.00, NULL, '是', NULL, '2020-12-08 22:21:17', '2020-12-08 22:21:17');
INSERT INTO `tb_print_order` VALUES (51, '林璐璐', NULL, NULL, NULL, NULL, 1, 33, 0.00, 8.00, NULL, '是', NULL, '2020-12-08 22:21:54', '2020-12-08 22:21:54');
INSERT INTO `tb_print_order` VALUES (52, '徐雪（春花）', NULL, NULL, NULL, NULL, 1, 1, 1.00, 1.00, NULL, '是', NULL, '2020-12-08 22:29:31', '2020-12-08 22:29:31');
INSERT INTO `tb_print_order` VALUES (53, '绣4-326', '', NULL, '', '', 1, 3, 1.00, 2.00, '柯霞、李树美、孙宇洁', '是', '绣4-326', '2020-12-08 22:31:57', '2020-12-08 22:31:57');
INSERT INTO `tb_print_order` VALUES (54, '石开齐', NULL, NULL, NULL, NULL, 1, 5, 0.00, 2.00, NULL, '是', NULL, '2020-12-08 22:40:11', '2020-12-08 22:40:11');
INSERT INTO `tb_print_order` VALUES (56, 'H&', '', NULL, '', '', 1, 11, 0.00, 3.00, '微信', '是', '', '2020-12-08 22:48:56', '2020-12-08 22:48:56');
INSERT INTO `tb_print_order` VALUES (57, 'Nuyoah', '', NULL, '', '', 1, 2, 1.00, 1.00, '微信，准考证打印；李玲、张沾沾', '是', '', '2020-12-08 22:52:24', '2020-12-08 22:52:24');
INSERT INTO `tb_print_order` VALUES (58, '借我', NULL, NULL, NULL, NULL, 1, 1, 1.00, 1.00, NULL, '是', NULL, '2020-12-08 22:55:42', '2020-12-08 22:55:42');
INSERT INTO `tb_print_order` VALUES (59, '借我', NULL, NULL, NULL, NULL, 1, 15, 0.00, 5.00, NULL, '是', NULL, '2020-12-08 22:59:28', '2020-12-08 22:59:28');
INSERT INTO `tb_print_order` VALUES (65, '绣3—118', NULL, NULL, NULL, NULL, 1, 1, 1.00, 1.00, NULL, '是', NULL, '2020-12-09 20:24:58', '2020-12-09 20:24:58');
INSERT INTO `tb_print_order` VALUES (66, '龙兴', NULL, NULL, NULL, NULL, 1, 2, 0.00, 0.00, NULL, '是', NULL, '2020-12-09 20:25:15', '2020-12-09 20:25:15');
INSERT INTO `tb_print_order` VALUES (67, '可可', NULL, NULL, NULL, NULL, 2, 40, 0.00, 16.00, NULL, '是', NULL, '2020-12-09 20:26:48', '2020-12-09 20:26:48');
INSERT INTO `tb_print_order` VALUES (68, '曾以荣', '', NULL, '', '', 1, 10, 0.00, 0.00, '', '是', '', '2020-12-09 20:31:17', '2020-12-09 20:31:17');
INSERT INTO `tb_print_order` VALUES (69, '3-111', NULL, NULL, NULL, NULL, 3, 11, 0.00, 8.00, NULL, '是', NULL, '2020-12-09 22:13:27', '2020-12-09 22:13:27');
INSERT INTO `tb_print_order` VALUES (71, '龙兴', '', NULL, '', '', 2, 11, 0.00, 4.00, '打印物理复习题，考过了交0元，考不过交10倍！', '是', '', '2020-12-10 20:44:55', '2020-12-10 20:44:55');
INSERT INTO `tb_print_order` VALUES (72, '左端金', '', NULL, '', '', 49, 6, 0.00, 59.00, '周五早上8点40启智楼交易【明天】', '是', '', '2020-12-10 20:51:47', '2020-12-10 20:51:47');
INSERT INTO `tb_print_order` VALUES (73, '王思雨', '', NULL, '', '', 4, 27, 0.00, 27.00, '绣6-619', '是', '', '2020-12-10 21:00:43', '2020-12-10 21:00:43');
INSERT INTO `tb_print_order` VALUES (74, '王思雨', '', NULL, '', '', 2, 2, 0.00, 1.00, '绣6-619', '是', '', '2020-12-10 21:01:48', '2020-12-10 21:01:48');
INSERT INTO `tb_print_order` VALUES (75, '掬一捧蓝天', NULL, NULL, NULL, NULL, 1, 9, 0.00, 3.00, NULL, '是', NULL, '2020-12-10 21:43:44', '2020-12-10 21:43:44');
INSERT INTO `tb_print_order` VALUES (76, '吴文曾', '', NULL, '', '', 3, 45, 0.00, 34.00, '', '是', '', '2020-12-10 21:54:47', '2020-12-10 21:54:47');
INSERT INTO `tb_print_order` VALUES (77, '绣四416', NULL, NULL, NULL, NULL, 2, 1, 0.00, 1.00, NULL, '是', NULL, '2020-12-11 21:18:18', '2020-12-11 21:18:18');
INSERT INTO `tb_print_order` VALUES (78, '人间十三月', NULL, NULL, NULL, NULL, 1, 1, 1.00, 1.00, NULL, '是', NULL, '2020-12-11 21:20:25', '2020-12-11 21:20:25');
INSERT INTO `tb_print_order` VALUES (79, '5—212', NULL, NULL, NULL, NULL, 2, 1, 1.00, 1.00, NULL, '是', NULL, '2020-12-11 21:22:14', '2020-12-11 21:22:14');
INSERT INTO `tb_print_order` VALUES (80, '4——305', NULL, NULL, NULL, NULL, 1, 1, 1.00, 1.00, NULL, '是', NULL, '2020-12-11 21:27:18', '2020-12-11 21:27:18');
INSERT INTO `tb_print_order` VALUES (81, '4-427', NULL, NULL, NULL, NULL, 3, 1, 1.00, 2.00, NULL, '是', NULL, '2020-12-11 21:30:10', '2020-12-11 21:30:10');
INSERT INTO `tb_print_order` VALUES (82, '3—307', NULL, NULL, NULL, NULL, 1, 15, 0.00, 5.00, NULL, '是', NULL, '2020-12-12 14:28:50', '2020-12-12 14:28:50');
INSERT INTO `tb_print_order` VALUES (89, '1', NULL, NULL, NULL, NULL, 1, 11, 1.00, 11.00, NULL, '是', NULL, '2020-12-14 14:55:33', '2020-12-14 14:55:33');
INSERT INTO `tb_print_order` VALUES (84, '普四', NULL, NULL, NULL, NULL, 7, 9, 0.00, 19.00, NULL, '是', NULL, '2020-12-13 12:27:25', '2020-12-13 12:27:25');
INSERT INTO `tb_print_order` VALUES (85, '4-307', NULL, NULL, NULL, NULL, 1, 52, 0.00, 16.00, NULL, '是', NULL, '2020-12-13 22:10:11', '2020-12-13 22:10:11');
INSERT INTO `tb_print_order` VALUES (86, '3-403', '', NULL, '', '', 1, 1, 11.00, 11.00, '总共11元，懒得数', '是', '', '2020-12-13 22:11:45', '2020-12-13 22:11:45');
INSERT INTO `tb_print_order` VALUES (87, '3-118', NULL, NULL, NULL, NULL, 1, 6, 0.00, 2.00, NULL, '是', NULL, '2020-12-13 22:12:14', '2020-12-13 22:12:14');
INSERT INTO `tb_print_order` VALUES (88, '4-514', NULL, NULL, NULL, NULL, 1, 24, 0.00, 7.00, NULL, '是', NULL, '2020-12-13 22:13:17', '2020-12-13 22:13:17');
INSERT INTO `tb_print_order` VALUES (90, '.LU', NULL, NULL, NULL, NULL, 1, 62, 0.00, 16.00, NULL, '是', NULL, '2020-12-14 20:18:13', '2020-12-14 20:18:13');
INSERT INTO `tb_print_order` VALUES (91, '杨万军', NULL, NULL, NULL, NULL, 1, 16, 0.00, 5.00, NULL, '是', NULL, '2020-12-15 17:30:07', '2020-12-15 17:30:07');
INSERT INTO `tb_print_order` VALUES (92, '3—628', NULL, NULL, NULL, NULL, 1, 6, 0.00, 2.00, NULL, '是', NULL, '2020-12-15 17:31:13', '2020-12-15 17:31:13');
INSERT INTO `tb_print_order` VALUES (93, '杨宏芬', NULL, NULL, NULL, NULL, 4, 6, 0.00, 5.00, NULL, '是', NULL, '2020-12-15 17:46:52', '2020-12-15 17:46:52');
INSERT INTO `tb_print_order` VALUES (94, '4—509', NULL, NULL, NULL, NULL, 1, 8, 0.00, 2.00, NULL, '是', NULL, '2020-12-16 14:06:43', '2020-12-16 14:06:43');
INSERT INTO `tb_print_order` VALUES (95, '6—301', NULL, NULL, NULL, NULL, 1, 4, 0.00, 1.00, NULL, '是', NULL, '2020-12-16 14:08:36', '2020-12-16 14:08:36');
INSERT INTO `tb_print_order` VALUES (96, '刘锐', NULL, NULL, NULL, NULL, 1, 2, 0.00, 1.00, NULL, '是', NULL, '2020-12-16 22:15:35', '2020-12-16 22:15:35');
INSERT INTO `tb_print_order` VALUES (97, '严奎松', NULL, NULL, NULL, NULL, 1, 5, 0.00, 2.00, NULL, '是', NULL, '2020-12-16 22:16:15', '2020-12-16 22:16:15');
INSERT INTO `tb_print_order` VALUES (98, '张明闯', NULL, NULL, NULL, NULL, 1, 7, 0.00, 2.00, NULL, '是', NULL, '2020-12-16 22:16:55', '2020-12-16 22:16:55');
INSERT INTO `tb_print_order` VALUES (99, '李晓晴', NULL, NULL, NULL, NULL, 1, 1, 0.00, 0.00, NULL, '是', NULL, '2020-12-16 22:17:42', '2020-12-16 22:17:42');
INSERT INTO `tb_print_order` VALUES (100, '宋雪艳', NULL, NULL, NULL, NULL, 1, 8, 0.00, 2.00, NULL, '是', NULL, '2020-12-16 22:18:24', '2020-12-16 22:18:24');
INSERT INTO `tb_print_order` VALUES (101, '袁宏霞', NULL, NULL, NULL, NULL, 1, 5, 0.00, 2.00, NULL, '是', NULL, '2020-12-16 22:19:00', '2020-12-16 22:19:00');
INSERT INTO `tb_print_order` VALUES (102, '吴明花', NULL, NULL, NULL, NULL, 1, 7, 0.00, 2.00, NULL, '是', NULL, '2020-12-16 22:19:36', '2020-12-16 22:19:36');
INSERT INTO `tb_print_order` VALUES (103, '谢兴林', NULL, NULL, NULL, NULL, 1, 5, 0.00, 2.00, NULL, '是', NULL, '2020-12-16 22:20:06', '2020-12-16 22:20:06');
INSERT INTO `tb_print_order` VALUES (104, '余雪梅', NULL, NULL, NULL, NULL, 1, 17, 0.00, 5.00, NULL, '是', NULL, '2020-12-16 22:21:07', '2020-12-16 22:21:07');
INSERT INTO `tb_print_order` VALUES (105, '李晓晴', NULL, NULL, NULL, NULL, 1, 4, 0.00, 1.00, NULL, '是', NULL, '2020-12-16 22:22:16', '2020-12-16 22:22:16');
INSERT INTO `tb_print_order` VALUES (106, '丰贵云', NULL, NULL, NULL, NULL, 1, 3, 0.00, 1.00, NULL, '是', NULL, '2020-12-16 22:23:44', '2020-12-16 22:23:44');
INSERT INTO `tb_print_order` VALUES (107, '吴情柳', NULL, NULL, NULL, NULL, 1, 6, 0.00, 2.00, NULL, '是', NULL, '2020-12-16 22:24:26', '2020-12-16 22:24:26');
INSERT INTO `tb_print_order` VALUES (108, '翟德彪', NULL, NULL, NULL, NULL, 1, 5, 0.00, 2.00, NULL, '是', NULL, '2020-12-16 22:26:30', '2020-12-16 22:26:30');
INSERT INTO `tb_print_order` VALUES (109, '岑福变', NULL, NULL, NULL, NULL, 1, 5, 0.00, 2.00, NULL, '是', NULL, '2020-12-16 22:27:39', '2020-12-16 22:27:39');
INSERT INTO `tb_print_order` VALUES (117, '-', NULL, NULL, NULL, NULL, 1, 4, 0.00, 1.00, NULL, '是', NULL, '2020-12-17 21:02:25', '2020-12-17 21:02:25');
INSERT INTO `tb_print_order` VALUES (111, '文进芬', NULL, NULL, NULL, NULL, 1, 17, 0.00, 5.00, NULL, '是', NULL, '2020-12-16 22:29:31', '2020-12-16 22:29:31');
INSERT INTO `tb_print_order` VALUES (112, '赵路', NULL, NULL, NULL, NULL, 2, 34, 0.00, 20.00, NULL, '是', NULL, '2020-12-16 22:30:47', '2020-12-16 22:30:47');
INSERT INTO `tb_print_order` VALUES (113, '女朋友', NULL, NULL, NULL, NULL, 1, 2, 0.00, 1.00, NULL, '是', NULL, '2020-12-16 22:33:45', '2020-12-16 22:33:45');
INSERT INTO `tb_print_order` VALUES (114, '谢媛媛', NULL, NULL, NULL, NULL, 1, 9, 0.00, 3.00, NULL, '是', NULL, '2020-12-16 22:35:05', '2020-12-16 22:35:05');
INSERT INTO `tb_print_order` VALUES (115, '春花', NULL, NULL, NULL, NULL, 1, 27, 0.00, 8.00, NULL, '是', NULL, '2020-12-16 22:37:20', '2020-12-16 22:37:20');
INSERT INTO `tb_print_order` VALUES (116, '春花', NULL, NULL, NULL, NULL, 1, 7, 0.00, 2.00, NULL, '是', NULL, '2020-12-16 22:39:15', '2020-12-16 22:39:15');
INSERT INTO `tb_print_order` VALUES (119, '吴情柳', NULL, NULL, NULL, NULL, 2, 15, 0.00, 9.00, NULL, '是', NULL, '2020-12-17 22:08:24', '2020-12-17 22:08:24');
INSERT INTO `tb_print_order` VALUES (125, '3-401', NULL, NULL, NULL, NULL, 1, 10, 0.00, 3.00, NULL, '是', NULL, '2020-12-17 22:33:05', '2020-12-17 22:33:05');
INSERT INTO `tb_print_order` VALUES (121, '3-401', NULL, NULL, NULL, NULL, 1, 4, 0.00, 1.00, NULL, '是', NULL, '2020-12-17 22:26:51', '2020-12-17 22:26:51');
INSERT INTO `tb_print_order` VALUES (122, '3-401', NULL, NULL, NULL, NULL, 1, 14, 0.00, 4.00, NULL, '是', NULL, '2020-12-17 22:27:32', '2020-12-17 22:27:32');
INSERT INTO `tb_print_order` VALUES (123, '3-401', NULL, NULL, NULL, NULL, 1, 28, 0.00, 7.00, NULL, '是', NULL, '2020-12-17 22:28:47', '2020-12-17 22:28:47');
INSERT INTO `tb_print_order` VALUES (124, '3-401', NULL, NULL, NULL, NULL, 1, 10, 0.00, 3.00, NULL, '是', NULL, '2020-12-17 22:29:29', '2020-12-17 22:29:29');
INSERT INTO `tb_print_order` VALUES (127, '李星亦', NULL, NULL, NULL, NULL, 1, 15, 0.00, 5.00, NULL, '是', NULL, '2020-12-18 12:57:47', '2020-12-18 12:57:47');
INSERT INTO `tb_print_order` VALUES (128, '如歌', NULL, NULL, NULL, NULL, 1, 10, 0.00, 3.00, NULL, '是', NULL, '2020-12-18 13:00:05', '2020-12-18 13:00:05');
INSERT INTO `tb_print_order` VALUES (129, '陈乾丽', NULL, NULL, NULL, NULL, 1, 23, 0.00, 7.00, NULL, '是', NULL, '2020-12-18 13:01:51', '2020-12-18 13:01:51');
INSERT INTO `tb_print_order` VALUES (130, '邓前', NULL, NULL, NULL, NULL, 1, 16, 0.00, 5.00, NULL, '是', NULL, '2020-12-18 13:03:46', '2020-12-18 13:03:46');
INSERT INTO `tb_print_order` VALUES (131, '---', NULL, NULL, NULL, NULL, 1, 6, 0.00, 2.00, NULL, '是', NULL, '2020-12-18 18:32:59', '2020-12-18 18:32:59');
INSERT INTO `tb_print_order` VALUES (132, '普四', NULL, NULL, NULL, NULL, 1, 6, 0.00, 2.00, NULL, '是', NULL, '2020-12-19 19:09:43', '2020-12-19 19:09:43');
INSERT INTO `tb_print_order` VALUES (133, '小花', NULL, NULL, NULL, NULL, 1, 47, 0.00, 14.00, NULL, '是', NULL, '2020-12-20 16:43:34', '2020-12-20 16:43:34');
INSERT INTO `tb_print_order` VALUES (134, '可可', NULL, NULL, NULL, NULL, 6, 16, 0.00, 24.00, NULL, '是', NULL, '2020-12-20 19:38:53', '2020-12-20 19:38:53');
INSERT INTO `tb_print_order` VALUES (135, '3—119', NULL, NULL, NULL, NULL, 1, 29, 0.00, 9.00, NULL, '是', NULL, '2020-12-20 19:51:39', '2020-12-20 19:51:39');
INSERT INTO `tb_print_order` VALUES (136, '5-105', NULL, NULL, NULL, NULL, 1, 60, 0.00, 18.00, NULL, '是', NULL, '2020-12-21 12:15:55', '2020-12-21 12:15:55');
INSERT INTO `tb_print_order` VALUES (137, '余雪梅', NULL, NULL, NULL, NULL, 1, 9, 0.00, 3.00, NULL, '是', NULL, '2020-12-21 12:16:39', '2020-12-21 12:16:39');
INSERT INTO `tb_print_order` VALUES (138, '李俊林', NULL, NULL, NULL, NULL, 2, 7, 0.00, 4.00, NULL, '是', NULL, '2020-12-21 16:23:38', '2020-12-21 16:23:38');
INSERT INTO `tb_print_order` VALUES (139, '吴明花', NULL, NULL, NULL, NULL, 1, 8, 0.00, 2.00, NULL, '是', NULL, '2020-12-21 20:57:41', '2020-12-21 20:57:41');
INSERT INTO `tb_print_order` VALUES (140, '吴明花', NULL, NULL, NULL, NULL, 1, 12, 0.00, 4.00, NULL, '是', NULL, '2020-12-21 21:00:04', '2020-12-21 21:00:04');
INSERT INTO `tb_print_order` VALUES (141, '李晓晴', NULL, NULL, NULL, NULL, 2, 4, 0.00, 2.00, NULL, '是', NULL, '2020-12-21 22:10:07', '2020-12-21 22:10:07');
INSERT INTO `tb_print_order` VALUES (142, '吴明花', NULL, NULL, NULL, NULL, 1, 20, 0.00, 6.00, NULL, '是', NULL, '2020-12-21 22:11:08', '2020-12-21 22:11:08');
INSERT INTO `tb_print_order` VALUES (144, '岑福变', NULL, NULL, NULL, NULL, 1, 21, 0.00, 6.00, NULL, '是', NULL, '2020-12-21 22:13:09', '2020-12-21 22:13:09');
INSERT INTO `tb_print_order` VALUES (145, '陆文春', NULL, NULL, NULL, NULL, 4, 4, 0.00, 5.00, NULL, '是', NULL, '2020-12-21 22:13:50', '2020-12-21 22:13:50');
INSERT INTO `tb_print_order` VALUES (146, '安华松', NULL, NULL, NULL, NULL, 1, 80, 0.00, 24.00, NULL, '是', NULL, '2020-12-21 22:14:33', '2020-12-21 22:14:33');
INSERT INTO `tb_print_order` VALUES (147, '胡训', NULL, NULL, NULL, NULL, 1, 14, 0.00, 4.00, NULL, '是', NULL, '2020-12-22 20:48:50', '2020-12-22 20:48:50');
INSERT INTO `tb_print_order` VALUES (148, '漆娅', NULL, NULL, NULL, NULL, 1, 10, 0.00, 3.00, NULL, '是', NULL, '2020-12-22 20:49:16', '2020-12-22 20:49:16');
INSERT INTO `tb_print_order` VALUES (149, '丰贵云', NULL, NULL, NULL, NULL, 1, 18, 0.00, 5.00, NULL, '是', NULL, '2020-12-22 20:49:43', '2020-12-22 20:49:43');
INSERT INTO `tb_print_order` VALUES (150, '黄瑶', NULL, NULL, NULL, NULL, 1, 9, 0.00, 3.00, NULL, '是', NULL, '2020-12-22 21:36:08', '2020-12-22 21:36:08');
INSERT INTO `tb_print_order` VALUES (151, '吴长青-20级', NULL, NULL, NULL, NULL, 1, 14, 0.00, 4.00, NULL, '是', NULL, '2020-12-22 21:42:58', '2020-12-22 21:42:58');
INSERT INTO `tb_print_order` VALUES (152, '李星逸', NULL, NULL, NULL, NULL, 1, 9, 0.00, 3.00, NULL, '是', NULL, '2020-12-22 21:47:38', '2020-12-22 21:47:38');
INSERT INTO `tb_print_order` VALUES (153, '姚文虎', NULL, NULL, NULL, NULL, 2, 5, 0.00, 3.00, NULL, '是', NULL, '2020-12-22 21:49:00', '2020-12-22 21:49:00');
INSERT INTO `tb_print_order` VALUES (154, '文进芬', NULL, NULL, NULL, NULL, 2, 4, 0.00, 2.00, NULL, '是', NULL, '2020-12-22 21:50:36', '2020-12-22 21:50:36');
INSERT INTO `tb_print_order` VALUES (155, '绣三-505-王玮', NULL, NULL, NULL, NULL, 1, 106, 0.00, 32.00, NULL, '是', NULL, '2020-12-22 22:25:43', '2020-12-22 22:25:43');
INSERT INTO `tb_print_order` VALUES (156, '打印最多的那个', NULL, NULL, NULL, NULL, 6, 33, 0.00, 59.00, NULL, '是', NULL, '2020-12-22 22:26:35', '2020-12-22 22:26:35');
INSERT INTO `tb_print_order` VALUES (157, '打印最多的那个', NULL, NULL, NULL, NULL, 5, 4, 0.00, 6.00, NULL, '是', NULL, '2020-12-22 22:27:22', '2020-12-22 22:27:22');
INSERT INTO `tb_print_order` VALUES (158, '打印最多的那个', NULL, NULL, NULL, NULL, 6, 13, 0.00, 23.00, NULL, '是', NULL, '2020-12-22 22:28:02', '2020-12-22 22:28:02');
INSERT INTO `tb_print_order` VALUES (159, '梁盟盟', NULL, NULL, NULL, NULL, 2, 4, 0.00, 2.00, NULL, '是', NULL, '2020-12-22 22:31:33', '2020-12-22 22:31:33');
INSERT INTO `tb_print_order` VALUES (160, '梅领', NULL, NULL, NULL, NULL, 2, 4, 0.00, 2.00, NULL, '是', NULL, '2020-12-23 12:53:11', '2020-12-23 12:53:11');
INSERT INTO `tb_print_order` VALUES (161, '谢兴林', NULL, NULL, NULL, NULL, 1, 12, 0.00, 4.00, NULL, '是', NULL, '2020-12-23 12:54:09', '2020-12-23 12:54:09');
INSERT INTO `tb_print_order` VALUES (162, '刘锐', NULL, NULL, NULL, NULL, 1, 13, 0.00, 4.00, NULL, '是', NULL, '2020-12-23 12:57:43', '2020-12-23 12:57:43');
INSERT INTO `tb_print_order` VALUES (163, '3—628', NULL, NULL, NULL, NULL, 1, 10, 0.00, 3.00, NULL, '是', NULL, '2020-12-23 13:02:41', '2020-12-23 13:02:41');
INSERT INTO `tb_print_order` VALUES (164, '吴长青', NULL, NULL, NULL, NULL, 2, 3, 0.00, 2.00, NULL, '是', NULL, '2020-12-23 21:57:24', '2020-12-23 21:57:24');
INSERT INTO `tb_print_order` VALUES (165, '4-419', NULL, NULL, NULL, NULL, 1, 18, 0.00, 5.00, NULL, '是', NULL, '2020-12-23 21:57:52', '2020-12-23 21:57:52');
INSERT INTO `tb_print_order` VALUES (166, '余雪梅', NULL, NULL, NULL, NULL, 1, 5, 0.00, 2.00, NULL, '是', NULL, '2020-12-23 21:58:23', '2020-12-23 21:58:23');
INSERT INTO `tb_print_order` VALUES (167, '3-109', NULL, NULL, NULL, NULL, 1, 32, 0.00, 10.00, NULL, '是', NULL, '2020-12-23 21:59:27', '2020-12-23 21:59:27');
INSERT INTO `tb_print_order` VALUES (168, '奇亚', NULL, NULL, NULL, NULL, 1, 10, 0.00, 3.00, NULL, '是', NULL, '2020-12-23 21:59:58', '2020-12-23 21:59:58');
INSERT INTO `tb_print_order` VALUES (169, '4-232', NULL, NULL, NULL, NULL, 6, 3, 0.00, 5.00, NULL, '是', NULL, '2020-12-23 22:00:38', '2020-12-23 22:00:38');
INSERT INTO `tb_print_order` VALUES (170, '吴情柳', NULL, NULL, NULL, NULL, 6, 5, 0.00, 9.00, NULL, '是', NULL, '2020-12-23 22:01:35', '2020-12-23 22:01:35');
INSERT INTO `tb_print_order` VALUES (171, '越小', NULL, NULL, NULL, NULL, 1, 15, 0.00, 5.00, NULL, '是', NULL, '2020-12-23 22:04:04', '2020-12-23 22:04:04');
INSERT INTO `tb_print_order` VALUES (172, '4-310', NULL, NULL, NULL, NULL, 1, 33, 0.00, 10.00, NULL, '是', NULL, '2020-12-23 22:19:47', '2020-12-23 22:19:47');
INSERT INTO `tb_print_order` VALUES (173, '小小布', NULL, NULL, NULL, NULL, 1, 38, 0.00, 11.00, NULL, '是', NULL, '2020-12-24 13:08:32', '2020-12-24 13:08:32');
INSERT INTO `tb_print_order` VALUES (174, '01', NULL, NULL, NULL, NULL, 1, 1, 0.00, 0.00, NULL, '是', NULL, '2020-12-24 13:09:09', '2020-12-24 13:09:09');
INSERT INTO `tb_print_order` VALUES (175, '4—501', NULL, NULL, NULL, NULL, 1, 4, 0.00, 1.00, NULL, '是', NULL, '2020-12-24 21:59:18', '2020-12-24 21:59:18');
INSERT INTO `tb_print_order` VALUES (176, '3—613', NULL, NULL, NULL, NULL, 3, 14, 0.00, 13.00, NULL, '是', NULL, '2020-12-24 22:00:01', '2020-12-24 22:00:01');
INSERT INTO `tb_print_order` VALUES (177, '4—501', NULL, NULL, NULL, NULL, 1, 2, 0.00, 1.00, NULL, '是', NULL, '2020-12-24 22:00:37', '2020-12-24 22:00:37');
INSERT INTO `tb_print_order` VALUES (178, '4—207', NULL, NULL, NULL, NULL, 1, 11, 0.00, 3.00, NULL, '是', NULL, '2020-12-24 22:01:32', '2020-12-24 22:01:32');
INSERT INTO `tb_print_order` VALUES (179, '4—502', NULL, NULL, NULL, NULL, 1, 4, 0.00, 1.00, NULL, '是', NULL, '2020-12-24 22:02:06', '2020-12-24 22:02:06');
INSERT INTO `tb_print_order` VALUES (183, '3—614', NULL, NULL, NULL, NULL, 1, 24, 0.00, 7.00, NULL, '是', NULL, '2020-12-26 11:54:03', '2020-12-26 11:54:03');
INSERT INTO `tb_print_order` VALUES (181, '4—415', NULL, NULL, NULL, NULL, 4, 4, 0.00, 5.00, NULL, '是', NULL, '2020-12-24 22:03:46', '2020-12-24 22:03:46');
INSERT INTO `tb_print_order` VALUES (182, '4—604', NULL, NULL, NULL, NULL, 3, 59, 0.00, 44.00, NULL, '是', NULL, '2020-12-24 22:04:29', '2020-12-24 22:04:29');
INSERT INTO `tb_print_order` VALUES (184, '曲志伟', NULL, NULL, NULL, NULL, 3, 5, 0.00, 5.00, NULL, '是', NULL, '2020-12-26 11:54:23', '2020-12-26 11:54:23');
INSERT INTO `tb_print_order` VALUES (185, '4—212', NULL, NULL, NULL, NULL, 2, 17, 0.00, 10.00, NULL, '是', NULL, '2020-12-26 11:55:43', '2020-12-26 11:55:43');
INSERT INTO `tb_print_order` VALUES (186, '3—607', NULL, NULL, NULL, NULL, 1, 16, 0.00, 5.00, NULL, '是', NULL, '2020-12-26 21:37:24', '2020-12-26 21:37:24');
INSERT INTO `tb_print_order` VALUES (189, '6—612', NULL, NULL, NULL, NULL, 1, 7, 0.00, 2.00, NULL, '是', NULL, '2020-12-26 21:40:19', '2020-12-26 21:40:19');
INSERT INTO `tb_print_order` VALUES (188, '4—415', NULL, NULL, NULL, NULL, 2, 4, 0.00, 2.00, NULL, '是', NULL, '2020-12-26 21:39:02', '2020-12-26 21:39:02');
INSERT INTO `tb_print_order` VALUES (192, '成也', NULL, NULL, NULL, NULL, 2, 3, 0.00, 2.00, NULL, '是', NULL, '2020-12-29 19:51:32', '2020-12-29 19:51:32');
INSERT INTO `tb_print_order` VALUES (191, '4—610', NULL, NULL, NULL, NULL, 1, 3, 0.00, 1.00, NULL, '是', NULL, '2020-12-26 21:41:22', '2020-12-26 21:41:22');
INSERT INTO `tb_print_order` VALUES (193, 'LAYLA', NULL, NULL, NULL, NULL, 1, 13, 0.00, 4.00, NULL, '是', NULL, '2020-12-29 19:53:05', '2020-12-29 19:53:05');
INSERT INTO `tb_print_order` VALUES (194, '180s', NULL, NULL, NULL, NULL, 2, 11, 0.00, 7.00, NULL, '是', NULL, '2020-12-29 19:55:26', '2020-12-29 19:55:26');
INSERT INTO `tb_print_order` VALUES (195, '房东的猫', NULL, NULL, NULL, NULL, 1, 11, 0.00, 3.00, NULL, '是', NULL, '2020-12-29 19:58:38', '2020-12-29 19:58:38');
INSERT INTO `tb_print_order` VALUES (196, '山南水北', NULL, NULL, NULL, NULL, 1, 41, 0.00, 12.00, NULL, '是', NULL, '2020-12-29 21:06:40', '2020-12-29 21:06:40');
INSERT INTO `tb_print_order` VALUES (197, '山南水北', NULL, NULL, NULL, NULL, 1, 41, 0.00, 12.00, NULL, '是', NULL, '2020-12-29 22:03:04', '2020-12-29 22:03:04');
INSERT INTO `tb_print_order` VALUES (198, '3—307', NULL, NULL, NULL, NULL, 1, 88, 0.00, 26.00, NULL, '是', NULL, '2020-12-30 15:10:39', '2020-12-30 15:10:39');
INSERT INTO `tb_print_order` VALUES (199, '绣一', NULL, NULL, NULL, NULL, 1, 37, 0.00, 11.00, NULL, '是', NULL, '2020-12-30 15:11:33', '2020-12-30 15:11:33');
INSERT INTO `tb_print_order` VALUES (200, '。。。', NULL, NULL, NULL, NULL, 1, 4, 0.00, 1.00, NULL, '是', NULL, '2020-12-30 15:11:54', '2020-12-30 15:11:54');
INSERT INTO `tb_print_order` VALUES (201, '4—222', NULL, NULL, NULL, NULL, 1, 10, 0.00, 3.00, NULL, '是', NULL, '2020-12-30 15:12:19', '2020-12-30 15:12:19');
INSERT INTO `tb_print_order` VALUES (202, '4—325', NULL, NULL, NULL, NULL, 1, 6, 0.00, 2.00, NULL, '是', NULL, '2020-12-30 15:12:40', '2020-12-30 15:12:40');
INSERT INTO `tb_print_order` VALUES (203, '李东', NULL, NULL, NULL, NULL, 1, 115, 0.00, 35.00, NULL, '是', NULL, '2020-12-31 15:44:10', '2020-12-31 15:44:10');
INSERT INTO `tb_print_order` VALUES (204, '莫明', NULL, NULL, NULL, NULL, 1, 121, 0.00, 36.00, NULL, '是', NULL, '2021-01-03 18:12:11', '2021-01-03 18:12:11');
INSERT INTO `tb_print_order` VALUES (205, '！！！', NULL, NULL, NULL, NULL, 2, 50, 0.00, 30.00, NULL, '是', NULL, '2021-01-03 18:12:31', '2021-01-03 18:12:31');
INSERT INTO `tb_print_order` VALUES (206, '闵金国', NULL, NULL, NULL, NULL, 1, 55, 0.00, 17.00, NULL, '是', NULL, '2021-01-04 22:14:34', '2021-01-04 22:14:34');
INSERT INTO `tb_print_order` VALUES (207, '闵金国', NULL, NULL, NULL, NULL, 2, 58, 0.00, 35.00, NULL, '是', NULL, '2021-01-05 13:15:19', '2021-01-05 13:15:19');
INSERT INTO `tb_print_order` VALUES (208, '杨记', NULL, NULL, NULL, NULL, 2, 45, 0.00, 27.00, NULL, '是', NULL, '2021-01-06 13:30:54', '2021-01-06 13:30:54');
INSERT INTO `tb_print_order` VALUES (209, '山南水北魏之南', NULL, NULL, NULL, NULL, 1, 6, 0.00, 2.00, NULL, '是', NULL, '2021-03-07 19:51:15', '2021-03-07 19:51:15');
INSERT INTO `tb_print_order` VALUES (210, '陌上人如意', NULL, NULL, NULL, NULL, 1, 35, 0.00, 11.00, NULL, '是', NULL, '2021-03-07 20:26:02', '2021-03-07 20:26:02');
INSERT INTO `tb_print_order` VALUES (211, '4-212 徐梅', NULL, NULL, NULL, NULL, 1, 25, 0.00, 8.00, NULL, '是', NULL, '2021-03-07 20:46:57', '2021-03-07 20:46:57');
INSERT INTO `tb_print_order` VALUES (212, '螃蟹跳着走', NULL, NULL, NULL, NULL, 600, 1, 0.00, 150.00, NULL, '是', NULL, '2021-03-09 19:37:50', '2021-03-09 19:37:50');
INSERT INTO `tb_print_order` VALUES (213, '螃蟹跳着走', NULL, NULL, NULL, NULL, 2, 124, 0.00, 62.00, NULL, '是', NULL, '2021-03-09 19:38:18', '2021-03-09 19:38:18');
INSERT INTO `tb_print_order` VALUES (214, '安之', NULL, NULL, NULL, NULL, 1, 1, 3.00, 3.00, NULL, '是', NULL, '2021-03-09 20:32:19', '2021-03-09 20:32:19');
INSERT INTO `tb_print_order` VALUES (215, '七七', NULL, NULL, NULL, NULL, 1, 4, 0.00, 1.00, NULL, '是', NULL, '2021-03-09 20:32:42', '2021-03-09 20:32:42');
INSERT INTO `tb_print_order` VALUES (216, '吴倩', NULL, NULL, NULL, NULL, 1, 6, 1.00, 3.00, NULL, '是', NULL, '2021-03-09 20:34:05', '2021-03-09 20:34:05');
INSERT INTO `tb_print_order` VALUES (220, '4—519', NULL, NULL, NULL, NULL, 1, 21, 0.00, 6.00, NULL, '是', NULL, '2021-03-10 18:35:39', '2021-03-10 18:35:39');
INSERT INTO `tb_print_order` VALUES (219, '417', NULL, NULL, NULL, NULL, 1, 200, 0.00, 60.00, NULL, '是', NULL, '2021-03-10 18:07:25', '2021-03-10 18:07:25');
INSERT INTO `tb_print_order` VALUES (221, '3—614', NULL, NULL, NULL, NULL, 1, 2, 0.00, 1.00, NULL, '是', NULL, '2021-03-10 21:54:38', '2021-03-10 21:54:38');
INSERT INTO `tb_print_order` VALUES (222, '4—623', NULL, NULL, NULL, NULL, 1, 16, 0.00, 5.00, NULL, '是', NULL, '2021-03-10 21:55:08', '2021-03-10 21:55:08');
INSERT INTO `tb_print_order` VALUES (223, '黄瑶', NULL, NULL, NULL, NULL, 1, 16, 0.00, 5.00, NULL, '是', NULL, '2021-03-10 21:55:45', '2021-03-10 21:55:45');
INSERT INTO `tb_print_order` VALUES (224, '4—310', NULL, NULL, NULL, NULL, 1, 2, 0.00, 1.00, NULL, '是', NULL, '2021-03-10 21:56:07', '2021-03-10 21:56:07');
INSERT INTO `tb_print_order` VALUES (225, '杨积', NULL, NULL, NULL, NULL, 1, 11, 0.00, 3.00, NULL, '是', NULL, '2021-03-10 21:57:10', '2021-03-10 21:57:10');
INSERT INTO `tb_print_order` VALUES (226, '花花', NULL, NULL, NULL, NULL, 1, 8, 0.00, 2.00, NULL, '是', NULL, '2021-03-10 21:57:40', '2021-03-10 21:57:40');
INSERT INTO `tb_print_order` VALUES (227, '奇亚', NULL, NULL, NULL, NULL, 1, 1, 0.00, 0.00, NULL, '是', NULL, '2021-03-11 21:45:38', '2021-03-11 21:45:38');
INSERT INTO `tb_print_order` VALUES (228, '4-621', NULL, NULL, NULL, NULL, 4, 1, 0.00, 1.00, NULL, '是', NULL, '2021-03-11 21:46:16', '2021-03-11 21:46:16');
INSERT INTO `tb_print_order` VALUES (229, '3-116', NULL, NULL, NULL, NULL, 4, 1, 0.00, 1.00, NULL, '是', NULL, '2021-03-11 21:46:51', '2021-03-11 21:46:51');
INSERT INTO `tb_print_order` VALUES (230, '4-615', NULL, NULL, NULL, NULL, 1, 4, 0.00, 1.00, NULL, '是', NULL, '2021-03-11 21:47:27', '2021-03-11 21:47:27');
INSERT INTO `tb_print_order` VALUES (231, '4-518', NULL, NULL, NULL, NULL, 1, 37, 0.00, 11.00, NULL, '是', NULL, '2021-03-11 21:48:00', '2021-03-11 21:48:00');
INSERT INTO `tb_print_order` VALUES (232, '4-518', NULL, NULL, NULL, NULL, 2, 1, 1.00, 1.00, NULL, '是', NULL, '2021-03-11 21:48:34', '2021-03-11 21:48:34');
INSERT INTO `tb_print_order` VALUES (233, '4-508', NULL, NULL, NULL, NULL, 2, 44, 0.00, 26.00, NULL, '是', NULL, '2021-03-11 21:49:11', '2021-03-11 21:49:11');
INSERT INTO `tb_print_order` VALUES (234, '4-616', NULL, NULL, NULL, NULL, 11, 1, 0.00, 3.00, NULL, '是', NULL, '2021-03-11 21:49:41', '2021-03-11 21:49:41');
INSERT INTO `tb_print_order` VALUES (235, '4-416', NULL, NULL, NULL, NULL, 1, 11, 0.00, 3.00, NULL, '是', NULL, '2021-03-11 21:50:26', '2021-03-11 21:50:26');
INSERT INTO `tb_print_order` VALUES (236, '5-603', NULL, NULL, NULL, NULL, 1, 16, 0.00, 5.00, NULL, '是', NULL, '2021-03-11 21:51:14', '2021-03-11 21:51:14');
INSERT INTO `tb_print_order` VALUES (237, '文牒', NULL, NULL, NULL, NULL, 1, 57, 0.00, 16.00, NULL, '是', NULL, '2021-03-11 21:52:32', '2021-03-11 21:52:32');
INSERT INTO `tb_print_order` VALUES (238, '普四', NULL, NULL, NULL, NULL, 1, 18, 0.00, 5.00, NULL, '是', NULL, '2021-03-11 21:53:19', '2021-03-11 21:53:19');
INSERT INTO `tb_print_order` VALUES (239, '郝佳义', NULL, NULL, NULL, NULL, 1, 34, 0.00, 10.00, NULL, '是', NULL, '2021-03-16 19:46:27', '2021-03-16 19:46:27');
INSERT INTO `tb_print_order` VALUES (240, 'qunzi_', NULL, NULL, NULL, NULL, 1, 46, 0.00, 14.00, NULL, '是', NULL, '2021-03-17 20:12:05', '2021-03-17 20:12:05');
INSERT INTO `tb_print_order` VALUES (241, '南风也曾入我怀', NULL, NULL, NULL, NULL, 1, 2, 0.00, 1.00, NULL, '是', NULL, '2021-03-17 20:23:26', '2021-03-17 20:23:26');
INSERT INTO `tb_print_order` VALUES (242, '4-218', NULL, NULL, NULL, NULL, 1, 13, 0.00, 4.00, NULL, '是', NULL, '2021-03-18 20:22:26', '2021-03-18 20:22:26');
INSERT INTO `tb_print_order` VALUES (243, '4-101', NULL, NULL, NULL, NULL, 1, 100, 0.00, 28.00, NULL, '是', NULL, '2021-03-18 21:59:44', '2021-03-18 21:59:44');
INSERT INTO `tb_print_order` VALUES (244, '郝佳义', NULL, NULL, NULL, NULL, 1, 4, 0.00, 1.00, NULL, '是', NULL, '2021-03-19 19:32:52', '2021-03-19 19:32:52');
INSERT INTO `tb_print_order` VALUES (245, '十里（4-501）', NULL, NULL, NULL, NULL, 1, 10, 0.30, 3.00, NULL, '是', NULL, '2021-03-22 18:32:03', '2021-03-22 18:32:03');
INSERT INTO `tb_print_order` VALUES (246, '尤永丽绣3－614', NULL, NULL, NULL, NULL, 1, 1, 0.50, 0.50, NULL, '是', NULL, '2021-03-22 18:37:36', '2021-03-22 18:37:36');
INSERT INTO `tb_print_order` VALUES (247, '尤永丽绣3－614', NULL, NULL, NULL, NULL, 2, 1, 0.30, 0.60, NULL, '是', NULL, '2021-03-22 18:37:48', '2021-03-22 18:37:48');
INSERT INTO `tb_print_order` VALUES (248, '找工友，不代理', NULL, NULL, NULL, NULL, 6, 1, 0.30, 1.80, NULL, '是', NULL, '2021-03-22 18:40:41', '2021-03-22 18:40:41');
INSERT INTO `tb_print_order` VALUES (249, '4-212徐雪', NULL, NULL, NULL, NULL, 2, 1, 0.40, 0.80, NULL, '是', NULL, '2021-03-22 18:46:22', '2021-03-22 18:46:22');
INSERT INTO `tb_print_order` VALUES (250, '-xxxx.', NULL, NULL, NULL, NULL, 2, 2, 0.40, 1.60, NULL, '是', NULL, '2021-03-22 20:38:46', '2021-03-22 20:38:46');
INSERT INTO `tb_print_order` VALUES (251, '77', NULL, NULL, NULL, NULL, 1, 1, 0.80, 0.80, NULL, '否', NULL, '2021-03-23 23:00:17', '2021-03-23 23:00:17');

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
