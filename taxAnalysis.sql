/*
 Navicat MySQL Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost
 Source Database       : taxAnalysis

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : utf-8

 Date: 02/17/2020 20:01:28 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `admin_info`
-- ----------------------------
DROP TABLE IF EXISTS `admin_info`;
CREATE TABLE `admin_info` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `admin_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '管理员名称',
  `admin_pass` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '管理员密码',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `black_list`
-- ----------------------------
DROP TABLE IF EXISTS `black_list`;
CREATE TABLE `black_list` (
  `black_list_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '黑名单ID',
  `taxPayer_id` int(11) DEFAULT NULL COMMENT '企业纳税人ID',
  `taxPayer_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '企业纳税人姓名',
  PRIMARY KEY (`black_list_id`),
  KEY `taxPayer_id` (`taxPayer_id`),
  CONSTRAINT `bl_taxPayer_id` FOREIGN KEY (`taxPayer_id`) REFERENCES `enterprise_info` (`taxPayer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `enter_log_info`
-- ----------------------------
DROP TABLE IF EXISTS `enter_log_info`;
CREATE TABLE `enter_log_info` (
  `enter_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '企业登录名',
  `enter_log_pass` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '企业登录密码',
  `taxPayer_id` int(11) DEFAULT NULL COMMENT '企业编号',
  PRIMARY KEY (`enter_log_id`),
  KEY `taxPayer_id` (`taxPayer_id`),
  CONSTRAINT `el_taxPayer_id` FOREIGN KEY (`taxPayer_id`) REFERENCES `enterprise_info` (`taxPayer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `enterprise_info`
-- ----------------------------
DROP TABLE IF EXISTS `enterprise_info`;
CREATE TABLE `enterprise_info` (
  `taxPayer_id` int(11) NOT NULL COMMENT '企业纳税人ID',
  `taxPayer_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '企业纳税人姓名',
  `enter_address` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '地址',
  `tax_log_date` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '税务登记日期',
  `tax_authority_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '主管税务机关名称',
  `adm_region` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '注册地',
  `legal_rep_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '法定代表人姓名',
  `legal_rep_id` int(11) DEFAULT NULL COMMENT '法定代表人ID',
  `financial_per_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL COMMENT '财务负责人姓名',
  `financial_per_id` int(11) DEFAULT NULL COMMENT '财务负责人ID',
  PRIMARY KEY (`taxPayer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `false_enter_info`
-- ----------------------------
DROP TABLE IF EXISTS `false_enter_info`;
CREATE TABLE `false_enter_info` (
  `taxPayer_id` int(11) DEFAULT NULL COMMENT '企业纳税人ID',
  `taxPayer_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '企业纳税人姓名',
  `false_month` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '虚开月份',
  `false_amount` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '虚开总金额',
  `false_enter_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '虚开企业清单编号',
  PRIMARY KEY (`false_enter_id`),
  KEY `taxPayer_id` (`taxPayer_id`),
  CONSTRAINT `f_taxPayer_id` FOREIGN KEY (`taxPayer_id`) REFERENCES `enterprise_info` (`taxPayer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `false_pur_info`
-- ----------------------------
DROP TABLE IF EXISTS `false_pur_info`;
CREATE TABLE `false_pur_info` (
  `false_pur_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '虚开货物明细编号',
  `taxPayer_id` int(11) DEFAULT NULL COMMENT '企业纳税人ID',
  `invoice_id` int(11) DEFAULT NULL COMMENT '发票ID',
  `invoice_date` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '发票日期',
  `pur_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品名',
  `pur_amount` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '货物金额',
  `standard_pur_id` int(11) DEFAULT NULL COMMENT '标准货物编号',
  `standard_pur_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '标准货物名称',
  `false_enter_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`false_pur_id`),
  KEY `taxPayer_id` (`taxPayer_id`),
  KEY `invoice_id` (`invoice_id`),
  KEY `standard_pur_id` (`standard_pur_id`),
  KEY `false_enter_id` (`false_enter_id`),
  CONSTRAINT `ff_enter_id` FOREIGN KEY (`false_enter_id`) REFERENCES `false_enter_info` (`false_enter_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fp_invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `invoice_details` (`invoice_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fp_standard_id` FOREIGN KEY (`standard_pur_id`) REFERENCES `standard_words` (`standard_pur_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fp_taxPayer_id` FOREIGN KEY (`taxPayer_id`) REFERENCES `enterprise_info` (`taxPayer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `false_team`
-- ----------------------------
DROP TABLE IF EXISTS `false_team`;
CREATE TABLE `false_team` (
  `false_team_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '虚开团队ID',
  `false_team_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '团队类型（法定代表人相同、财务负责人相同、法定代表人财务负责人相同）',
  `incharge_id` int(11) DEFAULT NULL COMMENT '团队负责人ID',
  PRIMARY KEY (`false_team_id`),
  KEY `incharge_id` (`incharge_id`),
  CONSTRAINT `ff_incharge_id` FOREIGN KEY (`incharge_id`) REFERENCES `false_team_incharge` (`incharge_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `false_team_detail`
-- ----------------------------
DROP TABLE IF EXISTS `false_team_detail`;
CREATE TABLE `false_team_detail` (
  `false_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `false_team_id` int(11) DEFAULT NULL,
  `taxPayer_id` int(11) DEFAULT NULL,
  `taxPayer_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`false_detail_id`),
  KEY `false_team_id` (`false_team_id`),
  CONSTRAINT `ff_false_team_id` FOREIGN KEY (`false_team_id`) REFERENCES `false_team` (`false_team_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `false_team_incharge`
-- ----------------------------
DROP TABLE IF EXISTS `false_team_incharge`;
CREATE TABLE `false_team_incharge` (
  `incharge_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '团队负责人表ID',
  `incharge_per_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '团队负责人姓名',
  `taxPayer_id` int(11) DEFAULT NULL COMMENT '所在企业纳税人ID',
  `incharge_per_id` int(11) DEFAULT NULL COMMENT '团队负责人ID',
  PRIMARY KEY (`incharge_id`),
  KEY `incharge_id` (`incharge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `invoice_details`
-- ----------------------------
DROP TABLE IF EXISTS `invoice_details`;
CREATE TABLE `invoice_details` (
  `invoice_id` int(11) NOT NULL COMMENT '发票ID',
  `invoice_date` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '发票日期',
  `buyer_taxPayer_id` int(11) DEFAULT NULL COMMENT '购货公司纳税人ID',
  `pur_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '货物名称',
  `pur_amount` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '货物金额',
  `pur_sale_date` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '货物销售日期',
  `provider_taxPayer_id` int(11) DEFAULT NULL COMMENT '售货人企业纳税人ID',
  PRIMARY KEY (`invoice_id`),
  KEY `buyer_taxPayer_id` (`buyer_taxPayer_id`),
  KEY `provider_taxPayer_id` (`provider_taxPayer_id`),
  CONSTRAINT `in_buyer_id` FOREIGN KEY (`buyer_taxPayer_id`) REFERENCES `enterprise_info` (`taxPayer_id`),
  CONSTRAINT `in_provider_id` FOREIGN KEY (`provider_taxPayer_id`) REFERENCES `enterprise_info` (`taxPayer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `ledger_in`
-- ----------------------------
DROP TABLE IF EXISTS `ledger_in`;
CREATE TABLE `ledger_in` (
  `taxPayer_id` int(11) DEFAULT NULL COMMENT '企业纳税人ID（购货方）',
  `standard_pur_id` int(11) DEFAULT NULL COMMENT '标准货物ID',
  `standard_pur_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '标准货物名称',
  `pur_amount` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '购进货物总金额',
  `ledger_date` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '购进时间',
  `ledger_in_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购进ID',
  `invoice_id` int(11) DEFAULT NULL COMMENT '发票ID',
  PRIMARY KEY (`ledger_in_id`),
  KEY `taxPayer_id` (`taxPayer_id`),
  KEY `standard_pur_id` (`standard_pur_id`),
  KEY `invoice_id` (`invoice_id`),
  CONSTRAINT `lii_invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `invoice_details` (`invoice_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lin_standard_id` FOREIGN KEY (`standard_pur_id`) REFERENCES `standard_words` (`standard_pur_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lin_taxPayer_id` FOREIGN KEY (`taxPayer_id`) REFERENCES `enterprise_info` (`taxPayer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `ledger_out`
-- ----------------------------
DROP TABLE IF EXISTS `ledger_out`;
CREATE TABLE `ledger_out` (
  `ledger_out_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '售货ID',
  `ledger_date` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '售货日期',
  `taxPayer_id` int(11) DEFAULT NULL COMMENT '企业纳税人ID（售货方）',
  `standard_pur_id` int(11) DEFAULT NULL COMMENT '标准商品ID',
  `standard_pur_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '标准商品名称',
  `pur_amount` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '销售商品总额',
  `invoice_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ledger_out_id`),
  KEY `taxPayer_id` (`taxPayer_id`),
  KEY `standard_pur_id` (`standard_pur_id`),
  KEY `invoice_id` (`invoice_id`),
  CONSTRAINT `loi_invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `invoice_details` (`invoice_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lout_standard_id` FOREIGN KEY (`standard_pur_id`) REFERENCES `standard_words` (`standard_pur_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lout_taxPayer_id` FOREIGN KEY (`taxPayer_id`) REFERENCES `enterprise_info` (`taxPayer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `match_detail`
-- ----------------------------
DROP TABLE IF EXISTS `match_detail`;
CREATE TABLE `match_detail` (
  `match_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '匹配表主键',
  `pur_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '发票上货物名称',
  `invoice_id` int(11) DEFAULT NULL COMMENT '发票ID',
  `match_content` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '匹配内容（模拟词库的ID+内容；...）',
  `match_flag` int(11) DEFAULT NULL COMMENT '是否已经匹配完成（1：完成；0：未完成）',
  PRIMARY KEY (`match_id`),
  KEY `invoice_id` (`invoice_id`),
  CONSTRAINT `mi_invoice_id` FOREIGN KEY (`invoice_id`) REFERENCES `invoice_details` (`invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `not_match_info`
-- ----------------------------
DROP TABLE IF EXISTS `not_match_info`;
CREATE TABLE `not_match_info` (
  `not_match_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '不匹配清单ID',
  `taxPayer_id` int(11) DEFAULT NULL COMMENT '企业纳税人ID',
  `compare_month` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '对比月份',
  `compare_result` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '对比结果（销售大于进货，有进货无销售）',
  `standard_pur_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '标准货物名称',
  `pur_amount` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '销售总金额',
  `buy_amount` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '购进总金额',
  `this_total_sale` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '本期总销售额',
  `this_total_buy` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '本期总购买额',
  `risk_check_flag` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '风险核实标志',
  `risk_check_result` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '风险核实结果（Y/N）',
  `standard_pur_id` int(11) DEFAULT NULL COMMENT '标准货物ID',
  PRIMARY KEY (`not_match_id`),
  KEY `taxPayer_id` (`taxPayer_id`),
  KEY `standard_pur_id` (`standard_pur_id`),
  CONSTRAINT `nm_standars_id` FOREIGN KEY (`standard_pur_id`) REFERENCES `standard_words` (`standard_pur_id`),
  CONSTRAINT `nm_taxPayer_id` FOREIGN KEY (`taxPayer_id`) REFERENCES `enterprise_info` (`taxPayer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `s_and_s`
-- ----------------------------
DROP TABLE IF EXISTS `s_and_s`;
CREATE TABLE `s_and_s` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '关联表主键',
  `standard_id` int(11) DEFAULT NULL COMMENT '标准词库',
  `simulation_id` int(11) DEFAULT NULL COMMENT '模拟词库id',
  PRIMARY KEY (`ID`),
  KEY `standard_id` (`standard_id`),
  KEY `simulation_id` (`simulation_id`),
  CONSTRAINT `ss_simulation` FOREIGN KEY (`simulation_id`) REFERENCES `simulation_words` (`simulation_word_id`) ON DELETE CASCADE,
  CONSTRAINT `ss_standard` FOREIGN KEY (`standard_id`) REFERENCES `standard_words` (`standard_pur_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `simulation_words`
-- ----------------------------
DROP TABLE IF EXISTS `simulation_words`;
CREATE TABLE `simulation_words` (
  `simulation_word_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '模拟词库ID',
  `simulation_pur_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '模拟商品名',
  PRIMARY KEY (`simulation_word_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `standard_words`
-- ----------------------------
DROP TABLE IF EXISTS `standard_words`;
CREATE TABLE `standard_words` (
  `standard_pur_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标准商品编号',
  `standard_pur_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '标准商品名',
  `pur_first_category` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品所属大类',
  `pur_second_category` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品所属中类',
  `pur_third_category` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品所属小类',
  PRIMARY KEY (`standard_pur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

SET FOREIGN_KEY_CHECKS = 1;
