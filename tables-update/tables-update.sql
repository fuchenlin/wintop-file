/*
FileName:tables-update.sql
Create:付陈林
Date:2017-5-23
Remark:tables-update.sql 用于每次数据库表结构及字段更新进行记录,
Help:如何获取到Table的更新语句，请查看同目录下的Word文档
*/

#Table Operate Example（表操作示例）

#1、create table（创建表）
/*
CREATE TABLE `manhourfee_discount` (
  `id` bigint(20) NOT NULL COMMENT '主键id',
  `start_time` timestamp NULL DEFAULT NULL COMMENT '折扣开始时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '折扣结束时间',
  `discount` decimal(5,2) DEFAULT NULL COMMENT '工时费的折扣',
  `service_network_id` bigint(11) DEFAULT NULL COMMENT '服务网点id',
  `service_network_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '服务网点名称',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `start_time` (`start_time`,`end_time`,`service_network_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
*/

#2、drop table(删除表)
/*
DROP TABLE IF EXISTS `manhourfee_discount`;
*/

#3、add column （添加字段）
/*
ALTER TABLE `logging_event_exception`
ADD COLUMN `test_id`  bigint(20) NULL AFTER `trace_line`;
*/

#4、delete column (删除字段)
/*
ALTER TABLE `logging_event_exception`
DROP COLUMN `trace_line`;
*/

#5、update column (更新字段)
/*
ALTER TABLE `logging_event_exception`
MODIFY COLUMN `trace_line`  bigint(254) NOT NULL AFTER `i`;
*/


# File Operate Example (文档操作示例)


/*
Operate Person:付陈林
Operate Time:2017-5-23
Operate Remark: manhourfee_discount 增加 test_id 、test_person 字段
Execute DataBase   develop、test、pro  (说明：表示语句已经在那些数据库中进行过执行，develop开发数据库、test测试数据库、pro表示生产数据库)
*/
#Execute statement(执行语句)
/*
执行语句不需要进行注释，本语句为示例进行了注释
ALTER TABLE `logging_event_exception`
  ADD COLUMN `test_id`  bigint(20) NULL AFTER `trace_line`;
*/
#Operate End



/*
Operate Person:付陈林
Operate Time:2017-6-5
Operate Remark: wt_product_type 增加 department_id 字段
Execute DataBase   develop
*/
ALTER TABLE `wt_product_type`
  ADD COLUMN `department_id`  bigint(20) NULL COMMENT '部门id' AFTER `del_flag`;


/*
Operate Person:付陈林
Operate Time:2017-6-5
Operate Remark: wt_product_brand 增加 department_id 字段
Execute DataBase   develop
*/
ALTER TABLE `wt_product_brand`
  ADD COLUMN `department_id`  bigint(20) NULL COMMENT '部门id' AFTER `del_flag`;

/*
Operate Person:付陈林
Operate Time:2017-6-5
Operate Remark: wt_service_type 增加 department_id 字段
Execute DataBase   develop
*/
ALTER TABLE `wt_service_type`
  ADD COLUMN `department_id`  bigint(20) NULL COMMENT '部门id' AFTER `del_flag`;


/*
Operate Person:付陈林
Operate Time:2017-6-21
Operate Remark: wt_member_stored_template  储值模板表  增加 present_sale_mutex  字段 修改 sale_mutex 为 stored_sale_mutex
Execute DataBase   develop
*/


/*
Operate Person:付陈林
Operate Time:2017-6-21
Operate Remark: wt_member_ constitution 增加会员章程表
Execute DataBase   develop
*/

CREATE TABLE `wt_member_ constitution` (
  `id`  bigint(20) NOT NULL COMMENT '主键' ,
  `service_network_id`  bigint(20) NULL COMMENT '4S店id' ,
  `department_id`  bigint(20) NULL COMMENT '部门id' ,
  `wecat_platform_id`  bigint(20) NULL COMMENT '平台id' ,
  `constitution_info`  varchar(512) NULL COMMENT '章程信息' ,
  `registration_info`  varchar(512) NULL COMMENT '注册协议' ,
  `create_person`  bigint(20) NULL COMMENT '创建人' ,
  `create_time`  timestamp NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间' ,
  `modify_person`  bigint(20) NULL COMMENT '修改人' ,
  `modify_time`  timestamp NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
  PRIMARY KEY (`id`)
);


/*
Operate Person:付陈林
Operate Time:2017-6-21
Operate Remark: wt_condition_parameter 增加条件参数
Execute DataBase   develop
*/
CREATE TABLE `wt_condition_parameter` (
  `id`  bigint(20) NOT NULL COMMENT '主键' ,
  `service_network_id`  bigint(20) NULL COMMENT '4S店主键' ,
  `department_id`  bigint(20) NULL COMMENT '部门主键' ,
  `wecat_platform_id`  bigint(20) NULL COMMENT '平台主键' ,
  `parameter_name`  varchar(255) NULL COMMENT '参数名称' ,
  `parameter_code`  varchar(255) NULL COMMENT '变量名' ,
  `create_person`  bigint(20) NULL COMMENT '创建人' ,
  `create_time`  timestamp NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间' ,
  `modify_person`  bigint(20) NULL COMMENT '修改人' ,
  `modify_time`  timestamp NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
  PRIMARY KEY (`id`)
);

/*
Operate Person:付陈林
Operate Time:2017-6-21
Operate Remark: wt_integral_accumulate_rule 增加积分累计规则表
Execute DataBase   develop
*/

CREATE TABLE `wt_integral_accumulate_rule` (
  `id`  bigint(20) NOT NULL COMMENT '主键' ,
  `service_network_id`  bigint(20) NULL COMMENT '4S店主键' ,
  `department_id`  bigint(20) NULL COMMENT '部门主键' ,
  `wecat_platform_id`  bigint(20) NULL COMMENT '平台主键' ,
  `name`  varchar(255) NULL COMMENT '规则名称' ,
  `code`  varchar(255) NULL COMMENT '规则编码' ,
  `operation_source`  enum('0','1') NULL DEFAULT '0' COMMENT '业务来源 ‘0’ 储值  ‘1’消费' ,
  `status`  enum('0','1') NULL DEFAULT '0' COMMENT '状态  ‘0’ 启用  ‘1’禁用' ,
  `remark`  varchar(255) NULL COMMENT '状态' ,
  `rule_formula`  varchar(255) NULL COMMENT '规则公式' ,
  `integral_type`  enum('0','1','2') NULL DEFAULT '0' COMMENT '积分类型 ‘0’ 不参与积分‘1’一次性积分，‘2’按比例积分' ,
  `cost_type`  enum('0','1','2','3') NULL DEFAULT '0' COMMENT '费用类型 0不限制，1工时费，2材料费，3保险费' ,
  `integeral_num`  decimal(10,2) NULL COMMENT '一次性积分数' ,
  `amount_scale`  decimal(10,2) NULL COMMENT '金额参与比例' ,
  `integeral_scale`  decimal(10,2) NULL COMMENT '积分累计比例' ,
  `settlement`  enum('0','1','2','3') NULL DEFAULT '0' COMMENT '结算方式 1:四舍五入 2:向上取整 3‘抹零’' ,
  `create_person`  bigint(20) NULL COMMENT '创建人' ,
  `create_time`  timestamp NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间' ,
  `modify_person`  bigint(20) NULL COMMENT '修改人' ,
  `modify_time`  timestamp NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
  PRIMARY KEY (`id`)
);

/*
Operate Person:付陈林
Operate Time:2017-6-21
Operate Remark: wt_integral_accumulate_term 增加积分累计规则条件
Execute DataBase   develop
*/

CREATE TABLE `wt_integral_accumulate_term` (
  `id`  bigint(20) NOT NULL COMMENT '主键' ,
  `integral_accumulate_rule_id`  bigint(20) NULL COMMENT '积分累计规则主键' ,
  `left_bracket`  varchar(20) NULL COMMENT '左括号' ,
  `condition_parameter_id`  bigint(20) NULL COMMENT '条件参数' ,
  `compare_sign`  enum('0','1','2','3','4') NULL DEFAULT '0' COMMENT '比较符号 ‘0’等于，‘1’大于，‘2’大于等于，‘3’小于，‘4’小于等于' ,
  `compare_value`  decimal(10,2) NULL COMMENT '比较值' ,
  `right_bracket`  varchar(20) NULL COMMENT '右括号' ,
  `logic_sign`  enum('0','1') NULL DEFAULT '0' COMMENT '与下一表达式关系  ‘0’ 且  ‘1’或' ,
  PRIMARY KEY (`id`)
);


/*
Operate Person:付陈林
Operate Time:2017-6-21
Operate Remark: wt_integral_deduction_rule 增加积分抵现规则表
Execute DataBase   develop
*/

CREATE TABLE `wt_integral_deduction_rule` (
  `id`  bigint(20) NOT NULL COMMENT '主键' ,
  `service_network_id`  bigint(20) NULL COMMENT '4S店主键' ,
  `department_id`  bigint(20) NULL COMMENT '部门主键' ,
  `wecat_platform_id`  bigint(20) NULL COMMENT '平台主键' ,
  `name`  varchar(255) NULL COMMENT '规则名称' ,
  `code`  varchar(255) NULL COMMENT '规则编码' ,
  `operation_source`  enum('1') NULL DEFAULT '1' COMMENT '业务来源  ‘1’消费结账' ,
  `status`  enum('0','1') NULL DEFAULT '0' COMMENT '状态 ‘0’ 启用  ‘1’禁用' ,
  `remark`  varchar(255) NULL COMMENT '状态' ,
  `rule_formula`  varchar(255) NULL COMMENT '规则公式' ,
  `deduction_type`  enum('0','1') NULL DEFAULT '0' COMMENT '抵现类型 ‘0’不参与 ‘1’参与' ,
  `cost_type`  enum('0','1','2','3') NULL DEFAULT '0' COMMENT '费用类型 0不限制，1工时费，2材料费，3保险费' ,
  `amount_scale`  decimal(10,2) NULL COMMENT '金额可抵现最高比例' ,
  `attach_scale`  decimal(10,2) NULL COMMENT '积分可抵现最高比例' ,
  `deduction_scale`  decimal(10,2) NULL COMMENT '抵现比例' ,
  `create_person`  bigint(20) NULL COMMENT '创建人' ,
  `create_time`  timestamp NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间' ,
  `modify_person`  bigint(20) NULL COMMENT '修改人' ,
  `modify_time`  timestamp NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
  PRIMARY KEY (`id`)
);

/*
Operate Person:付陈林
Operate Time:2017-6-21
Operate Remark: wt_integral_deduction_term 增加积分抵现规则条件
Execute DataBase   develop
*/

CREATE TABLE `wt_integral_deduction_term` (
  `id`  bigint(20) NOT NULL COMMENT '主键' ,
  `integral_deduction_rule_id`  bigint(20) NULL COMMENT '积分抵现规则主键' ,
  `left_bracket`  varchar(20) NULL COMMENT '左括号' ,
  `condition_parameter_id`  bigint(20) NULL COMMENT '条件参数' ,
  `compare_sign`  enum('0','1','2','3','4') NULL DEFAULT '0' COMMENT '比较符号 ‘0’等于，‘1’大于，‘2’大于等于，‘3’小于，‘4’小于等于' ,
  `compare_value`  decimal(10,2) NULL COMMENT '比较值' ,
  `right_bracket`  varchar(20) NULL COMMENT '右括号' ,
  `logic_sign`  enum('0','1') NULL DEFAULT '0' COMMENT '与下一表达式关系  ‘0’ 且  ‘1’或' ,
  PRIMARY KEY (`id`)
);

/*
Operate Person:付陈林
Operate Time:2017-6-21
Operate Remark: wt_discount_rule 增加优惠折扣规则表
Execute DataBase   develop
*/

CREATE TABLE `wt_discount_rule` (
  `id`  bigint(20) NOT NULL COMMENT '主键' ,
  `service_network_id`  bigint(20) NULL COMMENT '4S店主键' ,
  `department_id`  bigint(20) NULL COMMENT '部门主键' ,
  `wecat_platform_id`  bigint(20) NULL COMMENT '平台主键' ,
  `name`  varchar(255) NULL COMMENT '规则名称' ,
  `code`  varchar(255) NULL COMMENT '规则编码' ,
  `operation_source`  enum('1') NULL DEFAULT '1' COMMENT '业务来源  ‘1’消费结账' ,
  `status`  enum('0','1') NULL DEFAULT '0' COMMENT '状态 ‘0’ 启用  ‘1’禁用' ,
  `remark`  varchar(255) NULL COMMENT '状态' ,
  `rule_formula`  varchar(255) NULL COMMENT '规则公式' ,
  `discount_type`  enum('0','1') NULL DEFAULT '0' COMMENT '优惠类型 ‘0’不打折 ‘1’打折' ,
  `cost_type`  enum('0','1','2','3') NULL DEFAULT '0' COMMENT '费用类型 0不限制，1工时费，2材料费，3保险费' ,
  `discount_scale`  decimal(10,2) NULL COMMENT '大多少折，按百分比计算' ,
  `create_person`  bigint(20) NULL COMMENT '创建人' ,
  `create_time`  timestamp NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间' ,
  `modify_person`  bigint(20) NULL COMMENT '修改人' ,
  `modify_time`  timestamp NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
  PRIMARY KEY (`id`)
);

/*
Operate Person:付陈林
Operate Time:2017-6-21
Operate Remark: wt_discount_term 增加优惠折扣规则条件
Execute DataBase   develop
*/

CREATE TABLE `wt_discount_term` (
  `id`  bigint(20) NOT NULL COMMENT '主键' ,
  `discount_rule_id`  bigint(20) NULL COMMENT '优惠折扣规则主键' ,
  `left_bracket`  varchar(20) NULL COMMENT '左括号' ,
  `condition_parameter_id`  bigint(20) NULL COMMENT '条件参数' ,
  `compare_sign`  enum('0','1','2','3','4') NULL DEFAULT '0' COMMENT '比较符号 ‘0’等于，‘1’大于，‘2’大于等于，‘3’小于，‘4’小于等于' ,
  `compare_value`  decimal(10,2) NULL COMMENT '比较值' ,
  `right_bracket`  varchar(20) NULL COMMENT '右括号' ,
  `logic_sign`  enum('0','1') NULL DEFAULT '0' COMMENT '与下一表达式关系  ‘0’ 且  ‘1’或' ,
  PRIMARY KEY (`id`)
);

/*
Operate Person:付陈林
Operate Time:2017-6-21
Operate Remark: wt_integral_accumulate_tactics 增加积分累计策略表
Execute DataBase   develop
*/

CREATE TABLE `wt_integral_accumulate_tactics` (
  `id`  bigint(20) NOT NULL COMMENT '主键' ,
  `service_network_id`  bigint(20) NULL COMMENT '4S店主键' ,
  `department_id`  bigint(20) NULL COMMENT '部门主键' ,
  `wecat_platform_id`  bigint(20) NULL COMMENT '平台主键' ,
  `name`  varchar(255) NULL COMMENT '策略名称' ,
  `code`  varchar(255) NULL COMMENT '策略编码' ,
  `status`  enum('0','1','2','3') NULL DEFAULT '0' COMMENT '状态  ‘0’未审批 ‘1’已审批 ‘2’启用 ‘3’禁用' ,
  `remark`  varchar(255) NULL COMMENT '备注' ,
  `create_person`  bigint(20) NULL COMMENT '创建人' ,
  `create_time`  timestamp NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间' ,
  `modify_person`  bigint(20) NULL COMMENT '修改人' ,
  `modify_time`  timestamp NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
  PRIMARY KEY (`id`)
);

/*
Operate Person:付陈林
Operate Time:2017-6-21
Operate Remark: wt_integral_accumulate_entry 增加积分累计策略分录
Execute DataBase   develop
*/

CREATE TABLE `wt_integral_accumulate_entry` (
  `id`  bigint(20) NOT NULL COMMENT '主键' ,
  `integral_accumulate_tactics_id`  bigint(20) NULL COMMENT '积分累计策略主键' ,
  `integral_accumulate_rule_id`  bigint(20) NULL COMMENT '积分累计规则主键' ,
  PRIMARY KEY (`id`)
);

/*
Operate Person:付陈林
Operate Time:2017-6-21
Operate Remark: wt_integral_accumulate_approve 增加积分累计策略审批
Execute DataBase   develop
*/

CREATE TABLE `wt_integral_accumulate_approve` (
  `id`  bigint(20) NOT NULL ,
  `integral_accumulate_tactics_id`  bigint(20) NULL ,
  `approve_person_id`  bigint(20) NULL ,
  `approve_opinion`  varchar(255) NULL ,
  `approve_result`  enum('0','1') NULL DEFAULT '0' COMMENT '审批结果 ‘0’通过‘1’ 不通过' ,
  PRIMARY KEY (`id`)
);


/*
Operate Person:付陈林
Operate Time:2017-6-21
Operate Remark: wt_integral_deduction_tactics 增加积分抵现策略表
Execute DataBase   develop
*/

CREATE TABLE `wt_integral_deduction_tactics` (
  `id`  bigint(20) NOT NULL COMMENT '主键' ,
  `service_network_id`  bigint(20) NULL COMMENT '4S店主键' ,
  `department_id`  bigint(20) NULL COMMENT '部门主键' ,
  `wecat_platform_id`  bigint(20) NULL COMMENT '平台主键' ,
  `name`  varchar(255) NULL COMMENT '策略名称' ,
  `code`  varchar(255) NULL COMMENT '策略编码' ,
  `status`  enum('0','1','2','3') NULL DEFAULT '0' COMMENT '状态  ‘0’未审批 ‘1’已审批 ‘2’启用 ‘3’禁用' ,
  `remark`  varchar(255) NULL COMMENT '备注' ,
  `create_person`  bigint(20) NULL COMMENT '创建人' ,
  `create_time`  timestamp NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间' ,
  `modify_person`  bigint(20) NULL COMMENT '修改人' ,
  `modify_time`  timestamp NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
  PRIMARY KEY (`id`)
);

/*
Operate Person:付陈林
Operate Time:2017-6-21
Operate Remark: wt_integral_deduction_entry 增加积分抵现策略分录
Execute DataBase   develop
*/

CREATE TABLE `wt_integral_deduction_entry` (
  `id`  bigint(20) NOT NULL COMMENT '主键' ,
  `integral_deduction_tactics_id`  bigint(20) NULL COMMENT '积分抵现策略主键' ,
  `integral_deduction_rule_id`  bigint(20) NULL COMMENT '积分抵现规则主键' ,
  PRIMARY KEY (`id`)
);

/*
Operate Person:付陈林
Operate Time:2017-6-21
Operate Remark: wt_integral_deduction_approve 增加积分抵现策略审批
Execute DataBase   develop
*/

CREATE TABLE `wt_integral_deduction_approve` (
  `id`  bigint(20) NOT NULL ,
  `integral_deduction_tactics_id`  bigint(20) NULL ,
  `approve_person_id`  bigint(20) NULL ,
  `approve_opinion`  varchar(255) NULL ,
  `approve_result`  enum('0','1') NULL DEFAULT '0' COMMENT '审批结果 ‘0’通过‘1’ 不通过' ,
  PRIMARY KEY (`id`)
);


/*
Operate Person:付陈林
Operate Time:2017-6-21
Operate Remark: wt_discount_tactics 增加优惠折扣策略表
Execute DataBase   develop
*/

CREATE TABLE `wt_discount_tactics` (
  `id`  bigint(20) NOT NULL COMMENT '主键' ,
  `service_network_id`  bigint(20) NULL COMMENT '4S店主键' ,
  `department_id`  bigint(20) NULL COMMENT '部门主键' ,
  `wecat_platform_id`  bigint(20) NULL COMMENT '平台主键' ,
  `name`  varchar(255) NULL COMMENT '策略名称' ,
  `code`  varchar(255) NULL COMMENT '策略编码' ,
  `status`  enum('0','1','2','3') NULL DEFAULT '0' COMMENT '状态  ‘0’未审批 ‘1’已审批 ‘2’启用 ‘3’禁用' ,
  `remark`  varchar(255) NULL COMMENT '备注' ,
  `create_person`  bigint(20) NULL COMMENT '创建人' ,
  `create_time`  timestamp NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间' ,
  `modify_person`  bigint(20) NULL COMMENT '修改人' ,
  `modify_time`  timestamp NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间' ,
  PRIMARY KEY (`id`)
);

/*
Operate Person:付陈林
Operate Time:2017-6-21
Operate Remark: wt_discount_entry 增加优惠折扣策略分录
Execute DataBase   develop
*/

CREATE TABLE `wt_discount_entry` (
  `id`  bigint(20) NOT NULL COMMENT '主键' ,
  `discount_tactics_id`  bigint(20) NULL COMMENT '优惠折扣策略主键' ,
  `discount_rule_id`  bigint(20) NULL COMMENT '优惠折扣规则主键' ,
  PRIMARY KEY (`id`)
);

/*
Operate Person:付陈林
Operate Time:2017-6-21
Operate Remark: wt_discount_approve 增加优惠折扣策略审批
Execute DataBase   develop
*/

CREATE TABLE `wt_discount_approve` (
  `id`  bigint(20) NOT NULL ,
  `discount_tactics_id`  bigint(20) NULL ,
  `approve_person_id`  bigint(20) NULL ,
  `approve_opinion`  varchar(255) NULL ,
  `approve_result`  enum('0','1') NULL DEFAULT '0' COMMENT '审批结果 ‘0’通过‘1’ 不通过' ,
  PRIMARY KEY (`id`)
);


/*
Operate Person:付陈林
Operate Time:2017-6-21
Operate Remark: wt_member_rank  会员级别表中增加  integral_accumulate_tactics_id ，integral_deduction_tactics_id，discount_tactics_id 字段
Execute DataBase   develop
*/

ALTER TABLE `wt_member_rank`
  MODIFY COLUMN `is_open`  enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '\n是否启用 \'0\'启用  ‘1’ 禁用' AFTER `code`,
  ADD COLUMN `integral_accumulate_tactics_id`  bigint(20) NULL COMMENT '积分累计策略' AFTER `is_open`,
  ADD COLUMN `integral_deduction_tactics_id`  bigint(20) NULL COMMENT '积分抵现策略' AFTER `integral_accumulate_tactics_id`,
  ADD COLUMN `discount_tactics_id`  bigint(20) NULL COMMENT '优惠折扣策略' AFTER `integral_deduction_tactics_id`;


