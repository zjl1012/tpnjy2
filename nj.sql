/*
Navicat MySQL Data Transfer

Source Server         : njy
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : njy

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-12-29 16:31:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for v_action
-- ----------------------------
DROP TABLE IF EXISTS `v_action`;
CREATE TABLE `v_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text COMMENT '行为规则',
  `log` text COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='系统行为表';

-- ----------------------------
-- Records of v_action
-- ----------------------------
INSERT INTO `v_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', '1', '1', '1387181220');
INSERT INTO `v_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '0', '1380173180');
INSERT INTO `v_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '1', '1383285646');
INSERT INTO `v_action` VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', '2', '0', '1386139726');
INSERT INTO `v_action` VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', '2', '0', '1383285551');
INSERT INTO `v_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988');
INSERT INTO `v_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1383295057');
INSERT INTO `v_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1383295963');
INSERT INTO `v_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301');
INSERT INTO `v_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1383296392');
INSERT INTO `v_action` VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '', '1', '1', '1383296765');

-- ----------------------------
-- Table structure for v_action_log
-- ----------------------------
DROP TABLE IF EXISTS `v_action_log`;
CREATE TABLE `v_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`) USING BTREE,
  KEY `action_id_ix` (`action_id`) USING BTREE,
  KEY `user_id_ix` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=810 DEFAULT CHARSET=utf8 COMMENT='行为日志表';

-- ----------------------------
-- Records of v_action_log
-- ----------------------------
INSERT INTO `v_action_log` VALUES ('1', '1', '2', '2130706433', 'member', '2', 'test在2014-10-28 14:04登录了后台', '1', '1414476249');
INSERT INTO `v_action_log` VALUES ('2', '1', '2', '2130706433', 'member', '2', 'test在2014-10-28 14:37登录了后台', '1', '1414478229');
INSERT INTO `v_action_log` VALUES ('3', '11', '1', '2130706433', 'category', '2', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1414483694');
INSERT INTO `v_action_log` VALUES ('4', '1', '1', '2130706433', 'member', '1', 'Administrator在2014-10-28 16:09登录了后台', '1', '1414483761');
INSERT INTO `v_action_log` VALUES ('5', '11', '1', '2130706433', 'category', '2', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1414483784');
INSERT INTO `v_action_log` VALUES ('6', '11', '1', '2130706433', 'category', '2', '操作url：/index.php?s=/Admin/Category/edit.html', '1', '1414483983');
INSERT INTO `v_action_log` VALUES ('7', '1', '1', '2130706433', 'member', '1', 'Administrator在2014-11-06 18:15登录了后台', '1', '1415268952');
INSERT INTO `v_action_log` VALUES ('8', '1', '1', '2130706433', 'member', '1', 'Administrator在2014-11-06 19:26登录了后台', '1', '1415273210');
INSERT INTO `v_action_log` VALUES ('9', '1', '1', '2130706433', 'member', '1', 'Administrator在2014-11-17 16:40登录了后台', '1', '1416213605');
INSERT INTO `v_action_log` VALUES ('10', '1', '1', '2130706433', 'member', '1', 'Administrator在2014-11-18 13:39登录了后台', '1', '1416289167');
INSERT INTO `v_action_log` VALUES ('11', '1', '1', '2130706433', 'member', '1', 'Administrator在2014-11-18 16:38登录了后台', '1', '1416299900');
INSERT INTO `v_action_log` VALUES ('12', '1', '1', '2130706433', 'member', '1', 'Administrator在2014-11-18 16:45登录了后台', '1', '1416300317');
INSERT INTO `v_action_log` VALUES ('13', '1', '1', '2130706433', 'member', '1', 'Administrator在2014-11-19 11:44登录了后台', '1', '1416368658');
INSERT INTO `v_action_log` VALUES ('14', '6', '1', '2130706433', 'config', '35', '操作url：/admin.php?s=/Config/edit.html', '1', '1416396738');
INSERT INTO `v_action_log` VALUES ('15', '6', '1', '2130706433', 'config', '35', '操作url：/admin.php?s=/Config/edit.html', '1', '1416396765');
INSERT INTO `v_action_log` VALUES ('16', '8', '1', '2130706433', 'attribute', '33', '操作url：/admin.php?s=/Attribute/update.html', '1', '1416631164');
INSERT INTO `v_action_log` VALUES ('17', '7', '1', '2130706433', 'model', '2', '操作url：/admin.php?s=/Model/update.html', '1', '1416631264');
INSERT INTO `v_action_log` VALUES ('18', '7', '1', '2130706433', 'model', '2', '操作url：/admin.php?s=/Model/update.html', '1', '1416631398');
INSERT INTO `v_action_log` VALUES ('19', '7', '1', '2130706433', 'model', '2', '操作url：/admin.php?s=/Model/update.html', '1', '1416631636');
INSERT INTO `v_action_log` VALUES ('20', '7', '1', '2130706433', 'model', '4', '操作url：/admin.php?s=/Model/update.html', '1', '1416632258');
INSERT INTO `v_action_log` VALUES ('21', '7', '1', '2130706433', 'model', '4', '操作url：/admin.php?s=/Model/update.html', '1', '1416632670');
INSERT INTO `v_action_log` VALUES ('22', '8', '1', '2130706433', 'attribute', '34', '操作url：/admin.php?s=/Attribute/update.html', '1', '1416633147');
INSERT INTO `v_action_log` VALUES ('23', '8', '1', '2130706433', 'attribute', '35', '操作url：/admin.php?s=/Attribute/update.html', '1', '1416633385');
INSERT INTO `v_action_log` VALUES ('24', '7', '1', '2130706433', 'model', '4', '操作url：/admin.php?s=/Model/update.html', '1', '1416634213');
INSERT INTO `v_action_log` VALUES ('25', '7', '1', '2130706433', 'model', '5', '操作url：/admin.php?s=/Model/update.html', '1', '1416634320');
INSERT INTO `v_action_log` VALUES ('26', '7', '1', '2130706433', 'model', '5', '操作url：/admin.php?s=/Model/update.html', '1', '1416634343');
INSERT INTO `v_action_log` VALUES ('27', '8', '1', '2130706433', 'attribute', '36', '操作url：/admin.php?s=/Attribute/update.html', '1', '1416634641');
INSERT INTO `v_action_log` VALUES ('28', '8', '1', '2130706433', 'attribute', '37', '操作url：/admin.php?s=/Attribute/update.html', '1', '1416634913');
INSERT INTO `v_action_log` VALUES ('29', '7', '1', '2130706433', 'model', '5', '操作url：/admin.php?s=/Model/update.html', '1', '1416634933');
INSERT INTO `v_action_log` VALUES ('30', '7', '1', '2130706433', 'model', '5', '操作url：/admin.php?s=/Model/update.html', '1', '1416635824');
INSERT INTO `v_action_log` VALUES ('31', '11', '1', '2130706433', 'category', '39', '操作url：/admin.php?s=/Category/add.html', '1', '1416635925');
INSERT INTO `v_action_log` VALUES ('32', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/add.html', '1', '1416635996');
INSERT INTO `v_action_log` VALUES ('33', '11', '1', '2130706433', 'category', '41', '操作url：/admin.php?s=/Category/add.html', '1', '1416636058');
INSERT INTO `v_action_log` VALUES ('34', '11', '1', '2130706433', 'category', '42', '操作url：/admin.php?s=/Category/add.html', '1', '1416636085');
INSERT INTO `v_action_log` VALUES ('35', '9', '1', '2130706433', 'channel', '0', '操作url：/admin.php?s=/Channel/del/id/3.html', '1', '1416636989');
INSERT INTO `v_action_log` VALUES ('36', '11', '1', '2130706433', 'category', '39', '操作url：/admin.php?s=/Category/remove/id/39.html', '1', '1416637149');
INSERT INTO `v_action_log` VALUES ('37', '11', '1', '2130706433', 'category', '43', '操作url：/admin.php?s=/Category/add.html', '1', '1416637202');
INSERT INTO `v_action_log` VALUES ('38', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1416640792');
INSERT INTO `v_action_log` VALUES ('39', '1', '1', '17605860', 'member', '1', 'Administrator在2014-11-22 22:34登录了后台', '1', '1416666885');
INSERT INTO `v_action_log` VALUES ('40', '11', '1', '2130706433', 'category', '44', '操作url：/admin.php?s=/Category/add.html', '1', '1416720929');
INSERT INTO `v_action_log` VALUES ('41', '11', '1', '2130706433', 'category', '45', '操作url：/admin.php?s=/Category/add.html', '1', '1416721092');
INSERT INTO `v_action_log` VALUES ('42', '11', '1', '2130706433', 'category', '46', '操作url：/admin.php?s=/Category/add.html', '1', '1416721172');
INSERT INTO `v_action_log` VALUES ('43', '11', '1', '2130706433', 'category', '45', '操作url：/admin.php?s=/Category/edit.html', '1', '1416722028');
INSERT INTO `v_action_log` VALUES ('44', '11', '1', '2130706433', 'category', '46', '操作url：/admin.php?s=/Category/edit.html', '1', '1416722031');
INSERT INTO `v_action_log` VALUES ('45', '1', '1', '2130706433', 'member', '1', 'Administrator在2014-11-23 17:37登录了后台', '1', '1416735458');
INSERT INTO `v_action_log` VALUES ('46', '11', '1', '2130706433', 'category', '41', '操作url：/admin.php?s=/Category/edit.html', '1', '1416735475');
INSERT INTO `v_action_log` VALUES ('47', '1', '1', '17605860', 'member', '1', 'Administrator在2014-11-23 22:48登录了后台', '1', '1416754123');
INSERT INTO `v_action_log` VALUES ('48', '11', '1', '17605860', 'category', '2', '操作url：/admin.php?s=/Category/remove/id/2.html', '1', '1416755230');
INSERT INTO `v_action_log` VALUES ('49', '11', '1', '17605860', 'category', '1', '操作url：/admin.php?s=/Category/remove/id/1.html', '1', '1416755235');
INSERT INTO `v_action_log` VALUES ('50', '11', '1', '17605860', 'category', '42', '操作url：/admin.php?s=/Category/edit.html', '1', '1416755342');
INSERT INTO `v_action_log` VALUES ('51', '11', '1', '17605860', 'category', '42', '操作url：/admin.php?s=/Category/edit.html', '1', '1416755362');
INSERT INTO `v_action_log` VALUES ('52', '7', '1', '17605860', 'model', '5', '操作url：/admin.php?s=/Model/update.html', '1', '1416756014');
INSERT INTO `v_action_log` VALUES ('53', '7', '1', '17605860', 'model', '5', '操作url：/admin.php?s=/Model/update.html', '1', '1416756073');
INSERT INTO `v_action_log` VALUES ('54', '1', '1', '2130706433', 'member', '1', 'Administrator在2014-11-24 13:54登录了后台', '1', '1416808454');
INSERT INTO `v_action_log` VALUES ('55', '8', '1', '2130706433', 'attribute', '38', '操作url：/admin.php?s=/Attribute/update.html', '1', '1416810355');
INSERT INTO `v_action_log` VALUES ('56', '8', '1', '2130706433', 'attribute', '39', '操作url：/admin.php?s=/Attribute/update.html', '1', '1416810396');
INSERT INTO `v_action_log` VALUES ('57', '7', '1', '2130706433', 'model', '5', '操作url：/admin.php?s=/Model/update.html', '1', '1416810459');
INSERT INTO `v_action_log` VALUES ('58', '9', '1', '2130706433', 'channel', '0', '操作url：/admin.php?s=/Channel/del/id/2.html', '1', '1416897545');
INSERT INTO `v_action_log` VALUES ('59', '9', '1', '2130706433', 'channel', '1', '操作url：/admin.php?s=/Channel/edit.html', '1', '1416897561');
INSERT INTO `v_action_log` VALUES ('60', '9', '1', '2130706433', 'channel', '6', '操作url：/admin.php?s=/Channel/edit.html', '1', '1416897568');
INSERT INTO `v_action_log` VALUES ('61', '9', '1', '2130706433', 'channel', '4', '操作url：/admin.php?s=/Channel/edit.html', '1', '1416897579');
INSERT INTO `v_action_log` VALUES ('62', '9', '1', '2130706433', 'channel', '5', '操作url：/admin.php?s=/Channel/edit.html', '1', '1416897586');
INSERT INTO `v_action_log` VALUES ('63', '1', '1', '17605860', 'member', '1', 'Administrator在2014-11-25 20:50登录了后台', '1', '1416919858');
INSERT INTO `v_action_log` VALUES ('64', '11', '1', '17605860', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1416920182');
INSERT INTO `v_action_log` VALUES ('65', '1', '1', '2130706433', 'member', '1', 'Administrator在2014-11-26 12:58登录了后台', '1', '1416977884');
INSERT INTO `v_action_log` VALUES ('66', '9', '1', '2130706433', 'channel', '1', '操作url：/admin.php?s=/Channel/edit.html', '1', '1416977930');
INSERT INTO `v_action_log` VALUES ('67', '9', '1', '2130706433', 'channel', '1', '操作url：/admin.php?s=/Channel/edit.html', '1', '1416977976');
INSERT INTO `v_action_log` VALUES ('68', '1', '1', '2130706433', 'member', '1', 'Administrator在2014-11-26 14:17登录了后台', '1', '1416982641');
INSERT INTO `v_action_log` VALUES ('69', '1', '1', '2130706433', 'member', '1', 'Administrator在2014-11-26 14:25登录了后台', '1', '1416983124');
INSERT INTO `v_action_log` VALUES ('70', '1', '1', '2130706433', 'member', '1', 'Administrator在2014-11-26 14:51登录了后台', '1', '1416984696');
INSERT INTO `v_action_log` VALUES ('71', '1', '1', '2130706433', 'member', '1', 'Administrator在2014-11-26 14:52登录了后台', '1', '1416984760');
INSERT INTO `v_action_log` VALUES ('72', '1', '1', '2130706433', 'member', '1', 'Administrator在2014-11-26 14:55登录了后台', '1', '1416984954');
INSERT INTO `v_action_log` VALUES ('73', '1', '1', '2130706433', 'member', '1', 'Administrator在2014-11-26 14:57登录了后台', '1', '1416985026');
INSERT INTO `v_action_log` VALUES ('74', '1', '1', '2130706433', 'member', '1', 'Administrator在2014-11-26 15:03登录了后台', '1', '1416985397');
INSERT INTO `v_action_log` VALUES ('75', '1', '1', '2130706433', 'member', '1', 'Administrator在2014-11-26 15:05登录了后台', '1', '1416985518');
INSERT INTO `v_action_log` VALUES ('76', '1', '1', '2130706433', 'member', '1', 'Administrator在2014-11-26 15:38登录了后台', '1', '1416987524');
INSERT INTO `v_action_log` VALUES ('77', '1', '1', '2130706433', 'member', '1', 'Administrator在2014-11-26 15:39登录了后台', '1', '1416987553');
INSERT INTO `v_action_log` VALUES ('78', '1', '1', '2130706433', 'member', '1', 'Administrator在2014-11-26 15:43登录了后台', '1', '1416987824');
INSERT INTO `v_action_log` VALUES ('79', '1', '1', '1999118125', 'member', '1', 'Administrator在2014-11-27 11:30登录了后台', '1', '1417059042');
INSERT INTO `v_action_log` VALUES ('80', '1', '1', '17605860', 'member', '1', 'Administrator在2014-11-28 23:32登录了后台', '1', '1417188745');
INSERT INTO `v_action_log` VALUES ('81', '1', '1', '2071270383', 'member', '1', 'Administrator在2014-11-29 11:59登录了后台', '1', '1417233557');
INSERT INTO `v_action_log` VALUES ('82', '10', '1', '2071270383', 'Menu', '124', '操作url：/admin.php?s=/Menu/add.html', '1', '1417255561');
INSERT INTO `v_action_log` VALUES ('83', '1', '1', '1999118125', 'member', '1', 'Administrator在2014-11-29 18:14登录了后台', '1', '1417256060');
INSERT INTO `v_action_log` VALUES ('84', '10', '1', '1999118125', 'Menu', '93', '操作url：/admin.php?s=/Menu/edit.html', '1', '1417256426');
INSERT INTO `v_action_log` VALUES ('85', '10', '1', '1999118125', 'Menu', '93', '操作url：/admin.php?s=/Menu/edit.html', '1', '1417256544');
INSERT INTO `v_action_log` VALUES ('86', '10', '1', '1999118125', 'Menu', '93', '操作url：/admin.php?s=/Menu/edit.html', '1', '1417256609');
INSERT INTO `v_action_log` VALUES ('87', '10', '1', '1999118125', 'Menu', '93', '操作url：/admin.php?s=/Menu/edit.html', '1', '1417256669');
INSERT INTO `v_action_log` VALUES ('88', '10', '1', '1999118125', 'Menu', '93', '操作url：/admin.php?s=/Menu/edit.html', '1', '1417256734');
INSERT INTO `v_action_log` VALUES ('89', '10', '1', '1999118125', 'Menu', '93', '操作url：/admin.php?s=/Menu/edit.html', '1', '1417256830');
INSERT INTO `v_action_log` VALUES ('90', '1', '1', '17605860', 'member', '1', 'Administrator在2014-11-30 16:02登录了后台', '1', '1417334573');
INSERT INTO `v_action_log` VALUES ('91', '10', '1', '1999118125', 'Menu', '125', '操作url：/admin.php?s=/Menu/add.html', '1', '1417518655');
INSERT INTO `v_action_log` VALUES ('92', '10', '1', '1999118125', 'Menu', '0', '操作url：/admin.php?s=/Menu/del.html', '1', '1417518789');
INSERT INTO `v_action_log` VALUES ('93', '10', '1', '1999118125', 'Menu', '126', '操作url：/admin.php?s=/Menu/add.html', '1', '1417518829');
INSERT INTO `v_action_log` VALUES ('94', '10', '1', '1999118125', 'Menu', '44', '操作url：/admin.php?s=/Menu/edit.html', '1', '1417518951');
INSERT INTO `v_action_log` VALUES ('95', '10', '1', '1999118125', 'Menu', '44', '操作url：/admin.php?s=/Menu/edit.html', '1', '1417518994');
INSERT INTO `v_action_log` VALUES ('96', '6', '1', '1999118125', 'config', '9', '操作url：/admin.php?s=/Config/edit.html', '1', '1417520969');
INSERT INTO `v_action_log` VALUES ('97', '6', '1', '1999118125', 'config', '38', '操作url：/admin.php?s=/Config/edit.html', '1', '1417593361');
INSERT INTO `v_action_log` VALUES ('98', '6', '1', '1999118125', 'config', '38', '操作url：/admin.php?s=/Config/edit.html', '1', '1417593856');
INSERT INTO `v_action_log` VALUES ('99', '6', '1', '1999118125', 'config', '38', '操作url：/admin.php?s=/Config/edit.html', '1', '1417594033');
INSERT INTO `v_action_log` VALUES ('100', '6', '1', '1999118125', 'config', '40', '操作url：/admin.php?s=/Config/edit.html', '1', '1417594385');
INSERT INTO `v_action_log` VALUES ('101', '6', '1', '1999118125', 'config', '44', '操作url：/admin.php?s=/Config/edit.html', '1', '1417594947');
INSERT INTO `v_action_log` VALUES ('102', '6', '1', '1999118125', 'config', '49', '操作url：/admin.php?s=/Config/edit.html', '1', '1417597464');
INSERT INTO `v_action_log` VALUES ('103', '6', '1', '1999118125', 'config', '49', '操作url：/admin.php?s=/Config/edit.html', '1', '1417597665');
INSERT INTO `v_action_log` VALUES ('104', '6', '1', '1999118125', 'config', '53', '操作url：/admin.php?s=/Config/edit.html', '1', '1417598907');
INSERT INTO `v_action_log` VALUES ('105', '1', '1', '17605860', 'member', '1', 'Administrator在2014-12-04 23:09登录了后台', '1', '1417705798');
INSERT INTO `v_action_log` VALUES ('106', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-09 00:16登录了后台', '1', '1418055406');
INSERT INTO `v_action_log` VALUES ('107', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-10 10:51登录了后台', '1', '1418179915');
INSERT INTO `v_action_log` VALUES ('108', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-10 11:42登录了后台', '1', '1418182976');
INSERT INTO `v_action_log` VALUES ('109', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-10 13:23登录了后台', '1', '1418189015');
INSERT INTO `v_action_log` VALUES ('110', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-10 16:33登录了后台', '1', '1418200433');
INSERT INTO `v_action_log` VALUES ('111', '8', '1', '167772674', 'attribute', '40', '操作url：/admin.php?s=/Attribute/update.html', '1', '1418202568');
INSERT INTO `v_action_log` VALUES ('112', '8', '1', '167772674', 'attribute', '40', '操作url：/admin.php?s=/Attribute/update.html', '1', '1418202731');
INSERT INTO `v_action_log` VALUES ('113', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-10 17:40登录了后台', '1', '1418204421');
INSERT INTO `v_action_log` VALUES ('114', '8', '1', '167772674', 'attribute', '40', '操作url：/admin.php?s=/Attribute/remove/id/40.html', '1', '1418205030');
INSERT INTO `v_action_log` VALUES ('115', '8', '1', '167772674', 'attribute', '41', '操作url：/admin.php?s=/Attribute/update.html', '1', '1418205108');
INSERT INTO `v_action_log` VALUES ('116', '11', '1', '167772674', 'category', '41', '操作url：/admin.php?s=/Category/edit.html', '1', '1418205296');
INSERT INTO `v_action_log` VALUES ('117', '7', '1', '167772674', 'model', '2', '操作url：/admin.php?s=/Model/update.html', '1', '1418205352');
INSERT INTO `v_action_log` VALUES ('118', '7', '1', '167772674', 'model', '2', '操作url：/admin.php?s=/Model/update.html', '1', '1418205389');
INSERT INTO `v_action_log` VALUES ('119', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-10 19:06登录了后台', '1', '1418209618');
INSERT INTO `v_action_log` VALUES ('120', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-12 15:48登录了后台', '1', '1418370497');
INSERT INTO `v_action_log` VALUES ('121', '6', '1', '167772674', 'config', '38', '操作url：/admin.php?s=/Config/edit.html', '1', '1418372437');
INSERT INTO `v_action_log` VALUES ('122', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-15 13:12登录了后台', '1', '1418620327');
INSERT INTO `v_action_log` VALUES ('123', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-15 16:21登录了后台', '1', '1418631716');
INSERT INTO `v_action_log` VALUES ('124', '6', '1', '167772674', 'config', '57', '操作url：/Admin/Config/edit.html', '1', '1418633868');
INSERT INTO `v_action_log` VALUES ('125', '6', '1', '167772674', 'config', '57', '操作url：/Admin/Config/edit.html', '1', '1418633992');
INSERT INTO `v_action_log` VALUES ('126', '6', '1', '167772674', 'config', '56', '操作url：/Admin/Config/edit.html', '1', '1418634081');
INSERT INTO `v_action_log` VALUES ('127', '6', '1', '167772674', 'config', '56', '操作url：/Admin/Config/edit.html', '1', '1418637252');
INSERT INTO `v_action_log` VALUES ('128', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-16 11:10登录了后台', '1', '1418699421');
INSERT INTO `v_action_log` VALUES ('129', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-16 13:30登录了后台', '1', '1418707838');
INSERT INTO `v_action_log` VALUES ('130', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-17 15:30登录了后台', '1', '1418801443');
INSERT INTO `v_action_log` VALUES ('131', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-18 11:47登录了后台', '1', '1418874478');
INSERT INTO `v_action_log` VALUES ('132', '6', '1', '167772674', 'config', '56', '操作url：/Admin/Config/edit.html', '1', '1418886552');
INSERT INTO `v_action_log` VALUES ('133', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-18 15:46登录了后台', '1', '1418888771');
INSERT INTO `v_action_log` VALUES ('134', '6', '1', '167772674', 'config', '57', '操作url：/Admin/Config/edit.html', '1', '1418891501');
INSERT INTO `v_action_log` VALUES ('135', '6', '1', '167772674', 'config', '57', '操作url：/Admin/Config/edit.html', '1', '1418892126');
INSERT INTO `v_action_log` VALUES ('136', '6', '1', '167772674', 'config', '57', '操作url：/Admin/Config/edit.html', '1', '1418892297');
INSERT INTO `v_action_log` VALUES ('137', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-18 21:46登录了后台', '1', '1418910380');
INSERT INTO `v_action_log` VALUES ('138', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-19 12:07登录了后台', '1', '1418962055');
INSERT INTO `v_action_log` VALUES ('139', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-19 13:52登录了后台', '1', '1418968361');
INSERT INTO `v_action_log` VALUES ('140', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-19 20:33登录了后台', '1', '1418992429');
INSERT INTO `v_action_log` VALUES ('141', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-22 15:34登录了后台', '1', '1419233683');
INSERT INTO `v_action_log` VALUES ('142', '6', '1', '167772674', 'config', '1', '操作url：/Admin/Config/edit.html', '1', '1419235699');
INSERT INTO `v_action_log` VALUES ('143', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-23 09:57登录了后台', '1', '1419299859');
INSERT INTO `v_action_log` VALUES ('144', '11', '1', '167772674', 'category', '43', '操作url：/Admin/Category/edit.html', '1', '1419299905');
INSERT INTO `v_action_log` VALUES ('145', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-23 15:09登录了后台', '1', '1419318593');
INSERT INTO `v_action_log` VALUES ('146', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-23 17:58登录了后台', '1', '1419328733');
INSERT INTO `v_action_log` VALUES ('147', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-23 19:36登录了后台', '1', '1419334568');
INSERT INTO `v_action_log` VALUES ('148', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-24 09:46登录了后台', '1', '1419385610');
INSERT INTO `v_action_log` VALUES ('149', '11', '1', '167772674', 'category', '47', '操作url：/Admin/Category/add.html', '1', '1419388988');
INSERT INTO `v_action_log` VALUES ('150', '11', '1', '167772674', 'category', '48', '操作url：/Admin/Category/add.html', '1', '1419389009');
INSERT INTO `v_action_log` VALUES ('151', '11', '1', '167772674', 'category', '49', '操作url：/Admin/Category/add.html', '1', '1419389024');
INSERT INTO `v_action_log` VALUES ('152', '11', '1', '167772674', 'category', '50', '操作url：/Admin/Category/add.html', '1', '1419389094');
INSERT INTO `v_action_log` VALUES ('153', '11', '1', '167772674', 'category', '50', '操作url：/Admin/Category/edit.html', '1', '1419389213');
INSERT INTO `v_action_log` VALUES ('154', '9', '1', '167772674', 'channel', '1', '操作url：/Admin/Channel/edit.html', '1', '1419389260');
INSERT INTO `v_action_log` VALUES ('155', '9', '1', '167772674', 'channel', '1', '操作url：/Admin/Channel/edit.html', '1', '1419389320');
INSERT INTO `v_action_log` VALUES ('156', '9', '1', '167772674', 'channel', '6', '操作url：/Admin/Channel/edit.html', '1', '1419389335');
INSERT INTO `v_action_log` VALUES ('157', '9', '1', '167772674', 'channel', '0', '操作url：/Admin/Channel/del/id/4.html', '1', '1419389355');
INSERT INTO `v_action_log` VALUES ('158', '9', '1', '167772674', 'channel', '5', '操作url：/Admin/Channel/edit.html', '1', '1419389373');
INSERT INTO `v_action_log` VALUES ('159', '9', '1', '167772674', 'channel', '6', '操作url：/Admin/Channel/edit.html', '1', '1419389389');
INSERT INTO `v_action_log` VALUES ('160', '11', '1', '167772674', 'category', '51', '操作url：/Admin/Category/add.html', '1', '1419390917');
INSERT INTO `v_action_log` VALUES ('161', '11', '1', '167772674', 'category', '51', '操作url：/Admin/Category/edit.html', '1', '1419391444');
INSERT INTO `v_action_log` VALUES ('162', '11', '1', '167772674', 'category', '50', '操作url：/Admin/Category/edit.html', '1', '1419391510');
INSERT INTO `v_action_log` VALUES ('163', '11', '1', '167772674', 'category', '51', '操作url：/Admin/Category/edit.html', '1', '1419391528');
INSERT INTO `v_action_log` VALUES ('164', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-24 13:53登录了后台', '1', '1419400398');
INSERT INTO `v_action_log` VALUES ('165', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-25 10:11登录了后台', '1', '1419473460');
INSERT INTO `v_action_log` VALUES ('166', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-25 11:14登录了后台', '1', '1419477244');
INSERT INTO `v_action_log` VALUES ('167', '1', '1', '167772674', 'member', '1', 'Administrator在2014-12-25 13:44登录了后台', '1', '1419486280');
INSERT INTO `v_action_log` VALUES ('168', '11', '1', '167772674', 'category', '47', '操作url：/Admin/Category/edit.html', '1', '1419486318');
INSERT INTO `v_action_log` VALUES ('169', '11', '1', '167772674', 'category', '50', '操作url：/Admin/Category/edit.html', '1', '1419488201');
INSERT INTO `v_action_log` VALUES ('170', '6', '1', '167772674', 'config', '0', '操作url：/Admin/Config/del/id/56.html', '1', '1421294143');
INSERT INTO `v_action_log` VALUES ('171', '6', '1', '167772674', 'config', '0', '操作url：/Admin/Config/del/id/57.html', '1', '1421294153');
INSERT INTO `v_action_log` VALUES ('172', '1', '1', '167772674', 'member', '1', 'Administrator在2015-01-15 13:27登录了后台', '1', '1421299662');
INSERT INTO `v_action_log` VALUES ('173', '11', '1', '167772674', 'category', '47', '操作url：/Admin/Category/edit.html', '1', '1427693902');
INSERT INTO `v_action_log` VALUES ('174', '11', '1', '167772674', 'category', '48', '操作url：/Admin/Category/edit.html', '1', '1427693910');
INSERT INTO `v_action_log` VALUES ('175', '11', '1', '167772674', 'category', '49', '操作url：/Admin/Category/edit.html', '1', '1427693919');
INSERT INTO `v_action_log` VALUES ('176', '11', '1', '167772674', 'category', '50', '操作url：/Admin/Category/edit.html', '1', '1427693925');
INSERT INTO `v_action_log` VALUES ('177', '11', '1', '167772674', 'category', '51', '操作url：/Admin/Category/edit.html', '1', '1427693934');
INSERT INTO `v_action_log` VALUES ('178', '11', '1', '167772674', 'category', '52', '操作url：/Admin/Category/add.html', '1', '1427693955');
INSERT INTO `v_action_log` VALUES ('179', '11', '1', '167772674', 'category', '53', '操作url：/Admin/Category/add.html', '1', '1427694001');
INSERT INTO `v_action_log` VALUES ('180', '11', '1', '167772674', 'category', '54', '操作url：/Admin/Category/add.html', '1', '1427694021');
INSERT INTO `v_action_log` VALUES ('181', '11', '1', '167772674', 'category', '55', '操作url：/Admin/Category/add.html', '1', '1427694176');
INSERT INTO `v_action_log` VALUES ('182', '11', '1', '167772674', 'category', '56', '操作url：/Admin/Category/add.html', '1', '1427694217');
INSERT INTO `v_action_log` VALUES ('183', '11', '1', '167772674', 'category', '57', '操作url：/Admin/Category/add.html', '1', '1427694250');
INSERT INTO `v_action_log` VALUES ('184', '11', '1', '167772674', 'category', '58', '操作url：/Admin/Category/add.html', '1', '1427694267');
INSERT INTO `v_action_log` VALUES ('185', '11', '1', '167772674', 'category', '47', '操作url：/Admin/Category/edit.html', '1', '1427694304');
INSERT INTO `v_action_log` VALUES ('186', '11', '1', '167772674', 'category', '52', '操作url：/Admin/Category/edit.html', '1', '1427694313');
INSERT INTO `v_action_log` VALUES ('187', '11', '1', '167772674', 'category', '51', '操作url：/Admin/Category/edit.html', '1', '1427694335');
INSERT INTO `v_action_log` VALUES ('188', '11', '1', '167772674', 'category', '56', '操作url：/Admin/Category/edit.html', '1', '1427694350');
INSERT INTO `v_action_log` VALUES ('189', '11', '1', '167772674', 'category', '55', '操作url：/Admin/Category/edit.html', '1', '1427694360');
INSERT INTO `v_action_log` VALUES ('190', '11', '1', '167772674', 'category', '49', '操作url：/Admin/Category/edit.html', '1', '1427694382');
INSERT INTO `v_action_log` VALUES ('191', '11', '1', '167772674', 'category', '57', '操作url：/Admin/Category/edit.html', '1', '1427694394');
INSERT INTO `v_action_log` VALUES ('192', '11', '1', '167772674', 'category', '48', '操作url：/Admin/Category/edit.html', '1', '1427694405');
INSERT INTO `v_action_log` VALUES ('193', '11', '1', '167772674', 'category', '54', '操作url：/Admin/Category/edit.html', '1', '1427694415');
INSERT INTO `v_action_log` VALUES ('194', '11', '1', '167772674', 'category', '53', '操作url：/Admin/Category/edit.html', '1', '1427694425');
INSERT INTO `v_action_log` VALUES ('195', '11', '1', '167772674', 'category', '59', '操作url：/Admin/Category/add.html', '1', '1427694539');
INSERT INTO `v_action_log` VALUES ('196', '11', '1', '167772674', 'category', '54', '操作url：/Admin/Category/edit.html', '1', '1427694754');
INSERT INTO `v_action_log` VALUES ('197', '11', '1', '167772674', 'category', '53', '操作url：/Admin/Category/edit.html', '1', '1427694767');
INSERT INTO `v_action_log` VALUES ('198', '9', '1', '167772674', 'channel', '1', '操作url：/Admin/Channel/edit.html', '1', '1427694862');
INSERT INTO `v_action_log` VALUES ('199', '9', '1', '167772674', 'channel', '6', '操作url：/Admin/Channel/edit.html', '1', '1427694889');
INSERT INTO `v_action_log` VALUES ('200', '9', '1', '167772674', 'channel', '5', '操作url：/Admin/Channel/edit.html', '1', '1427694911');
INSERT INTO `v_action_log` VALUES ('201', '9', '1', '167772674', 'channel', '7', '操作url：/Admin/Channel/edit.html', '1', '1427694944');
INSERT INTO `v_action_log` VALUES ('202', '11', '1', '167772674', 'category', '56', '操作url：/Admin/Category/edit.html', '1', '1427695351');
INSERT INTO `v_action_log` VALUES ('203', '11', '1', '167772674', 'category', '60', '操作url：/Admin/Category/add.html', '1', '1427696188');
INSERT INTO `v_action_log` VALUES ('204', '11', '1', '167772674', 'category', '56', '操作url：/Admin/Category/edit.html', '1', '1427696522');
INSERT INTO `v_action_log` VALUES ('205', '6', '1', '167772674', 'config', '1', '操作url：/Admin/Config/edit.html', '1', '1427697527');
INSERT INTO `v_action_log` VALUES ('206', '1', '1', '167772674', 'member', '1', 'Administrator在2015-07-13 10:56登录了后台', '1', '1436756195');
INSERT INTO `v_action_log` VALUES ('207', '11', '1', '167772674', 'category', '59', '操作url：/Admin/Category/edit.html', '1', '1436757104');
INSERT INTO `v_action_log` VALUES ('208', '8', '1', '167772674', 'attribute', '41', '操作url：/Admin/Attribute/update.html', '1', '1436757632');
INSERT INTO `v_action_log` VALUES ('209', '6', '1', '167772674', 'config', '58', '操作url：/Admin/Config/edit.html', '1', '1436758026');
INSERT INTO `v_action_log` VALUES ('210', '11', '1', '167772674', 'category', '52', '操作url：/Admin/Category/edit.html', '1', '1436759170');
INSERT INTO `v_action_log` VALUES ('211', '11', '1', '167772674', 'category', '56', '操作url：/Admin/Category/edit.html', '1', '1436759339');
INSERT INTO `v_action_log` VALUES ('212', '11', '1', '167772674', 'category', '55', '操作url：/Admin/Category/edit.html', '1', '1436759353');
INSERT INTO `v_action_log` VALUES ('213', '11', '1', '167772674', 'category', '60', '操作url：/Admin/Category/edit.html', '1', '1436759382');
INSERT INTO `v_action_log` VALUES ('214', '11', '1', '167772674', 'category', '61', '操作url：/Admin/Category/add.html', '1', '1441678886');
INSERT INTO `v_action_log` VALUES ('215', '11', '1', '167772674', 'category', '60', '操作url：/Admin/Category/edit.html', '1', '1441678896');
INSERT INTO `v_action_log` VALUES ('216', '11', '1', '167772674', 'category', '59', '操作url：/Admin/Category/edit.html', '1', '1441678902');
INSERT INTO `v_action_log` VALUES ('217', '11', '1', '167772674', 'category', '58', '操作url：/Admin/Category/edit.html', '1', '1441678909');
INSERT INTO `v_action_log` VALUES ('218', '11', '1', '167772674', 'category', '57', '操作url：/Admin/Category/edit.html', '1', '1441678914');
INSERT INTO `v_action_log` VALUES ('219', '11', '1', '167772674', 'category', '61', '操作url：/Admin/Category/edit.html', '1', '1441678928');
INSERT INTO `v_action_log` VALUES ('220', '11', '1', '167772674', 'category', '59', '操作url：/Admin/Category/edit.html', '1', '1441678954');
INSERT INTO `v_action_log` VALUES ('221', '11', '1', '167772674', 'category', '59', '操作url：/Admin/Category/edit.html', '1', '1441678966');
INSERT INTO `v_action_log` VALUES ('222', '11', '1', '167772674', 'category', '60', '操作url：/Admin/Category/edit.html', '1', '1441678980');
INSERT INTO `v_action_log` VALUES ('223', '11', '1', '167772674', 'category', '62', '操作url：/Admin/Category/add.html', '1', '1441679358');
INSERT INTO `v_action_log` VALUES ('224', '11', '1', '167772674', 'category', '62', '操作url：/Admin/Category/edit.html', '1', '1441681279');
INSERT INTO `v_action_log` VALUES ('225', '11', '1', '167772674', 'category', '58', '操作url：/Admin/Category/edit.html', '1', '1441682194');
INSERT INTO `v_action_log` VALUES ('226', '1', '1', '167772674', 'member', '1', 'Administrator在2015-09-08 14:28登录了后台', '1', '1441693705');
INSERT INTO `v_action_log` VALUES ('227', '11', '1', '167772674', 'category', '57', '操作url：/Admin/Category/edit.html', '1', '1441693782');
INSERT INTO `v_action_log` VALUES ('228', '11', '1', '167772674', 'category', '58', '操作url：/Admin/Category/edit.html', '1', '1441693783');
INSERT INTO `v_action_log` VALUES ('229', '11', '1', '167772674', 'category', '59', '操作url：/Admin/Category/edit.html', '1', '1441693784');
INSERT INTO `v_action_log` VALUES ('230', '11', '1', '167772674', 'category', '60', '操作url：/Admin/Category/edit.html', '1', '1441693787');
INSERT INTO `v_action_log` VALUES ('231', '11', '1', '167772674', 'category', '61', '操作url：/Admin/Category/edit.html', '1', '1441693789');
INSERT INTO `v_action_log` VALUES ('232', '11', '1', '167772674', 'category', '58', '操作url：/Admin/Category/edit.html', '1', '1441693792');
INSERT INTO `v_action_log` VALUES ('233', '11', '1', '167772674', 'category', '59', '操作url：/Admin/Category/edit.html', '1', '1441693795');
INSERT INTO `v_action_log` VALUES ('234', '11', '1', '167772674', 'category', '60', '操作url：/Admin/Category/edit.html', '1', '1441693798');
INSERT INTO `v_action_log` VALUES ('235', '11', '1', '167772674', 'category', '61', '操作url：/Admin/Category/edit.html', '1', '1441693801');
INSERT INTO `v_action_log` VALUES ('236', '11', '1', '167772674', 'category', '57', '操作url：/Admin/Category/edit.html', '1', '1441693809');
INSERT INTO `v_action_log` VALUES ('237', '11', '1', '167772674', 'category', '58', '操作url：/Admin/Category/edit.html', '1', '1441693810');
INSERT INTO `v_action_log` VALUES ('238', '11', '1', '167772674', 'category', '59', '操作url：/Admin/Category/edit.html', '1', '1441693812');
INSERT INTO `v_action_log` VALUES ('239', '11', '1', '167772674', 'category', '60', '操作url：/Admin/Category/edit.html', '1', '1441693813');
INSERT INTO `v_action_log` VALUES ('240', '11', '1', '167772674', 'category', '61', '操作url：/Admin/Category/edit.html', '1', '1441693814');
INSERT INTO `v_action_log` VALUES ('241', '1', '1', '167772674', 'member', '1', 'Administrator在2015-11-16 10:57登录了后台', '1', '1447642670');
INSERT INTO `v_action_log` VALUES ('242', '11', '1', '167772674', 'category', '51', '操作url：/Admin/Category/edit.html', '1', '1447643620');
INSERT INTO `v_action_log` VALUES ('243', '11', '1', '167772674', 'category', '53', '操作url：/Admin/Category/edit.html', '1', '1447644046');
INSERT INTO `v_action_log` VALUES ('244', '11', '1', '167772674', 'category', '53', '操作url：/Admin/Category/edit.html', '1', '1447644240');
INSERT INTO `v_action_log` VALUES ('245', '11', '1', '167772674', 'category', '54', '操作url：/Admin/Category/edit.html', '1', '1447644598');
INSERT INTO `v_action_log` VALUES ('246', '11', '1', '167772674', 'category', '62', '操作url：/Admin/Category/edit.html', '1', '1447644779');
INSERT INTO `v_action_log` VALUES ('247', '1', '1', '167772674', 'member', '1', 'Administrator在2015-11-19 17:05登录了后台', '1', '1447923904');
INSERT INTO `v_action_log` VALUES ('248', '7', '1', '167772674', 'model', '2', '操作url：/Admin/Model/update.html', '1', '1447924087');
INSERT INTO `v_action_log` VALUES ('249', '6', '1', '167772674', 'config', '55', '操作url：/Admin/Config/edit.html', '1', '1447924209');
INSERT INTO `v_action_log` VALUES ('250', '1', '1', '167772674', 'member', '1', 'Administrator在2015-12-16 10:36登录了后台', '1', '1450233419');
INSERT INTO `v_action_log` VALUES ('251', '11', '1', '167772674', 'category', '51', '操作url：/Admin/Category/edit.html', '1', '1450235324');
INSERT INTO `v_action_log` VALUES ('252', '11', '1', '167772674', 'category', '52', '操作url：/Admin/Category/edit.html', '1', '1450235333');
INSERT INTO `v_action_log` VALUES ('253', '11', '1', '167772674', 'category', '47', '操作url：/Admin/Category/edit.html', '1', '1450235343');
INSERT INTO `v_action_log` VALUES ('254', '11', '1', '167772674', 'category', '50', '操作url：/Admin/Category/edit.html', '1', '1450235353');
INSERT INTO `v_action_log` VALUES ('255', '11', '1', '167772674', 'category', '56', '操作url：/Admin/Category/edit.html', '1', '1450235365');
INSERT INTO `v_action_log` VALUES ('256', '11', '1', '167772674', 'category', '49', '操作url：/Admin/Category/edit.html', '1', '1450235380');
INSERT INTO `v_action_log` VALUES ('257', '11', '1', '167772674', 'category', '57', '操作url：/Admin/Category/edit.html', '1', '1450235402');
INSERT INTO `v_action_log` VALUES ('258', '11', '1', '167772674', 'category', '58', '操作url：/Admin/Category/edit.html', '1', '1450235415');
INSERT INTO `v_action_log` VALUES ('259', '11', '1', '167772674', 'category', '60', '操作url：/Admin/Category/edit.html', '1', '1450235426');
INSERT INTO `v_action_log` VALUES ('260', '11', '1', '167772674', 'category', '61', '操作url：/Admin/Category/edit.html', '1', '1450235440');
INSERT INTO `v_action_log` VALUES ('261', '11', '1', '167772674', 'category', '48', '操作url：/Admin/Category/edit.html', '1', '1450235452');
INSERT INTO `v_action_log` VALUES ('262', '11', '1', '167772674', 'category', '48', '操作url：/Admin/Category/edit.html', '1', '1450235462');
INSERT INTO `v_action_log` VALUES ('263', '11', '1', '167772674', 'category', '54', '操作url：/Admin/Category/edit.html', '1', '1450235475');
INSERT INTO `v_action_log` VALUES ('264', '11', '1', '167772674', 'category', '53', '操作url：/Admin/Category/edit.html', '1', '1450235487');
INSERT INTO `v_action_log` VALUES ('265', '11', '1', '167772674', 'category', '62', '操作url：/Admin/Category/edit.html', '1', '1450235501');
INSERT INTO `v_action_log` VALUES ('266', '1', '1', '167772674', 'member', '1', 'Administrator在2016-03-21 09:55登录了后台', '1', '1458525336');
INSERT INTO `v_action_log` VALUES ('267', '11', '1', '167772674', 'category', '55', '操作url：/Admin/Category/edit.html', '1', '1458525423');
INSERT INTO `v_action_log` VALUES ('268', '1', '1', '167772674', 'member', '1', 'Administrator在2016-08-22 09:16登录了后台', '1', '1471828589');
INSERT INTO `v_action_log` VALUES ('269', '6', '1', '167772674', 'config', '51', '操作url：/Admin/Config/edit.html', '1', '1471828671');
INSERT INTO `v_action_log` VALUES ('270', '6', '1', '167772674', 'config', '51', '操作url：/Admin/Config/edit.html', '1', '1471828730');
INSERT INTO `v_action_log` VALUES ('271', '1', '1', '167772674', 'member', '1', 'Administrator在2016-09-27 14:51登录了后台', '1', '1474959071');
INSERT INTO `v_action_log` VALUES ('272', '11', '1', '167772674', 'category', '49', '操作url：/Admin/Category/edit.html', '1', '1474959109');
INSERT INTO `v_action_log` VALUES ('273', '11', '1', '167772674', 'category', '57', '操作url：/Admin/Category/edit.html', '1', '1474959119');
INSERT INTO `v_action_log` VALUES ('274', '11', '1', '167772674', 'category', '58', '操作url：/Admin/Category/edit.html', '1', '1474959129');
INSERT INTO `v_action_log` VALUES ('275', '11', '1', '167772674', 'category', '59', '操作url：/Admin/Category/edit.html', '1', '1474959137');
INSERT INTO `v_action_log` VALUES ('276', '11', '1', '167772674', 'category', '60', '操作url：/Admin/Category/edit.html', '1', '1474959146');
INSERT INTO `v_action_log` VALUES ('277', '11', '1', '167772674', 'category', '61', '操作url：/Admin/Category/edit.html', '1', '1474959161');
INSERT INTO `v_action_log` VALUES ('278', '11', '1', '167772674', 'category', '55', '操作url：/Admin/Category/edit.html', '1', '1474959174');
INSERT INTO `v_action_log` VALUES ('279', '11', '1', '167772674', 'category', '56', '操作url：/Admin/Category/edit.html', '1', '1474959182');
INSERT INTO `v_action_log` VALUES ('280', '11', '1', '167772674', 'category', '54', '操作url：/Admin/Category/edit.html', '1', '1474959191');
INSERT INTO `v_action_log` VALUES ('281', '11', '1', '167772674', 'category', '54', '操作url：/Admin/Category/edit.html', '1', '1474959199');
INSERT INTO `v_action_log` VALUES ('282', '11', '1', '167772674', 'category', '53', '操作url：/Admin/Category/edit.html', '1', '1474959209');
INSERT INTO `v_action_log` VALUES ('283', '11', '1', '167772674', 'category', '62', '操作url：/Admin/Category/edit.html', '1', '1474959217');
INSERT INTO `v_action_log` VALUES ('284', '1', '2', '167772674', 'member', '2', 'admin在2016-11-09 15:04登录了后台', '1', '1478675056');
INSERT INTO `v_action_log` VALUES ('285', '11', '2', '167772674', 'category', '57', '操作url：/Admin/Category/edit.html', '1', '1478675075');
INSERT INTO `v_action_log` VALUES ('286', '11', '2', '167772674', 'category', '57', '操作url：/Admin/Category/edit.html', '1', '1478675078');
INSERT INTO `v_action_log` VALUES ('287', '1', '1', '167772674', 'member', '1', 'Administrator在2016-11-09 15:05登录了后台', '1', '1478675156');
INSERT INTO `v_action_log` VALUES ('288', '11', '1', '167772674', 'category', '48', '操作url：/Admin/Category/edit.html', '1', '1492765435');
INSERT INTO `v_action_log` VALUES ('289', '6', '1', '167772674', 'config', '1', '操作url：/Admin/Config/edit.html', '1', '1492843307');
INSERT INTO `v_action_log` VALUES ('290', '6', '1', '167772674', 'config', '2', '操作url：/Admin/Config/edit.html', '1', '1492843320');
INSERT INTO `v_action_log` VALUES ('291', '6', '1', '167772674', 'config', '41', '操作url：/Admin/Config/edit.html', '1', '1492843332');
INSERT INTO `v_action_log` VALUES ('292', '6', '1', '167772674', 'config', '3', '操作url：/Admin/Config/edit.html', '1', '1492843363');
INSERT INTO `v_action_log` VALUES ('293', '11', '1', '167772674', 'category', '52', '操作url：/Admin/Category/edit.html', '1', '1492994586');
INSERT INTO `v_action_log` VALUES ('294', '6', '1', '167772674', 'config', '59', '操作url：/Admin/Config/edit.html', '1', '1492996036');
INSERT INTO `v_action_log` VALUES ('295', '6', '1', '167772674', 'config', '59', '操作url：/Admin/Config/edit.html', '1', '1493086903');
INSERT INTO `v_action_log` VALUES ('296', '11', '1', '167772674', 'category', '51', '操作url：/Admin/Category/edit.html', '1', '1493087800');
INSERT INTO `v_action_log` VALUES ('297', '11', '1', '167772674', 'category', '63', '操作url：/Admin/Category/add.html', '1', '1493087926');
INSERT INTO `v_action_log` VALUES ('298', '11', '1', '167772674', 'category', '48', '操作url：/Admin/Category/edit.html', '1', '1493089396');
INSERT INTO `v_action_log` VALUES ('299', '11', '1', '167772674', 'category', '48', '操作url：/Admin/Category/edit.html', '1', '1493089408');
INSERT INTO `v_action_log` VALUES ('300', '11', '1', '167772674', 'category', '59', '操作url：/Admin/Category/edit.html', '1', '1493090122');
INSERT INTO `v_action_log` VALUES ('301', '11', '1', '167772674', 'category', '64', '操作url：/Admin/Category/add.html', '1', '1493199475');
INSERT INTO `v_action_log` VALUES ('302', '11', '1', '167772674', 'category', '63', '操作url：/Admin/Category/remove/id/63.html', '1', '1493200061');
INSERT INTO `v_action_log` VALUES ('303', '11', '1', '167772674', 'category', '55', '操作url：/Admin/Category/edit.html', '1', '1493200076');
INSERT INTO `v_action_log` VALUES ('304', '9', '1', '167772674', 'channel', '8', '操作url：/Admin/Channel/edit.html', '1', '1493200087');
INSERT INTO `v_action_log` VALUES ('305', '1', '1', '167772674', 'member', '1', 'Administrator在2017-04-27 08:40登录了后台', '1', '1493253615');
INSERT INTO `v_action_log` VALUES ('306', '11', '1', '167772674', 'category', '59', '操作url：/Admin/Category/edit.html', '1', '1493256178');
INSERT INTO `v_action_log` VALUES ('307', '6', '1', '167772674', 'config', '39', '操作url：/Admin/Config/edit.html', '1', '1493257420');
INSERT INTO `v_action_log` VALUES ('308', '6', '1', '167772674', 'config', '47', '操作url：/Admin/Config/edit.html', '1', '1493257460');
INSERT INTO `v_action_log` VALUES ('309', '11', '1', '167772674', 'category', '57', '操作url：/Admin/Category/edit.html', '1', '1493257515');
INSERT INTO `v_action_log` VALUES ('310', '6', '1', '167772674', 'config', '63', '操作url：/Admin/Config/edit.html', '1', '1493860154');
INSERT INTO `v_action_log` VALUES ('311', '6', '1', '167772674', 'config', '63', '操作url：/Admin/Config/edit.html', '1', '1493860163');
INSERT INTO `v_action_log` VALUES ('312', '6', '1', '167772674', 'config', '0', '操作url：/Admin/Config/del/id/64.html', '1', '1493861041');
INSERT INTO `v_action_log` VALUES ('313', '11', '1', '167772674', 'category', '65', '操作url：/Admin/Category/add.html', '1', '1493862805');
INSERT INTO `v_action_log` VALUES ('314', '11', '1', '167772674', 'category', '66', '操作url：/Admin/Category/add.html', '1', '1493863008');
INSERT INTO `v_action_log` VALUES ('315', '11', '1', '167772674', 'category', '67', '操作url：/Admin/Category/add.html', '1', '1493863033');
INSERT INTO `v_action_log` VALUES ('316', '11', '1', '167772674', 'category', '64', '操作url：/Admin/Category/remove/id/64.html', '1', '1493863040');
INSERT INTO `v_action_log` VALUES ('317', '8', '1', '167772674', 'attribute', '42', '操作url：/Admin/Attribute/update.html', '1', '1493863719');
INSERT INTO `v_action_log` VALUES ('318', '7', '1', '167772674', 'model', '2', '操作url：/Admin/Model/update.html', '1', '1493863740');
INSERT INTO `v_action_log` VALUES ('319', '6', '1', '167772674', 'config', '63', '操作url：/Admin/Config/edit.html', '1', '1493864673');
INSERT INTO `v_action_log` VALUES ('320', '11', '1', '167772674', 'category', '68', '操作url：/Admin/Category/add.html', '1', '1493866264');
INSERT INTO `v_action_log` VALUES ('321', '8', '1', '167772674', 'attribute', '42', '操作url：/Admin/Attribute/update.html', '1', '1493866876');
INSERT INTO `v_action_log` VALUES ('322', '8', '1', '167772674', 'attribute', '42', '操作url：/Admin/Attribute/remove/id/42.html', '1', '1493874003');
INSERT INTO `v_action_log` VALUES ('323', '11', '1', '167772674', 'category', '69', '操作url：/Admin/Category/add.html', '1', '1493874917');
INSERT INTO `v_action_log` VALUES ('324', '11', '1', '167772674', 'category', '51', '操作url：/Admin/Category/edit.html', '1', '1493875605');
INSERT INTO `v_action_log` VALUES ('325', '11', '1', '167772674', 'category', '62', '操作url：/Admin/Category/edit.html', '1', '1493875621');
INSERT INTO `v_action_log` VALUES ('326', '11', '1', '167772674', 'category', '54', '操作url：/Admin/Category/edit.html', '1', '1493875635');
INSERT INTO `v_action_log` VALUES ('327', '6', '1', '167772674', 'config', '63', '操作url：/Admin/Config/edit.html', '1', '1493883135');
INSERT INTO `v_action_log` VALUES ('328', '11', '1', '167772674', 'category', '67', '操作url：/Admin/Category/remove/id/67.html', '1', '1494379392');
INSERT INTO `v_action_log` VALUES ('329', '11', '1', '167772674', 'category', '66', '操作url：/Admin/Category/remove/id/66.html', '1', '1494379397');
INSERT INTO `v_action_log` VALUES ('330', '11', '1', '167772674', 'category', '68', '操作url：/Admin/Category/remove/id/68.html', '1', '1494379402');
INSERT INTO `v_action_log` VALUES ('331', '11', '1', '167772674', 'category', '65', '操作url：/Admin/Category/remove/id/65.html', '1', '1494379409');
INSERT INTO `v_action_log` VALUES ('332', '11', '1', '167772674', 'category', '69', '操作url：/Admin/Category/remove/id/69.html', '1', '1494379416');
INSERT INTO `v_action_log` VALUES ('333', '1', '1', '167772674', 'member', '1', 'Administrator在2017-06-17 14:08登录了后台', '1', '1497679693');
INSERT INTO `v_action_log` VALUES ('334', '6', '1', '167772674', 'config', '61', '操作url：/Admin/Config/edit.html', '1', '1497679980');
INSERT INTO `v_action_log` VALUES ('335', '1', '1', '167772674', 'member', '1', 'Administrator在2017-07-13 10:00登录了后台', '1', '1499911249');
INSERT INTO `v_action_log` VALUES ('336', '6', '1', '167772674', 'config', '63', '操作url：/Admin/Config/edit.html', '1', '1499911260');
INSERT INTO `v_action_log` VALUES ('337', '11', '1', '167772674', 'category', '52', '操作url：/Admin/Category/edit.html', '1', '1499912561');
INSERT INTO `v_action_log` VALUES ('338', '1', '1', '167772674', 'member', '1', 'Administrator在2017-07-13 14:28登录了后台', '1', '1499927290');
INSERT INTO `v_action_log` VALUES ('339', '11', '1', '167772674', 'category', '57', '操作url：/Admin/Category/edit.html', '1', '1499931384');
INSERT INTO `v_action_log` VALUES ('340', '11', '1', '167772674', 'category', '57', '操作url：/Admin/Category/edit.html', '1', '1499931393');
INSERT INTO `v_action_log` VALUES ('341', '11', '1', '167772674', 'category', '58', '操作url：/Admin/Category/edit.html', '1', '1499931572');
INSERT INTO `v_action_log` VALUES ('342', '11', '1', '167772674', 'category', '59', '操作url：/Admin/Category/edit.html', '1', '1499931684');
INSERT INTO `v_action_log` VALUES ('343', '11', '1', '167772674', 'category', '60', '操作url：/Admin/Category/edit.html', '1', '1499933273');
INSERT INTO `v_action_log` VALUES ('344', '9', '1', '167772674', 'channel', '5', '操作url：/Admin/Channel/edit.html', '1', '1500001761');
INSERT INTO `v_action_log` VALUES ('345', '9', '1', '167772674', 'channel', '8', '操作url：/Admin/Channel/edit.html', '1', '1500001783');
INSERT INTO `v_action_log` VALUES ('346', '9', '1', '167772674', 'channel', '9', '操作url：/Admin/Channel/edit.html', '1', '1500001794');
INSERT INTO `v_action_log` VALUES ('347', '9', '1', '167772674', 'channel', '11', '操作url：/Admin/Channel/edit.html', '1', '1500001826');
INSERT INTO `v_action_log` VALUES ('348', '8', '1', '167772674', 'attribute', '43', '操作url：/Admin/Attribute/update.html', '1', '1500004773');
INSERT INTO `v_action_log` VALUES ('349', '7', '1', '167772674', 'model', '2', '操作url：/Admin/Model/update.html', '1', '1500004798');
INSERT INTO `v_action_log` VALUES ('350', '1', '1', '167772674', 'member', '1', 'Administrator在2017-07-14 15:25登录了后台', '1', '1500017114');
INSERT INTO `v_action_log` VALUES ('351', '6', '1', '167772674', 'config', '39', '操作url：/Admin/Config/edit.html', '1', '1500017144');
INSERT INTO `v_action_log` VALUES ('352', '6', '1', '167772674', 'config', '59', '操作url：/Admin/Config/edit.html', '1', '1500019873');
INSERT INTO `v_action_log` VALUES ('353', '6', '1', '167772674', 'config', '51', '操作url：/Admin/Config/edit.html', '1', '1500019896');
INSERT INTO `v_action_log` VALUES ('354', '1', '1', '167772674', 'member', '1', 'Administrator在2017-07-15 08:54登录了后台', '1', '1500080052');
INSERT INTO `v_action_log` VALUES ('355', '11', '1', '167772674', 'category', '70', '操作url：/Admin/Category/add.html', '1', '1500081200');
INSERT INTO `v_action_log` VALUES ('356', '11', '1', '167772674', 'category', '71', '操作url：/Admin/Category/add.html', '1', '1500081226');
INSERT INTO `v_action_log` VALUES ('357', '1', '1', '167772674', 'member', '1', 'Administrator在2017-07-15 13:58登录了后台', '1', '1500098293');
INSERT INTO `v_action_log` VALUES ('358', '1', '1', '167772674', 'member', '1', 'Administrator在2017-07-17 08:53登录了后台', '1', '1500252819');
INSERT INTO `v_action_log` VALUES ('359', '1', '1', '167772674', 'member', '1', 'Administrator在2017-07-17 14:02登录了后台', '1', '1500271348');
INSERT INTO `v_action_log` VALUES ('360', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-01 09:52登录了后台', '1', '1501552332');
INSERT INTO `v_action_log` VALUES ('361', '11', '1', '167772674', 'category', '72', '操作url：/Admin/Category/add.html', '1', '1501557617');
INSERT INTO `v_action_log` VALUES ('362', '11', '1', '167772674', 'category', '73', '操作url：/Admin/Category/add.html', '1', '1501558997');
INSERT INTO `v_action_log` VALUES ('363', '11', '1', '167772674', 'category', '74', '操作url：/Admin/Category/add.html', '1', '1501559149');
INSERT INTO `v_action_log` VALUES ('364', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-01 14:02登录了后台', '1', '1501567358');
INSERT INTO `v_action_log` VALUES ('365', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-01 14:43登录了后台', '1', '1501569809');
INSERT INTO `v_action_log` VALUES ('366', '11', '1', '167772674', 'category', '72', '操作url：/Admin/Category/remove/id/72.html', '1', '1501570569');
INSERT INTO `v_action_log` VALUES ('367', '11', '1', '167772674', 'category', '74', '操作url：/Admin/Category/edit.html', '1', '1501571476');
INSERT INTO `v_action_log` VALUES ('368', '11', '1', '167772674', 'category', '75', '操作url：/Admin/Category/add.html', '1', '1501571789');
INSERT INTO `v_action_log` VALUES ('369', '11', '1', '167772674', 'category', '76', '操作url：/Admin/Category/add.html', '1', '1501571813');
INSERT INTO `v_action_log` VALUES ('370', '11', '1', '167772674', 'category', '77', '操作url：/Admin/Category/add.html', '1', '1501571852');
INSERT INTO `v_action_log` VALUES ('371', '11', '1', '167772674', 'category', '78', '操作url：/Admin/Category/add.html', '1', '1501571881');
INSERT INTO `v_action_log` VALUES ('372', '11', '1', '167772674', 'category', '75', '操作url：/Admin/Category/remove/id/75.html', '1', '1501571941');
INSERT INTO `v_action_log` VALUES ('373', '11', '1', '167772674', 'category', '77', '操作url：/Admin/Category/remove/id/77.html', '1', '1501571948');
INSERT INTO `v_action_log` VALUES ('374', '11', '1', '167772674', 'category', '78', '操作url：/Admin/Category/remove/id/78.html', '1', '1501571994');
INSERT INTO `v_action_log` VALUES ('375', '11', '1', '167772674', 'category', '79', '操作url：/Admin/Category/add.html', '1', '1501572013');
INSERT INTO `v_action_log` VALUES ('376', '11', '1', '167772674', 'category', '80', '操作url：/Admin/Category/add.html', '1', '1501572033');
INSERT INTO `v_action_log` VALUES ('377', '11', '1', '167772674', 'category', '74', '操作url：/Admin/Category/edit.html', '1', '1501572090');
INSERT INTO `v_action_log` VALUES ('378', '11', '1', '167772674', 'category', '74', '操作url：/Admin/Category/edit.html', '1', '1501572107');
INSERT INTO `v_action_log` VALUES ('379', '11', '1', '167772674', 'category', '80', '操作url：/Admin/Category/edit.html', '1', '1501572120');
INSERT INTO `v_action_log` VALUES ('380', '11', '1', '167772674', 'category', '73', '操作url：/Admin/Category/edit.html', '1', '1501572377');
INSERT INTO `v_action_log` VALUES ('381', '11', '1', '167772674', 'category', '81', '操作url：/Admin/Category/add.html', '1', '1501574471');
INSERT INTO `v_action_log` VALUES ('382', '11', '1', '167772674', 'category', '81', '操作url：/Admin/Category/remove/id/81.html', '1', '1501574488');
INSERT INTO `v_action_log` VALUES ('383', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-02 10:12登录了后台', '1', '1501639949');
INSERT INTO `v_action_log` VALUES ('384', '11', '1', '167772674', 'category', '82', '操作url：/Admin/Category/add.html', '1', '1501640239');
INSERT INTO `v_action_log` VALUES ('385', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-03 09:04登录了后台', '1', '1501722256');
INSERT INTO `v_action_log` VALUES ('386', '11', '1', '167772674', 'category', '73', '操作url：/Admin/Category/edit.html', '1', '1501722445');
INSERT INTO `v_action_log` VALUES ('387', '11', '1', '167772674', 'category', '74', '操作url：/Admin/Category/edit.html', '1', '1501724674');
INSERT INTO `v_action_log` VALUES ('388', '11', '1', '167772674', 'category', '74', '操作url：/Admin/Category/edit.html', '1', '1501724822');
INSERT INTO `v_action_log` VALUES ('389', '11', '1', '167772674', 'category', '74', '操作url：/Admin/Category/edit.html', '1', '1501728270');
INSERT INTO `v_action_log` VALUES ('390', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-04 09:03登录了后台', '1', '1501808637');
INSERT INTO `v_action_log` VALUES ('391', '8', '1', '167772674', 'attribute', '44', '操作url：/Admin/Attribute/update.html', '1', '1501816201');
INSERT INTO `v_action_log` VALUES ('392', '8', '1', '167772674', 'attribute', '44', '操作url：/Admin/Attribute/remove/id/44.html', '1', '1501816225');
INSERT INTO `v_action_log` VALUES ('393', '8', '1', '167772674', 'attribute', '43', '操作url：/Admin/Attribute/update.html', '1', '1501816240');
INSERT INTO `v_action_log` VALUES ('394', '7', '1', '167772674', 'model', '2', '操作url：/Admin/Model/update.html', '1', '1501816258');
INSERT INTO `v_action_log` VALUES ('395', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-08 14:57登录了后台', '1', '1502175468');
INSERT INTO `v_action_log` VALUES ('396', '11', '1', '167772674', 'category', '83', '操作url：/Admin/Category/add.html', '1', '1502178192');
INSERT INTO `v_action_log` VALUES ('397', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-08 17:15登录了后台', '1', '1502183759');
INSERT INTO `v_action_log` VALUES ('398', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-09 08:34登录了后台', '1', '1502238891');
INSERT INTO `v_action_log` VALUES ('399', '11', '1', '167772674', 'category', '84', '操作url：/Admin/Category/add.html', '1', '1502238948');
INSERT INTO `v_action_log` VALUES ('400', '11', '1', '167772674', 'category', '76', '操作url：/Admin/Category/remove/id/76.html', '1', '1502239071');
INSERT INTO `v_action_log` VALUES ('401', '11', '1', '167772674', 'category', '80', '操作url：/Admin/Category/remove/id/80.html', '1', '1502239075');
INSERT INTO `v_action_log` VALUES ('402', '11', '1', '167772674', 'category', '79', '操作url：/Admin/Category/remove/id/79.html', '1', '1502239079');
INSERT INTO `v_action_log` VALUES ('403', '11', '1', '167772674', 'category', '83', '操作url：/Admin/Category/remove/id/83.html', '1', '1502239084');
INSERT INTO `v_action_log` VALUES ('404', '8', '1', '167772674', 'attribute', '45', '操作url：/Admin/Attribute/update.html', '1', '1502239245');
INSERT INTO `v_action_log` VALUES ('405', '7', '1', '167772674', 'model', '2', '操作url：/Admin/Model/update.html', '1', '1502239274');
INSERT INTO `v_action_log` VALUES ('406', '8', '1', '167772674', 'attribute', '45', '操作url：/Admin/Attribute/update.html', '1', '1502239339');
INSERT INTO `v_action_log` VALUES ('407', '11', '1', '167772674', 'category', '82', '操作url：/Admin/Category/remove/id/82.html', '1', '1502239870');
INSERT INTO `v_action_log` VALUES ('408', '11', '1', '167772674', 'category', '85', '操作url：/Admin/Category/add.html', '1', '1502249139');
INSERT INTO `v_action_log` VALUES ('409', '11', '1', '167772674', 'category', '86', '操作url：/Admin/Category/add.html', '1', '1502249229');
INSERT INTO `v_action_log` VALUES ('410', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-09 14:09登录了后台', '1', '1502258941');
INSERT INTO `v_action_log` VALUES ('411', '11', '1', '167772674', 'category', '86', '操作url：/Admin/Category/edit.html', '1', '1502258990');
INSERT INTO `v_action_log` VALUES ('412', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-10 09:45登录了后台', '1', '1502329547');
INSERT INTO `v_action_log` VALUES ('413', '11', '1', '167772674', 'category', '86', '操作url：/Admin/Category/edit.html', '1', '1502329799');
INSERT INTO `v_action_log` VALUES ('414', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-10 11:07登录了后台', '1', '1502334435');
INSERT INTO `v_action_log` VALUES ('415', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-10 14:17登录了后台', '1', '1502345867');
INSERT INTO `v_action_log` VALUES ('416', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-10 14:38登录了后台', '1', '1502347092');
INSERT INTO `v_action_log` VALUES ('417', '11', '1', '167772674', 'category', '74', '操作url：/Admin/Category/edit.html', '1', '1502348188');
INSERT INTO `v_action_log` VALUES ('418', '11', '1', '167772674', 'category', '74', '操作url：/Admin/Category/edit.html', '1', '1502348218');
INSERT INTO `v_action_log` VALUES ('419', '8', '1', '167772674', 'attribute', '46', '操作url：/Admin/Attribute/update.html', '1', '1502353300');
INSERT INTO `v_action_log` VALUES ('420', '7', '1', '167772674', 'model', '2', '操作url：/Admin/Model/update.html', '1', '1502353339');
INSERT INTO `v_action_log` VALUES ('421', '8', '1', '167772674', 'attribute', '47', '操作url：/Admin/Attribute/update.html', '1', '1502355425');
INSERT INTO `v_action_log` VALUES ('422', '7', '1', '167772674', 'model', '2', '操作url：/Admin/Model/update.html', '1', '1502355458');
INSERT INTO `v_action_log` VALUES ('423', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-11 08:54登录了后台', '1', '1502412866');
INSERT INTO `v_action_log` VALUES ('424', '8', '1', '167772674', 'attribute', '47', '操作url：/Admin/Attribute/remove/id/47.html', '1', '1502418318');
INSERT INTO `v_action_log` VALUES ('425', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-11 14:00登录了后台', '1', '1502431218');
INSERT INTO `v_action_log` VALUES ('426', '11', '1', '167772674', 'category', '85', '操作url：/Admin/Category/edit.html', '1', '1502444574');
INSERT INTO `v_action_log` VALUES ('427', '11', '1', '167772674', 'category', '73', '操作url：/Admin/Category/edit.html', '1', '1502444586');
INSERT INTO `v_action_log` VALUES ('428', '11', '1', '167772674', 'category', '87', '操作url：/Admin/Category/add.html', '1', '1502445416');
INSERT INTO `v_action_log` VALUES ('429', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-11 18:25登录了后台', '1', '1502447125');
INSERT INTO `v_action_log` VALUES ('430', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-12 15:31登录了后台', '1', '1502523109');
INSERT INTO `v_action_log` VALUES ('431', '11', '1', '167772674', 'category', '74', '操作url：/Admin/Category/edit.html', '1', '1502523154');
INSERT INTO `v_action_log` VALUES ('432', '11', '1', '167772674', 'category', '88', '操作url：/Admin/Category/add.html', '1', '1502523196');
INSERT INTO `v_action_log` VALUES ('433', '11', '1', '167772674', 'category', '88', '操作url：/Admin/Category/edit.html', '1', '1502525072');
INSERT INTO `v_action_log` VALUES ('434', '11', '1', '167772674', 'category', '88', '操作url：/Admin/Category/edit.html', '1', '1502525092');
INSERT INTO `v_action_log` VALUES ('435', '11', '1', '167772674', 'category', '74', '操作url：/Admin/Category/edit.html', '1', '1502525325');
INSERT INTO `v_action_log` VALUES ('436', '11', '1', '167772674', 'category', '86', '操作url：/Admin/Category/edit.html', '1', '1502526679');
INSERT INTO `v_action_log` VALUES ('437', '11', '1', '167772674', 'category', '89', '操作url：/Admin/Category/add.html', '1', '1502526869');
INSERT INTO `v_action_log` VALUES ('438', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-14 08:47登录了后台', '1', '1502671650');
INSERT INTO `v_action_log` VALUES ('439', '11', '1', '167772674', 'category', '88', '操作url：/Admin/Category/edit.html', '1', '1502672440');
INSERT INTO `v_action_log` VALUES ('440', '11', '1', '167772674', 'category', '88', '操作url：/Admin/Category/edit.html', '1', '1502672474');
INSERT INTO `v_action_log` VALUES ('441', '11', '1', '167772674', 'category', '74', '操作url：/Admin/Category/edit.html', '1', '1502672614');
INSERT INTO `v_action_log` VALUES ('442', '11', '1', '167772674', 'category', '74', '操作url：/Admin/Category/edit.html', '1', '1502679465');
INSERT INTO `v_action_log` VALUES ('443', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-14 13:52登录了后台', '1', '1502689946');
INSERT INTO `v_action_log` VALUES ('444', '11', '1', '167772674', 'category', '88', '操作url：/Admin/Category/edit.html', '1', '1502691592');
INSERT INTO `v_action_log` VALUES ('445', '11', '1', '167772674', 'category', '89', '操作url：/Admin/Category/edit.html', '1', '1502691619');
INSERT INTO `v_action_log` VALUES ('446', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-15 08:40登录了后台', '1', '1502757618');
INSERT INTO `v_action_log` VALUES ('447', '11', '1', '167772674', 'category', '90', '操作url：/Admin/Category/add.html', '1', '1502757699');
INSERT INTO `v_action_log` VALUES ('448', '11', '1', '167772674', 'category', '91', '操作url：/Admin/Category/add.html', '1', '1502757758');
INSERT INTO `v_action_log` VALUES ('449', '11', '1', '167772674', 'category', '92', '操作url：/Admin/Category/add.html', '1', '1502757839');
INSERT INTO `v_action_log` VALUES ('450', '11', '1', '167772674', 'category', '95', '操作url：/Admin/Category/edit.html', '1', '1502758622');
INSERT INTO `v_action_log` VALUES ('451', '11', '1', '167772674', 'category', '95', '操作url：/Admin/Category/edit.html', '1', '1502758642');
INSERT INTO `v_action_log` VALUES ('452', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-15 13:54登录了后台', '1', '1502776485');
INSERT INTO `v_action_log` VALUES ('453', '11', '1', '167772674', 'category', '106', '操作url：/Admin/Category/edit.html', '1', '1502779448');
INSERT INTO `v_action_log` VALUES ('454', '11', '1', '167772674', 'category', '96', '操作url：/Admin/Category/edit.html', '1', '1502779467');
INSERT INTO `v_action_log` VALUES ('455', '11', '1', '167772674', 'category', '92', '操作url：/Admin/Category/edit.html', '1', '1502779508');
INSERT INTO `v_action_log` VALUES ('456', '11', '1', '167772674', 'category', '95', '操作url：/Admin/Category/edit.html', '1', '1502779518');
INSERT INTO `v_action_log` VALUES ('457', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-16 10:47登录了后台', '1', '1502851658');
INSERT INTO `v_action_log` VALUES ('458', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-16 14:43登录了后台', '1', '1502865797');
INSERT INTO `v_action_log` VALUES ('459', '11', '1', '167772674', 'category', '90', '操作url：/Admin/Category/edit.html', '1', '1502865816');
INSERT INTO `v_action_log` VALUES ('460', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-16 17:02登录了后台', '1', '1502874168');
INSERT INTO `v_action_log` VALUES ('461', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-17 18:02登录了后台', '1', '1502964156');
INSERT INTO `v_action_log` VALUES ('462', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-18 16:08登录了后台', '1', '1503043690');
INSERT INTO `v_action_log` VALUES ('463', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-18 17:35登录了后台', '1', '1503048956');
INSERT INTO `v_action_log` VALUES ('464', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-21 09:02登录了后台', '1', '1503277367');
INSERT INTO `v_action_log` VALUES ('465', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-23 08:47登录了后台', '1', '1503449249');
INSERT INTO `v_action_log` VALUES ('466', '11', '1', '167772674', 'category', '115', '操作url：/Admin/Category/add.html', '1', '1503450062');
INSERT INTO `v_action_log` VALUES ('467', '11', '1', '167772674', 'category', '116', '操作url：/Admin/Category/add.html', '1', '1503450153');
INSERT INTO `v_action_log` VALUES ('468', '8', '1', '167772674', 'attribute', '48', '操作url：/Admin/Attribute/update.html', '1', '1503451367');
INSERT INTO `v_action_log` VALUES ('469', '8', '1', '167772674', 'attribute', '49', '操作url：/Admin/Attribute/update.html', '1', '1503451389');
INSERT INTO `v_action_log` VALUES ('470', '8', '1', '167772674', 'attribute', '50', '操作url：/Admin/Attribute/update.html', '1', '1503451444');
INSERT INTO `v_action_log` VALUES ('471', '8', '1', '167772674', 'attribute', '51', '操作url：/Admin/Attribute/update.html', '1', '1503451487');
INSERT INTO `v_action_log` VALUES ('472', '8', '1', '167772674', 'attribute', '50', '操作url：/Admin/Attribute/remove/id/50.html', '1', '1503451609');
INSERT INTO `v_action_log` VALUES ('473', '8', '1', '167772674', 'attribute', '52', '操作url：/Admin/Attribute/update.html', '1', '1503451784');
INSERT INTO `v_action_log` VALUES ('474', '8', '1', '167772674', 'attribute', '53', '操作url：/Admin/Attribute/update.html', '1', '1503451887');
INSERT INTO `v_action_log` VALUES ('475', '8', '1', '167772674', 'attribute', '54', '操作url：/Admin/Attribute/update.html', '1', '1503451905');
INSERT INTO `v_action_log` VALUES ('476', '8', '1', '167772674', 'attribute', '55', '操作url：/Admin/Attribute/update.html', '1', '1503451921');
INSERT INTO `v_action_log` VALUES ('477', '7', '1', '167772674', 'model', '2', '操作url：/Admin/Model/update.html', '1', '1503451972');
INSERT INTO `v_action_log` VALUES ('478', '7', '1', '167772674', 'model', '2', '操作url：/Admin/Model/update.html', '1', '1503452038');
INSERT INTO `v_action_log` VALUES ('479', '9', '1', '167772674', 'channel', '5', '操作url：/Admin/Channel/edit.html', '1', '1503452682');
INSERT INTO `v_action_log` VALUES ('480', '11', '1', '167772674', 'category', '84', '操作url：/Admin/Category/edit.html', '1', '1503452707');
INSERT INTO `v_action_log` VALUES ('481', '8', '1', '167772674', 'attribute', '56', '操作url：/Admin/Attribute/update.html', '1', '1503454282');
INSERT INTO `v_action_log` VALUES ('482', '7', '1', '167772674', 'model', '2', '操作url：/Admin/Model/update.html', '1', '1503454342');
INSERT INTO `v_action_log` VALUES ('483', '11', '1', '167772674', 'category', '117', '操作url：/Admin/Category/add.html', '1', '1503454423');
INSERT INTO `v_action_log` VALUES ('484', '11', '1', '167772674', 'category', '118', '操作url：/Admin/Category/add.html', '1', '1503454641');
INSERT INTO `v_action_log` VALUES ('485', '11', '1', '167772674', 'category', '119', '操作url：/Admin/Category/add.html', '1', '1503454657');
INSERT INTO `v_action_log` VALUES ('486', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-23 13:58登录了后台', '1', '1503467891');
INSERT INTO `v_action_log` VALUES ('487', '11', '1', '167772674', 'category', '84', '操作url：/Admin/Category/edit.html', '1', '1503470297');
INSERT INTO `v_action_log` VALUES ('488', '11', '1', '167772674', 'category', '84', '操作url：/Admin/Category/edit.html', '1', '1503474632');
INSERT INTO `v_action_log` VALUES ('489', '11', '1', '167772674', 'category', '84', '操作url：/Admin/Category/edit.html', '1', '1503474647');
INSERT INTO `v_action_log` VALUES ('490', '11', '1', '167772674', 'category', '84', '操作url：/Admin/Category/edit.html', '1', '1503474874');
INSERT INTO `v_action_log` VALUES ('491', '11', '1', '167772674', 'category', '116', '操作url：/Admin/Category/edit.html', '1', '1503475233');
INSERT INTO `v_action_log` VALUES ('492', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-24 11:32登录了后台', '1', '1503545555');
INSERT INTO `v_action_log` VALUES ('493', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-24 14:03登录了后台', '1', '1503554581');
INSERT INTO `v_action_log` VALUES ('494', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-24 15:19登录了后台', '1', '1503559194');
INSERT INTO `v_action_log` VALUES ('495', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-25 10:07登录了后台', '1', '1503626833');
INSERT INTO `v_action_log` VALUES ('496', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-25 14:04登录了后台', '1', '1503641067');
INSERT INTO `v_action_log` VALUES ('497', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-28 08:46登录了后台', '1', '1503881179');
INSERT INTO `v_action_log` VALUES ('498', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-28 14:07登录了后台', '1', '1503900436');
INSERT INTO `v_action_log` VALUES ('499', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-28 17:50登录了后台', '1', '1503913842');
INSERT INTO `v_action_log` VALUES ('500', '1', '1', '167772674', 'member', '1', 'Administrator在2017-08-29 09:12登录了后台', '1', '1503969150');
INSERT INTO `v_action_log` VALUES ('501', '1', '1', '1928929119', 'member', '1', 'Administrator在2017-08-30 09:21登录了后台', '1', '1504056108');
INSERT INTO `v_action_log` VALUES ('502', '11', '1', '1928929119', 'category', '84', '操作url：/admin/category/edit.html', '1', '1504056250');
INSERT INTO `v_action_log` VALUES ('503', '11', '1', '1928929119', 'category', '116', '操作url：/admin/category/edit.html', '1', '1504056273');
INSERT INTO `v_action_log` VALUES ('504', '11', '1', '1928929119', 'category', '84', '操作url：/admin/category/edit.html', '1', '1504056672');
INSERT INTO `v_action_log` VALUES ('505', '9', '1', '1928929119', 'channel', '5', '操作url：/admin/channel/edit.html', '1', '1504058456');
INSERT INTO `v_action_log` VALUES ('506', '11', '1', '1928929119', 'category', '84', '操作url：/admin/category/edit.html', '1', '1504058698');
INSERT INTO `v_action_log` VALUES ('507', '11', '1', '1928929119', 'category', '116', '操作url：/admin/category/edit.html', '1', '1504058723');
INSERT INTO `v_action_log` VALUES ('508', '1', '1', '1875011902', 'member', '1', 'Administrator在2017-08-31 09:03登录了后台', '1', '1504141399');
INSERT INTO `v_action_log` VALUES ('509', '8', '1', '1875011902', 'attribute', '57', '操作url：/admin/attribute/update.html', '1', '1504145107');
INSERT INTO `v_action_log` VALUES ('510', '7', '1', '1875011140', 'model', '2', '操作url：/admin/model/update.html', '1', '1504145154');
INSERT INTO `v_action_log` VALUES ('511', '6', '1', '1875011140', 'config', '41', '操作url：/admin/config/edit.html', '1', '1504145411');
INSERT INTO `v_action_log` VALUES ('512', '1', '1', '1875011902', 'member', '1', 'Administrator在2017-09-01 09:03登录了后台', '1', '1504227820');
INSERT INTO `v_action_log` VALUES ('513', '9', '1', '1875011140', 'channel', '6', '操作url：/admin/channel/edit.html', '1', '1504227851');
INSERT INTO `v_action_log` VALUES ('514', '1', '1', '1875011902', 'member', '1', 'Administrator在2017-09-01 09:05登录了后台', '1', '1504227921');
INSERT INTO `v_action_log` VALUES ('515', '11', '1', '1875011140', 'category', '51', '操作url：/admin/category/edit.html', '1', '1504229183');
INSERT INTO `v_action_log` VALUES ('516', '11', '1', '1875011140', 'category', '120', '操作url：/admin/category/add.html', '1', '1504229478');
INSERT INTO `v_action_log` VALUES ('517', '9', '1', '1875011140', 'channel', '8', '操作url：/admin/channel/edit.html', '1', '1504229504');
INSERT INTO `v_action_log` VALUES ('518', '11', '1', '1875011140', 'category', '120', '操作url：/admin/category/edit.html', '1', '1504231985');
INSERT INTO `v_action_log` VALUES ('519', '11', '1', '1875011140', 'category', '61', '操作url：/admin/category/edit.html', '1', '1504232034');
INSERT INTO `v_action_log` VALUES ('520', '11', '1', '1875011902', 'category', '61', '操作url：/admin/category/edit.html', '1', '1504232040');
INSERT INTO `v_action_log` VALUES ('521', '9', '1', '1875011902', 'channel', '8', '操作url：/admin/channel/edit.html', '1', '1504232063');
INSERT INTO `v_action_log` VALUES ('522', '1', '1', '1875011902', 'member', '1', 'Administrator在2017-09-01 10:22登录了后台', '1', '1504232548');
INSERT INTO `v_action_log` VALUES ('523', '1', '1', '1875011902', 'member', '1', 'Administrator在2017-09-01 10:28登录了后台', '1', '1504232888');
INSERT INTO `v_action_log` VALUES ('524', '1', '1', '1875011902', 'member', '1', 'Administrator在2017-09-01 14:44登录了后台', '1', '1504248263');
INSERT INTO `v_action_log` VALUES ('525', '11', '1', '1875011902', 'category', '117', '操作url：/admin/category/edit.html', '1', '1504256018');
INSERT INTO `v_action_log` VALUES ('526', '11', '1', '1875011902', 'category', '120', '操作url：/admin/category/edit.html', '1', '1504256044');
INSERT INTO `v_action_log` VALUES ('527', '11', '1', '1875011902', 'category', '116', '操作url：/admin/category/edit.html', '1', '1504256094');
INSERT INTO `v_action_log` VALUES ('528', '11', '1', '1875011902', 'category', '117', '操作url：/admin/category/edit.html', '1', '1504256103');
INSERT INTO `v_action_log` VALUES ('529', '11', '1', '1875011902', 'category', '120', '操作url：/admin/category/edit.html', '1', '1504256112');
INSERT INTO `v_action_log` VALUES ('530', '1', '1', '1928382285', 'member', '1', 'Administrator在2017-09-02 08:43登录了后台', '1', '1504313022');
INSERT INTO `v_action_log` VALUES ('531', '8', '1', '1928382285', 'attribute', '58', '操作url：/admin/attribute/update.html', '1', '1504313545');
INSERT INTO `v_action_log` VALUES ('532', '7', '1', '1928382285', 'model', '2', '操作url：/admin/model/update.html', '1', '1504313572');
INSERT INTO `v_action_log` VALUES ('533', '7', '1', '2071446469', 'model', '2', '操作url：/admin/model/update.html', '1', '1504315580');
INSERT INTO `v_action_log` VALUES ('534', '11', '1', '2071446469', 'category', '50', '操作url：/admin/category/edit.html', '1', '1504316191');
INSERT INTO `v_action_log` VALUES ('535', '11', '1', '2071446469', 'category', '56', '操作url：/admin/category/edit.html', '1', '1504316198');
INSERT INTO `v_action_log` VALUES ('536', '11', '1', '2071446469', 'category', '49', '操作url：/admin/category/edit.html', '1', '1504316242');
INSERT INTO `v_action_log` VALUES ('537', '11', '1', '2071446469', 'category', '53', '操作url：/admin/category/edit.html', '1', '1504316256');
INSERT INTO `v_action_log` VALUES ('538', '11', '1', '2071446469', 'category', '54', '操作url：/admin/category/edit.html', '1', '1504316261');
INSERT INTO `v_action_log` VALUES ('539', '11', '1', '2071446469', 'category', '62', '操作url：/admin/category/edit.html', '1', '1504316267');
INSERT INTO `v_action_log` VALUES ('540', '1', '1', '1928382285', 'member', '1', 'Administrator在2017-09-02 10:21登录了后台', '1', '1504318906');
INSERT INTO `v_action_log` VALUES ('541', '11', '1', '1875012912', 'category', '121', '操作url：/admin/category/add.html', '1', '1504336877');
INSERT INTO `v_action_log` VALUES ('542', '11', '1', '1875014233', 'category', '51', '操作url：/admin/category/edit.html', '1', '1504338121');
INSERT INTO `v_action_log` VALUES ('543', '1', '1', '1875014233', 'member', '1', 'Administrator在2017-09-04 15:12登录了后台', '1', '1504509166');
INSERT INTO `v_action_log` VALUES ('544', '1', '1', '1875014233', 'member', '1', 'Administrator在2017-09-04 15:51登录了后台', '1', '1504511515');
INSERT INTO `v_action_log` VALUES ('545', '11', '1', '1875014233', 'category', '50', '操作url：/admin/category/edit.html', '1', '1504511643');
INSERT INTO `v_action_log` VALUES ('546', '9', '1', '2071446469', 'channel', '7', '操作url：/admin/channel/edit.html', '1', '1504512209');
INSERT INTO `v_action_log` VALUES ('547', '9', '1', '2071446469', 'channel', '7', '操作url：/admin/channel/edit.html', '1', '1504512236');
INSERT INTO `v_action_log` VALUES ('548', '11', '1', '2071446469', 'category', '53', '操作url：/admin/category/edit.html', '1', '1504512258');
INSERT INTO `v_action_log` VALUES ('549', '11', '1', '2071446469', 'category', '53', '操作url：/admin/category/edit.html', '1', '1504512283');
INSERT INTO `v_action_log` VALUES ('550', '11', '1', '2071446469', 'category', '53', '操作url：/admin/category/edit.html', '1', '1504512313');
INSERT INTO `v_action_log` VALUES ('551', '11', '1', '2071446469', 'category', '53', '操作url：/admin/category/edit.html', '1', '1504512350');
INSERT INTO `v_action_log` VALUES ('552', '11', '1', '2071446469', 'category', '53', '操作url：/admin/category/edit.html', '1', '1504512712');
INSERT INTO `v_action_log` VALUES ('553', '11', '1', '2071446469', 'category', '56', '操作url：/admin/category/edit.html', '1', '1504518541');
INSERT INTO `v_action_log` VALUES ('554', '1', '1', '2071446469', 'member', '1', 'Administrator在2017-09-05 09:55登录了后台', '1', '1504576544');
INSERT INTO `v_action_log` VALUES ('555', '1', '1', '2071446469', 'member', '1', 'Administrator在2017-09-06 16:21登录了后台', '1', '1504686098');
INSERT INTO `v_action_log` VALUES ('556', '1', '1', '2071446469', 'member', '1', 'Administrator在2017-09-07 10:27登录了后台', '1', '1504751266');
INSERT INTO `v_action_log` VALUES ('557', '1', '1', '3722300877', 'member', '1', 'Administrator在2017-09-08 15:59登录了后台', '1', '1504857587');
INSERT INTO `v_action_log` VALUES ('558', '1', '1', '3722300877', 'member', '1', 'Administrator在2017-09-09 17:25登录了后台', '1', '1504949128');
INSERT INTO `v_action_log` VALUES ('559', '1', '1', '2071271123', 'member', '1', 'Administrator在2017-09-12 10:35登录了后台', '1', '1505183704');
INSERT INTO `v_action_log` VALUES ('560', '11', '1', '1875013919', 'category', '122', '操作url：/admin/category/add.html', '1', '1505204490');
INSERT INTO `v_action_log` VALUES ('561', '11', '1', '1875013919', 'category', '122', '操作url：/admin/category/remove/id/122.html', '1', '1505204523');
INSERT INTO `v_action_log` VALUES ('562', '1', '1', '1875013919', 'member', '1', 'Administrator在2017-09-13 10:59登录了后台', '1', '1505271576');
INSERT INTO `v_action_log` VALUES ('563', '9', '1', '2071271123', 'channel', '1', '操作url：/admin/channel/edit.html', '1', '1505271643');
INSERT INTO `v_action_log` VALUES ('564', '1', '1', '1928360061', 'member', '1', 'Administrator在2017-09-14 11:09登录了后台', '1', '1505358568');
INSERT INTO `v_action_log` VALUES ('565', '9', '1', '1928360061', 'channel', '8', '操作url：/admin/channel/edit.html', '1', '1505369343');
INSERT INTO `v_action_log` VALUES ('566', '9', '1', '1928360061', 'channel', '6', '操作url：/admin/channel/edit.html', '1', '1505369359');
INSERT INTO `v_action_log` VALUES ('567', '9', '1', '1928360061', 'channel', '9', '操作url：/admin/channel/edit.html', '1', '1505369371');
INSERT INTO `v_action_log` VALUES ('568', '9', '1', '1928360061', 'channel', '11', '操作url：/admin/channel/edit.html', '1', '1505369392');
INSERT INTO `v_action_log` VALUES ('569', '9', '1', '1928360061', 'channel', '9', '操作url：/admin/channel/edit.html', '1', '1505369400');
INSERT INTO `v_action_log` VALUES ('570', '1', '1', '1875013919', 'member', '1', 'Administrator在2017-09-15 14:49登录了后台', '1', '1505458195');
INSERT INTO `v_action_log` VALUES ('571', '11', '1', '1928360061', 'category', '70', '操作url：/admin/category/remove/id/70.html', '1', '1505460773');
INSERT INTO `v_action_log` VALUES ('572', '11', '1', '1928360061', 'category', '71', '操作url：/admin/category/remove/id/71.html', '1', '1505460777');
INSERT INTO `v_action_log` VALUES ('573', '1', '1', '1875013919', 'member', '1', 'Administrator在2017-09-16 16:45登录了后台', '1', '1505551528');
INSERT INTO `v_action_log` VALUES ('574', '1', '1', '1928926571', 'member', '1', 'Administrator在2017-09-18 15:17登录了后台', '1', '1505719053');
INSERT INTO `v_action_log` VALUES ('575', '1', '1', '1928926571', 'member', '1', 'Administrator在2017-09-18 15:24登录了后台', '1', '1505719446');
INSERT INTO `v_action_log` VALUES ('576', '1', '1', '1928971359', 'member', '1', 'Administrator在2017-09-18 15:33登录了后台', '1', '1505720034');
INSERT INTO `v_action_log` VALUES ('577', '11', '1', '1928926571', 'category', '123', '操作url：/admin/category/add.html', '1', '1505721875');
INSERT INTO `v_action_log` VALUES ('578', '1', '1', '1928971359', 'member', '1', 'Administrator在2017-09-19 12:37登录了后台', '1', '1505795837');
INSERT INTO `v_action_log` VALUES ('579', '1', '1', '1928971359', 'member', '1', 'Administrator在2017-09-19 14:03登录了后台', '1', '1505801009');
INSERT INTO `v_action_log` VALUES ('580', '1', '1', '1928971359', 'member', '1', 'Administrator在2017-09-19 18:06登录了后台', '1', '1505815610');
INSERT INTO `v_action_log` VALUES ('581', '1', '1', '1928926571', 'member', '1', 'Administrator在2017-09-20 08:37登录了后台', '1', '1505867822');
INSERT INTO `v_action_log` VALUES ('582', '9', '1', '1928926571', 'channel', '6', '操作url：/admin/channel/edit.html', '1', '1505867852');
INSERT INTO `v_action_log` VALUES ('583', '11', '1', '1928926571', 'category', '124', '操作url：/admin/category/add.html', '1', '1505867885');
INSERT INTO `v_action_log` VALUES ('584', '11', '1', '1928971359', 'category', '128', '操作url：/admin/category/add.html', '1', '1505867980');
INSERT INTO `v_action_log` VALUES ('585', '11', '1', '1928971359', 'category', '129', '操作url：/admin/category/add.html', '1', '1505868000');
INSERT INTO `v_action_log` VALUES ('586', '8', '1', '1928971359', 'attribute', '59', '操作url：/admin/attribute/update.html', '1', '1505868091');
INSERT INTO `v_action_log` VALUES ('587', '8', '1', '1928971359', 'attribute', '60', '操作url：/admin/attribute/update.html', '1', '1505868109');
INSERT INTO `v_action_log` VALUES ('588', '8', '1', '1928971359', 'attribute', '61', '操作url：/admin/attribute/update.html', '1', '1505868127');
INSERT INTO `v_action_log` VALUES ('589', '7', '1', '1928926571', 'model', '2', '操作url：/admin/model/update.html', '1', '1505868183');
INSERT INTO `v_action_log` VALUES ('590', '11', '1', '1928926571', 'category', '127', '操作url：/admin/category/edit.html', '1', '1505877532');
INSERT INTO `v_action_log` VALUES ('591', '11', '1', '1928926571', 'category', '128', '操作url：/admin/category/edit.html', '1', '1505877543');
INSERT INTO `v_action_log` VALUES ('592', '11', '1', '1928926571', 'category', '129', '操作url：/admin/category/edit.html', '1', '1505877550');
INSERT INTO `v_action_log` VALUES ('593', '1', '1', '1928926571', 'member', '1', 'Administrator在2017-09-21 11:50登录了后台', '1', '1505965829');
INSERT INTO `v_action_log` VALUES ('594', '1', '1', '1928926571', 'member', '1', 'Administrator在2017-09-22 14:04登录了后台', '1', '1506060271');
INSERT INTO `v_action_log` VALUES ('595', '1', '1', '1928971359', 'member', '1', 'Administrator在2017-09-23 11:11登录了后台', '1', '1506136285');
INSERT INTO `v_action_log` VALUES ('596', '11', '1', '1928971359', 'category', '62', '操作url：/admin/category/remove/id/62.html', '1', '1506137072');
INSERT INTO `v_action_log` VALUES ('597', '11', '1', '1928971359', 'category', '121', '操作url：/admin/category/remove/id/121.html', '1', '1506137079');
INSERT INTO `v_action_log` VALUES ('598', '11', '1', '1928926571', 'category', '53', '操作url：/admin/category/edit.html', '1', '1506137304');
INSERT INTO `v_action_log` VALUES ('599', '9', '1', '1928971359', 'channel', '9', '操作url：/admin/channel/edit.html', '1', '1506137469');
INSERT INTO `v_action_log` VALUES ('600', '1', '1', '1928928407', 'member', '1', 'Administrator在2017-09-25 10:22登录了后台', '1', '1506306159');
INSERT INTO `v_action_log` VALUES ('601', '11', '1', '1928928407', 'category', '48', '操作url：/admin/category/edit.html', '1', '1506306690');
INSERT INTO `v_action_log` VALUES ('602', '11', '1', '1928560751', 'category', '54', '操作url：/admin/category/edit.html', '1', '1506306718');
INSERT INTO `v_action_log` VALUES ('603', '11', '1', '1928928407', 'category', '56', '操作url：/admin/category/edit.html', '1', '1506306764');
INSERT INTO `v_action_log` VALUES ('604', '9', '1', '1928928407', 'channel', '8', '操作url：/admin/channel/edit.html', '1', '1506306870');
INSERT INTO `v_action_log` VALUES ('605', '11', '1', '1928560751', 'category', '130', '操作url：/admin/category/add.html', '1', '1506307919');
INSERT INTO `v_action_log` VALUES ('606', '11', '1', '1928560751', 'category', '131', '操作url：/admin/category/add.html', '1', '1506307957');
INSERT INTO `v_action_log` VALUES ('607', '1', '1', '1928972158', 'member', '1', 'Administrator在2017-09-26 09:58登录了后台', '1', '1506391137');
INSERT INTO `v_action_log` VALUES ('608', '1', '1', '1928972158', 'member', '1', 'Administrator在2017-09-27 09:50登录了后台', '1', '1506477016');
INSERT INTO `v_action_log` VALUES ('609', '1', '1', '1928972158', 'member', '1', 'Administrator在2017-09-28 14:23登录了后台', '1', '1506579793');
INSERT INTO `v_action_log` VALUES ('610', '11', '1', '1928972158', 'category', '60', '操作url：/admin/category/remove/id/60.html', '1', '1506579834');
INSERT INTO `v_action_log` VALUES ('611', '11', '1', '1928972158', 'category', '59', '操作url：/admin/category/remove/id/59.html', '1', '1506579839');
INSERT INTO `v_action_log` VALUES ('612', '11', '1', '1928972158', 'category', '58', '操作url：/admin/category/remove/id/58.html', '1', '1506579844');
INSERT INTO `v_action_log` VALUES ('613', '11', '1', '1928972158', 'category', '132', '操作url：/admin/category/add.html', '1', '1506579854');
INSERT INTO `v_action_log` VALUES ('614', '11', '1', '1928972158', 'category', '133', '操作url：/admin/category/add.html', '1', '1506579868');
INSERT INTO `v_action_log` VALUES ('615', '11', '1', '1928972158', 'category', '134', '操作url：/admin/category/add.html', '1', '1506579884');
INSERT INTO `v_action_log` VALUES ('616', '11', '1', '1928972158', 'category', '135', '操作url：/admin/category/add.html', '1', '1506579904');
INSERT INTO `v_action_log` VALUES ('617', '11', '1', '1928972158', 'category', '135', '操作url：/admin/category/remove/id/135.html', '1', '1506579932');
INSERT INTO `v_action_log` VALUES ('618', '11', '1', '1928972158', 'category', '61', '操作url：/admin/category/edit.html', '1', '1506584777');
INSERT INTO `v_action_log` VALUES ('619', '1', '1', '3722303654', 'member', '1', 'Administrator在2017-10-09 13:48登录了后台', '1', '1507528085');
INSERT INTO `v_action_log` VALUES ('620', '11', '1', '3722303654', 'category', '136', '操作url：/admin/category/add.html', '1', '1507528136');
INSERT INTO `v_action_log` VALUES ('621', '11', '1', '3722303654', 'category', '137', '操作url：/admin/category/add.html', '1', '1507528168');
INSERT INTO `v_action_log` VALUES ('622', '11', '1', '1928361594', 'category', '138', '操作url：/admin/category/add.html', '1', '1507528189');
INSERT INTO `v_action_log` VALUES ('623', '8', '1', '3722303654', 'attribute', '33', '操作url：/admin/attribute/update.html', '1', '1507530300');
INSERT INTO `v_action_log` VALUES ('624', '8', '1', '1928361594', 'attribute', '33', '操作url：/admin/attribute/update.html', '1', '1507530716');
INSERT INTO `v_action_log` VALUES ('625', '8', '1', '1928361594', 'attribute', '33', '操作url：/admin/attribute/update.html', '1', '1507530914');
INSERT INTO `v_action_log` VALUES ('626', '8', '1', '2071270532', 'attribute', '33', '操作url：/admin/attribute/update.html', '1', '1507533511');
INSERT INTO `v_action_log` VALUES ('627', '1', '1', '2071270532', 'member', '1', 'Administrator在2017-10-12 14:00登录了后台', '1', '1507788047');
INSERT INTO `v_action_log` VALUES ('628', '1', '1', '1928925252', 'member', '1', 'Administrator在2017-10-13 11:00登录了后台', '1', '1507863632');
INSERT INTO `v_action_log` VALUES ('629', '1', '1', '1928970516', 'member', '1', 'Administrator在2017-10-16 09:26登录了后台', '1', '1508117166');
INSERT INTO `v_action_log` VALUES ('630', '1', '1', '2071271088', 'member', '1', 'Administrator在2017-10-19 16:16登录了后台', '1', '1508400967');
INSERT INTO `v_action_log` VALUES ('631', '1', '1', '1875014659', 'member', '1', 'Administrator在2017-10-19 17:54登录了后台', '1', '1508406879');
INSERT INTO `v_action_log` VALUES ('632', '1', '1', '1875014659', 'member', '1', 'Administrator在2017-10-20 14:15登录了后台', '1', '1508480156');
INSERT INTO `v_action_log` VALUES ('633', '9', '1', '1875014659', 'channel', '0', '操作url：/admin/channel/del/id/7.html', '1', '1508480187');
INSERT INTO `v_action_log` VALUES ('634', '9', '1', '1875014659', 'channel', '0', '操作url：/admin/channel/del/id/10.html', '1', '1508480192');
INSERT INTO `v_action_log` VALUES ('635', '1', '1', '2071271088', 'member', '1', 'Administrator在2017-10-21 09:05登录了后台', '1', '1508547923');
INSERT INTO `v_action_log` VALUES ('636', '1', '1', '2071445572', 'member', '1', 'Administrator在2017-10-25 10:11登录了后台', '1', '1508897466');
INSERT INTO `v_action_log` VALUES ('637', '1', '1', '1875014727', 'member', '1', 'Administrator在2017-10-25 17:40登录了后台', '1', '1508924456');
INSERT INTO `v_action_log` VALUES ('638', '1', '1', '1928970626', 'member', '1', 'Administrator在2017-10-26 10:10登录了后台', '1', '1508983823');
INSERT INTO `v_action_log` VALUES ('639', '1', '1', '3722303585', 'member', '1', 'Administrator在2017-10-27 11:31登录了后台', '1', '1509075073');
INSERT INTO `v_action_log` VALUES ('640', '1', '1', '1874932244', 'member', '1', 'Administrator在2017-10-28 08:54登录了后台', '1', '1509152093');
INSERT INTO `v_action_log` VALUES ('641', '1', '1', '1928972507', 'member', '1', 'Administrator在2017-11-03 16:39登录了后台', '1', '1509698384');
INSERT INTO `v_action_log` VALUES ('642', '11', '1', '1928972507', 'category', '134', '操作url：/admin/category/remove/id/134.html', '1', '1509698402');
INSERT INTO `v_action_log` VALUES ('643', '11', '1', '1928972507', 'category', '133', '操作url：/admin/category/remove/id/133.html', '1', '1509698407');
INSERT INTO `v_action_log` VALUES ('644', '11', '1', '1928972507', 'category', '132', '操作url：/admin/category/remove/id/132.html', '1', '1509698413');
INSERT INTO `v_action_log` VALUES ('645', '1', '1', '1874933008', 'member', '1', 'Administrator在2017-11-04 15:51登录了后台', '1', '1509781910');
INSERT INTO `v_action_log` VALUES ('646', '9', '1', '1874933008', 'channel', '1', '操作url：/admin/channel/edit.html', '1', '1509781972');
INSERT INTO `v_action_log` VALUES ('647', '1', '1', '1928971830', 'member', '1', 'Administrator在2017-11-06 15:02登录了后台', '1', '1509951727');
INSERT INTO `v_action_log` VALUES ('648', '11', '1', '1928971830', 'category', '84', '操作url：/admin/category/edit.html', '1', '1509951744');
INSERT INTO `v_action_log` VALUES ('649', '1', '1', '1928971190', 'member', '1', 'Administrator在2017-11-07 17:50登录了后台', '1', '1510048217');
INSERT INTO `v_action_log` VALUES ('650', '11', '1', '1875011988', 'category', '84', '操作url：/admin/category/edit.html', '1', '1510048231');
INSERT INTO `v_action_log` VALUES ('651', '1', '1', '1928971190', 'member', '1', 'Administrator在2017-11-08 10:08登录了后台', '1', '1510106896');
INSERT INTO `v_action_log` VALUES ('652', '11', '1', '1928971190', 'category', '84', '操作url：/admin/category/edit.html', '1', '1510106941');
INSERT INTO `v_action_log` VALUES ('653', '11', '1', '1928971190', 'category', '116', '操作url：/admin/category/edit.html', '1', '1510106960');
INSERT INTO `v_action_log` VALUES ('654', '11', '1', '1928971190', 'category', '117', '操作url：/admin/category/edit.html', '1', '1510106970');
INSERT INTO `v_action_log` VALUES ('655', '11', '1', '1928971190', 'category', '120', '操作url：/admin/category/edit.html', '1', '1510106979');
INSERT INTO `v_action_log` VALUES ('656', '11', '1', '1928971190', 'category', '119', '操作url：/admin/category/edit.html', '1', '1510106992');
INSERT INTO `v_action_log` VALUES ('657', '11', '1', '1928971190', 'category', '84', '操作url：/admin/category/edit.html', '1', '1510132609');
INSERT INTO `v_action_log` VALUES ('658', '1', '1', '1875009377', 'member', '1', 'Administrator在2017-11-10 08:56登录了后台', '1', '1510275384');
INSERT INTO `v_action_log` VALUES ('659', '1', '1', '1875425482', 'member', '1', 'Administrator在2017-11-13 19:00登录了后台', '1', '1510570804');
INSERT INTO `v_action_log` VALUES ('660', '1', '1', '1928928215', 'member', '1', 'Administrator在2017-11-17 16:49登录了后台', '1', '1510908574');
INSERT INTO `v_action_log` VALUES ('661', '1', '1', '3722304387', 'member', '1', 'Administrator在2017-11-18 15:27登录了后台', '1', '1510990067');
INSERT INTO `v_action_log` VALUES ('662', '1', '1', '3722304387', 'member', '1', 'Administrator在2017-11-20 16:33登录了后台', '1', '1511166824');
INSERT INTO `v_action_log` VALUES ('663', '1', '1', '1928925415', 'member', '1', 'Administrator在2017-11-25 09:17登录了后台', '1', '1511572649');
INSERT INTO `v_action_log` VALUES ('664', '1', '1', '1928925415', 'member', '1', 'Administrator在2017-11-27 14:20登录了后台', '1', '1511763624');
INSERT INTO `v_action_log` VALUES ('665', '1', '1', '1928925415', 'member', '1', 'Administrator在2017-11-29 15:26登录了后台', '1', '1511940377');
INSERT INTO `v_action_log` VALUES ('666', '1', '1', '1928561102', 'member', '1', 'Administrator在2017-12-02 20:37登录了后台', '1', '1512218256');
INSERT INTO `v_action_log` VALUES ('667', '1', '1', '1928561102', 'member', '1', 'Administrator在2017-12-02 20:38登录了后台', '1', '1512218304');
INSERT INTO `v_action_log` VALUES ('668', '1', '1', '1928561102', 'member', '1', 'Administrator在2017-12-02 20:39登录了后台', '1', '1512218389');
INSERT INTO `v_action_log` VALUES ('669', '1', '1', '1928972713', 'member', '1', 'Administrator在2017-12-07 09:01登录了后台', '1', '1512608480');
INSERT INTO `v_action_log` VALUES ('670', '1', '1', '1928972713', 'member', '1', 'Administrator在2017-12-07 10:06登录了后台', '1', '1512612380');
INSERT INTO `v_action_log` VALUES ('671', '1', '1', '2071446394', 'member', '1', 'Administrator在2017-12-07 13:36登录了后台', '1', '1512625017');
INSERT INTO `v_action_log` VALUES ('672', '1', '1', '1928971344', 'member', '1', 'Administrator在2017-12-08 11:13登录了后台', '1', '1512702805');
INSERT INTO `v_action_log` VALUES ('673', '8', '1', '1928972713', 'attribute', '60', '操作url：/admin/attribute/remove/id/60.html', '1', '1512719304');
INSERT INTO `v_action_log` VALUES ('674', '8', '1', '1928972713', 'attribute', '59', '操作url：/admin/attribute/remove/id/59.html', '1', '1512719308');
INSERT INTO `v_action_log` VALUES ('675', '8', '1', '1928971344', 'attribute', '62', '操作url：/admin/attribute/update.html', '1', '1512719409');
INSERT INTO `v_action_log` VALUES ('676', '7', '1', '2071446394', 'model', '2', '操作url：/admin/model/update.html', '1', '1512719475');
INSERT INTO `v_action_log` VALUES ('677', '11', '1', '1928972713', 'category', '127', '操作url：/admin/category/edit.html', '1', '1512719942');
INSERT INTO `v_action_log` VALUES ('678', '1', '1', '1928972713', 'member', '1', 'Administrator在2017-12-08 16:04登录了后台', '1', '1512720268');
INSERT INTO `v_action_log` VALUES ('679', '1', '1', '1928972713', 'member', '1', 'Administrator在2017-12-08 16:57登录了后台', '1', '1512723455');
INSERT INTO `v_action_log` VALUES ('680', '1', '1', '2071446394', 'member', '1', 'Administrator在2017-12-11 09:56登录了后台', '1', '1512957372');
INSERT INTO `v_action_log` VALUES ('681', '11', '1', '1875015021', 'category', '139', '操作url：/admin/category/add.html', '1', '1512971095');
INSERT INTO `v_action_log` VALUES ('682', '11', '1', '1875015021', 'category', '140', '操作url：/admin/category/add.html', '1', '1512971159');
INSERT INTO `v_action_log` VALUES ('683', '11', '1', '1875015021', 'category', '141', '操作url：/admin/category/add.html', '1', '1512971213');
INSERT INTO `v_action_log` VALUES ('684', '1', '1', '1875012760', 'member', '1', 'Administrator在2017-12-11 13:53登录了后台', '1', '1512971591');
INSERT INTO `v_action_log` VALUES ('685', '11', '1', '1875015021', 'category', '137', '操作url：/admin/category/remove/id/137.html', '1', '1512971691');
INSERT INTO `v_action_log` VALUES ('686', '8', '1', '1875015021', 'attribute', '63', '操作url：/admin/attribute/update.html', '1', '1512971906');
INSERT INTO `v_action_log` VALUES ('687', '7', '1', '1875012760', 'model', '2', '操作url：/admin/model/update.html', '1', '1512971976');
INSERT INTO `v_action_log` VALUES ('688', '11', '1', '1875012760', 'category', '61', '操作url：/admin/category/edit.html', '1', '1512973254');
INSERT INTO `v_action_log` VALUES ('689', '9', '1', '1875015538', 'channel', '8', '操作url：/admin/channel/edit.html', '1', '1512973283');
INSERT INTO `v_action_log` VALUES ('690', '11', '1', '1875015538', 'category', '138', '操作url：/admin/category/edit.html', '1', '1512973359');
INSERT INTO `v_action_log` VALUES ('691', '11', '1', '1875015021', 'category', '136', '操作url：/admin/category/edit.html', '1', '1512973368');
INSERT INTO `v_action_log` VALUES ('692', '8', '1', '1875015538', 'attribute', '58', '操作url：/admin/attribute/update.html', '1', '1513064696');
INSERT INTO `v_action_log` VALUES ('693', '8', '1', '1875015021', 'attribute', '58', '操作url：/admin/attribute/update.html', '1', '1513065173');
INSERT INTO `v_action_log` VALUES ('694', '1', '1', '1875015021', 'member', '1', 'Administrator在2017-12-12 15:53登录了后台', '1', '1513065231');
INSERT INTO `v_action_log` VALUES ('695', '7', '1', '1875015538', 'model', '2', '操作url：/admin/model/update.html', '1', '1513065366');
INSERT INTO `v_action_log` VALUES ('696', '8', '1', '1875015021', 'attribute', '58', '操作url：/admin/attribute/remove/id/58.html', '1', '1513065871');
INSERT INTO `v_action_log` VALUES ('697', '8', '1', '1875015538', 'attribute', '64', '操作url：/admin/attribute/update.html', '1', '1513065956');
INSERT INTO `v_action_log` VALUES ('698', '7', '1', '1875015538', 'model', '2', '操作url：/admin/model/update.html', '1', '1513065972');
INSERT INTO `v_action_log` VALUES ('699', '8', '1', '1875015538', 'attribute', '64', '操作url：/admin/attribute/update.html', '1', '1513066089');
INSERT INTO `v_action_log` VALUES ('700', '7', '1', '1875015538', 'model', '2', '操作url：/admin/model/update.html', '1', '1513066112');
INSERT INTO `v_action_log` VALUES ('701', '1', '1', '1875015021', 'member', '1', 'Administrator在2017-12-14 09:50登录了后台', '1', '1513216213');
INSERT INTO `v_action_log` VALUES ('702', '9', '1', '1875015021', 'channel', '12', '操作url：/admin/channel/edit.html', '1', '1513216245');
INSERT INTO `v_action_log` VALUES ('703', '11', '1', '1875012760', 'category', '142', '操作url：/admin/category/add.html', '1', '1513216349');
INSERT INTO `v_action_log` VALUES ('704', '11', '1', '1875015021', 'category', '143', '操作url：/admin/category/add.html', '1', '1513216385');
INSERT INTO `v_action_log` VALUES ('705', '11', '1', '1875012760', 'category', '144', '操作url：/admin/category/add.html', '1', '1513216415');
INSERT INTO `v_action_log` VALUES ('706', '11', '1', '1875012760', 'category', '145', '操作url：/admin/category/add.html', '1', '1513216443');
INSERT INTO `v_action_log` VALUES ('707', '11', '1', '1875015021', 'category', '146', '操作url：/admin/category/add.html', '1', '1513216470');
INSERT INTO `v_action_log` VALUES ('708', '11', '1', '1875015021', 'category', '147', '操作url：/admin/category/add.html', '1', '1513216501');
INSERT INTO `v_action_log` VALUES ('709', '11', '1', '1875015021', 'category', '148', '操作url：/admin/category/add.html', '1', '1513216533');
INSERT INTO `v_action_log` VALUES ('710', '1', '1', '1875015538', 'member', '1', 'Administrator在2017-12-14 14:16登录了后台', '1', '1513232165');
INSERT INTO `v_action_log` VALUES ('711', '11', '1', '1875015021', 'category', '139', '操作url：/admin/category/edit.html', '1', '1513302269');
INSERT INTO `v_action_log` VALUES ('712', '11', '1', '1875015021', 'category', '139', '操作url：/admin/category/edit.html', '1', '1513302291');
INSERT INTO `v_action_log` VALUES ('713', '11', '1', '1875015021', 'category', '139', '操作url：/admin/category/edit.html', '1', '1513304724');
INSERT INTO `v_action_log` VALUES ('714', '7', '1', '1875012760', 'model', '6', '操作url：/admin/model/update.html', '1', '1513305972');
INSERT INTO `v_action_log` VALUES ('715', '11', '1', '1875015538', 'category', '139', '操作url：/admin/category/edit.html', '1', '1513306723');
INSERT INTO `v_action_log` VALUES ('716', '7', '1', '1875012760', 'model', '6', '操作url：/admin/model/update.html', '1', '1513306781');
INSERT INTO `v_action_log` VALUES ('717', '8', '1', '1875012760', 'attribute', '65', '操作url：/admin/attribute/update.html', '1', '1513306856');
INSERT INTO `v_action_log` VALUES ('718', '8', '1', '1875015538', 'attribute', '65', '操作url：/admin/attribute/remove/id/65.html', '1', '1513306933');
INSERT INTO `v_action_log` VALUES ('719', '7', '1', '1875015538', 'model', '6', '操作url：/admin/model/update.html', '1', '1513307016');
INSERT INTO `v_action_log` VALUES ('720', '7', '1', '1875015538', 'model', '6', '操作url：/admin/model/update.html', '1', '1513307114');
INSERT INTO `v_action_log` VALUES ('721', '7', '1', '1875012760', 'model', '6', '操作url：/admin/model/update.html', '1', '1513307180');
INSERT INTO `v_action_log` VALUES ('722', '7', '1', '1875015021', 'model', '6', '操作url：/admin/model/update.html', '1', '1513307249');
INSERT INTO `v_action_log` VALUES ('723', '11', '1', '1875015538', 'category', '139', '操作url：/admin/category/edit.html', '1', '1513307453');
INSERT INTO `v_action_log` VALUES ('724', '11', '1', '1875012760', 'category', '139', '操作url：/admin/category/edit.html', '1', '1513307573');
INSERT INTO `v_action_log` VALUES ('725', '7', '1', '1875015538', 'model', '6', '操作url：/admin/model/update.html', '1', '1513309830');
INSERT INTO `v_action_log` VALUES ('726', '11', '1', '1875015021', 'category', '139', '操作url：/admin/category/edit.html', '1', '1513316062');
INSERT INTO `v_action_log` VALUES ('727', '11', '1', '1875015538', 'category', '139', '操作url：/admin/category/edit.html', '1', '1513316072');
INSERT INTO `v_action_log` VALUES ('728', '1', '1', '1875015021', 'member', '1', 'Administrator在2017-12-15 14:29登录了后台', '1', '1513319382');
INSERT INTO `v_action_log` VALUES ('729', '1', '1', '1875015021', 'member', '1', 'Administrator在2017-12-15 16:19登录了后台', '1', '1513325990');
INSERT INTO `v_action_log` VALUES ('730', '11', '1', '1875015021', 'category', '139', '操作url：/admin/category/edit.html', '1', '1513326071');
INSERT INTO `v_action_log` VALUES ('731', '11', '1', '1875015538', 'category', '139', '操作url：/admin/category/edit.html', '1', '1513326151');
INSERT INTO `v_action_log` VALUES ('732', '11', '1', '1875012760', 'category', '139', '操作url：/admin/category/edit.html', '1', '1513326293');
INSERT INTO `v_action_log` VALUES ('733', '11', '1', '1875012760', 'category', '139', '操作url：/admin/category/edit.html', '1', '1513326315');
INSERT INTO `v_action_log` VALUES ('734', '8', '1', '1875015021', 'attribute', '66', '操作url：/admin/attribute/update.html', '1', '1513326524');
INSERT INTO `v_action_log` VALUES ('735', '7', '1', '1875015021', 'model', '6', '操作url：/admin/model/update.html', '1', '1513326543');
INSERT INTO `v_action_log` VALUES ('736', '11', '1', '1875015538', 'category', '127', '操作url：/admin/category/edit.html', '1', '1513388371');
INSERT INTO `v_action_log` VALUES ('737', '11', '1', '1875015021', 'category', '127', '操作url：/admin/category/edit.html', '1', '1513388430');
INSERT INTO `v_action_log` VALUES ('738', '1', '1', '1875015538', 'member', '1', 'Administrator在2017-12-16 14:22登录了后台', '1', '1513405350');
INSERT INTO `v_action_log` VALUES ('739', '1', '1', '1928361440', 'member', '1', 'Administrator在2017-12-18 10:49登录了后台', '1', '1513565345');
INSERT INTO `v_action_log` VALUES ('740', '11', '1', '1928361440', 'category', '138', '操作url：/admin/category/edit.html', '1', '1513566094');
INSERT INTO `v_action_log` VALUES ('741', '11', '1', '1875009166', 'category', '138', '操作url：/admin/category/edit.html', '1', '1513567039');
INSERT INTO `v_action_log` VALUES ('742', '11', '1', '1875009166', 'category', '138', '操作url：/admin/category/edit.html', '1', '1513567071');
INSERT INTO `v_action_log` VALUES ('743', '1', '1', '1875009166', 'member', '1', 'Administrator在2017-12-18 13:55登录了后台', '1', '1513576507');
INSERT INTO `v_action_log` VALUES ('744', '11', '1', '1928361440', 'category', '139', '操作url：/admin/category/edit.html', '1', '1513581462');
INSERT INTO `v_action_log` VALUES ('745', '1', '1', '1875009166', 'member', '1', 'Administrator在2017-12-19 08:38登录了后台', '1', '1513643891');
INSERT INTO `v_action_log` VALUES ('746', '9', '1', '1875009166', 'channel', '11', '操作url：/admin/channel/edit.html', '1', '1513643907');
INSERT INTO `v_action_log` VALUES ('747', '9', '1', '1875009166', 'channel', '15', '操作url：/admin/channel/edit.html', '1', '1513645540');
INSERT INTO `v_action_log` VALUES ('748', '9', '1', '1875009166', 'channel', '11', '操作url：/admin/channel/edit.html', '1', '1513645549');
INSERT INTO `v_action_log` VALUES ('749', '9', '1', '1928361440', 'channel', '8', '操作url：/admin/channel/edit.html', '1', '1513645563');
INSERT INTO `v_action_log` VALUES ('750', '9', '1', '1928361440', 'channel', '6', '操作url：/admin/channel/edit.html', '1', '1513645573');
INSERT INTO `v_action_log` VALUES ('751', '9', '1', '1928973568', 'channel', '9', '操作url：/admin/channel/edit.html', '1', '1513645610');
INSERT INTO `v_action_log` VALUES ('752', '9', '1', '1928973568', 'channel', '6', '操作url：/admin/channel/edit.html', '1', '1513645619');
INSERT INTO `v_action_log` VALUES ('753', '9', '1', '1928973568', 'channel', '12', '操作url：/admin/channel/edit.html', '1', '1513645627');
INSERT INTO `v_action_log` VALUES ('754', '9', '1', '1928973568', 'channel', '1', '操作url：/admin/channel/edit.html', '1', '1513646987');
INSERT INTO `v_action_log` VALUES ('755', '1', '1', '1928973568', 'member', '1', 'Administrator在2017-12-19 09:37登录了后台', '1', '1513647433');
INSERT INTO `v_action_log` VALUES ('756', '1', '1', '1875009166', 'member', '1', 'Administrator在2017-12-19 14:02登录了后台', '1', '1513663342');
INSERT INTO `v_action_log` VALUES ('757', '1', '1', '1875009166', 'member', '1', 'Administrator在2017-12-19 14:03登录了后台', '1', '1513663395');
INSERT INTO `v_action_log` VALUES ('758', '1', '1', '1875009166', 'member', '1', 'Administrator在2017-12-20 14:27登录了后台', '1', '1513751250');
INSERT INTO `v_action_log` VALUES ('759', '8', '1', '1928361440', 'attribute', '67', '操作url：/admin/attribute/update.html', '1', '1513751394');
INSERT INTO `v_action_log` VALUES ('760', '7', '1', '1928361440', 'model', '2', '操作url：/admin/model/update.html', '1', '1513751495');
INSERT INTO `v_action_log` VALUES ('761', '8', '1', '1928361440', 'attribute', '67', '操作url：/admin/attribute/update.html', '1', '1513751512');
INSERT INTO `v_action_log` VALUES ('762', '7', '1', '1928361440', 'model', '2', '操作url：/admin/model/update.html', '1', '1513751695');
INSERT INTO `v_action_log` VALUES ('763', '8', '1', '1928361440', 'attribute', '67', '操作url：/admin/attribute/update.html', '1', '1513751997');
INSERT INTO `v_action_log` VALUES ('764', '7', '1', '1875009166', 'model', '2', '操作url：/admin/model/update.html', '1', '1513752095');
INSERT INTO `v_action_log` VALUES ('765', '8', '1', '1875009166', 'attribute', '67', '操作url：/admin/attribute/update.html', '1', '1513752153');
INSERT INTO `v_action_log` VALUES ('766', '7', '1', '1875009166', 'model', '2', '操作url：/admin/model/update.html', '1', '1513752174');
INSERT INTO `v_action_log` VALUES ('767', '1', '1', '1928973568', 'member', '1', 'Administrator在2017-12-20 14:43登录了后台', '1', '1513752218');
INSERT INTO `v_action_log` VALUES ('768', '11', '1', '1928361440', 'category', '139', '操作url：/admin/category/edit.html', '1', '1513756671');
INSERT INTO `v_action_log` VALUES ('769', '11', '1', '1875009166', 'category', '139', '操作url：/admin/category/edit.html', '1', '1513756707');
INSERT INTO `v_action_log` VALUES ('770', '1', '1', '1928361440', 'member', '1', 'Administrator在2017-12-20 16:36登录了后台', '1', '1513759002');
INSERT INTO `v_action_log` VALUES ('771', '9', '1', '1928973568', 'channel', '11', '操作url：/admin/channel/edit.html', '1', '1513759029');
INSERT INTO `v_action_log` VALUES ('772', '9', '1', '1875009166', 'channel', '11', '操作url：/admin/channel/edit.html', '1', '1513759040');
INSERT INTO `v_action_log` VALUES ('773', '1', '1', '1928361440', 'member', '1', 'Administrator在2017-12-21 09:29登录了后台', '1', '1513819750');
INSERT INTO `v_action_log` VALUES ('774', '1', '1', '1928361440', 'member', '1', 'Administrator在2017-12-21 14:41登录了后台', '1', '1513838470');
INSERT INTO `v_action_log` VALUES ('775', '1', '1', '1875009166', 'member', '1', 'Administrator在2017-12-22 09:15登录了后台', '1', '1513905310');
INSERT INTO `v_action_log` VALUES ('776', '11', '1', '1928361440', 'category', '138', '操作url：/admin/category/edit.html', '1', '1513906102');
INSERT INTO `v_action_log` VALUES ('777', '1', '1', '1928361440', 'member', '1', 'Administrator在2017-12-22 14:38登录了后台', '1', '1513924722');
INSERT INTO `v_action_log` VALUES ('778', '1', '1', '1928926101', 'member', '1', 'Administrator在2017-12-25 13:56登录了后台', '1', '1514181364');
INSERT INTO `v_action_log` VALUES ('779', '8', '1', '3722303430', 'attribute', '68', '操作url：/admin/attribute/update.html', '1', '1514183137');
INSERT INTO `v_action_log` VALUES ('780', '8', '1', '3722303430', 'attribute', '69', '操作url：/admin/attribute/update.html', '1', '1514183163');
INSERT INTO `v_action_log` VALUES ('781', '8', '1', '3722303430', 'attribute', '70', '操作url：/admin/attribute/update.html', '1', '1514183180');
INSERT INTO `v_action_log` VALUES ('782', '8', '1', '1928360012', 'attribute', '71', '操作url：/admin/attribute/update.html', '1', '1514183212');
INSERT INTO `v_action_log` VALUES ('783', '11', '1', '1928926101', 'category', '139', '操作url：/admin/category/edit.html', '1', '1514183361');
INSERT INTO `v_action_log` VALUES ('784', '11', '1', '1928926101', 'category', '149', '操作url：/admin/category/add.html', '1', '1514183368');
INSERT INTO `v_action_log` VALUES ('785', '7', '1', '1928926101', 'model', '6', '操作url：/admin/model/update.html', '1', '1514183415');
INSERT INTO `v_action_log` VALUES ('786', '11', '1', '1928926101', 'category', '150', '操作url：/admin/category/add.html', '1', '1514183433');
INSERT INTO `v_action_log` VALUES ('787', '1', '1', '3722303430', 'member', '1', 'Administrator在2017-12-25 14:39登录了后台', '1', '1514183998');
INSERT INTO `v_action_log` VALUES ('788', '1', '1', '3722303430', 'member', '1', 'Administrator在2017-12-25 14:48登录了后台', '1', '1514184511');
INSERT INTO `v_action_log` VALUES ('789', '1', '1', '167772674', 'member', '1', 'Administrator在2017-12-26 09:27登录了后台', '1', '1514251658');
INSERT INTO `v_action_log` VALUES ('790', '1', '1', '167772674', 'member', '1', 'Administrator在2017-12-26 10:07登录了后台', '1', '1514254058');
INSERT INTO `v_action_log` VALUES ('791', '1', '1', '167772674', 'member', '1', 'Administrator在2017-12-26 10:40登录了后台', '1', '1514256027');
INSERT INTO `v_action_log` VALUES ('792', '1', '1', '167772674', 'member', '1', 'Administrator在2017-12-26 10:41登录了后台', '1', '1514256061');
INSERT INTO `v_action_log` VALUES ('793', '1', '1', '167772674', 'member', '1', 'Administrator在2017-12-26 13:37登录了后台', '1', '1514266632');
INSERT INTO `v_action_log` VALUES ('794', '1', '1', '167772674', 'member', '1', 'Administrator在2017-12-26 13:43登录了后台', '1', '1514267039');
INSERT INTO `v_action_log` VALUES ('795', '1', '1', '167772674', 'member', '1', 'Administrator在2017-12-27 09:07登录了后台', '1', '1514336873');
INSERT INTO `v_action_log` VALUES ('796', '1', '1', '167772674', 'member', '1', 'Administrator在2017-12-27 13:52登录了后台', '1', '1514353929');
INSERT INTO `v_action_log` VALUES ('797', '1', '1', '167772674', 'member', '1', 'Administrator在2017-12-27 16:56登录了后台', '1', '1514364993');
INSERT INTO `v_action_log` VALUES ('798', '1', '1', '167772674', 'member', '1', 'Administrator在2017-12-28 08:41登录了后台', '1', '1514421710');
INSERT INTO `v_action_log` VALUES ('799', '1', '1', '167772674', 'member', '1', 'Administrator在2017-12-28 08:50登录了后台', '1', '1514422217');
INSERT INTO `v_action_log` VALUES ('800', '1', '1', '167772674', 'member', '1', 'Administrator在2017-12-28 09:46登录了后台', '1', '1514425561');
INSERT INTO `v_action_log` VALUES ('801', '1', '1', '167772674', 'member', '1', 'Administrator在2017-12-28 16:18登录了后台', '1', '1514449122');
INSERT INTO `v_action_log` VALUES ('802', '11', '1', '167772674', 'category', '138', '操作url：/Admin/Category/edit.html', '1', '1514449994');
INSERT INTO `v_action_log` VALUES ('803', '11', '1', '167772674', 'category', '136', '操作url：/Admin/Category/edit.html', '1', '1514450005');
INSERT INTO `v_action_log` VALUES ('804', '1', '1', '167772674', 'member', '1', 'Administrator在2017-12-29 08:59登录了后台', '1', '1514509143');
INSERT INTO `v_action_log` VALUES ('805', '11', '1', '167772674', 'category', '138', '操作url：/Admin/Category/edit.html', '1', '1514514170');
INSERT INTO `v_action_log` VALUES ('806', '11', '1', '167772674', 'category', '136', '操作url：/Admin/Category/edit.html', '1', '1514514180');
INSERT INTO `v_action_log` VALUES ('807', '11', '1', '167772674', 'category', '138', '操作url：/Admin/Category/edit.html', '1', '1514514196');
INSERT INTO `v_action_log` VALUES ('808', '11', '1', '167772674', 'category', '136', '操作url：/Admin/Category/edit.html', '1', '1514514213');
INSERT INTO `v_action_log` VALUES ('809', '11', '1', '167772674', 'category', '136', '操作url：/Admin/Category/edit.html', '1', '1514514452');

-- ----------------------------
-- Table structure for v_addons
-- ----------------------------
DROP TABLE IF EXISTS `v_addons`;
CREATE TABLE `v_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of v_addons
-- ----------------------------
INSERT INTO `v_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"2\",\"editor_markdownpreview\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'V', '0.1', '1383126253', '0');
INSERT INTO `v_addons` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '0', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}', 'V', '0.1', '1379512015', '0');
INSERT INTO `v_addons` VALUES ('3', 'DevTeam', '开发团队信息', '开发团队成员信息', '1', '{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'V', '0.1', '1379512022', '0');
INSERT INTO `v_addons` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'V', '0.1', '1379512036', '0');
INSERT INTO `v_addons` VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'V', '0.1', '1379830910', '0');
INSERT INTO `v_addons` VALUES ('6', 'Attachment', '附件', '用于文档模型上传附件', '1', 'null', 'V', '0.1', '1379842319', '1');
INSERT INTO `v_addons` VALUES ('9', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"2031914\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}', 'V', '0.1', '1380273962', '0');
INSERT INTO `v_addons` VALUES ('17', 'ImageSlider', '图片轮播', '图片轮播', '1', '{\"status\":\"1\",\"type\":\"flexslider\",\"images\":\"295,296,297,298\",\"h\":\"\",\"p\":\"Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit\\r\\nCras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.\\r\\nCras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.\"}', 'V', '0.1', '1417156782', '0');
INSERT INTO `v_addons` VALUES ('18', 'UploadImages', '多图上传', '多图上传', '1', 'null', 'V', '0.1.1', '1417520438', '0');
INSERT INTO `v_addons` VALUES ('19', 'AccessStat', '访问统计', '添加网站的访问统计监控代码', '1', '{\"status\":\"0\",\"code\":\"\"}', 'V', '0.1', '1417601804', '0');
INSERT INTO `v_addons` VALUES ('20', 'QQ', 'QQ在线客服', '在线QQ客服', '1', '{\"status\":\"0\",\"number\":\"1212122121\\r\\n3232322332\\r\\n1221212121\",\"name\":\"\\u4e3a\\u554a\\u662f\\r\\n\\u963f\\u65af\\u987f\\r\\n\\u963f\\u9053\\u592b\",\"position\":\"left\",\"horizontal\":\"0\",\"vertical\":\"100\",\"minStatue\":\"true\",\"skin\":\"orange\"}', 'V', '0.1', '1417607803', '0');
INSERT INTO `v_addons` VALUES ('21', 'ImageWater', '图片水印', '给通过后台上传的图片添加水印', '0', '{\"status\":\"1\",\"type\":\"1\",\"image\":\"\",\"text\":\"V0.1.110\",\"pos\":\"1\",\"trans\":\"80\",\"color\":\"#000000\"}', 'V', '0.1', '1417781480', '0');
INSERT INTO `v_addons` VALUES ('22', 'Diyform', '自定义表单', '简单的自定义表单', '1', '{\"key\":\"oX2xnvnpEDhyhpLp8pqqTeeWXuB3i\",\"open_verify\":\"1\"}', '凡人', '0.1', '1511589671', '1');

-- ----------------------------
-- Table structure for v_attachment
-- ----------------------------
DROP TABLE IF EXISTS `v_attachment`;
CREATE TABLE `v_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of v_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for v_attribute
-- ----------------------------
DROP TABLE IF EXISTS `v_attribute`;
CREATE TABLE `v_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL DEFAULT '',
  `validate_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `error_info` varchar(100) NOT NULL DEFAULT '',
  `validate_type` varchar(25) NOT NULL DEFAULT '',
  `auto_rule` varchar(100) NOT NULL DEFAULT '',
  `auto_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_type` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
-- Records of v_attribute
-- ----------------------------
INSERT INTO `v_attribute` VALUES ('1', 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1384508362', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('2', 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', '1', '', '1', '0', '1', '1383894743', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('3', 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', '1', '', '1', '0', '1', '1383894778', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('4', 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', '0', '', '1', '0', '1', '1384508336', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('5', 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', '1', '', '1', '0', '1', '1383894927', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('6', 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', '0', '', '1', '0', '1', '1384508323', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('7', 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', '0', '', '1', '0', '1', '1384508543', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('8', 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', '0', '', '1', '0', '1', '1384508350', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('9', 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', '1', '1:目录\r\n2:主题\r\n3:段落', '1', '0', '1', '1384511157', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('10', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '1', '[DOCUMENT_POSITION]', '1', '0', '1', '1383895640', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('11', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', '1', '', '1', '0', '1', '1383895757', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('12', 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', '1', '', '1', '0', '1', '1384147827', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('13', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', '1', '0:不可见\r\n1:所有人可见', '1', '0', '1', '1386662271', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `v_attribute` VALUES ('14', 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '1', '', '1', '0', '1', '1387163248', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `v_attribute` VALUES ('15', 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1387260355', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `v_attribute` VALUES ('16', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895835', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('17', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895846', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('18', 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', '0', '', '1', '0', '1', '1384508264', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('19', 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', '1', '', '1', '0', '1', '1383895894', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('20', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '1', '0', '1', '1383895903', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('21', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '0', '', '1', '0', '1', '1384508277', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', '1', '0', '1', '1384508496', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('23', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '2', '0', '1', '1384511049', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('24', 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', '1', '', '2', '0', '1', '1383896225', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('25', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', '1', '', '2', '0', '1', '1383896190', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('26', 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '2', '0', '1', '1383896103', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('27', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '3', '0', '1', '1387260461', '1383891252', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `v_attribute` VALUES ('28', 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', '1', '', '3', '0', '1', '1383896438', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('29', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '3', '0', '1', '1383896429', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('30', 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', '1', '', '3', '0', '1', '1383896415', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('31', 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '3', '0', '1', '1383896380', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('32', 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', '1', '', '3', '0', '1', '1383896371', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `v_attribute` VALUES ('33', 'keyword', '关键字', 'varchar(255) NOT NULL', 'select', '', '多个关键字请用逗号分隔', '1', '选择月份,一月,二月,三月,四月,五月,六月,七月,八月,九月,十月,十一月,十二月', '2', '0', '1', '1507533511', '1416631164', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `v_attribute` VALUES ('41', 'imagelist', '图片列表', 'varchar(255) NOT NULL', 'pictures', '', '', '0', '', '2', '0', '1', '1436757632', '1418205108', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `v_attribute` VALUES ('54', 'fangjian', '房间', 'varchar(255) NOT NULL', 'pictures', '', '', '1', '', '2', '0', '1', '1503451905', '1503451905', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `v_attribute` VALUES ('53', 'meishi', '美食', 'varchar(255) NOT NULL', 'pictures', '', '', '1', '', '2', '0', '1', '1503451887', '1503451887', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `v_attribute` VALUES ('48', 'username', '注册用户名', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '2', '0', '1', '1503451367', '1503451367', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `v_attribute` VALUES ('49', 'phone', '联系电话', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '2', '0', '1', '1503451389', '1503451389', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `v_attribute` VALUES ('52', 'fjmc', '景点名称(例如:白洋淀)', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '2', '0', '1', '1503451784', '1503451784', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `v_attribute` VALUES ('51', 'city', '区或市名称(例如:海淀区)', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '2', '0', '1', '1503451487', '1503451487', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `v_attribute` VALUES ('55', 'fengjing', '风景', 'varchar(255) NOT NULL', 'pictures', '', '', '1', '', '2', '0', '1', '1503451921', '1503451921', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `v_attribute` VALUES ('56', 'address', '详细地址', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '2', '0', '1', '1503454282', '1503454282', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `v_attribute` VALUES ('57', 'jingwei', '经纬度(地图定位)', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '2', '0', '1', '1504145107', '1504145107', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `v_attribute` VALUES ('64', 'njyzstp', '农家院展示', 'varchar(255) NOT NULL', 'pictures', '', '', '1', '', '2', '0', '1', '1513066089', '1513065956', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `v_attribute` VALUES ('62', 'njyclass', '农家院分类', 'char(50) NOT NULL', 'select', '', '', '1', '农家院,渔家乐,民俗客栈,垂钓园,山庄, 度假村,采摘园,生态园  ', '2', '0', '1', '1512719409', '1512719409', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `v_attribute` VALUES ('61', 'tzprice', '拓展价格', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '2', '0', '1', '1505868127', '1505868127', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `v_attribute` VALUES ('63', 'aimclass', '目的地分类', 'char(50) NOT NULL', 'select', '', '', '1', '美食,住宿,风景,攻略', '2', '0', '1', '1512971906', '1512971906', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `v_attribute` VALUES ('66', 'carprice', '包车价格', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '6', '0', '1', '1513326524', '1513326524', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `v_attribute` VALUES ('67', 'family', '农家院规模', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '2', '0', '1', '1513752153', '1513751394', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `v_attribute` VALUES ('68', 'username', '用户名', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '6', '0', '1', '1514183137', '1514183137', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `v_attribute` VALUES ('69', 'rentcartype', '租车类型', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '6', '0', '1', '1514183163', '1514183163', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `v_attribute` VALUES ('70', 'rentcarcity', '租车城市', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '6', '0', '1', '1514183180', '1514183180', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `v_attribute` VALUES ('71', 'phone', '租车电话', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '6', '0', '1', '1514183212', '1514183212', '', '3', '', 'regex', '', '3', 'function');

-- ----------------------------
-- Table structure for v_auth_extend
-- ----------------------------
DROP TABLE IF EXISTS `v_auth_extend`;
CREATE TABLE `v_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`) USING BTREE,
  KEY `uid` (`group_id`) USING BTREE,
  KEY `group_id` (`extend_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of v_auth_extend
-- ----------------------------
INSERT INTO `v_auth_extend` VALUES ('1', '1', '2');
INSERT INTO `v_auth_extend` VALUES ('1', '2', '2');
INSERT INTO `v_auth_extend` VALUES ('1', '3', '2');
INSERT INTO `v_auth_extend` VALUES ('1', '40', '1');
INSERT INTO `v_auth_extend` VALUES ('1', '41', '1');
INSERT INTO `v_auth_extend` VALUES ('1', '42', '1');
INSERT INTO `v_auth_extend` VALUES ('1', '43', '1');
INSERT INTO `v_auth_extend` VALUES ('1', '44', '1');
INSERT INTO `v_auth_extend` VALUES ('1', '45', '1');
INSERT INTO `v_auth_extend` VALUES ('1', '46', '1');
INSERT INTO `v_auth_extend` VALUES ('2', '47', '1');
INSERT INTO `v_auth_extend` VALUES ('2', '48', '1');
INSERT INTO `v_auth_extend` VALUES ('2', '49', '1');
INSERT INTO `v_auth_extend` VALUES ('2', '50', '1');
INSERT INTO `v_auth_extend` VALUES ('2', '51', '1');
INSERT INTO `v_auth_extend` VALUES ('2', '52', '1');
INSERT INTO `v_auth_extend` VALUES ('2', '53', '1');
INSERT INTO `v_auth_extend` VALUES ('2', '54', '1');
INSERT INTO `v_auth_extend` VALUES ('2', '55', '1');
INSERT INTO `v_auth_extend` VALUES ('2', '56', '1');
INSERT INTO `v_auth_extend` VALUES ('2', '57', '1');
INSERT INTO `v_auth_extend` VALUES ('2', '58', '1');
INSERT INTO `v_auth_extend` VALUES ('2', '59', '1');
INSERT INTO `v_auth_extend` VALUES ('2', '60', '1');
INSERT INTO `v_auth_extend` VALUES ('2', '61', '1');
INSERT INTO `v_auth_extend` VALUES ('2', '62', '1');

-- ----------------------------
-- Table structure for v_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `v_auth_group`;
CREATE TABLE `v_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v_auth_group
-- ----------------------------
INSERT INTO `v_auth_group` VALUES ('1', 'admin', '1', '默认用户组', '', '1', '1,2,3,4,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,100,102,103,107,108,109,110,205,206,207,208,209,210,211,212,213,214,215,216,217,218,220');
INSERT INTO `v_auth_group` VALUES ('2', 'admin', '1', '测试用户', '测试用户', '1', '1,2,4,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,42,43,44,45,46,47,48,49,50,51,52,53,54,55,61,66,67,68,70,71,72,74,79,80,81,82,83,84,86,88,209,210,211,214,215,217,220');

-- ----------------------------
-- Table structure for v_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `v_auth_group_access`;
CREATE TABLE `v_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v_auth_group_access
-- ----------------------------
INSERT INTO `v_auth_group_access` VALUES ('2', '2');

-- ----------------------------
-- Table structure for v_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `v_auth_rule`;
CREATE TABLE `v_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=221 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v_auth_rule
-- ----------------------------
INSERT INTO `v_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', '');
INSERT INTO `v_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/index', '内容', '1', '');
INSERT INTO `v_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `v_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', '');
INSERT INTO `v_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统', '1', '');
INSERT INTO `v_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO `v_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO `v_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `v_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO `v_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `v_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO `v_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO `v_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO `v_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO `v_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO `v_auth_rule` VALUES ('17', 'admin', '1', 'Admin/Article/examine', '审核列表', '1', '');
INSERT INTO `v_auth_rule` VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '1', '');
INSERT INTO `v_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `v_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `v_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `v_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `v_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `v_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `v_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `v_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '用户信息', '1', '');
INSERT INTO `v_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO `v_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `v_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `v_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `v_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `v_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `v_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `v_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `v_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `v_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `v_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `v_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `v_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `v_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `v_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO `v_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `v_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `v_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `v_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `v_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `v_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `v_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `v_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `v_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `v_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `v_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `v_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `v_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO `v_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `v_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO `v_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO `v_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `v_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO `v_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO `v_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `v_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `v_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `v_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `v_auth_rule` VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO `v_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO `v_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `v_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `v_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `v_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
INSERT INTO `v_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO `v_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO `v_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO `v_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '1', '');
INSERT INTO `v_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `v_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO `v_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `v_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `v_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `v_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `v_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `v_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `v_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `v_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO `v_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `v_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO `v_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `v_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `v_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `v_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `v_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `v_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `v_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `v_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `v_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `v_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `v_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `v_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO `v_auth_rule` VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `v_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO `v_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `v_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO `v_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `v_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `v_auth_rule` VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', '');
INSERT INTO `v_auth_rule` VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO `v_auth_rule` VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `v_auth_rule` VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO `v_auth_rule` VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO `v_auth_rule` VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');
INSERT INTO `v_auth_rule` VALUES ('217', 'admin', '1', 'Admin/article/index', '文档列表', '1', '');
INSERT INTO `v_auth_rule` VALUES ('218', 'admin', '1', 'Admin/think/lists', '数据列表', '1', '');
INSERT INTO `v_auth_rule` VALUES ('219', 'admin', '2', 'Admin/内容', '其他', '1', '');
INSERT INTO `v_auth_rule` VALUES ('220', 'admin', '1', 'Admin/Addons/config/id/17', '图片轮播', '1', '');

-- ----------------------------
-- Table structure for v_category
-- ----------------------------
DROP TABLE IF EXISTS `v_category`;
CREATE TABLE `v_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL DEFAULT '' COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `groups` varchar(255) NOT NULL DEFAULT '' COMMENT '分组定义',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of v_category
-- ----------------------------
INSERT INTO `v_category` VALUES ('47', 'Aboutus', '关于我们', '0', '0', '2', '', '', '', 'Article/aboutus', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419388988', '1450235343', '1', '0', '');
INSERT INTO `v_category` VALUES ('48', 'news', '旅游攻略', '0', '0', '10', '', '', '', 'Article/news', '', 'Article/article/detail-news', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419389009', '1506306690', '1', '117', '');
INSERT INTO `v_category` VALUES ('49', 'Products', '院内风景', '0', '0', '12', '', '', '', 'Article/products', '', 'Article/article/detail', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419389024', '1504316242', '1', '0', '');
INSERT INTO `v_category` VALUES ('50', 'template', '景点景区', '0', '0', '3', '', '', '', '', '', 'Article/article/detail-news', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419389094', '1504511643', '1', '0', '');
INSERT INTO `v_category` VALUES ('51', 'company', '公司简介', '47', '0', '10', '', '', '', 'Article/aboutus', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1419390917', '1504338121', '1', '151', '');
INSERT INTO `v_category` VALUES ('52', 'Contactus', '联系我们', '47', '1', '10', '', '', '', 'Article/aboutus', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1427693955', '1499912561', '1', '168', '');
INSERT INTO `v_category` VALUES ('53', 'companynews', '农家院动态', '48', '0', '15', '', '', '', 'Article/news', '', 'Article/article/detail-news', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1427694001', '1506137304', '1', '75', '');
INSERT INTO `v_category` VALUES ('54', 'TradeNews', '旅游线路', '48', '0', '15', '', '', '', 'Article/news', '', 'Article/article/detail-news', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1427694021', '1506306718', '1', '153', '');
INSERT INTO `v_category` VALUES ('55', 'showcase', '案例展示', '0', '0', '12', '', '', '', 'Article/products', '', 'Article/article/detail', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1427694176', '1493200076', '1', '0', '');
INSERT INTO `v_category` VALUES ('56', 'honor', '名胜古迹', '48', '0', '12', '', '', '', 'Article/news', '', 'Article/article/detail-news', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1427694217', '1506306764', '1', '0', '');
INSERT INTO `v_category` VALUES ('57', 'one', '美食餐饮', '49', '1', '12', '', '', '', 'Article/products', '', 'Article/article/detail', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1427694250', '1499931393', '1', '0', '');
INSERT INTO `v_category` VALUES ('140', 'SeasonRecommended', '当季推荐', '0', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1512971159', '1512971159', '1', '0', '');
INSERT INTO `v_category` VALUES ('141', 'ThemeSelection', '主题精选', '0', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1512971213', '1512971213', '1', '0', '');
INSERT INTO `v_category` VALUES ('143', 'tindex', '推广首页', '142', '0', '10', '', '', '', 'Article/tui/tui', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1513216385', '1513216385', '1', '0', '');
INSERT INTO `v_category` VALUES ('136', 'aimliaoning', '辽宁', '61', '0', '10', '', '', '', 'Article/aim/mdd', '', 'Article/aim/detail', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1507528136', '1514514452', '1', '939', '');
INSERT INTO `v_category` VALUES ('61', 'aim', '目的地', '0', '5', '12', '', '', '', 'Article/aim/aim', '', 'Article/article/detail', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1441678886', '1512973254', '1', '0', '');
INSERT INTO `v_category` VALUES ('131', 'xbeijing', '北京', '54', '0', '10', '', '', '', 'Article/news', '', 'Article/article/detail-news', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1506307957', '1506307957', '1', '0', '');
INSERT INTO `v_category` VALUES ('127', 'tzxl', '拓展训练', '0', '0', '10', '', '', '', 'Article/expand', '', 'Article/tzxl/list_detail', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1505867885', '1513388430', '1', '0', '');
INSERT INTO `v_category` VALUES ('123', 'zdcity', '站点选择', '0', '0', '10', '', '', '', 'Article/city', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1505721875', '1505721875', '1', '0', '');
INSERT INTO `v_category` VALUES ('115', 'huabei', '华北地区', '84', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1503450062', '1503450062', '1', '0', '');
INSERT INTO `v_category` VALUES ('116', 'beijing', '北京', '115', '0', '20', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1503450153', '1510106960', '1', '0', '');
INSERT INTO `v_category` VALUES ('84', 'njy', '去农家', '0', '0', '10', '', '', '', 'Article/qunongjia', '', 'Article/article/detail', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1502238948', '1510132609', '1', '0', '');
INSERT INTO `v_category` VALUES ('117', 'hebei', '河北', '115', '0', '20', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1503454423', '1510106970', '1', '0', '');
INSERT INTO `v_category` VALUES ('118', 'huadong', '华东地区', '84', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1503454641', '1503454641', '1', '0', '');
INSERT INTO `v_category` VALUES ('119', 'shanghai', '上海', '118', '0', '2', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1503454657', '1510106992', '1', '0', '');
INSERT INTO `v_category` VALUES ('120', 'tj', '天津', '115', '0', '20', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1504229478', '1510106979', '1', '0', '');
INSERT INTO `v_category` VALUES ('139', 'chartered', '旅游包车', '0', '0', '10', '', '', '', 'Article/chartered', '', 'Article/article/detail', '', '6', '6', '2', '0', '1', '1', '0', '0', '', null, '1512971095', '1514183361', '1', '0', '');
INSERT INTO `v_category` VALUES ('128', 'tbeijing', '北京', '127', '0', '10', '', '', '', 'Article/tzxl/t2', '', 'Article/tzxl/list_detail', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1505867980', '1505877543', '1', '0', '');
INSERT INTO `v_category` VALUES ('130', 'newsbeijing', '北京', '53', '0', '10', '', '', '', 'Article/news', '', 'Article/article/detail-news', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1506307919', '1506307919', '1', '0', '');
INSERT INTO `v_category` VALUES ('129', 'ttianjin', '天津', '127', '0', '10', '', '', '', 'Article/tzxl/t2', '', 'Article/tzxl/list_detail', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1505868000', '1505877550', '1', '0', '');
INSERT INTO `v_category` VALUES ('142', 'tuiguang', '我要推广', '0', '0', '10', '', '', '', 'Article/tui/tui', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1513216349', '1513216349', '1', '0', '');
INSERT INTO `v_category` VALUES ('138', 'aimbeijing', '北京', '61', '0', '10', '', '', '', 'Article/aim/mdd', '', 'Article/aim/detail', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1507528189', '1514514196', '1', '938', '');
INSERT INTO `v_category` VALUES ('144', 'jphy', '金牌会员', '142', '0', '10', '', '', '', 'Article/tui/hy', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1513216415', '1513216415', '1', '0', '');
INSERT INTO `v_category` VALUES ('145', 'tui', '产品推广', '142', '0', '10', '', '', '', 'Article/tui/ptui', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1513216443', '1513216443', '1', '0', '');
INSERT INTO `v_category` VALUES ('146', 'xxzd', '信息置顶', '142', '0', '10', '', '', '', 'Article/tui/zd', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1513216470', '1513216470', '1', '0', '');
INSERT INTO `v_category` VALUES ('147', 'yysx', '预约刷新', '142', '0', '10', '', '', '', 'Article/tui/sx', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1513216501', '1513216501', '1', '0', '');
INSERT INTO `v_category` VALUES ('148', 'hfgg', '横幅广告', '142', '0', '10', '', '', '', 'Article/tui/ad', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', null, '1513216533', '1513216533', '1', '0', '');
INSERT INTO `v_category` VALUES ('149', 'carbeijing', '北京', '139', '0', '10', '', '', '', 'Article/chartered', '', '', '', '6', '6', '2', '0', '1', '1', '0', '0', '', null, '1514183368', '1514183368', '1', '0', '');
INSERT INTO `v_category` VALUES ('150', 'cartianjin', '天津', '139', '0', '10', '', '', '', 'Article/chartered', '', '', '', '6', '6', '2', '0', '1', '1', '0', '0', '', null, '1514183433', '1514183433', '1', '0', '');

-- ----------------------------
-- Table structure for v_channel
-- ----------------------------
DROP TABLE IF EXISTS `v_channel`;
CREATE TABLE `v_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v_channel
-- ----------------------------
INSERT INTO `v_channel` VALUES ('1', '0', '首页', '/', '1', '1379475111', '1513646987', '1', '0');
INSERT INTO `v_channel` VALUES ('5', '0', '去农家', 'Article/index?category=njy', '2', '1416637753', '1504058456', '1', '0');
INSERT INTO `v_channel` VALUES ('6', '0', '拓展训练', 'Article/index?category=tzxl', '7', '1416640624', '1513645619', '1', '0');
INSERT INTO `v_channel` VALUES ('14', '0', '登录/注册', '/Home/Login/login', '8', '1508480221', '1508480221', '0', '0');
INSERT INTO `v_channel` VALUES ('8', '0', '目的地', 'Article/index?category=aim', '5', '1427694970', '1513645563', '1', '0');
INSERT INTO `v_channel` VALUES ('9', '0', '旅游攻略', 'Article/index?category=news', '6', '1427694991', '1513645610', '1', '0');
INSERT INTO `v_channel` VALUES ('13', '0', '个人中心', '/Home/Login/vip', '9', '1508480210', '1508480210', '0', '0');
INSERT INTO `v_channel` VALUES ('11', '0', '旅游包车', 'Article/index?category=chartered', '4', '1500001810', '1513759040', '1', '0');
INSERT INTO `v_channel` VALUES ('12', '0', '我要推广', 'Article/index?category=tuiguang', '8', '1505372167', '1513645627', '1', '0');
INSERT INTO `v_channel` VALUES ('15', '0', '旅行社', '/', '3', '1513643945', '1513645540', '1', '0');

-- ----------------------------
-- Table structure for v_config
-- ----------------------------
DROP TABLE IF EXISTS `v_config`;
CREATE TABLE `v_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `group` (`group`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v_config
-- ----------------------------
INSERT INTO `v_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1492843307', '1', '去农家院旅游网', '0');
INSERT INTO `v_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1492843320', '1', '', '1');
INSERT INTO `v_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1492843363', '1', '', '8');
INSERT INTO `v_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '1');
INSERT INTO `v_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1417520969', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举\r\n5:多图上传\r\n6:图片上传', '2');
INSERT INTO `v_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '', '9');
INSERT INTO `v_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表推荐\r\n2:频道推荐\r\n4:首页推荐', '3');
INSERT INTO `v_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '4');
INSERT INTO `v_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', '1379122533', '1379235904', '1', 'blue_color', '10');
INSERT INTO `v_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统\r\n5:扩展\r\n6:友情链接\r\n7:图片集\r\n8:内容区\r\n', '4');
INSERT INTO `v_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `v_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '8');
INSERT INTO `v_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '1');
INSERT INTO `v_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `v_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '10', '10');
INSERT INTO `v_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '3');
INSERT INTO `v_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `v_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `v_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `v_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `v_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `v_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '0', '11');
INSERT INTO `v_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', '0');
INSERT INTO `v_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0');
INSERT INTO `v_config` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1416396765', '1', '10', '0');
INSERT INTO `v_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12');
INSERT INTO `v_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '1', '1');
INSERT INTO `v_config` VALUES ('38', 'WEB_SITE_LOGO', '6', '网站logo', '5', '', '单个图片在模板使用get_cover函数获取图片路径', '1417521119', '1418372437', '1', '904', '0');
INSERT INTO `v_config` VALUES ('39', 'WEB_SITE_COMMPANY', '1', '公司名称', '5', '', '配置公司名称，可在前台模板调用', '1417594175', '1500017144', '1', '去农家院旅游网', '1');
INSERT INTO `v_config` VALUES ('40', 'WEB_SITE_ADDRESS', '1', '公司地址', '5', '', '配置公司地址，可在前提模板调用', '1417594335', '1417594385', '1', '北京海淀区', '2');
INSERT INTO `v_config` VALUES ('41', 'WEB_SITE_TEL', '1', '公司电话', '5', '', '配置公司电话，可在前提模板调用', '1417594571', '1504145411', '1', '4000-979-212', '3');
INSERT INTO `v_config` VALUES ('42', 'WEB_SITE_FAX', '1', '公司传真', '5', '', '配置公司传真，可以在前台模板调用', '1417594631', '1417594631', '1', '', '4');
INSERT INTO `v_config` VALUES ('43', 'WEB_SITE_ATTEN', '1', '联系人', '5', '', '配置公司联系人，可在前提模板调用', '1417594854', '1417594854', '1', '', '5');
INSERT INTO `v_config` VALUES ('44', 'WEB_SITE_ATTEN_TEL', '1', '联系人电话', '5', '', '配置公司联系人电话，可在前台模板调用', '1417594907', '1417594947', '1', '', '6');
INSERT INTO `v_config` VALUES ('45', 'WEB_SITE_ATTEN_QQ', '1', '联系人QQ', '5', '', '配置公司联系人QQ，可在前台模板调用', '1417595042', '1417595042', '1', '', '7');
INSERT INTO `v_config` VALUES ('46', 'WEB_SITE_ABOUT_US', '2', '公司简介', '5', '', '配置公司简介，可在前台模板调用', '1417595221', '1417595221', '1', '', '8');
INSERT INTO `v_config` VALUES ('47', 'WEB_SITE_COPYRIGHT', '2', '版权信息', '5', '', '配置网站的版权信息，可在前台模板调用', '1417595304', '1493257460', '1', '去农家院旅游网', '9');
INSERT INTO `v_config` VALUES ('48', 'WEB_SITE_SUPPORT', '2', '技术支持', '5', '', '配置技术支持相关信息，可在前台模板调用', '1417595542', '1417595542', '1', '', '10');
INSERT INTO `v_config` VALUES ('49', 'WEB_SITE_FRIEND_LINK_TITLE', '3', '友情链接标题', '6', '', '配置友情链接标题，本配置项是数组类型, 配置方法参照缺省配置值', '1417597443', '1417597665', '1', '0:新浪\r\n1:百度', '0');
INSERT INTO `v_config` VALUES ('50', 'WEB_SITE_FRIEND_LINK', '3', '友情链接地址', '6', '', '配置友情链接地址，本配置项是数组，配置方式参照缺省配置值', '1417597740', '1417597740', '1', '0:www.sina.com.cn\r\n1:www.baidu.com', '1');
INSERT INTO `v_config` VALUES ('51', 'WEB_SITE_BANNER_NO1', '5', '首页banner', '7', '', '上传多个图片（banner幻灯）, 供前提模板调用', '1417598209', '1500019896', '1', '295,296,297,298', '0');
INSERT INTO `v_config` VALUES ('52', 'WEB_SITE_CONTENT_NO1', '2', '内容块', '8', '', '配置一个内容块，可在前台模板调用', '1417598602', '1417598602', '1', '', '0');
INSERT INTO `v_config` VALUES ('53', 'WEB_SITE_LINK_TITLE_NO1', '3', '链接块标题', '9', '', '配置链接块标题，本配置项是数组类型, 配置方法参照缺省配置值', '1417598795', '1417598907', '1', '0:关于我们\r\n1:最热新闻', '0');
INSERT INTO `v_config` VALUES ('54', 'WEB_SITE_LINK_NO1', '3', '链接块链接', '9', '', '配置链接块链接，本配置项是数组类型, 配置方法参照缺省配置值', '1417599076', '1417599076', '1', '0:http://www.sina.com.cn\r\n1:http://www.baidu.com', '1');
INSERT INTO `v_config` VALUES ('55', 'WEB_SITE_STAT', '2', '统计代码', '5', '', '配置网站访问统计代码', '1417600005', '1447924209', '1', '', '0');
INSERT INTO `v_config` VALUES ('60', 'WEB_SITE_EMALL', '1', '公司邮箱', '5', '', '公司的电子邮箱', '1421299771', '1421299771', '1', '1484434687@qq.com', '0');
INSERT INTO `v_config` VALUES ('58', 'CONTACT_US', '2', '联系我们', '5', '', '', '1419405303', '1436758026', '1', '', '0');
INSERT INTO `v_config` VALUES ('59', 'WEB_SITE_BANNER_INDEX_NO1', '6', '详情页banner', '7', '', '', '1419405346', '1500019873', '1', '295', '0');
INSERT INTO `v_config` VALUES ('61', 'GARDEN_ENVIRONMENT', '6', '客户服务热线(首页)', '7', '', '', '1427696935', '1497679980', '1', '162', '0');
INSERT INTO `v_config` VALUES ('62', 'CHOOSE_US', '2', '选择我们', '5', '', '', '1450234688', '1450234688', '1', '', '0');
INSERT INTO `v_config` VALUES ('63', 'WEB_SITE_PUSH', '2', '百度推送代码', '5', '', '', '1492994284', '1499911260', '1', '', '0');
INSERT INTO `v_config` VALUES ('65', 'DESTINATION', '6', '目的地', '7', '', '', '1512957974', '1512957974', '1', '916', '0');
INSERT INTO `v_config` VALUES ('66', 'WEB_SITE_TUI_AD', '2', '案例广告语', '5', '', '', '1513236607', '1513236607', '1', '用心服务客户，为客户提供最优质的服务，提供一对一服务，提供最有效的解决方案', '0');

-- ----------------------------
-- Table structure for v_diyform
-- ----------------------------
DROP TABLE IF EXISTS `v_diyform`;
CREATE TABLE `v_diyform` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `diyname` varchar(200) NOT NULL DEFAULT '' COMMENT '自定义表单名称',
  `posttemplate` varchar(200) NOT NULL DEFAULT '' COMMENT '发布模板',
  `viewtemplate` varchar(200) NOT NULL DEFAULT '' COMMENT '内容模板',
  `listtemplate` varchar(200) NOT NULL DEFAULT '' COMMENT '列表模板',
  `table_name` varchar(50) NOT NULL DEFAULT '' COMMENT '数据表名',
  `public` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '前台列表和内容页公开：0：不公开，1：公开审核的，2：公开所有的',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础	' COMMENT '字段分组',
  `list_grid` text NOT NULL,
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10',
  `introduce` text NOT NULL COMMENT '表单介绍',
  `isuser` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `open_verify` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='自定义表单';

-- ----------------------------
-- Records of v_diyform
-- ----------------------------

-- ----------------------------
-- Table structure for v_diyform_fields
-- ----------------------------
DROP TABLE IF EXISTS `v_diyform_fields`;
CREATE TABLE `v_diyform_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `form_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '自定义表单id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL DEFAULT '',
  `validate_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `error_info` varchar(100) NOT NULL DEFAULT '',
  `validate_type` varchar(25) NOT NULL DEFAULT '',
  `auto_rule` varchar(100) NOT NULL DEFAULT '',
  `auto_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_type` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='自定义表单字段表';

-- ----------------------------
-- Records of v_diyform_fields
-- ----------------------------

-- ----------------------------
-- Table structure for v_document
-- ----------------------------
DROP TABLE IF EXISTS `v_document`;
CREATE TABLE `v_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `group_id` smallint(3) unsigned NOT NULL COMMENT '所属分组',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `up_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1为正常 0为待审核',
  `zhuangtai` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0为普通 5 推广 10置顶',
  `time_long` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`) USING BTREE,
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=757 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- ----------------------------
-- Records of v_document
-- ----------------------------
INSERT INTO `v_document` VALUES ('640', '1', '', '蓟县九山顶雅室铭轩农家院', '120', '0', '九山顶自然风景区坐落在蓟县下营镇境内，是人们回归大自然的理想场所，是寻奇探幽的野趣乐园。', '0', '0', '2', '2', '4', '0', '822', '1', '1517108155', '0', '65', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '1507034879');
INSERT INTO `v_document` VALUES ('639', '1', '', '坝上大明农家院', '117', '0', '宁满族自治县大明农家院是一家提供坝上草原旅游,坝上草原住宿服务的坝上草原农家院,欢迎全国各地的朋友到坝上草原旅游。', '0', '0', '2', '2', '4', '0', '824', '1', '1517108155', '0', '42', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('638', '1', '', '靠山居农家院', '116', '0', '隶属于北京王桂珍民俗饭庄位于密云区古北口镇河西村。聚古北水镇较近，蜿蜒长城脚下，就坐落着我们靠山居，院内干净整洁服务周到热情', '0', '0', '2', '2', '7', '0', '885', '1', '1517108155', '0', '216', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('637', '1', '', '白河湾山水人家25号农家院', '116', '0', '白河湾山水人家25号农家院位于怀柔北部山区45公里处狼虎哨村！开业于2009年，这里交通便利，青山环抱，绿水绕流，民风淳朴，是您度假，休闲，娱乐，健身，郊游的理想去处。', '0', '0', '2', '2', '7', '0', '360', '1', '1517108155', '0', '42', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('613', '1', '', '大围山赏花游', '131', '0', '山很美!天气晴朗，蓝天下，白云悠悠，青山葱郁;树很绿!叶片明光发亮，油彩晶莹。漫山的杜鹃，大多都已经谢了!那杜鹃，红的似火，粉的如霞，紫的像烟，白的胜雪。有的花开正艳，有的叶片脱落，也有的含苞待放。真是各具千秋，精彩纷呈。山道铺在山梁上，全是木板铺设。', '0', '0', '2', '2', '4', '0', '847', '1', '1517108155', '0', '3', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('721', '1', '', '海淀美食', '138', '0', '发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式', '0', '0', '2', '2', '4', '0', '914', '1', '1517108155', '0', '1', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('720', '1', '', '海淀美食', '138', '0', '发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式', '0', '0', '2', '2', '4', '0', '914', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('719', '1', '', '海淀住宿', '138', '0', '发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式', '0', '0', '2', '2', '4', '0', '917', '1', '1517108155', '0', '2', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('718', '1', '', '海淀风景', '138', '0', '发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式', '0', '0', '2', '2', '4', '0', '918', '1', '1517108155', '0', '9', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('717', '1', '', '海淀攻略', '138', '0', '发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式', '0', '0', '2', '2', '4', '0', '915', '1', '1517108155', '0', '4', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('716', '1', '', '海淀攻略', '138', '0', '发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式', '0', '0', '2', '2', '4', '0', '915', '1', '1517108155', '0', '2', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('715', '1', '', '海淀风景', '138', '0', '发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式', '0', '0', '2', '2', '4', '0', '918', '1', '1517108155', '0', '3', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('714', '1', '', '海淀住宿', '138', '0', '发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式', '0', '0', '2', '2', '4', '0', '917', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('628', '1', '', '箭扣长城攻略', '130', '0', '箭扣长城位于京郊怀柔区西北的八道河乡境内，海拔1141米，距怀柔县城约30公里，山势非常富于变化，险峰断崖之上的长城也显得更加雄奇险要。', '0', '0', '2', '2', '4', '0', '833', '1', '1517108155', '0', '22', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('627', '1', '', '难以忘怀的石林峡美景', '130', '0', '', '0', '0', '2', '2', '4', '0', '836', '1', '1517108155', '0', '10', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('626', '1', '', '野鸭湖附近农家院', '130', '0', '据统计野鸭湖湿地鸟种总数达280种，国家一级保护动物9种(黑鹳、东方白鹳、白头鹤、大鸨、金雕、白尾海雕、白肩雕、白鹤、遗鸥)，国家二级保护动物40种。高等植物420种、鱼类40种、两栖类5种、兽类10种、昆虫类182种等。', '0', '0', '2', '2', '4', '0', '837', '1', '1517108155', '0', '10', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('625', '1', '', '水关长城门票多少钱', '130', '0', '水关长城是八达岭长城的东段部分，这段长城建于险谷口，自水门箭楼长城呈“V”字型，顺应山势而行，如巨龙似鲲鹏展翅欲飞，箭楼即是敌楼同时兼具水门功效，这种建筑方式在沿线长城中极为罕见，故名水关长城。', '0', '0', '2', '2', '4', '0', '838', '1', '1517108155', '0', '3', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('624', '1', '', '八达岭水关长城景区', '130', '0', '来北京游玩一定要去长城，俗话说”不到长城非好汉”，52农家乐网为您推荐八达岭水关长城景区，值此一游。', '0', '0', '2', '2', '4', '0', '839', '1', '1517108155', '0', '4', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('623', '1', '', '双龙峡风景区住宿', '130', '0', '双龙峡风景区位于京西门头沟斋堂镇火村南2.5公里。距北京市区78公里。景区概括为：“十里溪流、百潭瀑布、千亩红杏、万顷林海。”真可谓青山翠谷，峰峦巍峨俊秀。到了夏季山花遍地，溪水潺潺好一派北国秀色，所以又有“小九寨”之称。', '0', '0', '2', '2', '4', '0', '839', '1', '1517108155', '0', '4', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('622', '1', '', '北京双龙峡一日游', '130', '0', '', '0', '0', '2', '2', '4', '0', '841', '1', '1517108155', '0', '4', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('621', '1', '', '双龙峡附近的农家院', '130', '0', '游接待中心\r\n\r\n爨底下农家院厚德福老宅农 家院位于门头沟斋塘镇爨底下民俗村。厚德福老宅是爨底下民俗村仅有两个财主院中唯一开放的院落。在日军侵华的时候厚德福老宅曾被焚毁，新中国成立后主人按照家中老人的叙述把院落修饰，古典而雅致的砖雕。', '0', '0', '2', '2', '4', '0', '842', '1', '1517108155', '0', '4', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('620', '1', '', '红螺寺攻略', '131', '0', '红螺山上红螺寺景区位于北京市怀柔区城北5公里的红螺山南麓，距北京市区55公里，景区总面积800公顷，国家AAAA级旅游区。', '0', '0', '2', '2', '4', '0', '834', '1', '1517108155', '0', '44', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('619', '1', '', '坝上草原在哪？坝上草原路线？京西坝上草原旅游攻略', '131', '0', '今天就由小编来为各位分享一处旅游好去处——京西坝上草原。那么坝上草原在哪呢？又有那些路线呢？特此推荐京西坝上草原旅游攻略给大家，让您尽情享受青山秀水、绿地和风光无限。', '0', '0', '2', '2', '4', '0', '835', '1', '1517108155', '0', '11', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('618', '1', '', '密云水库自驾游 去密云水库吃鱼啦！', '131', '0', '', '0', '0', '2', '2', '4', '0', '843', '1', '1517108155', '0', '16', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('617', '1', '', '武陵源观雾之行', '131', '0', '　第一天虽然下了一场不小的雨，却给张家界武陵源增添了更多的意境，人间仙境张家界武陵源观了一场雾，思索了一次人生。', '0', '0', '2', '2', '4', '0', '844', '1', '1517108155', '0', '16', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('616', '1', '', '天门山游玩之旅', '131', '0', '对于天门山。之前还傻傻的认为是在张家界景点里的套票就可以看到的景点。还在想，张家界比起其他的地方真心的不错啊，景点有点太多太精了。后来才无情的发现，如果什么跟什么。都是分开的，而且需要的人民币真心还不少啊。', '0', '0', '2', '2', '4', '0', '845', '1', '1517108155', '0', '3', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('615', '1', '', '五一桑植之行', '131', '0', '五月一日中午从吉首出发，一路经历两重天，一忽儿晴天，一忽儿暴雨，下午四点半到达桑植县城，跟我同去的朋友都是第一次来桑植，晚上就住县城里，带他们吃南岔的鱼，观贺龙电站大坝。', '0', '0', '2', '2', '4', '0', '846', '1', '1517108155', '0', '1', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('614', '1', '', '祝融峰游记', '131', '0', '常说：“五岳归来不看山”。东岳泰山、中岳嵩山、北岳恒山、西岳华山均已登临，惟南岳衡山向往已久但尚未相见。', '0', '0', '2', '2', '4', '0', '846', '1', '1517108155', '0', '5', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('597', '1', '', '野三坡帝星农家院惠多分店', '117', '0', '野三坡帝星农家院位于涞水县三坡镇苟各庄村，被誉为“天下第一峡”的百里峡是野三坡独具特色的景区之一', '0', '0', '2', '2', '4', '0', '856', '1', '1517108155', '0', '21', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('598', '1', '', '野三坡百里峡富豪农家庄园', '117', '0', '涞水富豪酒店有限公司旗下的百里峡富豪农家庄园坐落在世界地质公园、国家AAAAA景区---野三坡百里峡风景名胜区。', '0', '0', '2', '2', '4', '0', '827', '1', '1517108155', '0', '26', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('599', '1', '', '梨木台天香楼', '120', '0', '蓟县下营镇东山村，位于郭家沟村东1000米，马营公里旁，是蓟县县委县政府投巨资', '0', '0', '2', '2', '4', '0', '821', '1', '1517108155', '0', '35', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('600', '1', '', '九山顶居仙阁农家别墅', '120', '0', '居仙阁农家别墅位于天津著名景区九山顶风景区内，是一家集餐饮、住宿、会议、娱乐为一体的农家别墅。', '0', '0', '2', '2', '4', '0', '820', '1', '1517108155', '0', '18', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('601', '1', '', '白洋淀小雨农家院', '117', '0', '白洋淀小雨农家院诚信经营，真诚待客，希望与广大游客交换意见，您的支持是我们进步的动力！\r\n谢谢大家对白洋淀小雨农家院的厚爱，我们会不断改进服务，为游客提供更好的游玩环境！', '0', '0', '2', '2', '4', '0', '301', '1', '1517108155', '0', '48', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('602', '1', '', '野山坡农家院', '117', '0', '野山坡农家院位于涞水县三坡镇苟各庄村，被誉为“天下第一峡”的百里峡是野三坡独具特色的景区之一', '0', '0', '2', '2', '4', '0', '825', '0', '1517108155', '0', '33', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('603', '1', '', '五虎门度假中心', '116', '0', '五虎门度假中心隶属于北京五虎门民俗饭庄座落在北京城郊最东北端，国家级自然保护区雾灵山脚', '0', '0', '2', '2', '4', '0', '912', '1', '1517108155', '0', '56', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('604', '1', '', '张北中都坝上草原农家院', '117', '0', '张北中都坝上草原农家院，位于河北省张北县，于1993年建成营业，建筑占地8万多平方米。', '0', '0', '2', '2', '4', '0', '629', '1', '1517108155', '0', '66', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('605', '1', '', '雾灵山紫金农家院', '117', '0', '雾灵山南门和气农家院位于雾灵山脚下，距离雾灵山不过几百米', '0', '0', '2', '2', '4', '0', '628', '1', '1517108155', '0', '74', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('606', '1', '', '毛家峪悦鑫阁农家院', '120', '0', '蓟县毛家峪 农家院位于蓟县穿芳峪镇毛家峪村，依山而建的二层别墅式建筑，如果您到蓟县毛家峪来旅游，不妨到毛家峪悦鑫阁农家院来歇歇脚', '0', '0', '2', '2', '4', '0', '823', '1', '1517108155', '0', '33', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('607', '1', '', '青龙峡小岐农家院', '116', '0', '北京青龙峡小岐农家院位于怀柔青龙峡大水峪村，距青龙峡300米，周边环境优美，空气清新，农家院客房内干净整洁，床单、被罩一客一换，空调，电视，卡拉OK！24小时供应热水。', '0', '0', '2', '2', '4', '0', '626', '1', '1517108155', '0', '55', '0', '0', '0', '1514429755', '1514429755', '1', '1', '10', '1514532604');
INSERT INTO `v_document` VALUES ('608', '1', '', '野三坡百里峡宏宇农家院', '117', '0', '野三坡百里峡宏宇农家：位于河北省涞水县野三坡百里峡景区（苟各庄村)，距离百里峡景区入口500米', '0', '0', '2', '2', '4', '0', '627', '1', '1517108155', '0', '28', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('609', '1', '', '白河湾实在人农家院', '116', '0', '实在人农家院位于北京市怀柔区琉璃庙镇狼虎哨村，交通便利；四面环山，门前白河是密云水库的主坝上游，是我市最长的一条河流，这里空气清新', '0', '0', '2', '2', '4', '0', '910', '1', '1517108155', '0', '27', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('610', '1', '', '丰宁满族自治县靠山农家院', '117', '0', '丰宁满族自治县靠山农家院位于丰宁坝上草原大滩镇北梁村，可以同时接待多人住宿。', '0', '0', '2', '2', '4', '0', '440', '1', '1517108155', '0', '431', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('611', '1', '', '丰宁满族自治县新佛农家院', '117', '0', '丰宁满族自治县新佛农家院位于河北省丰宁满族自治县大滩镇大滩村后街草原边上，农家院出门口就是无边的草原，可以看到整片的鲜花盛开，远处羊群点点正在悠闲的低头吃着青草。', '0', '0', '2', '2', '4', '0', '439', '1', '1517108155', '0', '61', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('612', '1', '', '喇叭沟门农家院', '116', '0', '　喇叭沟门农家院位于怀柔北部山区。这里空气清新，气候宜人，素有“天然大氧吧”之美称，是“休闲，避暑，度假”的首选之地。', '0', '0', '2', '2', '4', '0', '417', '1', '1517108155', '0', '79', '0', '0', '0', '1514429755', '1514429755', '1', '1', '10', '1514532568');
INSERT INTO `v_document` VALUES ('641', '1', '', '梨木台农家院', '120', '0', '蓟县梨木台风景区、八仙山自然风景区，以原始自然风光和田园民俗为特色，令您身在大自然之中，心旷神怡。', '0', '0', '2', '2', '4', '0', '891', '1', '1517108155', '0', '21', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('642', '1', '', '蓟县盘山农家院', '120', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '3', '1', '0', '0');
INSERT INTO `v_document` VALUES ('643', '1', '', '十渡旅游景区', '50', '0', '', '0', '0', '2', '2', '4', '0', '830', '1', '1517108155', '0', '2', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('644', '1', '', '十渡一两日游', '50', '0', '', '0', '0', '2', '2', '4', '0', '831', '1', '1517108155', '0', '1', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('645', '1', '', '关于我们', '51', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('646', '1', '', '居庸关长城一日游', '50', '0', '', '0', '0', '2', '2', '4', '0', '832', '1', '1517108155', '0', '5', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('647', '1', '', '箭扣长城攻略', '50', '0', '', '0', '0', '2', '2', '4', '0', '833', '1', '1517108155', '0', '7', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('648', '1', '', '十渡旅游景区', '50', '0', '', '0', '0', '2', '2', '4', '0', '857', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('649', '1', '', '十渡旅游景区', '50', '0', '', '0', '0', '2', '2', '4', '0', '858', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('650', '1', '', '野三坡百里峡', '50', '0', '', '0', '0', '2', '2', '4', '0', '859', '1', '1517108155', '0', '3', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('651', '1', '', '野三坡百里峡', '50', '0', '', '0', '0', '2', '2', '4', '0', '860', '1', '1517108155', '0', '7', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('652', '1', '', '野三坡百里峡', '56', '0', '', '0', '0', '2', '2', '4', '0', '861', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('653', '1', '', '野三坡', '56', '0', '', '0', '0', '2', '2', '4', '0', '862', '1', '1517108155', '0', '26', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('654', '1', '', '野三坡百里峡', '56', '0', '', '0', '0', '2', '2', '4', '0', '863', '1', '1517108155', '0', '4', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('655', '1', '', '蓟县九顶山', '56', '0', '', '0', '0', '2', '2', '4', '0', '864', '1', '1517108155', '0', '3', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('656', '1', '', '古北水镇', '56', '0', '', '0', '0', '2', '2', '4', '0', '865', '1', '1517108155', '0', '14', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('657', '1', '', '古北水镇', '56', '0', '', '0', '0', '2', '2', '4', '0', '866', '1', '1517108155', '0', '9', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('658', '1', '', '古长城', '56', '0', '', '0', '0', '2', '2', '4', '0', '867', '1', '1517108155', '0', '12', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('659', '1', '', '北京故宫博物馆', '56', '0', '', '0', '0', '2', '2', '4', '0', '868', '1', '1517108155', '0', '37', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('660', '1', '', '青龙湖开新农庄', '116', '0', '青龙湖农家院,青龙湖住宿推荐,吃喝玩乐全程为您服务,同时为您提供最新旅游攻略.', '0', '0', '2', '2', '7', '0', '884', '1', '1517108155', '0', '18', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('661', '1', '', '凤凰岭仙客来农家院', '116', '0', '北京凤凰岭自然风景区位于海淀区苏家坨镇境内，距天安门33公里，总面积10.62平方公里。青山绿水，蓝天白云，层峦叠翠，密林曲径，奇花异草遍及山野，具有良好的生态环境；其上风上水的地理优势，使之享有京城“绿肺”之称。', '0', '0', '2', '2', '7', '0', '883', '1', '1517108155', '0', '79', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '1504514769');
INSERT INTO `v_document` VALUES ('662', '1', '', '上庄水库尚野山庄', '116', '0', '坐落在北京西北郊，位于北京市海淀区上庄镇，紧邻国家翠湖湿地公园，距离城区30公里。上庄水库是由旧河道筑拦水而成的，全长约4公里左右，库区弯弯曲曲，宽窄不一。上庄水库与稻香湖本是一桥之隔的同一水道，水体相连。', '0', '0', '2', '2', '7', '0', '882', '1', '1517108155', '0', '31', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('663', '1', '', '凤凰岭聚福农家小院', '116', '0', '北京凤凰岭自然风景区位于海淀区苏家坨镇境内，距天安门33公里，总面积10.62平方公里。青山绿水，蓝天白云，层峦叠翠，密林曲径，奇花异草遍及山野，具有良好的生态环境；其上风上水的地理优势，使之享有京城“绿肺”之称。', '0', '0', '2', '2', '7', '0', '905', '1', '1517108155', '0', '133', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '1514515110');
INSERT INTO `v_document` VALUES ('664', '1', '', '凤凰岭张记农家小院', '116', '0', '北京凤凰岭自然风景区位于海淀区苏家坨镇境内，距天安门33公里，总面积10.62平方公里。青山绿水，蓝天白云，层峦叠翠，密林曲径，奇花异草遍及山野，具有良好的生态环境；其上风上水的地理优势，使之享有京城“绿肺”之称。', '0', '0', '2', '2', '7', '0', '913', '1', '1517108155', '0', '396', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '1514514996');
INSERT INTO `v_document` VALUES ('665', '1', '', ' 临水农庄', '120', '0', '北塘地处天津市塘沽区最北端，东临渤海湾、南邻天津港、西靠开发区、北倚化工园（区），自然环境清幽宁静，自古素有“泽国之乡”之称，清初已是闻名津京及翼东一带的渔业重镇。', '0', '0', '2', '2', '7', '0', '875', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '3', '1', '0', '0');
INSERT INTO `v_document` VALUES ('666', '1', '', '临水农庄', '120', '0', '北塘地处天津市塘沽区最北端，东临渤海湾、南邻天津港、西靠开发区、北倚化工园（区），自然环境清幽宁静，自古素有“泽国之乡”之称，清初已是闻名津京及翼东一带的渔业重镇。', '0', '0', '2', '2', '7', '0', '890', '1', '1517108155', '0', '6', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('667', '1', '', '亲缘居', '120', '0', '梨木台自然风景区地处天津最北端，被称为“天津北极”。景区内峰林峡谷雄、险；森林景观秀、幽；潭、瀑溪水长流；藤萝攀援缠绕，形成了奇特的自然风光，被专家学者誉为“天津的神农架”。', '0', '0', '2', '2', '7', '0', '889', '1', '1517108155', '0', '6', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('668', '1', '', '梨木台连雨农家院', '120', '0', '梨木台自然风景区地处天津最北端，被称为“天津北极”。景区内峰林峡谷雄、险；森林景观秀、幽；潭、瀑溪水长流；藤萝攀援缠绕，形成了奇特的自然风光，被专家学者誉为“天津的神农架”。', '0', '0', '2', '2', '7', '0', '888', '1', '1517108155', '0', '8', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('669', '1', '', '梨木台乡野居', '120', '0', '梨木台自然风景区地处天津最北端，被称为“天津北极”。景区内峰林峡谷雄、险；森林景观秀、幽；潭、瀑溪水长流；藤萝攀援缠绕，形成了奇特的自然风光，被专家学者誉为“天津的神农架”。', '0', '0', '2', '2', '7', '0', '887', '1', '1517108155', '0', '4', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('670', '1', '', '梨木台豪广山庄农家院', '120', '0', '梨木台自然风景区地处天津最北端，被称为“天津北极”。景区内峰林峡谷雄、险；森林景观秀、幽；潭、瀑溪水长流；藤萝攀援缠绕，形成了奇特的自然风光，被专家学者誉为“天津的神农架”。', '0', '0', '2', '2', '7', '0', '886', '1', '1517108155', '0', '7', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('734', '1', '', '沈阳攻略', '136', '0', '高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富', '0', '0', '2', '2', '4', '0', '915', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('733', '1', '', '沈阳攻略', '136', '0', '高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富', '0', '0', '2', '2', '4', '0', '915', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('732', '1', '', '沈阳风景', '136', '0', '高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富', '0', '0', '2', '2', '4', '0', '918', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('731', '1', '', '沈阳美食', '136', '0', '高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富', '0', '0', '2', '2', '4', '0', '914', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('675', '1', '', '拓展项目：精准投放', '128', '0', '团队所有队员都会得到一个神奇的“宝石”，要求所有人必须完成“宝石”的互换，互换宝石分为三个步骤，必须是本队队员同时换“宝石”，必须按步骤一二三完成，成功晋级，失败只能一次次重来。', '0', '0', '2', '2', '4', '0', '915', '1', '1517108155', '0', '13', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('676', '1', '', '拓展项目：通天塔', '128', '0', '   所有团队利用提供的绳子和EVA板在规定的40分钟时间里，在人不离地、不借助任何外力的情况下，将箱子尽可能高的垒起来，最低要实现13个箱子的高度。其意义是在有限资源的情况下，开拓思路，巧想办法，把任务完成地更好。', '0', '0', '2', '2', '4', '0', '914', '1', '1517108155', '0', '15', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('730', '1', '', '沈阳住宿', '136', '0', '高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富', '0', '0', '2', '2', '4', '0', '917', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('713', '1', '', '海淀美食', '138', '0', '发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式', '0', '0', '2', '2', '4', '0', '914', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('712', '1', '', '海淀美食', '138', '0', '发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式', '0', '0', '2', '2', '4', '0', '914', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('711', '1', '', '海淀住宿', '138', '0', '发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式', '0', '0', '2', '2', '4', '0', '917', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('710', '1', '', '海淀风景', '138', '0', '发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式', '0', '0', '2', '2', '4', '0', '918', '1', '1517108155', '0', '1', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('709', '1', '', '海淀攻略', '138', '0', '发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式', '0', '0', '2', '2', '4', '0', '915', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('708', '1', '', '海淀攻略', '138', '0', '发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式', '0', '0', '2', '2', '4', '0', '915', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('707', '1', '', '海淀风景', '138', '0', '发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式', '0', '0', '2', '2', '4', '0', '918', '1', '1517108155', '0', '2', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('706', '1', '', '海淀住宿', '138', '0', '发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式', '0', '0', '2', '2', '4', '0', '917', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('729', '1', '', '沈阳住宿', '136', '0', '高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富', '0', '0', '2', '2', '4', '0', '917', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('728', '1', '', '沈阳美食', '136', '0', '高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富', '0', '0', '2', '2', '4', '0', '914', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('727', '1', '', '沈阳风景', '136', '0', '高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富', '0', '0', '2', '2', '4', '0', '918', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('726', '1', '', '沈阳攻略', '136', '0', '高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富', '0', '0', '2', '2', '4', '0', '915', '1', '1517108155', '0', '2', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('725', '1', 'aimhaidian', '北京-海淀', '138', '0', '', '0', '0', '2', '2', '4', '0', '919', '1', '1517108155', '0', '9', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('724', '1', '', '海淀攻略', '138', '0', '发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式', '0', '0', '2', '2', '4', '0', '915', '1', '1517108155', '0', '4', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('723', '1', '', '海淀风景', '138', '0', '发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式', '0', '0', '2', '2', '4', '0', '918', '1', '1517108155', '0', '43', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('722', '1', '', '海淀住宿', '138', '0', '发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式', '0', '0', '2', '2', '4', '0', '917', '1', '1517108155', '0', '4', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('705', '1', '', '海淀美食', '138', '0', '发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式', '0', '0', '2', '2', '4', '0', '914', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('704', '1', '', '拓展项目：沙漠掘金', '129', '0', '选择乘坐出租车在线咨询中心资讯中心', '0', '0', '2', '2', '4', '0', '914', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('735', '1', '', '沈阳风景', '136', '0', '高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富', '0', '0', '2', '2', '4', '0', '918', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('736', '1', '', '沈阳美食', '136', '0', '高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富', '0', '0', '2', '2', '4', '0', '914', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('737', '1', '', '沈阳住宿', '136', '0', '高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富', '0', '0', '2', '2', '4', '0', '917', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('738', '1', '', '沈阳住宿', '136', '0', '高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富', '0', '0', '2', '2', '4', '0', '917', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('739', '1', '', '沈阳美食', '136', '0', '高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富', '0', '0', '2', '2', '4', '0', '914', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('740', '1', '', '沈阳风景', '136', '0', '高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富', '0', '0', '2', '2', '4', '0', '918', '1', '1517108155', '0', '2', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('741', '1', '', '沈阳攻略', '136', '0', '高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富', '0', '0', '2', '2', '4', '0', '915', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('742', '1', '', '沈阳攻略', '136', '0', '高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富', '0', '0', '2', '2', '4', '0', '915', '1', '1517108155', '0', '1', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('743', '1', '', '沈阳风景', '136', '0', '高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富', '0', '0', '2', '2', '4', '0', '918', '1', '1517108155', '0', '13', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('744', '1', '', '沈阳美食', '136', '0', '高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富', '0', '0', '2', '2', '4', '0', '914', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('745', '1', '', '沈阳住宿', '136', '0', '高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富', '0', '0', '2', '2', '4', '0', '917', '1', '1517108155', '0', '4', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('746', '1', 'aimshenyang', '辽宁-沈阳', '136', '0', '', '0', '0', '2', '2', '4', '0', '920', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('747', '1', '', '宝马320', '149', '0', '放水电费第三方第三方士大夫沙发沙发斯蒂芬放水电费第三方第三方士大夫沙发沙发斯蒂芬放水电费第三方第三方士大夫沙发沙发斯蒂芬放水电费第三方第三方士大夫沙发沙发斯蒂芬', '0', '0', '6', '2', '4', '0', '925', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('748', '1', '', '旅游包车', '139', '0', '', '0', '0', '6', '2', '4', '0', '921', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '-1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('749', '1', '', '宝马740', '149', '0', '放水电费第三方第三方士大夫沙发沙发斯蒂芬放水电费第三方第三方士大夫沙发沙发斯蒂芬放水电费第三方第三方士大夫沙发沙发斯蒂芬', '0', '0', '6', '2', '4', '0', '926', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('750', '1', '', '宝马740', '139', '0', '', '0', '0', '6', '2', '4', '0', '0', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '-1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('751', '1', '', '奔驰', '149', '0', '', '0', '0', '6', '2', '4', '0', '925', '1', '1517108155', '0', '5', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('752', '1', '', '奔驰', '139', '0', '', '0', '0', '6', '2', '4', '0', '925', '1', '1517108155', '0', '4', '0', '0', '0', '1514429755', '1514429755', '-1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('753', '1', '', '奔驰', '149', '0', '', '0', '0', '6', '2', '4', '0', '925', '1', '1517108155', '0', '5', '0', '0', '0', '1514429755', '1514429755', '-1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('754', '1', '', 'volov', '150', '0', '释放水电费第三方士大夫的凤飞飞的说法释放水电费第三方士大夫的凤飞飞的说法释放水电费第三方士大夫的凤飞飞的说法释放水电费第三方士大夫的凤飞飞的说法', '0', '0', '6', '2', '4', '0', '925', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('755', '1', '', '北京租车', '149', '0', '发多少发送到发送到发送到发送到发送到方式都佛山佛山地方防守打法发斯蒂芬斯蒂芬水电费', '0', '0', '6', '2', '4', '0', '935', '1', '1517108155', '0', '0', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '0');
INSERT INTO `v_document` VALUES ('756', '1', '', '凤凰岭张记农家小院', '116', '0', '北京凤凰岭自然风景区位于海淀区苏家坨镇境内，距天安门33公里，总面积10.62平方公里。青山绿水，蓝天白云，层峦叠翠，密林曲径，奇花异草遍及山野，具有良好的生态环境；其上风上水的地理优势，使之享有京城“绿肺”之称。', '0', '0', '2', '2', '7', '0', '913', '1', '1517108155', '0', '400', '0', '0', '0', '1514429755', '1514429755', '1', '1', '0', '1514514992');

-- ----------------------------
-- Table structure for v_document_article
-- ----------------------------
DROP TABLE IF EXISTS `v_document_article`;
CREATE TABLE `v_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `imagelist` varchar(255) NOT NULL COMMENT '图片列表',
  `username` varchar(255) NOT NULL COMMENT '注册用户名',
  `phone` varchar(255) NOT NULL COMMENT '联系电话',
  `city` varchar(255) NOT NULL COMMENT '区或市名称(例如:海淀区)',
  `fjmc` varchar(255) NOT NULL COMMENT '景点名称(例如:白洋淀)',
  `meishi` varchar(255) NOT NULL COMMENT '美食',
  `fangjian` varchar(255) NOT NULL COMMENT '房间',
  `fengjing` varchar(255) NOT NULL COMMENT '风景',
  `address` varchar(255) NOT NULL COMMENT '详细地址',
  `update_time1` int(32) NOT NULL,
  `jingwei` varchar(255) NOT NULL COMMENT '经纬度(地图定位)',
  `tzprice` varchar(255) NOT NULL COMMENT '拓展价格',
  `njyclass` char(50) NOT NULL COMMENT '农家院分类',
  `aimclass` char(50) NOT NULL COMMENT '目的地分类',
  `njyzstp` varchar(255) NOT NULL COMMENT '农家院展示',
  `family` varchar(255) NOT NULL COMMENT '农家院规模',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- ----------------------------
-- Records of v_document_article
-- ----------------------------
INSERT INTO `v_document_article` VALUES ('597', '0', '<p>野三坡帝星农家院位于涞水县三坡镇苟各庄村，被誉为“天下第一峡”的百里峡是野三坡独具特色的景区之一</p>', '', '0', '', '', 'zjl1012', '15955423258', '涞水', '野三坡', '761,762,763', '764,669,765,766,675,667,670,767', '755,756,757,758,759,760', '', '1504511533', '115.459056,39.677459', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('598', '0', '<p>涞水富豪酒店有限公司旗下的百里峡富豪农家庄园坐落在世界地质公园、国家AAAAA景区---野三坡百里峡风景名胜区。是野三坡百里峡景区证照齐全的正规餐饮、住宿接待单位，被野三坡景区管理委员会评定为景区唯一一家“星级农家宾馆”。同时我庄园也是野三坡地区唯一一家连续十三年在河北旅游局、野三坡管委会零投诉单位。十余年来，我们秉承“诚信经营、顾客至上”的服务宗旨，\r\n 真诚接待每一位过往宾朋，赢得了广大新老顾客的信赖与支持。\r\n &nbsp; &nbsp;\r\n野三坡百里峡富豪农家庄园，具备专业的团队接待实力，不论在组团，制定行程，还是吃住行一条龙服务都属于庄园的服务范畴，为出行单位提供优质、快捷、精准的吃、住、玩服务。</p>', '', '0', '', '', 'zjl1012', '0312-4563067', '涞水', '野三坡', '752,753,754', '737,738,739,740,742,744', '741,743,745,746,747,748,749,750,751', '河北省保定市涞水县野三坡百里峡迎宾路88号', '1504074394', '115.395458,39.690863', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('658', '0', '<p><img src=\"/Uploads/Editor/2017-09-04/59ad216b81400.jpg\" style=\"width: 800px; height: 533px;\" title=\"古北长城2.jpg\" width=\"800\" vspace=\"0\" hspace=\"0\" height=\"533\" border=\"0\"/></p><p><img src=\"/Uploads/Editor/2017-09-04/59ad216d642e4.jpg\" style=\"width: 800px; height: 533px;\" title=\"古北长城3.jpg\" width=\"800\" vspace=\"0\" hspace=\"0\" height=\"533\" border=\"0\"/></p><p><br/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('659', '0', '<p><img src=\"/Uploads/Editor/2017-09-04/59ad22c74d632.jpg\" style=\"width: 800px; height: 533px;\" title=\"北京故宫博物馆.jpg\" width=\"800\" vspace=\"0\" hspace=\"0\" height=\"533\" border=\"0\"/></p><p><img src=\"/Uploads/Editor/2017-09-04/59ad22c775dc3.jpg\" style=\"float:none;\" title=\"北京故宫博物馆2.jpg\"/></p><p><img src=\"/Uploads/Editor/2017-09-04/59ad22c89b8a6.jpg\" style=\"width: 800px; height: 510px;\" title=\"北京故宫博物馆3.jpg\" width=\"800\" vspace=\"0\" hspace=\"0\" height=\"510\" border=\"0\"/></p><p><br/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('599', '0', '梨木台天香楼蓟县下营镇东山村位于郭家沟村东1000米马营公里旁是蓟县县委县政府投巨资', '', '0', '', '', 'zjl1012', '18322123441', '蓟县', '梨木台', '733,734,735', '720,721,722,723,724,725,726,727,728,729', '730,731,732,908', '蓟县下营镇东山村(郭家沟村东、梨木台村西)', '1514270913', '117.456193,40.190052', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('643', '0', '<p>十渡旅游景区</p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('644', '0', '<p>十渡一两日游</p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('645', '0', '<p>农家院介绍<br/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('651', '0', '<p><img src=\"/Uploads/Editor/2017-09-04/59ad1efc55e1a.jpg\" title=\"野三坡百里峡2.jpg\"/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('652', '0', '<p><img src=\"/Uploads/Editor/2017-09-04/59ad1f78b46f9.jpg\" title=\"野三坡百里峡.jpg\"/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('653', '0', '<p><img src=\"/Uploads/Editor/2017-09-04/59ad1fb2cbfa9.jpg\" title=\"野三坡.jpg\"/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('654', '0', '<p><img src=\"/Uploads/Editor/2017-09-04/59ad1ff8b631f.jpg\" title=\"timg.jpg\"/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('655', '0', '<p><img src=\"/Uploads/Editor/2017-09-04/59ad207774d8c.jpg\" title=\"蓟县九顶山.jpg\"/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('656', '0', '<p><img src=\"/Uploads/Editor/2017-09-04/59ad20cca4074.jpg\" title=\"古北水镇.jpg\" style=\"width: 800px; height: 537px;\" width=\"800\" vspace=\"0\" hspace=\"0\" height=\"537\" border=\"0\"/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('657', '0', '<p><img src=\"/Uploads/Editor/2017-09-04/59ad20fd7ebff.jpg\" title=\"古北水镇2.jpg\" style=\"width: 800px; height: 530px;\" width=\"800\" vspace=\"0\" hspace=\"0\" height=\"530\" border=\"0\"/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('600', '0', '<section><section><section><section><section>九山顶居仙阁农家别墅</section></section></section></section></section><section><section><section><section><section><section><section>居仙阁农家别墅位于天津著名景区九山顶风景区内，是一家集餐饮、住宿、会议、娱乐为一体的农家别墅。在本村住宿都设有地暖、空调设备，无论是冬季旅游住宿，还是滑雪住宿都温暖适宜！居仙阁农家别墅房间宽敞整洁，主人热\r\n &nbsp; \r\n&nbsp;情好客，所有进店旅客都可免费品尝水果，您到九山顶来无论是爬野山、摘野果、吃野味还是休闲娱乐都是您首选的好地方，山里人纯朴好客的性格定能您高兴而来，满意而归。我们的服务宗旨就是给您一种家的感觉。</section></section></section></section></section></section></section><section>预约联系：董先生</section><section>预约电话：13752519661、022-29719631</section><section>【联系时可告之从“指尖旅游网”看到的，】</section><section>开业时间：2009</section><section>营业时间：全年</section><section>农家设施：设有地暖、空调设备，</section><section>房间设施：空调、电视、独立卫生间、24小时热水、热水壶、免费矿泉水、无线wifi</section><section>会议设施：店家配有大屏幕投影仪（可连接电脑），满足您的会议需求。</section><section>房型配套： 情侣间、2人间、3人间、温馨家庭</section><section>住宿价格：</section><section>周一至周四120元 （含三餐）</section><section>周五至周日150元 （含三餐）</section><section>十一期间是200元 （含三餐）</section><section>友情提示：小孩（1.2m以下）免费。</section><section><section><section><section><section>产品特色：各种烧烤：烤全羊、烤羊腿、烤鱼、烤野兔等，还可为游客安排篝火晚会；<br/></section></section></section></section></section><section><section><section><section><section><section><section>农家饭菜：山野菜、花椒芽、小河鱼、小河虾、柴鸡蛋、贴饼子炖小鱼、菜团子、小米粥等全部是取自大自然的无污染食品，应有尽有，丰俭由人。居仙阁备有各种、白酒、冰镇啤酒、冰镇饮料供游客享用；</section><section>烧烤类：各种烧烤：烤全羊、烤羊腿、烤鱼、烤野兔等，还可为游客安排篝火晚会。</section></section></section></section></section></section></section><section><section><section><section><section>果园采摘<img src=\"http://getpic.52114.org/52114/getpic.php?url=http://mmbiz.qpic.cn/mmbiz/y47f7FibYC67GJ7TxKXPKVEuNq5jt3XmLxT0tzYQiaEgYMxfN1JNBg5ujHC6ujgNdtgBRmGqkwMiaqoIFol2reB9w/0?wx_fmt=png\" data-bd-imgshare-binded=\"1\"/></section></section></section></section></section><section><section><section><section><section><section><section>自家有一大片九宝桃园，每年的8-10月是采摘的理想季节，还有红果、柿子、梨等，可供采摘，还可果树认领，承包荒山搞养殖等；</section></section></section></section></section></section></section><section><section><section><section><section><section><section>周边娱乐：九山顶风景区娱乐项目很多，住在农家院你还可以爬野山、摘野果、钓鱼、狩猎（小型）。坐在农家院里，仰望高山看星星更有无穷的乐趣；</section><section>骑马：10元/圈；骑马爬山：30元/小时；爬九山顶送山野八宝粥；</section><section>周边景点：九山顶自然风景区、黄崖关长城、八仙山、梨木台、清东陵、溶洞；</section></section></section></section></section></section></section><section><section><section><section><section><section><section>具体位置：天津市蓟县下营镇常州村太古区7号；</section><section>乘车路线：乘918车到平谷，转乘去兴隆方向的车到九山顶路口；</section><section>客车：天津大胡同有直达到下营的客车，店主可负责接送；</section><section>自驾线路: 四元桥&gt;&gt;枯柳树环岛右转弯&gt;&gt;平谷城区&gt;&gt;金海湖&gt;&gt;津围公路&gt;&gt;九山顶，进入九山顶景区；</section><section>重要提示：</section><section>1，扫一扫下方二维码，</section><section>关注：【指尖旅游网】成为会员，预约即享受房间费九折优惠。</section><section>2.游客出游请携带身份证等有效证件！</section><section>3.洗漱用品、拖鞋一应俱全。</section></section></section></section></section></section></section><p><br/></p>', '', '0', '', '', 'zjl1012', '13752519661', '蓟县', '九顶山', '697,698,699,700,701,702,703,704', '710,711,712,713,714,715,716,717,718,719', '705,706,707,708,709', '天津市蓟县下营镇常州村', '1504074394', '117.521956,40.220017', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('601', '0', '白洋淀小雨农家院诚信经营，真诚待客，希望与广大游客交换意见，您的支持是我们进步的动力！\r\n谢谢大家对白洋淀小雨农家院的厚爱，我们会不断改进服务，为游客提供更好的游玩环境！', '', '0', '', '', 'zjl1012', '13855440211', '保定', '白洋淀', '691,692,870', '685,686,687,694,695,696', '677,678,679,680,681,682,684,900', '河北省白洋淀', '1509959817', '116.00481,38.943494', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('660', '0', '<p>青龙湖农家院,青龙湖住宿推荐,吃喝玩乐全程为您服务,同时为您提供最新旅游攻略.</p>', '', '0', '', '', '', '4000-979-212', '丰台区', '青龙湖', '', '', '', '北京市丰台区大灰厂路', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('661', '0', '北京凤凰岭自然风景区位于海淀区苏家坨镇境内，距天安门33公里，总面积10.62平方公里。青山绿水，蓝天白云，层峦叠翠，密林曲径，奇花异草遍及山野，具有良好的生态环境；其上风上水的地理优势，使之享有京城“绿肺”之称。', '', '0', '', '', 'jing123', '4000-979-212', '海淀区', '凤凰岭', '937', '', '936', '北京海淀区凤凰岭自然风景区车耳营村', '1514426386', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('662', '0', '<p>坐落在北京西北郊，位于北京市海淀区上庄镇，紧邻国家翠湖湿地公园，距离城区30公里。上庄水库是由旧河道筑拦水而成的，全长约4公里左右，库区弯弯曲曲，宽窄不一。上庄水库与稻香湖本是一桥之隔的同一水道，水体相连。</p>', '', '0', '', '', '', '4000-979-212', '海淀区', '上庄水库', '', '', '', '北京 海淀 上庄镇 上庄村 上庄水库北岸中段', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('663', '0', '<p>北京凤凰岭自然风景区位于海淀区苏家坨镇境内，距天安门33公里，总面积10.62平方公里。青山绿水，蓝天白云，层峦叠翠，密林曲径，奇花异草遍及山野，具有良好的生态环境；其上风上水的地理优势，使之享有京城“绿肺”之称。</p>', '', '0', '0', '', 'zjl1012', '4000-979-212', '海淀区', '凤凰岭', '', '', '', '北京海淀区凤凰岭自然风景区聂各庄西路', '1509959826', '', '', '0', '0', '', '');
INSERT INTO `v_document_article` VALUES ('664', '0', '<p>北京凤凰岭自然风景区位于海淀区苏家坨镇境内，距天安门33公里，总面积10.62平方公里。青山绿水，蓝天白云，层峦叠翠，密林曲径，奇花异草遍及山野，具有良好的生态环境；其上风上水的地理优势，使之享有京城“绿肺”之称。</p>', '', '0', '0', '', 'zjl1012', '13904210163', '海淀区', '凤凰岭', '906', '', '895', '北京海淀区凤凰岭自然风景区车耳营村', '1510275457', '', '', '0', '', '921,923', '');
INSERT INTO `v_document_article` VALUES ('665', '0', '<p>北塘地处天津市塘沽区最北端，东临渤海湾、南邻天津港、西靠开发区、北倚化工园（区），自然环境清幽宁静，自古素有“泽国之乡”之称，清初已是闻名津京及翼东一带的渔业重镇。进入二十一世纪，北塘的旅游资源日趋凸现，北塘海鲜、北塘海会、出海做一日渔民以及浓郁的乡情、乡俗和敦厚民风都成为北塘独具特色的旅游景观。\r\n &nbsp; \r\n随着塘沽区行政中心北移大目标的确定和天津滨海新区的成熟和发展，北塘因其地理优势再次成为人们注目的焦点，开发北塘资源，再造北塘辉煌的呼声也日渐强烈。目前，北塘三河岛渔人码头的旅游开发已提上政府工作日程，不远的将来，北塘将建设成具有丰富历史文化内涵和三角湿地自然保护区风貌，集海河观光、渔人码头、国际游船、海鲜餐饮、风俗文化于一体的多功能旅游区。这里通过文字和图片为您集中展示北塘古镇特有的历史风貌和文化底蕴，以加深人们对她的了解和热爱。<br/></p>', '', '0', '', '', '', '4000-979-212', '塘沽', '北塘渔村', '', '', '', '天津 塘沽区 于庄子 路1998号', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('646', '0', '<p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	居庸关长城，是京北长城沿线上的著名古关城，国家级文物保护单位。是北京旅游局评定的国家AAAA级景区。位于昌平县城以北20千米的峡谷中。</span></p><p style=\"text-align: center; line-height: 2em;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/f88e73333add484a8e1bc2347ebe81a0.jpg\" alt=\"\"/></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	距北京市60千米，距八达岭长城20公里，地形险要，是长城重要的关隘。2013年2月居庸关景区泮宫牌坊处的两个汉白玉的柱头兽被盗走，2013年5月赵某等四人因涉嫌盗窃罪，已被批准逮捕。</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	居庸关长城建在一条长达15公里的山谷间，两旁山峦重叠，树木葱郁，山花烂漫，景色瑰丽，远在800年前的金代，就被列为燕京八景之一，称为“居庸叠翠”。居庸关是从北面进入北京的门户，有“一夫当关，万夫莫开”的气势。居庸关的中心，还保存着一个雕刻精美的汉白玉石台“云台”。在元朝时，台上建有三座石塔，于元末明初被毁。三塔被毁后，在此台上又建一院“泰安寺”，此寺于清康熙年间被火焚毁，只剩下这个基座——云台。云台的券门内，石壁上雕刻有四大天王像，姿态传神;还刻有梵文、藏文、蒙文、维吾尔文、西夏文、汉文六种文字组成的佛经。</span></p><p style=\"text-align: center; line-height: 2em;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/3ff0d7defbc44196916080d389c902b6.jpg\" alt=\"\"/></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	关城呈圆周封闭形，长4142米，团状长城内既有供学习的泮宫和叠翠书院，也有商贾行走的买卖街;不仅有专供参拜的城隍庙，而且有特为迎驾的行宫。</span></p><p style=\"text-align: center; line-height: 2em;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/f1331a54af7143758a9208888cb207a9.jpg\" alt=\"\"/></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	现存的居庸关城内外还有衙署、庙宇、儒学等各种相关建筑。</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	清末以后，居庸关关城建筑逐渐荒废。1992年昌平县十三陵特区办事处为保护文物，对关城建筑进行了全面修复，再现了昔日的雄姿。</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	主要景点</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	城墙及关城建筑</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	东西山脊之上蜿蜒曲折的城墙都是1993年以后在原基址上修复的，全长4142米。站在新修复的居庸关的城楼上极目四望：巍峨的长城如同从相距850米的南北两关伸出的巨手，蜿蜿蜒蜒、曲曲折折、高高低低在东边的翠屏山和西边的金柜山的峰巅上汇合，两山山顶的直线距离达1150米，成为一个封闭的圆周。翠屏山高150米，山上的长城长1500米;金柜山高351米，山上的长城长2100米;联结两山的河套上，还有57米长城。在如此险峻的山上修建双重保险的长城，可见当年居庸关要塞之重要。</span></p><p style=\"text-align: center; line-height: 2em;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/79990c571e3149de83b708521616796e.jpg\" alt=\"\"/></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	衙署</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	这组建筑是户曹行署，即明朝户部常设居庸关的衙署。正德十年(公元1515年)曾重修。其规制，中为厅，前为重门，后为寝室，左右为文移吏胥生活用房。明亡后署废。</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	居庸关</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	居庸关不仅地势险要，而且风景宜人。这里山峦重叠，溪水长流，植被繁茂，景色怡人。金代“燕山八景”、明代“北京八景”、清代“燕京八景”中“居庸叠翠”的誉称，流传至今。清乾隆皇帝亲笔题写“居庸叠翠”四字，并立碑于此。</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	实用信息</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	景区开放时间：淡季：8:30-16:00, 旺季：8:00-17:00</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	门 票：</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	旺 季：成人45元/人 学生25元/人</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	淡 季：成人40元/人 学生22.5元/人</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	购票优惠：</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	1、1.2米以下儿童免票。</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	2、离休人员凭离休证免票。</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	3、60岁以上老年人持老年证或蓝色优待卡半价优惠。</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	4、本市户籍65岁以上老年人持红色优待卡免票(大型活动期间除外)。</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	5、大中小学生凭有效证件半价优惠(不含成人教育、研究生)。</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	6、持有社会保障金领取证的人员凭证半价优惠。</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	7、残疾人员凭有效证件免票。</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	最佳游览时间：五月至十月</span></p><p><br/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('637', '0', '<p>&nbsp;&nbsp; 白河湾山水人家25号农家院位于怀柔北部山区45公里处狼虎哨村！开业于2009年，这里交通便利，青山环抱，绿水绕流，民风淳朴，是您度假，休闲，娱乐，健身，郊游的理想去处。<br/>白河湾风景如画；桃杏花漫山开放，白杨翠柳相映成趣，躺在悬挂林间的吊床上，顿时忘却了生活的烦恼和工作的紧张，全身心地陶醉于大自然中；坐着橡皮筏漂流在白河上时而激流勇进，时而平静祥和，感受着别样的旅游休闲情趣；和自己心爱的人走一走同心锁桥，将两个人的心紧紧的“锁”在一起；远离城市的雾霾，带上爱人和朋友到山水人家领略一下天然氧吧的清新。<br/>&nbsp;&nbsp; 咱家有卡拉OK，露天投影，麻将机，可篝火，拓展，品尝农家饭山野菜，野生鱼虾，烤串，烤全羊，考虹鳟鱼等。来白河湾农家院您想吃啥，大姐就带您吃啥！王大姐：13651317376<br/>248一体套餐自助烧烤+一次加长漂流+CS射击+树上闯关+50元白河大峡谷探险穿越<br/>A1 160元二日游三餐+住标准间，两正餐一早餐，正餐有鸡有鱼。<br/>A2 200元二日游三餐+住标准间，两正餐一早餐，正餐有鸡有鱼。<br/>B1 188元二日游三餐+住标准间，一正餐，一次自助烧烤，一早餐，一晚两人或三人的标间<br/>B2 238元二日游三餐+住标准间，一正餐，一次自助烧烤，一早餐，一晚两人或三人的标间<br/>C1 318元二日游吃住玩烤：住一晚标准间，提供一正餐一早餐，（正餐有鸡，有鱼）一次自助烧烤（随便吃，随便喝，各种正宗烤串，饮料酒水，水果，小凉菜，主食，管饱）一次CS射击，一次树上闯关，一次白河大峡谷探险穿越+60元每人户外拓展半天<br/>C2 388元二日游吃住玩烤：住一晚标准间，提供一正餐一早餐，（正餐有鸡，有鱼）一次自助烧烤（随便吃，随便喝，各种正宗烤串，饮料酒水，水果，小凉菜，主食，管饱）一次CS射击，一次树上闯关，一次白河大峡谷探险穿越+60元每人户外拓展半天&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; （1是标配，2是高配）<br/>（10人以上套餐还可以免费棋牌麻将白河湿地观光，垂钓，登山，10人以上送卡拉OK，40人以上送篝火，50人以上送饮料）<br/>关于小孩收费，不占床1.2米以下不收费，1.2-1.5米收半价，1.5米以上算成人，漂流不分大小</p>', '', '0', '', '', '', '13651317376', '怀柔区', '白河湾山', '303,304,305,306,307,308,309,310,311,312,313,314', '315,316,317,318,319,320,321,322,323', '324,325,326,327,328,329,330,331,332,333', '怀柔区北部山区45公里处狼虎哨村25号院', '0', '116.703349,40.677874', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('602', '0', '<p>野山坡农家院位于涞水县三坡镇苟各庄村，被誉为“天下第一峡”的百里峡是野三坡独具特色的景区之一，百里峡总面积110万平方公里,位于河北省涞水县,与北京市房山区接壤,距北京市中心115公里，是京西旅游景点中一颗最耀眼的明珠。国家地质公园――百里峡百里峡由三条峡谷组成,全长105华里.峡谷分布形如鹿角,最外边一条被称作\r\n \r\n“蝎子沟”:全长25华里,在百里峡景区入口处有一“仙官引路”景点将游人引进蝎子沟，此沟长达25华里，因沟中遍生蝎子草而得名。该草形如幼桑，如肌肤触动其叶，顿觉疼痛难忍，但少时即愈。蝎子沟内有“龙潭映月”、“摩耳崖”、“铁锁崖”等壮景，令人叹为观止。\r\n \r\n中间的一条峡谷为“海棠峪”:因沟内遍布海棠花而得名，全长35华里,此处翠壁兀立，丛峦万仞，直插云天，令人望而生畏。沿沟游览，奇险的“老虎嘴”，狭窄的“一线天”，维妙维肖的“回首观音”，规模宏大的“下天桥”和“上天桥”等奇绝景观，使游人目不暇接。每逢仲夏时节，野生海棠花开满沟谷，清香四溢。\r\n \r\n第三条峡谷被称作“十悬峡”，因沟内分布着数十处弧形的悬崖而得名，全长45华里。此沟长达45华里，因峡谷内分布着十几处造型各异的悬崖而得名。进入峡谷，“抻牛湖”瀑布、灵芝山“水帘洞”、弧形悬崖形成的“不见天”、令人费解的“怪峰”、峭崖剔透的“雄狮出世”等景点映入游人眼帘。可谓步步有景、如入童话世界。\r\n \r\n三条峡谷全长105华里，故此得名“百里峡”。峡谷内奇岩耸立、绝壁万仞、草木横生，千奇百怪的岩溶壮景集雄、险、奇、幽为一体，构成一幅浓墨重彩的大自然“百里画廊”。\r\n \r\n\r\n附近著名景点：\r\n\r\n鱼谷洞\r\n\r\n \r\n&nbsp;鱼谷洞自然风景区（佛洞塔景区）是野三坡七大风景区之一，是以奇泉怪洞为主体的自然风景区。鱼谷洞位于野三坡景区中间，距北京100公里，距天津220公里，距保定145公里，距石家庄270公里。鱼谷洞全长约\r\n 1800 米，平均宽10米，高0.5-20米，为一幽深莫测的洞穴，曲径通幽，时宽时窄，时高时低，变幻多端。\r\n &nbsp;龙门天关位于河北省野三坡地质公园西北部，是京都通往塞外的重要关隘，是历代兵家必争之地，因而留下了大量人文历史遗迹，有“文化长廊之称”。\r\n白草畔：\r\n\r\n &nbsp;白草畔是个风景秀美迷人的地方，有一位旅游专家、教授在1998年8月份一连三次登上由草畔，他感慨地说： \r\n白草畔“不登白草畔，空言百花山，登上白草畔，方知天外天。”\r\n \r\n&nbsp;农家院每年3月15号—11月20号开业。帝星农家院客房设施齐全，宽敞而又整洁。放眼望去四周青山环绕，拒马河水尽收眼底，偶尔可见乡村袅袅炊烟，农家院主人为人憨厚老实，地道的乡村农家美食，可让您回味无穷！同时还为您准备了丰富多彩的娱乐项目。喧嚣的都市，忙碌的工作之余，相约上自己的家人、好友来帝星农家院放松一下，定让您留恋忘返。\r\n\r\n &nbsp; &nbsp;住宿设施：提供各种房间，可以同时接待六十人入住。房间24小时热水，独立卫生间，空调，彩电，2个停车场\r\n\r\n &nbsp; &nbsp;娱乐介绍：麻将（免费），篝火晚会（按柴火收费）。骑马，竹排，漂流，卡丁车\r\n\r\n &nbsp; &nbsp;优惠信息：学生、老人优惠\r\n\r\n &nbsp; &nbsp;特色烤全羊：十年烤羊经验 ，自家专业养羊，现宰现烤，全程表演，曾两次上河北电视台，方圆百里家喻户晓。\r\n\r\n &nbsp;\r\n特色烤全羊 免费新款专业电脑点歌 农家KTV 吃住一条龙，\r\n\r\n野三坡百里峡帝星农家院让您吃得舒心.住的放心.玩的开心。\r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; \r\n\r\n &nbsp;来人免费接送</p>', '', '0', '0', '', 'zjl1012', '15311966815', '涞水', '野山坡', '649,650,651,652,653,654,655,656,657', '667,668,669,670,671,672,673,674,675', '658,659,660,661,662,663,664,665,666', '涞水县三坡镇苟各庄村', '1504074394', '115.394925,39.682102', '', '0', '0', '', '');
INSERT INTO `v_document_article` VALUES ('603', '0', '五虎门度假中心隶属于北京五虎门民俗饭庄座落在北京城郊最东北端，国家级自然保护区雾灵山脚', '', '0', '', '', 'zjl1012', '13811230383 ', '密云区', '五虎门', '630,631,632,357,358', '639,640,641,642,643,644,645,646,647,648', '633,634,635,636,637,901', '五虎门度假中心', '1510275643', '117.478938,40.656941', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('604', '0', '<p>张北中都坝上草原农家院，位于河北省张北县，于1993年建成营业，建筑占地8万多平方米。景区草原总面积3万亩，度假村占地面积2500亩。截止目前，累计投入建设资金2400万元，历经十多年的建设，现已成为环境优美怡人，娱乐项目多样，建筑风格别致，各种配套设施齐备，集文化观赏、餐饮娱乐、惊险刺激、休闲度假为一体的国家AAAA级旅游度假区。度假村现能同时容纳700人就餐、400人住宿，服务采用全套正宗蒙俗礼仪。先后被评为河北省三星级文明窗口单位、河北省景点文明单位、河北省旅游行业先进集体及全国青年文明号单位等荣誉称号。</p>', '', '0', '', '', 'zjl1012', '13171655008', '张家口', '坝上草原', '572,574,575,577,578,579,580,581,582', '603,604,605,608,609,610,611,616,618,619,620,622', '586,587,588,592,594,595,597,598,600,601', '河北省张家口市张北县', '1504074394', '114.728673,41.16737', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('605', '0', '<p>雾灵山紫金农家院坐落在通往雾灵山山门的主路上，建筑在雾灵山脚下，抬头雾灵山,低头涓涓溪水流过，可以同时停放几十辆车的停车场，新建的五层别墅楼，正是让雾灵山避暑休闲粉丝们最为钟爱的。紫金农家院接待经验丰富一丝不苟，不管您是家庭出行，还是团队旅游住宿雾灵山紫金农家院，都能让您的雾灵山之行倍感超值。 雾灵山紫金农家院是典型的雾灵山别墅民居，建筑宽阔，房间大而明亮，有标准间、三人间、四人间、多人间，北方火炕间等，农家院可以同时接待200的住宿就餐，坐在房间中就能感受到雾灵山吹过来的丝丝凉风让您的入住更加惬意。</p>', '', '0', '', '', 'zjl1012', '13031405413', '承德', '雾灵山', '558,559,560,561,562', '556,557,546,547,549,550,552,553,554', '563,564,565,566,567,568,569,570,571,568', '河北省兴隆雾灵山脚下眼石村', '1504074394', '117.512028,40.540757', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('606', '0', '<p>蓟县毛家峪 农家院位于蓟县穿芳峪镇毛家峪村，依山而建的二层别墅式建筑，如果您到蓟县毛家峪来旅游，不妨到毛家峪悦鑫阁农家院来歇歇脚，吃上一顿香喷喷的农家饭，喝上一口地道的山泉水，再欣赏一下毛家峪大山里的风景，不愧是一种享受！<br/>　　蓟县毛家峪 农家院拥有独卫高级客房30间，有独卫三人间16间，双人间7间，大火炕3间，客房宽敞明亮，洁白的被褥一客一换，客房内空调、电视、洗手间一应俱全。在这里住宿，可享受到农家热情的服务、自然的气息！<br/>　　蓟县毛家峪 农家院饭菜农味十足；柴鸡炖野山蘑、沾卷子一锅鲜、猪肉炖粉条、贴饼子…….农家院的饭菜突出的是原汁原味、突出的是货真价实，突出的是经济实惠。这里的饭菜有着自己的特色； 特色烤全羊，外焦里酥，只要看上一眼，就会令人垂涎欲滴。这里有城里吃不到的鲜茉莉芽、香椿、花椒芽、苦菜等十几种纯天然深山野菜，使您倍感新鲜。 农家院也可以根据客人需求点餐，家里备有各种白酒、冰镇啤酒、冰镇饮料供游客享用。餐厅窗明几净，清新高雅，同时容纳140人就餐 。<br/>　　毛家峪长寿度假村坐落在天津市蓟县城东16公里处的穿芳峪乡。北拱皇家园林九龙山国家森林公园，南邻碧波万顷的翠屏湖，东通清东陵，西达娘娘顶和黄崖关古长城。度假村山环水绕、奇石怪岩、风光秀美；周围群山环抱，安宁清静；拥有亿年石、万亩林、千亩果、百年树、长寿人、仿古亭等奇特景观；村内民风好、庄风正、班子强、人气旺；现已开辟成华北地区目前唯一的一家以长寿为主题的长寿度假村。适应“崇尚健康，追求长寿”毛家峪之所以成为长寿村，据专家考证，主要有六条科学依据和长寿因子：环境优越 气候宜人 毛家峪东南西北四面环山，形成封闭性空间，是一处天然形成的天然“世外桃源”。安宁清静。即无噪音，又无污染，更无沙尘暴、冰雹等恶劣天气的干扰。使人随时随地处于高度清静状态，起到静心养性的保健作用。 毛家峪人少地多山场大，自己种粮种菜，不仅新鲜而且营养价值极高。毛家峪人利用新粮鲜菜制作出传统的长寿饭、长寿菜、长寿汤，更有利健康，促进长寿。 　　经常运动 锻炼体魄 毛家峪人出门是山、爱爬山；进门有活先干活。养成了勤劳勤快的好习惯。生命在于运动，毛家峪人就是在运动中换来了健康，赢得了长寿。宾客来毛家峪度假，不仅活动空间大，而且运动项目多，从而带来福也多多，寿也多多。 　　心胸开阔 愉悦心情 毛家峪人心怀开阔，不钻牛角尖，倡导和气生财，好客好交好友，善于助人为乐。毛家峪人总结长寿经验时，总是把好心情、好身体、好家庭、好朋友列为前四条，品味起来确有道理在其中。<br/>　&nbsp; 蓟县毛家峪 农家院欢迎您的到来！</p>', '', '0', '', '', 'zjl1012', '15311966812', '蓟县', '毛家峪', '539,541,542,543,544', '529,531,533,534,536,540', '523,524,525,526,527,530,532,535,537,538', '蓟县穿芳峪镇毛家峪村', '1504074394', '117.535063,40.102128', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('607', '0', '<p>北京青龙峡小岐农家院位于怀柔青龙峡大水峪村，距青龙峡300米，周边环境优美，空气清新，农家院客房内干净整洁，床单、被罩一客一换，空调，电视，卡拉OK！24小时供应热水。各式烧烤、绿色山野菜、农家特色饭，足以让您体验一番返璞归真、回归自然的至真境界。本农家院能同时容纳40人住宿，能同时容纳50人就餐。</p><p>北京青龙峡小岐农家院为您提供餐饮、美食、住宿、娱乐等服务。美食有；农家精品菜、农家特色菜、农家野味菜、外设炖品及烧烤.是您节假日游玩、朋友聚会、公司集体旅游的好去处. <br/></p><p>来北京青龙峡小岐农家院游玩您可以看到优美的湖光山色，听到阵风带来得松涛声，潺潺的流水声，幽美的马蹄声及阵阵蛙鸣声。在寒冷的冬季里体验到火炕带给您及亲人暖洋洋、热融融的环境使您快乐地度过漫漫长夜。晚上可以玩篝火，体验不一样的感觉。您还可以到山野林间散步爬山，去呼吸那带有浓郁松香气息得新鲜空气，登高远望，水天一色。</p>', '', '0', '', '', 'zjl1012', '18613835510', '怀柔区', '青龙峡', '493,494,495,496,497,498,499,500', '501,502,504,505,506,507,508,509,510', '511,512,513,514,515,516,517,519,520,521', '北京市怀柔区怀北镇大水峪村', '1504074394', '116.706998,40.452482', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('608', '0', '<p>野三坡百里峡宏宇农家：位于河北省涞水县野三坡百里峡景区（苟各庄村)，距离百里峡景区入口500米；能同时接待80人入住60人用餐，所有客房内配有空调、彩电24小时热水澡、独立卫生间、床单一客一换；所有客房视线良好（门前是奔流而过的拒马河）此外宏宇农家有足够的停车位【免费停车】坐火车来的游客我农家可免费接送，代买返程火车票、各景点门票、百里峡宏宇农家携全体员工欢迎您的光临！<br/>双人间80元/间、家庭间80元/间、三人间80元/间、团体游客住宿20元/人 <br/>本农家院全楼覆盖无线网络，每间客房均可享受免费上网！<br/>手机: 13613227578&nbsp; 电话: 0312-4563439&nbsp; 联系人：刘春华（先生）&nbsp;&nbsp; 微信：109945192</p>', '', '0', '', '', 'zjl1012', '13613227578', '保定', '野三坡', '461,462,463,464,465,466,467,468', '469,470,471,472,473,474,475,476,477,478', '479,480,481,482,483,484,485,486,487,488,489,490,491', '河北保定市野三坡百里峡', '1504074394', '115.39472,39.691314', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('609', '0', '实在人农家院位于北京市怀柔区琉璃庙镇狼虎哨村，交通便利；四面环山，门前白河是密云水库的主坝上游，是我市最长的一条河流，这里空气清新', '', '0', '', '', 'zjl1012', '13683010897 ', '怀柔区', '狼虎哨', '441,442,443,444,445,446', '447,448,449,450,451,452,453,454', '455,456,457,458,459,460,329,324,333', '北京市怀柔区琉璃庙镇狼虎哨村', '1510275471', '116.701654,40.678386', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('610', '0', '<p>丰宁满族自治县靠山农家院位于丰宁坝上草原大滩镇北梁村，可以同时接待多人住宿。农家院地理位置优越，出门口就是草原，距离情人谷，白桦林近，风景秀丽。农家院所在的大滩镇北梁地处美丽的坝上草原腹地，气候凉爽宜人，是避暑的胜地。便利的交通、清幽的环境、独特的农家风情吸引着来自全国各地的游客来此休闲度假。本农家院为游客提供吃、住、玩一条龙的服务。主人热情的待客方式以及草原的特色美味甚至让远方的游客流连忘返，深受大家欢迎。烤全羊更是坝上一绝，现场宰杀，客房独立卫生间，液晶电视，有双人间、三人间，床单一客一换，<br/>　　游坝上草原，感受满蒙风情。这里蓝天白云，一望无际的绿色草原，让您吸收到清新的空气感受到大自然的美丽。优美的靠山农家院欢迎您的光临！</p>', '', '0', '', '', 'zjl1012', '15133827573', '丰宁', '坝上草原', '427,428,429,430,431,432,433,435,436', '418,419,420,421,422,423,424,425,426', '405,406,407,408,412,413,414,415,437,438', '河北省承德市丰宁满族自治县大滩镇北梁村', '1504074394', '116.022832,41.582896', '', '0', '', '921,922,924', '');
INSERT INTO `v_document_article` VALUES ('611', '0', '<p>丰宁满族自治县新佛农家院位于河北省丰宁满族自治县大滩镇大滩村后街草原边上，农家院出门口就是无边的草原，可以看到整片的鲜花盛开，远处羊群点点正在悠闲的低头吃着青草。悠闲漫步，身心会得到无比的放松。疲倦早已经无影无踪了。这里没有繁华的高楼大厦，这里没有都市的灯红酒绿，这里也没有尔虞我诈的勾心斗角；这里只有安静祥和的田园牧歌，这里只有生机绽放的朵朵鲜花，这里还有一片你梦想中的天堂。农家院这里天高气爽，云淡风轻，草原上点点白羊，朵朵鲜花，就像是书中所说的伊甸园。</p>', '', '0', '', '', 'zjl1012', '13932445957', '丰宁县', '坝上草原', '397,398,399,400,401,402,403,404,373', '388,392,385,386,387,389,390,391,393,394,395,396', '405,406,407,408,409,411,412,413,414,415', '河北省丰宁县大滩镇后街草原边', '1504074394', '116.653555,41.21468', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('612', '0', '<p>　喇叭沟门农家院位于怀柔北部山区。这里空气清新，气候宜人，素有“天然大氧吧”之美称，是“休闲，避暑，度假”的首选之地。金贵江农家院以绿色，安全，自然，健康为发展主题，自己菜园采取无肥种植，老板朴实敦厚，以诚信服务，广交朋友为自身的经营理念，让各地热爱自然森林的朋友们观赏自然风景的同时感受家的温暖，享受最实在的服务！喇叭沟门农家院真诚欢迎各地出城游玩的朋友到喇叭沟门原始森林游玩！<br/>　　咱家的农家院是新建坡上农家院，农家大院分上下两层，房间宽敞明亮，您既可以在院中就餐也可以坐在农家院二层赏山景品尝特色烤全羊。门口就是原始森林的层层山峦，青翠满眼，层林尽染。为方便您的路途劳顿特色准备了24小时淋浴，高间、标准间及大火炕随您挑选。房间干燥卫生无蚊虫。让您爬山戏耍后香甜轻松入睡。<br/>　　咱家是地道的满族鹰手后裔，诚实守信是我们的文化和传统，满族的特色饭菜是我们拿手戏。随时欢迎您光临品尝咱家的乡村小菜。<br/>　　提供各种烧烤、篝火晚会：烧烤虹鳟鱼、烤全羊、烤羊腿、烤羊肉串等各种烧烤，为游客安排篝火晚会。<br/>　　各式农家饭菜：山野菜、花椒芽、小河鱼、小河虾、柴鸡蛋、贴饼子、菜团子、小米粥全部是取自大自然的无污染食品，应有尽有，丰俭由人。<br/>　　特产：既然在山区，这里的山货自然不少，但这里的鸭子确又很多，而且都是放养的，俗称：下河鸭，不管是炖肥鸭还是咸鸭蛋都十分味美。<br/>　　喝：备有各种白酒、冰镇啤酒、冰镇饮料供游客享用。<br/>　　各种杀猪大菜 【炖排骨】 【炖猪肉或扣肉】【东坡肘子】 【猪头肉】 【溜肥肠】等许多大菜</p>', '', '0', '', '', 'zjl1012', '15711495518', '怀柔区', '喇叭沟', '371,372,373,374,335,334', '361,362,363,364,365,366,367,368,369', '375,376,377,378,379,380,381,382,383,384', '北京怀柔北部山区', '1504074394', '116.628452,40.908622', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('613', '0', '<p><span style=\"font-size:16px;\">大围山位于湖南省长沙市辖的浏阳市东北部。距省会长沙148公里。它以森林茂盛，资源丰富，风景秀丽，气候宜人，而被称为“湘东绿色明珠”。现为国家级森林公园，4A级景区。</span></p><p>\r\n	<span style=\"font-size:16px;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/ac4a1525543847cabaedb78dd46859f8.jpg\" alt=\"大围山赏花游\" width=\"628\" height=\"418\"/><br/></span></p><p>\r\n	<span style=\"font-size:16px;\">　　有关资料上说，长沙汽车东站有发往大围山的车，最早7:30发车。实际上，最早的发车时间是上午10:00.我们一大早起来，吃过早饭，到汽车站一问，才知乘直达车不行!把时间耽误完了。只好先乘去浏阳的车。一个多小时后到达浏阳。然后打车去关口汽车站。那里有去大围山的车。售票员很耐心、很热情。带领我们如厕，上车。又过了一个多小时，车停在一个集镇上，司机招呼我们买包子、豆浆，以备上山食用。</span></p><p>\r\n	<span style=\"font-size:16px;\"><br/></span></p><p>\r\n	<span style=\"font-size:16px;\">　　路上，去大围山的车还真多，大多是自驾车。像我们这样的散客倒是不多。城乡车让我们换乘小面包。我们谈好：上山60元，进入景区大门。途中，司机告诉我们，要上山，还需要另交钱。不然的话，到山顶还有很远，步行需要两三个小时。我们只好再谈价。最后商定：含门票，一共560元。车停在山顶，我们游玩后送我们下山。</span></p><p>\r\n	<span style=\"font-size:16px;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/31c92891297c453bb3a0466a53c49f79.jpg\" alt=\"大围山赏花游\" width=\"800\" height=\"533\"/><br/></span></p><p>\r\n	<span style=\"font-size:16px;\">　　一路上风尘仆仆，山路弯弯，我们终于来到了山顶。放眼望去，群峰连绵，树木苍翠，片片红霞，点缀其间。顿时，令人心旷神怡，呼吸清新。</span></p><p>\r\n	<span style=\"font-size:16px;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/1062b562f4cb405798d6a4ef74a42dff.jpg\" alt=\"大围山赏花游\" width=\"800\" height=\"533\"/><br/></span></p><p>\r\n	<span style=\"font-size:16px;\">　　山很美!天气晴朗，蓝天下，白云悠悠，青山葱郁;树很绿!叶片明光发亮，油彩晶莹。漫山的杜鹃，大多都已经谢了!那杜鹃，红的似火，粉的如霞，紫的像烟，白的胜雪。有的花开正艳，有的叶片脱落，也有的含苞待放。真是各具千秋，精彩纷呈。山道铺在山梁上，全是木板铺设。人们三三两两，或在木道上漫步，或隐身花丛之中，或欢呼跳跃，或你追我赶。全都被这明媚的春光和花样的海洋所陶醉。不愧为浏阳河源，养生天境。</span></p><p>\r\n	<span style=\"font-size:16px;\">　　从七星峰杜鹃花海向下走，不远处就是久负盛名的红莲古寺。晨钟暮鼓，香火正旺。这里曾是佛教和楚文化传播中心。近代改良派政治家、思想家谭翤同也曾在此云游求学，探索富国强民的真理。大革命时期，毛泽东、彭德怀、王首道、胡耀邦等曾在大围山一带留下了光辉足迹。</span></p><p>\r\n	<img src=\"http://img.52njl.net/Image/shanghu/2017/08/17d2ac332fe84e048dd4b2704028ec30.jpg\" alt=\"大围山赏花游\" width=\"800\" height=\"533\"/></p><p>\r\n	<span style=\"font-size:16px;\">　　我们沿着山路往下走，就到了栗木桥生态休闲区。这里最大的特点是飞瀑流泉众多。清澈的山泉飞流直下，一路欢歌。积水成潭，流水潺潺。巨大的树木遮天蔽日，将山道笼罩在树荫下。翠竹片片，景色怡人。奇石怪状，石林仙迹。壮士石硕大无比，神仙足脚印明显。看着这石凳、石径，听着这泉水叮咚，我们怎不纵情山水，怎不物我两忘。</span></p><p>\r\n	<span style=\"font-size:16px;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/0009834fa57747548246ecce2facf9c8.jpg\" alt=\"大围山赏花游\" width=\"800\" height=\"533\"/><br/></span></p><p>\r\n	<span style=\"font-size:16px;\">　　在山上还看到了众多的摄影爱好者在拍大围山的美景，这里是户外运动的天然基地，这里是摄影爱好者的创作场所。</span></p><p>\r\n	<span style=\"font-size:16px;\"><br/></span></p><p>\r\n	<span style=\"font-size:16px;\">　　不知不觉中三个多小时过去了。我们依依不舍中回首。难忘、值得!</span></p><p><br/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('614', '0', '<p><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">常说：“五岳归来不看山”。东岳泰山、中岳嵩山、北岳恒山、西岳华山均已登临，惟南岳衡山向往已久但尚未相见。甚至，好长时间都未搞明白南岳衡山在哪里?长沙岳麓山、韶山韶峰均有说为南岳七十二峰之一，似乎衡山无际。2016年夏末，趁去韶山在长沙逗留间去了衡山，方知衡山主处应在衡阳，那里有它的主峰祝融峰。</span></p><p><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><br/></span></p><p><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">　　从长沙去衡阳衡山很是方便，乘高铁不到一小时可到衡山西站，再转公交20分钟便到汽车站。\r\n 南岳汽车站有联： 咫尺仰衡峰，盖往观巨壑悬崖，人帘山水工如画; \r\n一声鸣铁笛，留不住侠人壮士，夹岸风云去若飞。距汽车站不远的大十字路口有衡山牌坊，高20.4米、宽21.7米，据称我国最大的石牌坊。这是南岳的山门，高大雄伟、气势磅礴，其上方的图案是南岳真形图，民间俗称南岳衡山的山徽朱雀。这是因为在&quot;五岳真形图&quot;中，东岳图是青龙，西岳图是白虎，北岳图是玄武(龟蛇)，中岳图是庙内住土神，而南岳图绘的是朱雀。也有一种说法是相传南岳衡山是中华始祖之一的炎帝神农氏用神鞭打落朱雀变成的，因此朱雀图案就成了南岳衡山的山徽了。山徽上面是&quot;南岳四绝&quot;的浮雕，即祝融峰之高、藏经殿之秀、方广寺之深和水帘洞之奇。</span></p><p style=\"text-align: center;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/8c2fd36c707c4b14949edbc8b7262288.jpg\" alt=\"祝融峰游记\" width=\"680\" height=\"510\"/></p><p><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">　　牌坊四个石柱前后有联四副：“秀气来高宇，看四绝奇观，五岳胜境;文明称奥区，有二贤吟迹，七祖道场。”“天下数名山，五岳之中称独秀; \r\n人文传太古，六朝而后见多姿。”“北望神洲，擎天四岳皆吾友;南来胜景，播誉千秋是此山”“七二峰雾失云迷，好留佳客寻衡岳;九千丈风回寻舞，喜看飞花落洞庭”。在牌坊旁有1路公交车站牌，可免费乘坐到衡山景区大门。</span></p><p style=\"text-align:center;\"><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/6a01d2b5f6934e338ab5f22d16ad9f16.jpg\" alt=\"祝融峰游记\" width=\"628\" height=\"628\"/><br/></span></p><p><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">　　南岳衡山，又名南山、寿岳，是中国五岳之一，位于衡阳市南岳区，旧时汉族民间广泛崇拜的神祇，即南岳衡山君神，道教主流全真派圣地，海拔1300.2米。由于气候条件较其他四岳为好，处处是茂林修竹，终年翠绿;奇花异草，四时飘香，自然景色十分秀丽，因而有“南岳独秀”之美称。清人魏源《衡岳吟》中说：“恒山如行，岱山如坐，华山如立，嵩山如卧，惟有南岳独如飞。”</span></p><p><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><br/></span></p><p><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">　　东汉的郑玄解释说，南岳衡山的名称是根据天上的星宿分野而来的。在上天为管注生死的星宿，在下则管生长发育，南岳衡山象一把秤一样，要保持两头平衡，所以叫&quot;衡山&quot;。因为衡山对应天上28星宿之轸翼，&quot;度应玑衡&quot;，即象衡器一样，可以称量出天地的轻重，也能保持天地间的平衡，能够&quot;铨德均物&quot;，褒扬人间的真善美，惩治人间的假恶丑。2007年中央电视台春晚据此曾出一谜:&quot;一物称起众群峰&quot;。打一名胜，即&quot;衡山&quot;也。</span></p><p style=\"text-align:center;\"><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/3f693866fd6b4e55b90fab1042392f8e.jpg\" alt=\"祝融峰游记\" width=\"628\" height=\"334\"/><br/></span></p><p><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">　　南岳横跨800里，最著名的祝融、紫盖、天柱、石廪、芙蓉被称为&quot;衡岳五峰&quot;。李白诗&quot;回飙吹散五峰雪，往往飞花落洞庭。&quot;杜甫诗&quot;祝融五峰尊，峰峰次低昂。&quot;盖五峰高耸，为衡山的代表。</span></p><p><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><br/></span></p><p><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">　　据传，世界初成时天地刚分，盘古长在天地之间，天日升高一丈、大地日厚一丈，盘古也每日长高一丈。日复一日，年复一年，经过了漫长的一万八千年，天极高，地极厚，盘古也长得极高。最终盘古衰老溘然长逝，刹那间巨人倒地，头变成了东岳，腹变成了中岳，左臂变成了衡山，右臂变成了北岳，两脚变成了西岳，眼睛变成了日月，毛发变成了草木，汗水变成了江河。今天来衡山，也为先祖祭。</span></p><p><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><br/></span></p><p><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">　　人们常常用&quot;福如东海，寿比南山&quot;表达美好的祝愿。&quot;寿比南山&quot;出自于《诗经·小雅》：&quot;如月之恒，如日之升，如南山之寿&quot;，其中的南山指的就是衡山。衡山寿文化源远流长，《星经》载：衡山对应星宿二十八宿之轸星，轸星主管人间苍生寿命，衡山故寿比南山名寿岳。宋徽宗在衡山御题寿岳巨型石刻，现仍存于衡山金简峰皇帝岩。康熙皇帝亲撰的《重修衡山庙碑记》首句即为:衡山为天南巨镇，上应北斗玉衡，也名寿岳，再度御定衡山为寿岳。历代史志也常以比寿之山、主寿之山等称历代衡山。今天来衡山，也为至亲及大众祝寿也。</span></p><p><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><br/></span></p><p><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">　　速游衡山</span></p><p><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><br/></span></p><p><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">　　时间紧，来不及遍登衡山。好在衡山的景区车行的是环道，一趟下来几乎览尽景区所有著名景点。惟到祝融峰前，徒步而上。</span></p><p style=\"text-align:center;\"><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"></span><img src=\"http://img.52njl.net/Image/shanghu/2017/08/f6104ea09ee14feebd4024a3c72b82b9.jpg\" alt=\"祝融峰游记\" width=\"628\" height=\"416\"/></p><p><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">　　祝融峰，海拔1289.8米，是衡山山脉的最高峰和主峰。传说祝融曾在这里游息，峰因而得名。极顶有祝融殿，联曰： \r\n雄镇天南，泽沛三湘沾雨露;气蒸衡岳，芷香四水沐晴岚。其实，一路走来均能阅见名联，例如，上封寺联：“ \r\n望望七十二峰，工部游时，诗圣有谁能继响;遥遥一千余岁，文公走后，岳云从此不轻开。” 水帘洞联:&quot; \r\n北向独不朝，泻千尺银河，溅玉飞珠，相望源头来紫盖;西巡应有恨，弃九重金阙，投龙续命，空寻洞穴问朱陵。&quot; 祝圣寺联;&quot; 五派宗传，衡山正脉;四明法乳，湘水同流。&quot; \r\n等等。</span></p><p><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><br/></span></p><p><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">　　衡山佛教的奠基人是慧思大师，他带领四十余名弟子到衡山，开创般若禅林，弘扬&quot;一心慧思三观&quot;、&quot;定慧双修&quot;的思想，形成自己独特的风格和独到的见解，成为中国天台宗思想的源泉，为衡山佛教、甚至中国佛教打开新天地。</span></p><p style=\"text-align:center;\"><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/f42268f15ea94822af4e114d53118a38.jpg\" alt=\"祝融峰游记\" width=\"628\" height=\"471\"/><br/></span></p><p><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">　　衡山也是中国最著名的道教圣地，其道教文化历史悠久，高道众多，理论宏富，首创宗派，影响深远，是我国的宝贵的人文资源。</span></p><p><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><br/></span></p><p><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">　　衡山书院文化也很发达，始于唐肃宗时，邺侯李泌赐隐于衡山烟霞峰下读书论道，居处藏书极为丰富，相传过三万轴，其后李泌之子李繁为随州剌史时，在衡山建衡山书院(现名邺侯书院)以作纪念，清代曾国藩在《重修胡文定公书院记》中写道:&quot;天下之书院，楚为盛，楚之书院，衡为盛。&quot;此外还有文定书院、白沙书院、紫云书院故址等。</span></p><p><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">　　衡山有绵延有八百里、山峰七十二之说，虽登上主峰祝融峰，后又到岳麓山并见韶峰，但余六十九峰皆未见，对衡山之了解只在表层而未深刻。因此只有“在衡阳”一表，六十九峰“留”于“久”后吧。</span></p><p><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\"><br/></span></p><p><span style=\"font-size: 18px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;;\">　　当日返长沙。</span></p><p><br/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('615', '0', '<p><span style=\"font-size:18px;\">五一假期，带家人带朋友回到桑植县，第一次到了梦中常想去的桑植八大公山，正是鸽子花开的季节，鲜花美景处处都在，温暖笑声时时都在……</span></p><p><br/><span style=\"font-size:18px;\">五月一日中午从吉首出发，一路经历两重天，一忽儿晴天，一忽儿暴雨，下午四点半到达桑植县城，跟我同去的朋友都是第一次来桑植，晚上就住县城里，带他们吃南岔的鱼，观贺龙电站大坝。</span></p><p><span style=\"font-size:18px;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/92ee75a75df248a3a57f0727bb88af37.jpg\" alt=\"五一桑植之行\" width=\"628\" height=\"496\"/><br/></span></p><p><span style=\"font-size:18px;\">五月二日清晨八点准时出发，天气预报显示阵雨，也有朋友建议我们都别上山，雾大，啥也看不到。但我们没有改变行程，老天爷眷顾我们远道而来，一早上就雨过天晴阳光普照，空气格外的清新。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">途中经过洪家关，就先到贺龙故居参观。这个有着革命纪念意义的红色旅游之地，是我80年-83年生活过的地方。正好带着妈妈故地重游，回味我们30多年前的艰苦而又美好生活。</span></p><p style=\"text-align:center;\"><span style=\"font-size:18px;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/56bd1ee377124595a4b0d05642e0f522.jpg\" alt=\"五一桑植之行\" width=\"628\" height=\"417\"/><br/></span></p><p><span style=\"font-size:18px;\">参观完纪念馆已经到了十点，我们沿公路继续前行，途径樵子湾（廖汉生的家乡），沙塔坪，芭茅溪等地方，一路风景美如画，特别迷人，忍不住要停车观景。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">进入自然保护区，一路沿着小溪而行，溪水清澈见底，两岸绿树成荫，阳光照耀，美景目不暇接，朋友们叫嚷嚷着要跳进溪水洗澡。</span></p><p><span style=\"font-size:18px;\">八大公山被国内外誉为“绿色宝库”、“天然博物馆”、“世界罕见的物种基因库”、“天然中华药库”，进入林区，就有工作人员告知进山须知，登记车牌，开始爬山。路边野花朵朵，有的含苞待放，有的昂头怒放，好想下车采一把。车行驶15个回头弯，就到达了接待站，此时已经下午一点了。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">大家早已饥肠辘辘了，幸好电话提前预定了住宿酒店和今天的中餐。一下车，先就餐。在林区，不管是公家酒店还是农家乐，都要携手保护自然区，坚决不能打野味卖野味。朋友们怂恿着喝点酒，经理说刚好还剩点蛇酒，就抱着玻璃坛出来，一条五步蛇正好圈成一团，酒倒了出来，刚好一杯，大家分着喝，尝尝味道，直说“厉害，有点味道，够劲！”</span></p><p><br/><span style=\"font-size:18px;\">饭后稍作休息，两点准时出发。车行两里，放在农户家门口，并订好了晚餐，就在农家乐。我们选择最常走的路爬山到瞭望台。林区为了保护自然，都不修路，所有的路都是踏出来的泥巴路，上面积满了树叶，就像是踩在棉花上，比走水泥路还要舒服。徒步穿越原生性森林，时时您感受着大自然的神奇与美丽。</span></p><p><span style=\"font-size:18px;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/28c010507b3e41af86da33f8ea749a31.jpg\" alt=\"五一桑植之行\" width=\"628\" height=\"314\"/><br/></span></p><p><span style=\"font-size:18px;\">一路可以欣赏到清泉飞瀑，巨石之美，并随时可见稀有树木，奇异花草。相机聚焦忙不停，什么树都想拍，什么花都不放过。风景如画，妙趣横生，笑声不断。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">行至路程一半，就到了珙桐湾，号称世界之最的“珙桐王”就矗立在这里。珙桐观赏堪称“植物界的活化石”，“植物界的大熊猫” \r\n，珙桐花序奇特美丽，花开时满树如鸽群栖立，又名“鸽子花”。这棵珙桐王树太高，也看不到珙桐花盛开的景象，有点遗憾的继续往上爬。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">与大自然亲近的感觉真好，负氧离子多的数都数不通，整个爬山途中不觉的人累，不觉的腿软。从1200米爬到1700米的瞭望台，似乎也没费多少功夫。最值得称赞的是三个70余岁妈妈，都爬到了瞭望台，我家就占了两位。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">山顶用木头建成三层楼高的瞭望台，木梯狭窄陡峭，有恐高症的人绝对爬不上去。我们一行十七个都爬上了瞭望台，全部挤在顶层。登高望远，放眼望去，连绵的森林，层叠的山峦，各种绿色交相辉映，在阳光照耀下闪闪发光，仿若人间仙境，让人感觉心旷神怡。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">下山途中，走了另一条路。一步一景一点也不夸张。都说上山容易下山难，走在落叶的路上，也不难。一边下山一边赏景，吸引我们是争奇斗艳的百花，百怪千奇的植物，清澈透明的溪水，肆意飞溅的山瀑。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">下午五点半，回到了农家乐，丰盛的农家饭菜等着我们了。尽管是三个半小时的行程，大家没有一丝累意，都说是负氧离子做的美。农家饭菜好丰盛，虽没上山珍野味，但有农家自制的腊肉，香肠，腌菜，以及八大公山独有的高山野菜，让我们领略舌尖上的珍馐盛宴，都夸赞比中午宾馆用餐好吃多了。聚会离不开酒，在这样和谐的氛围中，三斤农家自制的蜂糖酒就把我们弄醉了，说说笑笑闹闹，酒醉心明，我们并不是醉在酒里，而是醉在美丽的夜色里。</span></p><p style=\"text-align:center;\"><span style=\"font-size:18px;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/302f2d1a24b94357b13859f15aefd4d6.jpg\" alt=\"五一桑植之行\" width=\"628\" height=\"256\"/><br/></span></p><p><span style=\"font-size:18px;\">酒足饭饱，大家说笑着来到接待处，却见熊熊篝火已经升起，夜空下，篝火晚会开始了。原来是另一个团队包下的篝火晚会，他们有人唱，有人主持，围着篝火跳舞。欢言，笑语，响荡山谷。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">五月三日，清晨，睁开眼，就听见小鸟叽叫的声音，拉开窗帘，却见妈妈一人在房子外面的花园里拍照了。赶紧起床来到花园，生怕错过身边这美丽的景色。也有朋友早起了，用手一边指着一棵树一边跟我说“昨晚我把所有的珙桐树都请来开会了，要他们今天全部开花，这不？全开了！”“什么？”我以为他在开玩笑，抬头一望，真的，就在我住的房间外，珙桐树全开花了，昨天竟都没看到，难道真是为我们而开放的？大家都兴奋了，纷纷起床赏花拍照，这满树的鸽子花，栩栩如生，阳光一照，两片洁白羽毛，真是要飞起来了，漂亮极了！</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">趁着厨房准备早餐之际，我们又走了一段景区。这是顺溪而上，树藤缠绕，鲜花遍地，溪流潺潺，别有另一翻风景。朋友们踩水过溪时有些兴奋，一个不小心打湿了脚，一个为了给大家搬块石头垫脚，手机掉水里了，一个鞋上黏上了一只山蚂蝗，大家都凑上去看热闹，一条狭长幽静的山谷留下了我们的欢声笑语。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">接待处的早餐20元每位，价格有点偏高，但内容也还丰富，野粑耙，馒头，稀饭，面条，米粉样样俱全，剁辣椒任你吃，也幸好有了剁辣椒，才让我们吃的津津有味。9点钟，依依不舍离开了八大公山接待处，朋友们都说，这个地方值得再来，一定也会再来。</span></p><p><br/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('616', '0', '<p style=\"text-align: center;\"><span style=\"font-size:18px;\">对于天门山。之前还傻傻的认为是在张家界景点里的套票就可以看到的景点。还在想，张家界比起其他的地方真心的不错啊，景点有点太多太精了。后来才无情的发现，如果什么跟什么。都是分开的，而且需要的人民币真心还不少啊。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">　　因为前一天下午在张家界归来。所以晚上选择了网上评价不错的天门狐仙。结果也没有让我们失望，真心值得一看的歌舞剧。比起看部分的演唱会还要好看，不过最后就是在淘宝提前买好票，然后就会有人来到你预定的地方接送来回，但需要另外给15元一人的交通费，对于张家界一个这样小的城市来说，真心的如果自己坐公交车过去的话不知道要等到什么时候才是个头，因为走的时候真的很多人，而且公交车不是很多，那边的路也没有搞好，基本都是在基建中，可能配套还没有完善，距离市中心应该有大概10公里左右，而且真的比较偏僻，这车费还是给了吧。</span></p><p style=\"text-align:center;\"><span style=\"font-size:18px;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/52c2df93c63e4421863139ec10b68963.jpg\" alt=\"天门山游玩之旅\" width=\"628\" height=\"353\"/><br/></span></p><p><span style=\"font-size:18px;\">　　我们就住在天门索道公司对面，这里有一个类似小市集的地方，但吃饭的地方真的不错，不过地方比较脏，垃圾场就在大路边，随处都是垃圾，如果对住宿要求比较高的亲就不要选择住在这里了，不过唯一的好处就是明早到天门山坐索道近，有多近，过条马路就是了，后来就在附近绕了一圈最终选择了这一家小龙虾，味道真的不好，而且司机也过来接我们，就随便吃了几口就走了，建议亲不要去，但不知道为什么还是很多人去，可能就是我刚刚说的，真心没有几家好吃的，比我在张家界景区里边吃的还要差。</span></p><p><span style=\"font-size:18px;\">　　吃过饭就进了司机的车到天门狐仙大剧场，同行的是一个当地的家庭，一个媳妇带着小女儿加上爷爷奶奶一起乐融融的。本来以为没有多少人去看的，结果满座率应该有90%，我想旅行团基本就是主力了，天门狐仙的门票是在淘宝上买的，大家如果要来看的建议就先提前买票，便宜很多啊。</span></p><p style=\"text-align: center;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/c88bcd205a1d44819fdde2ac093f9190.jpg\" alt=\"天门山游玩之旅\" width=\"600\" height=\"840\"/></p><p><span style=\"font-size:18px;\">　　表演开始前有人在拉小提琴表演，到了人进场得差不多的时候，狗血的搞了个拍卖行，卖所谓的名家作品，不知道真神还是假鬼，反正我们后排有个人就买了一个，不是很贵，1000多块钱左右吧，但他数都不数就把那一千多的钱一叠给了那个人，让我真心感觉有点假，不过这些看热闹的不关自己事就不要管，反正我关心的是表演到达什么时候才开始啊?</span></p><p style=\"text-align:center;\"><span style=\"font-size:18px;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/ddfdd63ffb9047b3987e008f8bb466f0.jpg\" alt=\"天门山游玩之旅\" width=\"600\" height=\"400\"/><br/></span></p><p><span style=\"font-size:18px;\">　　表演一开始就给这些人震撼到了。这个算是一个和唱团，从头到尾基本都有开头，曝光率仅次而男女猪脚啊~而且中间的大哥唱功真心的不错，能够唱出共鸣，唱到你的心窝里去，配上那凄美的音乐，真心的给感动到了。。</span></p><p><br/></p><p><span style=\"font-size:18px;\">　　灯光 服装 实景 水幕 都是这个舞台剧的卖点，看着五彩十色的灯光，真心的有炫到了。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">　　月亮是用一个很大的LED造成的，不是投影来的，所以女猪脚就在月亮升起的时候从屏幕中先出现了，后来再从后边爬出来。这个设计真的很巧妙，而且造价应该也比较高。这时候天上的射灯射到飞来飞去的小虫身上反光回来，就好像满头都是小星星，美极了。</span></p><p style=\"text-align:center;\"><span style=\"font-size:18px;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/cd62ae153d654ed28a101d1b938d66d5.jpg\" alt=\"天门山游玩之旅\" width=\"628\" height=\"418\"/><br/></span></p><p><span style=\"font-size:18px;\">　　就这样结束了在张家界市区的一晚，看到我想看的，也看到我震惊的，实景歌舞剧在中国现在算是遍地开花，可能有人觉得已经变成艺术的赝品。不过带着一颗旅行的心，用心感受每一样事物，即使再光明的事物也会有阴暗的一面，再阴暗的事物也会有光明的一面。没有阴暗这个世界又可来光明呢?所以心态很重要，我想我一直旅行的过程中就是不断在触动我的心灵，扩宽我的心态。用心去感受这个世界不同的事和物，就这样足矣。。。。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">　　2013年7月8日，早晨张家界，这一年，我的生日在这里过，也是这次旅程的出发点，作为我的生日礼物所以我站在了这里，看到了这里的天空，我的生日愿望不贪心，就希望每一年都可以在不同的地方，看到不同的天空。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">　　不得不赞一下张家界跟天门山景点在门票方面的确下了不少的本钱，防逃跑真的做到家了，需要本人身份证才能买到的电子票，而且还要记录指纹，想逃票的童鞋还是算了吧，怪怪的买下票吧，而且天门山你想逃票的话，就要放弃那号称全世界跨度最大的缆车，好像是7000多米吧，就直接从市中心把你送到景区去，缆车我一般在其他景点都不会坐的，但这里，你不坐貌似没有必要吧，而且感觉天门山就是那种到此一游的景点，虽然有天门洞而且还有踏空玻璃，但回来后，真的有点失望，看到想看的，但没有想过看到的真的没有看到过。。。。</span></p><p style=\"text-align:center;\"><span style=\"font-size:18px;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/3696a861ea72484691dc8ef1e92b049b.jpg\" alt=\"\"/><br/></span></p><p><span style=\"font-size:18px;\">　　天门索道公司，还有最出名的99道拐，如果要去天门洞的话一般都是先直接坐缆车登顶，先参观玻璃栈道跟悬空栈道，后边很多景点，但貌似天门山的卖点就那几天，如果单纯从山的角度出发，天门山周边真的没有什么好看</span></p><p><br/></p><p><span style=\"font-size:18px;\">　　到天门洞的方法是在山顶索道坐回程索道到中站，然后换成景点大巴。天门山的大巴是我看到过最牛的大巴，没有之一，那九十九道拐似乎在考验着每一个公车司机的驾驶技术，很多弯都是仅仅只能一台车通过，而且如果你坐最前的话，你会感觉你迎面而来的压迫感，不是什么，就是已经差不多撞到山上去，有车来的时候要等其他车先过，因为弯道基本不能同时过2台车，还有差不多到90到拐的时候，那个弯我觉得是最接近天堂的公车旅程，感觉整个车就好像在云中穿梭一样，向前看感觉已经没有路了，就好像海上列车一样，海上列车，我在说什么啊，是海贼王看多了吗。。如果你问我天门山给我的记忆最深的是什么，那肯定是天门洞，但如果你问天门山什么最刺激，我会说，你去坐一下接送大巴吧。</span></p><p><br/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('617', '0', '<p><span style=\"font-size:18px;\">　第一天虽然下了一场不小的雨，却给张家界武陵源增添了更多的意境，人间仙境张家界武陵源观了一场雾，思索了一次人生。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">　　张家界其旅游资源堪称世界一流，其中以举世罕见的石英砂岩峰林为主体的武陵源核心景区，由张家界国家森林公园、天子山自然保护区、索溪峪自然保护区、杨家界景区4块区域构成，景区内三千奇峰拔地而起，八百溪流蜿蜒曲折，有“动植物王国”之称，可谓融峰、林、洞、湖、瀑于一身，集奇、秀、幽、野、险于一体，“五步一景，十步一重天”，被中外游人誉为“扩大了的盆景，缩小的仙境”，“中国山水画的原本”，“地球纪念物”等。</span></p><p><span style=\"font-size:18px;\">　　这片仙境，是一种独特的地貌，他的名字就叫张家界地貌，这也是世界上唯一一个以地域来命名的地貌类型，，&quot;张家界地貌&quot;迥异于喀斯特地貌、雅丹地貌、丹霞地貌、河谷地貌。而张家界武陵源核心景区就是这个神奇地貌的诠释者，为我们呈现了绝美风光!</span></p><p style=\"text-align:center;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/6b72b96f18d14362b73557fbbdcee8ca.jpg\" alt=\"武陵源观雾之行\" width=\"600\" height=\"419\"/></p><p><span style=\"font-size:18px;\">　　在张家界武陵源，时常可以看到一些野生猴子，猴子们一点都不怕游人，而且会在各个关卡等候“猎物”，所以大家千万不要拎着袋子进山，尤其是袋子里有看得见的食物，猴子们会一拥而上直接抢去，也不要去逗它们或者怒视他们，猴子会攻击你的。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">　　张家界武陵源在区域构造体系中，处于新华夏第三隆起带，在漫长的地质历史时期内，大致经历了武陵--雪峰、印支、燕山、喜山及新构成了本区域的基本构造地貌格架，而喜山及新构造运动是形成张家界奇特的石英砂岩峰林地貌景观的最基本的内在因素。面外力地质活动作用的流水侵蚀和重力崩塌及其生物的生化作用和物理风化作用，则是塑造张家界地貌景观必不可少的外部条件。因此，它的形成是在特定的地质环\r\n \r\n张家界地貌境中内外力长期相互作用的结果。</span></p><p style=\"text-align:center;\"><span style=\"font-size:18px;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/c55bbbb6f3ee4f1a89662960c86ef79e.jpg\" alt=\"武陵源观雾之行\" width=\"600\" height=\"800\"/><br/></span></p><p><br/></p><p><span style=\"font-size:18px;\">　　对于运动爱好者和年轻人，这样的步道是不是很有“诱惑力”哈哈哈哈!往上走，就是天子山了……</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">　　即将到达贺龙公园前，经过天子阁。这个楼阁由深圳市人民政府捐款修建，“天子阁”三个字由当代山水画、岭南画派大师关山月题写。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">　　有大家云：登阁凭栏，把酒临风。眼收六合苍茫，卷帘一轴锦绣。缠清流而作罗带，饰花果以为佩环。君不见，三千奇峰乱斧劈，八百秀水破川来。虽天公之独厚，亦造物之标新。</span></p><p><span style=\"font-size:18px;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/2e3135d5015946d2878d34e008b54b40.jpg\" alt=\"武陵源观雾之行\" width=\"600\" height=\"450\"/><br/></span></p><p><span style=\"font-size:18px;\">　　这不禁让人想起范仲淹《岳阳楼记》中的名句“衔远山、吞长江，横无际涯;朝晖夕映，气象万千”无论是画面还是诗意，它决不逊色!天子阁是张家界天子山的著名景点，为一人工建筑，在天子阁可以眺望天子山去全景，场面非常壮观。天子阁为六层四重檐穿头式仿古建筑。钢筋混凝土独立柱基，石雕栏杆，花岗岩地面，梓木门窗，金黄琉璃瓦屋顶。登阁远眺，三面临渊，远近群峰山峦尽收眼底。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">　　为纪念贺龙元帅转战天子山，这里建起了一座贺龙公园。公园坐落于天子山上，在千米高的千层岩左侧，一般归类于石家檐游览线。公园内主要游览点有贺龙元帅铜像、兵器馆、贺龙元帅陈列馆、将军碑林(建设中)等。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">　　屹立在&quot;云青岩&quot;上的贺龙铜像与大自然连为一体，形成独特的艺术风格。铜像背负青山，面壁神堂湾，凝重、庄严、和谐地统一在青山绿水的画图中，逼真再现了贺龙元帅的鲜明形象:浓眉大眼，八字胡须，右手小臂提起，握着烟斗，微笑注视着家乡石峰峭壁。身旁一匹好征的战马，昂起头颅，似乎在等待主人扬鞭踏上征途。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">　　贺龙公园一带，是天子山自然保护区，这里的御笔峰，是天子山风景区的最佳景点之一，峰高100余米，数峰参差并列，据说是向王天子兵败时丢弃的御笔所化成的山峰。归类于石家檐游览线。山谷中数十座错落有致的秀峰突起，遥冲蓝天，靠右的石峰像倒插的御笔， \r\n靠左的石峰似搁笔的“江山”。此景变化万千，日照霞染生辉，云雾涌动时隐时现，春月透过花丛，五层峰峦相迭。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">　　御笔峰被公认为是张家界武陵源砂岩大峰林风光的标志景点，不断出现在海内外各种媒体和宣传品上面，堪称天下一绝。本来，这是大自然鬼斧神工的神来之笔，科学上讲是岁月风化、浸蚀、切削的结果，但民间却把它与向王天子联系在一起，说是向王天子殉难后，他的御笔化成石峰，厮守在神堂湾边;而装御笔的“签筒”、“笔架”则留在水绕四门。然而，千古兴亡，时代更迭，“古今多少事，都付笑淡中”。只有这支“御笔”还在!在诗人眼中，好用它来写潇潇洒洒的雾，写多姿多彩的云，写火一般热烈的朝霞，写梦幻般纯洁的月光，写“高处不胜寒”的冰雪世界。当然，也可以写您热恋这方山水或者热恋某位红颜知己的情诗。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">　　御笔峰是张家界武陵源“十大绝景”之一，相传向王天子兵败以后，曾焚毁所有文稿，当他看到这几支御笔时，想到曾经用它们批阅公文，指挥千军万马，如今功败垂成，自己又有何颜面面对家乡父老，于是悲愤地将几支御笔掷落于山谷之中。然而笔通灵气，落地成峰，形成了“御笔峰”。如果在红霞满天的时候来看，御笔熠熠生辉，笔尖还残留着几点朱红墨迹。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">　　但是其实这里是一个观景台，在这里可以看到御笔峰。说是御笔峰，也是一个地质现象，叫石峰。三座石峰直指云天，高低参差有致。因青松巧饰，极像一排倒插的毛笔。御笔峰地质学称其为石峰，是由云台观组石硬砂岩组成，是延两组不同方向垂直节理流水侵蚀和崩塌作用形成。</span></p><p style=\"text-align:center;\"><span style=\"font-size:18px;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/a25e146f9c24444d97a71c300a7e1394.jpg\" alt=\"武陵源观雾之行\" width=\"600\" height=\"450\"/><br/></span></p><p><span style=\"font-size:18px;\">　　附近仙女献花、舌子岩等景点。其中舌子岩是一道悬挂在空中的石峰，常浮于云海之御笔峰景点中，附近又有寸步难行景点，是两山间的夹缝，缝下是万丈深渊，故称寸步难行。仙女献花为一石峰，宛若一仙女手捧鲜花含笑献给游人。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">　　在这里可以很清楚的看到后面的御笔峰。张家界的景色三分形似，七分要靠游人的想象，这里的景色算是比较形似的，基本不用靠什么想象。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">　　张家界武陵源风景名胜区内植物分布呈现多样性、过渡性、垂直性和古老性以及石峰上植被繁茂、种类繁多等特点。树种以乔木为主，乔木、灌木和草木相混生;以常绿为主，常绿、半常绿和落叶并存;以天然林为主，天然林与人工林相间;以阔叶林为主，阔叶林与针叶林相混生。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">　　往百龙天梯方向继续走，经过天下第一桥。这是一座天然石桥，位于张家界袁家界景区，处砂刀沟风景区一带，属张家界精华景点。桥高350米，是张家界最高的石桥。此桥的高度、跨度和惊险均为天下罕见，故称“天下第一桥”。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">　　大自然的鬼斧神工，将一块厚约5米的天然石板，横空“架”在两座山峰之上，把东西两峰连接。桥高350米，是张家界最高的石桥。高度、跨度和惊险均为天下罕见，故称“天下第一桥”。</span></p><p><br/></p><p><span style=\"font-size:18px;\">　　电影阿凡达中的那个悬浮山北京也是取自于此处，就是下图二的那个高耸的山峰，看着是不是很眼熟的感觉……</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">　　也许有朋友发现了，阿凡达背景的原型就是张家界武陵源，就是此处。</span></p><p style=\"text-align:center;\"><span style=\"font-size:18px;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/343bd5912ee1455a989dcf62c5b8fe3a.jpg\" alt=\"武陵源观雾之行\" width=\"600\" height=\"399\"/><br/></span></p><p><span style=\"font-size:18px;\">　　游览完阿凡达原形背景悬浮山之后，就要返程了，不然赶不上最后一趟百龙天梯了。从迷魂台停车场乘坐环保车抵达百龙天梯，百龙天梯下站，然后乘坐环保车到吴家峪门票站，第一天的行程就算是完美结束了。</span></p><p><span style=\"font-size:18px;\"><br/></span></p><p><span style=\"font-size:18px;\">　　这是&quot;世界上最高的全暴露户外观光电梯、世界上最高的双层观光电梯、世界上载重量最大、速度最快的观光电梯&quot;，这三项桂冠也让它独步世界，被载入基尼斯世界纪录，百龙天梯是自然美景和人造奇观的完美结合。</span></p><p><br/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('618', '0', '<p><span style=\"font-size:18px;\">密云水库位于北京市密云县城北13公里处，位于燕山群山丘陵之中，建成于1960年9月份。面积180平方公里，环密云水库有200公里。密云水库库容40亿立方米，平均水深30米，是首都北京最大的也是唯一的饮用水源供应地。密云水库有2大入库河流，分别是白河和潮河。</span></p><p>\r\n	<span style=\"font-size:18px;\"><br/></span></p><p>\r\n	<span style=\"font-size:18px;\">　　密云水库是亚洲最大的人工湖，有“燕山明珠”之称。围绕水库还有一条110公里长的环湖公路，是京东旅游风景区之一。库区夏季平均气温低于市区3℃，是一处避暑胜地。密云水库特产野生密云水库鱼，是北京著名的鱼乡。</span></p><p>\r\n	<span style=\"font-size:18px;\"><br/></span></p><p>\r\n	<span style=\"font-size:18px;\">　　我们选择的是早上七点半就出发了，然后带了点零食，中午饭大概两点左右吃，这应该是刚好的路线，大家有兴趣可以借鉴一下。出发之后走京承高速，市里过去90多公里。那里有好多条进水库的路，别的我不是很清楚，我们是从一个武警守卫的关口一个工作人员帮我们带进去的。密云水库毕竟掌握着北京的水脉，好多地方是不让进的，但是当地人会有办法带你进去，只要给个20块钱就差不多了。他们会把你带进大坝，大坝进入的时候要部队的通行证或者领导的指示，个人进肯定不会让，但是当地人他们会有办法的。</span></p><p>\r\n	<br/></p><p>\r\n	<span style=\"font-size:18px;\">　　水库边上，还没有进坝，远看燕山近看水库，加上蓝天云朵点缀，身在其中心旷神怡。</span></p><p style=\"text-align:center;\">\r\n	<span style=\"font-size:18px;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/cd3e0b828c52417fb56b6896e88de219.jpg\" alt=\"密云水库自驾游 去密云水库吃鱼啦！\" width=\"628\" height=\"417\"/><br/></span></p><p>\r\n	<span style=\"font-size:18px;\">　　左手边就是密云水库的大坝，看上去还是挺搭调美观的</span></p><p>\r\n	<br/></p><p>\r\n	<span style=\"font-size:18px;\">　　大坝的另一面，底下是大坝背面的广场，下面有仰视图。远处那条小河一样的就是传说中的京密引水渠，北京市内的水都是通过它从密云水库引到各家各户的</span></p><p>\r\n	<span style=\"font-size:18px;\"><br/></span></p><p>\r\n	<span style=\"font-size:18px;\">　　从大坝上俯视背面，可见密云水库的深度还是足够的。也感叹工人们建立这样一座人工水库的不容易，为北京存储了宝贵的水资源!向他们致敬!!</span></p><p>\r\n	<span style=\"font-size:18px;\"><br/></span></p><p>\r\n	<span style=\"font-size:18px;\">　　走到大坝底下，仰视天空和坝顶，二者好像离得很近，和前几张刚进水库时的天高气爽形成了鲜明的对比。能进入大坝的人们本来就在少数，所以看不到什么人，也恰恰和人山人海的北京形成了反差，如果跟不知道的人说这样的场景在北京，他们会不会信呢?</span></p><p style=\"text-align:center;\">\r\n	<img src=\"http://img.52njl.net/Image/shanghu/2017/08/336dd014d94f4fb6b88c4b975f141d4e.jpg\" alt=\"密云水库自驾游 去密云水库吃鱼啦！\" width=\"628\" height=\"352\"/></p><p>\r\n	<span style=\"font-size:18px;\">　　走出大坝，是一块密云水库纪念碑，上面有关于密云水库从提出到设计到修建到维护的所有历史经历和过程，还有各界领导人给密云水库的题词，可见密云水库的战略地位之重!整个坝区都是武警战备值班，真枪实弹，威严雄壮。</span></p><p>\r\n	<span style=\"font-size:18px;\"><br/></span></p><p>\r\n	<span style=\"font-size:18px;\">　　大家出了大坝一定要去找这个地方!这是在密云水库武警军营旁边的一个码头。每天都会有观光巡逻船，这些船游客是可以登上去参观的，它会带大家在密云水库中游览一圈。但是这个船开行时间不固定，而且风大或者下雨就会停驶，如果能赶上真是运气很棒。我们上次去就刚好赶上开船，几乎是最后一批乘客登的船，下面的照片是从船上看到的密云水库</span></p><p>\r\n	<span style=\"font-size:18px;\"><br/></span></p><p>\r\n	<span style=\"font-size:18px;\">　　密云水库中远观群山</span></p><p>\r\n	<span style=\"font-size:18px;\"><br/></span></p><p>\r\n	<span style=\"font-size:18px;\">　　回首遥望水库大坝，这次感觉没有那么雄伟的感觉了，仿佛一堵墙挡住了去路</span></p><p style=\"text-align:center;\">\r\n	<span style=\"font-size:18px;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/1a1ebb5759d9491e84eb04a710560df9.jpg\" alt=\"密云水库自驾游 去密云水库吃鱼啦！\" width=\"628\" height=\"353\"/><br/></span></p><p>\r\n	<span style=\"font-size:18px;\">　　近观水库水，真的很清澈，现在能找到这么纯净的湖泊已经很难了，更何况在北京周边。好好珍惜这来之不易的资源吧。将它作为纯净之旅的结尾，真是赏心悦目</span></p><p style=\"text-align:center;\">\r\n	<span style=\"font-size:18px;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/c95ea8f920f947ddb9e0cb82f051f5de.jpg\" alt=\"密云水库自驾游 去密云水库吃鱼啦！\" width=\"628\" height=\"418\"/><br/></span></p><p>\r\n	<span style=\"font-size:18px;\">　　午餐</span></p><p>\r\n	<span style=\"font-size:18px;\"><br/></span></p><p>\r\n	<span style=\"font-size:18px;\">　　游赏完以上行程，时间已经一点多了。这时候离开水库，附近的饭店特别多，都是吃水库鱼的。如果大家选择在当地吃，一定要找门口排队的或者车停的满的，一般这样的饭店都是当地做法正宗且价格合理的。或者是提前预定好这里的农家院，特别是住宿一定要提前预定，经济实惠。一天的行程圆满结束。</span></p><p><br/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('619', '0', '<p><span style=\"font-size: 18px;font-family: 微软雅黑, &#39;Microsoft YaHei&#39;\">今天就由小编来为各位分享一处旅游好去处——京西坝上草原。那么坝上草原在哪呢？又有那些路线呢？特此推荐京西坝上草原旅游攻略给大家，让您尽情享受青山秀水、绿地和风光无限。</span></p><p style=\"text-align: center\"><img src=\"http://img.52njl.net/Image/shanghu/2017/06/dafc782e5e1742f6bf2e43e8c0af2a38.jpg\" alt=\"\"/></p><p><span style=\"font-size: 18px;font-family: 微软雅黑, &#39;Microsoft YaHei&#39;\">坝上草原在哪？位于北京西北部，与八达岭长城毗邻。京西草原是距离北京最近的大草原与康西草原实为一体，占地9万亩为京都第一大草原。它西邻官厅水库，北依海坨山与八达岭长城毗，野花吐艳风景宜人。 </span></p><p style=\"text-align: center\"><img src=\"http://img.52njl.net/Image/shanghu/2017/06/78ff3f7b7bc44dd69ac3242e0b677912.jpg\" alt=\"\"/><br/></p><p><span style=\"font-size: 18px;font-family: 微软雅黑, &#39;Microsoft YaHei&#39;\">景点特色：</span></p><p><span style=\"font-size: 18px;font-family: 微软雅黑, &#39;Microsoft YaHei&#39;\">辽阔的京西草原处处可见成群的牛羊，一座座蒙古包点缀在绿色的草原上构成一副天然的画卷。 在京西草原上，您可以豪情万丈放马驰骋，也可以骑着骏马到美丽的野鸭湖欣赏湖光美景。有山有水的旧怀来县城更是游客们乘坐快艇兜风的好去处。在这里您不但能够看到蜿蜒起伏的万里长城，还可以一睹古锋火台和望花楼等古迹的风采。 </span></p><p style=\"text-align: center\"><img src=\"http://img.52njl.net/Image/shanghu/2017/06/39ad416f4ce148ed9d2f1594917fa113.jpg\" alt=\"\"/><br/></p><p><span style=\"font-size: 18px;font-family: 微软雅黑, &#39;Microsoft YaHei&#39;\">游玩娱乐：在这里你可以尽情骑马奔跑、来体验一次越野车的奔放，享受钓鱼、篝火的休闲与浪漫，还有汽艇、沙滩摩托等娱乐设施。</span></p><p style=\"text-align: center\"><img src=\"http://img.52njl.net/Image/shanghu/2017/06/23d2cc1724484e4ab1669c1dce81fd1d.jpg\" alt=\"\"/></p><p><span style=\"font-size: 18px;font-family: 微软雅黑, &#39;Microsoft YaHei&#39;\">住宿：京西草原食宿方便，以农家院为住，您可以在哪里吃到农家饭菜，活鱼鲜虾，山中野菜、烤全羊和清炖柴鸡手艺等。农家院住宿有干净的农家院，有太阳能洗浴和卫生间。</span></p><p style=\"text-align: center\"><img src=\"http://img.52njl.net/Image/shanghu/2017/06/a40f19e5250f49f5acfb33879592c990.jpg\" alt=\"\"/></p><p><span style=\"font-size: 18px;font-family: 微软雅黑, &#39;Microsoft YaHei&#39;\">景点路线：</span></p><p><span style=\"font-size: 18px;font-family: 微软雅黑, &#39;Microsoft YaHei&#39;\">公交：从北京出发经八达岭高速驶过八达岭后，在东花园高速出口下。左转前行100米再右转行驶官康公路前行2公里多看到太师庄牌坊开始左转直行到太师庄。</span></p><p><span style=\"font-size: 18px;font-family: 微软雅黑, &#39;Microsoft YaHei&#39;\">自驾线路：</span></p><p><span style=\"font-size: 18px;font-family: 微软雅黑, &#39;Microsoft YaHei&#39;\">北京出发从德胜门长途车站坐919支到康庄下车到太师庄（打车25元左右建议乘坐919支），换乘面的到太师庄或者乘919直达汽车到延庆东关，换乘面的到太师庄。（打车50元左右）</span></p><p><span style=\"font-size: 18px;font-family: 微软雅黑, &#39;Microsoft YaHei&#39;\">来京西坝上草原，草原的夜晚凉习风阵阵繁星点点，宁静的夜晚可以让您从内心深处感到放松和惬意。</span></p><p><br/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('620', '0', '<p style=\"text-indent: 2em; line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	红螺山上红螺寺景区位于北京市怀柔区城北5公里的红螺山南麓，距北京市区55公里，景区总面积800公顷，国家AAAA级旅游区。</span></p><p style=\"text-indent: 2em; line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	红螺寺始建于东晋咸康四年(公元338)年，原名“大明寺”(明正统年间易名“护国资福禅寺”，因红螺仙女的美妙的传说，俗称“红螺寺”)。</span></p><p style=\"text-align: center; text-indent: 2em; line-height: 2em;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/b94b51da80734c77b27b335fb8abf15d.jpg\" alt=\"\"/></p><p style=\"text-indent: 2em; line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	红螺寺坐北朝南，依山势而建，布局严谨，气势雄伟。它背倚红螺山，南照红螺湖，山环水绕，林木丰茂，古树参天。红螺寺处于红螺山山前的千亩苍翠的古松林之中，形成一幅“碧波藏古刹”的优美的画卷。</span></p><p style=\"text-indent: 2em; line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	御竹林</span></p><p style=\"text-indent: 2em; line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	山门前的这片竹林为元代云山禅师所栽植，距今已有600多年的历史。据《怀柔县志》记载：清康熙32年(公元1694年)圣驾红螺寺降香，看到这片翠绿的竹林倍感新奇，即令身边的官员清点竹子的数量为613株，临走前叮嘱寺内的僧人和当地的官员要对竹林善加保护，以便他常来观赏，后来人们就称这片竹林为“御竹林”。在竹林西北角还有一个照原样恢复的“观竹亭”，当年清康熙帝就曾在原亭内设御座赏竹。红螺寺竹林四季常青长势茂盛，有竹约百万株，被称为“红螺三绝景”之一。</span></p><p style=\"text-align: center; text-indent: 2em; line-height: 2em;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/90ca0499f8694fac9dff90264d5a461c.jpg\" alt=\"\"/></p><p style=\"text-indent: 2em; line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	雌雄银杏</span></p><p style=\"text-indent: 2em; line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	大雄宝殿前有两棵古银杏树，东边的雌树清秀矮小些，西边的雄树高大粗壮，这棵雄的银杏树，树龄在1100年以上，树高30多米，整个树的围度达到7米之多，虽逾千年但生机不减。每年春天雄树开满淡黄色的小花，秋天不见果实，而雌树每年春天不见花开秋天却果实累累，人们觉得它们象天作一双、珠联璧合的夫妻，所以也称他们为夫妻树。</span></p><p style=\"text-indent: 2em; line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	五百罗汉园</span></p><p style=\"text-indent: 2em; line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	五百罗汉园坐落在寺东千亩松林中，占地20公顷。500尊罗汉像是由青石材质真人比例雕刻而成，并以高5米的汉白玉大石佛为中心分10组分布排列，他们或坐或立，相貌神态各异，形成了一组大型佛教艺术雕塑群。</span></p><p style=\"text-align: center; text-indent: 2em; line-height: 2em;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/cf1c5a4c3dde4da48ec2999e068299c8.jpg\" alt=\"\"/></p><p style=\"text-indent: 2em; line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	交通方式</span></p><p style=\"text-indent: 2em; line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	自驾车路线</span></p><p style=\"text-indent: 2em; line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	1、京承高速怀柔14号出口离开高速。</span></p><p style=\"text-indent: 2em; line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	2、出收费站靠右行，离开京密高速进入辅路。</span></p><p style=\"text-indent: 2em; line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	3、直行5km，到开放环岛绕环岛左转，怀柔城区方向(4号)。进入开放东路。</span></p><p style=\"text-indent: 2em; line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	4、第一个红路灯(行政中心路口)右转。</span></p><p style=\"text-indent: 2em; line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	5、右转后第四个红路灯(北大街西口)左转。</span></p><p style=\"text-indent: 2em; line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	6、第二个环岛右转，行驶5km到达。</span></p><p style=\"text-indent: 2em; line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	公交车乘车路线</span></p><p style=\"text-indent: 2em; line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	路线一：东直门站换乘厅乘867路红螺寺专线车直达景区。</span></p><p style=\"text-indent: 2em; line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	路线二：东直门站换乘厅乘坐916快车到达怀柔汽车站，出汽车站红路灯右转右手边乘坐862路(窗前写有回站不能做)。到于家园(路口北)(于家园有两站，路口北和路口南，第二个下)。原地换乘H17或867路或打车前往。</span></p><p style=\"text-align: center; text-indent: 2em; line-height: 2em;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/523243148cdb4cfc911aa84de0fbbb11.jpg\" alt=\"\"/></p><p style=\"text-indent: 2em; line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	住宿条件</span></p><p style=\"text-indent: 2em; line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	四合院坐落在寺院东南的青龙山与凤凰山间的千亩松林之中，有龙凤呈翔之瑞。松树散发的“芬多精”对许多种疾病能发挥很好的理疗作用，是一处天然的疗养院、巨大的健身房。这里有大小五个四合院，古典回廊式建筑，设有标准间、套间、豪华间、单人间和小独院。房内设有空调、独立卫生间、彩色电视、电话等，套间和豪华间加设保鲜柜、沙发、地毯等。四合院共有42个房间、70个床位。</span></p><p><br/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('621', '0', '<p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p><br/><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 20px;\">厚德福老宅旅游接待中心</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">爨底下农家院厚德福老宅农\r\n \r\n家院位于门头沟斋塘镇爨底下民俗村。厚德福老宅是爨底下民俗村仅有两个财主院中唯一开放的院落。在日军侵华的时候厚德福老宅曾被焚毁，新中国成立后主人按照家中老人的叙述把院落修饰，古典而雅致的砖雕。爨底下厚德福老宅木雕与石雕的完美结合有能让您重拾明清的古文化勘察书写绘画的圣地。爨底下厚德福老宅周\r\n \r\n边景点如诗如画，青龙群山，虎山，龟山，蝙蝠山整村因山就势，精巧而不油滑，尊荣而无淫威。把六朝余粉与北地胭脂巧妙的融与一炉这里就是京郊爨底下，与山村好一朵文化燕山上的茉莉花，一朵北国的建筑奇葩。而且本院有遗留下明清时期的地窖，可以存放蔬菜和饮料。集食宿娱乐为一体的厚德福老宅农家院是您到爨底\r\n \r\n下的首选之地。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><img src=\"http://img.52njl.net/Image/bj/shanghu/2017/06/71a0447d49524bb6aebeb248dd6594bd.jpg\" title=\"双龙峡农家院.jpg\" alt=\"双龙峡农家院.jpg\"/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">交通路线</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">自驾路线</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">沿109国道至西斋塘前方有爨底下的牌子直走既到.到村电话联系</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">公交路线</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">1、苹果园地铁坐892到爨底下;上午7:30 中午12:30 一天两趟车可直达爨底下;其余20分钟一趟892终点斋堂镇下车可以打车20元去爨底下村; \r\n2、坐892支至斋堂下车,打车去爨底下20元&lt;约6公里&gt;</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><img src=\"http://img.52njl.net/Image/bj/shanghu/2017/06/4212b941ea9a43ae8a89dae908aa107b.jpg\" title=\"双龙峡附近农家院.jpg\" alt=\"双龙峡附近农家院.jpg\"/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">住宿信息</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">住宿设施：可提供40人的住宿：两套院落客房共10间。双人标间150元/间、四人标准间150元/间、双人普通间80元/间、四人普通间30元/人房屋设备：电视，24小时热水淋浴，无线wifi上网。\r\n \r\n餐饮设施：还可以同时提供100人同时就餐。提供100 人包桌。农家特色菜: \r\n侉炖鲤鱼，焖酥鱼，柴鸡炖山蘑、炸焖小鱼、小虾、人情菜、曲曲菜、炸花椒芽、炸香椿鱼、炖野兔、猪肉炖豆角干、肉炒木兰芽、香椿摊鸡蛋、肉炒厥菜、乱炖、沙锅类、炸杏仁、各种野菜;农家主食：贴饼子、菜团子、葱花饼、野菜水饺、家常饼、玉米粥、大豆米饭、土豆丝饼、面条;烧烤类：烤全羊、烤羊腿、烤羊肉串\r\n \r\n等各种烧烤; 景点游玩项目：一线天、爨柏景区，明清古宅、娘娘庙、关帝庙、北京的小布达拉宫; 农家游玩项目：棋牌，麻将，卡拉OK，篝火。 \r\n周边景点：灵山、百花山、珍珠湖、斋堂水库、双龙峡等景点。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><img src=\"http://img.52njl.net/Image/bj/shanghu/2017/06/f6e425d6f5aa4d599e6116a0080c0643.jpg\" title=\"双龙峡农家院住宿.jpg\" alt=\"双龙峡农家院住宿.jpg\"/></span></p><p><br/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('622', '0', '<p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 20px;\">双龙峡自然风景区</span><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">是京西新开发的一个风景区，位于门头沟区斋堂镇火村南2.5公里的青山翠谷中。双龙峡自然风景区主体形象概括为六句话应该是：十里溪流 百潭瀑布 \r\n千亩红杏 万顷林海 青山翠谷 世外桃源苍山如海，峰峦巍峨俊秀，被喻为“小九寨”、“百瀑布”。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">景区水资源丰富，小流域气候温暖潮湿，林木繁茂，动植物物种丰富。整个景区植被覆盖率达到95%。最高峰老龙窝海拔1646米，形成29米以上的大瀑布两个，几米以下的小瀑布近百个，天河、水潭、绿谷、红岩组成一幅幅靓丽的美景。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><img src=\"http://img.52njl.net/Image/bj/shanghu/2017/06/11d3390733734662ab483b437e980bb2.jpg\" title=\"双龙峡风景区.jpg\" alt=\"双龙峡风景区.jpg\"/><br/></span></p><p><br/><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">春天山花烂漫，幽香扑鼻;夏日满谷清凉、小溪潺潺、泉水涌流，背阴处冰肌绿树相映成趣，古杨、古柳、百年猕猴桃、山葡萄林遮天蔽日、缠绕其间，宛如热带雨林一般;金秋时节秋高气爽，满山红叶在蓝天白云的映衬下更是美不胜收。冬天，冰瀑洁白如玉、气势壮观，令人流连忘返。在这里，您还可以体验到惊险刺激的原始森林等山探险;乘坐独特的森林小火车，行驶于山间，花香迎面而来令人心神怡，犹如仙境。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">可以欣赏的主要景点有：玉龙湖、清幽湖、坐听双琴、仙女湾、第一瀑布(高29.7米、宽5米)、千蛙蜂、七音瀑、双龙入水、小九寨沟、琴玉潭、三百年野生猕猴桃、仙女梳头、双龙戏龟、青蛙石、二百年野生猕猴桃仙聚柳、送仙松、第二瀑布(高30米、宽10米)、原始森林。第一瀑布至第二瀑布山谷内，沿溪流、山径，藤蔓植物与灌木、乔木纠缠盘结，形成约五公里长的天然植物走廊，郁郁葱葱，号为“藤萝谷”，为双龙峡一大奇观。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">游人至此恍如人间仙境，世外桃源，无不立觉心清气爽。双龙峡还有许多具有观赏、药用、经济价值的植物。如软青枣、山桃、映山红、报春、胭脂、丁香、野花椒、玫瑰、绣红菊、黄芩益母草、六道木、柴胡、桔梗、百合、野草莓等。游客在不同季节可以观赏。除观赏自然风景之外，在每年的六月底七月初可以采摘火村的特产大红杏。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><img src=\"http://img.52njl.net/Image/bj/shanghu/2017/06/9a4cc133ca794651aba227d9b5ba93ce.jpg\" title=\"双龙峡景区门票.jpg\" alt=\"双龙峡景区门票.jpg\"/><br/></span></p><p><br/><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">客房是独立卫生间的双人间和三人间，可接待100多人入住。夜幕降临，在灿烂的星空下，燃起熊熊篝火，燃放鞭炮烟火，跳起欢乐的舞蹈，唱着抒情的歌曲，您将会忘记旅途疲劳兴奋地度过乡村宁静的夜晚。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><img src=\"http://img.52njl.net/Image/bj/shanghu/2017/06/2d8f4e3a2842485bb8aa79b21c372ce7.jpg\" title=\"双龙峡旅游攻略.jpg\" alt=\"双龙峡旅游攻略.jpg\"/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">交通指南：</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">自驾游线路： \r\n1、沿西五环衙门口桥上莲石西路，往门头沟方向至石门营环岛右转直行，穿过双峪环岛一直沿109国道往河北、斋堂方向行驶。途经水闸、龙泉雾、下苇店、王平村、芹峪口、雁翅、军响、东胡林至火村见路标左转进入双龙峡景区。(全程80公里) \r\n2、沿阜石路行至门头沟双峪环岛右转沿109国道往河北、斋堂方向行驶。途经水闸、龙泉雾、下苇店、王平村、芹峪口、雁翅、军响、东胡林至火村见路标左转进入双龙峡景区。(全程80公里)</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">公交车线路： \r\n苹果园地铁站往西200米,乘坐929支线(8:20的929支线直达景区)到火村口下车,由班车直接接入景区,或一路踏青步行2.5公里到达景区。</span></p><p><br/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('623', '0', '<p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">双龙峡风景区</span><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">位于京西门头沟斋堂镇火村南2.5公里。距北京市区78公里。景区概括为：“十里溪流、百潭瀑布、千亩红杏、万顷林海。”真可谓青山翠谷，峰峦巍峨俊秀。到了夏季山花遍地，溪水潺潺好一派北国秀色，所以又有“小九寨”之称。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><img src=\"http://img.52njl.net/Image/bj/shanghu/2017/06/29bdec9043be4c12bcb6827573c9e2c9.jpg\" title=\"双龙峡农家院住宿.jpg\" alt=\"双龙峡农家院住宿.jpg\"/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">灵水举人村文林农家院</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">文林农家院位于举人村51号,小院干净整洁,主人热情好客.小院内既有双人间,又有三人间;既有普通客房,又有农家土炕,同时配有24小时热水淋浴、空调、电视、卫生间等设施. \r\n农家院环境优雅、空气清新自然,春天鲜花开放、夏日凉爽舒适、秋天果香阵阵、冬天瑞雪皑皑, 是访古探幽、休闲娱乐的好去处.</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><img src=\"http://img.52njl.net/Image/bj/shanghu/2017/06/b5f82b22d7724569b11bd88449bef4b7.jpg\" title=\"双龙峡游玩.jpg\" alt=\"双龙峡游玩.jpg\"/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">交通路线</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">自驾路线</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">阜石路向西到门头沟双峪环岛右转进入109国道，沿109国道向西,至军响加油站右拐,前行2.5公里.</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">公交路线</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">苹果园地铁站西200米,乘坐892路(苹果园—斋堂),到军响站下车,一路步行2.5公里或打车前往.</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">咨询电话：13683179467</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><img src=\"http://img.52njl.net/Image/bj/shanghu/2017/06/4ee2161e8fde43a4a438177d691a7c29.jpg\" title=\"双龙峡住宿.jpg\" alt=\"双龙峡住宿.jpg\"/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">地址：北京 门头沟 斋堂镇 灵水村</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">找农家乐、农家院,就上52农家乐网,52农家乐汇集了全国所有旅游景点以及周边农家乐、农家院的电话、公交、地址、地图、打折活动、农家乐、农家院简介、城市地区周边农家乐、农家院攻略等信息,同时聚合了众多网友对农家乐、农家院的相关点评、游玩经验、省钱攻略等内容。</span></p><p><br/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('624', '0', '<p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">来北京游玩一定要去长城，俗话说”不到长城非好汉”，52农家乐网为您推荐八达岭<span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 20px;\">水关长城</span>景区，值此一游。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><img src=\"http://img.52njl.net/Image/bj/shanghu/2017/06/5a42b669fbfd4172bf2e90d9f97295d9.jpg\" title=\"水关长城.jpg\" alt=\"水关长城.jpg\"/><br/></span></p><p><br/><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 20px;\">水关长城</span><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">是八达岭长城的东段部分，这段长城建于险谷口，自水门箭楼长城呈“V”字型，顺应山势而行，如巨龙似鲲鹏展翅欲飞，箭楼即是敌楼同时兼具水门功效，这种建筑方式在沿线长城中极为罕见，故名水关长城。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">关沟里走，关沟里过，八达岭水关长城[2]\r\n \r\n就坐落在延庆区八达岭镇石佛寺村。它始建于明代，通过修整后于1995年对外营业，景区特色为古代军事防御工程，为防御外寇入侵，以水据敌，形成关口，是古代战场上罕见的古代建筑，水关长城也因此而得名。如果您喜欢爬长城，那么这段以险峻著称长城则可去可不去。水关长城修建于明代，是八达岭长城中保存最精固的一段。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><img src=\"http://img.52njl.net/Image/bj/shanghu/2017/06/0c6797e8a5bb41618e88fcd02ba206ca.jpg\" title=\"水关长城风景.jpg\" alt=\"水关长城风景.jpg\"/><br/></span></p><p><br/><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">位于北京市西北40公里，此段长城是八达岭长城东段，因修建中国第一条自主设计的京张铁路而截断。水关长城是明长城的遗址，由抗倭名将戚继光督建，距今有四百余年历史。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">此段长城建于险谷口，自水门箭楼长城呈“V”字型，顺应山势而行，如巨龙似鲲鹏展翅欲飞，箭楼即是敌楼同时兼具水门功效，此种建筑方式在沿线长城中极为罕见，故名水关长城。水关长城地势险要，苍龙起伏于崇山峻岭之间，穿行于悬崖峭壁之上，城堡相连，烽燧向望，双面箭垛，拒敌万千。水关长城东起“川字一号”，西至京张铁路，全长6.8公里，以奇、险、陡、坚著称。八达岭水关长城地处关沟中部，七十二景似明珠般散落于长城四周，弹琴峡、金鱼池、石佛寺、骆驼石等诸多景点融于方圆500米空间，为游客提供丰富的旅游资源。长城四季美如画，春看山花烂漫，夏览草木蓊郁，秋观漫山红叶，冬游苍龙卧雪。这里山清水秀长城壮美，人杰地灵古寺清幽。到了春天看长城两侧山花烂漫，远处长城悠远入云烟，你将充分的体会到中华民族的伟大。顺着长城西行三千米，您又将看到中国第一条铁路“京张铁路”及“人”字型铁道，去瞻仰詹天佑衣冠冢，领略近代伟人风采。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><img src=\"http://img.52njl.net/Image/bj/shanghu/2017/06/7f85de8bc9b2484b9ad41573338fd322.jpg\" title=\"水关长城旅游攻略.jpg\" alt=\"水关长城旅游攻略.jpg\"/><br/></span></p><p><br/><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">水关长城于1995年正式对外开放，现为国家4A级旅游景区，迄今已接待游人1500余万人次。篮球巨星乔丹、F1赛车手蒙托亚都曾到水关长城观光游览，香港演艺界巨星刘德华演唱的《中国人》背景即为水关长城。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">到水关长城来吧!这里将以独特的自然风光，优质的服务，多层次的知识面为您展现中华民族五千年的悠久历史，把古代、近代、现代三个不同时期最能代表中华民族才智的代表作展现在您面前，让您充分领略五千年文化的丰富内涵。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><img src=\"http://img.52njl.net/Image/bj/shanghu/2017/06/49a3c4260f4e43758e65c1ac69723fcc.jpg\" title=\"水关长城门票.jpg\" alt=\"水关长城门票.jpg\"/><br/></span></p><p><br/><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">正关箭楼高15.63米，平均宽度12米，城墙用青石条砖依山而筑，当年山东、四川工匠修建时的界碑如今还依稀可见。山坡奇峰怪石、险峻陡峭，登上长城极目远眺，万里长城犹如一条巨龙，飞舞在秋意盎然的山岭间。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><img src=\"http://img.52njl.net/Image/bj/shanghu/2017/06/c16a06c55a9a46c8a8b0784de1d21e39.jpg\" title=\"水关长城一日游.jpg\" alt=\"水关长城一日游.jpg\"/><br/></span></p><p><br/><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">来水关除了登长城、赏红叶外，还可以去成吉思汗行宫、滑道、长城碑林等新修建的游览项目转一转。这里还有众多古迹和自然景观可寻，有“关沟72景”中的石佛寺、骆驼峰，不远处更有闻名遐迩的詹天佑“之”字形铁路在险峻的居庸关旁边。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">交通信息</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">自驾车：沿京藏高速公路到水关长城出口乘车：德胜门乘919路市郊车到八达岭站下车后步行4公里到</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">相关阅读</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">八达岭水关长城</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">西水关长城度假山庄游玩 </span><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p><br/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('625', '0', '<p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">水关长城</span><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">是八达岭长城的东段部分，这段长城建于险谷口，自水门箭楼长城呈“V”字型，顺应山势而行，如巨龙似鲲鹏展翅欲飞，箭楼即是敌楼同时兼具水门功效，这种建筑方式在沿线长城中极为罕见，故名水关长城。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">主要景点</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">五桂头山洞</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">五桂头山洞原是旧京张铁路一个隧洞，现路基已拆除废弃不用。洞高7米，宽4米，长30米。五桂头原名乱柴沟，为关沟七隘口之一，在五桂山下。五桂山本名五龟山，在八达岭南9里，因山势如五龟相聚而得名，也叫五贵山。传说元末，明军进攻居庸关，乱柴沟有元兵防守，有火家庄火氏五兄弟用火炮轰开乱柴沟，为明立下汗马功劳。后来，明以火氏五兄弟为蒙古细作的罪名，杀了五兄弟，把五颗人头悬在附近道旁示众，人们遂称此地为五鬼头。不久，明为了安抚人心，封火氏五兄弟为五显财神，并立庙于石佛寺西，人们又改称此地为五贵头。修京张铁路时第四次改名为五桂头。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><img src=\"http://img.52njl.net/Image/bj/shanghu/2017/06/76b604a077eb4ede94df8f4e332b6905.jpg\" title=\"水关长城旅游攻略.jpg\" alt=\"水关长城旅游攻略.jpg\"/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">关帝庙 观音阁</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">坐落在弹琴峡谷的石壁上，距地面5米。庙门为天然石洞，上下两 \r\n座庙各一间，上为关帝庙，下为观音阁。这里原来只有关帝庙，清同治二年(1863)黄大元中武状元，第二年重修关帝庙，创建观音阁。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">弥勒听音</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">弹琴峡隧道北口石阶下有一个小龛洞，窄小的石券门镌刻着“弥勒听音”，弥勒石像刻工组粗犷，高1.45米，宽1.35米，石像成于元代，距今700多年，1900年八国联军被侵略者付之一炬，1986年修建八达岭高速公路时，石佛得以重见天日，依旧以满面的笑容，谛听高山流水“弹”出的琴声。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">佛寺庙</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">明《西关志》记载，石佛寺在居庸关北一十五里，因以石凿大悲佛像，故名，明永乐年间建。石佛寺村坐落于庙旁，因庙得名。石佛寺庙于1900年毁于八国联军，石佛多毁坏，身首异处。石佛寺于九十年代初修复水关长城时迁至现址复建，在现址筑台陈列金鱼池出土的五尊盘膝坐式石佛，供游人参观游览。这些佛像是元代遗物，距今已有700多年历史。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><img src=\"http://img.52njl.net/Image/bj/shanghu/2017/06/cd463747d12243c2ad47de0061c6d445.jpg\" title=\"水关长城门票.jpg\" alt=\"水关长城门票.jpg\"/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">弹琴峡</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">从弹琴峡隧道北口下到小溪旁，只见崖壁陡峭，向东不远，石崖题刻有“弹琴峡、五贵头”六个大字，这里原是关沟著名景观：“弹琴峡”。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">古时，这儿峰回路转，山清水秀,两山相峙，石壁相对，清溪中流。溪水从缓坡泻下，淌流在石罅之间，淙淙有声，两岸的石壁为之共鸣，悠扬婉转，如弹琴声清脆悦耳，故名“弹琴峡”，元朝诗人陈孚到此，曾写诗“月作金徽风作弦，清声岂待指中弹?伯牙别有高山调，写在松风乱石间。”清代诗人魏源描写这一胜景是：“无复战场悲，但寻响琴峡。”</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><img src=\"http://img.52njl.net/Image/bj/shanghu/2017/06/9dbdf22cc0aa46c6b72d84ee499847ac.jpg\" title=\"水关长城一日游.jpg\" alt=\"水关长城一日游.jpg\"/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">修京张铁路时，曾将东北面小山和峡谷削为平地，修八达岭公路，开山凿洞的泥沙石块，填平了沟谷。如今石壁题字依存，溪水旋荡于峡谷的优美声音再也没有了。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">骆驼石</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">在水关长城景区前停车场东侧的山上堆有数块巨石，状如骆驼卧于山上，由此得名骆驼石。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">佛爷台</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">1986年在对金鱼池进行迁址时，出土了有700多年历史的元代石刻，这些石刻古朴的雕刻技法和特有的服饰，形象反映了当时的雕刻工艺和社会形态，为保护好这些文物，在水关长城景区入口筑台陈列，供游人观赏。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><img src=\"http://img.52njl.net/Image/bj/shanghu/2017/06/79b01d9ee67142c6a5ae3c6b134aace9.jpg\" title=\"水关长城.jpg\" alt=\"水关长城.jpg\"/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">“川字一号”楼</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">沿着水关长城向东，过二道门、三道门，即可以看到一座雄伟的敌楼，敌楼下台阶高达90厘米，是沿线长城所仅见，敌楼六孔双层，建筑巧妙，卷洞上距地3.5米有一横匾“川字一号”，此敌楼是八达岭沿线长城东部起始点，位于川草花顶山下，“川字一号”楼由此得名。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">实用信息</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">首道门票：成人40 学生 20</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">优惠：身高1.2米以下儿童、 残疾人凭残疾证、两年义务兵凭士兵证、军残凭伤残军人证、离休干部、北京市65周岁以上老人凭北北京市老年人优待卡免费。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">开放时间：全年 旅游旺季(每年4月1日—10月31日)6：30—17：00旅游淡季(每年11月1日—3月31日) 7：30—16：30</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">交通信息</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">自驾车：沿京藏高速公路到水关长城出口</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">乘车：德胜门乘919路市郊车到八达岭站下车后步行4公里到</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">相关阅读</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">八达岭水关长城</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">西水关长城度假山庄游玩 </span><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p><br/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('626', '0', '<p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">野鸭湖</span><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">位于北京市延庆县西北部，属于华北平原向山西高原、内蒙高原的过渡地带。本区原为延庆盆地东部妫水河、蔡家河下游，1955年建成官厅水库，形成巨大的人工湖泊湿地。保护区处于水库中上游，沟岔纵横，库湾众多。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><img src=\"http://img.52njl.net/Image/bj/shanghu/2017/06/e6d4ee751b24420e87031b1b18ae3662.jpg\" title=\"野鸭湖附近农家院.jpg\" alt=\"野鸭湖附近农家院.jpg\"/><br/></span></p><p><br/><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">保护区总面积为6873公顷，其中湿地面积达3939公顷，是北京最大的湿地自然保护区，也是唯一的湿地鸟类自然保护区。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><img src=\"http://img.52njl.net/Image/bj/shanghu/2017/06/c4fc875bc6854c369820a4203337835a.jpg\" title=\"野鸭湖附近农家院预订.jpg\" alt=\"野鸭湖附近农家院预订.jpg\"/><br/></span></p><p><br/><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">据统计野鸭湖湿地鸟种总数达280种，国家一级保护动物9种(黑鹳、东方白鹳、白头鹤、大鸨、金雕、白尾海雕、白肩雕、白鹤、遗鸥)，国家二级保护动物40种。高等植物420种、鱼类40种、两栖类5种、兽类10种、昆虫类182种等。</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><img src=\"http://img.52njl.net/Image/bj/shanghu/2017/06/ef877607fb664b71b324ba2d148405c2.jpg\" title=\"野鸭湖附近农家院住宿.jpg\" alt=\"野鸭湖附近农家院住宿.jpg\"/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">交通路线</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">自驾路线</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">八达岭高速康庄出口沿路标10分钟即到</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">公交路线</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\">德胜门乘坐919公交车在延庆站下车换乘921野鸭湖下车</span></p><p><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><br/></span></p><p style=\"text-align: center;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 18px;\"><img src=\"http://img.52njl.net/Image/bj/shanghu/2017/06/0993061cd661471e83377c28df806495.jpg\" title=\"野鸭湖附近农家院住宿环境.jpg\" alt=\"野鸭湖附近农家院住宿环境.jpg\"/></span></p><p><br/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('627', '0', '<p style=\"text-indent: 2em;\"><span style=\"font-size: 18px; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\">\r\n	上周末和朋友一起去了石林峡游玩， 让人难以忘怀的石林峡美景，下次还会去。我们9：00多到达石林峡，当天有点阴天并有些山雾，所以感觉没有晴天时美了，但雨后的石林峡空气非常清新，伴着水量充足的溪水，山里清凉无比。</span></p><p style=\"text-align: center; text-indent: 2em;\"><img src=\"http://img.52njl.net/Image/bj/shanghu/2017/05/7463a728f0784656b9340defa95cd3b2.jpg\" title=\"石林峡景区\" alt=\"石林峡景区\"/></p><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\">\r\n	&nbsp;</span></p><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\">\r\n	&nbsp; 石林峡</span><span style=\"font-size: 18px; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\">正门，</span><span style=\"font-size: 18px; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\">门票</span><span style=\"font-size: 18px; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\">60，还</span><span style=\"font-size: 18px; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\">有一种套票100（包含门票+缆车+漂流+激流勇进）如果没老年证什么的还是买套票比较值！</span></p><p style=\"text-align: center; text-indent: 2em;\"><span style=\"font-size: 18px; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\">\r\n	&nbsp;<img src=\"http://img.52njl.net/Image/bj/shanghu/2017/05/59dc7d92be714af4a1e94d38251bf031.jpg\" title=\"石林峡风景区\" alt=\"石林峡风景区\"/></span></p><p><span style=\"font-size: 18px; font-family: 微软雅黑, &#39;Microsoft YaHei&#39;;\">\r\n	&nbsp; 走着走着就看见地质大峡谷口了。后面就是沿来路往回走了，天又开始晴朗起来，三点半回到门口，我们没有急于出去，门边河中有几座供游客进行拓展运动的晃木铁索桥，我居然出人意料的上去走完了一圈。<br/></span></p><p><br/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('628', '0', '<p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	箭扣长城位于京郊怀柔区西北的八道河乡境内，海拔1141米，距怀柔县城约30公里，山势非常富于变化，险峰断崖之上的长城也显得更加雄奇险要。箭扣长城因整段长城蜿蜒呈W \r\n状，形如满弓扣箭而得名。箭扣长城是明代万里长城最著名的险段之一，是近年来各种长城画册中上镜率最高的一段，向来是长城摄影的热点。</span></p><p style=\"text-align: center; line-height: 2em;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/2a38dd8a1c784e00b0aea5c522dcd2b5.jpg\" alt=\"\"/></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	箭扣长城是北京一段最险峻、雄奇的长城，自然风化严重，没有任何人工修饰，自牛犄角边、南大楼、鬼门关、东西缩脖楼、东西油篓顶，箭扣梁、将军守关、天梯、鹰飞倒仰、北京结到九眼楼(望京楼)绵延20多公里，充分展现了长城的惊、险、奇、特、绝，能领略到原汁原味的古老的长城景观。</span></p><p style=\"text-align: center; line-height: 2em;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/e092cff74b6a48599ccc130f1c877563.jpg\" alt=\"\"/></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	天梯、鹰飞倒仰、北京结，九眼楼、一段路最险，从东向西走稍好一点，从西向东走更艰难。遇见倒塌的路段要绕出长城，在城墙的石缝里插上树枝做梯子，再爬墙进去;天梯是一段70度陡坡、70-80米长的长城，最窄处60公分宽，台阶40-50公分高、15公分台面，要四肢并用地爬;鹰飞倒仰有一处长城直立倒塌，要南辕北辙地绕道迂回过去，下山70-80度陡坡，要不抓住树枝，很难站住;北京结到望京楼一段在长城里，东侧是城墙，西侧是灌木，没有台阶，非常难走。</span></p><p style=\"text-align: center; line-height: 2em;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/a6681294b30845f4b4c95b0a2d396166.jpg\" alt=\"\"/></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	交通极为便利，距怀柔县28公里，距离北京73公里。南有雄伟险峻古长城衬托，北靠京北第一高峰黑坨山(1534米)。四面环山的庄园更显幽静，树木掩映。鸟唱蝉鸣，凭窗眺望，青山绿水，尽收眼底。曲径通幽，恬然安逸，返璞归真，回归自然。远离喧嚣都市的恬静与安闲，令你耳目一新，宛若陶渊明的世外桃源。在这里你可以体味纯朴的民风民情。比方说你可以在园子里亲手采摘果品，农作物等绿色食品，亲身体验农家生活的乐趣。“采摘东篱下\r\n \r\n，悠然见长城”。闲暇之余，您亦可以去登山，在古长城脚下找寻历史的痕迹。是一处寻幽、访古、探险、休闲、健身的绝佳去处。</span></p><p style=\"text-align: center; line-height: 2em;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/718156b7ebdc43028af1dfa70b57dcc6.jpg\" alt=\"\"/></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	交通信息</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	乘车路线</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	东直门乘916路到怀柔，或在怀柔于家园汽车站，有怀柔—西栅子的班车上午时间：11:30am ;下午时间：4:30pm。</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	自驾车线路</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	从田仙峪出发路径：</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	怀柔于家园到田仙峪村公交车H24/H36(怀柔于家园—田仙峪发车时间：6：20;11：30;17：40。田仙峪-怀柔：7：05;12：15;18：30。太bt才3趟车，若赶不上，就坐于家园到洞台方向的公交车，在慕田峪环岛下，后步行3km到田仙峪)。从田仙峪沿村间主道向北走，到九神庙山庄，穿越山庄北门，就是一条长1km水泥路)。然后沿山石道路走1km则进林间小道1km，一直爬到长城上(从村口步行到长城需1.5hr，刚开始体力好，途中无休息)。道路入口处有个凉棚。左侧就有一塔楼，下一个塔楼就是将军守关，爬过天梯到达小天梯需40min。此方向是前往北京结的;右侧去慕田峪方向的。从凉棚处经箭扣走到小布达拉前的悬崖需1.3hr。</span></p><p><br/></p>', '', '0', '', '', '', '', '怀柔区', '长城', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('666', '0', '<p>进入二十一世纪，北塘的旅游资源日趋凸现，北塘海鲜、北塘海会、出海做一日渔民以及浓郁的乡情、乡俗和敦厚民风都成为北塘独具特色的旅游景观。 随着塘沽区行政中心北移大目标的确定和天津滨海新区的成熟和发展，北塘因其地理优势再次成为人们注目的焦点，开发北塘资源，再造北塘辉煌的呼声也日渐强烈。目前，北塘三河岛渔人码头的旅游开发已提上政府工作日程，不远的将来，北塘将建设成具有丰富历史文化内涵和三角湿地自然保护区风貌，集海河观光、渔人码头、国际游船、海鲜餐饮、风俗文化于一体的多功能旅游区。这里通过文字和图片为您集中展示北塘古镇特有的历史风貌和文化底蕴，以加深人们对她的了解和热爱。 <br/></p>', '', '0', '', '', '', '4000-979-212', '塘沽', '北塘渔村', '', '', '', '天津 塘沽区 于庄子 路1998号', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('705', '0', '<p>发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式</p>', '', '0', '0', '', '', '', '海淀', '', '', '', '', '', '0', '', '', '', '0', '', '');
INSERT INTO `v_document_article` VALUES ('638', '0', '<p>隶属于北京王桂珍民俗饭庄位于密云区古北口镇河西村。聚古北水镇较近，蜿蜒长城脚下，就坐落着我们靠山居，院内干净整洁服务周到热情，这里环境优美绿树成荫，瓜果飘香，野花漫山遍野，潮河碧水与山岚相连，真正让游客感受到大自然的风姿，农家主人热情好客，做的一手好菜，让游客吃的放心，住的舒心，玩的开心，真诚邀请全国各地朋友来我家坐客，这里是您游玩，吃住，娱乐首选之地。<br/>可提供住宿，客房多间，房间有双人间，三人间，四人间，空调，电视，无线网，淋浴，床单，被罩一客一换，均配有独 立卫生间干净卫生整洁。<br/>特色烧烤:烤全羊，烤羊腿，烤羊排，烤肉串，烤鸡翅，骨肉相连，烤肉，河边自助烧烤。<br/>主食：贴饼子，菜团子，豆饭，家常大饼，馒头，面条，小米粥，棒渣粥等。<br/>娱乐：爬山，采摘，钓鱼，棋牌，跳舞，免费wifi。<br/>景点：薰衣草庄园、司马台长城、卧虎山长城、西沟(黄金探险)、杨令公祠、药王庙、大戏台、财神庙、娘娘庙、七郎坟、吕祖庙、清真寺、古北口革命纪念建筑以及还有尚未被开发的最原始的自然风景。同时，它与时俱进：古北水镇、香草庄园等更是聚集着各方友客。<br/>交通：<br/>方案一：在北京东直门或西直门乘坐前往滦平、承德的汽车，在古北口下;<br/>方案二：或在东直门直接乘坐前往密云区980汽车换成25路直达本院<br/>方案三：此外，还可乘坐L677/8旅游专列，早上07：36从北京发车，中午11：03到达古北口。<br/>自驾车可从北京出发，出四元桥，沿京顺路到枯柳树环岛，走密云方向，过牛栏山环岛，沿101国道直行，经密云县城、太师屯，即可到达古北口镇，自驾车可从北京三环太阳宫桥，四环望和桥五环来广营桥，上京承高速太师屯出口出，沿101国道古北口方向直行即可到达古北口镇</p>', '', '0', '', '', '', '15711495518', '密云区', '古北水镇', '334,335,336,337,357,358', '351,352,353,354,355,356', '347,348,349,350,359', '密云区古北口镇河西村', '0', '117.161312,40.695122', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('648', '0', '<p><img src=\"/Uploads/Editor/2017-09-04/59ad1e54ec3a0.jpg\" title=\"01.jpg\"/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('649', '0', '<p><img src=\"/Uploads/Editor/2017-09-04/59ad1e7a26627.jpg\" title=\"04.jpg\"/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('650', '0', '<p><img src=\"/Uploads/Editor/2017-09-04/59ad1ed278054.jpg\" title=\"野三坡百里峡1.jpg\"/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('639', '0', '<p>丰宁满族自治县大明农家院是一家提供坝上草原旅游,坝上草原住宿服务的坝上草原农家院,欢迎全国各地的朋友到坝上草原旅游。</p><p>　　大明农家院座落于丰宁坝上草原自然保护区 , 地处美丽的坝上草原中心地带,位于河北省丰宁满族自治县大滩镇，距离京宝（北 京—丰宁—大滩）公路 仅 100 米，交通十分便利。</p><p>　　大明农家院可供坝上草原住宿的客房有80余间。客房分为：浪漫大床房、豪华双人间、温馨家庭房三种房型。可同时容纳200余人住宿、用餐。房间设备干净整洁，内设液晶电视、有线无线网络、独立卫浴设备，24小时热水，全方位监控设施（三星级的设施，农家院的收费）。装修考究又不失温馨的感觉，干净舒适，安全便捷，服务周到。</p><p>　　大明农家院荟萃了坝上草原的民俗饮食精华。以当地的食材为原料制作的菜肴达26种之多。主食有：莜面系列;荞面系列;粗杂粮系列；农家葱油饼；自制花卷。主推莜面窝子、莜面鱼子和农家葱油饼。热菜有：特色农家菜、烤全羊、手把肉、闪电湖大鲤鱼等等。凉菜有：三色杏仁、拌苦菊、拌野菜、糖醋罗卜丝等。</p><p>　　大明农家院坝上草原游玩项目有：骑马、射箭、徒步草原、山地车、沙滩摩托、滑草、篝火晚会、棋牌室等多项特色娱乐活动，应有尽有。您可以约上朋友骑上骏马在草原上驰骋；四轮草地摩托车会让您在草原上追赶白云，放飞心情；在滑草的过程中体验释放压力，体验活力与激情的碰撞。大明农家院竭诚为不同需求的游客提供贴心和个性化的坝上草原旅游度假服务。</p><p><br/></p>', '', '0', '0', '', '', '13931421659', '丰宁', '坝上草原', '772,773,774,775,776,777', '778,779,780,781,782,783', '768,756,769,770,771', '河北省丰宁满族自治县大滩镇 ', '0', '116.030894,41.577896', '', '0', '', '', '200人');
INSERT INTO `v_document_article` VALUES ('640', '0', '从自行车自行车自行车下自成蹊在自行车自行车自行车自行车在线', '', '0', '', '', 'zjl1012', '13821297979', '蓟县', '九顶山', '791,792,793,794,795,796', '740,737,797,798,799,800', '784,785,786,787,757,758,788,931,933,934', '蓟县下营镇常州村', '1514356491', '117.521053,40.22545', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('641', '0', '<p>蓟县梨木台风景区、八仙山自然风景区，以原始自然风光和田园民俗为特色，令您身在大自然之中，心旷神怡。梨木台农家院集居住、休闲、娱乐、商务于一体，让您随处享受尊贵典雅。\r\n　　住农家院、吃农家饭、享受山间美景、倾听溪水长流，是您休闲、放松的俱佳场所！(本院可宽带上网）\r\n　　住宿:环山农家院有客房32间（标准间13间，全部配有独立卫生间、电热水器、有限电视空调，其中3人间17间，4人间2间，火炕套房1间）一次性可见接纳80人入住。\r\n　　餐饮:环山农家院更有别具特色的乡间菜让您大饱口福。 大餐厅一个，可容纳80人就餐。山野菜、河鱼、河虾、柴鸡蛋、铁锅熬水库鱼、卷子、玉米面饼子、野芹菜、玉米粥等。烤鱼、烤全羊、山鸡、野兔可预订，丰俭由人。</p>', '', '0', '', '', '', '15711495518', '蓟县', '梨木台', '336,803,804', '805,806,807', '730,801,802,808,809,810,811,812,813,814', '蓟县梨木台', '0', '117.545158,40.18208', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('642', '0', '', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('647', '0', '<p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	箭扣长城位于京郊怀柔区西北的八道河乡境内，海拔1141米，距怀柔县城约30公里，山势非常富于变化，险峰断崖之上的长城也显得更加雄奇险要。箭扣长城因整段长城蜿蜒呈W \r\n状，形如满弓扣箭而得名。箭扣长城是明代万里长城最著名的险段之一，是近年来各种长城画册中上镜率最高的一段，向来是长城摄影的热点。</span></p><p style=\"text-align: center; line-height: 2em;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/2a38dd8a1c784e00b0aea5c522dcd2b5.jpg\" alt=\"\"/></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	箭扣长城是北京一段最险峻、雄奇的长城，自然风化严重，没有任何人工修饰，自牛犄角边、南大楼、鬼门关、东西缩脖楼、东西油篓顶，箭扣梁、将军守关、天梯、鹰飞倒仰、北京结到九眼楼(望京楼)绵延20多公里，充分展现了长城的惊、险、奇、特、绝，能领略到原汁原味的古老的长城景观。</span></p><p style=\"text-align: center; line-height: 2em;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/e092cff74b6a48599ccc130f1c877563.jpg\" alt=\"\"/></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	天梯、鹰飞倒仰、北京结，九眼楼、一段路最险，从东向西走稍好一点，从西向东走更艰难。遇见倒塌的路段要绕出长城，在城墙的石缝里插上树枝做梯子，再爬墙进去;天梯是一段70度陡坡、70-80米长的长城，最窄处60公分宽，台阶40-50公分高、15公分台面，要四肢并用地爬;鹰飞倒仰有一处长城直立倒塌，要南辕北辙地绕道迂回过去，下山70-80度陡坡，要不抓住树枝，很难站住;北京结到望京楼一段在长城里，东侧是城墙，西侧是灌木，没有台阶，非常难走。</span></p><p style=\"text-align: center; line-height: 2em;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/a6681294b30845f4b4c95b0a2d396166.jpg\" alt=\"\"/></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	交通极为便利，距怀柔县28公里，距离北京73公里。南有雄伟险峻古长城衬托，北靠京北第一高峰黑坨山(1534米)。四面环山的庄园更显幽静，树木掩映。鸟唱蝉鸣，凭窗眺望，青山绿水，尽收眼底。曲径通幽，恬然安逸，返璞归真，回归自然。远离喧嚣都市的恬静与安闲，令你耳目一新，宛若陶渊明的世外桃源。在这里你可以体味纯朴的民风民情。比方说你可以在园子里亲手采摘果品，农作物等绿色食品，亲身体验农家生活的乐趣。“采摘东篱下\r\n \r\n，悠然见长城”。闲暇之余，您亦可以去登山，在古长城脚下找寻历史的痕迹。是一处寻幽、访古、探险、休闲、健身的绝佳去处。</span></p><p style=\"text-align: center; line-height: 2em;\"><img src=\"http://img.52njl.net/Image/shanghu/2017/08/718156b7ebdc43028af1dfa70b57dcc6.jpg\" alt=\"\"/></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	交通信息</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	乘车路线</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	东直门乘916路到怀柔，或在怀柔于家园汽车站，有怀柔—西栅子的班车上午时间：11:30am ;下午时间：4:30pm。</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	自驾车线路</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	从田仙峪出发路径：</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 微软雅黑,Microsoft YaHei; font-size: 14px;\">\r\n	怀柔于家园到田仙峪村公交车H24/H36(怀柔于家园—田仙峪发车时间：6：20;11：30;17：40。田仙峪-怀柔：7：05;12：15;18：30。太bt才3趟车，若赶不上，就坐于家园到洞台方向的公交车，在慕田峪环岛下，后步行3km到田仙峪)。从田仙峪沿村间主道向北走，到九神庙山庄，穿越山庄北门，就是一条长1km水泥路)。然后沿山石道路走1km则进林间小道1km，一直爬到长城上(从村口步行到长城需1.5hr，刚开始体力好，途中无休息)。道路入口处有个凉棚。左侧就有一塔楼，下一个塔楼就是将军守关，爬过天梯到达小天梯需40min。此方向是前往北京结的;右侧去慕田峪方向的。从凉棚处经箭扣走到小布达拉前的悬崖需1.3hr。</span></p><p><br/></p>', '', '0', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('667', '0', '<p>梨木台自然风景区地处天津最北端，被称为“天津北极”。景区内峰林峡谷雄、险；森林景观秀、幽；潭、瀑溪水长流；藤萝攀援缠绕，形成了奇特的自然风光，被专家学者誉为“天津的神农架”。</p>', '', '0', '', '', '', '4000-979-212', '蓟县', '梨木台', '', '', '', '天津 蓟县 下营镇 常州村 白庄区8号', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('668', '0', '<p>梨木台自然风景区地处天津最北端，被称为“天津北极”。景区内峰林峡谷雄、险；森林景观秀、幽；潭、瀑溪水长流；藤萝攀援缠绕，形成了奇特的自然风光，被专家学者誉为“天津的神农架”。</p>', '', '0', '', '', '', '4000-979-212', '蓟县', '梨木台', '', '', '', '天津 蓟县 天津市蓟县下营镇船舱峪村', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('669', '0', '<p>梨木台自然风景区地处天津最北端，被称为“天津北极”。景区内峰林峡谷雄、险；森林景观秀、幽；潭、瀑溪水长流；藤萝攀援缠绕，形成了奇特的自然风光，被专家学者誉为“天津的神农架”。</p>', '', '0', '', '', '', '4000-979-212', '蓟县', '梨木台', '', '', '', '天津 蓟县 下营镇 道古峪村 天津市蓟县下营镇道古峪', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('670', '0', '<p>梨木台自然风景区地处天津最北端，被称为“天津北极”。景区内峰林峡谷雄、险；森林景观秀、幽；潭、瀑溪水长流；藤萝攀援缠绕，形成了奇特的自然风光，被专家学者誉为“天津的神农架”。</p>', '', '0', '', '', '', '4000-979-212', '蓟县', '梨木台', '', '', '', '天津 蓟县 下营镇 船舱峪村 梨木台景区', '0', '', '', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('675', '0', '<p>团队所有队员都会得到一个神奇的“宝石”，要求所有人必须完成“宝石”的互换，互换宝石分为三个步骤，必须是本队队员同时换“宝石”，必须按步骤一二三完成，成功晋级，失败只能一次次重来。</p>', '', '0', '', '', 'zjl1012', '13904210132', '北京南海子郊野公园', '精准投放', '', '', '', '北京南海子郊野公园', '0', '', '100元-150元', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('676', '0', '<p>&nbsp;&nbsp; 所有团队利用提供的绳子和EVA板在规定的40分钟时间里，在人不离地、不借助任何外力的情况下，将箱子尽可能高的垒起来，最低要实现13个箱子的高度。其意义是在有限资源的情况下，开拓思路，巧想办法，把任务完成地更好。</p>', '', '0', '', '', 'zjl1012', '13904210132', '北京南海子郊野公园', '通天塔', '', '', '', '北京南海子郊野公园', '0', '', '100元以下', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('704', '0', '<p>选择乘坐出租车在线咨询中心资讯中心<br/></p>', '', '0', '', '', 'zjl1012', '4000-979-212', '龙腾庄园基地', '沙漠掘金', '', '', '', '天津龙腾庄园基地', '0', '', '100元-150元', '', '', '', '');
INSERT INTO `v_document_article` VALUES ('706', '0', '<p>发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式</p>', '', '0', '0', '', '', '', '海淀', '', '', '', '', '', '0', '', '', '', '1', '', '');
INSERT INTO `v_document_article` VALUES ('707', '0', '<p>发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式</p>', '', '0', '1', '', '', '', '海淀', '', '', '', '', '', '0', '', '', '', '2', '', '');
INSERT INTO `v_document_article` VALUES ('708', '0', '<p>发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式</p>', '', '0', '0', '', '', '', '海淀', '', '', '', '', '', '0', '', '', '', '3', '', '');
INSERT INTO `v_document_article` VALUES ('709', '0', '<p>发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式</p>', '', '0', '0', '', '', '', '海淀', '', '', '', '', '', '0', '', '', '', '3', '', '');
INSERT INTO `v_document_article` VALUES ('710', '0', '<p>发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式</p>', '', '0', '1', '', '', '', '海淀', '', '', '', '', '', '0', '', '', '', '2', '', '');
INSERT INTO `v_document_article` VALUES ('711', '0', '<p>发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式</p>', '', '0', '0', '', '', '', '海淀', '', '', '', '', '', '0', '', '', '', '1', '', '');
INSERT INTO `v_document_article` VALUES ('712', '0', '<p>发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式</p>', '', '0', '0', '', '', '', '海淀', '', '', '', '', '', '0', '', '', '', '0', '', '');
INSERT INTO `v_document_article` VALUES ('713', '0', '<p>发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式</p>', '', '0', '0', '', '', '', '海淀', '', '', '', '', '', '0', '', '', '', '0', '', '');
INSERT INTO `v_document_article` VALUES ('714', '0', '<p>发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式</p>', '', '0', '0', '', '', '', '海淀', '', '', '', '', '', '0', '', '', '', '1', '', '');
INSERT INTO `v_document_article` VALUES ('715', '0', '<p>发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式</p>', '', '0', '1', '', '', '', '海淀', '', '', '', '', '', '0', '', '', '', '2', '', '');
INSERT INTO `v_document_article` VALUES ('716', '0', '<p>发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式</p>', '', '0', '0', '', '', '', '海淀', '', '', '', '', '', '0', '', '', '', '3', '', '');
INSERT INTO `v_document_article` VALUES ('717', '0', '<p>发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式</p>', '', '0', '0', '', '', '', '海淀', '', '', '', '', '', '0', '', '', '', '3', '', '');
INSERT INTO `v_document_article` VALUES ('718', '0', '<p>发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式</p>', '', '0', '1', '', '', '', '海淀', '', '', '', '', '', '0', '', '', '', '2', '', '');
INSERT INTO `v_document_article` VALUES ('719', '0', '<p>发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式</p>', '', '0', '0', '', '', '', '海淀', '', '', '', '', '', '0', '', '', '', '1', '', '');
INSERT INTO `v_document_article` VALUES ('720', '0', '<p>发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式</p>', '', '0', '0', '', '', '', '海淀', '', '', '', '', '', '0', '', '', '', '0', '', '');
INSERT INTO `v_document_article` VALUES ('721', '0', '<p>发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式</p>', '', '0', '0', '', '', '', '海淀', '', '', '', '', '', '0', '', '', '', '0', '', '');
INSERT INTO `v_document_article` VALUES ('722', '0', '<p>发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式</p>', '', '0', '0', '', '', '', '海淀', '', '', '', '', '', '0', '', '', '', '1', '', '');
INSERT INTO `v_document_article` VALUES ('723', '0', '<p>发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式</p>', '', '0', '1', '', '', '', '海淀', '', '', '', '', '', '0', '', '', '', '2', '', '');
INSERT INTO `v_document_article` VALUES ('724', '0', '<p>发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式发生大幅度缩短上市的方法电风扇地方撒旦法法短发散发范德萨防守对方发送方式</p>', '', '0', '0', '', '', '', '海淀', '', '', '', '', '', '0', '', '', '', '3', '', '');
INSERT INTO `v_document_article` VALUES ('725', '0', '<p>海淀区，隶属于北京市，位于北京城区西部和西北部，东与西城区、朝阳区相邻，南与丰台区毗连，西与石景山区、门头沟区交界，北与昌平区接壤。面积430.8平方千米，边界线长约146.2千米，南北长约30千米，东西最宽处29千米，约占北京市总面积的2.6%。区境介于北纬39°53′—40°09′，东经116°03′—116°23′之间。</p><p>元代初年，海淀镇附近是一片浅湖水淀，故称“海店”，即今日的海淀。1952年9月，海淀区正式命名，1963年1月形成现辖区域。</p><p>截至2016年，海淀区辖22个街道，7个镇，常住总人口359.3万人 。实现地区生产总值5036.8亿元，占北京市比重达20.2%，经济总量位于北京市十六区之首 。其中，第一产业增加值1.8亿元，第二产业增加值560.7亿元，第三产业增加值4474.4亿元，三次产业构成为0.03：11.13：88.83。人均地区生产总值14.0万元。</p><p>海淀区高校云集，名胜古迹众多，著名的北京大学、清华大学、中国人民大学、北京师范大学等高校，颐和园、圆明园、香山等风景名胜都位于海淀区。</p><p><br/></p>', '', '0', '0', '', '', '', '海淀', '', '', '', '', '', '0', '', '', '', '0', '', '');
INSERT INTO `v_document_article` VALUES ('726', '0', '<p>高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富</p>', '', '0', '0', '', '', '', '沈阳', '', '', '', '', '', '0', '', '', '', '3', '', '');
INSERT INTO `v_document_article` VALUES ('727', '0', '<p>高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富</p>', '', '0', '2', '', '', '', '沈阳', '', '', '', '', '', '0', '', '', '', '2', '', '');
INSERT INTO `v_document_article` VALUES ('728', '0', '<p>高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富</p>', '', '0', '0', '', '', '', '沈阳', '', '', '', '', '', '0', '', '', '', '0', '', '');
INSERT INTO `v_document_article` VALUES ('729', '0', '<p>高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富</p>', '', '0', '0', '', '', '', '沈阳', '', '', '', '', '', '0', '', '', '', '1', '', '');
INSERT INTO `v_document_article` VALUES ('730', '0', '<p>高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富</p>', '', '0', '0', '', '', '', '沈阳', '', '', '', '', '', '0', '', '', '', '1', '', '');
INSERT INTO `v_document_article` VALUES ('731', '0', '<p>高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富</p>', '', '0', '0', '', '', '', '沈阳', '', '', '', '', '', '0', '', '', '', '0', '', '');
INSERT INTO `v_document_article` VALUES ('732', '0', '<p>高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富</p>', '', '0', '2', '', '', '', '沈阳', '', '', '', '', '', '0', '', '', '', '2', '', '');
INSERT INTO `v_document_article` VALUES ('733', '0', '<p>高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富</p>', '', '0', '0', '', '', '', '沈阳', '', '', '', '', '', '0', '', '', '', '3', '', '');
INSERT INTO `v_document_article` VALUES ('734', '0', '<p>高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富</p>', '', '0', '0', '', '', '', '沈阳', '', '', '', '', '', '0', '', '', '', '3', '', '');
INSERT INTO `v_document_article` VALUES ('735', '0', '<p>高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富</p>', '', '0', '2', '', '', '', '沈阳', '', '', '', '', '', '0', '', '', '', '2', '', '');
INSERT INTO `v_document_article` VALUES ('736', '0', '<p>高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富</p>', '', '0', '0', '', '', '', '沈阳', '', '', '', '', '', '0', '', '', '', '0', '', '');
INSERT INTO `v_document_article` VALUES ('737', '0', '<p>高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富</p>', '', '0', '0', '', '', '', '沈阳', '', '', '', '', '', '0', '', '', '', '1', '', '');
INSERT INTO `v_document_article` VALUES ('738', '0', '<p>高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富</p>', '', '0', '0', '', '', '', '沈阳', '', '', '', '', '', '0', '', '', '', '1', '', '');
INSERT INTO `v_document_article` VALUES ('739', '0', '<p>高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富</p>', '', '0', '0', '', '', '', '沈阳', '', '', '', '', '', '0', '', '', '', '0', '', '');
INSERT INTO `v_document_article` VALUES ('740', '0', '<p>高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富</p>', '', '0', '2', '', '', '', '沈阳', '', '', '', '', '', '0', '', '', '', '2', '', '');
INSERT INTO `v_document_article` VALUES ('741', '0', '<p>高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富</p>', '', '0', '0', '', '', '', '沈阳', '', '', '', '', '', '0', '', '', '', '3', '', '');
INSERT INTO `v_document_article` VALUES ('742', '0', '<p>高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富</p>', '', '0', '0', '', '', '', '沈阳', '', '', '', '', '', '0', '', '', '', '3', '', '');
INSERT INTO `v_document_article` VALUES ('743', '0', '<p>高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富</p>', '', '0', '2', '', '', '', '沈阳', '', '', '', '', '', '0', '', '', '', '2', '', '');
INSERT INTO `v_document_article` VALUES ('744', '0', '<p>高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富</p>', '', '0', '0', '', '', '', '沈阳', '', '', '', '', '', '0', '', '', '', '0', '', '');
INSERT INTO `v_document_article` VALUES ('745', '0', '<p>高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富高峰时段更丰富</p>', '', '0', '0', '', '', '', '沈阳', '', '', '', '', '', '0', '', '', '', '1', '', '');
INSERT INTO `v_document_article` VALUES ('746', '0', '<p>沈阳，简称“沈”，是辽宁省省会，副省级市，特大城市， 中国北部战区司令部驻地 和直属中央军委沈阳联勤保障中心驻地，是国务院批复确定的东北地区重要的中心城市，先进装备制造业基地和国家历史文化名城。</p><p>沈阳位于中国东北地区南部，地处东北亚经济圈和环渤海经济圈的中心，是长三角、珠三角、京津冀地区通往关东地区的综合枢纽城市 全市下辖10个区、2县，代管1县级市，全市总面积逾12948平方公里，市区面积3495平方公里，2015年常住人口829.1万人，户籍人口730.4万人，生产总值7280.5亿元。</p><p>沈阳是国家历史文化名城，素有“一朝发祥地，两代帝王都”之称。是中国最重要的以装备制造业为主的重工业基地，有着“共和国长子”和“东方鲁尔”的美誉。先后获得“全国文明城市”、“国家环境保护模范城市”、“国家森林城市”、“国家园林城市”称号。</p><p><br/></p>', '', '0', '0', '', '', '', '沈阳', '', '', '', '', '', '0', '', '', '', '0', '', '');
INSERT INTO `v_document_article` VALUES ('756', '0', '<p>北京凤凰岭自然风景区位于海淀区苏家坨镇境内，距天安门33公里，总面积10.62平方公里。青山绿水，蓝天白云，层峦叠翠，密林曲径，奇花异草遍及山野，具有良好的生态环境；其上风上水的地理优势，使之享有京城“绿肺”之称。</p>', '', '0', '0', '', 'zjl1012', '13904210163', '海淀区', '凤凰岭', '906', '', '895', '北京海淀区凤凰岭自然风景区车耳营村', '1510275457', '', '', '0', '0', '921,923', '');

-- ----------------------------
-- Table structure for v_document_chartered
-- ----------------------------
DROP TABLE IF EXISTS `v_document_chartered`;
CREATE TABLE `v_document_chartered` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `carprice` varchar(255) NOT NULL COMMENT '包车价格',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `rentcartype` varchar(255) NOT NULL COMMENT '租车类型',
  `rentcarcity` varchar(255) NOT NULL COMMENT '租车城市',
  `phone` varchar(255) NOT NULL COMMENT '租车电话',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=756 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of v_document_chartered
-- ----------------------------
INSERT INTO `v_document_chartered` VALUES ('747', '350/天', 'zjl1012', '大巴', '密云', '4000-979-212');
INSERT INTO `v_document_chartered` VALUES ('749', '400/天', 'zjl1012', '中巴', '昌平', '13655442851');
INSERT INTO `v_document_chartered` VALUES ('751', '320/天', 'zjl1012', '小巴', '海淀', '4000-979-212');
INSERT INTO `v_document_chartered` VALUES ('754', '600/天', 'zjl1012', '大巴', '武清', '15201121145');
INSERT INTO `v_document_chartered` VALUES ('755', '360/天', 'zjl1012', '大巴', '密云', '15711495518');

-- ----------------------------
-- Table structure for v_document_download
-- ----------------------------
DROP TABLE IF EXISTS `v_document_download`;
CREATE TABLE `v_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- ----------------------------
-- Records of v_document_download
-- ----------------------------

-- ----------------------------
-- Table structure for v_file
-- ----------------------------
DROP TABLE IF EXISTS `v_file`;
CREATE TABLE `v_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of v_file
-- ----------------------------
INSERT INTO `v_file` VALUES ('1', 'keygen.rar', '544f480b6cb5d.rar', '2014-10-28/', 'rar', 'application/octet-stream', '33191', '9ab47df2229bfc10bbbcd927fe7c38fb', 'd97741ef122956c56d09d529b4c56c31597eb5d3', '0', '', '1414481931');

-- ----------------------------
-- Table structure for v_hooks
-- ----------------------------
DROP TABLE IF EXISTS `v_hooks`;
CREATE TABLE `v_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v_hooks
-- ----------------------------
INSERT INTO `v_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '', '1');
INSERT INTO `v_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop,AccessStat,QQ', '1');
INSERT INTO `v_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', 'Attachment', '1');
INSERT INTO `v_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'Attachment,SocialComment', '1');
INSERT INTO `v_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '', '1');
INSERT INTO `v_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', 'Attachment', '1');
INSERT INTO `v_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', 'Editor', '1');
INSERT INTO `v_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin', '1');
INSERT INTO `v_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo,DevTeam', '1');
INSERT INTO `v_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', 'Editor', '1');
INSERT INTO `v_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '', '1');
INSERT INTO `v_hooks` VALUES ('17', 'imageSlider', '实现图片轮播幻灯', '1', '1417156647', 'ImageSlider', '1');
INSERT INTO `v_hooks` VALUES ('18', 'UploadImages', '多图上传', '1', '1417517990', 'UploadImages', '1');
INSERT INTO `v_hooks` VALUES ('19', 'uploadPictureAfter', '在上传图片到远程服务器后触发钩子', '2', '1417770960', 'ImageWater', '1');

-- ----------------------------
-- Table structure for v_member
-- ----------------------------
DROP TABLE IF EXISTS `v_member`;
CREATE TABLE `v_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of v_member
-- ----------------------------
INSERT INTO `v_member` VALUES ('1', 'Administrator', '0', '0000-00-00', '', '760', '228', '0', '1414476189', '167772674', '1514509143', '1');
INSERT INTO `v_member` VALUES ('2', 'admin', '0', '0000-00-00', '', '20', '3', '2130706433', '1414476249', '167772674', '1478675056', '1');

-- ----------------------------
-- Table structure for v_menu
-- ----------------------------
DROP TABLE IF EXISTS `v_menu`;
CREATE TABLE `v_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v_menu
-- ----------------------------
INSERT INTO `v_menu` VALUES ('1', '首页', '0', '1', 'Index/index', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('2', '内容', '0', '2', 'Article/index', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('3', '文档列表', '2', '0', 'article/index', '1', '', '内容', '0', '1');
INSERT INTO `v_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('13', '回收站', '2', '0', 'article/recycle', '1', '', '内容', '0', '1');
INSERT INTO `v_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('16', '用户', '0', '3', 'User/index', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('17', '用户信息', '16', '0', 'User/index', '0', '', '用户管理', '0', '1');
INSERT INTO `v_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0', '1');
INSERT INTO `v_menu` VALUES ('19', '用户行为', '16', '0', 'User/action', '0', '', '行为管理', '0', '1');
INSERT INTO `v_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0', '1');
INSERT INTO `v_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0', '1');
INSERT INTO `v_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0', '1');
INSERT INTO `v_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0', '1');
INSERT INTO `v_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0', '1');
INSERT INTO `v_menu` VALUES ('27', '权限管理', '16', '0', 'AuthManager/index', '0', '', '用户管理', '0', '1');
INSERT INTO `v_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0', '1');
INSERT INTO `v_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0', '1');
INSERT INTO `v_menu` VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0', '1');
INSERT INTO `v_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0', '1');
INSERT INTO `v_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0', '1');
INSERT INTO `v_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0', '1');
INSERT INTO `v_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0', '1');
INSERT INTO `v_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0', '1');
INSERT INTO `v_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0', '1');
INSERT INTO `v_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0', '1');
INSERT INTO `v_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0', '1');
INSERT INTO `v_menu` VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0', '1');
INSERT INTO `v_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0', '1');
INSERT INTO `v_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0', '1');
INSERT INTO `v_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0', '1');
INSERT INTO `v_menu` VALUES ('43', '扩展', '0', '7', 'Addons/index', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('44', '插件管理', '43', '1', 'Addons/index', '0', '', '扩展', '0', '1');
INSERT INTO `v_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0', '1');
INSERT INTO `v_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0', '1');
INSERT INTO `v_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0', '1');
INSERT INTO `v_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0', '1');
INSERT INTO `v_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0', '1');
INSERT INTO `v_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0', '1');
INSERT INTO `v_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0', '1');
INSERT INTO `v_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0', '1');
INSERT INTO `v_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0', '1');
INSERT INTO `v_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0', '1');
INSERT INTO `v_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0', '1');
INSERT INTO `v_menu` VALUES ('57', '钩子管理', '43', '2', 'Addons/hooks', '0', '', '扩展', '0', '1');
INSERT INTO `v_menu` VALUES ('58', '模型管理', '68', '3', 'Model/index', '0', '', '系统设置', '0', '1');
INSERT INTO `v_menu` VALUES ('59', '新增', '58', '0', 'model/add', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('63', '属性管理', '68', '0', 'Attribute/index', '1', '网站属性配置。', '', '0', '1');
INSERT INTO `v_menu` VALUES ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('68', '系统', '0', '4', 'Config/group', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('69', '网站设置', '68', '1', 'Config/group', '0', '', '系统设置', '0', '1');
INSERT INTO `v_menu` VALUES ('70', '配置管理', '68', '4', 'Config/index', '0', '', '系统设置', '0', '1');
INSERT INTO `v_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0', '1');
INSERT INTO `v_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0', '1');
INSERT INTO `v_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0', '1');
INSERT INTO `v_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0', '1');
INSERT INTO `v_menu` VALUES ('75', '菜单管理', '68', '5', 'Menu/index', '0', '', '系统设置', '0', '1');
INSERT INTO `v_menu` VALUES ('76', '导航管理', '68', '6', 'Channel/index', '0', '', '系统设置', '0', '1');
INSERT INTO `v_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('80', '分类管理', '68', '2', 'Category/index', '0', '', '系统设置', '0', '1');
INSERT INTO `v_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0', '1');
INSERT INTO `v_menu` VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0', '1');
INSERT INTO `v_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0', '1');
INSERT INTO `v_menu` VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '', '0', '1');
INSERT INTO `v_menu` VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '', '0', '1');
INSERT INTO `v_menu` VALUES ('86', '备份数据库', '68', '0', 'Database/index?type=export', '0', '', '数据备份', '0', '1');
INSERT INTO `v_menu` VALUES ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '', '0', '1');
INSERT INTO `v_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '', '0', '1');
INSERT INTO `v_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0', '1');
INSERT INTO `v_menu` VALUES ('90', '还原数据库', '68', '0', 'Database/index?type=import', '0', '', '数据备份', '0', '1');
INSERT INTO `v_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0', '1');
INSERT INTO `v_menu` VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0', '1');
INSERT INTO `v_menu` VALUES ('93', '其他', '0', '5', '内容', '1', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0', '1');
INSERT INTO `v_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('106', '行为日志', '16', '0', 'Action/actionlog', '0', '', '行为管理', '0', '1');
INSERT INTO `v_menu` VALUES ('108', '修改密码', '16', '0', 'User/updatePassword', '1', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('109', '修改昵称', '16', '0', 'User/updateNickname', '1', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '1', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', '1', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', '1', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('118', '文档排序', '3', '0', 'Article/sort', '1', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', '1', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', '1', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('121', '排序', '76', '0', 'Channel/sort', '1', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('122', '数据列表', '58', '0', 'think/lists', '1', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('123', '审核列表', '3', '0', 'Article/examine', '1', '', '', '0', '1');
INSERT INTO `v_menu` VALUES ('126', '图片轮播', '43', '0', 'Admin/Addons/config/id/17', '0', '', '幻灯设置', '0', '1');

-- ----------------------------
-- Table structure for v_model
-- ----------------------------
DROP TABLE IF EXISTS `v_model`;
CREATE TABLE `v_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text COMMENT '属性列表（表的字段）',
  `attribute_alias` varchar(255) NOT NULL DEFAULT '' COMMENT '属性别名定义',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- ----------------------------
-- Records of v_model
-- ----------------------------
INSERT INTO `v_model` VALUES ('1', 'document', '基础文档', '0', '', '1', '{\"1\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\"]}', '1:基础', '', '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '0', '', '', '1383891233', '1384507827', '1', 'MyISAM');
INSERT INTO `v_model` VALUES ('2', 'article', '文章', '1', '', '1', '{\"1\":[\"24\",\"33\",\"54\",\"53\",\"48\",\"49\",\"52\",\"51\",\"55\",\"56\",\"57\",\"64\",\"62\",\"61\",\"63\",\"2\",\"3\",\"67\",\"5\",\"10\",\"12\"],\"2\":[\"25\",\"26\",\"9\",\"11\",\"13\",\"14\",\"16\",\"17\",\"19\",\"20\"]}', '1:基础,2:扩展', '', '', '', '', '', '', '0', '', '', '1383891243', '1513752174', '1', 'MyISAM');
INSERT INTO `v_model` VALUES ('3', 'download', '下载', '1', '', '1', '{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}', '1:基础,2:扩展', '', '', '', '', '', '', '0', '', '', '1383891252', '1387260449', '1', 'MyISAM');
INSERT INTO `v_model` VALUES ('6', 'chartered', '包车', '1', '', '1', '{\"1\":[\"3\",\"68\",\"70\",\"69\",\"71\",\"66\",\"9\",\"5\",\"12\",\"10\"],\"2\":[\"2\",\"11\",\"13\",\"14\",\"16\",\"17\",\"19\",\"20\"]}', '1:基础,2:扩展', '', '', '', '', '', '', '10', '', '', '1513305972', '1514183415', '1', 'MyISAM');

-- ----------------------------
-- Table structure for v_personal
-- ----------------------------
DROP TABLE IF EXISTS `v_personal`;
CREATE TABLE `v_personal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `ip` varchar(32) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `login_time` int(16) NOT NULL,
  `login_ip` varchar(32) NOT NULL,
  `privilege` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` int(16) NOT NULL,
  `phone` varchar(64) NOT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `vipint` varchar(255) NOT NULL DEFAULT '0',
  `mymoney` varchar(255) DEFAULT '0',
  `update_time` int(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v_personal
-- ----------------------------
INSERT INTO `v_personal` VALUES ('51', 'zzzqqqw', 'fbade9e36a3f36d3d676c1b808451dd7', '192.168.169.2', '1', '1505182792', '123.151.176.198', '0', '1505182792', '13904210137', '1', null, null, '0', '0', null);
INSERT INTO `v_personal` VALUES ('50', 'weilian', 'e10adc3949ba59abbe56e057f20f883e', '192.168.169.2', '1', '1505110239', '221.221.205.205', '0', '1505110239', '13811818336', '1', null, null, '0', '0', null);
INSERT INTO `v_personal` VALUES ('47', 'zjl1012', 'f261d9203f999cedc54f938b7c08f943', '192.168.169.2', '1', '1514533262', '10.0.2.2', '0', '1499416981', '13904210128', '1', '9430437555', '/Uploads/Picture/2017-12-22/5a3c5b0d42d42.png', '400', '4200', '1514446204');
INSERT INTO `v_personal` VALUES ('48', 'zzz1012', '66317cd5c8b477ef8b2500f54719a794', '192.168.169.2', '1', '1504228352', '111.192.102.68', '0', '1504228352', '15042881663', '1', '943409841', '/Uploads/Picture/2017-09-01/59a8b53cb78d2.jpg', '0', '0', null);
INSERT INTO `v_personal` VALUES ('49', 'jing123', 'f261d9203f999cedc54f938b7c08f943', '192.168.169.2', '1', '1514425576', '10.0.2.2', '0', '1504235948', '13904210131', '1', null, null, '200', '2900', '1514428369');
INSERT INTO `v_personal` VALUES ('53', 'qwe1234', '66317cd5c8b477ef8b2500f54719a794', '192.168.169.2', '1', '1508897090', '111.161.57.23', '0', '1508897090', '13904210133', '1', null, null, '0', '0', null);
INSERT INTO `v_personal` VALUES ('52', '哦哦哦123456', 'f0e8fb430bbdde6ae9c879a518fd895f', '192.168.169.2', '1', '1506863649', '113.230.193.235', '0', '1506863649', '13842173187', '1', null, null, '0', '0', null);
INSERT INTO `v_personal` VALUES ('54', 'ljz1012', '453e41d218e071ccfb2d1c99ce23906a', '192.168.169.2', '1', '1510367970', '111.194.105.148', '0', '1510367970', '13904210138', '1', '943043700', '/Uploads/Picture/2017-11-11/5a0662ebcab89.jpg', '0', '0', null);
INSERT INTO `v_personal` VALUES ('55', '微连网络123', 'e10adc3949ba59abbe56e057f20f883e', '192.168.169.2', '1', '1511781610', '114.249.16.231', '0', '1511781610', '13904210130', '1', '', null, '0', '0', null);
INSERT INTO `v_personal` VALUES ('56', 'zouxiaopang', '66317cd5c8b477ef8b2500f54719a794', '192.168.169.2', '1', '1511940862', '114.249.16.231', '0', '1511940862', '13904210155', '1', '820170555', '/Uploads/Picture/2017-11-29/5a1e631d3ee8f.jpg', '0', '0', null);
INSERT INTO `v_personal` VALUES ('57', 'zouxiao1', 'c4ca4238a0b923820dcc509a6f75849b', '114.249.16.231', '1', '1511946781', '114.249.16.231', '0', '1511946781', '13904210133', '1', null, null, '0', '0', null);
INSERT INTO `v_personal` VALUES ('59', 'zjl10111', 'be05f9920980f645adf25bb922e8d246', '123.151.77.81', '1', '1513560171', '123.151.77.81', '0', '1513560171', '13904210132', '1', null, null, '0', '0', null);

-- ----------------------------
-- Table structure for v_picture
-- ----------------------------
DROP TABLE IF EXISTS `v_picture`;
CREATE TABLE `v_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=940 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v_picture
-- ----------------------------
INSERT INTO `v_picture` VALUES ('1', '/Uploads/Picture/2014-10-28/544f500c443a7.jpg', '', 'ad06f28a6057180af22e6e14139ed236', '34f5b77a59a36455da106810a05a9821fad8bf53', '1', '1414483980');
INSERT INTO `v_picture` VALUES ('2', '/Uploads/Picture/2014-11-06/545b5b0b81e79.jpg', '', '6bc0ee7622a3a58ccdaa9831287a667a', 'd8cf1ce496d7bf130e245cf187dcd09dcf25ed86', '1', '1415273227');
INSERT INTO `v_picture` VALUES ('3', '/Uploads/Picture/2014-11-23/54716b40db342.jpg', '', '7d2b5c90acf11d61e0212b04d6dcb70f', '2b5199a0b7927474ac7fa66f5f7cd11f4d2f8a57', '1', '1416719168');
INSERT INTO `v_picture` VALUES ('4', '/Uploads/Picture/2014-11-23/54716b5b7e504.png', '', '326b46799d37a664a6d9b1664ff064de', '5c3e765f709297c09c68ebbc12134ad61b60147e', '1', '1416719195');
INSERT INTO `v_picture` VALUES ('5', '/Uploads/Picture/2014-11-23/547173fc7beb9.jpg', '', '0ff6b79c8f2a3c28f1799a73d16deed5', 'f420e2cf08b1bc354f92cc5e2c7ff75fcc357982', '1', '1416721404');
INSERT INTO `v_picture` VALUES ('6', '/Uploads/Picture/2014-11-23/54718b1ca641b.jpg', '', 'fb860abb46432b7d6b8923f7545c3471', '2d2f408dd1730b82bd46908788ee44db953e0470', '1', '1416727324');
INSERT INTO `v_picture` VALUES ('7', '/Uploads/Picture/2014-11-28/547814c618ca6.jpg', '', '5d0f3d49171a7ff34b63bbeae3abd164', '3defb840cf4f202218ba47e93764c17dcf7c85b7', '1', '1417155781');
INSERT INTO `v_picture` VALUES ('8', '/Uploads/Picture/2014-11-28/547816dfc9bba.jpg', '', '1f620a46ae60eedc5a2d5de115416b41', 'a92359e799b3caef059fdcc4a7bd523b1b7034c8', '1', '1417156319');
INSERT INTO `v_picture` VALUES ('9', '/Uploads/Picture/2014-11-28/547816e86b9d7.jpg', '', '4e6b863d50b6cfc19b2d4d9de381a08d', '34664c8c41a5c39fad8200753321d826c9a02744', '1', '1417156328');
INSERT INTO `v_picture` VALUES ('10', '/Uploads/Picture/2014-11-28/547816ecf000a.jpg', '', 'a81e808657e6b327d7fcd6c03659e976', '7c7989654fb61e5dfa4b845af7fbd3f08e5492ba', '1', '1417156332');
INSERT INTO `v_picture` VALUES ('11', '/Uploads/Picture/2014-12-03/547ead2d2979d.png', '', '8bc2a81a4ebbe3ff72e37eefc249bdc4', '1105260a8b219b19f2d3108d95ed37ffc68b0d87', '1', '1417588012');
INSERT INTO `v_picture` VALUES ('12', '/Uploads/Picture/2014-12-03/547ead44e1284.png', '', 'ed82b202386f01cec6799579903aa0b1', '74392da2336d74888abbe7a46789a67b6df782e1', '1', '1417588036');
INSERT INTO `v_picture` VALUES ('13', '/Uploads/Picture/2014-12-03/547ecff3a09fb.jpg', '', '2628613b81c377e559967d391f8744db', '1e9975f1224cdd06df1f5ff1f6eaf5c777f8afd1', '1', '1417596915');
INSERT INTO `v_picture` VALUES ('14', '/Uploads/Picture/2014-12-03/547ed56d51cee.jpg', '', 'c5f09b5768d292f45907fce9156d16b1', '889479d732b9da35e05dbdae7bfd9accf04e0567', '1', '1417598317');
INSERT INTO `v_picture` VALUES ('15', '/Uploads/Picture/2014-12-05/5481a1b2a0e3c.jpg', '', 'fe1adaf2cc6838da315c8788deda5844', 'c9f898e588dfed7b5a87a4d2e8117e74b768892e', '1', '1417781682');
INSERT INTO `v_picture` VALUES ('16', '/Uploads/Picture/2014-12-15/548e9a400d7f2.jpg', '', '2b04df3ecc1d94afddff082d139c6f15', '9c3dcb1f9185a314ea25d51aed3b5881b32f420c', '1', '1418631743');
INSERT INTO `v_picture` VALUES ('927', '/Uploads/Picture/2017-12-15/5a33861f0d58f.jpg', '', '9d377b10ce778c4938b3c7e2c63a229a', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1513326111');
INSERT INTO `v_picture` VALUES ('928', '/Uploads/Picture/2017-12-15/5a3386682a719.jpg', '', 'fafa5efeaf3cbe3b23b2748d13e629a1', '54c2f1a1eb6f12d681a5c7078421a5500cee02ad', '1', '1513326184');
INSERT INTO `v_picture` VALUES ('19', '/Uploads/Picture/2014-12-15/548e9aae786fd.jpg', '', '5a44c7ba5bbe4ec867233d67e4806848', '3b15be84aff20b322a93c0b9aaa62e25ad33b4b4', '1', '1418631854');
INSERT INTO `v_picture` VALUES ('20', '/Uploads/Picture/2014-12-15/548ea2bb6733b.jpg', '', '8969288f4245120e7c3870287cce0ff3', '1b4605b0e20ceccf91aa278d10e81fad64e24e27', '1', '1418633915');
INSERT INTO `v_picture` VALUES ('21', '/Uploads/Picture/2014-12-15/548eaf923567e.jpg', '', '076e3caed758a1c18c91a0e9cae3368f', 'f5f8ad26819a471318d24631fa5055036712a87e', '1', '1418637201');
INSERT INTO `v_picture` VALUES ('22', '/Uploads/Picture/2014-12-15/548eaf930f5a1.jpg', '', 'ba45c8f60456a672e003a875e469d0eb', '30420d1a9afb2bcb60335812569af4435a59ce17', '1', '1418637202');
INSERT INTO `v_picture` VALUES ('23', '/Uploads/Picture/2014-12-15/548eaf93cd919.jpg', '', 'bdf3bf1da3405725be763540d6601144', 'd997e1c37edc05ad87d03603e32ad495ee2cfce1', '1', '1418637203');
INSERT INTO `v_picture` VALUES ('24', '/Uploads/Picture/2014-12-18/5492627a7462d.png', '', '68bfc1bf8cf9edb595ad5bf1bf3ad457', 'd33ecb7668b001db407608c379cd784a2ef8a69b', '1', '1418879610');
INSERT INTO `v_picture` VALUES ('25', '/Uploads/Picture/2014-12-18/54926cbb77da6.png', '', 'd8cfd20c0a90c307d0d66c97d2a0e79c', 'f92f44d69865506756f3c9ba6b3d4faaf39c78c5', '1', '1418882235');
INSERT INTO `v_picture` VALUES ('53', '/Uploads/Picture/2014-12-18/54929feb7c4fa.jpg', '', '07cc893277f6c3950ed350f81a77d0a3', 'bc09fde42fa8008db39452439ed565de086a35f9', '1', '1418895339');
INSERT INTO `v_picture` VALUES ('27', '/Uploads/Picture/2014-12-18/549279474ce5f.png', '', '2584acb26951a6821f43b3ee379817c0', 'af2eef81eae1576b389b051c9678f828a56b50e1', '1', '1418885447');
INSERT INTO `v_picture` VALUES ('52', '/Uploads/Picture/2014-12-18/54929feae73ec.jpg', '', '4fa223e528a003271400ccd94e6f47ca', 'b8b0aa7587192aea3bf4bceea535a3be1ab99d6d', '1', '1418895338');
INSERT INTO `v_picture` VALUES ('63', '/Uploads/Picture/2014-12-18/5492adcd5cda7.png', '', '30e5705acc49c3dc4c8488112bec1e61', '11f623023e64f30dd8da2e5fe7de8a49477cffbb', '1', '1418898892');
INSERT INTO `v_picture` VALUES ('54', '/Uploads/Picture/2014-12-18/54929febc8ead.png', '', 'afcef7321f8d7ee456bde3c57267e47d', '7df0ea9d17de9396f956312133984f09a59dc5fa', '1', '1418895339');
INSERT INTO `v_picture` VALUES ('62', '/Uploads/Picture/2014-12-18/5492adc8d5988.jpg', '', '4a2123d3443a25efa144c1089e679024', '32214ccfb63dd29258239029f56e30326f5363b6', '1', '1418898888');
INSERT INTO `v_picture` VALUES ('49', '/Uploads/Picture/2014-12-18/54929cbcd06ce.jpg', '', '94d12e15b4d4f82aa0084ef41ea81a10', '833c6f6f937475af3d56ad9262f4101cd6a8594e', '1', '1418894524');
INSERT INTO `v_picture` VALUES ('33', '/Uploads/Picture/2014-12-18/54927c04c0e5b.jpg', '', '0ceb25b52ae6d25b6b2f1e5303026e9a', 'c65eb99cb10704727e1a096302b5ba071de80161', '1', '1418886148');
INSERT INTO `v_picture` VALUES ('47', '/Uploads/Picture/2014-12-18/54929c9e8bebc.png', '', '5383c8f9d92035b23e0f7e4a11208289', '7d5f0db9a43486529b41c7c45050afbbf7139762', '1', '1418894494');
INSERT INTO `v_picture` VALUES ('45', '/Uploads/Picture/2014-12-18/54929c9d83916.png', '', 'ff9309ac0263683cfa08c0057e2fb4b8', 'fe57694c55f23cf029bf1b3851b6fc35f0cd6a35', '1', '1418894493');
INSERT INTO `v_picture` VALUES ('61', '/Uploads/Picture/2014-12-18/5492a03ec0d48.png', '', '1e2c9ac6be1e926e17ad4f5af4028f78', 'fceda9a01e469fe9d7c353c7373867cc34be6452', '1', '1418895422');
INSERT INTO `v_picture` VALUES ('60', '/Uploads/Picture/2014-12-18/5492a03e4ad03.png', '', 'd935ddb1a3da7780c8fe34afbd1f8caa', 'ef0a3953b896e7ca5db987384750f7b377b6d0d9', '1', '1418895421');
INSERT INTO `v_picture` VALUES ('46', '/Uploads/Picture/2014-12-18/54929c9de4007.jpg', '', '7e7c55c11c2db0cf99670b5601a9aca2', '16878892c30e6fff067f97af03e3876c024e7afd', '1', '1418894493');
INSERT INTO `v_picture` VALUES ('39', '/Uploads/Picture/2014-12-18/5492974dae88e.png', '', 'c4b07b93371554d141658d69141009ba', 'cf74588b24d65f34667e5b795cf2c9bbf8770f42', '1', '1418893133');
INSERT INTO `v_picture` VALUES ('58', '/Uploads/Picture/2014-12-18/5492a02916377.png', '', 'fac45459999b7da239a9ff7c7017ff04', 'd29cd6b61093237d2c082da2baea871a20a43f32', '1', '1418895400');
INSERT INTO `v_picture` VALUES ('44', '/Uploads/Picture/2014-12-18/54929c9d07782.png', '', '62c6506a6a83517d86ca4030de8f4b73', '873ab79d77121cda56f4a70d9716ebb49a6e7a1f', '1', '1418894492');
INSERT INTO `v_picture` VALUES ('50', '/Uploads/Picture/2014-12-18/54929cd70ba09.png', '', '08a4586b08c91f3bcf3694d77618aefa', '8c9ff6383a776a841032c73436ce6a48abcfcfd7', '1', '1418894550');
INSERT INTO `v_picture` VALUES ('51', '/Uploads/Picture/2014-12-18/54929cd76f261.png', '', '14a4be4fa784370c19c8626f98501c49', '224d39955f880ca4074f05aeb497039ab0a97be7', '1', '1418894551');
INSERT INTO `v_picture` VALUES ('57', '/Uploads/Picture/2014-12-18/5492a0289fdf0.png', '', '2982661ffc441fc04e15322f769df645', '26d2847fe6c1bd38930bb122d7bcd366f012d60f', '1', '1418895400');
INSERT INTO `v_picture` VALUES ('59', '/Uploads/Picture/2014-12-18/5492a029721ce.png', '', '25a7ea982d7459a0c6444d3ed6b94c78', '940727248d9564379ba958e4702acdfe5430e2d4', '1', '1418895401');
INSERT INTO `v_picture` VALUES ('64', '/Uploads/Picture/2014-12-23/5498cc3f39081.png', '', 'b04326781cb9ffccc926a30e13eae7cf', '4299de82093baae70206e2dad949c7bfa76c02ef', '1', '1419299902');
INSERT INTO `v_picture` VALUES ('65', '/Uploads/Picture/2014-12-23/5499175b0b0aa.png', '', 'd1bfcbbdf6af938adfae04a30be020c9', '7b44d40ff2220ef44a55851360628154159b8645', '1', '1419319130');
INSERT INTO `v_picture` VALUES ('66', '/Uploads/Picture/2014-12-23/5499176426063.jpg', '', 'c20cbf64cb5d5ff049b50d09ebdc8e58', 'a49d5a65a8967443344351f2548b49b87b5570aa', '1', '1419319139');
INSERT INTO `v_picture` VALUES ('67', '/Uploads/Picture/2014-12-23/54991777516bc.png', '', 'ca5367657ea490dd9ca182e28f17e267', 'fad48536ae4a67cc8327fcee88b1ebef61afe445', '1', '1419319158');
INSERT INTO `v_picture` VALUES ('68', '/Uploads/Picture/2014-12-23/54991777d66d3.png', '', 'bf8bb3d40a30ad853f318b999a7cc4af', '81406214dd60d60686ee210c970f0ae156ff74a1', '1', '1419319159');
INSERT INTO `v_picture` VALUES ('69', '/Uploads/Picture/2014-12-23/54991778a54c6.png', '', '5dc61bf6ff7e9993b359d8dc792eb54a', '88fd1d942af3074e925572c7a9360a1e9bfebb18', '1', '1419319160');
INSERT INTO `v_picture` VALUES ('70', '/Uploads/Picture/2014-12-24/549a2dc3eb43c.png', '', '640658af5b6f18881b7bc869a60454c0', 'e59058a3f675ad6e357793f097e7789f411ebf47', '1', '1419390403');
INSERT INTO `v_picture` VALUES ('71', '/Uploads/Picture/2014-12-24/549a2f5b48809.png', '', '08547eedfd85d1fd02804f3fe188e781', '3ff075e856dce886199a60200a25bb080e8aee99', '1', '1419390810');
INSERT INTO `v_picture` VALUES ('72', '/Uploads/Picture/2014-12-24/549a641dd790f.png', '', 'b2dbd0f8fed9a35b4029ae295c400929', 'b561e4feb46372f0c9318186aa7d753c8030c106', '1', '1419404317');
INSERT INTO `v_picture` VALUES ('73', '/Uploads/Picture/2014-12-25/549b88c8a2934.png', '', 'b9564ecb9025ff70534ca7ae94f07f1f', 'd530da39f9f11ec3299cabe6f821454c61d54821', '1', '1419479239');
INSERT INTO `v_picture` VALUES ('74', '/Uploads/Picture/2015-03-30/5518e4a011273.jpg', '', '39ed894b773b48bcd6e5098a38f63213', '918bc440e3247ea6fd3844c7d4197551c5c19d1a', '1', '1427694751');
INSERT INTO `v_picture` VALUES ('75', '/Uploads/Picture/2015-03-30/5518e4aca6ac0.jpg', '', 'b4dcf90f900409f1efcf38e130601d84', '738db01efab62976bfb0824145b13238dd6657e1', '1', '1427694764');
INSERT INTO `v_picture` VALUES ('76', '/Uploads/Picture/2015-03-30/5518e4e08755a.png', '', '7ad5cdec99122d38230788a0e2125b1c', '166d15580146153176640388fcb2d8ed25e36c7c', '1', '1427694816');
INSERT INTO `v_picture` VALUES ('77', '/Uploads/Picture/2015-03-30/5518e900c6c13.jpg', '', 'e4c1a4c260eee48c22fb6956462eb5d1', '36a199dc27a2d3465017ae0dbbd3e63523bc1416', '1', '1427695872');
INSERT INTO `v_picture` VALUES ('78', '/Uploads/Picture/2015-03-30/5518ed47c839b.jpg', '', '70c77139d3d9fec007f0a5c45fde3d57', '2918c5c552962b7ed9de28c97d8e47be23243c4e', '1', '1427696967');
INSERT INTO `v_picture` VALUES ('79', '/Uploads/Picture/2015-03-30/5518ef268d2e3.png', '', '9a90d66f71b9e3109992c4fa21d83048', '188263c257bf28da13ab63e6b40ab0b5e76b6440', '1', '1427697446');
INSERT INTO `v_picture` VALUES ('80', '/Uploads/Picture/2015-07-13/55a32a7db1d71.jpg', '', 'b11c14989120b7d2f2c4ea81abcfb8be', '52246de49dc7d276a28b60dc2444729955d2da12', '1', '1436756605');
INSERT INTO `v_picture` VALUES ('81', '/Uploads/Picture/2015-07-13/55a32a8e7b7e5.jpg', '', '3d37d97a8f96360e93903a9a388109cd', 'bb09d41fccfcb4845b909a12e67d868402a57902', '1', '1436756622');
INSERT INTO `v_picture` VALUES ('82', '/Uploads/Picture/2015-07-13/55a330fe5aec4.jpg', '', '35f150d187e1f5881da4a96a9d46ec68', '565fb515e95a281fb2f776773a24b4f96e722303', '1', '1436758270');
INSERT INTO `v_picture` VALUES ('83', '/Uploads/Picture/2015-07-13/55a3325722918.png', '', 'bfd82e75fe1d435c8d34e8b468025859', 'b36585683c255204f3538da845d599a18f6ed347', '1', '1436758614');
INSERT INTO `v_picture` VALUES ('84', '/Uploads/Picture/2015-07-13/55a3326921a72.png', '', 'ec4cc21c5a2f28856de67c0186eb99fe', 'be54d20ce5062391c0a843b9347a6420b020905d', '1', '1436758632');
INSERT INTO `v_picture` VALUES ('85', '/Uploads/Picture/2015-09-08/55ee42cdc012b.jpg', '', '373ef0c656a04190e6789f10e2aeb4d8', 'f5ea1482b2c99c3e6292672ae67967b59268e3aa', '1', '1441678029');
INSERT INTO `v_picture` VALUES ('86', '/Uploads/Picture/2015-09-08/55ee448f9b5df.png', '', '5e93c62405ce87e6b6f0695497280f8a', '658b34e1df33925c3aa9835f404b6d431d2aff06', '1', '1441678479');
INSERT INTO `v_picture` VALUES ('87', '/Uploads/Picture/2015-09-08/55ee4736c4610.jpg', '', '05b82376fdd6c098b47b918adb4e6cdb', '5972cbe669348c3ee04b20c05faeccf1c9f3b8e9', '1', '1441679158');
INSERT INTO `v_picture` VALUES ('88', '/Uploads/Picture/2015-09-08/55ee474168dc2.jpg', '', '936966b837c894aec5d7c5ffe58fe710', '31b9257f0b814aa4f1f6b7374512011c09afd460', '1', '1441679169');
INSERT INTO `v_picture` VALUES ('89', '/Uploads/Picture/2015-09-08/55ee4780252d7.jpg', '', '6b64d045012f2a4451a4fe596ffb5052', 'ae74ef7b9adc1eadef73bcf44189ea1cc51199b0', '1', '1441679231');
INSERT INTO `v_picture` VALUES ('90', '/Uploads/Picture/2015-09-08/55ee47888a8df.jpg', '', '0edb889077a2b40ce0343df62d87d452', '710fe3d671e5e14e8ff5b4c09072da996f117cbb', '1', '1441679240');
INSERT INTO `v_picture` VALUES ('91', '/Uploads/Picture/2015-09-08/55ee4797d8f2d.jpg', '', '1643b8d109e148246532917040099abc', '2cc199b566c298a24aa2090030b1e25d2f607cf3', '1', '1441679255');
INSERT INTO `v_picture` VALUES ('92', '/Uploads/Picture/2015-09-08/55ee555a9f9b8.png', '', 'f753e6e5e7bdf35234cab015135414c5', 'd26a58c5343f239614e2f0fec39b1c642fadb402', '1', '1441682778');
INSERT INTO `v_picture` VALUES ('93', '/Uploads/Picture/2015-09-08/55ee5573085b7.png', '', '68031b07091a041c74bcd0efa5862020', '9d7c7e4cdad34c374ff2b01dab911f3865caae58', '1', '1441682802');
INSERT INTO `v_picture` VALUES ('94', '/Uploads/Picture/2015-09-08/55ee55a532eee.png', '', '1b3f4dc721a6675fb608cfa24092ab83', 'cdb1ff29da8880225123cac740ed20dca3fffa33', '1', '1441682853');
INSERT INTO `v_picture` VALUES ('95', '/Uploads/Picture/2015-09-08/55ee56d77f20b.jpg', '', '412393ca34f4443f906e6d2ca18c4ea9', '161e73f2f5323ebde512b8b27a3bb3a1a3a87d52', '1', '1441683159');
INSERT INTO `v_picture` VALUES ('96', '/Uploads/Picture/2015-11-16/5649476db27fd.jpg', '', 'bb16f0bc59ef480eb128040f5bf28e87', '492b43322b8c04ea495eae04de9e8c4cda954bb5', '1', '1447642989');
INSERT INTO `v_picture` VALUES ('97', '/Uploads/Picture/2015-11-16/56494792a2ccc.jpg', '', '6388c910755104b930dca8477b045550', 'e0723144afcf3b919be01eea43a3b48ac83e8083', '1', '1447643026');
INSERT INTO `v_picture` VALUES ('98', '/Uploads/Picture/2015-11-16/564949e244a16.png', '', '133a8b38e1e8a4bb9d4b608c08ec29f5', 'ae8c2b98f378c622639902f501ac90354cd6afe9', '1', '1447643617');
INSERT INTO `v_picture` VALUES ('99', '/Uploads/Picture/2015-11-16/564953abb222f.jpg', '', '0964ade23f3bc8e8e0fb0574a9fe8565', '1bb47791bfc7b2325ce07d21d758ef295479bbaa', '1', '1447646123');
INSERT INTO `v_picture` VALUES ('100', '/Uploads/Picture/2015-12-16/5670d1c5665e2.jpg', '', '12676865b0306ebbc0a637a19a749fe6', '44828dc3425994e50b0e4c4ea2faad1db20d38bd', '1', '1450234309');
INSERT INTO `v_picture` VALUES ('101', '/Uploads/Picture/2015-12-16/5670d1ed5fb1d.jpg', '', 'a400194466555bb7f6dbc18301bdea8c', '92490575eff61f631d57cd2366e79ca15bba5aa0', '1', '1450234349');
INSERT INTO `v_picture` VALUES ('102', '/Uploads/Picture/2015-12-16/5670d1f2681df.jpg', '', '460409702af2203847c5f8c698b1d83a', '3df011c7dea07a98eb3a95c35b017c4986b8c157', '1', '1450234354');
INSERT INTO `v_picture` VALUES ('103', '/Uploads/Picture/2015-12-16/5670d1f63c8ff.jpg', '', 'c8516ed63057ef03f65695f6a782d2bf', 'fe4ac7166e643f80dc69797924c521863a32be73', '1', '1450234358');
INSERT INTO `v_picture` VALUES ('104', '/Uploads/Picture/2017-04-21/58f9c0fcd3659.jpg', '', '1c7fba089d527cd85ca53d1c04a1e190', '3d1cf816d9c9f5bd62773f435df187d5770a0f45', '1', '1492762876');
INSERT INTO `v_picture` VALUES ('105', '/Uploads/Picture/2017-04-21/58f9c10a00505.jpg', '', 'ba7d5969c9b950bec3dd64b7708b2bfb', '1f4b85fa92c356b6e4855a9a0c5527fcb5db449e', '1', '1492762889');
INSERT INTO `v_picture` VALUES ('106', '/Uploads/Picture/2017-04-21/58f9c11a5c672.jpg', '', '232f697211e6f483ec83e59c062e546b', 'bf1998cb35f6157fa312a08819be7b59db7b8871', '1', '1492762906');
INSERT INTO `v_picture` VALUES ('107', '/Uploads/Picture/2017-04-21/58f9c19498ca1.jpg', '', '33875644bf5db936ad7ac56f679e0e42', '69fffe314e8130ec00ff23c310a56edfff58881c', '1', '1492763028');
INSERT INTO `v_picture` VALUES ('108', '/Uploads/Picture/2017-04-21/58f9c19692c60.jpg', '', '5dea58ff581d3d63fd6d723daf0587ba', '60f06be5dd7cc08e72646b8fe9ced9fa3563c819', '1', '1492763030');
INSERT INTO `v_picture` VALUES ('109', '/Uploads/Picture/2017-04-21/58f9c1988bd07.jpg', '', 'b851a1836e5ab4283ae85b730150ac85', '564e75a1b98293139b310e33a95541866a3777ba', '1', '1492763032');
INSERT INTO `v_picture` VALUES ('110', '/Uploads/Picture/2017-04-21/58f9c19a76abe.jpg', '', '939f68558f6f2dbe8425bb2788f99d4a', '4462baddfa082e37d86d6f80cbb6e75ce545c90a', '1', '1492763034');
INSERT INTO `v_picture` VALUES ('111', '/Uploads/Picture/2017-04-21/58f9c65fb9bc2.jpg', '', 'aea53824f6e44b5012d8dae5a5790b26', '8f7e5bbfd5785970672395c83ece493f30f499d6', '1', '1492764255');
INSERT INTO `v_picture` VALUES ('112', '/Uploads/Picture/2017-04-21/58f9c67560529.jpg', '', 'c4e8c0a1aac6ef574e9469bea181cbf3', 'da378d85689d87c0df9c8d5e2bbc9c850fe363fe', '1', '1492764277');
INSERT INTO `v_picture` VALUES ('113', '/Uploads/Picture/2017-04-21/58f9c687d6904.jpg', '', '55fdf21e08a76288846fc2e3f8f0c79a', 'ea5b0ba1a77c586207d8701f90bce1f28492ee0d', '1', '1492764295');
INSERT INTO `v_picture` VALUES ('114', '/Uploads/Picture/2017-04-21/58f9c69d52752.jpg', '', 'ffa60e312842fe2989c7e9f217f81789', '3927105855365b79f7f126dd62f61ba81f4c4f1f', '1', '1492764316');
INSERT INTO `v_picture` VALUES ('115', '/Uploads/Picture/2017-04-21/58f9c6b031a24.jpg', '', '57978696279d7e1111c0abf0c5f5a36d', '1424f0e1634ea49fc391cd008b8a21e4ad56edf8', '1', '1492764335');
INSERT INTO `v_picture` VALUES ('116', '/Uploads/Picture/2017-04-21/58f9c6caa301f.jpg', '', '49ec5d5df19ece14cee0f72c92402664', '6f9b5444692921cb2434080e746d1a13e6a919de', '1', '1492764362');
INSERT INTO `v_picture` VALUES ('117', '/Uploads/Picture/2017-04-21/58f9caf94520a.jpg', '', 'aa7ff6d1605317c1a30868b33bd85080', '2257e39206a31f3c44acf67e7c5fa0d8166c2a80', '1', '1492765432');
INSERT INTO `v_picture` VALUES ('118', '/Uploads/Picture/2017-04-21/58f9cdcdc14f0.jpg', '', '2e81bf2ad6b9e686931e37cce514075d', '364dcd1776b532197e850d6fea22deeea2d89f6e', '1', '1492766157');
INSERT INTO `v_picture` VALUES ('119', '/Uploads/Picture/2017-04-21/58f9d076626f6.jpg', '', '1e4658c53790158b0db7094f1a87c150', '1c0b5b244debf93b83d9eee33c1a8b276f0c7ce9', '1', '1492766837');
INSERT INTO `v_picture` VALUES ('120', '/Uploads/Picture/2017-04-22/58faaf824b38c.jpg', '', '9b5745222af05220df3209d5f7666773', 'b11cf90491958ec9997e17227d54c486304c46b7', '1', '1492823937');
INSERT INTO `v_picture` VALUES ('121', '/Uploads/Picture/2017-04-22/58fab2498ebea.jpg', '', '7fe2a7938d57919c218229073526a7c5', '01b841c87df55ea8810c2396516cf011dd770d92', '1', '1492824649');
INSERT INTO `v_picture` VALUES ('122', '/Uploads/Picture/2017-04-24/58fd4a190b64d.png', '', '67a0b8ea642082c8b9452bc95cab451d', 'c8a15152902d9a91e98b4bccc0324f0f6ec0da2c', '1', '1492994584');
INSERT INTO `v_picture` VALUES ('123', '/Uploads/Picture/2017-04-24/58fd4e5cc0357.png', '', 'd15bbc526c2e5a5be75636faea189c19', 'ceb8c3d6069f5a4e2d4c7547be1692846435de00', '1', '1492995676');
INSERT INTO `v_picture` VALUES ('124', '/Uploads/Picture/2017-04-25/58feb28f02ec2.jpg', '', '7afacda06cd603b6b9bfeeeb9dedd419', 'f1e378079040888310136f55bb901023b422e85f', '1', '1493086862');
INSERT INTO `v_picture` VALUES ('125', '/Uploads/Picture/2017-04-25/58feb2c2231bd.jpg', '', '6398b1a8b29c1e7cd7da6b3de2a78a97', 'f4261c4c18b93bde2d65d4e2884147e801e45c4a', '1', '1493086913');
INSERT INTO `v_picture` VALUES ('126', '/Uploads/Picture/2017-04-25/58feb40ced992.jpg', '', '8e0dcfa42da4c9fc884fb255c5324f88', 'bb4c52e5215bde41f697122804ca35253d5994e1', '1', '1493087244');
INSERT INTO `v_picture` VALUES ('127', '/Uploads/Picture/2017-04-25/58feb54d4ac8e.jpg', '', '6712a68efdcc3123465edbf5e942dbbc', '36f99c5a2f0130ccdd5ebd5659b0d20c7c64b419', '1', '1493087565');
INSERT INTO `v_picture` VALUES ('128', '/Uploads/Picture/2017-04-25/58feb557cfd31.jpg', '', '0501c3d02909754e60603df977fc6933', 'e7a3bc772345d002ea0cf1285520a5e5a99a326f', '1', '1493087575');
INSERT INTO `v_picture` VALUES ('129', '/Uploads/Picture/2017-04-25/58feb56510ae8.jpg', '', 'e672cc477c222f7f6a0efc0a6933926c', '2dd347c91886a64f4a5e9091a9b9340d909daabc', '1', '1493087588');
INSERT INTO `v_picture` VALUES ('130', '/Uploads/Picture/2017-04-25/58feb58f4a983.jpg', '', 'f179a96a642938231eb64a24a945ec65', 'be0db372cf65247927ce2a40d9ab34d6d4d6cbdd', '1', '1493087631');
INSERT INTO `v_picture` VALUES ('131', '/Uploads/Picture/2017-04-25/58feb637c8bcf.jpg', '', '01ff909c8c981e936229e6558b49ad60', '334c010a0c44a99a4325068fbbb6072196dd11b5', '1', '1493087799');
INSERT INTO `v_picture` VALUES ('132', '/Uploads/Picture/2017-04-26/5900644d41467.jpg', '', 'b488058982442315a76bc9bb2ce24fc5', '1e9d01bdea9515899f126502b053fb09670df4df', '1', '1493197901');
INSERT INTO `v_picture` VALUES ('133', '/Uploads/Picture/2017-04-26/59006b7e844d3.jpg', '', '8575d68596d15e760ed704654be76dde', 'a20bf56ba66aa606ec8e0fd2fc1109bc11b9f6e0', '1', '1493199742');
INSERT INTO `v_picture` VALUES ('134', '/Uploads/Picture/2017-04-26/59006b800f00f.jpg', '', '02ae7afe39ddb0fe7bcd442d9356e41f', '66b6ee918b0246577283683fd3a5289e1e0eed8f', '1', '1493199743');
INSERT INTO `v_picture` VALUES ('135', '/Uploads/Picture/2017-04-26/59006c3a52e83.jpg', '', 'b3db3d38dcbc9f73db92baa55b373732', 'bfb138904c3186b32b0e72c4f674084bc46b79cc', '1', '1493199930');
INSERT INTO `v_picture` VALUES ('136', '/Uploads/Picture/2017-04-27/59013edb36644.png', '', 'c84b1faa304f02663cb62efc9fdb74b8', '82b7b2fc43e0579610b843f9b9eb1bf9c26e4cae', '1', '1493253850');
INSERT INTO `v_picture` VALUES ('137', '/Uploads/Picture/2017-04-27/5901482b17ce2.png', '', 'aacc35791351b21895d911ed86276717', '9711fca94ffec7341c7a1ba381608d436f812541', '1', '1493256234');
INSERT INTO `v_picture` VALUES ('138', '/Uploads/Picture/2017-04-27/59014ae116056.jpg', '', 'df194184b1199a7597015ba4ee244c8e', '10615264eca86bc6fb9b4375b7531726a4885887', '1', '1493256928');
INSERT INTO `v_picture` VALUES ('139', '/Uploads/Picture/2017-05-04/590a81aae487c.jpg', '', 'c9096c5861886244e13dd5757d6d1a16', '4fe302c9f5ddcaa165798d58a1ca462c4bdf1155', '1', '1493860778');
INSERT INTO `v_picture` VALUES ('140', '/Uploads/Picture/2017-05-04/590a8292e995d.jpg', '', '6235c49d7050a338a0dac6572071c537', 'bbe979025c6a4d9344e1883f6768f086bb06b21b', '1', '1493861010');
INSERT INTO `v_picture` VALUES ('141', '/Uploads/Picture/2017-05-04/590a82990403b.jpg', '', '302057fabb36b6bab9adc1f756f20517', 'b6917f9cc436ea074abc19b4d1a37ab75c51fdb3', '1', '1493861016');
INSERT INTO `v_picture` VALUES ('142', '/Uploads/Picture/2017-05-04/590a861fe789d.jpg', '', '1d58370e2cc01bb7bef436e357872e6d', '28a35b48a117375fdb43765899620dc18e74fad2', '1', '1493861919');
INSERT INTO `v_picture` VALUES ('143', '/Uploads/Picture/2017-05-04/590a8638446a6.jpg', '', 'e620b819ea38e420b879a43f6ec1eb76', 'cd1fe60b51426607f65b1b7235bd624fc0f1942a', '1', '1493861944');
INSERT INTO `v_picture` VALUES ('144', '/Uploads/Picture/2017-05-04/590a8645b3bfa.jpg', '', '72b2830566ed53657140340eee4e4255', 'ec193ff143768fc2f4eb8d03b7014f1e0fa62334', '1', '1493861957');
INSERT INTO `v_picture` VALUES ('145', '/Uploads/Picture/2017-05-04/590a8749a611c.jpg', '', '84b6de015b9a0d3bf093cbb67037a117', '7a3706ea9056e4d3e50a211f8b181a159a67e30c', '1', '1493862217');
INSERT INTO `v_picture` VALUES ('146', '/Uploads/Picture/2017-05-04/590a875aee58a.jpg', '', '9482c9b05daa8f5352866d9e0b243573', 'e7abba40d96216a401eb218abc94deeced37b384', '1', '1493862234');
INSERT INTO `v_picture` VALUES ('147', '/Uploads/Picture/2017-05-04/590a8ae3b7a8e.jpg', '', 'b5dedcf7c50dedf8f907ae0d7035f946', 'f125c8f576fd6ddd51a52fb57a7687131dbe313e', '1', '1493863139');
INSERT INTO `v_picture` VALUES ('148', '/Uploads/Picture/2017-05-04/590a8aefa2b89.jpg', '', '5d57189904e42dd2a80d6fffca647d89', '5d5b442b01fd5fcc5e0c1d06c69e5a976b872983', '1', '1493863151');
INSERT INTO `v_picture` VALUES ('149', '/Uploads/Picture/2017-05-04/590a99e7697ce.jpg', '', 'd271bc698e74d12274f7c7a264079af7', '6a1d95b66e390e62d29550d2bfc1ad291caf7f6b', '1', '1493866983');
INSERT INTO `v_picture` VALUES ('150', '/Uploads/Picture/2017-05-04/590aa3e8c0379.jpg', '', '95eda317cd18b7deb088b1183413a42c', 'af08e23756d3c9eee36a202d4acae881ea9c146f', '1', '1493869544');
INSERT INTO `v_picture` VALUES ('151', '/Uploads/Picture/2017-05-04/590abb945d104.jpg', '', '6178c70064132407e63ba6e1e1062283', '1780306248b747e1e3c8dcf5e47cbe4d43130386', '1', '1493875604');
INSERT INTO `v_picture` VALUES ('152', '/Uploads/Picture/2017-05-04/590abba37e343.jpg', '', '3cf5b18746627d424dd7bdf7302fc937', '0f6bb765df302d98da44c7e83a11b480a8811201', '1', '1493875619');
INSERT INTO `v_picture` VALUES ('153', '/Uploads/Picture/2017-05-04/590abbb1ed6d6.jpg', '', '93c297d2c83e318499f0883a9bba9db6', 'aa7018693626d57d0afb3a236f5b38c9a2d637e6', '1', '1493875633');
INSERT INTO `v_picture` VALUES ('154', '/Uploads/Picture/2017-05-04/590ac9848947c.jpg', '', 'f5d15e3e935a4fa243610684a95698ab', 'c253fe2fb9ebb0dda118a346d69056933d8c04b5', '1', '1493879172');
INSERT INTO `v_picture` VALUES ('155', '/Uploads/Picture/2017-05-10/591269cca28f6.png', '', '3f249022381359bec229f9d638c32019', 'e7fd635a9fd4c02bd8a841d81f81b405ea0177bc', '1', '1494378956');
INSERT INTO `v_picture` VALUES ('156', '/Uploads/Picture/2017-05-10/591269dbb3eb8.jpg', '', '617bd3aa694e9a6c08d64ac0f326838d', 'f655bb56f1f4d70a792344773ea7debbd80c9c50', '1', '1494378971');
INSERT INTO `v_picture` VALUES ('157', '/Uploads/Picture/2017-05-10/59126c3ff25b9.jpg', '', 'd4f8324a327c0ec8d5bebce03f5cacbe', '19f3b25da90322566461386556267db260dc5bcb', '1', '1494379583');
INSERT INTO `v_picture` VALUES ('158', '/Uploads/Picture/2017-05-10/59126c5140c04.jpg', '', '8a8d645905ee9ea639b9e8735f61c34c', '61b47868898130e654741db3833d1775ab487541', '1', '1494379601');
INSERT INTO `v_picture` VALUES ('159', '/Uploads/Picture/2017-05-10/59126c5e01aef.jpg', '', 'f04fd5e05464a9807ae8e8f4f6313a98', '2fcb5b40cfb7b70dbf3fad0535fb9e200ccb9c55', '1', '1494379613');
INSERT INTO `v_picture` VALUES ('160', '/Uploads/Picture/2017-06-17/5944c7592591b.jpg', '', 'f8acc74690346def15cbb4818609576e', 'b59787857f2be6da84c5c75353f4a31a7416ae02', '1', '1497679704');
INSERT INTO `v_picture` VALUES ('161', '/Uploads/Picture/2017-06-17/5944c7639d31f.jpg', '', '96a04b3f302f0a1b232f3375c5cee745', '1bb7e95f11f066e6b223d3e5e5d960acab0d988e', '1', '1497679715');
INSERT INTO `v_picture` VALUES ('162', '/Uploads/Picture/2017-06-17/5944c85843b08.jpg', '', '6dea00cff9b8be5a23b0125e20c621a4', '8d7145937aa45419143b02aa23094106b87b3353', '1', '1497679960');
INSERT INTO `v_picture` VALUES ('278', '/Uploads/Picture/2017-08-30/59a61c2f84e7d.jpg', '', '250b632c57bcb9e5931606d88312f706', '143589033289ede7c4044f9f55ded868175f0798', '1', '1504058415');
INSERT INTO `v_picture` VALUES ('164', '/Uploads/Picture/2017-07-13/5966d74b2f0c1.jpg', '', 'efe811b30d61681eca9aab2598927674', '61c77e44aff870623584de465e2ab684b56c0402', '1', '1499912010');
INSERT INTO `v_picture` VALUES ('165', '/Uploads/Picture/2017-07-13/5966d7badebca.jpg', '', '28ed45836093ec186ff5b2e26dcc041b', '1222d4fd582c9b852aaf1f8d0c24fee910a7da3f', '1', '1499912122');
INSERT INTO `v_picture` VALUES ('166', '/Uploads/Picture/2017-07-13/5966d7bb2b3b2.jpg', '', '5153e5cf7f03a4f7b7947113b33e3c50', '137528b490a7c84e8deca9fad776b8ee080d9e8e', '1', '1499912122');
INSERT INTO `v_picture` VALUES ('167', '/Uploads/Picture/2017-07-13/5966d7bd08e30.jpg', '', '030143091485704b32215f33d28cb423', 'bc0f07107614817cb7d807239efcad53cb86f814', '1', '1499912124');
INSERT INTO `v_picture` VALUES ('168', '/Uploads/Picture/2017-07-13/5966d96f5cec5.jpg', '', '794fc3120ab3b17fc263148b2d2ac9b6', 'ac6b03137c38d98d4a90adf40fc3574c336d0094', '1', '1499912559');
INSERT INTO `v_picture` VALUES ('897', '/Uploads/Picture/2017-09-20/59c1dfda33497.jpg', '', '2ec80419fa47fb4d09b7d9bb6cbf4065', '768cad450e59b42a91f843a641286f5b560efd07', '1', '1505877978');
INSERT INTO `v_picture` VALUES ('170', '/Uploads/Picture/2017-07-13/596721d1ac078.png', '', '22c6eb65646d8cc18aca573682612487', 'ed5d74786341786410218981ee9b299d775ce876', '1', '1499931089');
INSERT INTO `v_picture` VALUES ('581', '/Uploads/Picture/2017-09-01/59a91cf60cb56.jpg', '', 'd60e25155df0e69d7e4bb69c58987571', '2ffe4e1c6b3fe36ba64cf5ee04e214afd74c21c1', '1', '1504255222');
INSERT INTO `v_picture` VALUES ('172', '/Uploads/Picture/2017-07-13/596723793ccdb.jpg', '', 'd9c26660a632d1f33a4185fa2f9e72d2', '6ae33feb7d6c33de0a329b36f4331a6aa8e83165', '1', '1499931513');
INSERT INTO `v_picture` VALUES ('173', '/Uploads/Picture/2017-07-13/596723dbcb59f.jpg', '', 'ff0ab21789408f8a6350a3b47736afd6', '8f3637882200972546a6b3fdeadbc9f811df7c4e', '1', '1499931611');
INSERT INTO `v_picture` VALUES ('174', '/Uploads/Picture/2017-07-13/5967240864be5.jpg', '', 'b6d6ef3f97e86a03641a49e9788c717d', '32e713c2e30a66ba2eff98862ead3df66db7cf91', '1', '1499931656');
INSERT INTO `v_picture` VALUES ('175', '/Uploads/Picture/2017-07-13/5967243b63d7a.jpg', '', 'dcb4137ec78d25a140631d2bfe97a95a', '2639f4f5c9e2bd021f2a3fd5d2d71af3de48a950', '1', '1499931707');
INSERT INTO `v_picture` VALUES ('176', '/Uploads/Picture/2017-07-13/596724588540d.JPG', '', 'f229ae93dfb69f3d90865ab10019ddfd', '03617fcd59781b9ea2eb6d0bc7af8f0ed194fb6f', '1', '1499931736');
INSERT INTO `v_picture` VALUES ('177', '/Uploads/Picture/2017-07-13/59672a80293d5.jpg', '', 'c4bb3edff1dc4a0806a708080529538f', '1dd323fb0aa3a144443a03cdd93bd600f6203a71', '1', '1499933311');
INSERT INTO `v_picture` VALUES ('178', '/Uploads/Picture/2017-07-13/59672aaf5e04b.jpg', '', 'aa936ec5c07dc1587deb4b6eeb491fa4', '425a26814d0a45827dfb297def2668f20bc76761', '1', '1499933359');
INSERT INTO `v_picture` VALUES ('179', '/Uploads/Picture/2017-07-13/59672ac3e0ba7.jpg', '', 'bee956fa18f4a9d741b36c628af8d565', 'c61eb3862378fb5489aebfb38544f59fb57d190a', '1', '1499933379');
INSERT INTO `v_picture` VALUES ('180', '/Uploads/Picture/2017-07-13/5967386cb3c31.jpg', '', '7048f4ea2ebadbcbd72116c084a31b80', '99120250296ac0b235eb18444a9bf443b10404fe', '1', '1499936876');
INSERT INTO `v_picture` VALUES ('181', '/Uploads/Picture/2017-07-13/5967386d2e0e5.jpg', '', 'b2890a07b095d832a1f29106db4ca276', '7b10aa6d02ecc96cc8e55a49d517ded0497fdd4c', '1', '1499936877');
INSERT INTO `v_picture` VALUES ('182', '/Uploads/Picture/2017-07-14/59687c73f2e3f.jpg', '', '851394fd308f8ff6fade15bcb138d553', 'e2a47f3b18aed32b0afc300ad53374857acde0ad', '1', '1500019827');
INSERT INTO `v_picture` VALUES ('183', '/Uploads/Picture/2017-07-15/596967bb30325.png', '', '0e564b74fc004557c1d1e961f499f6ef', '71a99d39c37dddf23bf92c97cddc40c4c07f48ec', '1', '1500080058');
INSERT INTO `v_picture` VALUES ('184', '/Uploads/Picture/2017-07-15/5969699120359.png', '', '05a3e6fd571dd2c950d1403d01346d76', '66d223a2e03a27ced9c1ee93fa62d0a9fd41f8e9', '1', '1500080528');
INSERT INTO `v_picture` VALUES ('185', '/Uploads/Picture/2017-08-03/59827ffe65a5b.jpg', '', '304ee3d8cfc5851a17386494e0365199', 'd26bf535299ab2a99307402d932e4c00d472359b', '1', '1501724670');
INSERT INTO `v_picture` VALUES ('186', '/Uploads/Picture/2017-08-04/5983c876bc78b.jpg', '', '57e515a870b7300d7b1bbb2a20513392', 'edeb17dfc02ecf618b75e674a31a35041658a830', '1', '1501808758');
INSERT INTO `v_picture` VALUES ('187', '/Uploads/Picture/2017-08-04/5983c88a81c50.jpg', '', 'f6b777d8cd69d72f40129d477c29702a', 'be3318b94440526e70f0955c74f0f49fbb655705', '1', '1501808778');
INSERT INTO `v_picture` VALUES ('188', '/Uploads/Picture/2017-08-04/5983c8979f2c5.jpg', '', '89df7aefad8dc4a17e8ae2191fe0db0a', 'edc2c360edf4400f7954d34da0d5a0e013b13276', '1', '1501808791');
INSERT INTO `v_picture` VALUES ('189', '/Uploads/Picture/2017-08-04/5983c8a1a2177.jpg', '', 'c5cc9e0349d908b2abaae7fc925f6e17', '0e391869223bb6f2ee615a368648c88d89e3987f', '1', '1501808801');
INSERT INTO `v_picture` VALUES ('191', '/Uploads/Picture/2017-08-09/598ac0edcf0df.png', '', '58bed5d3b2ac1944a3d9130902aad79e', 'beb82a7e2d2e5e92803901afe442f5e1b9061100', '1', '1502265581');
INSERT INTO `v_picture` VALUES ('892', '/Uploads/Picture/2017-09-20/59c1bad4250de.jpg', '', '65a9ab4a15d8d8de364b07b7699e018f', '4ab86cc0874b997593ccaaebc85abf3e8884b5e3', '1', '1505868500');
INSERT INTO `v_picture` VALUES ('274', '/Uploads/Picture/2017-08-30/59a61c0f54a70.jpg', '', '3aacc93c12158cb52f647aa3aba16c2a', '421b2539d68d5d956818ebc754ed5996ee58cd97', '1', '1504058383');
INSERT INTO `v_picture` VALUES ('273', '/Uploads/Picture/2017-08-30/59a61c0ab48cd.jpg', '', '0f2702fd15da7a34928123b0ca87960e', '98c54cf618be295b500dfe05105c580b0b2ba571', '1', '1504058378');
INSERT INTO `v_picture` VALUES ('896', '/Uploads/Picture/2017-09-20/59c1dfda0f6da.gif', '', 'c10222f43456b9de89922e865517035b', '8d6bf4598810476c4b4a9d924e526e0f52940926', '1', '1505877978');
INSERT INTO `v_picture` VALUES ('199', '/Uploads//Picture/2017-08-10/598c08fe9f29c.jpg', '', '2fe59f05e5577ae16d8ee111ebe996b0', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1502349566');
INSERT INTO `v_picture` VALUES ('200', '/Uploads/Picture/2017-08-10/598c09b440518.png', '', 'd54b3237dfedffe56d2a3b1faa9beb43', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1502349748');
INSERT INTO `v_picture` VALUES ('201', '/Uploads/Picture/2017-08-10/598c1f14113d2.jpg', '', 'f49b1d22567c4333b1bc021df9d62514', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1502355220');
INSERT INTO `v_picture` VALUES ('202', '/Uploads/Picture/2017-08-11/598d04cde9b35.jpg', '', 'fb2b3f6d5cc0dce6afea73f4fddf1b00', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1502414029');
INSERT INTO `v_picture` VALUES ('203', '/Uploads/Picture/2017-08-11/598d07b22e0b4.jpg', '', 'bb3c639d6d96f65b9f9e6807619a3e11', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1502414770');
INSERT INTO `v_picture` VALUES ('204', '/Uploads/Picture/2017-08-11/598d07f0e6c7c.jpg', '', '2daf600f96006034ac7064a6e8783b00', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1502414832');
INSERT INTO `v_picture` VALUES ('205', '/Uploads/Picture/2017-08-11/598d07f8237d7.jpg', '', 'b7efc2f0afadc918c78955c4c41eabd1', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1502414840');
INSERT INTO `v_picture` VALUES ('206', '/Uploads/Picture/2017-08-11/598d084e98813.jpg', '', '91f98503bb65b2e2ed68511d36ef3f06', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1502414926');
INSERT INTO `v_picture` VALUES ('207', '/Uploads/Picture/2017-08-11/598d09adf1842.jpg', '', '4b23ac51c97630361e118c1cd896850a', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1502415277');
INSERT INTO `v_picture` VALUES ('208', '/Uploads/Picture/2017-08-11/598d0a57c596f.jpg', '', '679867051a0e6a813f1b867ca6b9fc7a', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1502415447');
INSERT INTO `v_picture` VALUES ('209', '/Uploads/Picture/2017-08-11/598d0a9b88f4b.jpg', '', '0d76dcd399577b3a6e286044c73ce477', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1502415515');
INSERT INTO `v_picture` VALUES ('210', '/Uploads/Picture/2017-08-11/598d1048a2fe8.jpg', '', 'bf910959ccc35aaa6b83ca4853cebd3f', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1502416968');
INSERT INTO `v_picture` VALUES ('211', '/Uploads/Picture/2017-08-11/598d11ab60b29.jpg', '', '1e18a8381cfd88c5fa46849a0cc5595e', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1502417323');
INSERT INTO `v_picture` VALUES ('212', '/Uploads/Picture/2017-08-11/598d13084c57a.jpg', '', 'af548152fce8296636e4597001e84e19', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1502417672');
INSERT INTO `v_picture` VALUES ('213', '/Uploads/Picture/2017-08-11/598d750819979.jpg', '', '3943a9e7b482c8e20638aaf125a54d5a', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1502442760');
INSERT INTO `v_picture` VALUES ('214', '/Uploads/Picture/2017-08-11/598d85f977fa3.jpg', '', '09ae286e25e653564d045514b91aa2b3', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1502447097');
INSERT INTO `v_picture` VALUES ('215', '/Uploads/Picture/2017-08-11/598d750819979.jpg', '', '3943a9e7b482c8e20638aaf125a54d5a', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1502442760');
INSERT INTO `v_picture` VALUES ('271', '/Uploads/Picture/2014-10-28/544f500c443a7.jpg', '', 'ad06f28a6057180af22e6e14139ed236', '34f5b77a59a36455da106810a05a9821fad8bf53', '1', '1414483980');
INSERT INTO `v_picture` VALUES ('217', '/Uploads/Picture/2017-08-14/59910445343d4.jpg', '', 'df46a128e6796ff51731c6d0eb69260d', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1502676037');
INSERT INTO `v_picture` VALUES ('218', '/Uploads/Picture/2017-08-14/599142f41d4af.gif', '', 'f6504318c8de4c341a5cb2f59f6c9bf5', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1502692084');
INSERT INTO `v_picture` VALUES ('219', '/Uploads/Picture/2017-08-14/59916333e186e.jpg', '', 'd1d43ef7f0d3448d4d569ee8c7613fe9', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1502700339');
INSERT INTO `v_picture` VALUES ('220', '/Uploads/Picture/2017-08-14/599168843d0bc.jpg', '', '956d12673642a4a31722f5e3e5c983cb', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1502701700');
INSERT INTO `v_picture` VALUES ('221', '/Uploads/Picture/2017-08-14/59916bacc6cb0.jpg', '', 'cffd0343ff38bd9bc459889e7019ddad', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1502702508');
INSERT INTO `v_picture` VALUES ('222', '/Uploads/Picture/2017-08-16/5993f1e31a25e.jpg', '', 'ca4ea5f5a0521bf259a5af2b350b6cf5', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1502867939');
INSERT INTO `v_picture` VALUES ('224', '/Uploads/Picture/2017-08-23/599d1ad0a03f8.jpg', '', '5091e1a5e24dc72e7e305367e07c6382', '10ad5c492df039f23e2a066552b7fd9d6714914d', '1', '1503468240');
INSERT INTO `v_picture` VALUES ('225', '/Uploads/Picture/2017-08-23/599d1b273ba6e.jpg', '', '085aa9ef8c8f531e8069b507933f0301', '5f7de48f75d446141b6be1569a544be9d3c64c1d', '1', '1503468327');
INSERT INTO `v_picture` VALUES ('226', '/Uploads/Picture/2017-08-23/599d4761758f5.jpg', '', '4ae3955bc0e13a8388cc34aca007bccd', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503479649');
INSERT INTO `v_picture` VALUES ('227', '/Uploads/Picture/2017-08-23/599d47bde666c.jpg', '', '491fda923315ea8f99153377107ca893', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503479741');
INSERT INTO `v_picture` VALUES ('228', '/Uploads/Picture/2017-08-23/599d4804252ef.jpg', '', '0a1cdabb827b44cb0c449fff9cfd61f6', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503479812');
INSERT INTO `v_picture` VALUES ('229', '/Uploads/Picture/2017-08-23/599d4886968ce.jpg', '', '53ecb3b8f47511c29d02b8b8f71fda78', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503479942');
INSERT INTO `v_picture` VALUES ('230', '/Uploads/Picture/2017-08-23/599d4a5d65b7d.jpg', '', '44ad62be923d85e226a8c2c5a305ff95', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503480413');
INSERT INTO `v_picture` VALUES ('231', '/Uploads/Picture/2017-08-23/599d4ae406e26.jpg', '', '06ae2d335b3d945046e67ae550a2c7a1', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503480548');
INSERT INTO `v_picture` VALUES ('232', '/Uploads/Picture/2017-08-24/599e33924e230.jpg', '', 'accaca6b80fcfc21126b41b92f48d044', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503540114');
INSERT INTO `v_picture` VALUES ('233', '/Uploads/Picture/2017-08-24/599e34084593c.jpg', '', '6e5f450b1b10e4edd98f2fe48bc122f7', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503540232');
INSERT INTO `v_picture` VALUES ('234', '/Uploads/Picture/2017-08-24/599e3460678f3.jpg', '', '7005f08c3f3ec5886739026ba1546614', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503540320');
INSERT INTO `v_picture` VALUES ('235', '/Uploads/Picture/2017-08-24/599e34e16875e.jpg', '', '0e31344af9f42aed923491d626e609d8', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503540449');
INSERT INTO `v_picture` VALUES ('236', '/Uploads/Picture/2017-08-24/599e350a57d67.jpg', '', 'cc32526b31877a63d07d934e028b0057', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503540490');
INSERT INTO `v_picture` VALUES ('237', '/Uploads/Picture/2017-08-24/599e3566b6e03.jpg', '', '7116c998ba479cb57e4a581710a67f6e', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503540582');
INSERT INTO `v_picture` VALUES ('238', '/Uploads/Picture/2017-08-24/599e35a484bf2.jpg', '', '73eb0eae9499b9e384e8826957e9e060', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503540644');
INSERT INTO `v_picture` VALUES ('239', '/Uploads/Picture/2017-08-24/599e36c91f9d1.jpg', '', 'e371c30cb2358773ea83df28950750d7', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503540937');
INSERT INTO `v_picture` VALUES ('240', '/Uploads/Picture/2017-08-24/599e37003a976.jpg', '', '5abcf67ede51515f6cdaf59000941299', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503540992');
INSERT INTO `v_picture` VALUES ('241', '/Uploads/Picture/2017-08-24/599e37107c010.jpg', '', '8d34a89119e6fafbf341ef59af306cf0', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503541008');
INSERT INTO `v_picture` VALUES ('242', '/Uploads/Picture/2017-08-24/599e371f7063c.gif', '', '30cb094701c0c5758a5c9f9bd7d1715d', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503541023');
INSERT INTO `v_picture` VALUES ('243', '/Uploads/Picture/2017-08-24/599e376325131.gif', '', '8270dce09eb2b994a30ab0cd796b90db', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503541091');
INSERT INTO `v_picture` VALUES ('244', '/Uploads/Picture/2017-08-24/599e37ead8c97.gif', '', 'a8995f4db67584f7ad1b7479f8dbdb7a', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503541226');
INSERT INTO `v_picture` VALUES ('245', '/Uploads/Picture/2017-08-24/599e382844bdf.jpg', '', '95f8ccfa6145ff8b1d19a28c364a3dae', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503541288');
INSERT INTO `v_picture` VALUES ('246', '/Uploads/Picture/2017-08-24/599e384fdcb6d.jpg', '', '6eeb0715a8c0f1dd8dce15aac0f31bf6', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503541327');
INSERT INTO `v_picture` VALUES ('247', '/Uploads/Picture/2017-08-24/599e39358e98e.jpg', '', '5fccb4b6dee7317f5f90418ce18fac06', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503541557');
INSERT INTO `v_picture` VALUES ('248', '/Uploads/Picture/2017-08-24/599e3d228e9a0.jpg', '', '3bdb86aec408eef89449f34fa4dd3d99', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503542562');
INSERT INTO `v_picture` VALUES ('249', '/Uploads/Picture/2017-08-24/599e3e6a24323.jpg', '', '339bd926355988d36bd2d34a1e9eb8dd', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503542890');
INSERT INTO `v_picture` VALUES ('250', '/Uploads/Picture/2017-08-24/599e81da03dea.jpg', '', 'ed0b882e851dbc48c75cc4679ad2e3bf', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503560154');
INSERT INTO `v_picture` VALUES ('251', '/Uploads/Picture/2017-08-25/599f83cede01a.jpg', '', '264bdf0dc9129a327791e5feb8511d21', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503626190');
INSERT INTO `v_picture` VALUES ('252', '/Uploads/Picture/2017-08-25/599f83ee402f1.gif', '', '3f2bd2d04dc4130dc831dc7ff4ea7f24', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503626222');
INSERT INTO `v_picture` VALUES ('253', '/Uploads/Picture/2017-08-25/599f840741c55.jpg', '', '9b8368fc3c501a4e4d8c1fad9d7684ea', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503626247');
INSERT INTO `v_picture` VALUES ('254', '/Uploads/Picture/2017-08-25/599f841f29ce0.jpg', '', '70f5dd3f70e071d033ca1ae41c32303f', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503626271');
INSERT INTO `v_picture` VALUES ('255', '/Uploads/Picture/2017-08-25/599f84368f33e.jpg', '', '76e20b30f1bacbc8ab7caf564c19f3aa', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503626294');
INSERT INTO `v_picture` VALUES ('256', '/Uploads/Picture/2017-08-25/599f844ec75f0.jpg', '', 'b38e104d32b037a1a7b72f6c028bb3de', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503626318');
INSERT INTO `v_picture` VALUES ('257', '/Uploads/Picture/2017-08-25/599f8463c8d36.jpg', '', 'd0c8bae45d6d70427aeb69184f21111f', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503626339');
INSERT INTO `v_picture` VALUES ('258', '/Uploads/Picture/2017-08-25/599f84be4cdf7.png', '', 'fcf098dda057984c2e180935f8e9e880', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503626430');
INSERT INTO `v_picture` VALUES ('259', '/Uploads/Picture/2017-08-25/599f853aab828.png', '', '40b2ac8ae55b21ea081acaf8c124fa1a', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503626554');
INSERT INTO `v_picture` VALUES ('260', '/Uploads/Picture/2017-08-25/599f8548c6d95.png', '', '285cad622e7b7d4135ba57c02cb7d720', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503626568');
INSERT INTO `v_picture` VALUES ('261', '/Uploads/Picture/2017-08-25/599f8581e0515.png', '', 'c7324b611ec2004d606f91799f5ae888', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503626625');
INSERT INTO `v_picture` VALUES ('262', '/Uploads/Picture/2017-08-25/599f859a48e0b.png', '', 'bff51719687eea5caf920b6d9b7e9e85', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503626650');
INSERT INTO `v_picture` VALUES ('263', '/Uploads/Picture/2017-08-25/599f85c38bb75.gif', '', '52ccbeb072b7bbf89374f90125e17077', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503626691');
INSERT INTO `v_picture` VALUES ('264', '/Uploads/Picture/2017-08-25/599f873c0683a.jpg', '', '93583f3aa285daebe54f88a3dc6f7719', '4e09b0774a910e454e4dec68d6300b8664f276fb', '1', '1503627067');
INSERT INTO `v_picture` VALUES ('265', '/Uploads/Picture/2017-08-25/599fc15f8674c.jpg', '', '1f5e6555e44fc99b5b368acf764886e0', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503641951');
INSERT INTO `v_picture` VALUES ('266', '/Uploads/Picture/2017-08-25/599fc27376dc6.jpg', '', 'd013c29428a6a8329bd6cc2d1dc408b2', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503642227');
INSERT INTO `v_picture` VALUES ('267', '/Uploads/Picture/2017-08-28/59a3764911fbc.jpg', '', '2e63b8bc17d9d674e821a8821b6fc95c', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503884873');
INSERT INTO `v_picture` VALUES ('268', '/Uploads/Picture/2017-08-28/59a376c00bc99.gif', '', '496791c1474905286f146e5069e109ae', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503884992');
INSERT INTO `v_picture` VALUES ('269', '/Uploads/Picture/2017-08-28/59a376db1e895.jpg', '', '2d26ddab87857afe3cca5939747e74cc', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503885019');
INSERT INTO `v_picture` VALUES ('270', '/Uploads/Picture/2017-08-28/59a376f16dc26.jpg', '', '7840cb37b17344d2d67589762fd41d9d', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1503885041');
INSERT INTO `v_picture` VALUES ('272', '/Uploads/Picture/2017-08-30/59a61a2d6e392.jpg', '', '0ba59ec47a832d4aa81a9a6740d32202', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1504057901');
INSERT INTO `v_picture` VALUES ('275', '/Uploads/Picture/2017-08-30/59a61c11c87fc.jpg', '', 'e53e9ee756efb57a32c89ad87e24c8dc', '5ca88f66f2126551f124c3462d2eb0acfa733c08', '1', '1504058385');
INSERT INTO `v_picture` VALUES ('276', '/Uploads/Picture/2017-08-30/59a61c1380a00.jpg', '', '841819c11125ca68695da4fd70c87cd5', 'cd56e773603b59706785e8d3c1ed6605c4e063e0', '1', '1504058387');
INSERT INTO `v_picture` VALUES ('277', '/Uploads/Picture/2017-08-30/59a61c1575745.jpg', '', '4f42148ce80c76fdcb7e570edd75f9b3', 'c760c7832d5acdfb6154f0d9e06e54c1dec9c7e1', '1', '1504058389');
INSERT INTO `v_picture` VALUES ('279', '/Uploads/Picture/2017-08-30/59a6208fbccc9.jpg', '', '8717903f8a3ffac9d72c7a677341ba89', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1504059535');
INSERT INTO `v_picture` VALUES ('280', '/Uploads/Picture/2017-08-30/59a62e6e37ad5.jpg', '', 'e5e2477510ad7d77018041fbd28c8670', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1504063086');
INSERT INTO `v_picture` VALUES ('281', '/Uploads/Picture/2017-08-30/59a62eb54e19f.gif', '', 'd8504d9ef227df2628273da64a6d9536', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1504063157');
INSERT INTO `v_picture` VALUES ('282', '/Uploads/Picture/2017-08-30/59a6305ad9dab.jpg', '', '42d50e490c5eafea9d8cfe9d7cbfe013', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1504063578');
INSERT INTO `v_picture` VALUES ('283', '/Uploads/Picture/2017-08-30/59a631e39fefa.jpg', '', 'edb79ab82df99109f01a85480113ab49', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1504063971');
INSERT INTO `v_picture` VALUES ('284', '/Uploads/Picture/2017-08-30/59a632afad13a.jpg', '', 'eb42f331390805c652ddca5ceb91f685', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1504064175');
INSERT INTO `v_picture` VALUES ('285', '/Uploads/Picture/2017-08-30/59a6375eee76b.jpg', '', '5a2c91df209a396bba834952635e7f6b', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1504065374');
INSERT INTO `v_picture` VALUES ('286', '/Uploads/Picture/2017-08-30/59a637959bfd1.jpg', '', '7f09b293767dafe8fbf2ae0278beef6d', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1504065429');
INSERT INTO `v_picture` VALUES ('287', '/Uploads/Picture/2017-08-30/59a6381f0e195.gif', '', '8c7c4d8d3964526de67173e881e180e8', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1504065567');
INSERT INTO `v_picture` VALUES ('288', '/Uploads/Picture/2017-08-30/59a638300ab06.jpg', '', 'eb292ea869f42f10bd93d691463fd383', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1504065584');
INSERT INTO `v_picture` VALUES ('289', '/Uploads/Picture/2017-08-30/59a6599a17f87.jpg', '', '858f47724bc6e0800f1b04e30713be49', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1504074138');
INSERT INTO `v_picture` VALUES ('290', '/Uploads/Picture/2017-08-30/59a659bfeebcb.jpg', '', 'c9124db9505ebc4b1659705e17a096b4', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1504074175');
INSERT INTO `v_picture` VALUES ('291', '/Uploads/Picture/2017-08-30/59a659e0b95f7.jpg', '', 'dfb762ad409aa8a1c58d7169b3fe80b7', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1504074208');
INSERT INTO `v_picture` VALUES ('292', '/Uploads/Picture/2017-08-30/59a65a5ae3763.jpg', '', '7ce8de541c7719cbee40140a655fe3ee', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1504074330');
INSERT INTO `v_picture` VALUES ('293', '/Uploads/Picture/2017-08-30/59a65a9136580.jpg', '', '803242651b884b6f57af00c15b6d1f1b', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1504074385');
INSERT INTO `v_picture` VALUES ('294', '/Uploads/Picture/2017-08-31/59a7741becee5.png', '', '80217cb8c008dfb04b8fb8e1c85c36dd', '917db031fb070b630366d582b9c7b4aa4461b550', '1', '1504146459');
INSERT INTO `v_picture` VALUES ('295', '/Uploads/Picture/2017-08-31/59a7742b6760b.jpg', '', 'a31e8de52c188250bb7c570df155e1c4', 'fb48f00c0d6a21d612478a2c390b84fe826755e3', '1', '1504146475');
INSERT INTO `v_picture` VALUES ('296', '/Uploads/Picture/2017-08-31/59a7742bc7edc.jpg', '', '671d95fff311a468ccf30b232097dba3', '5a92a625ad054735e09d3b0baa0eecc45d2531bb', '1', '1504146475');
INSERT INTO `v_picture` VALUES ('297', '/Uploads/Picture/2017-08-31/59a7742c5025f.jpg', '', '14755debebeb3785ee74b8ec033db92f', 'a5f33173478e0238f759cc946057bc8a11ce58d2', '1', '1504146476');
INSERT INTO `v_picture` VALUES ('298', '/Uploads/Picture/2017-08-31/59a7742cdeca2.jpg', '', 'f97e69d3f653c6fb01f52a181f8a5b6f', 'e8fec3e2190c798ce12bfbd38cc73398f2d9cff4', '1', '1504146476');
INSERT INTO `v_picture` VALUES ('299', '/Uploads/Picture/2017-08-31/59a7ce8f55a1c.jpg', '', '5bfb105bc9af4cde44e8df1c6274e003', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1504169615');
INSERT INTO `v_picture` VALUES ('300', '/Uploads/Picture/2017-08-31/59a7cecbe1d58.gif', '', '75b72660f90bc9cf26c98375184f2f8b', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1504169675');
INSERT INTO `v_picture` VALUES ('301', '/Uploads/Picture/2017-08-31/59a7ceec13f72.jpg', '', 'f6a2fd1993d9fa3ffcca2a7540bb968f', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1504169708');
INSERT INTO `v_picture` VALUES ('302', '/Uploads/Picture/2017-08-31/59a7cefdcdb31.jpg', '', 'bbad110c45a33fea87a96af7afaabf33', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1504169725');
INSERT INTO `v_picture` VALUES ('303', '/Uploads/Picture/2017-09-01/59a8ca46e7f10.jpg', '', 'deae52571579d691dd0cab4acfadc696', 'a56419f8b021d6410b112470f65c4135b48e89fb', '1', '1504234054');
INSERT INTO `v_picture` VALUES ('304', '/Uploads/Picture/2017-09-01/59a8ca472c0fd.jpg', '', '72e08383564d407c794ab0057c9ad937', '67e130f3279a128e400eb8c9c397085f64ef983b', '1', '1504234055');
INSERT INTO `v_picture` VALUES ('305', '/Uploads/Picture/2017-09-01/59a8ca4758d31.jpg', '', 'aa073606bc21c3084a4d89e98aacd56d', '1f19316fe6694adef7dd59d974fa9918396e2550', '1', '1504234055');
INSERT INTO `v_picture` VALUES ('306', '/Uploads/Picture/2017-09-01/59a8ca478cac8.jpg', '', 'b6a1b8c216f2b40974780a687f469379', 'ab8088229a988daf95f2c84c7128bebd788ec12b', '1', '1504234055');
INSERT INTO `v_picture` VALUES ('307', '/Uploads/Picture/2017-09-01/59a8ca47b624e.jpg', '', '35940656dfde5689f65c914c6c64f3d0', '1425fae7e5033f7ccfbd9a39013f2340aeb39775', '1', '1504234055');
INSERT INTO `v_picture` VALUES ('308', '/Uploads/Picture/2017-09-01/59a8ca47e7a8c.jpg', '', '933ae72c6f2c363a7446c17636454f03', '5f825936f3d3d7feaf04a72f20fee76cf6a995c1', '1', '1504234055');
INSERT INTO `v_picture` VALUES ('309', '/Uploads/Picture/2017-09-01/59a8ca482b2b6.jpg', '', 'c13d56cc2cd444e0f34937762d122e95', '5c5b11c1fb97aeb9298bbfe7718296b23529eab0', '1', '1504234056');
INSERT INTO `v_picture` VALUES ('310', '/Uploads/Picture/2017-09-01/59a8ca488058c.jpg', '', 'cf26ce1067f0da69c88959f9a3d955d9', '868992123b0b776955f2b8f5409d151d69b5b95e', '1', '1504234056');
INSERT INTO `v_picture` VALUES ('311', '/Uploads/Picture/2017-09-01/59a8ca48bcb66.jpg', '', '606d686185f6a1cc3c6228cf4d865e30', '4a84836b865cd614c632267ff073e6583db4848b', '1', '1504234056');
INSERT INTO `v_picture` VALUES ('312', '/Uploads/Picture/2017-09-01/59a8ca48f3bb8.jpg', '', '9f24109bd5f72743d70211b8dbe64968', '22150be326096dec75792bbd55057bf640e49172', '1', '1504234056');
INSERT INTO `v_picture` VALUES ('313', '/Uploads/Picture/2017-09-01/59a8ca4941cb8.jpg', '', '4fef443149649b5610ce02fe58cc89f4', '11e90a4c28158ca7bc1aabbe38c115543824a42b', '1', '1504234057');
INSERT INTO `v_picture` VALUES ('314', '/Uploads/Picture/2017-09-01/59a8ca4974c04.jpg', '', '04d1c74c7cc14ed5edc828d8249bd774', 'b98014f761aa1e108d98ff6b70b1a795437fa1c5', '1', '1504234057');
INSERT INTO `v_picture` VALUES ('315', '/Uploads/Picture/2017-09-01/59a8ca7a6a0c7.jpg', '', '02bb9e696e2beb6991dd652626743f55', '23029cd45c8c4c77e003bf16be8df6ac015962e4', '1', '1504234106');
INSERT INTO `v_picture` VALUES ('316', '/Uploads/Picture/2017-09-01/59a8ca7ad995c.jpg', '', 'a7ef415868b86549e599c780c78ffe03', '73977cd402aad6214f78e98423b386bbbeecb0bb', '1', '1504234106');
INSERT INTO `v_picture` VALUES ('317', '/Uploads/Picture/2017-09-01/59a8ca7b37cd9.jpg', '', '7390d53e61a9b2360a1e7a731cc47619', '036d2639a36fefd65ccfdbb2df066e92defdf1ee', '1', '1504234107');
INSERT INTO `v_picture` VALUES ('318', '/Uploads/Picture/2017-09-01/59a8ca7b5f3b0.jpg', '', '4c14f895416e7327b407e196917741ee', 'abd5676ab54466e571e55e83200005369b7c1e5e', '1', '1504234107');
INSERT INTO `v_picture` VALUES ('319', '/Uploads/Picture/2017-09-01/59a8ca7b8ff43.jpg', '', 'bd46fe1e73975a9da0bb2a5c6fa6237b', '8d9ce5f8571c7d6f7e54779bb31a8add342e4e06', '1', '1504234107');
INSERT INTO `v_picture` VALUES ('320', '/Uploads/Picture/2017-09-01/59a8ca7bd4f90.jpg', '', 'fefc695d88df7aa7b8428fdae3a8e7fc', '43189f581fa7ff9b6dc7ef9df843df6f6e231d61', '1', '1504234107');
INSERT INTO `v_picture` VALUES ('321', '/Uploads/Picture/2017-09-01/59a8ca7c0f071.jpg', '', 'f9eddfb6521c9d9d1a39c2b9f11a3592', '959fca6e87865e5851582f91b43884bef08a917b', '1', '1504234108');
INSERT INTO `v_picture` VALUES ('322', '/Uploads/Picture/2017-09-01/59a8ca7c4264f.jpg', '', '7139e8f7e0a8843aadce1e98d9506436', '36b6482038cc87434463902d0fc00d07f3685947', '1', '1504234108');
INSERT INTO `v_picture` VALUES ('323', '/Uploads/Picture/2017-09-01/59a8ca7c77b2d.jpg', '', '6c80ab0daf439130d197fa95ed19da7c', '7c68b738bb678e0e8cb462a5f223e4bceefcd399', '1', '1504234108');
INSERT INTO `v_picture` VALUES ('324', '/Uploads/Picture/2017-09-01/59a8caa0c68f1.jpg', '', 'e83695a55649370da437fd8c28d20bf9', '5d5db995b248075e51ab677ad90f6abc095b4c24', '1', '1504234144');
INSERT INTO `v_picture` VALUES ('325', '/Uploads/Picture/2017-09-01/59a8cabf9722b.jpg', '', 'c0719e571049267f197194f5b0460d94', 'f92e5ebcd739a558afb85b2dc50bca32b0021bef', '1', '1504234175');
INSERT INTO `v_picture` VALUES ('326', '/Uploads/Picture/2017-09-01/59a8cabfc0842.jpg', '', '53da735dbaaa61d4e2e405c1ef5dab86', '715435f95efd3652922e136a6beb67789d8fd310', '1', '1504234175');
INSERT INTO `v_picture` VALUES ('327', '/Uploads/Picture/2017-09-01/59a8cac007504.jpg', '', 'f234a672944ffef2e8ed4e655510a467', '6feefc148bb78cd112d187b9131681a93a203fba', '1', '1504234176');
INSERT INTO `v_picture` VALUES ('328', '/Uploads/Picture/2017-09-01/59a8cac030d6b.jpg', '', '7b903a75d3829e5186e8fc9e9599a2f8', '30159d259481c7e0c96a4fe0030b92de49d23d01', '1', '1504234176');
INSERT INTO `v_picture` VALUES ('329', '/Uploads/Picture/2017-09-01/59a8cac05b85c.jpg', '', 'c2b52621a9043b834f4a008a6f9c744a', '58a0f491e847bc00e7a4702783a47a1e749170c8', '1', '1504234176');
INSERT INTO `v_picture` VALUES ('330', '/Uploads/Picture/2017-09-01/59a8cac094618.jpg', '', '73befd7cde15a3124317f5203c33fbee', '470081f6dddc2bd8dbc48c29ea61bbb80d8aa357', '1', '1504234176');
INSERT INTO `v_picture` VALUES ('331', '/Uploads/Picture/2017-09-01/59a8cac0cc792.jpg', '', '70e7be6df15e11906cfbac4fd9858048', '1cb639572588847f1805ca655cad8362883249ec', '1', '1504234176');
INSERT INTO `v_picture` VALUES ('332', '/Uploads/Picture/2017-09-01/59a8cac107929.jpg', '', '1d0e80e5d68dd0914e1835eddddcc14d', '1313b1c67cbc859bcde316c0b4f98a4938facf92', '1', '1504234177');
INSERT INTO `v_picture` VALUES ('333', '/Uploads/Picture/2017-09-01/59a8cac177311.jpg', '', '00cb8f3e53f009fe4d4a566b68138da8', '85d2ba5726e258b2211a41e9a1e5e839679aa559', '1', '1504234177');
INSERT INTO `v_picture` VALUES ('334', '/Uploads/Picture/2017-09-01/59a8cfea7835e.png', '', '9a7ffa4720a6de7dcb90ff5b56376758', 'fd8e14bbcf1a9a298d965cb9fa3eaabaac6c336b', '1', '1504235498');
INSERT INTO `v_picture` VALUES ('335', '/Uploads/Picture/2017-09-01/59a8cfeab61bb.jpg', '', 'ac1c3e9500fd83c27b9ca7f4ded38652', '00308c7ec462885c0f7afce6e604804aa8ca6b31', '1', '1504235498');
INSERT INTO `v_picture` VALUES ('336', '/Uploads/Picture/2017-09-01/59a8cfeae3bb6.png', '', '650f0ba7d5b5f49b883774791ae22083', '0558a579c42163536b577c0cd10b988663fc1579', '1', '1504235498');
INSERT INTO `v_picture` VALUES ('337', '/Uploads/Picture/2017-09-01/59a8cfeb2d42d.png', '', '074b6a21fe57f2072277b1523d012798', 'be1eb402253f1bdbaaf7f6726a27c4cf7ad357c1', '1', '1504235499');
INSERT INTO `v_picture` VALUES ('338', '/Uploads/Picture/2017-09-01/59a8d01f18ff6.jpg', '', '7be88e5458fac408ed9444b4ccf9b5b0', '18ed4d1fc4645a83cb3a285a3cf8d85cc08bf83e', '1', '1504235551');
INSERT INTO `v_picture` VALUES ('339', '/Uploads/Picture/2017-09-01/59a8d01fa1a31.png', '', '11ced2a22b5b7b5e874b50bfd25aa2b2', 'b0a86da421d4288ce87972d6425f52e5dec23453', '1', '1504235551');
INSERT INTO `v_picture` VALUES ('340', '/Uploads/Picture/2017-09-01/59a8d01fd854b.jpg', '', '4fd54f4baf482826bb369f7616023f8d', 'f0fb80a3731d3f27d98dbd051852ea8ba733b3c2', '1', '1504235551');
INSERT INTO `v_picture` VALUES ('341', '/Uploads/Picture/2017-09-01/59a8d020324e1.png', '', 'bfba469e8cd2f6e7fed8e54e034bd4ad', '7eb0f716bb481396fd1697a00ea9a53f582dcbe9', '1', '1504235552');
INSERT INTO `v_picture` VALUES ('342', '/Uploads/Picture/2017-09-01/59a8d020627c5.JPG', '', 'ad40d6fa875d07cce6e7f4d0780e9f83', '74222c7dcc239f8ab59713319a335f1ad76e0a4f', '1', '1504235552');
INSERT INTO `v_picture` VALUES ('343', '/Uploads/Picture/2017-09-01/59a8d02090f8f.jpg', '', 'd434056bcde18c7116893142433427fa', 'ea92654ae3f6eed70a3c4e6b3c60fd009619e5d9', '1', '1504235552');
INSERT INTO `v_picture` VALUES ('344', '/Uploads/Picture/2017-09-01/59a8d020d823d.jpg', '', '02130c9cb372676098495a3453cc82c2', '0cd7d30f7c41bdfb884f8e9eedaf397772415ecd', '1', '1504235552');
INSERT INTO `v_picture` VALUES ('345', '/Uploads/Picture/2017-09-01/59a8d0249d7da.jpg', '', '0957a58507a51efdfd28f0da1341c837', 'a6dc951b88b44ca9ff26c75961d6f376ed0d3d8b', '1', '1504235556');
INSERT INTO `v_picture` VALUES ('346', '/Uploads/Picture/2017-09-01/59a8d0267d6c9.jpg', '', '5e9be77dccad53d5d5d71936ce61d2c8', '8a521f3283fafdd47ecebc90976f22c7458fbb49', '1', '1504235558');
INSERT INTO `v_picture` VALUES ('347', '/Uploads/Picture/2017-09-01/59a8d03b82d69.jpg', '', '9f4e1049ffcaedc095065ae0936a5bd2', '633fc057673b0112d38e4a65a82091cbb407a0fb', '1', '1504235579');
INSERT INTO `v_picture` VALUES ('348', '/Uploads/Picture/2017-09-01/59a8d03bcc548.jpg', '', 'b840ff014ad7f1804aab674fd0361787', '0feb1248df08ff7c69f3331ce7883c05c047907f', '1', '1504235579');
INSERT INTO `v_picture` VALUES ('349', '/Uploads/Picture/2017-09-01/59a8d03bf352a.jpg', '', 'c521d77048d13a1cfa5bd602613a7866', '86d67de2a00103de320e23d201a12169ed303201', '1', '1504235579');
INSERT INTO `v_picture` VALUES ('350', '/Uploads/Picture/2017-09-01/59a8d03c2a470.jpg', '', '2042a225d4c3aa80a2754c5cdfc0bce7', 'b61ff3b43e0cb68a9bbf143005f6730b94104ca8', '1', '1504235580');
INSERT INTO `v_picture` VALUES ('351', '/Uploads/Picture/2017-09-01/59a8d15de8af1.jpg', '', 'a3df5ad50f743c755aaecb72750d7426', '8f3e76db2fc685aab714ee722f51dc53fecbec05', '1', '1504235869');
INSERT INTO `v_picture` VALUES ('352', '/Uploads/Picture/2017-09-01/59a8d15e39c16.jpg', '', 'f879d9721792296a9ebfedbd8778b434', '029adfb674a793aa64c7112cfd67b982edeb7407', '1', '1504235870');
INSERT INTO `v_picture` VALUES ('353', '/Uploads/Picture/2017-09-01/59a8d15e79d69.jpg', '', 'db7674f3d07ebf76b675e1080418ac2c', '3a0f7ac4487e9ab9ead8ca7a538f8324277ec842', '1', '1504235870');
INSERT INTO `v_picture` VALUES ('354', '/Uploads/Picture/2017-09-01/59a8d15ea4a87.jpg', '', 'e0d2a8fb6a9352344e6ffec4ec582dbc', '56195459c1b6481ee314c342dddd23c4ee61e85e', '1', '1504235870');
INSERT INTO `v_picture` VALUES ('355', '/Uploads/Picture/2017-09-01/59a8d16d6c5a8.jpg', '', '44e1a2cdb0b53bba424ef76ab6bf580e', 'c0afc2ecc33d32359e3e99f899750a10e5076422', '1', '1504235885');
INSERT INTO `v_picture` VALUES ('356', '/Uploads/Picture/2017-09-01/59a8d177bfa9b.jpg', '', 'c7cd34494918980f8467478d635b26de', 'd5d902debd79e2709b0395f66e8f947e5d172385', '1', '1504235895');
INSERT INTO `v_picture` VALUES ('357', '/Uploads/Picture/2017-09-01/59a8d1ee63f8e.jpg', '', 'b949f92515aea049feecbf90c0fa6b51', 'a48b5aeb50bfb54b867e739a02e53b6772c5d7cf', '1', '1504236014');
INSERT INTO `v_picture` VALUES ('358', '/Uploads/Picture/2017-09-01/59a8d1ee8eba8.jpg', '', 'e92c7ec0413b19e3265eebdd331a691d', 'bdef9a96e600284598000d3ccff40b2521b73494', '1', '1504236014');
INSERT INTO `v_picture` VALUES ('359', '/Uploads/Picture/2017-09-01/59a8d254983c5.jpg', '', '1ed97bbbaf2f0a373a4ff447b2d55f4a', 'd1ee7ffdfc7641d12a1b28a6383fdeabeb37a35c', '1', '1504236116');
INSERT INTO `v_picture` VALUES ('360', '/Uploads/Picture/2017-09-01/59a8d37b67467.jpg', '', '8666d01e7f0ea0a51c82be9fa24b0775', 'c09a190446978979fdd0bd84f79e2b01c40e43c2', '1', '1504236411');
INSERT INTO `v_picture` VALUES ('361', '/Uploads/Picture/2017-09-01/59a8d3e790520.JPG', '', '055d487f02f89fbb004030bf1d334790', 'fb816c9ff09814fb6745af207fcc03b7357bdfb4', '1', '1504236519');
INSERT INTO `v_picture` VALUES ('362', '/Uploads/Picture/2017-09-01/59a8d3e7c28ce.JPG', '', '2b2cd60b6b2feabda5d971ba063ae67a', '871db94161d675acef0df29c7ece0c5903f8c378', '1', '1504236519');
INSERT INTO `v_picture` VALUES ('363', '/Uploads/Picture/2017-09-01/59a8d3e8010fd.JPG', '', 'd24bcf800337349e5660b2e356bf692a', 'f39770ca6946008b45e980d2a517a2184bc47ffe', '1', '1504236519');
INSERT INTO `v_picture` VALUES ('364', '/Uploads/Picture/2017-09-01/59a8d3e8300ab.JPG', '', '2c3c5b2d4a9399cad7d9acd090678377', '77e740bac462fe3efde3f095358dba9190ff969e', '1', '1504236520');
INSERT INTO `v_picture` VALUES ('365', '/Uploads/Picture/2017-09-01/59a8d3e864954.JPG', '', 'dacaee7f57c310adf29637f2f6a6f0a3', '0e46b66a48859cdef3ec5d5b2eb59b7124f7080b', '1', '1504236520');
INSERT INTO `v_picture` VALUES ('366', '/Uploads/Picture/2017-09-01/59a8d3e89c29b.JPG', '', '410055537630eae2097d8629dfe330e4', 'f5f83c00f7e7b5f83afe17e44ea55fa227552332', '1', '1504236520');
INSERT INTO `v_picture` VALUES ('367', '/Uploads/Picture/2017-09-01/59a8d3e8d2d18.JPG', '', 'df95b6cb7ce834e8afbed2b5c422af02', '6838a9bdba073e7ed200fdc6901cae8cd14680ec', '1', '1504236520');
INSERT INTO `v_picture` VALUES ('368', '/Uploads/Picture/2017-09-01/59a8d3e91d45d.JPG', '', '14604b13379b68b1130dc025a60fd686', 'cd060a679b3968340b05b5a73e47462b0192f016', '1', '1504236521');
INSERT INTO `v_picture` VALUES ('369', '/Uploads/Picture/2017-09-01/59a8d3e9520f1.JPG', '', '9a4da6397d10a3a1b949cd36c0c3a9a0', '23615402f63fe442638d3e19a22bb0e231206ff8', '1', '1504236521');
INSERT INTO `v_picture` VALUES ('370', '/Uploads/Picture/2017-09-01/59a8d3e98d459.JPG', '', '75bdfec903a7a6ba819b8e9434871ca8', '6382eb9ff72a30dd6abdba9065953b7138de8b36', '1', '1504236521');
INSERT INTO `v_picture` VALUES ('371', '/Uploads/Picture/2017-09-01/59a8d41806f41.jpg', '', '7e36fba31466e79f28045a10b06fa3fc', 'a83b4e202ef7e6fac86773beee3089d8d8a6a60a', '1', '1504236568');
INSERT INTO `v_picture` VALUES ('372', '/Uploads/Picture/2017-09-01/59a8d41885331.jpg', '', '0ee9316a3b955cae5adf7ca770df77a7', 'f15099741c2d7d484af2ef88e8f56f4be9bd8458', '1', '1504236568');
INSERT INTO `v_picture` VALUES ('373', '/Uploads/Picture/2017-09-01/59a8d419919fe.jpg', '', 'da2d641e583bd97920dd857b45d4ebd8', '35e4978d17023cceafdc8059042bd3596eb9ebe5', '1', '1504236569');
INSERT INTO `v_picture` VALUES ('374', '/Uploads/Picture/2017-09-01/59a8d41a223c6.jpg', '', '022b866d9a843ad46339f7045724cbbd', '92dced5a5da75bbe81a197acd3aab843cd1433ba', '1', '1504236570');
INSERT INTO `v_picture` VALUES ('375', '/Uploads/Picture/2017-09-01/59a8d472e6db5.jpg', '', '45459c27508b8f78d43cb9751c1fccd2', 'efd235fbd487d75fec901cfb39d53d67047cc942', '1', '1504236658');
INSERT INTO `v_picture` VALUES ('376', '/Uploads/Picture/2017-09-01/59a8d47343b09.jpg', '', '6be69e46aa6e146e3c7dbd00f3728cb2', 'e138a162eb6ed80ce90f63c937079ae40d4866f0', '1', '1504236659');
INSERT INTO `v_picture` VALUES ('377', '/Uploads/Picture/2017-09-01/59a8d4738ca08.jpg', '', '0875041ad65aa8226a6ee40ff1ca66de', 'cb7702ca68afe34c0ea631e5aa5ddd3ff092f02d', '1', '1504236659');
INSERT INTO `v_picture` VALUES ('378', '/Uploads/Picture/2017-09-01/59a8d473b99c7.jpg', '', 'b54244e02c8952b37706a357a5b6c19f', '9ac48493102b64bc0ed6480e459416a8ee1074e3', '1', '1504236659');
INSERT INTO `v_picture` VALUES ('379', '/Uploads/Picture/2017-09-01/59a8d4ab1ac0e.jpg', '', '3ccf855c949ba3cdef39d8c61f1fe083', '66a22849d9336fdcf388c28cd41af1c08601a1eb', '1', '1504236715');
INSERT INTO `v_picture` VALUES ('380', '/Uploads/Picture/2017-09-01/59a8d4b88e762.jpg', '', '8f80b6b99cae986e8aff8897e2bf9309', 'f9defc145df35fb9bbd8ea48d8b962d5bc4337e6', '1', '1504236728');
INSERT INTO `v_picture` VALUES ('381', '/Uploads/Picture/2017-09-01/59a8d517572df.jpg', '', '54352332b734e60b4f3ee04042ea9ab9', '25b7ff172b4ed0f3c4af7fc764c43f6cbd31213a', '1', '1504236823');
INSERT INTO `v_picture` VALUES ('382', '/Uploads/Picture/2017-09-01/59a8d517ea4f4.jpg', '', '1107c15aa98d1a99b22b16f18b0eb558', 'a36be07dec7f9dfb52ba8eb4162a2e66665a9f2c', '1', '1504236823');
INSERT INTO `v_picture` VALUES ('383', '/Uploads/Picture/2017-09-01/59a8d518335fc.jpg', '', '86f95f64ff0eebd171ad1c08a77cd6da', '24466667ad4f5c1d14df7c9c6f73296b6d850dc3', '1', '1504236824');
INSERT INTO `v_picture` VALUES ('384', '/Uploads/Picture/2017-09-01/59a8d5187afdf.jpg', '', '304625cb4dcc32942c7df53961b8833f', 'b68c4221357e88f72d6f5c35e41bec6cbcd0727b', '1', '1504236824');
INSERT INTO `v_picture` VALUES ('385', '/Uploads/Picture/2017-09-01/59a8d69d7f330.jpg', '', 'dc28dc0311aa5ff8cabd81aced720b63', '727eb706da9aab157d4214c8c6938497ae53625e', '1', '1504237213');
INSERT INTO `v_picture` VALUES ('386', '/Uploads/Picture/2017-09-01/59a8d69ea3f4c.jpg', '', '114da65f4f5a036c3e9b336d0ac481c7', 'c55ccada8f86b86e2875fdaf98c88bee407354d3', '1', '1504237214');
INSERT INTO `v_picture` VALUES ('387', '/Uploads/Picture/2017-09-01/59a8d6a004f00.jpg', '', '1e4f8d6e47730a47fc4dd0d9250f6ed7', '9e1e85a70be5b8123b2e833c912214ab1a698528', '1', '1504237216');
INSERT INTO `v_picture` VALUES ('388', '/Uploads/Picture/2017-09-01/59a8d6a06e419.jpg', '', '29428f1d4e3fde505143b8a3ff546a35', 'ecbbee47560812c233b03f9b8aa39a57147b7aa9', '1', '1504237216');
INSERT INTO `v_picture` VALUES ('389', '/Uploads/Picture/2017-09-01/59a8d6a0e71e5.jpg', '', '7ba7b51e6c7dc20838a7b64123c3bf69', '4e62ada75f46957f88b6ebcdb7dcbe289fa75a29', '1', '1504237216');
INSERT INTO `v_picture` VALUES ('390', '/Uploads/Picture/2017-09-01/59a8d6a18ec18.jpg', '', '8d71fa353fdc550c2645e898728f93dc', 'aa916dde7639d17464ef086a6dbbe6e89a65631c', '1', '1504237217');
INSERT INTO `v_picture` VALUES ('391', '/Uploads/Picture/2017-09-01/59a8d6a25cba6.jpg', '', '76ff1f067e394896354bccb4f703ca1e', '416d2ad7ad8283d12aedaca0b4578e27a6e83fec', '1', '1504237218');
INSERT INTO `v_picture` VALUES ('392', '/Uploads/Picture/2017-09-01/59a8d6a37a84c.jpg', '', 'ccde524a0e001bf9f07ad0f034c197ed', 'fe7c5765afbdd6719b72a148eb2fd93f0f8a194a', '1', '1504237219');
INSERT INTO `v_picture` VALUES ('393', '/Uploads/Picture/2017-09-01/59a8d6a4c2e9f.jpg', '', 'd474a6076ee8b59d03803c9b0d438128', '0a87cea7555f8c5dcd9ac0e64fb87a3d890e83ac', '1', '1504237220');
INSERT INTO `v_picture` VALUES ('394', '/Uploads/Picture/2017-09-01/59a8d6a5bbae4.jpg', '', 'fc9718a37083b47a0c284e49fcb44656', '2988ed220abbcf0e2417ba31a06209a1af6643fe', '1', '1504237221');
INSERT INTO `v_picture` VALUES ('395', '/Uploads/Picture/2017-09-01/59a8d6a6b7176.jpg', '', 'b66e2294859fb6c7036c06cf9fc53bac', '063ddd8d34d504836729177ed335c041588b31f2', '1', '1504237222');
INSERT INTO `v_picture` VALUES ('396', '/Uploads/Picture/2017-09-01/59a8d6a7873c8.jpg', '', '903eceeb218668fff1c550866873c902', '2c2db20011acb373af892e2b3d313fb3dbad686f', '1', '1504237223');
INSERT INTO `v_picture` VALUES ('397', '/Uploads/Picture/2017-09-01/59a8d6f1e020a.jpg', '', '47f291b5c3617ae76f98e106ec7598ec', '9e9fbc94d9a33c69a95c760b854507fee952a12a', '1', '1504237297');
INSERT INTO `v_picture` VALUES ('398', '/Uploads/Picture/2017-09-01/59a8d6f235f54.jpg', '', 'fdd4e5029dc395d2a95b97a8f6f6f0ab', 'd023ba7e5e1088af82605124b3fcf8c22003b217', '1', '1504237298');
INSERT INTO `v_picture` VALUES ('399', '/Uploads/Picture/2017-09-01/59a8d6f2919b1.jpg', '', '62170c82b204957fa6558a948c30bdf7', '8454649a535d79e21b645784dc096646578d5a06', '1', '1504237298');
INSERT INTO `v_picture` VALUES ('400', '/Uploads/Picture/2017-09-01/59a8d6f2c03fc.jpg', '', 'dbbd8f66d612b3970eb3b6db3af50ddb', '58016cf399b863a4be37207678e399567201a21f', '1', '1504237298');
INSERT INTO `v_picture` VALUES ('401', '/Uploads/Picture/2017-09-01/59a8d6f2f37f8.jpg', '', '6a1be84135b59a308dbe3d2cc8372cb2', 'c555496d1d19d369faf9a2c2d99088d14e7b1437', '1', '1504237298');
INSERT INTO `v_picture` VALUES ('402', '/Uploads/Picture/2017-09-01/59a8d6f333ffd.jpg', '', '65f1482231902253ecca3a4739b3fab5', '22aee177e7ab740aa344236177279ab995e24ce0', '1', '1504237299');
INSERT INTO `v_picture` VALUES ('403', '/Uploads/Picture/2017-09-01/59a8d6f36c59d.jpg', '', 'ebfbb9bad73324b2680286dd9781820c', 'bcb9929d588ad608ddacf11ebea0198c94d9da7e', '1', '1504237299');
INSERT INTO `v_picture` VALUES ('404', '/Uploads/Picture/2017-09-01/59a8d6f3a9780.jpg', '', '50e146337e408648a015faa2e8e8837d', '0057ba2b989d491f21b09557bd44fd2eaf955373', '1', '1504237299');
INSERT INTO `v_picture` VALUES ('405', '/Uploads/Picture/2017-09-01/59a8d705da11b.jpg', '', '800f68830cfb74850c4eb5adc45f3795', 'f3e8439bf9a7606b68a7b7390f9099baa7e1e36d', '1', '1504237317');
INSERT INTO `v_picture` VALUES ('406', '/Uploads/Picture/2017-09-01/59a8d7060b0d7.jpg', '', '1ffe7781bde5bb0c4bd266dfab7f871a', '96009efbf6f589afd516b23f3cb601eecd3c6ee1', '1', '1504237318');
INSERT INTO `v_picture` VALUES ('407', '/Uploads/Picture/2017-09-01/59a8d70636480.jpg', '', '4eb527f8c2289c3afc41778a000119ac', 'dd4f24a620de2fa61e9e40f5ebd366b459fa906f', '1', '1504237318');
INSERT INTO `v_picture` VALUES ('408', '/Uploads/Picture/2017-09-01/59a8d7066a48b.jpg', '', '7752ca6dec83c496f943ba7bb6ede7c0', 'bed5551fd11f5938f9cdfc9d8bc7396940976b5d', '1', '1504237318');
INSERT INTO `v_picture` VALUES ('409', '/Uploads/Picture/2017-09-01/59a8d7069a6b7.jpg', '', 'a3c2faa5e2e6adfd186788e6cd0a286e', '2c25f177c18a3c4857c9bc688a99fd5896388fac', '1', '1504237318');
INSERT INTO `v_picture` VALUES ('410', '/Uploads/Picture/2017-09-01/59a8d706ca073.jpg', '', 'e7357d07f1c156284e50426d0fa9a3ea', 'c90117deda6909cef1b92aa810cc3d738585235c', '1', '1504237318');
INSERT INTO `v_picture` VALUES ('411', '/Uploads/Picture/2017-09-01/59a8d7071b603.jpg', '', 'de136d1507929f831431535514d0015c', '8990c365c42f0c497d7c1adf38c044c8990a9457', '1', '1504237319');
INSERT INTO `v_picture` VALUES ('412', '/Uploads/Picture/2017-09-01/59a8d70747765.jpg', '', 'ad46f8accd0ffeba6483bc324e9f5402', '9a654503f72e1c9ae7c70de955f4fe9462bdaa66', '1', '1504237319');
INSERT INTO `v_picture` VALUES ('413', '/Uploads/Picture/2017-09-01/59a8d70779408.jpg', '', 'e5979531628953191d52d87a963d2c61', 'a28bf639ac33bb7a79fa28b7a6cb2d5fb765be15', '1', '1504237319');
INSERT INTO `v_picture` VALUES ('414', '/Uploads/Picture/2017-09-01/59a8d707e458f.jpg', '', '33e9e8ecc8daf77c7e4ea8f32f461d8f', 'e9a74113f7601e6fd1022d5642d7d632ba1a5e3f', '1', '1504237319');
INSERT INTO `v_picture` VALUES ('415', '/Uploads/Picture/2017-09-01/59a8d7081ae9c.jpg', '', 'd627528db908ae1a334b06d62b88e353', '9137ede84840f97cb5d9c73095de90e6c6864a66', '1', '1504237320');
INSERT INTO `v_picture` VALUES ('416', '/Uploads/Picture/2017-09-01/59a8d7d826ae7.jpg', '', '07fb4ab25a9ff11783707deb9ab15891', '4b859072595aabe56927f2f62bd035034068ac21', '1', '1504237528');
INSERT INTO `v_picture` VALUES ('417', '/Uploads/Picture/2017-09-01/59a8d8700457f.jpg', '', '02534c18e73439d69ef5564b226a6911', '3089505848b3f470b8a14fbfb7b46cb3c4bd1206', '1', '1504237680');
INSERT INTO `v_picture` VALUES ('418', '/Uploads/Picture/2017-09-01/59a8d8c34773e.jpg', '', 'e64591915826e9d67b06d724b71dafe2', 'd440acfc0a7d6197190a8d0e4ca94be0acaea146', '1', '1504237763');
INSERT INTO `v_picture` VALUES ('419', '/Uploads/Picture/2017-09-01/59a8d8c37cdef.jpg', '', 'b1e579a110f34f0d6fef248fba641ba9', '2ccb75924ccb910323f46c7ca1d644b5fe19867b', '1', '1504237763');
INSERT INTO `v_picture` VALUES ('420', '/Uploads/Picture/2017-09-01/59a8d8c3abfc1.jpg', '', '47c52d3783795524c41f88a049f76da5', '65d01385da069a0fa9ce4a5c37ec80832d0a57c8', '1', '1504237763');
INSERT INTO `v_picture` VALUES ('421', '/Uploads/Picture/2017-09-01/59a8d8c3e4cdf.jpg', '', '21be76807742fff64ebbfb06a020134f', '961492c32ff6a3fb684a3b244288fbea9759b917', '1', '1504237763');
INSERT INTO `v_picture` VALUES ('422', '/Uploads/Picture/2017-09-01/59a8d8c427e8c.jpg', '', 'f1fd8508d315d8454d2615b8015f6373', 'ab08f030ffeb611531418cfaaf174360ec170bc9', '1', '1504237764');
INSERT INTO `v_picture` VALUES ('423', '/Uploads/Picture/2017-09-01/59a8d8c45fdd3.jpg', '', '211f27e976de4862310a671e279eec3d', 'a0037437f0f1539d44afaea04acfe60cf5124755', '1', '1504237764');
INSERT INTO `v_picture` VALUES ('424', '/Uploads/Picture/2017-09-01/59a8d8c4b96ad.jpg', '', '4f45d46d5f6eda638688fb0f687b79b7', '4697cbb871f09b27499afa694d3bf258ab8bdd0e', '1', '1504237764');
INSERT INTO `v_picture` VALUES ('425', '/Uploads/Picture/2017-09-01/59a8d8c503d25.jpg', '', '23c93d5cf1611c9dbbe9cf1b48f9450b', '42df8c22c1d43824a80380d0175bea21528b45b1', '1', '1504237765');
INSERT INTO `v_picture` VALUES ('426', '/Uploads/Picture/2017-09-01/59a8d8c53d0bd.jpg', '', 'd4596dbbe91f48721a55901efdc6af24', '5e307b2909f2fca2b8dd04f82451828b501af471', '1', '1504237765');
INSERT INTO `v_picture` VALUES ('427', '/Uploads/Picture/2017-09-01/59a8d90944e09.jpg', '', '66460d941202beaa4b82422f79dd2367', 'c0c23993965629d4ced9d58c60898ba15cff2e79', '1', '1504237833');
INSERT INTO `v_picture` VALUES ('428', '/Uploads/Picture/2017-09-01/59a8d909778a2.jpg', '', '54137144f7f14920c001d8c6a3870a83', 'caaf6dd5947f0ce0f8b96b808f03aaf3b1a45630', '1', '1504237833');
INSERT INTO `v_picture` VALUES ('429', '/Uploads/Picture/2017-09-01/59a8d909b2386.jpg', '', 'd2abb06e784a768f19e3f2f6865a24dd', '3729371231a65d281dec358c32e9bc9a4db3e83d', '1', '1504237833');
INSERT INTO `v_picture` VALUES ('430', '/Uploads/Picture/2017-09-01/59a8d909ef7e4.jpg', '', '8a6249e78553f0d081f7001a674a3913', 'a7b1f5b623da2593a1aaa569f0c4db9664a5abfc', '1', '1504237833');
INSERT INTO `v_picture` VALUES ('431', '/Uploads/Picture/2017-09-01/59a8d90a2f533.jpg', '', '4c5c5dbce840d14958eb4ca4409d7676', 'ec72c4a2ecb7a5041765c24060223fc5b2809265', '1', '1504237834');
INSERT INTO `v_picture` VALUES ('432', '/Uploads/Picture/2017-09-01/59a8d90a71dc7.JPG', '', '79c2b30ee3c04ac44db5201b7b751648', '3d6993758679cc83c13f88bbcdd33e0186e97c77', '1', '1504237834');
INSERT INTO `v_picture` VALUES ('433', '/Uploads/Picture/2017-09-01/59a8d90aac6b6.JPG', '', 'e8c077a066a71c374331c66b6963f4e1', '84bc6b4a3f12a4b7f81d6a291dff4e4692a3547d', '1', '1504237834');
INSERT INTO `v_picture` VALUES ('434', '/Uploads/Picture/2017-09-01/59a8d90b0973b.JPG', '', '4d4cff41cab3787f4b417a8243f89ba0', 'c4b87f9d7a07cd84f87278c127e8450c78ae01d7', '1', '1504237835');
INSERT INTO `v_picture` VALUES ('435', '/Uploads/Picture/2017-09-01/59a8d90b50b3e.JPG', '', '45df5c96acc3dfb1321b73aff0f69a72', '0bd6ea6f65e8509f993f3db16db2ec8278bad739', '1', '1504237835');
INSERT INTO `v_picture` VALUES ('436', '/Uploads/Picture/2017-09-01/59a8d90b88903.jpg', '', '7c11fa4c5ed44433347274fdd2df70ee', 'fbc413ffec6d11193341aeabd93ec5b06a56e40f', '1', '1504237835');
INSERT INTO `v_picture` VALUES ('437', '/Uploads/Picture/2017-09-01/59a8d940e78b3.jpg', '', 'a9abcb18300f2f75e1bf470a3bb08069', 'a30625e8964adc50ed88695b17ab5ccb5fdfefc3', '1', '1504237888');
INSERT INTO `v_picture` VALUES ('438', '/Uploads/Picture/2017-09-01/59a8d941215da.jpg', '', '750e108d8720403a9a54c15c3f5ac2fe', 'bc642d3216990fea43863650fb73a92e510d54fb', '1', '1504237889');
INSERT INTO `v_picture` VALUES ('439', '/Uploads/Picture/2017-09-01/59a8d9ca14b58.jpg', '', '0f25bdcf31661569bfe411fb3681f182', '70895423e1d98176f9b25a7411d9033c27d237e2', '1', '1504238026');
INSERT INTO `v_picture` VALUES ('440', '/Uploads/Picture/2017-09-01/59a8da7b7a9bb.jpg', '', '168275e9993fe388dce2c28a45076b8c', '4adb60990fbfc2fd89d9a5fe977a90d4a5e54152', '1', '1504238203');
INSERT INTO `v_picture` VALUES ('441', '/Uploads/Picture/2017-09-01/59a8db39be651.jpg', '', '427966540d0ff48b04f10eea1a9231f5', '9f223337610a3a6222f67760a0fa0ddfd5701b5e', '1', '1504238393');
INSERT INTO `v_picture` VALUES ('442', '/Uploads/Picture/2017-09-01/59a8db3a29d61.jpg', '', 'e0f66d8b3525a36ad9931e1fe8048c3d', '24e9f04101d1a3e3ff84a677360dbcb53bd76682', '1', '1504238394');
INSERT INTO `v_picture` VALUES ('443', '/Uploads/Picture/2017-09-01/59a8db3a51000.jpg', '', 'd6185cf64db93593997a9e586c606358', '962f904cfaa6654b8811240e1d9f5c4266ec0553', '1', '1504238394');
INSERT INTO `v_picture` VALUES ('444', '/Uploads/Picture/2017-09-01/59a8db3a99274.jpg', '', '0149f380e4d3ed1e227c26ef3911e330', '27698fd0d7e9ba2117b5d0baa3934a6e765c6f78', '1', '1504238394');
INSERT INTO `v_picture` VALUES ('445', '/Uploads/Picture/2017-09-01/59a8db3ac62c4.jpg', '', '00853468d0920aa1e327f2b8a2a6dde0', '5d5b91f7fd079fd369482f8de1d220adbf63e560', '1', '1504238394');
INSERT INTO `v_picture` VALUES ('446', '/Uploads/Picture/2017-09-01/59a8db3aec40e.jpg', '', 'b31ffda99ab1b3927557ca03eece3587', 'b31f375eecf59d6ab37151e819c946ff3bf7a18f', '1', '1504238394');
INSERT INTO `v_picture` VALUES ('447', '/Uploads/Picture/2017-09-01/59a8fac219ff4.jpg', '', '85994b88faf5a6bd392a4349f9b07a1a', 'c74d7cd3ef071c8e50e8efda66af798db1c206f2', '1', '1504246466');
INSERT INTO `v_picture` VALUES ('448', '/Uploads/Picture/2017-09-01/59a8fac26833b.jpg', '', '1599a2ae4b52cc483655ab22c4a34913', '67e4c6238e736ac9e600dee322d3f8e658dd2d7d', '1', '1504246466');
INSERT INTO `v_picture` VALUES ('449', '/Uploads/Picture/2017-09-01/59a8fac29a620.jpg', '', '80d1654fe48bd1c1c5bfc871a669429b', '807af487f2b07c60ade7a7abb25170d74f515d11', '1', '1504246466');
INSERT INTO `v_picture` VALUES ('450', '/Uploads/Picture/2017-09-01/59a8fac2c42eb.jpg', '', '9a28c74129a219145e26165cf534788d', '459ba2b52b7463ddf3a5cf34586b0dd8d68e709b', '1', '1504246466');
INSERT INTO `v_picture` VALUES ('451', '/Uploads/Picture/2017-09-01/59a8fac2f1252.jpg', '', 'b3a2efbd7f372966cd8df0ac59aa542a', '6f5dfb4e5161d6969acdc87145425579c2e85bf1', '1', '1504246466');
INSERT INTO `v_picture` VALUES ('452', '/Uploads/Picture/2017-09-01/59a8fac332afe.jpg', '', '81e42563c5277fb10a31b44402d836ae', 'eb3c03c05f8ece9055c05ea2c72dae98fc7cc661', '1', '1504246467');
INSERT INTO `v_picture` VALUES ('453', '/Uploads/Picture/2017-09-01/59a8fac3657d6.jpg', '', '9fe164da6cc60a9688aad158460f8fd4', 'c9f24ce2dc2f79c639e1a596f793aea7e11c964d', '1', '1504246467');
INSERT INTO `v_picture` VALUES ('454', '/Uploads/Picture/2017-09-01/59a8fac397ff3.jpg', '', 'ff533f3267607a83c9c5f415dc68f314', 'a57b8591e6d972b875d08acd5f67e8fc72a91ea9', '1', '1504246467');
INSERT INTO `v_picture` VALUES ('455', '/Uploads/Picture/2017-09-01/59a8fb0e9d547.jpg', '', 'cc5dbbcef49e09dfadb58ba5880f452f', 'd89b98018ee451e4d03a5a9d8741742a01d41d16', '1', '1504246542');
INSERT INTO `v_picture` VALUES ('456', '/Uploads/Picture/2017-09-01/59a8fb0ecdd4f.jpg', '', '41ae46d8a5df801a4e1321edd244c9b2', 'a63c6868310e5fe276cc831a8d3d601af3ee9398', '1', '1504246542');
INSERT INTO `v_picture` VALUES ('457', '/Uploads/Picture/2017-09-01/59a8fb0f04864.jpg', '', 'd14dd4a62d9aeaa93cdcda8f2dc6d590', '8fc04bbc9e6a6546b01d6e48b093a8941f4f9cec', '1', '1504246543');
INSERT INTO `v_picture` VALUES ('458', '/Uploads/Picture/2017-09-01/59a8fb0f4d72c.jpg', '', 'cf386ea548162ac47ef1a090b577465b', '8cc8d94b92ae573ee2bea16ad3b0b6cee486ed86', '1', '1504246543');
INSERT INTO `v_picture` VALUES ('459', '/Uploads/Picture/2017-09-01/59a8fb6540d1d.jpg', '', '9d4fda6b9a740f5e71e6c020ba328f25', '8e6eec64e12c9112e86af826395ef05db26d99f8', '1', '1504246629');
INSERT INTO `v_picture` VALUES ('460', '/Uploads/Picture/2017-09-01/59a8fb78363c4.JPG', '', 'e54698b74fd75fa216ce4305f13f96e2', '6770984172eecb449986ed9093115a5a70c9fef1', '1', '1504246648');
INSERT INTO `v_picture` VALUES ('461', '/Uploads/Picture/2017-09-01/59a908d69da0a.jpg', '', '94de2114694a29e5fa20a0210fc56efa', '029395eabb308ef91d6945560806e00986f523f2', '1', '1504250070');
INSERT INTO `v_picture` VALUES ('462', '/Uploads/Picture/2017-09-01/59a908d73c276.jpg', '', '9cfa5d813f11068f1e1af080a4f93061', '1afcc73f533f20a434c1ba9e4125b9ee2b70d265', '1', '1504250071');
INSERT INTO `v_picture` VALUES ('463', '/Uploads/Picture/2017-09-01/59a908e3089ea.jpg', '', 'dccb960e6e7ec53274bffc305148f760', '9399ad62a486fd70953af8d3d9709c8bfdf00437', '1', '1504250083');
INSERT INTO `v_picture` VALUES ('464', '/Uploads/Picture/2017-09-01/59a908e335fee.jpg', '', '6316d055125213c2daea5d8cc9824eff', '045fe997093116afdc15514b0c0d1a3b0b6e6a64', '1', '1504250083');
INSERT INTO `v_picture` VALUES ('465', '/Uploads/Picture/2017-09-01/59a908e387694.jpg', '', '1d37096fd190b817ee208b7933b1f091', '41efb1a46e4f7149dcb70791bf07e71e7b42180b', '1', '1504250083');
INSERT INTO `v_picture` VALUES ('466', '/Uploads/Picture/2017-09-01/59a908e3b5327.jpg', '', 'c311ba3a321dede29dfd340b94bcf18f', '483ea9f8949aa48674ef511a9059b652f8c76d42', '1', '1504250083');
INSERT INTO `v_picture` VALUES ('467', '/Uploads/Picture/2017-09-01/59a908e42aa0d.jpg', '', '44cfa8440a571aa459556534dfc1dfd1', '96013cdcfdc903ef097471103416282db6ecc0f6', '1', '1504250084');
INSERT INTO `v_picture` VALUES ('468', '/Uploads/Picture/2017-09-01/59a908e498776.jpg', '', '8ee3b6806b7c772537d64916df2928af', 'f75aac1468db3f1153268016da497d3931545465', '1', '1504250084');
INSERT INTO `v_picture` VALUES ('469', '/Uploads/Picture/2017-09-01/59a90a0dc1003.jpg', '', '467f6c8ff6e485c38600fb5a028cd71d', '95cb22dcbc90ba8e140983b9129824f182a361cf', '1', '1504250381');
INSERT INTO `v_picture` VALUES ('470', '/Uploads/Picture/2017-09-01/59a90a27e1378.jpg', '', 'a49c9acb4524640285d8b7d4639d751c', '0f5806f5443dea8f7898964e0792c0c1f346ca2a', '1', '1504250407');
INSERT INTO `v_picture` VALUES ('471', '/Uploads/Picture/2017-09-01/59a90a283119f.jpg', '', '3c50b86bab2b674087ab44451a9cc3a1', '7c4cbcd846cc98e21020775715404737f344ef6f', '1', '1504250408');
INSERT INTO `v_picture` VALUES ('472', '/Uploads/Picture/2017-09-01/59a90a288a8bf.jpg', '', 'b0f19ad3b866a414af58b0be5a1f6580', '8e17955ea5ff6aac78faf0e9b8ee4e2474defa92', '1', '1504250408');
INSERT INTO `v_picture` VALUES ('473', '/Uploads/Picture/2017-09-01/59a90a28eff29.jpg', '', 'c029723b63bdf9f0f85114e6e7fe4ee6', 'd1c02c0ebffcb0f7f16f5588aac7ed8cda2c2829', '1', '1504250408');
INSERT INTO `v_picture` VALUES ('474', '/Uploads/Picture/2017-09-01/59a90a2986544.jpg', '', 'b02465c56b5bb79460dd0a23c2408533', '679f8acbf1dda3c3960b069bb9849a0f8abe3790', '1', '1504250409');
INSERT INTO `v_picture` VALUES ('475', '/Uploads/Picture/2017-09-01/59a90a29b5a32.jpg', '', 'e741b2927fe977d7c0077aaab6f814d6', '29cad304893ede1973725fe579683a43f0b7fd3f', '1', '1504250409');
INSERT INTO `v_picture` VALUES ('476', '/Uploads/Picture/2017-09-01/59a90a2a57d1b.jpg', '', '0aa39966768f91c29432e309d8751824', 'fe530bfa10dbe26514e35a0ff9a9aff7340c7ede', '1', '1504250410');
INSERT INTO `v_picture` VALUES ('477', '/Uploads/Picture/2017-09-01/59a90a2a7ccaf.jpg', '', 'aba0309b04511935e54cf69c2a0cde17', '832bdffdd518789ebaa98ecaeff6cce094ac20c9', '1', '1504250410');
INSERT INTO `v_picture` VALUES ('478', '/Uploads/Picture/2017-09-01/59a90a2aa8b4d.jpg', '', '320075e4ca0258f7612d2965cd81e6f9', '0df6b3a8595f58c43607e29d27a7d199d23f641d', '1', '1504250410');
INSERT INTO `v_picture` VALUES ('479', '/Uploads/Picture/2017-09-01/59a90a69af365.jpg', '', '4d8b61342a3cc203afbf4cd86e64877c', '7e80ceae24b0798503b5469802f72fbad5072f96', '1', '1504250473');
INSERT INTO `v_picture` VALUES ('480', '/Uploads/Picture/2017-09-01/59a90a6a2f38e.jpg', '', '0c1c7d919de7204a27da706e238d7f7c', 'ce45769f8aa8e7b7ed7bf52aa85a33fec5db74c7', '1', '1504250474');
INSERT INTO `v_picture` VALUES ('481', '/Uploads/Picture/2017-09-01/59a90a6a7718b.jpg', '', 'b18c11641d96f860b1f3c5b65f13ede5', '8f051c0b82e9bb32ee8c5b652eb694e0ddcfbbb0', '1', '1504250474');
INSERT INTO `v_picture` VALUES ('482', '/Uploads/Picture/2017-09-01/59a90a6ad0d8b.jpg', '', '0887a591ea6c06b4991d6387d3ca4405', 'de5d36d1dc998a624281338930d3bc0b2301290f', '1', '1504250474');
INSERT INTO `v_picture` VALUES ('483', '/Uploads/Picture/2017-09-01/59a90a6b3a412.jpg', '', '7f2fbf80d16d0ec4dd678719f5ffc8ba', '1402b76b67b09ab736e75facbd0301be2d77742d', '1', '1504250475');
INSERT INTO `v_picture` VALUES ('484', '/Uploads/Picture/2017-09-01/59a90a6b7c49f.jpg', '', '323d1e6f9003c51778111f0867ec57b4', 'e3711a6d21dbcff0caa4b176593eb6ce9d3d7c95', '1', '1504250475');
INSERT INTO `v_picture` VALUES ('485', '/Uploads/Picture/2017-09-01/59a90a6bc1ef8.jpg', '', '67aaafb9a1eb3a94eacf93530ec8d57e', '609214502075b60da734c884348fb44c61eb3849', '1', '1504250475');
INSERT INTO `v_picture` VALUES ('486', '/Uploads/Picture/2017-09-01/59a90a6c29ddb.jpg', '', '39ef313be60450f0afe0acc2ed4af47e', 'dafd8639c873b1d943127761909a3a553d9d3144', '1', '1504250476');
INSERT INTO `v_picture` VALUES ('487', '/Uploads/Picture/2017-09-01/59a90a6c6526a.jpg', '', 'b82526e20592b0f804ecc159ba3f98de', '95e2cdf8b606053120fff9e7616907294eb30c58', '1', '1504250476');
INSERT INTO `v_picture` VALUES ('488', '/Uploads/Picture/2017-09-01/59a90a6ca5803.jpg', '', '78f6e6bdb96c1f298836522c4d628689', 'cb897c159847eb958ba6a08f7d558c395e9140d6', '1', '1504250476');
INSERT INTO `v_picture` VALUES ('489', '/Uploads/Picture/2017-09-01/59a90a6d0f0a6.jpg', '', 'bb657c75956f3fa9f7cf5e6e55e10211', '47a397b9a42763ad7b34daa5022a6df423091e96', '1', '1504250477');
INSERT INTO `v_picture` VALUES ('490', '/Uploads/Picture/2017-09-01/59a90a6d53e0d.jpg', '', 'dd8ca6e72ef3c297e3c6efe8f1d9e6dd', 'c063897a61002b838fc0246f2a2a0b67c69b3224', '1', '1504250477');
INSERT INTO `v_picture` VALUES ('491', '/Uploads/Picture/2017-09-01/59a90a6d78a4e.jpg', '', '7525293f3598aed1d162b6eafd0980f7', '4f3e208838273f6732c6bc68e74acd767ea2fb77', '1', '1504250477');
INSERT INTO `v_picture` VALUES ('492', '/Uploads/Picture/2017-09-01/59a9115a801c0.jpg', '', 'ac725125ece458dfc084dc3d44e5571b', 'b35a37b0e71b814d47503301c256b3dc8d397b90', '1', '1504252250');
INSERT INTO `v_picture` VALUES ('493', '/Uploads/Picture/2017-09-01/59a9119c4a306.jpg', '', '001a057f7151919df5f74d44b65becb2', 'cfea56bc528eb76fa872fdcbc4201cc1e37956d0', '1', '1504252316');
INSERT INTO `v_picture` VALUES ('494', '/Uploads/Picture/2017-09-01/59a9119ec9a80.jpg', '', '5d67a6fbfa76c557879ba051b42ecfb3', '63d63f17017357750aaffac729b857b607b879b1', '1', '1504252318');
INSERT INTO `v_picture` VALUES ('495', '/Uploads/Picture/2017-09-01/59a911a0e00a0.jpg', '', 'fb5e0b104fe9d58f78c47269fb82bec8', '4908dad1e097bbfaaec45babbb961696232d9b1d', '1', '1504252320');
INSERT INTO `v_picture` VALUES ('496', '/Uploads/Picture/2017-09-01/59a911a31517c.jpg', '', '38aefcb34e168c43af70c8cbc83b1afc', '501685a3d8534e2a97e9e2c28e06642ffd343eda', '1', '1504252323');
INSERT INTO `v_picture` VALUES ('497', '/Uploads/Picture/2017-09-01/59a911a518c37.jpg', '', '2c62c5c1bc3c3bef1ba07b0c30d3fedc', 'c450999adad1d2edf2e0e10c1bd1ed64908494cd', '1', '1504252325');
INSERT INTO `v_picture` VALUES ('498', '/Uploads/Picture/2017-09-01/59a911a744e9c.jpg', '', '4f15b1163b7e7a2386a1bfb53a35ff43', '0e89db03cb7732e10b312b3b13d82fe84b086a4c', '1', '1504252327');
INSERT INTO `v_picture` VALUES ('499', '/Uploads/Picture/2017-09-01/59a911a94cd54.jpg', '', '2d65e0539c9320e44bf38abc73bb8130', '28cb507277be7a279daa1ff511e424f3375a2515', '1', '1504252329');
INSERT INTO `v_picture` VALUES ('500', '/Uploads/Picture/2017-09-01/59a911ab538f7.jpg', '', 'e13dfc8710e6d3b11187455b6afe7df2', '5d705a9e52f1b782956102b76e62ef7424daf9f2', '1', '1504252331');
INSERT INTO `v_picture` VALUES ('501', '/Uploads/Picture/2017-09-01/59a9173f06385.jpg', '', 'a86159749c8a75a616b06cc05ea5f7de', '41d9a5244832386a6fb087ab419e3de0b2bf8e4d', '1', '1504253759');
INSERT INTO `v_picture` VALUES ('502', '/Uploads/Picture/2017-09-01/59a9173f4c73e.jpg', '', 'b9d7ac3e47702b9ddf7dd4a9cbc371c3', '7a1df3ef0b1b67b6e737d65507a4ce5e1edb1aa8', '1', '1504253759');
INSERT INTO `v_picture` VALUES ('503', '/Uploads/Picture/2017-09-01/59a9173f7ecf3.jpg', '', 'bd084bf95cfae86f66fb2de5c6cb857a', 'd49cfa77dcc5ac0510cf7f4cc3f7b935e4d3c6b6', '1', '1504253759');
INSERT INTO `v_picture` VALUES ('504', '/Uploads/Picture/2017-09-01/59a9173faf0ba.jpg', '', 'e70585437048e2b259989e22b2b482b9', '1db5cbbc81165495691887ecb78a7a068c11931a', '1', '1504253759');
INSERT INTO `v_picture` VALUES ('505', '/Uploads/Picture/2017-09-01/59a9173fef0b9.jpg', '', '85bc51e412169fe16b4993198bbd3329', '705446548e4d02398ff2c4f14e06d1cde8c72171', '1', '1504253759');
INSERT INTO `v_picture` VALUES ('506', '/Uploads/Picture/2017-09-01/59a917402eb7a.jpg', '', '487efbcfef776bf9e221d02761225bed', '1285875a0cff74c580ba0f2288a3c300424ab396', '1', '1504253760');
INSERT INTO `v_picture` VALUES ('507', '/Uploads/Picture/2017-09-01/59a917405db53.jpg', '', '314172971e2d4f064ddcd622c59a7e26', '1a14a44ca7e58bbaa61cb0816838f602d99e9f7c', '1', '1504253760');
INSERT INTO `v_picture` VALUES ('508', '/Uploads/Picture/2017-09-01/59a9174090309.jpg', '', 'c8d966ce930f893088d93579bec73e6c', 'e73833a9cca69201c5b48323f1f78dfc2a51e70b', '1', '1504253760');
INSERT INTO `v_picture` VALUES ('509', '/Uploads/Picture/2017-09-01/59a91740bfc5c.jpg', '', '6a589fbd4872d87206854f8d61f17051', '386fefdb52dcde24d68d0c8a239e90092c982244', '1', '1504253760');
INSERT INTO `v_picture` VALUES ('510', '/Uploads/Picture/2017-09-01/59a917410782c.jpg', '', '19d562999d83f1dcb1b56dc075239e18', '3e8fb19599ff39c6ec3a6fc7ce225af059e2a4aa', '1', '1504253761');
INSERT INTO `v_picture` VALUES ('511', '/Uploads/Picture/2017-09-01/59a917794cc17.jpg', '', '2b037f082a0101e948decb1809d1a8ba', '8f534c6c7b732e6d3e9fb002dd06283a0829fe68', '1', '1504253817');
INSERT INTO `v_picture` VALUES ('512', '/Uploads/Picture/2017-09-01/59a917799b3a2.jpg', '', 'f8af0e0c1b5bb27b0cde3c26617f7693', 'a71d68064a69ddb1063b8c0e671d7982dd1b8b52', '1', '1504253817');
INSERT INTO `v_picture` VALUES ('513', '/Uploads/Picture/2017-09-01/59a91779d9570.jpg', '', 'e69a9cd105347bd4d8515d4454ed43e8', '37920427efcfacfee639205ac3105890da485a95', '1', '1504253817');
INSERT INTO `v_picture` VALUES ('514', '/Uploads/Picture/2017-09-01/59a9177a1a650.jpg', '', '45633c9a0deca94c95ab0dd2f2b19e84', 'c1cdd4346455180ae15ba7575b4fd073c28857e6', '1', '1504253818');
INSERT INTO `v_picture` VALUES ('515', '/Uploads/Picture/2017-09-01/59a9177a50d22.jpg', '', '12134d976adbd89a058dc4537eb8bae0', '6125938d038ca5cbc44f220fff693ee3147118f5', '1', '1504253818');
INSERT INTO `v_picture` VALUES ('516', '/Uploads/Picture/2017-09-01/59a9177a84e8d.jpg', '', 'a94a018d3994a7a0834ddc8d97152f87', '3fded49526d7ebbd659cf900b9fd7a3d9467a449', '1', '1504253818');
INSERT INTO `v_picture` VALUES ('517', '/Uploads/Picture/2017-09-01/59a9177ace134.jpg', '', 'c32f58518629215a0fac59b75c1b56b4', '9c54296638257635e4587130df3a269203f68ce1', '1', '1504253818');
INSERT INTO `v_picture` VALUES ('518', '/Uploads/Picture/2017-09-01/59a9177b16e6e.jpg', '', '54cabeff5e4c07533c1e2211aef82a65', 'cb554550cb9b830e7ebc02f6062aecc989ae6e60', '1', '1504253819');
INSERT INTO `v_picture` VALUES ('519', '/Uploads/Picture/2017-09-01/59a9177b54df4.jpg', '', '7a07b7f2a8d0dcec672e1984b07c071d', '01428e98c32175ee63576c6d49b7b01d9c5b7c53', '1', '1504253819');
INSERT INTO `v_picture` VALUES ('520', '/Uploads/Picture/2017-09-01/59a9177b93a90.jpg', '', '2451d77b44fcea2e8f4b113ce9e9500e', '6b1799c31ab56640bbf139096718aa9633878963', '1', '1504253819');
INSERT INTO `v_picture` VALUES ('521', '/Uploads/Picture/2017-09-01/59a9177c17aa8.jpg', '', 'ff71c9d22c7eb05ed9b1efcc7bdc77ff', '5fff58a0abeeefd99b9301ff0bbdd11f64b27039', '1', '1504253820');
INSERT INTO `v_picture` VALUES ('522', '/Uploads/Picture/2017-09-01/59a918f266d9b.jpg', '', 'c14fcef2e5dae4e7ef568cb68aeec35d', '24359089836e1da398dfc1ed853d494e07a6cd27', '1', '1504254194');
INSERT INTO `v_picture` VALUES ('523', '/Uploads/Picture/2017-09-01/59a918f295e06.jpg', '', '60ce3b6383d643d05d21862644f0b871', 'fb5bb1f07907e225fe498790584c67660b9f1b86', '1', '1504254194');
INSERT INTO `v_picture` VALUES ('524', '/Uploads/Picture/2017-09-01/59a918f2c49bc.jpg', '', '3c432c7c6f19f741a739d0bbd903a396', '5f2a25c207a463366fecddb830794fcc05377b01', '1', '1504254194');
INSERT INTO `v_picture` VALUES ('525', '/Uploads/Picture/2017-09-01/59a918feb24b7.jpg', '', 'a57afe63a740452f8abee3b790dd930c', 'd1acd5b5d5673a72912383b2aa74ccdbb2bcf2de', '1', '1504254206');
INSERT INTO `v_picture` VALUES ('526', '/Uploads/Picture/2017-09-01/59a918fee6bf9.jpg', '', '35778c0967650c2987c16f384ef7614f', '9adb01d62c045c1384df4aad73717dd81a72c993', '1', '1504254206');
INSERT INTO `v_picture` VALUES ('527', '/Uploads/Picture/2017-09-01/59a918ff25141.jpg', '', '930fd081a1ce17a5ed2aaf600f6af0f0', '0b2d100352fa9a8f9ad4ec05c0aab82bab4ebeee', '1', '1504254207');
INSERT INTO `v_picture` VALUES ('528', '/Uploads/Picture/2017-09-01/59a918ff57ce4.jpg', '', '8541f13e1254e27fc41e4ac14f18ee77', '881f5c4851c0e95fdd0d5769d80a158de71d093b', '1', '1504254207');
INSERT INTO `v_picture` VALUES ('529', '/Uploads/Picture/2017-09-01/59a918ff60043.jpg', '', 'bc6887732405a93976063a7d7d20d196', '00f1960c3c93bde82c97680f22458d6651f16087', '1', '1504254207');
INSERT INTO `v_picture` VALUES ('530', '/Uploads/Picture/2017-09-01/59a918ff8de9a.jpg', '', '7fbcaf01cef66c5d1b7cd1a87425a11c', 'ed5496ef9914f2d5c933611db1f83508d44eed8f', '1', '1504254207');
INSERT INTO `v_picture` VALUES ('531', '/Uploads/Picture/2017-09-01/59a918ffa8c31.jpg', '', '0bffe8960b4145e43f372a4042feb0b9', '1b240b4281b5ac45096a2b8978722b43729eafb0', '1', '1504254207');
INSERT INTO `v_picture` VALUES ('532', '/Uploads/Picture/2017-09-01/59a919052107c.jpg', '', 'f301a5bebfede2726ab814f2c46459ed', 'd9b7e1fc89ccfe60cace02c479018fd51efb520e', '1', '1504254213');
INSERT INTO `v_picture` VALUES ('533', '/Uploads/Picture/2017-09-01/59a9190522ddc.jpg', '', 'be01ad2bf4a427c3872a130893ab48bc', 'e72ed7b928ab0cd06ee1b6e1c5aa8ec3c4114a7b', '1', '1504254213');
INSERT INTO `v_picture` VALUES ('534', '/Uploads/Picture/2017-09-01/59a919054ddb6.jpg', '', '2dfd8927b44b188726936bc6ff66d197', '15b2e1757e944fca82d6dc834a9537f0d5238ab1', '1', '1504254213');
INSERT INTO `v_picture` VALUES ('535', '/Uploads/Picture/2017-09-01/59a919055a5f5.jpg', '', 'd5b057a930c087a6d194c0c8a126e93c', 'a3ff0205b81fcb6bbc7bd3ea7d5e60352e37b3d4', '1', '1504254213');
INSERT INTO `v_picture` VALUES ('536', '/Uploads/Picture/2017-09-01/59a919059a1b3.jpg', '', '4475d5f747fac3278a5f589402b89ada', '29f29e8f678889e5a7120364cb4db09f322c2d40', '1', '1504254213');
INSERT INTO `v_picture` VALUES ('537', '/Uploads/Picture/2017-09-01/59a91905a12b2.jpg', '', '28396158e3b205a200b95a5f0636fae4', '4d97357db6fb250935ef6366fd92d1a4d8589be3', '1', '1504254213');
INSERT INTO `v_picture` VALUES ('538', '/Uploads/Picture/2017-09-01/59a91905ef24b.jpg', '', '2ee3c29fbeb449f9e403bee36b17de90', 'a78227a640d773c8d28242ebf01b8bb5c6be1c8c', '1', '1504254213');
INSERT INTO `v_picture` VALUES ('539', '/Uploads/Picture/2017-09-01/59a91905f1049.jpg', '', '23c0984b526b617826776c4020eb1a1b', '781e5cd6f3c590bafdecf887638727e5697288d7', '1', '1504254213');
INSERT INTO `v_picture` VALUES ('540', '/Uploads/Picture/2017-09-01/59a91905f2948.png', '', 'be32ca64bf894a8a9eb31cb873d4d059', '836b351ae8490177f18baa6463cd48dbbb5e8bab', '1', '1504254213');
INSERT INTO `v_picture` VALUES ('541', '/Uploads/Picture/2017-09-01/59a91906433c4.jpg', '', '0aa144d648ed49f937791e05b4477547', '2873b7d4a7994985bf5db37509359ce7cd7ea8a6', '1', '1504254214');
INSERT INTO `v_picture` VALUES ('542', '/Uploads/Picture/2017-09-01/59a9190673f7a.jpg', '', '538b6681afc393d1d300a0c536cb9a05', '16845eae7408fe15e3f600b01148ea5c5f0abeb0', '1', '1504254214');
INSERT INTO `v_picture` VALUES ('543', '/Uploads/Picture/2017-09-01/59a91906d7169.jpg', '', '8aa0674401107e9a9ac6422e860665a5', '2da41c9865307c20a56a496d1883d64b35286fb9', '1', '1504254214');
INSERT INTO `v_picture` VALUES ('544', '/Uploads/Picture/2017-09-01/59a9190710a19.jpg', '', '750d1aed44debf67fa173eea620ad8e8', '724d0b8342bcf4e943df919be6094d1cf91cb1d6', '1', '1504254215');
INSERT INTO `v_picture` VALUES ('545', '/Uploads/Picture/2017-09-01/59a91b1765864.jpg', '', '53970be8e411b56aace0f8af27f1327a', '078fee5daf2add314de219dda91938dce560b499', '1', '1504254743');
INSERT INTO `v_picture` VALUES ('546', '/Uploads/Picture/2017-09-01/59a91b178ebdf.jpg', '', 'ae6beae494e8b598cfce7c40c101dcff', 'f924b7fad4cc96d1740e5e8e1dee17a1755dc6da', '1', '1504254743');
INSERT INTO `v_picture` VALUES ('547', '/Uploads/Picture/2017-09-01/59a91b17b4a08.jpg', '', 'b1f98193d522448645ea70dc8b254571', '280089443a1256a496eb9e39212c4633a847996f', '1', '1504254743');
INSERT INTO `v_picture` VALUES ('548', '/Uploads/Picture/2017-09-01/59a91b17df85b.jpg', '', '3590aab9f8837779fdc0b7c74721a4a0', '09897fd9a0dedb8b2f2e82237e17b643876d7ba7', '1', '1504254743');
INSERT INTO `v_picture` VALUES ('549', '/Uploads/Picture/2017-09-01/59a91b181300b.jpg', '', 'd05041a0a2c757abad59c59588288a2d', '7cd0c0182f0681d86f62f0621ab6ff971af3a545', '1', '1504254744');
INSERT INTO `v_picture` VALUES ('550', '/Uploads/Picture/2017-09-01/59a91b18399a0.jpg', '', 'bb959f664b6931fa0420981962032b4e', 'ef54320d1c8b160a7b235a57c3d5fe89198fe06b', '1', '1504254744');
INSERT INTO `v_picture` VALUES ('551', '/Uploads/Picture/2017-09-01/59a91b1868f51.jpg', '', 'bef66f50f3b8ef73d7f83414eee0b371', 'c8f61c3009bdc9bda29c1b7cc9fb71ed975012f4', '1', '1504254744');
INSERT INTO `v_picture` VALUES ('552', '/Uploads/Picture/2017-09-01/59a91b189315e.jpg', '', 'f43401b68eac73bbeb68868fc5141a51', 'd36c3d6fe2a3de7b0a42b806ce3902a0ef9208ec', '1', '1504254744');
INSERT INTO `v_picture` VALUES ('553', '/Uploads/Picture/2017-09-01/59a91b18c0b35.jpg', '', 'df9aca35d4d9e0676ea67a80242fa461', '543ae0dd76c6157cedc5d299d60ac6320814ada9', '1', '1504254744');
INSERT INTO `v_picture` VALUES ('554', '/Uploads/Picture/2017-09-01/59a91b18ec5d0.jpg', '', 'd4b2fd283dc73dc0bc2c356435aa1cd1', '6ae4edd3620d16ab9110dde37989fcacb83ffc41', '1', '1504254744');
INSERT INTO `v_picture` VALUES ('555', '/Uploads/Picture/2017-09-01/59a91b194723c.jpg', '', '8a3693cee16d1acc4b2dcc31ba2d2e36', '8f846edca9a1a306b02ce50e69637449fa45944a', '1', '1504254745');
INSERT INTO `v_picture` VALUES ('556', '/Uploads/Picture/2017-09-01/59a91b3baab3d.jpg', '', '2e0df7a31741f7867df5d62c56b2cca0', '6bd0a85f23b78b0075b948b7bfc3d75991e360df', '1', '1504254779');
INSERT INTO `v_picture` VALUES ('557', '/Uploads/Picture/2017-09-01/59a91b3cd06e8.jpg', '', '9e495327273c9b7178fccec7352509dd', '426bea1eea0c4c475684757856623c1452639b21', '1', '1504254780');
INSERT INTO `v_picture` VALUES ('558', '/Uploads/Picture/2017-09-01/59a91b4ddd933.jpg', '', 'cf3fb003b43abc7f80f851f783e8cdab', '0b4ec2686596bbce872caede508f21286833d760', '1', '1504254797');
INSERT INTO `v_picture` VALUES ('559', '/Uploads/Picture/2017-09-01/59a91b4e16852.jpg', '', '00565452663982a624c9ad9d71a1ae5d', '2f68fa8d5a8157ca143de43d9d645a9c37848eab', '1', '1504254798');
INSERT INTO `v_picture` VALUES ('560', '/Uploads/Picture/2017-09-01/59a91b4e3ead6.jpg', '', '87870aee571043f59d585f153e9fb45a', '77d948f774eb72d8faa34a2cd47bd661fa384310', '1', '1504254798');
INSERT INTO `v_picture` VALUES ('561', '/Uploads/Picture/2017-09-01/59a91b4e6be57.jpg', '', '378c2efb458ba9de253d5d19a5139f0a', '297857a8ca9c62185d86b840da4433d2259e9017', '1', '1504254798');
INSERT INTO `v_picture` VALUES ('562', '/Uploads/Picture/2017-09-01/59a91b4e9bf42.jpg', '', '923bc1c287ad35a51251bcefae993736', '8e4b75a1954c597e2489aaba0bf10ba04b4df759', '1', '1504254798');
INSERT INTO `v_picture` VALUES ('563', '/Uploads/Picture/2017-09-01/59a91b6ee80c1.jpg', '', '6176bc7822136142225ecfd4c4f58943', 'cfd6445284d991d6c5e239a37f1ae6ecc11be154', '1', '1504254830');
INSERT INTO `v_picture` VALUES ('564', '/Uploads/Picture/2017-09-01/59a91b6f28f65.jpg', '', 'c5f2893e189551b8b2adc0b16d908b4e', 'fb4546788fce51b98de09253605f73218e9bbce0', '1', '1504254831');
INSERT INTO `v_picture` VALUES ('565', '/Uploads/Picture/2017-09-01/59a91b6f77c7f.jpg', '', 'c4effe82c840b656f21eda493aa42261', 'd36ed8a32e56ad96f01ef45c8827d7fb57f0cf4e', '1', '1504254831');
INSERT INTO `v_picture` VALUES ('566', '/Uploads/Picture/2017-09-01/59a91b6fa8b27.jpg', '', 'b98f1f17b1e8cb3bcb006d809a260910', '33f1c2ca46341d069ec353c47da8d283920541e1', '1', '1504254831');
INSERT INTO `v_picture` VALUES ('567', '/Uploads/Picture/2017-09-01/59a91b6fe0f68.jpg', '', '2e6512a60860ed81fb249a2709951b2f', '40ecc42fa77639b9d4720c1e687bbaebbd8a4c29', '1', '1504254831');
INSERT INTO `v_picture` VALUES ('568', '/Uploads/Picture/2017-09-01/59a91b701ed87.jpg', '', '55854e38aa0991e286fc946097a04ad6', '4e85b11437221e0b67458bdfa9325127bcda9fa5', '1', '1504254832');
INSERT INTO `v_picture` VALUES ('569', '/Uploads/Picture/2017-09-01/59a91b704ab33.jpg', '', 'a2118a3c597902285a0252c1b8fff7c3', '1359606f6a0b40dc5d12740934dc47237cac5860', '1', '1504254832');
INSERT INTO `v_picture` VALUES ('570', '/Uploads/Picture/2017-09-01/59a91b708ee6c.jpg', '', 'd4b35da6491ce97c53a41b0f33ea4d20', '6c4f8ebc3e3da3c025624fa9f648315d0016dc86', '1', '1504254832');
INSERT INTO `v_picture` VALUES ('571', '/Uploads/Picture/2017-09-01/59a91b70c221e.jpg', '', 'b7e89c297831205d57d95011897695a6', 'edcecd16ddb52b5abf26057f52901331b7c6bf57', '1', '1504254832');
INSERT INTO `v_picture` VALUES ('572', '/Uploads/Picture/2017-09-01/59a91cee0f098.jpg', '', '103667ea14b00183578471745790e210', 'c5ca9c779641fac16440198c083f414e446b7853', '1', '1504255214');
INSERT INTO `v_picture` VALUES ('573', '/Uploads/Picture/2017-09-01/59a91cee5533d.jpg', '', '07e2562c1ce0402b9d63429aa3e7d62a', 'd621082faba50bd4034d9e272062bfd64172c912', '1', '1504255214');
INSERT INTO `v_picture` VALUES ('574', '/Uploads/Picture/2017-09-01/59a91cee81151.jpg', '', '71112cfd4e26079383c1d87e3fa395f1', '7f9d43fb9d1314719a99e29062f7ad0301bb7957', '1', '1504255214');
INSERT INTO `v_picture` VALUES ('575', '/Uploads/Picture/2017-09-01/59a91ceeb1a25.jpg', '', 'c9d0aaa8c4f232a77a024b497f2ca355', 'd23edcb10f5db34c8d1cca6ab020f85573113185', '1', '1504255214');
INSERT INTO `v_picture` VALUES ('576', '/Uploads/Picture/2017-09-01/59a91ceee7661.jpg', '', '08c86fe3c2dcd3fc30eec9033c4003d9', 'ce0b080774708eec187526a556ae868ca5ef3a17', '1', '1504255214');
INSERT INTO `v_picture` VALUES ('577', '/Uploads/Picture/2017-09-01/59a91cef1d90a.jpg', '', '7df84ae108e1381dc0c1f3741c1354ec', '5d8ab5b5a171ad3422fa6c82f7848fd9d1ebcf55', '1', '1504255215');
INSERT INTO `v_picture` VALUES ('578', '/Uploads/Picture/2017-09-01/59a91cef54a2c.jpg', '', 'b547cbc8327818ca6350a8400397c33b', '205bb3f8fa5426702d21cc65edfedbd13fddf328', '1', '1504255215');
INSERT INTO `v_picture` VALUES ('579', '/Uploads/Picture/2017-09-01/59a91cf5a3578.jpg', '', '4c3d53d76184d89fa2e3de31e521f0ec', '388b4aa02734f864b387516c3902fcf962d67733', '1', '1504255221');
INSERT INTO `v_picture` VALUES ('580', '/Uploads/Picture/2017-09-01/59a91cf5d5f25.jpg', '', '68e34e2c92feed7c03831701b7b282d1', '4e6a8b918277c3c32e5828579b0c94275fcec3dc', '1', '1504255221');
INSERT INTO `v_picture` VALUES ('582', '/Uploads/Picture/2017-09-01/59a91cf63bc0c.jpg', '', '50a73ed7e9a282a10139abda33d6b794', 'f3e45c5325e16ae7ef3f9087e266d7c870961fbf', '1', '1504255222');
INSERT INTO `v_picture` VALUES ('583', '/Uploads/Picture/2017-09-01/59a91d06b6cf1.jpg', '', '00790ce74cfce311148f85bb125458e7', '9915d4e0028ddbcbcf8ab987aa43a3fde61800f4', '1', '1504255238');
INSERT INTO `v_picture` VALUES ('584', '/Uploads/Picture/2017-09-01/59a91d06def1f.jpg', '', 'a136db403dd1fb452dc14c33c4363e85', 'c143dbf6111a19af4f2ef87af9aad8a84e0a571c', '1', '1504255238');
INSERT INTO `v_picture` VALUES ('585', '/Uploads/Picture/2017-09-01/59a91d0711793.jpg', '', '6b8f6ad9a215f2f6c8fb65fae9ad5356', '36bb35a975376d4405c2c157b5479ebebf24690c', '1', '1504255239');
INSERT INTO `v_picture` VALUES ('586', '/Uploads/Picture/2017-09-01/59a91d073f10e.jpg', '', '78f866822ba1a31f655bd1df81aeb91e', '7bf8eb3dd3691b7ba9869182881f0af012281e7e', '1', '1504255239');
INSERT INTO `v_picture` VALUES ('587', '/Uploads/Picture/2017-09-01/59a91d076b5a6.jpg', '', '3d50aced3b258c3b86116b0c1dd854af', 'cc9fe48d061c46ccd5580b2dd1d3dbdfc29dff25', '1', '1504255239');
INSERT INTO `v_picture` VALUES ('588', '/Uploads/Picture/2017-09-01/59a91d0794aa4.jpg', '', '34ace6b0bfc5d63cf4e2f7ede9956d38', 'd2b927f54dd1a1ddc7a691deb5d6babbebf98384', '1', '1504255239');
INSERT INTO `v_picture` VALUES ('589', '/Uploads/Picture/2017-09-01/59a91d07baaa1.jpg', '', '097c20920236e9adecafca6f4dc072b5', '41e33e2f2e45ef4e6434aefb1639102f454c0407', '1', '1504255239');
INSERT INTO `v_picture` VALUES ('590', '/Uploads/Picture/2017-09-01/59a91d096d2a8.jpg', '', '2e0ab9f33b95332530c7e47bd1364dfa', '8b675966b820bbcd29c4764174225c9e94329cf2', '1', '1504255241');
INSERT INTO `v_picture` VALUES ('591', '/Uploads/Picture/2017-09-01/59a91d0b60231.jpg', '', '9f44cd2c9e87dbd0b5739d42600285f7', '1014187b9921c8b1e11cb1873343856ab9ddeb0b', '1', '1504255243');
INSERT INTO `v_picture` VALUES ('592', '/Uploads/Picture/2017-09-01/59a91d0d70def.jpg', '', 'c4e45ae9481b8e6d9a4292a20d94f30f', '970e47e84da0f9048e78935b4a96881751cbd794', '1', '1504255245');
INSERT INTO `v_picture` VALUES ('593', '/Uploads/Picture/2017-09-01/59a91d0f6ee47.jpg', '', '6621afda213c03beaf73bd9b1dc940ad', '795cafd9cfce763f18352502cfae4da478a0d9e0', '1', '1504255247');
INSERT INTO `v_picture` VALUES ('594', '/Uploads/Picture/2017-09-01/59a91d116d138.jpg', '', '5e0f4f0d70b9461a1e5c16b0de921323', 'f561107666deb6e91ccbf42209fd564588ee57af', '1', '1504255249');
INSERT INTO `v_picture` VALUES ('595', '/Uploads/Picture/2017-09-01/59a91d1371803.jpg', '', '681e7a9f683ed1f213bfbc6b775e2506', 'd0161894a13fa668c2e97dab66851463f2016894', '1', '1504255251');
INSERT INTO `v_picture` VALUES ('596', '/Uploads/Picture/2017-09-01/59a91d15839dc.jpg', '', 'fda089a46af66e725c08e3415ade2123', '83690efcdd969ae6028156695968bd291eff2685', '1', '1504255253');
INSERT INTO `v_picture` VALUES ('597', '/Uploads/Picture/2017-09-01/59a91d1776efe.jpg', '', '2803594de6fee6ef2269cb951bec76b7', '57b8aeb68f756e888ce2bd63a64de6b36885c663', '1', '1504255255');
INSERT INTO `v_picture` VALUES ('598', '/Uploads/Picture/2017-09-01/59a91d196443f.jpg', '', '4e7ac778505a2846f5fa43f4c35cd4ff', 'f535e7e598dc4511d413c148ea168bc3a9a5ad90', '1', '1504255257');
INSERT INTO `v_picture` VALUES ('599', '/Uploads/Picture/2017-09-01/59a91d1b71ee4.jpg', '', '12ef0dc1d412d1b0676d75d5baf24086', 'a3616391f1dbbf12cca822f0813964d6c212ecfb', '1', '1504255259');
INSERT INTO `v_picture` VALUES ('600', '/Uploads/Picture/2017-09-01/59a91d1d7b344.jpg', '', 'ac27c821bcde1a3aa58d28ff5bb85bab', '9a14d2cbf4d7cd21cdde384462a8ed6ffe6635ed', '1', '1504255261');
INSERT INTO `v_picture` VALUES ('601', '/Uploads/Picture/2017-09-01/59a91d1f81339.jpg', '', 'bad4a0e119831bbfc9d9c97cc432d89c', 'd3a0aba957b09e725f2ac751bc7ad8994b26e5db', '1', '1504255263');
INSERT INTO `v_picture` VALUES ('602', '/Uploads/Picture/2017-09-01/59a91d5e8ede6.JPG', '', '12c51ee0415631587e11df0de5940a7a', '6bf76a5fbc8091a3311071f43dedcba0c820c0aa', '1', '1504255326');
INSERT INTO `v_picture` VALUES ('603', '/Uploads/Picture/2017-09-01/59a91d5ed8770.jpg', '', '35b53050772658ebe4d0135583a75851', '9cd4b18f79a94ef6404ebf0240fc5fd626791885', '1', '1504255326');
INSERT INTO `v_picture` VALUES ('604', '/Uploads/Picture/2017-09-01/59a91d5f16f16.jpg', '', 'c8d0d4b96807378d4143e35fe86519fe', '7d67e4b55a2d26e2166103458b781d529d4747b4', '1', '1504255327');
INSERT INTO `v_picture` VALUES ('605', '/Uploads/Picture/2017-09-01/59a91d5f3b8b1.jpg', '', 'fa560911b90a3a51a9244be6b67e383d', '61229b756a2b3ecfa28ef217df0c11a2850a1c86', '1', '1504255327');
INSERT INTO `v_picture` VALUES ('606', '/Uploads/Picture/2017-09-01/59a91d5f6cdee.jpg', '', '848d47b29a468d90666d04b21a79b8f8', '97ba9c6d7fcba3e1b6a99d584f8e59ebfb4238b5', '1', '1504255327');
INSERT INTO `v_picture` VALUES ('607', '/Uploads/Picture/2017-09-01/59a91d5f95c6f.jpg', '', 'b16cb7e9419bc1109d9f25a57576541b', '11d056db932c34e1add737f869c497e1c6043e42', '1', '1504255327');
INSERT INTO `v_picture` VALUES ('608', '/Uploads/Picture/2017-09-01/59a91d5fc48dc.jpg', '', 'c616d8fc2cb4b1991e90d2bdd39018c4', '796a616879041773379d32216d54611daadab87e', '1', '1504255327');
INSERT INTO `v_picture` VALUES ('609', '/Uploads/Picture/2017-09-01/59a91d5ff1a2c.jpg', '', '855f31cee507c10f46947a21f690bc53', 'e626d6ac761d099b87682f6be317cbb388022564', '1', '1504255327');
INSERT INTO `v_picture` VALUES ('610', '/Uploads/Picture/2017-09-01/59a91d602e149.jpg', '', '3d6dae23cc4d277f8858fdb84589594b', '0eaae8994c4d089c2c48a1bb3427be42d05ac85a', '1', '1504255328');
INSERT INTO `v_picture` VALUES ('611', '/Uploads/Picture/2017-09-01/59a91d6060a1e.jpg', '', '21d11262e70da931e7fd2a4e2f62970f', '5a7a18b6eb97d0646b185d8129f412ee26932afd', '1', '1504255328');
INSERT INTO `v_picture` VALUES ('612', '/Uploads/Picture/2017-09-01/59a91d60ce88d.jpg', '', 'e10dee51d0eba574aef071828a2a002d', '3a377f5e9090af1eb1d419525b60ef1d89949c51', '1', '1504255328');
INSERT INTO `v_picture` VALUES ('613', '/Uploads/Picture/2017-09-01/59a91d6112510.jpg', '', '48f5d2383890730168c6814c3d6a3723', '1c7a960a096fa700545188ccc1275edb2e6f698c', '1', '1504255329');
INSERT INTO `v_picture` VALUES ('614', '/Uploads/Picture/2017-09-01/59a91d614ae80.jpg', '', '1eb0e0f483d1e1f6520ebf82a479e387', 'b5657d60348b7a139d9ad287e23787d63ca2ebc3', '1', '1504255329');
INSERT INTO `v_picture` VALUES ('615', '/Uploads/Picture/2017-09-01/59a91d6179fe9.jpg', '', '410913f29a5b8f76441807eb4a08d3da', 'd60de5e5460407e18e5eeed5295ae6d5bf646e86', '1', '1504255329');
INSERT INTO `v_picture` VALUES ('616', '/Uploads/Picture/2017-09-01/59a91d61b3cee.jpg', '', 'b3d46648a1fe12ef18552d082e959530', '77d143243679798779556820d51d643a4c3cfce3', '1', '1504255329');
INSERT INTO `v_picture` VALUES ('617', '/Uploads/Picture/2017-09-01/59a91d61e6a73.jpg', '', '2296972869d32fd94276527cb8ff85db', '1bde8a02508fb17607b5d2c14cd63bde1ceb3ebd', '1', '1504255329');
INSERT INTO `v_picture` VALUES ('618', '/Uploads/Picture/2017-09-01/59a91d6244fe4.jpg', '', '08a362eddbab8ba9a03f9c6bc3ec13e2', '2fffc4b378e8b86e69b9cda34e3b50e57ec5df38', '1', '1504255330');
INSERT INTO `v_picture` VALUES ('619', '/Uploads/Picture/2017-09-01/59a91d6275593.jpg', '', '03ed2f3a0e681faa8fb255b6b645b1db', 'dbd562204cfe1f6936b8e73a166bce9630d32feb', '1', '1504255330');
INSERT INTO `v_picture` VALUES ('620', '/Uploads/Picture/2017-09-01/59a91d62ac98a.jpg', '', '0cdeacd37c1be9ce487a691623cda44c', '68eb691f1065e06b24cc68a2280af841345e2fa4', '1', '1504255330');
INSERT INTO `v_picture` VALUES ('621', '/Uploads/Picture/2017-09-01/59a91d62d8856.jpg', '', '975995b411ca4d84c7dc748f4876070e', '1158d0e9232c1717765b49378c63d59d28758fbe', '1', '1504255330');
INSERT INTO `v_picture` VALUES ('622', '/Uploads/Picture/2017-09-01/59a91d6328a52.jpg', '', '4757b7b1cdf37945860ce423c347080d', '0c07f2446a972a1c9c1055bc6d3280cf093a8d66', '1', '1504255331');
INSERT INTO `v_picture` VALUES ('623', '/Uploads/Picture/2017-09-01/59a91d635ddc7.jpg', '', '0ed62e2d0483ef6aa7cdcf7b9509c4e1', '7c743247c16e4fc33d00a536464198aae3df4bb0', '1', '1504255331');
INSERT INTO `v_picture` VALUES ('624', '/Uploads/Picture/2017-09-01/59a91d6391c6d.jpg', '', '25d2d6349dcf30bd4a679927610c5ac4', '97ea7b50e69c951f775371ded9ec35b448817c6a', '1', '1504255331');
INSERT INTO `v_picture` VALUES ('625', '/Uploads/Picture/2017-09-01/59a91d63ce455.jpg', '', 'edd07b12760a981ab4c6002541e0b899', '7d894fa9581d56cf210f8ff9e0c1f428ff6a0fb5', '1', '1504255331');
INSERT INTO `v_picture` VALUES ('626', '/Uploads/Picture/2017-09-01/59a9214aee565.jpg', '', '9a00c7a42b04f7cf615ca7dbe50c0041', 'db2ed4a1f9d1f38ca511420a431074db927346a8', '1', '1504256330');
INSERT INTO `v_picture` VALUES ('627', '/Uploads/Picture/2017-09-01/59a9271e08304.jpg', '', 'af950af38039eca9df71996d1bcef1dd', '3ed74e7edd61904504d4f92bff9e3269bbe246da', '1', '1504257822');
INSERT INTO `v_picture` VALUES ('628', '/Uploads/Picture/2017-09-01/59a92788ae04d.jpg', '', '7ee270f85e24565828c7684b58890333', 'b80f61e16ded9c43b24dc493ac50b85aa2ed6e2e', '1', '1504257928');
INSERT INTO `v_picture` VALUES ('629', '/Uploads/Picture/2017-09-01/59a927d6c1028.jpg', '', '1a349e0806e519d9dc70d515a7ba9106', '72c89db39ca3efdd059726ef6d03db52958010b7', '1', '1504258006');
INSERT INTO `v_picture` VALUES ('630', '/Uploads/Picture/2017-09-01/59a928998f1a8.jpg', '', 'd1075aeb7d480c3d187a5621d1e354fb', '2bea896e79a19822d7aa905204f4380e2022f8ad', '1', '1504258201');
INSERT INTO `v_picture` VALUES ('631', '/Uploads/Picture/2017-09-01/59a92899ccd6e.jpg', '', '121b7577ca186aee532dca310feb586c', '8958a315c457df3af794a6c4cd93e6fbefae2a67', '1', '1504258201');
INSERT INTO `v_picture` VALUES ('632', '/Uploads/Picture/2017-09-01/59a9289a1a2b0.jpg', '', 'd51b3c0256f860000b8d7f3619cd313f', 'c1003d51572ef4cd9e8ed36ae6794570367b1294', '1', '1504258202');
INSERT INTO `v_picture` VALUES ('633', '/Uploads/Picture/2017-09-01/59a928a26823c.jpg', '', 'd022bec7d9670b552b9329bd547ea579', '967a19d9e057a0273f96fe10d342599160541776', '1', '1504258210');
INSERT INTO `v_picture` VALUES ('634', '/Uploads/Picture/2017-09-01/59a928a2adcbb.jpg', '', '0104af102012d96c1da0f48cdc7df42a', 'c03171569a72d02c5c046c2465290465ddb7adb6', '1', '1504258210');
INSERT INTO `v_picture` VALUES ('635', '/Uploads/Picture/2017-09-01/59a928a30a380.jpg', '', '29a0c0411f263424847de6281c6a4d9a', '1cb8cb7183fe6ab68e5d98a5774b99ce5784a72e', '1', '1504258211');
INSERT INTO `v_picture` VALUES ('636', '/Uploads/Picture/2017-09-01/59a928a360009.jpg', '', '16f16eeec99a628f620b9d0043a75386', 'ece925c556ce48e6c7431c20af63e98602f3be41', '1', '1504258211');
INSERT INTO `v_picture` VALUES ('637', '/Uploads/Picture/2017-09-01/59a928a3a9e81.jpg', '', 'c4d7f96fd5987e1a8af85273827b6295', 'cd73f51a98d489b831aa70c0868e8cd7597b1b9a', '1', '1504258211');
INSERT INTO `v_picture` VALUES ('638', '/Uploads/Picture/2017-09-01/59a928e8720e4.jpg', '', '64e0f2a47b5f8df263219de28932f8d3', '5b249c753123736ecc791284f1777841a33ffe24', '1', '1504258280');
INSERT INTO `v_picture` VALUES ('639', '/Uploads/Picture/2017-09-01/59a92b6e31ef1.jpg', '', 'c92177183151e7d38aa0394eb6ef4f3d', '6769e4cced90dd38bbdb6f371a627032176cf591', '1', '1504258926');
INSERT INTO `v_picture` VALUES ('640', '/Uploads/Picture/2017-09-01/59a92b6e5cd68.jpg', '', '8c07ba9392e9644d50ea4ebec01cba1c', '054f95dcddfb92e9f37295547845e3b87c68b1e6', '1', '1504258926');
INSERT INTO `v_picture` VALUES ('641', '/Uploads/Picture/2017-09-01/59a92b6e85266.jpg', '', 'b527779ea603167d2fdf4ac58e63feb2', 'd0f3774a0a16e788fdd47794445542bbde207225', '1', '1504258926');
INSERT INTO `v_picture` VALUES ('642', '/Uploads/Picture/2017-09-01/59a92b6eae494.jpg', '', '38a73a38019e2a6278799ed420cb55b0', 'bc826e3677c8977a0e7e5ce45e1124388ac046eb', '1', '1504258926');
INSERT INTO `v_picture` VALUES ('643', '/Uploads/Picture/2017-09-01/59a92b6ed3380.jpg', '', 'd70a31994245009c1eff4f859804b174', '176a14e9306678ad703bc17164aff193459a0f59', '1', '1504258926');
INSERT INTO `v_picture` VALUES ('644', '/Uploads/Picture/2017-09-01/59a92b6f0d2b1.jpg', '', '3f1192390ef8e8a6f789e779922a7d6a', '617b2535cb0c81554f67bf1ce16b7bf990c7eabc', '1', '1504258927');
INSERT INTO `v_picture` VALUES ('645', '/Uploads/Picture/2017-09-01/59a92b6f50010.jpg', '', 'f0f3cf7ad900c6a7b98c598550c2af54', 'c85424ec0a7e617d764caf84addbe959f3570b96', '1', '1504258927');
INSERT INTO `v_picture` VALUES ('646', '/Uploads/Picture/2017-09-01/59a92b6f7cd32.jpg', '', '7209af4f93682b359949cb61c00d381c', 'c058da1a63dff765a63c7e3f0efb1ea70cbe0743', '1', '1504258927');
INSERT INTO `v_picture` VALUES ('647', '/Uploads/Picture/2017-09-01/59a92b6faae09.jpg', '', '29c0e3d94a1a1652e67ca2622645c187', 'ccd13694b8e12217ea8cd3d0fe61f90a089522cb', '1', '1504258927');
INSERT INTO `v_picture` VALUES ('648', '/Uploads/Picture/2017-09-01/59a92b6fd5564.jpg', '', 'e20e3879d08972322eb30f216d943448', '38d13759de51d0467ed917a3b73dba40cdf03d7c', '1', '1504258927');
INSERT INTO `v_picture` VALUES ('649', '/Uploads/Picture/2017-09-01/59a92fd2f24c3.jpg', '', '43cbd1ac49eb22adffca9e4725781609', '2e1929cdb18dfbe6f47b64da876ee36fe2a14613', '1', '1504260050');
INSERT INTO `v_picture` VALUES ('650', '/Uploads/Picture/2017-09-01/59a92fd34718c.jpg', '', '750c03463873ed41b8882e5d30a68e3f', '6eaa28690b3da5445cb5f7331a78b74593c56692', '1', '1504260051');
INSERT INTO `v_picture` VALUES ('651', '/Uploads/Picture/2017-09-01/59a92fd372be8.jpg', '', '137062f3bb5fa554ff634e4826fb2ede', 'cf391793f9a13af09d71a760096f130893655627', '1', '1504260051');
INSERT INTO `v_picture` VALUES ('652', '/Uploads/Picture/2017-09-01/59a92fd3a0669.jpg', '', 'eed7c18f32cd64cd7dcb8f5fa03179f9', '01185de40636c3813a4e879985cc34b4c9147ee4', '1', '1504260051');
INSERT INTO `v_picture` VALUES ('653', '/Uploads/Picture/2017-09-01/59a92fd3d0659.jpg', '', '65d03c730c447c562a98f17ab697316f', '75738eebca9b04bfd93ae53283621f05df0fd72f', '1', '1504260051');
INSERT INTO `v_picture` VALUES ('654', '/Uploads/Picture/2017-09-01/59a92fd40ec93.jpg', '', 'c8f55e447ba878d63cbf9588324d56c8', 'e863327954ffdc617daf1466921b977a6f3845ad', '1', '1504260052');
INSERT INTO `v_picture` VALUES ('655', '/Uploads/Picture/2017-09-01/59a92fd43d7da.jpg', '', '25169583e2971c120c4e133b08928a68', 'c2dae8fd456c69084ff19698d2ace4b94cc70f17', '1', '1504260052');
INSERT INTO `v_picture` VALUES ('656', '/Uploads/Picture/2017-09-01/59a92fd47c554.jpg', '', 'd34b4d4c438dbb49a223b62b8b88fa8d', 'f6163cd994942ea4fcf83c903c9c659fd1c3dd24', '1', '1504260052');
INSERT INTO `v_picture` VALUES ('657', '/Uploads/Picture/2017-09-01/59a92fd4b5e44.jpg', '', '76bd49c483b78353821689075f5a9056', 'd66c5f6e2e2f71f9c0c48ab78be8075b8f820515', '1', '1504260052');
INSERT INTO `v_picture` VALUES ('658', '/Uploads/Picture/2017-09-01/59a9300570449.jpg', '', '126a405ed30bc03d754f28871930c2fe', 'a0f9ff3968f9199fe802d2769fb7639cea204de8', '1', '1504260101');
INSERT INTO `v_picture` VALUES ('659', '/Uploads/Picture/2017-09-01/59a93005bc453.jpg', '', 'c230d79208473c5f275cea374326a7c6', '20f2464f607a8e8ab7712b69dbfdfc404c2efd07', '1', '1504260101');
INSERT INTO `v_picture` VALUES ('660', '/Uploads/Picture/2017-09-01/59a93005f0af6.jpg', '', '8c1a39e57bec60e3e14a4d4f9aeded7c', '1b9d849eddc9f830f7c390dbb619430012a8c7a3', '1', '1504260101');
INSERT INTO `v_picture` VALUES ('661', '/Uploads/Picture/2017-09-01/59a930062e61d.jpg', '', 'a12fc1b7f23d668de78f48984a715358', '64c2b933b8b1e252aa4b65e74fb51e045ee61581', '1', '1504260102');
INSERT INTO `v_picture` VALUES ('662', '/Uploads/Picture/2017-09-01/59a930065e4cc.jpg', '', '1ae9686c8d354d95a8aad2a60c6663ec', 'a446a09d437111ff1743dcedc11fb6f85f06b0a1', '1', '1504260102');
INSERT INTO `v_picture` VALUES ('663', '/Uploads/Picture/2017-09-01/59a9300683eaa.jpg', '', 'fcf8238a93984cd9a712981413abc98f', 'd4a865ed3af809a897c6817e5748d8f15bcd0496', '1', '1504260102');
INSERT INTO `v_picture` VALUES ('664', '/Uploads/Picture/2017-09-01/59a93008df600.jpg', '', '7f2a95c6193f939fc8d56e87196bafed', 'f7e56a77845711d26f2df827dec1b1575f85389c', '1', '1504260104');
INSERT INTO `v_picture` VALUES ('665', '/Uploads/Picture/2017-09-01/59a9300adf72c.jpg', '', '93ec94b7e930b0edf25d91a1efd37f37', 'b43cbe58dad873337e55bf5373792b50c4c2e3b0', '1', '1504260106');
INSERT INTO `v_picture` VALUES ('666', '/Uploads/Picture/2017-09-01/59a9300cef928.jpg', '', '55f266711e3ac737fb05c918a7b91ef2', '842e5ef4235b9827ee3db2b9137be371eb3ef94b', '1', '1504260108');
INSERT INTO `v_picture` VALUES ('667', '/Uploads/Picture/2017-09-01/59a9302e24fff.jpg', '', '15c3b9bb881a43117c2f9f72e62f8971', 'a0ead0a5a1ff6a4b272784f43fed1b49ad640ad7', '1', '1504260142');
INSERT INTO `v_picture` VALUES ('668', '/Uploads/Picture/2017-09-01/59a9302e57008.jpg', '', '0abee2b9f01cf979d17fab0fb684d1f6', 'cd0034a2d1e5bda8285a37105a9af4f47c8f6401', '1', '1504260142');
INSERT INTO `v_picture` VALUES ('669', '/Uploads/Picture/2017-09-01/59a9302e86f04.jpg', '', 'fa955c3fe58d62ee4a8bb05c72af63f0', '815f02bc0dfc4d11221fd670af4559364f989df0', '1', '1504260142');
INSERT INTO `v_picture` VALUES ('670', '/Uploads/Picture/2017-09-01/59a9302ebb9d5.jpg', '', '59a8add1e5a9c123c0a22cb4d822e6b9', 'f57fe4efcf0043d57e47ed5bd6173df5abe6f62f', '1', '1504260142');
INSERT INTO `v_picture` VALUES ('671', '/Uploads/Picture/2017-09-01/59a9302eeecc1.jpg', '', 'ade3682bb704bf4b1f04aecee0403912', '71ab8d5a8768c6a70567b0748783b3817c6466c9', '1', '1504260142');
INSERT INTO `v_picture` VALUES ('672', '/Uploads/Picture/2017-09-01/59a9302f528ae.jpg', '', 'a84d943abda48e06c44799d5bdb71763', '766052b2e66e97c90c8cb3408d727b33d90fd0fa', '1', '1504260143');
INSERT INTO `v_picture` VALUES ('673', '/Uploads/Picture/2017-09-01/59a9302f8f365.jpg', '', '83403f465395024e4679afc1188b234b', '65b8a72a624f0e3b12b44acd4098e8330978f4a3', '1', '1504260143');
INSERT INTO `v_picture` VALUES ('674', '/Uploads/Picture/2017-09-01/59a9302fd0d5a.jpg', '', 'd6c0e59120dbeed98d9a78ff0031ab50', '1c4c89e988ccca6e6dbeb2a8c11f2752671370ce', '1', '1504260143');
INSERT INTO `v_picture` VALUES ('675', '/Uploads/Picture/2017-09-01/59a9303013e01.jpg', '', 'e3b554835c17be0050867d0f57a2e646', '880f600ccf5539adbb28910d997a6ac6ed8d7f9c', '1', '1504260144');
INSERT INTO `v_picture` VALUES ('676', '/Uploads/Picture/2017-09-01/59a931878b136.JPG', '', '19f1c044acbe9f22d63f6aebdba07a41', 'bf71f76053d6c577f0f152eb02a32a425795f1aa', '1', '1504260487');
INSERT INTO `v_picture` VALUES ('677', '/Uploads/Picture/2017-09-01/59a93187d62f3.JPG', '', '0566f70b502bac578c2093af9e261580', 'aa1a4299cd630c5c5cfb7062492f1b7eabfed11f', '1', '1504260487');
INSERT INTO `v_picture` VALUES ('678', '/Uploads/Picture/2017-09-01/59a931884deeb.JPG', '', 'c6f8855e9d6336d996d013ba58810562', 'd5b8e216c21f36b6ebce1589dc635c6ba3c17cb2', '1', '1504260488');
INSERT INTO `v_picture` VALUES ('679', '/Uploads/Picture/2017-09-01/59a9319530165.JPG', '', 'd8a3341557f70f6f5fb2795ed9cfcf69', '18225183afb10ca799647860fe28688f2cf521ec', '1', '1504260501');
INSERT INTO `v_picture` VALUES ('680', '/Uploads/Picture/2017-09-01/59a931955a69f.jpg', '', '7255e402cf57cf444bb426bdd24fb93c', '17fecf58b4c8d28c7c6592775153f91ff7a7416f', '1', '1504260501');
INSERT INTO `v_picture` VALUES ('681', '/Uploads/Picture/2017-09-01/59a9319584f44.jpg', '', '5fa8903b99b99c3e160d25309aeb8778', '5fce897c5f3f41dbe43d56efc0a355cc413de2f6', '1', '1504260501');
INSERT INTO `v_picture` VALUES ('682', '/Uploads/Picture/2017-09-01/59a93195b358d.jpg', '', 'f405e4ca0d204ae189f95fb0c4b29d5c', 'c1aae834db6092908368e3b1942acca3f55679a3', '1', '1504260501');
INSERT INTO `v_picture` VALUES ('683', '/Uploads/Picture/2017-09-01/59a93195d9f7c.jpg', '', '9bb4714bda75b84b53e220361d8a83e6', '1bd9adea3e743524226ee11328f15f5567b53fdc', '1', '1504260501');
INSERT INTO `v_picture` VALUES ('684', '/Uploads/Picture/2017-09-01/59a93195e379c.JPG', '', '3aaa061d89de243ce2abd2d2ff36ed84', '31dbda3be6d5d5502a139b9f916dff5a2df1c13e', '1', '1504260501');
INSERT INTO `v_picture` VALUES ('685', '/Uploads/Picture/2017-09-01/59a9319643ffd.jpg', '', '076300c2bf81db882143c3790c19d798', '5d5e65d33c4d21cbbbb2e216d3a907c368513eef', '1', '1504260502');
INSERT INTO `v_picture` VALUES ('686', '/Uploads/Picture/2017-09-01/59a931969be67.jpg', '', 'aa4a5374d5f89e852f582fc80342ba41', 'c6958791430e960ff3deea337b0623c7328f58ff', '1', '1504260502');
INSERT INTO `v_picture` VALUES ('687', '/Uploads/Picture/2017-09-01/59a9319e7bda0.JPG', '', '67723b11c8c451421bd8c5fee2009697', '31025846e22e1e164ffa0afef51a11f0e781f569', '1', '1504260510');
INSERT INTO `v_picture` VALUES ('688', '/Uploads/Picture/2017-09-01/59a9319e8a854.JPG', '', 'f926b913cc657bead9c3ccb899babd49', '40c2c8858a2525881a105c998eb3d873fba7f1da', '1', '1504260510');
INSERT INTO `v_picture` VALUES ('689', '/Uploads/Picture/2017-09-01/59a9319ea6df7.jpg', '', '61315bcd77491664ccf192ef96ee972b', 'e2e92a57ce2b89b48e7b67001aa573974a08ddc0', '1', '1504260510');
INSERT INTO `v_picture` VALUES ('690', '/Uploads/Picture/2017-09-01/59a9319ec4113.JPG', '', '2dc290be547c778994947b67ec85d174', '163401e1cc56858158336b8b15c6f298f80ffb17', '1', '1504260510');
INSERT INTO `v_picture` VALUES ('691', '/Uploads/Picture/2017-09-01/59a9319f275d3.JPG', '', '86d88bb6585bf53a343e3c4973cff9df', '9aa0d82ae7a1014a18a783629800353c2b1d1ae2', '1', '1504260511');
INSERT INTO `v_picture` VALUES ('692', '/Uploads/Picture/2017-09-01/59a9319f725f2.jpg', '', '9268f4e349f04e222bcf3704ed7e6c28', '214ceb2541dd628fac789b3ceaf75531e8101738', '1', '1504260511');
INSERT INTO `v_picture` VALUES ('693', '/Uploads/Picture/2017-09-01/59a93310adadd.jpg', '', 'b6f4ac0ad36d1301815a820a4dfa9fdd', '98583733941f38ea0b6d6186bc9d56361aee7673', '1', '1504260880');
INSERT INTO `v_picture` VALUES ('694', '/Uploads/Picture/2017-09-01/59a9367dd5716.JPG', '', 'a0328666573d050f99feb660f7287f8f', '449e51886720f41bc75040c5a708b4674fe000c1', '1', '1504261757');
INSERT INTO `v_picture` VALUES ('695', '/Uploads/Picture/2017-09-01/59a9367e1ca2b.JPG', '', '964585d75bcaab97f75fb83ea1ad085f', 'cb703f1672c82d9a7c073e0cf5d0f9ce0a98b0e5', '1', '1504261758');
INSERT INTO `v_picture` VALUES ('696', '/Uploads/Picture/2017-09-01/59a9367e4ce7b.JPG', '', 'b458e3cf0b10e10e25d78ea4aeca4934', '5fdb5c9bbbd9bc25a5cbe4b368b4da2b6d93cd21', '1', '1504261758');
INSERT INTO `v_picture` VALUES ('697', '/Uploads/Picture/2017-09-02/59aa01a0f3674.jpg', '', '4ce0beef6333ca786a4776057f0dee70', '00d5b35982d32eb3e4050424f4d38d7810042894', '1', '1504313760');
INSERT INTO `v_picture` VALUES ('698', '/Uploads/Picture/2017-09-02/59aa01a159ac0.jpg', '', '6158bd3c8e3a8b2661bc07b771060cc9', '15ad37174add11cc4cd6b5e0c948ddac3a9d8e7d', '1', '1504313761');
INSERT INTO `v_picture` VALUES ('699', '/Uploads/Picture/2017-09-02/59aa01a184131.jpg', '', '65a170a770ac78165d5fad8e3bfeed20', 'e827fe991a849364fcfc3e30a5136c8190558b79', '1', '1504313761');
INSERT INTO `v_picture` VALUES ('700', '/Uploads/Picture/2017-09-02/59aa01a1af94f.jpg', '', '9aacb7011cb552bcb4c89d4e9b78a7bd', '9bc882d8a55a2c4c4513c6aa6fe6cb38d270568f', '1', '1504313761');
INSERT INTO `v_picture` VALUES ('701', '/Uploads/Picture/2017-09-02/59aa01a1e078c.jpg', '', '7c8679ab16dd54ecb162960b4cf5ba6b', '945a871e3724459ed0a4f9aeda55f133e002845c', '1', '1504313761');
INSERT INTO `v_picture` VALUES ('702', '/Uploads/Picture/2017-09-02/59aa01a2294b1.jpg', '', 'd927b83a89d9068f573bee5a4f988647', '338e3d51577d40b799c0630c0c70676ccc8ef1ed', '1', '1504313762');
INSERT INTO `v_picture` VALUES ('703', '/Uploads/Picture/2017-09-02/59aa01a258b85.jpg', '', '93d1d649e5ad476e624dfdc5a3165a4b', 'e59c05e70e4a37459370b8237ad61ee693b8c11b', '1', '1504313762');
INSERT INTO `v_picture` VALUES ('704', '/Uploads/Picture/2017-09-02/59aa01a2a22fb.jpg', '', '5612fbd864e58d48d337854f5b88768a', 'dafa2233b60fae05f512fe156486372952df54a9', '1', '1504313762');
INSERT INTO `v_picture` VALUES ('705', '/Uploads/Picture/2017-09-02/59aa01a72160d.jpg', '', '092c3c7ca1a5bc3738d1e392d0d3d839', '21755a479ff2e0a4918a83676a2c92d2854670b9', '1', '1504313767');
INSERT INTO `v_picture` VALUES ('706', '/Uploads/Picture/2017-09-02/59aa01a754f9b.jpg', '', 'd2b177cc359182162209da24fc698505', '3c56a263b4714a00cd25c2a3dabf57a368a2da92', '1', '1504313767');
INSERT INTO `v_picture` VALUES ('707', '/Uploads/Picture/2017-09-02/59aa01a7820cc.jpg', '', '221962d696a72101079fc23e7c3693de', '84826d1469726d1ef756e22a9de0a2381e7223e1', '1', '1504313767');
INSERT INTO `v_picture` VALUES ('708', '/Uploads/Picture/2017-09-02/59aa01a7aa20f.jpg', '', '8069de8b2dc478f9c181b976c2600ce2', '56024a369892ea4c4597f5f413e053d8fa9e33b1', '1', '1504313767');
INSERT INTO `v_picture` VALUES ('709', '/Uploads/Picture/2017-09-02/59aa01a7dc917.jpg', '', 'bd2fd73a2b6826d3b91bbbc80f5c14c5', '45b1cfe586d53634e229ce925b12ef8f68f3c37f', '1', '1504313767');
INSERT INTO `v_picture` VALUES ('710', '/Uploads/Picture/2017-09-02/59aa01aeda9f9.jpg', '', '5e0ffe0aeeb66e70afa0956025058f85', 'b8d0f074ada321e62515dd9e7e321d68a129d497', '1', '1504313774');
INSERT INTO `v_picture` VALUES ('711', '/Uploads/Picture/2017-09-02/59aa01af10997.jpg', '', '89ee4da49ad1115d7406553ebd7b0104', '01b742003ee97bf69a62e0ca7f2f52bd2375ffcb', '1', '1504313775');
INSERT INTO `v_picture` VALUES ('712', '/Uploads/Picture/2017-09-02/59aa01af47800.jpg', '', '6aa5b5a7d8063a8418ac8f58f5b326a6', '097e64d6d9f42cf6808c2457dfc4270eccf4a1de', '1', '1504313775');
INSERT INTO `v_picture` VALUES ('713', '/Uploads/Picture/2017-09-02/59aa01af73ab6.jpg', '', 'fbe30a422b22fa79deb20783264fcfd4', '0d486a6f8ec7f727ba3cf3453f22b1653c7d4f9e', '1', '1504313775');
INSERT INTO `v_picture` VALUES ('714', '/Uploads/Picture/2017-09-02/59aa01af979ce.jpg', '', '8ce5eefcb4d73e11fc6143f50bb8038b', '4419532298bfbbed963c9164984e8e0e0205101b', '1', '1504313775');
INSERT INTO `v_picture` VALUES ('715', '/Uploads/Picture/2017-09-02/59aa01afc2364.jpg', '', '16f913da093a1d0d0a239f20b011d8f7', 'f1900d710dc14cf85d1f7683edd5ae675f261375', '1', '1504313775');
INSERT INTO `v_picture` VALUES ('716', '/Uploads/Picture/2017-09-02/59aa01afed263.jpg', '', 'e3de2deea6f608dd9f8b8a31db858413', 'b2a44a2272d2d347100cc44674ee2200159affa6', '1', '1504313775');
INSERT INTO `v_picture` VALUES ('717', '/Uploads/Picture/2017-09-02/59aa01b021fe8.jpg', '', '8beba0f9fc402dfefad90060e2ef5683', '4e09e170bf4cec300c985b0466c23a68634ade96', '1', '1504313776');
INSERT INTO `v_picture` VALUES ('718', '/Uploads/Picture/2017-09-02/59aa01b050122.jpg', '', 'b683aa7df82309b7ed6af355e146cc5c', '3d27851cc7bb98cd3823d3ca64a29c009d9f78af', '1', '1504313776');
INSERT INTO `v_picture` VALUES ('719', '/Uploads/Picture/2017-09-02/59aa01b0842c4.jpg', '', '9e2110136885c30fae43c33e22e044e0', 'e719d2fec59c8cf0a2786d92d1b3805dc3973330', '1', '1504313776');
INSERT INTO `v_picture` VALUES ('720', '/Uploads/Picture/2017-09-02/59aa03775d076.jpg', '', '61a805f77aa92aaea3a0e91384d48781', '907cbaa7ccf228a599ec016818241956c3696caf', '1', '1504314231');
INSERT INTO `v_picture` VALUES ('721', '/Uploads/Picture/2017-09-02/59aa0377a9cf5.jpg', '', '9067c5436998868db42834422c62d16c', 'a7c1c5f8636ef8224d6b7d47fde6b886869ceaac', '1', '1504314231');
INSERT INTO `v_picture` VALUES ('722', '/Uploads/Picture/2017-09-02/59aa0377da0e1.jpg', '', 'b5dc707016778b27a9ca0a8d1d97382c', 'd3918090915ae80f16e83a919aafc5e74ce76120', '1', '1504314231');
INSERT INTO `v_picture` VALUES ('723', '/Uploads/Picture/2017-09-02/59aa0378185bd.jpg', '', '2127b24c6b84292870f1d128f740fee5', '67d8080c19bd2c7e13ee0438158a343ff1d7b84e', '1', '1504314232');
INSERT INTO `v_picture` VALUES ('724', '/Uploads/Picture/2017-09-02/59aa037847d2e.jpg', '', 'ebf4a8fc796e0182e47421b366716363', 'b9b2e232ac694eb1a5a44f8a8128e1aef8ce86fb', '1', '1504314232');
INSERT INTO `v_picture` VALUES ('725', '/Uploads/Picture/2017-09-02/59aa037882419.jpg', '', 'dc650b053ec483a7023556a09c7ce647', '7db5c2ff823533d62cca7158b5fe54c19841643a', '1', '1504314232');
INSERT INTO `v_picture` VALUES ('726', '/Uploads/Picture/2017-09-02/59aa0378b74e1.jpg', '', '85259da8a265109d79625df2b3ceefed', '2807e84829b1271926ce30a65705b9f401c73e06', '1', '1504314232');
INSERT INTO `v_picture` VALUES ('727', '/Uploads/Picture/2017-09-02/59aa0378ec4b7.png', '', '6df97dfcac03427aa11deb7276d8df81', 'd42e790790e7ecbc875b1da3b3ad3cc972a874c8', '1', '1504314232');
INSERT INTO `v_picture` VALUES ('728', '/Uploads/Picture/2017-09-02/59aa037930cc8.png', '', 'fd4d71ef56b33b7376233f7c26ee0e9a', 'a27d987bfbb6db2a56550586901234b99e93e02f', '1', '1504314233');
INSERT INTO `v_picture` VALUES ('729', '/Uploads/Picture/2017-09-02/59aa037962f74.png', '', '2353b6a6a8d9c4e1b74380be2f2e6e8f', 'afea3c340ec2d67e433000f11f38d302b7a458a6', '1', '1504314233');
INSERT INTO `v_picture` VALUES ('730', '/Uploads/Picture/2017-09-02/59aa0381027db.png', '', 'd1933483d968efadc51365603d537e2c', 'd213436cee21058bf0db8749b57c54ff332aaaf9', '1', '1504314240');
INSERT INTO `v_picture` VALUES ('731', '/Uploads/Picture/2017-09-02/59aa03815c9e2.png', '', '71c114e803a6af668d2f0cb4327c3baa', '1284522814282d93bfc9fafe7d60aa21eb0796f8', '1', '1504314241');
INSERT INTO `v_picture` VALUES ('732', '/Uploads/Picture/2017-09-02/59aa0381a2ad7.jpg', '', 'eea2a3e03d95c750ddc0edd8e6f2db56', '8178ebcd559c0886626285ad9730057be9cfac1d', '1', '1504314241');
INSERT INTO `v_picture` VALUES ('733', '/Uploads/Picture/2017-09-02/59aa039a8f725.jpg', '', 'b4bad8cd46f99dd6cec7f15fb0c9e786', '4c7cbfe65ffb313368a50e62bfb2c6c67729becd', '1', '1504314266');
INSERT INTO `v_picture` VALUES ('734', '/Uploads/Picture/2017-09-02/59aa039ada6d0.jpg', '', '53763b53dc32e73ffc49f5c6cb0fcb76', '466ccd43820481e28e656d531d12416334ed783e', '1', '1504314266');
INSERT INTO `v_picture` VALUES ('735', '/Uploads/Picture/2017-09-02/59aa039b202a1.jpg', '', '7237275607a5760d9bf14c475918350f', 'e193495715044f8034a6f4af9b2488e65821cb0e', '1', '1504314267');
INSERT INTO `v_picture` VALUES ('736', '/Uploads/Picture/2017-09-02/59aa03a7cfc91.jpg', '', '3f626f7867df5cd6d2eebd83fb98d893', '184201c065c6963b3533db50269e8f3fe96ccf76', '1', '1504314279');
INSERT INTO `v_picture` VALUES ('737', '/Uploads/Picture/2017-09-02/59aa061f8e95f.JPG', '', '6a8ff0bdf6722da62db7578484ee7f6c', '00419095a8a2271000012abba0736c08cfa937bb', '1', '1504314911');
INSERT INTO `v_picture` VALUES ('738', '/Uploads/Picture/2017-09-02/59aa0625ef118.jpg', '', '5c8cd30a0f3d9271c051371ceb912023', '41b215f48092e926c778ac9445881e618248fcb7', '1', '1504314917');
INSERT INTO `v_picture` VALUES ('739', '/Uploads/Picture/2017-09-02/59aa0626489fe.jpg', '', '553f1532731a7fc8f0dabab17b47cea0', '22c572738d9016a36327a20bebd92db45d51ba35', '1', '1504314918');
INSERT INTO `v_picture` VALUES ('740', '/Uploads/Picture/2017-09-02/59aa062685876.jpg', '', '0bceeca872a1c78e98e11d6846c31a86', '84dda261f2a278e520edc2eeb959c6d9c062d9a8', '1', '1504314918');
INSERT INTO `v_picture` VALUES ('741', '/Uploads/Picture/2017-09-02/59aa0626a5842.jpg', '', '298a1355b63c97fae394084ccbf1191a', '5b90680906fd4ac3bf8c13b611f2823bed96a041', '1', '1504314918');
INSERT INTO `v_picture` VALUES ('742', '/Uploads/Picture/2017-09-02/59aa0626c03d2.jpg', '', '7157a397102f28262048bc4c32cdd3fc', '5a04b749cbba7c4256e075e97548b5d99d64b8d1', '1', '1504314918');
INSERT INTO `v_picture` VALUES ('743', '/Uploads/Picture/2017-09-02/59aa062701716.jpg', '', 'aea0deda133628652f03f5a43ec38313', '69f53fe499ffd7015ff171c85fbee1946106ae63', '1', '1504314918');
INSERT INTO `v_picture` VALUES ('744', '/Uploads/Picture/2017-09-02/59aa06272063d.jpg', '', '562a4fcadb89745576083269738a68fc', '57eafa7f0e3c8ec2fe78f7df50aeb3ad86cd4343', '1', '1504314919');
INSERT INTO `v_picture` VALUES ('745', '/Uploads/Picture/2017-09-02/59aa06273f0f7.jpg', '', '0ca3c9ccf3d2e11aac575651a7db6dba', '248de1b0d672e990864473e1845337c3d927dbb0', '1', '1504314919');
INSERT INTO `v_picture` VALUES ('746', '/Uploads/Picture/2017-09-02/59aa06277f205.jpg', '', 'a6a58b64c15ad4cfa900a62a54568295', '2ba0e60524913061e4a3c9cb26f44a1011d4f2bf', '1', '1504314919');
INSERT INTO `v_picture` VALUES ('747', '/Uploads/Picture/2017-09-02/59aa0627bad28.jpg', '', 'd039b22ddd554a258f330016d66c0b95', '9207ddfaa64f89a3528b070c311cee5afeecbe02', '1', '1504314919');
INSERT INTO `v_picture` VALUES ('748', '/Uploads/Picture/2017-09-02/59aa0627e7c19.jpg', '', 'fd5369c0404f4b4bed98496c352c1b50', 'e10af3828a5989d082f1bd55f793104d6c92f443', '1', '1504314919');
INSERT INTO `v_picture` VALUES ('749', '/Uploads/Picture/2017-09-02/59aa062829195.jpg', '', 'e04230d54250385215075f698fc6af58', '5334132b335a0e1acff72f3fe0941d97b4441251', '1', '1504314920');
INSERT INTO `v_picture` VALUES ('750', '/Uploads/Picture/2017-09-02/59aa06284ec59.jpg', '', 'a272b77167348bedafa6f2c9d7d5a0f5', '36db4666b09ea3a0f688b1f7c5c21c4ce59f7493', '1', '1504314920');
INSERT INTO `v_picture` VALUES ('751', '/Uploads/Picture/2017-09-02/59aa062881050.jpg', '', '1aba99bfb1cbd653ee14523ac6a40aa9', '18f6853958bffe337e8d1a8cf4a59fa5e2d0d72b', '1', '1504314920');
INSERT INTO `v_picture` VALUES ('752', '/Uploads/Picture/2017-09-02/59aa0676dc7f4.jpg', '', '14246087e529e264d2bb19a6d70bc503', '31965f4627ed1b9587726f7b856ccc3e9a662159', '1', '1504314998');
INSERT INTO `v_picture` VALUES ('753', '/Uploads/Picture/2017-09-02/59aa06790fd11.jpg', '', 'e0edd1c1592f384e760b06f5fb93d2ac', 'e86101c54b868d95ca266730585f553cb5124004', '1', '1504315001');
INSERT INTO `v_picture` VALUES ('754', '/Uploads/Picture/2017-09-02/59aa0679e1ea5.jpg', '', '09066ac9ad76d2ce34675562f706f0f3', '30f5f1d7d85d1bc27b5bb07be4698e4a57f0599d', '1', '1504315001');
INSERT INTO `v_picture` VALUES ('755', '/Uploads/Picture/2017-09-02/59aa089f1d8e4.jpg', '', '7f24d14e5dc70fe2bc278a9dd811b5dc', 'a87f4ec6ff10a085f0695679184a6f531019e472', '1', '1504315551');
INSERT INTO `v_picture` VALUES ('756', '/Uploads/Picture/2017-09-02/59aa089f87153.jpg', '', '3833542601214136109ceddd47058a59', 'd3523ebc1b6d059eafc4f3ebbdef32c9e8669626', '1', '1504315551');
INSERT INTO `v_picture` VALUES ('757', '/Uploads/Picture/2017-09-02/59aa089fdcf9b.jpg', '', 'a46cd616b92dfb90800b4522fb9b99f1', '32e74a1fc304524fccdec67380058101ae11602d', '1', '1504315551');
INSERT INTO `v_picture` VALUES ('758', '/Uploads/Picture/2017-09-02/59aa08a017e0e.jpg', '', '73b7a77b85f403c259d15776f07aca48', 'f6da47adc3dc12b03661e5777aa99b1b3d3fbd82', '1', '1504315552');
INSERT INTO `v_picture` VALUES ('759', '/Uploads/Picture/2017-09-02/59aa08a04349d.jpg', '', '53b0b515338a4c55884d0f1cdb96e9a1', '72bab43ff6ecd7a4e44294c4e9997991228f6549', '1', '1504315552');
INSERT INTO `v_picture` VALUES ('760', '/Uploads/Picture/2017-09-02/59aa08a070842.jpg', '', 'fdcaa45e496120467a17ebf127f644f6', '534995c882a893f4a4ee1a89fbd3f9102e7d330b', '1', '1504315552');
INSERT INTO `v_picture` VALUES ('761', '/Uploads/Picture/2017-09-02/59aa08a5165ee.png', '', '3ecb9a5402a3dba1cc9f8af37b48a0c7', '70e57ee1be7b1a586f1332d257e0df52272e4491', '1', '1504315557');
INSERT INTO `v_picture` VALUES ('762', '/Uploads/Picture/2017-09-02/59aa08a54e037.jpg', '', '83ba6576765c6e99bc63887de75cb8a2', '61a84fa68887a63cf76283b0591442566c10aef3', '1', '1504315557');
INSERT INTO `v_picture` VALUES ('763', '/Uploads/Picture/2017-09-02/59aa08a576947.jpg', '', '637c9ea28d0f16c698e35121f98bd9d6', '0173a7ffd1792d6f17b834d71fa49e81cf843e0c', '1', '1504315557');
INSERT INTO `v_picture` VALUES ('764', '/Uploads/Picture/2017-09-02/59aa08aa4024d.jpg', '', '038f9344813853d33b112367495aedaf', '4f468214a6cdb0c11a3634821528e7b7c7e686e6', '1', '1504315562');
INSERT INTO `v_picture` VALUES ('765', '/Uploads/Picture/2017-09-02/59aa08aaa3a5c.jpg', '', 'd4d3d55e16c309e4ab2dc59424c26993', '62e964fc9d7743abd729c9c93641abbf69dfdab9', '1', '1504315562');
INSERT INTO `v_picture` VALUES ('766', '/Uploads/Picture/2017-09-02/59aa08aad4ea3.jpg', '', '701e5da2fad3106367b2de09d2688d3f', '91dabc7ef5d554c173a313d065fef5c7f75b87bc', '1', '1504315562');
INSERT INTO `v_picture` VALUES ('767', '/Uploads/Picture/2017-09-02/59aa08ab9ef8e.jpg', '', 'eeacd00d8ff610485b8de3c59b2c5ab5', '66c684ff62d283de5ad0e6805ce00d7110d2ba2e', '1', '1504315563');
INSERT INTO `v_picture` VALUES ('768', '/Uploads/Picture/2017-09-02/59aa1063c3ef2.jpg', '', '0d4e0406600b73b556c032137e29be67', 'f2d43505fb0361094c7f8312d606094ad08ea6f8', '1', '1504317539');
INSERT INTO `v_picture` VALUES ('769', '/Uploads/Picture/2017-09-02/59aa1064978c2.jpg', '', 'ee6fd9285a630394603d7e637b399f9c', '2ff227132661d1a62d5dfa9a7b8ee4aa007e4653', '1', '1504317540');
INSERT INTO `v_picture` VALUES ('770', '/Uploads/Picture/2017-09-02/59aa1064d190b.jpg', '', 'cac1a5995513351b60d1ac5790ae2ef8', '59c4eebb74cffe6c4e65b753276455f1781ad803', '1', '1504317540');
INSERT INTO `v_picture` VALUES ('771', '/Uploads/Picture/2017-09-02/59aa1065036d3.jpg', '', '2318e8d6d34c3b46e00701e733ccf4f9', '66823102715ebec896a6e17aa1387b16d715d47e', '1', '1504317541');
INSERT INTO `v_picture` VALUES ('772', '/Uploads/Picture/2017-09-02/59aa106bbc381.jpg', '', 'ba83f9024dcfd239f614333697c59aa4', '8b14ff4dfc15379da38eb28a6e54684666ec5f5f', '1', '1504317547');
INSERT INTO `v_picture` VALUES ('773', '/Uploads/Picture/2017-09-02/59aa106c0f80c.jpg', '', '080d7e7238b96db1014b5dcea833ceaf', '109e04d4d6e54b7f2123ecd103f3d608f082a7b0', '1', '1504317548');
INSERT INTO `v_picture` VALUES ('774', '/Uploads/Picture/2017-09-02/59aa106c46fd6.jpg', '', '16a97be2f9f058fc732fea3b99cf8ed3', 'bf36c6f7c3cc630172745f8acd8aece43c53f523', '1', '1504317548');
INSERT INTO `v_picture` VALUES ('775', '/Uploads/Picture/2017-09-02/59aa106c7f81f.jpg', '', 'd2d77c2704cacb6afa698f383960effe', 'd59174319dd9f671918258373feb8f5f50bb70b2', '1', '1504317548');
INSERT INTO `v_picture` VALUES ('776', '/Uploads/Picture/2017-09-02/59aa106cb8f54.jpg', '', '53b1620f661e365547958e4f01cf34e4', 'b5d5a8d18cffb288d97875ac180e5bfb7bccae1f', '1', '1504317548');
INSERT INTO `v_picture` VALUES ('777', '/Uploads/Picture/2017-09-02/59aa106ce5329.jpg', '', '1d36bc4e58835959683f9a921e4632a6', 'dab676361caae602a941a73aa8611668179adda6', '1', '1504317548');
INSERT INTO `v_picture` VALUES ('778', '/Uploads/Picture/2017-09-02/59aa1074b5d8f.jpg', '', '2525cf548fb5a5bd776f830c88514105', '1bf3d24e4b241a4b21c8c3e2db8929d2196b8868', '1', '1504317556');
INSERT INTO `v_picture` VALUES ('779', '/Uploads/Picture/2017-09-02/59aa1075021ec.jpg', '', '7766988479a8e1964acf3e5007dcabc5', '88b201c3328da3e0ba895830fbd68180676b30b4', '1', '1504317556');
INSERT INTO `v_picture` VALUES ('780', '/Uploads/Picture/2017-09-02/59aa10753c4ac.JPG', '', '80a0e7fb8665eb4ef30980af866f061e', '34ac34968d4b25934a8fe470db6c7ea7621d70a7', '1', '1504317557');
INSERT INTO `v_picture` VALUES ('781', '/Uploads/Picture/2017-09-02/59aa10757405d.JPG', '', '2b5ab846a1997baf874aa215908b2e1d', '299732fc69da1d2db72e8cd06a83b597fdfc5da3', '1', '1504317557');
INSERT INTO `v_picture` VALUES ('782', '/Uploads/Picture/2017-09-02/59aa1075b80e0.jpg', '', '7344cbf846c2d84b18fc5cd62448302d', 'cdcda3890216291b743abdb5fa202df99c5dc576', '1', '1504317557');
INSERT INTO `v_picture` VALUES ('783', '/Uploads/Picture/2017-09-02/59aa1075ed922.jpg', '', '7edf187ffd68d55653de8ef9aa239509', '27a0ada89d8c9f79a92d014813620a2bfc951d87', '1', '1504317557');
INSERT INTO `v_picture` VALUES ('784', '/Uploads/Picture/2017-09-02/59aa11e269e80.jpg', '', 'c7da51486eb5b0e5d6a09800c7875936', '32b5f851cc33db83cf4ca9d91151a4f09daa5978', '1', '1504317922');
INSERT INTO `v_picture` VALUES ('785', '/Uploads/Picture/2017-09-02/59aa11e2cbffd.jpg', '', '9e282651f4f8009d85a0c4700db9b539', '96eb0daf4315b607c8ca1e1719e4ff5be163e18b', '1', '1504317922');
INSERT INTO `v_picture` VALUES ('786', '/Uploads/Picture/2017-09-02/59aa11e318c90.jpg', '', 'ecd787eca666d14a09b4e86bf5d0ea47', '061354ec69eac3d4ac81e3dc5e8658119721fd03', '1', '1504317923');
INSERT INTO `v_picture` VALUES ('787', '/Uploads/Picture/2017-09-02/59aa11e346e8e.jpg', '', '8ecc8995c3894ec3e09e12a02b28ac12', 'f240457fc34cae402a0919033d7f194afc515e97', '1', '1504317923');
INSERT INTO `v_picture` VALUES ('788', '/Uploads/Picture/2017-09-02/59aa11f3f3fe6.jpg', '', '95b550c90950337a729c2ea724709be1', '6b07c10041ba02d183aaddf1746867d21483a00c', '1', '1504317939');
INSERT INTO `v_picture` VALUES ('789', '/Uploads/Picture/2017-09-02/59aa11f474b61.jpg', '', 'd3676b4375c4d4b75fab211783c06c9f', '8f9c161ec420b3fba606d94b61b24e98293bcb1d', '1', '1504317940');
INSERT INTO `v_picture` VALUES ('790', '/Uploads/Picture/2017-09-02/59aa11f4dea21.jpg', '', 'fe0bd48b812074a52dafd61e35c789e8', '243279820720f639d796698d1ab9ed6cefe6df29', '1', '1504317940');
INSERT INTO `v_picture` VALUES ('791', '/Uploads/Picture/2017-09-02/59aa120059de8.jpg', '', '02c947318ae9e4f8898d4c584e1c65ec', '06a17906bf5bffc100b3f2e978efbe2a2cf3823b', '1', '1504317952');
INSERT INTO `v_picture` VALUES ('792', '/Uploads/Picture/2017-09-02/59aa12008789c.jpg', '', '1dadbae0251a3062272fc4dd580dc8cc', '7cf9e385c99b513a67af8895f66a5f0aaa60cb94', '1', '1504317952');
INSERT INTO `v_picture` VALUES ('793', '/Uploads/Picture/2017-09-02/59aa1200ba913.jpg', '', '8e8dbbf57288530e0f1625c1a494a2e2', '2430b892cc5ba9e7fa12fc619a7dcfb216c98c53', '1', '1504317952');
INSERT INTO `v_picture` VALUES ('794', '/Uploads/Picture/2017-09-02/59aa1200eccad.jpg', '', 'd45d5d08a5bdfd37376705467f30e9a2', '71f6f9253ecabd08571393186146c8ee06cc68f1', '1', '1504317952');
INSERT INTO `v_picture` VALUES ('795', '/Uploads/Picture/2017-09-02/59aa120143788.jpg', '', 'e9dc73046c8310a793b69c2da5fac050', '063cfcffe03952bde3802099190a682b68405b19', '1', '1504317953');
INSERT INTO `v_picture` VALUES ('796', '/Uploads/Picture/2017-09-02/59aa120172aa6.jpg', '', '2903a3ff1a462380d964435bbc390b85', '9bbc300bbf783cbf20d413bd2f432b7fd8e968cc', '1', '1504317953');
INSERT INTO `v_picture` VALUES ('797', '/Uploads/Picture/2017-09-02/59aa120c8b3ab.png', '', '8b3581d912b57427cbaad030757a125d', 'b687f210e796cac373932b28bff13b82861b25bd', '1', '1504317964');
INSERT INTO `v_picture` VALUES ('798', '/Uploads/Picture/2017-09-02/59aa120cc4bed.jpg', '', '02f0cf5f0674c506979dc4fe2f88850c', 'c6d2e4f28a900100d9fbf2c05e4eef85cd2e688b', '1', '1504317964');
INSERT INTO `v_picture` VALUES ('799', '/Uploads/Picture/2017-09-02/59aa120d0e636.jpg', '', 'fe538c4203b89bd33d0e683492db4b47', '6036ddc4f067f1c7310be5a462a95afdf0f14ebc', '1', '1504317965');
INSERT INTO `v_picture` VALUES ('800', '/Uploads/Picture/2017-09-02/59aa120d3cb09.jpg', '', '442efe74dcb7b99f87f839568c038ea5', '50b067becb6e9636e20b988ba6e786af6873cf71', '1', '1504317965');
INSERT INTO `v_picture` VALUES ('801', '/Uploads/Picture/2017-09-02/59aa12f82c0a0.png', '', 'bf5029ba77727266b2e68535d3d11803', '076fd4f9ebd1c0bc03d356fb3cf65e770b9db190', '1', '1504318200');
INSERT INTO `v_picture` VALUES ('802', '/Uploads/Picture/2017-09-02/59aa12f87c131.png', '', '2bf3fa83a3bdb10742612ee54e625686', '0cce5963ea3faddbb0ff63105f4559f306d61f64', '1', '1504318200');
INSERT INTO `v_picture` VALUES ('803', '/Uploads/Picture/2017-09-02/59aa12fc88fff.jpg', '', 'ad8fece280d370de98607eddeb0373ee', '477f5650858c267fa92bcccaa268c28daaa0551c', '1', '1504318204');
INSERT INTO `v_picture` VALUES ('804', '/Uploads/Picture/2017-09-02/59aa12fcd29ef.png', '', '3b7882d8252f888390e4d78b6ce219c6', '485b35d86294c564fddd6e355242b2a6b45947c6', '1', '1504318204');
INSERT INTO `v_picture` VALUES ('805', '/Uploads/Picture/2017-09-02/59aa130177238.jpg', '', '064a5bfccb55ff826522ef5f05d6443e', '1c239e0be550d75b72fbbcd64dbaa0355eb51ff0', '1', '1504318209');
INSERT INTO `v_picture` VALUES ('806', '/Uploads/Picture/2017-09-02/59aa1301b402f.jpg', '', 'a82b9db92bed0486b51d34d1e65ccd3f', 'c78e4ff3adde97cbb86f3625138f526277d88dad', '1', '1504318209');
INSERT INTO `v_picture` VALUES ('807', '/Uploads/Picture/2017-09-02/59aa1301f1227.jpg', '', '9dcae4c64847a94d251c7ccd2db8d272', 'ff6bf4f56eff2849088113e18c7de87a6ad16c95', '1', '1504318209');
INSERT INTO `v_picture` VALUES ('808', '/Uploads/Picture/2017-09-02/59aa1347a93e3.jpg', '', 'a6ed63034a0ec5dd2742bf79ea7f77ac', 'af60e1403eaf67ebf30a732ca729c2b121978841', '1', '1504318279');
INSERT INTO `v_picture` VALUES ('809', '/Uploads/Picture/2017-09-02/59aa1347d43da.jpg', '', '1480bb4cb9245b32574bd188ed2c555c', '754de9a10d5c08ffacefc926c806b6c88fa41a9c', '1', '1504318279');
INSERT INTO `v_picture` VALUES ('810', '/Uploads/Picture/2017-09-02/59aa13481c38f.jpg', '', 'fa17ffc3c6a023d6e76c4d4ded3b16cb', '5697f8856cccaf581b8b00f300d749340b72ce9f', '1', '1504318280');
INSERT INTO `v_picture` VALUES ('811', '/Uploads/Picture/2017-09-02/59aa1348441dc.jpg', '', '940878447955ca338a1219927f1b8cd1', '0b00fc20a1cdc8f7adb799d0f1d0ca23f79e51d5', '1', '1504318280');
INSERT INTO `v_picture` VALUES ('812', '/Uploads/Picture/2017-09-02/59aa13486eef3.jpg', '', 'b54245e778d2ef76456043d076903c14', 'd9c06eeadd7e90e8bb0a5653d724d51bfda6dfbc', '1', '1504318280');
INSERT INTO `v_picture` VALUES ('813', '/Uploads/Picture/2017-09-02/59aa134899ddd.jpg', '', 'c895ed3f6bce0d25df75ccc58d0f24a8', '23854dc001917cb82cf452906876e28089e29e03', '1', '1504318280');
INSERT INTO `v_picture` VALUES ('814', '/Uploads/Picture/2017-09-02/59aa1358d46e8.jpg', '', '8207b433ee84c5bb5eacbe52bbcc7b8c', '5cf9d78c61d07b935bd575c227f227f01b1390a6', '1', '1504318296');
INSERT INTO `v_picture` VALUES ('815', '/Uploads/Picture/2017-09-02/59aa1571e4bd2.jpg', '', 'e5315e551f3d5d84e089875d34299b65', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1504318833');
INSERT INTO `v_picture` VALUES ('816', '/Uploads/Picture/2017-09-02/59aa15a67838d.jpg', '', '81f4bcccda00015910911135b103403a', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1504318886');
INSERT INTO `v_picture` VALUES ('817', '/Uploads/Picture/2017-09-02/59aa19514e05b.jpg', '', 'b4e71b56c07e144c0c0e1f8bd9f43b2c', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1504319825');
INSERT INTO `v_picture` VALUES ('818', '/Uploads/Picture/2017-09-02/59aa1e5c6a15e.jpg', '', 'ca042cdd1cf805051e424de3289306b9', '03c8ca757d5c8f1f70e645a0c18f25391afac776', '1', '1504321116');
INSERT INTO `v_picture` VALUES ('819', '/Uploads/Picture/2017-09-02/59aa1ec774bcd.jpg', '', '29cf7b0701dbf8fdc393406592637fe5', 'b8c2b708905fe63185bddd224337be81ddad12d9', '1', '1504321223');
INSERT INTO `v_picture` VALUES ('820', '/Uploads/Picture/2017-09-02/59aa1f26eebf9.jpg', '', '3b3934a9fbe6bf36b34ae03b3f09334e', 'bb40dfabb6d54421b282d804f33051c72f2d28e0', '1', '1504321318');
INSERT INTO `v_picture` VALUES ('821', '/Uploads/Picture/2017-09-02/59aa1fa2b26c0.jpg', '', '49f5b64a07accf459682f7e141af982a', '4c6b2c67f58b5c9ea8a0f5dbf204105b8f1779e1', '1', '1504321442');
INSERT INTO `v_picture` VALUES ('822', '/Uploads/Picture/2017-09-02/59aa1ff1eced3.jpg', '', 'b515fa6ccde6ea21afd2471f9da962ed', 'b31b6d1071859ab76a6edb392f5a99b71c6f82d6', '1', '1504321521');
INSERT INTO `v_picture` VALUES ('823', '/Uploads/Picture/2017-09-02/59aa206c7350a.jpg', '', 'bd1cf3e1baeb4cac40ec5d082f1cc86b', '3596ee65e501a29bd7a9f3130606919040893ada', '1', '1504321644');
INSERT INTO `v_picture` VALUES ('824', '/Uploads/Picture/2017-09-02/59aa20dd8ebb8.jpg', '', 'aea67bcadd63f5fdeb0e2f5eb27ee18b', '127a9cfff4cb2de789ea73a1d29eb9235e51f442', '1', '1504321757');
INSERT INTO `v_picture` VALUES ('825', '/Uploads/Picture/2017-09-02/59aa2163b7f37.jpg', '', 'b7d745fdc295948c35360c50d84ff5fc', '3a7ed1893291fecb0fe4006c0b2df2aa3c2db68f', '1', '1504321891');
INSERT INTO `v_picture` VALUES ('826', '/Uploads/Picture/2017-09-02/59aa2212b5b54.jpg', '', 'f3f387b55183cdcb842ddefdb3015fe4', '2ac3e8c52194b1a82ce7dfdc7b3bf9d2760160ca', '1', '1504322066');
INSERT INTO `v_picture` VALUES ('827', '/Uploads/Picture/2017-09-02/59aa23909e7d3.jpg', '', 'a61d7838d43cb81a22639cb0230f0a91', '1f4eff3f9c2b92ad410c67955140130c2c486cbd', '1', '1504322448');
INSERT INTO `v_picture` VALUES ('828', '/Uploads/Picture/2017-09-02/59aa4d41cef9a.gif', '', 'e907446603dd43e8fc92009dbad221c6', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1504333121');
INSERT INTO `v_picture` VALUES ('829', '/Uploads/Picture/2017-09-02/59aa4dbaaf80d.png', '', '9d90162f4d94011e99a921978f110a49', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1504333242');
INSERT INTO `v_picture` VALUES ('830', '/Uploads/Picture/2017-09-02/59aa5aed11c47.jpg', '', 'cdd1baa7a49dc0b45359eb2f4f73c628', '9f01e8b95e2205d19322c307d7bccb4c4a6927e1', '1', '1504336621');
INSERT INTO `v_picture` VALUES ('831', '/Uploads/Picture/2017-09-02/59aa5b4370ddd.jpg', '', '90c92f8eb6d3c6d17ea06fb8b5bda36f', '94b3dbac3be207f6d6a9d5c4cfb64a3058b9e892', '1', '1504336707');
INSERT INTO `v_picture` VALUES ('832', '/Uploads/Picture/2017-09-04/59acfd1b89d00.jpg', '', '6952ec73251e9cf178e0e64b3f46884d', '9f172848a3698031f8a904614a026fb5e6f2d2fe', '1', '1504509211');
INSERT INTO `v_picture` VALUES ('833', '/Uploads/Picture/2017-09-04/59acfd6c75c2c.jpg', '', 'f7119d2080dc76518eda2d64833ca8c6', '4b610769ec549cf182b07b3bd36f062c5ce001a2', '1', '1504509292');
INSERT INTO `v_picture` VALUES ('834', '/Uploads/Picture/2017-09-04/59acfe0642e00.jpg', '', 'f02c761878216d770327bac31c670059', '030a58bd2bc926bb2f73221e3483e47199fb550c', '1', '1504509446');
INSERT INTO `v_picture` VALUES ('835', '/Uploads/Picture/2017-09-04/59acfe3f6faf8.jpg', '', '12d2845f979a9673a591dec600def8fd', '3161f736ec790a920e973ce9273a0eed286db7ec', '1', '1504509503');
INSERT INTO `v_picture` VALUES ('836', '/Uploads/Picture/2017-09-04/59acfe9564f7b.jpg', '', '57478680a9ff6d9e8e235a2dfb8d620d', '615bb2cacb462f210fc8514524c591d3f9d3c924', '1', '1504509589');
INSERT INTO `v_picture` VALUES ('837', '/Uploads/Picture/2017-09-04/59acfefcbaab5.jpg', '', 'e9b2222a1436f03211206dd6c9a1da1d', '6bd108fd2c5051999164a5681f3816f342ab4f5d', '1', '1504509692');
INSERT INTO `v_picture` VALUES ('838', '/Uploads/Picture/2017-09-04/59acff2a94a90.jpg', '', '84f1da2d16be274e9b0f771e38309631', '35397fb1a8f89f33f72996e0b6ca74100f2a3523', '1', '1504509738');
INSERT INTO `v_picture` VALUES ('839', '/Uploads/Picture/2017-09-04/59acff92bd703.jpg', '', '58f329378c18382330681bed0b587918', 'b375f9c55dccad22052c3d1b493e01d0fc1e4d9d', '1', '1504509842');
INSERT INTO `v_picture` VALUES ('840', '/Uploads/Picture/2017-09-04/59ad004f91821.jpg', '', '7d0c5c77e5ca5c2133fc283b538c4ada', '3c2f50e1fd335f6356038ca7d9595b4f057b25e9', '1', '1504510031');
INSERT INTO `v_picture` VALUES ('841', '/Uploads/Picture/2017-09-04/59ad007c6532f.jpg', '', '164f83ef20e044587144381b5e2490a5', 'fcc03eec28c866f01982121a11a1b22617bcd606', '1', '1504510076');
INSERT INTO `v_picture` VALUES ('842', '/Uploads/Picture/2017-09-04/59ad00bbefbe7.jpg', '', 'cf3dac10903c87c2e74a4eb20b9f6232', 'b9635f387cf8caf034a131b28aecb9590e502280', '1', '1504510139');
INSERT INTO `v_picture` VALUES ('843', '/Uploads/Picture/2017-09-04/59ad01123b2e9.jpg', '', 'e137f5eb730d36b046a2c3db2a7ee923', '1d63cc408af24e94fef6858a846f0809c098d15d', '1', '1504510226');
INSERT INTO `v_picture` VALUES ('844', '/Uploads/Picture/2017-09-04/59ad01743a20e.jpg', '', '00268d246785848ce7acddc03b47c7d4', 'ffadf6df51ccc39e4df1a27faf4463c1c766fc09', '1', '1504510324');
INSERT INTO `v_picture` VALUES ('845', '/Uploads/Picture/2017-09-04/59ad01ca4dc95.jpg', '', 'b8e92954bb79c758399adc39a621a9aa', 'e6afd4dd695043b4e9ed9abbef44c6a172d15669', '1', '1504510410');
INSERT INTO `v_picture` VALUES ('846', '/Uploads/Picture/2017-09-04/59ad021d13bb0.jpg', '', '9e153cceb24d19453b13d30beaa7b503', '6f0de575ff095045ca24adf0353e24e422dab922', '1', '1504510493');
INSERT INTO `v_picture` VALUES ('847', '/Uploads/Picture/2017-09-04/59ad02974d6fc.jpg', '', '7e15d9e81fcdc5ab59da1eebd3600b51', '0ded3a83a179bd08e8ea21dcdd13b83e494ba9d4', '1', '1504510615');
INSERT INTO `v_picture` VALUES ('848', '/Uploads/Picture/2017-09-04/59ad0313354bc.jpg', '', '36e799b0d25dc51d6bea9598a62a701e', '120424c420683f960203ca6e45cccace7aaf503e', '1', '1504510739');
INSERT INTO `v_picture` VALUES ('849', '/Uploads/Picture/2017-09-04/59ad03774bfce.jpg', '', 'c2e155da650689b0a8e031b7814be7c5', '99ca39c3c2708abcb67dc1b1d058f2cc61624298', '1', '1504510839');
INSERT INTO `v_picture` VALUES ('850', '/Uploads/Picture/2017-09-04/59ad03a2ba980.jpg', '', '74706e6591219915f269b0614887a790', '1e6e1d7fc5267cf39f4137e5a58cd163049ec5f6', '1', '1504510882');
INSERT INTO `v_picture` VALUES ('851', '/Uploads/Picture/2017-09-04/59ad03cfeea7d.jpg', '', '66f1d5ef81c8bfd20b579806b7a3b269', '86b4ab25491f098a352d950069a46dbefeb6cb80', '1', '1504510927');
INSERT INTO `v_picture` VALUES ('852', '/Uploads/Picture/2017-09-04/59ad03f81931b.jpg', '', '83ffe3ad59f141f7e1336f1b907e8a58', '54a65db50c54f74e23336e4f28cdf0b7cc320d6a', '1', '1504510968');
INSERT INTO `v_picture` VALUES ('853', '/Uploads/Picture/2017-09-04/59ad042896fda.jpg', '', 'fb56ec69f2b96df24c0a70ebb9bbe5df', '2f74c2b1978d5f925f6debe87837ddb9465f9f38', '1', '1504511016');
INSERT INTO `v_picture` VALUES ('854', '/Uploads/Picture/2017-09-04/59ad044d148d7.jpg', '', '55e5fd09f5c83d0a99080ac8ffd6306d', '872e09f5775c35accb07e34a00149b9bd6668a01', '1', '1504511053');
INSERT INTO `v_picture` VALUES ('855', '/Uploads/Picture/2017-09-04/59ad04919447d.jpg', '', 'faa91b375b16a6d02ec04ff7c6722561', 'f6c580e0f065f2edb74de899919e5ef992d143e5', '1', '1504511121');
INSERT INTO `v_picture` VALUES ('856', '/Uploads/Picture/2017-09-04/59ad19c8bc76c.jpg', '', '0ff5f17320f2e419428459624338a736', '3d6c5120e4b7e1adaee87db4df50927a1a3e74da', '1', '1504516552');
INSERT INTO `v_picture` VALUES ('857', '/Uploads/Picture/2017-09-04/59ad1e4c680a9.jpg', '', 'ca7a1a64a1be6d460ab4ae1ef76fdff6', '2a638aba13d688edaca6334e372ab4ded4e08c71', '1', '1504517708');
INSERT INTO `v_picture` VALUES ('858', '/Uploads/Picture/2017-09-04/59ad1e707b965.jpg', '', '06aeb4f1e8cfebc8b288cbe73a0c0ae5', '0faa36864b9fcd05cbde9a0bf39793ff13e41f4a', '1', '1504517744');
INSERT INTO `v_picture` VALUES ('859', '/Uploads/Picture/2017-09-04/59ad1ec8175df.jpg', '', 'cffb4b20bcbfd479460029da9d98b780', 'e22b2ad2532277c7414ef6eb5fc682467f2aac2c', '1', '1504517832');
INSERT INTO `v_picture` VALUES ('860', '/Uploads/Picture/2017-09-04/59ad1ef0ad7b3.jpg', '', 'f8d3a2b730dd7d5dcb4cdb83f2bbdc9e', '8e3cd3d5b056b2d1341a14bbc98216c2f907c3f3', '1', '1504517872');
INSERT INTO `v_picture` VALUES ('861', '/Uploads/Picture/2017-09-04/59ad1f7342424.jpg', '', 'b2a8dcec242c93688a1a12d6b722b7b6', 'fb098b19649226fce26217e54591bde12598ecf0', '1', '1504518003');
INSERT INTO `v_picture` VALUES ('862', '/Uploads/Picture/2017-09-04/59ad1faa475d7.jpg', '', 'f30a5f9a4f184c7ed2c9c1e5880e9e9f', '63e4cf60953c5b1208d09b52c4e878a170bb26cc', '1', '1504518058');
INSERT INTO `v_picture` VALUES ('863', '/Uploads/Picture/2017-09-04/59ad1ff050f2b.jpg', '', '3f135ba57e9aa9f63a5030808d8e7a49', '8cd15c33a8e4c696f72448d2fbb032502a21bdbc', '1', '1504518128');
INSERT INTO `v_picture` VALUES ('864', '/Uploads/Picture/2017-09-04/59ad206be6af9.jpg', '', '6dcee93e022c3b5306e9469cb86438d2', '4826b3df1bd12e8c7ccc46b48e957701843aff31', '1', '1504518251');
INSERT INTO `v_picture` VALUES ('865', '/Uploads/Picture/2017-09-04/59ad20c160a6d.jpg', '', '305bd11397573b71cb316d3a058c735e', 'c6abeeff8ca7a9077d08b5c9063d7ef6dc03db7c', '1', '1504518337');
INSERT INTO `v_picture` VALUES ('866', '/Uploads/Picture/2017-09-04/59ad20f06d998.jpg', '', 'a4a97b90516559cdd13eea99e7038ce0', 'f022286d27bb08c10d12cf8821a4efbb80c8b804', '1', '1504518384');
INSERT INTO `v_picture` VALUES ('867', '/Uploads/Picture/2017-09-04/59ad215e6890a.jpg', '', 'fa40f9be8280f7173df31038ebbb17cb', '9944119966db348dec19e9519b87dd4fc4d638c1', '1', '1504518494');
INSERT INTO `v_picture` VALUES ('868', '/Uploads/Picture/2017-09-04/59ad22bc7917e.jpg', '', '041231ce0aa05dce32d60dfcd46f4468', '627450a34a31a71605efa46aefa29de54b0e6da2', '1', '1504518844');
INSERT INTO `v_picture` VALUES ('869', '/Uploads/Picture/2017-09-07/59b117d708b87.jpg', '', '5352ac5bf8400f27e2669c147072a222', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1504778199');
INSERT INTO `v_picture` VALUES ('870', '/Uploads/Picture/2017-09-12/59b7871c32f96.jpg', '', 'bb30bce598d8cfdc711c6008f647763d', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1505199900');
INSERT INTO `v_picture` VALUES ('871', '/Uploads/Picture/2017-09-15/59bb84eae804e.jpg', '', '5bd6f32aae7a2ebfd06b36b050862e4f', '7f31068395009c973ed1a87f5e04830acf56be22', '1', '1505461482');
INSERT INTO `v_picture` VALUES ('872', '/Uploads/Picture/2017-09-15/59bb86e65ee3e.jpg', '', 'fccabe6b58df40628727752b7c85ca17', '1ca62caf25627ee5763d88d8e236c0b9d138df2a', '1', '1505461990');
INSERT INTO `v_picture` VALUES ('873', '/Uploads/Picture/2017-09-15/59bb874cd0ce5.jpg', '', 'e01d3893b74db0b132db38fb19117373', '5055a18815a8a486fb91c4342cef1d4e216b90cc', '1', '1505462092');
INSERT INTO `v_picture` VALUES ('874', '/Uploads/Picture/2017-09-15/59bb88012954d.jpg', '', '37bf964f1bc10a30b284adfabed00ce2', '182db5b76fb428ca63a22872d9f62624e2b0fb19', '1', '1505462273');
INSERT INTO `v_picture` VALUES ('875', '/Uploads/Picture/2017-09-15/59bb88e59918f.jpg', '', 'c856baa28482e81d13a0568cdb6748a9', '62376dd8f09ffc26b0fcb6128704f1c47cc57098', '1', '1505462501');
INSERT INTO `v_picture` VALUES ('876', '/Uploads/Picture/2017-09-15/59bb8a1f475ef.jpg', '', '67c2fecb757267058d7faf46c497ec1a', '2ba09459a10f2cdf866724471600b078313a2d34', '1', '1505462815');
INSERT INTO `v_picture` VALUES ('877', '/Uploads/Picture/2017-09-15/59bb8ab49375f.jpg', '', '88391797b7402b415204fa2bff8583af', 'b9c90b684de05bf042adc2eb6b10c38a78bc0c1c', '1', '1505462964');
INSERT INTO `v_picture` VALUES ('878', '/Uploads/Picture/2017-09-15/59bb8af5ce16f.jpg', '', '9a0d6182eb84791d9107eba968a7a6ce', 'fc33d57d073258e71de13ca50e8e69ebbb9bc24c', '1', '1505463029');
INSERT INTO `v_picture` VALUES ('879', '/Uploads/Picture/2017-09-15/59bb8b2435363.jpg', '', 'b88fc8cc95eed0ae1968a0b027b53b7c', '1842f0035ebb9d168033f5c1cd48d264bddbc8d1', '1', '1505463076');
INSERT INTO `v_picture` VALUES ('880', '/Uploads/Picture/2017-09-18/59bf74a21bbea.jpg', '', 'e2dd133f4238a216f4d4dbb17e31f431', '0ee782892ed03cad9f5a307e2c981cab95368a33', '1', '1505719458');
INSERT INTO `v_picture` VALUES ('881', '/Uploads/Picture/2017-09-18/59bf7764a8da7.jpg', '', '184c2c6ac815ca6b0205a754561ebe07', 'c2564951d0f8f27c6f93a6804f8156c55026eb46', '1', '1505720164');
INSERT INTO `v_picture` VALUES ('882', '/Uploads/Picture/2017-09-18/59bf798462006.jpg', '', '93099f98c8b6e2018d1f56da0a598f38', 'bf4b1d2be09cb4e11e12ae71c79123d3ba50fbd2', '1', '1505720708');
INSERT INTO `v_picture` VALUES ('883', '/Uploads/Picture/2017-09-18/59bf79b35d198.jpg', '', 'e3d86331d46928367ed0ec62e319c72f', '4fb1b478527a863ffe65c7428fc41387a8d14186', '1', '1505720755');
INSERT INTO `v_picture` VALUES ('884', '/Uploads/Picture/2017-09-18/59bf79d81db37.jpg', '', '34f8902717c315762171a3d815205ce8', '6b0fcf38b34592f185f2eada76a239284c78f038', '1', '1505720792');
INSERT INTO `v_picture` VALUES ('885', '/Uploads/Picture/2017-09-18/59bf79f20d273.jpg', '', 'c63afbbb8c2731d9b305643d212c0cad', '16ad6b3530dfe74f4c595e46a96f39be3a2a173e', '1', '1505720818');
INSERT INTO `v_picture` VALUES ('886', '/Uploads/Picture/2017-09-18/59bf7ad73ce0f.jpg', '', '19d7c06dadfc08b0c19052f1204b9fe2', 'a72c4cbf4972c992317ed33b5898fb57d7958058', '1', '1505721047');
INSERT INTO `v_picture` VALUES ('887', '/Uploads/Picture/2017-09-18/59bf7aeedab34.jpg', '', '2fe8affd14338f58d5bf5a37514e3bbf', 'ea75b1872084ad2f98caacb1bc5db7eaf335d808', '1', '1505721070');
INSERT INTO `v_picture` VALUES ('888', '/Uploads/Picture/2017-09-18/59bf7b0d77fc1.jpg', '', '1a7f488109d6ae30819a6c9d5d8d138d', 'd8c782b1266843a8d3c07670c34b3edb13dd8fc4', '1', '1505721101');
INSERT INTO `v_picture` VALUES ('889', '/Uploads/Picture/2017-09-18/59bf7b2687329.jpg', '', 'bef86328abcd32dc4ca561200d827a46', '23ccaea304af386d0d7705cb36651d12cf099fbd', '1', '1505721126');
INSERT INTO `v_picture` VALUES ('890', '/Uploads/Picture/2017-09-18/59bf7d7f19fd0.jpg', '', '7ddbe0568cf2374e24f9494d1c9b87e2', 'e0eae001272be9c8a5737a2742f0de85de735a99', '1', '1505721727');
INSERT INTO `v_picture` VALUES ('891', '/Uploads/Picture/2017-09-18/59bf7d9e86ffb.jpg', '', 'a1b0b9b8cc17a7e319f2514463fd5459', '35089e5e3b95d7026a6bace9970fcd183ca05968', '1', '1505721758');
INSERT INTO `v_picture` VALUES ('893', '/Uploads/Picture/2017-09-20/59c1bc4286125.gif', '', '608154ec2c46d470b9c39971e99dc0b1', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1505868866');
INSERT INTO `v_picture` VALUES ('894', '/Uploads/Picture/2017-09-20/59c1bc6238f91.jpg', '', '72b23d98d08a0a7b5a9eb7ceeb5c7458', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1505868898');
INSERT INTO `v_picture` VALUES ('895', '/Uploads/Picture/2017-09-20/59c1bcc1c832a.jpg', '', '5985d8aeb2904088ec57e61f0f781875', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1505868993');
INSERT INTO `v_picture` VALUES ('898', '/Uploads/Picture/2017-09-27/59cb0c1fcc245.jpg', '', '3462b1ff313e2ff3d10eeedce36f9099', '287858e2be3453411999893e262f409cc76e1ec0', '1', '1506479135');
INSERT INTO `v_picture` VALUES ('899', '/Uploads/Picture/2017-10-20/59e9c67078b78.jpg', '', 'f7c412cf1c679a442c0ee10935c0b05a', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1508492912');
INSERT INTO `v_picture` VALUES ('900', '/Uploads/Picture/2017-10-21/59ea9d357f8e0.jpg', '', 'b5716010d3b657f065f6b512d0f1fb2b', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1508547893');
INSERT INTO `v_picture` VALUES ('901', '/Uploads/Picture/2017-10-21/59eadff6d37a7.jpg', '', '79ec704dc6903b3d51e507a766268790', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1508564982');
INSERT INTO `v_picture` VALUES ('902', '/Uploads/Picture/2017-10-25/59f05c464fbb7.png', '', '839e2ea3e4bf1f033081159dc6dc8e55', 'cbefb20eff40d452258c73c39526e411f9a68a42', '1', '1508924486');
INSERT INTO `v_picture` VALUES ('903', '/Uploads/Picture/2017-10-25/59f05d38bc407.png', '', '007edb093fb0f69294d30659b03d4c97', '40cc5410c87a77e4b58e1cd5f1e0fb78ed496228', '1', '1508924728');
INSERT INTO `v_picture` VALUES ('904', '/Uploads/Picture/2017-10-25/59f05dac73c9b.png', '', '712be2bff0d05c903c5b0d80a87877ae', '936ae6c2b4594ae2be318c8ba456a1b6a1164d17', '1', '1508924844');
INSERT INTO `v_picture` VALUES ('905', '/Uploads/Picture/2017-10-28/59f3d5ec4a6cc.jpg', '', '60452214d1c1eeb549ecb5c995c5fe27', '66d04f3fec9044bdde675cea8cd3d906c9db9b50', '1', '1509152236');
INSERT INTO `v_picture` VALUES ('906', '/Uploads/Picture/2017-10-30/59f68d0e2691e.jpg', '', '4a74e7596b62e993adaca9be4a448465', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1509330190');
INSERT INTO `v_picture` VALUES ('907', '/Uploads/Picture/2017-11-10/5a04f77a68b94.jpg', '', '20f2349f384e2897507e5eaf2d80b122', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1510274938');
INSERT INTO `v_picture` VALUES ('908', '/Uploads/Picture/2017-11-10/5a04f7aaaf0dd.jpg', '', '4c6fbd28b46931164f54ace370671146', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1510274986');
INSERT INTO `v_picture` VALUES ('909', '/Uploads/Picture/2017-11-10/5a04f87b28c72.jpg', '', 'e768cd61a60abb25b38aac3374accbe5', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1510275195');
INSERT INTO `v_picture` VALUES ('910', '/Uploads/Picture/2017-11-10/5a04f8f148be7.jpg', '', '16864d82023ea1cf1e0bd7e87c08117d', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1510275313');
INSERT INTO `v_picture` VALUES ('911', '/Uploads/Picture/2017-11-10/5a04f901aa94c.jpg', '', '2fbba6fac16a0e974c1b57f1979e9a96', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1510275329');
INSERT INTO `v_picture` VALUES ('912', '/Uploads/Picture/2017-11-10/5a04fa228d46b.jpg', '', '367507bb5b83ea654d3f5094c201e98f', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1510275618');
INSERT INTO `v_picture` VALUES ('913', '/Uploads/Picture/2017-11-13/5a097bda3c5bf.jpg', '', 'c28ed82348472cb7973bbb9692015785', 'f7c741a6ae55b46c6939fbc13df3c77e137bf122', '1', '1510570970');
INSERT INTO `v_picture` VALUES ('914', '/Uploads/Picture/2017-12-08/5a2a48c48b8e9.jpg', '', '5c23787994f906ae436290263f00e90b', '9b64f21448b3d4e425fae9c29faac21c224507ef', '1', '1512720580');
INSERT INTO `v_picture` VALUES ('915', '/Uploads/Picture/2017-12-08/5a2a48e76acfb.jpg', '', '963ec938dac438f78ea864304af7fa2f', 'dceeca37a68ffc0cab0088e095289a6efb704a3d', '1', '1512720615');
INSERT INTO `v_picture` VALUES ('916', '/Uploads/Picture/2017-12-11/5a2de8ca30c17.jpg', '', '87e91e14bc4fad27ccdc081a907fd621', '8efa4ca634e33ba61b109b3d4b61f47c73779919', '1', '1512958154');
INSERT INTO `v_picture` VALUES ('917', '/Uploads/Picture/2017-12-11/5a2e2205cc5f0.jpg', '', '68b39c16f63f4535700ba006df81158f', 'e616ee79a81160d2b6b2fcb8410104be0755f9ff', '1', '1512972805');
INSERT INTO `v_picture` VALUES ('918', '/Uploads/Picture/2017-12-11/5a2e221e7cee3.jpg', '', '3e333754be75c8c6c8fd6c48901dcbee', '93eeb7d6732ad8f8b501eefd25d422b15b98d2b2', '1', '1512972830');
INSERT INTO `v_picture` VALUES ('919', '/Uploads/Picture/2017-12-11/5a2e22a7a0a4c.jpg', '', '783544b3083a89d49ca5bdbe2c3a0481', '509957343d8f0d4b65f8211f0eb87e200e577b88', '1', '1512972967');
INSERT INTO `v_picture` VALUES ('920', '/Uploads/Picture/2017-12-11/5a2e234864dcc.jpg', '', 'fad38d9e121e28d7d8c10983fb9f1840', 'adb93e9d60476b147c34a97a7f73c25a200609d9', '1', '1512973128');
INSERT INTO `v_picture` VALUES ('921', '/Uploads/Picture/2017-12-12/5a2f895eb0e8d.jpg', '', 'b185e92b14c7bbf5dc053a1bc0fd2227', '3b6faee70e86cff739a147e297f6b01c49f8e4ac', '1', '1513064798');
INSERT INTO `v_picture` VALUES ('922', '/Uploads/Picture/2017-12-12/5a2f895ff2eba.jpg', '', '92c038d2f7723770d4b070ab16748300', '5ee9f1906caa5a52ae2586ff51e649a79eed599f', '1', '1513064799');
INSERT INTO `v_picture` VALUES ('923', '/Uploads/Picture/2017-12-12/5a2f896465f59.jpg', '', '6e0122eaac5b9e99e8b65e77407e10dd', '6617460918175951d5dd5cf8bcd6720f8564603d', '1', '1513064804');
INSERT INTO `v_picture` VALUES ('924', '/Uploads/Picture/2017-12-12/5a2f8968c977c.jpg', '', 'ced05e9645d19b2f944437712dd0bff1', 'cdc1d579cc5a881e98b852ba09963c4ac456de58', '1', '1513064808');
INSERT INTO `v_picture` VALUES ('925', '/Uploads/Picture/2017-12-15/5a334578717f7.jpg', '', '387c6ded2effc8d2216c64001a0fdd83', '1cb5e51ce8c59131a3b6dc5f576e2c81317dd527', '1', '1513309560');
INSERT INTO `v_picture` VALUES ('926', '/Uploads/Picture/2017-12-15/5a3345936d03c.jpg', '', 'dc0e85becb4a5b3334a882abde6e7b06', '92edf1c754ba65c433ee0acad3377af157c4e53f', '1', '1513309587');
INSERT INTO `v_picture` VALUES ('929', '/Uploads/Picture/2017-12-20/5a3a20fc65253.jpg', '', '97624598a76309ceebe36060345f2924', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1513758972');
INSERT INTO `v_picture` VALUES ('930', '/Uploads/Picture/2017-12-20/5a3a23e9a3f12.jpg', '', 'baedbd7bb25e8b72073d9f3932bd8321', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1513759721');
INSERT INTO `v_picture` VALUES ('931', '/Uploads/Picture/2017-12-26/5a41a7d9a4484.jpg', '', 'e21931899937241c8ce0ffc8750d1759', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1514252249');
INSERT INTO `v_picture` VALUES ('932', '/Uploads/Picture/2017-12-26/5a41a824aec01.jpg', '', '8c173a611f9b612941e77f56179b783d', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1514252324');
INSERT INTO `v_picture` VALUES ('933', '/Uploads/Picture/2017-12-26/5a41aebcf1fc2.jpg', '', 'cdcdf02054ac90dbc8b3ad396b28318c', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1514254013');
INSERT INTO `v_picture` VALUES ('934', '/Uploads/Picture/2017-12-26/5a41aeca0902c.jpg', '', 'caa228e87545a220d14348bcc9ffd637', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1514254026');
INSERT INTO `v_picture` VALUES ('935', '/Uploads/Picture/2017-12-26/5a41b823be5bf.jpg', '', '59b7643f43321a37578bd04987baae2c', 'd0735a8786a257c9a1c4bb0da20f9f83d19f8096', '1', '1514256419');
INSERT INTO `v_picture` VALUES ('936', '/Uploads/Picture/2017-12-27/5a42f5ba6b317.jpg', '', 'd2b09a59181d3e0115dcbffd202babf3', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1514337722');
INSERT INTO `v_picture` VALUES ('937', '/Uploads/Picture/2017-12-27/5a42f6a2af3e0.jpg', '', '5ec2ab2e93536a558b3f32c8274a4e1b', 'df7be9dc4f467187783aca68c7ce98e4df2172d0', '1', '1514337954');
INSERT INTO `v_picture` VALUES ('938', '/Uploads/Picture/2017-12-28/5a44ac498b2a5.jpg', '', '2a442a265c80354f8bea67b92db41799', 'a30d454f698bf307ab71056ddb73aef332b8506c', '1', '1514449993');
INSERT INTO `v_picture` VALUES ('939', '/Uploads/Picture/2017-12-28/5a44ac545785e.jpg', '', '8afe023f7bfbac096082fc62733af981', 'd6d8a18e51d4f465deafa961a2e8e2da8a3b23c8', '1', '1514450003');

-- ----------------------------
-- Table structure for v_ucenter_admin
-- ----------------------------
DROP TABLE IF EXISTS `v_ucenter_admin`;
CREATE TABLE `v_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of v_ucenter_admin
-- ----------------------------

-- ----------------------------
-- Table structure for v_ucenter_app
-- ----------------------------
DROP TABLE IF EXISTS `v_ucenter_app`;
CREATE TABLE `v_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL DEFAULT '' COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of v_ucenter_app
-- ----------------------------

-- ----------------------------
-- Table structure for v_ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `v_ucenter_member`;
CREATE TABLE `v_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of v_ucenter_member
-- ----------------------------
INSERT INTO `v_ucenter_member` VALUES ('1', 'Administrator', 'a35159e0033ffdb0f51fef0555e6e64a', 'lunhui88@126.com', '', '1414476189', '2130706433', '1514509143', '167772674', '1414476189', '1');
INSERT INTO `v_ucenter_member` VALUES ('2', 'admin', 'a35159e0033ffdb0f51fef0555e6e64a', 'huzorro@gmail.com', '', '1414476227', '2130706433', '1478675056', '167772674', '1414476227', '1');

-- ----------------------------
-- Table structure for v_ucenter_setting
-- ----------------------------
DROP TABLE IF EXISTS `v_ucenter_setting`;
CREATE TABLE `v_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
-- Records of v_ucenter_setting
-- ----------------------------

-- ----------------------------
-- Table structure for v_update
-- ----------------------------
DROP TABLE IF EXISTS `v_update`;
CREATE TABLE `v_update` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `gid` int(4) NOT NULL,
  `username` varchar(32) NOT NULL,
  `content` text,
  `picid` int(4) NOT NULL DEFAULT '0',
  `phone` varchar(32) NOT NULL,
  `up_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v_update
-- ----------------------------
INSERT INTO `v_update` VALUES ('1', '567', 'zjl1012', '提供最新的白羊沟旅游景点信息,白羊沟农家院,白羊沟住宿推荐,吃喝玩乐全程为您服务,同时为您提供最新旅游攻略、美食攻略、线路指南,门票团购,去白羊沟旅游.', '250', '13904210132', '1503562625');
INSERT INTO `v_update` VALUES ('3', '568', 'zjl1012', '886提供最新的白羊沟旅游景点信息,白羊沟农家院,白羊沟住宿推荐,吃喝玩乐全程为您服务,同时为您提供最新旅游攻略、美食攻略、线路指南,门票团购,去白羊沟旅游.', '245', '13945212548', '1503542864');
INSERT INTO `v_update` VALUES ('4', '569', 'zjl1012', '帝乐农庄_浦东新区农家乐帝乐农庄_浦东新区农家乐帝乐农庄_浦东新区农家乐帝乐农庄_浦东新区农家乐帝乐农庄_浦东新区农家乐帝乐农庄_浦东新区农家乐帝乐农庄_浦东新区农家乐帝乐农庄_浦东新区农家乐帝乐农庄_浦东新区农家乐帝乐农庄_浦东新区农家乐帝乐农庄_浦东新区农家乐帝乐农庄_', '249', '13600001111', '1503561022');
INSERT INTO `v_update` VALUES ('5', '574', 'zjl1012', '5555555提供最新的白羊沟旅游景点信息,白羊沟农家院,白羊沟住宿推荐,吃喝玩乐全程为您服务,同时为您提供最新旅游攻略、美食攻略、线路指南,门票团购,去白羊沟旅游.', '266', '13945212540', '1503642227');
INSERT INTO `v_update` VALUES ('6', '580', 'zjl1012', '提123132供最新的白羊沟旅游景点信息,白羊沟农家院,白羊沟住宿推荐,吃喝玩乐全程为您服务,同时为您提供最新旅游攻略、美食攻略、线路指南,门票团购,去白羊沟旅游.', '272', '13904210139', '1504058134');
INSERT INTO `v_update` VALUES ('7', '597', 'zjl1012', '野三坡帝星农家院位于涞水县三坡镇苟各庄村，被誉为“天下第一峡”的百里峡是野三坡独具特色的景区之一', '291', '15955423258', '1504511493');
INSERT INTO `v_update` VALUES ('8', '601', 'zjl1012', '白洋淀小雨农家院诚信经营，真诚待客，希望与广大游客交换意见，您的支持是我们进步的动力！\r\n谢谢大家对白洋淀小雨农家院的厚爱，我们会不断改进服务，为游客提供更好的游玩环境！', '301', '13855440211', '1505199923');
INSERT INTO `v_update` VALUES ('9', '671', 'zjl1012', '   所465789有团队利用提供的绳子和EVA板在规定的40分钟时间里，在人不离地、不借助任何外力的情况下，将箱子尽可能高的垒起来，最低要实现13个箱子的高度。其意义是在有限资源的情况下，开拓思路，巧想办法，把任务完成地更好。', '893', '13904215555', '1505868866');
INSERT INTO `v_update` VALUES ('10', '664', 'zjl1012', '北京凤凰岭自然风景区位于海淀区苏家坨镇境内，距天安门33公里，总面积10.62平方公里。青山绿水，蓝天白云，层峦叠翠，密林曲径，奇花异草遍及山野，具有良好的生态环境；其上风上水的地理优势，使之享有京城“绿肺”之称。', '894', '13904210163', '1505868898');
INSERT INTO `v_update` VALUES ('11', '663', 'zjl1012', '北京凤凰岭自然风景区位于海淀区苏家坨镇境内，距天安门33公里，总面积10.62平方公里。青山绿水，蓝天白云，层峦叠翠，密林曲径，奇花异草遍及山野，具有良好的生态环境；其上风上水的地理优势，使之享有京城“绿肺”之称。', '899', '4000-979-212', '1508492912');
INSERT INTO `v_update` VALUES ('12', '609', 'zjl1012', '实在人农家院位于北京市怀柔区琉璃庙镇狼虎哨村，交通便利；四面环山，门前白河是密云水库的主坝上游，是我市最长的一条河流，这里空气清新', '910', '13683010897 ', '1510275313');
INSERT INTO `v_update` VALUES ('13', '603', 'zjl1012', '五虎门度假中心隶属于北京五虎门民俗饭庄座落在北京城郊最东北端，国家级自然保护区雾灵山脚', '912', '13811230383 ', '1510275618');
INSERT INTO `v_update` VALUES ('14', '640', 'zjl1012', '从自行车自行车自行车下自成蹊在自行车自行车自行车自行车在线', '822', '13821297979', '1514251841');
INSERT INTO `v_update` VALUES ('15', '599', 'zjl1012', '梨木台天香楼蓟县下营镇东山村位于郭家沟村东1000米马营公里旁是蓟县县委县政府投巨资', '821', '18322123441', '1514270351');

-- ----------------------------
-- Table structure for v_update1
-- ----------------------------
DROP TABLE IF EXISTS `v_update1`;
CREATE TABLE `v_update1` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `gid` int(4) NOT NULL,
  `picid` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `type` varchar(32) NOT NULL,
  `up_time` int(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v_update1
-- ----------------------------

-- ----------------------------
-- Table structure for v_url
-- ----------------------------
DROP TABLE IF EXISTS `v_url`;
CREATE TABLE `v_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';

-- ----------------------------
-- Records of v_url
-- ----------------------------

-- ----------------------------
-- Table structure for v_userdata
-- ----------------------------
DROP TABLE IF EXISTS `v_userdata`;
CREATE TABLE `v_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v_userdata
-- ----------------------------

-- ----------------------------
-- Table structure for v_words
-- ----------------------------
DROP TABLE IF EXISTS `v_words`;
CREATE TABLE `v_words` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `uid` varchar(32) NOT NULL,
  `gid` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `create_time` int(255) NOT NULL,
  `status` int(4) NOT NULL DEFAULT '0',
  `picpath` varchar(255) DEFAULT NULL,
  `ggid` int(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v_words
-- ----------------------------
INSERT INTO `v_words` VALUES ('40', 'zjl1012', '上庄水库依然农家16', '这个风景是6666666666666888888888888', '1504141356', '1', '/Uploads/Picture/2017-08-31/59a7602cdfbf5.jpg', '612');
INSERT INTO `v_words` VALUES ('41', 'jing123', '靠山居农家院', '很好非常好 ', '1504238282', '0', null, '638');
INSERT INTO `v_words` VALUES ('42', 'jing123', '毛家峪悦鑫阁农家院', '非常好  他家环境好  菜色精美', '1504261247', '0', null, '606');
INSERT INTO `v_words` VALUES ('43', 'zjl1012', '白洋淀小雨农家院', '6666666', '1510197291', '0', null, '601');
INSERT INTO `v_words` VALUES ('44', '微连网络123', '凤凰岭张记农家小院', '巴萨', '1511781678', '0', null, '664');
INSERT INTO `v_words` VALUES ('45', '微连网络123', '凤凰岭张记农家小院', '巴萨', '1511781690', '0', null, '664');
INSERT INTO `v_words` VALUES ('46', '微连网络123', '凤凰岭张记农家小院', '巴萨', '1511781692', '0', null, '664');
INSERT INTO `v_words` VALUES ('47', 'zjl1012', '凤凰岭聚福农家小院', 'czczxz', '1513318622', '0', null, '663');
INSERT INTO `v_words` VALUES ('48', 'zjl1012', '凤凰岭聚福农家小院', 'czxczxz', '1513318998', '0', null, '663');
INSERT INTO `v_words` VALUES ('49', 'zjl1012', '野山坡农家院', '多少的', '1513850957', '0', null, '602');
INSERT INTO `v_words` VALUES ('50', 'zjl1012', '张北中都坝上草原农家院', '', '1513855616', '0', null, '604');
