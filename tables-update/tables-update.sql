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




