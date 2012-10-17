-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- 主机: localhost
-- 生成日期: 2012 年 10 月 17 日 09:56
-- 服务器版本: 5.0.51
-- PHP 版本: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- 数据库: `demo`
-- 
CREATE DATABASE `demo` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `demo`;

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_issue`
-- 

DROP TABLE IF EXISTS `tbl_issue`;
CREATE TABLE IF NOT EXISTS `tbl_issue` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(256) NOT NULL,
  `description` varchar(2000) default NULL,
  `project_id` int(11) default NULL,
  `type_id` int(11) default NULL,
  `status_id` int(11) default NULL,
  `owner_id` int(11) default NULL,
  `requester_id` int(11) default NULL,
  `create_time` datetime default NULL,
  `create_user_id` int(11) default NULL,
  `update_time` datetime default NULL,
  `update_user_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `project_id` (`project_id`),
  KEY `FK_issue_owner` (`owner_id`),
  KEY `FK_issue_requester` (`requester_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `tbl_issue`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_project`
-- 

DROP TABLE IF EXISTS `tbl_project`;
CREATE TABLE IF NOT EXISTS `tbl_project` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(128) default NULL,
  `description` text,
  `create_time` datetime default NULL,
  `create_user_id` int(11) default NULL,
  `update_time` datetime default NULL,
  `update_user_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `tbl_project`
-- 

INSERT INTO `tbl_project` VALUES (1, 'test', 'test  haha', '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00', NULL);

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_project_user_assignment`
-- 

DROP TABLE IF EXISTS `tbl_project_user_assignment`;
CREATE TABLE IF NOT EXISTS `tbl_project_user_assignment` (
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` datetime default NULL,
  `create_user_id` int(11) default NULL,
  `update_time` datetime default NULL,
  `update_user_id` int(11) default NULL,
  PRIMARY KEY  (`project_id`,`user_id`),
  KEY `FK_user_project` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `tbl_project_user_assignment`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_user`
-- 

DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id` int(11) NOT NULL auto_increment,
  `email` varchar(256) NOT NULL,
  `username` varchar(256) default NULL,
  `password` varchar(256) default NULL,
  `last_login_time` datetime default NULL,
  `create_time` datetime default NULL,
  `create_user_id` int(11) default NULL,
  `update_time` datetime default NULL,
  `update_user_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- 导出表中的数据 `tbl_user`
-- 

INSERT INTO `tbl_user` VALUES (1, 'test1@notanaddress.com', 'test', '098f6bcd4621d373cade4e832627b4f6', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tbl_user` VALUES (2, 'test2@notanaddress.com', 'Test_User_Two', 'ad0234829205b9033196ba818f7a872b', NULL, NULL, NULL, NULL, NULL);

-- 
-- 限制导出的表
-- 

-- 
-- 限制表 `tbl_issue`
-- 
ALTER TABLE `tbl_issue`
  ADD CONSTRAINT `FK_issue_owner` FOREIGN KEY (`owner_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_issue_project` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_issue_requester` FOREIGN KEY (`requester_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE;

-- 
-- 限制表 `tbl_project_user_assignment`
-- 
ALTER TABLE `tbl_project_user_assignment`
  ADD CONSTRAINT `FK_project_user` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_user_project` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE;
-- 
-- 数据库: `hong`
-- 
CREATE DATABASE `hong` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `hong`;

-- --------------------------------------------------------

-- 
-- 表的结构 `user`
-- 

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(20) NOT NULL auto_increment,
  `username` char(64) NOT NULL,
  `password` char(64) NOT NULL,
  `email` char(128) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `user`
-- 

INSERT INTO `user` VALUES (1, 'hong', '111', 'hong@live.cn');
-- 
-- 数据库: `mailuo`
-- 
CREATE DATABASE `mailuo` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `mailuo`;

-- --------------------------------------------------------

-- 
-- 表的结构 `sphinx_counter`
-- 

DROP TABLE IF EXISTS `sphinx_counter`;
CREATE TABLE IF NOT EXISTS `sphinx_counter` (
  `index` tinyint(1) unsigned NOT NULL,
  `max_id` int(1) unsigned default NULL,
  PRIMARY KEY  (`index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `sphinx_counter`
-- 

INSERT INTO `sphinx_counter` VALUES (1, 561);

-- --------------------------------------------------------

-- 
-- 表的结构 `tal_card_scan_info`
-- 

DROP TABLE IF EXISTS `tal_card_scan_info`;
CREATE TABLE IF NOT EXISTS `tal_card_scan_info` (
  `userType` char(1) NOT NULL COMMENT '0:已认领名片;1:未认领名片',
  `user_id` smallint(11) NOT NULL,
  `scan_info` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `tal_card_scan_info`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_connections`
-- 

DROP TABLE IF EXISTS `tbl_connections`;
CREATE TABLE IF NOT EXISTS `tbl_connections` (
  `id` int(11) NOT NULL,
  `fid` int(11) NOT NULL,
  `creation_ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `type` tinyint(4) default '0',
  UNIQUE KEY `UK_friendship` (`id`,`fid`),
  KEY `FK_connection_fid` (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `tbl_connections`
-- 

INSERT INTO `tbl_connections` VALUES (6, 40, '2012-09-19 16:28:44', 0);
INSERT INTO `tbl_connections` VALUES (6, 96, '2012-09-19 17:14:30', 0);
INSERT INTO `tbl_connections` VALUES (6, 130, '2012-09-19 18:32:16', 0);
INSERT INTO `tbl_connections` VALUES (6, 223, '2012-09-19 14:41:56', 0);
INSERT INTO `tbl_connections` VALUES (6, 225, '2012-09-19 18:28:28', 0);
INSERT INTO `tbl_connections` VALUES (6, 227, '2012-09-19 18:28:24', 0);
INSERT INTO `tbl_connections` VALUES (6, 232, '2012-09-19 16:30:02', 0);
INSERT INTO `tbl_connections` VALUES (40, 26, '2012-01-16 12:48:42', 0);
INSERT INTO `tbl_connections` VALUES (40, 99, '2012-08-01 13:10:25', 0);
INSERT INTO `tbl_connections` VALUES (40, 102, '2012-05-23 14:53:34', 0);
INSERT INTO `tbl_connections` VALUES (96, 6, '2012-04-09 14:04:26', 0);
INSERT INTO `tbl_connections` VALUES (96, 8, '2012-04-09 14:04:38', 0);
INSERT INTO `tbl_connections` VALUES (96, 26, '2012-04-09 14:05:00', 0);
INSERT INTO `tbl_connections` VALUES (96, 40, '2012-04-06 14:49:09', 0);
INSERT INTO `tbl_connections` VALUES (102, 7, '2012-08-06 15:13:41', 0);
INSERT INTO `tbl_connections` VALUES (102, 8, '2012-08-06 16:20:50', 0);
INSERT INTO `tbl_connections` VALUES (102, 26, '2012-05-28 11:07:58', 0);
INSERT INTO `tbl_connections` VALUES (102, 28, '2012-08-06 16:21:22', 0);
INSERT INTO `tbl_connections` VALUES (102, 40, '2012-05-28 11:07:48', 0);
INSERT INTO `tbl_connections` VALUES (102, 96, '2012-05-10 15:24:46', 0);
INSERT INTO `tbl_connections` VALUES (223, 6, '2012-09-19 14:24:14', 0);
INSERT INTO `tbl_connections` VALUES (223, 94, '2012-09-19 14:24:56', 0);
INSERT INTO `tbl_connections` VALUES (223, 96, '2012-09-19 14:32:21', 0);
INSERT INTO `tbl_connections` VALUES (223, 102, '2012-08-02 16:40:58', 0);
INSERT INTO `tbl_connections` VALUES (223, 117, '2012-09-19 14:29:21', 0);
INSERT INTO `tbl_connections` VALUES (223, 227, '2012-09-19 14:31:49', 0);
INSERT INTO `tbl_connections` VALUES (231, 26, '2012-09-11 16:50:31', 0);
INSERT INTO `tbl_connections` VALUES (231, 102, '2012-09-11 16:42:20', 0);
INSERT INTO `tbl_connections` VALUES (231, 223, '2012-09-11 16:41:18', 0);
INSERT INTO `tbl_connections` VALUES (232, 40, '2012-09-11 16:24:38', 0);
INSERT INTO `tbl_connections` VALUES (232, 92, '2012-09-11 14:59:22', 0);
INSERT INTO `tbl_connections` VALUES (232, 94, '2012-09-11 16:24:36', 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_educations`
-- 

DROP TABLE IF EXISTS `tbl_educations`;
CREATE TABLE IF NOT EXISTS `tbl_educations` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `degree` varchar(32) NOT NULL,
  `major` varchar(32) default NULL,
  `school` int(11) unsigned default '0',
  `activities` text,
  `start_year` smallint(4) unsigned default NULL,
  `start_month` tinyint(2) unsigned default '1',
  `end_year` smallint(4) unsigned default NULL,
  `end_month` tinyint(2) unsigned default '12',
  PRIMARY KEY  (`id`),
  KEY `FK_educations_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

-- 
-- 导出表中的数据 `tbl_educations`
-- 

INSERT INTO `tbl_educations` VALUES (1, 6, '本科', 'computer', 1, NULL, NULL, 1, NULL, 12);
INSERT INTO `tbl_educations` VALUES (2, 8, '本科', 'computer', 1, NULL, NULL, 1, NULL, 12);
INSERT INTO `tbl_educations` VALUES (3, 8, '本科', '会计', 1, NULL, NULL, 1, NULL, 12);
INSERT INTO `tbl_educations` VALUES (5, 40, '本生', '计算机', 2343, '', 1996, 3, 1996, 4);
INSERT INTO `tbl_educations` VALUES (7, 102, '本科', '计算机科学与技术', 1198, '', 2005, 9, 2010, 6);
INSERT INTO `tbl_educations` VALUES (18, 40, '学历 本科f', '', 11, '', 0, 1, 0, 12);
INSERT INTO `tbl_educations` VALUES (23, 223, '本科', '计算机', 1, NULL, 2005, 8, 2010, 8);
INSERT INTO `tbl_educations` VALUES (24, 102, '本科', '计算机', 2, NULL, 2012, 1, 2012, 1);
INSERT INTO `tbl_educations` VALUES (25, 225, '本科', '计算机科学与技术', 651, '', 2003, 9, 2007, 6);

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_email_validate`
-- 

DROP TABLE IF EXISTS `tbl_email_validate`;
CREATE TABLE IF NOT EXISTS `tbl_email_validate` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `auth_code` varchar(50) NOT NULL,
  `subject` varchar(100) default NULL,
  `message` text,
  `user_validate_type` char(1) default NULL COMMENT '用户是否成功验证：1，成功验证；0，验证失败',
  `validate_type` smallint(6) NOT NULL COMMENT '邮箱验证类型：1，绑定邮箱；2，取回密码；',
  `creation_ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- 
-- 导出表中的数据 `tbl_email_validate`
-- 

INSERT INTO `tbl_email_validate` VALUES (1, 93, 'oday0311@hotmail.com', '1CM5DAygHUxw', '验证激活邮箱-脉络', '				<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">\n				<html>\n				<head>\n				<title> New Document </title>\n				<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />\n				<meta name="Generator" content="EditPlus">\n				<meta name="Author" content="">\n				</head>\n				<body>\n				点击链接<a href=''http://219.237.242.71/site/ValidateEmail?code=1CM5DAygHUxw_93_1''>http://219.237.242.71/site/ValidateEmail?code=1CM5DAygHUxw_93_1</a>验证激活邮箱，如不能点击，请将地址复制到浏览器的地址栏。\n				</body>\n				</html>', NULL, 1, '2012-02-16 11:02:08');
INSERT INTO `tbl_email_validate` VALUES (2, 95, 'mokmoth@gmail.com', 'EFFSsoGnmgWr', '验证激活邮箱-脉络', '				<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">\n				<html>\n				<head>\n				<title> New Document </title>\n				<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />\n				<meta name="Generator" content="EditPlus">\n				<meta name="Author" content="">\n				</head>\n				<body>\n				点击链接<a href=''http://219.237.242.71/site/ValidateEmail?code=EFFSsoGnmgWr_95_1''>http://219.237.242.71/site/ValidateEmail?code=EFFSsoGnmgWr_95_1</a>验证激活邮箱，如不能点击，请将地址复制到浏览器的地址栏。\n				</body>\n				</html>', NULL, 1, '2012-03-02 15:05:11');
INSERT INTO `tbl_email_validate` VALUES (3, 96, 'yalunguo@163.com', 'dr2P0C58OW87', '验证激活邮箱-脉络', '				<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">\n				<html>\n				<head>\n				<title> New Document </title>\n				<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />\n				<meta name="Generator" content="EditPlus">\n				<meta name="Author" content="">\n				</head>\n				<body>\n				点击链接<a href=''http://219.237.242.71/site/ValidateEmail?code=dr2P0C58OW87_96_1''>http://219.237.242.71/site/ValidateEmail?code=dr2P0C58OW87_96_1</a>验证激活邮箱，如不能点击，请将地址复制到浏览器的地址栏。\n				</body>\n				</html>', NULL, 1, '2012-03-05 11:52:54');
INSERT INTO `tbl_email_validate` VALUES (4, 98, 'song.yang@theindex.com', 'cX2z6dMKSdVD', '绑定邮箱-脉络', '				<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">\n				<html>\n				<head>\n				<title> New Document </title>\n				<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />\n				<meta name="Generator" content="EditPlus">\n				<meta name="Author" content="">\n				</head>\n				<body>\n				点击链接<a href="http://219.237.242.71/setting/ValidateEmail?code=cX2z6dMKSdVD_98_1">http://219.237.242.71/setting/ValidateEmail?code=cX2z6dMKSdVD_98_1</a>绑定邮箱，如不能点击，请将地址复制到浏览器的地址栏。\n				</body>\n				</html>', NULL, 1, '2012-03-12 16:47:22');
INSERT INTO `tbl_email_validate` VALUES (5, 99, '333@33.com', 'B9P3qZ1WUAsQ', '激活账号-脉络', '			<!DOCTYPE HTML>\n			<html>\n			<head>\n			<title> New Document </title>\n			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />\n			</head>\n			<body>\n			点击链接<a href="http://219.237.242.71/setting/ValidateEmail?code=B9P3qZ1WUAsQ_99_5">http://219.237.242.71/setting/ValidateEmail?code=B9P3qZ1WUAsQ_99_5</a>激活账号，如不能点击，请将地址复制到浏览器的地址栏。\n			</body>\n			</html>', NULL, 5, '2012-04-20 12:27:50');
INSERT INTO `tbl_email_validate` VALUES (6, 100, '333@33.com', '0xDp2EgCwKe1', '激活账号-脉络', '			<!DOCTYPE HTML>\n			<html>\n			<head>\n			<title> New Document </title>\n			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />\n			</head>\n			<body>\n			点击链接<a href="http://219.237.242.71/setting/ValidateEmail?code=0xDp2EgCwKe1_100_5">http://219.237.242.71/setting/ValidateEmail?code=0xDp2EgCwKe1_100_5</a>激活账号，如不能点击，请将地址复制到浏览器的地址栏。\n			</body>\n			</html>', NULL, 5, '2012-04-20 12:42:16');

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_emails`
-- 

DROP TABLE IF EXISTS `tbl_emails`;
CREATE TABLE IF NOT EXISTS `tbl_emails` (
  `user_id` int(11) NOT NULL,
  `email` varchar(32) NOT NULL default '',
  `type` varchar(10) NOT NULL COMMENT 'Home,Work',
  `verified` tinyint(1) unsigned default '0',
  KEY `IDX_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `tbl_emails`
-- 

INSERT INTO `tbl_emails` VALUES (91, 'bbkliulei@gmail.com', '', 0);
INSERT INTO `tbl_emails` VALUES (8, '605170218@qq.com', '', 0);
INSERT INTO `tbl_emails` VALUES (93, 'oday0311@hotmail.com', '', 0);
INSERT INTO `tbl_emails` VALUES (94, 'oday0311@hotmail.com', '', 0);
INSERT INTO `tbl_emails` VALUES (95, 'mokmoth@gmail.com', '', 0);
INSERT INTO `tbl_emails` VALUES (96, 'yalunguo@163.com', '', 0);
INSERT INTO `tbl_emails` VALUES (98, 'song.yang@theindex.com', '', 0);
INSERT INTO `tbl_emails` VALUES (99, '333@33.com', '', 0);
INSERT INTO `tbl_emails` VALUES (145, 'sdfjsd@gmail.com', '', 0);
INSERT INTO `tbl_emails` VALUES (40, 'bbkliulei@gmail.com', 'Home', 0);
INSERT INTO `tbl_emails` VALUES (226, 'oday0311@gmail.com', 'Work', 0);
INSERT INTO `tbl_emails` VALUES (227, 'aa@theindex.com', 'Work', 0);
INSERT INTO `tbl_emails` VALUES (231, 'coffe6591217@yahoo.cn', 'Work', 0);
INSERT INTO `tbl_emails` VALUES (232, 'hukely@theindex.com', 'Work', 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_feed`
-- 

DROP TABLE IF EXISTS `tbl_feed`;
CREATE TABLE IF NOT EXISTS `tbl_feed` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `type` tinyint(2) unsigned NOT NULL default '0',
  `profile_name` varchar(50) NOT NULL default '',
  `content` text NOT NULL,
  `creation_ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `FK_feed_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

-- 
-- 导出表中的数据 `tbl_feed`
-- 

INSERT INTO `tbl_feed` VALUES (4, 40, 4, '', '{"id":"562","name":"liulei003"}', '2012-03-05 18:07:51');
INSERT INTO `tbl_feed` VALUES (5, 40, 4, '', '{"id":"562","name":"liulei003"}', '2012-03-05 18:07:51');
INSERT INTO `tbl_feed` VALUES (6, 6, 5, '', '{"id":"25","name":"\\u5f20    \\u4f1f"}', '2012-03-12 17:31:27');
INSERT INTO `tbl_feed` VALUES (7, 6, 5, '', '{"id":"25","name":"\\u5f20    \\u4f1f"}', '2012-03-12 17:32:01');
INSERT INTO `tbl_feed` VALUES (8, 40, 4, '', '{"id":"563","name":"liulei003"}', '2012-03-12 17:32:24');
INSERT INTO `tbl_feed` VALUES (9, 40, 4, '', '{"id":"563","name":"liulei003"}', '2012-03-12 17:32:25');
INSERT INTO `tbl_feed` VALUES (10, 91, 3, '', '{"id":"563","name":"liulei003"}', '2012-03-12 17:35:26');
INSERT INTO `tbl_feed` VALUES (11, 91, 5, '', '{"id":"563","name":"liulei003"}', '2012-03-12 17:37:06');
INSERT INTO `tbl_feed` VALUES (12, 40, 5, '', '{"id":"563","name":"liulei003"}', '2012-03-12 17:37:25');
INSERT INTO `tbl_feed` VALUES (13, 40, 5, '', '{"id":"563","name":"liulei003"}', '2012-03-12 17:38:19');
INSERT INTO `tbl_feed` VALUES (14, 6, 5, '', '{"id":"29","name":"\\u82d7\\u5148\\u751f"}', '2012-03-14 15:05:27');
INSERT INTO `tbl_feed` VALUES (15, 91, 3, '', '{"id":"560","name":"\\u5468\\u5c0f\\u59d0"}', '2012-03-14 15:38:23');
INSERT INTO `tbl_feed` VALUES (16, 91, 4, '', '{"id":"566","name":"\\u6211\\u662f\\u96f7\\u950b"}', '2012-03-14 15:45:43');
INSERT INTO `tbl_feed` VALUES (17, 91, 4, '', '{"id":"566","name":"\\u6211\\u662f\\u96f7\\u950b"}', '2012-03-14 15:45:43');
INSERT INTO `tbl_feed` VALUES (18, 91, 4, '', '{"id":"567","name":"\\u6211\\u662f\\u96f7\\u950b"}', '2012-03-14 15:47:05');
INSERT INTO `tbl_feed` VALUES (19, 91, 4, '', '{"id":"567","name":"\\u6211\\u662f\\u96f7\\u950b"}', '2012-03-14 15:47:05');
INSERT INTO `tbl_feed` VALUES (20, 6, 5, '', '{"id":"26","name":"\\u97e9    \\u5f71"}', '2012-03-19 12:00:42');
INSERT INTO `tbl_feed` VALUES (21, 40, 6, '', '{"id":"8","name":"\\u7a0b\\u5e8f\\u5458\\u5929\\u4e0b"}', '2012-03-19 12:00:57');
INSERT INTO `tbl_feed` VALUES (22, 40, 6, '', '{"id":"6","name":"Ray Liu"}', '2012-03-26 11:41:10');
INSERT INTO `tbl_feed` VALUES (23, 96, 6, '', '{"id":"40","name":"bbkliuleibbk"}', '2012-04-06 14:49:10');
INSERT INTO `tbl_feed` VALUES (24, 96, 6, '', '{"id":"6","name":"Ray Liu"}', '2012-04-09 14:04:26');
INSERT INTO `tbl_feed` VALUES (25, 96, 6, '', '{"id":"8","name":"\\u7a0b\\u5e8f\\u5458\\u5929\\u4e0b"}', '2012-04-09 14:04:38');
INSERT INTO `tbl_feed` VALUES (26, 96, 6, '', '{"id":"26","name":"\\u5218\\u96f7\\u554a26"}', '2012-04-09 14:05:01');
INSERT INTO `tbl_feed` VALUES (27, 102, 3, '', '{"id":"563","name":"liulei003"}', '2012-05-10 15:29:10');
INSERT INTO `tbl_feed` VALUES (28, 102, 3, '', '{"id":"564","name":"\\u96f7\\u950b\\u554a"}', '2012-07-06 16:40:46');
INSERT INTO `tbl_feed` VALUES (29, 102, 3, '', '{"id":"1","name":"alex"}', '2012-07-06 16:40:59');
INSERT INTO `tbl_feed` VALUES (30, 40, 3, '', '{"id":"114","name":"\\u6768\\u5170\\u6c5f"}', '2012-07-06 17:48:23');
INSERT INTO `tbl_feed` VALUES (31, 102, 3, '', '{"id":"114","name":"\\u6768\\u5170\\u6c5f"}', '2012-07-06 17:50:29');
INSERT INTO `tbl_feed` VALUES (32, 6, 5, '', '{"id":"134","name":"\\u8c22\\u4ea6\\u51b0"}', '2012-07-06 17:57:01');
INSERT INTO `tbl_feed` VALUES (33, 102, 5, '', '{"id":"134","name":"\\u8c22\\u4ea6\\u51b0"}', '2012-07-06 17:57:01');
INSERT INTO `tbl_feed` VALUES (34, 6, 5, '', '{"id":"134","name":"\\u8c22\\u4ea6\\u51b0"}', '2012-07-06 17:57:19');
INSERT INTO `tbl_feed` VALUES (35, 102, 3, '', '{"id":"210","name":"\\u5434\\u6653\\u5149"}', '2012-07-27 17:08:16');
INSERT INTO `tbl_feed` VALUES (36, 102, 3, '', '{"id":"297","name":"\\u9648\\u957f\\u6c5f"}', '2012-07-27 17:08:42');

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_feed_connections`
-- 

DROP TABLE IF EXISTS `tbl_feed_connections`;
CREATE TABLE IF NOT EXISTS `tbl_feed_connections` (
  `feed_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  UNIQUE KEY `UK_feedid_userid` (`feed_id`,`user_id`),
  KEY `FK_feed_connections_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `tbl_feed_connections`
-- 

INSERT INTO `tbl_feed_connections` VALUES (4, 7);
INSERT INTO `tbl_feed_connections` VALUES (5, 7);
INSERT INTO `tbl_feed_connections` VALUES (4, 8);
INSERT INTO `tbl_feed_connections` VALUES (5, 8);
INSERT INTO `tbl_feed_connections` VALUES (4, 26);
INSERT INTO `tbl_feed_connections` VALUES (5, 26);
INSERT INTO `tbl_feed_connections` VALUES (6, 40);
INSERT INTO `tbl_feed_connections` VALUES (7, 40);
INSERT INTO `tbl_feed_connections` VALUES (11, 40);
INSERT INTO `tbl_feed_connections` VALUES (12, 40);
INSERT INTO `tbl_feed_connections` VALUES (13, 40);
INSERT INTO `tbl_feed_connections` VALUES (14, 40);
INSERT INTO `tbl_feed_connections` VALUES (20, 40);
INSERT INTO `tbl_feed_connections` VALUES (22, 40);
INSERT INTO `tbl_feed_connections` VALUES (30, 40);
INSERT INTO `tbl_feed_connections` VALUES (12, 91);
INSERT INTO `tbl_feed_connections` VALUES (13, 91);
INSERT INTO `tbl_feed_connections` VALUES (23, 96);
INSERT INTO `tbl_feed_connections` VALUES (24, 96);
INSERT INTO `tbl_feed_connections` VALUES (25, 96);
INSERT INTO `tbl_feed_connections` VALUES (26, 96);
INSERT INTO `tbl_feed_connections` VALUES (27, 102);
INSERT INTO `tbl_feed_connections` VALUES (28, 102);
INSERT INTO `tbl_feed_connections` VALUES (29, 102);
INSERT INTO `tbl_feed_connections` VALUES (31, 102);
INSERT INTO `tbl_feed_connections` VALUES (34, 102);
INSERT INTO `tbl_feed_connections` VALUES (35, 102);
INSERT INTO `tbl_feed_connections` VALUES (36, 102);
INSERT INTO `tbl_feed_connections` VALUES (11, 130);
INSERT INTO `tbl_feed_connections` VALUES (21, 130);
INSERT INTO `tbl_feed_connections` VALUES (33, 130);

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_im_accounts`
-- 

DROP TABLE IF EXISTS `tbl_im_accounts`;
CREATE TABLE IF NOT EXISTS `tbl_im_accounts` (
  `user_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `account` varchar(20) NOT NULL,
  KEY `FK_im_account_user_id` (`user_id`),
  KEY `IDX_im_account` (`type`,`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `tbl_im_accounts`
-- 

INSERT INTO `tbl_im_accounts` VALUES (102, 'QQ', '421384209');

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_industry`
-- 

DROP TABLE IF EXISTS `tbl_industry`;
CREATE TABLE IF NOT EXISTS `tbl_industry` (
  `name` varchar(16) NOT NULL,
  `pid` smallint(2) unsigned NOT NULL,
  `cid` smallint(2) unsigned NOT NULL,
  PRIMARY KEY  (`pid`,`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `tbl_industry`
-- 

INSERT INTO `tbl_industry` VALUES ('高新技术', 0, 1);
INSERT INTO `tbl_industry` VALUES ('人事招聘', 0, 2);
INSERT INTO `tbl_industry` VALUES ('金融财务', 0, 3);
INSERT INTO `tbl_industry` VALUES ('广告公关', 0, 4);
INSERT INTO `tbl_industry` VALUES ('媒体', 0, 5);
INSERT INTO `tbl_industry` VALUES ('文化艺术', 0, 6);
INSERT INTO `tbl_industry` VALUES ('企业服务', 0, 7);
INSERT INTO `tbl_industry` VALUES ('法律', 0, 8);
INSERT INTO `tbl_industry` VALUES ('消费品', 0, 9);
INSERT INTO `tbl_industry` VALUES ('餐饮，旅游，娱乐，体育', 0, 10);
INSERT INTO `tbl_industry` VALUES ('服务业', 0, 11);
INSERT INTO `tbl_industry` VALUES ('教育 科研', 0, 12);
INSERT INTO `tbl_industry` VALUES ('房地产，建筑，装潢', 0, 13);
INSERT INTO `tbl_industry` VALUES ('运输物流', 0, 14);
INSERT INTO `tbl_industry` VALUES ('医疗保健', 0, 15);
INSERT INTO `tbl_industry` VALUES ('制造加工业', 0, 16);
INSERT INTO `tbl_industry` VALUES ('农林牧渔业', 0, 17);
INSERT INTO `tbl_industry` VALUES ('政府公共事业机构', 0, 18);
INSERT INTO `tbl_industry` VALUES ('非盈利机构/协会/社团', 0, 19);
INSERT INTO `tbl_industry` VALUES ('其他', 0, 20);
INSERT INTO `tbl_industry` VALUES ('互联网/电子商务', 1, 1);
INSERT INTO `tbl_industry` VALUES ('计算机(软件/硬件/网络)', 1, 2);
INSERT INTO `tbl_industry` VALUES ('IT咨询与系统集成', 1, 3);
INSERT INTO `tbl_industry` VALUES ('通讯/电信', 1, 4);
INSERT INTO `tbl_industry` VALUES ('移动增值服务', 1, 5);
INSERT INTO `tbl_industry` VALUES ('游戏', 1, 6);
INSERT INTO `tbl_industry` VALUES ('半导体', 1, 7);
INSERT INTO `tbl_industry` VALUES ('生物科技', 1, 8);
INSERT INTO `tbl_industry` VALUES ('纳米科技', 1, 9);
INSERT INTO `tbl_industry` VALUES ('国防', 1, 10);
INSERT INTO `tbl_industry` VALUES ('猎头与招聘服务', 2, 1);
INSERT INTO `tbl_industry` VALUES ('企业内人事/招聘', 2, 2);
INSERT INTO `tbl_industry` VALUES ('风险投资/私人投资', 3, 1);
INSERT INTO `tbl_industry` VALUES ('投资银行', 3, 2);
INSERT INTO `tbl_industry` VALUES ('银行', 3, 3);
INSERT INTO `tbl_industry` VALUES ('保险', 3, 4);
INSERT INTO `tbl_industry` VALUES ('理财与财务服务', 3, 5);
INSERT INTO `tbl_industry` VALUES ('金融', 3, 6);
INSERT INTO `tbl_industry` VALUES ('会计/审计/税务', 3, 7);
INSERT INTO `tbl_industry` VALUES ('证券/基金', 3, 8);
INSERT INTO `tbl_industry` VALUES ('广告', 4, 1);
INSERT INTO `tbl_industry` VALUES ('公关', 4, 2);
INSERT INTO `tbl_industry` VALUES ('市场推广', 4, 3);
INSERT INTO `tbl_industry` VALUES ('广播电视', 5, 1);
INSERT INTO `tbl_industry` VALUES ('报纸杂志', 5, 2);
INSERT INTO `tbl_industry` VALUES ('出版/印刷', 5, 3);
INSERT INTO `tbl_industry` VALUES ('网络媒体', 5, 4);
INSERT INTO `tbl_industry` VALUES ('媒体制作', 5, 5);
INSERT INTO `tbl_industry` VALUES ('影视戏剧', 6, 1);
INSERT INTO `tbl_industry` VALUES ('工艺美术', 6, 2);
INSERT INTO `tbl_industry` VALUES ('表演艺术', 6, 3);
INSERT INTO `tbl_industry` VALUES ('音乐', 6, 4);
INSERT INTO `tbl_industry` VALUES ('文学', 6, 5);
INSERT INTO `tbl_industry` VALUES ('摄影', 6, 6);
INSERT INTO `tbl_industry` VALUES ('博物馆/文化机构', 6, 7);
INSERT INTO `tbl_industry` VALUES ('管理咨询', 7, 1);
INSERT INTO `tbl_industry` VALUES ('市场调研', 7, 2);
INSERT INTO `tbl_industry` VALUES ('职业培训', 7, 3);
INSERT INTO `tbl_industry` VALUES ('会展服务', 7, 4);
INSERT INTO `tbl_industry` VALUES ('法律', 8, 1);
INSERT INTO `tbl_industry` VALUES ('服装服饰', 8, 2);
INSERT INTO `tbl_industry` VALUES ('体育用品', 8, 3);
INSERT INTO `tbl_industry` VALUES ('烟草业', 8, 4);
INSERT INTO `tbl_industry` VALUES ('食品加工', 8, 5);
INSERT INTO `tbl_industry` VALUES ('酒制品/饮料', 8, 6);
INSERT INTO `tbl_industry` VALUES ('家电/电器', 8, 7);
INSERT INTO `tbl_industry` VALUES ('日用品', 8, 8);
INSERT INTO `tbl_industry` VALUES ('家具', 8, 9);
INSERT INTO `tbl_industry` VALUES ('零售业', 8, 10);
INSERT INTO `tbl_industry` VALUES ('批发业', 8, 11);
INSERT INTO `tbl_industry` VALUES ('进出口', 8, 12);
INSERT INTO `tbl_industry` VALUES ('珠宝', 8, 13);
INSERT INTO `tbl_industry` VALUES ('办公设备/用品', 8, 14);
INSERT INTO `tbl_industry` VALUES ('休闲娱乐', 10, 1);
INSERT INTO `tbl_industry` VALUES ('运动/体育', 10, 2);
INSERT INTO `tbl_industry` VALUES ('旅游业', 10, 3);
INSERT INTO `tbl_industry` VALUES ('餐饮业', 10, 4);
INSERT INTO `tbl_industry` VALUES ('休闲设施与服务', 10, 5);
INSERT INTO `tbl_industry` VALUES ('酒店/旅馆', 10, 6);
INSERT INTO `tbl_industry` VALUES ('中介服务业(房地产/留学', 11, 1);
INSERT INTO `tbl_industry` VALUES ('翻译', 11, 2);
INSERT INTO `tbl_industry` VALUES ('家政服务', 11, 3);
INSERT INTO `tbl_industry` VALUES ('租赁服务', 11, 4);
INSERT INTO `tbl_industry` VALUES ('幼儿教育', 12, 1);
INSERT INTO `tbl_industry` VALUES ('中小学教育', 12, 2);
INSERT INTO `tbl_industry` VALUES ('高等教育', 12, 3);
INSERT INTO `tbl_industry` VALUES ('成人教育', 12, 4);
INSERT INTO `tbl_industry` VALUES ('远程教育', 12, 5);
INSERT INTO `tbl_industry` VALUES ('科研机构', 12, 6);
INSERT INTO `tbl_industry` VALUES ('房地产', 13, 1);
INSERT INTO `tbl_industry` VALUES ('建筑设计/工程', 13, 2);
INSERT INTO `tbl_industry` VALUES ('建材', 13, 3);
INSERT INTO `tbl_industry` VALUES ('室内设计/装潢', 13, 4);
INSERT INTO `tbl_industry` VALUES ('物流/供应链', 14, 1);
INSERT INTO `tbl_industry` VALUES ('运输(公路，铁路，水运)', 14, 2);
INSERT INTO `tbl_industry` VALUES ('仓储服务', 14, 3);
INSERT INTO `tbl_industry` VALUES ('航空客运/货运', 14, 4);
INSERT INTO `tbl_industry` VALUES ('邮政/包裹/零担货运', 14, 5);
INSERT INTO `tbl_industry` VALUES ('客运及城市公共交通', 14, 6);
INSERT INTO `tbl_industry` VALUES ('心理咨询', 15, 1);
INSERT INTO `tbl_industry` VALUES ('医院', 15, 2);
INSERT INTO `tbl_industry` VALUES ('制药', 15, 3);
INSERT INTO `tbl_industry` VALUES ('兽医', 15, 4);
INSERT INTO `tbl_industry` VALUES ('医疗保健服务', 15, 5);
INSERT INTO `tbl_industry` VALUES ('医疗设备', 15, 6);
INSERT INTO `tbl_industry` VALUES ('航空航天', 16, 1);
INSERT INTO `tbl_industry` VALUES ('汽车及零部件', 16, 2);
INSERT INTO `tbl_industry` VALUES ('化工', 16, 3);
INSERT INTO `tbl_industry` VALUES ('电力/电气', 16, 4);
INSERT INTO `tbl_industry` VALUES ('石油能源', 16, 5);
INSERT INTO `tbl_industry` VALUES ('纺织品', 16, 6);
INSERT INTO `tbl_industry` VALUES ('机械/机电/重工业制造', 16, 7);
INSERT INTO `tbl_industry` VALUES ('工业自动化/仪器仪表', 16, 8);
INSERT INTO `tbl_industry` VALUES ('采掘冶炼', 16, 9);
INSERT INTO `tbl_industry` VALUES ('农业', 17, 1);
INSERT INTO `tbl_industry` VALUES ('林业', 17, 2);
INSERT INTO `tbl_industry` VALUES ('畜牧业', 17, 3);
INSERT INTO `tbl_industry` VALUES ('渔业', 17, 4);
INSERT INTO `tbl_industry` VALUES ('政府/司法/军事机构', 18, 1);
INSERT INTO `tbl_industry` VALUES ('公共事业机构', 18, 2);
INSERT INTO `tbl_industry` VALUES ('非盈利机构', 19, 1);
INSERT INTO `tbl_industry` VALUES ('慈善机构', 19, 2);
INSERT INTO `tbl_industry` VALUES ('协会/学会', 19, 3);
INSERT INTO `tbl_industry` VALUES ('社团/俱乐部', 19, 4);
INSERT INTO `tbl_industry` VALUES ('其他', 20, 1);

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_local_accounts`
-- 

DROP TABLE IF EXISTS `tbl_local_accounts`;
CREATE TABLE IF NOT EXISTS `tbl_local_accounts` (
  `id` int(11) NOT NULL auto_increment,
  `account` varchar(64) NOT NULL,
  `password` char(32) NOT NULL,
  `status` tinyint(4) default '0',
  `creation_ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `lastlogin_ts` timestamp NULL default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `UK_account` (`account`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=233 ;

-- 
-- 导出表中的数据 `tbl_local_accounts`
-- 

INSERT INTO `tbl_local_accounts` VALUES (6, 'test', '5ef424347acab1ed291a4503563d79e0', 1, '2011-11-08 13:25:54', '2012-10-16 07:14:27');
INSERT INTO `tbl_local_accounts` VALUES (7, 'test1', '5ef424347acab1ed291a4503563d79e0', 1, '2011-11-08 13:39:10', '2012-09-11 09:10:35');
INSERT INTO `tbl_local_accounts` VALUES (8, '1835480275_Sina', '87125cce0c7d6d3eda68dd9d59914c71', 0, '2011-11-08 15:37:33', NULL);
INSERT INTO `tbl_local_accounts` VALUES (26, 'bbkliulei_TencentWeibo', 'a7cc9ed4c8fcd4658e181b537819ca61', 0, '2011-11-22 12:59:07', NULL);
INSERT INTO `tbl_local_accounts` VALUES (28, 'D29572FA181AD8A1EA720CAE561F57FE_QQ', '2871adccb8549d5dc66097c4bebd93af', 0, '2011-11-23 11:49:55', NULL);
INSERT INTO `tbl_local_accounts` VALUES (31, '70811514_Kaixin', '0725f619f2f8364c6c840a98d1e1f607', 0, '2011-11-23 15:40:59', NULL);
INSERT INTO `tbl_local_accounts` VALUES (40, 'liulei', '1f2c6f20d493cd40c290ab07ae437b3c', 1, '2011-11-24 17:35:36', '2012-08-27 17:34:04');
INSERT INTO `tbl_local_accounts` VALUES (90, '13341166120_Phone', 'b894349ae3e458d44726824dac876d00', 1, '2011-12-22 16:22:56', NULL);
INSERT INTO `tbl_local_accounts` VALUES (91, 'bbkliulei@gmail.com', '202cb962ac59075b964b07152d234b70', 1, '2012-01-06 13:50:58', '2012-06-01 11:25:02');
INSERT INTO `tbl_local_accounts` VALUES (92, '1718627094_sina', '7fd8961b93a5c565ca0a6c69e3f6a7e4', 1, '2012-01-09 17:32:58', '2012-08-27 17:34:41');
INSERT INTO `tbl_local_accounts` VALUES (93, 'oday0311@hotmail.com', '202cb962ac59075b964b07152d234b70', 1, '2012-02-16 11:02:08', '2012-05-09 14:51:51');
INSERT INTO `tbl_local_accounts` VALUES (94, '13911650018', 'e10adc3949ba59abbe56e057f20f883e', 1, '2012-02-16 16:25:19', '2012-08-09 11:33:57');
INSERT INTO `tbl_local_accounts` VALUES (95, 'mokmoth@gmail.com', '202cb962ac59075b964b07152d234b70', 1, '2012-03-02 15:05:11', '2012-06-01 11:43:31');
INSERT INTO `tbl_local_accounts` VALUES (96, 'yalunguo@163.com', '202cb962ac59075b964b07152d234b70', 1, '2012-03-05 11:52:54', '2012-04-18 13:53:41');
INSERT INTO `tbl_local_accounts` VALUES (97, '2486500745_Sina', '0abd8aa34cd283ed0128bf1ebcdf81e2', 0, '2012-03-05 15:18:26', '2012-03-05 15:18:26');
INSERT INTO `tbl_local_accounts` VALUES (98, 'song.yang@theindex.com', '2aa27aa594a76fad69ef9ba39ccb173f', 1, '2012-03-12 16:47:22', NULL);
INSERT INTO `tbl_local_accounts` VALUES (99, '333@33.com', '202cb962ac59075b964b07152d234b70', 1, '2012-04-20 12:27:49', '2012-05-09 14:57:14');
INSERT INTO `tbl_local_accounts` VALUES (102, '18601140270', 'f1887d3f9e6ee7a32fe5e76f4ab80d63', 1, '2012-05-04 14:45:50', '2012-08-24 00:31:29');
INSERT INTO `tbl_local_accounts` VALUES (117, '1620329427_sina', '7704dc2bceff8a23e5e8eac7ee1ae00a', 0, '2012-05-16 16:15:43', '2012-07-24 14:14:08');
INSERT INTO `tbl_local_accounts` VALUES (130, '13366576525', 'e10adc3949ba59abbe56e057f20f883e', 1, '2012-05-18 17:59:33', '2012-08-27 14:39:32');
INSERT INTO `tbl_local_accounts` VALUES (144, '1448980132_sina', '295ad32760a824267f89b4c533a69476', 0, '2012-06-01 15:52:51', '2012-08-21 15:17:37');
INSERT INTO `tbl_local_accounts` VALUES (145, 'sdfjsd@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, '2012-06-04 10:29:33', NULL);
INSERT INTO `tbl_local_accounts` VALUES (223, 'a', '5ef424347acab1ed291a4503563d79e0', 1, '2012-08-02 16:39:15', '2012-09-19 06:34:56');
INSERT INTO `tbl_local_accounts` VALUES (224, '65e3c22f0e7719c9e46289212365d2e5_qq', 'b9294832570675d6232ab25ef173cd17', 0, '2012-08-03 19:15:17', '2012-08-03 19:15:17');
INSERT INTO `tbl_local_accounts` VALUES (225, '1817580490_sina', '5f6737756059b726e573b6e467221b04', 0, '2012-08-13 17:52:43', '2012-08-23 11:40:50');
INSERT INTO `tbl_local_accounts` VALUES (226, 'oday0311@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0, '2012-08-21 13:53:27', NULL);
INSERT INTO `tbl_local_accounts` VALUES (227, 'aa@theindex.com', 'e10adc3949ba59abbe56e057f20f883e', 0, '2012-08-23 11:06:51', NULL);
INSERT INTO `tbl_local_accounts` VALUES (228, '1673695635_sina', 'ffa395d8bf3799896cceb974b5b7e78f', 0, '2012-08-28 15:16:28', '2012-09-19 10:00:24');
INSERT INTO `tbl_local_accounts` VALUES (229, 'huhongfeiwin_sina', 'f68d77be263ffd5f001482b3bea4c524', 0, '2012-08-30 10:13:35', '2012-08-30 02:13:35');
INSERT INTO `tbl_local_accounts` VALUES (230, 'huhongfeiwin_tencentweibo', '8a8bbadb6fd9b80daa4e6a7851ba59ea', 0, '2012-08-30 11:22:06', '2012-08-30 06:45:18');
INSERT INTO `tbl_local_accounts` VALUES (231, 'coffe6591217@yahoo.cn', '5ef424347acab1ed291a4503563d79e0', 1, '2012-08-31 16:10:44', '2012-09-11 08:32:05');
INSERT INTO `tbl_local_accounts` VALUES (232, 'hukely@theindex.com', '5ef424347acab1ed291a4503563d79e0', 1, '2012-09-10 17:07:05', '2012-09-11 05:39:12');

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_locations`
-- 

DROP TABLE IF EXISTS `tbl_locations`;
CREATE TABLE IF NOT EXISTS `tbl_locations` (
  `name` varchar(26) NOT NULL,
  `pid` smallint(2) unsigned NOT NULL,
  `cid` smallint(3) unsigned NOT NULL,
  PRIMARY KEY  (`pid`,`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `tbl_locations`
-- 

INSERT INTO `tbl_locations` VALUES ('安徽', 0, 1);
INSERT INTO `tbl_locations` VALUES ('北京', 0, 2);
INSERT INTO `tbl_locations` VALUES ('重庆', 0, 3);
INSERT INTO `tbl_locations` VALUES ('福建', 0, 4);
INSERT INTO `tbl_locations` VALUES ('甘肃', 0, 5);
INSERT INTO `tbl_locations` VALUES ('广东', 0, 6);
INSERT INTO `tbl_locations` VALUES ('广西', 0, 7);
INSERT INTO `tbl_locations` VALUES ('贵州', 0, 8);
INSERT INTO `tbl_locations` VALUES ('海南', 0, 9);
INSERT INTO `tbl_locations` VALUES ('河北', 0, 10);
INSERT INTO `tbl_locations` VALUES ('黑龙江', 0, 11);
INSERT INTO `tbl_locations` VALUES ('河南', 0, 12);
INSERT INTO `tbl_locations` VALUES ('湖北', 0, 13);
INSERT INTO `tbl_locations` VALUES ('湖南', 0, 14);
INSERT INTO `tbl_locations` VALUES ('内蒙古', 0, 15);
INSERT INTO `tbl_locations` VALUES ('江苏', 0, 16);
INSERT INTO `tbl_locations` VALUES ('江西', 0, 17);
INSERT INTO `tbl_locations` VALUES ('吉林', 0, 18);
INSERT INTO `tbl_locations` VALUES ('辽宁', 0, 19);
INSERT INTO `tbl_locations` VALUES ('宁夏', 0, 20);
INSERT INTO `tbl_locations` VALUES ('青海', 0, 21);
INSERT INTO `tbl_locations` VALUES ('山西', 0, 22);
INSERT INTO `tbl_locations` VALUES ('山东', 0, 23);
INSERT INTO `tbl_locations` VALUES ('上海', 0, 24);
INSERT INTO `tbl_locations` VALUES ('四川', 0, 25);
INSERT INTO `tbl_locations` VALUES ('天津', 0, 26);
INSERT INTO `tbl_locations` VALUES ('西藏', 0, 27);
INSERT INTO `tbl_locations` VALUES ('新疆', 0, 28);
INSERT INTO `tbl_locations` VALUES ('云南', 0, 29);
INSERT INTO `tbl_locations` VALUES ('浙江', 0, 30);
INSERT INTO `tbl_locations` VALUES ('陕西', 0, 31);
INSERT INTO `tbl_locations` VALUES ('台湾', 0, 32);
INSERT INTO `tbl_locations` VALUES ('香港', 0, 33);
INSERT INTO `tbl_locations` VALUES ('澳门', 0, 34);
INSERT INTO `tbl_locations` VALUES ('海外', 0, 35);
INSERT INTO `tbl_locations` VALUES ('合肥', 1, 1);
INSERT INTO `tbl_locations` VALUES ('芜湖', 1, 2);
INSERT INTO `tbl_locations` VALUES ('蚌埠', 1, 3);
INSERT INTO `tbl_locations` VALUES ('淮南', 1, 4);
INSERT INTO `tbl_locations` VALUES ('马鞍山', 1, 5);
INSERT INTO `tbl_locations` VALUES ('淮北', 1, 6);
INSERT INTO `tbl_locations` VALUES ('铜陵', 1, 7);
INSERT INTO `tbl_locations` VALUES ('安庆', 1, 8);
INSERT INTO `tbl_locations` VALUES ('黄山', 1, 9);
INSERT INTO `tbl_locations` VALUES ('滁州', 1, 10);
INSERT INTO `tbl_locations` VALUES ('阜阳', 1, 11);
INSERT INTO `tbl_locations` VALUES ('宿州', 1, 12);
INSERT INTO `tbl_locations` VALUES ('巢湖', 1, 13);
INSERT INTO `tbl_locations` VALUES ('六安', 1, 14);
INSERT INTO `tbl_locations` VALUES ('亳州', 1, 15);
INSERT INTO `tbl_locations` VALUES ('池州', 1, 16);
INSERT INTO `tbl_locations` VALUES ('宣城', 1, 17);
INSERT INTO `tbl_locations` VALUES ('东城区', 2, 1);
INSERT INTO `tbl_locations` VALUES ('西城区', 2, 2);
INSERT INTO `tbl_locations` VALUES ('崇文区', 2, 3);
INSERT INTO `tbl_locations` VALUES ('宣武区', 2, 4);
INSERT INTO `tbl_locations` VALUES ('朝阳区', 2, 5);
INSERT INTO `tbl_locations` VALUES ('丰台区', 2, 6);
INSERT INTO `tbl_locations` VALUES ('石景山区', 2, 7);
INSERT INTO `tbl_locations` VALUES ('海淀区', 2, 8);
INSERT INTO `tbl_locations` VALUES ('门头沟区', 2, 9);
INSERT INTO `tbl_locations` VALUES ('房山区', 2, 10);
INSERT INTO `tbl_locations` VALUES ('通州区', 2, 11);
INSERT INTO `tbl_locations` VALUES ('顺义区', 2, 12);
INSERT INTO `tbl_locations` VALUES ('昌平区', 2, 13);
INSERT INTO `tbl_locations` VALUES ('大兴区', 2, 14);
INSERT INTO `tbl_locations` VALUES ('怀柔区', 2, 15);
INSERT INTO `tbl_locations` VALUES ('平谷区', 2, 16);
INSERT INTO `tbl_locations` VALUES ('密云县', 2, 17);
INSERT INTO `tbl_locations` VALUES ('延庆县', 2, 18);
INSERT INTO `tbl_locations` VALUES ('万州区', 3, 1);
INSERT INTO `tbl_locations` VALUES ('涪陵区', 3, 2);
INSERT INTO `tbl_locations` VALUES ('渝中区', 3, 3);
INSERT INTO `tbl_locations` VALUES ('大渡口区', 3, 4);
INSERT INTO `tbl_locations` VALUES ('江北区', 3, 5);
INSERT INTO `tbl_locations` VALUES ('沙坪坝区', 3, 6);
INSERT INTO `tbl_locations` VALUES ('九龙坡区', 3, 7);
INSERT INTO `tbl_locations` VALUES ('南岸区', 3, 8);
INSERT INTO `tbl_locations` VALUES ('北碚区', 3, 9);
INSERT INTO `tbl_locations` VALUES ('万盛区', 3, 10);
INSERT INTO `tbl_locations` VALUES ('双桥区', 3, 11);
INSERT INTO `tbl_locations` VALUES ('渝北区', 3, 12);
INSERT INTO `tbl_locations` VALUES ('巴南区', 3, 13);
INSERT INTO `tbl_locations` VALUES ('黔江区', 3, 14);
INSERT INTO `tbl_locations` VALUES ('长寿区', 3, 15);
INSERT INTO `tbl_locations` VALUES ('綦江县', 3, 16);
INSERT INTO `tbl_locations` VALUES ('潼南县', 3, 17);
INSERT INTO `tbl_locations` VALUES ('铜梁县', 3, 18);
INSERT INTO `tbl_locations` VALUES ('大足县', 3, 19);
INSERT INTO `tbl_locations` VALUES ('荣昌县', 3, 20);
INSERT INTO `tbl_locations` VALUES ('璧山县', 3, 21);
INSERT INTO `tbl_locations` VALUES ('梁平县', 3, 22);
INSERT INTO `tbl_locations` VALUES ('城口县', 3, 23);
INSERT INTO `tbl_locations` VALUES ('丰都县', 3, 24);
INSERT INTO `tbl_locations` VALUES ('垫江县', 3, 25);
INSERT INTO `tbl_locations` VALUES ('武隆县', 3, 26);
INSERT INTO `tbl_locations` VALUES ('忠县', 3, 27);
INSERT INTO `tbl_locations` VALUES ('开县', 3, 28);
INSERT INTO `tbl_locations` VALUES ('云阳县', 3, 29);
INSERT INTO `tbl_locations` VALUES ('奉节县', 3, 30);
INSERT INTO `tbl_locations` VALUES ('巫山县', 3, 31);
INSERT INTO `tbl_locations` VALUES ('巫溪县', 3, 32);
INSERT INTO `tbl_locations` VALUES ('石柱土家族自治县', 3, 33);
INSERT INTO `tbl_locations` VALUES ('秀山土家族苗族自治县', 3, 34);
INSERT INTO `tbl_locations` VALUES ('酉阳土家族苗族自治县', 3, 35);
INSERT INTO `tbl_locations` VALUES ('彭水苗族土家族自治县', 3, 36);
INSERT INTO `tbl_locations` VALUES ('江津区', 3, 37);
INSERT INTO `tbl_locations` VALUES ('合川区', 3, 38);
INSERT INTO `tbl_locations` VALUES ('永川区', 3, 39);
INSERT INTO `tbl_locations` VALUES ('南川区', 3, 40);
INSERT INTO `tbl_locations` VALUES ('福州', 4, 1);
INSERT INTO `tbl_locations` VALUES ('厦门', 4, 2);
INSERT INTO `tbl_locations` VALUES ('莆田', 4, 3);
INSERT INTO `tbl_locations` VALUES ('三明', 4, 4);
INSERT INTO `tbl_locations` VALUES ('泉州', 4, 5);
INSERT INTO `tbl_locations` VALUES ('漳州', 4, 6);
INSERT INTO `tbl_locations` VALUES ('南平', 4, 7);
INSERT INTO `tbl_locations` VALUES ('龙岩', 4, 8);
INSERT INTO `tbl_locations` VALUES ('宁德', 4, 9);
INSERT INTO `tbl_locations` VALUES ('兰州', 5, 1);
INSERT INTO `tbl_locations` VALUES ('嘉峪关', 5, 2);
INSERT INTO `tbl_locations` VALUES ('金昌', 5, 3);
INSERT INTO `tbl_locations` VALUES ('白银', 5, 4);
INSERT INTO `tbl_locations` VALUES ('天水', 5, 5);
INSERT INTO `tbl_locations` VALUES ('武威', 5, 6);
INSERT INTO `tbl_locations` VALUES ('张掖', 5, 7);
INSERT INTO `tbl_locations` VALUES ('平凉', 5, 8);
INSERT INTO `tbl_locations` VALUES ('酒泉', 5, 9);
INSERT INTO `tbl_locations` VALUES ('庆阳', 5, 10);
INSERT INTO `tbl_locations` VALUES ('定西', 5, 11);
INSERT INTO `tbl_locations` VALUES ('陇南', 5, 12);
INSERT INTO `tbl_locations` VALUES ('临夏', 5, 13);
INSERT INTO `tbl_locations` VALUES ('甘南', 5, 14);
INSERT INTO `tbl_locations` VALUES ('广州', 6, 1);
INSERT INTO `tbl_locations` VALUES ('韶关', 6, 2);
INSERT INTO `tbl_locations` VALUES ('深圳', 6, 3);
INSERT INTO `tbl_locations` VALUES ('珠海', 6, 4);
INSERT INTO `tbl_locations` VALUES ('汕头', 6, 5);
INSERT INTO `tbl_locations` VALUES ('佛山', 6, 6);
INSERT INTO `tbl_locations` VALUES ('江门', 6, 7);
INSERT INTO `tbl_locations` VALUES ('湛江', 6, 8);
INSERT INTO `tbl_locations` VALUES ('茂名', 6, 9);
INSERT INTO `tbl_locations` VALUES ('肇庆', 6, 10);
INSERT INTO `tbl_locations` VALUES ('惠州', 6, 11);
INSERT INTO `tbl_locations` VALUES ('梅州', 6, 12);
INSERT INTO `tbl_locations` VALUES ('汕尾', 6, 13);
INSERT INTO `tbl_locations` VALUES ('河源', 6, 14);
INSERT INTO `tbl_locations` VALUES ('阳江', 6, 15);
INSERT INTO `tbl_locations` VALUES ('清远', 6, 16);
INSERT INTO `tbl_locations` VALUES ('东莞', 6, 17);
INSERT INTO `tbl_locations` VALUES ('中山', 6, 18);
INSERT INTO `tbl_locations` VALUES ('潮州', 6, 19);
INSERT INTO `tbl_locations` VALUES ('揭阳', 6, 20);
INSERT INTO `tbl_locations` VALUES ('云浮', 6, 21);
INSERT INTO `tbl_locations` VALUES ('南宁', 7, 1);
INSERT INTO `tbl_locations` VALUES ('柳州', 7, 2);
INSERT INTO `tbl_locations` VALUES ('桂林', 7, 3);
INSERT INTO `tbl_locations` VALUES ('梧州', 7, 4);
INSERT INTO `tbl_locations` VALUES ('北海', 7, 5);
INSERT INTO `tbl_locations` VALUES ('防城港', 7, 6);
INSERT INTO `tbl_locations` VALUES ('钦州', 7, 7);
INSERT INTO `tbl_locations` VALUES ('贵港', 7, 8);
INSERT INTO `tbl_locations` VALUES ('玉林', 7, 9);
INSERT INTO `tbl_locations` VALUES ('百色', 7, 10);
INSERT INTO `tbl_locations` VALUES ('贺州', 7, 11);
INSERT INTO `tbl_locations` VALUES ('河池', 7, 12);
INSERT INTO `tbl_locations` VALUES ('来宾', 7, 13);
INSERT INTO `tbl_locations` VALUES ('崇左', 7, 14);
INSERT INTO `tbl_locations` VALUES ('贵阳', 8, 1);
INSERT INTO `tbl_locations` VALUES ('六盘水', 8, 2);
INSERT INTO `tbl_locations` VALUES ('遵义', 8, 3);
INSERT INTO `tbl_locations` VALUES ('安顺', 8, 4);
INSERT INTO `tbl_locations` VALUES ('铜仁', 8, 5);
INSERT INTO `tbl_locations` VALUES ('黔西南', 8, 6);
INSERT INTO `tbl_locations` VALUES ('毕节', 8, 7);
INSERT INTO `tbl_locations` VALUES ('黔东南', 8, 8);
INSERT INTO `tbl_locations` VALUES ('黔南', 8, 9);
INSERT INTO `tbl_locations` VALUES ('海口', 9, 1);
INSERT INTO `tbl_locations` VALUES ('三亚', 9, 2);
INSERT INTO `tbl_locations` VALUES ('其他', 9, 3);
INSERT INTO `tbl_locations` VALUES ('石家庄', 10, 1);
INSERT INTO `tbl_locations` VALUES ('唐山', 10, 2);
INSERT INTO `tbl_locations` VALUES ('秦皇岛', 10, 3);
INSERT INTO `tbl_locations` VALUES ('邯郸', 10, 4);
INSERT INTO `tbl_locations` VALUES ('邢台', 10, 5);
INSERT INTO `tbl_locations` VALUES ('保定', 10, 6);
INSERT INTO `tbl_locations` VALUES ('张家口', 10, 7);
INSERT INTO `tbl_locations` VALUES ('承德', 10, 8);
INSERT INTO `tbl_locations` VALUES ('沧州', 10, 9);
INSERT INTO `tbl_locations` VALUES ('廊坊', 10, 10);
INSERT INTO `tbl_locations` VALUES ('衡水', 10, 11);
INSERT INTO `tbl_locations` VALUES ('哈尔滨', 11, 1);
INSERT INTO `tbl_locations` VALUES ('齐齐哈尔', 11, 2);
INSERT INTO `tbl_locations` VALUES ('鸡西', 11, 3);
INSERT INTO `tbl_locations` VALUES ('鹤岗', 11, 4);
INSERT INTO `tbl_locations` VALUES ('双鸭山', 11, 5);
INSERT INTO `tbl_locations` VALUES ('大庆', 11, 6);
INSERT INTO `tbl_locations` VALUES ('伊春', 11, 7);
INSERT INTO `tbl_locations` VALUES ('佳木斯', 11, 8);
INSERT INTO `tbl_locations` VALUES ('七台河', 11, 9);
INSERT INTO `tbl_locations` VALUES ('牡丹江', 11, 10);
INSERT INTO `tbl_locations` VALUES ('黑河', 11, 11);
INSERT INTO `tbl_locations` VALUES ('绥化', 11, 12);
INSERT INTO `tbl_locations` VALUES ('大兴安岭', 11, 13);
INSERT INTO `tbl_locations` VALUES ('郑州', 12, 1);
INSERT INTO `tbl_locations` VALUES ('开封', 12, 2);
INSERT INTO `tbl_locations` VALUES ('洛阳', 12, 3);
INSERT INTO `tbl_locations` VALUES ('平顶山', 12, 4);
INSERT INTO `tbl_locations` VALUES ('安阳', 12, 5);
INSERT INTO `tbl_locations` VALUES ('鹤壁', 12, 6);
INSERT INTO `tbl_locations` VALUES ('新乡', 12, 7);
INSERT INTO `tbl_locations` VALUES ('焦作', 12, 8);
INSERT INTO `tbl_locations` VALUES ('濮阳', 12, 9);
INSERT INTO `tbl_locations` VALUES ('许昌', 12, 10);
INSERT INTO `tbl_locations` VALUES ('漯河', 12, 11);
INSERT INTO `tbl_locations` VALUES ('三门峡', 12, 12);
INSERT INTO `tbl_locations` VALUES ('南阳', 12, 13);
INSERT INTO `tbl_locations` VALUES ('商丘', 12, 14);
INSERT INTO `tbl_locations` VALUES ('信阳', 12, 15);
INSERT INTO `tbl_locations` VALUES ('周口', 12, 16);
INSERT INTO `tbl_locations` VALUES ('驻马店', 12, 17);
INSERT INTO `tbl_locations` VALUES ('济源', 12, 18);
INSERT INTO `tbl_locations` VALUES ('武汉', 13, 1);
INSERT INTO `tbl_locations` VALUES ('黄石', 13, 2);
INSERT INTO `tbl_locations` VALUES ('十堰', 13, 3);
INSERT INTO `tbl_locations` VALUES ('宜昌', 13, 4);
INSERT INTO `tbl_locations` VALUES ('襄阳', 13, 5);
INSERT INTO `tbl_locations` VALUES ('鄂州', 13, 6);
INSERT INTO `tbl_locations` VALUES ('荆门', 13, 7);
INSERT INTO `tbl_locations` VALUES ('孝感', 13, 8);
INSERT INTO `tbl_locations` VALUES ('荆州', 13, 9);
INSERT INTO `tbl_locations` VALUES ('黄冈', 13, 10);
INSERT INTO `tbl_locations` VALUES ('咸宁', 13, 11);
INSERT INTO `tbl_locations` VALUES ('随州', 13, 12);
INSERT INTO `tbl_locations` VALUES ('恩施土家族苗族自治州', 13, 13);
INSERT INTO `tbl_locations` VALUES ('仙桃', 13, 14);
INSERT INTO `tbl_locations` VALUES ('潜江', 13, 15);
INSERT INTO `tbl_locations` VALUES ('天门', 13, 16);
INSERT INTO `tbl_locations` VALUES ('神农架', 13, 17);
INSERT INTO `tbl_locations` VALUES ('长沙', 14, 1);
INSERT INTO `tbl_locations` VALUES ('株洲', 14, 2);
INSERT INTO `tbl_locations` VALUES ('湘潭', 14, 3);
INSERT INTO `tbl_locations` VALUES ('衡阳', 14, 4);
INSERT INTO `tbl_locations` VALUES ('邵阳', 14, 5);
INSERT INTO `tbl_locations` VALUES ('岳阳', 14, 6);
INSERT INTO `tbl_locations` VALUES ('常德', 14, 7);
INSERT INTO `tbl_locations` VALUES ('张家界', 14, 8);
INSERT INTO `tbl_locations` VALUES ('益阳', 14, 9);
INSERT INTO `tbl_locations` VALUES ('郴州', 14, 10);
INSERT INTO `tbl_locations` VALUES ('永州', 14, 11);
INSERT INTO `tbl_locations` VALUES ('怀化', 14, 12);
INSERT INTO `tbl_locations` VALUES ('娄底', 14, 13);
INSERT INTO `tbl_locations` VALUES ('湘西土家族苗族自治州', 14, 14);
INSERT INTO `tbl_locations` VALUES ('呼和浩特', 15, 1);
INSERT INTO `tbl_locations` VALUES ('包头', 15, 2);
INSERT INTO `tbl_locations` VALUES ('乌海', 15, 3);
INSERT INTO `tbl_locations` VALUES ('赤峰', 15, 4);
INSERT INTO `tbl_locations` VALUES ('通辽', 15, 5);
INSERT INTO `tbl_locations` VALUES ('鄂尔多斯', 15, 6);
INSERT INTO `tbl_locations` VALUES ('呼伦贝尔', 15, 7);
INSERT INTO `tbl_locations` VALUES ('兴安盟', 15, 8);
INSERT INTO `tbl_locations` VALUES ('锡林郭勒盟', 15, 9);
INSERT INTO `tbl_locations` VALUES ('乌兰察布盟', 15, 10);
INSERT INTO `tbl_locations` VALUES ('巴彦淖尔盟', 15, 11);
INSERT INTO `tbl_locations` VALUES ('阿拉善盟', 15, 12);
INSERT INTO `tbl_locations` VALUES ('南京', 16, 1);
INSERT INTO `tbl_locations` VALUES ('无锡', 16, 2);
INSERT INTO `tbl_locations` VALUES ('徐州', 16, 3);
INSERT INTO `tbl_locations` VALUES ('常州', 16, 4);
INSERT INTO `tbl_locations` VALUES ('苏州', 16, 5);
INSERT INTO `tbl_locations` VALUES ('南通', 16, 6);
INSERT INTO `tbl_locations` VALUES ('连云港', 16, 7);
INSERT INTO `tbl_locations` VALUES ('淮安', 16, 8);
INSERT INTO `tbl_locations` VALUES ('盐城', 16, 9);
INSERT INTO `tbl_locations` VALUES ('扬州', 16, 10);
INSERT INTO `tbl_locations` VALUES ('镇江', 16, 11);
INSERT INTO `tbl_locations` VALUES ('泰州', 16, 12);
INSERT INTO `tbl_locations` VALUES ('宿迁', 16, 13);
INSERT INTO `tbl_locations` VALUES ('南昌', 17, 1);
INSERT INTO `tbl_locations` VALUES ('景德镇', 17, 2);
INSERT INTO `tbl_locations` VALUES ('萍乡', 17, 3);
INSERT INTO `tbl_locations` VALUES ('九江', 17, 4);
INSERT INTO `tbl_locations` VALUES ('新余', 17, 5);
INSERT INTO `tbl_locations` VALUES ('鹰潭', 17, 6);
INSERT INTO `tbl_locations` VALUES ('赣州', 17, 7);
INSERT INTO `tbl_locations` VALUES ('吉安', 17, 8);
INSERT INTO `tbl_locations` VALUES ('宜春', 17, 9);
INSERT INTO `tbl_locations` VALUES ('抚州', 17, 10);
INSERT INTO `tbl_locations` VALUES ('上饶', 17, 11);
INSERT INTO `tbl_locations` VALUES ('长春', 18, 1);
INSERT INTO `tbl_locations` VALUES ('吉林', 18, 2);
INSERT INTO `tbl_locations` VALUES ('四平', 18, 3);
INSERT INTO `tbl_locations` VALUES ('辽源', 18, 4);
INSERT INTO `tbl_locations` VALUES ('通化', 18, 5);
INSERT INTO `tbl_locations` VALUES ('白山', 18, 6);
INSERT INTO `tbl_locations` VALUES ('松原', 18, 7);
INSERT INTO `tbl_locations` VALUES ('白城', 18, 8);
INSERT INTO `tbl_locations` VALUES ('延边朝鲜族自治州', 18, 9);
INSERT INTO `tbl_locations` VALUES ('沈阳', 19, 1);
INSERT INTO `tbl_locations` VALUES ('大连', 19, 2);
INSERT INTO `tbl_locations` VALUES ('鞍山', 19, 3);
INSERT INTO `tbl_locations` VALUES ('抚顺', 19, 4);
INSERT INTO `tbl_locations` VALUES ('本溪', 19, 5);
INSERT INTO `tbl_locations` VALUES ('丹东', 19, 6);
INSERT INTO `tbl_locations` VALUES ('锦州', 19, 7);
INSERT INTO `tbl_locations` VALUES ('营口', 19, 8);
INSERT INTO `tbl_locations` VALUES ('阜新', 19, 9);
INSERT INTO `tbl_locations` VALUES ('辽阳', 19, 10);
INSERT INTO `tbl_locations` VALUES ('盘锦', 19, 11);
INSERT INTO `tbl_locations` VALUES ('铁岭', 19, 12);
INSERT INTO `tbl_locations` VALUES ('朝阳', 19, 13);
INSERT INTO `tbl_locations` VALUES ('葫芦岛', 19, 14);
INSERT INTO `tbl_locations` VALUES ('银川', 20, 1);
INSERT INTO `tbl_locations` VALUES ('石嘴山', 20, 2);
INSERT INTO `tbl_locations` VALUES ('吴忠', 20, 3);
INSERT INTO `tbl_locations` VALUES ('固原', 20, 4);
INSERT INTO `tbl_locations` VALUES ('中卫', 20, 5);
INSERT INTO `tbl_locations` VALUES ('西宁', 21, 1);
INSERT INTO `tbl_locations` VALUES ('海东', 21, 2);
INSERT INTO `tbl_locations` VALUES ('海北', 21, 3);
INSERT INTO `tbl_locations` VALUES ('黄南', 21, 4);
INSERT INTO `tbl_locations` VALUES ('海南', 21, 5);
INSERT INTO `tbl_locations` VALUES ('果洛', 21, 6);
INSERT INTO `tbl_locations` VALUES ('玉树', 21, 7);
INSERT INTO `tbl_locations` VALUES ('海西', 21, 8);
INSERT INTO `tbl_locations` VALUES ('太原', 22, 1);
INSERT INTO `tbl_locations` VALUES ('大同', 22, 2);
INSERT INTO `tbl_locations` VALUES ('阳泉', 22, 3);
INSERT INTO `tbl_locations` VALUES ('长治', 22, 4);
INSERT INTO `tbl_locations` VALUES ('晋城', 22, 5);
INSERT INTO `tbl_locations` VALUES ('朔州', 22, 6);
INSERT INTO `tbl_locations` VALUES ('晋中', 22, 7);
INSERT INTO `tbl_locations` VALUES ('运城', 22, 8);
INSERT INTO `tbl_locations` VALUES ('忻州', 22, 9);
INSERT INTO `tbl_locations` VALUES ('临汾', 22, 10);
INSERT INTO `tbl_locations` VALUES ('吕梁', 22, 11);
INSERT INTO `tbl_locations` VALUES ('济南', 23, 1);
INSERT INTO `tbl_locations` VALUES ('青岛', 23, 2);
INSERT INTO `tbl_locations` VALUES ('淄博', 23, 3);
INSERT INTO `tbl_locations` VALUES ('枣庄', 23, 4);
INSERT INTO `tbl_locations` VALUES ('东营', 23, 5);
INSERT INTO `tbl_locations` VALUES ('烟台', 23, 6);
INSERT INTO `tbl_locations` VALUES ('潍坊', 23, 7);
INSERT INTO `tbl_locations` VALUES ('济宁', 23, 8);
INSERT INTO `tbl_locations` VALUES ('泰安', 23, 9);
INSERT INTO `tbl_locations` VALUES ('威海', 23, 10);
INSERT INTO `tbl_locations` VALUES ('日照', 23, 11);
INSERT INTO `tbl_locations` VALUES ('莱芜', 23, 12);
INSERT INTO `tbl_locations` VALUES ('临沂', 23, 13);
INSERT INTO `tbl_locations` VALUES ('德州', 23, 14);
INSERT INTO `tbl_locations` VALUES ('聊城', 23, 15);
INSERT INTO `tbl_locations` VALUES ('滨州', 23, 16);
INSERT INTO `tbl_locations` VALUES ('菏泽', 23, 17);
INSERT INTO `tbl_locations` VALUES ('黄浦区', 24, 1);
INSERT INTO `tbl_locations` VALUES ('卢湾区', 24, 2);
INSERT INTO `tbl_locations` VALUES ('徐汇区', 24, 3);
INSERT INTO `tbl_locations` VALUES ('长宁区', 24, 4);
INSERT INTO `tbl_locations` VALUES ('静安区', 24, 5);
INSERT INTO `tbl_locations` VALUES ('普陀区', 24, 6);
INSERT INTO `tbl_locations` VALUES ('闸北区', 24, 7);
INSERT INTO `tbl_locations` VALUES ('虹口区', 24, 8);
INSERT INTO `tbl_locations` VALUES ('杨浦区', 24, 9);
INSERT INTO `tbl_locations` VALUES ('闵行区', 24, 10);
INSERT INTO `tbl_locations` VALUES ('宝山区', 24, 11);
INSERT INTO `tbl_locations` VALUES ('嘉定区', 24, 12);
INSERT INTO `tbl_locations` VALUES ('浦东新区', 24, 13);
INSERT INTO `tbl_locations` VALUES ('金山区', 24, 14);
INSERT INTO `tbl_locations` VALUES ('松江区', 24, 15);
INSERT INTO `tbl_locations` VALUES ('青浦区', 24, 16);
INSERT INTO `tbl_locations` VALUES ('南汇区', 24, 17);
INSERT INTO `tbl_locations` VALUES ('奉贤区', 24, 18);
INSERT INTO `tbl_locations` VALUES ('崇明县', 24, 19);
INSERT INTO `tbl_locations` VALUES ('成都', 25, 1);
INSERT INTO `tbl_locations` VALUES ('自贡', 25, 2);
INSERT INTO `tbl_locations` VALUES ('攀枝花', 25, 3);
INSERT INTO `tbl_locations` VALUES ('泸州', 25, 4);
INSERT INTO `tbl_locations` VALUES ('德阳', 25, 5);
INSERT INTO `tbl_locations` VALUES ('绵阳', 25, 6);
INSERT INTO `tbl_locations` VALUES ('广元', 25, 7);
INSERT INTO `tbl_locations` VALUES ('遂宁', 25, 8);
INSERT INTO `tbl_locations` VALUES ('内江', 25, 9);
INSERT INTO `tbl_locations` VALUES ('乐山', 25, 10);
INSERT INTO `tbl_locations` VALUES ('南充', 25, 11);
INSERT INTO `tbl_locations` VALUES ('眉山', 25, 12);
INSERT INTO `tbl_locations` VALUES ('宜宾', 25, 13);
INSERT INTO `tbl_locations` VALUES ('广安', 25, 14);
INSERT INTO `tbl_locations` VALUES ('达州', 25, 15);
INSERT INTO `tbl_locations` VALUES ('雅安', 25, 16);
INSERT INTO `tbl_locations` VALUES ('巴中', 25, 17);
INSERT INTO `tbl_locations` VALUES ('资阳', 25, 18);
INSERT INTO `tbl_locations` VALUES ('阿坝', 25, 19);
INSERT INTO `tbl_locations` VALUES ('甘孜', 25, 20);
INSERT INTO `tbl_locations` VALUES ('凉山', 25, 21);
INSERT INTO `tbl_locations` VALUES ('和平区', 26, 1);
INSERT INTO `tbl_locations` VALUES ('河东区', 26, 2);
INSERT INTO `tbl_locations` VALUES ('河西区', 26, 3);
INSERT INTO `tbl_locations` VALUES ('南开区', 26, 4);
INSERT INTO `tbl_locations` VALUES ('河北区', 26, 5);
INSERT INTO `tbl_locations` VALUES ('红桥区', 26, 6);
INSERT INTO `tbl_locations` VALUES ('塘沽区', 26, 7);
INSERT INTO `tbl_locations` VALUES ('汉沽区', 26, 8);
INSERT INTO `tbl_locations` VALUES ('大港区', 26, 9);
INSERT INTO `tbl_locations` VALUES ('东丽区', 26, 10);
INSERT INTO `tbl_locations` VALUES ('西青区', 26, 11);
INSERT INTO `tbl_locations` VALUES ('津南区', 26, 12);
INSERT INTO `tbl_locations` VALUES ('北辰区', 26, 13);
INSERT INTO `tbl_locations` VALUES ('武清区', 26, 14);
INSERT INTO `tbl_locations` VALUES ('宝坻区', 26, 15);
INSERT INTO `tbl_locations` VALUES ('宁河县', 26, 16);
INSERT INTO `tbl_locations` VALUES ('静海县', 26, 17);
INSERT INTO `tbl_locations` VALUES ('蓟县', 26, 18);
INSERT INTO `tbl_locations` VALUES ('滨海新区', 26, 19);
INSERT INTO `tbl_locations` VALUES ('保税区', 26, 20);
INSERT INTO `tbl_locations` VALUES ('拉萨', 27, 1);
INSERT INTO `tbl_locations` VALUES ('昌都', 27, 2);
INSERT INTO `tbl_locations` VALUES ('山南', 27, 3);
INSERT INTO `tbl_locations` VALUES ('日喀则', 27, 4);
INSERT INTO `tbl_locations` VALUES ('那曲', 27, 5);
INSERT INTO `tbl_locations` VALUES ('阿里', 27, 6);
INSERT INTO `tbl_locations` VALUES ('林芝', 27, 7);
INSERT INTO `tbl_locations` VALUES ('乌鲁木齐', 28, 1);
INSERT INTO `tbl_locations` VALUES ('克拉玛依', 28, 2);
INSERT INTO `tbl_locations` VALUES ('吐鲁番', 28, 3);
INSERT INTO `tbl_locations` VALUES ('哈密', 28, 4);
INSERT INTO `tbl_locations` VALUES ('昌吉', 28, 5);
INSERT INTO `tbl_locations` VALUES ('博尔塔拉', 28, 6);
INSERT INTO `tbl_locations` VALUES ('巴音郭楞', 28, 7);
INSERT INTO `tbl_locations` VALUES ('阿克苏', 28, 8);
INSERT INTO `tbl_locations` VALUES ('克孜勒苏', 28, 9);
INSERT INTO `tbl_locations` VALUES ('喀什', 28, 10);
INSERT INTO `tbl_locations` VALUES ('和田', 28, 11);
INSERT INTO `tbl_locations` VALUES ('伊犁', 28, 12);
INSERT INTO `tbl_locations` VALUES ('塔城', 28, 13);
INSERT INTO `tbl_locations` VALUES ('阿勒泰', 28, 14);
INSERT INTO `tbl_locations` VALUES ('石河子', 28, 15);
INSERT INTO `tbl_locations` VALUES ('昆明', 29, 1);
INSERT INTO `tbl_locations` VALUES ('曲靖', 29, 2);
INSERT INTO `tbl_locations` VALUES ('玉溪', 29, 3);
INSERT INTO `tbl_locations` VALUES ('保山', 29, 4);
INSERT INTO `tbl_locations` VALUES ('昭通', 29, 5);
INSERT INTO `tbl_locations` VALUES ('楚雄', 29, 6);
INSERT INTO `tbl_locations` VALUES ('红河', 29, 7);
INSERT INTO `tbl_locations` VALUES ('文山', 29, 8);
INSERT INTO `tbl_locations` VALUES ('思茅', 29, 9);
INSERT INTO `tbl_locations` VALUES ('西双版纳', 29, 10);
INSERT INTO `tbl_locations` VALUES ('大理', 29, 11);
INSERT INTO `tbl_locations` VALUES ('德宏', 29, 12);
INSERT INTO `tbl_locations` VALUES ('丽江', 29, 13);
INSERT INTO `tbl_locations` VALUES ('怒江', 29, 14);
INSERT INTO `tbl_locations` VALUES ('迪庆', 29, 15);
INSERT INTO `tbl_locations` VALUES ('临沧', 29, 16);
INSERT INTO `tbl_locations` VALUES ('杭州', 30, 1);
INSERT INTO `tbl_locations` VALUES ('宁波', 30, 2);
INSERT INTO `tbl_locations` VALUES ('温州', 30, 3);
INSERT INTO `tbl_locations` VALUES ('嘉兴', 30, 4);
INSERT INTO `tbl_locations` VALUES ('湖州', 30, 5);
INSERT INTO `tbl_locations` VALUES ('绍兴', 30, 6);
INSERT INTO `tbl_locations` VALUES ('金华', 30, 7);
INSERT INTO `tbl_locations` VALUES ('衢州', 30, 8);
INSERT INTO `tbl_locations` VALUES ('舟山', 30, 9);
INSERT INTO `tbl_locations` VALUES ('台州', 30, 10);
INSERT INTO `tbl_locations` VALUES ('丽水', 30, 11);
INSERT INTO `tbl_locations` VALUES ('西安', 31, 1);
INSERT INTO `tbl_locations` VALUES ('铜川', 31, 2);
INSERT INTO `tbl_locations` VALUES ('宝鸡', 31, 3);
INSERT INTO `tbl_locations` VALUES ('咸阳', 31, 4);
INSERT INTO `tbl_locations` VALUES ('渭南', 31, 5);
INSERT INTO `tbl_locations` VALUES ('延安', 31, 6);
INSERT INTO `tbl_locations` VALUES ('汉中', 31, 7);
INSERT INTO `tbl_locations` VALUES ('榆林', 31, 8);
INSERT INTO `tbl_locations` VALUES ('安康', 31, 9);
INSERT INTO `tbl_locations` VALUES ('商洛', 31, 10);
INSERT INTO `tbl_locations` VALUES ('台北市', 32, 1);
INSERT INTO `tbl_locations` VALUES ('高雄市', 32, 2);
INSERT INTO `tbl_locations` VALUES ('基隆市', 32, 3);
INSERT INTO `tbl_locations` VALUES ('台中市', 32, 4);
INSERT INTO `tbl_locations` VALUES ('台南市', 32, 5);
INSERT INTO `tbl_locations` VALUES ('新竹市', 32, 6);
INSERT INTO `tbl_locations` VALUES ('嘉义市', 32, 7);
INSERT INTO `tbl_locations` VALUES ('台北县', 32, 8);
INSERT INTO `tbl_locations` VALUES ('宜兰县', 32, 9);
INSERT INTO `tbl_locations` VALUES ('桃园县', 32, 10);
INSERT INTO `tbl_locations` VALUES ('新竹县', 32, 11);
INSERT INTO `tbl_locations` VALUES ('苗栗县', 32, 12);
INSERT INTO `tbl_locations` VALUES ('台中县', 32, 13);
INSERT INTO `tbl_locations` VALUES ('彰化县', 32, 14);
INSERT INTO `tbl_locations` VALUES ('南投县', 32, 15);
INSERT INTO `tbl_locations` VALUES ('云林县', 32, 16);
INSERT INTO `tbl_locations` VALUES ('嘉义县', 32, 17);
INSERT INTO `tbl_locations` VALUES ('台南县', 32, 18);
INSERT INTO `tbl_locations` VALUES ('高雄县', 32, 19);
INSERT INTO `tbl_locations` VALUES ('屏东县', 32, 20);
INSERT INTO `tbl_locations` VALUES ('澎湖县', 32, 21);
INSERT INTO `tbl_locations` VALUES ('台东县', 32, 22);
INSERT INTO `tbl_locations` VALUES ('花莲县', 32, 23);
INSERT INTO `tbl_locations` VALUES ('其他', 32, 24);
INSERT INTO `tbl_locations` VALUES ('中西区', 33, 1);
INSERT INTO `tbl_locations` VALUES ('东区', 33, 2);
INSERT INTO `tbl_locations` VALUES ('九龙城区', 33, 3);
INSERT INTO `tbl_locations` VALUES ('观塘区', 33, 4);
INSERT INTO `tbl_locations` VALUES ('南区', 33, 5);
INSERT INTO `tbl_locations` VALUES ('深水埗区', 33, 6);
INSERT INTO `tbl_locations` VALUES ('黄大仙区', 33, 7);
INSERT INTO `tbl_locations` VALUES ('湾仔区', 33, 8);
INSERT INTO `tbl_locations` VALUES ('油尖旺区', 33, 9);
INSERT INTO `tbl_locations` VALUES ('离岛区', 33, 10);
INSERT INTO `tbl_locations` VALUES ('葵青区', 33, 11);
INSERT INTO `tbl_locations` VALUES ('北区', 33, 12);
INSERT INTO `tbl_locations` VALUES ('西贡区', 33, 13);
INSERT INTO `tbl_locations` VALUES ('沙田区', 33, 14);
INSERT INTO `tbl_locations` VALUES ('屯门区', 33, 15);
INSERT INTO `tbl_locations` VALUES ('大埔区', 33, 16);
INSERT INTO `tbl_locations` VALUES ('荃湾区', 33, 17);
INSERT INTO `tbl_locations` VALUES ('元朗区', 33, 18);
INSERT INTO `tbl_locations` VALUES ('其他', 33, 19);
INSERT INTO `tbl_locations` VALUES ('花地玛堂区', 34, 1);
INSERT INTO `tbl_locations` VALUES ('圣安多尼堂区', 34, 2);
INSERT INTO `tbl_locations` VALUES ('大堂区', 34, 3);
INSERT INTO `tbl_locations` VALUES ('望德堂区', 34, 4);
INSERT INTO `tbl_locations` VALUES ('风顺堂区', 34, 5);
INSERT INTO `tbl_locations` VALUES ('氹仔', 34, 6);
INSERT INTO `tbl_locations` VALUES ('路环', 34, 7);
INSERT INTO `tbl_locations` VALUES ('其他', 34, 8);
INSERT INTO `tbl_locations` VALUES ('美国', 35, 1);
INSERT INTO `tbl_locations` VALUES ('英国', 35, 2);
INSERT INTO `tbl_locations` VALUES ('法国', 35, 3);
INSERT INTO `tbl_locations` VALUES ('俄罗斯', 35, 4);
INSERT INTO `tbl_locations` VALUES ('加拿大', 35, 5);
INSERT INTO `tbl_locations` VALUES ('巴西', 35, 6);
INSERT INTO `tbl_locations` VALUES ('澳大利亚', 35, 7);
INSERT INTO `tbl_locations` VALUES ('印尼', 35, 8);
INSERT INTO `tbl_locations` VALUES ('泰国', 35, 9);
INSERT INTO `tbl_locations` VALUES ('马来西亚', 35, 10);
INSERT INTO `tbl_locations` VALUES ('新加坡', 35, 11);
INSERT INTO `tbl_locations` VALUES ('菲律宾', 35, 12);
INSERT INTO `tbl_locations` VALUES ('越南', 35, 13);
INSERT INTO `tbl_locations` VALUES ('印度', 35, 14);
INSERT INTO `tbl_locations` VALUES ('日本', 35, 15);
INSERT INTO `tbl_locations` VALUES ('新西兰', 35, 16);
INSERT INTO `tbl_locations` VALUES ('韩国', 35, 17);
INSERT INTO `tbl_locations` VALUES ('德国', 35, 18);
INSERT INTO `tbl_locations` VALUES ('意大利', 35, 19);
INSERT INTO `tbl_locations` VALUES ('爱尔兰', 35, 20);
INSERT INTO `tbl_locations` VALUES ('荷兰', 35, 21);
INSERT INTO `tbl_locations` VALUES ('瑞士', 35, 22);
INSERT INTO `tbl_locations` VALUES ('乌克兰', 35, 23);
INSERT INTO `tbl_locations` VALUES ('南非', 35, 24);
INSERT INTO `tbl_locations` VALUES ('芬兰', 35, 25);
INSERT INTO `tbl_locations` VALUES ('瑞典', 35, 26);
INSERT INTO `tbl_locations` VALUES ('奥地利', 35, 27);
INSERT INTO `tbl_locations` VALUES ('西班牙', 35, 28);
INSERT INTO `tbl_locations` VALUES ('比利时', 35, 29);
INSERT INTO `tbl_locations` VALUES ('挪威', 35, 30);
INSERT INTO `tbl_locations` VALUES ('丹麦', 35, 31);
INSERT INTO `tbl_locations` VALUES ('波兰', 35, 32);
INSERT INTO `tbl_locations` VALUES ('阿根廷', 35, 33);
INSERT INTO `tbl_locations` VALUES ('白俄罗斯', 35, 34);
INSERT INTO `tbl_locations` VALUES ('哥伦比亚', 35, 35);
INSERT INTO `tbl_locations` VALUES ('古巴', 35, 36);
INSERT INTO `tbl_locations` VALUES ('埃及', 35, 37);
INSERT INTO `tbl_locations` VALUES ('希腊', 35, 38);
INSERT INTO `tbl_locations` VALUES ('匈牙利', 35, 39);
INSERT INTO `tbl_locations` VALUES ('伊朗', 35, 40);
INSERT INTO `tbl_locations` VALUES ('蒙古', 35, 41);
INSERT INTO `tbl_locations` VALUES ('墨西哥', 35, 42);
INSERT INTO `tbl_locations` VALUES ('葡萄牙', 35, 43);
INSERT INTO `tbl_locations` VALUES ('沙特阿拉伯', 35, 44);
INSERT INTO `tbl_locations` VALUES ('土耳其', 35, 45);
INSERT INTO `tbl_locations` VALUES ('其他', 35, 46);

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_mobile_validate`
-- 

DROP TABLE IF EXISTS `tbl_mobile_validate`;
CREATE TABLE IF NOT EXISTS `tbl_mobile_validate` (
  `id` int(11) NOT NULL auto_increment,
  `mobile_number` varchar(11) NOT NULL,
  `auth_code` varchar(20) NOT NULL,
  `msg_contant` varchar(500) NOT NULL,
  `msg_id` int(11) default NULL COMMENT '用户发送短信自己定义的短信id用于处理群发状态报告',
  `ext` varchar(5) default NULL COMMENT '用户自己分配的小号（即显示在接收手机上的主叫尾号）',
  `user_receive_type` char(1) default NULL COMMENT '用户是否接收到短信：0，成功接收；9，接收失败',
  `user_validate_type` char(1) default NULL COMMENT '用户是否成功验证：1，成功验证；0，验证失败',
  `extra` varchar(500) default NULL COMMENT '扩展信息，存储用户密码或用户名之类信息',
  `validate_type` smallint(6) NOT NULL COMMENT '手机验证类型：1，手机注册验证；2，名片认领验证；3,订阅验证；4,手机寻回密码；5,绑定手机',
  `creation_ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=198 ;

-- 
-- 导出表中的数据 `tbl_mobile_validate`
-- 

INSERT INTO `tbl_mobile_validate` VALUES (52, '13366576525', 'nxidDm', '脉络验证码是“nxidDm“，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-04 17:48:55');
INSERT INTO `tbl_mobile_validate` VALUES (53, '18601140278', 'AIlaAn', '脉络验证码是“AIlaAn“，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-06 00:16:36');
INSERT INTO `tbl_mobile_validate` VALUES (54, '18600888852', 'M7lXvc', '脉络验证码是“M7lXvc“，验证码半小时内有效。', NULL, NULL, NULL, NULL, NULL, 1, '2012-05-07 16:42:30');
INSERT INTO `tbl_mobile_validate` VALUES (55, '18601140279', 'ZqFIxy', '脉络验证码是“ZqFIxy“，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-08 16:12:54');
INSERT INTO `tbl_mobile_validate` VALUES (56, '18601140270', 'fjjrJd', '您的脉络身份校验码是“fjjrJd“，请及时修改密码。', NULL, NULL, NULL, NULL, NULL, 4, '2012-05-08 18:09:04');
INSERT INTO `tbl_mobile_validate` VALUES (57, '18601140270', 'IdlYkH', '您的脉络身份校验码是“IdlYkH“，请及时修改密码。', NULL, NULL, NULL, NULL, NULL, 4, '2012-05-08 18:11:09');
INSERT INTO `tbl_mobile_validate` VALUES (58, '18601140270', '0YrhOn', '您的脉络身份校验码是“0YrhOn“，请及时修改密码。', NULL, NULL, NULL, NULL, NULL, 4, '2012-05-08 18:12:50');
INSERT INTO `tbl_mobile_validate` VALUES (59, '18601140270', 'le57tC', '您的脉络身份校验码是“le57tC“，请及时修改密码。', NULL, NULL, NULL, NULL, NULL, 4, '2012-05-08 18:17:45');
INSERT INTO `tbl_mobile_validate` VALUES (60, '18601140270', '52LoVx', '您的脉络身份校验码是52LoVx，请及时修改密码。', NULL, NULL, NULL, NULL, NULL, 4, '2012-05-14 12:39:12');
INSERT INTO `tbl_mobile_validate` VALUES (61, '18601140270', 'w8nezm', '您的脉络身份校验码是w8nezm，请及时修改密码。', NULL, NULL, NULL, '1', NULL, 4, '2012-05-14 12:49:34');
INSERT INTO `tbl_mobile_validate` VALUES (62, '18601140270', 'JrxshT', '您的脉络身份校验码是JrxshT，请及时修改密码。', NULL, NULL, NULL, '1', NULL, 4, '2012-05-14 12:50:38');
INSERT INTO `tbl_mobile_validate` VALUES (63, '18601140270', 'B78MYe', '您的脉络身份校验码是B78MYe，请及时修改密码。', NULL, NULL, NULL, '1', NULL, 4, '2012-05-14 15:50:45');
INSERT INTO `tbl_mobile_validate` VALUES (64, '18601140270', '4glNhj', '您的脉络身份校验码是4glNhj，请及时修改密码。', NULL, NULL, NULL, '1', NULL, 4, '2012-05-14 16:04:50');
INSERT INTO `tbl_mobile_validate` VALUES (65, '18601140273', 'BqH8B2', '脉络验证码是BqH8B2，验证码半小时内有效。', NULL, NULL, NULL, NULL, NULL, 1, '2012-05-14 17:34:05');
INSERT INTO `tbl_mobile_validate` VALUES (66, '18601170854', 'ku1HSv', '脉络验证码是ku1HSv，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-14 17:49:24');
INSERT INTO `tbl_mobile_validate` VALUES (67, '18601140270', 'Jiszji', '您的脉络身份校验码是Jiszji，请及时修改密码。', NULL, NULL, NULL, '1', NULL, 4, '2012-05-18 13:31:35');
INSERT INTO `tbl_mobile_validate` VALUES (68, '13366576525', 'nIh4YL', '脉络验证码是nIh4YL，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-18 16:08:53');
INSERT INTO `tbl_mobile_validate` VALUES (69, '13366576525', 'cl7vId', '脉络验证码是cl7vId，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-18 16:11:32');
INSERT INTO `tbl_mobile_validate` VALUES (70, '13366576525', '2UpAQq', '脉络验证码是2UpAQq，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-18 16:13:27');
INSERT INTO `tbl_mobile_validate` VALUES (71, '13366576525', 'QW0nf0', '脉络验证码是QW0nf0，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-18 16:32:19');
INSERT INTO `tbl_mobile_validate` VALUES (72, '13366576525', 'Fn5prp', '脉络验证码是Fn5prp，验证码半小时内有效。', NULL, NULL, NULL, NULL, NULL, 1, '2012-05-18 16:42:10');
INSERT INTO `tbl_mobile_validate` VALUES (73, '13366576525', 'qHVpCU', '脉络验证码是qHVpCU，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-18 16:45:42');
INSERT INTO `tbl_mobile_validate` VALUES (74, '13366576525', 'SG8aQ6', '脉络验证码是SG8aQ6，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-18 16:58:44');
INSERT INTO `tbl_mobile_validate` VALUES (75, '13366576525', '54Duhz', '脉络验证码是54Duhz，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-18 17:31:55');
INSERT INTO `tbl_mobile_validate` VALUES (76, '13366576525', 'gLvptV', '脉络验证码是gLvptV，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-18 17:36:09');
INSERT INTO `tbl_mobile_validate` VALUES (77, '13366576525', 'WMX3aM', '脉络验证码是WMX3aM，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-18 17:37:40');
INSERT INTO `tbl_mobile_validate` VALUES (78, '13366576525', 'yeM0PV', '脉络验证码是yeM0PV，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-18 17:42:23');
INSERT INTO `tbl_mobile_validate` VALUES (79, '13366576525', 'ivEeC1', '脉络验证码是ivEeC1，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-18 17:53:48');
INSERT INTO `tbl_mobile_validate` VALUES (80, '13366576525', '2SFF5X', '脉络验证码是2SFF5X，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-18 17:58:09');
INSERT INTO `tbl_mobile_validate` VALUES (81, '13366576525', 'UggSKK', '脉络验证码是UggSKK，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-18 17:59:27');
INSERT INTO `tbl_mobile_validate` VALUES (82, '18601114027', 'TFENTX', '脉络验证码是TFENTX，验证码半小时内有效。', NULL, NULL, NULL, NULL, NULL, 1, '2012-05-21 10:17:25');
INSERT INTO `tbl_mobile_validate` VALUES (83, '18601114027', 'W95qFa', '脉络验证码是W95qFa，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-21 10:20:26');
INSERT INTO `tbl_mobile_validate` VALUES (84, '18601142222', 'nOxZo4', '脉络验证码是nOxZo4，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-21 10:28:59');
INSERT INTO `tbl_mobile_validate` VALUES (85, '18601140275', 'yHQ1gx', '脉络验证码是yHQ1gx，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-21 16:36:12');
INSERT INTO `tbl_mobile_validate` VALUES (86, '18655555222', 'smtLvc', '脉络验证码是smtLvc，验证码半小时内有效。', NULL, NULL, NULL, NULL, NULL, 1, '2012-05-21 18:12:43');
INSERT INTO `tbl_mobile_validate` VALUES (87, '13911650018', '4VFtcp', '您的脉络身份校验码是4VFtcp，请及时修改密码。', NULL, NULL, NULL, '1', NULL, 4, '2012-05-23 10:43:04');
INSERT INTO `tbl_mobile_validate` VALUES (88, '15555522255', 'DJLPsC', '脉络验证码是DJLPsC，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-24 10:43:24');
INSERT INTO `tbl_mobile_validate` VALUES (89, '18600000200', 'IfIpJG', '脉络验证码是IfIpJG，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-24 11:23:20');
INSERT INTO `tbl_mobile_validate` VALUES (90, '18600000278', 'gIZQGl', '脉络验证码是gIZQGl，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-24 11:24:39');
INSERT INTO `tbl_mobile_validate` VALUES (91, '18601110002', 'SvoQSR', '脉络验证码是SvoQSR，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-24 17:21:50');
INSERT INTO `tbl_mobile_validate` VALUES (92, '18601140276', 'z1A0Gp', '脉络验证码是z1A0Gp，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-25 14:02:51');
INSERT INTO `tbl_mobile_validate` VALUES (93, '18601140276', 'UGVa6R', '脉络验证码是UGVa6R，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-25 14:12:11');
INSERT INTO `tbl_mobile_validate` VALUES (94, '18601140276', 'fTMHtZ', '脉络验证码是fTMHtZ，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-25 14:18:36');
INSERT INTO `tbl_mobile_validate` VALUES (95, '18601140276', 'rtkZ59', '脉络验证码是rtkZ59，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-25 14:41:13');
INSERT INTO `tbl_mobile_validate` VALUES (96, '18601140276', 'e9RiOs', '脉络验证码是e9RiOs，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-25 14:45:34');
INSERT INTO `tbl_mobile_validate` VALUES (97, '18601140276', 'ReLvVD', '脉络验证码是ReLvVD，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-05-25 15:05:32');
INSERT INTO `tbl_mobile_validate` VALUES (98, '18601140270', 'FuXllw', '您的脉络身份校验码是FuXllw，请及时修改密码。', NULL, NULL, NULL, '0', NULL, 4, '2012-05-29 16:40:15');
INSERT INTO `tbl_mobile_validate` VALUES (99, '18601140270', 'DOlijV', '您的脉络身份校验码是DOlijV，请及时修改密码。', NULL, NULL, NULL, '1', NULL, 4, '2012-05-29 16:42:39');
INSERT INTO `tbl_mobile_validate` VALUES (100, '18601140271', 'b5Vyxt', '您的脉络身份校验码是b5Vyxt，请及时修改密码。', NULL, NULL, NULL, '1', NULL, 4, '2012-05-29 16:43:35');
INSERT INTO `tbl_mobile_validate` VALUES (101, '18601140280', 'jJtC5N', '脉络验证码是jJtC5N，验证码半小时内有效。', NULL, NULL, NULL, NULL, NULL, 1, '2012-06-07 15:23:58');
INSERT INTO `tbl_mobile_validate` VALUES (102, '18601114028', 'ETJQGF', '脉络验证码是ETJQGF，验证码半小时内有效。', NULL, NULL, NULL, NULL, NULL, 1, '2012-06-07 15:24:36');
INSERT INTO `tbl_mobile_validate` VALUES (103, '18611114027', 'ztXpAC', '脉络验证码是ztXpAC，验证码半小时内有效。', NULL, NULL, NULL, NULL, NULL, 1, '2012-06-07 15:28:54');
INSERT INTO `tbl_mobile_validate` VALUES (104, '18601112322', 'c9cKE5', '脉络验证码是c9cKE5，验证码半小时内有效。', NULL, NULL, NULL, NULL, NULL, 1, '2012-06-07 15:29:25');
INSERT INTO `tbl_mobile_validate` VALUES (105, '18601150170', 'rClYis', '脉络验证码是rClYis，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-06-07 15:37:49');
INSERT INTO `tbl_mobile_validate` VALUES (106, '18601160270', 'vmHiYr', '脉络验证码是vmHiYr，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-06-07 15:41:20');
INSERT INTO `tbl_mobile_validate` VALUES (107, '18601150271', 'TqB8dC', '脉络验证码是TqB8dC，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-06-07 15:45:57');
INSERT INTO `tbl_mobile_validate` VALUES (108, '18601111222', 'gTxbMl', '脉络验证码是gTxbMl，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-06-07 15:58:16');
INSERT INTO `tbl_mobile_validate` VALUES (109, '18601140290', 'zPeD0P', '脉络验证码是zPeD0P，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-06-07 15:58:43');
INSERT INTO `tbl_mobile_validate` VALUES (110, '18769090900', '06HrS9', '脉络验证码是06HrS9，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-06-07 15:59:40');
INSERT INTO `tbl_mobile_validate` VALUES (111, '18989998998', 'zSmo7Z', '脉络验证码是zSmo7Z，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-06-07 16:01:14');
INSERT INTO `tbl_mobile_validate` VALUES (112, '18788888888', 'uSzLbt', '脉络验证码是uSzLbt，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-06-07 16:12:41');
INSERT INTO `tbl_mobile_validate` VALUES (113, '18709090901', 'ebo33u', '脉络验证码是ebo33u，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-06-07 16:14:37');
INSERT INTO `tbl_mobile_validate` VALUES (114, '18900000000', '2eKkYV', '脉络验证码是2eKkYV，验证码半小时内有效。', NULL, NULL, NULL, NULL, NULL, 1, '2012-06-07 16:17:53');
INSERT INTO `tbl_mobile_validate` VALUES (115, '13568565698', 'zWsO58', '脉络验证码是zWsO58，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-06-19 11:36:02');
INSERT INTO `tbl_mobile_validate` VALUES (116, '13688560088', 'EmdYWV', '脉络验证码是EmdYWV，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-06-19 15:09:52');
INSERT INTO `tbl_mobile_validate` VALUES (117, '18601150270', 'ZgmuOv', '脉络验证码是ZgmuOv，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-06-19 15:21:52');
INSERT INTO `tbl_mobile_validate` VALUES (118, '18601150272', 'SNULBf', '脉络验证码是SNULBf，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-06-19 15:24:16');
INSERT INTO `tbl_mobile_validate` VALUES (119, '18601140280', 'POTeCN', '脉络验证码是POTeCN，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-06-19 15:28:35');
INSERT INTO `tbl_mobile_validate` VALUES (120, '18601140281', '70gq61', '脉络验证码是70gq61，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-06-19 15:31:46');
INSERT INTO `tbl_mobile_validate` VALUES (121, '18601140271', 'ksA734', '脉络验证码是ksA734，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-06-19 15:38:54');
INSERT INTO `tbl_mobile_validate` VALUES (122, '18601140273', 'CwaZYB', '脉络验证码是CwaZYB，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-06-19 15:41:23');
INSERT INTO `tbl_mobile_validate` VALUES (123, '18601140274', 'QwFzkP', '脉络验证码是QwFzkP，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-06-19 15:48:56');
INSERT INTO `tbl_mobile_validate` VALUES (124, '18601140275', 'Fwssdl', '脉络验证码是Fwssdl，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-06-19 15:51:06');
INSERT INTO `tbl_mobile_validate` VALUES (125, '18601140276', 'lGVv39', '脉络验证码是lGVv39，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-06-19 15:53:34');
INSERT INTO `tbl_mobile_validate` VALUES (126, '18601140277', '1xnjRv', '脉络验证码是1xnjRv，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-06-19 16:01:42');
INSERT INTO `tbl_mobile_validate` VALUES (127, '18601140271', 'NsFu8a', '脉络验证码是NsFu8a，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-06-19 16:04:10');
INSERT INTO `tbl_mobile_validate` VALUES (128, '18601140272', 'T9dFVp', '脉络验证码是T9dFVp，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-06-19 16:05:49');
INSERT INTO `tbl_mobile_validate` VALUES (129, '18601140270', 'MJkDFz', '您的脉络身份校验码是MJkDFz，请及时修改密码。', NULL, NULL, NULL, '1', NULL, 4, '2012-06-27 17:24:19');
INSERT INTO `tbl_mobile_validate` VALUES (130, '18601140279', '4WUyJb', '脉络验证码是4WUyJb，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-06-27 17:30:21');
INSERT INTO `tbl_mobile_validate` VALUES (131, '18601140280', 'TznrQr', '脉络验证码是TznrQr，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-07-06 13:00:26');
INSERT INTO `tbl_mobile_validate` VALUES (132, '18601140270', 'sSHcqZ', '您的脉络身份校验码是sSHcqZ，请及时修改密码。', NULL, NULL, NULL, NULL, NULL, 4, '2012-07-16 18:17:02');
INSERT INTO `tbl_mobile_validate` VALUES (133, '18600000222', 'obR2Th', '脉络验证码是obR2Th，验证码半小时内有效。', NULL, NULL, NULL, NULL, NULL, 1, '2012-07-31 11:33:49');
INSERT INTO `tbl_mobile_validate` VALUES (134, '18601140200', 'aarZRm', '脉络验证码是aarZRm，验证码半小时内有效。', NULL, NULL, NULL, NULL, NULL, 1, '2012-07-31 12:09:45');
INSERT INTO `tbl_mobile_validate` VALUES (135, '18601140289', 'yZzMVe', '脉络验证码是yZzMVe，验证码半小时内有效。', NULL, NULL, NULL, NULL, NULL, 1, '2012-07-31 12:42:37');
INSERT INTO `tbl_mobile_validate` VALUES (136, '18601140290', 'OuMETm', '脉络验证码是OuMETm，验证码半小时内有效。', NULL, NULL, NULL, NULL, NULL, 1, '2012-07-31 13:23:54');
INSERT INTO `tbl_mobile_validate` VALUES (137, '18601140290', 'nPlbTA', '脉络验证码是nPlbTA，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-07-31 13:34:24');
INSERT INTO `tbl_mobile_validate` VALUES (138, '18601140291', '5ejdhJ', '脉络验证码是5ejdhJ，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-07-31 13:54:50');
INSERT INTO `tbl_mobile_validate` VALUES (139, '18601140298', 'Y5DkCM', '脉络验证码是Y5DkCM，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-07-31 15:23:07');
INSERT INTO `tbl_mobile_validate` VALUES (140, '18601140292', '8Vvsym', '脉络验证码是8Vvsym，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-07-31 15:27:33');
INSERT INTO `tbl_mobile_validate` VALUES (141, '18601140293', 'WGBz18', '脉络验证码是WGBz18，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-07-31 15:28:46');
INSERT INTO `tbl_mobile_validate` VALUES (142, '18601140294', 'JfFWxa', '脉络验证码是JfFWxa，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-07-31 15:34:21');
INSERT INTO `tbl_mobile_validate` VALUES (143, '18601140295', 'ktr4L6', '脉络验证码是ktr4L6，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-07-31 15:37:01');
INSERT INTO `tbl_mobile_validate` VALUES (144, '18601140296', 'hRHpCj', '脉络验证码是hRHpCj，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-07-31 15:42:16');
INSERT INTO `tbl_mobile_validate` VALUES (145, '18601140297', 'W8rGIg', '脉络验证码是W8rGIg，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-07-31 15:50:16');
INSERT INTO `tbl_mobile_validate` VALUES (146, '18601140299', '8a3z57', '脉络验证码是8a3z57，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-07-31 15:51:56');
INSERT INTO `tbl_mobile_validate` VALUES (147, '18601140300', '4V97Yz', '脉络验证码是4V97Yz，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-07-31 15:57:31');
INSERT INTO `tbl_mobile_validate` VALUES (148, '18601140301', '7ZMAbN', '脉络验证码是7ZMAbN，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-07-31 16:01:01');
INSERT INTO `tbl_mobile_validate` VALUES (149, '18601140302', 'p8Vbtg', '脉络验证码是p8Vbtg，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-07-31 16:12:51');
INSERT INTO `tbl_mobile_validate` VALUES (150, '18601140303', '4xrfMk', '脉络验证码是4xrfMk，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-07-31 16:41:14');
INSERT INTO `tbl_mobile_validate` VALUES (151, '18601140304', 'RmOzIq', '脉络验证码是RmOzIq，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-07-31 16:43:28');
INSERT INTO `tbl_mobile_validate` VALUES (152, '18601140305', 'Drzclc', '脉络验证码是Drzclc，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-07-31 16:45:04');
INSERT INTO `tbl_mobile_validate` VALUES (153, '18601140306', 'Se0dcS', '脉络验证码是Se0dcS，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-07-31 16:50:37');
INSERT INTO `tbl_mobile_validate` VALUES (154, '18601140307', 'IaUDMY', '脉络验证码是IaUDMY，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-07-31 16:54:15');
INSERT INTO `tbl_mobile_validate` VALUES (155, '18601140308', 'UhMDzf', '脉络验证码是UhMDzf，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-07-31 16:57:26');
INSERT INTO `tbl_mobile_validate` VALUES (156, '18601140309', 'MVQNDm', '脉络验证码是MVQNDm，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-07-31 17:06:40');
INSERT INTO `tbl_mobile_validate` VALUES (157, '18601140250', '78QI79', '脉络验证码是78QI79，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-01 14:13:26');
INSERT INTO `tbl_mobile_validate` VALUES (158, '18601140251', 'kYk9cW', '脉络验证码是kYk9cW，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-01 14:21:40');
INSERT INTO `tbl_mobile_validate` VALUES (159, '18601140252', 'RmntFC', '脉络验证码是RmntFC，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-01 15:03:07');
INSERT INTO `tbl_mobile_validate` VALUES (160, '18601140253', 'ZTuj9c', '脉络验证码是ZTuj9c，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-01 15:14:05');
INSERT INTO `tbl_mobile_validate` VALUES (161, '18601140254', 'VrdffR', '脉络验证码是VrdffR，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-01 15:18:15');
INSERT INTO `tbl_mobile_validate` VALUES (162, '18601140255', '7sUzxe', '脉络验证码是7sUzxe，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-01 15:23:52');
INSERT INTO `tbl_mobile_validate` VALUES (163, '18601140256', 'U6TixY', '脉络验证码是U6TixY，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-01 15:39:18');
INSERT INTO `tbl_mobile_validate` VALUES (164, '18601140257', 'r46QlB', '脉络验证码是r46QlB，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-01 15:54:45');
INSERT INTO `tbl_mobile_validate` VALUES (165, '18601140260', 'WHn22i', '脉络验证码是WHn22i，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-01 16:31:07');
INSERT INTO `tbl_mobile_validate` VALUES (166, '18601140261', 'TYjgfV', '脉络验证码是TYjgfV，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-01 16:35:58');
INSERT INTO `tbl_mobile_validate` VALUES (167, '18601140262', 'L2zoEP', '脉络验证码是L2zoEP，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-01 16:38:41');
INSERT INTO `tbl_mobile_validate` VALUES (168, '18601140263', 'FqBHPn', '脉络验证码是FqBHPn，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-01 16:44:59');
INSERT INTO `tbl_mobile_validate` VALUES (169, '18601140271', 'uyZVjS', '脉络验证码是uyZVjS，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-01 17:05:35');
INSERT INTO `tbl_mobile_validate` VALUES (170, '18601140271', 'nZDPMu', '脉络验证码是nZDPMu，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-01 17:06:48');
INSERT INTO `tbl_mobile_validate` VALUES (171, '18601140272', 'QOpCld', '脉络验证码是QOpCld，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-01 17:26:27');
INSERT INTO `tbl_mobile_validate` VALUES (172, '18601140279', '6SRZll', '脉络验证码是6SRZll，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-02 11:08:28');
INSERT INTO `tbl_mobile_validate` VALUES (173, '13365425685', 'dSqG1G', '脉络验证码是dSqG1G，验证码半小时内有效。', NULL, NULL, NULL, NULL, NULL, 1, '2012-08-02 11:26:16');
INSERT INTO `tbl_mobile_validate` VALUES (174, '13366525686', '470BYq', '脉络验证码是470BYq，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-02 11:26:37');
INSERT INTO `tbl_mobile_validate` VALUES (175, '18601140278', 'PEFA5j', '脉络验证码是PEFA5j，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-02 11:39:47');
INSERT INTO `tbl_mobile_validate` VALUES (176, '18601150270', '5fZ1OD', '脉络验证码是5fZ1OD，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-02 14:40:20');
INSERT INTO `tbl_mobile_validate` VALUES (177, '18601150271', '2AU0pb', '脉络验证码是2AU0pb，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-02 15:17:47');
INSERT INTO `tbl_mobile_validate` VALUES (178, '18601140280', '5TKscz', '脉络验证码是5TKscz，验证码半小时内有效。', NULL, NULL, NULL, NULL, NULL, 1, '2012-08-02 15:23:52');
INSERT INTO `tbl_mobile_validate` VALUES (179, '18601140280', 'uiOGcj', '脉络验证码是uiOGcj，验证码半小时内有效。', NULL, NULL, NULL, NULL, NULL, 1, '2012-08-02 15:27:54');
INSERT INTO `tbl_mobile_validate` VALUES (180, '18601140280', '1qm1Ob', '脉络验证码是1qm1Ob，验证码半小时内有效。', NULL, NULL, NULL, NULL, NULL, 1, '2012-08-02 15:29:52');
INSERT INTO `tbl_mobile_validate` VALUES (181, '18601140280', 'Ttxhgd', '脉络验证码是Ttxhgd，验证码半小时内有效。', NULL, NULL, NULL, NULL, NULL, 1, '2012-08-02 15:31:27');
INSERT INTO `tbl_mobile_validate` VALUES (182, '18601140280', 'hbAQiT', '脉络验证码是hbAQiT，验证码半小时内有效。', NULL, NULL, NULL, NULL, NULL, 1, '2012-08-02 15:32:34');
INSERT INTO `tbl_mobile_validate` VALUES (183, '18601140280', 'mxTnAQ', '脉络验证码是mxTnAQ，验证码半小时内有效。', NULL, NULL, NULL, NULL, NULL, 1, '2012-08-02 15:33:36');
INSERT INTO `tbl_mobile_validate` VALUES (184, '18601140280', 'JvRF16', '脉络验证码是JvRF16，验证码半小时内有效。', NULL, NULL, NULL, NULL, NULL, 1, '2012-08-02 15:35:14');
INSERT INTO `tbl_mobile_validate` VALUES (185, '18601140280', 'h0or4O', '脉络验证码是h0or4O，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-02 15:36:42');
INSERT INTO `tbl_mobile_validate` VALUES (186, '18601140281', 'jf0Y7y', '脉络验证码是jf0Y7y，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-02 15:43:10');
INSERT INTO `tbl_mobile_validate` VALUES (187, '18601140282', '6njJOd', '脉络验证码是6njJOd，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-02 15:46:31');
INSERT INTO `tbl_mobile_validate` VALUES (188, '18601140283', '90MvCw', '脉络验证码是90MvCw，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-02 15:50:46');
INSERT INTO `tbl_mobile_validate` VALUES (189, '18601140284', 'jTcgxR', '脉络验证码是jTcgxR，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-02 15:53:49');
INSERT INTO `tbl_mobile_validate` VALUES (190, '18601140285', 'V75B87', '脉络验证码是V75B87，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-02 16:04:38');
INSERT INTO `tbl_mobile_validate` VALUES (191, '18601140286', 'UBpapb', '脉络验证码是UBpapb，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-02 16:08:21');
INSERT INTO `tbl_mobile_validate` VALUES (192, '18601140287', 'sFChFi', '脉络验证码是sFChFi，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-02 16:12:19');
INSERT INTO `tbl_mobile_validate` VALUES (193, '18601140288', 'CtN89R', '脉络验证码是CtN89R，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-02 16:15:16');
INSERT INTO `tbl_mobile_validate` VALUES (194, '13365896523', 'jxo3Le', '脉络验证码是jxo3Le，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-02 16:21:19');
INSERT INTO `tbl_mobile_validate` VALUES (195, '13365896523', 'lySqrV', '脉络验证码是lySqrV，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-02 16:31:44');
INSERT INTO `tbl_mobile_validate` VALUES (196, '13365896523', 'qHaU69', '脉络验证码是qHaU69，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-02 16:33:39');
INSERT INTO `tbl_mobile_validate` VALUES (197, '18601140271', '8Ffdux', '脉络验证码是8Ffdux，验证码半小时内有效。', NULL, NULL, NULL, '1', NULL, 1, '2012-08-02 16:39:10');

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_modify_records`
-- 

DROP TABLE IF EXISTS `tbl_modify_records`;
CREATE TABLE IF NOT EXISTS `tbl_modify_records` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `modified_user` int(11) NOT NULL COMMENT '被修改信息的用户id',
  `model` varchar(30) NOT NULL COMMENT '省去表前缀',
  `model_id` int(11) unsigned NOT NULL default '0',
  `type` char(1) default '0',
  `data` text NOT NULL COMMENT '修改数据',
  `create_ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `status` tinyint(2) unsigned NOT NULL default '0' COMMENT '1:接受 2:拒绝',
  PRIMARY KEY  (`id`),
  KEY `FK_modify_user_id` (`user_id`),
  KEY `FK_modified_user_id` (`modified_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=105 ;

-- 
-- 导出表中的数据 `tbl_modify_records`
-- 

INSERT INTO `tbl_modify_records` VALUES (12, 40, 6, 'Profiles', 6, '2', '{"title":"phpaaa","location":"1-2"}', '2012-07-24 14:46:36', 0);
INSERT INTO `tbl_modify_records` VALUES (13, 102, 8, 'Profiles', 8, '2', '{"location":"3-4","company":"index informatiics limitied company","industry":"2-2","title":"ios"}', '2012-07-24 15:31:02', 0);
INSERT INTO `tbl_modify_records` VALUES (15, 102, 8, 'Educations', 0, '1', '{"date_from":"2012-01","date_to":"2012-01"}', '2012-07-25 17:33:01', 0);
INSERT INTO `tbl_modify_records` VALUES (16, 102, 8, 'Positions', 0, '1', '{"title":"dsadas","date_to":"1954-01","company":"dsadasdas","date_from":"1951-01","location":"1-1","industry":"4-3"}', '2012-07-25 17:48:53', 0);
INSERT INTO `tbl_modify_records` VALUES (17, 102, 8, 'Positions', 0, '1', '{"title":"dasdas","date_to":"2012-01","company":"dsadasdas","date_from":"2012-01","location":"1-1","industry":"1-1"}', '2012-07-25 17:49:42', 0);
INSERT INTO `tbl_modify_records` VALUES (23, 40, 6, 'Summary', 6, '2', '{"summary":"ffffffffafffff"}', '2012-07-26 14:10:06', 0);
INSERT INTO `tbl_modify_records` VALUES (26, 40, 102, 'Profiles', 102, '2', '{"address":"\\u5317\\u4eac\\u5e02\\u671d\\u9633\\u533a\\u5149\\u534e\\u8def22\\u53f7\\u4e09\\u5355\\u5143-1716","location":"2-6","company":"Index infor","industry":"3-1"}', '2012-07-26 14:13:11', 1);
INSERT INTO `tbl_modify_records` VALUES (27, 102, 8, 'Summary', 8, '2', '{"summary":"f\\u2006s\\u2006d\\u2006f\\u2006s\\u2006da\\u2006f\\u2006s\\u2006f\\u2006d\\u2006sDADASDDASDSA"}', '2012-07-26 15:16:37', 0);
INSERT INTO `tbl_modify_records` VALUES (29, 102, 6, 'Profiles', 6, '2', '{"location":"1-1","company":"phpaaa","title":"Not Setting"}', '2012-07-27 14:30:24', 0);
INSERT INTO `tbl_modify_records` VALUES (41, 102, 7, 'Educations', 0, '1', '{"date_from":"2005-09","date_to":"2010-06"}', '2012-07-30 13:36:21', 0);
INSERT INTO `tbl_modify_records` VALUES (42, 102, 7, 'Educations', 0, '1', '{"major":"\\u8ba1\\u7b97\\u673a\\u79d1\\u5b66\\u4e0e\\u6280\\u672f","date_to":"2010-06","date_from":"2005-09","school_name":"\\u534e\\u4e2d\\u79d1\\u6280\\u5927\\u5b66","degree":"\\u672c\\u79d1"}', '2012-07-30 13:42:01', 0);
INSERT INTO `tbl_modify_records` VALUES (43, 102, 7, 'Positions', 0, '1', '{"title":"ios","date_to":"2012-08","company":"index","date_from":"2011-01","location":"2-1","industry":"1-1"}', '2012-07-30 13:46:13', 0);
INSERT INTO `tbl_modify_records` VALUES (44, 102, 7, 'Positions', 0, '1', '{"title":"jjj","date_to":"2012-01","company":"index","date_from":"2012-01","location":"1-8","industry":"1-2"}', '2012-07-30 13:47:06', 0);
INSERT INTO `tbl_modify_records` VALUES (45, 102, 7, 'Positions', 0, '1', '{"title":"dadas","date_to":"2012-01","company":"dasdsdas","date_from":"2012-01","location":"1-3","industry":"1-1"}', '2012-07-30 13:48:41', 0);
INSERT INTO `tbl_modify_records` VALUES (46, 102, 7, 'Summary', 7, '2', '{"summary":"be your personal best\\uff01hhhSSSSSdadasdasdas"}', '2012-07-30 13:49:43', 0);
INSERT INTO `tbl_modify_records` VALUES (48, 102, 8, 'Educations', 0, '1', '{"major":"dasdas","date_to":"2012-01","date_from":"2012-01","school_name":"dadasd","degree":"\\u521d\\u4e2d"}', '2012-07-30 14:18:58', 0);
INSERT INTO `tbl_modify_records` VALUES (56, 40, 6, 'Emails', 0, '1', '{"type":"Home","value":"bbkliulei@gmail.com"}', '2012-07-30 16:43:43', 0);
INSERT INTO `tbl_modify_records` VALUES (57, 40, 6, 'PhoneNumbers', 0, '1', '{"type":"Home","value":"13366576525"}', '2012-07-30 16:43:43', 0);
INSERT INTO `tbl_modify_records` VALUES (60, 40, 6, 'Speciality', 0, '1', '{"name":"aa","modify_id":"60"}', '2012-07-30 16:44:26', 0);
INSERT INTO `tbl_modify_records` VALUES (61, 40, 6, 'Speciality', 0, '1', '{"name":"bads","modify_id":"61"}', '2012-07-30 16:44:26', 0);
INSERT INTO `tbl_modify_records` VALUES (84, 102, 8, 'Speciality', 0, '1', '{"name":"ios"}', '2012-07-30 17:52:38', 0);
INSERT INTO `tbl_modify_records` VALUES (85, 102, 8, 'Speciality', 0, '1', '{"name":"java"}', '2012-07-30 17:52:38', 0);
INSERT INTO `tbl_modify_records` VALUES (86, 102, 40, 'Profiles', 40, '2', '{"location":"18-3","industry":"19-2"}', '2012-07-30 17:53:37', 0);
INSERT INTO `tbl_modify_records` VALUES (87, 102, 40, 'Summary', 40, '2', '{"summary":"affaaaafffffa\\u54c8\\u54c8"}', '2012-07-30 17:53:58', 0);
INSERT INTO `tbl_modify_records` VALUES (88, 223, 102, 'Profiles', 102, '2', '{"company":"Index informatics","location":"4-2","industry":"3-3"}', '2012-08-03 11:29:05', 1);
INSERT INTO `tbl_modify_records` VALUES (89, 223, 102, 'PhoneNumbers', 0, '1', '{"value":"15210715845","type":"Work"}', '2012-08-03 11:29:15', 1);
INSERT INTO `tbl_modify_records` VALUES (90, 223, 102, 'Speciality', 0, '1', '{"name":"\\u54c8\\u54c8\\u54c8"}', '2012-08-03 11:29:31', 1);
INSERT INTO `tbl_modify_records` VALUES (91, 223, 102, 'Speciality', 0, '1', '[""]', '2012-08-03 11:29:31', 1);
INSERT INTO `tbl_modify_records` VALUES (92, 223, 102, 'Summary', 102, '2', '{"summary":"\\u6211\\u662f\\u4e00\\u4e2a\\u7a0b\\u5e8f\\u5458\\uff0c\\u6211\\u5c31\\u662f\\u6211"}', '2012-08-03 11:29:42', 2);
INSERT INTO `tbl_modify_records` VALUES (93, 223, 102, 'IMAccounts', 0, '1', '{"value":"421384209","type":"QQ"}', '2012-08-03 15:13:58', 1);
INSERT INTO `tbl_modify_records` VALUES (94, 223, 102, 'Speciality', 0, '1', '{"name":"c"}', '2012-08-03 15:14:37', 1);
INSERT INTO `tbl_modify_records` VALUES (95, 223, 102, 'Speciality', 0, '1', '{"name":"\\u7a0b\\u5e8f"}', '2012-08-03 15:14:37', 1);
INSERT INTO `tbl_modify_records` VALUES (96, 223, 102, 'Positions', 0, '1', '{"title":"\\u804c\\u4f4d","date_to":"2012-01","company":"aa","date_from":"2012-01","location":"2-4","industry":"2-2"}', '2012-08-03 15:15:02', 1);
INSERT INTO `tbl_modify_records` VALUES (97, 223, 102, 'IMAccounts', 0, '1', '{"value":"37777666555","type":"QQ"}', '2012-08-03 15:22:17', 2);
INSERT INTO `tbl_modify_records` VALUES (98, 223, 102, 'IMAccounts', 0, '1', '{"value":"yalinuuudj@166.cojn","type":"MSN"}', '2012-08-03 15:22:17', 0);
INSERT INTO `tbl_modify_records` VALUES (99, 223, 102, 'Educations', 0, '1', '{"major":"\\u8ba1\\u7b97\\u673a","date_to":"2012-01","date_from":"2012-01","school_name":"\\u5317\\u4eac\\u5927\\u5b66","degree":"\\u672c\\u79d1"}', '2012-08-03 15:22:53', 1);
INSERT INTO `tbl_modify_records` VALUES (100, 223, 102, 'Speciality', 0, '1', '{"name":"hhah"}', '2012-08-03 15:23:05', 2);
INSERT INTO `tbl_modify_records` VALUES (101, 223, 102, 'Speciality', 0, '1', '{"name":"\\u53d1\\u51fa"}', '2012-08-03 15:23:05', 1);
INSERT INTO `tbl_modify_records` VALUES (102, 224, 6, 'Speciality', 0, '1', '{"name":"0000000000"}', '2012-08-03 19:17:25', 0);
INSERT INTO `tbl_modify_records` VALUES (103, 225, 130, 'Positions', 0, '1', '{"company":"theindex","title":"sw","location_p":"1","location":"1","start_year":"0","start_month":"1","end_year":"0","end_month":"12"}', '2012-08-13 17:54:18', 0);
INSERT INTO `tbl_modify_records` VALUES (104, 40, 26, 'Educations', 0, '1', '{"school_name":"\\u5317\\u4eac\\u8bed\\u8a00\\u5927\\u5b66","school":"8","degree":"\\u672c\\u79d1\\u5b66\\u751f","major":"\\u8ba1\\u7b97\\u673a","start_year":"1997","start_month":"1","end_year":"0","end_month":"12","activities":""}', '2012-08-14 15:40:14', 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_namecard_collection`
-- 

DROP TABLE IF EXISTS `tbl_namecard_collection`;
CREATE TABLE IF NOT EXISTS `tbl_namecard_collection` (
  `id` int(11) NOT NULL,
  `namecard_id` int(11) unsigned NOT NULL,
  `creation_ts` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `type` tinyint(4) default '0',
  UNIQUE KEY `UK_namecard_uniconnection` (`id`,`namecard_id`),
  KEY `FK_collection_namecard_id` (`namecard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `tbl_namecard_collection`
-- 

INSERT INTO `tbl_namecard_collection` VALUES (40, 114, '2012-08-07 11:22:31', 0);
INSERT INTO `tbl_namecard_collection` VALUES (40, 560, '2012-08-07 11:22:31', 0);
INSERT INTO `tbl_namecard_collection` VALUES (102, 1, '2012-07-06 16:40:59', 0);
INSERT INTO `tbl_namecard_collection` VALUES (102, 114, '2012-07-06 17:50:28', 0);
INSERT INTO `tbl_namecard_collection` VALUES (102, 134, '2012-07-06 17:57:01', 0);
INSERT INTO `tbl_namecard_collection` VALUES (102, 210, '2012-07-27 17:08:16', 0);
INSERT INTO `tbl_namecard_collection` VALUES (102, 297, '2012-07-27 17:08:42', 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_namecard_email`
-- 

DROP TABLE IF EXISTS `tbl_namecard_email`;
CREATE TABLE IF NOT EXISTS `tbl_namecard_email` (
  `id` int(11) NOT NULL auto_increment,
  `namecard_id` int(11) unsigned NOT NULL,
  `email` varchar(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  `private` char(1) default '0',
  PRIMARY KEY  (`id`),
  KEY `namecard_email` (`email`),
  KEY `FK_tbl_namecard_email` (`namecard_id`),
  KEY `FK_namecard_email_user` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `tbl_namecard_email`
-- 

INSERT INTO `tbl_namecard_email` VALUES (1, 478, 'bbkliulei@gmail.com', 6, '1');

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_namecard_mobile`
-- 

DROP TABLE IF EXISTS `tbl_namecard_mobile`;
CREATE TABLE IF NOT EXISTS `tbl_namecard_mobile` (
  `id` int(11) NOT NULL auto_increment,
  `namecard_id` int(11) unsigned NOT NULL,
  `mobile_number` varchar(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  `private` char(1) default '0',
  PRIMARY KEY  (`id`),
  KEY `IDX_mobile` (`mobile_number`),
  KEY `FK_mobile_namecard_id` (`namecard_id`),
  KEY `FK_namecard_mobile_user` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

-- 
-- 导出表中的数据 `tbl_namecard_mobile`
-- 

INSERT INTO `tbl_namecard_mobile` VALUES (11, 478, '13366576525', 6, '1');
INSERT INTO `tbl_namecard_mobile` VALUES (12, 134, '13365896523', 102, '0');

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_namecard_private`
-- 

DROP TABLE IF EXISTS `tbl_namecard_private`;
CREATE TABLE IF NOT EXISTS `tbl_namecard_private` (
  `uid` int(11) NOT NULL,
  `id` int(11) unsigned NOT NULL,
  `type` varchar(16) NOT NULL,
  KEY `FK_private_user_id` (`uid`),
  KEY `IDX_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `tbl_namecard_private`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_namecards`
-- 

DROP TABLE IF EXISTS `tbl_namecards`;
CREATE TABLE IF NOT EXISTS `tbl_namecards` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(128) NOT NULL,
  `company` varchar(30) default NULL,
  `title` varchar(30) default NULL,
  `industry` varchar(5) default NULL,
  `location` varchar(6) default NULL,
  `address` varchar(120) default NULL,
  `fixed_number` varchar(30) default NULL,
  `postcode` varchar(8) default NULL,
  `fax` varchar(10) default NULL,
  `user_id` int(11) default NULL,
  `template` tinyint(2) unsigned default NULL,
  `completeness` tinyint(2) unsigned default '0' COMMENT '资料完整度',
  `companies_num` tinyint(3) unsigned default '0',
  `emails_num` tinyint(3) unsigned default '0',
  `mobiles_num` tinyint(3) unsigned default '0',
  `collect_num` float unsigned default '0',
  `rank` int(11) unsigned default '0' COMMENT '含金量',
  `main_email` int(11) unsigned default NULL,
  `main_mobile` int(11) unsigned default NULL,
  `name_pinyin` varchar(60) default NULL,
  `company_pinyin` varchar(100) default NULL,
  `status` char(1) default '0' COMMENT '1:private, 2:verified, 3:both',
  PRIMARY KEY  (`id`),
  KEY `FK_namecard_user` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=562 ;

-- 
-- 导出表中的数据 `tbl_namecards`
-- 

INSERT INTO `tbl_namecards` VALUES (1, 'alex', '', 'cbhz', '6-1', '1-3', 'dtafljpdslvxewsc', '1869361', '273716', NULL, 6, 2, 0, 0, 0, 0, 0, 6, NULL, NULL, NULL, NULL, '2');
INSERT INTO `tbl_namecards` VALUES (36, 'abel', 'dbuamdkempfkmzuoiwk', 'msoj', '3-3', '11-3', 'domkgqiplhjcprde', '5926996', '880321', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'hemoli hewanli hmwl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (110, '王颖', 'sipvcynedtlradwrrja', 'eeyp', '3-3', '9-1', 'dujjyceqcppovciq', '6397775', '959172', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangying wy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (112, '王斌', 'rxtzghgiraoeougldry', 'axro', '3-3', '6-1', 'dswnqrvyspdoxdwq', '1121103', '819784', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangbin wb', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (113, '彭国梁', 'fgjhkpnuswpyufqdyue', 'keyy', '3-3', '1-3', 'cbokwsxifbpumepu', '1416860', '480538', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'bangguoliang pengguoliang bpgl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (114, '杨兰江', 'anrlgbvxnjiehtkhiab', 'zgqc', '3-3', '1-3', 'addnmnbwxqshtmlz', '3720991', '943341', NULL, 6, 7, 0, 0, 0, 0, 0, 9, NULL, NULL, 'yanglanjiang ylj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (115, '赵晓丽', 'kughynrfmfxacbdawtu', 'ruhs', '3-3', '1-3', 'dnzkulpgxzsbgxkr', '4354377', '275091', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhaoxiaoli zxl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (116, '左京允', 'bmhecnwjxzloqcjghqr', 'jcrg', '8-1', '4-1', 'bgojlqvstammzbtj', '608912', '545434', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zuojingyun zjy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (117, '沈慧中', 'czsxpxidzhnvwinduzb', 'wckd', '3-3', '1-3', 'brwqvyhwccffgpmt', '9981430', '901898', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chenhuizhong shenhuizhong cshz', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (118, '陈葵', 'inpcryzoflimmgozcyi', 'ghbz', '3-3', '1-3', 'aqqcwvxedkoqgtct', '8080415', '873188', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chenkui ck', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (119, '李新友', 'jqwtobwkfjaxticmdul', 'qdzj', '3-3', '1-3', 'ccqnufugmvhomban', '457784', '660247', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'lixinyou lxy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (120, '沈影冰', 'tqqlwklhhmdbkyvojag', 'juvx', '3-3', '10-3', 'dpgjjndsaurusyvj', '8047675', '681672', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chenyingbing shenyingbing csyb', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (121, '金洪林', 'tfmaqxqfxgorrrxfmwv', 'znfl', '3-3', '1-3', 'criimcjvqpohdpbg', '8865025', '427620', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'jinhonglin jhl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (122, '赵桂志', 'jgpsmgvgrxnbdnynhhj', 'vhpn', '3-3', '2-1', 'dpwngwiabotamdwe', '182103', '93085', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhaoguizhi zgz', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (123, '张起群', 'smnoongrosukpoavbtk', 'fuji', '6-1', '9-1', 'bzjqxcpolzejcvfd', '4315438', '182563', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangqiqun zqq', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (124, '黄智', 'kutojvunwxmtrgipiyz', 'neba', '3-3', '10-3', 'ceeorxatagmrywke', '1030882', '633564', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'huangzhi hz', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (125, '张永春', 'zledfqdpriamooppnms', 'akee', '7-1', '10-3', 'axuwteheugxjmsik', '2208097', '620128', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangyongchun zyc', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (126, '杨小鳞', 'pvpcwrinsarguazeqmo', 'omru', '6-1', '10-3', 'cakttejnwmdtpbkp', '7947841', '199950', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yangxiaolin yxl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (127, '黄一植', 'bwlarnfsmbgsimbancq', 'tevj', '3-3', '4-1', 'ajscmhzbxszqnedr', '3114915', '139366', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'huangyizhi hyz', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (128, '杨连云', 'ltkuvmaziefvfhiovzm', 'akdm', '3-3', '1-3', 'bthgdytsxekytqjp', '1731053', '96979', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yanglianyun yly', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (129, '陈英庆', 'betxcxptgtkzabntmoo', 'vnfj', '3-3', '1-3', 'bpizgxtkwrbugsoy', '9310519', '66799', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chenyingqing cyq', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (130, 'za', 'yoocacwyfgkkoinbzyj', 'elqi', '4-1', '1-3', 'cvsfxtqzqxcbyqoz', '1359436', '43060', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '0');
INSERT INTO `tbl_namecards` VALUES (131, '康燕文', 'mknuvrmikxrcqndblyd', 'jqnq', '3-3', '2-1', 'bhratyypomjyzbdb', '8865625', '14904', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'kangyanwen kyw', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (132, '孙宇平', 'qgypcexugxgioqddhxp', 'fttb', '3-3', '1-3', 'bbgoaksazqmoahbj', '249818', '945339', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'sunyuping xunyuping sxyp', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (133, '叶霖生', 'ucesywcbcsgkxpfldro', 'zyen', '6-1', '1-3', 'bhfsvhskcuhzeivq', '4652214', '681986', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'shelinsheng xielinsheng yelinsheng sxyls', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (134, '谢亦冰', '工作名称', 'hmrj', '3-3', '2-1', 'djiycemyoczguuza', '2511618', '573911', NULL, 6, 1, 26, 0, 0, 1, 0, 6, NULL, NULL, 'xieyibing xyb', 'gongzuomingchen gongzuomingcheng gzmcc', '0');
INSERT INTO `tbl_namecards` VALUES (135, '吴海东', 'rgvjcnogcihlejoswsg', 'oowf', '3-3', '1-3', 'cwxmbaglladilyke', '8601448', '823600', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wuhaidong whd', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (136, '朱运坚', 'jcxtjdmplagmpvverhg', 'yjgb', '3-3', '4-1', 'bhpqzrwkpxtuwhbv', '5472388', '396267', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'shuyunjian zhuyunjian szyj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (137, '王焰', 'wsdqnbtewajzkzpuujm', 'acqo', '3-3', '1-3', 'buhuqenrsjizapbp', '1557596', '510537', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangyan wy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (138, '芮祥麟', 'ejvxmyjbcbdmflkhzwt', 'gmms', '3-3', '2-1', 'cboajxadvclnkcfn', '1370819', '363883', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'ruixianglin rxl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (139, '杨滨', 'hqssxmnwyemlwfedpeh', 'ebnv', '3-3', '1-3', 'babqvzorwkdsbswt', '2181307', '287804', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yangbin yb', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (140, '吴亘', 'xaducrnciscvqvtwxke', 'dufb', '3-3', '1-3', 'exneafsxvuiybise', '6794077', '347374', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wugen wg', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (141, '孙清君', 'pfnwruzvxzytomextlz', 'ewks', '3-3', '9-1', 'ejmaqdworqgpcmwp', '7426465', '873457', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'sunqingjun xunqingjun sxqj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (142, '施运涛', 'gahycbkwnvkixxoxbym', 'kyjm', '3-3', '4-1', 'dfvmczhduuiejjio', '6750095', '325166', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'shiyuntao syt', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (143, '吕丹丹', 'pmtbmwauyfekvajwyji', 'ndrf', '3-3', '10-2', 'aysknotwycwamjxz', '1471080', '5457', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'lvdandan ldd', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (144, '杨涛', 'dianegymcprylmcprag', 'kwfr', '3-3', '9-1', 'daanktxbkckpirqh', '7105115', '51786', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yangtao yt', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (145, '葛亮', 'vdsjknpxrjwoshjiobg', 'kvbq', '3-3', '10-2', 'ehyljcfqcdjyekll', '1112337', '242563', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'geliang gl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (146, '吴鹰', 'vrqgnzeebbhzfcnysfn', 'wnpf', '3-3', '1-3', 'ciqqpilakkoxvagj', '4246339', '57455', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wuying wy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (147, '倪小东', 'qxydjgcfgdwhynoqxwv', 'cexd', '3-3', '4-1', 'bulxyfmcpqsqquan', '7894688', '559586', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'nixiaodong nxd', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (148, '徐承雷', 'squyihxlbnkmakglkqo', 'viqb', '3-3', '1-3', 'cyinyfdovawlsyik', '6734421', '625568', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'xuchenglei xcl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (149, '张平和', 'smdiorhooflmglohisk', 'xcmx', '5-1', '10-3', 'eihyxjhljchjpkpn', '9988043', '449081', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangpinghe zhangpinghu zhangpinghuo zphhh', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (150, '邱雯', 'kliwsmtnpmzyfyzbmnh', 'zmmj', '3-3', '1-3', 'cvnfsezoikvmxeyi', '9736952', '368704', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'qiuwen qw', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (151, '何燕宏', 'vvehwmwvisnhilhmime', 'hcad', '3-3', '1-3', 'dfsdwsclovhhroze', '8720632', '496275', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'heyanhong hyh', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (152, '苏海', 'atzvgzdrudtpykmedxc', 'japm', '5-1', '1-3', 'bnazedlovyybrjdu', '4392306', '375265', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'suhai sh', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (153, '杨娜', 'ojiipkcvbnfcuronuby', 'cwab', '7-1', '1-3', 'bxwpinznmfwikcqk', '5799635', '387502', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yangna yangnuo ynn', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (154, '程博', 'smsdgbzeyhstacjzooj', 'hffw', '4-1', '1-3', 'dbibbfmwweomajwq', '5821257', '811713', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chengbo cb', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (155, '胡国强', 'viqrmdpjmublwmckksc', 'ekae', '3-3', '3-1', 'coamjnouvgekupjz', '1707382', '896061', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'huguojiang huguoqiang hgjq', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (156, '喻建军', 'agaaplagodazeeizkth', 'cnnh', '3-3', '1-3', 'dqbfqyijpucpxyha', '1073138', '45167', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yujianjun yjj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (157, '赵亚利', 'rgdznvifjfbojllurrd', 'wimy', '5-1', '1-3', 'cmhqcbanmbzuevhe', '243544', '537650', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhaoyali zyl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (158, '于勇', 'hoqwxtphdtcxhpfygcv', 'bdxw', '3-3', '10-2', 'dohpqpzkobpfeiqw', '7998307', '552753', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yuyong yy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (159, '张梅', 'jxviwjbuqbivgtukfot', 'rqam', '5-1', '1-3', 'bincurymmdcridgr', '9260904', '150812', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangmei zm', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (160, '施泽忠', 'zzccppkatclllxgegkf', 'gtlv', '3-3', '8-1', 'cytrzqufpktqcriv', '2309602', '95805', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'shishizhong shizezhong sszz', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (161, '京百生', 'vcdnkwytxhdqkfzqpkx', 'hubt', '8-1', '1-3', 'btfbrfcoopifnzxd', '3765296', '26587', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'jingbaisheng jbs', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (162, '杨一平', 'fqjihmntgdlxujbrjuv', 'ptcf', '3-3', '1-3', 'bzvejedectmdjvnf', '1897676', '845520', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yangyiping yyp', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (163, '林琪', 'qtlbfxulpxspuhijxtl', 'bjft', '6-1', '1-3', 'bnkvvgkftykbdexr', '8192493', '147839', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'linqi lq', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (164, '林国范', 'mydgfbizdahglhmymlr', 'pqte', '3-3', '6-1', 'atqocrponmovslzu', '5269437', '202635', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'linguofan lgf', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (165, '陈梅', 'mmhaiqjoyjhnvnkpqxd', 'wzfr', '5-1', '1-3', 'beahysvfgnpydtfv', '1769708', '569662', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chenmei cm', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (166, '黄嵩', 'xozmdztvhsqxvsrdsfq', 'kavt', '5-1', '4-1', 'epcskljjtejhljdt', '3040231', '240402', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'huangsong hs', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (167, '孟向东', 'cjdioxtnoohwsadysjv', 'ndms', '6-1', '1-3', 'aljufejdxjypyqbh', '9892029', '493026', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'mengxiangdong mxd', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (168, '王涛', 'udtgnrmczrpsabpgkfe', 'hszk', '3-3', '1-3', 'clrsulpnkfpfgzud', '339454', '743923', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangtao wt', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (169, '韩晓庆', 'rpgewodafqzxzdonxwj', 'xdkw', '3-3', '6-1', 'cyfhhuahfzeeoctv', '2021183', '240537', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'hanxiaoqing hxq', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (170, '高军', 'zqabttfrddelupztivi', 'tmbd', '3-3', '1-3', 'chcgdpgwvheezmlr', '9087555', '970918', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'gaojun gj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (171, '王铁藩', 'xjlwfdqhatzmcofhxko', 'ybdz', '3-3', '1-3', 'dsvlvqekmlgkgeaz', '9374225', '132980', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangtiefan wtf', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (172, '晋晖', 'qvcevjonrlkabxcdoov', 'nxkp', '3-3', '4-1', 'cswjrhbjylvlhluw', '9608463', '752145', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'jinhui jh', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (173, '魏建德', 'ldcgmmxtixasyyzuarm', 'rhrb', '3-3', '1-3', 'eiunxowtgwibqsth', '9919639', '361787', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'weijiande wjd', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (174, '张伟东', 'gdgryjucrfxoqamqkpv', 'xrfm', '4-1', '9-1', 'aojmmxcokxfylfmy', '772809', '552498', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangweidong zwd', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (175, '张晋勇', 'yhzrfhhhkjlngfosbyu', 'mmaf', '5-1', '1-3', 'bvkvrxxpizcoexdw', '4105128', '677133', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangjinyong zjy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (176, '黎和生', 'ybehgkbfzenzkyjrayk', 'smlq', '3-3', '1-3', 'dnarxvgijfsxpygo', '8207215', '728170', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'lihesheng lihusheng lihuosheng lhhhs', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (177, '莫晓飞', 'xjzkqembrvhjhcbhyzt', 'bzfn', '3-3', '1-3', 'czxxllnxybkxkzwc', '8720691', '609453', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'moxiaofei muxiaofei mmxf', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (178, '李紫剑', 'srheirftkmwvhrflqzm', 'dlrs', '8-1', '1-3', 'bkjmpsumoqwuhzmv', '8981811', '862756', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'lizijian lzj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (179, '刘健', 'ufnpvupncbodmcwfhad', 'lfua', '3-3', '1-3', 'bcetqenqyzahebxu', '8746980', '485419', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liujian lj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (180, '解洪波', 'uatpbyileubfnnqwode', 'xuwy', '3-3', '2-1', 'bhuhjududcqazkzn', '6789472', '838827', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'jiehongbo xiehongbo jxhb', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (181, '黄彦生', 'qmdbxhxprvqpfirqzrm', 'fhys', '3-3', '4-1', 'dckcwlbzupzhltfd', '7706417', '737879', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'huangyansheng hys', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (182, '李延真', 'skmohqpquuckmzjoeyy', 'gdet', '3-3', '1-3', 'csrtjuannobjgoef', '8163673', '172914', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liyanzhen lyz', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (183, '李延兵', 'tnznthdjwlnfwwvywqh', 'suyn', '3-3', '1-3', 'edcldpvqizjxzofp', '7699113', '650934', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liyanbing lyb', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (184, '刘冰', 'omlbzoxyawgutmczwio', 'uphj', '3-3', '10-2', 'cplzrpbrahpnbamj', '4004549', '735930', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liubing lb', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (185, '刘立', 'pvjrnwfplyrifvacrsz', 'unoi', '4-1', '1-3', 'cqwnxevmbnyvinua', '6925407', '726850', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liuli ll', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (186, '李俊峰', 'iplgssfdgfqhutsnuqg', 'oval', '3-3', '1-3', 'ajdpmaalgrvqmmna', '2613387', '426457', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'lijunfeng ljf', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (187, '黄福盛', 'todgxxoxxecnjdojych', 'jqji', '3-3', '1-3', 'dxamtspqaukqlvhz', '2290717', '951738', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'huangfucheng huangfusheng hfcs', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (188, '覃白浪', 'vyhknkcbriqsmloggoq', 'gqsg', '3-3', '11-3', 'bltqhkxyjzlhuqtz', '3613424', '479320', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'qinbailang tanbailang qtbl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (189, '张兴春', 'vadgwivruzxxfvgdnlh', 'eiog', '3-3', '1-1', 'bmsqdyttwpcmouzv', '1194970', '541387', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangxingchun zxc', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (190, '韩玫', 'sjvbtlveuanlpvnzwmo', 'ctpo', '3-3', '1-3', 'dcijxoawdzbpjzsf', '5134579', '268974', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'hanmei hm', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (191, '邓平', 'asrmehptrfaljoxltdy', 'ytiy', '3-3', '1-1', 'dclycwufdezpgnmp', '2087987', '720711', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'dengping dp', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (192, '马一民', 'ykyiobpiawlxbjygfgz', 'lnxc', '7-1', '1-3', 'behnuqzkgysdeqkj', '5036197', '796631', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'mayimin mym', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (193, '李克山', 'rzqcikcictcedfaxuvc', 'jgnq', '3-3', '1-3', 'bocuqoljxfqybsnz', '8917024', '821023', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'likeshan lks', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (194, '孙勇', 'mqinwvssjbhfmwevgio', 'nvuy', '3-3', '1-3', 'afritygorgaiunkw', '9476533', '715224', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'sunyong xunyong sxy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (195, '夏永生', 'jgujlxgopeancsvmxep', 'lhmw', '3-3', '1-3', 'bmyixaxutngvspnh', '631591', '113053', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'xiayongsheng xys', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (196, '陈晓阳', 'llyiocepupixayrvsve', 'tyak', '3-3', '1-3', 'drurfivgqyecgkix', '4728358', '419591', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chenxiaoyang cxy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (197, '刘永生', 'diilnubkfloasnvsxqb', 'lvrk', '3-3', '4-1', 'byehjpkxxfdbadcs', '1747017', '758797', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liuyongsheng lys', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (198, '郭天学', 'iiwhxqugtmwlqwcdisv', 'zhgw', '3-3', '3-1', 'cslnfxpvqccylmms', '4550011', '535213', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'guotianxue gtx', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (199, '刘梦宇', 'hrjaxtubacqayrbmxrx', 'lzfe', '3-3', '11-3', 'bsrsysrjnweodbfo', '7509008', '399675', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liumengyu lmy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (200, '林柏均', 'jkdhxvnnvznxvubaogc', 'kzjf', '3-3', '1-3', 'eldaayohpcnaktmo', '3895005', '392736', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'linbaijun linbojun lbbj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (201, '李元兵', 'yyqivxijcqsjjwbpcfu', 'rcfn', '4-1', '2-1', 'bdoainullwaiqqwc', '6948001', '764654', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liyuanbing lyb', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (202, '陈昕', 'ppsviabhzhydjadywgr', 'flzy', '3-3', '1-3', 'egmamvhhmboqwxyu', '3054992', '645066', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chenxin cx', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (203, '侯秀英', 'fbqcejgiplppqnkwasz', 'zagd', '3-3', '1-3', 'bxqznocbcrvfnpzp', '4430957', '931366', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'houxiuying hxy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (204, '初升斌', 'goacyvcudidqcpsnltv', 'fthv', '3-3', '1-3', 'drvxcgqoydjdwgct', '2989812', '721631', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chushengbin csb', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (205, '蒲东皖', 'qrhcgbsauiyiqhgzdpg', 'epuv', '4-1', '6-1', 'ctgoaoymmrlcwlqz', '1656189', '814060', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'pudongwan pdw', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (206, '朱雷', 'lpkfhvhsqqgsxuekkst', 'guzq', '3-3', '6-1', 'brsdsbstoxbzumto', '9311507', '905409', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'shulei zhulei szl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (207, '陈延文', 'jxbvtxjouelnnzcbptz', 'sfop', '5-1', '1-3', 'actymqtjjoxpfcyw', '1588973', '84864', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chenyanwen cyw', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (208, '陈春芳', 'kvdmwawpyamnaoadtrr', 'wqxf', '3-3', '10-2', 'cmqkharpedlcvcls', '10341', '708093', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chenchunfang ccf', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (209, '张苏军', 'ylnyelikknbzkwunacm', 'fmxd', '3-3', '1-3', 'deyczedutxkqlcix', '5284790', '285875', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangsujun zsj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (210, '吴晓光', 'otfiedydfnvlaqvfvnj', 'jnre', '3-3', '9-1', 'eiwgavrehdrxufjl', '6392927', '305096', NULL, 6, 8, 0, 0, 0, 0, 0, 6, NULL, NULL, 'wuxiaoguang wxg', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (211, '杨集庄', 'xjlsjivmvcyfynsnchj', 'hfsj', '3-3', '1-3', 'aenbenxmdzgppstl', '6110267', '667856', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yangjizhuang yjz', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (212, '浦刚', 'vopqgegynwisrsexxwu', 'inph', '3-3', '1-3', 'dwanwgnwtkejnyuv', '1372554', '423994', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'pugang pg', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (213, '程立平', 'jupbeawhcbuxlcsxhkt', 'uawi', '3-3', '11-3', 'ewlivrywjfdyxoqx', '8531970', '116401', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chengliping clp', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (214, '张玉新', 'kehjcmlqxrymfhcwqkk', 'ylmw', '8-1', '1-3', 'aseennbsrueoyyvz', '8542189', '310022', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangyuxin zyx', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (215, '黄慧明', 'xnqsbjqhhfkrteiplut', 'hdxi', '3-3', '1-3', 'cxnvbqmbdimcbbhg', '7115035', '200910', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'huanghuiming hhm', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (216, '张小强', 'keglxiyorbdxezglgvm', 'siya', '3-3', '1-3', 'cmcqtrietixrllxf', '9948608', '74485', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangxiaojiang zhangxiaoqiang zxjq', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (217, '汤庆顺', 'fficiqtxopomoikjzug', 'sfdb', '3-3', '11-3', 'cqytpmcqgqadabpi', '8397936', '769693', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'shangqingshun tangqingshun stqs', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (218, '耿春明', 'ynycaezutwhshtdoblt', 'jeti', '3-3', '2-1', 'bujvqhmsceirszga', '2143859', '625013', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'gengchunming gcm', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (219, '曹洪', 'batebxpgdmwbvsnsitz', 'tgik', '3-3', '10-2', 'dcbxnaepqxqyltob', '5525488', '815986', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'caohong ch', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (220, '杜晖', 'kovpizawhvlefidvnnt', 'qtkz', '5-1', '1-1', 'dzfaqglwwaerfwaf', '1195861', '204891', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'duhui dh', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (221, '樊友民', 'vrykjfkpdrqqnnfznis', 'yzct', '3-3', '1-3', 'brvhqdponjzptylw', '9402845', '576497', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'fanyoumin fym', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (222, '杨阿群', 'zsdixbxkvyvrzqqjecg', 'tqew', '3-3', '1-3', 'dmnnhxtdyuiyaebs', '3426640', '267812', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yangaqun yangequn yaeq', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (223, '刘劲松', 'mnykktkhrrgmipoahmg', 'weqc', '3-3', '1-3', 'bhbspgxadwuxybay', '8924669', '609572', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liujinsong liujingsong ljjs', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (224, '张齐春', 'iojzhoffworktbuwvel', 'eyou', '3-3', '1-3', 'abtzakgrxazrquwp', '4343424', '244424', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangjichun zhangqichun zjqc', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (225, '赵陪宏', 'hcyueoufkuroupkkjjk', 'ehzr', '4-1', '4-1', 'bknthgohdkmqhtgc', '4943112', '393403', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhaopeihong zph', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (226, '范东明', 'lwqzcdllhggpprphhju', 'lqhz', '8-1', '2-1', 'cujuldclaamenjsv', '1685292', '233743', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'fandongming fdm', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (227, '薛向东', 'iajlxaunjyjgrrsjjtu', 'qgky', '3-3', '11-3', 'athriwujpvaysqws', '3597123', '988507', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'xuexiangdong xxd', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (228, '刘时成', 'hnwjhrrgwxcmniuxzsl', 'ykgt', '3-3', '8-1', 'dihbhyrnadqgcaed', '2929739', '241307', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liushicheng lsc', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (229, '许启明', 'nmensgzufshsrpwkuex', 'tfyz', '3-3', '6-1', 'dmoikeakedejigeo', '3857326', '241015', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'huqiming xuqiming hxqm', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (230, '杨雨青', 'rxiosivcmvddtawgzvg', 'wwzp', '3-3', '10-3', 'dibkhzzpxgxdgcjj', '497415', '481153', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yangyuqing yyq', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (231, '李立江', 'waecjxdfvbwosgvbpqo', 'dteb', '3-3', '3-1', 'bemaeiwqbvbojwjd', '915097', '682721', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'lilijiang llj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (232, '景韶光', 'ikwwsmhuqvxlkenqyra', 'adul', '3-3', '1-3', 'czgxytllmknlzxtq', '3083243', '970147', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'jingshaoguang yingshaoguang jysg', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (233, '李宝明', 'yaubnszfqxvktcbxbjk', 'rllb', '3-3', '11-3', 'bkunguqffolnvyrs', '2670925', '802572', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'libaoming lbm', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (234, '周泽湘', 'uvktjbcribosqytqiya', 'kuya', '3-3', '1-3', 'abdxmqxwqooigaeq', '4104894', '102420', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhoushixiang zhouzexiang zszx', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (235, '刘明光', 'bbrngemttnijylpnomu', 'zojv', '3-3', '6-1', 'cckvrvmrnfozsfsc', '2511696', '104384', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liumingguang lmg', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (236, '周鸿强', 'zwdjdtftsmyrujsptqz', 'qnyd', '3-3', '3-1', 'aiqovgvrtgdyvacn', '243800', '214661', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhouhongjiang zhouhongqiang zhjq', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (237, '杨英选', 'qfrfxennjwugeowmbuo', 'fxsg', '3-3', '1-3', 'diwhcsomgsavxkkk', '3683912', '760152', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yangyingxuan yyx', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (238, '陈学智', 'jjabcpxipwcgksbpcbu', 'fyqv', '3-3', '2-1', 'crotzvkhxtqheasj', '7688163', '156780', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chenxuezhi cxz', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (239, '毕旭光', 'veyrvmcayqalnxvpfxg', 'jyaj', '8-1', '1-3', 'chbwrzhbvqcydwhp', '7389079', '503445', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'bixuguang bxg', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (240, '于伟', 'cwsftotdxsxlkhvcuix', 'dwfk', '8-1', '1-3', 'aoqbkjhmmyqvciiz', '3880907', '46885', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yuwei yw', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (241, '陈勇', 'xsubjkkqqqmxlvuukzs', 'rnbx', '8-1', '1-3', 'dwaszynevwykdaud', '7237300', '724089', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chenyong cy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (242, '郑小峰', 'gatrpiwvobpfyejqpww', 'zboj', '8-1', '1-3', 'cpemuovjqltkjexs', '4543779', '479792', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhengxiaofeng zxf', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (243, '张东营', 'pzlewmcexkqjkmnuske', 'wspb', '8-1', '10-2', 'akudxxmkuqwyjudc', '1006994', '226692', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangdongying zdy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (244, '刘长洪', 'fvzwnlxmtuhcdulatkj', 'jjke', '3-3', '1-3', 'dgjifzywbwekuiak', '1403633', '694087', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liuchanghong liuzhanghong lczh', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (245, '张树本', 'fepvztgubtqmonpuqwe', 'gudu', '3-3', '1-3', 'bzoehegcvkgfxiqt', '3997185', '790360', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangshuben zsb', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (246, '陈小光', 'oiaokmmnzkfelguuzew', 'etlj', '8-1', '3-1', 'cdqxxxkzakrvdsem', '5775025', '869537', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chenxiaoguang cxg', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (247, '朱建', 'afgfadqgutehktcpxdv', 'blxl', '3-3', '2-1', 'duoyobhoovqpanyg', '6883571', '976605', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'shujian zhujian szj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (248, '须文焱', 'lbgjvhtrzqiauadqrfo', 'vyfe', '3-3', '1-3', 'bnxccmgtuwelpner', '7092782', '274415', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'xuwenyan xwy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (249, '张广厚', 'gqlfezxoovzerwljprf', 'yljo', '3-3', '1-1', 'bfwrxelfgwajzbcs', '4813199', '442259', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhanganhou zhangguanghou zagh', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (250, '武一农', 'vzoykbgwueavyeuzxsl', 'ehci', '3-3', '6-1', 'eoobdojvwrondqxo', '2787647', '388053', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wuyinong wyn', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (251, '周鸿祎', 'jzidojlqjldqvgnsvpq', 'dgmv', '3-3', '2-1', 'cdfiagnlouqmqzfr', '9498640', '613486', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhouhongyi zhy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (252, '杜伟', 'kabtlqppmtoseshplsu', 'dgbf', '3-3', '10-3', 'aymksnpsexqvtbhr', '9130259', '903274', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'duwei dw', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (253, '孙伟', 'vffjqcpbglmpmvwyqxa', 'hnvq', '3-3', '3-1', 'ekqcnvifgdfszjwh', '7155374', '675912', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'sunwei xunwei sxw', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (254, '任元会', 'awxptnhmwzuwxzlvzir', 'byan', '3-3', '1-3', 'dcsfkpxzqzfcosnk', '8386097', '669738', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'renyuanhui renyuankuai ryhk', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (255, '施志军', 'ntvxxiohnpjpcmshwxk', 'ldps', '3-3', '1-3', 'cituopmflmikvkzd', '464363', '320957', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'shizhijun szj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (256, '周育群', 'pdotiawycalhvmebmpa', 'btxz', '3-3', '1-3', 'cgogmbtcjkzrmyhn', '7163527', '595569', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhouyoqun zhouyuqun zyyq', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (257, '黄海珈', 'jngyvfuuvjftswuluix', 'xmrt', '7-1', '1-3', 'eipwtpgwnqwdymmc', '4424543', '14976', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'huanghaijia hhj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (258, '王东宁', 'ccooexhgwtrveyiyksj', 'iast', '7-1', '1-3', 'cyhqjvzzmxnqipoz', '632136', '288173', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangdongning wangdongzhu wdnz', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (259, '李剑', 'jabzlyauuqtytehltpe', 'atmn', '7-1', '1-1', 'ersnniehxpzvsohq', '9887054', '395936', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'lijian lj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (260, '吴女士', 'ntrftahgjxsddylloys', 'bshj', '3-3', '2-1', 'amqrldznbiigoxwh', '7538862', '115162', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wunvshi wurushi wnrs', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (261, '张磊', 'otccigkykrixlelwmuz', 'ifze', '3-3', '1-3', 'cnaussktovtrtxmm', '8033149', '388004', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhanglei zl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (262, '黄磊', 'hllyjgdwaqlbwcwzsgx', 'ixax', '3-3', '1-3', 'dahadfaeqdrrzwup', '7549159', '594532', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'huanglei hl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (263, '丁晓建', 'qyahukmovbioxzzjcvn', 'tydz', '8-1', '1-3', 'bqhrquvrmfejqqln', '3646348', '808650', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'dingxiaojian zhengxiaojian dzxj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (264, '杨明', 'jmttyiaebmgrapjtilx', 'saqe', '3-3', '1-3', 'dcokvkeunrvvfmxv', '5584263', '259656', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yangming ym', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (266, '李平', 'pywnuwwgaquaafgqtke', 'fgee', '3-3', '1-3', 'bwkdgfcoauoveaul', '8158582', '582672', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liping lp', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (267, '姚天宏', 'cjnkxhotqoyitaqtrvz', 'gmmc', '3-3', '1-3', 'bjwduzpwvrxyjptn', '9846087', '296379', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yaotianhong yth', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (268, '李志明', 'tyajfteydvjqtmjzevh', 'rrtz', '3-3', '1-3', 'dggigfqobxyeiyjg', '4754692', '733877', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'lizhiming lzm', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (269, '胡斐轩', 'mopshvgptmadlixourm', 'ryjn', '3-3', '11-3', 'ccoewclftpbcozmp', '4235198', '780249', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'hufeixuan hfx', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (270, '丁辉', 'cbunwaqdhwztxekumxn', 'gpos', '3-3', '1-3', 'atcxpwgkngiyvaji', '6911914', '699614', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'dinghui zhenghui dzh', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (271, '叶迅', 'zqgjkqmydzuiizikakf', 'gfrz', '3-3', '4-1', 'akuylzalmmmjmdkw', '1853980', '157324', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'shexun xiexun yexun sxyx', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (272, '郑红', 'ryxgkcmhxiajwkknqlo', 'phrv', '8-1', '11-3', 'avqbjihzspmzvsyh', '8534156', '687779', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhenggong zhenghong zgh', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (273, '李钢', 'mttcvnyncqsvizblfwd', 'duic', '7-1', '11-3', 'dzvnorknenywsamw', '7108840', '966925', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'ligang lg', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (274, '佟勇', 'gzawzhjvsfmdasascda', 'vdrz', '3-3', '1-3', 'ckfjsjbsswhlbbnl', '9941735', '771287', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'tongyong ty', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (275, '刘剑', 'yqwxmzwpidhcdraeuaq', 'wikq', '3-3', '10-3', 'bcphxxebdurpffgo', '8382157', '955661', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liujian lj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (276, '欧阳玲', 'yhgaibhnkbacogyvtuc', 'tezi', '7-1', '1-3', 'bhghkkrbmhlovvro', '2085579', '464442', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'ouyangling oyl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (277, '周利达', 'vorihhwsdwhemeunjto', 'dxrp', '3-3', '1-3', 'dboogiudydecmpob', '5281423', '455231', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhoulida zld', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (278, '邵百庆', 'hvqpkindmfinsfzfmmp', 'kakc', '3-3', '1-3', 'akaazkxngtnvxjwr', '150381', '882829', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'shaobaiqing sbq', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (279, '王常力', 'bkcadtzkxjwfckqkkbi', 'rjzr', '3-3', '10-2', 'dylifcfenibwaere', '4907636', '48454', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangchangli wcl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (280, '刘黎临', 'lrpgmukscefllnflnxs', 'bsqc', '3-3', '1-3', 'dldqbfiktittmrru', '4087039', '593781', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liulilin lll', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (282, '周宝国', 'adrhaqajvuonuhcxkjr', 'jmhm', '5-1', '2-1', 'cligqtakftofjvkm', '5712288', '823543', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhoubaoguo zbg', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (283, '张晖', 'urnpquvrukchrxyhlaf', 'qhpa', '3-3', '9-1', 'eyggzdatvrptkeyb', '6300325', '336375', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhanghui zh', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (284, '李雪', 'wxqdccchopuxzqkqbca', 'cxcs', '3-3', '1-3', 'bhimbjdqoffdwinw', '4364761', '211247', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'lixue lx', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (285, '陈克练', 'zlowqbbkiwrrvofiyjn', 'qtso', '6-1', '8-1', 'erxuimrygyjlbcte', '2922830', '47111', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chenkelian ckl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (286, '衣光平', 'howwucacamyphuwvloo', 'vcio', '3-3', '1-3', 'dlnjkivtnecwvlge', '1519870', '601813', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yiguangping ygp', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (287, '孟光锋', 'mmqubgvjbvuywhscnsc', 'fdkd', '3-3', '10-2', 'cfxmcgexyakavbyj', '8830858', '867735', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'mengguangfeng mgf', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (288, '陈卫国', 'mrriyzekiqaxobxbfyy', 'qkab', '7-1', '6-1', 'ctzgifjieosluwzi', '9594681', '533235', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chenweiguo cwg', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (289, '朱亚文', 'cakiodkbjrtsekkynml', 'mqwu', '3-3', '1-3', 'bbdxhhivbticjfcm', '1480832', '62970', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'shuyawen zhuyawen szyw', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (290, '魏宏玉', 'zccqxumzylrvdvjmzqi', 'oxiw', '3-3', '10-3', 'actskulgsdmennnm', '8620119', '715148', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'weihongyu why', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (291, '郎丽梅', 'phefwoguoeebgaoritg', 'ksay', '7-1', '1-3', 'bilxgejuljmnlwjy', '8658100', '386829', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'langlimei llm', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (292, '刘莎', 'zhpcrjtyznustosytuj', 'fvbe', '3-3', '6-1', 'cgvhzlmezmzdpwgf', '7430145', '788700', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liusha liusuo lss', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (293, '师振平', 'emnxugbhfcnlasuquuz', 'xaga', '3-3', '1-3', 'bjwtcrgooflbtpfh', '1176423', '783014', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'shizhenping szp', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (294, '谢军', 'vptevczsbyeaxvyipou', 'uqco', '3-3', '6-1', 'bzuwpdxeyshywnhu', '3591681', '548972', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'xiejun xj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (295, '李刚', 'soefvrtsqkjtmbirqja', 'iasr', '3-3', '1-3', 'cwhdrpqgaxcncuvd', '4429137', '395820', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'ligang lg', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (296, '陈朋', 'caqlscwmbdfrsuvmldv', 'ifiu', '3-3', '4-1', 'ckedqporhlosxkfh', '1370642', '332182', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chenpeng cp', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (297, '陈长江', 'hiqsclbeimafbvekfoa', 'oblw', '3-3', '1-3', 'cjbfccwsjknzgprc', '3565802', '473450', NULL, 6, 1, 0, 0, 0, 0, 0, 6, NULL, NULL, 'chenchangjiang chenzhangjiang cczj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (298, '胡迅', 'fqfcgwtmnbjycrinvlr', 'uofa', '5-1', '1-3', 'cospquqmytawltqq', '3717082', '370705', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'huxun hx', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (299, '刘斌', 'cggmaclvqvxbiablmph', 'ipun', '3-3', '1-3', 'dtkjxrpjqomkpzeu', '7888005', '433177', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liubin lb', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (300, '宋明', 'xiqaiubtpwknhzjqypk', 'ekfl', '5-1', '1-3', 'cevapzbhknjlosyb', '8288781', '53771', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'songming sm', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (301, '梁钢', 'hulpnrxgczglovsxgec', 'aduu', '3-3', '1-3', 'amwzeynkdxhyzohw', '7779889', '969325', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'lianggang lg', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (302, '上官步燕', 'qbhasaizrhapxekpkdg', 'logm', '3-3', '1-3', 'cwyvesmckzmkjqne', '4033102', '685312', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'shangguanbuyan sgby', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (303, '易基刚', 'iwdgxczfdkjqvmyihcy', 'fixc', '3-3', '1-3', 'cycehvsgsgnetnug', '6825844', '518584', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yijigang yjg', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (304, '薛卫兵', 'tdvejjyaqfujjwmuecb', 'txtz', '6-1', '1-3', 'ceqjyxgbghbpqtju', '2029915', '536987', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'xueweibing xwb', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (305, '石小莉', 'udsceouortuzivoycdm', 'brzr', '3-3', '11-3', 'czwhycbofqvnadkf', '9672044', '129183', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'danxiaoli shixiaoli dsxl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (306, '卞雷玲', 'sebyurcqngowpphjyme', 'aotk', '3-3', '1-3', 'dlljttmogkysflzs', '2270476', '34953', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'bianleiling bll', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (307, '戴燕坤', 'gncnltemqxnibktzjzj', 'xwsa', '3-3', '1-3', 'bgqxzmgbpbecyvpv', '2336248', '787216', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'daiyankun dyk', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (308, '李慧武', 'aairusmopwvcmixtbni', 'kphv', '5-1', '1-3', 'czvmpdwricdiatda', '4869813', '831223', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'lihuiwu lhw', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (309, '杨维明', 'jpkvrjzhcqpkejfwcpp', 'ljie', '4-1', '1-3', 'beftbeoguiciiiwp', '7340323', '794467', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yangweiming ywm', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (310, '孙绍刚', 'svzbasktsnnrmukaijz', 'yawi', '6-1', '1-3', 'bvofonffagcspjwy', '2092177', '478665', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'sunshaogang xunshaogang sxsg', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (311, '曾辉', 'mmqwzkexervhwxiokbc', 'lbgd', '3-3', '1-3', 'dsgunbigqjfoavuw', '8439918', '9927', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'cenghui zenghui czh', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (312, '许绍阳', 'jwhdyxnhstplvcjqahp', 'iets', '3-3', '8-1', 'dcnibrcpcauoicjm', '5923060', '613639', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'hushaoyang xushaoyang hxsy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (313, '李惠成', 'iwndsgerculinuzqwdr', 'iryb', '3-3', '10-2', 'bgufphjfrahfpzkv', '4295545', '38415', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'lihuicheng lhc', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (314, '崔荣耀', 'nruftqinitlidpsdgyp', 'rwmf', '3-3', '3-1', 'ablewiqhybalxnau', '3708546', '351158', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'cuirongyao cry', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (316, '汪磊', 'nzgxpsrdcigeepfsyiv', 'ptem', '3-3', '1-3', 'dlvtwzfzhcmfwicj', '7154838', '149260', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wanglei wl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (317, '陈强', 'smhjiqaceqmypzzdoxk', 'zyha', '3-3', '4-1', 'cqrywpzswskpghat', '8805905', '824660', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chenjiang chenqiang cjq', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (318, '余志武', 'coscxazcnfqeldjmvpl', 'clwr', '3-3', '1-3', 'dxxoszhnngojqmus', '2565011', '675522', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yuzhiwu yzw', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (319, '王新', 'iiqkmexgdeubiqyzoic', 'olpf', '3-3', '1-3', 'bpmwbenlybrylmyi', '6407340', '903629', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangxin wx', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (320, '赵欣然', 'jycsquovehcwlwmofvc', 'pugz', '3-3', '1-3', 'ahqqazsrensqjzin', '4341670', '491578', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhaoxinran zxr', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (321, '王宇', 'uuokujdnmvzachqumbe', 'etpk', '3-3', '11-3', 'cqrqzgazznliknuq', '2486332', '747004', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangyu wy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (322, '武凯', 'wanwcozbxhqoezrhvwp', 'ehdb', '8-1', '6-1', 'egpivlzxmceuxpzp', '9406650', '260288', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wukai wk', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (323, '潘克岐', 'yuybcrlsbagtrboaofo', 'kfxc', '3-3', '1-3', 'clyshjtqkunajjna', '9574253', '60429', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'pankeqi pkq', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (324, '赵德华', 'dwbsesjmpdjdugsikmx', 'kedi', '3-3', '4-1', 'djzmwmxlqszqddrk', '9651315', '521283', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhaodehua zdh', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (325, '王江民', 'xymlnnmftpdjwexmhsu', 'xeyi', '3-3', '1-3', 'cnyiokfhzgmfmnuz', '9533819', '425125', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangjiangmin wjm', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (326, '王炯', 'dcidelgqaslmackkgbj', 'gjhp', '3-3', '1-3', 'dmveenhbybkcafxp', '8715152', '561780', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangjiong wj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (327, '胡程', 'zpcgfrxoxryikwiridk', 'njqb', '3-3', '4-1', 'cxkxclymtpoxtofb', '4974303', '533524', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'hucheng hc', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (328, '谢路', 'kumupztwkejccdidzpw', 'vujo', '8-1', '3-1', 'dakzbptexwoepejo', '8726058', '982281', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'xielu xl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (329, '张连毅', 'cdeijzyqhxyoebsqxmc', 'psxo', '3-3', '1-3', 'ckwfxpwnjleetdeo', '8707383', '310834', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhanglianyi zly', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (330, '周序安', 'fjjfaynoibrkpynwopv', 'nimc', '3-3', '1-3', 'dycdkgecaofjxfsd', '7358740', '607329', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhouxuan zxa', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (331, '颜志波', 'xiheatszspnkknohdqz', 'slou', '7-1', '1-3', 'dnvyimhyzpnjircx', '671555', '104141', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yanzhibo yzb', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (332, '王力', 'tojcaxydouqvivgyxil', 'delp', '3-3', '1-3', 'duwkjrwiygyqztjg', '1281555', '698718', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangli wl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (333, '张晓飞', 'euabzhstsboylmpvcue', 'kpnt', '3-3', '2-1', 'chxcyxlxrlfcxtlm', '4393109', '181170', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangxiaofei zxf', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (334, '赵瑞', 'ogzzwuqjxzwgdyegwxn', 'tkiw', '3-3', '1-3', 'bexjonqookhomnfr', '8120883', '809697', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhaorui zr', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (335, '唐敦皓', 'gxwribdnjtrkhfewbfd', 'liye', '3-3', '1-3', 'eavmbxwzvtrntisx', '7425088', '504976', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'tangduihao tangdunhao tddh', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (336, '张曙光', 'nsjncxsobuvhefgnskc', 'akwd', '3-3', '1-3', 'dqlinxlhloqxhczl', '2762791', '95790', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangshuguang zsg', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (337, '池寒峰', 'yvgoolcfgtbgzmuykgd', 'vzlh', '3-3', '8-1', 'azrgkvqksmbxgoqp', '1538692', '964020', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chihanfeng chf', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (338, '池宇峰', 'dbffljjicivjivcgwch', 'atqy', '3-3', '11-3', 'bcagnjxghtmxijir', '9405090', '532730', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chiyufeng cyf', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (339, '张雪迎', 'vtflppqbtjaatpelcqa', 'puxx', '3-3', '10-3', 'blbkkkobggetzhsp', '2409372', '771591', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangxueying zxy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (340, '周浩', 'trlnpubilvqcrnomwzh', 'xsnt', '3-3', '1-3', 'aziilyanlcldvfqy', '3831592', '259766', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhouhao zh', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (341, '张家骏', 'ibqiffimzacjevizabl', 'tcxz', '3-3', '1-3', 'cpjmykkklsqhehbw', '1929846', '984055', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhanggujun zhangjiajun zhangjiejun zgjjj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (342, '黄树森', 'kgvcgqlknsoowpxlmfi', 'zkxp', '3-3', '11-3', 'dzwjmhamviwdlsjm', '8154455', '140981', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'huangshusen hss', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (343, '贺沁铭', 'ychmqofntklptmogiag', 'ttxc', '3-3', '6-1', 'cefkqdvgwnlwqrpt', '4982738', '752739', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'heqinming hqm', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (344, '钟原', 'quwamzskdxqlfodzdkg', 'snvs', '3-3', '1-3', 'ayozpubswmovvhwl', '450324', '340752', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhongyuan zy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (345, '徐静义', 'frmtkcykkhshulycvxl', 'ikif', '3-3', '1-3', 'dfapbpwvuyopilpx', '7303408', '445542', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'xujingyi xjy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (346, '胡春华', 'ezutpqrwqrufknhqqip', 'oldy', '3-3', '1-3', 'egmbqobbghdmbgld', '5166070', '205457', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'huchunhua hch', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (347, '姜卫东', 'fxmkuuldzpucngsxqwq', 'tyuc', '3-3', '11-3', 'boknwctszoyoizib', '3920125', '690660', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'jiangweidong jwd', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (348, '李剑勇', 'nobvccgzxwqwlrqmkli', 'bkmr', '3-3', '1-3', 'ezmllsolcwkjnekw', '4102418', '836930', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'lijianyong ljy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (349, '周儒欣', 'abvycdxpsqubppbvcpt', 'cdad', '7-1', '1-3', 'dihppjpdpubcqyyc', '8751714', '112670', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhouruxin zrx', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (350, '刘建新', 'nrzghiuyuoyuqzhphss', 'fosp', '3-3', '1-3', 'cpyqprihqhemqcnw', '1451318', '52561', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liujianxin ljx', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (351, '黄富清', 'mdjkcgeyuxkqjejpfsj', 'vjnq', '3-3', '1-3', 'bzxmhgwbkardervd', '1001447', '924793', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'huangfuqing hfq', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (352, '李玉杰', 'xszfqhpvpwfxawwecjs', 'mflk', '3-3', '1-3', 'cepjqgjmcivfbcpb', '653283', '466286', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liyujie lyj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (353, '刘涛', 'dbsvxpikopuoxvhdutm', 'wyqc', '3-3', '1-3', 'dwjnhkdehpdstlkw', '262073', '557049', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liutao lt', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (354, '张俊欣', 'xgrorfzmzkjcnlxbupf', 'xcvh', '3-3', '1-3', 'auzlpjskfzgvpyfd', '9350520', '386388', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangjunxin zjx', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (355, '万长庚', 'bbghnfwdihlvwvpxmsq', 'ypif', '3-3', '1-3', 'ckwsbpalcetbtlvc', '5966380', '260792', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'mochanggeng mozhanggeng wanchanggeng wanzhanggeng mwczg', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (356, '蒋唏亮', 'qmdtsjjirecwtwhhavm', 'zrdb', '7-1', '1-3', 'bpjeoxaawvauwhma', '1780341', '144798', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'jiangxiliang jxl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (357, '陈刚', 'zfyyyhhfladugsqtszm', 'eqpt', '3-3', '1-3', 'duhuqtawzputefxw', '1002565', '941615', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chengang cg', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (358, '程刚', 'cqjmpgkbdnkjxbkzklz', 'uepm', '3-3', '9-1', 'ccjimyaeknzkebbf', '9671803', '273679', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chenggang cg', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (359, '杨素娟', 'kpzodkbrjppktbzoyhm', 'nzge', '3-3', '1-1', 'afxhnncgzumvkuoo', '5351319', '543554', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yangsujuan ysj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (360, '童伟', 'tztkxjcfmmszaftwmbm', 'gkjm', '5-1', '1-3', 'asjmdsjvulmvmtra', '7741190', '896732', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'tongwei tw', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (361, '赵东', 'pcxgcpichnusywtqpny', 'qbew', '3-3', '1-3', 'dwdnbyohytaqdjro', '2651992', '852999', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhaodong zd', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (362, '李晓庆', 'rqgbwvjuyguootnpmhg', 'katw', '3-3', '1-3', 'cgnczstaknqsgohs', '36393', '574798', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'lixiaoqing lxq', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (363, '万晓金', 'quonxjwpyprrbbibral', 'cxfv', '3-3', '1-3', 'dqgztsafcjesytou', '2225989', '314995', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'moxiaojin wanxiaojin mwxj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (364, '张向阳', 'ccbmzhgrvfzuqcbmzdl', 'inwl', '8-1', '3-1', 'bkrpvmuyhgxlwdvw', '1020766', '850581', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangxiangyang zxy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (365, '孟连仲', 'nentelophjwuxhkivqv', 'hwqs', '3-3', '1-3', 'dcozwexdgdbbmimy', '8425866', '307919', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'menglianzhong mlz', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (366, '王怀军', 'jmlkxgdyzdlqrcwedtw', 'nuog', '6-1', '1-3', 'bfxeuketiznzwezb', '9067033', '987852', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wanghuaijun whj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (367, '王军', 'gxrsyzxybnotpqavhuv', 'tixc', '4-1', '3-1', 'bxsykmflymjtxzmn', '57565', '15503', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangjun wj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (368, '张再华', 'feckcdcvghnyzvnqbtm', 'efur', '3-3', '11-3', 'cuyepglxqnjwxlmm', '3086730', '113960', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangzaihua zzh', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (369, '季长印', 'jamuqsvgexykdjnsila', 'qdie', '3-3', '1-3', 'aimbtwpfibqzwfzw', '5260955', '523294', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'jichangyin jizhangyin jczy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (370, '刘俊林', '百度有限公司', 'ryht', '3-3', '1-3', 'chqsamqkvtcjnriw', '7044587', '274589', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liujunlin ljl', 'baiduyouxiangongsi baiduoyouxiangongsi bddyxgs', '0');
INSERT INTO `tbl_namecards` VALUES (371, '殷红斌', 'jasnrmjnusbykiyiiad', 'lkii', '6-1', '6-1', 'cjtmttmkcoovauvr', '9440068', '803065', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yangongbin yanhongbin yingongbin yinhongbin yyghb', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (372, '张军凌', 'qhmfqamavoszttlpgps', 'ddxi', '3-3', '1-3', 'cbxgtkltyonznxew', '6066581', '191559', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangjunling zjl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (373, '吴迪', 'zhfoctjntnmaoujzgvd', 'konr', '3-3', '1-3', 'afetlvtnndymndgf', '2012700', '548599', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wudi wd', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (374, '孙建光', 'aqsdorhpgbdgnroanin', 'njxi', '3-3', '9-1', 'dvebyujlszbmdzwl', '1863761', '168319', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'sunjianguang xunjianguang sxjg', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (375, '裴雅洁', 'ghybnemiyqjcxzpfvde', 'ndws', '3-3', '11-3', 'aoibnospanpzbomo', '3280704', '195799', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'peiyajie pyj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (376, '马越', 'cmoxzunwzzjvzvkyptk', 'xnsm', '3-3', '4-1', 'chbbqmkqwqrjxxul', '812237', '474037', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'mayue my', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (377, '梁斌', 'vpziimbldaswgiebmjk', 'bhxi', '3-3', '3-1', 'dtkerqwikqqxisnn', '4219073', '782790', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liangbin lb', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (378, '胡蘅沅', 'togysbvordkvgbqlomv', 'mxjf', '4-1', '1-3', 'cyusmubwkgelwvgj', '8658656', '491838', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'huhengyuan hhy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (379, '张翠红', 'gbirowynzpxophpbmky', 'irdc', '3-3', '11-3', 'dlvbjasgskxnkase', '636062', '110822', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangcuigong zhangcuihong zcgh', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (380, '高鹏', 'zoynqbhuxnigcjezpof', 'eqpv', '3-3', '4-1', 'ckreltjpkezgiruv', '7204344', '78597', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'gaopeng gp', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (381, '严志武', 'fqprmupnoyvpvyzrqof', 'yeqx', '3-3', '1-3', 'csysbsshyqgrogto', '4113536', '60520', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yanzhiwu yzw', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (382, '徐跃飞', 'bnfvlsegdbhfsomokbm', 'eaib', '3-3', '4-1', 'bjtzyfksktfpuhlk', '8954646', '66808', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'xuyuefei xyf', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (383, '冯超', 'tphavezpxozieakqdqr', 'blro', '3-3', '1-3', 'bswupyypgwlyeqah', '2432622', '152483', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'fengchao pingchao fpc', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (384, '马维国', 'movrwsmidoyariopmaa', 'thnq', '3-3', '2-1', 'bnbzcemvzbmyokse', '5299173', '561989', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'maweiguo mwg', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (385, '戴清林', 'exfhudjwbewburpzycz', 'ozml', '5-1', '1-3', 'ciqpszpjeqdwhamc', '9198001', '352496', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'daiqinglin dql', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (386, '曲强', 'nypkilkhtclgahjdgow', 'ocwg', '3-3', '1-1', 'dcaygimlachotyiw', '92485', '76515', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'qujiang quqiang qjq', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (387, '胡文琦', 'axiefwwuqyoasnzukki', 'emzz', '8-1', '4-1', 'dpgbersbmnyeuqda', '2868422', '325087', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'huwenqi hwq', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (388, '范忠奎', 'mrusezgbymoimtwoijb', 'fced', '3-3', '1-3', 'cpejakzyhjwevjup', '4064658', '395893', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'fanzhongkui fzk', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (389, '刘勇', 'kqzyhhnawnapfdklipk', 'ldau', '3-3', '6-1', 'bebqpbxnbeoksylx', '1718024', '4201', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liuyong ly', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (390, '康宏', 'odqpvmxvlfmzrninrys', 'rknn', '3-3', '1-3', 'ceudyaoukudkeqwq', '6396149', '833327', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'kanghong kh', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (391, '章晓斌', 'nxeeiqaeookeqdnglzk', 'bone', '3-3', '1-3', 'aiutwwzlyjauqibp', '6826672', '154035', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangxiaobin zxb', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (392, '许辉', 'xzacfrjhodovgcoufay', 'gqbi', '3-3', '1-3', 'danhoiiuknssrtqa', '4944914', '270194', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'huhui xuhui hxh', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (393, '谷敏', 'zgmaansybxpsiafcqdl', 'dltb', '3-3', '1-3', 'deegeapqfllfmuck', '4244553', '888864', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'gumin yumin gym', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (394, '郭若鹏', 'eijtjomuqdgbwwlcqol', 'uhnj', '3-3', '1-3', 'aulkgdawvsdykqmv', '6388026', '633741', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'guorepeng guoruopeng grrp', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (395, '王伟旬', 'auitxhfgzbmbigofenx', 'qcjq', '3-3', '1-3', 'cnrgrokilhgcowdb', '9206473', '502113', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangweixun wwx', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (396, '钱小星', 'nbrljrruzwqgbtmtcwd', 'vshb', '3-3', '8-1', 'beczolwduhxonkfs', '6868285', '609342', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'qianxiaoxing qxx', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (397, '王林', 'mvhbdnshxcubhxudvsy', 'ehkk', '5-1', '1-3', 'bhjgvpfrrmvoajtm', '6722007', '540371', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wanglin wl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (398, '李建平', 'zymwprmyqybnfjliwyg', 'jfbw', '5-1', '1-3', 'bwoikomwbpldlqag', '3005180', '873830', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'lijianping ljp', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (399, '秦建平', 'iileorkymiwmhbxjvpm', 'jhbb', '3-3', '1-3', 'bmtxmbsjdmrzdbut', '4859882', '748037', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'qinjianping qjp', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (400, '王远征', 'suxhallvlxfwteeupdq', 'uveu', '3-3', '1-3', 'bvbmirbfmpcmklay', '5283871', '118694', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangyuanzheng wyz', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (401, '陈建锴', 'ozbwidbjwlluyucymzu', 'ugss', '3-3', '1-3', 'csbscehyznmloaqo', '1839707', '349360', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chenjiankai cjk', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (402, '吴福元', 'pnrorjxgapqjliygqja', 'nsyg', '3-3', '1-3', 'dcdcoteapwdwrvbz', '3346924', '390718', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wufuyuan wfy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (403, '欧阳泉', 'lqdfjmkglquolimlqzu', 'htra', '3-3', '4-1', 'dhnimgaixsfwsamh', '1215501', '905511', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'ouyangquan oyq', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (404, '王义', 'jprhuhhnehzousomjwv', 'vtlj', '3-3', '10-3', 'bfektapquxsulpfj', '6036732', '355401', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangyi wy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (405, '欧阳欢', 'nbaxxagtnqofsmhdyhu', 'jmhu', '3-3', '10-2', 'cdgcihybfnxkbwoc', '6537158', '60472', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'ouyanghuan oyh', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (406, '陈兵慧', 'lmbqddiedivjcjwdovl', 'gccu', '3-3', '6-1', 'ddsdlmwnuvkrapgh', '4575594', '236160', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chenbinghui cbh', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (407, '张根来', 'rhgnaszsbtkdijjgbgw', 'gdpp', '3-3', '1-3', 'bevleomlfnfczilg', '3266497', '999383', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhanggenlai zgl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (408, '刘松涛', 'cbzqrdvavrrpkqiymwz', 'mhso', '3-3', '1-3', 'blytmjuoucxntyph', '2605705', '288437', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liusongtao lst', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (409, '李振铭', 'mieshlhxcdbqbfmzioj', 'qavc', '5-1', '1-3', 'cthkabokhbxixrnt', '3229036', '444035', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'lizhenming lzm', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (410, '钱国梁', 'anaoiywoxpihzcjzeew', 'tewt', '3-3', '1-3', 'akotngkmcxtbemyu', '8328064', '354866', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'qianguoliang qgl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (411, '夏凡', 'tqmqxhlzhqlovvnawfd', 'wxzn', '3-3', '1-3', 'ctynqbldpjbgejcu', '1953211', '442224', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'xiafan xf', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (412, '王心丰', 'spilnpqguleyfvkeupe', 'bbeg', '3-3', '1-3', 'anzjppwetccbjmsq', '4781867', '146522', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangxinfeng wxf', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (413, '于文浩', 'hdglwewhzhoaqtovjik', 'rmbu', '3-3', '10-3', 'bjdgbtcozjhqiies', '8049703', '405938', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yuwenhao ywh', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (414, '朱天美', 'gweusamuodggkfnplwm', 'disf', '3-3', '1-3', 'dhsenyugpndxlevp', '5902913', '590126', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'shutianmei zhutianmei sztm', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (415, '耿亚囡', 'lwfszpuawsnfevzlegd', 'tdmp', '3-3', '1-3', 'chdejmrnzpvtixqz', '5365458', '732815', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'gengyanan gyn', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (416, '陆容安', 'kumcsxlrpgzhsmhnosj', 'jrdj', '3-3', '1-3', 'aomhhqzvditxhzpc', '9118550', '893697', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liurongan lurongan llra', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (417, '曹阳', 'risiqtwklbivaalgftk', 'oaga', '3-3', '10-2', 'aydzhtwouvhgmeem', '9496376', '270043', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'caoyang cy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (418, '孙万峰', 'dfficbbylmpgwnkskrw', 'qawb', '3-3', '10-2', 'dbczrwkhmecpmwyb', '126232', '669122', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'sunmofeng sunwanfeng xunmofeng xunwanfeng sxmwf', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (419, '刘旭', 'tbvrpcqmvhbwipsujeb', 'nbog', '5-1', '1-3', 'ckeakaluckpgavix', '2142031', '535484', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liuxu lx', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (420, '马晨', 'fuplshzpwzolclkwpvt', 'sffz', '6-1', '1-3', 'axmezlbacmvkomsj', '331460', '670054', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'machen mc', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (421, '魏文林', 'yqmcteznvaprmjwxvpq', 'ayjg', '3-3', '9-1', 'biwvtewubdffvape', '5231208', '743818', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'weiwenlin wwl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (422, '李滨', 'bvohpabwncjaamczkox', 'yzdg', '8-1', '1-3', 'dyzqwoeycjqzjrus', '5161663', '708928', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'libin lb', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (423, '孙少军', 'kelatmhucmabtjvgnzq', 'sdqm', '3-3', '1-3', 'dsjpzgiiiipfjiec', '114692', '313186', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'sunshaojun xunshaojun sxsj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (424, '吕智斌', 'vlnizjgixdxfqkyejgk', 'rsrq', '3-3', '4-1', 'buubkobujqaesqng', '5088470', '439147', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'lvzhibin lzb', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (425, '许文丽', 'asimrljfggozzwfegge', 'fcou', '3-3', '9-1', 'buvnccgyuchdofbz', '5098275', '256180', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'huwenli xuwenli hxwl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (426, '刘琳', 'phbnmbdbnvzgxcejgmo', 'ajtc', '7-1', '1-3', 'bqtjfuejwpkeqctd', '225964', '963457', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liulin ll', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (427, '杨志苍', 'yhfdgzorwjghqzijkrj', 'opca', '4-1', '1-3', 'atgiwpaaztcomvos', '5834999', '48746', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yangzhicang yzc', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (428, '李泌', 'wpxbxtlgwjhqmpashzb', 'rwgv', '3-3', '1-3', 'cubmosrbfxhelxne', '8497101', '353360', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'libi limi lbm', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (429, '黄国伟', 'odyzstngpsuiozdkive', 'tpxc', '3-3', '1-3', 'bunkitfeggcfwzxu', '4980511', '620562', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'huangguowei hgw', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (430, '张焕武', 'cuapxnemknzthfrwqfr', 'rktb', '6-1', '10-3', 'emlpvrdtnptqyexk', '9411254', '42732', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhanghuanwu zhw', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (431, '王青山', 'wqgdkhlrhjntsbzdhoy', 'fedw', '7-1', '3-1', 'dertfbzgxeikbzxq', '2114735', '351975', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangqingshan wqs', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (432, '杨维国', 'zsexixqvggrprpvcnfp', 'zqig', '3-3', '1-3', 'dhzznflzycngolvz', '2339915', '631677', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yangweiguo ywg', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (433, '刘佳', '百度有限公司', 'fshr', '3-3', '1-3', 'dbxpzykeyynyofka', '5355370', '102463', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liujia lj', 'baiduyouxiangongsi baiduoyouxiangongsi bddyxgs', '0');
INSERT INTO `tbl_namecards` VALUES (434, '刘红军', 'tiwoxzpgyfzhcimcfke', 'frko', '3-3', '1-3', 'biqckzoxwlbxcrmd', '9757105', '617285', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liugongjun liuhongjun lghj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (435, '张青', 'rqesjqguqmlptfxhsug', 'lffw', '3-3', '1-3', 'dokrzfpypkruxvhp', '2719417', '779034', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangqing zq', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (436, '陈江', 'ccfuffldjwjenacbysr', 'nzto', '3-3', '1-3', 'arecsajbhqfgecxo', '4325769', '43316', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chenjiang cj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (437, '孟松涛', 'lqouvgkkxtnbloqmpfr', 'hgef', '3-3', '1-3', 'evqmrobkqadwexsa', '3470596', '879479', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'mengsongtao mst', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (438, '王东', 'bxfpqnspnensnqzhewk', 'viol', '3-3', '1-3', 'careesexkczoiiun', '4375674', '267446', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangdong wd', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (439, '李新', 'vniqpxkuxoakkpaxasa', 'ixjo', '3-3', '1-3', 'dsljwvshamlgdvuk', '1466582', '698794', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'lixin lx', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (440, '于昆凌', 'azzkbwwdvjnvicfrnau', 'fndj', '5-1', '10-2', 'endjvyzuzbhppgqm', '4205888', '691633', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yukunling ykl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (442, '曾强', 'wrwpoagvcpxojtsoqqi', 'ivof', '3-3', '1-3', 'cffehthdtxtzqrbu', '530814', '734018', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'cengjiang cengqiang zengjiang zengqiang czjq', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (443, '吴涛', 'pjmmfvukxnzskzzqhiw', 'tnzf', '3-3', '1-3', 'cadxvuvkpelndiwd', '2764985', '584742', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wutao wt', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (444, '徐小星', 'ivsnjdengthywrtlmti', 'rcfl', '3-3', '4-1', 'dmbzfrgosexorrdk', '2232483', '721656', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'xuxiaoxing xxx', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (445, '余钰', 'ybdheelimimpfkukotz', 'dydo', '3-3', '1-3', 'chxfqzuquggfbhdo', '2867462', '854055', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yuyu yy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (446, '张振', 'rtnvtordrjmbjbusily', 'rmcn', '3-3', '1-3', 'eahdozhltuljgmgr', '7639862', '105308', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangzhen zz', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (447, '王晓华', 'ppggheztztznebogabw', 'aozx', '8-1', '1-3', 'cgsbyyajldofcpwo', '9596926', '964375', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangxiaohua wxh', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (448, '王晓红', 'yuswdfahwrmnuejfayj', 'bhqz', '3-3', '1-3', 'beuxxsdmxhlbrlnv', '5065042', '505950', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangxiaogong wangxiaohong wxgh', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (449, '王冬滨', 'zdwlunbdhelzmofgbmi', 'ftgd', '6-1', '3-1', 'derguvthecnoclcm', '6534433', '636625', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangdongbin wdb', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (450, '周延武', 'ajcsoxgwzuvkzjzqioo', 'ywit', '3-3', '1-3', 'dgdqfzhzdpislxwy', '7477043', '665279', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhouyanwu zyw', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (451, '李卫东', 'eixekzczyktznbilkiv', 'ddvi', '7-1', '9-1', 'dsqlrmgagscwydzf', '7781913', '416517', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liweidong lwd', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (452, '李朝阳', 'tqgsigsiutfrqhpgaal', 'sagj', '3-3', '1-3', 'ewsiskjevumdkzig', '6478439', '86751', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'lichaoyang lizhaoyang lczy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (453, '齐威', 'hendkhfqdmwlnhbazbu', 'estv', '3-3', '1-3', 'cdsfmqcujtcefmtr', '9046457', '184204', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'jiwei qiwei jqw', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (454, '傅涛', 'daxlzqbehctgvomitgn', 'slbc', '3-3', '1-1', 'bdldjyhlhickvmvo', '5796969', '660768', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'futao ft', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (455, '王宏伟', 'xmxvvjozzaevnzfnteg', 'abba', '3-3', '8-1', 'bfaakugwjmdlmytv', '1845476', '751226', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wanghongwei whw', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (456, '杨继春', 'bivvdyqlbwqkedrqqzs', 'bzzu', '4-1', '1-3', 'dtvsvbibxljdafjj', '1836474', '773829', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yangjichun yjc', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (457, '张驰', 'ohmpgonhihrohutowkt', 'fvww', '3-3', '1-3', 'cbbozzypoulfojoj', '3645942', '615465', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangchi zc', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (458, '徐嘉伟', 'ojyptxsblvmoxoszjdr', 'udiy', '3-3', '1-3', 'bbtojurxaoestcqs', '2720289', '755840', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'xujiawei xjw', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (459, '李新彬', 'fzgeyzzjgfibrkjdhnb', 'kgzb', '3-3', '1-3', 'bdreyxqtkmlwdlpn', '2663618', '932807', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'lixinbin lxb', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (460, '蒋赞平', 'ixlcpdvrwqfsqhovgdf', 'rtyp', '3-3', '1-1', 'dlaepgdxyrrfjxym', '5157225', '396514', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'jiangzanping jzp', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (461, '刘敬光', 'bllydvehqpdjdgvtndz', 'dbwt', '3-3', '1-3', 'dtdjdorklxdlmfbt', '7795272', '184148', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liujingguang ljg', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (462, '朱伟', 'fowkwpiloybptlkguef', 'sbkw', '3-3', '11-3', 'bnrizzbelopqigkk', '3504687', '731200', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'shuwei zhuwei szw', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (463, '许亦飞', 'ykagypekzbwzhmnxhpe', 'canf', '3-3', '10-2', 'ciyljhhsvcqvfsuu', '4137620', '103557', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'huyifei xuyifei hxyf', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (465, '周捷', 'enofwenvrrjlqzdnfik', 'jtxo', '3-3', '6-1', 'cevbxozjystwwzrt', '8457342', '310257', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhoujie zj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (466, '张文锋', 'yoddxfgichhafssakho', 'xxrk', '6-1', '1-3', 'duvknjmnafspaizz', '1764588', '578729', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangwenfeng zwf', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (467, '陆国新', 'dfaawnreimjvemcqlol', 'khol', '3-3', '1-3', 'dktwyemkhyjgluur', '3450918', '962875', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liuguoxin luguoxin llgx', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (468, '陈欣', 'ukrspzpvllwafijzxwp', 'hsxy', '3-3', '10-3', 'dsedcvyojbrleyai', '1960823', '78190', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chenxin cx', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (469, '王振全', 'qjglkjxqgtipogoberp', 'frvj', '7-1', '4-1', 'cgrapmiqxjhnoisr', '9451365', '502325', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangzhenquan wzq', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (470, '刘春阳', 'ssidivwtxmzxeeskdtg', 'fflz', '7-1', '4-1', 'cdxuraslntlggupl', '1374357', '277055', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liuchunyang lcy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (471, '薛宝金', 'skxhicntvewugfutfvl', 'maqv', '3-3', '10-2', 'danuorpgvokupzud', '8517688', '878300', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'xuebaojin xbj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (472, '伊纪良', 'jvmcrbzoilleplxmpul', 'towg', '3-3', '1-3', 'couqwgwynopceoeh', '8465373', '560336', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yijiliang yjl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (473, '李爱军', 'tasqixlndpopiqdhioy', 'gskt', '3-3', '1-3', 'ewlwoipyecvefxna', '6773800', '166780', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liaijun laj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (474, '王怀恩', 'onexpigyutkkwxayxij', 'zukb', '5-1', '1-3', 'dovifujyjuhnkuaf', '8472884', '152892', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wanghuaien whe', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (475, '傅英', 'pnrpazvclymggprwpzy', 'ewwa', '3-3', '4-1', 'cduaixzvisbejfpc', '2043020', '264119', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'fuying fy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (476, '刘雪松', 'hawihwksyjccqffkfzq', 'waby', '3-3', '1-3', 'acocagvkmeigtqyv', '4796448', '861923', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liuxuesong lxs', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (478, '杨永清', 'lugskevxuigzkveosby', 'piko', '3-3', '1-3', 'crvzqbhebxetmysl', '4876566', '514', NULL, 6, 2, 0, 0, 1, 1, 0, 0, 11, 1, 'yangyongqing yyq', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (479, '颜邦国', 'hibioujxbjwaqiicsfn', 'khut', '3-3', '1-3', 'dliqspbmtoqtszty', '823284', '450802', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yanbangguo ybg', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (480, '王时钟', 'beonrkhwuwqdabfvmyx', 'hiva', '3-3', '1-3', 'cfecpujvpbqlfdsh', '9486721', '252467', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangshizhong wsz', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (481, '何伟', 'mzrqrtiqwgqndkyxhdw', 'dxvv', '3-3', '11-3', 'atwrzdpruqgyvqfr', '4963758', '909931', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'hewei hw', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (482, '何礼广', 'eiqpkmvnwreioufzatr', 'ylnd', '5-1', '1-3', 'bdwbaizzbxhkpuan', '6358624', '792253', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'helian heliguang hlag', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (483, '李作灵', 'lqedafdqtpyznrdddju', 'gnef', '3-3', '1-3', 'bipidecwytuekcmm', '6901849', '231474', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'lizuoling lzl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (484, '郭艳军', 'tgaxwpctgyhyvbausqx', 'mfho', '3-3', '8-1', 'cjmksxphnyarhbfx', '5433372', '780609', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'guoyanjun gyj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (485, '杨磊', 'ihocfkftxypwnfrnebf', 'onxf', '3-3', '4-1', 'esnbebqxsntueatd', '6461316', '208627', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yanglei yl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (486, '王志坚', 'jstuofrpsvdkfwihsij', 'kask', '3-3', '1-3', 'anfdrqlqbuqabybw', '6006464', '701306', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangzhijian wzj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (487, '向民', 'vszrdwvrzjwlorrxclc', 'kpuk', '5-1', '4-1', 'blnkuxjlehzprqax', '648373', '880649', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'xiangmin xm', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (488, '陈雅林', 'bmtxypcpsixzbxipghm', 'svws', '3-3', '3-1', 'bpxpyojhqeybihyy', '5222475', '299329', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chenyalin cyl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (489, '智爱民', 'whtpgkyyonwosjshaaa', 'ijyl', '3-3', '1-3', 'atavifucsbvmnnpa', '4167258', '854700', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhiaimin zam', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (490, '李冀中', 'ezofnemzqotvjgmqiis', 'mibz', '3-3', '1-3', 'dxkithwpqqihqsfh', '5168863', '375511', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'lijizhong ljz', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (491, '周自武', 'fzljxunzohbntajjpnk', 'kmlo', '3-3', '1-3', 'dgyexuxtacfwqzii', '3342542', '313455', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhouziwu zzw', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (492, '孙建', 'qxqbxifaxvadpkjvbra', 'qmax', '3-3', '1-3', 'doovfaxwhnzpfuyt', '1206121', '440742', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'sunjian xunjian sxj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (493, '于东波', 'ksvhtincvexcryuamtv', 'ayww', '3-3', '1-3', 'aazphwvfhhjhdbsu', '6002980', '263346', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yudongbo ydb', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (494, '周岩', 'esfgcrwklincqouqdua', 'dggr', '3-3', '1-3', 'bldnvgmkqxuqayss', '6396538', '994507', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhouyan zy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (495, '沈小滨', 'qnokhiwtugyfczncirr', 'qlrr', '3-3', '1-3', 'bcswjqykhtwkulkd', '3973750', '182495', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chenxiaobin shenxiaobin csxb', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (496, '张京生', 'qleebqumpebrpginezg', 'rkok', '3-3', '1-3', 'egdrgjgvqxxbxjvp', '679135', '928954', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangjingsheng zjs', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (497, '黎洪松', 'frdsnefeqdlushalzzg', 'otsa', '3-3', '1-3', 'bznvfakxehxabnbo', '1474429', '97285', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'lihongsong lhs', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (498, '王维晟', 'fcgzkyvljgazsqdphwl', 'tlav', '5-1', '1-3', 'eafchxfbyvwyqmta', '5334741', '699564', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangweicheng wangweisheng wwcs', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (499, '蒋达', 'kiwvnelqwtvkohqspmo', 'dcvb', '3-3', '1-3', 'bhmztmyohdppayqj', '2250416', '205968', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'jiangda jd', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (500, '肖锋', 'mmpghzrvhaafnnrubtk', 'iaev', '3-3', '1-3', 'ckvqwtcrnhlgdgxu', '5247859', '931146', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'xiaofeng xf', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (501, '傅鸣', 'bihqxnaiuxptxuounhj', 'fxky', '3-3', '1-3', 'cbsfbhopvzjmqjpv', '9488048', '37829', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'fuming fm', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (502, '张孝宇', 'xgsnrqccdkwfbisniho', 'cmkh', '3-3', '1-3', 'eaagtdnxnzlruehv', '1696664', '395706', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangxiaoyu zxy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (503, '余东昌', 'iiqsoqmpfjrvngxgemu', 'vqvq', '3-3', '1-3', 'cbyoqxxwccfwzssr', '19175', '865043', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yudongchang ydc', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (504, '于天鸿', 'wwzxxebosnrlnijqvoe', 'xuxf', '3-3', '1-3', 'edtaxbbqzmtiqcpx', '5005884', '138099', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yutianhong yth', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (505, '王志刚', 'jgdkvbxdzmltyxcksil', 'abbd', '6-1', '4-1', 'enukrnmoobcydgxk', '4971895', '95367', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangzhigang wzg', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (506, '张方', 'frrjjrjwtwfjfnjfyxv', 'ixqc', '3-3', '4-1', 'afuaolgwxwewvzuj', '9841825', '62539', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangfang zf', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (507, '陈玲', 'bsxqkhdauyqnfvpvrot', 'nhzc', '3-3', '1-3', 'bkpvtpwpxgolsfeo', '4293442', '26595', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chenling cl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (508, '李文江', 'onmzvkmotaqpkqymodg', 'tvag', '3-3', '10-3', 'bnpbasnlrnjpador', '1941735', '945358', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liwenjiang lwj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (509, '杨先生', 'rjsczdaphihmjpwxvyy', 'cfbw', '3-3', '1-3', 'egetzuyjtybpbyfs', '6828351', '647006', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yangxiansheng yxs', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (510, '张先生', 'riemjmriholorfpejga', 'hoiq', '8-1', '4-1', 'cudssuhprfehgkjp', '8316549', '398955', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangxiansheng zxs', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (511, '高    静', 'inrcwaiwptkiiegcjoi', 'efmm', '3-3', '1-3', 'aedftrnufcsqzfdw', '1097692', '53758', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'gaojing gj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (512, '王    威', 'pqudgqoibcryogmyrzm', 'yjkq', '3-3', '1-3', 'bngznxsfzzbjgurl', '538815', '71924', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangwei ww', NULL, '2');
INSERT INTO `tbl_namecards` VALUES (513, '韩经理', 'aqyjscvanecututkgek', 'egmq', '5-1', '1-1', 'cdvgllaqfofwhgxs', '9401001', '198348', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'hanjingli hjl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (514, '郝小姐', 'jglkvqncmrnabfgehzq', 'zbii', '3-3', '6-1', 'bbkipqzqfvwetyof', '5388561', '775967', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'haoxiaojie hxj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (515, '王女士', 'uiixavamwwfueoytska', 'nner', '5-1', '4-1', 'bwqwrsueinqhuxcz', '8739801', '284790', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangnvshi wangrushi wnrs', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (516, '王小姐', 'wzhhofobufpxohzdpae', 'plum', '3-3', '1-3', 'cevhmsazzcowurve', '7533325', '96053', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangxiaojie wxj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (517, '安女士', 'xvnsvqrvjlgdjtbnyww', 'jrlj', '3-3', '1-3', 'cgfymjslxzwpmquz', '1447220', '625895', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'annvshi anrushi anrs', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (518, '杨    君', 'yfrsiluanrpzbwicvgs', 'bcyi', '3-3', '1-1', 'euruxsogsqrgdelk', '4636126', '841318', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yangjun yj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (519, '袁艳玲', 'aqxmgkyqmbdngamzkty', 'gjgm', '4-1', '10-2', 'beqccnrxseundavb', '8838973', '328904', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yuanyanling yyl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (520, '阮小姐', 'homggrjawfxpaomolzo', 'bqoo', '3-3', '10-3', 'bkedvlrslzywhqvd', '286487', '120567', NULL, 6, 7, 0, 0, 0, 0, 0, 0, NULL, NULL, 'ruanxiaojie rxj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (521, '郭雪', 'kxqukeafxwcmkuxwaqy', 'mzxg', '3-3', '1-3', 'aqyjwpjybikrzasm', '4915515', '616123', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'guoxue gx', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (522, '李    楠', 'evtgkuyzytspafcpwhc', 'gbzo', '5-1', '1-3', 'bygkvtvozqexddaz', '3718118', '718914', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'linan ln', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (523, '韩小姐', 'skuvtmribckpvrvmfns', 'tjdc', '3-3', '1-3', 'bulzpwcytiqjttyn', '3844043', '746202', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'hanxiaojie hxj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (524, '马    梅', 'xmsmmzlsigtcasunlsf', 'bqrs', '3-3', '1-3', 'dbmplbxbuqrehhrq', '8065864', '574269', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'mamei mm', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (525, '刘丽欣', 'kghvfminmaqusongqyy', 'caak', '3-3', '1-3', 'czaelsfktgkugeoq', '8797192', '632740', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liulixin llx', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (526, '刘经理', 'gwftnkfnmgyqnpepvpc', 'eezv', '3-3', '1-3', 'drtzxjiviiaijyvf', '9788366', '440893', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liujingli ljl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (527, '张    伟', 'blggcqbazgssmkhggep', 'svzx', '3-3', '2-1', 'cnpmgucajwyiahjg', '2550258', '306245', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangwei zw', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (528, '韩    影', 'qspyvxrojmstxgzkuds', 'apwc', '3-3', '1-3', 'dmsllunnyjrszqjn', '3386193', '208549', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'hanying hy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (529, '陈小鸥', 'zffbxpdtwrknyyakebs', 'xoiu', '3-3', '10-3', 'bwuulphpmgooxhrx', '9280190', '124009', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'chenxiaoou cxo', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (530, '马晓婧/刘先生', 'zwhmahrbgzwlzbdsmvo', 'lxeq', '3-3', '9-1', 'dwunwrwmseuqqpiw', '6242371', '994399', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'maxiaojingliuxiansheng mxjlxs', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (531, '苗先生', 'xruflsybrtgqdkokvcn', 'nwuw', '3-3', '10-3', 'bsrjbmnocefpkbps', '3371285', '599969', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'miaoxiansheng mxs', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (532, '马瑜娜', 'rudoerubnxnxtxmwsyz', 'ipmj', '3-3', '4-1', 'dyxdrjyihfqydmbx', '8129313', '16648', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'mayuna mayunuo mynn', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (533, '魏全新', 'pxggofaesfyojjrdemi', 'yjzg', '3-3', '1-3', 'anorejdzcppykenk', '532714', '283333', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'weiquanxin wqx', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (534, '黄智勇', 'zeypgbvqxjecpaycqnt', 'wblc', '3-3', '10-3', 'axcxvuwxrkayqnli', '8275628', '366721', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'huangzhiyong hzy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (535, '李    茹', 'devenscrlgatvbsbscs', 'ndfs', '3-3', '1-3', 'evtoswzqcejvxbpk', '9780002', '983608', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liru lr', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (536, '常小姐', 'tjjbvjxmmbpnjetyqyj', 'yovi', '3-3', '1-3', 'dnmbbxjkkttisrra', '4073127', '817878', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'changxiaojie cxj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (537, '黄小姐', 'hhiupqihcnwiisopzlr', 'ekno', '3-3', '9-1', 'dcerbxterdrdwfoy', '1025630', '138565', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'huangxiaojie hxj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (539, '王主任', 'bwussolrzmgpsiucfwh', 'vkqx', '3-3', '1-3', 'alhnqsixgvvzkjzm', '1466952', '780272', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangzhuren wzr', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (540, '马孝东', 'vficcloardnpyjnxxyr', 'vbck', '3-3', '9-1', 'clkhtwkjntowlwuj', '8608457', '183779', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'maxiaodong mxd', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (541, '刘显良', 'xnfjhqmckhwfpudhycn', 'scpi', '4-1', '1-3', 'duczugcexjklafxj', '8641429', '578082', NULL, 6, 6, 0, 0, 0, 0, 0, 0, NULL, NULL, 'liuxianliang lxl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (542, '赖    曼', 'zacldurjzcvgdwfqaqp', 'bjsl', '3-3', '1-3', 'arhxsoivvpfpumfu', '7381774', '339073', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'laiman lm', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (543, '徐女士', 'glyexzxqspnrwzslhxj', 'fnuf', '4-1', '10-2', 'daeqedhnnvyqvshv', '984585', '961120', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'xunvshi xurushi xnrs', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (544, '黎先志', 'hghmcqparsbnxgvekqd', 'ulst', '3-3', '1-3', 'bzamualdbhzmucvu', '2777606', '788379', NULL, 6, 4, 0, 0, 0, 0, 0, 0, NULL, NULL, 'lixianzhi lxz', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (545, '李小姐', 'rvryvgeefstqzhbocnn', 'hqhd', '5-1', '1-3', 'dznmkskbsybjmjij', '934272', '58538', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'lixiaojie lxj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (546, '贾雪凌', 'njmhtjcwynooeuuhhqh', 'fyhi', '3-3', '1-3', 'cwqzskqzlymkbpep', '6338544', '927554', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'guxueling jiaxueling gjxl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (547, '韩宝泽', 'qkinjzyvelpyxzsveot', 'ctoh', '4-1', '1-3', 'akqmiwxqaxdyuywu', '8889906', '462158', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'hanbaoshi hanbaoze hbsz', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (548, '徐    燕', 'mwhvnwmlarfbaqhgawx', 'vazm', '3-3', '1-3', 'ckdjocrhvrhotvve', '5433899', '528126', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'xuyan xy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (549, '钟    巍', 'qdmnojounzjmkffvnsh', 'utdo', '3-3', '6-1', 'cvxktxrpaqaxjgmo', '499776', '254156', NULL, 6, 3, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhongwei zw', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (550, '张定琼', 'rblcgfjnovcexbfipzu', 'ptuj', '3-3', '1-3', 'czbybfibqcexrxzd', '6197183', '686404', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangdingqiong zdq', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (551, '居    茜', 'lzszmaciggnnkujelrc', 'olnf', '3-3', '8-1', 'bjqoajrobswvfskd', '9486587', '669553', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'juqian juxi jqx', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (552, '赵经理', 'grjoqkkapveafrgylmd', 'zagw', '6-1', '4-1', 'bvxzzekqkdvkcwbh', '8841388', '288553', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhaojingli zjl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (553, '杨春霞', 'wmsvuaucfilnwccculi', 'grrq', '3-3', '1-3', 'catfuuakuoontgda', '5747180', '434106', NULL, 6, 9, 0, 0, 0, 0, 0, 0, NULL, NULL, 'yangchunxia ycx', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (554, '郑    丽', 'phklayrngeopskwpssh', 'ikoq', '3-3', '1-3', 'bsxbcjxevmhkoqod', '2211738', '304872', NULL, 6, 8, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhengli zl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (555, '周博男', 'kywvrobirxniysxvdfk', 'wzvi', '3-3', '1-3', 'dnhqzmiovrvlmkjr', '3817151', '222041', NULL, 6, 2, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhoubonan zbn', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (556, '周思远', 'hzeribgapzzwqixhozc', 'hqmr', '3-3', '10-2', 'dmubsjbjnyfareca', '2450540', '195589', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhousaiyuan zhousiyuan zssy', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (557, '朱东莉', 'dbearobbzchjgmvzkeh', 'xfyk', '3-3', '9-1', 'cuclqhhegsqvbsja', '801250', '311825', NULL, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL, 'shudongli zhudongli szdl', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (558, '张剑阁', 'xkjylpohbrogilmahzg', 'qdgy', '6-1', '1-3', 'bpcyylguptocdxob', '6654629', '972356', NULL, 40, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhangjiange zjg', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (559, '张丽娟', 'avjtbipiiavbytzdijj', 'oclp', '3-3', '3-1', 'bocjujjlipuxqksd', '869397', '926309', NULL, 6, 5, 0, 0, 0, 0, 0, 0, NULL, NULL, 'zhanglijuan zlj', NULL, '0');
INSERT INTO `tbl_namecards` VALUES (560, '周小姐', 'mwrwbwhunenqtnirqxa', 'tdnf', '3-3', '1-3', 'dyhbekcvtshjrgvq', '4383099', '714475', NULL, 40, 3, 0, 0, 0, 0, 0, 3, NULL, NULL, 'zhouxiaojie zxj', NULL, '2');
INSERT INTO `tbl_namecards` VALUES (561, '王先生', 'hvheahpxnsdaxftzhma', 'fied', '3-3', '8-1', 'cddcmaiuutdzmebq', '9307305', '793448', NULL, 6, 10, 0, 0, 0, 0, 0, 0, NULL, NULL, 'wangxiansheng wxs', NULL, '0');

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_notice`
-- 

DROP TABLE IF EXISTS `tbl_notice`;
CREATE TABLE IF NOT EXISTS `tbl_notice` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `profile_name` varchar(15) default NULL,
  `content` text,
  `type` tinyint(1) unsigned NOT NULL default '0',
  `create_ts` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- 导出表中的数据 `tbl_notice`
-- 

INSERT INTO `tbl_notice` VALUES (1, 40, 'liulei_40', '{"model":"Educations","type":1}', 1, '2012-08-14 15:40:14');
INSERT INTO `tbl_notice` VALUES (2, 0, 'admin', '亲爱的网友，《新浪微博社区管理规定(试行)》自5月28日正式施行以来，收到很多网友的意见建议。站方结合微博社区管理的经验，对“规定”进行了一次修订。修订内容包括：除垃圾广告等恶性行为外不再注销账号，部分违规微博禁止自行删除，等', 100, '2012-08-14 15:41:13');

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_notice_connections`
-- 

DROP TABLE IF EXISTS `tbl_notice_connections`;
CREATE TABLE IF NOT EXISTS `tbl_notice_connections` (
  `user_id` int(11) NOT NULL,
  `notice_id` int(11) unsigned NOT NULL,
  UNIQUE KEY `notice_user` (`notice_id`,`user_id`),
  KEY `FK_notice_connections_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `tbl_notice_connections`
-- 

INSERT INTO `tbl_notice_connections` VALUES (26, 1);

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_outsite_contact`
-- 

DROP TABLE IF EXISTS `tbl_outsite_contact`;
CREATE TABLE IF NOT EXISTS `tbl_outsite_contact` (
  `uid` int(11) NOT NULL default '0',
  `account` varchar(25) NOT NULL default '0',
  `type` varchar(3) NOT NULL default '0',
  `contacts` text NOT NULL,
  UNIQUE KEY `id` (`account`,`type`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `tbl_outsite_contact`
-- 

INSERT INTO `tbl_outsite_contact` VALUES (40, 'bbkliulei', 'p4', '[{"name":"\\u5218 \\u96f7","email":"bbkliulei@live.cn"},{"name":"463975487@qq.com","email":"463975487@qq.com"},{"name":"albie333@hotmail.co.uk","email":"albie333@hotmail.co.uk"},{"name":"bnbyu","email":"bnbyu@msn.com"},{"name":"borry1988@hotmail.com","email":"borry1988@hotmail.com"},{"name":"Branson Nella","email":"NellaBranson1381@hotmail.com"},{"name":"chaoyejinok@hotmail.com","email":"chaoyejinok@hotmail.com"},{"name":"chinablue28@live.cn","email":"chinablue28@live.cn"},{"name":"cnlabs@live.com","email":"cnlabs@live.com"},{"name":"CSQ OK","email":"csqok@hotmail.com"},{"name":"gaojinshengok@live.cn","email":"gaojinshengok@live.cn"},{"name":"Hardway Fredia","email":"fredia_dollface8350@live.com"},{"name":"liu lei","email":"liu19870325@163.com"},{"name":"liuyangycg1226@hotmail.com","email":"liuyangycg1226@hotmail.com"},{"name":"Tian Hongfei","email":"tianhongfei@hotmail.com"},{"name":"williams jena","email":"ore-o@hotmail.com"},{"name":"xiaogai1010@live.cn","email":"xiaogai1010@live.cn"},{"name":"Yang Tim","email":"weihua.yang@gmail.com"},{"name":"yiyang_pku@hotmail.com","email":"yiyang_pku@hotmail.com"},{"name":"Z Aladdin","email":"realaddin@gmail.com"},{"name":"zhang Er","email":"er@zhangabc.com"},{"name":"zhang Tony","email":"z.y.f@msn.com"},{"name":"zlzj2010@hotmail.com","email":"zlzj2010@hotmail.com"},{"name":"\\u9ad8 \\u626c","email":"gy0820@gmail.com"},{"name":"\\u7ba1 \\u4f1f","email":"guananddu@qq.com"},{"name":"\\u674e \\u654f","email":"chongqinglimin@hotmail.com"}]');

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_phone_numbers`
-- 

DROP TABLE IF EXISTS `tbl_phone_numbers`;
CREATE TABLE IF NOT EXISTS `tbl_phone_numbers` (
  `user_id` int(11) NOT NULL,
  `mobile_number` varchar(11) NOT NULL,
  `type` varchar(10) NOT NULL COMMENT 'Home,Work',
  `verified` tinyint(1) unsigned default '0',
  KEY `FK_phone_number_user_id` (`user_id`),
  KEY `IDX_phone_number` (`mobile_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `tbl_phone_numbers`
-- 

INSERT INTO `tbl_phone_numbers` VALUES (94, '13911650018', 'Work', 0);
INSERT INTO `tbl_phone_numbers` VALUES (130, '13366576525', 'Work', 1);
INSERT INTO `tbl_phone_numbers` VALUES (40, '13366576525', 'Home', 0);
INSERT INTO `tbl_phone_numbers` VALUES (102, '18601140279', 'Work', 0);
INSERT INTO `tbl_phone_numbers` VALUES (223, '18601140271', 'Work', 1);
INSERT INTO `tbl_phone_numbers` VALUES (102, '15210715845', 'Work', 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_positions`
-- 

DROP TABLE IF EXISTS `tbl_positions`;
CREATE TABLE IF NOT EXISTS `tbl_positions` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `summary` varchar(1024) default NULL,
  `is_current` tinyint(4) default '0',
  `company` varchar(64) NOT NULL,
  `title` varchar(64) default NULL COMMENT '职位',
  `industry` varchar(5) default NULL COMMENT '行业',
  `location` varchar(6) default NULL COMMENT '城市',
  `address` varchar(30) default NULL,
  `postcode` varchar(6) default NULL,
  `fixed_number` varchar(32) default NULL,
  `web_url` varchar(80) default NULL,
  `company_pinyin` varchar(100) default NULL,
  `start_year` smallint(4) unsigned default NULL,
  `start_month` tinyint(2) unsigned default '1',
  `end_year` smallint(4) unsigned default NULL,
  `end_month` tinyint(2) unsigned default '12',
  PRIMARY KEY  (`id`),
  KEY `FK_positions_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=62 ;

-- 
-- 导出表中的数据 `tbl_positions`
-- 

INSERT INTO `tbl_positions` VALUES (1, 8, 'hhe.', 1, '新浪微博', 'php', '6', '2', NULL, NULL, NULL, NULL, 'xinlangweibo xlwb', NULL, 1, NULL, 12);
INSERT INTO `tbl_positions` VALUES (2, 8, NULL, 1, 'TheIndex', 'php', '2', '22', NULL, NULL, NULL, NULL, '', NULL, 1, NULL, 12);
INSERT INTO `tbl_positions` VALUES (10, 94, '', 0, 'index', 'mobile engineer', NULL, NULL, 'beijing', NULL, NULL, NULL, '', NULL, 1, NULL, 12);
INSERT INTO `tbl_positions` VALUES (11, 94, '', 0, 'nokia', 'mobile engineer', NULL, NULL, '', NULL, NULL, NULL, '', NULL, 1, NULL, 12);
INSERT INTO `tbl_positions` VALUES (34, 40, '', 0, '新浪乐居公司', 'php工程师', '2-2', '2-2', ' 北京市海淀区中关村北大街', NULL, NULL, NULL, 'xinlanglejugongsi xinlangyuejugongsi xllyjgs', 1998, 2, 2001, 12);
INSERT INTO `tbl_positions` VALUES (35, 102, NULL, 0, '炎黄', '开发工程师aaaa', '2-2', '2-4', NULL, NULL, NULL, NULL, 'yanhuang yh', 1951, 1, 1959, 1);
INSERT INTO `tbl_positions` VALUES (38, 102, NULL, 0, '北京因动思信息有限公司', '工程师', '1-1', '2-5', NULL, NULL, NULL, NULL, 'beijingyindongsaishenxiyouxiangongsi beijingyindongsaixinxiyouxiangongsi beijingyindongsishenxiyouxi', 1952, 1, 1958, 1);
INSERT INTO `tbl_positions` VALUES (60, 223, NULL, 0, 'index', 'ios', NULL, '北京', NULL, NULL, NULL, NULL, NULL, 2011, 8, 2011, 8);
INSERT INTO `tbl_positions` VALUES (61, 102, NULL, 0, 'aa', '职位', '2-2', '2-4', NULL, NULL, NULL, NULL, NULL, 2012, 1, 2012, 1);

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_profiles`
-- 

DROP TABLE IF EXISTS `tbl_profiles`;
CREATE TABLE IF NOT EXISTS `tbl_profiles` (
  `user_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `company` varchar(30) default NULL,
  `title` varchar(20) default NULL,
  `headline` varchar(128) default NULL,
  `location` varchar(6) default NULL COMMENT '现居地',
  `industry` varchar(5) default NULL COMMENT '行业',
  `conn_num` int(11) default '0',
  `summary` text,
  `awards_num` int(11) default '0',
  `interests` varchar(128) default NULL,
  `positions_num` int(11) default '0',
  `publications_num` int(11) default '0',
  `languages_num` int(11) default '0',
  `educations_num` int(11) default '0',
  `recom_num` int(11) default '0',
  `phone_numbers_num` tinyint(4) default '0',
  `im_accounts_num` tinyint(4) default '0',
  `notice_num` tinyint(4) default '0',
  `birthdate` date default NULL,
  `address` varchar(256) default NULL COMMENT '籍贯',
  `picture_url` varchar(128) default NULL,
  `completeness` tinyint(2) unsigned default '0' COMMENT '资料完整度',
  `rank` int(11) unsigned default '0' COMMENT '含金量',
  `gender` tinyint(1) default '0' COMMENT '1:男, 2:女',
  `name_pinyin` varchar(60) default NULL,
  `visit_num` int(11) unsigned default '0',
  `fans_num` int(11) unsigned default '0',
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `tbl_profiles`
-- 

INSERT INTO `tbl_profiles` VALUES (6, 'Ray Liu', 'TheIndex', 'php', NULL, '18-4', '2', 7, NULL, 0, '', 2, 0, 0, 1, 0, 0, 0, 0, '0000-00-00', '', 'default_avatar.png', 70, 2, 1, '', 7, 1);
INSERT INTO `tbl_profiles` VALUES (7, '做最好的自己-', 'TheIndex fds', 'php', '', '2-2', '1-1', 0, 'be your personal best！', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', '', NULL, 26, 4, NULL, 'zuozuihaodeziji zuozuihaodiziji zzhddzj', 4, 0);
INSERT INTO `tbl_profiles` VALUES (8, '程序员天下', 'TheIndex', 'php', '哈哈 今儿天气不错', '2-2', '3-3', 0, '人生自古谁无死，来生继续写代码。众里寻他千百度，蓦然回首，那人正在写代码', 0, '', 1, 0, 0, 1, 0, 0, 0, 0, '0000-00-00', '光华路22号光华路SOHO—3座1716', NULL, 80, 6, 1, 'chengxuyuantianxia cxytx', 4, 0);
INSERT INTO `tbl_profiles` VALUES (26, '刘雷啊26', '北京因动思科技公司', 'php mysql', '', '17-2', '5-2', 0, '我自己', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '1987-04-22', '', NULL, 45, 18, 0, 'liuleia26 lla26', 5, 1);
INSERT INTO `tbl_profiles` VALUES (28, '①呴話①輩孑', 'TheIndex', 'php', '', '16-5', '6-3', 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', '', NULL, 45, 4, 0, 'gouhuabeijie houhuabeijie xuhuabeijie ghxhbj', 1, 0);
INSERT INTO `tbl_profiles` VALUES (31, '刘雷31', 'TheIndex', 'php', '', '5-1', '4-2', 0, NULL, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', '', NULL, 13, 4, NULL, 'liulei31 ll31', 0, 0);
INSERT INTO `tbl_profiles` VALUES (40, 'liulei_40', 'TheIndex', 'php工程师', 'I am 有钱的小破孩', '2-2', '17-3', 2, 'affaaaafffffaaaaaaaaaaaaaaaaabbbbbbbbbbaafffff', 0, '', 1, 0, 0, 2, 0, 1, 0, 0, '1987-03-25', '北京通州区', NULL, 100, 6, 2, '', 9, 2);
INSERT INTO `tbl_profiles` VALUES (90, '13341166120', 'TheIndex  inforomatics', 'php', '', '6-1', '3-1', 0, NULL, 0, '', 1, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', '', NULL, 26, 7, 1, '', 0, 0);
INSERT INTO `tbl_profiles` VALUES (91, 'liulei', 'TheIndex', 'php', NULL, '7-1', '2-5', 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', NULL, NULL, 55, 10, 2, '', 2, 0);
INSERT INTO `tbl_profiles` VALUES (92, 'a小小鸟', 'TheIndex LTD', 'php', NULL, '2-2', '17-3', 0, 'http://www.bida.me，超有趣的网站，中国第一家。', 0, '', 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', '', NULL, 45, 12, 2, 'axiaoxiaoniao axxn', 3, 1);
INSERT INTO `tbl_profiles` VALUES (93, 'oday', 'TheIndex', '工程师', NULL, '16-8', '2-5', 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', NULL, NULL, 26, 7, 2, '', 0, 0);
INSERT INTO `tbl_profiles` VALUES (94, 'oday2', 'TheIndex informatics', 'ios', NULL, '10-12', '1-1', 0, NULL, 0, 'cs, ios. android.', 2, 0, 0, 0, 0, 0, 0, 0, '2012-08-09', '', NULL, 70, 18, 1, '', 4, 2);
INSERT INTO `tbl_profiles` VALUES (95, 'mokmoth', 'TheIndex', 'php', NULL, '15-8', '1-5', 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', NULL, NULL, 26, 7, 2, '', 0, 0);
INSERT INTO `tbl_profiles` VALUES (96, 'aaron', '因动思', 'php', NULL, '21-1', '5-2', 4, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', NULL, NULL, 26, 4, 2, '', 1, 2);
INSERT INTO `tbl_profiles` VALUES (98, 'mosquito', 'TheIndex', 'php', NULL, '11-7', '2-6', 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', NULL, NULL, 26, 7, 1, '', 0, 0);
INSERT INTO `tbl_profiles` VALUES (99, '333', '北京因动思', 'php', NULL, '1-9', '3-4', 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', NULL, NULL, 26, 13, 2, '', 0, 0);
INSERT INTO `tbl_profiles` VALUES (102, '郭亚伦', 'Index informatics', 'IOS工程师', NULL, '4-2', '3-3', 6, '我是一个程序员，我是一个程序,ios我jiu shi w', 0, '', 1, 0, 0, 1, 0, 1, 1, 0, '2012-08-03', '北京市朝阳区光华路22号三单元-1716', NULL, 90, 33, 2, 'guoyalun7 gyl7', 8, 1);
INSERT INTO `tbl_profiles` VALUES (117, 'Aaron_亚伦007', 'TheIndex', 'php', NULL, '10-6', '2-3', 0, '', 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', NULL, 'default_avatar.png', 55, 12, 0, 'Aaron_yalun7 Aaron_yl7', 5, 1);
INSERT INTO `tbl_profiles` VALUES (130, '133665', '北京因动思科技公司', 'php', NULL, '1-2', '2-1', 0, NULL, 0, NULL, 1, 0, 0, 0, 0, 0, 0, 0, '2012-08-07', NULL, NULL, 60, 15, 2, NULL, 1, 1);
INSERT INTO `tbl_profiles` VALUES (144, '林小贱无限再启动', NULL, NULL, NULL, '18-4', '12-2', 0, '', 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', NULL, NULL, 13, 4, 0, 'linxiaojianmoxianzaiqidong linxiaojianwuxianzaiqidong lxjmwx', 0, 0);
INSERT INTO `tbl_profiles` VALUES (223, 'guo 亚伦', 'index', 'job', NULL, '2-4', '1-0', 6, '我就是我', 0, NULL, 1, 0, 0, 1, 0, 0, 0, 0, '0000-00-00', NULL, NULL, 80, 20, 2, NULL, 3, 2);
INSERT INTO `tbl_profiles` VALUES (224, 'oday', NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', NULL, NULL, 15, 4, 0, NULL, 0, 0);
INSERT INTO `tbl_profiles` VALUES (225, 'ustc_oday0311', NULL, NULL, NULL, '18-4', NULL, 0, '北飘 工程师。', 0, NULL, 0, 0, 0, 1, 0, 0, 0, 0, '0000-00-00', NULL, NULL, 35, 9, 0, NULL, 2, 1);
INSERT INTO `tbl_profiles` VALUES (226, 'oday', NULL, NULL, NULL, '1-1', NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', NULL, NULL, 35, 9, 1, NULL, 0, 0);
INSERT INTO `tbl_profiles` VALUES (227, 'alex_huang', NULL, NULL, NULL, '4-8', NULL, 0, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', NULL, NULL, 35, 9, 1, NULL, 2, 2);
INSERT INTO `tbl_profiles` VALUES (228, '汤逊湖边乱飞', '', '', NULL, '北京 昌平区', NULL, 0, 'kldfjdslifjsdlfdsklfdsklfjdsf o\r\nfdls;fj', 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', '', NULL, 25, 0, 1, NULL, 0, 0);
INSERT INTO `tbl_profiles` VALUES (229, '单挑孔明', NULL, NULL, NULL, '中国 江西 ', NULL, 0, '', 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '1986-05-13', NULL, NULL, 25, 0, 0, NULL, 0, 0);
INSERT INTO `tbl_profiles` VALUES (230, '单挑孔明', NULL, NULL, NULL, '中国 景德镇', NULL, 0, '', 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '1986-05-13', NULL, NULL, 25, 0, 0, NULL, 0, 0);
INSERT INTO `tbl_profiles` VALUES (231, '胡宏飞', NULL, NULL, NULL, NULL, NULL, 3, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', NULL, NULL, 25, 0, 1, NULL, 0, 0);
INSERT INTO `tbl_profiles` VALUES (232, 'rfgrtfght', 'TheIndex', '', NULL, NULL, NULL, 3, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '0000-00-00', '', NULL, 35, 0, 1, NULL, 0, 1);

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_pw_protection_answers`
-- 

DROP TABLE IF EXISTS `tbl_pw_protection_answers`;
CREATE TABLE IF NOT EXISTS `tbl_pw_protection_answers` (
  `user_id` int(11) NOT NULL,
  `qid` smallint(6) unsigned NOT NULL,
  `answer` varchar(30) NOT NULL,
  UNIQUE KEY `UK_userid_qid` (`user_id`,`qid`),
  KEY `FK_question_id` (`qid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `tbl_pw_protection_answers`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_pw_protection_questions`
-- 

DROP TABLE IF EXISTS `tbl_pw_protection_questions`;
CREATE TABLE IF NOT EXISTS `tbl_pw_protection_questions` (
  `qid` smallint(6) unsigned NOT NULL auto_increment,
  `question` varchar(60) NOT NULL,
  PRIMARY KEY  (`qid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

-- 
-- 导出表中的数据 `tbl_pw_protection_questions`
-- 

INSERT INTO `tbl_pw_protection_questions` VALUES (1, '您母亲的姓名是？');
INSERT INTO `tbl_pw_protection_questions` VALUES (2, '您母亲的生日是？');
INSERT INTO `tbl_pw_protection_questions` VALUES (3, '您父亲的姓名是？');
INSERT INTO `tbl_pw_protection_questions` VALUES (4, '您父亲的生日是？');
INSERT INTO `tbl_pw_protection_questions` VALUES (5, '您配偶的姓名是？');
INSERT INTO `tbl_pw_protection_questions` VALUES (6, '您配偶的生日是？');
INSERT INTO `tbl_pw_protection_questions` VALUES (7, '您最熟悉的童年好友名字是？');
INSERT INTO `tbl_pw_protection_questions` VALUES (8, '对您影响最大的人名字是？');
INSERT INTO `tbl_pw_protection_questions` VALUES (9, '您的出生地是？');
INSERT INTO `tbl_pw_protection_questions` VALUES (10, '您孩子的名字是？');
INSERT INTO `tbl_pw_protection_questions` VALUES (11, '您的学号（或工号）是？');
INSERT INTO `tbl_pw_protection_questions` VALUES (12, '您高中班主任的名字是？');

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_ref_accounts`
-- 

DROP TABLE IF EXISTS `tbl_ref_accounts`;
CREATE TABLE IF NOT EXISTS `tbl_ref_accounts` (
  `account` varchar(64) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  `connect_name` varchar(50) NOT NULL,
  PRIMARY KEY  (`account`,`type`),
  KEY `FK_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `tbl_ref_accounts`
-- 

INSERT INTO `tbl_ref_accounts` VALUES ('13341166120', 22, 90, '13341166120');
INSERT INTO `tbl_ref_accounts` VALUES ('13366576525', 22, 130, '13366576525');
INSERT INTO `tbl_ref_accounts` VALUES ('13911650018', 22, 94, 'oday');
INSERT INTO `tbl_ref_accounts` VALUES ('1448980132', 1, 144, '林小贱无限再启动');
INSERT INTO `tbl_ref_accounts` VALUES ('1620329427', 1, 117, 'Aaron_亚伦007');
INSERT INTO `tbl_ref_accounts` VALUES ('1673695635', 0, 228, '汤逊湖边乱飞');
INSERT INTO `tbl_ref_accounts` VALUES ('1673695635', 1, 228, '汤逊湖边乱飞');
INSERT INTO `tbl_ref_accounts` VALUES ('1673695635', 23, 228, '汤逊湖边乱飞');
INSERT INTO `tbl_ref_accounts` VALUES ('1718627094', 1, 92, 'a小小鸟');
INSERT INTO `tbl_ref_accounts` VALUES ('1817580490', 1, 225, 'ustc_oday0311');
INSERT INTO `tbl_ref_accounts` VALUES ('1835480275', 1, 8, '程序员天下');
INSERT INTO `tbl_ref_accounts` VALUES ('18601140270', 22, 102, '18601140270');
INSERT INTO `tbl_ref_accounts` VALUES ('18601140271', 22, 223, '18601140271');
INSERT INTO `tbl_ref_accounts` VALUES ('2010861067', 1, 7, '做最好的自己-');
INSERT INTO `tbl_ref_accounts` VALUES ('2486500745', 1, 97, '因动思');
INSERT INTO `tbl_ref_accounts` VALUES ('333@33.com', 23, 99, '333');
INSERT INTO `tbl_ref_accounts` VALUES ('65E3C22F0E7719C9E46289212365D2E5', 5, 224, 'oday');
INSERT INTO `tbl_ref_accounts` VALUES ('70811514', 6, 31, '刘雷');
INSERT INTO `tbl_ref_accounts` VALUES ('aa@theindex.com', 23, 227, 'alex_huang');
INSERT INTO `tbl_ref_accounts` VALUES ('bbkliulei', 2, 26, '刘雷雷');
INSERT INTO `tbl_ref_accounts` VALUES ('bbkliulei@gmail.com', 23, 91, 'liulei');
INSERT INTO `tbl_ref_accounts` VALUES ('coffe6591217@yahoo.cn', 23, 231, '胡宏飞');
INSERT INTO `tbl_ref_accounts` VALUES ('D29572FA181AD8A1EA720CAE561F57FE', 5, 28, '①呴話①輩孑');
INSERT INTO `tbl_ref_accounts` VALUES ('FEgrl5PaKi', 0, 6, 'Ray Liu');
INSERT INTO `tbl_ref_accounts` VALUES ('FEgrl5PaKi', 8, 6, 'Ray Liu');
INSERT INTO `tbl_ref_accounts` VALUES ('huhongfeiwin', 1, 229, '单挑孔明');
INSERT INTO `tbl_ref_accounts` VALUES ('huhongfeiwin', 2, 230, '单挑孔明');
INSERT INTO `tbl_ref_accounts` VALUES ('hukely@theindex.com', 23, 232, 'rfgrtfght');
INSERT INTO `tbl_ref_accounts` VALUES ('mokmoth@gmail.com', 23, 95, 'mokmoth');
INSERT INTO `tbl_ref_accounts` VALUES ('oday0311@gmail.com', 23, 226, 'oday');
INSERT INTO `tbl_ref_accounts` VALUES ('oday0311@hotmail.com', 23, 93, 'oday');
INSERT INTO `tbl_ref_accounts` VALUES ('sdfjsd@gmail.com', 23, 145, '123');
INSERT INTO `tbl_ref_accounts` VALUES ('song.yang@theindex.com', 23, 98, 'mosquito');
INSERT INTO `tbl_ref_accounts` VALUES ('yalunguo@163.com', 23, 96, 'aaron');

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_schools`
-- 

DROP TABLE IF EXISTS `tbl_schools`;
CREATE TABLE IF NOT EXISTS `tbl_schools` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(80) NOT NULL,
  `province_id` smallint(2) unsigned NOT NULL,
  `city_id` smallint(3) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `location` (`province_id`,`city_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7508 ;

-- 
-- 导出表中的数据 `tbl_schools`
-- 

INSERT INTO `tbl_schools` VALUES (1, '清华大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (2, '北京大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (3, '中国人民大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (4, '北京航空航天大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (5, '北京邮电大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (6, '北京师范大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (7, '中国传媒大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (8, '北京语言大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (9, '北京科技大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (10, '中国农业大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (11, '北京理工大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (12, '北京林业大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (13, '北京交通大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (14, '中国矿业大学（北京）', 0, 2);
INSERT INTO `tbl_schools` VALUES (15, '北京信息科技大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (16, '北京工业大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (17, '北京化工大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (18, '中国政法大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (19, '对外经贸大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (20, '中央民族大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (21, '中国地质大学（北京）', 0, 2);
INSERT INTO `tbl_schools` VALUES (22, '中科院', 0, 2);
INSERT INTO `tbl_schools` VALUES (23, '北京中医药大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (24, '首都经济贸易大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (25, '中央财经大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (26, '北方工业大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (27, '中国石油大学（北京）', 0, 2);
INSERT INTO `tbl_schools` VALUES (28, '外交学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (29, '首都师范大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (30, '中央戏剧学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (31, '中国青年政治学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (32, '北京外国语大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (33, '华北电力大学（北京）', 0, 2);
INSERT INTO `tbl_schools` VALUES (34, '中国人民公安大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (35, '北京协和医学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (36, '北京体育大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (37, '北京工商大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (38, '北京联合大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (39, '首都医科大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (40, '国际关系学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (41, '中央美术学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (42, '北京电子科技学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (43, '中国劳动关系学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (44, '中华女子学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (45, '北京建筑工程学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (46, '北京印刷学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (47, '北京石油化工学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (48, '首钢工学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (49, '北京农学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (50, '首都体育学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (51, '北京第二外国语学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (52, '北京物资学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (53, '北京警察学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (54, '中央音乐学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (55, '中国戏曲学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (56, '北京舞蹈学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (57, '北京城市学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (58, '北京电影学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (59, '北京服装学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (60, '青岛教育学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (61, '北京体育职业学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (62, '北京工商大学嘉华学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (63, '首都师范大学科德学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (64, '北京工业大学耿丹学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (65, '北京化工大学北方学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (66, '北京联合大学广告学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (67, '北京邮电大学世纪学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (68, '北京大学医学部', 0, 2);
INSERT INTO `tbl_schools` VALUES (69, '北京政法职业学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (70, '北京信息职业技术学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (71, '北京现代职业技术学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (72, '北京现代音乐研修学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (73, '北京戏曲艺术职业学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (74, '北京锡华国际经贸职业学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (75, '北京盛基艺术学校', 0, 2);
INSERT INTO `tbl_schools` VALUES (76, '北京培黎职业学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (77, '北京农业职业学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (78, '北京科技职业学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (79, '北京科技经营管理学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (80, '北京经贸职业学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (81, '北京经济技术职业学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (82, '北京京北职业技术学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (83, '北京交通职业技术学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (84, '北京吉利大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (85, '北京汇佳职业学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (86, '北京工业职业技术学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (87, '北京工商管理专修学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (88, '北京电子科技职业学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (89, '北京财贸职业学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (90, '北京北大方正软件技术学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (91, '北大资源美术学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (92, '北京人文大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (93, '北京高等秘书学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (94, '北京应用技术大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (95, '中国防卫科技学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (96, '中国音乐学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (97, '中国信息大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (98, '北京青年政治学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (99, '北京财经专修学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (100, '北京经济管理职业学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (101, '北京美国英语语言学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (102, '中国管理软件学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (103, '财政部财政科学研究所', 0, 2);
INSERT INTO `tbl_schools` VALUES (104, '北大资源学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (105, '现代管理大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (106, '北京民族大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (107, '北京市劳动保障职业学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (108, '北京市建设职工大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (109, '北京市房地产职工大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (110, '北京市汽车工业总公司职工大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (111, '北京市西城经济科学大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (112, '北京市丰台区职工大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (113, '北京广播电视大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (114, '北京教育学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (115, '北京市东城区职工业余大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (116, '北京市总工会职工大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (117, '北京市海淀区职工大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (118, '北京市崇文区职工大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (119, '北京宣武红旗业余大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (120, '北京市石景山区业余大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (121, '北京市朝阳区职工大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (122, '北京市机械工业局职工大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (123, '北京医药集团职工大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (124, '北京劳动保障职业学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (125, '北京社会管理职业学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (126, '北京演艺专修学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (127, '北京兴华大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (128, '北京新园明职业学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (129, '中央党校研究生院', 0, 2);
INSERT INTO `tbl_schools` VALUES (130, '中国社科院', 0, 2);
INSERT INTO `tbl_schools` VALUES (131, '北京旅游专修学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (132, '东方文化艺术学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (133, '首都联合职工大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (134, '中国农业科学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (135, '北京影视研修学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (136, '国家法官学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (137, '北京建设大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (138, '北京金融学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (139, '北京黄埔大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (140, '中瑞酒店管理学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (141, '中国建筑设计研究院', 0, 2);
INSERT INTO `tbl_schools` VALUES (142, '北京文理研修学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (143, '北京当代艺术学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (144, '北京大学国际法学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (145, '北京交通运输职业学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (146, '中国艺术研究院', 0, 2);
INSERT INTO `tbl_schools` VALUES (147, '北京工业大学通州分校', 0, 2);
INSERT INTO `tbl_schools` VALUES (148, '北京八维研修学院', 0, 2);
INSERT INTO `tbl_schools` VALUES (149, '网络销售大学', 0, 2);
INSERT INTO `tbl_schools` VALUES (150, '朝阳二外', 0, 2);
INSERT INTO `tbl_schools` VALUES (151, '中北国际演艺学校', 0, 2);
INSERT INTO `tbl_schools` VALUES (152, '复旦大学', 0, 24);
INSERT INTO `tbl_schools` VALUES (153, '上海交通大学', 0, 24);
INSERT INTO `tbl_schools` VALUES (154, '同济大学', 0, 24);
INSERT INTO `tbl_schools` VALUES (155, '华东师大', 0, 24);
INSERT INTO `tbl_schools` VALUES (156, '上海财经', 0, 24);
INSERT INTO `tbl_schools` VALUES (157, '华东理工', 0, 24);
INSERT INTO `tbl_schools` VALUES (158, '上海商学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (159, '东华大学', 0, 24);
INSERT INTO `tbl_schools` VALUES (160, '上海理工', 0, 24);
INSERT INTO `tbl_schools` VALUES (161, '上海大学', 0, 24);
INSERT INTO `tbl_schools` VALUES (162, '上海外国语大学', 0, 24);
INSERT INTO `tbl_schools` VALUES (163, '上海海事', 0, 24);
INSERT INTO `tbl_schools` VALUES (164, '上海工程', 0, 24);
INSERT INTO `tbl_schools` VALUES (165, '上海海洋大学', 0, 24);
INSERT INTO `tbl_schools` VALUES (166, '上海中医药', 0, 24);
INSERT INTO `tbl_schools` VALUES (167, '上海师大', 0, 24);
INSERT INTO `tbl_schools` VALUES (168, '建桥学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (169, '上海政法', 0, 24);
INSERT INTO `tbl_schools` VALUES (170, '上海电机', 0, 24);
INSERT INTO `tbl_schools` VALUES (171, '上海二工大', 0, 24);
INSERT INTO `tbl_schools` VALUES (172, '上海应用技术学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (173, '上海电力', 0, 24);
INSERT INTO `tbl_schools` VALUES (174, '上海外贸', 0, 24);
INSERT INTO `tbl_schools` VALUES (175, '上海金融', 0, 24);
INSERT INTO `tbl_schools` VALUES (176, '上海立信会计学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (177, '上海体院', 0, 24);
INSERT INTO `tbl_schools` VALUES (178, '上海音乐学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (179, '上海戏剧学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (180, '杉达学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (181, '华东政法大学', 0, 24);
INSERT INTO `tbl_schools` VALUES (182, '上海师范大学青年学院 ', 0, 24);
INSERT INTO `tbl_schools` VALUES (183, '上外贤达经济人文学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (184, '同济大学同科学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (185, '上海师范大学天华学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (186, '上海东方文化职业学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (187, '上海工商学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (188, '复旦大学上海视觉艺术学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (189, '复旦大学上海医学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (190, '复旦大学太平洋金融学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (191, '上海邦德职业技术学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (192, '上海诚信学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (193, '上海城市管理职业技术学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (194, '上海出版印刷高等专科学校', 0, 24);
INSERT INTO `tbl_schools` VALUES (195, '上海电影艺术职业学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (196, '上海电子信息职业技术学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (197, '上海东海职业技术学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (198, '上海工会管理职业学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (199, '上海工商外国语学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (200, '上海工艺美术职业学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (201, '上海公安高等专科学校', 0, 24);
INSERT INTO `tbl_schools` VALUES (202, '上海海关学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (203, '上海海事职业技术学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (204, '上海济光职业技术学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (205, '上海建峰职业技术学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (206, '上海交通职业技术学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (207, '上海科学技术职业学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (208, '上海立达职业技术学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (209, '上海旅游高等专科学校', 0, 24);
INSERT INTO `tbl_schools` VALUES (210, '上海民远职业技术学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (211, '上海农林职业技术学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (212, '上海欧华职业技术学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (213, '上海思博职业技术学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (214, '上海托普信息技术学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (215, '上海新侨职业技术学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (216, '上海行健职业学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (217, '上海医疗器械高等专科学校', 0, 24);
INSERT INTO `tbl_schools` VALUES (218, '上海医药高等专科学校', 0, 24);
INSERT INTO `tbl_schools` VALUES (219, '上海震旦职业学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (220, '上海中华职业技术学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (221, '上海中侨职业技术学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (222, '上海纺织工业职工大学', 0, 24);
INSERT INTO `tbl_schools` VALUES (223, '上海体育职业学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (224, '上海医药职工大学', 0, 24);
INSERT INTO `tbl_schools` VALUES (225, '上海市广播电视大学', 0, 24);
INSERT INTO `tbl_schools` VALUES (226, '上海职工医学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (227, '上海职工体育运动技术学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (228, '华东理工大学网络教育学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (229, '上海市经济管理干部学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (230, '上海社会科学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (231, '上海大学艺术研究院', 0, 24);
INSERT INTO `tbl_schools` VALUES (232, '中国科学院上海生命科学研究院', 0, 24);
INSERT INTO `tbl_schools` VALUES (233, '上海生物制品研究所', 0, 24);
INSERT INTO `tbl_schools` VALUES (234, '上海行政学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (235, '上海科技学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (236, '拉萨尔国际设计学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (237, '上海青年管理干部学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (238, '上海鸿文职业技术学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (239, '上海大学巴士汽车学院', 0, 24);
INSERT INTO `tbl_schools` VALUES (240, '哈尔滨工业大学', 0, 11);
INSERT INTO `tbl_schools` VALUES (241, '哈工程', 0, 11);
INSERT INTO `tbl_schools` VALUES (242, '东北林大', 0, 11);
INSERT INTO `tbl_schools` VALUES (243, '东北农业大学', 0, 11);
INSERT INTO `tbl_schools` VALUES (244, '哈尔滨医科大学', 0, 11);
INSERT INTO `tbl_schools` VALUES (245, '黑龙江中医药', 0, 11);
INSERT INTO `tbl_schools` VALUES (246, '黑工程', 0, 11);
INSERT INTO `tbl_schools` VALUES (247, '黑龙江科技大学', 0, 11);
INSERT INTO `tbl_schools` VALUES (248, '哈尔滨学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (249, '哈尔滨体院', 0, 11);
INSERT INTO `tbl_schools` VALUES (250, '东方学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (251, '黑龙江大学', 0, 11);
INSERT INTO `tbl_schools` VALUES (252, '哈尔滨商业大学', 0, 11);
INSERT INTO `tbl_schools` VALUES (253, '哈师大', 0, 11);
INSERT INTO `tbl_schools` VALUES (254, '哈尔滨理工大学', 0, 11);
INSERT INTO `tbl_schools` VALUES (255, '佳木斯大学', 0, 11);
INSERT INTO `tbl_schools` VALUES (256, '齐齐哈尔大学', 0, 11);
INSERT INTO `tbl_schools` VALUES (257, '齐齐哈尔医学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (258, '黑龙江八一农垦大学', 0, 11);
INSERT INTO `tbl_schools` VALUES (259, '东北石油大学', 0, 11);
INSERT INTO `tbl_schools` VALUES (260, '大庆师范学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (261, '牡丹江医学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (262, '牡丹江师范', 0, 11);
INSERT INTO `tbl_schools` VALUES (263, '绥化学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (264, '黑河学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (265, '大庆医学高等专科学校', 0, 11);
INSERT INTO `tbl_schools` VALUES (266, '大庆职业学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (267, '大兴安岭职业学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (268, '哈尔滨电力职业技术学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (269, '哈尔滨华夏计算机职业技术学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (270, '哈尔滨金融学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (271, '哈尔滨铁道职业技术学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (272, '哈尔滨现代公共关系职业学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (273, '哈尔滨职业技术学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (274, '鹤岗师范高等专科学校', 0, 11);
INSERT INTO `tbl_schools` VALUES (275, '黑龙江北开职业技术学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (276, '黑龙江工商职业技术学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (277, '黑龙江建筑职业技术学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (278, '黑龙江林业职业技术学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (279, '黑龙江旅游职业技术学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (280, '黑龙江煤炭职业技术学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (281, '黑龙江民族职业学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (282, '黑龙江农垦林业职业技术学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (283, '黑龙江农垦农业职业技术学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (284, '黑龙江农垦职业学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (285, '黑龙江农业工程职业学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (286, '黑龙江农业经济职业学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (287, '黑龙江农业职业技术学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (288, '黑龙江三江美术职业学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (289, '黑龙江商业职业学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (290, '黑龙江生态工程职业学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (291, '黑龙江生物科技职业学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (292, '黑龙江司法警官职业学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (293, '黑龙江信息技术职业学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (294, '黑龙江畜牧兽医职业学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (295, '黑龙江艺术职业学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (296, '鸡西大学', 0, 11);
INSERT INTO `tbl_schools` VALUES (297, '牡丹江大学', 0, 11);
INSERT INTO `tbl_schools` VALUES (298, '七台河职业学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (299, '齐齐哈尔高等师范专科学校', 0, 11);
INSERT INTO `tbl_schools` VALUES (300, '齐齐哈尔工程学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (301, '伊春职业学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (302, '哈尔滨师范大学阿城学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (303, '黑龙江省政法管理干部学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (304, '黑龙江交通职业技术学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (305, '哈尔滨应用职业技术学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (306, '黑龙江省教育学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (307, '哈尔滨理工大学远东学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (308, '哈尔滨师范大学呼兰学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (309, '黑龙江外国语学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (310, '哈尔滨商业大学德强商务学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (311, '东北石油大学华瑞学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (312, '东北农业大学成栋学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (313, '黑龙江大学剑桥学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (314, '哈尔滨商业大学广厦学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (315, '哈尔滨工业大学华德应用技术学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (316, '哈尔滨市职工医学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (317, '佳木斯教育学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (318, '黑龙江幼儿师范高等专科学校', 0, 11);
INSERT INTO `tbl_schools` VALUES (319, '哈尔滨外国语学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (320, '哈尔滨科学技术职业学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (321, '黑龙江粮食职业学院　　', 0, 11);
INSERT INTO `tbl_schools` VALUES (322, '佳木斯职业学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (323, '黑龙江广播电视大学', 0, 11);
INSERT INTO `tbl_schools` VALUES (324, '哈尔滨广播电视大学', 0, 11);
INSERT INTO `tbl_schools` VALUES (325, '黑龙江大鹏传媒学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (326, '鸡西市北方外国语学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (327, '牡丹江市精英计算机学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (328, '黑龙江中医药大学', 0, 11);
INSERT INTO `tbl_schools` VALUES (329, '齐齐哈尔林业学校', 0, 11);
INSERT INTO `tbl_schools` VALUES (330, '齐齐哈尔林业学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (331, '黑龙江生态职业学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (332, '哈尔滨阳光计算机专修学校', 0, 11);
INSERT INTO `tbl_schools` VALUES (333, '齐齐哈尔市卫生学校', 0, 11);
INSERT INTO `tbl_schools` VALUES (334, '伟建工学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (335, '诚实外语学院（肇庆分院）', 0, 11);
INSERT INTO `tbl_schools` VALUES (336, '黑龙江省畜牧职业学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (337, '哈尔滨德强商务学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (338, '黑龙江现代艺术学院', 0, 11);
INSERT INTO `tbl_schools` VALUES (339, '黑龙江省对外贸易学校', 0, 11);
INSERT INTO `tbl_schools` VALUES (340, '哈尔滨市幼儿师范学校', 0, 11);
INSERT INTO `tbl_schools` VALUES (341, '黑龙江省社会科学院研究生部', 0, 11);
INSERT INTO `tbl_schools` VALUES (342, '吉林大学', 18, 2);
INSERT INTO `tbl_schools` VALUES (343, '东北师范大学', 18, 2);
INSERT INTO `tbl_schools` VALUES (344, '长春大学', 18, 2);
INSERT INTO `tbl_schools` VALUES (345, '吉林农大', 18, 2);
INSERT INTO `tbl_schools` VALUES (346, '长春中医药', 18, 2);
INSERT INTO `tbl_schools` VALUES (347, '东北电力大学', 18, 2);
INSERT INTO `tbl_schools` VALUES (348, '吉林化工', 18, 2);
INSERT INTO `tbl_schools` VALUES (349, '吉林建工', 18, 2);
INSERT INTO `tbl_schools` VALUES (350, '长春工程学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (351, '长春师范学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (352, '吉林工程师范', 18, 2);
INSERT INTO `tbl_schools` VALUES (353, '吉林华侨外国语学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (354, '吉林财经大学', 18, 2);
INSERT INTO `tbl_schools` VALUES (355, '吉林体院', 18, 2);
INSERT INTO `tbl_schools` VALUES (356, '吉林艺术学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (357, '长春工业大学', 18, 2);
INSERT INTO `tbl_schools` VALUES (358, '长春理工大学', 18, 2);
INSERT INTO `tbl_schools` VALUES (359, '吉林俄语学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (360, '延边大学', 18, 2);
INSERT INTO `tbl_schools` VALUES (361, '北华大学', 18, 2);
INSERT INTO `tbl_schools` VALUES (362, '吉林农业科技学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (363, '吉林医药学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (364, '吉林师范', 18, 2);
INSERT INTO `tbl_schools` VALUES (365, '白城师范学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (366, '通化师范', 18, 2);
INSERT INTO `tbl_schools` VALUES (367, '白城医学高等专科学校', 18, 2);
INSERT INTO `tbl_schools` VALUES (368, '长春东方职业学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (369, '长春金融高等专科学校', 18, 2);
INSERT INTO `tbl_schools` VALUES (370, '长春汽车工业高等专科学校', 18, 2);
INSERT INTO `tbl_schools` VALUES (371, '长春信息技术职业学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (372, '长春医学高等专科学校', 18, 2);
INSERT INTO `tbl_schools` VALUES (373, '长春职业技术学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (374, '东北师范大学人文学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (375, '吉林工商学院—财经校区', 18, 2);
INSERT INTO `tbl_schools` VALUES (376, '吉林大学—莱姆顿学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (377, '吉林电子信息职业技术学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (378, '吉林对外经贸职业学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (379, '吉林工业职业技术学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (380, '吉林交通职业技术学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (381, '吉林工商学院—工程校区', 18, 2);
INSERT INTO `tbl_schools` VALUES (382, '吉林农业工程职业技术学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (383, '吉林工商学院—商贸校区', 18, 2);
INSERT INTO `tbl_schools` VALUES (384, '吉林司法警官职业学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (385, '辽源职业技术学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (386, '四平职业大学', 18, 2);
INSERT INTO `tbl_schools` VALUES (387, '松原职业技术学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (388, '吉林省教育学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (389, '吉林经济管理干部学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (390, '长春大学光华学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (391, '长春大学旅游学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (392, '长春工业大学人文信息学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (393, '吉林动画学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (394, '长春理工大学光电信息学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (395, '吉林农业大学发展学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (396, '吉林师范大学博达学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (397, '吉林铁道职业技术学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (398, '白城职业技术学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (399, '长春建筑学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (400, '吉林建筑工程学院城建学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (401, '通化市职工大学', 18, 2);
INSERT INTO `tbl_schools` VALUES (402, '通化钢铁公司职工大学', 18, 2);
INSERT INTO `tbl_schools` VALUES (403, '吉林省经济管理干部学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (404, '吉林广播电视大学', 18, 2);
INSERT INTO `tbl_schools` VALUES (405, '长春教育学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (406, '梨树农村成人高等专科学校', 18, 2);
INSERT INTO `tbl_schools` VALUES (407, '延边黎明农民大学', 18, 2);
INSERT INTO `tbl_schools` VALUES (408, '吉林职工医科大学', 18, 2);
INSERT INTO `tbl_schools` VALUES (409, '吉林省行政管理干部学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (410, '吉林化学工业公司职工大学', 18, 2);
INSERT INTO `tbl_schools` VALUES (411, '延边职工大学', 18, 2);
INSERT INTO `tbl_schools` VALUES (412, '长春职工医科大学', 18, 2);
INSERT INTO `tbl_schools` VALUES (413, '长春市直属机关业余大学', 18, 2);
INSERT INTO `tbl_schools` VALUES (414, '长春市建筑职工业余大学', 18, 2);
INSERT INTO `tbl_schools` VALUES (415, '长春职工大学', 18, 2);
INSERT INTO `tbl_schools` VALUES (416, '长春广播电视大学', 18, 2);
INSERT INTO `tbl_schools` VALUES (417, '长白山职业技术学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (418, '长春邮电学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (419, '吉林科技职业技术学院', 18, 2);
INSERT INTO `tbl_schools` VALUES (420, '长春艺术学校', 18, 2);
INSERT INTO `tbl_schools` VALUES (421, '大连理工', 0, 19);
INSERT INTO `tbl_schools` VALUES (422, '东北大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (423, '辽宁大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (424, '大连海事', 0, 19);
INSERT INTO `tbl_schools` VALUES (425, '东北财经', 0, 19);
INSERT INTO `tbl_schools` VALUES (426, '大连大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (427, '大连交大', 0, 19);
INSERT INTO `tbl_schools` VALUES (428, '大连医大', 0, 19);
INSERT INTO `tbl_schools` VALUES (429, '辽宁师大', 0, 19);
INSERT INTO `tbl_schools` VALUES (430, '大连民族', 0, 19);
INSERT INTO `tbl_schools` VALUES (431, '大连工大', 0, 19);
INSERT INTO `tbl_schools` VALUES (432, '大连海洋大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (433, '大连外国语学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (434, '辽宁外经贸', 0, 19);
INSERT INTO `tbl_schools` VALUES (435, '铁岭卫生职业学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (436, '沈阳大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (437, '沈阳理工', 0, 19);
INSERT INTO `tbl_schools` VALUES (438, '沈阳工大', 0, 19);
INSERT INTO `tbl_schools` VALUES (439, '沈阳建筑', 0, 19);
INSERT INTO `tbl_schools` VALUES (440, '沈阳农大', 0, 19);
INSERT INTO `tbl_schools` VALUES (441, '辽宁中医药', 0, 19);
INSERT INTO `tbl_schools` VALUES (442, '沈阳药科', 0, 19);
INSERT INTO `tbl_schools` VALUES (443, '沈阳师范', 0, 19);
INSERT INTO `tbl_schools` VALUES (444, '中国刑警学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (445, '沈阳化工', 0, 19);
INSERT INTO `tbl_schools` VALUES (446, '沈阳航空航天大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (447, '沈阳工程', 0, 19);
INSERT INTO `tbl_schools` VALUES (448, '沈阳医学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (449, '沈阳体院', 0, 19);
INSERT INTO `tbl_schools` VALUES (450, '鲁迅美院', 0, 19);
INSERT INTO `tbl_schools` VALUES (451, '沈阳音乐学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (452, '中国医科大', 0, 19);
INSERT INTO `tbl_schools` VALUES (453, '辽宁工程技术大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (454, '辽宁石化', 0, 19);
INSERT INTO `tbl_schools` VALUES (455, '辽宁科大', 0, 19);
INSERT INTO `tbl_schools` VALUES (456, '鞍山师范学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (457, '渤海大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (458, '辽宁工业大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (459, '辽宁医学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (460, '辽宁科技学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (461, '辽东学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (462, '鞍山市高等职业专科学校', 0, 19);
INSERT INTO `tbl_schools` VALUES (463, '渤海船舶职业学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (464, '渤海大学文理学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (465, '朝阳师范高等专科学校', 0, 19);
INSERT INTO `tbl_schools` VALUES (466, '大连东软信息学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (467, '大连翻译职业技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (468, '大连枫叶职业技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (469, '大连软件职业学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (470, '大连商务职业学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (471, '大连艺术职业学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (472, '大连职业技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (473, '抚顺师范高等专科学校', 0, 19);
INSERT INTO `tbl_schools` VALUES (474, '抚顺职业技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (475, '阜新高等专科学校', 0, 19);
INSERT INTO `tbl_schools` VALUES (476, '辽宁理工学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (477, '锦州师范高等专科学校', 0, 19);
INSERT INTO `tbl_schools` VALUES (478, '辽宁广播电视大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (479, '辽宁广告职业学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (480, '辽宁机电职业技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (481, '辽宁交通高等专科学校', 0, 19);
INSERT INTO `tbl_schools` VALUES (482, '沈阳大学师范学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (483, '辽宁金融职业学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (484, '辽宁经济职业技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (485, '辽宁警官高等专科学校', 0, 19);
INSERT INTO `tbl_schools` VALUES (486, '辽宁科技大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (487, '辽宁林业职业技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (488, '辽宁美术职业学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (489, '辽宁农业职业技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (490, '辽宁商贸职业学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (491, '辽宁石化职业技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (492, '大连广播电视大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (493, '辽宁体育运动职业技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (494, '辽宁信息职业技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (495, '辽阳职业技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (496, '盘锦职业技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (497, '沈阳航空职业技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (498, '沈阳职业技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (499, '辽宁职业学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (500, '铁岭师范高等专科学校', 0, 19);
INSERT INTO `tbl_schools` VALUES (501, '营口职业技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (502, '沈阳广播电视大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (503, '青岛峻通科技专修学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (504, '辽河石油职业技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (505, '青岛广播电视大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (506, '沈阳航空工业学院北方科技学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (507, '沈阳理工大学应用技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (508, '大连工业大学艺术与信息工程学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (509, '大连交通大学信息工程学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (510, '沈阳建筑大学城市建设学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (511, '辽宁科技大学信息技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (512, '辽宁石油化工大学顺华能源学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (513, '沈阳化工学院科亚学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (514, '沈阳农业大学科学技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (515, '中国医科大学临床医药学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (516, '大连医科大学中山学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (517, '辽宁医学院医疗学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (518, '辽宁中医药大学杏林学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (519, '沈阳医学院何氏视觉科学学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (520, '辽宁师范大学海华学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (521, '东北财经大学津桥商学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (522, ' 辽宁财贸学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (523, '大连理工大学城市学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (524, '沈阳大学科技工程学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (525, '辽宁装备制造职业技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (526, '辽宁文化艺术职工大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (527, '辽宁公安司法管理干部学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (528, '沈阳工业大学工程学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (529, '海军职工大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (530, '阜新矿务局职工大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (531, '沈阳机械工业职工大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (532, '阜新煤炭职工医学专科学校', 0, 19);
INSERT INTO `tbl_schools` VALUES (533, '辽宁财贸职工大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (534, '大连市教育学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (535, '朝阳职工工学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (536, '鞍山钢铁集团公司职工大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (537, '抚顺石油化工公司职工大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (538, '辽宁兵器工业职工大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (539, '本溪钢铁公司职工工学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (540, '大连工人大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (541, '大连职工大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (542, '抚顺矿务局职工工学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (543, '辽宁地质工程职业学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (544, '辽宁中医药大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (545, '辽宁建筑职业技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (546, '沈阳国际科学技术专修学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (547, '辽宁商务职业学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (548, '辽宁财贸学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (549, '大连市工人大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (550, '辽宁广告设计学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (551, '沈阳工业大学（辽阳校区）', 0, 19);
INSERT INTO `tbl_schools` VALUES (552, '沈阳工业大学(辽阳校区)', 0, 19);
INSERT INTO `tbl_schools` VALUES (553, '辽宁省交通高等专科学校', 0, 19);
INSERT INTO `tbl_schools` VALUES (554, '辽宁省城市建设职业技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (555, '辽宁对外经贸学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (556, '鲁迅美术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (557, '大连艺术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (558, '辽宁税务高等专科学校', 0, 19);
INSERT INTO `tbl_schools` VALUES (559, '沈阳职业技术学院计算机学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (560, '吉林大学工商管理学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (561, '辽宁卫生职业技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (562, '大连航运职业技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (563, '辽宁东方中医学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (564, '辽宁公安司法干部管理学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (565, '中国人民解放军大连医学高等专科学校', 0, 19);
INSERT INTO `tbl_schools` VALUES (566, '大连装备制造职业技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (567, '沈阳建筑大学', 0, 19);
INSERT INTO `tbl_schools` VALUES (568, '大连东方外国语学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (569, '锦州医学院畜牧兽医学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (570, '辽宁铁道职业技术学院', 0, 19);
INSERT INTO `tbl_schools` VALUES (571, '南开大学', 0, 26);
INSERT INTO `tbl_schools` VALUES (572, '天津大学', 0, 26);
INSERT INTO `tbl_schools` VALUES (573, '河北工大', 0, 26);
INSERT INTO `tbl_schools` VALUES (574, '天津师大', 0, 26);
INSERT INTO `tbl_schools` VALUES (575, '天津工大', 0, 26);
INSERT INTO `tbl_schools` VALUES (576, '天津科大', 0, 26);
INSERT INTO `tbl_schools` VALUES (577, '天津理工', 0, 26);
INSERT INTO `tbl_schools` VALUES (578, '天津医大', 0, 26);
INSERT INTO `tbl_schools` VALUES (579, '天津中医药', 0, 26);
INSERT INTO `tbl_schools` VALUES (580, '天津财经', 0, 26);
INSERT INTO `tbl_schools` VALUES (581, '中国民航大学', 0, 26);
INSERT INTO `tbl_schools` VALUES (582, '天津城市建设学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (583, '天津农院', 0, 26);
INSERT INTO `tbl_schools` VALUES (584, '天津工程师范', 0, 26);
INSERT INTO `tbl_schools` VALUES (585, '天津外国语', 0, 26);
INSERT INTO `tbl_schools` VALUES (586, '天津商业大学', 0, 26);
INSERT INTO `tbl_schools` VALUES (587, '天津体院', 0, 26);
INSERT INTO `tbl_schools` VALUES (588, '天津音乐学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (589, '天津美院', 0, 26);
INSERT INTO `tbl_schools` VALUES (590, '天津市国际商务学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (591, '天津天狮学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (592, '天津滨海职业技术学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (593, '天津渤海职业技术学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (594, '天津城市建设管理职业技术学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (595, '天津城市职业学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (596, '天津电子信息职业技术学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (597, '天津对外经济贸易职业学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (598, '天津工程职业技术学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (599, '天津工商职业技术学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (600, '天津工业职业技术学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (601, '天津工艺美术职业学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (602, '天津公安警官职业学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (603, '天津海运职业学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (604, '天津机电职业技术学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (605, '天津交通职业学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (606, '天津开发区职业技术学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (607, '天津青年职业学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (608, '天津轻工职业技术学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (609, '天津生物工程职业技术学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (610, '天津石油职业技术学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (611, '天津铁道职业技术学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (612, '天津现代职业技术学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (613, '天津冶金职业技术学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (614, '天津医学高等专科学校', 0, 26);
INSERT INTO `tbl_schools` VALUES (615, '天津艺术职业学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (616, '天津职业大学', 0, 26);
INSERT INTO `tbl_schools` VALUES (617, '天津中德职业技术学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (618, '天津市工会管理干部学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (619, '天津外国语学院滨海外事学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (620, '天津体育学院运动与文化艺术学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (621, '天津商学院宝德学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (622, '天津医科大学临床医学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (623, '北京科技大学天津学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (624, '天津师范大学津沽学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (625, '天津理工大学中环信息学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (626, '天津大学仁爱学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (627, '天津财经大学珠江学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (628, '南开大学滨海学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (629, '天津市职工经济技术大学', 0, 26);
INSERT INTO `tbl_schools` VALUES (630, '天津市房地产局职工大学', 0, 26);
INSERT INTO `tbl_schools` VALUES (631, '天津市政法管理干部学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (632, '天津市财贸管理干部学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (633, '天津市广播电视大学', 0, 26);
INSERT INTO `tbl_schools` VALUES (634, '天津市管理干部学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (635, '天津市渤海化工职工学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (636, '天津市南开区职工大学', 0, 26);
INSERT INTO `tbl_schools` VALUES (637, '天津市红桥区职工大学', 0, 26);
INSERT INTO `tbl_schools` VALUES (638, '天津市建筑工程职工大学', 0, 26);
INSERT INTO `tbl_schools` VALUES (639, '天津市河东区职工大学', 0, 26);
INSERT INTO `tbl_schools` VALUES (640, '天津市河西区职工大学', 0, 26);
INSERT INTO `tbl_schools` VALUES (641, '天津市和平区新华职工大学', 0, 26);
INSERT INTO `tbl_schools` VALUES (642, '天津物资管理干部学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (643, '天津市海军工程大学', 0, 26);
INSERT INTO `tbl_schools` VALUES (644, '中国旅游干部管理学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (645, '天津海运职业学校', 0, 26);
INSERT INTO `tbl_schools` VALUES (646, '天津市国土资源和房屋职业学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (647, '天津轻工职业学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (648, '斯波泰克高级技工学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (649, '天津广播影视职业学院', 0, 26);
INSERT INTO `tbl_schools` VALUES (650, '天津职业技术师范大学', 0, 26);
INSERT INTO `tbl_schools` VALUES (651, '中国科大', 0, 1);
INSERT INTO `tbl_schools` VALUES (652, '安徽大学', 0, 1);
INSERT INTO `tbl_schools` VALUES (653, '合肥工大', 0, 1);
INSERT INTO `tbl_schools` VALUES (654, '安徽医科大', 0, 1);
INSERT INTO `tbl_schools` VALUES (655, '安徽建工', 0, 1);
INSERT INTO `tbl_schools` VALUES (656, '安徽中医', 0, 1);
INSERT INTO `tbl_schools` VALUES (657, '合肥学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (658, '安徽汽车职业技术学院 ', 0, 1);
INSERT INTO `tbl_schools` VALUES (659, '安徽农大', 0, 1);
INSERT INTO `tbl_schools` VALUES (660, '安徽工业大学', 0, 1);
INSERT INTO `tbl_schools` VALUES (661, '安徽科技', 0, 1);
INSERT INTO `tbl_schools` VALUES (662, '皖南医学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (663, '安徽师大', 0, 1);
INSERT INTO `tbl_schools` VALUES (664, '安徽工程大学', 0, 1);
INSERT INTO `tbl_schools` VALUES (665, '蚌埠医学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (666, '安徽财经', 0, 1);
INSERT INTO `tbl_schools` VALUES (667, '阜阳师范', 0, 1);
INSERT INTO `tbl_schools` VALUES (668, '淮南师范', 0, 1);
INSERT INTO `tbl_schools` VALUES (669, '安徽理工', 0, 1);
INSERT INTO `tbl_schools` VALUES (670, '淮北师范大学', 0, 1);
INSERT INTO `tbl_schools` VALUES (671, '安庆师范', 0, 1);
INSERT INTO `tbl_schools` VALUES (672, '铜陵学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (673, '皖西学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (674, '巢湖学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (675, '滁州学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (676, '宿州学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (677, '黄山学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (678, '新华学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (679, '蚌埠学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (680, '安徽财贸职业学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (681, '安徽城市管理职业学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (682, '安徽电气工程职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (683, '安徽电子信息职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (684, '安徽工贸职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (685, '安徽工商职业学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (686, '安徽工业经济职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (687, '安徽公安职业学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (688, '安徽广播影视职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (689, '安徽国防科技职业学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (690, '安徽国际商务职业学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (691, '安徽机电职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (692, '安徽交通职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (693, '安徽教育学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (694, '安徽经济管理学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (695, '安徽警官职业学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (696, '安徽林业职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (697, '安徽明星科技职业学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (698, '安徽商贸职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (699, '安徽审计职业学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (700, '安徽省三联职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (701, '安徽水利水电职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (702, '安徽体育运动职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (703, '安徽文达信息技术职业学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (704, '安徽新闻出版职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (705, '安徽冶金科技职业学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (706, '安徽医学高等专科学校', 0, 1);
INSERT INTO `tbl_schools` VALUES (707, '安徽艺术职业学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (708, '安徽邮电职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (709, '安徽职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (710, '安徽中澳科技职业学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (711, '安徽中医药高等专科学校', 0, 1);
INSERT INTO `tbl_schools` VALUES (712, '安庆职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (713, '蚌埠高等专科学校', 0, 1);
INSERT INTO `tbl_schools` VALUES (714, '蚌埠职业教育专修学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (715, '亳州师范高等专科学校', 0, 1);
INSERT INTO `tbl_schools` VALUES (716, '亳州职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (717, '巢湖职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (718, '池州学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (719, '池州职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (720, '滁州职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (721, '阜阳科技职业学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (722, '阜阳职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (723, '合肥市万博科技职业学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (724, '合肥通用职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (725, '淮北职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (726, '淮南联合大学', 0, 1);
INSERT INTO `tbl_schools` VALUES (727, '淮南职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (728, '六安职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (729, '马鞍山师范高等专科学校', 0, 1);
INSERT INTO `tbl_schools` VALUES (730, '安徽外国语学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (731, '民办合肥经济技术职业学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (732, '宿州职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (733, '铜陵职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (734, '芜湖信息技术职业学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (735, '芜湖职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (736, '宣城职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (737, '安徽师范大学皖江学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (738, '合肥师范学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (739, '凤阳师范高等专科学校', 0, 1);
INSERT INTO `tbl_schools` VALUES (740, '安庆医药高等专科学校', 0, 1);
INSERT INTO `tbl_schools` VALUES (741, '安徽工业职业技术学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (742, '合肥幼儿师范学校', 0, 1);
INSERT INTO `tbl_schools` VALUES (743, '蚌埠经济技术职业学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (744, '合肥财经职业学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (745, '徽商职业学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (746, '民办安徽旅游职业学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (747, '宿县地区教育学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (748, '淮南市职工大学', 0, 1);
INSERT INTO `tbl_schools` VALUES (749, '合肥职工科技大学', 0, 1);
INSERT INTO `tbl_schools` VALUES (750, '合肥市职工大学', 0, 1);
INSERT INTO `tbl_schools` VALUES (751, '安徽省广播电视大学', 0, 1);
INSERT INTO `tbl_schools` VALUES (752, '安徽绿海商务职业学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (753, '河海大学文天学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (754, '安徽涉外经济职业学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (755, '皖南农学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (756, '安徽蚌埠汽车管理学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (757, '安徽新华电脑专修学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (758, '蚌埠坦克学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (759, '安徽合肥机电技师学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (760, '安徽技术师范学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (761, '宿州市联合大学', 0, 1);
INSERT INTO `tbl_schools` VALUES (762, '安徽经济管理干部学院', 0, 1);
INSERT INTO `tbl_schools` VALUES (763, '南京大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (764, '河海大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (765, '南京师大', 0, 16);
INSERT INTO `tbl_schools` VALUES (766, '南京理工', 0, 16);
INSERT INTO `tbl_schools` VALUES (767, '东南大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (768, '南京航空航天大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (769, '南京财经', 0, 16);
INSERT INTO `tbl_schools` VALUES (770, '南京医科大', 0, 16);
INSERT INTO `tbl_schools` VALUES (771, '南京工大', 0, 16);
INSERT INTO `tbl_schools` VALUES (772, '南京农大', 0, 16);
INSERT INTO `tbl_schools` VALUES (773, '南京林大', 0, 16);
INSERT INTO `tbl_schools` VALUES (774, '南邮', 0, 16);
INSERT INTO `tbl_schools` VALUES (775, '南京信息工程大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (776, '南京中医药', 0, 16);
INSERT INTO `tbl_schools` VALUES (777, '南京工程', 0, 16);
INSERT INTO `tbl_schools` VALUES (778, '金陵科技学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (779, '南京晓庄学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (780, '南京审计学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (781, '江苏警官学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (782, '南京体院', 0, 16);
INSERT INTO `tbl_schools` VALUES (783, '南京艺术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (784, '三江学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (785, '中国药科大', 0, 16);
INSERT INTO `tbl_schools` VALUES (786, '苏州工业园区服务外包职业学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (787, '无锡高等师范学校', 0, 16);
INSERT INTO `tbl_schools` VALUES (788, '南京工程高等职业学校', 0, 16);
INSERT INTO `tbl_schools` VALUES (789, '南京政治学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (790, '江苏技术师范学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (791, '苏州大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (792, '江南大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (793, '中国矿业大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (794, '徐州师大', 0, 16);
INSERT INTO `tbl_schools` VALUES (795, '徐州医学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (796, '扬州大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (797, '江苏大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (798, '江苏科大', 0, 16);
INSERT INTO `tbl_schools` VALUES (799, '南通大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (800, '常州大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (801, '常州工学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (802, '江苏技术师范', 0, 16);
INSERT INTO `tbl_schools` VALUES (803, '淮阴工学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (804, '淮阴师范', 0, 16);
INSERT INTO `tbl_schools` VALUES (805, '淮海工学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (806, '盐城工学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (807, '盐城师范学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (808, '常熟理工', 0, 16);
INSERT INTO `tbl_schools` VALUES (809, '常州纺织服装职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (810, '常州工程职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (811, '常州机电职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (812, '常州轻工职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (813, '常州信息职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (814, '硅湖职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (815, '河海大学常州校区', 0, 16);
INSERT INTO `tbl_schools` VALUES (816, '淮安信息职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (817, '建东职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (818, '健雄职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (819, '江海职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (820, '江南影视艺术职业学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (821, '江苏财经职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (822, '江苏海事职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (823, '江苏经贸职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (824, '江苏联合职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (825, '江苏农林职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (826, '江苏食品职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (827, '江苏信息职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (828, '江苏畜牧兽医职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (829, '江阴职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (830, '金肯职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (831, '金山职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (832, '九州职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (833, '昆山登云科技职业学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (834, '连云港师范高等专科学校', 0, 16);
INSERT INTO `tbl_schools` VALUES (835, '连云港职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (836, '民办明达职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (837, '南京动力高等专科学校', 0, 16);
INSERT INTO `tbl_schools` VALUES (838, '南京工业职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (839, '南京化工职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (840, '南京交通职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (841, '南京人口管理干部学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (842, '南京森林警察学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (843, '南京视觉艺术职业学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (844, '南京特殊教育职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (845, '南京铁道职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (846, '南京信息职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (847, '南通纺织职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (848, '南通航运职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (849, '南通农业职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (850, '南通职业大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (851, '培尔职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (852, '沙洲职业工学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (853, '苏州港大思培科技职业学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (854, '苏州工业园区职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (855, '苏州工业职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (856, '苏州工艺美术职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (857, '苏州经贸职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (858, '苏州科技大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (859, '苏州农业职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (860, '苏州托普信息职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (861, '苏州职业大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (862, '宿迁学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (863, '泰州师范高等专科学校', 0, 16);
INSERT INTO `tbl_schools` VALUES (864, '泰州职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (865, '无锡城市职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (866, '无锡工艺职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (867, '无锡科技职业学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (868, '无锡南洋职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (869, '无锡轻工大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (870, '无锡商业职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (871, '无锡职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (872, '徐州工业职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (873, '徐州广播电视大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (874, '徐州建筑职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (875, '徐州教育学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (876, '徐州工程学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (877, '炎黄职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (878, '盐城纺织职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (879, '扬州工业职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (880, '扬州环境资源管理学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (881, '扬州环境资源职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (882, '扬州教育学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (883, '扬州职业大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (884, '应天职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (885, '镇江市高等专科学校', 0, 16);
INSERT INTO `tbl_schools` VALUES (886, '正德职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (887, '中国传媒大学南广学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (888, '钟山职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (889, '紫琅职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (890, '江苏广播电视大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (891, '江苏教育学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (892, '徐州师范高等专科学校', 0, 16);
INSERT INTO `tbl_schools` VALUES (893, '江苏省省级机关管理干部学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (894, '江苏职工医科大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (895, '苏州卫生职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (896, '盐城卫生职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (897, '金陵旅馆管理干部学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (898, '南京市广播电视大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (899, '南京机电职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (900, '江苏城市职业学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (901, '苏州高博软件技术职业学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (902, '南京旅游职业学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (903, '空军第一职工大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (904, '江苏省青年管理干部学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (905, '江苏省广播电视大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (906, '南京金陵旅馆管理干部学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (907, '南通市工人业余大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (908, '常州市职工大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (909, '南京市职工大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (910, '南京联合职工大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (911, '江苏电力职工大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (912, '宿迁职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (913, '南京工程兵工程学校', 0, 16);
INSERT INTO `tbl_schools` VALUES (914, '南京理工大学泰州科技学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (915, '东南大学成贤学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (916, '南京理工大学紫金学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (917, '南京航空航天大学金城学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (918, '南京财经大学红山学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (919, '南京师范大学泰州学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (920, '南京审计学院金审学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (921, '南通大学杏林学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (922, '江苏工业学院怀德学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (923, '江苏科技大学南徐学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (924, '南京邮电大学通达学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (925, '徐州师范大学科文学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (926, '扬州大学广陵学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (927, '江苏大学京江学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (928, '苏州科技学院天平学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (929, '苏州大学应用技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (930, '苏州大学文正学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (931, '南京信息工程大学滨江学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (932, '南京中医药大学翰林学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (933, '南京医科大学康达学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (934, '南京师范大学中北学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (935, '南京工业大学浦江学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (936, '江南大学太湖学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (937, '南通体臣卫生学校', 0, 16);
INSERT INTO `tbl_schools` VALUES (938, '南通市广播电视大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (939, '江苏省南通商贸高等职业学校', 0, 16);
INSERT INTO `tbl_schools` VALUES (940, '南通高等师范学校', 0, 16);
INSERT INTO `tbl_schools` VALUES (941, '如皋高等师范学校', 0, 16);
INSERT INTO `tbl_schools` VALUES (942, '南通市中等专业学校', 0, 16);
INSERT INTO `tbl_schools` VALUES (943, '太湖创意职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (944, '西交利物浦大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (945, '南京中天专修学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (946, '江苏苏州广播电视大学', 0, 16);
INSERT INTO `tbl_schools` VALUES (947, '南京金陵科技专修学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (948, '江苏科技经贸专修学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (949, '江苏省无锡交通高等职业技术学校', 0, 16);
INSERT INTO `tbl_schools` VALUES (950, '南京新华电脑专修学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (951, '河海大学继续教育学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (952, '南京技师学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (953, '江苏建康职业学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (954, '江苏城镇建设学校', 0, 16);
INSERT INTO `tbl_schools` VALUES (955, '南京航天管理干部学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (956, '中国人民大学国际学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (957, '徐州幼儿高等师范学校', 0, 16);
INSERT INTO `tbl_schools` VALUES (958, '江苏技术师范东方学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (959, '南京高等职业技术学校', 0, 16);
INSERT INTO `tbl_schools` VALUES (960, '江苏省司法警官高等职业学校', 0, 16);
INSERT INTO `tbl_schools` VALUES (961, '苏州大学宿迁学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (962, '徐州医学院华方学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (963, '中国矿业大学徐海学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (964, '苏州信息职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (965, '江苏东南科技专修学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (966, '盐城生物工程高等职业技术学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (967, '江苏电大通州学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (968, '南京大学金陵学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (969, '运河高等师范学校', 0, 16);
INSERT INTO `tbl_schools` VALUES (970, '南京东方文理研修学院', 0, 16);
INSERT INTO `tbl_schools` VALUES (971, '徐州财经高等职业技术学校', 0, 16);
INSERT INTO `tbl_schools` VALUES (972, '浙江大学', 0, 30);
INSERT INTO `tbl_schools` VALUES (973, '浙江理工', 0, 30);
INSERT INTO `tbl_schools` VALUES (974, '浙江工大', 0, 30);
INSERT INTO `tbl_schools` VALUES (975, '杭州电子科大', 0, 30);
INSERT INTO `tbl_schools` VALUES (976, '浙江中医药', 0, 30);
INSERT INTO `tbl_schools` VALUES (977, '浙江工商', 0, 30);
INSERT INTO `tbl_schools` VALUES (978, '中国计量', 0, 30);
INSERT INTO `tbl_schools` VALUES (979, '浙江科技', 0, 30);
INSERT INTO `tbl_schools` VALUES (980, '浙江农林大学', 0, 30);
INSERT INTO `tbl_schools` VALUES (981, '杭州师范', 0, 30);
INSERT INTO `tbl_schools` VALUES (982, '浙江传媒', 0, 30);
INSERT INTO `tbl_schools` VALUES (983, '浙江财经', 0, 30);
INSERT INTO `tbl_schools` VALUES (984, '中国美术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (985, '树人大学', 0, 30);
INSERT INTO `tbl_schools` VALUES (986, '浙江农业商贸职业学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (987, '浙江三联专修学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (988, '杭州之江专修学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (989, '宁波大学', 0, 30);
INSERT INTO `tbl_schools` VALUES (990, '宁波工程', 0, 30);
INSERT INTO `tbl_schools` VALUES (991, '万里学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (992, '诺丁汉大学', 0, 30);
INSERT INTO `tbl_schools` VALUES (993, '嘉兴学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (994, '浙江海洋', 0, 30);
INSERT INTO `tbl_schools` VALUES (995, '温州大学', 0, 30);
INSERT INTO `tbl_schools` VALUES (996, '温州医学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (997, '湖州师范', 0, 30);
INSERT INTO `tbl_schools` VALUES (998, '台州学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (999, '绍兴文理学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1000, '丽水学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1001, '浙江师大', 0, 30);
INSERT INTO `tbl_schools` VALUES (1002, '长征职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1003, '公安海警学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1004, '杭州万向职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1005, '杭州职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1006, '湖州职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1007, '嘉兴职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1008, '金华职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1009, '科技求是学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1010, '丽水职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1011, '宁波城市职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1012, '宁波大红鹰学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1013, '宁波大学科技学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1014, '宁波天一职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1015, '宁波职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1016, '衢州职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1017, '绍兴职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1018, '浙江越秀外国语学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1019, '台州职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1020, '温州职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1021, '义乌工商职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1022, '浙江大学城市学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1023, '浙江大学宁波理工学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1024, '浙江东方职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1025, '浙江纺织服装职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1026, '浙江工贸职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1027, '浙江工商职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1028, '浙江工业职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1029, '浙江警察学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1030, '浙江广厦建设职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1031, '浙江机电职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1032, '浙江建设职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1033, '浙江交通职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1034, '浙江外国语学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1035, '浙江金融职业学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1036, '浙江经济职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1037, '浙江经贸职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1038, '浙江警官职业学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1039, '浙江旅游职业学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1040, '浙江商业职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1041, '浙江水利水电专科学校', 0, 30);
INSERT INTO `tbl_schools` VALUES (1042, '浙江医学高等专科学校', 0, 30);
INSERT INTO `tbl_schools` VALUES (1043, '浙江医药高等专科学校', 0, 30);
INSERT INTO `tbl_schools` VALUES (1044, '浙江艺术职业学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1045, '浙江育英职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1046, '浙江电力职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1047, '嘉兴南洋职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1048, '浙江国际海运职业技术学校', 0, 30);
INSERT INTO `tbl_schools` VALUES (1049, '衢州学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1050, '浙江国际海运职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1051, '温州市工人业余大学', 0, 30);
INSERT INTO `tbl_schools` VALUES (1052, '宁波市广播电视大学', 0, 30);
INSERT INTO `tbl_schools` VALUES (1053, '浙江嘉兴教育学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1054, '浙江经济管理职工大学', 0, 30);
INSERT INTO `tbl_schools` VALUES (1055, '浙江省广播电视大学', 0, 30);
INSERT INTO `tbl_schools` VALUES (1056, '金华教育学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1057, '宁波教育学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1058, '杭州成人科技大学', 0, 30);
INSERT INTO `tbl_schools` VALUES (1059, '杭州市工人业余大学', 0, 30);
INSERT INTO `tbl_schools` VALUES (1060, '浙江省省级机关职工业余大学', 0, 30);
INSERT INTO `tbl_schools` VALUES (1061, '浙江同济科技职业学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1062, '浙江邮电职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1063, '浙江体育职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1064, '台州科技职业学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1065, '温州科技职业学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1066, '浙江理工大学成教学院北景园分院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1067, '同济大学浙江学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1068, '浙江横店影视职业学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1069, '杭州科技职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1070, '浙江汽车职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1071, '中国美术学院艺术设计职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1072, '金华广播电视大学', 0, 30);
INSERT INTO `tbl_schools` VALUES (1073, '杭州老和山职业技术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1074, '杭州师范大学钱江学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1075, '浙江新世纪经贸专修学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1076, '杭州人文专修学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1077, '上海财经大学浙江学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1078, '浙江师范大学行知学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1079, '浙江理工大学科技与艺术学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1080, '浙江工业大学之江学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1081, '杭州江南专修学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1082, '江南专修学院', 0, 30);
INSERT INTO `tbl_schools` VALUES (1083, '西安交大', 0, 31);
INSERT INTO `tbl_schools` VALUES (1084, '长安大学', 0, 31);
INSERT INTO `tbl_schools` VALUES (1085, '西北工大', 0, 31);
INSERT INTO `tbl_schools` VALUES (1086, '西北大学', 0, 31);
INSERT INTO `tbl_schools` VALUES (1087, '陕西师大', 0, 31);
INSERT INTO `tbl_schools` VALUES (1088, '西安电子科大', 0, 31);
INSERT INTO `tbl_schools` VALUES (1089, '西安理工', 0, 31);
INSERT INTO `tbl_schools` VALUES (1090, '西安科大', 0, 31);
INSERT INTO `tbl_schools` VALUES (1091, '西安工大', 0, 31);
INSERT INTO `tbl_schools` VALUES (1092, '西外', 0, 31);
INSERT INTO `tbl_schools` VALUES (1093, '西邮', 0, 31);
INSERT INTO `tbl_schools` VALUES (1094, '西安医学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1095, '西安财经', 0, 31);
INSERT INTO `tbl_schools` VALUES (1096, '西北政法', 0, 31);
INSERT INTO `tbl_schools` VALUES (1097, '西安体院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1098, '西安美院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1099, '西安音乐学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1100, '西安文理学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1101, '西京学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1102, '西安翻译学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1103, '培华学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1104, '欧亚学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1105, '西安外事', 0, 31);
INSERT INTO `tbl_schools` VALUES (1106, '陕西工商职业学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1107, '西安石油', 0, 31);
INSERT INTO `tbl_schools` VALUES (1108, '西安建筑科大', 0, 31);
INSERT INTO `tbl_schools` VALUES (1109, '第四军医大学', 0, 31);
INSERT INTO `tbl_schools` VALUES (1110, '西安电子科技大学高等职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1111, '西北工业大学明德学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1112, '陕西师范大学高等职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1113, '长安大学兴华学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1114, '西安数字技术学院 ', 0, 31);
INSERT INTO `tbl_schools` VALUES (1115, '陕西工商职业学院 ', 0, 31);
INSERT INTO `tbl_schools` VALUES (1116, '延安大学', 0, 31);
INSERT INTO `tbl_schools` VALUES (1117, '陕西中医学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1118, '咸阳师范学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1119, '陕西科大', 0, 31);
INSERT INTO `tbl_schools` VALUES (1120, '宝鸡文理学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1121, '渭南师范', 0, 31);
INSERT INTO `tbl_schools` VALUES (1122, '陕西理工', 0, 31);
INSERT INTO `tbl_schools` VALUES (1123, '榆林学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1124, '商洛学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1125, '安康学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1126, '西北农林科大', 0, 31);
INSERT INTO `tbl_schools` VALUES (1127, '安康职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1128, '宝鸡职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1129, '汉中职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1130, '陕西财经职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1131, '陕西电子科技职业学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1132, '陕西电子信息职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1133, '陕西纺织服装职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1134, '陕西服装艺术职业学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1135, '陕西工业职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1136, '陕西国防工业职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1137, '陕西国际商贸学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1138, '陕西航空职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1139, '陕西交通职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1140, '陕西经济管理职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1141, '陕西警官职业学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1142, '陕西旅游烹饪职业学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1143, '陕西能源职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1144, '陕西青年职业学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1145, '陕西铁路工程职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1146, '陕西邮电职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1147, '陕西职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1148, '商洛职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1149, '铜川职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1150, '渭南职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1151, '西安电力高等专科学校', 0, 31);
INSERT INTO `tbl_schools` VALUES (1152, '西安东方亚太职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1153, '西安高新科技职业学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1154, '西安海棠职业学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1155, '西安航空技术高等专科学校', 0, 31);
INSERT INTO `tbl_schools` VALUES (1156, '西安航空职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1157, '西安科技商贸职业学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1158, '西安汽车科技职业学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1159, '西安三资职业学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1160, '西安思源学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1161, '西安铁路职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1162, '西安职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1163, '咸阳职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1164, '延安职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1165, '杨凌职业技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1166, '陕西银行学校', 0, 31);
INSERT INTO `tbl_schools` VALUES (1167, '西安机电信息技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1168, '陕西教育学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1169, '陕西省旅游学校', 0, 31);
INSERT INTO `tbl_schools` VALUES (1170, '西安铁路工程职工大学', 0, 31);
INSERT INTO `tbl_schools` VALUES (1171, '西安华西专修大学', 0, 31);
INSERT INTO `tbl_schools` VALUES (1172, '西安航空职工大学', 0, 31);
INSERT INTO `tbl_schools` VALUES (1173, '西安建筑科技大学华清学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1174, '西安财经学院行知学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1175, '陕西科技大学镐京学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1176, '西安工业大学北方信息工程学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1177, '延安大学西安创新学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1178, '西安电子科技大学长安学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1179, '西安理工大学高科学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1180, '西安科技大学高新学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1181, '西安交通大学城市学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1182, '西北大学现代学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1183, '西安工程技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1184, '陕西航天职工大学', 0, 31);
INSERT INTO `tbl_schools` VALUES (1185, '陕西工运学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1186, '陕西广播电视大学', 0, 31);
INSERT INTO `tbl_schools` VALUES (1187, '陕西省建筑职工大学', 0, 31);
INSERT INTO `tbl_schools` VALUES (1188, '陕西通信技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1189, '西安航空旅游学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1190, '西安工程机械专修学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1191, '陕西建设技术学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1192, '西安冶金建筑专修学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1193, ' 西安联合职业培训学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1194, '西安外贸职工大学', 0, 31);
INSERT INTO `tbl_schools` VALUES (1195, '西安金融财贸学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1196, '西安技师学院', 0, 31);
INSERT INTO `tbl_schools` VALUES (1197, '武汉大学', 0, 13);
INSERT INTO `tbl_schools` VALUES (1198, '华中科大', 0, 13);
INSERT INTO `tbl_schools` VALUES (1199, '华中农大', 0, 13);
INSERT INTO `tbl_schools` VALUES (1200, '武汉理工', 0, 13);
INSERT INTO `tbl_schools` VALUES (1201, '中国地质大学（武汉）', 0, 13);
INSERT INTO `tbl_schools` VALUES (1202, '中南财经政法大学', 0, 13);
INSERT INTO `tbl_schools` VALUES (1203, '中南民族大学', 0, 13);
INSERT INTO `tbl_schools` VALUES (1204, '华中师大', 0, 13);
INSERT INTO `tbl_schools` VALUES (1205, '武汉工业学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1206, '武汉纺织大学', 0, 13);
INSERT INTO `tbl_schools` VALUES (1207, '湖北中医药大学', 0, 13);
INSERT INTO `tbl_schools` VALUES (1208, '湖北经济学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1209, '湖北警官学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1210, '武汉体院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1211, '湖北美院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1212, '武汉音乐学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1213, '武汉生物工程学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1214, '湖北工大', 0, 13);
INSERT INTO `tbl_schools` VALUES (1215, '湖北大学', 0, 13);
INSERT INTO `tbl_schools` VALUES (1216, '江汉大学', 0, 13);
INSERT INTO `tbl_schools` VALUES (1217, '武汉工大', 0, 13);
INSERT INTO `tbl_schools` VALUES (1218, '武汉科大', 0, 13);
INSERT INTO `tbl_schools` VALUES (1219, '湖北美术学院继续教育学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1220, '华中农业大学楚天学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1221, '湖北科技职业学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1222, '长江大学', 0, 13);
INSERT INTO `tbl_schools` VALUES (1223, '三峡大学', 0, 13);
INSERT INTO `tbl_schools` VALUES (1224, '湖北汽院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1225, '湖北医药学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1226, '孝感学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1227, '湖北师范学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1228, '黄石理工', 0, 13);
INSERT INTO `tbl_schools` VALUES (1229, '黄冈师院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1230, '湖北民族学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1231, '襄樊学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1232, '咸宁学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1233, '长江工程职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1234, '长江职业学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1235, '鄂东职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1236, '鄂州大学', 0, 13);
INSERT INTO `tbl_schools` VALUES (1237, '恩施职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1238, '湖北财经高等专科学校', 0, 13);
INSERT INTO `tbl_schools` VALUES (1239, '湖北财税职业学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1240, '湖北城市建设职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1241, '湖北工业大学商贸学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1242, '湖北国土资源职业学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1243, '湖北黄石机电职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1244, '湖北交通职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1245, '湖北第二师范学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1246, '湖北经济管理干部学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1247, '湖北开放职业学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1248, '湖北民族学院科技学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1249, '湖北轻工职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1250, '湖北三峡职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1251, '湖北生态工程职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1252, '湖北生物科技职业学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1253, '湖北省水利水电职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1254, '湖北师范学院文理学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1255, '湖北艺术职业学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1256, '湖北职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1257, '湖北中医药高等专科学校', 0, 13);
INSERT INTO `tbl_schools` VALUES (1258, '黄冈科技职业学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1259, '黄冈职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1260, '江汉艺术职业学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1261, '荆楚理工学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1262, '荆州职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1263, '荆州理工职业学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1264, '沙洋师范高等专科学校', 0, 13);
INSERT INTO `tbl_schools` VALUES (1265, '十堰职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1266, '随州职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1267, '武汉船舶职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1268, '武汉电力职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1269, '武汉工程职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1270, '武汉工业职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1271, '武汉航海职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1272, '武汉交通职业学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1273, '武汉警官职业学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1274, '武汉科技职业学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1275, '武汉理工大学华夏学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1276, '武汉民政职业学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1277, '武汉软件工程职业学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1278, '武汉商贸学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1279, '武汉商业服务学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1280, '武汉时代职业学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1281, '武汉铁路职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1282, '武汉外语外事职业学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1283, '武汉信息传播职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1284, '武汉职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1285, '仙桃职业学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1286, '咸宁职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1287, '襄樊职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1288, '孝感学院新技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1289, '郧阳师范高等专科学校', 0, 13);
INSERT INTO `tbl_schools` VALUES (1290, '武汉长江工商学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1291, '黄冈广播电视大学', 0, 13);
INSERT INTO `tbl_schools` VALUES (1292, '华中科技大学文华学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1293, '汉口学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1294, '湖北大学知行学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1295, '三峡大学科技学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1296, '湖北工业大学工程技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1297, '武汉工业学院工商学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1298, '武汉工程大学邮电与信息工程学院　', 0, 13);
INSERT INTO `tbl_schools` VALUES (1299, '武汉科技学院外经贸学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1300, '江汉大学文理学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1301, '湖北汽车工业学院科技学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1302, '湖北经济学院法商学院　', 0, 13);
INSERT INTO `tbl_schools` VALUES (1303, '武汉体育学院体育科技学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1304, '湖北医药学院药护学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1305, '襄樊学院理工学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1306, '中国地质大学江城学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1307, '长江大学文理学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1308, '长江大学工程技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1309, '华中师范大学武汉传媒学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1310, '武汉东湖学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1311, '中南财经政法武汉学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1312, '华中科技大学武昌分校　', 0, 13);
INSERT INTO `tbl_schools` VALUES (1313, '武汉工贸职业学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1314, '三峡电力职业学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1315, '湖北青年职业学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1316, '武汉语言文化职业学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1317, '黄石职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1318, '海军工程大学', 0, 13);
INSERT INTO `tbl_schools` VALUES (1319, '湖北广播电视大学', 0, 13);
INSERT INTO `tbl_schools` VALUES (1320, '武汉科技大学城市学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1321, '宜昌市商业学校', 0, 13);
INSERT INTO `tbl_schools` VALUES (1322, '湖北澳新教育专修学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1323, '武汉城市建设学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1324, '湖北孝感职业技术学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1325, '葛洲坝水电工程学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1326, '武汉冶金管理干部学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1327, '武汉城市职业学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1328, '武汉大学珞珈学院', 0, 13);
INSERT INTO `tbl_schools` VALUES (1329, '华南理工大学', 0, 6);
INSERT INTO `tbl_schools` VALUES (1330, '中山大学', 0, 6);
INSERT INTO `tbl_schools` VALUES (1331, '暨南大学', 0, 6);
INSERT INTO `tbl_schools` VALUES (1332, '华南师范大学', 0, 6);
INSERT INTO `tbl_schools` VALUES (1333, '广东工业大学', 0, 6);
INSERT INTO `tbl_schools` VALUES (1334, '华南农业大学', 0, 6);
INSERT INTO `tbl_schools` VALUES (1335, '广州大学', 0, 6);
INSERT INTO `tbl_schools` VALUES (1336, '广东外语外贸大学', 0, 6);
INSERT INTO `tbl_schools` VALUES (1337, '广州中医药大学', 0, 6);
INSERT INTO `tbl_schools` VALUES (1338, '南方医科大学', 0, 6);
INSERT INTO `tbl_schools` VALUES (1339, '南方科技大学', 0, 6);
INSERT INTO `tbl_schools` VALUES (1340, '仲恺农业工程学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1341, '广州医学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1342, '广东药学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1343, '广东金融学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1344, '广东商学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1345, '广东警官学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1346, '广州体育学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1347, '广州美术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1348, '星海音乐学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1349, '广东技术师范学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1350, '广东培正学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1351, '广东白云学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1352, '深圳大学', 0, 6);
INSERT INTO `tbl_schools` VALUES (1353, '汕头大学', 0, 6);
INSERT INTO `tbl_schools` VALUES (1354, '五邑大学', 0, 6);
INSERT INTO `tbl_schools` VALUES (1355, '肇庆学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1356, '广东石油化工学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1357, '东莞理工', 0, 6);
INSERT INTO `tbl_schools` VALUES (1358, '广东医学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1359, '湛江师范', 0, 6);
INSERT INTO `tbl_schools` VALUES (1360, '广东海洋', 0, 6);
INSERT INTO `tbl_schools` VALUES (1361, '韶关学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1362, '韩山师范', 0, 6);
INSERT INTO `tbl_schools` VALUES (1363, '嘉应学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1364, '惠州学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1365, '佛山科技学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1366, '中山大学南方学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1367, '广东外语外贸大学南国商学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1368, '华南理工大学广州汽车学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1369, '北京理工大学珠海学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1370, '北京师范大学珠海分校', 0, 6);
INSERT INTO `tbl_schools` VALUES (1371, '电子科技大学中山学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1372, '东莞理工学院城市学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1373, '东莞南博职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1374, '番禺职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1375, '佛山职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1376, '广东财经职业学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1377, '广东潮汕职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1378, '广东纺织职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1379, '广东工程职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1380, '广东工贸职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1381, '广东工业大学华立学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1382, '广东海洋大学寸金学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1383, '广东海洋大学海滨学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1384, '广东机电职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1385, '广东技术师范学院北校区', 0, 6);
INSERT INTO `tbl_schools` VALUES (1386, '广东建华职业学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1387, '广东建设职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1388, '广东交通职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1389, '广东第二师范学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1390, '广东科学技术职业学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1391, '广东理工职业学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1392, '广东岭南职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1393, '广东农工商职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1394, '广东女子职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1395, '广东轻工职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1396, '广东省新闻出版技师学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1397, '广东水利电力职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1398, '广东司法警官职业学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1399, '广东松山职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1400, '广东体育职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1401, '广东外语外贸大学公开学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1402, '广东外语艺术职业学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1403, '广东文艺职业学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1404, '广东新安职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1405, '广东行政职业学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1406, '广东亚视演艺职业学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1407, '广东邮电职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1408, '广州城市职业学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1409, '广州大学华软软件学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1410, '广州大学市政技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1411, '广州大学松田学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1412, '广州工程技术职业学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1413, '广州工商职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1414, '广州航海高等专科学校', 0, 6);
INSERT INTO `tbl_schools` VALUES (1415, '广州华立科技职业学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1416, '广州华南商贸职业学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1417, '广州康大职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1418, '广州科技贸易职业学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1419, '广州科技职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1420, '广州民航职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1421, '广州南洋理工职业学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1422, '广州涉外经济职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1423, '广州体育职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1424, '广州铁路职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1425, '广州现代信息工程职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1426, '河源职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1427, '华澳国际会计学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1428, '华南农业大学珠江学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1429, '华南师范大学增城学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1430, '惠州经济职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1431, '吉林大学珠海学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1432, '江门职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1433, '揭阳职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1434, '罗定职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1435, '茂名职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1436, '南华工商学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1437, '南海东软信息技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1438, '清远职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1439, '汕头职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1440, '汕尾职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1441, '深圳信息职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1442, '深圳振西科技学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1443, '深圳职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1444, '顺德职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1445, '私立华联学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1446, '阳江职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1447, '湛江技师学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1448, '湛师基础教育学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1449, '肇庆工商职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1450, '肇庆科技职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1451, '肇庆医学高等专科学校', 0, 6);
INSERT INTO `tbl_schools` VALUES (1452, '中山火炬职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1453, '珠海城市职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1454, '珠海艺术职业学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1455, '遵义医学院珠海校区', 0, 6);
INSERT INTO `tbl_schools` VALUES (1456, '广东技术师范天河分院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1457, '广东科学技术职业学院国防工大', 0, 6);
INSERT INTO `tbl_schools` VALUES (1458, '茂名广播电视大学', 0, 6);
INSERT INTO `tbl_schools` VALUES (1459, '广东石油化工职业技术学校', 0, 6);
INSERT INTO `tbl_schools` VALUES (1460, '中山大学新华学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1461, '广东商学院华商学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1462, '南开大学深圳金融工程学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1463, '北京师范大学－香港浸会大学联合国际学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1464, '广州金桥管理干部学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1465, '广州大学纺织服装学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1466, '华南师范大学南海校区', 0, 6);
INSERT INTO `tbl_schools` VALUES (1467, '暨南大学深圳旅游学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1468, '暨南大学珠海学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1469, '潮汕职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1470, '广东科贸职业学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1471, '中山职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1472, '广东省外语艺术职业学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1473, '广东食品药品职业学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1474, '广州城建职业学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1475, '湛江现代科技职业学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1476, '广州松田职业学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1477, '广州珠江职业技术学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1478, '广东新华教育学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1479, '广东省广播电视大学', 0, 6);
INSERT INTO `tbl_schools` VALUES (1480, '广东社会科学大学', 0, 6);
INSERT INTO `tbl_schools` VALUES (1481, '广东青年管理干部学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1482, '深圳市广播电视大学', 0, 6);
INSERT INTO `tbl_schools` VALUES (1483, '广州市广播电视大学', 0, 6);
INSERT INTO `tbl_schools` VALUES (1484, '韶关市职工大学', 0, 6);
INSERT INTO `tbl_schools` VALUES (1485, '汕头市业余大学', 0, 6);
INSERT INTO `tbl_schools` VALUES (1486, '广东省国防工业职工大学', 0, 6);
INSERT INTO `tbl_schools` VALUES (1487, '南海成人学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1488, '广东省电子商务技师学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1489, '深圳信息学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1490, '江门市广播电视大学', 0, 6);
INSERT INTO `tbl_schools` VALUES (1491, '北京大学深圳研究生院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1492, '江门艺华旅游职业学院', 0, 6);
INSERT INTO `tbl_schools` VALUES (1493, '湖南师大', 0, 14);
INSERT INTO `tbl_schools` VALUES (1494, '中南大学', 0, 14);
INSERT INTO `tbl_schools` VALUES (1495, '湖南大学', 0, 14);
INSERT INTO `tbl_schools` VALUES (1496, '长沙理工', 0, 14);
INSERT INTO `tbl_schools` VALUES (1497, '湖南农大', 0, 14);
INSERT INTO `tbl_schools` VALUES (1498, '湖南中医药', 0, 14);
INSERT INTO `tbl_schools` VALUES (1499, '中南林业科大', 0, 14);
INSERT INTO `tbl_schools` VALUES (1500, '长沙学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1501, '长沙医学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1502, '湖南涉外经济', 0, 14);
INSERT INTO `tbl_schools` VALUES (1503, '湖南商学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1504, '湖南人文科技', 0, 14);
INSERT INTO `tbl_schools` VALUES (1505, '湖南三一工业职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1506, '湘潭大学', 0, 14);
INSERT INTO `tbl_schools` VALUES (1507, '湖南科大', 0, 14);
INSERT INTO `tbl_schools` VALUES (1508, '湖南工程学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1509, '南华大学', 0, 14);
INSERT INTO `tbl_schools` VALUES (1510, '吉首大学', 0, 14);
INSERT INTO `tbl_schools` VALUES (1511, '湖南工大', 0, 14);
INSERT INTO `tbl_schools` VALUES (1512, '湖南城市学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1513, '湖南理工学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1514, '湘南学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1515, '衡阳师院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1516, '湖南文理', 0, 14);
INSERT INTO `tbl_schools` VALUES (1517, '怀化学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1518, '湖南科技学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1519, '邵阳学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1520, '保险职业学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1521, '长沙电力职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1522, '长沙航空职业学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1523, '长沙环境保护职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1524, '长沙民政职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1525, '长沙南方职业学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1526, '长沙商贸旅游职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1527, '长沙师范专科学校', 0, 14);
INSERT INTO `tbl_schools` VALUES (1528, '长沙通信职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1529, '长沙职工大学', 0, 14);
INSERT INTO `tbl_schools` VALUES (1530, '长沙职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1531, '常德职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1532, '郴州职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1533, '衡阳财经工业职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1534, '湖南安全技术职业学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1535, '湖南财政经济学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1536, '湖南城建职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1537, '湖南大众传媒学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1538, '湖南第一师范学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1539, '湖南对外经济贸易职业学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1540, '湖南工程职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1541, '湖南工学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1542, '湖南工业职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1543, '湖南工艺美术职业学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1544, '湖南警察学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1545, '湖南广播电视大学', 0, 14);
INSERT INTO `tbl_schools` VALUES (1546, '湖南化工职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1547, '湖南环境生物职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1548, '湖南机电职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1549, '湖南建材高等专科学校', 0, 14);
INSERT INTO `tbl_schools` VALUES (1550, '湖南高速铁路职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1551, '湖南交通职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1552, '湖南经济干部管理学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1553, '湖南九嶷职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1554, '湖南科技经贸职业学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1555, '湖南科技职业学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1556, '湖南理工职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1557, '湖南娄底远东职业学校', 0, 14);
INSERT INTO `tbl_schools` VALUES (1558, '湖南民族职业学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1559, '湖南农业大学国际学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1560, '湖南女子学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1561, '湖南软件职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1562, '湖南商务职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1563, '湖南生物环境职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1564, '湖南生物机电职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1565, '湖南省水利水电职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1566, '湖南石油化工职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1567, '湖南税务高等专科学校', 0, 14);
INSERT INTO `tbl_schools` VALUES (1568, '湖南司法警官职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1569, '湖南体育职业学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1570, '湖南铁道职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1571, '湖南铁路科技职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1572, '湖南同德职业学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1573, '湖南网络工程职业学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1574, '湖南现代物流职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1575, '湖南信息科学职业学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1576, '湖南信息职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1577, '湖南行政学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1578, '湖南冶金职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1579, '湖南艺术职业学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1580, '湖南中医药高等专科学校', 0, 14);
INSERT INTO `tbl_schools` VALUES (1581, '怀化医学高等专科学校', 0, 14);
INSERT INTO `tbl_schools` VALUES (1582, '怀化职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1583, '娄底理工学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1584, '娄底市卫生学校', 0, 14);
INSERT INTO `tbl_schools` VALUES (1585, '娄底职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1586, '邵阳医学高等专科学校', 0, 14);
INSERT INTO `tbl_schools` VALUES (1587, '邵阳职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1588, '湘潭职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1589, '湘西民族职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1590, '潇湘职业学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1591, '益阳职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1592, '永州职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1593, '岳阳职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1594, '张家界航空工业职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1595, '株洲师范高等专科学校', 0, 14);
INSERT INTO `tbl_schools` VALUES (1596, '株洲职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1597, '湘潭大学兴湘学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1598, '湖南工业大学科技学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1599, '湖南科技大学潇湘学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1600, '南华大学船山学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1601, '湖南商学院北津学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1602, '湖南师范大学树达学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1603, '湖南农业大学东方科技学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1604, '中南林业科技大学涉外学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1605, '湖南文理学院芙蓉学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1606, '湖南理工学院南湖学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1607, '衡阳师范学院南岳学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1608, '湖南工程学院应用技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1609, '湖南中医药大学湘杏学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1610, '吉首大学张家界学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1611, '长沙理工大学城南学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1612, '湖南都市职业学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1613, '湖南电子科技职业学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1614, '湖南外国语职业学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1615, '湖南生物与机电工程职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1616, '湖南科技工业职业技术学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1617, '衡阳工业职工大学', 0, 14);
INSERT INTO `tbl_schools` VALUES (1618, '湘西民族教师进修学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1619, '湖南有色金属职工大学', 0, 14);
INSERT INTO `tbl_schools` VALUES (1620, '湖南纺织职工大学湖', 0, 14);
INSERT INTO `tbl_schools` VALUES (1621, '湖南金融技术职工大学', 0, 14);
INSERT INTO `tbl_schools` VALUES (1622, '益阳教育学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1623, '长沙工业职工大学', 0, 14);
INSERT INTO `tbl_schools` VALUES (1624, '湖南兵器工业职工大学', 0, 14);
INSERT INTO `tbl_schools` VALUES (1625, '长沙教育学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1626, '衡阳有色冶金职工大学', 0, 14);
INSERT INTO `tbl_schools` VALUES (1627, '株洲市职工大学', 0, 14);
INSERT INTO `tbl_schools` VALUES (1628, '湖南工业科技职工大学', 0, 14);
INSERT INTO `tbl_schools` VALUES (1629, '南方动力机械公司职工工学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1630, '益阳医学高等专科学校', 0, 14);
INSERT INTO `tbl_schools` VALUES (1631, '湖南师范大学法学院', 0, 14);
INSERT INTO `tbl_schools` VALUES (1632, '兰州大学', 0, 5);
INSERT INTO `tbl_schools` VALUES (1633, '西北民大', 0, 5);
INSERT INTO `tbl_schools` VALUES (1634, '西北师范大学', 0, 5);
INSERT INTO `tbl_schools` VALUES (1635, '甘肃中医学院', 0, 5);
INSERT INTO `tbl_schools` VALUES (1636, '兰州商学院', 0, 5);
INSERT INTO `tbl_schools` VALUES (1637, '甘肃政法学院', 0, 5);
INSERT INTO `tbl_schools` VALUES (1638, '兰州城市学院', 0, 5);
INSERT INTO `tbl_schools` VALUES (1639, '甘肃农大', 0, 5);
INSERT INTO `tbl_schools` VALUES (1640, '兰州理工', 0, 5);
INSERT INTO `tbl_schools` VALUES (1641, '兰州交大', 0, 5);
INSERT INTO `tbl_schools` VALUES (1642, '天水师院', 0, 5);
INSERT INTO `tbl_schools` VALUES (1643, '陇东学院', 0, 5);
INSERT INTO `tbl_schools` VALUES (1644, '河西学院', 0, 5);
INSERT INTO `tbl_schools` VALUES (1645, '兰州石化职业技术学院', 0, 5);
INSERT INTO `tbl_schools` VALUES (1646, '甘肃工业职业技术学院', 0, 5);
INSERT INTO `tbl_schools` VALUES (1647, '甘肃警察职业学院', 0, 5);
INSERT INTO `tbl_schools` VALUES (1648, '兰州理工大学技术工程学院', 0, 5);
INSERT INTO `tbl_schools` VALUES (1649, '兰州职业技术学院', 0, 5);
INSERT INTO `tbl_schools` VALUES (1650, '武威职业学院', 0, 5);
INSERT INTO `tbl_schools` VALUES (1651, '张掖医学高等专科学校', 0, 5);
INSERT INTO `tbl_schools` VALUES (1652, '甘肃畜牧工程职业技术学院', 0, 5);
INSERT INTO `tbl_schools` VALUES (1653, '陇南师范高等专科学校', 0, 5);
INSERT INTO `tbl_schools` VALUES (1654, '合作民族师范高等专科学校', 0, 5);
INSERT INTO `tbl_schools` VALUES (1655, '甘肃联合大学', 0, 5);
INSERT INTO `tbl_schools` VALUES (1656, '甘肃林业职业技术学院', 0, 5);
INSERT INTO `tbl_schools` VALUES (1657, '甘肃建筑职业技术学院', 0, 5);
INSERT INTO `tbl_schools` VALUES (1658, '酒泉职业技术学院', 0, 5);
INSERT INTO `tbl_schools` VALUES (1659, '甘肃农业职业技术学院', 0, 5);
INSERT INTO `tbl_schools` VALUES (1660, '平凉医学高等专科学校', 0, 5);
INSERT INTO `tbl_schools` VALUES (1661, '兰州资源环境职业技术学院', 0, 5);
INSERT INTO `tbl_schools` VALUES (1662, '定西师范高等专科学校', 0, 5);
INSERT INTO `tbl_schools` VALUES (1663, '兰州交通大学博文学院', 0, 5);
INSERT INTO `tbl_schools` VALUES (1664, '兰州工业高等专科学校', 0, 5);
INSERT INTO `tbl_schools` VALUES (1665, '兰州外语职业学院', 0, 5);
INSERT INTO `tbl_schools` VALUES (1666, '兰州教育学院', 0, 5);
INSERT INTO `tbl_schools` VALUES (1667, '甘肃钢铁职业技术学院', 0, 5);
INSERT INTO `tbl_schools` VALUES (1668, '甘肃交通职业技术学院', 0, 5);
INSERT INTO `tbl_schools` VALUES (1669, '兰州商学院长青学院', 0, 5);
INSERT INTO `tbl_schools` VALUES (1670, '兰州商学院陇桥学院', 0, 5);
INSERT INTO `tbl_schools` VALUES (1671, '四川大学', 0, 25);
INSERT INTO `tbl_schools` VALUES (1672, '四川农大', 0, 25);
INSERT INTO `tbl_schools` VALUES (1673, '电子科大', 0, 25);
INSERT INTO `tbl_schools` VALUES (1674, '西南交大', 0, 25);
INSERT INTO `tbl_schools` VALUES (1675, '成都理工', 0, 25);
INSERT INTO `tbl_schools` VALUES (1676, '四川师大', 0, 25);
INSERT INTO `tbl_schools` VALUES (1677, '西南民族大学', 0, 25);
INSERT INTO `tbl_schools` VALUES (1678, '成都大学', 0, 25);
INSERT INTO `tbl_schools` VALUES (1679, '西南财经', 0, 25);
INSERT INTO `tbl_schools` VALUES (1680, '西华大学', 0, 25);
INSERT INTO `tbl_schools` VALUES (1681, '成都中医药', 0, 25);
INSERT INTO `tbl_schools` VALUES (1682, '成都信息工程大学', 0, 25);
INSERT INTO `tbl_schools` VALUES (1683, '成都医学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1684, '四川文理学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1685, '成都体院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1686, '四川音乐学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1687, '西南石油', 0, 25);
INSERT INTO `tbl_schools` VALUES (1688, '西南交通大学希望学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1689, '四川长江职业学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1690, '中国民航飞行学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1691, '四川理工', 0, 25);
INSERT INTO `tbl_schools` VALUES (1692, '泸州医学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1693, '四川警察学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1694, '川北医学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1695, '西华师大', 0, 25);
INSERT INTO `tbl_schools` VALUES (1696, '内江师范', 0, 25);
INSERT INTO `tbl_schools` VALUES (1697, '乐山师院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1698, '绵阳师范', 0, 25);
INSERT INTO `tbl_schools` VALUES (1699, '西南科大', 0, 25);
INSERT INTO `tbl_schools` VALUES (1700, '西昌学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1701, '宜宾学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1702, '攀枝花学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1703, '阿坝师范高等专科学校', 0, 25);
INSERT INTO `tbl_schools` VALUES (1704, '成都电子机械高等专科学校', 0, 25);
INSERT INTO `tbl_schools` VALUES (1705, '成都东软学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1706, '成都纺织高等专科学校', 0, 25);
INSERT INTO `tbl_schools` VALUES (1707, '成都广播电视大学', 0, 25);
INSERT INTO `tbl_schools` VALUES (1708, '成都航空职业技术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1709, '成都理工大学广播影视学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1710, '成都农业科技职业学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1711, '成都艺术职业学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1712, '成都职业技术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1713, '达州职业技术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1714, '电子科技大学成都学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1715, '广安职业技术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1716, '乐山职业技术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1717, '泸州职业技术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1718, '眉山职业技术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1719, '绵阳职业技术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1720, '民办四川天一学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1721, '内江职业技术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1722, '南充职业技术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1723, '四川大学龙泉校区', 0, 25);
INSERT INTO `tbl_schools` VALUES (1724, '四川电力职业技术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1725, '四川工程职业技术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1726, '四川工商职业技术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1727, '四川管理职业学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1728, '四川广播电视大学', 0, 25);
INSERT INTO `tbl_schools` VALUES (1729, '四川国际标榜职业学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1730, '四川航天职业技术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1731, '四川华新现代职业学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1732, '四川化工职业技术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1733, '四川机电职业技术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1734, '四川建筑职业技术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1735, '四川交通职业技术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1736, '四川教育学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1737, '四川警安职业学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1738, '四川烹饪高等专科学校', 0, 25);
INSERT INTO `tbl_schools` VALUES (1739, '四川商务职业学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1740, '四川师范大学绵阳初等教育学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1741, '四川水利职业技术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1742, '四川司法警官职业学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1743, '四川托普信息技术职业学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1744, '四川外语学院成都学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1745, '四川文化传媒职业学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1746, '四川信息工程学校', 0, 25);
INSERT INTO `tbl_schools` VALUES (1747, '四川邮电职业技术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1748, '四川职业技术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1749, '四川中医药高等专科学校', 0, 25);
INSERT INTO `tbl_schools` VALUES (1750, '雅安职业技术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1751, '宜宾职业技术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1752, '四川大学锦城学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1753, '四川大学锦江学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1754, '德阳职业技术学校', 0, 25);
INSERT INTO `tbl_schools` VALUES (1755, '四川信息职业技术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1756, '四川艺术职业学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1757, '四川师范大学成都学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1758, '四川师范大学文理学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1759, '成都信息工程学院银杏酒店管理学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1760, '成都理工大学工程技术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1761, '四川文化产业职业学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1762, '四川科技职业学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1763, '西南科技大学城市学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1764, '四川音乐学院绵阳艺术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1765, '西南财经大学天府学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1766, '四川中医药高等专科学', 0, 25);
INSERT INTO `tbl_schools` VALUES (1767, '中国科学院成都分院职工大学', 0, 25);
INSERT INTO `tbl_schools` VALUES (1768, '成都市职工大学', 0, 25);
INSERT INTO `tbl_schools` VALUES (1769, '南充市职工大学', 0, 25);
INSERT INTO `tbl_schools` VALUES (1770, '四川省广播电视大学', 0, 25);
INSERT INTO `tbl_schools` VALUES (1771, '四川经济管理干部学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1772, '四川农业管理干部学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1773, '广元职工医学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1774, '四川省职工运动技术学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1775, '四川省东方动力职工大学', 0, 25);
INSERT INTO `tbl_schools` VALUES (1776, '成都电力职工大学', 0, 25);
INSERT INTO `tbl_schools` VALUES (1777, '成都市广播电视大学', 0, 25);
INSERT INTO `tbl_schools` VALUES (1778, '中国工程物理研究院职工工学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1779, '成都发动机公司职工大学', 0, 25);
INSERT INTO `tbl_schools` VALUES (1780, '四川核工业职工大学', 0, 25);
INSERT INTO `tbl_schools` VALUES (1781, '四川科技职工大学', 0, 25);
INSERT INTO `tbl_schools` VALUES (1782, '四川省化工职工大学', 0, 25);
INSERT INTO `tbl_schools` VALUES (1783, '成都电子职工大学', 0, 25);
INSERT INTO `tbl_schools` VALUES (1784, '国营涪江机器厂职工大学', 0, 25);
INSERT INTO `tbl_schools` VALUES (1785, '成都冶金职工大学', 0, 25);
INSERT INTO `tbl_schools` VALUES (1786, '第五冶金建设公司职工大学', 0, 25);
INSERT INTO `tbl_schools` VALUES (1787, '成都工业职工大学', 0, 25);
INSERT INTO `tbl_schools` VALUES (1788, '成都飞机工业公司职工工学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1789, '四川财经职业学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1790, '四川城市职业学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1791, '中国五冶职工大学', 0, 25);
INSERT INTO `tbl_schools` VALUES (1792, '四川师范大学经济职业学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1793, '四川省卫生管理干部学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1794, '四川民族学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1795, '四川师范大学电影电视学院', 0, 25);
INSERT INTO `tbl_schools` VALUES (1796, '山东大学', 0, 23);
INSERT INTO `tbl_schools` VALUES (1797, '中国海洋大学', 0, 23);
INSERT INTO `tbl_schools` VALUES (1798, '济南大学', 0, 23);
INSERT INTO `tbl_schools` VALUES (1799, '山东建筑大学', 0, 23);
INSERT INTO `tbl_schools` VALUES (1800, '山东师大', 0, 23);
INSERT INTO `tbl_schools` VALUES (1801, '山东财经大学', 0, 23);
INSERT INTO `tbl_schools` VALUES (1802, '山东中医药', 0, 23);
INSERT INTO `tbl_schools` VALUES (1803, '山东轻工', 0, 23);
INSERT INTO `tbl_schools` VALUES (1804, '山东交通学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1805, '山东警院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1806, '山东体院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1807, '山东艺术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1808, '山东工美', 0, 23);
INSERT INTO `tbl_schools` VALUES (1809, '山东海事职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1810, '曲阜师大', 0, 23);
INSERT INTO `tbl_schools` VALUES (1811, '北京电影学院现代创意媒体学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1812, '烟台大学', 0, 23);
INSERT INTO `tbl_schools` VALUES (1813, '鲁东大学', 0, 23);
INSERT INTO `tbl_schools` VALUES (1814, '山东工商', 0, 23);
INSERT INTO `tbl_schools` VALUES (1815, '烟台南山学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1816, '青岛大学', 0, 23);
INSERT INTO `tbl_schools` VALUES (1817, '山东科大', 0, 23);
INSERT INTO `tbl_schools` VALUES (1818, '青岛科大', 0, 23);
INSERT INTO `tbl_schools` VALUES (1819, '青岛理工', 0, 23);
INSERT INTO `tbl_schools` VALUES (1820, '青岛农业大学', 0, 23);
INSERT INTO `tbl_schools` VALUES (1821, '滨海学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1822, '中国石油大学（华东）', 0, 23);
INSERT INTO `tbl_schools` VALUES (1823, '聊城大学', 0, 23);
INSERT INTO `tbl_schools` VALUES (1824, '山东理工', 0, 23);
INSERT INTO `tbl_schools` VALUES (1825, '潍坊医学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1826, '潍坊学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1827, '泰山医学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1828, '山东财政', 0, 23);
INSERT INTO `tbl_schools` VALUES (1829, '泰山学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1830, '山东农大', 0, 23);
INSERT INTO `tbl_schools` VALUES (1831, '滨州医学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1832, '滨州学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1833, '济宁医学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1834, '临沂大学', 0, 23);
INSERT INTO `tbl_schools` VALUES (1835, '德州学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1836, '枣庄学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1837, '菏泽学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1838, '滨州职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1839, '德州教育学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1840, '德州科技职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1841, '东营职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1842, '哈工大(威海)', 0, 23);
INSERT INTO `tbl_schools` VALUES (1843, '菏泽医学专科学校', 0, 23);
INSERT INTO `tbl_schools` VALUES (1844, '济南工程职业技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1845, '山东职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1846, '济南职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1847, '济宁学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1848, '济宁职业技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1849, '莱芜职业技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1850, '聊城职业技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1851, '青岛飞洋职业技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1852, '青岛港湾职业技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1853, '青岛恒星职业技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1854, '青岛黄海职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1855, '青岛求实职业技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1856, '青岛远洋船员学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1857, '青岛职业技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1858, '曲阜远东职业技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1859, '日照职业技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1860, '山东大王职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1861, '山东大学威海分校', 0, 23);
INSERT INTO `tbl_schools` VALUES (1862, '山东电力高等专科学校', 0, 23);
INSERT INTO `tbl_schools` VALUES (1863, '山东电子职业技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1864, '山东服装职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1865, '山东工业职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1866, '山东华宇职业技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1867, '山东化工职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1868, '山东交通职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1869, '山东经贸职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1870, '山东凯文科技职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1871, '山东科技职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1872, '山东劳动职业技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1873, '山东力明科技职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1874, '山东旅游职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1875, '山东铝业职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1876, '山东商业职业技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1877, '山东胜利职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1878, '山东省青岛酒店管理学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1879, '山东水利职业技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1880, '山东省潍坊艺术学校', 0, 23);
INSERT INTO `tbl_schools` VALUES (1881, '山东圣翰财贸职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1882, '山东水利职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1883, '山东水利专科学校', 0, 23);
INSERT INTO `tbl_schools` VALUES (1884, '山东丝绸纺织职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1885, '山东外国语职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1886, '山东外贸职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1887, '山东外事翻译学院威海分校', 0, 23);
INSERT INTO `tbl_schools` VALUES (1888, '山东外事翻译职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1889, '山东万杰医学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1890, '山东威海财经专修学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1891, '山东威海外国语进修学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1892, '山东现代职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1893, '山东协和职业技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1894, '山东信息职业技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1895, '山东行政学院(山东经济管理干部学院)', 0, 23);
INSERT INTO `tbl_schools` VALUES (1896, '山东杏林科技职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1897, '山东畜牧兽医职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1898, '山东药品食品职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1899, '山东医学高等专科学校', 0, 23);
INSERT INTO `tbl_schools` VALUES (1900, '山东英才学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1901, '山东政法学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1902, '山东中医药高等专科学校', 0, 23);
INSERT INTO `tbl_schools` VALUES (1903, '泰山职业技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1904, '万杰科技学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1905, '威海市广播电视大学', 0, 23);
INSERT INTO `tbl_schools` VALUES (1906, '威海市交通学校', 0, 23);
INSERT INTO `tbl_schools` VALUES (1907, '威海职业(技术)学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1908, '威海中加国际工商学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1909, '潍坊工商职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1910, '潍坊工程职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1911, '潍坊科技职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1912, '潍坊职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1913, '文登师范', 0, 23);
INSERT INTO `tbl_schools` VALUES (1914, '烟台职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1915, '枣庄科技职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1916, '中国石油大学(华东)东营校区', 0, 23);
INSERT INTO `tbl_schools` VALUES (1917, '淄博广播电视大学', 0, 23);
INSERT INTO `tbl_schools` VALUES (1918, '淄博恒星外国语学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1919, '淄博科技职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1920, '淄博师专', 0, 23);
INSERT INTO `tbl_schools` VALUES (1921, '淄博职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1922, '齐鲁师范学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1923, '山东技师学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1924, '日照广播电视大学', 0, 23);
INSERT INTO `tbl_schools` VALUES (1925, '山东城市建设职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1926, '烟台工程职业技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1927, '山东商务职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1928, '烟台汽车工程职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1929, '山东省农业管理干部学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1930, '山东青年政治学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1931, '山东省工会管理干部学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1932, '山东广播电视大学', 0, 23);
INSERT INTO `tbl_schools` VALUES (1933, '德州职业技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1934, '中国石油大学胜利学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1935, '烟台大学文经学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1936, '青岛理工大学琴岛学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1937, '山东科技大学泰山科技学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1938, '青岛工学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1939, '山东财经大学燕山学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1940, '青岛农业大学海都学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1941, '曲阜师范大学杏坛学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1942, '山东财政学院东方学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1943, '山东师范大学历山学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1944, '聊城大学东昌学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1945, '济南大学泉城学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1946, '中国农业大学（烟台校区）', 0, 23);
INSERT INTO `tbl_schools` VALUES (1947, '日照师范学校', 0, 23);
INSERT INTO `tbl_schools` VALUES (1948, '山东艺术设计学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1949, '滨州技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1950, '山东冶金技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1951, '山东省济宁市技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1952, '济南广播电视大学', 0, 23);
INSERT INTO `tbl_schools` VALUES (1953, '山东省聊城教育学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1954, '山东财政职工大学', 0, 23);
INSERT INTO `tbl_schools` VALUES (1955, '青岛市广播电视大学', 0, 23);
INSERT INTO `tbl_schools` VALUES (1956, '青岛理工大学费县校区', 0, 23);
INSERT INTO `tbl_schools` VALUES (1957, '山东兵器工业职工大学', 0, 23);
INSERT INTO `tbl_schools` VALUES (1958, '新汶矿务局职工大学', 0, 23);
INSERT INTO `tbl_schools` VALUES (1959, '烟台教育学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1960, '山东工贸职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1961, '山东新华学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1962, '山东省医学科学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1963, '山东化工技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1964, '山东海天软件工程学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1965, '青岛军政人文大学信息工程管理学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1966, '哈理工荣成学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1967, '山东省第二技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1968, '临沂职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1969, '青岛北港学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1970, '山东司法警官职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1971, '山东文化职业产业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1972, '菏泽家政职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1973, '山东理工职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1974, '威海工业技术学校(原二职)', 0, 23);
INSERT INTO `tbl_schools` VALUES (1975, '山东传媒学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1976, '营口电视大学', 0, 23);
INSERT INTO `tbl_schools` VALUES (1977, '山东传媒职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1978, '山东省益都卫生学校', 0, 23);
INSERT INTO `tbl_schools` VALUES (1979, '山东烟台建文学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1980, '山东省潍坊卫生学校', 0, 23);
INSERT INTO `tbl_schools` VALUES (1981, '寿光科技学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1982, '山东省广播电视大学', 0, 23);
INSERT INTO `tbl_schools` VALUES (1983, '烟台城乡建设学校', 0, 23);
INSERT INTO `tbl_schools` VALUES (1984, '青岛市电子信息技术学校', 0, 23);
INSERT INTO `tbl_schools` VALUES (1985, '青岛滨海学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1986, '山东医药技师学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1987, '济南协和职业学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1988, '山东黄金技术学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1989, '山东交通学院海运学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1990, '山东工业技师学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1991, '山东女子学院', 0, 23);
INSERT INTO `tbl_schools` VALUES (1992, '厦门大学', 0, 4);
INSERT INTO `tbl_schools` VALUES (1993, '集美大学', 0, 4);
INSERT INTO `tbl_schools` VALUES (1994, '厦门理工学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (1995, '泉州轻工职业学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (1996, '泉州师范学院软件学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (1997, '福州大学', 0, 4);
INSERT INTO `tbl_schools` VALUES (1998, '福建师范大学', 0, 4);
INSERT INTO `tbl_schools` VALUES (1999, '福建农林大学', 0, 4);
INSERT INTO `tbl_schools` VALUES (2000, '福建医科大学', 0, 4);
INSERT INTO `tbl_schools` VALUES (2001, '福建工程学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2002, '福建中医药大学', 0, 4);
INSERT INTO `tbl_schools` VALUES (2003, '闽江学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2004, '华侨大学', 0, 4);
INSERT INTO `tbl_schools` VALUES (2005, '仰恩大学', 0, 4);
INSERT INTO `tbl_schools` VALUES (2006, '泉州师范学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2007, '漳州师范', 0, 4);
INSERT INTO `tbl_schools` VALUES (2008, '莆田学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2009, '三明学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2010, '龙岩学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2011, '厦门大学嘉庚学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2012, '集美大学诚毅学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2013, '福州大学阳光学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2014, '福州大学至诚学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2015, '福建师范大学协和学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2016, '福建师范大学闽南科技学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2017, '福建农林大学东方学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2018, '福建农林大学金山学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2019, '华侨大学福建音乐学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2020, '福建电力职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2021, '福建对外经济贸易职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2022, '福建警察学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2023, '福建广播电视大学', 0, 4);
INSERT INTO `tbl_schools` VALUES (2024, '福建华南女子职业学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2025, '福建船政交通职业学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2026, '福建教育学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2027, '福建金融职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2028, '福建警官职业学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2029, '福建林业职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2030, '福建农业职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2031, '福建商业高等专科学校', 0, 4);
INSERT INTO `tbl_schools` VALUES (2032, '福建生物工程职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2033, '福建水利电力职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2034, '福建卫生职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2035, '福建信息职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2036, '福建行政学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2037, '福建中医学院五洲科技学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2038, '福州海峡职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2039, '福州科技职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2040, '福州黎明职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2041, '福州软件职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2042, '福州外语外贸职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2043, '福州英华职业学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2044, '福州职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2045, '黎明职业大学', 0, 4);
INSERT INTO `tbl_schools` VALUES (2046, '湄洲湾职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2047, '闽北职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2048, '闽西职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2049, '武夷学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2050, '宁德师范高等专科学校', 0, 4);
INSERT INTO `tbl_schools` VALUES (2051, '泉州纺织服装职业学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2052, '闽南理工学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2053, '泉州华光摄影艺术职业学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2054, '泉州经贸职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2055, '泉州信息职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2056, '泉州医学高等专科学校', 0, 4);
INSERT INTO `tbl_schools` VALUES (2057, '泉州理工学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2058, '三明职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2059, '厦门海洋职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2060, '厦门华天涉外职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2061, '厦门华厦职业学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2062, '厦门南洋学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2063, '厦门兴才职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2064, '厦门演艺职业学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2065, '漳州职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2066, '福建政法管理干部学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2067, '武夷职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2068, '厦门城市职业学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2069, '漳州卫生职业学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2070, '江夏学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2071, '福州教育学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2072, '厦门市广播电视大学', 0, 4);
INSERT INTO `tbl_schools` VALUES (2073, '福建财会管理干部学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2074, '福建经济管理干部学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2075, '福建省漳州业余大学', 0, 4);
INSERT INTO `tbl_schools` VALUES (2076, '龙岩技师学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2077, '德化陶瓷职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2078, '厦门东海学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2079, '泉州儿童发展职业学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2080, '厦门科技学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2081, '福建儿童发展职业学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2082, '厦门软件职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2083, '福建艺术职业学校', 0, 4);
INSERT INTO `tbl_schools` VALUES (2084, '漳州城市职业学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2085, '漳州天福茶职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2086, '福州外语外贸学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2087, '福建省艺术职业学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2088, '厦门医学高等专科学校', 0, 4);
INSERT INTO `tbl_schools` VALUES (2089, '厦门安防科技学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2090, '漳州吉马职业印刷技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2091, '福建体育职业技术学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2092, '厦门安防科技职业学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2093, '厦门技师学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2094, '华侨大学厦门工学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2095, '武夷山职业学院', 0, 4);
INSERT INTO `tbl_schools` VALUES (2096, '郑州大学', 0, 12);
INSERT INTO `tbl_schools` VALUES (2097, '河南工业', 0, 12);
INSERT INTO `tbl_schools` VALUES (2098, '河南农大', 0, 12);
INSERT INTO `tbl_schools` VALUES (2099, '华北水利水电', 0, 12);
INSERT INTO `tbl_schools` VALUES (2100, '郑州轻工', 0, 12);
INSERT INTO `tbl_schools` VALUES (2101, '郑州航空工业', 0, 12);
INSERT INTO `tbl_schools` VALUES (2102, '黄河科技', 0, 12);
INSERT INTO `tbl_schools` VALUES (2103, '中原工学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2104, '河南中医学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2105, '河南财经政法', 0, 12);
INSERT INTO `tbl_schools` VALUES (2106, '郑州城市职业学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2107, '新乡学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2108, '开封文化艺术职业学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2109, '河南大学', 0, 12);
INSERT INTO `tbl_schools` VALUES (2110, '河南科技大学', 0, 12);
INSERT INTO `tbl_schools` VALUES (2111, '洛阳师院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2112, '安阳工学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2113, '安阳师院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2114, '南阳理工', 0, 12);
INSERT INTO `tbl_schools` VALUES (2115, '南阳师院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2116, '河南城建学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2117, '平顶山学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2118, '新乡医学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2119, '河南科技学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2120, '河南师大', 0, 12);
INSERT INTO `tbl_schools` VALUES (2121, '信阳师院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2122, '商丘师院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2123, '周口师院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2124, '黄淮学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2125, '许昌学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2126, '河南理工', 0, 12);
INSERT INTO `tbl_schools` VALUES (2127, '河南财政税务高等专科学校', 0, 12);
INSERT INTO `tbl_schools` VALUES (2128, '河南工程学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2129, '河南工业贸易职业学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2130, '河南工业职业技术学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2131, '河南警察学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2132, '河南广播影视学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2133, '河南机电高等专科学校', 0, 12);
INSERT INTO `tbl_schools` VALUES (2134, '河南检察职业学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2135, '河南交通职业技术学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2136, '河南教育学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2137, '河南经贸职业学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2138, '河南农业职业学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2139, '河南商业高等专科学校', 0, 12);
INSERT INTO `tbl_schools` VALUES (2140, '河南省工商行政管理广播电视大学', 0, 12);
INSERT INTO `tbl_schools` VALUES (2141, '河南司法警官职业学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2142, '河南新华电脑学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2143, '河南职业技术学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2144, '河南质量工程职业学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2145, '鹤壁职业技术学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2146, '黄河水利职业技术学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2147, '济源职业技术学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2148, '焦作大学', 0, 12);
INSERT INTO `tbl_schools` VALUES (2149, '焦作师范高等专科学校', 0, 12);
INSERT INTO `tbl_schools` VALUES (2150, '开封大学', 0, 12);
INSERT INTO `tbl_schools` VALUES (2151, '开封市电子科技专修学校', 0, 12);
INSERT INTO `tbl_schools` VALUES (2152, '洛阳大学', 0, 12);
INSERT INTO `tbl_schools` VALUES (2153, '洛阳理工学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2154, '漯河医学高等专科学校', 0, 12);
INSERT INTO `tbl_schools` VALUES (2155, '漯河职业技术学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2156, '南阳医学高等专科学校', 0, 12);
INSERT INTO `tbl_schools` VALUES (2157, '平顶山教育学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2158, '平顶山工业职业技术学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2159, '濮阳职业技术学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2160, '三门峡职业技术学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2161, '商丘科技职业学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2162, '商丘医学高等专科学校', 0, 12);
INSERT INTO `tbl_schools` VALUES (2163, '商丘职业技术学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2164, '嵩山少林武术职业学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2165, '铁道警官高等专科学校', 0, 12);
INSERT INTO `tbl_schools` VALUES (2166, '信阳农业高等专科学校', 0, 12);
INSERT INTO `tbl_schools` VALUES (2167, '信阳职业技术学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2168, '许昌职业技术学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2169, '永城职业学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2170, '郑州大学西亚斯国际学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2171, '郑州电力高等专科学校', 0, 12);
INSERT INTO `tbl_schools` VALUES (2172, '郑州电子信息职业技术学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2173, '郑州工业安全职业学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2174, '郑州华信职业技术学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2175, '郑州交通学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2176, '郑州经贸职业学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2177, '郑州科技职业学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2178, '郑州旅游职业学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2179, '郑州牧业工程高等专科学校', 0, 12);
INSERT INTO `tbl_schools` VALUES (2180, '郑州师范学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2181, '郑州澍青医学高等专科学校', 0, 12);
INSERT INTO `tbl_schools` VALUES (2182, '郑州铁路职业技术学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2183, '郑州信息科技职业学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2184, '郑州职业技术学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2185, '中州大学', 0, 12);
INSERT INTO `tbl_schools` VALUES (2186, '周口职业技术学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2187, '郑州升达经贸管理学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2188, '洛阳工业高等专科学校', 0, 12);
INSERT INTO `tbl_schools` VALUES (2189, '河南职工医学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2190, '河南科技学院新科学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2191, '河南理工大学万方科技学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2192, '中原工学院信息商务学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2193, '安阳师范学院人文管理学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2194, '商丘学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2195, '河南财经学院成功学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2196, '开封教育学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2197, '河南卫生职工学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2198, '河南建筑职业技术学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2199, '河南大学民生学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2200, '河南师范大学新联学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2201, '新乡医学院三全学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2202, '信阳师范学院华锐学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2203, '郑州电力职业技术学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2204, '周口科技职业学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2205, '河南省广播电视大学', 0, 12);
INSERT INTO `tbl_schools` VALUES (2206, '中国人民解放军外国语学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2207, '清华IT河南校区', 0, 12);
INSERT INTO `tbl_schools` VALUES (2208, '第一拖拉机制造厂拖拉机学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2209, '郑州煤炭管理干部学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2210, '河南工业大学化学工业职业学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2211, '河南省轻工业职工大学', 0, 12);
INSERT INTO `tbl_schools` VALUES (2212, '郑州交通职业学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2213, '郑州牧业高等专科学校', 0, 12);
INSERT INTO `tbl_schools` VALUES (2214, '郑州布瑞达理工职业学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2215, '河南医科大学教育中心', 0, 12);
INSERT INTO `tbl_schools` VALUES (2216, '郑州轻工业轻工职业学院', 0, 12);
INSERT INTO `tbl_schools` VALUES (2217, '重庆大学', 0, 3);
INSERT INTO `tbl_schools` VALUES (2218, '西南大学', 0, 3);
INSERT INTO `tbl_schools` VALUES (2219, '重庆师大', 0, 3);
INSERT INTO `tbl_schools` VALUES (2220, '西南政法', 0, 3);
INSERT INTO `tbl_schools` VALUES (2221, '重庆交大', 0, 3);
INSERT INTO `tbl_schools` VALUES (2222, '重庆邮电大学', 0, 3);
INSERT INTO `tbl_schools` VALUES (2223, '重庆医大', 0, 3);
INSERT INTO `tbl_schools` VALUES (2224, '重庆工商', 0, 3);
INSERT INTO `tbl_schools` VALUES (2225, '重庆科技学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2226, '重庆理工大学', 0, 3);
INSERT INTO `tbl_schools` VALUES (2227, '长江师范学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2228, '四川外国语', 0, 3);
INSERT INTO `tbl_schools` VALUES (2229, '四川美院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2230, '重庆三峡学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2231, '重庆文理', 0, 3);
INSERT INTO `tbl_schools` VALUES (2232, '重庆化工职业学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2233, '后勤工程学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2234, '重庆能源职业学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2235, '重庆商务职业学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2236, '重庆旅游职业学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2237, '重庆房地产职业学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2238, '重庆城市职业学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2239, '重庆电力高等专科学校', 0, 3);
INSERT INTO `tbl_schools` VALUES (2240, '重庆电子工程职业学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2241, '重庆航天职业技术学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2242, '重庆工程职业技术学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2243, '重庆工商职业学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2244, '重庆工业职业技术学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2245, '重庆传媒职业学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2246, '重庆海联职业技术学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2247, '重庆机电职业技术学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2248, '重庆警官职业学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2249, '重庆民生职业技术学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2250, '重庆三峡医药高等专科学校', 0, 3);
INSERT INTO `tbl_schools` VALUES (2251, '重庆三峡职业学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2252, '重庆水利电力职业技术学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2253, '重庆信息技术职业学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2254, '重庆医药高等专科学校', 0, 3);
INSERT INTO `tbl_schools` VALUES (2255, '重庆正大软件职业技术学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2256, '重庆职业技术学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2257, '重庆教育学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2258, '重庆应用外国语专修学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2259, '重庆大学城市科技学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2260, '西南大学育才学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2261, '四川外语学院重庆南方翻译学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2262, '重庆师范大学涉外商贸学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2263, '重庆工商大学融智学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2264, '重庆工商大学派斯学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2265, '重庆邮电大学移通学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2266, '重庆工贸职业技术学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2267, '重庆青年职业技术学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2268, '重庆城市管理职业学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2269, '重庆财经职业学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2270, '重庆科创职业学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2271, '重庆建筑工程职业学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2272, '重庆五一技师学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2273, '重庆科创职业技术学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2274, '重庆通信学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2275, '西南大学应用技术学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2276, '重庆交通职业学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2277, '重庆电讯职业学院', 0, 3);
INSERT INTO `tbl_schools` VALUES (2278, '昆明理工', 0, 29);
INSERT INTO `tbl_schools` VALUES (2279, '云南农大', 0, 29);
INSERT INTO `tbl_schools` VALUES (2280, '云南师大', 0, 29);
INSERT INTO `tbl_schools` VALUES (2281, '云南财经', 0, 29);
INSERT INTO `tbl_schools` VALUES (2282, '云南民大', 0, 29);
INSERT INTO `tbl_schools` VALUES (2283, '西南林业大学', 0, 29);
INSERT INTO `tbl_schools` VALUES (2284, '昆明医学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2285, '云南中医学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2286, '红河学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2287, '云南警官学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2288, '云南艺术', 0, 29);
INSERT INTO `tbl_schools` VALUES (2289, '云南大学', 0, 29);
INSERT INTO `tbl_schools` VALUES (2290, '云南工商学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2291, '云南财贸外事职业学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2292, '云南经贸外事职业学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2293, '大理医学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2294, '曲靖师范', 0, 29);
INSERT INTO `tbl_schools` VALUES (2295, '玉溪师院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2296, '楚雄师院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2297, '大理学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2298, '保山学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2299, '保山中医药高等专科学校', 0, 29);
INSERT INTO `tbl_schools` VALUES (2300, '楚雄医药高等专科学校', 0, 29);
INSERT INTO `tbl_schools` VALUES (2301, '德宏师范高等专科学校', 0, 29);
INSERT INTO `tbl_schools` VALUES (2302, '云南大学滇池学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2303, '昆明大学', 0, 29);
INSERT INTO `tbl_schools` VALUES (2304, '昆明工业职业技术学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2305, '昆明师范高等专科学校', 0, 29);
INSERT INTO `tbl_schools` VALUES (2306, '云南工程职业学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2307, '昆明冶金高等专科学校', 0, 29);
INSERT INTO `tbl_schools` VALUES (2308, '昆明艺术职业学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2309, '丽江师范高等专科学校', 0, 29);
INSERT INTO `tbl_schools` VALUES (2310, '曲靖医学高等专科学校', 0, 29);
INSERT INTO `tbl_schools` VALUES (2311, '思茅师范高等专科学校', 0, 29);
INSERT INTO `tbl_schools` VALUES (2312, '文山学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2313, '西双版纳职业技术学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2314, '玉溪农业职业技术学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2315, '云南爱因森软件职业学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2316, '云南北美职业学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2317, '云南国防工业职业技术学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2318, '云南国土资源职业学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2319, '云南机电职业技术学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2320, '云南交通职业技术学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2321, '云南经济管理职业学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2322, '云南科技信息职业技术学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2323, '云南林业职业技术学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2324, '云南能源职业技术学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2325, '云南农业职业技术学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2326, '云南热带作物职业学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2327, '云南省林业科学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2328, '云南师范大学商学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2329, '云南司法警官职业学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2330, '云南体育运动职业技术学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2331, '云南文化艺术职业学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2332, '云南新兴职业学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2333, '云南医学高等专科学校', 0, 29);
INSERT INTO `tbl_schools` VALUES (2334, '云南昭通师范专科学校', 0, 29);
INSERT INTO `tbl_schools` VALUES (2335, '昆明理工大学津桥学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2336, '云南师范大学文理学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2337, '昆明医学院海源学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2338, '云南艺术学院文华学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2339, '云南大学旅游文化学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2340, '临沧师范高等专科学校', 0, 29);
INSERT INTO `tbl_schools` VALUES (2341, '云南锡业职业技术学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2342, '云南科技信息职业学院', 0, 29);
INSERT INTO `tbl_schools` VALUES (2343, '河北大学', 0, 10);
INSERT INTO `tbl_schools` VALUES (2344, '河北农大', 0, 10);
INSERT INTO `tbl_schools` VALUES (2345, '中央司法警官学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2346, '石家庄铁道大学', 0, 10);
INSERT INTO `tbl_schools` VALUES (2347, '石家庄经院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2348, '河北京安学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2349, '泊头职业学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2350, '河北财经学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2351, '河北师大', 0, 10);
INSERT INTO `tbl_schools` VALUES (2352, '河北科技', 0, 10);
INSERT INTO `tbl_schools` VALUES (2353, '河北医科', 0, 10);
INSERT INTO `tbl_schools` VALUES (2354, '河北经贸', 0, 10);
INSERT INTO `tbl_schools` VALUES (2355, '河北体院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2356, '石家庄学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2357, '燕山大学', 0, 10);
INSERT INTO `tbl_schools` VALUES (2358, '河北科师', 0, 10);
INSERT INTO `tbl_schools` VALUES (2359, '河北联合大学', 0, 10);
INSERT INTO `tbl_schools` VALUES (2360, '华北煤炭医学', 0, 10);
INSERT INTO `tbl_schools` VALUES (2361, '唐山学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2362, '唐山师范', 0, 10);
INSERT INTO `tbl_schools` VALUES (2363, '华北航工', 0, 10);
INSERT INTO `tbl_schools` VALUES (2364, '廊坊师范', 0, 10);
INSERT INTO `tbl_schools` VALUES (2365, '防灾科技学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2366, '华北科技', 0, 10);
INSERT INTO `tbl_schools` VALUES (2367, '河北建工', 0, 10);
INSERT INTO `tbl_schools` VALUES (2368, '北方学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2369, '承德医学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2370, '邢台学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2371, '河北工程', 0, 10);
INSERT INTO `tbl_schools` VALUES (2372, '邯郸学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2373, '衡水学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2374, '保定电力职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2375, '保定科技职业学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2376, '河北金融学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2377, '保定学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2378, '保定职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2379, '渤海石油职业学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2380, '沧州师范专科学校', 0, 10);
INSERT INTO `tbl_schools` VALUES (2381, '沧州医学高等专科学校', 0, 10);
INSERT INTO `tbl_schools` VALUES (2382, '沧州职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2383, '河北旅游职业学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2384, '承德民族师范高等专科学校', 0, 10);
INSERT INTO `tbl_schools` VALUES (2385, '承德石油高等专科学校', 0, 10);
INSERT INTO `tbl_schools` VALUES (2386, '东北大学秦皇岛校区', 0, 10);
INSERT INTO `tbl_schools` VALUES (2387, '邯郸职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2388, '河北大学医学部', 0, 10);
INSERT INTO `tbl_schools` VALUES (2389, '河北工程技术高等专科学校', 0, 10);
INSERT INTO `tbl_schools` VALUES (2390, '河北工业职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2391, '河北公安警察职业学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2392, '河北化工医药职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2393, '河北机电职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2394, '河北建材职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2395, '河北交通职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2396, '河北京都高尔夫职业学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2397, '河北农业大学', 0, 10);
INSERT INTO `tbl_schools` VALUES (2398, '河北农业大学海洋学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2399, '河北女子职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2400, '河北软件职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2401, '河北省艺术职业学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2402, '河北石油职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2403, '河北司法警官职业学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2404, '河北通信职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2405, '河北远东职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2406, '河北政法管理干部学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2407, '河北职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2408, '衡水职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2409, '华北电力大学（保定）', 0, 10);
INSERT INTO `tbl_schools` VALUES (2410, '监督管理局', 0, 10);
INSERT INTO `tbl_schools` VALUES (2411, '廊坊大学城北大方正软件学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2412, '廊坊东方大学城北京澳际联邦英语学校', 0, 10);
INSERT INTO `tbl_schools` VALUES (2413, '廊坊东方大学城北京财经学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2414, '廊坊东方大学城北京城市学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2415, '廊坊东方大学城北京传媒学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2416, '廊坊东方大学城北京经济技术职业学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2417, '廊坊东方大学城北京经贸职业学院航空服务学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2418, '廊坊东方大学城北京联合大学', 0, 10);
INSERT INTO `tbl_schools` VALUES (2419, '廊坊东方大学城河北体育学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2420, '廊坊东方大学城廊坊职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2421, '秦皇岛教育学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2422, '秦皇岛外国语职业学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2423, '秦皇岛职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2424, '河北美术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2425, '石家庄法商职业学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2426, '石家庄工商职业学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2427, '石家庄计算机职业学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2428, '石家庄科技信息职业学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2429, '石家庄理工职业学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2430, '石家庄铁路职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2431, '石家庄外国语职业学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2432, '石家庄外经贸职业学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2433, '石家庄外语翻译职业学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2434, '石家庄信息工程职业学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2435, '石家庄医学高等专科学校', 0, 10);
INSERT INTO `tbl_schools` VALUES (2436, '河北传媒学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2437, '石家庄邮电职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2438, '石家庄职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2439, '唐山工业职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2440, '唐山广播电视大学', 0, 10);
INSERT INTO `tbl_schools` VALUES (2441, '唐山科技职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2442, '唐山职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2443, '邢台医学高等专科学校', 0, 10);
INSERT INTO `tbl_schools` VALUES (2444, '邢台职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2445, '张家口职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2446, '中国地质大学长城学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2447, '中国环境管理干部学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2448, '中国民航管理干部学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2449, '张家口教育学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2450, '河北能源职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2451, '承德卫生学校', 0, 10);
INSERT INTO `tbl_schools` VALUES (2452, '邯郸中原外国语职业学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2453, '河北师范大学汇华学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2454, '河北联合大学冀唐学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2455, '河北医科大学临床学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2456, '河北农业大学现代科技学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2457, '石家庄铁道学院四方学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2458, '燕山大学里仁学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2459, '河北工程大学科信学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2460, '河北联合大学轻工学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2461, '河北大学工商学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2462, '河北经贸大学经济管理学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2463, '廊坊职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2464, '石家庄外事职业学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2465, '河北政法职业学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2466, '冀中职业学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2467, '石家庄科技工程职业学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2468, '河北劳动关系职业学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2469, '河北师范大学', 0, 10);
INSERT INTO `tbl_schools` VALUES (2470, '河北行政学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2471, '华北煤炭医学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2472, '赣州东方学校', 0, 10);
INSERT INTO `tbl_schools` VALUES (2473, '北京中医药大学东方学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2474, '承德燕北职业技术专修学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2475, '河北工业大学廊坊分院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2476, '石家庄铁路工程技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2477, '石家庄经济学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2478, '石家庄经济学院华信学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2479, '中国轻工业干部管理学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2480, '河北宣化通信士官学校', 0, 10);
INSERT INTO `tbl_schools` VALUES (2481, '承德民族职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2482, '河北省保定市财贸学校', 0, 10);
INSERT INTO `tbl_schools` VALUES (2483, '宣化科技职业学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2484, '河北青年管理干部学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2485, '北京交通大学海滨学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2486, '石家庄职工大学', 0, 10);
INSERT INTO `tbl_schools` VALUES (2487, '河北地质职工大学', 0, 10);
INSERT INTO `tbl_schools` VALUES (2488, '河北广播电视大学', 0, 10);
INSERT INTO `tbl_schools` VALUES (2489, '保定广播电视大学', 0, 10);
INSERT INTO `tbl_schools` VALUES (2490, '河北广播电视大学高等职业技术学院', 0, 10);
INSERT INTO `tbl_schools` VALUES (2491, '江西财经', 0, 17);
INSERT INTO `tbl_schools` VALUES (2492, '南昌大学', 0, 17);
INSERT INTO `tbl_schools` VALUES (2493, '华东交通大学', 0, 17);
INSERT INTO `tbl_schools` VALUES (2494, '南昌航空大学', 0, 17);
INSERT INTO `tbl_schools` VALUES (2495, '南昌工程', 0, 17);
INSERT INTO `tbl_schools` VALUES (2496, '南昌理工', 0, 17);
INSERT INTO `tbl_schools` VALUES (2497, '江西中医学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2498, '江西科技师范学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2499, '蓝天学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2500, '江西农大', 0, 17);
INSERT INTO `tbl_schools` VALUES (2501, '江西师大', 0, 17);
INSERT INTO `tbl_schools` VALUES (2502, '东华理工大学', 0, 17);
INSERT INTO `tbl_schools` VALUES (2503, '景德镇陶瓷学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2504, '赣南医学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2505, '赣南师范学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2506, '江西理工', 0, 17);
INSERT INTO `tbl_schools` VALUES (2507, '上饶师范学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2508, '井冈山大学', 0, 17);
INSERT INTO `tbl_schools` VALUES (2509, '宜春学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2510, '九江学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2511, '抚州职业技术学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2512, '赣南教育学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2513, '赣西科技职业学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2514, '江西财经职业学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2515, '江西城市职业学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2516, '江西大宇学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2517, '江西电力职业技术学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2518, '江西服装学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2519, '南昌工学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2520, '江西工程职业学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2521, '江西工业工程职业技术学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2522, '江西工业贸易职业技术学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2523, '江西工业职业技术学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2524, '江西警察学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2525, '江西航空职业技术学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2526, '江西护理职业技术学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2527, '江西环境工程职业学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2528, '江西机电职业技术学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2529, '江西建设职业技术学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2530, '江西交通职业技术学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2531, '江西教育学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2532, '江西经济管理干部学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2533, '江西经济管理职业学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2534, '江西科技职业学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2535, '江西旅游商贸职业学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2536, '江西南昌教育学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2537, '江西农业工程职业学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2538, '江西青年职业学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2539, '江西轻工职业技术学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2540, '江西生物科技职业学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2541, '江西省广播电视大学', 0, 17);
INSERT INTO `tbl_schools` VALUES (2542, '江西司法警官职业学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2543, '江西陶瓷工艺美术职业学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2544, '江西外语外贸职业学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2545, '江西先锋软件职业技术学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2546, '江西现代职业技术学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2547, '江西信息应用职业技术学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2548, '江西行政管理干部学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2549, '江西艺术职业学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2550, '江西应用技术职业学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2551, '江西渝州科技职业学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2552, '江西制造职业技术学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2553, '江西中医药高等专科学校', 0, 17);
INSERT INTO `tbl_schools` VALUES (2554, '景德镇高等专科学校', 0, 17);
INSERT INTO `tbl_schools` VALUES (2555, '九江职业大学', 0, 17);
INSERT INTO `tbl_schools` VALUES (2556, '九江职业技术学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2557, '南昌钢铁职工大学', 0, 17);
INSERT INTO `tbl_schools` VALUES (2558, '南昌师范高等专科学校', 0, 17);
INSERT INTO `tbl_schools` VALUES (2559, '南昌市业余大学', 0, 17);
INSERT INTO `tbl_schools` VALUES (2560, '南昌市职工科技大学', 0, 17);
INSERT INTO `tbl_schools` VALUES (2561, '萍乡高等专科学校', 0, 17);
INSERT INTO `tbl_schools` VALUES (2562, '上饶职业技术学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2563, '新余钢铁有限责任公司职工大学', 0, 17);
INSERT INTO `tbl_schools` VALUES (2564, '新余学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2565, '宜春职业技术学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2566, '鹰潭职业技术学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2567, '江西应用工程职业学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2568, '江西农业大学南昌商学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2569, '江西师范大学科学技术学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2570, '华东交通大学理工学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2571, '江西理工大学应用科学学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2572, '东华理工大学长江学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2573, '南昌航空大学科技学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2574, '江西中医学院科技学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2575, '江西财经大学现代经济管理学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2576, '赣南师范学院科技学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2577, '景德镇陶瓷学院科技艺术学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2578, '江西科技师范学院理工学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2579, '南昌大学共青学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2580, '南昌大学科学技术学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2581, '江西泰豪动漫职业学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2582, '江西枫林涉外经贸职业学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2583, '江西中山职业技术学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2584, '江西艺术设计学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2585, '江西师大鹰潭学院', 0, 17);
INSERT INTO `tbl_schools` VALUES (2586, '山西大学', 0, 22);
INSERT INTO `tbl_schools` VALUES (2587, '太原理工', 0, 22);
INSERT INTO `tbl_schools` VALUES (2588, '中北大学', 0, 22);
INSERT INTO `tbl_schools` VALUES (2589, '山西医大', 0, 22);
INSERT INTO `tbl_schools` VALUES (2590, '山西中医学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2591, '太原师范', 0, 22);
INSERT INTO `tbl_schools` VALUES (2592, '太原科大', 0, 22);
INSERT INTO `tbl_schools` VALUES (2593, '山西财经', 0, 22);
INSERT INTO `tbl_schools` VALUES (2594, '运城职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2595, '山西师大', 0, 22);
INSERT INTO `tbl_schools` VALUES (2596, '山西农大', 0, 22);
INSERT INTO `tbl_schools` VALUES (2597, '大同大学', 0, 22);
INSERT INTO `tbl_schools` VALUES (2598, '长治医学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2599, '长治学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2600, '运城学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2601, '晋中学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2602, '忻州师范', 0, 22);
INSERT INTO `tbl_schools` VALUES (2603, '北岳职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2604, '长治职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2605, '晋城职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2606, '晋中职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2607, '临汾职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2608, '潞安职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2609, '吕梁学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2610, '山西财贸职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2611, '山西财政税务专科学校', 0, 22);
INSERT INTO `tbl_schools` VALUES (2612, '山西电力职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2613, '山西工程职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2614, '山西工商学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2615, '山西管理职业学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2616, '山西国际商务职业学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2617, '山西华澳商贸职业学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2618, '山西机电职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2619, '山西建筑职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2620, '山西交通职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2621, '山西金融职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2622, '山西警官高等专科学校', 0, 22);
INSERT INTO `tbl_schools` VALUES (2623, '山西警官职业学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2624, '山西林业职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2625, '山西旅游职业学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2626, '山西煤炭职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2627, '山西生物应用职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2628, '山西水利职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2629, '山西体育职业学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2630, '山西同文外语职业学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2631, '山西戏剧职业学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2632, '山西信息职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2633, '山西兴华职业学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2634, '山西艺术职业学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2635, '山西运城农业职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2636, '山西职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2637, '太原城市职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2638, '太原大学', 0, 22);
INSERT INTO `tbl_schools` VALUES (2639, '太原电力高等专科学校', 0, 22);
INSERT INTO `tbl_schools` VALUES (2640, '太原旅游职业学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2641, '忻州职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2642, '阳泉职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2643, '山西广播电影电视管理干部学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2644, '山西城市职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2645, '运城农业学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2646, '山西广播电视大学', 0, 22);
INSERT INTO `tbl_schools` VALUES (2647, '晋中学院师范学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2648, '朔州职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2649, '山西农业大学平遥机电学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2650, '山西农业大学信息学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2651, '山西农业大学太原畜牧兽医学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2652, '山西农业大学太原园艺学院（太原农业学校）', 0, 22);
INSERT INTO `tbl_schools` VALUES (2653, '山西农业大学原平农学院（原平农业学校）', 0, 22);
INSERT INTO `tbl_schools` VALUES (2654, '太原科技大学运城工学院（运城工学院）', 0, 22);
INSERT INTO `tbl_schools` VALUES (2655, '山西财经大学运城学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2656, '山西医科大学汾阳分院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2657, '山西医科大学晋祠学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2658, '太原科技大学华科学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2659, '山西财经大学华商学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2660, '中北大学信息商务学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2661, '山西师范大学现代文理学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2662, '忻州师范学院五寨分院（五寨师范学院）', 0, 22);
INSERT INTO `tbl_schools` VALUES (2663, '山西大学商务学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2664, '太原工业学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2665, '山西经济管理干部学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2666, '山西青年职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2667, '山西省职工工艺美术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2668, '山西省吕梁市教育学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2669, '长治市教育学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2670, '山西煤炭管理干部学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2671, '山西政法管理干部学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2672, '阳泉市教育学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2673, '山西煤炭职工联合大学', 0, 22);
INSERT INTO `tbl_schools` VALUES (2674, '太原钢铁(集团)有限公司职工钢铁学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2675, '山西机电职工学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2676, '太原化学工业集团有限公司职工大学', 0, 22);
INSERT INTO `tbl_schools` VALUES (2677, '山西兵器工业职工大学', 0, 22);
INSERT INTO `tbl_schools` VALUES (2678, '山西职工医学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2679, '山西省临汾电力技师学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2680, '太原大学外语师范学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2681, '运城幼儿师范高等专科学校', 0, 22);
INSERT INTO `tbl_schools` VALUES (2682, '中国辐射防护研究院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2683, '山西师大临汾学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2684, '山西财经大学经济技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2685, '山西老区职业技术学院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2686, '中国日用化学工业研究院', 0, 22);
INSERT INTO `tbl_schools` VALUES (2687, '贵州大学', 0, 8);
INSERT INTO `tbl_schools` VALUES (2688, '贵阳医学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2689, '贵阳中医学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2690, '贵州财经', 0, 8);
INSERT INTO `tbl_schools` VALUES (2691, '贵州民族', 0, 8);
INSERT INTO `tbl_schools` VALUES (2692, '贵阳学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2693, '贵州师大', 0, 8);
INSERT INTO `tbl_schools` VALUES (2694, '铜仁学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2695, '贵州职业技术学院 ', 0, 8);
INSERT INTO `tbl_schools` VALUES (2696, '贵州省职业技术学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2697, '遵义医学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2698, '遵义师范', 0, 8);
INSERT INTO `tbl_schools` VALUES (2699, '毕节学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2700, '黔南师院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2701, '安顺学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2702, '凯里学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2703, '安顺职业技术学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2704, '贵州电力职业技术学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2705, '贵州电子信息职业技术学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2706, '贵州航天职业技术学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2707, '贵州交通职业技术学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2708, '贵州警官职业学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2709, '贵州工业职业技术学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2710, '贵州轻工职业技术学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2711, '贵州商业高等专科学校', 0, 8);
INSERT INTO `tbl_schools` VALUES (2712, '六盘水师范高等专科学校', 0, 8);
INSERT INTO `tbl_schools` VALUES (2713, '六盘水职业技术学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2714, '黔东南民族职业技术学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2715, '黔南民族医学高等专科学校', 0, 8);
INSERT INTO `tbl_schools` VALUES (2716, '黔南民族职业技术学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2717, '黔西南民族职业技术学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2718, '铜仁职业技术学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2719, '遵义医药高等专科学校', 0, 8);
INSERT INTO `tbl_schools` VALUES (2720, '遵义职业技术学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2721, '贵州财经学院商务学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2722, '贵州民族学院人文科技学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2723, '贵州师范大学求是学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2724, '贵阳医学院神奇民族医药学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2725, '遵义医学院医学与科技学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2726, '贵阳中医学院时珍学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2727, '贵州大学明德学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2728, '贵州大学科技学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2729, '贵阳护理职业学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2730, '贵州亚泰职业学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2731, '贵州师范学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2732, '贵阳职业技术学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2733, '毕节职业技术学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2734, '贵州广播电视大学', 0, 8);
INSERT INTO `tbl_schools` VALUES (2735, '贵州省财经学院商务学院', 0, 8);
INSERT INTO `tbl_schools` VALUES (2736, '广西大学', 0, 7);
INSERT INTO `tbl_schools` VALUES (2737, '广西医科大学', 0, 7);
INSERT INTO `tbl_schools` VALUES (2738, '广西民族大学', 0, 7);
INSERT INTO `tbl_schools` VALUES (2739, '广西中医学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2740, '广西师范学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2741, '广西财经学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2742, '广西艺术学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2743, '广西外国语学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2744, '桂林电子科技大学', 0, 7);
INSERT INTO `tbl_schools` VALUES (2745, '广西师范大学', 0, 7);
INSERT INTO `tbl_schools` VALUES (2746, '桂林理工大学', 0, 7);
INSERT INTO `tbl_schools` VALUES (2747, '桂林医学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2748, '广西工学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2749, '右江民族医学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2750, '百色学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2751, '河池学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2752, '玉林师范学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2753, '钦州学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2754, '贺州学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2755, '梧州学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2756, '广西大学行健文理学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2757, '广西师范大学漓江学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2758, '桂林电子科技大学信息科技学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2759, '桂林工学院博文管理学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2760, '广西工学院鹿山学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2761, '广西师范学院师园学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2762, '广西民族大学相思湖学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2763, '广西中医学院赛恩斯新医药学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2764, '北海宏源足球职业学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2765, '北海艺术设计职业学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2766, '北海职业学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2767, '广西城市职业学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2768, '广西电力职业技术学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2769, '广西东方外语职业学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2770, '广西工商职业技术学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2771, '广西工业职业技术学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2772, '广西国际商务职业技术学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2773, '广西机电职业技术学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2774, '广西建设职业技术学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2775, '广西交通职业技术学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2776, '广西经济管理干部学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2777, '广西经贸职业技术学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2778, '广西警管高等专科学校', 0, 7);
INSERT INTO `tbl_schools` VALUES (2779, '广西农业职业技术学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2780, '广西轻工高级技工学校', 0, 7);
INSERT INTO `tbl_schools` VALUES (2781, '广西生态工程职业技术学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2782, '广西水利电力职业技术学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2783, '广西体育高等专科学校', 0, 7);
INSERT INTO `tbl_schools` VALUES (2784, '广西演艺职业学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2785, '广西英华国际职业学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2786, '广西邕江大学', 0, 7);
INSERT INTO `tbl_schools` VALUES (2787, '广西幼儿师范学校', 0, 7);
INSERT INTO `tbl_schools` VALUES (2788, '广西职业技术学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2789, '贵港职业学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2790, '桂林航天工业高等专科学校', 0, 7);
INSERT INTO `tbl_schools` VALUES (2791, '桂林旅游高等专科学校', 0, 7);
INSERT INTO `tbl_schools` VALUES (2792, '桂林山水职业学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2793, '桂林师范高等专科学校', 0, 7);
INSERT INTO `tbl_schools` VALUES (2794, '河池职业学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2795, '柳州师范高等专科学校', 0, 7);
INSERT INTO `tbl_schools` VALUES (2796, '柳州医学高等专科学校', 0, 7);
INSERT INTO `tbl_schools` VALUES (2797, '柳州铁道职业技术学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2798, '柳州职业技术学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2799, '南宁师范高等专科学校', 0, 7);
INSERT INTO `tbl_schools` VALUES (2800, '南宁职业技术学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2801, '南宁地区教育学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2802, '北京航空航天大学北海学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2803, '桂林工学院南宁分院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2804, '百色职业学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2805, '广西教育学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2806, '梧州职业学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2807, '广西卫生管理干部学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2808, '广西政法管理干部学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2809, '柳州城市职业技术学院', 0, 7);
INSERT INTO `tbl_schools` VALUES (2810, '内蒙古大学', 0, 15);
INSERT INTO `tbl_schools` VALUES (2811, '内蒙古工业大学', 0, 15);
INSERT INTO `tbl_schools` VALUES (2812, '内蒙古农大', 0, 15);
INSERT INTO `tbl_schools` VALUES (2813, '内蒙古师大', 0, 15);
INSERT INTO `tbl_schools` VALUES (2814, '内蒙古医学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2815, '内蒙古财经', 0, 15);
INSERT INTO `tbl_schools` VALUES (2816, '内蒙古科大', 0, 15);
INSERT INTO `tbl_schools` VALUES (2817, '内蒙古民族大学', 0, 15);
INSERT INTO `tbl_schools` VALUES (2818, '赤峰学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2819, '呼伦贝尔学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2820, '包头钢铁职业技术学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2821, '包头轻工职业技术学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2822, '包头职业技术学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2823, '河套大学', 0, 15);
INSERT INTO `tbl_schools` VALUES (2824, '呼和浩特职业学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2825, '科尔沁艺术职业学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2826, '内蒙古财税职业学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2827, '内蒙古电子信息职业技术学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2828, '内蒙古青城大学', 0, 15);
INSERT INTO `tbl_schools` VALUES (2829, '内蒙古化工职业学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2830, '内蒙古机电职业技术学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2831, '内蒙古建筑职业技术学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2832, '内蒙古交通职业技术学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2833, '呼和浩特民族学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2834, '内蒙古商贸职业学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2835, '内蒙古体育职业学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2836, '通辽职业学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2837, '乌海职业技术学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2838, '乌兰察布职业学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2839, '锡林郭勒职业学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2840, '兴安职业技术学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2841, '内蒙古警察职业学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2842, '内蒙古北方职业技术学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2843, '内蒙古丰州学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2844, '内蒙古经贸外语职业学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2845, '内蒙古科技职业学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2846, '赤峰职业技术学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2847, '包头铁道职业技术学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2848, '内蒙古广播电视大学直属学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2849, '集宁师范学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2850, '内蒙古财经学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2851, '包头师范学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2852, '内蒙古科技大学包头师范学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2853, '内蒙古医药专修学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2854, '鄂尔多斯职业学院', 0, 15);
INSERT INTO `tbl_schools` VALUES (2855, '乌兰察布医学高等专科学校', 0, 15);
INSERT INTO `tbl_schools` VALUES (2856, '宁夏大学', 0, 20);
INSERT INTO `tbl_schools` VALUES (2857, '北方民大', 0, 20);
INSERT INTO `tbl_schools` VALUES (2858, '宁夏医科大学', 0, 20);
INSERT INTO `tbl_schools` VALUES (2859, '宁夏理工', 0, 20);
INSERT INTO `tbl_schools` VALUES (2860, '吴忠职业技术学院', 0, 20);
INSERT INTO `tbl_schools` VALUES (2861, '宁夏职业技术学院', 0, 20);
INSERT INTO `tbl_schools` VALUES (2862, '宁夏财经职业技术学院', 0, 20);
INSERT INTO `tbl_schools` VALUES (2863, '宁夏司法警官职业学院', 0, 20);
INSERT INTO `tbl_schools` VALUES (2864, '宁夏师范学院', 0, 20);
INSERT INTO `tbl_schools` VALUES (2865, '宁夏工业职业学院', 0, 20);
INSERT INTO `tbl_schools` VALUES (2866, '宁夏工商职业技术学院', 0, 20);
INSERT INTO `tbl_schools` VALUES (2867, '宁夏建设职业技术学院', 0, 20);
INSERT INTO `tbl_schools` VALUES (2868, '银川科技职业学院（银川大学）', 0, 20);
INSERT INTO `tbl_schools` VALUES (2869, '宁夏大学新华学院', 0, 20);
INSERT INTO `tbl_schools` VALUES (2870, '中国矿业大学银川学院', 0, 20);
INSERT INTO `tbl_schools` VALUES (2871, '青海大学', 0, 21);
INSERT INTO `tbl_schools` VALUES (2872, '青海师大', 0, 21);
INSERT INTO `tbl_schools` VALUES (2873, '青海民大', 0, 21);
INSERT INTO `tbl_schools` VALUES (2874, '青海民族师范高等专科学校', 0, 21);
INSERT INTO `tbl_schools` VALUES (2875, '青海财经职业学院', 0, 21);
INSERT INTO `tbl_schools` VALUES (2876, '青海畜牧兽医职业技术学院', 0, 21);
INSERT INTO `tbl_schools` VALUES (2877, '青海建筑职业技术学院', 0, 21);
INSERT INTO `tbl_schools` VALUES (2878, '青海师范高等专科学校', 0, 21);
INSERT INTO `tbl_schools` VALUES (2879, '青海警官职业学院', 0, 21);
INSERT INTO `tbl_schools` VALUES (2880, '青海交通职业技术学院', 0, 21);
INSERT INTO `tbl_schools` VALUES (2881, '青海卫生职业技术学院', 0, 21);
INSERT INTO `tbl_schools` VALUES (2882, '新疆大学', 0, 28);
INSERT INTO `tbl_schools` VALUES (2883, '新疆农大', 0, 28);
INSERT INTO `tbl_schools` VALUES (2884, '新疆医科大', 0, 28);
INSERT INTO `tbl_schools` VALUES (2885, '新疆师大', 0, 28);
INSERT INTO `tbl_schools` VALUES (2886, '新疆财经', 0, 28);
INSERT INTO `tbl_schools` VALUES (2887, '新疆艺术学院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2888, '石河子大学', 0, 28);
INSERT INTO `tbl_schools` VALUES (2889, '塔里木大学', 0, 28);
INSERT INTO `tbl_schools` VALUES (2890, '喀什师院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2891, '伊犁师院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2892, '昌吉学院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2893, '阿克苏职业技术学院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2894, '巴音郭楞职业技术学院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2895, '昌吉职业技术学院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2896, '和田师范专科学校', 0, 28);
INSERT INTO `tbl_schools` VALUES (2897, '克拉玛依职业技术学院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2898, '乌鲁木齐职业大学', 0, 28);
INSERT INTO `tbl_schools` VALUES (2899, '新疆兵团警官高等专科学校', 0, 28);
INSERT INTO `tbl_schools` VALUES (2900, '新疆工业高等专科学校', 0, 28);
INSERT INTO `tbl_schools` VALUES (2901, '新疆机电职业技术学院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2902, '新疆建设职业技术学院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2903, '新疆交通职业技术学院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2904, '新疆警官高等专科学校', 0, 28);
INSERT INTO `tbl_schools` VALUES (2905, '新疆能源职业技术学院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2906, '新疆农业职业技术学院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2907, '新疆轻工职业技术学院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2908, '新疆石河子职业技术学院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2909, '新疆天山职业技术学院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2910, '新疆维吾尔医学专科学校', 0, 28);
INSERT INTO `tbl_schools` VALUES (2911, '新疆现代职业技术学院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2912, '伊犁职业技术学院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2913, '新疆科信学院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2914, '新疆职业大学', 0, 28);
INSERT INTO `tbl_schools` VALUES (2915, '新疆石油学院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2916, '新疆大学科学技术学院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2917, '新疆农业大学科学技术学院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2918, '新疆财经大学商务学院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2919, '新疆医科大学厚博学院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2920, '石河子大学科技学院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2921, '新疆教育学院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2922, '新疆政法学院', 0, 28);
INSERT INTO `tbl_schools` VALUES (2923, '新疆广播电视大学', 0, 28);
INSERT INTO `tbl_schools` VALUES (2924, '海南大学', 21, 5);
INSERT INTO `tbl_schools` VALUES (2925, '海南医学院', 21, 5);
INSERT INTO `tbl_schools` VALUES (2926, '海南师范大学', 21, 5);
INSERT INTO `tbl_schools` VALUES (2927, '华南热带农大', 21, 5);
INSERT INTO `tbl_schools` VALUES (2928, '琼州大学', 21, 5);
INSERT INTO `tbl_schools` VALUES (2929, '海口经济学院', 21, 5);
INSERT INTO `tbl_schools` VALUES (2930, '海南经贸职业技术学院', 21, 5);
INSERT INTO `tbl_schools` VALUES (2931, '海南软件职业技术学院', 21, 5);
INSERT INTO `tbl_schools` VALUES (2932, '海南外国语职业学院', 21, 5);
INSERT INTO `tbl_schools` VALUES (2933, '海南工商职业学院', 21, 5);
INSERT INTO `tbl_schools` VALUES (2934, '海南政法职业学院', 21, 5);
INSERT INTO `tbl_schools` VALUES (2935, '海南职业技术学院', 21, 5);
INSERT INTO `tbl_schools` VALUES (2936, '琼台师范高等专科学校', 21, 5);
INSERT INTO `tbl_schools` VALUES (2937, '三亚航空旅游职业学院', 21, 5);
INSERT INTO `tbl_schools` VALUES (2938, '三亚卓达旅游职业学院', 21, 5);
INSERT INTO `tbl_schools` VALUES (2939, '海南大学三亚学院', 21, 5);
INSERT INTO `tbl_schools` VALUES (2940, '三亚城市职业学院', 21, 5);
INSERT INTO `tbl_schools` VALUES (2941, '海南科技职业学院', 21, 5);
INSERT INTO `tbl_schools` VALUES (2942, '三亚理工职业学院', 21, 5);
INSERT INTO `tbl_schools` VALUES (2943, '西藏大学', 0, 27);
INSERT INTO `tbl_schools` VALUES (2944, '西藏藏医学院', 0, 27);
INSERT INTO `tbl_schools` VALUES (2945, '西藏民院', 0, 27);
INSERT INTO `tbl_schools` VALUES (2946, '拉萨师范高等专科学校', 0, 27);
INSERT INTO `tbl_schools` VALUES (2947, '西藏警官高等专科学校', 0, 27);
INSERT INTO `tbl_schools` VALUES (2948, '西藏职业技术学院', 0, 27);
INSERT INTO `tbl_schools` VALUES (2949, '西藏民族学院', 0, 27);
INSERT INTO `tbl_schools` VALUES (2950, '香港大学', 0, 33);
INSERT INTO `tbl_schools` VALUES (2951, '香港中文大学', 0, 33);
INSERT INTO `tbl_schools` VALUES (2952, '香港科技大学', 0, 33);
INSERT INTO `tbl_schools` VALUES (2953, '香港理工大学', 0, 33);
INSERT INTO `tbl_schools` VALUES (2954, '香港城市大学', 0, 33);
INSERT INTO `tbl_schools` VALUES (2955, '香港浸会大学', 0, 33);
INSERT INTO `tbl_schools` VALUES (2956, '香港岭南大学', 0, 33);
INSERT INTO `tbl_schools` VALUES (2957, '香港国际工商管理学院', 0, 33);
INSERT INTO `tbl_schools` VALUES (2958, '香港珠海学院', 0, 33);
INSERT INTO `tbl_schools` VALUES (2959, '香港教育学院', 0, 33);
INSERT INTO `tbl_schools` VALUES (2960, '香港树仁大学', 0, 33);
INSERT INTO `tbl_schools` VALUES (2961, '香港演艺学院', 0, 33);
INSERT INTO `tbl_schools` VALUES (2962, 'The Open University of HongKong', 0, 33);
INSERT INTO `tbl_schools` VALUES (2963, '澳门大学', 0, 34);
INSERT INTO `tbl_schools` VALUES (2964, '澳门理工学院', 0, 34);
INSERT INTO `tbl_schools` VALUES (2965, '澳门科技大学', 0, 34);
INSERT INTO `tbl_schools` VALUES (2966, '澳门旅游学院', 0, 34);
INSERT INTO `tbl_schools` VALUES (2967, '澳门镜湖护理学院', 0, 34);
INSERT INTO `tbl_schools` VALUES (2968, '澳门城市大学', 0, 34);
INSERT INTO `tbl_schools` VALUES (2969, '天主教辅仁大学', 0, 34);
INSERT INTO `tbl_schools` VALUES (2970, '长庚大学', 0, 34);
INSERT INTO `tbl_schools` VALUES (2971, '私立义守大学', 0, 34);
INSERT INTO `tbl_schools` VALUES (2972, '东海大学', 0, 34);
INSERT INTO `tbl_schools` VALUES (2973, '国立台湾大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (2974, '国立中正大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (2975, '国立台湾艺术大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (2976, '国立清华大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (2977, '国立中山大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (2978, '国立政治大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (2979, '国立成功大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (2980, '国立中央大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (2981, '国立阳明大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (2982, '国立东华大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (2983, '国立中兴大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (2984, '国立台湾师范大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (2985, '国立台湾海洋大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (2986, '国立高雄大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (2987, '国立嘉义大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (2988, '国立台湾科技大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (2989, '国立空中大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (2990, '国立台北大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (2991, '国立高雄师范大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (2992, '国立联合大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (2993, '国立暨南国际大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (2994, '国立屏东科技大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (2995, '国立彰化师范大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (2996, '国立台北科技大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (2997, '国立台东大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (2998, '国立宜蓝大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (2999, '国立台北艺术大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (3000, '国立云林科技大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (3001, '国立台南大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (3002, '国立虎尾科技大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (3003, '国立花莲教育大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (3004, '国立高雄第一科技大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (3005, '国立屏东教育大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (3006, '国立新竹教育大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (3007, '国立澎湖科技大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (3008, '建国科技大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (3009, '国立台南艺术大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (3010, '国立高雄应用科技大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (3011, '国立高雄海洋科技大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (3012, '国立勤益科技大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (3013, '东吴大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (3014, '国立交通大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (3015, '逢甲大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (3016, '高雄醫學大學', 0, 32);
INSERT INTO `tbl_schools` VALUES (3017, '淡江大學', 0, 32);
INSERT INTO `tbl_schools` VALUES (3018, '辅仁大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (3019, '台湾静宜大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (3020, '中国文化大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (3021, '育達科技大學', 0, 32);
INSERT INTO `tbl_schools` VALUES (3022, '世新大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (3023, '铭传大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (3024, '国立台北教育大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (3025, '台湾亚洲大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (3026, '中原大学', 0, 32);
INSERT INTO `tbl_schools` VALUES (3027, '铭传大学 ', 0, 32);
INSERT INTO `tbl_schools` VALUES (3028, 'University of Sydney', 35, 7);
INSERT INTO `tbl_schools` VALUES (3029, 'University of New South Wales', 35, 7);
INSERT INTO `tbl_schools` VALUES (3030, 'University of Melbourne', 35, 7);
INSERT INTO `tbl_schools` VALUES (3031, 'Adelaide University', 35, 7);
INSERT INTO `tbl_schools` VALUES (3032, 'Monash University', 35, 7);
INSERT INTO `tbl_schools` VALUES (3033, 'The University of Queensland', 35, 7);
INSERT INTO `tbl_schools` VALUES (3034, 'The University of Western Australia', 35, 7);
INSERT INTO `tbl_schools` VALUES (3035, 'The Australian National University', 35, 7);
INSERT INTO `tbl_schools` VALUES (3036, 'Macquarie University', 35, 7);
INSERT INTO `tbl_schools` VALUES (3037, 'The University of Newcastle', 35, 7);
INSERT INTO `tbl_schools` VALUES (3038, 'University of Wollongong', 35, 7);
INSERT INTO `tbl_schools` VALUES (3039, 'Griffith University', 35, 7);
INSERT INTO `tbl_schools` VALUES (3040, 'Flinders University', 35, 7);
INSERT INTO `tbl_schools` VALUES (3041, 'University of Tasmania', 35, 7);
INSERT INTO `tbl_schools` VALUES (3042, 'University of Western Sydney', 35, 7);
INSERT INTO `tbl_schools` VALUES (3043, 'Bond University', 35, 7);
INSERT INTO `tbl_schools` VALUES (3044, 'Deakin University', 35, 7);
INSERT INTO `tbl_schools` VALUES (3045, 'University of Technology , Sydney', 35, 7);
INSERT INTO `tbl_schools` VALUES (3046, 'Curtin University of Technology', 35, 7);
INSERT INTO `tbl_schools` VALUES (3047, 'RMIT University', 35, 7);
INSERT INTO `tbl_schools` VALUES (3048, 'Queensland University of Technology', 35, 7);
INSERT INTO `tbl_schools` VALUES (3049, 'La Trobe University', 35, 7);
INSERT INTO `tbl_schools` VALUES (3050, 'Murdoch University', 35, 7);
INSERT INTO `tbl_schools` VALUES (3051, 'University of Canberra', 35, 7);
INSERT INTO `tbl_schools` VALUES (3052, 'Swinburne University of Technology', 35, 7);
INSERT INTO `tbl_schools` VALUES (3053, 'University of South Australia', 35, 7);
INSERT INTO `tbl_schools` VALUES (3054, 'Charles Sturt University', 35, 7);
INSERT INTO `tbl_schools` VALUES (3055, 'James Cook University', 35, 7);
INSERT INTO `tbl_schools` VALUES (3056, 'University of Notre Dame', 35, 7);
INSERT INTO `tbl_schools` VALUES (3057, 'University of New England', 35, 7);
INSERT INTO `tbl_schools` VALUES (3058, 'University of Southern Queensland', 35, 7);
INSERT INTO `tbl_schools` VALUES (3059, 'Australia Catholic University', 35, 7);
INSERT INTO `tbl_schools` VALUES (3060, 'University of Ballarat', 35, 7);
INSERT INTO `tbl_schools` VALUES (3061, 'Edith Cowan University', 35, 7);
INSERT INTO `tbl_schools` VALUES (3062, 'Southern Cross University', 35, 7);
INSERT INTO `tbl_schools` VALUES (3063, 'University of Sunshine Coast', 35, 7);
INSERT INTO `tbl_schools` VALUES (3064, 'Victoria University', 35, 7);
INSERT INTO `tbl_schools` VALUES (3065, 'Northern Territory University', 35, 7);
INSERT INTO `tbl_schools` VALUES (3066, 'Carrick Institute of Education ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3067, 'BoxHill Institute TAFE', 35, 7);
INSERT INTO `tbl_schools` VALUES (3068, 'New south wales Technical And Further Education ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3069, 'Central Queensland University', 35, 7);
INSERT INTO `tbl_schools` VALUES (3070, 'Billy Blue School of Graphic Arts', 35, 7);
INSERT INTO `tbl_schools` VALUES (3071, 'Academia International', 35, 7);
INSERT INTO `tbl_schools` VALUES (3072, 'Canberra Institute of Technology ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3073, 'Hunter Institute of Technology ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3074, 'Illawarra Institute of TAFE', 35, 7);
INSERT INTO `tbl_schools` VALUES (3075, 'New England Institute of TAFE', 35, 7);
INSERT INTO `tbl_schools` VALUES (3076, 'North Coast Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3077, 'Northern Sydney Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3078, 'Riverina Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3079, 'South Western Sydney Institute of TAFE', 35, 7);
INSERT INTO `tbl_schools` VALUES (3080, 'Sydney Institute of Technology', 35, 7);
INSERT INTO `tbl_schools` VALUES (3081, 'Western Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3082, 'Western Sydney Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3083, 'Charles Darwin University', 35, 7);
INSERT INTO `tbl_schools` VALUES (3084, 'Barrier Reef Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3085, 'Brisbane North Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3086, 'Central Queensland Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3087, 'Cooloola Sunshine Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3088, 'Gold Coast Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3089, 'Logan Institute of TAFE', 35, 7);
INSERT INTO `tbl_schools` VALUES (3090, 'Moreton Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3091, 'Mt Isa Institute of TAFE', 35, 7);
INSERT INTO `tbl_schools` VALUES (3092, 'Open Learning Institute ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3093, 'Southbank Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3094, 'Southern Queensland Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3095, 'The Bremer Institute of TAFE', 35, 7);
INSERT INTO `tbl_schools` VALUES (3096, 'Tropical North Queensland Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3097, 'Wide Bay Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3098, 'Yeronga Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3099, 'Adelaide Institute of TAFE', 35, 7);
INSERT INTO `tbl_schools` VALUES (3100, 'Douglas Mawson Institute of TAFE', 35, 7);
INSERT INTO `tbl_schools` VALUES (3101, 'Murray Institute of TAFE', 35, 7);
INSERT INTO `tbl_schools` VALUES (3102, 'Onkaparinga Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3103, 'Regency Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3104, 'Spencer Institute of TAFE', 35, 7);
INSERT INTO `tbl_schools` VALUES (3105, 'Torrens Valley Institute of TAFE', 35, 7);
INSERT INTO `tbl_schools` VALUES (3106, 'The Institute of TAFE Tasmania', 35, 7);
INSERT INTO `tbl_schools` VALUES (3107, 'Bendigo Regional Institute of TAFE', 35, 7);
INSERT INTO `tbl_schools` VALUES (3108, 'Central Gippsland Institute of TAFE', 35, 7);
INSERT INTO `tbl_schools` VALUES (3109, 'Chisholm Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3110, 'East Gippsland Institute of TAFE', 35, 7);
INSERT INTO `tbl_schools` VALUES (3111, 'Gordon Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3112, 'Goulburn Ovens Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3113, 'Holmesglen Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3114, 'Kangan Batman Institute of TAFE', 35, 7);
INSERT INTO `tbl_schools` VALUES (3115, 'Northern Melbourne Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3116, 'South West Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3117, 'Sunraysia Institute of TAFE', 35, 7);
INSERT INTO `tbl_schools` VALUES (3118, 'William Angliss Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3119, 'Wodonga Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3120, 'Central West College of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3121, 'Challenger TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3122, 'CY O''Connor College of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3123, 'Great Southern TAFE', 35, 7);
INSERT INTO `tbl_schools` VALUES (3124, 'Kimberley College of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3125, 'Pilbara TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3126, 'South West Regional College of TAFE', 35, 7);
INSERT INTO `tbl_schools` VALUES (3127, 'Swan TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3128, 'TAFE International Western Australia ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3129, 'West Coast College of TAFE', 35, 7);
INSERT INTO `tbl_schools` VALUES (3130, 'Central TAFE', 35, 7);
INSERT INTO `tbl_schools` VALUES (3131, 'The Meridian International Hotel School', 35, 7);
INSERT INTO `tbl_schools` VALUES (3132, 'William Blue School of Hospitality', 35, 7);
INSERT INTO `tbl_schools` VALUES (3133, 'Le Cordon Bleu Sydney ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3134, 'Cambridge International College', 35, 7);
INSERT INTO `tbl_schools` VALUES (3135, 'Southbank Institute of Technology', 35, 7);
INSERT INTO `tbl_schools` VALUES (3136, 'International College of Hotel Management ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3137, 'Academy of Information Technology', 35, 7);
INSERT INTO `tbl_schools` VALUES (3138, 'Victory Institute of Professional Training', 35, 7);
INSERT INTO `tbl_schools` VALUES (3139, 'Blue Mountains Hotel School ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3140, 'Australian Institute of Translation and Interpretation', 35, 7);
INSERT INTO `tbl_schools` VALUES (3141, 'Australian School of Tourism & Hotel Management ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3142, 'China Southern Western Australia Flying College ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3143, 'Le Cordon Bleu Australia', 35, 7);
INSERT INTO `tbl_schools` VALUES (3144, 'TK Melbourne', 35, 7);
INSERT INTO `tbl_schools` VALUES (3145, 'Australian International Conservatorium of Music', 35, 7);
INSERT INTO `tbl_schools` VALUES (3146, 'Hospitality Training Association Inc', 35, 7);
INSERT INTO `tbl_schools` VALUES (3147, 'Melbourne Institute of Business and Technology（MIBT）', 35, 7);
INSERT INTO `tbl_schools` VALUES (3148, 'taylors college', 35, 7);
INSERT INTO `tbl_schools` VALUES (3149, 'Australian National Institute of Business & Technology (ANIBT)', 35, 7);
INSERT INTO `tbl_schools` VALUES (3150, 'Australian Film Television and Radio School', 35, 7);
INSERT INTO `tbl_schools` VALUES (3151, 'Avondale College', 35, 7);
INSERT INTO `tbl_schools` VALUES (3152, 'Australian Defence Force Academy ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3153, 'Australian International Hotel School', 35, 7);
INSERT INTO `tbl_schools` VALUES (3154, 'Australian Maritime College ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3155, 'Curtin University of Technology(TAFE Division) ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3156, 'Gibaran Learning Group', 35, 7);
INSERT INTO `tbl_schools` VALUES (3157, 'Marcus Oldham College', 35, 7);
INSERT INTO `tbl_schools` VALUES (3158, 'Metropolitan South Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3159, 'National College of Business', 35, 7);
INSERT INTO `tbl_schools` VALUES (3160, 'National Institute of Dramatic Arts', 35, 7);
INSERT INTO `tbl_schools` VALUES (3161, 'RMIT University (TAFE Division) ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3162, 'SkillsTech Australia ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3163, 'Sunshine Coast Institute of TAFE ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3164, 'Swinburne University of Technology (TAFE Division) ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3165, 'The College of Law', 35, 7);
INSERT INTO `tbl_schools` VALUES (3166, 'The University of Melbourne Institute of Land and Food Resources (TAFE Division)', 35, 7);
INSERT INTO `tbl_schools` VALUES (3167, 'Top Education Institute', 35, 7);
INSERT INTO `tbl_schools` VALUES (3168, 'University of Ballarat (TAFE Division) ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3169, 'Victoria University (TAFE Division) ', 35, 7);
INSERT INTO `tbl_schools` VALUES (3170, 'Windsor Institute of Commerce & Languages', 35, 7);
INSERT INTO `tbl_schools` VALUES (3171, 'Université de la Méditerranée-Aix-Marseille 2', 35, 3);
INSERT INTO `tbl_schools` VALUES (3172, 'Ecole nationale supérieure d''architecture de Paris la Villette ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3173, 'Ecole Supérieure D''art Des Pyrenees Pau-Tarbes ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3174, 'Institut Français de la Mode', 35, 3);
INSERT INTO `tbl_schools` VALUES (3175, 'Université Victor Segalen-Bordeaux 2', 35, 3);
INSERT INTO `tbl_schools` VALUES (3176, 'Université d’Auvergne-Clermont-Ferrand 1', 35, 3);
INSERT INTO `tbl_schools` VALUES (3177, 'Université Blaise Pascal-Clermont-Ferrand 2', 35, 3);
INSERT INTO `tbl_schools` VALUES (3178, 'Université Joseph Fourier-Grenoble 1', 35, 3);
INSERT INTO `tbl_schools` VALUES (3179, 'Université Pierre Mendès France-Grenoble 2', 35, 3);
INSERT INTO `tbl_schools` VALUES (3180, 'Université des Sciences et Technologies de Lille-Lille 1', 35, 3);
INSERT INTO `tbl_schools` VALUES (3181, 'Université Claude Bernard-Lyon 1', 35, 3);
INSERT INTO `tbl_schools` VALUES (3182, 'Université Montpellier 2-Sciences et Techniques du Languedoc', 35, 3);
INSERT INTO `tbl_schools` VALUES (3183, 'Université Henri Poincaré-Nancy 1', 35, 3);
INSERT INTO `tbl_schools` VALUES (3184, 'Université de Nantes', 35, 3);
INSERT INTO `tbl_schools` VALUES (3185, 'Université d’Orléans', 35, 3);
INSERT INTO `tbl_schools` VALUES (3186, 'Université René Descartes-Paris 5', 35, 3);
INSERT INTO `tbl_schools` VALUES (3187, 'Université Pierre et Marie Curie-Paris 6', 35, 3);
INSERT INTO `tbl_schools` VALUES (3188, 'Université Paris Dauphine-Paris 9', 35, 3);
INSERT INTO `tbl_schools` VALUES (3189, 'Université de Paris-Sud-Paris 11', 35, 3);
INSERT INTO `tbl_schools` VALUES (3190, 'Université Paris 13-Paris-Nord', 35, 3);
INSERT INTO `tbl_schools` VALUES (3191, 'Université de Cergy-Pontoise', 35, 3);
INSERT INTO `tbl_schools` VALUES (3192, 'Université de Versailles Saint-Quentin-En-Yvelines', 35, 3);
INSERT INTO `tbl_schools` VALUES (3193, 'Université de Poitiers', 35, 3);
INSERT INTO `tbl_schools` VALUES (3194, 'Université de Rennes 1', 35, 3);
INSERT INTO `tbl_schools` VALUES (3195, 'Université de Rouen', 35, 3);
INSERT INTO `tbl_schools` VALUES (3196, 'Université Louis Pasteur-Strasbourg 1', 35, 3);
INSERT INTO `tbl_schools` VALUES (3197, 'Université Marc Bloch-Strasbourg 2', 35, 3);
INSERT INTO `tbl_schools` VALUES (3198, 'Université Toulouse 1 Sciences Sociales', 35, 3);
INSERT INTO `tbl_schools` VALUES (3199, 'Université Paul Sabatier-Toulouse 3', 35, 3);
INSERT INTO `tbl_schools` VALUES (3200, 'Université de Technologie de Belfort-Montbéliard', 35, 3);
INSERT INTO `tbl_schools` VALUES (3201, 'Université de Provence-Aix-Marseille 1', 35, 3);
INSERT INTO `tbl_schools` VALUES (3202, 'Université de Picardie Jules Verne', 35, 3);
INSERT INTO `tbl_schools` VALUES (3203, 'Université de Franche-Comté', 35, 3);
INSERT INTO `tbl_schools` VALUES (3204, 'Université de Droit, d''économie et des Sciences d''Aix-Marseille- Aix-Marseille 3', 35, 3);
INSERT INTO `tbl_schools` VALUES (3205, 'Université d’Avignon et des Pays de Vaucluse', 35, 3);
INSERT INTO `tbl_schools` VALUES (3206, 'Université d’Angers', 35, 3);
INSERT INTO `tbl_schools` VALUES (3207, 'Université Bordeaux 1', 35, 3);
INSERT INTO `tbl_schools` VALUES (3208, 'Université Michel de Montaigne-Bordeaux 3', 35, 3);
INSERT INTO `tbl_schools` VALUES (3209, 'Université de Bretagne Occidentale', 35, 3);
INSERT INTO `tbl_schools` VALUES (3210, 'Université de Caen Basse-Normandie', 35, 3);
INSERT INTO `tbl_schools` VALUES (3211, 'Université de Savoie-Chambéry-Annecy', 35, 3);
INSERT INTO `tbl_schools` VALUES (3212, 'Université de Technologie de Compiègne', 35, 3);
INSERT INTO `tbl_schools` VALUES (3213, 'Université de Corse Pascal Paoli', 35, 3);
INSERT INTO `tbl_schools` VALUES (3214, 'Université de Bourgogne', 35, 3);
INSERT INTO `tbl_schools` VALUES (3215, 'Université Stendhal-Grenoble 3', 35, 3);
INSERT INTO `tbl_schools` VALUES (3216, 'Institut National Polytechnique de Grenoble', 35, 3);
INSERT INTO `tbl_schools` VALUES (3217, 'Université de la Réunion', 35, 3);
INSERT INTO `tbl_schools` VALUES (3218, 'Université de la Rochelle', 35, 3);
INSERT INTO `tbl_schools` VALUES (3219, 'Université du Havre', 35, 3);
INSERT INTO `tbl_schools` VALUES (3220, 'Université du Maine', 35, 3);
INSERT INTO `tbl_schools` VALUES (3221, 'Université du Droit et de la Santé- Lille 2', 35, 3);
INSERT INTO `tbl_schools` VALUES (3222, 'Université Charles de Gaulle-Lille 3', 35, 3);
INSERT INTO `tbl_schools` VALUES (3223, 'Université d’Artois', 35, 3);
INSERT INTO `tbl_schools` VALUES (3224, 'Université du Littoral', 35, 3);
INSERT INTO `tbl_schools` VALUES (3225, 'Université de Limoges', 35, 3);
INSERT INTO `tbl_schools` VALUES (3226, 'Université de Bretagne-Sud', 35, 3);
INSERT INTO `tbl_schools` VALUES (3227, 'Université Jean Moulin-Lyon 3', 35, 3);
INSERT INTO `tbl_schools` VALUES (3228, 'Université de Metz', 35, 3);
INSERT INTO `tbl_schools` VALUES (3229, 'Université Montpellier 1', 35, 3);
INSERT INTO `tbl_schools` VALUES (3230, 'Université Paul Valéry-Montpellier 3', 35, 3);
INSERT INTO `tbl_schools` VALUES (3231, 'Univeristé de Haute-Alsace', 35, 3);
INSERT INTO `tbl_schools` VALUES (3232, 'Université Nancy 2', 35, 3);
INSERT INTO `tbl_schools` VALUES (3233, 'Université de Nice Sophia-Antipolis', 35, 3);
INSERT INTO `tbl_schools` VALUES (3234, 'Université Panthéon-Sorbonne-Paris 1', 35, 3);
INSERT INTO `tbl_schools` VALUES (3235, 'Université Panthéon-Assas ( Paris 2 ) Droit-Economie-Science Sociales', 35, 3);
INSERT INTO `tbl_schools` VALUES (3236, 'Université de la Sorbonne Nouvelle-Paris 3', 35, 3);
INSERT INTO `tbl_schools` VALUES (3237, 'Université Paris-Sorbonne-Paris 4', 35, 3);
INSERT INTO `tbl_schools` VALUES (3238, 'Université Paris 7 Denis Diderot', 35, 3);
INSERT INTO `tbl_schools` VALUES (3239, 'Université Vincennes-Saint-Denis-Paris 8', 35, 3);
INSERT INTO `tbl_schools` VALUES (3240, 'Université Paris 10', 35, 3);
INSERT INTO `tbl_schools` VALUES (3241, 'Université Paris-Val de Marne-Paris 12', 35, 3);
INSERT INTO `tbl_schools` VALUES (3242, 'Université de Dijon', 35, 3);
INSERT INTO `tbl_schools` VALUES (3243, 'Université de Marne-La-Vallée', 35, 3);
INSERT INTO `tbl_schools` VALUES (3244, 'Université de Pau et des Pays de l’Adour', 35, 3);
INSERT INTO `tbl_schools` VALUES (3245, 'Université de Perpignan', 35, 3);
INSERT INTO `tbl_schools` VALUES (3246, 'Université de Reims Champagne-Ardenne', 35, 3);
INSERT INTO `tbl_schools` VALUES (3247, 'Université Renne 2 Haute-Bretagne', 35, 3);
INSERT INTO `tbl_schools` VALUES (3248, 'Université de Saint-Etienne', 35, 3);
INSERT INTO `tbl_schools` VALUES (3249, 'Université Robert Schuman-Strasbourg 3', 35, 3);
INSERT INTO `tbl_schools` VALUES (3250, 'Université du Sud Toulon et Var', 35, 3);
INSERT INTO `tbl_schools` VALUES (3251, 'Université de Toulouse-Le Mirail-Toulouse 2', 35, 3);
INSERT INTO `tbl_schools` VALUES (3252, 'Institut National Polytechnique de Toulouse', 35, 3);
INSERT INTO `tbl_schools` VALUES (3253, 'Ecole Polytechnique', 35, 3);
INSERT INTO `tbl_schools` VALUES (3254, 'Université des Antilles et de la Guyane', 35, 3);
INSERT INTO `tbl_schools` VALUES (3255, 'Esmod Internatinal', 35, 3);
INSERT INTO `tbl_schools` VALUES (3256, 'Universite Montesquieu Bordeaux 4', 35, 3);
INSERT INTO `tbl_schools` VALUES (3257, 'Ecole Nationale Supérieure d''Architecture de Clermont-Ferrand', 35, 3);
INSERT INTO `tbl_schools` VALUES (3258, 'EDHEC', 35, 3);
INSERT INTO `tbl_schools` VALUES (3259, 'Télécom Bretagne', 35, 3);
INSERT INTO `tbl_schools` VALUES (3260, 'Université de Technologie de Troyes', 35, 3);
INSERT INTO `tbl_schools` VALUES (3261, 'Institut National des Sciences Appliquées de Lyon', 35, 3);
INSERT INTO `tbl_schools` VALUES (3262, 'Université de Savoie', 35, 3);
INSERT INTO `tbl_schools` VALUES (3263, 'HEC, School of management, Paris', 35, 3);
INSERT INTO `tbl_schools` VALUES (3264, 'Université de Tours', 35, 3);
INSERT INTO `tbl_schools` VALUES (3265, 'ESC Rennes', 35, 3);
INSERT INTO `tbl_schools` VALUES (3266, 'Institut National des Sciences Appliquées de Rouen', 35, 3);
INSERT INTO `tbl_schools` VALUES (3267, 'Ecole Normale de Musique de Paris  ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3268, 'Ecole Centrale de lyon', 35, 3);
INSERT INTO `tbl_schools` VALUES (3269, 'ESSEC Business School Paris', 35, 3);
INSERT INTO `tbl_schools` VALUES (3270, 'ENSAM', 35, 3);
INSERT INTO `tbl_schools` VALUES (3271, 'Conservatoire Libre du Cinéma Français', 35, 3);
INSERT INTO `tbl_schools` VALUES (3272, 'ESG-Paris Graduate School of Management', 35, 3);
INSERT INTO `tbl_schools` VALUES (3273, 'Ecole Nationale des Travaux Publics de l''Etat', 35, 3);
INSERT INTO `tbl_schools` VALUES (3274, 'ENSEA', 35, 3);
INSERT INTO `tbl_schools` VALUES (3275, 'Institut National Des Sciences Appliquee De Rennes', 35, 3);
INSERT INTO `tbl_schools` VALUES (3276, 'Ecole Supérieure d''Electricité', 35, 3);
INSERT INTO `tbl_schools` VALUES (3277, 'Institut Supérieur du Commerce de Paris', 35, 3);
INSERT INTO `tbl_schools` VALUES (3278, 'ESC Bretagne Brest', 35, 3);
INSERT INTO `tbl_schools` VALUES (3279, 'Université Jean Moulin Lyon3', 35, 3);
INSERT INTO `tbl_schools` VALUES (3280, 'Ecole Centrale de Lille', 35, 3);
INSERT INTO `tbl_schools` VALUES (3281, 'Université Catholique de Lyon', 35, 3);
INSERT INTO `tbl_schools` VALUES (3282, 'Conservatoire National de Saint-Etienne', 35, 3);
INSERT INTO `tbl_schools` VALUES (3283, 'Télécom Paristech ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3284, 'Ecole Centrale de Paris', 35, 3);
INSERT INTO `tbl_schools` VALUES (3285, 'Ecole Centrale de Marseille', 35, 3);
INSERT INTO `tbl_schools` VALUES (3286, 'Ecole Centrale de Nantes', 35, 3);
INSERT INTO `tbl_schools` VALUES (3287, 'Ecole Superieure de Physique et de Chimie industrielles de la ville de Paris', 35, 3);
INSERT INTO `tbl_schools` VALUES (3288, 'Ecole normale supérieure de Paris', 35, 3);
INSERT INTO `tbl_schools` VALUES (3289, 'Istituto Marangoni', 35, 3);
INSERT INTO `tbl_schools` VALUES (3290, 'Institut d''Optique Graduate School', 35, 3);
INSERT INTO `tbl_schools` VALUES (3291, 'Conservatoire national de région de perpignan', 35, 3);
INSERT INTO `tbl_schools` VALUES (3292, 'école nationale d''ingénieurs de brest', 35, 3);
INSERT INTO `tbl_schools` VALUES (3293, 'Institution Saint Louis', 35, 3);
INSERT INTO `tbl_schools` VALUES (3294, 'Reims Management School', 35, 3);
INSERT INTO `tbl_schools` VALUES (3295, 'ESC BORDEAUX', 35, 3);
INSERT INTO `tbl_schools` VALUES (3296, 'Conservatoire National Rejion De Paris', 35, 3);
INSERT INTO `tbl_schools` VALUES (3297, 'ENSMA', 35, 3);
INSERT INTO `tbl_schools` VALUES (3298, 'Audencia Nantes', 35, 3);
INSERT INTO `tbl_schools` VALUES (3299, 'Ecole Supérieure de Commerce de Lille', 35, 3);
INSERT INTO `tbl_schools` VALUES (3300, 'Ecole Supérieure des Techniques Aéronautiques et de Construction Automobile', 35, 3);
INSERT INTO `tbl_schools` VALUES (3301, 'ENSAV', 35, 3);
INSERT INTO `tbl_schools` VALUES (3302, 'ENSEIRB', 35, 3);
INSERT INTO `tbl_schools` VALUES (3303, 'Supméca Paris', 35, 3);
INSERT INTO `tbl_schools` VALUES (3304, 'Sciences Po Paris', 35, 3);
INSERT INTO `tbl_schools` VALUES (3305, 'Grenoble Ecole de Management', 35, 3);
INSERT INTO `tbl_schools` VALUES (3306, 'Bordeaux Ecole de Management', 35, 3);
INSERT INTO `tbl_schools` VALUES (3307, 'Le Cordon Bleu de Paris', 35, 3);
INSERT INTO `tbl_schools` VALUES (3308, 'Institut National Polytechnique de Lorraine', 35, 3);
INSERT INTO `tbl_schools` VALUES (3309, 'Ecole de commerce ESC Rouen', 35, 3);
INSERT INTO `tbl_schools` VALUES (3310, 'Ecole National Supérieure des Arts et Industries Textiles', 35, 3);
INSERT INTO `tbl_schools` VALUES (3311, 'Ecole Nationale Supérieure de Chimie de Montpellier', 35, 3);
INSERT INTO `tbl_schools` VALUES (3312, 'Ecole Nationale Supérieure du Pétrole et des Moteurs', 35, 3);
INSERT INTO `tbl_schools` VALUES (3313, 'Ecole Privée Commerce&Comtabilité', 35, 3);
INSERT INTO `tbl_schools` VALUES (3314, 'École Supérieure d’Ingénieurs en Électronique et Électrotechnique', 35, 3);
INSERT INTO `tbl_schools` VALUES (3315, 'EM Lyon', 35, 3);
INSERT INTO `tbl_schools` VALUES (3316, 'EMLYON Business School', 35, 3);
INSERT INTO `tbl_schools` VALUES (3317, 'ESCP-EAP European School of Management', 35, 3);
INSERT INTO `tbl_schools` VALUES (3318, 'Euromed Marseille Ecole de Management', 35, 3);
INSERT INTO `tbl_schools` VALUES (3319, 'INSEAD', 35, 3);
INSERT INTO `tbl_schools` VALUES (3320, 'INSEEC Business School', 35, 3);
INSERT INTO `tbl_schools` VALUES (3321, 'Institut Vatel Ecole Supérieure de Commerce et Gestion Hôtellerie et Tourisme ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3322, 'SUPINFO International University', 35, 3);
INSERT INTO `tbl_schools` VALUES (3323, 'Vatel International Business School', 35, 3);
INSERT INTO `tbl_schools` VALUES (3324, 'École nationale supérieure des beaux-arts', 35, 3);
INSERT INTO `tbl_schools` VALUES (3325, 'ES-Lille', 35, 3);
INSERT INTO `tbl_schools` VALUES (3326, 'AgroParisTech', 35, 3);
INSERT INTO `tbl_schools` VALUES (3327, 'ESIEE-Amiens', 35, 3);
INSERT INTO `tbl_schools` VALUES (3328, 'ESIGELEC Rouen', 35, 3);
INSERT INTO `tbl_schools` VALUES (3329, 'Conservatoire National de Région de Marseille', 35, 3);
INSERT INTO `tbl_schools` VALUES (3330, 'Ecole Nationale Supérieure de Techniques Avancées', 35, 3);
INSERT INTO `tbl_schools` VALUES (3331, 'Ecole Supérieure des Beaux-Arts d''Angers', 35, 3);
INSERT INTO `tbl_schools` VALUES (3332, 'École d''architecture de Paris Val-de-Seine', 35, 3);
INSERT INTO `tbl_schools` VALUES (3333, 'Ecole d''Ingenieurs des Mines de Douai', 35, 3);
INSERT INTO `tbl_schools` VALUES (3334, 'Ecole Nationale Supérieure de Mécanique et des Microtechniques - Besançon', 35, 3);
INSERT INTO `tbl_schools` VALUES (3335, 'École Nationale Supérieure des Mines de St-Étienne', 35, 3);
INSERT INTO `tbl_schools` VALUES (3336, 'École nationale supérieure d''informatique pour l''industrie et l''entreprise', 35, 3);
INSERT INTO `tbl_schools` VALUES (3337, 'Ecole Nationale Supérieure d''Ingénieurs de Limoges', 35, 3);
INSERT INTO `tbl_schools` VALUES (3338, 'École Supérieure d’Ingénieurs en Génie Électrique', 35, 3);
INSERT INTO `tbl_schools` VALUES (3339, 'Ecole Supérieure de Commerce de Troyes', 35, 3);
INSERT INTO `tbl_schools` VALUES (3340, 'Institut Commercial de Nancy', 35, 3);
INSERT INTO `tbl_schools` VALUES (3341, 'Mod''Art International', 35, 3);
INSERT INTO `tbl_schools` VALUES (3342, 'Ecole Française d''Electronique et d''Informatique', 35, 3);
INSERT INTO `tbl_schools` VALUES (3343, 'Université d''Evry', 35, 3);
INSERT INTO `tbl_schools` VALUES (3344, 'Conservatoire National des Arts et Metiers', 35, 3);
INSERT INTO `tbl_schools` VALUES (3345, 'école internationale TUNON de Paris', 35, 3);
INSERT INTO `tbl_schools` VALUES (3346, 'ISAM-Amiens', 35, 3);
INSERT INTO `tbl_schools` VALUES (3347, 'Télécom SudParis', 35, 3);
INSERT INTO `tbl_schools` VALUES (3348, 'sup de co la rochelle', 35, 3);
INSERT INTO `tbl_schools` VALUES (3349, 'Ecole Grandjean', 35, 3);
INSERT INTO `tbl_schools` VALUES (3350, 'CERAM Business School', 35, 3);
INSERT INTO `tbl_schools` VALUES (3351, 'Conservatoire à rayonnement régional d''Aubervilliers-La Courneuve', 35, 3);
INSERT INTO `tbl_schools` VALUES (3352, 'le Cours Florent', 35, 3);
INSERT INTO `tbl_schools` VALUES (3353, 'TELECOM Ssint Etienne', 35, 3);
INSERT INTO `tbl_schools` VALUES (3354, 'Université Catholique de l''Ouest', 35, 3);
INSERT INTO `tbl_schools` VALUES (3355, 'Ecole nationale supérieure de chimie de Paris', 35, 3);
INSERT INTO `tbl_schools` VALUES (3356, 'Ecole des Ponts ParisTech', 35, 3);
INSERT INTO `tbl_schools` VALUES (3357, 'Ecole Nationale Supérieure de Chimie de Clermont-Ferrand', 35, 3);
INSERT INTO `tbl_schools` VALUES (3358, 'Ecole Supérieure de Réalisation Audiovisuelle', 35, 3);
INSERT INTO `tbl_schools` VALUES (3359, 'Université de Valenciennes et du hainaut cambresis', 35, 3);
INSERT INTO `tbl_schools` VALUES (3360, 'Ecole Normale supérieure de Lyon', 35, 3);
INSERT INTO `tbl_schools` VALUES (3361, 'creapole', 35, 3);
INSERT INTO `tbl_schools` VALUES (3362, 'Télécom & Management SudParis', 35, 3);
INSERT INTO `tbl_schools` VALUES (3363, 'Ecole des Métiers du Cinéma d''Animation', 35, 3);
INSERT INTO `tbl_schools` VALUES (3364, 'Ecole Spéciale des Travaux Publics', 35, 3);
INSERT INTO `tbl_schools` VALUES (3365, 'Conservatoire National de Région de Besançon', 35, 3);
INSERT INTO `tbl_schools` VALUES (3366, 'Ecole de Management de Normandie', 35, 3);
INSERT INTO `tbl_schools` VALUES (3367, 'École Nationale Supérieure des Mines de Paris', 35, 3);
INSERT INTO `tbl_schools` VALUES (3368, 'Ecole Nationale de l''Aviation Civile', 35, 3);
INSERT INTO `tbl_schools` VALUES (3369, 'Ecole supérieure des arts décoratifs de Strasbourg', 35, 3);
INSERT INTO `tbl_schools` VALUES (3370, ' IPAG Paris Bussiness School', 35, 3);
INSERT INTO `tbl_schools` VALUES (3371, '卢瓦尔工程师学校(隶属于图尔大学)', 35, 3);
INSERT INTO `tbl_schools` VALUES (3372, '船舶学校(布雷斯特)', 35, 3);
INSERT INTO `tbl_schools` VALUES (3373, '国立气象学校(图卢兹)', 35, 3);
INSERT INTO `tbl_schools` VALUES (3374, '国立高等工业技术工程工程师学校(波城大学)', 35, 3);
INSERT INTO `tbl_schools` VALUES (3375, '科学经济与管理学院(里尔)', 35, 3);
INSERT INTO `tbl_schools` VALUES (3376, '波尔多高等生物分子技术学校(隶属于波尔多二大)', 35, 3);
INSERT INTO `tbl_schools` VALUES (3377, '计算机工程学院(里摩日)', 35, 3);
INSERT INTO `tbl_schools` VALUES (3378, '克莱蒙费朗工程师学校(隶属于克莱蒙费朗二大)', 35, 3);
INSERT INTO `tbl_schools` VALUES (3379, '模型化信息技术及其应用高等学院(克莱蒙费朗)', 35, 3);
INSERT INTO `tbl_schools` VALUES (3380, 'ACI Negocia： Académie commercialeInternationale ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3381, 'ADVANCIA：Ecole commerciale de la chambre de commerceEt d’industrie de Paris ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3382, 'Centre d’Etudes Supérieures Industrielles', 35, 3);
INSERT INTO `tbl_schools` VALUES (3383, 'CFJ： Centre de formation des journalistes ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3384, 'DESIGN Nantes：Ecole de design de Nantes-Atlantique ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3385, 'EAC Nantes-Saint-Nazaire：Ecole atlantique de commerceEt de gestion ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3386, 'EAN:Ecole d''architecture de Nancy ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3387, 'Ecole Catholique d''ArtsEt Métiers de Lyon ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3388, 'Ecole Centrale d''Electronique', 35, 3);
INSERT INTO `tbl_schools` VALUES (3389, 'Ecole d’Ingénieurs de l’Université de Caen ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3390, 'Ecole de gestionEt de commerce d’Angoulême ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3391, 'Ecole de gestionEt de commerce de la Réunion ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3392, 'Ecole de gestionEt de commerce de Montauban ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3393, 'Ecole de gestionEt de commerce de Rodez ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3394, 'École des hautesÉtudesEn sciences sociales ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3395, 'Ecole des Métiers de l''Environnement ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3396, 'Ecole França de papeterieEt des industries graphique ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3397, 'Ecole Louis de Broglie ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3398, 'École nationale des pontsEt chaussées ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3399, 'Ecole Nationale Supérieure agronomique de Toulouse ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3400, 'Ecole Nationale Supérieure d’agronomieEt des industries alimentaires ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3401, 'Ecole Nationale Supérieure d’électricitéEt de mécanique de Nancy ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3402, 'Ecole Nationale Supérieure d’électrotechnique', 35, 3);
INSERT INTO `tbl_schools` VALUES (3403, 'Ecole Nationale Supérieure de génie industriel de Grenoble ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3404, 'Ecole Nationale Supérieure de géologie ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3405, 'Ecole Nationale Supérieure de physique de Grenoble ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3406, 'Ecole Nationale Supérieure des industries chimiques ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3407, 'Ecole Nationale Supérieure des ingénieursEn arts chimiquesEt technologiques ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3408, 'École nationale supérieure des sciences de l''informationEt des bibliothèques ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3409, 'Ecole Nationale SupérieureEn génie des systèmes industriels ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3410, 'Ecole Normale Superieure', 35, 3);
INSERT INTO `tbl_schools` VALUES (3411, 'Ecole Polytechnique de l’Université Grenoble 1 ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3412, 'École polytechnique de l''université de Tours ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3413, 'École polytechnique universitaire de Montpellier', 35, 3);
INSERT INTO `tbl_schools` VALUES (3414, 'Ecole Supérieure d’Ingénieurs de RechercheEn Matériaux de l’Université de Dijon ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3415, 'Ecole Supérieure d’ingénieursEn systèmes industriels avancés Rhone-Alpes ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3416, 'Ecole Superieure De Chimie', 35, 3);
INSERT INTO `tbl_schools` VALUES (3417, 'Ecole Supérieure d''Ingénieurs des Travaux de la Construction de Cachan ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3418, 'Ecole Supérieure d''Ingénieurs pour l''Agriculture ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3419, 'EcoleEuropéenne d’ingénieursEn génie des matériaux ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3420, 'EDC：Ecole des dirigeantsEt créateurs d’entreprise ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3421, 'EGC Avignon:Ecole de gestionEt de commerce d’Avignon ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3422, 'EGC Bayonne：Ecole de gestionEt de commerce de Bayonne ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3423, 'EGC Brive：Ecole de gestionEt de commerce de Brive ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3424, 'EGC du Maine：Ecole de gestionEt de commerce du Maine ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3425, 'EGC Franche-Comté:Ecole de gestionEt de commerce de Franche-Comté ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3426, 'EGC Lille：Ecole de gestionEt de commerce de Lille-Métropole ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3427, 'EGC Orléans：Ecole de gestionEt de commerce d’Orléans ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3428, 'EGC Vendée：Ecole de gestionEt de commerce de Vendée ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3429, 'EGIM:Ecole Generaliste D’Ingenieurs De Marseille ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3430, 'EISTI:Ecole internationale des sciences du traitement de l''information ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3431, 'EIVL:Ecole D’Ingenieurs Du Val De Loire ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3432, 'EIVP：Ecole des ingénieurs de la Ville de Paris ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3433, 'EIVP:Ecole supérieure de Génie Urbain de Paris ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3434, 'EMA:Ecole Des Mines D’Ales ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3435, 'EMD:Ecole Des Mines De Douai ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3436, 'EN:Ecole navale ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3437, 'ENA:Ecole nationale d''administration ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3438, 'ENC:Ecole Nationale Des Chartes ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3439, 'ENESAD:Etablissement National d’Enseignement Supérieur Agronomique de Dijon ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3440, 'ENGEES:Ecole nationale du génie de l’eauEt de l’environnement de strasbourg ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3441, 'ENGREF:Ecole nationale du génie rural desEauxEt des forêts ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3442, 'ENI Metz:Ecole nationale d''ingénieurs de Metz ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3443, 'ENI SaintEtienne:Ecole Nationale d''Ingénieurs de Saint-Etienne ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3444, 'ENI Tarbes:Ecole nationale d''ingénieurs de Tarbes ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3445, 'ENIHP (Ecole Nationale d''Ingénieurs de l''HorticultureEt du Paysage) ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3446, 'ENITA:Ecole nationale d’ingénieurs des travaux agricoles de Bordeaux ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3447, 'ENM:École Nationale de la Magistrature ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3448, 'ENM:Ecole nationale de la météorologie ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3449, 'ENSA Montpellier:Ecole nationale supérieure agronomique de Montpellier ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3450, 'ENSAE:Ecole nationale de la statistiqueEt de l''administrationÉconomique ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3451, 'ENSAI:Ecole nationale de la statistiqueEt de l''analyse de l''information ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3452, 'ENSAIT:Ecole Nationale Supérieure des ArtsEt Industries Textiles(Roubaix) ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3453, 'ENSC Lille:Ecole nationalesupérieure de chimie de Lille ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3454, 'ENSC Mulhouse:Ecole nationale supérieure de chimie de Mulhouse ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3455, 'ENSC Rennes:Ecole nationale supérieure de chimie de Rennes ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3456, 'ENSCI Paris:Ecole nationale supérieure de création industrielle ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3457, 'ENSCI:Ecole nationale supérieure de céramique industrielle ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3458, 'ENSCP Bordeaux:Ecole Nationale Supérieure de ChimieEt de Physique de Bordeaux ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3459, 'ENSG:Ecole Nationale Supérieure de Géologie(NANCY) ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3460, 'ENSG-GEO:Ecole nationale des sciences géographiques (MARNE-LA-VALLEE) ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3461, 'ENSHAP (Ecole Nationale Supérieure d''HorticultureEt d''Aménagement du Paysage) ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3462, 'ENSI BOURGES:Ecole nationale supérieure d’ingénieurs de Bourges ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3463, 'ENSIA:Ecole nationale supérieure des industries agricolesEt alimentaires(Massy) ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3464, 'ENSIAME:Ecole Nationale Superieure D’IngenieursEn Informatique', 35, 3);
INSERT INTO `tbl_schools` VALUES (3465, 'ENSICA：Ecole nationale supérieure d''ingénieurs de constructions aéronautiques ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3466, 'ENSICAEN：Ecole nationale supérieure d’ingénieurs de Caen ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3467, 'ENSIM：Ecole Nationale Superieure D''ingenieurs Du Mans ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3468, 'ENSM Nancy：Ecole Nationale Supérieure des Mines de Nancy ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3469, 'ENSM Saint-Etienne：Ecole Des Mines De Saint-Etienne ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3470, 'ENSNP：Ecole nationale supérieure de la natureEt du paysasge ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3471, 'ENSP：Ecole nationale de la santé publique ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3472, 'ENST BRETAGNE：Ecole nationale supérieure des télécommunications de Bretagne ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3473, 'ENTPE：Ecole Nationale des Travaux Publics de l’Etat ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3474, 'ENV Alfort：Ecole nationale vétérinaire d’Alfort ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3475, 'ENV LYON：Ecole nationale vétérinaire de Lyon ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3476, 'ENV Nantes：Ecole nationale vétérinarie de Nantes ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3477, 'ENV Toulouse：Ecole nationale vétérinaire de Toulouse ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3478, 'EPF：Ecole Polytechnique Feminine ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3479, 'EPHE:ECOLE PRATIQUE DES HAUTESETUDES', 35, 3);
INSERT INTO `tbl_schools` VALUES (3480, 'EPSCI：Ecole des praticiens du commerce international ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3481, 'ESA：Ecole spéciale d’architecture ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3482, 'ESA：Ecole Superieure D’Agriculture D’Angers ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3483, 'ESAG：Ecole supérieureEt d''application du génie ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3484, 'ESAP：Ecole Superieure D’Agriculture De Purpan ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3485, 'ESAT：Ecole supérieureEt d’application des transmissions ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3486, 'ESB：Ecole supérieur du bois ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3487, 'ESC AMIENS PICARDIE:Ecole supérieure de commerce Amiens Picardie ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3488, 'ESC CHAMBERY:Ecole supérieure de commerce de Chambéry ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3489, 'ESC CLERMONT:Ecole supérieure de commerce de Clermont-Ferrand ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3490, 'ESC Compiègne:Ecole supérieure de commerce de Compiègne ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3491, 'ESC DIJON:Ecole supérieure de commerce de Dijon-Bourgogne ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3492, 'ESC GRENOBLE: GroupeEcole supérieure de commerce de Grenoble ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3493, 'ESC LA ROCHELLE:Ecole supérieure de commerce de La Rochelle ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3494, 'ESC Montpellier:Ecole supérieure de commerce de Montpellier ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3495, 'ESC PAU:Ecole supérieure de commerce de Pau ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3496, 'ESC Toulouse:Ecole supérieure de commerce de Toulouse ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3497, 'ESCE:Ecole supérieure du commerceExtérieur ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3498, 'ESCP-EAP:Ecole supérieure de commerce de Paris-Ecole des Affaire de Paris ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3499, 'ESDES Lyon：Ecole supérieure pour le développementÉconomiqueEt social de Lyon ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3500, 'ESEG:Institut d’économie scientifiqueEt de gestion ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3501, 'ESGT：Ecole supérieur des géomètresEt topographes ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3502, 'ESIEA：Ecole Superieure D’Informatique-Electronique-Automatique ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3503, 'ESIP：Ecole Superieure D’Ingenieurs De Poitiers ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3504, 'ESJ：Ecole supérieure de journalisme de Lille ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3505, 'ESM Saint-Cyr：Ecole spéciale militaire de Saint-Cyr ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3506, 'ESM：Ecole supérieure de métrologie ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3507, 'ESME：Ecole Speciale De MecaniqueEt D’Electricite', 35, 3);
INSERT INTO `tbl_schools` VALUES (3508, 'ESMISAB： BrestEcole Superieure De MicrobiologieEt Securite Alimentaire De Brest ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3509, 'ESPCI：Ecole supérieure de physiqueEt de chimie industrielle de la Ville de Paris', 35, 3);
INSERT INTO `tbl_schools` VALUES (3510, 'ESSA de Lyon-Bron：Ecole du Service de santé des armées de Lyon-Bron ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3511, 'ESSA：Ecole du Service de santé des armées de Bordeaux ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3512, 'ESSEC:Ecole supérieure des sciencesÉconomiquesEt commerciales ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3513, 'ESTA Belfort：Ecole supérieure des technologies des affaires de Belfort ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3514, 'ESTBB：Ecole Superieure De Technologie Des Biomolecules De Bordeaux ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3515, 'ETSUP：Ecole supérieure de travail social ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3516, 'GROUPEESC NORMANDIE(LE HAVRE-CAEN) ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3517, 'GROUPEESC SAINT-ETIENNE:Ecole supérieure de commerce de Saint-Etienne ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3518, 'HEC:Ecole des hautesÉtudes commerciales ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3519, 'HEI：Ecole des HautesEtudes d''Ingénieur ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3520, 'ICD:Institut international de commerceEt de distribution de Paris ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3521, 'ICI Negocia:Institut de commerce international ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3522, 'IDRAC Lyon:Institut de rechercheEt d’action commerciale ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3523, 'IECG:InstitutEuropéen de commerceEt de gestion de la Rochelle ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3524, 'IECS STRASBOUG:InstitutEuropéen d’études commerciales supérieures ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3525, 'IEP RENNES:Institut D’Etudes Politiques De Rennes ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3526, 'IEP TOULOUSE:Institut D’Etudes Politiques(Iep)De Toulouse ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3527, 'IESEG Lille:Institut d’économie scientifiqueEt de gestion ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3528, 'IFFI:Institut França du Froid IndustrielEt du Génie climatique ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3529, 'IFI Rouen:Institut de formation internationale ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3530, 'IFMA:Institut França de Mécanique Avancée ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3531, 'IGAL:Institut géologique Albert de Lapparent ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3532, 'IIE:Institut d’informatique d’entreprise ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3533, 'INALCO:Institut National Des LanguesEt Civilisation Orientales ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3534, 'INH:Institut national d''horticulture ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3535, 'INP Grenoble Institut National Polytechnique de Grenoble ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3536, 'INP Lorraine:Institut national polytechnique de Lorraine ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3537, 'INSA DE TOULOUSE:Institut National des Sciences Appliquées de Toulouse ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3538, 'Institut d’ingénièrie informatique de Limoges ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3539, 'Institut Supérieur d’Informatique', 35, 3);
INSERT INTO `tbl_schools` VALUES (3540, 'Institut Supérieur d’Ingénieurs de Franche-Comté de l’Université de Besançon ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3541, 'Institut supérieur d’interprétationEt de traduction ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3542, 'Institut Supérieur de l''ElectroniqueEt du Numérique de Lille ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3543, 'Institut Supérieur de l''ElectroniqueEt du Numérique de Toulon ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3544, 'Institut Supérieur d''Electronique du Nord', 35, 3);
INSERT INTO `tbl_schools` VALUES (3545, 'Institut TextileEt Chimique de Lyon ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3546, 'Institut Universitaire de Formation des Maitres Aix-Marseille', 35, 3);
INSERT INTO `tbl_schools` VALUES (3547, 'Institut Universitaire de Formation des Maitres Alsace', 35, 3);
INSERT INTO `tbl_schools` VALUES (3548, 'Institut Universitaire de Formation des Maitres Basse-Normandie', 35, 3);
INSERT INTO `tbl_schools` VALUES (3549, 'Institut Universitaire de Formation des Maitres de Grenoble', 35, 3);
INSERT INTO `tbl_schools` VALUES (3550, 'Institut Universitaire de Formation des Maitres de la Reunion', 35, 3);
INSERT INTO `tbl_schools` VALUES (3551, 'Institut Universitaire de Formation des Maitres de l''Académie de Creteil', 35, 3);
INSERT INTO `tbl_schools` VALUES (3552, 'Institut Universitaire de Formation des Maitres Nord Pas de Calais', 35, 3);
INSERT INTO `tbl_schools` VALUES (3553, 'INSTN:Institut national des sciencesEt techniques Nucléaires ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3554, 'International Space University', 35, 3);
INSERT INTO `tbl_schools` VALUES (3555, 'IPGP:Institut De Physique Du Globe De Paris ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3556, 'IPJ:Institut pratique de journalisme ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3557, 'ISA:Institut Superieur D’Agriculture De Lille ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3558, 'ISAB:Institut Superieur D’Agriculture De Beauvais ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3559, 'ISAM:Institut supérieur d’administrationEt de management ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3560, 'ISARA:Institut Superieur D’Agriculture Rhone-Alpes ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3561, 'ISCID:Institut supérieur de commerce international de Dunkerque ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3562, 'ISG Paris:Institut supérieur de gestion ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3563, 'ISIMA:Institut Superieur D’Informatique De ModelisationEt De Leurs Applications ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3564, 'ISMANS:Institut supérieur des matériaux du Mans ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3565, 'ISMCM:Institut supérieur des matériauxEt de la construction mécanique ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3566, 'ISPA:Institut supérieur des productions animales ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3567, 'ISPP Rouen:Institut supérieur de préparations professionnelles de Rouen ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3568, 'ISTEC Paris:Institut supérieur des sciences', 35, 3);
INSERT INTO `tbl_schools` VALUES (3569, 'ISTIL:Institut Des SciencesEt Techniques De L’Ingenieur De Lyon ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3570, 'ISTM Cité Descartes:Institut supérieur de technologieEt management ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3571, 'L’IUFM de l’académie de Paris', 35, 3);
INSERT INTO `tbl_schools` VALUES (3572, 'LettresEt sciences humainesEcole Normale Supérieure LettresEt Sciences Humaines ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3573, 'Pole Universitaire Leonard de Vinci', 35, 3);
INSERT INTO `tbl_schools` VALUES (3574, 'SUPAERO：Ecole Nationale SupErieure De L''aEronautiqueEt De L''espace ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3575, 'SupOptique：Ecole Supérieure D''optique ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3576, 'Télécom INP Grenoble ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3577, 'TELECOM INT:Institut national des télécommunications ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3578, 'Université Aix-Marseille IIEcole Supérieure d’Ingénieur de Luminy ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3579, 'Université Blaise Pascal： Clermont-Ferrand 2 ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3580, 'Université de Caen Basse：Normandie ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3581, 'Université de Chambéry', 35, 3);
INSERT INTO `tbl_schools` VALUES (3582, 'Université de la Nouvelle-Calédonie ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3583, 'Université de la Polynésie França ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3584, 'UTBM:Universite De Technologie De Belfort-Montbeliard ', 35, 3);
INSERT INTO `tbl_schools` VALUES (3585, 'National University of Singapore', 35, 11);
INSERT INTO `tbl_schools` VALUES (3586, 'Nanyang Technological University', 35, 11);
INSERT INTO `tbl_schools` VALUES (3587, 'Singapore Management University', 35, 11);
INSERT INTO `tbl_schools` VALUES (3588, 'Singapore Polytechnic', 35, 11);
INSERT INTO `tbl_schools` VALUES (3589, 'NanYang Polytechnic', 35, 11);
INSERT INTO `tbl_schools` VALUES (3590, 'Temasek Polytechnic', 35, 11);
INSERT INTO `tbl_schools` VALUES (3591, 'Ngee Ann Polytechnic', 35, 11);
INSERT INTO `tbl_schools` VALUES (3592, 'Republic Polytechnic', 35, 11);
INSERT INTO `tbl_schools` VALUES (3593, 'Singapore International Hotel and Tourism College', 35, 11);
INSERT INTO `tbl_schools` VALUES (3594, 'Lasalle College of the Arts', 35, 11);
INSERT INTO `tbl_schools` VALUES (3595, 'Management Development Insitiute Of Singapore', 35, 11);
INSERT INTO `tbl_schools` VALUES (3596, 'Singapore Institute Of Management', 35, 11);
INSERT INTO `tbl_schools` VALUES (3597, 'Nanyang Academy of Fine Arts', 35, 11);
INSERT INTO `tbl_schools` VALUES (3598, 'Singapore Institute of Materials Management', 35, 11);
INSERT INTO `tbl_schools` VALUES (3599, 'Informatics Institute of Singapore', 35, 11);
INSERT INTO `tbl_schools` VALUES (3600, 'Stansfield College', 35, 11);
INSERT INTO `tbl_schools` VALUES (3601, 'Shelton College International Singapore', 35, 11);
INSERT INTO `tbl_schools` VALUES (3602, 'Singapore Accountancy Academy', 35, 11);
INSERT INTO `tbl_schools` VALUES (3603, 'EASB Institute of Management', 35, 11);
INSERT INTO `tbl_schools` VALUES (3604, 'Kaplan-Asia Pacific Management Institute Of Singapore', 35, 11);
INSERT INTO `tbl_schools` VALUES (3605, 'Kaplan Financial', 35, 11);
INSERT INTO `tbl_schools` VALUES (3606, 'Dimensions Education Group', 35, 11);
INSERT INTO `tbl_schools` VALUES (3607, 'PSB Academy', 35, 11);
INSERT INTO `tbl_schools` VALUES (3608, 'Raffles Design Institute of Singapore', 35, 11);
INSERT INTO `tbl_schools` VALUES (3609, 'Singapore Raffles Music College', 35, 11);
INSERT INTO `tbl_schools` VALUES (3610, 'Nanyang Institute of Management', 35, 11);
INSERT INTO `tbl_schools` VALUES (3611, 'University of New Brunswick Singapore Campus', 35, 11);
INSERT INTO `tbl_schools` VALUES (3612, 'ERC Institute', 35, 11);
INSERT INTO `tbl_schools` VALUES (3613, 'Singapore University of Technology and Design', 35, 11);
INSERT INTO `tbl_schools` VALUES (3614, 'Auckland University of Technology', 35, 16);
INSERT INTO `tbl_schools` VALUES (3615, 'Lincoln University', 35, 16);
INSERT INTO `tbl_schools` VALUES (3616, 'Massey University', 35, 16);
INSERT INTO `tbl_schools` VALUES (3617, 'Unitec Institute of Technology', 35, 16);
INSERT INTO `tbl_schools` VALUES (3618, 'University of Auckland', 35, 16);
INSERT INTO `tbl_schools` VALUES (3619, 'University of Canterbury', 35, 16);
INSERT INTO `tbl_schools` VALUES (3620, 'University of Otago', 35, 16);
INSERT INTO `tbl_schools` VALUES (3621, 'University of Waikato', 35, 16);
INSERT INTO `tbl_schools` VALUES (3622, 'Victoria University of Wellington', 35, 16);
INSERT INTO `tbl_schools` VALUES (3623, 'Waikato Institute of Technology', 35, 16);
INSERT INTO `tbl_schools` VALUES (3624, 'Manukau Institute of Technology', 35, 16);
INSERT INTO `tbl_schools` VALUES (3625, 'New Zealand Academy of Studies', 35, 16);
INSERT INTO `tbl_schools` VALUES (3626, 'Christchurch Polytechnic Institute of Technology', 35, 16);
INSERT INTO `tbl_schools` VALUES (3627, 'Waiariki Institute of Technology', 35, 16);
INSERT INTO `tbl_schools` VALUES (3628, 'Whitireia Community Polytechnic', 35, 16);
INSERT INTO `tbl_schools` VALUES (3629, 'North Shore International Academy', 35, 16);
INSERT INTO `tbl_schools` VALUES (3630, 'Auckland Institute of Studies at St Helens', 35, 16);
INSERT INTO `tbl_schools` VALUES (3631, 'International College of Linguistics', 35, 16);
INSERT INTO `tbl_schools` VALUES (3632, 'Design and Arts College', 35, 16);
INSERT INTO `tbl_schools` VALUES (3633, 'Queens Academic Group', 35, 16);
INSERT INTO `tbl_schools` VALUES (3634, 'Nelson Marlborough Institute of Technology', 35, 16);
INSERT INTO `tbl_schools` VALUES (3635, 'New Zealand Tertiary College', 35, 16);
INSERT INTO `tbl_schools` VALUES (3636, 'Academy New Zealand', 35, 16);
INSERT INTO `tbl_schools` VALUES (3637, 'Pacific International Hotel Management School', 35, 16);
INSERT INTO `tbl_schools` VALUES (3638, 'Auckland univercity of Technolege', 35, 16);
INSERT INTO `tbl_schools` VALUES (3639, 'natcoll design technology', 35, 16);
INSERT INTO `tbl_schools` VALUES (3640, 'Aoraki Polytechnic (Timaru) ', 35, 16);
INSERT INTO `tbl_schools` VALUES (3641, 'Bay of Plenty Polytechnic (Tauranga)', 35, 16);
INSERT INTO `tbl_schools` VALUES (3642, 'Eastern Institute of Technology (Hawkes Bay)', 35, 16);
INSERT INTO `tbl_schools` VALUES (3643, 'Gilligan Business School', 35, 16);
INSERT INTO `tbl_schools` VALUES (3644, 'International Pacific College', 35, 16);
INSERT INTO `tbl_schools` VALUES (3645, 'New Zealand College of Chiropractic ', 35, 16);
INSERT INTO `tbl_schools` VALUES (3646, 'New Zealand Institute of Management', 35, 16);
INSERT INTO `tbl_schools` VALUES (3647, 'Northland Polytechnic', 35, 16);
INSERT INTO `tbl_schools` VALUES (3648, 'Otago Polytechnic', 35, 16);
INSERT INTO `tbl_schools` VALUES (3649, 'Southern Institute of Technology ', 35, 16);
INSERT INTO `tbl_schools` VALUES (3650, 'Tai Poutini Polytechnic ', 35, 16);
INSERT INTO `tbl_schools` VALUES (3651, 'Tairawhiti Polytechnic(Gisborne) ', 35, 16);
INSERT INTO `tbl_schools` VALUES (3652, 'Te Kura Toi Whakaari O Aotearoa: New Zealand Drama School', 35, 16);
INSERT INTO `tbl_schools` VALUES (3653, 'Telford Rural Polytechnic ', 35, 16);
INSERT INTO `tbl_schools` VALUES (3654, 'Universal College of Learning (Levin', 35, 16);
INSERT INTO `tbl_schools` VALUES (3655, 'Wellington Business School', 35, 16);
INSERT INTO `tbl_schools` VALUES (3656, 'Wellington Institute of Technology ', 35, 16);
INSERT INTO `tbl_schools` VALUES (3657, 'Western Institute of Technology at Taranaki ', 35, 16);
INSERT INTO `tbl_schools` VALUES (3658, 'Whitecliff College of Arts and Design', 35, 16);
INSERT INTO `tbl_schools` VALUES (3659, 'University of Oxford', 35, 2);
INSERT INTO `tbl_schools` VALUES (3660, 'University of Cambridge', 35, 2);
INSERT INTO `tbl_schools` VALUES (3661, 'Imperial College London', 35, 2);
INSERT INTO `tbl_schools` VALUES (3662, 'London School of Economics', 35, 2);
INSERT INTO `tbl_schools` VALUES (3663, 'University College London', 35, 2);
INSERT INTO `tbl_schools` VALUES (3664, 'Loughborough University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3665, 'University of Bristol', 35, 2);
INSERT INTO `tbl_schools` VALUES (3666, 'University of Bath', 35, 2);
INSERT INTO `tbl_schools` VALUES (3667, 'Durham University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3668, 'The University of Edinburgh', 35, 2);
INSERT INTO `tbl_schools` VALUES (3669, 'Royal Holloway', 35, 2);
INSERT INTO `tbl_schools` VALUES (3670, 'Aston University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3671, 'The University of York', 35, 2);
INSERT INTO `tbl_schools` VALUES (3672, 'Cardiff University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3673, 'King''s College London', 35, 2);
INSERT INTO `tbl_schools` VALUES (3674, 'University of Leicester', 35, 2);
INSERT INTO `tbl_schools` VALUES (3675, 'SOAS', 35, 2);
INSERT INTO `tbl_schools` VALUES (3676, 'University of St Andrews', 35, 2);
INSERT INTO `tbl_schools` VALUES (3677, 'University of Southampton', 35, 2);
INSERT INTO `tbl_schools` VALUES (3678, 'University of East Anglia', 35, 2);
INSERT INTO `tbl_schools` VALUES (3679, 'Newcastle University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3680, 'The University of Manchester', 35, 2);
INSERT INTO `tbl_schools` VALUES (3681, 'University of Sussex', 35, 2);
INSERT INTO `tbl_schools` VALUES (3682, 'University of Exeter', 35, 2);
INSERT INTO `tbl_schools` VALUES (3683, 'University of Glasgow', 35, 2);
INSERT INTO `tbl_schools` VALUES (3684, 'University of Essex', 35, 2);
INSERT INTO `tbl_schools` VALUES (3685, 'Queen''s University Belfast', 35, 2);
INSERT INTO `tbl_schools` VALUES (3686, 'University of Birmingham', 35, 2);
INSERT INTO `tbl_schools` VALUES (3687, 'University of Kent', 35, 2);
INSERT INTO `tbl_schools` VALUES (3688, 'University of Leeds', 35, 2);
INSERT INTO `tbl_schools` VALUES (3689, 'University of Aberdeen', 35, 2);
INSERT INTO `tbl_schools` VALUES (3690, 'University of Stirling', 35, 2);
INSERT INTO `tbl_schools` VALUES (3691, 'University of Surrey', 35, 2);
INSERT INTO `tbl_schools` VALUES (3692, 'University of Liverpool', 35, 2);
INSERT INTO `tbl_schools` VALUES (3693, 'University of Strathclyde', 35, 2);
INSERT INTO `tbl_schools` VALUES (3694, 'Queen Mary University of London', 35, 2);
INSERT INTO `tbl_schools` VALUES (3695, 'Bangor University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3696, 'Swansea University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3697, 'University of Dundee', 35, 2);
INSERT INTO `tbl_schools` VALUES (3698, 'Goldsmiths University of London', 35, 2);
INSERT INTO `tbl_schools` VALUES (3699, 'Aberystwyth University ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3700, 'University of Bradford', 35, 2);
INSERT INTO `tbl_schools` VALUES (3701, 'Heriot-Watt University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3702, 'University of Hull', 35, 2);
INSERT INTO `tbl_schools` VALUES (3703, 'Brunel University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3704, 'University of Ulster', 35, 2);
INSERT INTO `tbl_schools` VALUES (3705, 'Keele University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3706, 'Oxford Brookes University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3707, 'Plymouth University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3708, 'Robert Gordon University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3709, 'University of Abertay Dundee', 35, 2);
INSERT INTO `tbl_schools` VALUES (3710, 'Northumbria University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3711, 'Brighton', 35, 2);
INSERT INTO `tbl_schools` VALUES (3712, 'Nottingham Trent University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3713, 'University of Wales Institute,Cardiff', 35, 2);
INSERT INTO `tbl_schools` VALUES (3714, 'The University of Winchester', 35, 2);
INSERT INTO `tbl_schools` VALUES (3715, 'University of Central England', 35, 2);
INSERT INTO `tbl_schools` VALUES (3716, 'University of Chichester', 35, 2);
INSERT INTO `tbl_schools` VALUES (3717, 'University of Salford', 35, 2);
INSERT INTO `tbl_schools` VALUES (3718, 'University of Wales, Lampeter', 35, 2);
INSERT INTO `tbl_schools` VALUES (3719, 'University of the West of England', 35, 2);
INSERT INTO `tbl_schools` VALUES (3720, 'University of Chester', 35, 2);
INSERT INTO `tbl_schools` VALUES (3721, 'Bournemouth', 35, 2);
INSERT INTO `tbl_schools` VALUES (3722, 'Roehampton University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3723, 'University of Central Lancashire', 35, 2);
INSERT INTO `tbl_schools` VALUES (3724, 'Bath Spa University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3725, 'University of Glamorgan', 35, 2);
INSERT INTO `tbl_schools` VALUES (3726, 'Staffordshire University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3727, 'University of Portsmouth', 35, 2);
INSERT INTO `tbl_schools` VALUES (3728, 'University of Gloucestershire', 35, 2);
INSERT INTO `tbl_schools` VALUES (3729, 'Edinburgh Napier University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3730, 'University Of Wales, Newport', 35, 2);
INSERT INTO `tbl_schools` VALUES (3731, 'Sheffield Hallam University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3732, 'University of Worcester', 35, 2);
INSERT INTO `tbl_schools` VALUES (3733, 'University of the Arts London', 35, 2);
INSERT INTO `tbl_schools` VALUES (3734, 'University of Hertfordshire', 35, 2);
INSERT INTO `tbl_schools` VALUES (3735, 'Canterbury Christ Church University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3736, 'Anglia Ruskin University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3737, 'University of Bolton', 35, 2);
INSERT INTO `tbl_schools` VALUES (3738, 'Kingston University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3739, 'University of Huddersfield', 35, 2);
INSERT INTO `tbl_schools` VALUES (3740, 'Leeds Metropolitan University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3741, 'The University of Sunderland', 35, 2);
INSERT INTO `tbl_schools` VALUES (3742, 'University of East London', 35, 2);
INSERT INTO `tbl_schools` VALUES (3743, 'University of Westminster', 35, 2);
INSERT INTO `tbl_schools` VALUES (3744, 'Teesside University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3745, 'Manchester Metropolitan University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3746, 'Middlesex', 35, 2);
INSERT INTO `tbl_schools` VALUES (3747, 'De Montfort University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3748, 'University of Wolverhampton', 35, 2);
INSERT INTO `tbl_schools` VALUES (3749, 'London South Bank University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3750, 'University of Paisley', 35, 2);
INSERT INTO `tbl_schools` VALUES (3751, 'The University of Northampton', 35, 2);
INSERT INTO `tbl_schools` VALUES (3752, 'University of Lincoln', 35, 2);
INSERT INTO `tbl_schools` VALUES (3753, 'University of Derby', 35, 2);
INSERT INTO `tbl_schools` VALUES (3754, 'University of Greenwich', 35, 2);
INSERT INTO `tbl_schools` VALUES (3755, 'Southampton Solent University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3756, 'Luton University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3757, 'Thames Valley	Thames Valley University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3758, 'Buckinghamshire Chilterns University College', 35, 2);
INSERT INTO `tbl_schools` VALUES (3759, 'London Metropolitan University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3760, 'Edge Hill University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3761, 'City University London', 35, 2);
INSERT INTO `tbl_schools` VALUES (3762, 'University for the Creative Arts', 35, 2);
INSERT INTO `tbl_schools` VALUES (3763, 'Royal Academy of Music', 35, 2);
INSERT INTO `tbl_schools` VALUES (3764, 'The Glasgow School of Art', 35, 2);
INSERT INTO `tbl_schools` VALUES (3765, 'Finical investment and Banking', 35, 2);
INSERT INTO `tbl_schools` VALUES (3766, 'Albion College', 35, 2);
INSERT INTO `tbl_schools` VALUES (3767, 'Buckinghamshire New University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3768, 'Edinburgh College Of Art', 35, 2);
INSERT INTO `tbl_schools` VALUES (3769, 'Birmingham City University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3770, 'University of Cumbria', 35, 2);
INSERT INTO `tbl_schools` VALUES (3771, 'Royal Scottish Academy of Music and Drama', 35, 2);
INSERT INTO `tbl_schools` VALUES (3772, 'King''s College, Cambridge', 35, 2);
INSERT INTO `tbl_schools` VALUES (3773, 'Harper Adams University College', 35, 2);
INSERT INTO `tbl_schools` VALUES (3774, 'Leeds Trinity & All Saints', 35, 2);
INSERT INTO `tbl_schools` VALUES (3775, 'Calderdale College', 35, 2);
INSERT INTO `tbl_schools` VALUES (3776, 'Ealing Hammersmith & West London College', 35, 2);
INSERT INTO `tbl_schools` VALUES (3777, 'Brighton  College', 35, 2);
INSERT INTO `tbl_schools` VALUES (3778, 'Bournemouth & Poole College', 35, 2);
INSERT INTO `tbl_schools` VALUES (3779, 'Architectural Association School of Architecture', 35, 2);
INSERT INTO `tbl_schools` VALUES (3780, 'The University of Buckingham', 35, 2);
INSERT INTO `tbl_schools` VALUES (3781, 'Glyndwr University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3782, 'Cambridge International College', 35, 2);
INSERT INTO `tbl_schools` VALUES (3783, 'Glasgow Caledonian University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3784, 'Greenwich School of Management', 35, 2);
INSERT INTO `tbl_schools` VALUES (3785, 'Queen Margaret University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3786, 'The Royal Agricultural College', 35, 2);
INSERT INTO `tbl_schools` VALUES (3787, 'Hartlepool Sixth Form College', 35, 2);
INSERT INTO `tbl_schools` VALUES (3788, 'INTO Manchester', 35, 2);
INSERT INTO `tbl_schools` VALUES (3789, 'Harrow International Business School', 35, 2);
INSERT INTO `tbl_schools` VALUES (3790, 'Saint Martins University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3791, 'Cranfield University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3792, 'The Chartered Institute of Marketing', 35, 2);
INSERT INTO `tbl_schools` VALUES (3793, 'University of Bedfordshire', 35, 2);
INSERT INTO `tbl_schools` VALUES (3794, 'University College Birmingham', 35, 2);
INSERT INTO `tbl_schools` VALUES (3795, 'The College Of Naturopathic Medicine UK ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3796, 'London School of Commerce', 35, 2);
INSERT INTO `tbl_schools` VALUES (3797, 'Royal College of Art', 35, 2);
INSERT INTO `tbl_schools` VALUES (3798, 'Royal College of Music ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3799, 'University College Falmouth ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3800, 'Royal Northern College of Music', 35, 2);
INSERT INTO `tbl_schools` VALUES (3801, 'Liverpool John Moores University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3802, 'The University of Sheffield', 35, 2);
INSERT INTO `tbl_schools` VALUES (3803, 'The University of Warwick', 35, 2);
INSERT INTO `tbl_schools` VALUES (3804, 'London College of Accountancy', 35, 2);
INSERT INTO `tbl_schools` VALUES (3805, 'Coventry University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3806, 'Ravensbourne College of Design and Communication', 35, 2);
INSERT INTO `tbl_schools` VALUES (3807, 'Hogwarts School', 35, 2);
INSERT INTO `tbl_schools` VALUES (3808, 'Liverpool Hope University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3809, 'Aston University', 35, 2);
INSERT INTO `tbl_schools` VALUES (3810, 'The University of Nottingham', 35, 2);
INSERT INTO `tbl_schools` VALUES (3811, 'Winchester College', 35, 2);
INSERT INTO `tbl_schools` VALUES (3812, 'Accent Courses Ltd ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3813, 'Accent International Language Consultancy ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3814, 'Active Learning School of English', 35, 2);
INSERT INTO `tbl_schools` VALUES (3815, 'Alexanders International School ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3816, 'Anglia Polytechnic University ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3817, 'Anglo European School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3818, 'Anglolang Academy of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3819, 'Anniesland College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3820, 'Ashridge (Bonar Law Memorial) Trust (Now: Ashridge business School) ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3821, 'Barnet College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3822, 'BEET Language Centre', 35, 2);
INSERT INTO `tbl_schools` VALUES (3823, 'Bell Saffron Walden ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3824, 'Birkbeck College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3825, 'Boston College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3826, 'Bournemouth Business School International ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3827, 'Bournemouth University ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3828, 'Bracknell and Wokingham College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3829, 'Brasshouse Language Centre ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3830, 'British Association of Boarding School Summer Courses (BABSSCO) ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3831, 'British Study Centres Brighton ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3832, 'British Study Centres Oxford ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3833, 'Buckswood School ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3834, 'Cambridge Academy of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3835, 'Cambridge Centre for English Studies ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3836, 'Canterbury Language Training ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3837, 'Centre for English Language Teaching (CELT)', 35, 2);
INSERT INTO `tbl_schools` VALUES (3838, 'Channel School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3839, 'Cheltenham International Language Centre at University of Gloucestershire ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3840, 'Cicero Languages International ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3841, 'City College Brighton & Hove ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3842, 'City of Bath College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3843, 'City of Bristol College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3844, 'College of Ripon and York St John ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3845, 'College of St.Mark and St.John ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3846, 'Concord College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3847, 'Courtauld Institute of Art ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3848, 'Crest Schools of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3849, 'Discovery Summer Centre ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3850, 'Eastbourne School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3851, 'EC Brighton ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3852, 'Edge Hill University (formerly known as Edge Hill College of Higher Education)', 35, 2);
INSERT INTO `tbl_schools` VALUES (3853, 'Edinburgh School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3854, 'Edwards Language School ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3855, 'English Country School ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3856, 'English in Exeter ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3857, 'English in London (SKOLA) ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3858, 'English Language Centre ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3859, 'English Language Centre Bristol ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3860, 'English Language Centre York ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3861, 'English Language in the Lakes NAB Cottage ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3862, 'English Language Institute ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3863, 'English Language Training ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3864, 'English Study Tours (SKOLA) ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3865, 'Exeter Academy ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3866, 'Filton College Bristol ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3867, 'Functional English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3868, 'GEOS English Academy ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3869, 'Glasgow International English and Business School ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3870, 'Glasgow School of Art', 35, 2);
INSERT INTO `tbl_schools` VALUES (3871, 'Globe English Centre ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3872, 'Gloucestershire College of Arts and Technology (Gloscat) ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3873, 'Hamilton School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3874, 'Hammersmith and West London College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3875, 'Hampstead Garden Suburb Institute ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3876, 'Harrogate Language Academy ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3877, 'Harrogate Tutorial College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3878, 'Harrow College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3879, 'Harrow House International College London ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3880, 'Harrow House International College Swanage ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3881, 'Harven School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3882, 'Hastings College of Arts and Technology ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3883, 'Hastings English Language Centre (HELC) ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3884, 'Henley College Coventry ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3885, 'Henley Management College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3886, 'Hurtwood House ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3887, 'Inlingua Cheltenham ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3888, 'Intensive School of English & Business Communication ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3889, 'International Language Holidays ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3890, 'International Language Schools ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3891, 'InterNexus Centre for Language Studies ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3892, 'Isca School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3893, 'ISIS Brighton ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3894, 'ISIS Education and Travel ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3895, 'ISIS Greenwich School/Greenwich School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3896, 'Kaplan Financial', 35, 2);
INSERT INTO `tbl_schools` VALUES (3897, 'Kensington and Chelsea College', 35, 2);
INSERT INTO `tbl_schools` VALUES (3898, 'Kent School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3899, 'Kingston College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3900, 'Kingsway English Centre for Professionals ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3901, 'Lake School of English Oxford ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3902, 'Language Link ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3903, 'Language Studies International London Central ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3904, 'Languages Plus/Sprachcaffe ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3905, 'Eurocentres Lee Green ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3906, 'Leeds College of Music', 35, 2);
INSERT INTO `tbl_schools` VALUES (3907, 'Leicester Square School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3908, 'Lewis School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3909, 'Lewisham College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3910, 'Lines Languages Ltd ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3911, 'Linguarama London ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3912, 'Linguarama Stratford-upon-Avon ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3913, 'Liverpool Community College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3914, 'London Business School ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3915, 'London Guildhall University ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3916, 'London House School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3917, 'London Meridian College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3918, 'London School of Hygiene and Tropical Medicine ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3919, 'London Study Centre ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3920, 'Eurocentres London Victoria ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3921, 'LTC International College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3922, 'Malvern House', 35, 2);
INSERT INTO `tbl_schools` VALUES (3923, 'Margate Language Centre ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3924, 'Mayfair School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3925, 'Mayflower College of English', 35, 2);
INSERT INTO `tbl_schools` VALUES (3926, 'Meridian School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3927, 'Millfield English Language School ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3928, 'MM Oxford Study Service ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3929, 'New College Nottingham ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3930, 'Newman University College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3931, 'Northbrook College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3932, 'Norwich Institute for Languages Education (NILE)', 35, 2);
INSERT INTO `tbl_schools` VALUES (3933, 'Norwich University College of the Arts ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3934, 'OISE Intensive Language Schools Oxford ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3935, 'Olivet English Language School ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3936, 'Oxford and Cherwell College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3937, 'Oxford House College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3938, 'Oxford House School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3939, 'Oxford School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3940, 'Randolph School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3941, 'Regent Brighton ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3942, 'Regent London ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3943, 'Regent Oxford ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3944, 'Richmond Adult Community College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3945, 'Richmond The American International University in London ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3946, 'Richmond Upon Thames College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3947, 'Salisbury College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3948, 'Scanbrit School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3949, 'Scarborough International School ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3950, 'School of Oriental and African Studies ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3951, 'School of Pharmacy ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3952, 'Severnvale Academy ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3953, 'Shakespeare School of English at Warwickshire College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3954, 'Shane Global Village London ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3955, 'South Leicestershire College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3956, 'Southgate College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3957, 'Southwark College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3958, 'St George international ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3959, 'St Giles College Brighton ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3960, 'St Giles College Eastbourne ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3961, 'St Giles College London Central ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3962, 'St Giles College London Highgate ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3963, 'St Martin’s College (Lancaster) ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3964, 'St Mary’s College (Twickenham) ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3965, 'Stafford House College and School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3966, 'Stafford House Study Holidays ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3967, 'Stanton School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3968, 'Stranmillis University College', 35, 2);
INSERT INTO `tbl_schools` VALUES (3969, 'Sussex Downs College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3970, 'Suzanne Sparrow Plymouth Language School ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3971, 'Swandean School of English Worthing ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3972, 'Thanet College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3973, 'The Archbishop of Canterbury ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3974, 'The Arts University College at Bournemouth ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3975, 'The Burlington School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3976, 'The Devon School of English', 35, 2);
INSERT INTO `tbl_schools` VALUES (3977, 'The Eckersley School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3978, 'The English Experience ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3979, 'The Hampstead School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3980, 'The Language Project ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3981, 'The Liverpool Institute for Performing Arts', 35, 2);
INSERT INTO `tbl_schools` VALUES (3982, 'The London Institute ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3983, 'The London School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3984, 'The Oxford English Centre ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3985, 'The Royal Scottish Academy of Music and Drama Glasgow', 35, 2);
INSERT INTO `tbl_schools` VALUES (3986, 'The Salisbury School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3987, 'The Stratford-upon-Avon School of English Studies ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3988, 'The Swan School of English Oxford ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3989, 'The University College of St Mark and St John ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3990, 'Thurrock & Basildon College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3991, 'Tresham Institute', 35, 2);
INSERT INTO `tbl_schools` VALUES (3992, 'Trinity University College', 35, 2);
INSERT INTO `tbl_schools` VALUES (3993, 'Twin English Centre Eastbourne ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3994, 'Twin English Centre Salisbury ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3995, 'UCL Language Centre ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3996, 'UHI Millennium Institute ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3997, 'United International College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3998, 'University of Brighton ', 35, 2);
INSERT INTO `tbl_schools` VALUES (3999, 'University of Buckingham ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4000, 'University of Leeds Language Centre ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4001, 'University of Newcastle upon Tyne ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4002, 'University of the West of Scotland ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4003, 'University of Ulster CELT (Centre for English Language Teaching) ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4004, 'University of York ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4005, 'Vacational Studies ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4006, 'Waltham Forest College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4007, 'Wessex Academy School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4008, 'Westminster Kingsway College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4009, 'Wigan and Leigh College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4010, 'Wirral Metropolitan College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4011, 'York St John University (formerly known as York St John College ) ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4012, '(SKOLA) International Community School (SKOLA) ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4013, 'Aspect ILA Austen House ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4014, 'Aspect ILA Central London ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4015, 'Aspect ILA Edinburgh ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4016, 'Aspect ILA Westbourne College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4017, 'Bedford College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4018, 'Bedford Study Centre ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4019, 'Bell Cambridge ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4020, 'Bell London ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4021, 'BPP University College of Professional Studies Limited ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4022, 'Cambridge Centre for Languages Young Learners ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4023, 'Camden College of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4024, 'Carl Duisberg Language Centre ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4025, 'Central School of English', 35, 2);
INSERT INTO `tbl_schools` VALUES (4026, 'Chelmsford College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4027, 'Christian English Language Centre ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4028, 'Churchill House English Home Tuition Courses ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4029, 'Churchill House School of English Language ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4030, 'Colchester English Study Centre ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4031, 'Colchester Institute ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4032, 'Coleg Glan Hafren ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4033, 'College of Law', 35, 2);
INSERT INTO `tbl_schools` VALUES (4034, 'College of North West London ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4035, 'Concorde International Summer Schools ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4036, 'Dudley College of Technology the Lexis Centre ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4037, 'Eagle International School ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4038, 'ECS Scotland ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4039, 'Edinburgh Telford College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4040, 'EF Executive ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4041, 'EF International School of English Bournemouth ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4042, 'EF International School of English London', 35, 2);
INSERT INTO `tbl_schools` VALUES (4043, 'EF International School of English Brighton', 35, 2);
INSERT INTO `tbl_schools` VALUES (4044, 'EF International School of English Cambridge ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4045, 'ELT Banbury ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4046, 'Embassy CES Language and Training Centre Hove ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4047, 'Embassy CES Language and Training Centre London ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4048, 'Embassy CES Language and Training Centre Oxford ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4049, 'Embassy CES Language and Training Centre Cambridge ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4050, 'Embassy CES Language and Training Centre Hastings ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4051, 'Embassy CES Vacation Course Centres ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4052, 'English in Chester', 35, 2);
INSERT INTO `tbl_schools` VALUES (4053, 'ETC Bournemouth', 35, 2);
INSERT INTO `tbl_schools` VALUES (4054, 'European Languages Centre Ltd. ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4055, 'Excel English Language School Ltd ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4056, 'Frances King School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4057, 'Heythrop College University of London ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4058, 'Hilderstone College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4059, 'Huddersfield Technical College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4060, 'Hull College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4061, 'Hull York Medical School', 35, 2);
INSERT INTO `tbl_schools` VALUES (4062, 'ifs School of Finance ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4063, 'Institute of Cancer Research ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4064, 'International House Bath ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4065, 'International House London ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4066, 'International House Torquay ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4067, 'International Projects Centre ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4068, 'InTuition Languages ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4069, 'Language Studies International Hove ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4070, 'Language Studies International London', 35, 2);
INSERT INTO `tbl_schools` VALUES (4071, 'Language Studies International Cambridge ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4072, 'Lydbury English Centre ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4073, 'M.L.S. International College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4074, 'Manchester Academy of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4075, 'Melton College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4076, 'Middlesbrough College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4077, 'Middlesex University ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4078, 'Milner School of English Wimbledon ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4079, 'Multi Lingua ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4080, 'Newbold College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4081, 'North East Surrey College of Technology (NESCOT) ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4082, 'Oaklands College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4083, 'OISE Intensive Language Schools Cambridge ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4084, 'OISE Intensive Language Schools Young Language Schools ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4085, 'Open University ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4086, 'Oxford Brookes University ICELS ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4087, 'Padworth College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4088, 'Park House Training ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4089, 'Park Lane College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4090, 'Parkland International Language School ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4091, 'Pembrokeshire College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4092, 'Peninsula Medical School', 35, 2);
INSERT INTO `tbl_schools` VALUES (4093, 'Peterborough Regional College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4094, 'Pilgrims (summer multicentres) ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4095, 'Pilgrims (year round) ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4096, 'Regent Cambridge ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4097, 'Regent Edinburgh ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4098, 'Regent Fitzroy ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4099, 'Richard Language College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4100, 'Royal Agricultural College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4101, 'Royal Veterinary College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4102, 'School of English Studies Folkstone ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4103, 'Select English (Formally Angloschool) ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4104, 'Select English Cambridge ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4105, 'Sels College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4106, 'Sidmouth International School ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4107, 'South Thames College London', 35, 2);
INSERT INTO `tbl_schools` VALUES (4108, 'Southbourne School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4109, 'Stevenson College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4110, 'Students International ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4111, 'Studio Cambridge Young Learners ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4112, 'Swandean School of English Wimbledon ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4113, 'Taunton International Study Centre ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4114, 'Thames Valley Cultural Centres ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4115, 'The Abbey College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4116, 'The Central School of Speech and Drama ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4117, 'The Sheffield College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4118, 'Torbay Language Centre ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4119, 'Torquay International School ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4120, 'Totnes School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4121, 'University College Chichester ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4122, 'University College Northanpton ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4123, 'University of Dundee Centre for Applied Language Studies ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4124, 'University of Manchester ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4125, 'University of Portsmouth Language Centre ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4126, 'University of Saint Andrews ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4127, 'University of Sheffield ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4128, 'University of Wales Swansea CALS (Centre for Applied Language Studies) ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4129, 'Uxbridge College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4130, 'Victoria School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4131, 'West Cheshire College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4132, 'Westbourne Academy ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4133, 'Wimbledon School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4134, 'Winchester School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4135, 'Institute of International Education ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4136, 'The Elizabeth Johnson Organisation (EJO) ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4137, 'King''s School of English Bournemouth (incorporating King''s Junior School)', 35, 2);
INSERT INTO `tbl_schools` VALUES (4138, 'King''s School of English London ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4139, 'King''s School Oxford ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4140, 'St Clare''s Oxford ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4141, 'St George''s Hospital Medical School ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4142, 'St John''s Wood School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4143, 'St Michael''s College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4144, 'St Patrick''s International College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4145, 'Queen''s University of Belfast ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4146, 'St Bede''s International Summer School ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4147, 'St Brelade''s College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4148, 'St Edmund''s College ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4149, 'St Peter''s School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4150, 'Anglo-Continental School for Juniors ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4151, 'Anglo-Continental School of English ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4152, 'Basil Paterson College', 35, 2);
INSERT INTO `tbl_schools` VALUES (4153, 'International House Newcastle-upon-Tyne ', 35, 2);
INSERT INTO `tbl_schools` VALUES (4154, 'University of Wales', 35, 2);
INSERT INTO `tbl_schools` VALUES (4155, 'McGill University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4156, 'University of Toronto', 35, 5);
INSERT INTO `tbl_schools` VALUES (4157, 'University of British Columbia', 35, 5);
INSERT INTO `tbl_schools` VALUES (4158, 'Mcmaster University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4159, 'University of Alberta', 35, 5);
INSERT INTO `tbl_schools` VALUES (4160, 'York University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4161, 'Carleton University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4162, 'University of Manitoba', 35, 5);
INSERT INTO `tbl_schools` VALUES (4163, 'University of Ottawa', 35, 5);
INSERT INTO `tbl_schools` VALUES (4164, 'University of Calgary', 35, 5);
INSERT INTO `tbl_schools` VALUES (4165, 'University of New Brunswick', 35, 5);
INSERT INTO `tbl_schools` VALUES (4166, 'Universite Laval', 35, 5);
INSERT INTO `tbl_schools` VALUES (4167, 'University of Windsor', 35, 5);
INSERT INTO `tbl_schools` VALUES (4168, 'University of Western Ontario', 35, 5);
INSERT INTO `tbl_schools` VALUES (4169, 'University of Winnipeg', 35, 5);
INSERT INTO `tbl_schools` VALUES (4170, 'Memorial University of Newfoundland', 35, 5);
INSERT INTO `tbl_schools` VALUES (4171, 'Universite de Sherbrooke', 35, 5);
INSERT INTO `tbl_schools` VALUES (4172, 'University of Saskatchewan', 35, 5);
INSERT INTO `tbl_schools` VALUES (4173, 'Queen''s University (Kingston)', 35, 5);
INSERT INTO `tbl_schools` VALUES (4174, 'University of Waterloo', 35, 5);
INSERT INTO `tbl_schools` VALUES (4175, 'University of Victoria', 35, 5);
INSERT INTO `tbl_schools` VALUES (4176, 'Dalhousie University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4177, 'Concordia University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4178, 'University of Guelph', 35, 5);
INSERT INTO `tbl_schools` VALUES (4179, 'University of Regina', 35, 5);
INSERT INTO `tbl_schools` VALUES (4180, 'Lakehead University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4181, 'Laurentian University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4182, 'Universite de Moncton', 35, 5);
INSERT INTO `tbl_schools` VALUES (4183, 'Brandon University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4184, 'Bishop''s University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4185, 'Royal Military College of Canada', 35, 5);
INSERT INTO `tbl_schools` VALUES (4186, 'Trent University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4187, 'Wilfrid Laurier University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4188, 'Acadia University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4189, 'Brock University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4190, 'Mount Allison University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4191, 'Mount Saint Vincent University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4192, 'University of Lethbridge', 35, 5);
INSERT INTO `tbl_schools` VALUES (4193, 'University of Prince Edward Island', 35, 5);
INSERT INTO `tbl_schools` VALUES (4194, 'Universite du Quebec (Montreal)', 35, 5);
INSERT INTO `tbl_schools` VALUES (4195, 'Athabasca University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4196, 'Saint Mary''s University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4197, 'Universite du Quebec (Trois-Riveres)', 35, 5);
INSERT INTO `tbl_schools` VALUES (4198, 'Ryerson University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4199, 'Universite du Quebec (Chicoutimi)', 35, 5);
INSERT INTO `tbl_schools` VALUES (4200, 'Trinity Western University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4201, 'Universite du Quebec (Hull)', 35, 5);
INSERT INTO `tbl_schools` VALUES (4202, 'Universite du Quebec(Rinouski)', 35, 5);
INSERT INTO `tbl_schools` VALUES (4203, 'Nova Scotia Agricultural College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4204, 'University College of Cape Breton', 35, 5);
INSERT INTO `tbl_schools` VALUES (4205, 'Universite du Quebec (Abitibi-Temiscaminque)', 35, 5);
INSERT INTO `tbl_schools` VALUES (4206, 'University of King''s College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4207, 'Saint Paul University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4208, 'Alberta Bible College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4209, 'Capilano University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4210, 'University of Ontario Institute of Technology', 35, 5);
INSERT INTO `tbl_schools` VALUES (4211, 'Durham College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4212, 'Southern Alberta Institute of Technology', 35, 5);
INSERT INTO `tbl_schools` VALUES (4213, 'George Brown College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4214, 'Langara College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4215, 'Seneca College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4216, 'Vancouver Island University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4217, 'Moncton Flight College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4218, 'Medicine Hat College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4219, 'Mohawk College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4220, 'Mount Royal College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4221, 'British Columbia Institute of Technology', 35, 5);
INSERT INTO `tbl_schools` VALUES (4222, 'Centennial College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4223, 'Okanagan College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4224, 'Ecole Polytechnique de Montreal', 35, 5);
INSERT INTO `tbl_schools` VALUES (4225, 'Seneca College of Applied Arts& Technology', 35, 5);
INSERT INTO `tbl_schools` VALUES (4226, 'San Francisco State University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4227, 'Simon Fraser University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4228, 'St. Francis Xavier University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4229, 'University of the Fraser Valley', 35, 5);
INSERT INTO `tbl_schools` VALUES (4230, 'Thompson Rivers University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4231, 'University College of Fraser Valley', 35, 5);
INSERT INTO `tbl_schools` VALUES (4232, 'Universite de Montreal', 35, 5);
INSERT INTO `tbl_schools` VALUES (4233, 'University of Northern British Columbia', 35, 5);
INSERT INTO `tbl_schools` VALUES (4234, 'Sheridan College institute of Technology and Advanced Learning', 35, 5);
INSERT INTO `tbl_schools` VALUES (4235, 'Vancouver Community College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4236, 'Douglas College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4237, 'Algonquin College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4238, 'Humber College Institute of Technology & Advanced Learning', 35, 5);
INSERT INTO `tbl_schools` VALUES (4239, 'Columbia International College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4240, 'Fanshawe College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4241, 'Bow Valley College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4242, 'Kwantlen Polytechnic University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4243, 'Emily Carr Institute of Art + Design', 35, 5);
INSERT INTO `tbl_schools` VALUES (4244, 'St.Clair College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4245, 'Columbia College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4246, 'Dawson College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4247, 'Lambton College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4248, 'Lasalle College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4249, 'Nipissing University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4250, 'Royal Roads University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4251, 'Grant MacEwan College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4252, 'Camosun College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4253, 'Marianopolis College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4254, 'Northern Alberta Institute of Technology', 35, 5);
INSERT INTO `tbl_schools` VALUES (4255, 'Conestoga College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4256, 'Niagara College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4257, 'Canadore College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4258, 'Alberta College of Art and Design', 35, 5);
INSERT INTO `tbl_schools` VALUES (4259, 'Hudson College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4260, 'Ontario College of Art and Design', 35, 5);
INSERT INTO `tbl_schools` VALUES (4261, 'Lethbridge College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4262, 'NAIT', 35, 5);
INSERT INTO `tbl_schools` VALUES (4263, 'Coquitlam College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4264, 'NorQuest College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4265, 'Art Institute of Vancouver', 35, 5);
INSERT INTO `tbl_schools` VALUES (4266, 'Branksome Hall', 35, 5);
INSERT INTO `tbl_schools` VALUES (4267, 'College of New Caledonia', 35, 5);
INSERT INTO `tbl_schools` VALUES (4268, 'College of the Rockies', 35, 5);
INSERT INTO `tbl_schools` VALUES (4269, 'Fraser International College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4270, 'Vancouver Film School', 35, 5);
INSERT INTO `tbl_schools` VALUES (4271, 'Chapman University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4272, 'sprott-shaw community college', 35, 5);
INSERT INTO `tbl_schools` VALUES (4273, 'N.S.C.A.D University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4274, 'university of clagary', 35, 5);
INSERT INTO `tbl_schools` VALUES (4275, 'Cargair Flight Academey', 35, 5);
INSERT INTO `tbl_schools` VALUES (4276, 'Red River College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4277, 'Algoma University College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4278, 'Assiniboine Community College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4279, 'Brescia University College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4280, 'Briercrest College and Seminary', 35, 5);
INSERT INTO `tbl_schools` VALUES (4281, 'Campion College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4282, 'Cape Breton University ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4283, 'Capilano College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4284, 'Cégep André-Laurendeau ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4285, 'Cégep de l''Abitibi-Témiscamingue ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4286, 'Cégep de Limoilou ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4287, 'Cégep de Matane ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4288, 'Cégep de Rivière-du-loup ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4289, 'Cégep de Saint-Hyacinthe', 35, 5);
INSERT INTO `tbl_schools` VALUES (4290, 'Cégep de Saint-Jér?me ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4291, 'Cégep de Saint-Laurent ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4292, 'Cégep de Sorel-Tracy ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4293, 'Cégep de Trois-Rivières ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4294, 'Cégep régional de Lanaudière ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4295, 'Cégep Saint-Jean-sur-Richelieu ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4296, 'Centennial College of Applied Arts and Technology ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4297, 'Champlain Regional College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4298, 'Collège Ahuntsic ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4299, 'Collège Boréal ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4300, 'Collège de Bois-de-Boulogne ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4301, 'Collège de Maisonneuve ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4302, 'Collège de Rosemont ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4303, 'Collège édouard-Montpetit ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4304, 'Collège LaSalle ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4305, 'College of the North Atlantic ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4306, 'Collège Shawinigan ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4307, 'Concordia University College of Alberta ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4308, 'Ecole Polytechnique de Montréal ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4309, 'Emily Carr Institute of Art and Design ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4310, 'HEC Montréal', 35, 5);
INSERT INTO `tbl_schools` VALUES (4311, 'Heritage College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4312, 'Institut de technologie agroalimentaire de Saint-Hyacinthe ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4313, 'Institut du Tourisme & d''H?tellerie du Québec ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4314, 'Keyano College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4315, 'Kwantlen University College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4316, 'La Cité collégiale ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4317, 'Lethbridge Community College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4318, 'Maskwachees Cultural College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4319, 'North Island College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4320, 'Northern College of Applied Arts and Technology ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4321, 'Northern Lakes College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4322, 'Northern Lights College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4323, 'Nova Scotia Community College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4324, 'NSCAD University ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4325, 'Okanagan University College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4326, 'Olds College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4327, 'Portage College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4328, 'Saskatchewan Institute of Applied Science and Technology (SIAST)', 35, 5);
INSERT INTO `tbl_schools` VALUES (4329, 'St. Clair College of Applied Arts and Technology ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4330, 'St. Jerome''s University ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4331, 'St. Lawrence College of Applied Arts and Technology ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4332, 'St. Thomas More College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4333, 'St. Thomas University ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4334, 'Steinbach Bible College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4335, 'The Ontario College of Art & Design ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4336, 'Université de Montréal ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4337, 'Université Laval ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4338, 'University of St. Michael’s College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4339, 'University of Trinity College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4340, 'Atlantic Baptist University', 35, 5);
INSERT INTO `tbl_schools` VALUES (4341, 'Aurora College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4342, 'Cambrian College of Applied Arts and Technology ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4343, 'Canadian College of Naturopathic Medicine', 35, 5);
INSERT INTO `tbl_schools` VALUES (4344, 'Canadian Mennonite University ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4345, 'Cégep de Drummondville ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4346, 'Cégep de Jonquière ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4347, 'Cégep de la Gaspésie et des ?les ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4348, 'Cégep de Sept-Iles ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4349, 'Cégep du Vieux-Montréal', 35, 5);
INSERT INTO `tbl_schools` VALUES (4350, 'Cégep Marie-Victorin ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4351, 'Collège de l''Outaouais ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4352, 'Collège de Sherbrooke ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4353, 'Collège dominicain de philosophie et de théologie ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4354, 'Collège Fran?ois-Xavier-Garneau ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4355, 'Collège Gérald-Godin', 35, 5);
INSERT INTO `tbl_schools` VALUES (4356, 'Collège Laflèche ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4357, 'Collège Lionel-Groulx ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4358, 'Collège Mérici ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4359, 'Confederation College of Applied Arts and Technology ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4360, 'First Nations University of Canada ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4361, 'Georgian College of Applied Arts and Technology', 35, 5);
INSERT INTO `tbl_schools` VALUES (4362, 'Grande Prairie Regional College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4363, 'Holland College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4364, 'Humber College Institute of Technology and Advanced Learning ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4365, 'Huron University College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4366, 'Institut de technologie agroalimentaire de La Pocatière ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4367, 'John Abbott College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4368, 'Justice Institute of British Columbia ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4369, 'Keewatin Community College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4370, 'King’s University College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4371, 'Lakeland College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4372, 'Loyalist College of Applied Arts and Technology ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4373, 'Luther College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4374, 'Malaspina University-College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4375, 'Management Institute of Canada', 35, 5);
INSERT INTO `tbl_schools` VALUES (4376, 'New Brunswick Community College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4377, 'Nicola Valley Institute of Technology ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4378, 'Northwest Community College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4379, 'Nunavut Arctic College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4380, 'Providence College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4381, 'Providence College & Theological Seminary', 35, 5);
INSERT INTO `tbl_schools` VALUES (4382, 'Queen''s University ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4383, 'Red Deer College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4384, 'Redeemer University College', 35, 5);
INSERT INTO `tbl_schools` VALUES (4385, 'Royal Military College Canada ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4386, 'Sault College of Applied Arts and Technology ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4387, 'Selkirk College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4388, 'Sir Sandford Fleming College of Applied Arts and Technology ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4389, 'Tele-Université ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4390, 'The College Universtaire de Saint-Boniface ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4391, 'Tyndale College & Seminary', 35, 5);
INSERT INTO `tbl_schools` VALUES (4392, 'Université de Sherbrooke ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4393, 'Université du Québec : école de technologie supérieure ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4394, 'Université du Québec : école nationale d''administration publique ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4395, 'Université du Québec : Institut national de la recherche scientifique ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4396, 'Université du Québec : Télé-université ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4397, 'Université du Québec à Chicoutimi ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4398, 'Université du Québec à Montréal ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4399, 'Université du Québec à Rimouski ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4400, 'Université du Québec à Trois-Rivières ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4401, 'Université du Québec en Abitibi-Témiscamingue ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4402, 'Université du Québec en Outaouais ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4403, 'Université Sainte-Anne ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4404, 'Université Sainte-Anne - Collège de l''Acadie ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4405, 'University College of the Fraser Valley ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4406, 'University of Sudbury ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4407, 'Vanier College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4408, 'Victoria School of Business and Technology', 35, 5);
INSERT INTO `tbl_schools` VALUES (4409, 'Winnipeg Technical College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4410, 'Yukon College ', 35, 5);
INSERT INTO `tbl_schools` VALUES (4411, 'Universität Tübingen', 35, 18);
INSERT INTO `tbl_schools` VALUES (4412, 'Freie Universität Berlin', 35, 18);
INSERT INTO `tbl_schools` VALUES (4413, 'Universität Göttingen', 35, 18);
INSERT INTO `tbl_schools` VALUES (4414, 'Philipps Universität Marburg', 35, 18);
INSERT INTO `tbl_schools` VALUES (4415, 'Ruhr Universität Bochum', 35, 18);
INSERT INTO `tbl_schools` VALUES (4416, 'Technische Hochschule Aachen', 35, 18);
INSERT INTO `tbl_schools` VALUES (4417, 'Technische Universität Berlin', 35, 18);
INSERT INTO `tbl_schools` VALUES (4418, 'Technische Universität München', 35, 18);
INSERT INTO `tbl_schools` VALUES (4419, 'Universität Augsburg', 35, 18);
INSERT INTO `tbl_schools` VALUES (4420, 'Universität Bamberg', 35, 18);
INSERT INTO `tbl_schools` VALUES (4421, 'Universität Bayreuth', 35, 18);
INSERT INTO `tbl_schools` VALUES (4422, 'Universität Bielefeld', 35, 18);
INSERT INTO `tbl_schools` VALUES (4423, 'Universität Bonn', 35, 18);
INSERT INTO `tbl_schools` VALUES (4424, 'Universität Braunschweig', 35, 18);
INSERT INTO `tbl_schools` VALUES (4425, 'Universität Bremen', 35, 18);
INSERT INTO `tbl_schools` VALUES (4426, 'Universität Dortmund', 35, 18);
INSERT INTO `tbl_schools` VALUES (4427, 'Universität Dusseldorf', 35, 18);
INSERT INTO `tbl_schools` VALUES (4428, 'Universität Erlangen', 35, 18);
INSERT INTO `tbl_schools` VALUES (4429, 'Universität Frankfurt', 35, 18);
INSERT INTO `tbl_schools` VALUES (4430, 'Universität Gesamthochschule Siegen', 35, 18);
INSERT INTO `tbl_schools` VALUES (4431, 'Universität GH Duisburg', 35, 18);
INSERT INTO `tbl_schools` VALUES (4432, 'Universität GH Essen', 35, 18);
INSERT INTO `tbl_schools` VALUES (4433, 'Universität GH Kassel', 35, 18);
INSERT INTO `tbl_schools` VALUES (4434, 'Universität -GH Paderborn', 35, 18);
INSERT INTO `tbl_schools` VALUES (4435, 'Universität- GH Wuppertal', 35, 18);
INSERT INTO `tbl_schools` VALUES (4436, 'Universität Giessen', 35, 18);
INSERT INTO `tbl_schools` VALUES (4437, 'Universität Hamburg', 35, 18);
INSERT INTO `tbl_schools` VALUES (4438, 'Universität Hannover', 35, 18);
INSERT INTO `tbl_schools` VALUES (4439, 'Universität Heidelberg', 35, 18);
INSERT INTO `tbl_schools` VALUES (4440, 'Universität koeln', 35, 18);
INSERT INTO `tbl_schools` VALUES (4441, 'Technische Universität Kaiserslautern', 35, 18);
INSERT INTO `tbl_schools` VALUES (4442, 'Universität Karlsruhe', 35, 18);
INSERT INTO `tbl_schools` VALUES (4443, 'Universität Kiel', 35, 18);
INSERT INTO `tbl_schools` VALUES (4444, 'Universität Konstanz', 35, 18);
INSERT INTO `tbl_schools` VALUES (4445, 'Universität Mainz', 35, 18);
INSERT INTO `tbl_schools` VALUES (4446, 'Universität Mannheim', 35, 18);
INSERT INTO `tbl_schools` VALUES (4447, 'LMU München', 35, 18);
INSERT INTO `tbl_schools` VALUES (4448, 'Universität Münster', 35, 18);
INSERT INTO `tbl_schools` VALUES (4449, 'Universität Oldenburg', 35, 18);
INSERT INTO `tbl_schools` VALUES (4450, 'Universität Osnabrueck', 35, 18);
INSERT INTO `tbl_schools` VALUES (4451, 'Universität Passau', 35, 18);
INSERT INTO `tbl_schools` VALUES (4452, 'Universität Regensburg', 35, 18);
INSERT INTO `tbl_schools` VALUES (4453, 'Universität Saarbrucken', 35, 18);
INSERT INTO `tbl_schools` VALUES (4454, 'Universität Stuttgart', 35, 18);
INSERT INTO `tbl_schools` VALUES (4455, 'Universität Trier', 35, 18);
INSERT INTO `tbl_schools` VALUES (4456, 'Universität Ulm', 35, 18);
INSERT INTO `tbl_schools` VALUES (4457, 'Universität Würzburg', 35, 18);
INSERT INTO `tbl_schools` VALUES (4458, 'Universität paderborn', 35, 18);
INSERT INTO `tbl_schools` VALUES (4459, 'Universität Leipzig', 35, 18);
INSERT INTO `tbl_schools` VALUES (4460, 'International College of Music', 35, 18);
INSERT INTO `tbl_schools` VALUES (4461, 'Staatliche Akademie der Bildenden Künste Stuttgart ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4462, 'Technische Universität Hamburg-Harburg', 35, 18);
INSERT INTO `tbl_schools` VALUES (4463, 'Technische Universität Dresden', 35, 18);
INSERT INTO `tbl_schools` VALUES (4464, 'Technische Universität Clausthal', 35, 18);
INSERT INTO `tbl_schools` VALUES (4465, 'Technische Universität Braunschweig    ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4466, 'Humboldt Universität zu Berlin', 35, 18);
INSERT INTO `tbl_schools` VALUES (4467, 'Fachhochschule lübeck', 35, 18);
INSERT INTO `tbl_schools` VALUES (4468, 'Fachhochschule Aachen', 35, 18);
INSERT INTO `tbl_schools` VALUES (4469, 'Albert-Ludwigs-Universität Freiburg', 35, 18);
INSERT INTO `tbl_schools` VALUES (4470, 'Duisburg-Essen', 35, 18);
INSERT INTO `tbl_schools` VALUES (4471, 'Hochschule-Merseburg', 35, 18);
INSERT INTO `tbl_schools` VALUES (4472, 'Hochschule für Musik und Theater Hamburg', 35, 18);
INSERT INTO `tbl_schools` VALUES (4473, 'Universität Duisburg-Essen', 35, 18);
INSERT INTO `tbl_schools` VALUES (4474, 'Friedrich-Schiller-Universität Jena', 35, 18);
INSERT INTO `tbl_schools` VALUES (4475, 'Otto-von-Guericke-Universitaet Magdeburg', 35, 18);
INSERT INTO `tbl_schools` VALUES (4476, 'Fachhochschule München', 35, 18);
INSERT INTO `tbl_schools` VALUES (4477, 'Charité Berlin', 35, 18);
INSERT INTO `tbl_schools` VALUES (4478, 'Fachhochschule Hannover', 35, 18);
INSERT INTO `tbl_schools` VALUES (4479, 'FH-oow', 35, 18);
INSERT INTO `tbl_schools` VALUES (4480, 'Georg-Sonnin-Schule', 35, 18);
INSERT INTO `tbl_schools` VALUES (4481, 'Georg-Simon-Ohm Hochschule Nürnberg', 35, 18);
INSERT INTO `tbl_schools` VALUES (4482, 'Technische Universität Darmstadt', 35, 18);
INSERT INTO `tbl_schools` VALUES (4483, 'Universität Rostock', 35, 18);
INSERT INTO `tbl_schools` VALUES (4484, 'Fachhochschule Worms', 35, 18);
INSERT INTO `tbl_schools` VALUES (4485, 'Friedrich-Alexander-Universität-Erlangen-Nürnberg', 35, 18);
INSERT INTO `tbl_schools` VALUES (4486, 'Technische Universität Chemnitz', 35, 18);
INSERT INTO `tbl_schools` VALUES (4487, 'Fachhochschule Braunschweig/Wolfenbüttel', 35, 18);
INSERT INTO `tbl_schools` VALUES (4488, 'Hochschule Karlsruhe Technik und Wirtschaft', 35, 18);
INSERT INTO `tbl_schools` VALUES (4489, 'Fachhochschule Kaiserslautern', 35, 18);
INSERT INTO `tbl_schools` VALUES (4490, 'Hochschule Neu-Ulm', 35, 18);
INSERT INTO `tbl_schools` VALUES (4491, 'Internationale Fachhochschule Bad Honnef-Bonn', 35, 18);
INSERT INTO `tbl_schools` VALUES (4492, 'International College of Communication and New Media', 35, 18);
INSERT INTO `tbl_schools` VALUES (4493, 'Hochschule für Musik Dresden Carl Maria von Weber', 35, 18);
INSERT INTO `tbl_schools` VALUES (4494, 'Hochschule fuer Musik Detmold', 35, 18);
INSERT INTO `tbl_schools` VALUES (4495, 'Hochschule Furtwangen University', 35, 18);
INSERT INTO `tbl_schools` VALUES (4496, 'Martin Luther Universität Halle Wittenberg', 35, 18);
INSERT INTO `tbl_schools` VALUES (4497, 'Business and Information Technology School', 35, 18);
INSERT INTO `tbl_schools` VALUES (4498, 'Hochschle Mittweida', 35, 18);
INSERT INTO `tbl_schools` VALUES (4499, 'FH Koblenz', 35, 18);
INSERT INTO `tbl_schools` VALUES (4500, 'Fachhochschule Koblenz', 35, 18);
INSERT INTO `tbl_schools` VALUES (4501, 'Hochschule für Musik Hanns Eisler Berlin', 35, 18);
INSERT INTO `tbl_schools` VALUES (4502, 'Hochschule für Musik und Theater München', 35, 18);
INSERT INTO `tbl_schools` VALUES (4503, 'Hochschule für Musik und Theater Hannover', 35, 18);
INSERT INTO `tbl_schools` VALUES (4504, 'Universität Potsdam', 35, 18);
INSERT INTO `tbl_schools` VALUES (4505, 'Hochschule Anhalt', 35, 18);
INSERT INTO `tbl_schools` VALUES (4506, 'Universität Witten-Herdecke', 35, 18);
INSERT INTO `tbl_schools` VALUES (4507, 'Hochschule Esslingen', 35, 18);
INSERT INTO `tbl_schools` VALUES (4508, 'Burg Giebichenstein Hochschule für Kunst und Design Halle', 35, 18);
INSERT INTO `tbl_schools` VALUES (4509, 'Anhalt University of Applied Sciences', 35, 18);
INSERT INTO `tbl_schools` VALUES (4510, 'Bauhaus-Universitaet Weimar', 35, 18);
INSERT INTO `tbl_schools` VALUES (4511, 'Brandenburgische Technische Universität Cottbus', 35, 18);
INSERT INTO `tbl_schools` VALUES (4512, 'Fachhochschule Osnabrueck', 35, 18);
INSERT INTO `tbl_schools` VALUES (4513, 'Fachhochschule Wiesbaden', 35, 18);
INSERT INTO `tbl_schools` VALUES (4514, 'Hochschule Fresenius', 35, 18);
INSERT INTO `tbl_schools` VALUES (4515, 'Hochschule für Künste Bremen', 35, 18);
INSERT INTO `tbl_schools` VALUES (4516, 'Hochschule für Musik Freiburg', 35, 18);
INSERT INTO `tbl_schools` VALUES (4517, 'Hochschule Niederrhein', 35, 18);
INSERT INTO `tbl_schools` VALUES (4518, 'Universitaet Hohenheim', 35, 18);
INSERT INTO `tbl_schools` VALUES (4519, 'Universität Kassel', 35, 18);
INSERT INTO `tbl_schools` VALUES (4520, 'Universität Witten/Herdecke', 35, 18);
INSERT INTO `tbl_schools` VALUES (4521, 'Fachhochschule Ansbach', 35, 18);
INSERT INTO `tbl_schools` VALUES (4522, 'Technische Universität Bergakademie Freiberg', 35, 18);
INSERT INTO `tbl_schools` VALUES (4523, 'Hochschule für Musik und Darstellende Kunst Frankfurt am Main', 35, 18);
INSERT INTO `tbl_schools` VALUES (4524, 'Hochschule für Musik Karlsruhe', 35, 18);
INSERT INTO `tbl_schools` VALUES (4525, 'Fachhochschule für Technik und Wirtschaft Berlin', 35, 18);
INSERT INTO `tbl_schools` VALUES (4526, 'Ernst-Moritz-Arndt-Universität Greifswald', 35, 18);
INSERT INTO `tbl_schools` VALUES (4527, 'Hochschule für Musik Nürnberg', 35, 18);
INSERT INTO `tbl_schools` VALUES (4528, 'Fachhochschule für Oekonomie & Management', 35, 18);
INSERT INTO `tbl_schools` VALUES (4529, 'Fachhochschule Jena', 35, 18);
INSERT INTO `tbl_schools` VALUES (4530, 'Hochschule für Musik Franz Liszt Weimar', 35, 18);
INSERT INTO `tbl_schools` VALUES (4531, 'Staatliche Hochschule für Musik und darstellende Kunst Mannheim', 35, 18);
INSERT INTO `tbl_schools` VALUES (4532, 'Technische Universität Ilmenau', 35, 18);
INSERT INTO `tbl_schools` VALUES (4533, 'TU Dresden', 35, 18);
INSERT INTO `tbl_schools` VALUES (4534, 'Universität Lübeck', 35, 18);
INSERT INTO `tbl_schools` VALUES (4535, 'Hochschule Bremen', 35, 18);
INSERT INTO `tbl_schools` VALUES (4536, 'Hochschule Darmstadt', 35, 18);
INSERT INTO `tbl_schools` VALUES (4537, 'Hochschule Coburg', 35, 18);
INSERT INTO `tbl_schools` VALUES (4538, 'Hochschule Wismar', 35, 18);
INSERT INTO `tbl_schools` VALUES (4539, 'Frankfurt School of Finance & Management', 35, 18);
INSERT INTO `tbl_schools` VALUES (4540, 'hochschule fuer musik franz liszt weimar', 35, 18);
INSERT INTO `tbl_schools` VALUES (4541, 'Staatliche Hochschule für Musik und darstellende Kunst Stuttgart', 35, 18);
INSERT INTO `tbl_schools` VALUES (4542, 'Staatliche Hochschule für Musik und Darschtellende Kunst Stuttgart', 35, 18);
INSERT INTO `tbl_schools` VALUES (4543, 'WHU-Otto Beisheim School of Management', 35, 18);
INSERT INTO `tbl_schools` VALUES (4544, 'Hochschule Mannheim', 35, 18);
INSERT INTO `tbl_schools` VALUES (4545, 'Fachhochschule Erfurt', 35, 18);
INSERT INTO `tbl_schools` VALUES (4546, 'Universität der Künste Berlin', 35, 18);
INSERT INTO `tbl_schools` VALUES (4547, 'TU Clausthal', 35, 18);
INSERT INTO `tbl_schools` VALUES (4548, 'AKAD Fachhochschule Lahr ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4549, 'AKAD Fachhochschule Leipzig ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4550, 'AKAD Fachhochschule Pinneberg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4551, 'AKAD Wissenschaftliche Hochschule Lahr ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4552, 'Akademie der Bildenden Künste München ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4553, 'Akademie der Bildenden Künste Nürnberg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4554, 'Alanus Hochschule ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4555, 'Alice-Salomon-Fachhochschule für Sozialarbeit und Sozialpädagogik Berlin ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4556, 'AMD Akademie Mode und Design ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4557, 'Augustana-Hochschule Neuendettelsau ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4558, 'Bad Homburg accadisFH: accadis Hochschule Bad Homburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4559, 'Bauhaus-Universität Weimar ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4560, 'Bergische Universität Wuppertal ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4561, 'Berlin bbw: bbw Hochschule - Berlin ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4562, 'Berlin FHTouro: Touro College Berlin ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4563, 'Berlin HfGesundheit: Hochschule für Gesundheit und Sport ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4564, '"Berlin HfM: Hochschule für Musik ""Hanns Eisler"" Berlin "', 35, 18);
INSERT INTO `tbl_schools` VALUES (4565, 'Berlin HSoG: Hertie School of Governance ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4566, 'Berlin IBS: International Business School Berlin ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4567, 'Berlin MDH: Mediadesign Hochschule für Design und Informatik ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4568, 'Berliner Technische Kunsthochschule ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4569, 'Bucerius Law School - Hochschule für Rechtswissenschaft Hamburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4570, 'Christian-Albrechts-Universität zu Kiel ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4571, 'Deutsche Hochschule für Verwaltungswissenschaften Speyer ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4572, 'Deutsche Sporthochschule Köln ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4573, 'Deutsche Telekom Fachhochschule Leipzig ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4574, '"Dresden HfM: Hochschule für Musik ""Carl Maria von Weber"" Dresden "', 35, 18);
INSERT INTO `tbl_schools` VALUES (4575, 'Erding FHM: Fachhochschule für angewandtes Management ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4576, 'Erfurt Adam-RiesFH: Adam-Ries-Fachhochschule ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4577, 'ESCP-EAP Europäische Wirtschaftshochschule Berlin ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4578, 'Europäische Fachhochschule Rhein/Erft ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4579, 'Europa-Universität Viadrina Frankfurt (Oder) ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4580, 'European Business School Oestrich-Winkel ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4581, 'Evangelische Fachhochschule Berlin ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4582, 'Evangelische Fachhochschule Darmstadt ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4583, 'Evangelische Fachhochschule Freiburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4584, 'Evangelische Fachhochschule Nürnberg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4585, 'Evangelische Fachhochschule Reutlingen-Ludwigsburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4586, 'Evangelische Fachhochschule Rheinland-Westfalen-Lippe ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4587, 'Evangelische Hochschule für Kirchenmusik Halle ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4588, 'Evangelische Hochschule für Soziale Arbeit Dresden FH ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4589, 'Fachhochschule Aalen ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4590, 'Fachhochschule Albstadt-Sigmaringen ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4591, 'Fachhochschule Amberg-Weiden ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4592, 'Fachhochschule Aschaffenburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4593, 'Fachhochschule Augsburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4594, 'Fachhochschule Biberach ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4595, 'Fachhochschule Bielefeld ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4596, 'Fachhochschule Bingen ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4597, 'Fachhochschule Bochum ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4598, 'Fachhochschule Bonn-Rhein-Sieg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4599, 'Fachhochschule Brandenburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4600, 'Fachhochschule Darmstadt ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4601, 'Fachhochschule Deggendorf ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4602, 'Fachhochschule der Wirtschaft Paderborn ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4603, 'Fachhochschule des Mittelstandes FHM ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4604, 'Fachhochschule Dortmund ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4605, 'Fachhochschule Düsseldorf ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4606, 'Fachhochschule Eberswalde ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4607, 'Fachhochschule Flensburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4608, 'Fachhochschule Frankfurt am Main ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4609, 'Fachhochschule Fulda ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4610, 'Fachhochschule für die Wirtschaft Hannover ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4611, 'Fachhochschule für Oekonomie und Management FOM ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4612, 'Fachhochschule für Verwaltung und Rechtspflege Berlin ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4613, 'Fachhochschule für Wirtschaft Berlin ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4614, 'Fachhochschule Furtwangen ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4615, 'Fachhochschule Gelsenkirchen ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4616, 'Fachhochschule Gießen-Friedberg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4617, 'Fachhochschule Heidelberg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4618, 'Fachhochschule Heilbronn ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4619, 'Fachhochschule Hildesheim/Holzminden/Göttingen ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4620, 'Fachhochschule Hof ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4621, 'Fachhochschule Ingolstadt ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4622, 'Fachhochschule Karlsruhe ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4623, 'Fachhochschule Kempten ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4624, 'Fachhochschule Kiel ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4625, 'Fachhochschule Köln ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4626, 'Fachhochschule Konstanz ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4627, 'Fachhochschule Landshut ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4628, 'Fachhochschule Lausitz ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4629, 'Fachhochschule Lippe und Höxter ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4630, 'Fachhochschule Ludwigshafen ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4631, 'Fachhochschule Mainz ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4632, 'Fachhochschule Merseburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4633, 'Fachhochschule Münster ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4634, 'Fachhochschule Neubrandenburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4635, 'Fachhochschule Nordhausen ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4636, 'Fachhochschule Nordhessen ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4637, 'Fachhochschule Nürtingen ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4638, 'Fachhochschule Offenburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4639, 'Fachhochschule Oldenburg/Ostfriesland/Wilhelmshaven ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4640, 'Fachhochschule Pforzheim ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4641, 'Fachhochschule Potsdam ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4642, 'Fachhochschule Ravensburg-Weingarten ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4643, 'Fachhochschule Regensburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4644, 'Fachhochschule Reutlingen ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4645, 'Fachhochschule Rosenheim ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4646, 'Fachhochschule Rottenburg - Hochschule für Forstwirtschaft ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4647, 'Fachhochschule Schloss Hohenfels ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4648, 'Fachhochschule Schmalkalden ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4649, 'Fachhochschule Schwäbisch Gmünd ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4650, 'Fachhochschule Schwäbisch Hall - Hochschule für Gestaltung ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4651, 'Fachhochschule Stralsund ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4652, 'Fachhochschule Stuttgart ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4653, 'Fachhochschule Südwestfalen ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4654, 'Fachhochschule Trier ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4655, 'Fachhochschule Ulm ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4656, 'Fachhochschule und Berufskollegs NTA ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4657, 'Fachhochschule Wedel ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4658, 'Fachhochschule Weihenstephan ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4659, 'Fachhochschule Westküste ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4660, 'Fachhochschule Würzburg - Schweinfurt ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4661, 'Fern-Fachhochschule Hamburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4662, 'Fernfachhochschule Riedlingen ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4663, 'Folkwang-Hochschule Essen ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4664, 'Freie Kunst-Studienstätte Ottersberg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4665, 'Friedrichshafen ZU: Zeppelin University - Hochschule zwischen Wirtschaft', 35, 18);
INSERT INTO `tbl_schools` VALUES (4666, 'Gustav-Siewerth-Akademie Weilheim- Bierbronnen ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4667, 'Güstrow BC: Baltic College ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4668, 'Hachenburg FHBundesbank: Fachhochschule der Deutschen Bundesbank ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4669, 'HafenCity Universität Hamburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4670, 'Hamburg HSBA: HSBA Hamburg School of Business Administration ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4671, 'Hamburger Universität für Wirtschaft und Politik ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4672, 'Handelshochschule Leipzig ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4673, 'Heilbronn FH hbs: School of Management der heilbronn business school gGmbH ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4674, 'Heinrich-Heine-Universität Düsseldorf ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4675, 'Hochschule Bremerhaven ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4676, 'Hochschule der Bildenden Künste Saar ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4677, 'Hochschule der Polizei Hamburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4678, 'Hochschule der Sparkassen-Finanzgruppe', 35, 18);
INSERT INTO `tbl_schools` VALUES (4679, 'Hochschule des Saarlandes für Musik und Theater ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4680, 'Hochschule für Angewandte Wissenschaften Hamburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4681, 'Hochschule für Bankwirtschaft HfB ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4682, 'Hochschule für Bildende Künste Braunschweig ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4683, 'Hochschule für Bildende Künste Dresden ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4684, 'Hochschule für Bildende Künste Hamburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4685, 'Hochschule für Fernsehen und Film ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4686, 'Hochschule für Film und Fernsehen ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4687, 'Hochschule für Gestaltung Offenbach ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4688, 'Hochschule für Grafik und Buchkunst Leipzig ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4689, 'Hochschule für Jüdische Studien Heidelberg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4690, 'Hochschule für Katholische Kirchenmusik und Musikpädagogik ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4691, 'Hochschule für Kirchenmusik der Diözese Rottenburg-Stuttgart ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4692, 'Hochschule für Kirchenmusik der Evangelischen Kirche von Westfalen ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4693, 'Hochschule für Kirchenmusik der Evangelischen Landeskirche in Baden ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4694, 'Hochschule für Kirchenmusik der Evangelischen Landeskirche in Württemberg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4695, 'Hochschule für Kirchenmusik der Evangelisch-Lutherischen Landeskirche Sachsens ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4696, 'Hochschule für Musik ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4697, 'Hochschule für Musik Detmold ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4698, 'Hochschule für Musik Köln ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4699, 'Hochschule für Musik und Theater Rostock ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4700, 'Hochschule für Musik Würzburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4701, 'Hochschule für Philosophie ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4702, 'Hochschule für Schauspielkunst ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4703, 'Hochschule für Technik', 35, 18);
INSERT INTO `tbl_schools` VALUES (4704, 'Hochschule für Technik und Wirtschaft des Saarlandes ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4705, 'Hochschule für Technik und Wirtschaft Dresden FH ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4706, 'Hochschule für Wirtschaft und Recht Berlin ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4707, 'Hochschule Hamm-Lippstadt ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4708, 'Hochschule Harz ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4709, 'Hochschule Magdeburg-Stendal ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4710, 'Hochschule Mittweida ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4711, 'Hochschule Rhein-Waal - University of Applied Sciences ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4712, 'Hochschule Ruhr West- University of Applied Sciences ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4713, 'Hochschule Vechta ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4714, 'Hochschule Zittau/Görlitz (FH) ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4715, 'Humboldt-Universität zu Berlin ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4716, 'International School of Management ISM Dortmund ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4717, 'International University Bremen ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4718, 'International University in Germany Bruchsal GmbH ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4719, 'Internationale Fachhochschule Bad Honnef ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4720, 'Internationales Hochschulinstitut Zittau IHI ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4721, 'ISS International Business School of Service Management Hamburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4722, 'Justus-Liebig-Universität Gießen ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4723, 'Karlsruhe MerkurFH:Merkur Internationale Fachhochschule Karlsruhe ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4724, 'Kassel International Management School ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4725, 'Katholische Fachhochschule Freiburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4726, 'Katholische Fachhochschule Mainz ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4727, 'Katholische Fachhochschule Nordrhein-Westfalen ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4728, 'Katholische Stiftungsfachhochschule München ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4729, 'Katholische Universität Eichstätt ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4730, 'Kirchliche Hochschule Bethel ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4731, 'Kunstakademie Düsseldorf ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4732, 'Kunstakademie Münster ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4733, 'Kunsthochschule Berlin-Weißensee Hochschule für Gestaltung ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4734, 'Kunsthochschule für Medien Köln ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4735, 'Lutherische Theologische Hochschule Oberursel ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4736, 'Mannheim HdBA: Hochschule der Bundesagentur für Arbeit ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4737, 'Martin-Luther-Universität Halle-Wittenberg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4738, 'Medizinische Hochschule Hannover ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4739, 'Merz Akademie ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4740, 'München FHM: Macromedia Fachhochschule der Medien ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4741, 'München FHSprachen: Hochschule für Angewandte Sprachen / Fachhochschule des SDI ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4742, 'Munich Business School ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4743, 'Musikhochschule Lübeck ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4744, 'Muthesius-Hochschule ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4745, 'Nordakademie ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4746, 'Ostwestfalen-Lippe H: Hochschule Ostwestfalen-Lippe ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4747, 'OTA Hochschule ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4748, 'Otto-Friedrich-Universit?t Bamberg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4749, 'Otto-von-Guericke-Universität Magdeburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4750, 'Pädagogische Hochschule Freiburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4751, 'Pädagogische Hochschule Heidelberg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4752, 'Pädagogische Hochschule Karlsruhe ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4753, 'Pädagogische Hochschule Ludwigsburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4754, 'Pädagogische Hochschule Schwäbisch Gmünd ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4755, 'Pädagogische Hochschule Weingarten ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4756, 'Palucca Schule Dresden - Hochschule für Tanz ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4757, 'Philipps-Universität Marburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4758, 'Philosophisch-Theologische Hochschule Sankt Georgen Frankfurt am Main ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4759, 'Philosophisch-Theologische Hochschule SVD Sankt Augustin ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4760, 'Potsdam FH UMC:University of Management and Communication (FH) ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4761, 'Private Fachhochschule für Wirtschaft und Technik Vechta/Diepholz ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4762, 'Private Fachhochschule Göttingen ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4763, 'Private Fern Fachhochschule Darmstadt ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4764, 'Provadis School of International Management and Technology ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4765, 'Rheinische Fachhochschule Köln ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4766, 'Robert-Schumann-Hochschule Düsseldorf ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4767, 'Ruhr-Universität Bochum ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4768, 'SRH Fachhochschule Hamm ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4769, 'SRH Hochschule Calw ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4770, 'Staatlich anerkannte Fachhochschule für Kunsttherapie ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4771, 'Staatliche Akademie der Bildenden Künste Karlsruhe ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4772, 'Staatliche Hochschule für Bildende Künste (Städelschule) Frankfurt am Main ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4773, 'Staatliche Hochschule für Gestaltung Karlsruhe ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4774, 'Staatliche Hochschule für Musik Trossingen ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4775, 'Steinbeis-Hochschule-Berlin ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4776, 'Stuttgart HdM: Hochschule der Medien Stuttgart ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4777, 'Stuttgart Institute of Management and Technology SIMT ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4778, 'Technische Fachhochschule Berlin ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4779, 'Technische Fachhochschule Georg Agricola für Rohstoff', 35, 18);
INSERT INTO `tbl_schools` VALUES (4780, 'Technische Fachhochschule Wildau ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4781, 'Technische Universität Carolo-Wilhelmina zu Braunschweig ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4782, 'Theologische Fakultät Fulda ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4783, 'Theologische Fakultät Paderborn ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4784, 'Theologische Fakultät Trier ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4785, 'Theologische Hochschule Friedensau ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4786, 'Tierärztliche Hochschule Hannover ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4787, 'Universität der Bundeswehr Hamburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4788, 'Universität der Bundeswehr München ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4789, 'Universität des Saarlandes ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4790, 'Universität Duisburg-Essen (Standort Essen) ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4791, 'Universität Erfurt ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4792, 'Universität Flensburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4793, 'Universität Hildesheim ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4794, 'Universität Hohenheim ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4795, 'Universität Kaiserslautern ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4796, 'Universität Koblenz-Landau ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4797, 'Universität Lüneburg ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4798, 'Universität Osnabrück ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4799, 'Universität Siegen ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4800, 'Universität zu Köln ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4801, 'Universität zu Lübeck ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4802, 'Westsächsische Hochschule Zwickau (FH) ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4803, 'Wissenschaftliche Hochschule für Unternehmensführung ', 35, 18);
INSERT INTO `tbl_schools` VALUES (4804, '홍익대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4805, '호원대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4806, '한양대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4807, '한신대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4808, '한성대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4809, '한림대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4810, '한국외국어대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4811, '충북대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4812, '충남대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4813, '청주대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4814, '청운대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4815, '중앙대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4816, '전주대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4817, '전남대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4818, '인하대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4819, '인천대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4820, '인제대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4821, '익산대학', 35, 17);
INSERT INTO `tbl_schools` VALUES (4822, '이화여자대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4823, '원광대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4824, '울산대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4825, '우송대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4826, '영진전문대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4827, '영남대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4828, '아주대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4829, '숭실대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4830, '숙명여자대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4831, '세종대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4832, '성신여자대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4833, '성균관대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4834, '서울시립대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4835, '서강대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4836, '상명대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4837, '부산대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4838, '부경대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4839, '배재대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4840, '명지대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4841, '동양대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4842, '동아대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4843, '동국대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4844, '대전대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4845, '대구대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4846, '단국대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4847, '군산대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4848, '국민대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4849, '광주대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4850, '광운대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4851, '공주대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4852, '고려대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4853, '계명대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4854, '경희대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4855, '경일대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4856, '경원대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4857, '경북대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4858, '경동대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4859, '경기대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4860, '건국대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4861, '강원대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4862, '강남대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4863, '가톨릭대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4864, '圣洁大学', 35, 17);
INSERT INTO `tbl_schools` VALUES (4865, '동의대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4866, '미래대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4867, '충주대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4868, '한경대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4869, '한의대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4870, '순천향대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4871, '호남대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4872, '동신대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4873, '광중대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4874, '신라대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4875, '용인대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4876, '동의과학대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4877, '연세대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4878, '대불대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4879, '항공대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4880, '국립금오공과대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4881, '호서대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4882, '전북대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4883, '경상대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4884, '제주대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4885, '순천대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4886, '동명대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4887, '세명대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4888, '대진대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4889, '나사렛대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4890, '동서대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4891, '부산외국어대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4892, '한국기술교육대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4893, '영산대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4894, '목원대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4895, '우석대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4896, '광신대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4897, '강릉대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4898, '조선대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4899, '한국과학기술원', 35, 17);
INSERT INTO `tbl_schools` VALUES (4900, '성공회대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4901, '서울산업대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4902, '건양대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4903, '국립창원대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4904, '관동대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4905, '부산정보대학', 35, 17);
INSERT INTO `tbl_schools` VALUES (4906, '남서울대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4907, '두원공과대학', 35, 17);
INSERT INTO `tbl_schools` VALUES (4908, '서울기독대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4909, '경남대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4910, '서울예술대학', 35, 17);
INSERT INTO `tbl_schools` VALUES (4911, '서경대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4912, '수원대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4913, '김천대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4914, '나주대학', 35, 17);
INSERT INTO `tbl_schools` VALUES (4915, '대구예술대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4916, '부산경남정보대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4917, '선문대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4918, '종남 아산 선문대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4919, '진주산업대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4920, '초당대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4921, '포항공대 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4922, '한서대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4923, '국립목포대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4924, '부찬걍창대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4925, '부산동의대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4926, '서울여자대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4927, '안동과학대학', 35, 17);
INSERT INTO `tbl_schools` VALUES (4928, '평택대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4929, '한림성심대학', 35, 17);
INSERT INTO `tbl_schools` VALUES (4930, '공주영상대학', 35, 17);
INSERT INTO `tbl_schools` VALUES (4931, '국립 한밭대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4932, '중부대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4933, '창신대학', 35, 17);
INSERT INTO `tbl_schools` VALUES (4934, '한국해양대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4935, '탐라대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4936, '가야대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4937, '경성대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4938, '극동대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4939, '한국예술종합학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4940, '안동대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4941, '가천의과학대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4942, '가톨릭상지대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4943, '감리교신학대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4944, '강릉영동대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4945, '강릉원주대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4946, '강원관광대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4947, '강원대학교삼척캠퍼스 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4948, '거제대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4949, '경기공업대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4950, '경원전문대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4951, '경인교육대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4952, '경인여자대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4953, '계원예술조형대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4954, '고신대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4955, '공주교육대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4956, '광주가톨릭대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4957, '광주과학기술원', 35, 17);
INSERT INTO `tbl_schools` VALUES (4958, '광주교육대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4959, '광주보건대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4960, '광주여자대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4961, '구미1대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4962, '김천과학대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4963, '김포대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4964, '꽃동네현도사회복지대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4965, '대경대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4966, '대구가톨릭대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4967, '대구공업대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4968, '대구과학대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4969, '대구교육대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4970, '대구보건대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4971, '대구산업정보대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4972, '대동대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4973, '대신대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4974, '대원대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4975, '대전가톨릭대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4976, '대전보건대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4977, '동남보건대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4978, '동서울대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4979, '동아방송예술대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4980, '동아인재대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4981, '동양공업전문대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4982, '동우대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4983, '동원대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4984, '숭의여자대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4985, '적십자간호대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4986, '제주관광대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4987, '제주대학교 사라캠퍼스 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4988, '제주산업정보대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4989, '제주한라대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4990, '조선간호대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4991, '조선이공대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4992, '진주교육대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4993, '진주보건대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4994, '창원전문대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4995, '청강문화산업대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4996, '한국교원대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4997, '한국디지털대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (4998, '한국성서대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (4999, '한국정보통신대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5000, '한국철도대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5001, '한국체육대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5002, '한남대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5003, '한라대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5004, '한려대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5005, '한세대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5006, '한양여자대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5007, '한영대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5008, '한영신학대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5009, '한일장신대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5010, '한중대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5011, '합동신학대학원대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5012, '혜전대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5013, '혜천대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5014, '호남신학대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5015, '홍익대학교 국제디자인전문대학원 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5016, 'CHA 의과학대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5017, 'KDI 국제정책대학원 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5018, '건동대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (5019, '경동정보대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5020, '경복대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5021, '경북과학대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5022, '경북대학교 상주캠퍼스 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5023, '경북도립대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5024, '경북외국어대학교', 35, 17);
INSERT INTO `tbl_schools` VALUES (5025, '경북전문대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5026, '국립밀양대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5027, '군장대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5028, '극동정보대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5029, '기독간호대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5030, '김해대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5031, '남부대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5032, '농협대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5033, '대덕대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5034, '대림대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5035, '대한신학대학원대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5036, '덕성여자대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5037, '동강대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5038, '동부산대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5039, '루터대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5040, '마산대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5041, '명신대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5042, '명지전문대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5043, '목포가톨릭대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5044, '목포과학대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5045, '목포해양대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5046, '배화여자대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5047, '백석대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5048, '백석문화대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5049, '백제예술대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5050, '베뢰아국제대학원대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5051, '벽성대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5052, '부산가톨릭대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5053, '부산경상대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5054, '부산교육대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5055, '부산여자대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5056, '부산예술대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5057, '부산장신대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5058, '성화대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5059, '안산1대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5060, '안산공과대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5061, '안양과학대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5062, '안양대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5063, '연암공업대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5064, '영남신학대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5065, '영남외국어대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5066, '영남이공대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5067, '용인송담대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5068, '유한대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5069, '장로회신학대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5070, '장안대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5071, '재능대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5072, '전북과학대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5073, '춘천교육대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5074, '춘해보건대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5075, '침례신학대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5076, '칼빈대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5077, '포항공과대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5078, '포항대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5079, '한국관광대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5080, '한국방송통신대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5081, '한국산업기술대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5082, '한국재활복지대학 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5083, '한동대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5084, '校 나사렛대학교 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5085, '院국제법률경영대학원 ', 35, 17);
INSERT INTO `tbl_schools` VALUES (5086, 'Санкт - Петербургский государственный университет экономики и финансов', 35, 4);
INSERT INTO `tbl_schools` VALUES (5087, 'Санкт-Петербургский государственный университет аэрокосмического приборостроения', 35, 4);
INSERT INTO `tbl_schools` VALUES (5088, 'Санкт-Петербургский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5089, 'Российский  университет  дружбы народов', 35, 4);
INSERT INTO `tbl_schools` VALUES (5090, 'Российский Государственный Университет нефти и газа имени И.М.Губкина', 35, 4);
INSERT INTO `tbl_schools` VALUES (5091, 'Московский энергетический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5092, 'Дальневосточный Государственный Технический Рыбохозяйственный Университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5093, 'Волгоградский государственный медицинский университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5094, 'Белгородский Государственный Университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5095, 'Московская  Медицинская Академия  имени И.М. Сеченова', 35, 4);
INSERT INTO `tbl_schools` VALUES (5096, 'Московский Государственный университет им.М.В.Ломоносова', 35, 4);
INSERT INTO `tbl_schools` VALUES (5097, 'Санкт-Петербургский государственный электротехнический университет «ЛЭТИ»', 35, 4);
INSERT INTO `tbl_schools` VALUES (5098, 'Санкт-Петербургский государственный горный институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5099, 'Санкт-Петербургский государственный политехнический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5100, 'Санкт-Петербургский государственный университет технологии и дизайна', 35, 4);
INSERT INTO `tbl_schools` VALUES (5101, 'Башкирский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5102, 'Всероссийский государственный университет кинематографии имени С.А. Герасимова ', 35, 4);
INSERT INTO `tbl_schools` VALUES (5103, 'МОСКОВСКИЙ АВТОМОБИЛЬНО-ДОРОЖНЫЙ　ИНСТИТУТ', 35, 4);
INSERT INTO `tbl_schools` VALUES (5104, 'Воронежский государственный архитектурно-строительный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5105, 'Томский политехнический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5106, 'Московский государственный университет экономики, статистики и информатики', 35, 4);
INSERT INTO `tbl_schools` VALUES (5107, 'Дальневосточный Государетвенный Агрный Университета', 35, 4);
INSERT INTO `tbl_schools` VALUES (5108, 'Московский государственный университет природообустройства', 35, 4);
INSERT INTO `tbl_schools` VALUES (5109, 'МОСКОВСКИЙ ГОСУДАРСТВЕННЫЙ УНИВЕРСИТЕТ ПУТЕЙ СООБЩЕНИЯ', 35, 4);
INSERT INTO `tbl_schools` VALUES (5110, 'Владивостокский государственный университет экономики и сервиса', 35, 4);
INSERT INTO `tbl_schools` VALUES (5111, 'Ивановский государственный химико технологический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5112, 'Волгоградский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5113, 'Волгоградский государственный технический университет(ВГТУ)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5114, 'Тихоокеанский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5115, 'Дальневосточный Государственный Университет Путей Сообщения', 35, 4);
INSERT INTO `tbl_schools` VALUES (5116, 'Российская Академия Музыки ИМ. ГНЕСИНЫХ', 35, 4);
INSERT INTO `tbl_schools` VALUES (5117, 'Благовещенский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5118, 'Воронежский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5119, 'МОСКОВСКИЙ ГОСУДАРСТВЕННЫЙ СТРОИТЕЛЬНЫЙ УНИВЕРСИТЕТ', 35, 4);
INSERT INTO `tbl_schools` VALUES (5120, 'МОСКОВСКИЙ ГОСУДАРСТВЕННЫЙ ТЕХНИЧЕСКИЙ УНИВЕРСИТЕТ ИМ. “МАМИ”', 35, 4);
INSERT INTO `tbl_schools` VALUES (5121, 'Московский Педагогический Государственный Университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5122, 'Петербургский Государственный Университет Путей Сообщения', 35, 4);
INSERT INTO `tbl_schools` VALUES (5123, 'СПб государственный университет низкотемпературных и пищевых технологий', 35, 4);
INSERT INTO `tbl_schools` VALUES (5124, 'Тихоокеанский государственный экономический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5125, 'Тульский государственный педагогический университет им. Л. Н. Толстого', 35, 4);
INSERT INTO `tbl_schools` VALUES (5126, 'Сибирский Федеральный Университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5127, 'российский государственный медицинский университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5128, 'Пензенский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5129, 'Санкт-Петербургский Государственный Университет Культуры и Искусств', 35, 4);
INSERT INTO `tbl_schools` VALUES (5130, 'Комсомольский-на-Амуре государственный технический университет （КнАГТУ）', 35, 4);
INSERT INTO `tbl_schools` VALUES (5131, 'Санкт-Петербургский государственный архитектурно-строительный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5132, 'Московский Государственный Институт Электронной техники', 35, 4);
INSERT INTO `tbl_schools` VALUES (5133, 'Донской Государственный Технический Университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5134, 'Липецкий государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5135, 'Финансовая академия при Правительстве Российской Федерации', 35, 4);
INSERT INTO `tbl_schools` VALUES (5136, 'Южно-Российский государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5137, 'Московская государственная консерватория имени П. И. Чайковского', 35, 4);
INSERT INTO `tbl_schools` VALUES (5138, 'Новосибирский государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5139, 'морской государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5140, 'Забайкальский Государственный Гуманитарный Педагогический Университет(ЗабГГПУ)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5141, 'Алтайский Государственный Технический Университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5142, 'Омский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5143, 'Санкт-Петербургская государственная химико-фармацевтическая академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5144, '鞑靼-美国区立学院(喀山)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5145, 'Азово-Черноморская государственная агроинженерная академия (Зерноград)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5146, 'Академия бюджета и казначейства (Москва)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5147, 'Академия народного хозяйства при Правительстве Российской Федерации (Москва)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5148, 'Алтайский государственный аграрный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5149, 'Алтайский государственный медицинский университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5150, 'Алтайский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5151, 'Альметьевский муниципальный институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5152, 'Амурская государственная медицинская академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5153, 'Амурский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5154, 'Ангарская государственная техническая академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5155, 'Арзамасский государственный педагогический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5156, 'Армавирский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5157, 'Астраханская государственная медицинская академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5158, 'Астраханский государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5159, 'Астраханский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5160, 'Астраханский инженерно-строительный институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5161, 'Байкальский государственный университет экономики и права', 35, 4);
INSERT INTO `tbl_schools` VALUES (5162, 'Балтийская государственная академия рыбопромыслового флота (Калининград)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5163, '"Балтийский государственный технический университет ""ВОЕНМЕХ"""', 35, 4);
INSERT INTO `tbl_schools` VALUES (5164, 'Барнаульский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5165, 'Башкирский государственный аграрный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5166, 'Башкирский государственный медицинский университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5167, 'Башкирский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5168, 'Башкирский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5169, 'Белгородская государственная сельскохозяйственная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5170, 'Белгородский государственный технологический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5171, 'Белгородский университет потребительской кооперации', 35, 4);
INSERT INTO `tbl_schools` VALUES (5172, 'Белорусско-Российский университет (Могилев)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5173, 'Бийский педагогический государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5174, 'Биробиджанский государственный педагогический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5175, 'Бирский государственный педагогический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5176, 'Борисоглебский государственный педагогический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5177, 'Братский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5178, 'Брянская государственная инженерно-технологическая академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5179, 'Брянская государственная сельскохозяйственная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5180, 'Брянский государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5181, 'Брянский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5182, 'Бурятская государственная сельскохозяйственная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5183, 'Бурятский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5184, 'Великолукская государственная академия физической культуры и спорта', 35, 4);
INSERT INTO `tbl_schools` VALUES (5185, 'Владивостокский государственный медицинский университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5186, 'Владимирский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5187, 'Владимирский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5188, 'Владимирский юридический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5189, 'Волго-Вятская академия государственной службы (Нижний Новгород)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5190, 'Волгоградская академия государственной службы', 35, 4);
INSERT INTO `tbl_schools` VALUES (5191, 'Волгоградская государственная академия физической культуры', 35, 4);
INSERT INTO `tbl_schools` VALUES (5192, 'Волгоградская государственная сельскохозяйственная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5193, 'Волгоградский государственный архитектурно-строительный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5194, 'Волжская государственная академия водного транспорта (Нижний Новгород)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5195, 'Волжский институт экономики и менеджмента — Высшая школа коммерции', 35, 4);
INSERT INTO `tbl_schools` VALUES (5196, 'Вологодская государственная молочнохозяйственная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5197, 'Вологодский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5198, 'Вологодский государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5199, 'Вологодский институт права и экономики', 35, 4);
INSERT INTO `tbl_schools` VALUES (5200, 'Воронежская государственная лесотехническая академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5201, 'Воронежская государственная медицинская академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5202, 'Воронежская государственная технологическая академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5203, 'Воронежский государственный аграрный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5204, 'Воронежский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5205, 'Воронежский государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5206, 'Всероссийская академия внешней торговли (Москва)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5207, 'Всероссийская государственная налоговая академия (Москва)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5208, 'Всероссийский заочный финансово-экономический институт (Москва)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5209, 'Вятская государственная сельскохозяйственная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5210, 'Вятский государственный гуманитарный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5211, 'Гжельский государственный художественно-промышленный институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5212, 'Глазовский государственный педагогический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5213, 'Горно-Алтайский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5214, 'Горский государственный аграрный университет (Владикавказ)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5215, 'Государственная морская академия (Санкт-Петербург)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5216, 'Государственный университет — Высшая школа экономики (Москва)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5217, 'Государственный университет по землеустройству (Москва)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5218, 'Государственный университет управления (Москва)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5219, 'Грозненский государственный нефтяной институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5220, 'Дагестанская государственная медицинская академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5221, 'Дагестанская государственная сельскохозяйственная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5222, 'Дагестанский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5223, 'Дагестанский государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5224, 'Дагестанский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5225, 'Дальневосточная академия государственной службы (Хабаровск)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5226, 'Дальневосточная государственная академия физической культуры', 35, 4);
INSERT INTO `tbl_schools` VALUES (5227, 'Дальневосточная государственная академия экономики и управления (Владивосток)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5228, 'Дальневосточный государственный медицинский университет (Хабаровск)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5229, 'Дальневосточный государственный университет (Владивосток)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5230, 'Донской государственный аграрный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5231, 'Елабужский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5232, 'Елецкий государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5233, 'Ивановская государственная архитектурно-строительная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5234, 'Ивановская государственная медицинская академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5235, 'Ивановская государственная сельскохозяйственная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5236, 'Ивановская государственная текстильная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5237, 'Ивановский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5238, 'Ивановский государственный энергетический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5239, 'Ижевская государственная медицинская академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5240, 'Ижевская государственная сельскохозяйственная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5241, 'Ижевский государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5242, 'Институт государственной службы при Президенте Республики Татарстан ', 35, 4);
INSERT INTO `tbl_schools` VALUES (5243, 'Иркутская государственная сельскохозяйственная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5244, 'Иркутский государственный медицинский университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5245, 'Иркутский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5246, 'Иркутский государственный университет путей сообщения', 35, 4);
INSERT INTO `tbl_schools` VALUES (5247, 'Ишимский государственный педагогический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5248, 'Кабардино-Балкарская государственная сельскохозяйственная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5249, 'Кабардино-Балкарский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5250, 'Казанская государственная академия ветеринарной медицины им. Н. Э. Баумана', 35, 4);
INSERT INTO `tbl_schools` VALUES (5251, 'Казанская государственная сельскохозяйственная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5252, 'Казанский государственный архитектурно-строительный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5253, 'Казанский государственный медицинский университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5254, 'Казанский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5255, 'Казанский государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5256, 'Казанский государственный технологический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5257, 'Казанский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5258, 'Казанский государственный финансово-экономический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5259, 'Казанский государственный энергетический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5260, 'Калининградский государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5261, 'Калининградский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5262, 'Калмыцкий государственный университет (Элиста)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5263, 'Калужский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5264, 'Камский государственный институт физической культуры (Набережные Челны)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5265, 'Камский государственный политехнический институт (Набережные Челны)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5266, 'Камчатский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5267, 'Камчатский государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5268, 'Карачаево-Черкесская государственная технологическая академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5269, 'Карачаево-Черкесский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5270, 'Карельский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5271, 'Кемеровская государственная медицинская академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5272, 'Кемеровский государственный сельскохозяйственный институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5273, 'Кемеровский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5274, 'Кемеровский технологический институт пищевой промышленности', 35, 4);
INSERT INTO `tbl_schools` VALUES (5275, 'Кировская государственная медицинская академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5276, 'Ковровская государственная технологическая академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5277, 'Коломенский государственный педагогический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5278, 'Коми государственный педагогический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5279, 'Комсомольский-на-Амуре государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5280, 'Костромская государственная сельскохозяйственная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5281, 'Костромской государственный технологический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5282, 'Красноярская государственная архитектурно-строительная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5283, 'Красноярская государственная медицинская академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5284, 'Красноярский государственный аграрный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5285, 'Красноярский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5286, 'Красноярский государственный торгово-экономический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5287, 'Красноярский государственный художественный институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5288, 'Кубанская государственная медицинская академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5289, 'Кубанский государственный аграрный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5290, 'Кубанский государственный технологический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5291, 'Кубанский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5292, 'Кубанский государственный университет физической культуры', 35, 4);
INSERT INTO `tbl_schools` VALUES (5293, 'Кузбасская государственная педагогическая академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5294, 'Кузбасский государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5295, 'Курганская государственная сельскохозяйственная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5296, 'Курская государственная сельскохозяйственная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5297, 'Курский государственный медицинский университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5298, 'Курский государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5299, 'Курский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5300, 'Курский институт государственной и муниципальной службы', 35, 4);
INSERT INTO `tbl_schools` VALUES (5301, 'Кыргызско-Российский Славянский университет (Бишкек)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5302, 'Ленинградский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5303, 'Липецкий государственный технический университет ', 35, 4);
INSERT INTO `tbl_schools` VALUES (5304, 'Магнитогорский государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5305, 'Магнитогорский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5306, 'Майкопский государственный технологический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5307, 'Марийский государственный педагогический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5308, 'Марийский государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5309, 'Марийский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5310, 'МАТИ - Российский государственный технологический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5311, 'Мичуринский государственный аграрный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5312, 'Мичуринский государственный педагогический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5313, 'Мордовский государственный педагогический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5314, 'Мордовский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5315, 'Московская государственная академия водного транспорта', 35, 4);
INSERT INTO `tbl_schools` VALUES (5316, 'Московская государственная академия приборостроения и информатики', 35, 4);
INSERT INTO `tbl_schools` VALUES (5317, 'Московская государственная академия тонкой химической технологии', 35, 4);
INSERT INTO `tbl_schools` VALUES (5318, 'Московская государственная академия физической культуры', 35, 4);
INSERT INTO `tbl_schools` VALUES (5319, 'Московская государственная академияветеринарной медицины и биотехнологии', 35, 4);
INSERT INTO `tbl_schools` VALUES (5320, 'Московская государственная юридическая академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5321, 'Московский авиационный институт (государственный технический университет)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5322, 'Московский архитектурный институт (государственная академия)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5323, 'Московский городской институт управления правительства Москвы', 35, 4);
INSERT INTO `tbl_schools` VALUES (5324, 'Московский городской педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5325, 'Московский городской психолого-педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5326, 'Московский государственный агроинженерный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5327, 'Московский государственный вечерний металлургический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5328, 'Московский государственный геологоразведочный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5329, 'Московский государственный горный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5330, 'Московский государственный индустриальный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5331, 'Московский государственный институт международных отношений (университет)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5332, 'Московский государственный институт радиотехники', 35, 4);
INSERT INTO `tbl_schools` VALUES (5333, 'Московский государственный лингвистический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5334, 'Московский государственный медико-стоматологический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5335, 'Московский государственный областной педагогический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5336, 'Московский государственный областной университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5337, 'Московский государственный открытый педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5338, 'Московский государственный открытый университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5339, 'Московский государственный текстильный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5340, 'Московский государственный технический университет ', 35, 4);
INSERT INTO `tbl_schools` VALUES (5341, 'Московский государственный технический университет гражданской авиации', 35, 4);
INSERT INTO `tbl_schools` VALUES (5342, 'Московский государственный технологический университет ', 35, 4);
INSERT INTO `tbl_schools` VALUES (5343, 'Московский государственный университет геодезии и картографии', 35, 4);
INSERT INTO `tbl_schools` VALUES (5344, 'Московский государственный университет инженерной экологии', 35, 4);
INSERT INTO `tbl_schools` VALUES (5345, 'Московский государственный университет леса', 35, 4);
INSERT INTO `tbl_schools` VALUES (5346, 'Московский государственный университет печати', 35, 4);
INSERT INTO `tbl_schools` VALUES (5347, 'Московский государственный университет пищевых производств', 35, 4);
INSERT INTO `tbl_schools` VALUES (5348, 'Московский государственный университет прикладной биотехнологии', 35, 4);
INSERT INTO `tbl_schools` VALUES (5349, 'Московский государственный университет сервиса', 35, 4);
INSERT INTO `tbl_schools` VALUES (5350, 'Московский государственный художественно-промышленный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5351, 'Московский инженерно-физический институт (государственный университет)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5352, 'Московский институт коммунального хозяйства и строительства', 35, 4);
INSERT INTO `tbl_schools` VALUES (5353, 'Московский технический университет связи и информатики', 35, 4);
INSERT INTO `tbl_schools` VALUES (5354, 'Московский университет потребительской кооперации', 35, 4);
INSERT INTO `tbl_schools` VALUES (5355, 'Московский физико-технический институт (государственный университет)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5356, 'Мурманский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5357, 'Мурманский государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5358, 'Набережночелнинский государственный педагогический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5359, 'Нижегородская государственная медицинская академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5360, 'Нижегородская государственная сельскохозяйственная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5361, 'Нижегородский государственный архитектурно-строительный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5362, 'Нижегородский государственный лингвистический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5363, 'Нижегородский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5364, 'Нижегородский государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5365, 'Нижегородский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5366, 'Нижегородский коммерческий институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5367, 'Нижневартовский государственный педагогический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5368, 'Нижнетагильская государственная социально-педагогическая академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5369, 'Новгородский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5370, 'Новороссийская государственная морская академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5371, 'Новосибирская государственная академия водного транспорта', 35, 4);
INSERT INTO `tbl_schools` VALUES (5372, 'Новосибирская государственная академия экономики и управления', 35, 4);
INSERT INTO `tbl_schools` VALUES (5373, 'Новосибирская государственная архитектурно-художественная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5374, 'Новосибирская государственная медицинская академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5375, 'Новосибирский государственный аграрный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5376, 'Новосибирский государственный архитектурно-строительный университет (Сибстрин)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5377, 'Новосибирский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5378, 'Новосибирский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5379, 'Новоуральский государственный технологический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5380, 'Новочеркасская государственная мелиоративная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5381, 'Норильский индустриальный институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5382, 'Обнинский государственный технический университет атомной энергетики', 35, 4);
INSERT INTO `tbl_schools` VALUES (5383, 'Омская государственная медицинская академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5384, 'Омский государственный аграрный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5385, 'Омский государственный институт сервиса', 35, 4);
INSERT INTO `tbl_schools` VALUES (5386, 'Омский государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5387, 'Омский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5388, 'Омский государственный университет путей сообщения', 35, 4);
INSERT INTO `tbl_schools` VALUES (5389, 'Оренбургская государственная медицинская академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5390, 'Оренбургский государственный аграрный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5391, 'Оренбургский государственный институт менеджмента', 35, 4);
INSERT INTO `tbl_schools` VALUES (5392, 'Оренбургский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5393, 'Оренбургский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5394, 'Орловская региональная академия государственной службы', 35, 4);
INSERT INTO `tbl_schools` VALUES (5395, 'Орловский государственный аграрный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5396, 'Орловский государственный институт экономики и торговли', 35, 4);
INSERT INTO `tbl_schools` VALUES (5397, 'Орловский государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5398, 'Орловский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5399, 'Пензенская государственная сельскохозяйственная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5400, 'Пензенская государственная технологическая академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5401, 'Пензенский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5402, 'Пензенский государственный университет архитектуры и строительства', 35, 4);
INSERT INTO `tbl_schools` VALUES (5403, 'Пермская государственная медицинская академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5404, 'Пермская государственная сельскохозяйственная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5405, 'Пермская государственная фармацевтическая академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5406, 'Пермский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5407, 'Пермский государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5408, 'Пермский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5409, 'Петрозаводский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5410, 'Поволжская академия государственной службы (Саратов)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5411, 'Поволжская государственная академия телекоммуникаций и информатики (Самара)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5412, 'Поволжский кооперативный институт (Энгельс)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5413, 'Поморский государственный университет (Архангельск)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5414, 'Приморская государственная сельскохозяйственная академия (Уссурийск)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5415, 'Псковский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5416, 'Псковский государственный политехнический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5417, 'Псковский юридический институт Минюста России', 35, 4);
INSERT INTO `tbl_schools` VALUES (5418, 'Пятигорская государственная фармацевтическая академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5419, 'Пятигорский государственный лингвистический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5420, 'Пятигорский государственный технологический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5421, 'Российская академия государственной службы при Президенте РФ (Москва)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5422, 'Российская академия живописи', 35, 4);
INSERT INTO `tbl_schools` VALUES (5423, 'Российская правовая академия Минюста России (Москва)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5424, 'Российская таможенная академия (Люберцы)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5425, 'Российская школа частного права (институт) (Москва)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5426, 'Российская экономическая академия (Москва)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5427, 'Российский государственный гидрометеорологический университет (Санкт-Петербург)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5428, 'Российский государственный гуманитарный университет (Москва)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5429, 'Российский государственный торгово-экономический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5430, 'Российский государственный университет физической культуры', 35, 4);
INSERT INTO `tbl_schools` VALUES (5431, 'Российский заочный институт текстильной и легкой промышленности (Москва)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5432, 'Российский химико-технологический университет им. Д. И. Менделеева (Москва)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5433, 'Российско-Таджикский (Славянский) университет (Душанбе)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5434, 'Ростовская государственная академия архитектуры и искусства', 35, 4);
INSERT INTO `tbl_schools` VALUES (5435, 'Ростовская-на-Дону государственная академия сельскохозяйственного машиностроения', 35, 4);
INSERT INTO `tbl_schools` VALUES (5436, 'Ростовский государственный медицинский университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5437, 'Ростовский государственный строительный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5438, 'Ростовский государственный университет путей сообщения', 35, 4);
INSERT INTO `tbl_schools` VALUES (5439, 'Ростовский государственный экономический университет ?РИНХ?', 35, 4);
INSERT INTO `tbl_schools` VALUES (5440, 'Рыбинская государственная авиационная технологическая академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5441, 'Рязанская государственная радиотехническая академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5442, 'Рязанская государственная сельскохозяйственная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5443, 'Рязанский государственный медицинский университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5444, 'Рязанский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5445, 'Самарская государственная академия путей сообщения', 35, 4);
INSERT INTO `tbl_schools` VALUES (5446, 'Самарская государственная сельскохозяйственная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5447, 'Самарская государственная экономическая академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5448, 'Самарский государственный архитектурно-строительный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5449, 'Самарский государственный аэрокосмический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5450, 'Самарский государственный медицинский университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5451, 'Самарский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5452, 'Самарский государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5453, 'Самарский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5454, 'Самарский юридический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5455, 'Санкт-Петербургская государственная академия ветеринарной медицины', 35, 4);
INSERT INTO `tbl_schools` VALUES (5456, 'Санкт-Петербургская государственная академия сервиса и экономики', 35, 4);
INSERT INTO `tbl_schools` VALUES (5457, 'Санкт-Петербургская государственная академия физической культуры ', 35, 4);
INSERT INTO `tbl_schools` VALUES (5458, 'Санкт-Петербургская государственная лесотехническая академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5459, 'Санкт-Петербургская государственная медицинская академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5460, 'Санкт-Петербургская государственная педиатрическая медицинская академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5461, 'Санкт-Петербургская государственная художественно-промышленная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5462, 'Санкт-Петербургский государственный аграрный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5463, 'Санкт-Петербургский государственный академический институт живописи', 35, 4);
INSERT INTO `tbl_schools` VALUES (5464, 'Санкт-Петербургский государственный инженерно-экономический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5465, 'Санкт-Петербургский государственный морской технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5466, 'Санкт-Петербургский институт машиностроения (ЛМЗ-ВТУЗ)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5467, 'Санкт-Петербургский торгово-экономический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5468, 'Саратовская государственная академия права', 35, 4);
INSERT INTO `tbl_schools` VALUES (5469, 'Саратовский государственный аграрный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5470, 'Саратовский государственный медицинский университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5471, 'Саратовский государственный социально-экономический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5472, 'Саратовский государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5473, 'Саратовский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5474, 'Саровский государственный физико-технический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5475, 'Сахалинский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5476, 'Северный государственный медицинский университет (Архангельск)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5477, 'Северо-Западная академия государственной службы (С.-Петербург)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5478, 'Северо-Кавказская академия государственной службы (Ростов-на-Дону)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5479, 'Северо-Кавказский государственный технический университет (Ставрополь)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5480, 'Северо-Осетинская государственная медицинская академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5481, 'Северо-Осетинский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5482, 'Северский государственный технологический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5483, 'Сибирская академия государственной службы (Новосибирск)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5484, 'Сибирская государственная автомобильно-дорожная академия (СибАДИ) (Омск)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5485, 'Сибирская государственная геодезическая академия (Новосибирск)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5486, 'Сибирский государственный индустриальный университет (Новокузнецк)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5487, 'Сибирский государственный медицинский университет (Томск)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5488, 'Сибирский государственный университет физической культуры и спорта (Омск)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5489, 'Сибирский университет потребительской кооперации (Новосибирск)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5490, 'Славянский-на-Кубани государственный педагогический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5491, 'Смоленская государственная медицинская академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5492, 'Смоленский государственный институт физической культуры', 35, 4);
INSERT INTO `tbl_schools` VALUES (5493, 'Смоленский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5494, 'Смоленский сельскохозяйственный институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5495, 'Снежинская государственная физико-техническая академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5496, 'Соликамский государственный педагогический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5497, 'Сочинский государственный университет туризма и курортного дела', 35, 4);
INSERT INTO `tbl_schools` VALUES (5498, 'Ставропольская государственная медицинская академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5499, 'Ставропольский государственный педагогический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5500, 'Ставропольский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5501, 'Стерлитамакская государственная педагогическая академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5502, 'Сургутский государственный педагогический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5503, 'Сургутский государственный университет Ханты-Мансийского АО', 35, 4);
INSERT INTO `tbl_schools` VALUES (5504, 'Сыктывкарский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5505, 'Таганрогский государственный педагогический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5506, 'Тамбовский государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5507, 'Тамбовский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5508, 'Татарско-американский региональный институт (Казань)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5509, 'Тверская государственная медицинская академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5510, 'Тверская государственная сельскохозяйственная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5511, 'Тверской государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5512, 'Тверской государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5513, 'Тобольский государственный педагогический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5514, 'Тольяттинский государственный институт сервиса', 35, 4);
INSERT INTO `tbl_schools` VALUES (5515, 'Тольяттинский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5516, 'Томский государственный архитектурно-строительный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5517, 'Томский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5518, 'Тульский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5519, 'Тывинский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5520, 'Тюменская государственная медицинская академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5521, 'Тюменская государственная сельскохозяйственная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5522, 'Тюменский государственный нефтегазовый университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5523, 'Тюменский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5524, 'Удмуртский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5525, 'Ульяновская государственная сельскохозяйственная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5526, 'Ульяновский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5527, 'Ульяновский государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5528, 'Ульяновский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5529, 'Ульяновское высшее авиационное училище гражданской авиации (институт)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5530, 'Уральская академия государственной службы (Екатеринбург)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5531, 'Уральская государственная академия ветеринарной медицины (Троицк)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5532, 'Уральская государственная академия физической культуры (Челябинск)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5533, 'Уральская государственная архитектурно-художественная академия (Екатеринбург)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5534, 'Уральская государственная медицинская академия (Екатеринбург)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5535, 'Уральская государственная сельскохозяйственная академия (Екатеринбург)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5536, 'Уральская государственная юридическая академия (Екатеринбург)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5537, 'Уральский государственный горный университет (Екатеринбург)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5538, 'Уральский государственный лесотехнический университет (Екатеринбург)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5539, 'Уральский государственный педагогический университет (Екатеринбург)', 35, 4);
INSERT INTO `tbl_schools` VALUES (5540, 'Уссурийский государственный педагогический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5541, 'Уфимский государственный авиационный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5542, 'Уфимский государственный институт сервиса', 35, 4);
INSERT INTO `tbl_schools` VALUES (5543, 'Уфимский государственный нефтяной технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5544, 'Ухтинский государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5545, 'Хабаровская государственная академия экономики и права', 35, 4);
INSERT INTO `tbl_schools` VALUES (5546, 'Хабаровский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5547, 'Хакасский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5548, 'Чайковский государственный институт физической культуры', 35, 4);
INSERT INTO `tbl_schools` VALUES (5549, 'Челябинская государственная медицинская академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5550, 'Челябинский государственный агроинженерный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5551, 'Челябинский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5552, 'Челябинский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5553, 'Череповецкий государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5554, 'Чеченский государственный педагогический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5555, 'Чеченский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5556, 'Читинская государственная медицинская академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5557, 'Читинский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5558, 'Чувашская государственная сельскохозяйственная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5559, 'Чувашский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5560, 'Шадринский государственный педагогический институт', 35, 4);
INSERT INTO `tbl_schools` VALUES (5561, 'Шуйский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5562, 'Югорский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5563, 'Южно-Российский государственный университет экономики и сервиса', 35, 4);
INSERT INTO `tbl_schools` VALUES (5564, 'Южно-Уральский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5565, 'Якутская государственная сельскохозяйственная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5566, 'Якутский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5567, 'Ярославская государственная медицинская академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5568, 'Ярославская государственная сельскохозяйственная академия', 35, 4);
INSERT INTO `tbl_schools` VALUES (5569, 'Ярославский государственный педагогический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5570, 'Ярославский государственный технический университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5571, 'Ярославский государственный университет', 35, 4);
INSERT INTO `tbl_schools` VALUES (5572, '愛知大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5573, '立命館アジア太平洋大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5574, '法政大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5575, 'お茶の水女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5576, '名城大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5577, '同志社大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5578, '新潟経営大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5579, '東京理科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5580, '広島大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5581, '一橋大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5582, '北海道大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5583, '南山大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5584, '立命館大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5585, '山形大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5586, '慶応義塾大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5587, '近畿大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5588, '神戸大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5589, '京都大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5590, '九州大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5591, 'ARC ACADEMY日本語學校', 35, 15);
INSERT INTO `tbl_schools` VALUES (5592, '総合研究大学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5593, '東京大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5594, '明治大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5595, '宇都宮大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5596, '長崎大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5597, '名古屋大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5598, '中日本自动車短期大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5599, '西日本工業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5600, '大阪国際大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5601, '大阪芸術大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5602, '大阪大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5603, '流通科学大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5604, '麗澤大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5605, '埼玉大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5606, '専修大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5607, '拓殖大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5608, '東京工業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5609, '東京国際大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5610, '東京経済大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5611, '和歌山外国語専門学校', 35, 15);
INSERT INTO `tbl_schools` VALUES (5612, '早稲田大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5613, '山梨大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5614, '四日市大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5615, '国士舘大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5616, '城西国際大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5617, '筑波大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5618, '京都造型艺术大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5619, '千葉工业大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5620, '关西语言学院 ', 35, 15);
INSERT INTO `tbl_schools` VALUES (5621, '愛知産業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5622, '北九州市立大學', 35, 15);
INSERT INTO `tbl_schools` VALUES (5623, '福岡大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5624, '関西大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5625, '信州大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5626, '爱知学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5627, '横浜市立大学 ', 35, 15);
INSERT INTO `tbl_schools` VALUES (5628, '大阪産業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5629, '静岡産業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5630, '鹿儿岛大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5631, '東京農業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5632, '日本東海大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5633, '成蹊大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5634, '冈山上午专科学校', 35, 15);
INSERT INTO `tbl_schools` VALUES (5635, '熊本大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5636, '文教大学 ', 35, 15);
INSERT INTO `tbl_schools` VALUES (5637, 'JCLI日本語学校', 35, 15);
INSERT INTO `tbl_schools` VALUES (5638, '上智大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5639, '骏河台大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5640, '高崎经济大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5641, '九州工业大学 ', 35, 15);
INSERT INTO `tbl_schools` VALUES (5642, '滋賀大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5643, '明治学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5644, '长崎县立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5645, '電気通信大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5646, '京都外国語大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5647, '横浜国立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5648, '岛根大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5649, '富山国际大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5650, '中央大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5651, '金泽大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5652, '东洋大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5653, '武蔵野大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5654, '東北大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5655, '千叶大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5656, '日本文理大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5657, '駒沢大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5658, '静冈县立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5659, '帝京大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5660, '大東文化大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5661, '追手門学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5662, '名古屋工業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5663, '帝京平成大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5664, '足利工業大学  ', 35, 15);
INSERT INTO `tbl_schools` VALUES (5665, '東京富士大学   ', 35, 15);
INSERT INTO `tbl_schools` VALUES (5666, '岐阜大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5667, '桜美林大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5668, '産業能率大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5669, '关西学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5670, '宫城教育大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5671, '獨協大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5672, '岡山理科大学 ', 35, 15);
INSERT INTO `tbl_schools` VALUES (5673, '明海大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5674, '冰庫教育大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5675, '折尾愛真短期大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5676, '東京工科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5677, '奈良女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5678, '福岡工業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5679, '桃山學院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5680, '静岡英和学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5681, '岡山商科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5682, '宮崎大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5683, '浜松大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5684, '文化服裝学院', 35, 15);
INSERT INTO `tbl_schools` VALUES (5685, '立教大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5686, '北陸大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5687, '岐阜経済大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5688, '京都工芸繊維大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5689, '日本大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5690, '横浜デザイン学院', 35, 15);
INSERT INTO `tbl_schools` VALUES (5691, '大阪市立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5692, '小樽商科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5693, '东京艺术大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5694, '德岛大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5695, '京都産業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5696, '别府大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5697, '富士大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5698, '日本淑德学院', 35, 15);
INSERT INTO `tbl_schools` VALUES (5699, '东京海洋大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5700, '岩手国立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5701, '和光大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5702, '杏林大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5703, '東京都立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5704, '鹿兒島國際大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5705, '山梨学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5706, '梅花女子大學', 35, 15);
INSERT INTO `tbl_schools` VALUES (5707, '京都精华大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5708, '名古屋産業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5709, '德山大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5710, '千葉科學大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5711, '滋賀县立大學', 35, 15);
INSERT INTO `tbl_schools` VALUES (5712, '群馬大學工學部', 35, 15);
INSERT INTO `tbl_schools` VALUES (5713, '神奈川大學', 35, 15);
INSERT INTO `tbl_schools` VALUES (5714, '龍谷大學', 35, 15);
INSERT INTO `tbl_schools` VALUES (5715, '佐賀大學', 35, 15);
INSERT INTO `tbl_schools` VALUES (5716, '日本國學院大學', 35, 15);
INSERT INTO `tbl_schools` VALUES (5717, '長滨生物科技大學', 35, 15);
INSERT INTO `tbl_schools` VALUES (5718, '愛媛大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5719, '中部学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5720, '關西國際大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5721, '中部大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5722, '立正大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5723, '大阪經濟大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5724, '日本流通經濟大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5725, '兵庫県立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5726, '東京國際文化教育学院', 35, 15);
INSERT INTO `tbl_schools` VALUES (5727, '朝日大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5728, '鸟取环境大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5729, '高千穗大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5730, '亞細亞大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5731, '福岡国际大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5732, '福井大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5733, '富士常葉大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5734, '岡山大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5735, '岡山県高梁市吉備国際大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5736, '吉備國際大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5737, '九州產業大学 ', 35, 15);
INSERT INTO `tbl_schools` VALUES (5738, '九州英數學館國際言语学院', 35, 15);
INSERT INTO `tbl_schools` VALUES (5739, '久留米ゼミナール 语言学校', 35, 15);
INSERT INTO `tbl_schools` VALUES (5740, '就実大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5741, '名古屋市立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5742, '日本愛知縣中部大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5743, '日本別府大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5744, '日本高知大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5745, '日本工業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5746, '日本靜岡大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5747, '日本明星大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5748, '上武大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5749, '十文字學園女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5750, '文化外国语专门学校', 35, 15);
INSERT INTO `tbl_schools` VALUES (5751, '文京学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5752, '武藏野学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5753, '武庫川女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5754, '學習院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5755, '中京大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5756, '九州共立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5757, '三重大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5758, '名古屋経済大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5759, '富山大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5760, '嘉悦大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5761, '広島国際学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5762, '弘前大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5763, '神户学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5764, '下関市立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5765, '大分大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5766, '豊橋創造大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5767, '東京電機大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5768, '京都嵯峨芸術大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5769, '西日本調理製菓専門学校', 35, 15);
INSERT INTO `tbl_schools` VALUES (5770, '武藏野美术大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5771, '愛知文教大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5772, '東京純心女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5773, '富士國際语学院', 35, 15);
INSERT INTO `tbl_schools` VALUES (5774, '茨城大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5775, '高崎商科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5776, '上越教育大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5777, '京都創成大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5778, '大阪日本語教育センター', 35, 15);
INSERT INTO `tbl_schools` VALUES (5779, '西日本国際教育学院', 35, 15);
INSERT INTO `tbl_schools` VALUES (5780, 'KCP地球市民日本语学校', 35, 15);
INSERT INTO `tbl_schools` VALUES (5781, 'デジタルハリウッド大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5782, '長岡技術科学大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5783, '長崎外國語大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5784, '大阪府立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5785, '帝塚山大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5786, '東京デザイナー学院', 35, 15);
INSERT INTO `tbl_schools` VALUES (5787, '東京ネットウエイブ ', 35, 15);
INSERT INTO `tbl_schools` VALUES (5788, '東京國際商貿学院', 35, 15);
INSERT INTO `tbl_schools` VALUES (5789, '東京中野日本語学院', 35, 15);
INSERT INTO `tbl_schools` VALUES (5790, '福島大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5791, '國立富山大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5792, '會津大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5793, '江戶文化中心', 35, 15);
INSERT INTO `tbl_schools` VALUES (5794, '京都情報大學院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5795, '九州國際大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5796, '久留米大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5797, '鈴鹿国際大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5798, '昴学园综合专门学校', 35, 15);
INSERT INTO `tbl_schools` VALUES (5799, '名古屋星城大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5800, '名古屋學院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5801, '千葉商科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5802, '青山学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5803, '日本东京テクノロジーコミュニケーション専門学校', 35, 15);
INSERT INTO `tbl_schools` VALUES (5804, '日本高松大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5805, '尚美學園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5806, '聖トマス大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5807, '文化女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5808, '香川大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5809, '新潟大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5810, '名古屋外国语大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5811, '聖学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5812, '大阪経済法科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5813, '九州情報大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5814, '東京城北日本語学院', 35, 15);
INSERT INTO `tbl_schools` VALUES (5815, '大阪観光大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5816, '秀明大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5817, '創価大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5818, '和歌山大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5819, '大妻女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5820, '横滨商科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5821, '首都大学東京', 35, 15);
INSERT INTO `tbl_schools` VALUES (5822, '武蔵野音楽大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5823, '東京モード学園', 35, 15);
INSERT INTO `tbl_schools` VALUES (5824, '东京芝浦外语学院', 35, 15);
INSERT INTO `tbl_schools` VALUES (5825, '名樱大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5826, '東京農工大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5827, '北陸先端科学技術大学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5828, '大阪工業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5829, 'JCL外国语学院', 35, 15);
INSERT INTO `tbl_schools` VALUES (5830, '麻生外语观光学院', 35, 15);
INSERT INTO `tbl_schools` VALUES (5831, '関東学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5832, '東洋学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5833, '日本杉野服饰大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5834, '倉敷芸術科学大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5835, '創造学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5836, '熊本学园大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5837, '東京山野美容專門学校', 35, 15);
INSERT INTO `tbl_schools` VALUES (5838, '琉球大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5839, '大阪商業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5840, '東京日本語教育センター', 35, 15);
INSERT INTO `tbl_schools` VALUES (5841, '摂南大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5842, '東京学芸大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5843, '日本创造学园大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5844, '青森大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5845, '東京医科歯科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5846, 'フェリス女学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5847, '愛知東邦大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5848, '愛知淑德大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5849, '中村学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5850, '松蔭大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5851, '山梨県立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5852, '武藏工业大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5853, '神奈川工科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5854, '日本经济大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5855, '国立山口大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5856, '東京言語教育学院', 35, 15);
INSERT INTO `tbl_schools` VALUES (5857, '芝浦工業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5858, '敬和學園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5859, '东京国际商贸学院', 35, 15);
INSERT INTO `tbl_schools` VALUES (5860, '神户艺术工科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5861, '姫路獨協大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5862, '西武文理大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5863, '東京外語專門学校', 35, 15);
INSERT INTO `tbl_schools` VALUES (5864, '東京外国語大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5865, '京都学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5866, '東京工芸大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5867, '東京聖德大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5868, '敬愛大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5869, '中央学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5870, '室蘭工業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5871, '日本工学院', 35, 15);
INSERT INTO `tbl_schools` VALUES (5872, '山陽学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5873, '札幌大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5874, '目白大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5875, '白鴎大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5876, '宝塚大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5877, '成城大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5878, '愛知県立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5879, '長崎国際大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5880, '共立女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5881, '北見工業大学 ', 35, 15);
INSERT INTO `tbl_schools` VALUES (5882, 'グロービス経営大学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5883, 'サイバー大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5884, 'テンプル大学ジャパン', 35, 15);
INSERT INTO `tbl_schools` VALUES (5885, 'ノースアジア大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5886, 'ノートルダム清心女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5887, 'ビジネス·ブレークスルー大学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5888, 'ものづくり大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5889, '愛知みずほ大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5890, '愛知教育大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5891, '愛知淑徳大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5892, '愛知国立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5893, '愛知国立看護大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5894, '愛知国立芸術大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5895, '愛知新城大谷大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5896, '愛知学泉大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5897, '愛知医科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5898, '八戸工業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5899, '八洲学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5900, '白梅学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5901, '阪南大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5902, '浜松学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5903, '浜松医科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5904, '宝塚造形艺术大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5905, '北海商科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5906, '北海学園北見大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5907, '北海学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5908, '北里大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5909, '北翔大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5910, '北星学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5911, '比治山大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5912, '兵庫大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5913, '兵庫教育大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5914, '兵庫国立看護大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5915, '兵庫医科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5916, '産能大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5917, '産業技術大学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5918, '産業医科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5919, '椙山女学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5920, '長岡大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5921, '長岡造形大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5922, '長崎ウエスレヤン大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5923, '長崎純心大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5924, '長崎総合科学大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5925, '長野大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5926, '長野国看護大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5927, '常磐会学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5928, '常盤大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5929, '常葉学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5930, '朝鮮大学校', 35, 15);
INSERT INTO `tbl_schools` VALUES (5931, '城西大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5932, '沖縄キリスト教学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5933, '沖縄大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5934, '沖縄国際大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5935, '沖縄国立看護大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5936, '沖縄国立芸術大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5937, '川崎医科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5938, '川崎医療福祉大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5939, '釧路公立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5940, '大阪歯科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5941, '大阪河崎リハビリテーション大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5942, '大阪教育大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5943, '大阪経済大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5944, '大阪明浄大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5945, '大阪女学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5946, '大阪女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5947, '大阪青山大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5948, '大阪人間科学大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5949, '大阪体育大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5950, '大阪学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5951, '大阪薬科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5952, '大阪医科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5953, '大阪音楽大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5954, '大阪樟蔭女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5955, '大阪総合保育大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5956, '大成学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5957, '大分国立看護科学大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5958, '大分医科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5959, '大宮法科大学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5960, '大谷大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5961, '大谷女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5962, '大手前大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5963, '大同工業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5964, '大原大学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5965, '大正大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5966, '帯広畜産大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5967, '島根国立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5968, '島根医科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5969, '道都大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5970, '徳島文理大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5971, '帝京科学大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5972, '帝塚山学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5973, '第一福祉大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5974, '第一工業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5975, '第一経済大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5976, '第一薬科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5977, '东北公益文科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5978, '東邦学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5979, '東邦音楽大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5980, '東北工業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5981, '東北女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5982, '東北生活文化大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5983, '東北文化学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5984, '東北学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5985, '東北薬科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5986, '東北芸術工科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5987, '東大阪大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5988, '東海大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5989, '東海女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5990, '東海学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5991, '東海学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5992, '東京成徳大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5993, '東京歯科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5994, '東京慈恵会医科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5995, '東京都立保健科学大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5996, '東京都立科学技術大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5997, '東京福祉大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5998, '東京基督教大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (5999, '東京家政大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6000, '東京家政学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6001, '東京女学館大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6002, '東京女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6003, '東京女子体育大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6004, '東京女子医科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6005, '東京情报大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6006, '東京商船大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6007, '東京神学大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6008, '東京聖栄大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6009, '東京水産大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6010, '東京未来大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6011, '東京薬科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6012, '東京医科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6013, '東京医療保健大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6014, '東京音楽大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6015, '東京造形大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6016, '東洋英和女学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6017, '都留文科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6018, '独協医科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6019, '多摩大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6020, '多摩美術大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6021, '仏教大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6022, '福岡歯科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6023, '福岡医療福祉大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6024, '福井工業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6025, '福井国立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6026, '福井医科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6027, '福山大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6028, '福山平成大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6029, '富山国立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6030, '岡山国立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6031, '岡山学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6032, '高岡法科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6033, '高崎健康福祉大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6034, '高千穂大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6035, '高松大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6036, '高野山大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6037, '高知大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6038, '高知工科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6039, '高知女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6040, '工学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6041, '公立函館未来大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6042, '宮崎産業経営大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6043, '宮崎公立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6044, '宮崎国際大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6045, '宮崎国立看護大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6046, '宮崎医科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6047, '共栄大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6048, '関東学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6049, '関西福祉大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6050, '関西福祉科学大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6051, '関西外国語大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6052, '関西医科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6053, '関西針灸大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6054, '広島女学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6055, '広島市立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6056, '広島文教女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6057, '広島国立保健福祉大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6058, '広島国立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6059, '広島修道大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6060, '国際大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6061, '国際仏教学大学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6062, '国際基督教大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6063, '国際教養大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6064, '国際武道大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6065, '国際医療福祉大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6066, '国立音楽大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6067, '国士館大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6068, '國学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6069, '和洋女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6070, '弘前学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6071, '花園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6072, '環太平洋大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6073, '皇学館大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6074, '恵泉女学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6075, '活水女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6076, '畿央大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6077, '跡見学園女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6078, '甲南大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6079, '甲南女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6080, '甲子園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6081, '江戸川大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6082, '金沢工業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6083, '金沢美術工芸大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6084, '金沢星稜大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6085, '金沢学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6086, '金沢医科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6087, '津田塾大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6088, '近大姫路大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6089, '近畿福祉大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6090, '京都光華女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6091, '京都教育大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6092, '京都精華大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6093, '京都橘女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6094, '京都女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6095, '京都情報大学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6096, '京都市立芸術大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6097, '京都文教大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6098, '京都薬科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6099, '京都医療科学大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6100, '京都造形芸術大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6101, '静岡大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6102, '静岡福祉大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6103, '静岡理工科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6104, '静岡文化芸術大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6105, '九州ルーテル学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6106, '九州保健福祉大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6107, '九州歯科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6108, '九州東海大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6109, '九州国際大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6110, '九州看護福祉大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6111, '九州女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6112, '九州栄養福祉大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6113, '九州芸術工科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6114, '久留米工業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6115, '駒沢女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6116, '駒澤大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6117, '郡山女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6118, '藍野大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6119, '酪農学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6120, '豊橋技術科学大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6121, '豊田工業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6122, '鈴鹿医療科学大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6123, '流通経済大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6124, '芦屋大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6125, '鹿屋体育大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6126, '梅光学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6127, '美作大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6128, '名古屋文理大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6129, '名古屋学芸大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6130, '名古屋音楽大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6131, '名古屋芸術大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6132, '名古屋造形芸術大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6133, '名寄市立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6134, '明治国際医療大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6135, '明治鍼灸大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6136, '鳴門教育大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6137, '那須大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6138, '女子美術大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6139, '女子栄養大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6140, '埼玉工業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6141, '埼玉国立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6142, '埼玉学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6143, '埼玉医科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6144, '千里金蘭大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6145, '千歳科学技術大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6146, '千葉経済大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6147, '前橋工科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6148, '青森公立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6149, '青森国立保健大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6150, '清和大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6151, '清泉女学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6152, '清泉女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6153, '秋田大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6154, '秋田経済法科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6155, '秋田看護福祉大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6156, '秋田国立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6157, '群馬パース大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6158, '群馬大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6159, '群馬社会福祉大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6160, '群馬国立女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6161, '群馬国立国民健康科学大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6162, '人間環境大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6163, '人間総合科学大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6164, '日本歯科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6165, '日本教育大学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6166, '日本女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6167, '日本女子体育大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6168, '日本橋学館大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6169, '日本社会事業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6170, '日本獣医畜産大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6171, '日本獣医生命科学大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6172, '日本体育大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6173, '日本文化大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6174, '日本薬科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6175, '日本医科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6176, '日本医療科学大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6177, '三育学院', 35, 15);
INSERT INTO `tbl_schools` VALUES (6178, '三重国立看護大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6179, '森ノ宮医療大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6180, '山口大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6181, '山口東京理科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6182, '山口福祉文化大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6183, '山口国立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6184, '山口学芸大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6185, '山梨英和大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6186, '山形国立保健医療大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6187, '杉野服飾大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6188, '上野学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6189, '尚絅大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6190, '尚絅学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6191, '身延山大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6192, '神戸ファッション造形大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6193, '神戸国際大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6194, '神戸海星女子学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6195, '神戸女学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6196, '神戸女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6197, '神戸情報大学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6198, '神戸親和女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6199, '神戸山手大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6200, '神戸商科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6201, '神戸市看護大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6202, '神戸市外国語大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6203, '神戸松蔭女子学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6204, '神戸夙川学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6205, '神戸薬科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6206, '神奈川歯科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6207, '神奈川国立保健福祉大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6208, '神田外語大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6209, '聖カタリナ女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6210, '聖マリアンナ医科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6211, '聖隷クリストファー看護大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6212, '聖路加看護大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6213, '聖母大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6214, '聖泉大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6215, '聖心女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6216, '実践女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6217, '事業創造大学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6218, '順天堂大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6219, '順心会看護医療大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6220, '四国学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6221, '四日市看護医療大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6222, '四天王寺国際仏教大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6223, '四條畷学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6224, '松山大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6225, '松山東雲女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6226, '松蔭女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6227, '同志社女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6228, '文星芸術大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6229, '西九州大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6230, '西南女学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6231, '西南学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6232, '洗足学園音楽大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6233, '仙台白百合女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6234, '仙台大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6235, '国立長崎シーボルト大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6236, '国立広島女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6237, '相模女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6238, '香川国立保健医療大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6239, '香川医科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6240, '湘南工科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6241, '新潟産業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6242, '新潟工科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6243, '新潟国際情報大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6244, '新潟青陵大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6245, '新潟国立看護大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6246, '新潟薬科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6247, '新潟医療福祉大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6248, '星薬科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6249, '旭川医科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6250, '学習院女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6251, '亜細亜大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6252, '岩手大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6253, '岩手医科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6254, '英知大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6255, '羽衣国際大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6256, '園田学園女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6257, '姫路工業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6258, '中国学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6259, 'LCA大学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6260, 'LEC東京リーガルマインド大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6261, 'いわき明星大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6262, 'エリザベト音楽大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6263, 'くらしき作陽大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6264, 'びわこ成蹊スポーツ大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6265, 'プール学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6266, 'ルーテル学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6267, '愛国学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6268, '愛媛国立医療技術大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6269, '愛知工科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6270, '安田女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6271, '奥羽大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6272, '八戸大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6273, '白百合女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6274, '北海道工業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6275, '北海道教育大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6276, '北海道浅井学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6277, '北海道情報大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6278, '北海道文教大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6279, '北海道薬科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6280, '成安造形大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6281, '崇城大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6282, '川村学園女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6283, '茨城キリスト教大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6284, '茨城国立医療大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6285, '大阪成蹊大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6286, '大阪大谷大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6287, '大阪電気通信大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6288, '東邦大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6289, '東北福祉大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6290, '東京家政学院筑波女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6291, '東京首都大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6292, '二松学舎大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6293, '福島国立医科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6294, '福島学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6295, '福岡教育大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6296, '福岡女学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6297, '福岡女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6298, '福岡国立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6299, '宮城大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6300, '宮城学院女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6301, '共愛学園前橋国際大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6302, '光産業創成大学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6303, '広島工業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6304, '広島国際大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6305, '広島経済大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6306, '函館大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6307, '和歌山国立医科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6308, '鶴見大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6309, '横浜商科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6310, '横浜薬科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6311, '金城大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6312, '金城学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6313, '京都ノートルダム女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6314, '京都府立医科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6315, '了徳寺大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6316, '鎌倉女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6317, '鹿児島純心女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6318, '麻布大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6319, '名古屋女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6320, '名古屋商科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6321, '奈良産業大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6322, '奈良大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6323, '奈良教育大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6324, '奈良先端科学技術大学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6325, '奈良国立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6326, '奈良国立医科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6327, '南九州大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6328, '鳥取大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6329, '鳥取環境大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6330, '平安女学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6331, '平成国際大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6332, '平成音楽大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6333, '浦和大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6334, '岐阜女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6335, '岐阜聖徳学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6336, '岐阜国立看護大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6337, '岐阜薬科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6338, '岐阜医療科学大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6339, '情报科学芸術大学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6340, '情報セキュリティ大学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6341, '萩国際大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6342, '仁愛大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6343, '日本赤十字北海道看護大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6344, '日本赤十字広島看護大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6345, '日本赤十字九州看護大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6346, '日本赤十字看護大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6347, '日本赤十字豊田看護大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6348, '日本福祉大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6349, '聖徳大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6350, '石川国立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6351, '石川国立看護大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6352, '淑徳大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6353, '四国大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6354, '松阪大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6355, '松本歯科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6356, '松本大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6357, '藤女子大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6358, '藤田大保健衛生学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6359, '天理大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6360, '天使大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6361, '田園調布学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6362, '同朋大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6363, '桐朋学園大学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6364, '桐蔭横浜大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6365, '尾道大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6366, '文化ファッション大学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6367, '呉大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6368, '武蔵大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6369, '相愛大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6370, '校防衛医科大学校', 35, 15);
INSERT INTO `tbl_schools` VALUES (6371, '校水産大学校', 35, 15);
INSERT INTO `tbl_schools` VALUES (6372, '星槎大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6373, '星城大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6374, '熊本保健科学大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6375, '熊本国立大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6376, '旭川大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6377, '学園桐朋大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6378, '桜花学園大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6379, '映画専門大学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6380, '宇部フロンティア大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6381, '宇都宮共和大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6382, '玉川大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6383, '长浜バイオ大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6384, '政策研究大学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6385, '筑波国際大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6386, '筑波技術大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6387, '筑波学院大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6388, '諏訪東京理科大学', 35, 15);
INSERT INTO `tbl_schools` VALUES (6389, 'Università degli Studi di Pavia', 35, 19);
INSERT INTO `tbl_schools` VALUES (6390, 'Politecnico di Milano', 35, 19);
INSERT INTO `tbl_schools` VALUES (6391, 'Università Commerciale Luigi Bocconi', 35, 19);
INSERT INTO `tbl_schools` VALUES (6392, 'Università degli studi di Milano', 35, 19);
INSERT INTO `tbl_schools` VALUES (6393, 'Università degli Studi di Trento', 35, 19);
INSERT INTO `tbl_schools` VALUES (6394, 'Polimoda International Institute of Fashion Design & Marketing', 35, 19);
INSERT INTO `tbl_schools` VALUES (6395, 'Università degli Studi di Firenze', 35, 19);
INSERT INTO `tbl_schools` VALUES (6396, 'Università Degli Studi Di Genova', 35, 19);
INSERT INTO `tbl_schools` VALUES (6397, 'Università di Bologna', 35, 19);
INSERT INTO `tbl_schools` VALUES (6398, 'Universita` degli studi di Padova', 35, 19);
INSERT INTO `tbl_schools` VALUES (6399, 'Università di Pisa', 35, 19);
INSERT INTO `tbl_schools` VALUES (6400, 'Università Politecnica delle MARCHE', 35, 19);
INSERT INTO `tbl_schools` VALUES (6401, 'Università degli Studi della BASILICATA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6402, 'Università degli Studi di BERGAMO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6403, 'Università degli Studi di BOLOGNA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6404, 'Università degli Studi di BRESCIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6405, 'Università degli Studi di CAGLIARI', 35, 19);
INSERT INTO `tbl_schools` VALUES (6406, 'Università della CALABRIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6407, 'Università degli Studi di CAMERINO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6408, 'Università degli Studi di CASSINO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6409, 'Università degli Studi di CATANIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6410, 'Università degli Studi "Magna Graecia" di CATANZARO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6411, 'Università degli Studi "G. d''Annunzio" CHIETI-PESCARA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6412, 'Università degli Studi di FERRARA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6413, 'Università degli Studi di FIRENZE', 35, 19);
INSERT INTO `tbl_schools` VALUES (6414, 'Università degli Studi di FOGGIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6415, 'Università degli Studi di GENOVA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6416, 'Università degli Studi INSUBRIA Varese-Como', 35, 19);
INSERT INTO `tbl_schools` VALUES (6417, 'Università degli Studi de L''AQUILA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6418, 'Università degli Studi di LECCE', 35, 19);
INSERT INTO `tbl_schools` VALUES (6419, 'Università degli Studi di MACERATA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6420, 'Università degli Studi di MESSINA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6421, 'Università degli Studi di MILANO-BICOCCA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6422, 'Università degli Studi di MODENA e REGGIO EMILIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6423, 'Università degli Studi del MOLISE', 35, 19);
INSERT INTO `tbl_schools` VALUES (6424, 'Università degli Studi di NAPOLI "Federico II', 35, 19);
INSERT INTO `tbl_schools` VALUES (6425, 'Seconda Università degli Studi di NAPOLI', 35, 19);
INSERT INTO `tbl_schools` VALUES (6426, 'Università degli Studi di NAPOLI "Parthenope', 35, 19);
INSERT INTO `tbl_schools` VALUES (6427, 'Università degli Studi di NAPOLI "L''Orientale"', 35, 19);
INSERT INTO `tbl_schools` VALUES (6428, 'Università degli Studi di PADOVA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6429, 'Università degli Studi di PALERMO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6430, 'Università degli Studi di PARMA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6431, 'Università degli Studi di PERUGIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6432, 'Università degli Studi del PIEMONTE ORIENTALE "Amedeo Avogadro"-Vercelli', 35, 19);
INSERT INTO `tbl_schools` VALUES (6433, 'Università di PISA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6434, 'Università degli Studi "Mediterranea" di REGGIO CALABRIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6435, 'Università degli Studi di ROMA "La Sapienza', 35, 19);
INSERT INTO `tbl_schools` VALUES (6436, 'Università degli Studi di ROMA "Tor Vergata', 35, 19);
INSERT INTO `tbl_schools` VALUES (6437, 'Università degli Studi ROMA TRE', 35, 19);
INSERT INTO `tbl_schools` VALUES (6438, 'Istituto Universitario di Scienze Motorie di ROMA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6439, 'Università Telematica GUGLIELMO MARCONI', 35, 19);
INSERT INTO `tbl_schools` VALUES (6440, 'Università degli Studi di SALERNO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6441, 'Università degli Studi del SANNIO di BENEVENTO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6442, 'Università degli Studi di SASSARI', 35, 19);
INSERT INTO `tbl_schools` VALUES (6443, 'Università degli Studi di SIENA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6444, 'Università degli Studi di TERAMO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6445, 'Università degli Studi di TORINO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6446, 'Università degli Studi di TRIESTE', 35, 19);
INSERT INTO `tbl_schools` VALUES (6447, 'Università degli Studi della TUSCIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6448, 'Università degli Studi di UDINE', 35, 19);
INSERT INTO `tbl_schools` VALUES (6449, 'Università degli Studi di URBINO "Carlo BO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6450, 'Università "Cà Foscari" di VENEZIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6451, 'Università IUAV di VENEZIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6452, 'Università degli Studi di VERONA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6453, 'Università della VALLE D''AOSTA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6454, 'Libera Università di BOLZANO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6455, 'Università degli Studi di BARI', 35, 19);
INSERT INTO `tbl_schools` VALUES (6456, 'LUM "Jean Monnet', 35, 19);
INSERT INTO `tbl_schools` VALUES (6457, 'Università Cattolica del Sacro Cuore', 35, 19);
INSERT INTO `tbl_schools` VALUES (6458, 'Libera Università "Vita Salute S.Raffaele" MILANO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6459, 'Libera Università di lingue e comunicazione IULM-MI', 35, 19);
INSERT INTO `tbl_schools` VALUES (6460, 'Istituto Universitario Suor Orsola Benincasa - NAPOLI', 35, 19);
INSERT INTO `tbl_schools` VALUES (6461, 'Libera Univ. Inter.le Studi Sociali "Guido Carli" LUISS-ROMA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6462, 'Libera Università degli Studi "Maria SS.Assunta" Roma', 35, 19);
INSERT INTO `tbl_schools` VALUES (6463, 'Università "Campus Bio-Medico" ROMA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6464, 'Libera Università degli Studi "S. Pio V" ROMA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6465, 'Università "Carlo Cattaneo" - LIUC', 35, 19);
INSERT INTO `tbl_schools` VALUES (6466, 'Politecnico di BARI', 35, 19);
INSERT INTO `tbl_schools` VALUES (6467, 'Politecnico di TORINO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6468, 'Università per Stranieri di PERUGIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6469, 'Università per Stranieri di SIENA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6470, 'Scuola Normale Superiore di Pisa', 35, 19);
INSERT INTO `tbl_schools` VALUES (6471, 'Scuola Superiore Sant''Anna di Pisa', 35, 19);
INSERT INTO `tbl_schools` VALUES (6472, 'Scuola Internazionale Superiore di Studi Avanzati di Trieste', 35, 19);
INSERT INTO `tbl_schools` VALUES (6473, 'Università Degli Studi Della Calabria', 35, 19);
INSERT INTO `tbl_schools` VALUES (6474, 'Istituto Marangoni', 35, 19);
INSERT INTO `tbl_schools` VALUES (6475, 'Accademia di belle arti "Aldo Galli" di COMO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6476, 'Accademia di belle arti "Carrara" di BERGAMO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6477, 'Accademia di belle arti "Cignaroli" di VERONA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6478, 'Accademia di belle arti "Demetrio Gagliardi" di SIRACUSA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6479, 'Accademia di belle arti "Lorenzo da Viterbo" di VITERBO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6480, 'Accademia di belle arti "Mediterranea" di MESSINA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6481, 'Accademia di belle arti "Michelangelo" di AGRIGENTO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6482, 'Accademia di belle arti "Nike" di CATANIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6483, 'Accademia di belle arti "Pietro Vannucci" di PERUGIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6484, 'Accademia di belle arti "S. Agata Li Battiati" di CATANIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6485, 'Accademia di belle arti DI BARI', 35, 19);
INSERT INTO `tbl_schools` VALUES (6486, 'Accademia di belle arti di BOLOGNA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6487, 'Accademia di belle arti di Brera di MILANO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6488, 'Accademia di belle arti di CARRARA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6489, 'Accademia di belle arti di CATANIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6490, 'Accademia di belle arti di CATANZARO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6491, 'Accademia di belle arti di CUNEO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6492, 'Accademia di belle arti di FIRENZE', 35, 19);
INSERT INTO `tbl_schools` VALUES (6493, 'Accademia di belle arti di FOGGIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6494, 'Accademia di belle arti di FROSINONE', 35, 19);
INSERT INTO `tbl_schools` VALUES (6495, 'Accademia di belle arti di L''AQUILA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6496, 'Accademia di belle arti di LECCE', 35, 19);
INSERT INTO `tbl_schools` VALUES (6497, 'Accademia di belle arti di MACERATA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6498, 'Accademia di belle arti di Naba di MILANO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6499, 'Accademia di belle arti di NAPOLI', 35, 19);
INSERT INTO `tbl_schools` VALUES (6500, 'Accademia di belle arti di PALERMO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6501, 'Accademia di belle arti di REGGIO CALABRIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6502, 'Accademia di belle arti di ROMA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6503, 'Accademia di belle arti di URBINO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6504, 'Accademia di belle arti di VENEZIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6505, 'Accademia nazionale di arte drammatica "Silvio D''Amico" ROMA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6506, 'Cnservatorio Ottorino Respighi di LATINA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6507, 'Conservartorio Jacopo Tomadini di UDINE', 35, 19);
INSERT INTO `tbl_schools` VALUES (6508, 'Conservatorio Agostino Steffani di CASTELFRANCO VENETO(TV)', 35, 19);
INSERT INTO `tbl_schools` VALUES (6509, 'Conservatorio Alfredo Casella di L''AQUILA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6510, 'Conservatorio Antonio Buzzolla di ADRIA (RO)', 35, 19);
INSERT INTO `tbl_schools` VALUES (6511, 'Conservatorio Antonio Scontrino di TRAPANI', 35, 19);
INSERT INTO `tbl_schools` VALUES (6512, 'Conservatorio Antonio Vivaldi di ALESSANDRIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6513, 'Conservatorio Arrigo Boito di PARMA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6514, 'Conservatorio Arrigo Pedrollo di VICENZA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6515, 'Conservatorio Benedetto Marcello-Palazzo Pisani di VENEZIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6516, 'Conservatorio Bruno Maderna di CESENA(FO)', 35, 19);
INSERT INTO `tbl_schools` VALUES (6517, 'Conservatorio Cesare Pollini di PADOVA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6518, 'Conservatorio Claudio Monteverdi di BOLZANO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6519, 'Conservatorio di MONOPOLI(BA)', 35, 19);
INSERT INTO `tbl_schools` VALUES (6520, 'Conservatorio di SALERNO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6521, 'Conservatorio Domenico Cimarosa di AVELLINO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6522, 'Conservatorio Egidio R. Duni di MATERA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6523, 'Conservatorio ex Collegio La Salle di BENEVENTO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6524, 'Conservatorio Fausto Torrefranca di VIBO VALENTIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6525, 'Conservatorio Felice E. Dall''Abaco di VERONA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6526, 'Conservatorio Francesco A. Bonporti-Sez.stacc. di Trento di RIVA DEL GARDA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6527, 'Conservatorio Francesco Antonio Bonporti di TRENTO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6528, 'Conservatorio Francesco Cilea di REGGIO CALABRIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6529, 'Conservatorio Francesco Morlacchi di PERUGIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6530, 'Conservatorio Francesco Venezze di ROVIGO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6531, 'Conservatorio G.F. Ghedini di CUNEO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6532, 'Conservatorio G.P. da Palestrina di CAGLIARI', 35, 19);
INSERT INTO `tbl_schools` VALUES (6533, 'Conservatorio Gesualdo da Venosa di POTENZA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6534, 'Conservatorio Giacomo Puccini di LA SPEZIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6535, 'Conservatorio Gioacchino Rossini di PESARO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6536, 'Conservatorio Giovambattista Pergolesi di FERMO(AP)', 35, 19);
INSERT INTO `tbl_schools` VALUES (6537, 'Conservatorio Giovan B. Martini di BOLOGNA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6538, 'Conservatorio Girolamo Frescobaldi di FERRARA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6539, 'Conservatorio Giuseppe Nicolini di PIACENZA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6540, 'Conservatorio Giuseppe Tartini di TRIESTE', 35, 19);
INSERT INTO `tbl_schools` VALUES (6541, 'Conservatorio Giuseppe Verdi di COMO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6542, 'Conservatorio Giuseppe Verdi di MILANO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6543, 'Conservatorio Giuseppe Verdi di TORINO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6544, 'Conservatorio Guido Cantelli di NOVARA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6545, 'Conservatorio Licinio Refice di FROSINONE', 35, 19);
INSERT INTO `tbl_schools` VALUES (6546, 'Conservatorio Lorenzo Perosi di CAMPOBASSO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6547, 'Conservatorio Luca Marenzio di BRESCIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6548, 'Conservatorio Luca Marenzio -sez.stacc. Brescia di DARFO-BOARIO TERME', 35, 19);
INSERT INTO `tbl_schools` VALUES (6549, 'Conservatorio LUCIO Campiani di MANTOVA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6550, 'Conservatorio Luigi Canepa di SASSARI', 35, 19);
INSERT INTO `tbl_schools` VALUES (6551, 'Conservatorio Luigi Cherubini di Firenze', 35, 19);
INSERT INTO `tbl_schools` VALUES (6552, 'Conservatorio Luisa d''Annunzio di PESCARA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6553, 'Conservatorio NiccoIú Piccinni di BARI', 35, 19);
INSERT INTO `tbl_schools` VALUES (6554, 'Conservatorio NicoIú Paganini di GENOVA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6555, 'Conservatorio S. Pietro a Majella di NAPOLI', 35, 19);
INSERT INTO `tbl_schools` VALUES (6556, 'Conservatorio Santa Cecilia di ROMA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6557, 'Conservatorio Stanislao Giacomoantonio di COSENZA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6558, 'Conservatorio Tito Schipa di LECCE', 35, 19);
INSERT INTO `tbl_schools` VALUES (6559, 'Conservatorio Umberto Giordano di FOGGIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6560, 'Conservatorio Vincenzo Bellini di PALERMO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6561, 'Istituto musicale pareggiato A. Tonelli di CARPI(MO)', 35, 19);
INSERT INTO `tbl_schools` VALUES (6562, 'Istituto musicale pareggiato Achille Peri di REGGIO EMILIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6563, 'Istituto musicale pareggiato della Valle di AOSTA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6564, 'Istituto musicale pareggiato DI CEGLIE MESSAPICA(BR)', 35, 19);
INSERT INTO `tbl_schools` VALUES (6565, 'Istituto musicale pareggiato Gaetano Braga di TERAMO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6566, 'Istituto musicale pareggiato Gaetano Donizetti di BERGAMO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6567, 'Istituto musicale pareggiato Giacomo Puccini di GALLARATE(VA)', 35, 19);
INSERT INTO `tbl_schools` VALUES (6568, 'Istituto musicale pareggiato Giovanni Paesiello di TARANTO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6569, 'Istituto musicale pareggiato Giulio Briccialdi di TERNI', 35, 19);
INSERT INTO `tbl_schools` VALUES (6570, 'Istituto musicale pareggiato Giuseppe Verdi di RAVENNA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6571, 'Istituto musicale pareggiato Luigi Boccherini di LUCCA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6572, 'Istituto musicale pareggiato Merulo di CASTELNUOVO NEI MONTI(RE)', 35, 19);
INSERT INTO `tbl_schools` VALUES (6573, 'Istituto musicale pareggiato Orazio Vecchi di MODENA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6574, 'Istituto musicale pareggiato Pietro Mascagni di LIVORNO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6575, 'Istituto musicale pareggiato R. Franci di SIENA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6576, 'Istituto musicale pareggiato Vincenzo Bellini di CALTANISETTA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6577, 'Istituto musicale pareggiato Vincenzo Bellini di CATANIA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6578, 'Istituto superiore per le industrie artistiche di FAENZA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6579, 'Istituto superiore per le industrie artistiche di FIRENZE', 35, 19);
INSERT INTO `tbl_schools` VALUES (6580, 'Istituto superiore per le industrie artistiche di ROMA', 35, 19);
INSERT INTO `tbl_schools` VALUES (6581, 'Istituto superiore per le industrie artistiche di URBINO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6582, 'Accademia di belle arti artilegalmente riconosciuta “A.C.M.E”di MILANO', 35, 19);
INSERT INTO `tbl_schools` VALUES (6583, 'l''universita degli studi di milano', 35, 19);
INSERT INTO `tbl_schools` VALUES (6584, '"Guglielmo Marconi" ROMA ', 35, 19);
INSERT INTO `tbl_schools` VALUES (6585, '"Leonardo da vinci" TORREVECCHIA TEATINA ', 35, 19);
INSERT INTO `tbl_schools` VALUES (6586, '"TEL.M.A." ROMA ', 35, 19);
INSERT INTO `tbl_schools` VALUES (6587, '"Uninettuno" ROMA ', 35, 19);
INSERT INTO `tbl_schools` VALUES (6588, 'Accademia di belle arti ALBERTINA DI TORINO ', 35, 19);
INSERT INTO `tbl_schools` VALUES (6589, 'Accademia di belle arti-LABA di BRESCIA ', 35, 19);
INSERT INTO `tbl_schools` VALUES (6590, 'Accademia di belle artilegalmente riconosciuta Carrara di BERGAMO ', 35, 19);
INSERT INTO `tbl_schools` VALUES (6591, 'Accademia di belle artilegalmente riconosciuta di RAVENNA ', 35, 19);
INSERT INTO `tbl_schools` VALUES (6592, 'Accademia di belle artilegalmente riconosciuta Libera', 35, 19);
INSERT INTO `tbl_schools` VALUES (6593, 'Accademia di belle artilegalmente riconosciuta"Santagiulia"di BRESCIA ', 35, 19);
INSERT INTO `tbl_schools` VALUES (6594, 'Istituto musicale pareggiato Franco Vittadini di PAVIA ', 35, 19);
INSERT INTO `tbl_schools` VALUES (6595, 'Istituto musicale pareggiato G.B.Pergolesi di ANCONA ', 35, 19);
INSERT INTO `tbl_schools` VALUES (6596, 'Istituto musicale pareggiato G.Lettimi di RIMINI ', 35, 19);
INSERT INTO `tbl_schools` VALUES (6597, 'Istituto musicale pareggiato"P.I. Tchaikovsky" di NOCERA TERINESE (CZ)', 35, 19);
INSERT INTO `tbl_schools` VALUES (6598, 'Istituto Universitario Orientale di NAPOLI ', 35, 19);
INSERT INTO `tbl_schools` VALUES (6599, 'Istituto Universitario S.Orsola Benincasa NAPOLI ', 35, 19);
INSERT INTO `tbl_schools` VALUES (6600, 'Libera Università "Campus bio-medico" ROMA ', 35, 19);
INSERT INTO `tbl_schools` VALUES (6601, 'Libera Università Internazionale degli Studi Sociali "Guido Carli"LUISS ROMA ', 35, 19);
INSERT INTO `tbl_schools` VALUES (6602, 'Libera Universitàdella sicilia Centrale "Kore" ENNA ', 35, 19);
INSERT INTO `tbl_schools` VALUES (6603, 'Seconda Università degli Studi di MILANO ', 35, 19);
INSERT INTO `tbl_schools` VALUES (6604, 'Terza Università degli Studi di Roma ', 35, 19);
INSERT INTO `tbl_schools` VALUES (6605, 'Università degli Studi dell''Aquila ', 35, 19);
INSERT INTO `tbl_schools` VALUES (6606, 'Università del Piemonte orientale " Amedeo Avogadro " VERCELLI ', 35, 19);
INSERT INTO `tbl_schools` VALUES (6607, 'Università dell’Insubria VARESE ', 35, 19);
INSERT INTO `tbl_schools` VALUES (6608, 'Università della Tuscia Viterbo ', 35, 19);
INSERT INTO `tbl_schools` VALUES (6609, 'Università di Modena e Reggio Emilia ', 35, 19);
INSERT INTO `tbl_schools` VALUES (6610, 'Università Vita-Salute San Raffaele MILANO ', 35, 19);
INSERT INTO `tbl_schools` VALUES (6611, 'Domus Academy', 35, 19);
INSERT INTO `tbl_schools` VALUES (6612, 'Polimoda International Institute of Fashion Design & Marketing', 35, 19);
INSERT INTO `tbl_schools` VALUES (6613, 'University College Dublin', 35, 20);
INSERT INTO `tbl_schools` VALUES (6614, 'Carlow Institute of Technology', 35, 20);
INSERT INTO `tbl_schools` VALUES (6615, 'Waterford Institute of Technology', 35, 20);
INSERT INTO `tbl_schools` VALUES (6616, 'Shannon College of Hotel Management', 35, 20);
INSERT INTO `tbl_schools` VALUES (6617, 'Maynooth National University of Ireland', 35, 20);
INSERT INTO `tbl_schools` VALUES (6618, 'University College Cork', 35, 20);
INSERT INTO `tbl_schools` VALUES (6619, 'Trinity College Dublin', 35, 20);
INSERT INTO `tbl_schools` VALUES (6620, 'University of Limerick', 35, 20);
INSERT INTO `tbl_schools` VALUES (6621, 'National University of Ireland,Galway', 35, 20);
INSERT INTO `tbl_schools` VALUES (6622, 'Dublin Business School', 35, 20);
INSERT INTO `tbl_schools` VALUES (6623, 'Dublin Institute of Technology', 35, 20);
INSERT INTO `tbl_schools` VALUES (6624, 'Athlone Institute of Technology', 35, 20);
INSERT INTO `tbl_schools` VALUES (6625, 'Dundalk Institute of Technology', 35, 20);
INSERT INTO `tbl_schools` VALUES (6626, 'Dublin City University', 35, 20);
INSERT INTO `tbl_schools` VALUES (6627, 'Institute of Technology Tralee', 35, 20);
INSERT INTO `tbl_schools` VALUES (6628, 'Griffith College Dublin', 35, 20);
INSERT INTO `tbl_schools` VALUES (6629, 'Galway-Mayo s Institute of Technology', 35, 20);
INSERT INTO `tbl_schools` VALUES (6630, 'Limerick Institute of Technology', 35, 20);
INSERT INTO `tbl_schools` VALUES (6631, 'Dutch Delta University', 35, 20);
INSERT INTO `tbl_schools` VALUES (6632, 'Cork Institute of Technology', 35, 20);
INSERT INTO `tbl_schools` VALUES (6633, 'Burren College of Art', 35, 20);
INSERT INTO `tbl_schools` VALUES (6634, 'Dún Laoghaire Institute of Art Design and Technology ', 35, 20);
INSERT INTO `tbl_schools` VALUES (6635, 'Galway-Mayo Institute of Technology', 35, 20);
INSERT INTO `tbl_schools` VALUES (6636, 'Holy Ghost College', 35, 20);
INSERT INTO `tbl_schools` VALUES (6637, 'HSI College', 35, 20);
INSERT INTO `tbl_schools` VALUES (6638, 'Institute of Technology Blanchardstown', 35, 20);
INSERT INTO `tbl_schools` VALUES (6639, 'Institute of Technology Carlow', 35, 20);
INSERT INTO `tbl_schools` VALUES (6640, 'Institute of Technology Tallaght', 35, 20);
INSERT INTO `tbl_schools` VALUES (6641, 'Irish Management Institute', 35, 20);
INSERT INTO `tbl_schools` VALUES (6642, 'Letterkenny Institute of Technology', 35, 20);
INSERT INTO `tbl_schools` VALUES (6643, 'LSB College', 35, 20);
INSERT INTO `tbl_schools` VALUES (6644, 'Mid West Business Institute', 35, 20);
INSERT INTO `tbl_schools` VALUES (6645, 'Milltown Institute of Theology & Philosophy', 35, 20);
INSERT INTO `tbl_schools` VALUES (6646, 'National College of Art and Design', 35, 20);
INSERT INTO `tbl_schools` VALUES (6647, 'National College of Ireland', 35, 20);
INSERT INTO `tbl_schools` VALUES (6648, 'National University of Ireland Galway (NUI GAL)', 35, 20);
INSERT INTO `tbl_schools` VALUES (6649, 'Portobello College', 35, 20);
INSERT INTO `tbl_schools` VALUES (6650, 'Royal College of Surgeons', 35, 20);
INSERT INTO `tbl_schools` VALUES (6651, 'St. Michaels House', 35, 20);
INSERT INTO `tbl_schools` VALUES (6652, 'St. Nicholas Montessori College Ireland', 35, 20);
INSERT INTO `tbl_schools` VALUES (6653, 'St. Patrick College', 35, 20);
INSERT INTO `tbl_schools` VALUES (6654, 'St.Angela''s College of Education', 35, 20);
INSERT INTO `tbl_schools` VALUES (6655, 'The Institute of Public Administration', 35, 20);
INSERT INTO `tbl_schools` VALUES (6656, 'Institute of Technology Sligo', 35, 20);
INSERT INTO `tbl_schools` VALUES (6657, 'Klaasiek Muziek', 35, 21);
INSERT INTO `tbl_schools` VALUES (6658, 'University of Groningen', 35, 21);
INSERT INTO `tbl_schools` VALUES (6659, 'Rotterdam Business School', 35, 21);
INSERT INTO `tbl_schools` VALUES (6660, 'Delft University of Technology', 35, 21);
INSERT INTO `tbl_schools` VALUES (6661, 'Erasmus Universiteit Rotterdam', 35, 21);
INSERT INTO `tbl_schools` VALUES (6662, 'Technische Universiteit Eindhoven', 35, 21);
INSERT INTO `tbl_schools` VALUES (6663, 'Uviversiteit Maastricht', 35, 21);
INSERT INTO `tbl_schools` VALUES (6664, 'Avans Hogeschool', 35, 21);
INSERT INTO `tbl_schools` VALUES (6665, 'Fontys University of Professional Education', 35, 21);
INSERT INTO `tbl_schools` VALUES (6666, 'Hogeschool Zuyd', 35, 21);
INSERT INTO `tbl_schools` VALUES (6667, 'CHN Universtiy', 35, 21);
INSERT INTO `tbl_schools` VALUES (6668, 'Noordelijke Hogeschool Leeuwarden', 35, 21);
INSERT INTO `tbl_schools` VALUES (6669, 'Universtiy of Twente', 35, 21);
INSERT INTO `tbl_schools` VALUES (6670, 'Utrecht University', 35, 21);
INSERT INTO `tbl_schools` VALUES (6671, 'Hogeschool Utrecht', 35, 21);
INSERT INTO `tbl_schools` VALUES (6672, 'Hanze University Groningen', 35, 21);
INSERT INTO `tbl_schools` VALUES (6673, 'Universiteit van Tilburg', 35, 21);
INSERT INTO `tbl_schools` VALUES (6674, 'International Business and Management Studies', 35, 21);
INSERT INTO `tbl_schools` VALUES (6675, 'Saxion Hogescholen', 35, 21);
INSERT INTO `tbl_schools` VALUES (6676, 'Hogescholen voor de Kunsten Utrecht', 35, 21);
INSERT INTO `tbl_schools` VALUES (6677, 'Leiden University', 35, 21);
INSERT INTO `tbl_schools` VALUES (6678, 'Wageningen University', 35, 21);
INSERT INTO `tbl_schools` VALUES (6679, 'HAN Uinversity', 35, 21);
INSERT INTO `tbl_schools` VALUES (6680, 'Hogeschool van arnhem en nigmegen', 35, 21);
INSERT INTO `tbl_schools` VALUES (6681, 'nhtv hogeschool', 35, 21);
INSERT INTO `tbl_schools` VALUES (6682, 'hogeschool van amsterdam', 35, 21);
INSERT INTO `tbl_schools` VALUES (6683, 'hogeschool inholland', 35, 21);
INSERT INTO `tbl_schools` VALUES (6684, 'VU', 35, 21);
INSERT INTO `tbl_schools` VALUES (6685, 'Koninklijk Conservatorium Den Haag', 35, 21);
INSERT INTO `tbl_schools` VALUES (6686, 'Hogeschool Zeeland', 35, 21);
INSERT INTO `tbl_schools` VALUES (6687, 'Stenden Hogeschool', 35, 21);
INSERT INTO `tbl_schools` VALUES (6688, 'Universiteit van Amsterdam', 35, 21);
INSERT INTO `tbl_schools` VALUES (6689, 'Wittenborg University of Professional Education', 35, 21);
INSERT INTO `tbl_schools` VALUES (6690, 'Haagse University', 35, 21);
INSERT INTO `tbl_schools` VALUES (6691, 'Design Academy Eindhoven', 35, 21);
INSERT INTO `tbl_schools` VALUES (6692, 'Radboud University Nijmegen', 35, 21);
INSERT INTO `tbl_schools` VALUES (6693, 'ArtEZ hogeschool voor de kunsten ', 35, 21);
INSERT INTO `tbl_schools` VALUES (6694, 'Christelijke Agrarische Hogeschool ', 35, 21);
INSERT INTO `tbl_schools` VALUES (6695, 'Christelijke Hogeschool Ede ', 35, 21);
INSERT INTO `tbl_schools` VALUES (6696, 'Christelijke Hogeschool Windesheim ', 35, 21);
INSERT INTO `tbl_schools` VALUES (6697, 'Gerrit Rietveld Academie ', 35, 21);
INSERT INTO `tbl_schools` VALUES (6698, 'HAS den Bosch ', 35, 21);
INSERT INTO `tbl_schools` VALUES (6699, 'Hogeschool INHOLLAND Alkmaar ', 35, 21);
INSERT INTO `tbl_schools` VALUES (6700, 'Hogeschool INHOLLAND Delft ', 35, 21);
INSERT INTO `tbl_schools` VALUES (6701, 'Hogeschool INHOLLAND Diemen ', 35, 21);
INSERT INTO `tbl_schools` VALUES (6702, 'Hogeschool INHOLLAND Haarlem ', 35, 21);
INSERT INTO `tbl_schools` VALUES (6703, 'Hogeschool INHOLLAND Rotterdam ', 35, 21);
INSERT INTO `tbl_schools` VALUES (6704, 'Hogeschool Leiden ', 35, 21);
INSERT INTO `tbl_schools` VALUES (6705, 'Hogeschool Rotterdam HRO ', 35, 21);
INSERT INTO `tbl_schools` VALUES (6706, 'IHS (Institute for Housing and Urban development Studies) ', 35, 21);
INSERT INTO `tbl_schools` VALUES (6707, 'Institute for Medical Technology Assessment ', 35, 21);
INSERT INTO `tbl_schools` VALUES (6708, 'Institute of Social Studies', 35, 21);
INSERT INTO `tbl_schools` VALUES (6709, 'Internationale Academie Fysiotherapie ', 35, 21);
INSERT INTO `tbl_schools` VALUES (6710, 'ITC (International Institute for Aerospace Survey and Earth Science) ', 35, 21);
INSERT INTO `tbl_schools` VALUES (6711, 'KIT (Royal Tropical Institute) ', 35, 21);
INSERT INTO `tbl_schools` VALUES (6712, 'MSM (Maastricht School of Management) ', 35, 21);
INSERT INTO `tbl_schools` VALUES (6713, 'RNTC (Radio Netherlands Training Centre) ', 35, 21);
INSERT INTO `tbl_schools` VALUES (6714, 'Rotterdamse Mode Academie ', 35, 21);
INSERT INTO `tbl_schools` VALUES (6715, 'STOAS ', 35, 21);
INSERT INTO `tbl_schools` VALUES (6716, 'Van Hall Larenstein ', 35, 21);
INSERT INTO `tbl_schools` VALUES (6717, 'Vrije Universiteit Amsterdam ', 35, 21);
INSERT INTO `tbl_schools` VALUES (6718, 'University of Malaya', 35, 10);
INSERT INTO `tbl_schools` VALUES (6719, 'Universiti Sains Malaysia', 35, 10);
INSERT INTO `tbl_schools` VALUES (6720, 'Universiti Kebangsaan Malaysia', 35, 10);
INSERT INTO `tbl_schools` VALUES (6721, 'Universiti Pertanian Malaysia', 35, 10);
INSERT INTO `tbl_schools` VALUES (6722, 'Help University College', 35, 10);
INSERT INTO `tbl_schools` VALUES (6723, 'Sunway University College', 35, 10);
INSERT INTO `tbl_schools` VALUES (6724, 'Nilai International University College', 35, 10);
INSERT INTO `tbl_schools` VALUES (6725, 'INTI International University College', 35, 10);
INSERT INTO `tbl_schools` VALUES (6726, 'SEGI College', 35, 10);
INSERT INTO `tbl_schools` VALUES (6727, 'University Malaysia Sabah', 35, 10);
INSERT INTO `tbl_schools` VALUES (6728, 'Stamford College', 35, 10);
INSERT INTO `tbl_schools` VALUES (6729, 'KBU International College', 35, 10);
INSERT INTO `tbl_schools` VALUES (6730, 'Taylor''s University College', 35, 10);
INSERT INTO `tbl_schools` VALUES (6731, 'Limkokwing University College of Creative Technology', 35, 10);
INSERT INTO `tbl_schools` VALUES (6732, 'International University College of Technology Twintech', 35, 10);
INSERT INTO `tbl_schools` VALUES (6733, 'Multimedia University', 35, 10);
INSERT INTO `tbl_schools` VALUES (6734, 'Universiti Utara Malaysia', 35, 10);
INSERT INTO `tbl_schools` VALUES (6735, 'University Malaysia Sarawak', 35, 10);
INSERT INTO `tbl_schools` VALUES (6736, 'Malaysian Insurance Institute', 35, 10);
INSERT INTO `tbl_schools` VALUES (6737, 'Kolej Damansara Utama Penang', 35, 10);
INSERT INTO `tbl_schools` VALUES (6738, 'International Islamic University Malaysia', 35, 10);
INSERT INTO `tbl_schools` VALUES (6739, 'International College Penang', 35, 10);
INSERT INTO `tbl_schools` VALUES (6740, 'Han Chiang College', 35, 10);
INSERT INTO `tbl_schools` VALUES (6741, 'Disted-Stamford College', 35, 10);
INSERT INTO `tbl_schools` VALUES (6742, 'Rima College', 35, 10);
INSERT INTO `tbl_schools` VALUES (6743, 'Tunku Abdul Rahman College', 35, 10);
INSERT INTO `tbl_schools` VALUES (6744, 'Sepang Institute of Technology', 35, 10);
INSERT INTO `tbl_schools` VALUES (6745, 'Sultan Zainal Abidin Islamic College', 35, 10);
INSERT INTO `tbl_schools` VALUES (6746, 'University of Tenaga Nasional', 35, 10);
INSERT INTO `tbl_schools` VALUES (6747, 'Universit Tun Abdul Razak', 35, 10);
INSERT INTO `tbl_schools` VALUES (6748, 'Dewan Bahasa dan Pustaka', 35, 10);
INSERT INTO `tbl_schools` VALUES (6749, 'Universiti Teknologi Malaysia', 35, 10);
INSERT INTO `tbl_schools` VALUES (6750, 'UCSI University', 35, 10);
INSERT INTO `tbl_schools` VALUES (6751, 'Katholieke Universiteit Leuven', 35, 10);
INSERT INTO `tbl_schools` VALUES (6752, 'Asia Pacific Institute of Information Technology', 35, 10);
INSERT INTO `tbl_schools` VALUES (6753, 'Kolej Damansara Utama Petaling Jaya', 35, 10);
INSERT INTO `tbl_schools` VALUES (6754, 'Alfa International College', 35, 10);
INSERT INTO `tbl_schools` VALUES (6755, 'University Malaysia Pahang', 35, 10);
INSERT INTO `tbl_schools` VALUES (6756, 'INTI university college', 35, 10);
INSERT INTO `tbl_schools` VALUES (6757, 'Linton College', 35, 10);
INSERT INTO `tbl_schools` VALUES (6758, 'unity college international', 35, 10);
INSERT INTO `tbl_schools` VALUES (6759, 'Binary University College of Management And Entrepreneurship ', 35, 10);
INSERT INTO `tbl_schools` VALUES (6760, 'Institut Putra ', 35, 10);
INSERT INTO `tbl_schools` VALUES (6761, 'Institut Teknologi Pertama ', 35, 10);
INSERT INTO `tbl_schools` VALUES (6762, 'INTI College Malaysia ', 35, 10);
INSERT INTO `tbl_schools` VALUES (6763, 'INTI College Sarawak ', 35, 10);
INSERT INTO `tbl_schools` VALUES (6764, 'INTI College Subang Jaya ', 35, 10);
INSERT INTO `tbl_schools` VALUES (6765, 'Kemayan Advance Tertiary College ', 35, 10);
INSERT INTO `tbl_schools` VALUES (6766, 'Kuala Lumpur Infrastructure University College ', 35, 10);
INSERT INTO `tbl_schools` VALUES (6767, 'Mantissa Institute ', 35, 10);
INSERT INTO `tbl_schools` VALUES (6768, 'Monash University Malaysia Campus ', 35, 10);
INSERT INTO `tbl_schools` VALUES (6769, 'Prime College ', 35, 10);
INSERT INTO `tbl_schools` VALUES (6770, 'Southern College ', 35, 10);
INSERT INTO `tbl_schools` VALUES (6771, 'Swinburne Sarawak Institute of Technology ', 35, 10);
INSERT INTO `tbl_schools` VALUES (6772, 'Systematic College Kuala Lumpur ', 35, 10);
INSERT INTO `tbl_schools` VALUES (6773, 'Systematic College Penang ', 35, 10);
INSERT INTO `tbl_schools` VALUES (6774, 'Taylor’s College Subang Jaya', 35, 10);
INSERT INTO `tbl_schools` VALUES (6775, 'Taylor’s College School of Hospitality and Tourism', 35, 10);
INSERT INTO `tbl_schools` VALUES (6776, 'The University of Nottingham in Malaysia ', 35, 10);
INSERT INTO `tbl_schools` VALUES (6777, 'TPM-Academy ', 35, 10);
INSERT INTO `tbl_schools` VALUES (6778, 'Universiti Malaysia Sabah ', 35, 10);
INSERT INTO `tbl_schools` VALUES (6779, 'École Polytechnique Fédérale de Lausanne', 35, 22);
INSERT INTO `tbl_schools` VALUES (6780, 'Université de Fribourg', 35, 22);
INSERT INTO `tbl_schools` VALUES (6781, 'Eidgenössische Technische Hochschule Zürich', 35, 22);
INSERT INTO `tbl_schools` VALUES (6782, 'Universität Basel', 35, 22);
INSERT INTO `tbl_schools` VALUES (6783, 'Universität Bern', 35, 22);
INSERT INTO `tbl_schools` VALUES (6784, 'Université de Genève', 35, 22);
INSERT INTO `tbl_schools` VALUES (6785, 'Université de Lausanne', 35, 22);
INSERT INTO `tbl_schools` VALUES (6786, 'Universität Luzern', 35, 22);
INSERT INTO `tbl_schools` VALUES (6787, 'Université de Neuchâtel', 35, 22);
INSERT INTO `tbl_schools` VALUES (6788, 'Universität St. Gallen', 35, 22);
INSERT INTO `tbl_schools` VALUES (6789, 'Universität Zürich', 35, 22);
INSERT INTO `tbl_schools` VALUES (6790, 'César Ritz Colleges', 35, 22);
INSERT INTO `tbl_schools` VALUES (6791, 'Ecole Hoteliere de Lausanne', 35, 22);
INSERT INTO `tbl_schools` VALUES (6792, 'Hochschule der Künste Bern', 35, 22);
INSERT INTO `tbl_schools` VALUES (6793, 'Les Roches Swiss Hotel Association School Of Hotel Managment', 35, 22);
INSERT INTO `tbl_schools` VALUES (6794, 'Glion Institute of Higher Education', 35, 22);
INSERT INTO `tbl_schools` VALUES (6795, 'SSTH Swiss School of Tourism and Hospitality', 35, 22);
INSERT INTO `tbl_schools` VALUES (6796, 'DCT International Hotel and Business Management School', 35, 22);
INSERT INTO `tbl_schools` VALUES (6797, 'Swiss Hotel Management School', 35, 22);
INSERT INTO `tbl_schools` VALUES (6798, 'Berner Fachhochschule ', 35, 22);
INSERT INTO `tbl_schools` VALUES (6799, 'Eidgenössische Anstalt für Wasserversorgung', 35, 22);
INSERT INTO `tbl_schools` VALUES (6800, 'Eidgenössische Forschungsanstalt für Wald', 35, 22);
INSERT INTO `tbl_schools` VALUES (6801, 'Eidgenössische Materialprüfungs- und Forschungsanstalt ', 35, 22);
INSERT INTO `tbl_schools` VALUES (6802, 'Fachhochschule Nordwestschweiz ', 35, 22);
INSERT INTO `tbl_schools` VALUES (6803, 'Fachhochschule Ostschweiz ', 35, 22);
INSERT INTO `tbl_schools` VALUES (6804, 'Fachhochschule Zentralschweiz ', 35, 22);
INSERT INTO `tbl_schools` VALUES (6805, 'Haute école Spécialisée de Suisse occidentale ', 35, 22);
INSERT INTO `tbl_schools` VALUES (6806, 'Institut de hautes études en administration ', 35, 22);
INSERT INTO `tbl_schools` VALUES (6807, 'Institut universitaire de hautes études internationales ', 35, 22);
INSERT INTO `tbl_schools` VALUES (6808, 'Institut universitaire Kurt B?sch ', 35, 22);
INSERT INTO `tbl_schools` VALUES (6809, 'P?dagogische Hochschule St. Gallen ', 35, 22);
INSERT INTO `tbl_schools` VALUES (6810, 'Paule Scherrer Institut ', 35, 22);
INSERT INTO `tbl_schools` VALUES (6811, 'Scuola universitaria professionale della Svizzera italiana ', 35, 22);
INSERT INTO `tbl_schools` VALUES (6812, 'Università della Svizzera italiana', 35, 22);
INSERT INTO `tbl_schools` VALUES (6813, 'Zürich Fachhochschule ', 35, 22);
INSERT INTO `tbl_schools` VALUES (6814, 'Hotel and Tourism Management institute ', 35, 22);
INSERT INTO `tbl_schools` VALUES (6815, 'Webster University ', 35, 22);
INSERT INTO `tbl_schools` VALUES (6816, 'Assumption University of Thailand', 35, 9);
INSERT INTO `tbl_schools` VALUES (6817, 'Asian Institute of Technology', 35, 9);
INSERT INTO `tbl_schools` VALUES (6818, 'Asian University Of Science And Technology', 35, 9);
INSERT INTO `tbl_schools` VALUES (6819, 'Bangkok University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6820, 'Burapha University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6821, 'Chiang Mai University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6822, 'Christian University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6823, 'Chulalongkorn University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6824, 'Eastern Asia University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6825, 'Kasem Bundit University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6826, 'Kasetsart University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6827, 'Maejo University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6828, 'Mahanakorn University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6829, 'Mahidol University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6830, 'Naresuan University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6831, 'North-Chiang Mai University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6832, 'Ramkhamhaeng University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6833, 'Rangsit University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6834, 'Siam University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6835, 'Silpakorn University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6836, 'Sripatum University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6837, 'Sukhothai Thammathirat Open University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6838, 'Thammasat University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6839, 'Ubon Rajathanee University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6840, 'Yonok College', 35, 9);
INSERT INTO `tbl_schools` VALUES (6841, 'KhonKaen University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6842, 'Stamford International University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6843, 'Uttaradit Rajabhat University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6844, 'Lampang Rajaphat University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6845, 'University of the Thai Chamber of Commerce', 35, 9);
INSERT INTO `tbl_schools` VALUES (6846, 'Rachabhat Chandrakasem University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6847, 'Mae Fah Luang University', 35, 9);
INSERT INTO `tbl_schools` VALUES (6848, 'Rajamangala University of Technology ', 35, 9);
INSERT INTO `tbl_schools` VALUES (6849, 'National Institute of Development Administration', 35, 9);
INSERT INTO `tbl_schools` VALUES (6850, 'луганский национальный педагогический университет', 35, 23);
INSERT INTO `tbl_schools` VALUES (6851, 'Донецкий национальный университет ', 35, 23);
INSERT INTO `tbl_schools` VALUES (6852, 'Национальный Фармацевтический Университет', 35, 23);
INSERT INTO `tbl_schools` VALUES (6853, 'Харьковский Национальный Университет им. В. Н. Каразина', 35, 23);
INSERT INTO `tbl_schools` VALUES (6854, 'Днепропетровский национальный университет им', 35, 23);
INSERT INTO `tbl_schools` VALUES (6855, 'Киевский национальный университет технологи и дизайна', 35, 23);
INSERT INTO `tbl_schools` VALUES (6856, 'Приазовский государственный технический университет', 35, 23);
INSERT INTO `tbl_schools` VALUES (6857, 'национальна музична академия украины имени П.И.Чайковського', 35, 23);
INSERT INTO `tbl_schools` VALUES (6858, 'Харьковский государственный академия дизайну', 35, 23);
INSERT INTO `tbl_schools` VALUES (6859, 'Национальный аэрокосмический университет им.Н.Е.Жуковского', 35, 23);
INSERT INTO `tbl_schools` VALUES (6860, 'луганский национальный аграрный университет', 35, 23);
INSERT INTO `tbl_schools` VALUES (6861, 'национальний транспортний университет', 35, 23);
INSERT INTO `tbl_schools` VALUES (6862, 'Национальный технический университет украины', 35, 23);
INSERT INTO `tbl_schools` VALUES (6863, 'національна академія образотворчого мистецтва і архітектури', 35, 23);
INSERT INTO `tbl_schools` VALUES (6864, 'Киевский Национальный лингвистический университет', 35, 23);
INSERT INTO `tbl_schools` VALUES (6865, 'национальная металлургическая академия', 35, 23);
INSERT INTO `tbl_schools` VALUES (6866, 'Таврический национальный университет им. В. И. Вернадского', 35, 23);
INSERT INTO `tbl_schools` VALUES (6867, 'украинская медицинская стоматологическая академия', 35, 23);
INSERT INTO `tbl_schools` VALUES (6868, 'Український державний хіміко-технологічний університет', 35, 23);
INSERT INTO `tbl_schools` VALUES (6869, 'Харківська державна академія культури', 35, 23);
INSERT INTO `tbl_schools` VALUES (6870, 'Харьковский национальный педагогический университет ', 35, 23);
INSERT INTO `tbl_schools` VALUES (6871, 'Харьковского государственного университета искусств им.И.П.Котляревского', 35, 23);
INSERT INTO `tbl_schools` VALUES (6872, 'Вінницький національний технічний університет', 35, 23);
INSERT INTO `tbl_schools` VALUES (6873, 'Киевский национальный лингвистический университет', 35, 23);
INSERT INTO `tbl_schools` VALUES (6874, 'Львівський національний медичний університет імені Данила Галицького', 35, 23);
INSERT INTO `tbl_schools` VALUES (6875, 'Харьковский политехнический институт ', 35, 23);
INSERT INTO `tbl_schools` VALUES (6876, 'Донецкий национальный медицинский университет им.А.М.Горького', 35, 23);
INSERT INTO `tbl_schools` VALUES (6877, 'НАЦІОНАЛЬНИЙ УНІВЕРСИТЕТ "ЛЬВІВСЬКА ПОЛІТЕХНІКА', 35, 23);
INSERT INTO `tbl_schools` VALUES (6878, 'Национальный университет физического воспитания и спорта Украины', 35, 23);
INSERT INTO `tbl_schools` VALUES (6879, 'Національний педагогічний університет імені М.П.Драгоманова', 35, 23);
INSERT INTO `tbl_schools` VALUES (6880, 'University of the Witswatersrand, Johannesburg', 35, 24);
INSERT INTO `tbl_schools` VALUES (6881, 'University of Johannesburg', 35, 24);
INSERT INTO `tbl_schools` VALUES (6882, 'University of Cape Town', 35, 24);
INSERT INTO `tbl_schools` VALUES (6883, 'University of Pretoria', 35, 24);
INSERT INTO `tbl_schools` VALUES (6884, 'Cape Peninsula University of Technology', 35, 24);
INSERT INTO `tbl_schools` VALUES (6885, 'University of the Western Cape', 35, 24);
INSERT INTO `tbl_schools` VALUES (6886, 'Roedean School (SA)', 35, 24);
INSERT INTO `tbl_schools` VALUES (6887, 'Universidad de La Habana', 35, 24);
INSERT INTO `tbl_schools` VALUES (6888, 'Northlink Collage', 35, 24);
INSERT INTO `tbl_schools` VALUES (6889, 'Stellenbosch University', 35, 24);
INSERT INTO `tbl_schools` VALUES (6890, 'University Of The Free State', 35, 24);
INSERT INTO `tbl_schools` VALUES (6891, 'Eastern Cape University of Technology ', 35, 24);
INSERT INTO `tbl_schools` VALUES (6892, 'Mangosuthu Technikon ', 35, 24);
INSERT INTO `tbl_schools` VALUES (6893, 'Nelson Mandela Metropolitan University ', 35, 24);
INSERT INTO `tbl_schools` VALUES (6894, 'North-West University ', 35, 24);
INSERT INTO `tbl_schools` VALUES (6895, 'Rhodes University ', 35, 24);
INSERT INTO `tbl_schools` VALUES (6896, 'The Durban Institute of Technology ', 35, 24);
INSERT INTO `tbl_schools` VALUES (6897, 'Tshwane University of Technology ', 35, 24);
INSERT INTO `tbl_schools` VALUES (6898, 'University of Fort Hare ', 35, 24);
INSERT INTO `tbl_schools` VALUES (6899, 'University of Limpopo ', 35, 24);
INSERT INTO `tbl_schools` VALUES (6900, 'University of Natal ', 35, 24);
INSERT INTO `tbl_schools` VALUES (6901, 'University of South Africa ', 35, 24);
INSERT INTO `tbl_schools` VALUES (6902, 'University of Venda ', 35, 24);
INSERT INTO `tbl_schools` VALUES (6903, 'University of Zululand ', 35, 24);
INSERT INTO `tbl_schools` VALUES (6904, 'Vaal Triangle Technikon ', 35, 24);
INSERT INTO `tbl_schools` VALUES (6905, 'Wist University ', 35, 24);
INSERT INTO `tbl_schools` VALUES (6906, 'Åbo Akademi University', 35, 25);
INSERT INTO `tbl_schools` VALUES (6907, 'University of Helsinki', 35, 25);
INSERT INTO `tbl_schools` VALUES (6908, 'University of Eastern Finland', 35, 25);
INSERT INTO `tbl_schools` VALUES (6909, 'University of Jyväskylä', 35, 25);
INSERT INTO `tbl_schools` VALUES (6910, 'University of Lapland', 35, 25);
INSERT INTO `tbl_schools` VALUES (6911, 'University of Oulu', 35, 25);
INSERT INTO `tbl_schools` VALUES (6912, 'University of Tampere', 35, 25);
INSERT INTO `tbl_schools` VALUES (6913, 'University of Turku', 35, 25);
INSERT INTO `tbl_schools` VALUES (6914, 'University of Vaasa', 35, 25);
INSERT INTO `tbl_schools` VALUES (6915, 'Helsinki University of Technology', 35, 25);
INSERT INTO `tbl_schools` VALUES (6916, 'Lappeenranta University of Technology', 35, 25);
INSERT INTO `tbl_schools` VALUES (6917, 'Tampere University of Technology', 35, 25);
INSERT INTO `tbl_schools` VALUES (6918, 'Helsinki School of Economics', 35, 25);
INSERT INTO `tbl_schools` VALUES (6919, 'Swedish School of Economics and Business Administration', 35, 25);
INSERT INTO `tbl_schools` VALUES (6920, 'Turku School of Economics and Business Administration', 35, 25);
INSERT INTO `tbl_schools` VALUES (6921, 'Academy of Fine Arts', 35, 25);
INSERT INTO `tbl_schools` VALUES (6922, 'Sibelius Academy', 35, 25);
INSERT INTO `tbl_schools` VALUES (6923, 'Theatre Academy', 35, 25);
INSERT INTO `tbl_schools` VALUES (6924, 'University of Art and Design Helsinki', 35, 25);
INSERT INTO `tbl_schools` VALUES (6925, 'Kymenlaakso University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6926, 'Lahti University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6927, 'Kemi-Tornio University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6928, 'Laurea University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6929, 'HAAGA-HELIA University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6930, 'HAMK University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6931, 'Åland University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6932, 'Arcada University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6933, 'Central Ostrobothnia University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6934, 'Diaconia University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6935, 'EVTEK University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6936, 'Humak University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6937, 'Jyväskylä University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6938, 'Kajaani University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6939, 'Mikkeli University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6940, 'North Karelia University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6941, 'Oulu University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6942, 'Pirkanmaa University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6943, 'Rovaniemi University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6944, 'Satakunta University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6945, 'Savonia University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6946, 'Seinäjoki University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6947, 'South Karelia University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6948, 'Southwest University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6949, 'Stadia University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6950, 'Swedish University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6951, 'Tampere University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6952, 'Turku University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6953, 'Vaasa University of Applied Sciences', 35, 25);
INSERT INTO `tbl_schools` VALUES (6954, 'Aalto University', 35, 25);
INSERT INTO `tbl_schools` VALUES (6955, 'Åbo Akademi', 35, 25);
INSERT INTO `tbl_schools` VALUES (6956, 'Haaga Yhtymä', 35, 25);
INSERT INTO `tbl_schools` VALUES (6957, 'HAAGA-HELIA ammattikorkeakoulu', 35, 25);
INSERT INTO `tbl_schools` VALUES (6958, 'Hämeen ammattikorkeakoulu', 35, 25);
INSERT INTO `tbl_schools` VALUES (6959, 'Högskolan på Åland', 35, 25);
INSERT INTO `tbl_schools` VALUES (6960, 'Humanistinen ammattikorkeakoulu', 35, 25);
INSERT INTO `tbl_schools` VALUES (6961, 'Kansainvälinen Metropolia', 35, 25);
INSERT INTO `tbl_schools` VALUES (6962, 'Kuvataideakatemia', 35, 25);
INSERT INTO `tbl_schools` VALUES (6963, 'Kymenlaakson ammattikorkeakoulu', 35, 25);
INSERT INTO `tbl_schools` VALUES (6964, 'Metropolia Ammattikorkeakoulu', 35, 25);
INSERT INTO `tbl_schools` VALUES (6965, 'Pirkanmaan ammattikorkeakoulu', 35, 25);
INSERT INTO `tbl_schools` VALUES (6966, 'Savonia-ammattikorkeakoulu', 35, 25);
INSERT INTO `tbl_schools` VALUES (6967, 'Chalmers tekniska högskola', 35, 26);
INSERT INTO `tbl_schools` VALUES (6968, 'Göteborgs universitet', 35, 26);
INSERT INTO `tbl_schools` VALUES (6969, 'Kungliga Tekniska högskolan', 35, 26);
INSERT INTO `tbl_schools` VALUES (6970, 'Lund University', 35, 26);
INSERT INTO `tbl_schools` VALUES (6971, 'Uppsala University', 35, 26);
INSERT INTO `tbl_schools` VALUES (6972, 'Linköping University', 35, 26);
INSERT INTO `tbl_schools` VALUES (6973, 'Stockholms universitet', 35, 26);
INSERT INTO `tbl_schools` VALUES (6974, 'Umeå Universitet', 35, 26);
INSERT INTO `tbl_schools` VALUES (6975, 'Karolinska Institutet', 35, 26);
INSERT INTO `tbl_schools` VALUES (6976, 'Blekinge Institute of Technology', 35, 26);
INSERT INTO `tbl_schools` VALUES (6977, 'Jönköping University', 35, 26);
INSERT INTO `tbl_schools` VALUES (6978, 'Högskolan Väst', 35, 26);
INSERT INTO `tbl_schools` VALUES (6979, 'Högskolan Dalarna', 35, 26);
INSERT INTO `tbl_schools` VALUES (6980, 'Luleå Tekniska Universitet', 35, 26);
INSERT INTO `tbl_schools` VALUES (6981, 'Mälardalens högskola', 35, 26);
INSERT INTO `tbl_schools` VALUES (6982, 'Högskolan i Kristianstad', 35, 26);
INSERT INTO `tbl_schools` VALUES (6983, 'Konstfack University College of Arts Crafts and Design', 35, 26);
INSERT INTO `tbl_schools` VALUES (6984, 'Örebro Universitet', 35, 26);
INSERT INTO `tbl_schools` VALUES (6985, 'Högskolan i Borås', 35, 26);
INSERT INTO `tbl_schools` VALUES (6986, 'Växjö University', 35, 26);
INSERT INTO `tbl_schools` VALUES (6987, 'Högskolan i Halmstad', 35, 26);
INSERT INTO `tbl_schools` VALUES (6988, 'Högskolan i Gävle', 35, 26);
INSERT INTO `tbl_schools` VALUES (6989, 'Malmö högskola', 35, 26);
INSERT INTO `tbl_schools` VALUES (6990, 'Sveriges lantbruksuniversitet', 35, 26);
INSERT INTO `tbl_schools` VALUES (6991, 'Linnaeus University', 35, 26);
INSERT INTO `tbl_schools` VALUES (6992, 'Malmö University', 35, 26);
INSERT INTO `tbl_schools` VALUES (6993, 'Högskolan i Skövde', 35, 26);
INSERT INTO `tbl_schools` VALUES (6994, 'Blekinge tekniska högskola', 35, 26);
INSERT INTO `tbl_schools` VALUES (6995, 'Danshögskolan', 35, 26);
INSERT INTO `tbl_schools` VALUES (6996, 'Dramatiska institutet', 35, 26);
INSERT INTO `tbl_schools` VALUES (6997, 'Gymnastik- och idrottshögskolan', 35, 26);
INSERT INTO `tbl_schools` VALUES (6998, 'Handelshögskolan i Stockholm', 35, 26);
INSERT INTO `tbl_schools` VALUES (6999, 'Högskolan i Jönköping', 35, 26);
INSERT INTO `tbl_schools` VALUES (7000, 'Högskolan i Kalma', 35, 26);
INSERT INTO `tbl_schools` VALUES (7001, 'Högskolan på Gotland', 35, 26);
INSERT INTO `tbl_schools` VALUES (7002, 'Karlstads universitet', 35, 26);
INSERT INTO `tbl_schools` VALUES (7003, 'Kungl. Musikhögskolan', 35, 26);
INSERT INTO `tbl_schools` VALUES (7004, 'Kungliga Konsthögskolan', 35, 26);
INSERT INTO `tbl_schools` VALUES (7005, 'Mittuniversitetet', 35, 26);
INSERT INTO `tbl_schools` VALUES (7006, 'Operahögskolan I Stockholm', 35, 26);
INSERT INTO `tbl_schools` VALUES (7007, 'Södertörns högskola', 35, 26);
INSERT INTO `tbl_schools` VALUES (7008, 'Teaterhögskolan I Stockholm', 35, 26);
INSERT INTO `tbl_schools` VALUES (7009, 'World Marine University', 35, 26);
INSERT INTO `tbl_schools` VALUES (7010, 'Universidad de Salamanca', 35, 28);
INSERT INTO `tbl_schools` VALUES (7011, 'Universidad de Jaén', 35, 28);
INSERT INTO `tbl_schools` VALUES (7012, 'Universidad de Granada', 35, 28);
INSERT INTO `tbl_schools` VALUES (7013, 'Universitat Ramon Llull', 35, 28);
INSERT INTO `tbl_schools` VALUES (7014, 'Universidad Autónoma de Barcelona', 35, 28);
INSERT INTO `tbl_schools` VALUES (7015, 'European University', 35, 28);
INSERT INTO `tbl_schools` VALUES (7016, 'Universidad Complutense de Madrid', 35, 28);
INSERT INTO `tbl_schools` VALUES (7017, 'Universidad de León', 35, 28);
INSERT INTO `tbl_schools` VALUES (7018, 'Universitat de Barcelona', 35, 28);
INSERT INTO `tbl_schools` VALUES (7019, 'Universidad de la Rioja', 35, 28);
INSERT INTO `tbl_schools` VALUES (7020, 'Universidad de Málaga', 35, 28);
INSERT INTO `tbl_schools` VALUES (7021, 'Universidad Politécnica de Cartagena', 35, 28);
INSERT INTO `tbl_schools` VALUES (7022, 'Universidad de Castilla la Mancha', 35, 28);
INSERT INTO `tbl_schools` VALUES (7023, 'Universidad Autónoma de Madrid', 35, 28);
INSERT INTO `tbl_schools` VALUES (7024, 'Universidad de Alcalá', 35, 28);
INSERT INTO `tbl_schools` VALUES (7025, 'Universidad Pública de Navarra', 35, 28);
INSERT INTO `tbl_schools` VALUES (7026, 'ESADE Business School', 35, 28);
INSERT INTO `tbl_schools` VALUES (7027, 'Universitat de les Illes Balears', 35, 28);
INSERT INTO `tbl_schools` VALUES (7028, 'Universidad de valencia estudi general', 35, 28);
INSERT INTO `tbl_schools` VALUES (7029, 'Universidad de La Habana', 35, 28);
INSERT INTO `tbl_schools` VALUES (7030, 'Universidad de Sevilla', 35, 28);
INSERT INTO `tbl_schools` VALUES (7031, 'Universitat d''Alacant', 35, 28);
INSERT INTO `tbl_schools` VALUES (7032, 'Universitat Juan Carlos III ', 35, 28);
INSERT INTO `tbl_schools` VALUES (7033, 'Universitat Rovira i Virgili', 35, 28);
INSERT INTO `tbl_schools` VALUES (7034, 'Universitat Don Quixote', 35, 28);
INSERT INTO `tbl_schools` VALUES (7035, 'Universidad de Burgos', 35, 28);
INSERT INTO `tbl_schools` VALUES (7036, 'Universidad Politécnica de Madrid', 35, 28);
INSERT INTO `tbl_schools` VALUES (7037, 'Universidad Politécnica de Valencia', 35, 28);
INSERT INTO `tbl_schools` VALUES (7038, 'Universidad Rey Juan Carlos', 35, 28);
INSERT INTO `tbl_schools` VALUES (7039, 'Universitat Pompeu Fabra', 35, 28);
INSERT INTO `tbl_schools` VALUES (7040, 'Universidad de Córdoba', 35, 28);
INSERT INTO `tbl_schools` VALUES (7041, 'Universidad Carlos III de Madrid', 35, 28);
INSERT INTO `tbl_schools` VALUES (7042, 'Universidad de Almería', 35, 28);
INSERT INTO `tbl_schools` VALUES (7043, 'Universidad de Cádiz', 35, 28);
INSERT INTO `tbl_schools` VALUES (7044, 'Universidad de Cantabria', 35, 28);
INSERT INTO `tbl_schools` VALUES (7045, 'Universidad de Extremadura', 35, 28);
INSERT INTO `tbl_schools` VALUES (7046, 'Universidad de Huelva', 35, 28);
INSERT INTO `tbl_schools` VALUES (7047, 'Universidad de la Laguna', 35, 28);
INSERT INTO `tbl_schools` VALUES (7048, 'Universidad de Las Palmas de Gran Canaria', 35, 28);
INSERT INTO `tbl_schools` VALUES (7049, 'Universidad de Murcia', 35, 28);
INSERT INTO `tbl_schools` VALUES (7050, 'Universidad de Oviedo', 35, 28);
INSERT INTO `tbl_schools` VALUES (7051, 'Universidad de Santiago de Compostela', 35, 28);
INSERT INTO `tbl_schools` VALUES (7052, 'Universidad de Valladolid', 35, 28);
INSERT INTO `tbl_schools` VALUES (7053, 'Universidad de Zaragoza', 35, 28);
INSERT INTO `tbl_schools` VALUES (7054, 'Universidad del Pais Vasco', 35, 28);
INSERT INTO `tbl_schools` VALUES (7055, 'Universidad Internacional de Andalucía', 35, 28);
INSERT INTO `tbl_schools` VALUES (7056, 'Universidad Internacional Menéndez Pelayo', 35, 28);
INSERT INTO `tbl_schools` VALUES (7057, 'Universidad Miguel Hernández de Elche', 35, 28);
INSERT INTO `tbl_schools` VALUES (7058, 'Universidad Nacional de Educaaión a Distancia', 35, 28);
INSERT INTO `tbl_schools` VALUES (7059, 'Universidad Pablo de Olavide', 35, 28);
INSERT INTO `tbl_schools` VALUES (7060, 'Universidad Politécnica de Cataluña', 35, 28);
INSERT INTO `tbl_schools` VALUES (7061, 'Universidade da Coruña', 35, 28);
INSERT INTO `tbl_schools` VALUES (7062, 'Universidade de Vigo', 35, 28);
INSERT INTO `tbl_schools` VALUES (7063, 'Universitat de Girona', 35, 28);
INSERT INTO `tbl_schools` VALUES (7064, 'Universitat de Lleida', 35, 28);
INSERT INTO `tbl_schools` VALUES (7065, 'Universitat Jaume I', 35, 28);
INSERT INTO `tbl_schools` VALUES (7066, 'Académie royale des Beaux-Arts de Liège', 35, 29);
INSERT INTO `tbl_schools` VALUES (7067, 'Institut des arts de diffusion', 35, 29);
INSERT INTO `tbl_schools` VALUES (7068, 'Académie royale des Beaux-Arts de Bruxelles', 35, 29);
INSERT INTO `tbl_schools` VALUES (7069, 'Haute Ecole Charlemagne', 35, 29);
INSERT INTO `tbl_schools` VALUES (7070, 'Haute Ecole provinciale de Charleroi - Université du travail', 35, 29);
INSERT INTO `tbl_schools` VALUES (7071, 'Haute Ecole Léonard de Vinci', 35, 29);
INSERT INTO `tbl_schools` VALUES (7072, 'Université de Liège', 35, 29);
INSERT INTO `tbl_schools` VALUES (7073, 'Université libre de Bruxelles', 35, 29);
INSERT INTO `tbl_schools` VALUES (7074, 'Université catholique de Louvain', 35, 29);
INSERT INTO `tbl_schools` VALUES (7075, 'Katholieke Hogeschool Brugge-Oostende', 35, 29);
INSERT INTO `tbl_schools` VALUES (7076, 'Katholieke Hogeschool Leuven', 35, 29);
INSERT INTO `tbl_schools` VALUES (7077, 'Hogeschool Groep-T Leuven', 35, 29);
INSERT INTO `tbl_schools` VALUES (7078, 'KUB Kathalicke Universiteit Brussel', 35, 29);
INSERT INTO `tbl_schools` VALUES (7079, 'Katholieke Universiteit Leuven', 35, 29);
INSERT INTO `tbl_schools` VALUES (7080, 'Universiteit Antwerpen', 35, 29);
INSERT INTO `tbl_schools` VALUES (7081, 'Académie des Beaux-Arts et des Arts décoratifs de Tournai', 35, 29);
INSERT INTO `tbl_schools` VALUES (7082, 'Arteveldehogeschool', 35, 29);
INSERT INTO `tbl_schools` VALUES (7083, 'Conservatoire royal de musique de Bruxelles', 35, 29);
INSERT INTO `tbl_schools` VALUES (7084, 'Conservatoire royal de musique de Liège', 35, 29);
INSERT INTO `tbl_schools` VALUES (7085, 'Conservatoire royal de musique de Mons', 35, 29);
INSERT INTO `tbl_schools` VALUES (7086, 'Ecole nationale supérieure des Arts visuels de la Cambre', 35, 29);
INSERT INTO `tbl_schools` VALUES (7087, 'Ecole supérieure des arts plastiques et visuels de Mons', 35, 29);
INSERT INTO `tbl_schools` VALUES (7088, 'Erasmushogeschool Brussel', 35, 29);
INSERT INTO `tbl_schools` VALUES (7089, 'Etablissement communal d''enseignement supérieur artistique', 35, 29);
INSERT INTO `tbl_schools` VALUES (7090, 'Facultés universitaires Notre-Dame de la Paix', 35, 29);
INSERT INTO `tbl_schools` VALUES (7091, 'FISAG Faculté universitaire des sciences agronomiques de Gembloux', 35, 29);
INSERT INTO `tbl_schools` VALUES (7092, 'FPMS Faculté polytechnique de Mons', 35, 29);
INSERT INTO `tbl_schools` VALUES (7093, 'FUCAM Facultés universitaires catholiques de Mons', 35, 29);
INSERT INTO `tbl_schools` VALUES (7094, 'FUSL Facultés unversitaires Saint-Louis', 35, 29);
INSERT INTO `tbl_schools` VALUES (7095, 'HEAJ Haute Ecole Albert Jacquard', 35, 29);
INSERT INTO `tbl_schools` VALUES (7096, 'HEB Haute Ecole de Bruxelles', 35, 29);
INSERT INTO `tbl_schools` VALUES (7097, 'HECFH Haute Ecole de la Communauté França du Hainaut', 35, 29);
INSERT INTO `tbl_schools` VALUES (7098, 'HECHE Haute Ecole catholique Charleroi-Europe', 35, 29);
INSERT INTO `tbl_schools` VALUES (7099, 'HEGAL Haute Ecole Galilée', 35, 29);
INSERT INTO `tbl_schools` VALUES (7100, 'HEHEC Haute Ecole HEC - Liège', 35, 29);
INSERT INTO `tbl_schools` VALUES (7101, 'HEISELL Haute Ecole ISELL', 35, 29);
INSERT INTO `tbl_schools` VALUES (7102, 'HEL Haute Ecole de la Ville de Liège', 35, 29);
INSERT INTO `tbl_schools` VALUES (7103, 'HELB Haute Ecole Libre de Bruxelles Ilya Prigogine', 35, 29);
INSERT INTO `tbl_schools` VALUES (7104, 'HELdB Haute Ecole Lucia de Brouckère', 35, 29);
INSERT INTO `tbl_schools` VALUES (7105, 'HELHO Haute Ecole Libre du Hainaut Occidental', 35, 29);
INSERT INTO `tbl_schools` VALUES (7106, 'HENAC Haute Ecole Namuroise Catholique', 35, 29);
INSERT INTO `tbl_schools` VALUES (7107, 'HEPAS Haute Ecole catholique du Luxembourg Blaise Pascal', 35, 29);
INSERT INTO `tbl_schools` VALUES (7108, 'HEPHO Haute Ecole provinciale du Hainaut Occidental', 35, 29);
INSERT INTO `tbl_schools` VALUES (7109, 'HEPMBC Haute Ecole provinciale Mons-Borinage-Centre', 35, 29);
INSERT INTO `tbl_schools` VALUES (7110, 'HEPN Haute Ecole de la Province de Namur', 35, 29);
INSERT INTO `tbl_schools` VALUES (7111, 'HERB Haute Ecole Roi Baudouin', 35, 29);
INSERT INTO `tbl_schools` VALUES (7112, 'HESCH Haute Ecole de la Communauté França du Luxembourg ', 35, 29);
INSERT INTO `tbl_schools` VALUES (7113, 'HESPA Haute Ecole de la Communauté França Paul-Henri Spaak', 35, 29);
INSERT INTO `tbl_schools` VALUES (7114, 'HETRO Haute Ecole de la Province de Liège Léon-Eli Troclet', 35, 29);
INSERT INTO `tbl_schools` VALUES (7115, 'Hogere Zeevaartschool', 35, 29);
INSERT INTO `tbl_schools` VALUES (7116, 'Hogeschool Antwerpen', 35, 29);
INSERT INTO `tbl_schools` VALUES (7117, 'Hogeschool Gent', 35, 29);
INSERT INTO `tbl_schools` VALUES (7118, 'Hogeschool Sint-Lukas Brussel', 35, 29);
INSERT INTO `tbl_schools` VALUES (7119, 'Hogeschool voor Wetenschap & Kunst', 35, 29);
INSERT INTO `tbl_schools` VALUES (7120, 'Hogeschool West-Vlaanderen', 35, 29);
INSERT INTO `tbl_schools` VALUES (7121, 'IMEP Institut supérieur de musique et de pédagogique', 35, 29);
INSERT INTO `tbl_schools` VALUES (7122, 'Institut Saint-Luc', 35, 29);
INSERT INTO `tbl_schools` VALUES (7123, 'Institut supérieur d''architecture - Saint-Luc', 35, 29);
INSERT INTO `tbl_schools` VALUES (7124, 'Institut supérieur d''architecture de la Communauté França / LA CAMBRE', 35, 29);
INSERT INTO `tbl_schools` VALUES (7125, 'Institut supérieur d''architecture Saint-Luc de Wallonie', 35, 29);
INSERT INTO `tbl_schools` VALUES (7126, 'Instituut Voor Tropische Geneeskunde', 35, 29);
INSERT INTO `tbl_schools` VALUES (7127, 'Karel de Grote-Hogeschool', 35, 29);
INSERT INTO `tbl_schools` VALUES (7128, 'Katholieke Hogeschool Kempen', 35, 29);
INSERT INTO `tbl_schools` VALUES (7129, 'Katholieke Hogeschool Limburg', 35, 29);
INSERT INTO `tbl_schools` VALUES (7130, 'Katholieke Hogeschool Mechelen', 35, 29);
INSERT INTO `tbl_schools` VALUES (7131, 'Katholieke Hogeschool Sint-Lieven', 35, 29);
INSERT INTO `tbl_schools` VALUES (7132, 'Katholieke Hogeschool Suid-West-Vlaanderen', 35, 29);
INSERT INTO `tbl_schools` VALUES (7133, 'Lessius Hogeschool', 35, 29);
INSERT INTO `tbl_schools` VALUES (7134, 'Plantijnhogeschool', 35, 29);
INSERT INTO `tbl_schools` VALUES (7135, 'Provinciale Hogeschool Limburg', 35, 29);
INSERT INTO `tbl_schools` VALUES (7136, 'Transnationale Universiteit Limburg (TUL)', 35, 29);
INSERT INTO `tbl_schools` VALUES (7137, 'Université de Mons-Hainaut', 35, 29);
INSERT INTO `tbl_schools` VALUES (7138, 'Universiteit Gent', 35, 29);
INSERT INTO `tbl_schools` VALUES (7139, 'Vlerick Leuven-Gent Management School', 35, 29);
INSERT INTO `tbl_schools` VALUES (7140, 'Vrije Universiteit Brussel', 35, 29);
INSERT INTO `tbl_schools` VALUES (7141, 'IOB Instituut Voor Ontwikkelingsbeleiden-beheer', 35, 29);
INSERT INTO `tbl_schools` VALUES (7142, 'Handelshøyskolen BI', 35, 30);
INSERT INTO `tbl_schools` VALUES (7143, 'Norges musikkhøgskole', 35, 30);
INSERT INTO `tbl_schools` VALUES (7144, 'Kunsthøgskolen I Oslo', 35, 30);
INSERT INTO `tbl_schools` VALUES (7145, 'Arkitektur- og designhøgskolen I Oslo', 35, 30);
INSERT INTO `tbl_schools` VALUES (7146, 'Agricultural University of Norway，Aas', 35, 30);
INSERT INTO `tbl_schools` VALUES (7147, 'Universitetet I Tromsø', 35, 30);
INSERT INTO `tbl_schools` VALUES (7148, 'Norges teknisk-naturvitenskapelige universitet', 35, 30);
INSERT INTO `tbl_schools` VALUES (7149, 'Universitetet I Bergen', 35, 30);
INSERT INTO `tbl_schools` VALUES (7150, 'Universitetet I Oslo', 35, 30);
INSERT INTO `tbl_schools` VALUES (7151, 'Høgskulen I Volda', 35, 30);
INSERT INTO `tbl_schools` VALUES (7152, 'Høgskolen I Vestfold', 35, 30);
INSERT INTO `tbl_schools` VALUES (7153, 'Universitetet I Stavanger', 35, 30);
INSERT INTO `tbl_schools` VALUES (7154, 'Høgskolen I Oslo', 35, 30);
INSERT INTO `tbl_schools` VALUES (7155, 'Narvik University College', 35, 30);
INSERT INTO `tbl_schools` VALUES (7156, 'HØgskolen I Østfold', 35, 30);
INSERT INTO `tbl_schools` VALUES (7157, 'Høgskolen i Narvik', 35, 30);
INSERT INTO `tbl_schools` VALUES (7158, 'Høgskolen i Molde', 35, 30);
INSERT INTO `tbl_schools` VALUES (7159, 'Høgskolen i Telemark', 35, 30);
INSERT INTO `tbl_schools` VALUES (7160, 'Universitetet I Agder', 35, 30);
INSERT INTO `tbl_schools` VALUES (7161, 'Norwegian School of Economics and Business Administration', 35, 30);
INSERT INTO `tbl_schools` VALUES (7162, 'Harstad University college', 35, 30);
INSERT INTO `tbl_schools` VALUES (7163, 'Aalesund University College', 35, 30);
INSERT INTO `tbl_schools` VALUES (7164, 'Høgskolen i Bodø', 35, 30);
INSERT INTO `tbl_schools` VALUES (7165, 'Høgskolen I Ålesund', 35, 30);
INSERT INTO `tbl_schools` VALUES (7166, 'Høgskolen I Akershus', 35, 30);
INSERT INTO `tbl_schools` VALUES (7167, 'Høgskolen I Bergen', 35, 30);
INSERT INTO `tbl_schools` VALUES (7168, 'Høgskolen I Buskerud', 35, 30);
INSERT INTO `tbl_schools` VALUES (7169, 'Høgskolen I Finnmark', 35, 30);
INSERT INTO `tbl_schools` VALUES (7170, 'Høgskolen I Gjøvik', 35, 30);
INSERT INTO `tbl_schools` VALUES (7171, 'Høgskolen I Harstad', 35, 30);
INSERT INTO `tbl_schools` VALUES (7172, 'Høgskolen I Hedmark', 35, 30);
INSERT INTO `tbl_schools` VALUES (7173, 'Høgskolen I Lillehammer', 35, 30);
INSERT INTO `tbl_schools` VALUES (7174, 'Høgskolen I Nord-Trøndelag', 35, 30);
INSERT INTO `tbl_schools` VALUES (7175, 'Høgskolen I Srø-Trøndelag', 35, 30);
INSERT INTO `tbl_schools` VALUES (7176, 'Høgskolen Stord/Haugesund', 35, 30);
INSERT INTO `tbl_schools` VALUES (7177, 'Høgskulen I Sogn og Fjordane', 35, 30);
INSERT INTO `tbl_schools` VALUES (7178, 'Kunsthøgskolen I Bergen', 35, 30);
INSERT INTO `tbl_schools` VALUES (7179, 'Sámi allaskuvla', 35, 30);
INSERT INTO `tbl_schools` VALUES (7180, 'Universitetet for miljø- og biovitenskap', 35, 30);
INSERT INTO `tbl_schools` VALUES (7181, 'Norges Handelshøyskole', 35, 30);
INSERT INTO `tbl_schools` VALUES (7182, 'IT University of Copenhagen', 35, 31);
INSERT INTO `tbl_schools` VALUES (7183, 'Danmarks Tekniske Universitet ', 35, 31);
INSERT INTO `tbl_schools` VALUES (7184, 'Aalborg Universiet', 35, 31);
INSERT INTO `tbl_schools` VALUES (7185, 'Roskilde Universitet', 35, 31);
INSERT INTO `tbl_schools` VALUES (7186, 'Syddansk Universitet ', 35, 31);
INSERT INTO `tbl_schools` VALUES (7187, 'Aarhus Universitet', 35, 31);
INSERT INTO `tbl_schools` VALUES (7188, 'Københavns Universitet ', 35, 31);
INSERT INTO `tbl_schools` VALUES (7189, 'Ingeniørhøjskolen i København', 35, 31);
INSERT INTO `tbl_schools` VALUES (7190, 'Niels Brock Business College', 35, 31);
INSERT INTO `tbl_schools` VALUES (7191, 'Roskilde Business College', 35, 31);
INSERT INTO `tbl_schools` VALUES (7192, 'Suhr''s University College', 35, 31);
INSERT INTO `tbl_schools` VALUES (7193, 'VIA University College', 35, 31);
INSERT INTO `tbl_schools` VALUES (7194, 'Copenhagen Technical Academy', 35, 31);
INSERT INTO `tbl_schools` VALUES (7195, 'Copenhagen Business School', 35, 31);
INSERT INTO `tbl_schools` VALUES (7196, 'Det Kgl. Danske Musikkonservatorium ', 35, 31);
INSERT INTO `tbl_schools` VALUES (7197, 'The Danish Business Academy', 35, 31);
INSERT INTO `tbl_schools` VALUES (7198, 'Arkitektskolen Aarhus ', 35, 31);
INSERT INTO `tbl_schools` VALUES (7199, 'Danmarks Farmaceutiske Universitet ', 35, 31);
INSERT INTO `tbl_schools` VALUES (7200, 'Danmarks Pødagogiske Universitetsskole ', 35, 31);
INSERT INTO `tbl_schools` VALUES (7201, 'Det Biovidenskabelige Fakultet for Fødevarer', 35, 31);
INSERT INTO `tbl_schools` VALUES (7202, 'Det Jyske Musikkonservatorium ', 35, 31);
INSERT INTO `tbl_schools` VALUES (7203, 'Det Kongelige Danske Kunstakademi ', 35, 31);
INSERT INTO `tbl_schools` VALUES (7204, 'Handelshøjskolen i København ', 35, 31);
INSERT INTO `tbl_schools` VALUES (7205, 'Handelshøjskolen', 35, 31);
INSERT INTO `tbl_schools` VALUES (7206, 'Ingeniørhøjskolen i ørhus ', 35, 31);
INSERT INTO `tbl_schools` VALUES (7207, 'The Multidisciplinary University College of Copenhagen', 35, 31);
INSERT INTO `tbl_schools` VALUES (7208, 'University College Lillebaelt', 35, 31);
INSERT INTO `tbl_schools` VALUES (7209, 'University College of Northern Denmark', 35, 31);
INSERT INTO `tbl_schools` VALUES (7210, 'University College Sealand', 35, 31);
INSERT INTO `tbl_schools` VALUES (7211, 'University College South', 35, 31);
INSERT INTO `tbl_schools` VALUES (7212, 'West Jutland University College', 35, 31);
INSERT INTO `tbl_schools` VALUES (7213, 'Aarhus University', 35, 31);
INSERT INTO `tbl_schools` VALUES (7214, 'University of the Philippines ', 35, 12);
INSERT INTO `tbl_schools` VALUES (7215, 'University of Santo Tomas', 35, 12);
INSERT INTO `tbl_schools` VALUES (7216, 'De La Salle University', 35, 12);
INSERT INTO `tbl_schools` VALUES (7217, 'Far Eastern University ', 35, 12);
INSERT INTO `tbl_schools` VALUES (7218, 'Ateneo De Manila University', 35, 12);
INSERT INTO `tbl_schools` VALUES (7219, 'Asian Institute of Management', 35, 12);
INSERT INTO `tbl_schools` VALUES (7220, 'Jose Rizal University', 35, 12);
INSERT INTO `tbl_schools` VALUES (7221, 'Centro Escolar University', 35, 12);
INSERT INTO `tbl_schools` VALUES (7222, 'Saint Louis University', 35, 12);
INSERT INTO `tbl_schools` VALUES (7223, 'University of Baguio', 35, 12);
INSERT INTO `tbl_schools` VALUES (7224, 'St.paul University', 35, 12);
INSERT INTO `tbl_schools` VALUES (7225, 'Divine Word College of San Jose', 35, 12);
INSERT INTO `tbl_schools` VALUES (7226, 'Ramon Magsaysay Technological University', 35, 12);
INSERT INTO `tbl_schools` VALUES (7227, 'International Academy of Management and Economics', 35, 12);
INSERT INTO `tbl_schools` VALUES (7228, 'Technological University of the Philippines ', 35, 12);
INSERT INTO `tbl_schools` VALUES (7229, 'Uuniversity of the east', 35, 12);
INSERT INTO `tbl_schools` VALUES (7230, 'la consolacion college manila', 35, 12);
INSERT INTO `tbl_schools` VALUES (7231, 'Adamson University ', 35, 12);
INSERT INTO `tbl_schools` VALUES (7232, 'Bulacan State University ', 35, 12);
INSERT INTO `tbl_schools` VALUES (7233, 'Cavite State University ', 35, 12);
INSERT INTO `tbl_schools` VALUES (7234, 'Central Luzon State University ', 35, 12);
INSERT INTO `tbl_schools` VALUES (7235, 'Central Mindanao University ', 35, 12);
INSERT INTO `tbl_schools` VALUES (7236, 'Central Philippines University ', 35, 12);
INSERT INTO `tbl_schools` VALUES (7237, 'Holy Angel University ', 35, 12);
INSERT INTO `tbl_schools` VALUES (7238, 'Mapua Institute of Technology ', 35, 12);
INSERT INTO `tbl_schools` VALUES (7239, 'Mariano Marcos State University ', 35, 12);
INSERT INTO `tbl_schools` VALUES (7240, 'Mindanao State University ', 35, 12);
INSERT INTO `tbl_schools` VALUES (7241, 'Nueva Ecija University of Science and Technology ', 35, 12);
INSERT INTO `tbl_schools` VALUES (7242, 'Pangasinan State University ', 35, 12);
INSERT INTO `tbl_schools` VALUES (7243, 'Philippine Normal University ', 35, 12);
INSERT INTO `tbl_schools` VALUES (7244, 'Polytechnic University of the Philippines ', 35, 12);
INSERT INTO `tbl_schools` VALUES (7245, 'Saint Paul University ', 35, 12);
INSERT INTO `tbl_schools` VALUES (7246, 'Silliman University ', 35, 12);
INSERT INTO `tbl_schools` VALUES (7247, 'Tarlac State University ', 35, 12);
INSERT INTO `tbl_schools` VALUES (7248, 'University of Cordillera ', 35, 12);
INSERT INTO `tbl_schools` VALUES (7249, 'University of Rizal System-Rizal State College ', 35, 12);
INSERT INTO `tbl_schools` VALUES (7250, 'University of San Carlos ', 35, 12);
INSERT INTO `tbl_schools` VALUES (7251, 'Uniwersytet Warszawski', 35, 32);
INSERT INTO `tbl_schools` VALUES (7252, 'Uniwersytet w Białymstoku', 35, 32);
INSERT INTO `tbl_schools` VALUES (7253, 'Uniwersytet Gdański', 35, 32);
INSERT INTO `tbl_schools` VALUES (7254, 'Politechnika Warszawska', 35, 32);
INSERT INTO `tbl_schools` VALUES (7255, 'Politechnika Białostocka', 35, 32);
INSERT INTO `tbl_schools` VALUES (7256, 'Akademia Ekonomiczna im. Karola Adamieckiego', 35, 32);
INSERT INTO `tbl_schools` VALUES (7257, 'Akademia Ekonomiczna w Krakowie', 35, 32);
INSERT INTO `tbl_schools` VALUES (7258, 'Akademia Muzyczna w Krakowie', 35, 32);
INSERT INTO `tbl_schools` VALUES (7259, 'AGH-University of Science and Technology', 35, 32);
INSERT INTO `tbl_schools` VALUES (7260, 'Uniwersytet Wrocławski', 35, 32);
INSERT INTO `tbl_schools` VALUES (7261, 'Politechnika Gdanska', 35, 32);
INSERT INTO `tbl_schools` VALUES (7262, 'Medical University of Warsaw', 35, 32);
INSERT INTO `tbl_schools` VALUES (7263, 'Akademia Bydgoska im. Kazimierza Wielkiego ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7264, 'Akademia Ekonomiczna im. Oskara Langego ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7265, 'Akademia Górniczo-Hutnicza ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7266, 'Akademia Marynarki Wojennej im. Bohaterów Westerplatte w Gdyni ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7267, 'Akademia Medyczna im. Karola Marcinkowskiego ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7268, 'Akademia Medyczna im. Ludwika Rydygiera ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7269, 'Akademia Medyczna im. Piastów Śląskich ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7270, 'Akademia Medyczna w Białymstoku ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7271, 'Akademia Medyczna w Gdańsku ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7272, 'Akademia Medyczna w Łodzi ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7273, 'Akademia Medyczna w Lublinie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7274, 'Akademia Medyczna w Warszawie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7275, 'Akademia Morska w Gdyni ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7276, 'Akademia Morska w Szczecinie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7277, 'Akademia Muzyczna im. Fryderyka Chopina ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7278, 'Akademia Muzyczna im. Ignacego Jana Paderewskiego ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7279, 'Akademia Muzyczna im. Karola Lipińskiego ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7280, 'Akademia Muzyczna im. Karola Szymanowskiego ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7281, 'Akademia Muzyczna im. Stanisława Moniuszki ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7282, 'Akademia Muzyczna w Bydgoszczy ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7283, 'Akademia Muzyczna w Łodzi ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7284, 'Akademia Obrony Narodowej w Warszawie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7285, 'Akademia Pedagogiczna im. KEN w Krakowie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7286, 'Akademia Pedagogiki Specjalnej im. Marii Grzegorzewskiej ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7287, 'Akademia Podlaska w Siedlcach ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7288, 'Akademia Rolnicza im.Hugona Kołłątaja w Krakowie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7289, 'Akademia Rolnicza w Lublinie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7290, 'Akademia Rolnicza w Poznaniu ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7291, 'Akademia Rolnicza w Szczecinie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7292, 'Akademia Rolnicza we Wrocławiu ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7293, 'Akademia Świętokrzyska im. Jana Kochanowskiego w Kielcach ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7294, 'Akademia Sztuk Pięknych ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7295, 'Akademia Sztuk Pięknych im. Jana Matejki w Krakowie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7296, 'Akademia Sztuk Pięknych im. Władysława Strzemińskiego w Łodzi ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7297, 'Akademia Sztuk Pięknych w Gdańsku ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7298, 'Akademia Sztuk Pięknych w Poznaniu ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7299, 'Akademia Sztuk Pięknych w Warszawie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7300, 'Akademia Sztuk Pięknych we Wrocławiu ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7301, 'Akademia Techniczno-Humanistyczna w Bielsku -Białej ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7302, 'Akademia Techniczno-Rolnicza im. J.J.Śniadeckich ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7303, 'Akademia Wychowania Fizycznego im. Bronisława Czecha w Krakowie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7304, 'Akademia Wychowania Fizycznego im. Eugeniusza Piaseckiego w Poznaniu ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7305, 'Akademia Wychowania Fizycznego im. Jędrzeja Śniadeckiego w Gdańsku ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7306, 'Akademia Wychowania Fizycznego im. Józefa Piłsudskiego w Warszawie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7307, 'Akademia Wychowania Fizycznego w Katowicach ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7308, 'Akademia Wychowania Fizycznego we Wrocławiu ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7309, 'Aleksandra Zelwerowicza w Warszawie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7310, 'Katolicki Uniwersytet Lubelski ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7311, 'Kolegium Karkonoskie w Jeleniej Górze ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7312, 'Państwowa Medyczna Wyższa Szkoła Zawodowa w Opolu ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7313, 'Państwowa Wyższa Szkoła Informatyki i Przedsiębiorczości w Łomży ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7314, 'Państwowa Wyższa Szkoła Teatralna im. Ludwika Solskiego w Krakowie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7315, 'Państwowa Wyższa Szkoła Zawodowa w Białej Podlaskiej ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7316, 'Państwowa Wyższa Szkoła Zawodowa w Chełmie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7317, 'Państwowa Wyższa Szkoła Zawodowa w Ciechanowie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7318, 'Państwowa Wyższa Szkoła Zawodowa w Elblągu ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7319, 'Państwowa Wyższa Szkoła Zawodowa w Głogowie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7320, 'Państwowa Wyższa Szkoła Zawodowa w Gorzowie Wielkopolskim ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7321, 'Państwowa Wyższa Szkoła Zawodowa w Jarosławiu ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7322, 'Państwowa Wyższa Szkoła Zawodowa w Kaliszu ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7323, 'Państwowa Wyższa Szkoła Zawodowa w Koninie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7324, 'Państwowa Wyższa Szkoła Zawodowa w Krośnie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7325, 'Państwowa Wyższa Szkoła Zawodowa w Legnicy ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7326, 'Państwowa Wyższa Szkoła Zawodowa w Lesznie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7327, 'Państwowa Wyższa Szkoła Zawodowa w Nowym Sączu ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7328, 'Państwowa Wyższa Szkoła Zawodowa w Nowym Targu ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7329, 'Państwowa Wyższa Szkoła Zawodowa w Nysie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7330, 'Państwowa Wyższa Szkoła Zawodowa w Pile ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7331, 'Państwowa Wyższa Szkoła Zawodowa w Płocku ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7332, 'Państwowa Wyższa Szkoła Zawodowa w Przemyślu ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7333, 'Państwowa Wyższa Szkoła Zawodowa w Raciborzu ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7334, 'Państwowa Wyższa Szkoła Zawodowa w Sanoku ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7335, 'Państwowa Wyższa Szkoła Zawodowa w Tarnobrzegu ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7336, 'Państwowa Wyższa Szkoła Zawodowa w Tarnowie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7337, 'Państwowa Wyższa Szkoła Zawodowa w Wałbrzychu ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7338, 'Państwowa Wyższa Szkoła Zawodowa w Wałczu ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7339, 'Państwowa Wyższa Szkoła Zawodowa we Włocławku ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7340, 'Politechnika Częstochowska ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7341, 'Politechnika Koszalińska ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7342, 'Politechnika Krakowska ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7343, 'Politechnika Łódzka ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7344, 'Politechnika Lubelska ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7345, 'Politechnika Opolska ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7346, 'Politechnika Poznańska ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7347, 'Politechnika Radomska ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7348, 'Politechnika Rzeszowska ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7349, 'Politechnika Śląska ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7350, 'Politechnika Świętokrzyska (Kielce) ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7351, 'Politechnika Szczecińska ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7352, 'Politechnika Wrocławska ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7353, 'Pomorska Akademia Medyczna w Szczecinie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7354, 'Pomorska Akademia Pedagogiczna w Słupsku ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7355, 'Śląska Akademia Medyczna w Katowicach ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7356, 'Szkoła Główna Handlowa w Warszawie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7357, 'Uniwersytet Jagielloński w Krakowie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7358, 'Uniwersytet Kardynała Stefana Wyszyńskiego w Warszawie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7359, 'Uniwersytet Łódzki ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7360, 'Uniwersytet Marii Curie-Skłodowskiej w Lublinie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7361, 'Uniwersytet Mikołaja Kopernika w Toruniu ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7362, 'Uniwersytet Opolski ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7363, 'Uniwersytet Rzeszowski ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7364, 'Uniwersytet Śląski w Katowicach ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7365, 'Uniwersytet Szczeciński ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7366, 'Uniwersytet Warmińsko-Mazurski w Olsztynie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7367, 'Uniwersytet Zielonogórski ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7368, 'Wojskowa Akademia Techniczna im. Jarosława Dąbrowskiego w Warszawie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7369, 'Wyższa Szkoła Oficerska Sił Powietrznych ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7370, 'WYŻSZA SZKOŁA OFICERSKA WOJSK LĄDOWYCH ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7371, 'Wyższa Szkoła Pedagogiczna w Częstochowie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7372, 'Wyższa Szkoła Policji ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7373, 'Wyższa Szkoła Zawodowa Administracji Publicznej w Sulechowie ', 35, 32);
INSERT INTO `tbl_schools` VALUES (7374, 'University of Delhi', 35, 14);
INSERT INTO `tbl_schools` VALUES (7375, 'Jawaharlal Nehru University', 35, 14);
INSERT INTO `tbl_schools` VALUES (7376, 'Bangalore University', 35, 14);
INSERT INTO `tbl_schools` VALUES (7377, 'Osmania University', 35, 14);
INSERT INTO `tbl_schools` VALUES (7378, 'University Of Madras', 35, 14);
INSERT INTO `tbl_schools` VALUES (7379, 'SRM University', 35, 14);
INSERT INTO `tbl_schools` VALUES (7380, 'Vellore Institute of Technology', 35, 14);
INSERT INTO `tbl_schools` VALUES (7381, 'St.xavier''s College', 35, 14);
INSERT INTO `tbl_schools` VALUES (7382, 'Akademie der bildenden Künste Wien', 35, 27);
INSERT INTO `tbl_schools` VALUES (7383, 'Donau-Universität Krems', 35, 27);
INSERT INTO `tbl_schools` VALUES (7384, 'European Peace University', 35, 27);
INSERT INTO `tbl_schools` VALUES (7385, 'Fachhochschule des bfi Wien Gesellschaft m.b.H.', 35, 27);
INSERT INTO `tbl_schools` VALUES (7386, 'Fachhochschule Technikum Kärnten', 35, 27);
INSERT INTO `tbl_schools` VALUES (7387, 'Fachhochschule Technikum Wien', 35, 27);
INSERT INTO `tbl_schools` VALUES (7388, 'Fachhochschule Vorarlberg Ges.m.b.H.', 35, 27);
INSERT INTO `tbl_schools` VALUES (7389, 'Fachhochschulen Oberösterreich Studienbetriebes GmbH', 35, 27);
INSERT INTO `tbl_schools` VALUES (7390, 'Fachhochschulstudiengänge Burgenland Ges. m.b.H.', 35, 27);
INSERT INTO `tbl_schools` VALUES (7391, 'FH Joanneum Ges.m.b.H.', 35, 27);
INSERT INTO `tbl_schools` VALUES (7392, 'FH Salzburg Fachhochschulgesellschaft m.b.H.', 35, 27);
INSERT INTO `tbl_schools` VALUES (7393, 'FHS Kufstein Tirol Bildungs-Ges.m.b.H.', 35, 27);
INSERT INTO `tbl_schools` VALUES (7394, 'Franz Schubert Konservatorium ', 35, 27);
INSERT INTO `tbl_schools` VALUES (7395, 'Graz University of Technology', 35, 27);
INSERT INTO `tbl_schools` VALUES (7396, 'Hochschule für Musik und Darstellende Kunst Mozarteum', 35, 27);
INSERT INTO `tbl_schools` VALUES (7397, 'IMC Fachhochschule Krems Ges. m.b.H.', 35, 27);
INSERT INTO `tbl_schools` VALUES (7398, 'Institut duer Paedagogik und Psychologie', 35, 27);
INSERT INTO `tbl_schools` VALUES (7399, 'Johannes Kepler University of Linz', 35, 27);
INSERT INTO `tbl_schools` VALUES (7400, 'Karl Franzens University', 35, 27);
INSERT INTO `tbl_schools` VALUES (7401, 'Management Center Innsbruck Ges.m.b.H.', 35, 27);
INSERT INTO `tbl_schools` VALUES (7402, 'Medininische Universität Graz', 35, 27);
INSERT INTO `tbl_schools` VALUES (7403, 'Medizinische Universität Innsbruck', 35, 27);
INSERT INTO `tbl_schools` VALUES (7404, 'Medizinische Universität Wien', 35, 27);
INSERT INTO `tbl_schools` VALUES (7405, 'Montanuniversität Leoben', 35, 27);
INSERT INTO `tbl_schools` VALUES (7406, 'Salzburg College', 35, 27);
INSERT INTO `tbl_schools` VALUES (7407, 'Technikum Vorarlberg', 35, 27);
INSERT INTO `tbl_schools` VALUES (7408, 'Technische Universität Graz', 35, 27);
INSERT INTO `tbl_schools` VALUES (7409, 'Technische Universität Wien', 35, 27);
INSERT INTO `tbl_schools` VALUES (7410, 'Universität für angewandte Kunst Wien', 35, 27);
INSERT INTO `tbl_schools` VALUES (7411, 'Universität für Bodenkultur', 35, 27);
INSERT INTO `tbl_schools` VALUES (7412, 'Universität für Bodenkultur Wien', 35, 27);
INSERT INTO `tbl_schools` VALUES (7413, 'Universität für künstlerische und industrielle Gestaltung Linz', 35, 27);
INSERT INTO `tbl_schools` VALUES (7414, 'Universität für Musik und darstellende Kunst', 35, 27);
INSERT INTO `tbl_schools` VALUES (7415, 'Universität für Musik und darstellende Kunst Wien', 35, 27);
INSERT INTO `tbl_schools` VALUES (7416, 'Universität Innsbruck', 35, 27);
INSERT INTO `tbl_schools` VALUES (7417, 'Universität Klagenfurt', 35, 27);
INSERT INTO `tbl_schools` VALUES (7418, 'Universität Linz', 35, 27);
INSERT INTO `tbl_schools` VALUES (7419, 'Universität Mozarteum Salzburg', 35, 27);
INSERT INTO `tbl_schools` VALUES (7420, 'University of Art and Industrial Design', 35, 27);
INSERT INTO `tbl_schools` VALUES (7421, 'University of Economics, Vienna', 35, 27);
INSERT INTO `tbl_schools` VALUES (7422, 'University of Innsbruck', 35, 27);
INSERT INTO `tbl_schools` VALUES (7423, 'University of Salzburg', 35, 27);
INSERT INTO `tbl_schools` VALUES (7424, 'University of Veterinary Medicine Vienna', 35, 27);
INSERT INTO `tbl_schools` VALUES (7425, 'University of Vienna', 35, 27);
INSERT INTO `tbl_schools` VALUES (7426, 'Vienna University of Technology', 35, 27);
INSERT INTO `tbl_schools` VALUES (7427, 'MODUL University Vienna', 35, 27);
INSERT INTO `tbl_schools` VALUES (7428, 'Anton Bruckner Privatuniversität', 35, 27);
INSERT INTO `tbl_schools` VALUES (7429, 'WU Wirtschaftsuniversität Wien', 35, 27);
INSERT INTO `tbl_schools` VALUES (7430, 'Fachhochschule Wiener Neustadt für Wirtschaft und Technik Ges.m.b.H. ', 35, 27);
INSERT INTO `tbl_schools` VALUES (7431, 'Fachhochschule CAMPUS 02 Graz', 35, 27);
INSERT INTO `tbl_schools` VALUES (7432, 'Fachhochschule Joanneum ', 35, 27);
INSERT INTO `tbl_schools` VALUES (7433, 'Fachhochschule Technikum Körnten ', 35, 27);
INSERT INTO `tbl_schools` VALUES (7434, 'Fachhochschulstudiengänge Burgenland Ges. M.b.H. ', 35, 27);
INSERT INTO `tbl_schools` VALUES (7435, 'Gesellschaft zur Durchführung von Fachhochschul-Studiengängen St. Pölten m.b.H. ', 35, 27);
INSERT INTO `tbl_schools` VALUES (7436, 'Johannes Kepler Universitat Linz ', 35, 27);
INSERT INTO `tbl_schools` VALUES (7437, 'Kufstein Tirol Bildungs-Ges.m.b.H. ', 35, 27);
INSERT INTO `tbl_schools` VALUES (7438, 'Medizinische Universität Graz ', 35, 27);
INSERT INTO `tbl_schools` VALUES (7439, 'Modul University Vienna', 35, 27);
INSERT INTO `tbl_schools` VALUES (7440, 'Universität für Musik und darstellende Kunst Graz ', 35, 27);
INSERT INTO `tbl_schools` VALUES (7441, 'Universität Graz ', 35, 27);
INSERT INTO `tbl_schools` VALUES (7442, 'Universität Salzburg ', 35, 27);
INSERT INTO `tbl_schools` VALUES (7443, 'Universität Wien ', 35, 27);
INSERT INTO `tbl_schools` VALUES (7444, 'Veterinärmedizinische Universität Wien ', 35, 27);
INSERT INTO `tbl_schools` VALUES (7445, 'Wirtschaftsuniversität Wien ', 35, 27);
INSERT INTO `tbl_schools` VALUES (7446, 'جامعة مصر الدولية ', 35, 33);
INSERT INTO `tbl_schools` VALUES (7447, 'جامعة مصر للعلوم والتكنولوجيا ', 35, 33);
INSERT INTO `tbl_schools` VALUES (7448, 'جامعة حلوان ', 35, 33);
INSERT INTO `tbl_schools` VALUES (7449, 'جامعة أسيوط ', 35, 33);
INSERT INTO `tbl_schools` VALUES (7450, 'جامعة القناة الإسكندارية ', 35, 33);
INSERT INTO `tbl_schools` VALUES (7451, 'جامعة القاهرة ', 35, 33);
INSERT INTO `tbl_schools` VALUES (7452, 'الجامعة الأمركية بالقاهرة ', 35, 33);
INSERT INTO `tbl_schools` VALUES (7453, 'جامعة المنوفية ', 35, 33);
INSERT INTO `tbl_schools` VALUES (7454, 'جامعة المنيا ', 35, 33);
INSERT INTO `tbl_schools` VALUES (7455, 'جامعة المنصورة ', 35, 33);
INSERT INTO `tbl_schools` VALUES (7456, ' 　　جامعة جنوب الوادي ', 35, 33);
INSERT INTO `tbl_schools` VALUES (7457, 'جامعة 6 أكتوبر بمصر ', 35, 33);
INSERT INTO `tbl_schools` VALUES (7458, 'جامعة قناة السويس ', 35, 33);
INSERT INTO `tbl_schools` VALUES (7459, 'جامعة طنطا ', 35, 33);
INSERT INTO `tbl_schools` VALUES (7460, 'جامعة أكتوبر للعلوم الحديثة والآداب ', 35, 33);
INSERT INTO `tbl_schools` VALUES (7461, 'جامعة الإسكندرية ', 35, 33);
INSERT INTO `tbl_schools` VALUES (7462, 'Eszterházy Károly Főiskola', 35, 6);
INSERT INTO `tbl_schools` VALUES (7463, 'Budapesti Közgazdaságtudományi és Államigazgatási Egyetem', 35, 6);
INSERT INTO `tbl_schools` VALUES (7464, 'Budapesti Műszaki és Gazdaságtudományi Egyetem', 35, 6);
INSERT INTO `tbl_schools` VALUES (7465, 'Budapesti Gazdasági Főiskola', 35, 6);
INSERT INTO `tbl_schools` VALUES (7466, 'Budapesti Műszaki Főiskola', 35, 6);
INSERT INTO `tbl_schools` VALUES (7467, 'Berzsenyi Dániel Főiskola', 35, 6);
INSERT INTO `tbl_schools` VALUES (7468, 'Debreceni Egyetem', 35, 6);
INSERT INTO `tbl_schools` VALUES (7469, 'Dunaújvárosi Főiskola', 35, 6);
INSERT INTO `tbl_schools` VALUES (7470, 'Rendőrtiszti Főiskola', 35, 6);
INSERT INTO `tbl_schools` VALUES (7471, 'Kaposvári Egyetem', 35, 6);
INSERT INTO `tbl_schools` VALUES (7472, 'Károly Róbert Főiskola', 35, 6);
INSERT INTO `tbl_schools` VALUES (7473, 'Kecskeméti Főiskola', 35, 6);
INSERT INTO `tbl_schools` VALUES (7474, 'Eötvös Loránd Tudományegyetem', 35, 6);
INSERT INTO `tbl_schools` VALUES (7475, 'Eötvös József Főiskola', 35, 6);
INSERT INTO `tbl_schools` VALUES (7476, 'Liszt Ferenc Zeneművészeti Egyetem', 35, 6);
INSERT INTO `tbl_schools` VALUES (7477, 'Miskolci Egyetem', 35, 6);
INSERT INTO `tbl_schools` VALUES (7478, 'Pécsi Tudományegyetem', 35, 6);
INSERT INTO `tbl_schools` VALUES (7479, 'Szegedi Tudományegyetem', 35, 6);
INSERT INTO `tbl_schools` VALUES (7480, 'Semmelweis Egyetem', 35, 6);
INSERT INTO `tbl_schools` VALUES (7481, 'Szolnoki Főiskola', 35, 6);
INSERT INTO `tbl_schools` VALUES (7482, 'Széchenyi István Egyetem', 35, 6);
INSERT INTO `tbl_schools` VALUES (7483, 'Szent István Egyetem', 35, 6);
INSERT INTO `tbl_schools` VALUES (7484, 'Tessedik Sámuel Főiskola', 35, 6);
INSERT INTO `tbl_schools` VALUES (7485, 'Veszprémi Egyetem', 35, 6);
INSERT INTO `tbl_schools` VALUES (7486, 'Színház- és Filmművészeti Egyetem', 35, 6);
INSERT INTO `tbl_schools` VALUES (7487, 'Nyugat-Magyarországi Egyetem', 35, 6);
INSERT INTO `tbl_schools` VALUES (7488, 'Magyar Iparművészeti Egyetem', 35, 6);
INSERT INTO `tbl_schools` VALUES (7489, 'Magyar Képzõművészeti Egyetem', 35, 6);
INSERT INTO `tbl_schools` VALUES (7490, 'Magyar Táncművészeti Főiskola', 35, 6);
INSERT INTO `tbl_schools` VALUES (7491, 'Zrínyi Miklós Nemzetvédelmi Egyetem', 35, 6);
INSERT INTO `tbl_schools` VALUES (7492, 'Universidad de la Habana', 35, 34);
INSERT INTO `tbl_schools` VALUES (7493, 'Universidad del Oriente', 35, 34);
INSERT INTO `tbl_schools` VALUES (7494, 'Universidad Central de Las Villas', 35, 34);
INSERT INTO `tbl_schools` VALUES (7495, 'Universidad de Camagüey', 35, 34);
INSERT INTO `tbl_schools` VALUES (7496, 'Universidad de Matanzas', 35, 34);
INSERT INTO `tbl_schools` VALUES (7497, 'Universidad de Pinar del Río', 35, 34);
INSERT INTO `tbl_schools` VALUES (7498, 'Universidad de Ciego de Ávila', 35, 34);
INSERT INTO `tbl_schools` VALUES (7499, 'Universidad de Granma', 35, 34);
INSERT INTO `tbl_schools` VALUES (7500, 'Universidad de Holguìn', 35, 34);
INSERT INTO `tbl_schools` VALUES (7501, 'Universidad de Cienfuegos', 35, 34);
INSERT INTO `tbl_schools` VALUES (7502, 'Universidad de las Ciencias Informáticas', 35, 34);
INSERT INTO `tbl_schools` VALUES (7503, 'Instituto Superior Politécnico José Antonio Echeverría', 35, 34);
INSERT INTO `tbl_schools` VALUES (7504, '"Universidad Pedagógica ""Félix Valera"" "', 35, 34);
INSERT INTO `tbl_schools` VALUES (7505, 'Instituto Superior de Ciencias Medicas de Villa Clara', 35, 34);
INSERT INTO `tbl_schools` VALUES (7506, 'Instituto Superior Minero Metalúrgico Dr. Antonio Núñez Jiménez', 35, 34);
INSERT INTO `tbl_schools` VALUES (7507, 'University of Debrecen', 35, 39);

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_tag`
-- 

DROP TABLE IF EXISTS `tbl_tag`;
CREATE TABLE IF NOT EXISTS `tbl_tag` (
  `id` smallint(6) unsigned NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `count` int(10) unsigned default '0',
  PRIMARY KEY  (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=70 ;

-- 
-- 导出表中的数据 `tbl_tag`
-- 

INSERT INTO `tbl_tag` VALUES (46, 'php', 9);
INSERT INTO `tbl_tag` VALUES (47, 'mysql', 4);
INSERT INTO `tbl_tag` VALUES (48, 'iOS', 24);
INSERT INTO `tbl_tag` VALUES (49, 'Java', 17);
INSERT INTO `tbl_tag` VALUES (50, 'Iphone', 8);
INSERT INTO `tbl_tag` VALUES (51, '程序员', 3);
INSERT INTO `tbl_tag` VALUES (52, '啊八佰伴', 6);
INSERT INTO `tbl_tag` VALUES (53, '额额额额', 6);
INSERT INTO `tbl_tag` VALUES (54, '大sdasdas', 5);
INSERT INTO `tbl_tag` VALUES (55, '手机开发', 0);
INSERT INTO `tbl_tag` VALUES (56, 'fffff', 0);
INSERT INTO `tbl_tag` VALUES (57, 'aa', 0);
INSERT INTO `tbl_tag` VALUES (58, 'bds', 0);
INSERT INTO `tbl_tag` VALUES (59, 'bads', 0);
INSERT INTO `tbl_tag` VALUES (60, 'dasdsd', 2);
INSERT INTO `tbl_tag` VALUES (61, 'daddsda', 2);
INSERT INTO `tbl_tag` VALUES (62, 'dasdad', 2);
INSERT INTO `tbl_tag` VALUES (63, '哈吧', 1);
INSERT INTO `tbl_tag` VALUES (64, '哈哈哈', 1);
INSERT INTO `tbl_tag` VALUES (65, 'c', 1);
INSERT INTO `tbl_tag` VALUES (66, '程序', 1);
INSERT INTO `tbl_tag` VALUES (67, 'hhah', 0);
INSERT INTO `tbl_tag` VALUES (68, '发出', 1);
INSERT INTO `tbl_tag` VALUES (69, '0000000000', 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_tag_connections`
-- 

DROP TABLE IF EXISTS `tbl_tag_connections`;
CREATE TABLE IF NOT EXISTS `tbl_tag_connections` (
  `tagid` smallint(6) unsigned NOT NULL,
  `user_id` int(12) NOT NULL,
  `type` char(1) NOT NULL default '0',
  UNIQUE KEY `user_tag` (`user_id`,`tagid`,`type`),
  KEY `FK_tag_id` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `tbl_tag_connections`
-- 

INSERT INTO `tbl_tag_connections` VALUES (46, 6, '2');
INSERT INTO `tbl_tag_connections` VALUES (46, 40, '2');
INSERT INTO `tbl_tag_connections` VALUES (46, 223, '2');
INSERT INTO `tbl_tag_connections` VALUES (46, 232, '2');
INSERT INTO `tbl_tag_connections` VALUES (47, 40, '2');
INSERT INTO `tbl_tag_connections` VALUES (48, 102, '2');
INSERT INTO `tbl_tag_connections` VALUES (48, 223, '2');
INSERT INTO `tbl_tag_connections` VALUES (49, 102, '2');
INSERT INTO `tbl_tag_connections` VALUES (49, 223, '2');
INSERT INTO `tbl_tag_connections` VALUES (50, 102, '2');
INSERT INTO `tbl_tag_connections` VALUES (51, 40, '2');
INSERT INTO `tbl_tag_connections` VALUES (51, 117, '2');
INSERT INTO `tbl_tag_connections` VALUES (52, 102, '2');
INSERT INTO `tbl_tag_connections` VALUES (53, 102, '2');
INSERT INTO `tbl_tag_connections` VALUES (54, 102, '2');
INSERT INTO `tbl_tag_connections` VALUES (64, 102, '2');
INSERT INTO `tbl_tag_connections` VALUES (65, 102, '2');
INSERT INTO `tbl_tag_connections` VALUES (66, 102, '2');
INSERT INTO `tbl_tag_connections` VALUES (68, 102, '2');

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_user_config`
-- 

DROP TABLE IF EXISTS `tbl_user_config`;
CREATE TABLE IF NOT EXISTS `tbl_user_config` (
  `user_id` int(11) NOT NULL,
  `values` varchar(500) NOT NULL COMMENT '用户自定义的配置',
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `tbl_user_config`
-- 

INSERT INTO `tbl_user_config` VALUES (40, '{"language":"zh_cn"}');
INSERT INTO `tbl_user_config` VALUES (91, '{"language":"english"}');
INSERT INTO `tbl_user_config` VALUES (96, '{"language":"zh_cn"}');

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_user_history`
-- 

DROP TABLE IF EXISTS `tbl_user_history`;
CREATE TABLE IF NOT EXISTS `tbl_user_history` (
  `user_id` int(11) NOT NULL,
  `type` tinyint(4) unsigned NOT NULL,
  `data` text NOT NULL,
  UNIQUE KEY `UK_user_type` (`user_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `tbl_user_history`
-- 

INSERT INTO `tbl_user_history` VALUES (6, 1, '[{"time":"2012-10-16 07:14:27","ip":"127.0.0.1"},{"time":"2012-09-26 09:59:13","ip":"127.0.0.1"},{"time":"2012-09-21 02:01:48","ip":"127.0.0.1"},{"time":"2012-09-20 02:36:09","ip":"127.0.0.1"},{"time":"2012-09-19 11:42:41","ip":"127.0.0.1"},{"time":"2012-09-19 11:37:08","ip":"127.0.0.1"},{"time":"2012-09-19 11:37:04","ip":"127.0.0.1"},{"time":"2012-09-19 11:32:14","ip":"127.0.0.1"},{"time":"2012-09-19 11:32:08","ip":"127.0.0.1"},{"time":"2012-09-19 11:27:57","ip":"127.0.0.1"}]');
INSERT INTO `tbl_user_history` VALUES (7, 1, '[{"time":"2012-09-11 09:10:35","ip":"127.0.0.1"},{"time":"2012-03-06 11:03:12","ip":"219.237.242.70"},{"time":"2012-03-06 11:02:11","ip":"219.237.242.70"}]');
INSERT INTO `tbl_user_history` VALUES (40, 1, '[{"time":"2012-08-27 17:34:04","ip":"219.237.242.70"},{"time":"2012-08-27 14:24:08","ip":"219.237.242.70"},{"time":"2012-08-27 14:24:07","ip":"219.237.242.70"},{"time":"2012-08-27 11:45:04","ip":"219.237.242.70"},{"time":"2012-08-24 15:13:22","ip":"219.237.242.70"},{"time":"2012-08-24 11:44:33","ip":"219.237.242.70"},{"time":"2012-08-22 13:06:43","ip":"219.237.242.70"},{"time":"2012-08-22 12:20:36","ip":"219.237.242.70"},{"time":"2012-08-22 11:50:23","ip":"219.237.242.70"},{"time":"2012-08-21 11:42:33","ip":"219.237.242.70"}]');
INSERT INTO `tbl_user_history` VALUES (40, 3, '["location_1-3","location_2-2","location_2","keyword_\\u6cb3\\u5317\\u5927\\u5b66","keyword_\\u5475\\u5475","keyword_\\u6211\\u662f\\u5de6\\u56fd\\u8363","keyword_\\u6211\\u662f\\u624b\\u4e2d\\u505a","keyword_\\u6211\\u662f","keyword_\\u6211\\u662f\\u8c01\\u554a","keyword_\\u6211\\u662f\\u8c01"]');
INSERT INTO `tbl_user_history` VALUES (91, 1, '[{"time":"2012-06-01 11:25:02","ip":"219.237.242.70"},{"time":"2012-06-01 11:23:18","ip":"219.237.242.70"},{"time":"2012-06-01 11:21:51","ip":"219.237.242.70"},{"time":"2012-06-01 11:20:41","ip":"219.237.242.70"},{"time":"2012-06-01 11:19:05","ip":"219.237.242.70"},{"time":"2012-06-01 10:57:36","ip":"219.237.242.70"},{"time":"2012-06-01 10:46:18","ip":"219.237.242.70"},{"time":"2012-05-31 19:34:44","ip":"61.148.242.94"},{"time":"2012-05-31 16:55:40","ip":"219.237.242.70"},{"time":"2012-05-31 16:54:45","ip":"219.237.242.70"}]');
INSERT INTO `tbl_user_history` VALUES (92, 1, '[{"time":"2012-08-27 17:34:41","ip":"219.237.242.70"},{"time":"2012-08-27 13:22:22","ip":"219.237.242.70"},{"time":"2012-08-27 11:45:44","ip":"219.237.242.70"},{"time":"2012-05-16 17:42:37","ip":"219.237.242.70"},{"time":"2012-02-27 11:07:12","ip":"219.237.242.70"},{"time":"2012-01-09 17:33:16","ip":"127.0.0.1"},{"time":"2012-01-09 17:32:58","ip":"127.0.0.1"}]');
INSERT INTO `tbl_user_history` VALUES (93, 1, '[{"time":"2012-05-09 14:51:51","ip":"219.237.242.70"}]');
INSERT INTO `tbl_user_history` VALUES (94, 1, '[{"time":"2012-08-09 11:33:57","ip":"219.237.242.70"},{"time":"2012-08-09 11:33:20","ip":"219.237.242.70"},{"time":"2012-08-09 11:28:53","ip":"219.237.242.70"},{"time":"2012-08-06 14:04:03","ip":"219.237.242.70"},{"time":"2012-08-03 13:52:04","ip":"219.237.242.70"},{"time":"2012-05-31 15:49:22","ip":"219.237.242.70"},{"time":"2012-05-28 13:11:36","ip":"219.237.242.70"},{"time":"2012-05-28 13:10:19","ip":"219.237.242.70"},{"time":"2012-05-28 13:04:39","ip":"219.237.242.70"},{"time":"2012-05-28 13:03:49","ip":"219.237.242.70"}]');
INSERT INTO `tbl_user_history` VALUES (95, 1, '[{"time":"2012-06-01 11:43:31","ip":"219.237.242.70"},{"time":"2012-06-01 11:42:40","ip":"219.237.242.70"},{"time":"2012-05-24 01:37:35","ip":"114.247.10.77"},{"time":"2012-05-23 18:29:14","ip":"219.237.242.70"},{"time":"2012-05-10 15:06:43","ip":"219.237.242.70"},{"time":"2012-05-07 10:17:25","ip":"219.237.242.70"},{"time":"2012-05-04 12:39:50","ip":"219.237.242.70"},{"time":"2012-05-02 15:03:14","ip":"219.237.242.70"},{"time":"2012-05-01 20:11:13","ip":"211.154.3.34"},{"time":"2012-04-24 16:21:35","ip":"219.237.242.70"}]');
INSERT INTO `tbl_user_history` VALUES (96, 1, '[{"time":"2012-04-18 13:53:41","ip":"219.237.242.70"},{"time":"2012-04-18 12:35:27","ip":"219.237.242.70"},{"time":"2012-04-18 09:58:10","ip":"219.237.242.70"},{"time":"2012-04-17 11:51:02","ip":"219.237.242.70"},{"time":"2012-04-17 10:25:16","ip":"219.237.242.70"},{"time":"2012-04-16 12:53:01","ip":"219.237.242.70"},{"time":"2012-04-16 11:43:24","ip":"219.237.242.70"},{"time":"2012-04-12 17:09:55","ip":"219.237.242.70"},{"time":"2012-04-12 15:59:26","ip":"219.237.242.70"},{"time":"2012-04-12 13:10:32","ip":"219.237.242.70"}]');
INSERT INTO `tbl_user_history` VALUES (97, 1, '[{"time":"2012-03-05 15:18:26","ip":"219.237.242.70"}]');
INSERT INTO `tbl_user_history` VALUES (99, 1, '[{"time":"2012-05-09 14:57:14","ip":"219.237.242.70"}]');
INSERT INTO `tbl_user_history` VALUES (102, 1, '[{"time":"2012-08-24 00:31:29","ip":"107.6.134.18"},{"time":"2012-08-24 00:30:24","ip":"107.6.134.18"},{"time":"2012-08-23 23:58:24","ip":"219.234.151.199"},{"time":"2012-08-23 23:50:44","ip":"219.234.151.199"},{"time":"2012-08-23 23:31:35","ip":"219.234.151.199"},{"time":"2012-08-23 23:22:48","ip":"219.234.151.199"},{"time":"2012-08-23 23:21:17","ip":"219.234.151.199"},{"time":"2012-08-23 23:19:08","ip":"219.234.151.199"},{"time":"2012-08-07 16:33:15","ip":"219.237.242.70"},{"time":"2012-08-07 16:33:15","ip":"219.237.242.70"}]');
INSERT INTO `tbl_user_history` VALUES (117, 1, '[{"time":"2012-07-24 14:14:08","ip":"219.237.242.70"},{"time":"2012-05-18 13:50:26","ip":"219.237.242.70"},{"time":"2012-05-18 13:43:57","ip":"219.237.242.70"},{"time":"2012-05-18 13:40:50","ip":"219.237.242.70"},{"time":"2012-05-18 13:37:22","ip":"219.237.242.70"},{"time":"2012-05-18 13:36:44","ip":"219.237.242.70"},{"time":"2012-05-18 13:34:44","ip":"219.237.242.70"},{"time":"2012-05-18 12:11:44","ip":"219.237.242.70"},{"time":"2012-05-16 17:51:45","ip":"219.237.242.70"},{"time":"2012-05-16 17:50:59","ip":"219.237.242.70"}]');
INSERT INTO `tbl_user_history` VALUES (130, 1, '[{"time":"2012-08-27 14:39:32","ip":"219.237.242.70"},{"time":"2012-08-27 14:39:14","ip":"219.237.242.70"},{"time":"2012-08-25 13:46:11","ip":"220.113.43.122"},{"time":"2012-08-24 18:12:59","ip":"219.237.242.70"},{"time":"2012-08-24 11:03:00","ip":"219.237.242.70"},{"time":"2012-08-23 17:55:22","ip":"219.237.242.70"},{"time":"2012-08-23 17:53:44","ip":"219.237.242.70"},{"time":"2012-08-23 17:52:17","ip":"219.237.242.70"},{"time":"2012-08-22 13:35:09","ip":"219.237.242.70"},{"time":"2012-08-22 13:27:16","ip":"219.237.242.70"}]');
INSERT INTO `tbl_user_history` VALUES (144, 1, '[{"time":"2012-08-21 15:17:36","ip":"219.237.242.70"},{"time":"2012-06-01 15:52:51","ip":"219.237.242.70"}]');
INSERT INTO `tbl_user_history` VALUES (223, 1, '[{"time":"2012-09-19 06:34:56","ip":"127.0.0.1"},{"time":"2012-09-19 05:49:06","ip":"127.0.0.1"},{"time":"2012-08-06 11:09:45","ip":"219.237.242.70"},{"time":"2012-08-03 18:20:41","ip":"219.237.242.70"},{"time":"2012-08-03 18:13:41","ip":"219.237.242.70"},{"time":"2012-08-03 16:51:01","ip":"219.237.242.70"},{"time":"2012-08-03 15:21:19","ip":"219.237.242.70"},{"time":"2012-08-03 15:13:09","ip":"219.237.242.70"},{"time":"2012-08-03 11:28:41","ip":"219.237.242.70"},{"time":"2012-08-03 11:20:37","ip":"219.237.242.70"}]');
INSERT INTO `tbl_user_history` VALUES (224, 1, '[{"time":"2012-08-03 19:15:17","ip":"219.237.242.70"}]');
INSERT INTO `tbl_user_history` VALUES (225, 1, '[{"time":"2012-08-23 11:40:50","ip":"219.237.242.70"},{"time":"2012-08-21 15:16:05","ip":"219.237.242.70"},{"time":"2012-08-21 15:15:19","ip":"219.237.242.70"},{"time":"2012-08-21 13:56:01","ip":"219.237.242.70"},{"time":"2012-08-13 17:53:22","ip":"219.237.242.70"},{"time":"2012-08-13 17:52:43","ip":"219.237.242.70"}]');
INSERT INTO `tbl_user_history` VALUES (228, 1, '[{"time":"2012-09-19 10:00:24","ip":"127.0.0.1"},{"time":"2012-09-06 01:54:11","ip":"127.0.0.1"},{"time":"2012-09-05 09:39:50","ip":"127.0.0.1"},{"time":"2012-09-05 09:22:42","ip":"127.0.0.1"},{"time":"2012-09-05 08:15:51","ip":"127.0.0.1"},{"time":"2012-09-04 01:59:08","ip":"127.0.0.1"},{"time":"2012-09-03 08:13:05","ip":"127.0.0.1"},{"time":"2012-08-31 09:18:35","ip":"127.0.0.1"},{"time":"2012-08-31 09:17:53","ip":"127.0.0.1"},{"time":"2012-08-31 08:19:54","ip":"127.0.0.1"}]');
INSERT INTO `tbl_user_history` VALUES (229, 1, '[{"time":"2012-08-30 02:13:35","ip":"127.0.0.1"}]');
INSERT INTO `tbl_user_history` VALUES (230, 1, '[{"time":"2012-08-30 06:45:18","ip":"127.0.0.1"},{"time":"2012-08-30 03:59:21","ip":"127.0.0.1"},{"time":"2012-08-30 03:26:10","ip":"127.0.0.1"},{"time":"2012-08-30 03:22:06","ip":"127.0.0.1"}]');
INSERT INTO `tbl_user_history` VALUES (231, 1, '[{"time":"2012-09-11 08:32:05","ip":"127.0.0.1"}]');
INSERT INTO `tbl_user_history` VALUES (232, 1, '[{"time":"2012-09-11 05:39:12","ip":"127.0.0.1"},{"time":"2012-09-11 02:53:09","ip":"127.0.0.1"},{"time":"2012-09-10 10:34:06","ip":"127.0.0.1"},{"time":"2012-09-10 09:32:15","ip":"127.0.0.1"},{"time":"2012-09-10 09:08:30","ip":"127.0.0.1"},{"time":"2012-09-10 09:08:05","ip":"127.0.0.1"}]');

-- --------------------------------------------------------

-- 
-- 表的结构 `tbl_visit`
-- 

DROP TABLE IF EXISTS `tbl_visit`;
CREATE TABLE IF NOT EXISTS `tbl_visit` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `uid` int(11) NOT NULL,
  `fid` int(11) unsigned NOT NULL,
  `create_time` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  KEY `FK_tbl_visit` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=81 ;

-- 
-- 导出表中的数据 `tbl_visit`
-- 

INSERT INTO `tbl_visit` VALUES (2, 40, 7, '2012-02-28 16:29:24');
INSERT INTO `tbl_visit` VALUES (3, 91, 26, '2012-03-12 17:45:58');
INSERT INTO `tbl_visit` VALUES (4, 40, 8, '2012-03-14 15:04:32');
INSERT INTO `tbl_visit` VALUES (30, 102, 6, '2012-05-10 15:24:31');
INSERT INTO `tbl_visit` VALUES (31, 102, 96, '2012-05-10 15:24:44');
INSERT INTO `tbl_visit` VALUES (32, 102, 8, '2012-05-10 15:24:52');
INSERT INTO `tbl_visit` VALUES (33, 102, 91, '2012-05-10 15:28:57');
INSERT INTO `tbl_visit` VALUES (34, 102, 40, '2012-05-10 15:29:06');
INSERT INTO `tbl_visit` VALUES (35, 102, 26, '2012-05-10 15:56:22');
INSERT INTO `tbl_visit` VALUES (36, 40, 8, '2012-05-14 17:19:36');
INSERT INTO `tbl_visit` VALUES (37, 40, 6, '2012-05-21 15:54:47');
INSERT INTO `tbl_visit` VALUES (38, 40, 102, '2012-05-23 14:53:25');
INSERT INTO `tbl_visit` VALUES (39, 102, 40, '2012-05-28 11:07:45');
INSERT INTO `tbl_visit` VALUES (40, 102, 26, '2012-05-28 11:07:57');
INSERT INTO `tbl_visit` VALUES (41, 40, 6, '2012-05-30 14:11:52');
INSERT INTO `tbl_visit` VALUES (44, 40, 6, '2012-07-26 14:10:30');
INSERT INTO `tbl_visit` VALUES (45, 40, 92, '2012-07-26 14:11:19');
INSERT INTO `tbl_visit` VALUES (46, 102, 8, '2012-07-27 17:07:16');
INSERT INTO `tbl_visit` VALUES (47, 40, 6, '2012-07-30 10:40:19');
INSERT INTO `tbl_visit` VALUES (48, 40, 102, '2012-07-31 14:48:02');
INSERT INTO `tbl_visit` VALUES (49, 224, 6, '2012-08-03 19:16:58');
INSERT INTO `tbl_visit` VALUES (50, 225, 130, '2012-08-13 17:54:03');
INSERT INTO `tbl_visit` VALUES (51, 40, 26, '2012-08-14 15:39:48');
INSERT INTO `tbl_visit` VALUES (52, 40, 28, '2012-08-21 11:55:42');
INSERT INTO `tbl_visit` VALUES (53, 40, 102, '2012-08-21 11:56:11');
INSERT INTO `tbl_visit` VALUES (54, 40, 223, '2012-08-21 11:56:21');
INSERT INTO `tbl_visit` VALUES (55, 40, 26, '2012-08-21 13:10:21');
INSERT INTO `tbl_visit` VALUES (56, 225, 117, '2012-08-21 14:52:21');
INSERT INTO `tbl_visit` VALUES (57, 225, 40, '2012-08-21 14:55:46');
INSERT INTO `tbl_visit` VALUES (58, 225, 117, '2012-08-23 11:41:12');
INSERT INTO `tbl_visit` VALUES (59, 40, 102, '2012-08-23 13:43:49');
INSERT INTO `tbl_visit` VALUES (60, 228, 94, '2012-08-31 14:43:29');
INSERT INTO `tbl_visit` VALUES (61, 232, 92, '2012-09-11 14:58:57');
INSERT INTO `tbl_visit` VALUES (62, 231, 223, '2012-09-11 16:38:20');
INSERT INTO `tbl_visit` VALUES (63, 6, 94, '2012-09-12 10:52:55');
INSERT INTO `tbl_visit` VALUES (64, 6, 92, '2012-09-14 16:15:50');
INSERT INTO `tbl_visit` VALUES (65, 6, 40, '2012-09-14 16:15:58');
INSERT INTO `tbl_visit` VALUES (66, 6, 117, '2012-09-14 16:45:41');
INSERT INTO `tbl_visit` VALUES (67, 6, 117, '2012-09-19 09:59:46');
INSERT INTO `tbl_visit` VALUES (68, 6, 227, '2012-09-19 10:07:49');
INSERT INTO `tbl_visit` VALUES (69, 6, 40, '2012-09-19 10:47:05');
INSERT INTO `tbl_visit` VALUES (70, 6, 225, '2012-09-19 11:26:41');
INSERT INTO `tbl_visit` VALUES (71, 6, 94, '2012-09-19 11:53:28');
INSERT INTO `tbl_visit` VALUES (72, 6, 91, '2012-09-19 13:45:25');
INSERT INTO `tbl_visit` VALUES (73, 223, 102, '2012-09-19 13:49:23');
INSERT INTO `tbl_visit` VALUES (74, 223, 6, '2012-09-19 13:49:39');
INSERT INTO `tbl_visit` VALUES (75, 223, 227, '2012-09-19 14:05:48');
INSERT INTO `tbl_visit` VALUES (76, 223, 94, '2012-09-19 14:25:06');
INSERT INTO `tbl_visit` VALUES (77, 6, 102, '2012-09-19 14:36:23');
INSERT INTO `tbl_visit` VALUES (78, 6, 223, '2012-09-19 14:36:27');
INSERT INTO `tbl_visit` VALUES (79, 6, 117, '2012-09-20 15:56:13');
INSERT INTO `tbl_visit` VALUES (80, 6, 225, '2012-09-20 15:56:20');

-- 
-- 限制导出的表
-- 

-- 
-- 限制表 `tbl_connections`
-- 
ALTER TABLE `tbl_connections`
  ADD CONSTRAINT `FK_connection_fid` FOREIGN KEY (`fid`) REFERENCES `tbl_local_accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_connection_id` FOREIGN KEY (`id`) REFERENCES `tbl_local_accounts` (`id`) ON DELETE CASCADE;

-- 
-- 限制表 `tbl_educations`
-- 
ALTER TABLE `tbl_educations`
  ADD CONSTRAINT `FK_educations_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_local_accounts` (`id`) ON DELETE CASCADE;

-- 
-- 限制表 `tbl_emails`
-- 
ALTER TABLE `tbl_emails`
  ADD CONSTRAINT `FK_emails_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_local_accounts` (`id`) ON DELETE CASCADE;

-- 
-- 限制表 `tbl_feed`
-- 
ALTER TABLE `tbl_feed`
  ADD CONSTRAINT `FK_feed_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_local_accounts` (`id`) ON DELETE CASCADE;

-- 
-- 限制表 `tbl_feed_connections`
-- 
ALTER TABLE `tbl_feed_connections`
  ADD CONSTRAINT `FK_feed_connections_feed_id` FOREIGN KEY (`feed_id`) REFERENCES `tbl_feed` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_feed_connections_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_local_accounts` (`id`) ON DELETE CASCADE;

-- 
-- 限制表 `tbl_im_accounts`
-- 
ALTER TABLE `tbl_im_accounts`
  ADD CONSTRAINT `FK_im_account_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_local_accounts` (`id`) ON DELETE CASCADE;

-- 
-- 限制表 `tbl_modify_records`
-- 
ALTER TABLE `tbl_modify_records`
  ADD CONSTRAINT `FK_modified_user_id` FOREIGN KEY (`modified_user`) REFERENCES `tbl_local_accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_modify_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_local_accounts` (`id`) ON DELETE CASCADE;

-- 
-- 限制表 `tbl_namecard_collection`
-- 
ALTER TABLE `tbl_namecard_collection`
  ADD CONSTRAINT `FK_collection_namecard_id` FOREIGN KEY (`namecard_id`) REFERENCES `tbl_namecards` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_namecard_uid` FOREIGN KEY (`id`) REFERENCES `tbl_local_accounts` (`id`) ON DELETE CASCADE;

-- 
-- 限制表 `tbl_namecard_email`
-- 
ALTER TABLE `tbl_namecard_email`
  ADD CONSTRAINT `FK_namecard_email_user` FOREIGN KEY (`user_id`) REFERENCES `tbl_local_accounts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_tbl_namecard_email` FOREIGN KEY (`namecard_id`) REFERENCES `tbl_namecards` (`id`) ON DELETE CASCADE;

-- 
-- 限制表 `tbl_namecard_mobile`
-- 
ALTER TABLE `tbl_namecard_mobile`
  ADD CONSTRAINT `FK_mobile_namecard_id` FOREIGN KEY (`namecard_id`) REFERENCES `tbl_namecards` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_namecard_mobile_user` FOREIGN KEY (`user_id`) REFERENCES `tbl_local_accounts` (`id`) ON DELETE CASCADE;

-- 
-- 限制表 `tbl_namecard_private`
-- 
ALTER TABLE `tbl_namecard_private`
  ADD CONSTRAINT `FK_private_user_id` FOREIGN KEY (`uid`) REFERENCES `tbl_local_accounts` (`id`) ON DELETE CASCADE;

-- 
-- 限制表 `tbl_namecards`
-- 
ALTER TABLE `tbl_namecards`
  ADD CONSTRAINT `FK_namecard_user` FOREIGN KEY (`user_id`) REFERENCES `tbl_local_accounts` (`id`) ON DELETE CASCADE;

-- 
-- 限制表 `tbl_notice_connections`
-- 
ALTER TABLE `tbl_notice_connections`
  ADD CONSTRAINT `FK_connections_notice_id` FOREIGN KEY (`notice_id`) REFERENCES `tbl_notice` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_notice_connections_user` FOREIGN KEY (`user_id`) REFERENCES `tbl_local_accounts` (`id`) ON DELETE CASCADE;

-- 
-- 限制表 `tbl_phone_numbers`
-- 
ALTER TABLE `tbl_phone_numbers`
  ADD CONSTRAINT `FK_phone_number_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_local_accounts` (`id`) ON DELETE CASCADE;

-- 
-- 限制表 `tbl_positions`
-- 
ALTER TABLE `tbl_positions`
  ADD CONSTRAINT `FK_positions_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_profiles` (`user_id`) ON DELETE CASCADE;

-- 
-- 限制表 `tbl_profiles`
-- 
ALTER TABLE `tbl_profiles`
  ADD CONSTRAINT `FK_profile_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_local_accounts` (`id`) ON DELETE CASCADE;

-- 
-- 限制表 `tbl_pw_protection_answers`
-- 
ALTER TABLE `tbl_pw_protection_answers`
  ADD CONSTRAINT `FK_question_id` FOREIGN KEY (`qid`) REFERENCES `tbl_pw_protection_questions` (`qid`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_question_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_local_accounts` (`id`) ON DELETE CASCADE;

-- 
-- 限制表 `tbl_ref_accounts`
-- 
ALTER TABLE `tbl_ref_accounts`
  ADD CONSTRAINT `FK_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_local_accounts` (`id`) ON DELETE CASCADE;

-- 
-- 限制表 `tbl_tag_connections`
-- 
ALTER TABLE `tbl_tag_connections`
  ADD CONSTRAINT `FK_tab_connect_user` FOREIGN KEY (`user_id`) REFERENCES `tbl_profiles` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_tag_id` FOREIGN KEY (`tagid`) REFERENCES `tbl_tag` (`id`) ON DELETE CASCADE;

-- 
-- 限制表 `tbl_user_config`
-- 
ALTER TABLE `tbl_user_config`
  ADD CONSTRAINT `FK_config_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_local_accounts` (`id`) ON DELETE CASCADE;

-- 
-- 限制表 `tbl_user_history`
-- 
ALTER TABLE `tbl_user_history`
  ADD CONSTRAINT `FK_history_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_local_accounts` (`id`) ON DELETE CASCADE;

-- 
-- 限制表 `tbl_visit`
-- 
ALTER TABLE `tbl_visit`
  ADD CONSTRAINT `FK_tbl_visit` FOREIGN KEY (`uid`) REFERENCES `tbl_local_accounts` (`id`) ON DELETE CASCADE;

-- 
-- 数据库: `phpmyadmin`
-- 
CREATE DATABASE `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

-- 
-- 表的结构 `pma_bookmark`
-- 

DROP TABLE IF EXISTS `pma_bookmark`;
CREATE TABLE IF NOT EXISTS `pma_bookmark` (
  `id` int(11) NOT NULL auto_increment,
  `dbase` varchar(255) collate utf8_bin NOT NULL default '',
  `user` varchar(255) collate utf8_bin NOT NULL default '',
  `label` varchar(255) character set utf8 NOT NULL default '',
  `query` text collate utf8_bin NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks' AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `pma_bookmark`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `pma_column_info`
-- 

DROP TABLE IF EXISTS `pma_column_info`;
CREATE TABLE IF NOT EXISTS `pma_column_info` (
  `id` int(5) unsigned NOT NULL auto_increment,
  `db_name` varchar(64) collate utf8_bin NOT NULL default '',
  `table_name` varchar(64) collate utf8_bin NOT NULL default '',
  `column_name` varchar(64) collate utf8_bin NOT NULL default '',
  `comment` varchar(255) character set utf8 NOT NULL default '',
  `mimetype` varchar(255) character set utf8 NOT NULL default '',
  `transformation` varchar(255) collate utf8_bin NOT NULL default '',
  `transformation_options` varchar(255) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin' AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `pma_column_info`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `pma_history`
-- 

DROP TABLE IF EXISTS `pma_history`;
CREATE TABLE IF NOT EXISTS `pma_history` (
  `id` bigint(20) unsigned NOT NULL auto_increment,
  `username` varchar(64) collate utf8_bin NOT NULL default '',
  `db` varchar(64) collate utf8_bin NOT NULL default '',
  `table` varchar(64) collate utf8_bin NOT NULL default '',
  `timevalue` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `sqlquery` text collate utf8_bin NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `username` (`username`,`db`,`table`,`timevalue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin' AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `pma_history`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `pma_pdf_pages`
-- 

DROP TABLE IF EXISTS `pma_pdf_pages`;
CREATE TABLE IF NOT EXISTS `pma_pdf_pages` (
  `db_name` varchar(64) collate utf8_bin NOT NULL default '',
  `page_nr` int(10) unsigned NOT NULL auto_increment,
  `page_descr` varchar(50) character set utf8 NOT NULL default '',
  PRIMARY KEY  (`page_nr`),
  KEY `db_name` (`db_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin' AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `pma_pdf_pages`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `pma_relation`
-- 

DROP TABLE IF EXISTS `pma_relation`;
CREATE TABLE IF NOT EXISTS `pma_relation` (
  `master_db` varchar(64) collate utf8_bin NOT NULL default '',
  `master_table` varchar(64) collate utf8_bin NOT NULL default '',
  `master_field` varchar(64) collate utf8_bin NOT NULL default '',
  `foreign_db` varchar(64) collate utf8_bin NOT NULL default '',
  `foreign_table` varchar(64) collate utf8_bin NOT NULL default '',
  `foreign_field` varchar(64) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`master_db`,`master_table`,`master_field`),
  KEY `foreign_field` (`foreign_db`,`foreign_table`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- 
-- 导出表中的数据 `pma_relation`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `pma_table_coords`
-- 

DROP TABLE IF EXISTS `pma_table_coords`;
CREATE TABLE IF NOT EXISTS `pma_table_coords` (
  `db_name` varchar(64) collate utf8_bin NOT NULL default '',
  `table_name` varchar(64) collate utf8_bin NOT NULL default '',
  `pdf_page_number` int(11) NOT NULL default '0',
  `x` float unsigned NOT NULL default '0',
  `y` float unsigned NOT NULL default '0',
  PRIMARY KEY  (`db_name`,`table_name`,`pdf_page_number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- 
-- 导出表中的数据 `pma_table_coords`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `pma_table_info`
-- 

DROP TABLE IF EXISTS `pma_table_info`;
CREATE TABLE IF NOT EXISTS `pma_table_info` (
  `db_name` varchar(64) collate utf8_bin NOT NULL default '',
  `table_name` varchar(64) collate utf8_bin NOT NULL default '',
  `display_field` varchar(64) collate utf8_bin NOT NULL default '',
  PRIMARY KEY  (`db_name`,`table_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- 
-- 导出表中的数据 `pma_table_info`
-- 

-- 
-- 数据库: `shx`
-- 
CREATE DATABASE `shx` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `shx`;

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_access`
-- 

DROP TABLE IF EXISTS `pp_access`;
CREATE TABLE IF NOT EXISTS `pp_access` (
  `role_id` tinyint(5) NOT NULL,
  `node_id` tinyint(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `pp_access`
-- 

INSERT INTO `pp_access` VALUES (2, 14);
INSERT INTO `pp_access` VALUES (2, 13);
INSERT INTO `pp_access` VALUES (2, 12);
INSERT INTO `pp_access` VALUES (1, 50);
INSERT INTO `pp_access` VALUES (1, 51);
INSERT INTO `pp_access` VALUES (1, 99);
INSERT INTO `pp_access` VALUES (1, 100);
INSERT INTO `pp_access` VALUES (1, 101);
INSERT INTO `pp_access` VALUES (1, 102);
INSERT INTO `pp_access` VALUES (1, 103);
INSERT INTO `pp_access` VALUES (1, 104);
INSERT INTO `pp_access` VALUES (1, 107);
INSERT INTO `pp_access` VALUES (1, 115);
INSERT INTO `pp_access` VALUES (1, 116);
INSERT INTO `pp_access` VALUES (1, 117);
INSERT INTO `pp_access` VALUES (1, 118);
INSERT INTO `pp_access` VALUES (1, 127);
INSERT INTO `pp_access` VALUES (1, 121);
INSERT INTO `pp_access` VALUES (1, 122);
INSERT INTO `pp_access` VALUES (1, 127);
INSERT INTO `pp_access` VALUES (1, 127);
INSERT INTO `pp_access` VALUES (1, 127);
INSERT INTO `pp_access` VALUES (1, 127);
INSERT INTO `pp_access` VALUES (1, 127);
INSERT INTO `pp_access` VALUES (1, 127);
INSERT INTO `pp_access` VALUES (1, 127);
INSERT INTO `pp_access` VALUES (1, 127);
INSERT INTO `pp_access` VALUES (1, 127);
INSERT INTO `pp_access` VALUES (2, 15);
INSERT INTO `pp_access` VALUES (2, 16);
INSERT INTO `pp_access` VALUES (2, 101);
INSERT INTO `pp_access` VALUES (2, 102);
INSERT INTO `pp_access` VALUES (2, 103);
INSERT INTO `pp_access` VALUES (2, 105);
INSERT INTO `pp_access` VALUES (2, 106);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 117);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (1, 50);
INSERT INTO `pp_access` VALUES (1, 51);
INSERT INTO `pp_access` VALUES (1, 99);
INSERT INTO `pp_access` VALUES (1, 100);
INSERT INTO `pp_access` VALUES (1, 101);
INSERT INTO `pp_access` VALUES (1, 102);
INSERT INTO `pp_access` VALUES (1, 103);
INSERT INTO `pp_access` VALUES (1, 104);
INSERT INTO `pp_access` VALUES (1, 107);
INSERT INTO `pp_access` VALUES (1, 115);
INSERT INTO `pp_access` VALUES (1, 116);
INSERT INTO `pp_access` VALUES (1, 117);
INSERT INTO `pp_access` VALUES (1, 118);
INSERT INTO `pp_access` VALUES (1, 127);
INSERT INTO `pp_access` VALUES (1, 121);
INSERT INTO `pp_access` VALUES (1, 122);
INSERT INTO `pp_access` VALUES (1, 127);
INSERT INTO `pp_access` VALUES (1, 127);
INSERT INTO `pp_access` VALUES (1, 127);
INSERT INTO `pp_access` VALUES (1, 127);
INSERT INTO `pp_access` VALUES (1, 127);
INSERT INTO `pp_access` VALUES (1, 127);
INSERT INTO `pp_access` VALUES (1, 127);
INSERT INTO `pp_access` VALUES (1, 127);
INSERT INTO `pp_access` VALUES (1, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 116);
INSERT INTO `pp_access` VALUES (2, 115);
INSERT INTO `pp_access` VALUES (2, 110);
INSERT INTO `pp_access` VALUES (2, 109);
INSERT INTO `pp_access` VALUES (2, 108);
INSERT INTO `pp_access` VALUES (2, 107);
INSERT INTO `pp_access` VALUES (2, 104);
INSERT INTO `pp_access` VALUES (2, 106);
INSERT INTO `pp_access` VALUES (2, 105);
INSERT INTO `pp_access` VALUES (2, 103);
INSERT INTO `pp_access` VALUES (2, 102);
INSERT INTO `pp_access` VALUES (2, 101);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 100);
INSERT INTO `pp_access` VALUES (2, 99);
INSERT INTO `pp_access` VALUES (2, 51);
INSERT INTO `pp_access` VALUES (2, 50);
INSERT INTO `pp_access` VALUES (2, 124);
INSERT INTO `pp_access` VALUES (2, 123);
INSERT INTO `pp_access` VALUES (2, 125);
INSERT INTO `pp_access` VALUES (2, 16);
INSERT INTO `pp_access` VALUES (2, 15);
INSERT INTO `pp_access` VALUES (2, 14);
INSERT INTO `pp_access` VALUES (2, 13);
INSERT INTO `pp_access` VALUES (2, 12);
INSERT INTO `pp_access` VALUES (2, 11);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 122);
INSERT INTO `pp_access` VALUES (2, 121);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 10);
INSERT INTO `pp_access` VALUES (2, 9);
INSERT INTO `pp_access` VALUES (2, 8);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 118);
INSERT INTO `pp_access` VALUES (2, 7);
INSERT INTO `pp_access` VALUES (2, 6);
INSERT INTO `pp_access` VALUES (2, 5);
INSERT INTO `pp_access` VALUES (2, 4);
INSERT INTO `pp_access` VALUES (2, 3);
INSERT INTO `pp_access` VALUES (2, 2);
INSERT INTO `pp_access` VALUES (2, 1);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);
INSERT INTO `pp_access` VALUES (2, 127);

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_ad`
-- 

DROP TABLE IF EXISTS `pp_ad`;
CREATE TABLE IF NOT EXISTS `pp_ad` (
  `id` smallint(5) NOT NULL auto_increment,
  `board_id` smallint(5) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `code` text NOT NULL,
  `start_time` int(10) NOT NULL,
  `end_time` int(10) NOT NULL,
  `clicks` int(10) NOT NULL default '0',
  `add_time` int(10) NOT NULL,
  `ordid` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- 
-- 导出表中的数据 `pp_ad`
-- 

INSERT INTO `pp_ad` VALUES (6, 4, 'code', '麦包包', '', '<script type=\\"text/javascript\\">var _bdhmProtocol = ((\\"https:\\" == document.location.protocol) ? \\" https://\\" : \\" http://\\");document.write(unescape(\\"%3Cscript src=\\''\\" + _bdhmProtocol + \\"hm.baidu.com/h.js%3F0d7cfb59679455d9e770b1f9e1487bdf\\'' type=\\''text/javascript\\''%3E%3C/script%3E\\"));</script>', 1333595088, 1365217491, 0, 1333681516, 0, 1);
INSERT INTO `pp_ad` VALUES (7, 5, 'code', '凡客', '', '<a href="http://c.duomai.com/track.php?sid=10506&lid=2178&aid=62&euid=&t=http%3A%2F%2Fcatalog.vancl.com%2Fintegrated%2Fgzcs_20120224.html" target="_blank"><img border="0" src="http://www.duomai.com/Public/Uploads/d5755cdbca7ca21daccf62114f129dba.gif" alt="格子衬衫 79元起" /></a>', 1333683143, 1365219146, 11, 1333683151, 0, 1);

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_adboard`
-- 

DROP TABLE IF EXISTS `pp_adboard`;
CREATE TABLE IF NOT EXISTS `pp_adboard` (
  `id` smallint(5) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `width` smallint(5) NOT NULL,
  `height` smallint(5) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- 
-- 导出表中的数据 `pp_adboard`
-- 

INSERT INTO `pp_adboard` VALUES (1, '首页焦点图', 'focus', 580, 280, '33', 1);
INSERT INTO `pp_adboard` VALUES (4, '详细页横幅', 'banner', 950, 100, '', 1);
INSERT INTO `pp_adboard` VALUES (5, '详细页右侧', 'banner', 226, 226, '', 1);
INSERT INTO `pp_adboard` VALUES (6, '首页下方横幅', 'banner', 950, 100, '', 1);

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_admin`
-- 

DROP TABLE IF EXISTS `pp_admin`;
CREATE TABLE IF NOT EXISTS `pp_admin` (
  `id` int(10) NOT NULL auto_increment,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `add_time` int(10) default NULL,
  `last_time` int(10) default NULL,
  `status` tinyint(1) unsigned NOT NULL default '1',
  `role_id` int(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `pp_admin`
-- 

INSERT INTO `pp_admin` VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1348649529, NULL, 1, 1);

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_album`
-- 

DROP TABLE IF EXISTS `pp_album`;
CREATE TABLE IF NOT EXISTS `pp_album` (
  `id` int(10) NOT NULL auto_increment,
  `title` varchar(50) NOT NULL default '默认专辑',
  `img` varchar(255) default NULL,
  `uid` int(10) NOT NULL,
  `remark` varchar(255) default NULL,
  `cid` int(10) NOT NULL default '0',
  `sort_order` int(10) default NULL,
  `recommend` tinyint(4) NOT NULL default '0',
  `status` tinyint(4) NOT NULL default '1',
  `add_time` int(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `pp_album`
-- 

INSERT INTO `pp_album` VALUES (1, '爱情', NULL, 1, '第三方第三方第三个打工的非官方大哥', 2, NULL, 0, 1, 1350271091);

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_album_cate`
-- 

DROP TABLE IF EXISTS `pp_album_cate`;
CREATE TABLE IF NOT EXISTS `pp_album_cate` (
  `id` int(10) NOT NULL auto_increment,
  `title` varchar(50) NOT NULL default '我的专辑',
  `add_time` int(10) NOT NULL default '0',
  `album_num` int(10) NOT NULL default '0',
  `sort_order` int(10) NOT NULL default '0',
  `status` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- 
-- 导出表中的数据 `pp_album_cate`
-- 

INSERT INTO `pp_album_cate` VALUES (5, '其他', 1338789120, 0, 0, 1);
INSERT INTO `pp_album_cate` VALUES (1, '美容', 1338789120, 0, 1, 1);
INSERT INTO `pp_album_cate` VALUES (2, '购物', 1338789120, 0, 1, 1);
INSERT INTO `pp_album_cate` VALUES (3, '生活', 1338789120, 0, 5, 1);
INSERT INTO `pp_album_cate` VALUES (4, '家居', 1338789120, 0, 10, 1);

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_album_items`
-- 

DROP TABLE IF EXISTS `pp_album_items`;
CREATE TABLE IF NOT EXISTS `pp_album_items` (
  `id` int(10) NOT NULL auto_increment,
  `items_id` int(10) NOT NULL default '0',
  `pid` int(10) NOT NULL default '0',
  `remark` varchar(255) default NULL,
  `add_time` int(10) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `pp_album_items`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `pp_article`
-- 

DROP TABLE IF EXISTS `pp_article`;
CREATE TABLE IF NOT EXISTS `pp_article` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `cate_id` tinyint(4) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `orig` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `abst` varchar(255) NOT NULL,
  `info` text NOT NULL,
  `add_time` datetime NOT NULL,
  `ordid` tinyint(4) NOT NULL,
  `is_hot` tinyint(1) NOT NULL default '0',
  `is_best` tinyint(1) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0' COMMENT '0-待审核 1-已审核',
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- 
-- 导出表中的数据 `pp_article`
-- 

INSERT INTO `pp_article` VALUES (1, 1, '关于我们', '', '', '', '', '<div>　　欢迎来到PinPHP－拼命网， 拼命网&nbsp;是一个技术驱动创造时尚的互联网创业型公司，通过搜索引擎、图形处理、视觉搜索等核心技术研发优势，为中国千百万的个人站长提供一个解决如何快速抢建一个社会化的电子商务导购平台，它可以帮助爱美丽的女生找到适合的穿衣搭配、在哪里购买合适的时装搭配网购社区平台；我们将致力于为每一个时尚女孩都能轻松地创建属于自己的搭配宝典库而矢志不移的奉献青春年华。</div>\r\n<div><br />\r\n</div>\r\n<div>　　来逛 拼命网&nbsp;，你将发现更多喜爱的搭配风格，找到你最喜欢的时尚元素，你也将发现全球各地流行的风格与趋势，你还能很方便的在线拼贴搭配出你的时尚品味；懂得搭配的女人才更美丽，拉上你的好姐妹们一起来逛美丽街吧！</div>\r\n<div><br />\r\n</div>\r\n<div>　　Logo寓意诠释：化蛹成碟的美丽蜕变，意思是通过来逛 拼命网能让女孩们蜕变得更美丽！</div>', '2012-03-17 11:30:14', 0, 0, 0, 1, '', '', '');
INSERT INTO `pp_article` VALUES (2, 1, '网站地图', '', '', '', '', '网站地图<br />', '2012-03-17 11:31:22', 0, 0, 0, 1, '', '', '');
INSERT INTO `pp_article` VALUES (3, 1, '联系我们', '', '', '', '', '<p>联系电话：0571-28058597</p>\r\n<p>&nbsp;</p>\r\n<p>官方网站：www.pinphp.com</p>\r\n<p>&nbsp;</p>\r\n<p>地址：杭州市万塘路６９号华星科技苑Ａ楼</p>\r\n<p>&nbsp;</p>\r\n<p>邮编：３１００１２</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', '2012-03-17 11:32:08', 0, 0, 0, 1, '', '', '');
INSERT INTO `pp_article` VALUES (4, 1, '隐私政策', '', '', '', '拼品网', '<div style="text-align:center;"><b><span style="font-size:18px;">隐私保护原则</span></b> </div>\r\n<div>　　我们非常重视您的隐私，保护用户隐私是美丽说的重点原则，在您使用美丽说提供的服务前，请您仔细阅读以下隐私保护原则。</div>\r\n<div><br />\r\n</div>\r\n<div>　　<b>一、用户信息</b></div>\r\n<div>　　美丽说将对您所提供的资料进行严格的管理及保护，美丽说通过技术手段、提供隐私保护服务功能、强化内部管理等办法充分保护用户的个人资料安全。美丽说为用户提供对个人注册信息的绝对的控制权，用户可以通过“修改个人信息”查看或修改个人信息。用户自愿注册个人信息，用户在注册时提供的所有信息，都是基于自愿，用户有权在任何时候拒绝提供这些信息。美丽说保证不对外公开或向第三方提供用户注册的个人资料，及用户在使用服务时存储的非公开内容，但下列情况除外：</div>\r\n<div>　　◇ 事先获得您的明确授权；</div>\r\n<div>　　◇ 根据有关的法律法规要求；</div>\r\n<div>　　◇ 按照相关司法机构或政府主管部门的要求；</div>\r\n<div>　　◇ 只有透露你的个人资料，才能提供你所要求的产品和服务；</div>\r\n<div>　　◇ 因黑客行为或用户的保管疏忽导致帐号、密码遭他人非法使用；</div>\r\n<div>　　◇ 由于您将用户密码告知他人或与他人共享注册帐户，由此导致的任何个人资料泄露。</div>\r\n<div><br />\r\n</div>\r\n<div>　　<b>二、Cookies和其他浏览器技术</b></div>\r\n<div>　　当用户访问美丽说的时候，我们可能会保存会员的用户登录状态并且为用户分配一个或多个“Cookies”（一个很小的文本文件），例如：当会员访问一个需要会员登录才可以提供的信息或服务，当会员登录时，我们会把该会员的登录名和密码加密存储在用会员计算机的Cookie文件中，由于是不可逆转的加密存储，其他人即使可以使用该会员的计算机，也无法识别出会员的用户名和密码。会员并不需要额外做任何工作，所有的收集和保存都由系统自动完成。</div>\r\n<div>Cookie文件将永久的保存在您的计算机硬盘上，除非您使用浏览器或操作系统软件手工将其删除。您也可以选择“不使用Cookie”或“在使用Cookie时事先通知我”的选项禁止Cookie的产生，但是您将为此无法使用一些美丽说的查询和服务。</div>\r\n<div><br />\r\n</div>\r\n<div>　　<b>三、合作伙伴</b></div>\r\n<div>　　我们选择有信誉的第三方公司或网站作为我们的合作伙伴为用户提供信息和服务。尽管我们只选择有信誉的公司或网站作为我们的合作伙伴，但是每个合作伙伴都会有与美丽说不同的隐私保护政策，一旦您通过点击进入了合作伙伴的网站，美丽说隐私保护原则将不再生效，我们　　建议您查看该合作伙伴网站的隐私条款，并了解该合作伙伴对于收集、使用、泄露您的个人信息的规定。</div>\r\n<div>　　</div>\r\n<div>　　如果您对此隐私保护原则有任何疑问或建议，请通过以下方式联系我们: tech@pinphp.com，我们会尽一切努力保护您的隐私。</div>', '2012-03-17 11:33:00', 0, 0, 0, 1, '', '', '');
INSERT INTO `pp_article` VALUES (5, 5, '新手指南', '', '', '', '', '新手指南<br />', '2012-03-17 11:33:29', 0, 0, 0, 1, '', '', '');
INSERT INTO `pp_article` VALUES (6, 5, '网站地图', '', '', '', '', '新手指南<br />', '2012-03-17 11:33:45', 0, 0, 0, 1, '', '', '');
INSERT INTO `pp_article` VALUES (7, 9, '50条天使之恋项链免费申领', '', '4f640f80f14d9.jpg', '', '白色情人节来啦，浪漫延续，美丽说携手@珂兰钻石网 为爱美丽们准备了50条天使之恋项链，这个情人节让@珂兰钻石网 陪你一起度过，妞们还等什么，快来申领吧！', '', '2012-03-17 12:13:53', 0, 0, 0, 1, '', '', '');
INSERT INTO `pp_article` VALUES (8, 9, '100件Shinelove心爱FOR LOVER文胸免费试穿', '', '4f640fe112c89.jpg', 'index.php?m=search&a=index&type=search&keywords=心爱', '#100件心爱文胸试穿申领#有心才有爱，把爱传至心底，爱美丽们一定要学会宠爱自己哦！美丽说携手 @Shinelove心爱 为爱美丽们准备了100件爱慕集团旗下网络专享品牌“Shinelove心爱” 文胸。', '', '2012-03-17 12:15:29', 0, 0, 0, 1, '', '', '');
INSERT INTO `pp_article` VALUES (9, 9, '50件金三塔真丝家居服免费试穿', '', '', 'index.php?m=search&a=index&type=search&keywords=家居', '50件金三塔真丝家居服免费试穿50件金三塔真丝家居服免费试穿50件金三塔真丝家居服免费试穿50件金三塔真丝家居服免费试穿50件金三塔真丝家居服免费试穿', '', '2012-03-17 12:15:49', 0, 0, 0, 1, '', '', '');
INSERT INTO `pp_article` VALUES (10, 9, '100套大牌护肤盒子免费试用', '', '', 'http://demo.pinphp.com/c-2', '100套大牌护肤盒子免费试用100套大牌护肤盒子免费试用100套大牌护肤盒子免费试用100套大牌护肤盒子免费试用', '', '2012-03-17 12:16:01', 0, 0, 0, 1, '', '', '');
INSERT INTO `pp_article` VALUES (11, 9, '女生节小精灵有礼相送', '', '4f64199e548b1.jpg', 'index.php?m=search&a=index&type=search&keywords=女生', '2 女生节小精灵有礼相送2 女生节小精灵有礼相送2 女生节小精灵有礼相送2 女生节小精灵有礼相送', '', '2012-03-17 12:16:33', 0, 1, 1, 1, '', '', '');

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_article_cate`
-- 

DROP TABLE IF EXISTS `pp_article_cate`;
CREATE TABLE IF NOT EXISTS `pp_article_cate` (
  `id` smallint(4) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `pid` smallint(4) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL default '1',
  `article_nums` int(10) unsigned NOT NULL,
  `sort_order` smallint(4) unsigned NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- 
-- 导出表中的数据 `pp_article_cate`
-- 

INSERT INTO `pp_article_cate` VALUES (1, '网站信息', 'sites', 11, 1, 4, 10, '', '', '');
INSERT INTO `pp_article_cate` VALUES (5, '新手入门', 'faq', 11, 1, 2, 5, '', '', '');
INSERT INTO `pp_article_cate` VALUES (9, '热门活动', 'active', 10, 1, 5, 0, '', '', '');
INSERT INTO `pp_article_cate` VALUES (10, '资讯活动', 'news', 0, 1, 0, 1, '', '', '');
INSERT INTO `pp_article_cate` VALUES (11, '网站帮助', 'help', 0, 1, 0, 2, '', '', '');

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_attatch`
-- 

DROP TABLE IF EXISTS `pp_attatch`;
CREATE TABLE IF NOT EXISTS `pp_attatch` (
  `aid` int(10) NOT NULL auto_increment,
  `res_id` int(10) NOT NULL default '0',
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `filetype` varchar(20) NOT NULL,
  `filesize` float NOT NULL,
  `uptime` datetime NOT NULL,
  PRIMARY KEY  (`aid`),
  KEY `res_id` (`res_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `pp_attatch`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `pp_collect_taobao`
-- 

DROP TABLE IF EXISTS `pp_collect_taobao`;
CREATE TABLE IF NOT EXISTS `pp_collect_taobao` (
  `cate_id` smallint(4) NOT NULL,
  `collect_time` int(10) NOT NULL default '0',
  UNIQUE KEY `cate_id` (`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `pp_collect_taobao`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `pp_flink`
-- 

DROP TABLE IF EXISTS `pp_flink`;
CREATE TABLE IF NOT EXISTS `pp_flink` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `cate_id` smallint(4) NOT NULL default '1',
  `img` varchar(255) default NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL default '0',
  `ordid` smallint(5) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- 
-- 导出表中的数据 `pp_flink`
-- 

INSERT INTO `pp_flink` VALUES (1, 1, '', 'B2C商城', 'http://www.dob2c.com/', 1, 99);
INSERT INTO `pp_flink` VALUES (2, 1, '', 'PinPHP官网', 'http://www.pinphp.com', 1, 99);
INSERT INTO `pp_flink` VALUES (3, 1, '', '美贝网', 'http://www.meibei.com', 1, 99);
INSERT INTO `pp_flink` VALUES (4, 2, '', '逛－发现喜欢', 'http://www.guang.com', 1, 99);
INSERT INTO `pp_flink` VALUES (5, 2, NULL, '梅州网', 'http://www.201205.com', 1, 99);

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_flink_cate`
-- 

DROP TABLE IF EXISTS `pp_flink_cate`;
CREATE TABLE IF NOT EXISTS `pp_flink_cate` (
  `id` smallint(4) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- 导出表中的数据 `pp_flink_cate`
-- 

INSERT INTO `pp_flink_cate` VALUES (1, '友情链接');
INSERT INTO `pp_flink_cate` VALUES (2, '合作伙伴');

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_focus`
-- 

DROP TABLE IF EXISTS `pp_focus`;
CREATE TABLE IF NOT EXISTS `pp_focus` (
  `id` int(11) NOT NULL auto_increment,
  `cate_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `abst` text NOT NULL,
  `clicks` int(10) NOT NULL default '0',
  `ordid` smallint(4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- 
-- 导出表中的数据 `pp_focus`
-- 

INSERT INTO `pp_focus` VALUES (9, 1, '中性风潮', '?a=index&m=cate&cid=3', '4f7d43c7e4e98.png', '', 146, 0, 0);
INSERT INTO `pp_focus` VALUES (10, 1, '格子控女生', '?a=index&m=cate&cid=5', '4f7d439f15ab3.png', '', 97, 0, 1);
INSERT INTO `pp_focus` VALUES (7, 1, '蝴蝶结公主', '?a=index&m=cate&cid=7', '4f7d56a8e5540.png', '', 89, 0, 1);
INSERT INTO `pp_focus` VALUES (8, 1, '爱上小碎花', '?a=index&m=cate&cid=1', '4f7d57352e630.png', '', 91, 0, 1);

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_focus_cate`
-- 

DROP TABLE IF EXISTS `pp_focus_cate`;
CREATE TABLE IF NOT EXISTS `pp_focus_cate` (
  `id` smallint(6) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `width` smallint(6) NOT NULL default '0',
  `height` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `pp_focus_cate`
-- 

INSERT INTO `pp_focus_cate` VALUES (1, '首页焦点', 580, 280);

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_group`
-- 

DROP TABLE IF EXISTS `pp_group`;
CREATE TABLE IF NOT EXISTS `pp_group` (
  `id` smallint(3) unsigned NOT NULL auto_increment,
  `name` varchar(25) NOT NULL,
  `title` varchar(50) NOT NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL default '0',
  `status` tinyint(1) unsigned NOT NULL default '0',
  `sort` smallint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- 
-- 导出表中的数据 `pp_group`
-- 

INSERT INTO `pp_group` VALUES (1, 'system', '系统设置', 1222841259, 1222841259, 1, 3);
INSERT INTO `pp_group` VALUES (4, 'article', '内容管理', 1222841259, 1222841259, 1, 1);
INSERT INTO `pp_group` VALUES (6, 'goods', '商品管理', 1222841259, 0, 1, 0);
INSERT INTO `pp_group` VALUES (8, 'member', '会员管理', 0, 0, 1, 2);

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_items`
-- 

DROP TABLE IF EXISTS `pp_items`;
CREATE TABLE IF NOT EXISTS `pp_items` (
  `id` int(10) NOT NULL auto_increment,
  `cid` smallint(4) default NULL,
  `level` tinyint(1) NOT NULL default '3',
  `item_key` varchar(50) default NULL,
  `title` varchar(255) default NULL,
  `img` varchar(255) default NULL,
  `simg` varchar(255) default NULL,
  `bimg` varchar(255) default NULL,
  `price` decimal(10,2) default NULL,
  `url` varchar(255) default NULL,
  `info` text NOT NULL,
  `sid` smallint(4) NOT NULL default '0',
  `hits` int(10) NOT NULL default '0',
  `dlikes` int(11) NOT NULL,
  `likes` int(10) NOT NULL default '0' COMMENT '喜欢数',
  `haves` int(10) NOT NULL default '0' COMMENT '库存数',
  `comments` int(10) NOT NULL default '0' COMMENT '评论数',
  `comments_last` text COMMENT '最近的N条评论',
  `is_index` tinyint(1) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '1',
  `add_time` int(10) NOT NULL default '0',
  `last_time` int(10) NOT NULL,
  `uid` int(10) NOT NULL default '0',
  `seo_title` varchar(255) default NULL,
  `seo_keys` varchar(255) default NULL,
  `sort_order` int(10) default '0',
  `seo_desc` text,
  `remark` varchar(50) default NULL,
  `remark_status` tinyint(6) default '1',
  PRIMARY KEY  (`id`),
  KEY `cid` (`cid`),
  KEY `is_index` (`is_index`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=662 ;

-- 
-- 导出表中的数据 `pp_items`
-- 

INSERT INTO `pp_items` VALUES (1, 376, 3, 'handel_1348552142', '丰东股份', '/data/items/2012-09-25/m_506145cecd30c.jpg', '/data/items/2012-09-25/s_506145cecd30c.jpg', '/data/items/2012-09-25/b_506145cecd30c.jpg', 0.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348552142, 1348552142, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (2, 118, 3, 'handel_1348552165', '对方得分', '/data/items/2012-09-25/m_506145e59d95a.jpg', '/data/items/2012-09-25/s_506145e59d95a.jpg', '/data/items/2012-09-25/b_506145e59d95a.jpg', 213.00, '', '', 2, 1, 0, 0, 0, 0, NULL, 0, 1, 1348552165, 1348552165, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (3, 366, 3, 'handel_1348552184', '大幅度', '/data/items/2012-09-25/m_506145f804462.jpg', '/data/items/2012-09-25/s_506145f804462.jpg', '/data/items/2012-09-25/b_506145f804462.jpg', 2132.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348552184, 1348552184, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (4, 352, 3, 'handel_1348552203', '玩儿', '/data/items/2012-09-25/m_5061460bb2ed1.jpg', '/data/items/2012-09-25/s_5061460bb2ed1.jpg', '/data/items/2012-09-25/b_5061460bb2ed1.jpg', 2342.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348552203, 1348552203, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (5, 349, 3, 'handel_1348552233', '(⊙o⊙)…热 ', '/data/items/2012-09-25/m_5061462943928.jpg', '/data/items/2012-09-25/s_5061462943928.jpg', '/data/items/2012-09-25/b_5061462943928.jpg', 543.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348552233, 1348552233, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (6, 333, 3, 'handel_1348552256', '电风扇', '/data/items/2012-09-25/m_50614640661ef.jpg', '/data/items/2012-09-25/s_50614640661ef.jpg', '/data/items/2012-09-25/b_50614640661ef.jpg', 234.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348552256, 1348552256, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (7, 353, 3, 'handel_1348552277', '额外人', '/data/items/2012-09-25/m_50614655e43c9.jpg', '/data/items/2012-09-25/s_50614655e43c9.jpg', '/data/items/2012-09-25/b_50614655e43c9.jpg', 123.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348552277, 1348552277, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (495, 376, 3, 'handel_1348552142', '丰东股份', '/data/items/2012-09-25/m_506145cecd30c.jpg', '/data/items/2012-09-25/s_506145cecd30c.jpg', '/data/items/2012-09-25/b_506145cecd30c.jpg', 0.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348554865, 1348554865, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (496, 118, 3, 'handel_1348552165', '对方得分', '/data/items/2012-09-25/m_506145e59d95a.jpg', '/data/items/2012-09-25/s_506145e59d95a.jpg', '/data/items/2012-09-25/b_506145e59d95a.jpg', 213.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348554990, 1348554990, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (497, 366, 3, 'handel_1348552184', '大幅度', '/data/items/2012-09-25/m_506145f804462.jpg', '/data/items/2012-09-25/s_506145f804462.jpg', '/data/items/2012-09-25/b_506145f804462.jpg', 2132.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348555115, 1348555115, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (498, 352, 3, 'handel_1348552203', '玩儿', '/data/items/2012-09-25/m_5061460bb2ed1.jpg', '/data/items/2012-09-25/s_5061460bb2ed1.jpg', '/data/items/2012-09-25/b_5061460bb2ed1.jpg', 2342.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348555240, 1348555240, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (499, 349, 3, 'handel_1348552233', '(⊙o⊙)…热 ', '/data/items/2012-09-25/m_5061462943928.jpg', '/data/items/2012-09-25/s_5061462943928.jpg', '/data/items/2012-09-25/b_5061462943928.jpg', 543.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348555365, 1348555365, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (500, 333, 3, 'handel_1348552256', '电风扇', '/data/items/2012-09-25/m_50614640661ef.jpg', '/data/items/2012-09-25/s_50614640661ef.jpg', '/data/items/2012-09-25/b_50614640661ef.jpg', 234.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348555490, 1348555490, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (501, 353, 3, 'handel_1348552277', '额外人', '/data/items/2012-09-25/m_50614655e43c9.jpg', '/data/items/2012-09-25/s_50614655e43c9.jpg', '/data/items/2012-09-25/b_50614655e43c9.jpg', 123.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348555615, 1348555615, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (502, 376, 3, 'handel_1348552142', '丰东股份', '/data/items/2012-09-25/m_506145cecd30c.jpg', '/data/items/2012-09-25/s_506145cecd30c.jpg', '/data/items/2012-09-25/b_506145cecd30c.jpg', 0.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348555740, 1348555740, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (503, 118, 3, 'handel_1348552165', '对方得分', '/data/items/2012-09-25/m_506145e59d95a.jpg', '/data/items/2012-09-25/s_506145e59d95a.jpg', '/data/items/2012-09-25/b_506145e59d95a.jpg', 213.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348555865, 1348555865, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (504, 366, 3, 'handel_1348552184', '大幅度', '/data/items/2012-09-25/m_506145f804462.jpg', '/data/items/2012-09-25/s_506145f804462.jpg', '/data/items/2012-09-25/b_506145f804462.jpg', 2132.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348555990, 1348555990, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (505, 352, 3, 'handel_1348552203', '玩儿', '/data/items/2012-09-25/m_5061460bb2ed1.jpg', '/data/items/2012-09-25/s_5061460bb2ed1.jpg', '/data/items/2012-09-25/b_5061460bb2ed1.jpg', 2342.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348556115, 1348556115, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (506, 349, 3, 'handel_1348552233', '(⊙o⊙)…热 ', '/data/items/2012-09-25/m_5061462943928.jpg', '/data/items/2012-09-25/s_5061462943928.jpg', '/data/items/2012-09-25/b_5061462943928.jpg', 543.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348556240, 1348556240, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (507, 333, 3, 'handel_1348552256', '电风扇', '/data/items/2012-09-25/m_50614640661ef.jpg', '/data/items/2012-09-25/s_50614640661ef.jpg', '/data/items/2012-09-25/b_50614640661ef.jpg', 234.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348556365, 1348556365, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (508, 353, 3, 'handel_1348552277', '额外人', '/data/items/2012-09-25/m_50614655e43c9.jpg', '/data/items/2012-09-25/s_50614655e43c9.jpg', '/data/items/2012-09-25/b_50614655e43c9.jpg', 123.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348556490, 1348556490, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (509, 376, 3, 'handel_1348552142', '丰东股份', '/data/items/2012-09-25/m_506145cecd30c.jpg', '/data/items/2012-09-25/s_506145cecd30c.jpg', '/data/items/2012-09-25/b_506145cecd30c.jpg', 0.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348556615, 1348556615, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (510, 118, 3, 'handel_1348552165', '对方得分', '/data/items/2012-09-25/m_506145e59d95a.jpg', '/data/items/2012-09-25/s_506145e59d95a.jpg', '/data/items/2012-09-25/b_506145e59d95a.jpg', 213.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348556740, 1348556740, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (631, 352, 3, 'handel_1348552203', '玩儿', '/data/items/2012-09-25/m_5061460bb2ed1.jpg', '/data/items/2012-09-25/s_5061460bb2ed1.jpg', '/data/items/2012-09-25/b_5061460bb2ed1.jpg', 2342.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348571865, 1348571865, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (630, 366, 3, 'handel_1348552184', '大幅度', '/data/items/2012-09-25/m_506145f804462.jpg', '/data/items/2012-09-25/s_506145f804462.jpg', '/data/items/2012-09-25/b_506145f804462.jpg', 2132.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348571740, 1348571740, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (629, 118, 3, 'handel_1348552165', '对方得分', '/data/items/2012-09-25/m_506145e59d95a.jpg', '/data/items/2012-09-25/s_506145e59d95a.jpg', '/data/items/2012-09-25/b_506145e59d95a.jpg', 213.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348571615, 1348571615, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (628, 376, 3, 'handel_1348552142', '丰东股份', '/data/items/2012-09-25/m_506145cecd30c.jpg', '/data/items/2012-09-25/s_506145cecd30c.jpg', '/data/items/2012-09-25/b_506145cecd30c.jpg', 0.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348571490, 1348571490, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (627, 353, 3, 'handel_1348552277', '额外人', '/data/items/2012-09-25/m_50614655e43c9.jpg', '/data/items/2012-09-25/s_50614655e43c9.jpg', '/data/items/2012-09-25/b_50614655e43c9.jpg', 123.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348571365, 1348571365, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (626, 333, 3, 'handel_1348552256', '电风扇', '/data/items/2012-09-25/m_50614640661ef.jpg', '/data/items/2012-09-25/s_50614640661ef.jpg', '/data/items/2012-09-25/b_50614640661ef.jpg', 234.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348571240, 1348571240, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (625, 349, 3, 'handel_1348552233', '(⊙o⊙)…热 ', '/data/items/2012-09-25/m_5061462943928.jpg', '/data/items/2012-09-25/s_5061462943928.jpg', '/data/items/2012-09-25/b_5061462943928.jpg', 543.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348571115, 1348571115, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (624, 352, 3, 'handel_1348552203', '玩儿', '/data/items/2012-09-25/m_5061460bb2ed1.jpg', '/data/items/2012-09-25/s_5061460bb2ed1.jpg', '/data/items/2012-09-25/b_5061460bb2ed1.jpg', 2342.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348570990, 1348570990, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (623, 366, 3, 'handel_1348552184', '大幅度', '/data/items/2012-09-25/m_506145f804462.jpg', '/data/items/2012-09-25/s_506145f804462.jpg', '/data/items/2012-09-25/b_506145f804462.jpg', 2132.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348570865, 1348570865, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (622, 118, 3, 'handel_1348552165', '对方得分', '/data/items/2012-09-25/m_506145e59d95a.jpg', '/data/items/2012-09-25/s_506145e59d95a.jpg', '/data/items/2012-09-25/b_506145e59d95a.jpg', 213.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348570740, 1348570740, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (621, 376, 3, 'handel_1348552142', '丰东股份', '/data/items/2012-09-25/m_506145cecd30c.jpg', '/data/items/2012-09-25/s_506145cecd30c.jpg', '/data/items/2012-09-25/b_506145cecd30c.jpg', 0.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348570615, 1348570615, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (620, 353, 3, 'handel_1348552277', '额外人', '/data/items/2012-09-25/m_50614655e43c9.jpg', '/data/items/2012-09-25/s_50614655e43c9.jpg', '/data/items/2012-09-25/b_50614655e43c9.jpg', 123.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348570490, 1348570490, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (619, 333, 3, 'handel_1348552256', '电风扇', '/data/items/2012-09-25/m_50614640661ef.jpg', '/data/items/2012-09-25/s_50614640661ef.jpg', '/data/items/2012-09-25/b_50614640661ef.jpg', 234.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348570365, 1348570365, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (618, 349, 3, 'handel_1348552233', '(⊙o⊙)…热 ', '/data/items/2012-09-25/m_5061462943928.jpg', '/data/items/2012-09-25/s_5061462943928.jpg', '/data/items/2012-09-25/b_5061462943928.jpg', 543.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348570240, 1348570240, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (617, 352, 3, 'handel_1348552203', '玩儿', '/data/items/2012-09-25/m_5061460bb2ed1.jpg', '/data/items/2012-09-25/s_5061460bb2ed1.jpg', '/data/items/2012-09-25/b_5061460bb2ed1.jpg', 2342.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348570115, 1348570115, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (616, 366, 3, 'handel_1348552184', '大幅度', '/data/items/2012-09-25/m_506145f804462.jpg', '/data/items/2012-09-25/s_506145f804462.jpg', '/data/items/2012-09-25/b_506145f804462.jpg', 2132.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348569990, 1348569990, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (615, 118, 3, 'handel_1348552165', '对方得分', '/data/items/2012-09-25/m_506145e59d95a.jpg', '/data/items/2012-09-25/s_506145e59d95a.jpg', '/data/items/2012-09-25/b_506145e59d95a.jpg', 213.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348569865, 1348569865, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (614, 376, 3, 'handel_1348552142', '丰东股份', '/data/items/2012-09-25/m_506145cecd30c.jpg', '/data/items/2012-09-25/s_506145cecd30c.jpg', '/data/items/2012-09-25/b_506145cecd30c.jpg', 0.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348569740, 1348569740, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (613, 353, 3, 'handel_1348552277', '额外人', '/data/items/2012-09-25/m_50614655e43c9.jpg', '/data/items/2012-09-25/s_50614655e43c9.jpg', '/data/items/2012-09-25/b_50614655e43c9.jpg', 123.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348569615, 1348569615, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (612, 333, 3, 'handel_1348552256', '电风扇', '/data/items/2012-09-25/m_50614640661ef.jpg', '/data/items/2012-09-25/s_50614640661ef.jpg', '/data/items/2012-09-25/b_50614640661ef.jpg', 234.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348569490, 1348569490, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (611, 349, 3, 'handel_1348552233', '(⊙o⊙)…热 ', '/data/items/2012-09-25/m_5061462943928.jpg', '/data/items/2012-09-25/s_5061462943928.jpg', '/data/items/2012-09-25/b_5061462943928.jpg', 543.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348569365, 1348569365, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (610, 352, 3, 'handel_1348552203', '玩儿', '/data/items/2012-09-25/m_5061460bb2ed1.jpg', '/data/items/2012-09-25/s_5061460bb2ed1.jpg', '/data/items/2012-09-25/b_5061460bb2ed1.jpg', 2342.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348569240, 1348569240, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (609, 366, 3, 'handel_1348552184', '大幅度', '/data/items/2012-09-25/m_506145f804462.jpg', '/data/items/2012-09-25/s_506145f804462.jpg', '/data/items/2012-09-25/b_506145f804462.jpg', 2132.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348569115, 1348569115, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (608, 118, 3, 'handel_1348552165', '对方得分', '/data/items/2012-09-25/m_506145e59d95a.jpg', '/data/items/2012-09-25/s_506145e59d95a.jpg', '/data/items/2012-09-25/b_506145e59d95a.jpg', 213.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348568990, 1348568990, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (607, 376, 3, 'handel_1348552142', '丰东股份', '/data/items/2012-09-25/m_506145cecd30c.jpg', '/data/items/2012-09-25/s_506145cecd30c.jpg', '/data/items/2012-09-25/b_506145cecd30c.jpg', 0.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348568865, 1348568865, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (606, 353, 3, 'handel_1348552277', '额外人', '/data/items/2012-09-25/m_50614655e43c9.jpg', '/data/items/2012-09-25/s_50614655e43c9.jpg', '/data/items/2012-09-25/b_50614655e43c9.jpg', 123.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348568740, 1348568740, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (605, 333, 3, 'handel_1348552256', '电风扇', '/data/items/2012-09-25/m_50614640661ef.jpg', '/data/items/2012-09-25/s_50614640661ef.jpg', '/data/items/2012-09-25/b_50614640661ef.jpg', 234.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348568615, 1348568615, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (604, 349, 3, 'handel_1348552233', '(⊙o⊙)…热 ', '/data/items/2012-09-25/m_5061462943928.jpg', '/data/items/2012-09-25/s_5061462943928.jpg', '/data/items/2012-09-25/b_5061462943928.jpg', 543.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348568490, 1348568490, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (603, 352, 3, 'handel_1348552203', '玩儿', '/data/items/2012-09-25/m_5061460bb2ed1.jpg', '/data/items/2012-09-25/s_5061460bb2ed1.jpg', '/data/items/2012-09-25/b_5061460bb2ed1.jpg', 2342.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348568365, 1348568365, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (602, 366, 3, 'handel_1348552184', '大幅度', '/data/items/2012-09-25/m_506145f804462.jpg', '/data/items/2012-09-25/s_506145f804462.jpg', '/data/items/2012-09-25/b_506145f804462.jpg', 2132.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348568240, 1348568240, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (601, 118, 3, 'handel_1348552165', '对方得分', '/data/items/2012-09-25/m_506145e59d95a.jpg', '/data/items/2012-09-25/s_506145e59d95a.jpg', '/data/items/2012-09-25/b_506145e59d95a.jpg', 213.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348568115, 1348568115, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (600, 376, 3, 'handel_1348552142', '丰东股份', '/data/items/2012-09-25/m_506145cecd30c.jpg', '/data/items/2012-09-25/s_506145cecd30c.jpg', '/data/items/2012-09-25/b_506145cecd30c.jpg', 0.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348567990, 1348567990, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (599, 353, 3, 'handel_1348552277', '额外人', '/data/items/2012-09-25/m_50614655e43c9.jpg', '/data/items/2012-09-25/s_50614655e43c9.jpg', '/data/items/2012-09-25/b_50614655e43c9.jpg', 123.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348567865, 1348567865, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (598, 333, 3, 'handel_1348552256', '电风扇', '/data/items/2012-09-25/m_50614640661ef.jpg', '/data/items/2012-09-25/s_50614640661ef.jpg', '/data/items/2012-09-25/b_50614640661ef.jpg', 234.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348567740, 1348567740, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (597, 349, 3, 'handel_1348552233', '(⊙o⊙)…热 ', '/data/items/2012-09-25/m_5061462943928.jpg', '/data/items/2012-09-25/s_5061462943928.jpg', '/data/items/2012-09-25/b_5061462943928.jpg', 543.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348567615, 1348567615, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (596, 352, 3, 'handel_1348552203', '玩儿', '/data/items/2012-09-25/m_5061460bb2ed1.jpg', '/data/items/2012-09-25/s_5061460bb2ed1.jpg', '/data/items/2012-09-25/b_5061460bb2ed1.jpg', 2342.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348567490, 1348567490, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (595, 366, 3, 'handel_1348552184', '大幅度', '/data/items/2012-09-25/m_506145f804462.jpg', '/data/items/2012-09-25/s_506145f804462.jpg', '/data/items/2012-09-25/b_506145f804462.jpg', 2132.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348567365, 1348567365, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (594, 118, 3, 'handel_1348552165', '对方得分', '/data/items/2012-09-25/m_506145e59d95a.jpg', '/data/items/2012-09-25/s_506145e59d95a.jpg', '/data/items/2012-09-25/b_506145e59d95a.jpg', 213.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348567240, 1348567240, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (593, 376, 3, 'handel_1348552142', '丰东股份', '/data/items/2012-09-25/m_506145cecd30c.jpg', '/data/items/2012-09-25/s_506145cecd30c.jpg', '/data/items/2012-09-25/b_506145cecd30c.jpg', 0.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348567115, 1348567115, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (592, 353, 3, 'handel_1348552277', '额外人', '/data/items/2012-09-25/m_50614655e43c9.jpg', '/data/items/2012-09-25/s_50614655e43c9.jpg', '/data/items/2012-09-25/b_50614655e43c9.jpg', 123.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348566990, 1348566990, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (591, 333, 3, 'handel_1348552256', '电风扇', '/data/items/2012-09-25/m_50614640661ef.jpg', '/data/items/2012-09-25/s_50614640661ef.jpg', '/data/items/2012-09-25/b_50614640661ef.jpg', 234.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348566865, 1348566865, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (590, 349, 3, 'handel_1348552233', '(⊙o⊙)…热 ', '/data/items/2012-09-25/m_5061462943928.jpg', '/data/items/2012-09-25/s_5061462943928.jpg', '/data/items/2012-09-25/b_5061462943928.jpg', 543.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348566740, 1348566740, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (589, 352, 3, 'handel_1348552203', '玩儿', '/data/items/2012-09-25/m_5061460bb2ed1.jpg', '/data/items/2012-09-25/s_5061460bb2ed1.jpg', '/data/items/2012-09-25/b_5061460bb2ed1.jpg', 2342.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348566615, 1348566615, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (588, 366, 3, 'handel_1348552184', '大幅度', '/data/items/2012-09-25/m_506145f804462.jpg', '/data/items/2012-09-25/s_506145f804462.jpg', '/data/items/2012-09-25/b_506145f804462.jpg', 2132.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348566490, 1348566490, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (587, 118, 3, 'handel_1348552165', '对方得分', '/data/items/2012-09-25/m_506145e59d95a.jpg', '/data/items/2012-09-25/s_506145e59d95a.jpg', '/data/items/2012-09-25/b_506145e59d95a.jpg', 213.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348566365, 1348566365, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (586, 376, 3, 'handel_1348552142', '丰东股份', '/data/items/2012-09-25/m_506145cecd30c.jpg', '/data/items/2012-09-25/s_506145cecd30c.jpg', '/data/items/2012-09-25/b_506145cecd30c.jpg', 0.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348566240, 1348566240, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (585, 353, 3, 'handel_1348552277', '额外人', '/data/items/2012-09-25/m_50614655e43c9.jpg', '/data/items/2012-09-25/s_50614655e43c9.jpg', '/data/items/2012-09-25/b_50614655e43c9.jpg', 123.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348566115, 1348566115, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (584, 333, 3, 'handel_1348552256', '电风扇', '/data/items/2012-09-25/m_50614640661ef.jpg', '/data/items/2012-09-25/s_50614640661ef.jpg', '/data/items/2012-09-25/b_50614640661ef.jpg', 234.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348565990, 1348565990, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (583, 349, 3, 'handel_1348552233', '(⊙o⊙)…热 ', '/data/items/2012-09-25/m_5061462943928.jpg', '/data/items/2012-09-25/s_5061462943928.jpg', '/data/items/2012-09-25/b_5061462943928.jpg', 543.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348565865, 1348565865, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (582, 352, 3, 'handel_1348552203', '玩儿', '/data/items/2012-09-25/m_5061460bb2ed1.jpg', '/data/items/2012-09-25/s_5061460bb2ed1.jpg', '/data/items/2012-09-25/b_5061460bb2ed1.jpg', 2342.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348565740, 1348565740, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (581, 366, 3, 'handel_1348552184', '大幅度', '/data/items/2012-09-25/m_506145f804462.jpg', '/data/items/2012-09-25/s_506145f804462.jpg', '/data/items/2012-09-25/b_506145f804462.jpg', 2132.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348565615, 1348565615, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (580, 118, 3, 'handel_1348552165', '对方得分', '/data/items/2012-09-25/m_506145e59d95a.jpg', '/data/items/2012-09-25/s_506145e59d95a.jpg', '/data/items/2012-09-25/b_506145e59d95a.jpg', 213.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348565490, 1348565490, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (579, 376, 3, 'handel_1348552142', '丰东股份', '/data/items/2012-09-25/m_506145cecd30c.jpg', '/data/items/2012-09-25/s_506145cecd30c.jpg', '/data/items/2012-09-25/b_506145cecd30c.jpg', 0.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348565365, 1348565365, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (578, 353, 3, 'handel_1348552277', '额外人', '/data/items/2012-09-25/m_50614655e43c9.jpg', '/data/items/2012-09-25/s_50614655e43c9.jpg', '/data/items/2012-09-25/b_50614655e43c9.jpg', 123.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348565240, 1348565240, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (577, 333, 3, 'handel_1348552256', '电风扇', '/data/items/2012-09-25/m_50614640661ef.jpg', '/data/items/2012-09-25/s_50614640661ef.jpg', '/data/items/2012-09-25/b_50614640661ef.jpg', 234.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348565115, 1348565115, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (576, 349, 3, 'handel_1348552233', '(⊙o⊙)…热 ', '/data/items/2012-09-25/m_5061462943928.jpg', '/data/items/2012-09-25/s_5061462943928.jpg', '/data/items/2012-09-25/b_5061462943928.jpg', 543.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348564990, 1348564990, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (575, 352, 3, 'handel_1348552203', '玩儿', '/data/items/2012-09-25/m_5061460bb2ed1.jpg', '/data/items/2012-09-25/s_5061460bb2ed1.jpg', '/data/items/2012-09-25/b_5061460bb2ed1.jpg', 2342.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348564865, 1348564865, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (574, 366, 3, 'handel_1348552184', '大幅度', '/data/items/2012-09-25/m_506145f804462.jpg', '/data/items/2012-09-25/s_506145f804462.jpg', '/data/items/2012-09-25/b_506145f804462.jpg', 2132.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348564740, 1348564740, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (573, 118, 3, 'handel_1348552165', '对方得分', '/data/items/2012-09-25/m_506145e59d95a.jpg', '/data/items/2012-09-25/s_506145e59d95a.jpg', '/data/items/2012-09-25/b_506145e59d95a.jpg', 213.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348564615, 1348564615, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (572, 376, 3, 'handel_1348552142', '丰东股份', '/data/items/2012-09-25/m_506145cecd30c.jpg', '/data/items/2012-09-25/s_506145cecd30c.jpg', '/data/items/2012-09-25/b_506145cecd30c.jpg', 0.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348564490, 1348564490, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (571, 353, 3, 'handel_1348552277', '额外人', '/data/items/2012-09-25/m_50614655e43c9.jpg', '/data/items/2012-09-25/s_50614655e43c9.jpg', '/data/items/2012-09-25/b_50614655e43c9.jpg', 123.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348564365, 1348564365, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (570, 333, 3, 'handel_1348552256', '电风扇', '/data/items/2012-09-25/m_50614640661ef.jpg', '/data/items/2012-09-25/s_50614640661ef.jpg', '/data/items/2012-09-25/b_50614640661ef.jpg', 234.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348564240, 1348564240, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (569, 349, 3, 'handel_1348552233', '(⊙o⊙)…热 ', '/data/items/2012-09-25/m_5061462943928.jpg', '/data/items/2012-09-25/s_5061462943928.jpg', '/data/items/2012-09-25/b_5061462943928.jpg', 543.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348564115, 1348564115, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (568, 352, 3, 'handel_1348552203', '玩儿', '/data/items/2012-09-25/m_5061460bb2ed1.jpg', '/data/items/2012-09-25/s_5061460bb2ed1.jpg', '/data/items/2012-09-25/b_5061460bb2ed1.jpg', 2342.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348563990, 1348563990, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (567, 366, 3, 'handel_1348552184', '大幅度', '/data/items/2012-09-25/m_506145f804462.jpg', '/data/items/2012-09-25/s_506145f804462.jpg', '/data/items/2012-09-25/b_506145f804462.jpg', 2132.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348563865, 1348563865, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (566, 118, 3, 'handel_1348552165', '对方得分', '/data/items/2012-09-25/m_506145e59d95a.jpg', '/data/items/2012-09-25/s_506145e59d95a.jpg', '/data/items/2012-09-25/b_506145e59d95a.jpg', 213.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348563740, 1348563740, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (565, 376, 3, 'handel_1348552142', '丰东股份', '/data/items/2012-09-25/m_506145cecd30c.jpg', '/data/items/2012-09-25/s_506145cecd30c.jpg', '/data/items/2012-09-25/b_506145cecd30c.jpg', 0.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348563615, 1348563615, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (564, 353, 3, 'handel_1348552277', '额外人', '/data/items/2012-09-25/m_50614655e43c9.jpg', '/data/items/2012-09-25/s_50614655e43c9.jpg', '/data/items/2012-09-25/b_50614655e43c9.jpg', 123.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348563490, 1348563490, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (563, 333, 3, 'handel_1348552256', '电风扇', '/data/items/2012-09-25/m_50614640661ef.jpg', '/data/items/2012-09-25/s_50614640661ef.jpg', '/data/items/2012-09-25/b_50614640661ef.jpg', 234.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348563365, 1348563365, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (562, 349, 3, 'handel_1348552233', '(⊙o⊙)…热 ', '/data/items/2012-09-25/m_5061462943928.jpg', '/data/items/2012-09-25/s_5061462943928.jpg', '/data/items/2012-09-25/b_5061462943928.jpg', 543.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348563240, 1348563240, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (561, 352, 3, 'handel_1348552203', '玩儿', '/data/items/2012-09-25/m_5061460bb2ed1.jpg', '/data/items/2012-09-25/s_5061460bb2ed1.jpg', '/data/items/2012-09-25/b_5061460bb2ed1.jpg', 2342.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348563115, 1348563115, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (560, 366, 3, 'handel_1348552184', '大幅度', '/data/items/2012-09-25/m_506145f804462.jpg', '/data/items/2012-09-25/s_506145f804462.jpg', '/data/items/2012-09-25/b_506145f804462.jpg', 2132.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348562990, 1348562990, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (559, 118, 3, 'handel_1348552165', '对方得分', '/data/items/2012-09-25/m_506145e59d95a.jpg', '/data/items/2012-09-25/s_506145e59d95a.jpg', '/data/items/2012-09-25/b_506145e59d95a.jpg', 213.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348562865, 1348562865, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (558, 376, 3, 'handel_1348552142', '丰东股份', '/data/items/2012-09-25/m_506145cecd30c.jpg', '/data/items/2012-09-25/s_506145cecd30c.jpg', '/data/items/2012-09-25/b_506145cecd30c.jpg', 0.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348562740, 1348562740, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (557, 353, 3, 'handel_1348552277', '额外人', '/data/items/2012-09-25/m_50614655e43c9.jpg', '/data/items/2012-09-25/s_50614655e43c9.jpg', '/data/items/2012-09-25/b_50614655e43c9.jpg', 123.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348562615, 1348562615, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (556, 333, 3, 'handel_1348552256', '电风扇', '/data/items/2012-09-25/m_50614640661ef.jpg', '/data/items/2012-09-25/s_50614640661ef.jpg', '/data/items/2012-09-25/b_50614640661ef.jpg', 234.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348562490, 1348562490, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (555, 349, 3, 'handel_1348552233', '(⊙o⊙)…热 ', '/data/items/2012-09-25/m_5061462943928.jpg', '/data/items/2012-09-25/s_5061462943928.jpg', '/data/items/2012-09-25/b_5061462943928.jpg', 543.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348562365, 1348562365, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (554, 352, 3, 'handel_1348552203', '玩儿', '/data/items/2012-09-25/m_5061460bb2ed1.jpg', '/data/items/2012-09-25/s_5061460bb2ed1.jpg', '/data/items/2012-09-25/b_5061460bb2ed1.jpg', 2342.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348562240, 1348562240, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (553, 366, 3, 'handel_1348552184', '大幅度', '/data/items/2012-09-25/m_506145f804462.jpg', '/data/items/2012-09-25/s_506145f804462.jpg', '/data/items/2012-09-25/b_506145f804462.jpg', 2132.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348562115, 1348562115, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (552, 118, 3, 'handel_1348552165', '对方得分', '/data/items/2012-09-25/m_506145e59d95a.jpg', '/data/items/2012-09-25/s_506145e59d95a.jpg', '/data/items/2012-09-25/b_506145e59d95a.jpg', 213.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348561990, 1348561990, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (551, 376, 3, 'handel_1348552142', '丰东股份', '/data/items/2012-09-25/m_506145cecd30c.jpg', '/data/items/2012-09-25/s_506145cecd30c.jpg', '/data/items/2012-09-25/b_506145cecd30c.jpg', 0.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348561865, 1348561865, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (550, 353, 3, 'handel_1348552277', '额外人', '/data/items/2012-09-25/m_50614655e43c9.jpg', '/data/items/2012-09-25/s_50614655e43c9.jpg', '/data/items/2012-09-25/b_50614655e43c9.jpg', 123.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348561740, 1348561740, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (549, 333, 3, 'handel_1348552256', '电风扇', '/data/items/2012-09-25/m_50614640661ef.jpg', '/data/items/2012-09-25/s_50614640661ef.jpg', '/data/items/2012-09-25/b_50614640661ef.jpg', 234.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348561615, 1348561615, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (548, 349, 3, 'handel_1348552233', '(⊙o⊙)…热 ', '/data/items/2012-09-25/m_5061462943928.jpg', '/data/items/2012-09-25/s_5061462943928.jpg', '/data/items/2012-09-25/b_5061462943928.jpg', 543.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348561490, 1348561490, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (547, 352, 3, 'handel_1348552203', '玩儿', '/data/items/2012-09-25/m_5061460bb2ed1.jpg', '/data/items/2012-09-25/s_5061460bb2ed1.jpg', '/data/items/2012-09-25/b_5061460bb2ed1.jpg', 2342.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348561365, 1348561365, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (546, 366, 3, 'handel_1348552184', '大幅度', '/data/items/2012-09-25/m_506145f804462.jpg', '/data/items/2012-09-25/s_506145f804462.jpg', '/data/items/2012-09-25/b_506145f804462.jpg', 2132.00, '', '', 2, 0, 1, 1, 0, 0, NULL, 0, 1, 1348561240, 1350441777, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (545, 118, 3, 'handel_1348552165', '对方得分', '/data/items/2012-09-25/m_506145e59d95a.jpg', '/data/items/2012-09-25/s_506145e59d95a.jpg', '/data/items/2012-09-25/b_506145e59d95a.jpg', 213.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348561115, 1348561115, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (544, 376, 3, 'handel_1348552142', '丰东股份', '/data/items/2012-09-25/m_506145cecd30c.jpg', '/data/items/2012-09-25/s_506145cecd30c.jpg', '/data/items/2012-09-25/b_506145cecd30c.jpg', 0.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348560990, 1348560990, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (543, 353, 3, 'handel_1348552277', '额外人', '/data/items/2012-09-25/m_50614655e43c9.jpg', '/data/items/2012-09-25/s_50614655e43c9.jpg', '/data/items/2012-09-25/b_50614655e43c9.jpg', 123.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348560865, 1348560865, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (542, 333, 3, 'handel_1348552256', '电风扇', '/data/items/2012-09-25/m_50614640661ef.jpg', '/data/items/2012-09-25/s_50614640661ef.jpg', '/data/items/2012-09-25/b_50614640661ef.jpg', 234.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348560740, 1348560740, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (541, 349, 3, 'handel_1348552233', '(⊙o⊙)…热 ', '/data/items/2012-09-25/m_5061462943928.jpg', '/data/items/2012-09-25/s_5061462943928.jpg', '/data/items/2012-09-25/b_5061462943928.jpg', 543.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348560615, 1348560615, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (540, 352, 3, 'handel_1348552203', '玩儿', '/data/items/2012-09-25/m_5061460bb2ed1.jpg', '/data/items/2012-09-25/s_5061460bb2ed1.jpg', '/data/items/2012-09-25/b_5061460bb2ed1.jpg', 2342.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348560490, 1348560490, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (539, 366, 3, 'handel_1348552184', '大幅度', '/data/items/2012-09-25/m_506145f804462.jpg', '/data/items/2012-09-25/s_506145f804462.jpg', '/data/items/2012-09-25/b_506145f804462.jpg', 2132.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348560365, 1348560365, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (538, 118, 3, 'handel_1348552165', '对方得分', '/data/items/2012-09-25/m_506145e59d95a.jpg', '/data/items/2012-09-25/s_506145e59d95a.jpg', '/data/items/2012-09-25/b_506145e59d95a.jpg', 213.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348560240, 1348560240, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (537, 376, 3, 'handel_1348552142', '丰东股份', '/data/items/2012-09-25/m_506145cecd30c.jpg', '/data/items/2012-09-25/s_506145cecd30c.jpg', '/data/items/2012-09-25/b_506145cecd30c.jpg', 0.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348560115, 1348560115, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (536, 353, 3, 'handel_1348552277', '额外人', '/data/items/2012-09-25/m_50614655e43c9.jpg', '/data/items/2012-09-25/s_50614655e43c9.jpg', '/data/items/2012-09-25/b_50614655e43c9.jpg', 123.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348559990, 1348559990, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (535, 333, 3, 'handel_1348552256', '电风扇', '/data/items/2012-09-25/m_50614640661ef.jpg', '/data/items/2012-09-25/s_50614640661ef.jpg', '/data/items/2012-09-25/b_50614640661ef.jpg', 234.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348559865, 1348559865, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (534, 349, 3, 'handel_1348552233', '(⊙o⊙)…热 ', '/data/items/2012-09-25/m_5061462943928.jpg', '/data/items/2012-09-25/s_5061462943928.jpg', '/data/items/2012-09-25/b_5061462943928.jpg', 543.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348559740, 1348559740, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (533, 352, 3, 'handel_1348552203', '玩儿', '/data/items/2012-09-25/m_5061460bb2ed1.jpg', '/data/items/2012-09-25/s_5061460bb2ed1.jpg', '/data/items/2012-09-25/b_5061460bb2ed1.jpg', 2342.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348559615, 1348559615, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (532, 366, 3, 'handel_1348552184', '大幅度', '/data/items/2012-09-25/m_506145f804462.jpg', '/data/items/2012-09-25/s_506145f804462.jpg', '/data/items/2012-09-25/b_506145f804462.jpg', 2132.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348559490, 1348559490, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (531, 118, 3, 'handel_1348552165', '对方得分', '/data/items/2012-09-25/m_506145e59d95a.jpg', '/data/items/2012-09-25/s_506145e59d95a.jpg', '/data/items/2012-09-25/b_506145e59d95a.jpg', 213.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348559365, 1348559365, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (530, 376, 3, 'handel_1348552142', '丰东股份', '/data/items/2012-09-25/m_506145cecd30c.jpg', '/data/items/2012-09-25/s_506145cecd30c.jpg', '/data/items/2012-09-25/b_506145cecd30c.jpg', 0.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348559240, 1348559240, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (529, 353, 3, 'handel_1348552277', '额外人', '/data/items/2012-09-25/m_50614655e43c9.jpg', '/data/items/2012-09-25/s_50614655e43c9.jpg', '/data/items/2012-09-25/b_50614655e43c9.jpg', 123.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348559115, 1348559115, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (528, 333, 3, 'handel_1348552256', '电风扇', '/data/items/2012-09-25/m_50614640661ef.jpg', '/data/items/2012-09-25/s_50614640661ef.jpg', '/data/items/2012-09-25/b_50614640661ef.jpg', 234.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348558990, 1348558990, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (527, 349, 3, 'handel_1348552233', '(⊙o⊙)…热 ', '/data/items/2012-09-25/m_5061462943928.jpg', '/data/items/2012-09-25/s_5061462943928.jpg', '/data/items/2012-09-25/b_5061462943928.jpg', 543.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348558865, 1348558865, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (526, 352, 3, 'handel_1348552203', '玩儿', '/data/items/2012-09-25/m_5061460bb2ed1.jpg', '/data/items/2012-09-25/s_5061460bb2ed1.jpg', '/data/items/2012-09-25/b_5061460bb2ed1.jpg', 2342.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348558740, 1348558740, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (525, 366, 3, 'handel_1348552184', '大幅度', '/data/items/2012-09-25/m_506145f804462.jpg', '/data/items/2012-09-25/s_506145f804462.jpg', '/data/items/2012-09-25/b_506145f804462.jpg', 2132.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348558615, 1348558615, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (524, 118, 3, 'handel_1348552165', '对方得分', '/data/items/2012-09-25/m_506145e59d95a.jpg', '/data/items/2012-09-25/s_506145e59d95a.jpg', '/data/items/2012-09-25/b_506145e59d95a.jpg', 213.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348558490, 1348558490, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (523, 376, 3, 'handel_1348552142', '丰东股份', '/data/items/2012-09-25/m_506145cecd30c.jpg', '/data/items/2012-09-25/s_506145cecd30c.jpg', '/data/items/2012-09-25/b_506145cecd30c.jpg', 0.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348558365, 1348558365, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (522, 353, 3, 'handel_1348552277', '额外人', '/data/items/2012-09-25/m_50614655e43c9.jpg', '/data/items/2012-09-25/s_50614655e43c9.jpg', '/data/items/2012-09-25/b_50614655e43c9.jpg', 123.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348558240, 1348558240, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (521, 333, 3, 'handel_1348552256', '电风扇', '/data/items/2012-09-25/m_50614640661ef.jpg', '/data/items/2012-09-25/s_50614640661ef.jpg', '/data/items/2012-09-25/b_50614640661ef.jpg', 234.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348558115, 1348558115, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (520, 349, 3, 'handel_1348552233', '(⊙o⊙)…热 ', '/data/items/2012-09-25/m_5061462943928.jpg', '/data/items/2012-09-25/s_5061462943928.jpg', '/data/items/2012-09-25/b_5061462943928.jpg', 543.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348557990, 1348557990, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (519, 352, 3, 'handel_1348552203', '玩儿', '/data/items/2012-09-25/m_5061460bb2ed1.jpg', '/data/items/2012-09-25/s_5061460bb2ed1.jpg', '/data/items/2012-09-25/b_5061460bb2ed1.jpg', 2342.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348557865, 1348557865, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (518, 366, 3, 'handel_1348552184', '大幅度', '/data/items/2012-09-25/m_506145f804462.jpg', '/data/items/2012-09-25/s_506145f804462.jpg', '/data/items/2012-09-25/b_506145f804462.jpg', 2132.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348557740, 1348557740, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (517, 118, 3, 'handel_1348552165', '对方得分', '/data/items/2012-09-25/m_506145e59d95a.jpg', '/data/items/2012-09-25/s_506145e59d95a.jpg', '/data/items/2012-09-25/b_506145e59d95a.jpg', 213.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348557615, 1348557615, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (516, 376, 3, 'handel_1348552142', '丰东股份', '/data/items/2012-09-25/m_506145cecd30c.jpg', '/data/items/2012-09-25/s_506145cecd30c.jpg', '/data/items/2012-09-25/b_506145cecd30c.jpg', 0.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348557490, 1348557490, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (515, 353, 3, 'handel_1348552277', '额外人', '/data/items/2012-09-25/m_50614655e43c9.jpg', '/data/items/2012-09-25/s_50614655e43c9.jpg', '/data/items/2012-09-25/b_50614655e43c9.jpg', 123.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348557365, 1348557365, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (514, 333, 3, 'handel_1348552256', '电风扇', '/data/items/2012-09-25/m_50614640661ef.jpg', '/data/items/2012-09-25/s_50614640661ef.jpg', '/data/items/2012-09-25/b_50614640661ef.jpg', 234.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348557240, 1348557240, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (513, 349, 3, 'handel_1348552233', '(⊙o⊙)…热 ', '/data/items/2012-09-25/m_5061462943928.jpg', '/data/items/2012-09-25/s_5061462943928.jpg', '/data/items/2012-09-25/b_5061462943928.jpg', 543.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348557115, 1348557115, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (512, 352, 3, 'handel_1348552203', '玩儿', '/data/items/2012-09-25/m_5061460bb2ed1.jpg', '/data/items/2012-09-25/s_5061460bb2ed1.jpg', '/data/items/2012-09-25/b_5061460bb2ed1.jpg', 2342.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348556990, 1348556990, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (511, 366, 3, 'handel_1348552184', '大幅度', '/data/items/2012-09-25/m_506145f804462.jpg', '/data/items/2012-09-25/s_506145f804462.jpg', '/data/items/2012-09-25/b_506145f804462.jpg', 2132.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348556865, 1348556865, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (632, 349, 3, 'handel_1348552233', '(⊙o⊙)…热 ', '/data/items/2012-09-25/m_5061462943928.jpg', '/data/items/2012-09-25/s_5061462943928.jpg', '/data/items/2012-09-25/b_5061462943928.jpg', 543.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348571990, 1348571990, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (633, 333, 3, 'handel_1348552256', '电风扇', '/data/items/2012-09-25/m_50614640661ef.jpg', '/data/items/2012-09-25/s_50614640661ef.jpg', '/data/items/2012-09-25/b_50614640661ef.jpg', 234.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348572115, 1348572115, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (634, 353, 3, 'handel_1348552277', '额外人', '/data/items/2012-09-25/m_50614655e43c9.jpg', '/data/items/2012-09-25/s_50614655e43c9.jpg', '/data/items/2012-09-25/b_50614655e43c9.jpg', 123.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348572240, 1348572240, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (635, 376, 3, 'handel_1348552142', '丰东股份', '/data/items/2012-09-25/m_506145cecd30c.jpg', '/data/items/2012-09-25/s_506145cecd30c.jpg', '/data/items/2012-09-25/b_506145cecd30c.jpg', 0.00, '', '', 2, 1, 0, 0, 0, 0, NULL, 0, 1, 1348572365, 1348572365, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (636, 118, 3, 'handel_1348552165', '对方得分', '/data/items/2012-09-25/m_506145e59d95a.jpg', '/data/items/2012-09-25/s_506145e59d95a.jpg', '/data/items/2012-09-25/b_506145e59d95a.jpg', 213.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348572490, 1348572490, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (637, 366, 3, 'handel_1348552184', '大幅度', '/data/items/2012-09-25/m_506145f804462.jpg', '/data/items/2012-09-25/s_506145f804462.jpg', '/data/items/2012-09-25/b_506145f804462.jpg', 2132.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348572615, 1348572615, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (638, 352, 3, 'handel_1348552203', '玩儿', '/data/items/2012-09-25/m_5061460bb2ed1.jpg', '/data/items/2012-09-25/s_5061460bb2ed1.jpg', '/data/items/2012-09-25/b_5061460bb2ed1.jpg', 2342.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348572740, 1348572740, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (639, 349, 3, 'handel_1348552233', '(⊙o⊙)…热 ', '/data/items/2012-09-25/m_5061462943928.jpg', '/data/items/2012-09-25/s_5061462943928.jpg', '/data/items/2012-09-25/b_5061462943928.jpg', 543.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348572865, 1348572865, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (640, 333, 3, 'handel_1348552256', '电风扇', '/data/items/2012-09-25/m_50614640661ef.jpg', '/data/items/2012-09-25/s_50614640661ef.jpg', '/data/items/2012-09-25/b_50614640661ef.jpg', 234.00, '', '', 2, 1, 0, 0, 0, 0, NULL, 0, 1, 1348572990, 1348572990, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (641, 353, 3, 'handel_1348552277', '额外人', '/data/items/2012-09-25/m_50614655e43c9.jpg', '/data/items/2012-09-25/s_50614655e43c9.jpg', '/data/items/2012-09-25/b_50614655e43c9.jpg', 123.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348573115, 1348573115, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (642, 376, 3, 'handel_1348552142', '丰东股份', '/data/items/2012-09-25/m_506145cecd30c.jpg', '/data/items/2012-09-25/s_506145cecd30c.jpg', '/data/items/2012-09-25/b_506145cecd30c.jpg', 0.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348573240, 1348573240, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (643, 118, 3, 'handel_1348552165', '对方得分', '/data/items/2012-09-25/m_506145e59d95a.jpg', '/data/items/2012-09-25/s_506145e59d95a.jpg', '/data/items/2012-09-25/b_506145e59d95a.jpg', 213.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348573365, 1348573365, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (644, 366, 3, 'handel_1348552184', '大幅度', '/data/items/2012-09-25/m_506145f804462.jpg', '/data/items/2012-09-25/s_506145f804462.jpg', '/data/items/2012-09-25/b_506145f804462.jpg', 2132.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348573490, 1348573490, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (645, 352, 3, 'handel_1348552203', '玩儿', '/data/items/2012-09-25/m_5061460bb2ed1.jpg', '/data/items/2012-09-25/s_5061460bb2ed1.jpg', '/data/items/2012-09-25/b_5061460bb2ed1.jpg', 2342.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348573615, 1348573615, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (646, 349, 3, 'handel_1348552233', '(⊙o⊙)…热 ', '/data/items/2012-09-25/m_5061462943928.jpg', '/data/items/2012-09-25/s_5061462943928.jpg', '/data/items/2012-09-25/b_5061462943928.jpg', 543.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348573740, 1348573740, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (647, 333, 3, 'handel_1348552256', '电风扇', '/data/items/2012-09-25/m_50614640661ef.jpg', '/data/items/2012-09-25/s_50614640661ef.jpg', '/data/items/2012-09-25/b_50614640661ef.jpg', 234.00, '', '', 2, 1, 0, 0, 0, 0, NULL, 0, 1, 1348573865, 1348573865, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (648, 353, 3, 'handel_1348552277', '额外人', '/data/items/2012-09-25/m_50614655e43c9.jpg', '/data/items/2012-09-25/s_50614655e43c9.jpg', '/data/items/2012-09-25/b_50614655e43c9.jpg', 123.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348573990, 1348573990, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (649, 376, 3, 'handel_1348552142', '丰东股份', '/data/items/2012-09-25/m_506145cecd30c.jpg', '/data/items/2012-09-25/s_506145cecd30c.jpg', '/data/items/2012-09-25/b_506145cecd30c.jpg', 0.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1348574115, 1348574115, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (650, 118, 3, 'handel_1348552165', '对方得分', '/data/items/2012-09-25/m_506145e59d95a.jpg', '/data/items/2012-09-25/s_506145e59d95a.jpg', '/data/items/2012-09-25/b_506145e59d95a.jpg', 213.00, '', '', 2, 2, 1, 1, 0, 0, NULL, 0, 1, 1348574240, 1350028192, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (651, 366, 3, 'handel_1348552184', '大幅度', '/data/items/2012-09-25/m_506145f804462.jpg', '/data/items/2012-09-25/s_506145f804462.jpg', '/data/items/2012-09-25/b_506145f804462.jpg', 2132.00, '', '', 2, 1, 0, 0, 0, 0, NULL, 0, 1, 1348574365, 1348574365, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (652, 352, 3, 'handel_1348552203', '玩儿', '/data/items/2012-09-25/m_5061460bb2ed1.jpg', '/data/items/2012-09-25/s_5061460bb2ed1.jpg', '/data/items/2012-09-25/b_5061460bb2ed1.jpg', 2342.00, '', '', 2, 2, 1, 1, 0, 0, NULL, 0, 1, 1348574490, 1350028184, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (653, 349, 3, 'handel_1348552233', '(⊙o⊙)…热 ', '/data/items/2012-09-25/m_5061462943928.jpg', '/data/items/2012-09-25/s_5061462943928.jpg', '/data/items/2012-09-25/b_5061462943928.jpg', 543.00, '', '', 2, 2, 1, 1, 0, 0, NULL, 0, 1, 1348574615, 1350028183, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (654, 333, 3, 'handel_1348552256', '电风扇', '/data/items/2012-09-25/m_50614640661ef.jpg', '/data/items/2012-09-25/s_50614640661ef.jpg', '/data/items/2012-09-25/b_50614640661ef.jpg', 234.00, '', '', 2, 2, 1, 1, 0, 0, NULL, 0, 1, 1348574740, 1350028174, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (655, 353, 3, 'handel_1348552277', '额外人', '/data/items/2012-09-25/m_50614655e43c9.jpg', '/data/items/2012-09-25/s_50614655e43c9.jpg', '/data/items/2012-09-25/b_50614655e43c9.jpg', 123.00, '', '', 2, 2, 1, 1, 0, 0, NULL, 0, 1, 1348574865, 1350028163, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (656, 206, 3, 'handel_1348902098', '过水电费', '/data/items/2012-09-29/m_50669cd213f9e.jpg', '/data/items/2012-09-29/s_50669cd213f9e.jpg', '/data/items/2012-09-29/b_50669cd213f9e.jpg', 2341.00, '', '', 2, 1, 2, 2, 0, 0, NULL, 0, 1, 1348902098, 1350033832, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (657, 173, 3, 'handel_1348902118', '结婚女', '/data/items/2012-09-29/m_50669ce570dd5.jpg', '/data/items/2012-09-29/s_50669ce570dd5.jpg', '/data/items/2012-09-29/b_50669ce570dd5.jpg', 56.00, '', '', 2, 1, 2, 2, 0, 0, NULL, 0, 1, 1348902117, 1350033826, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (658, 164, 3, 'handel_1348902136', '分问题', '/data/items/2012-09-29/m_50669cf836a38.jpg', '/data/items/2012-09-29/s_50669cf836a38.jpg', '/data/items/2012-09-29/b_50669cf836a38.jpg', 5687.00, '', '', 2, 5, 2, 4, 0, 1, NULL, 0, 1, 1348902136, 1350383295, 0, '', '', 0, '', NULL, 1);
INSERT INTO `pp_items` VALUES (659, 375, 3, 'taobao_19821108546', 'Cityhoney2012复古欧美风双面花边夹层手提单肩包', 'http://img08.taobaocdn.com/bao/uploaded/i8/T1ZcHMXelcXXcVuV3Z_030946.jpg_210x1000.jpg', 'http://img08.taobaocdn.com/bao/uploaded/i8/T1ZcHMXelcXXcVuV3Z_030946.jpg_64x64.jpg', 'http://img08.taobaocdn.com/bao/uploaded/i8/T1ZcHMXelcXXcVuV3Z_030946.jpg', 165.00, 'http://s.click.taobao.com/t?e=zGU34CA7K%2BPkqB07S4%2FK0CITy7klxn%2F7bvn0ay1HonIkA0LOisJWuqZKfIwo5CeD6I81j12%2BgcYsMFGwnGJXmoHsgB2iY0aojs6%2Fyd96%2B7efWHavC%2FaYW%2Fi%2BM4Z5RYl2F50qL%2BuFrv2ccG0zK9Q9k%2FJw1DvYzXgutcTMdB4sADPKxGhFTv18%2F81zhnDp6cUBVk8%3D&sp', '', 1, 4, 1, 1, 0, 1, NULL, 0, 1, 1350291537, 1350291554, 1, NULL, NULL, 0, NULL, '', 1);
INSERT INTO `pp_items` VALUES (661, 396, 3, 'handel_1350460067', '规范个人风格', '/data/items/2012-10-17/m_507e62a2cbf9f.jpg', '/data/items/2012-10-17/s_507e62a2cbf9f.jpg', '/data/items/2012-10-17/b_507e62a2cbf9f.jpg', 67.00, '', '', 2, 0, 0, 0, 0, 0, NULL, 0, 1, 1350460066, 1350460066, 0, '', '', 0, '', NULL, 1);

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_items_cate`
-- 

DROP TABLE IF EXISTS `pp_items_cate`;
CREATE TABLE IF NOT EXISTS `pp_items_cate` (
  `id` smallint(4) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `img` varchar(255) default NULL,
  `pid` smallint(4) NOT NULL default '0',
  `item_nums` int(10) NOT NULL default '0',
  `item_likes` int(11) NOT NULL,
  `collect_time` int(10) NOT NULL COMMENT '最后采集时间',
  `ordid` smallint(4) NOT NULL default '0',
  `tags` varchar(50) NOT NULL,
  `is_hots` tinyint(1) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '1',
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `color` varchar(255) default NULL,
  `seo_desc` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=412 ;

-- 
-- 导出表中的数据 `pp_items_cate`
-- 

INSERT INTO `pp_items_cate` VALUES (1, '衣服', NULL, 0, 0, 993, 0, 0, '', 1, 1, '', '', NULL, '');
INSERT INTO `pp_items_cate` VALUES (2, '鞋子', NULL, 0, 0, 0, 0, 0, '', 0, 1, '', '', NULL, '');
INSERT INTO `pp_items_cate` VALUES (3, '包包', NULL, 0, 0, 0, 0, 0, '', 0, 1, '', '', NULL, '');
INSERT INTO `pp_items_cate` VALUES (4, '配饰', NULL, 0, 0, 0, 0, 0, '', 0, 1, '', '', NULL, '');
INSERT INTO `pp_items_cate` VALUES (5, '美容', NULL, 0, 0, 0, 0, 0, '', 0, 1, '', '', NULL, '');
INSERT INTO `pp_items_cate` VALUES (6, '家居', NULL, 0, 0, 0, 0, 0, '', 0, 1, '', '', NULL, '');
INSERT INTO `pp_items_cate` VALUES (7, '当季热款', NULL, 1, 0, 4044, 0, 0, '', 1, 1, '', '', NULL, '');
INSERT INTO `pp_items_cate` VALUES (8, '当季流行', NULL, 1, 0, 0, 0, 0, '', 0, 1, '', '', NULL, '');
INSERT INTO `pp_items_cate` VALUES (9, '热门风格', NULL, 1, 0, 0, 0, 0, '', 0, 1, '', '', NULL, '');
INSERT INTO `pp_items_cate` VALUES (10, '颜色', NULL, 1, 0, 0, 0, 0, '', 0, 1, '', '', NULL, '');
INSERT INTO `pp_items_cate` VALUES (11, '材质', NULL, 1, 0, 0, 0, 0, '', 0, 1, '', '', NULL, '');
INSERT INTO `pp_items_cate` VALUES (12, '当季热款', NULL, 2, 0, 0, 0, 0, '', 1, 1, '', '', NULL, '');
INSERT INTO `pp_items_cate` VALUES (13, '当季流行', NULL, 2, 0, 0, 0, 0, '', 1, 1, '', '', NULL, '');
INSERT INTO `pp_items_cate` VALUES (14, '热门风格', NULL, 2, 0, 0, 0, 0, '', 1, 1, '', '', NULL, '');
INSERT INTO `pp_items_cate` VALUES (15, '颜色', NULL, 2, 0, 0, 0, 0, '', 1, 1, '', '', NULL, '');
INSERT INTO `pp_items_cate` VALUES (16, '材质', NULL, 2, 0, 0, 0, 0, '', 1, 1, '', '', NULL, '');
INSERT INTO `pp_items_cate` VALUES (17, '当季热款', NULL, 3, 0, 0, 0, 0, '', 1, 1, '', '', NULL, '');
INSERT INTO `pp_items_cate` VALUES (18, '当季热款', NULL, 4, 0, 0, 0, 0, '', 1, 1, '', '', NULL, '');
INSERT INTO `pp_items_cate` VALUES (19, '功效', NULL, 5, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (20, '家', NULL, 6, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (21, '当季流行', NULL, 3, 0, 4044, 0, 0, '', 1, 1, '', '', NULL, '');
INSERT INTO `pp_items_cate` VALUES (22, '当季流行', NULL, 4, 0, 0, 0, 0, '', 1, 1, '', '', NULL, '');
INSERT INTO `pp_items_cate` VALUES (23, '护肤', NULL, 5, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (24, '起居室', NULL, 6, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (326, '耳钉', NULL, 18, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (26, '热门风格', NULL, 4, 0, 0, 0, 0, '', 1, 1, '', '', NULL, '');
INSERT INTO `pp_items_cate` VALUES (27, '彩妆', NULL, 5, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (28, '卧室', NULL, 6, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (325, '手表', NULL, 18, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (30, '元素', NULL, 4, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (31, '美体', NULL, 5, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (32, '厨房', NULL, 6, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (33, '材质', NULL, 3, 0, 0, 0, 0, '', 1, 1, '', '', NULL, '');
INSERT INTO `pp_items_cate` VALUES (324, '项链', NULL, 18, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (35, '热门品牌', NULL, 5, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (36, '卫浴', NULL, 6, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (37, '连衣裙', NULL, 7, 0, 445, 1340871556, 10, '', 1, 1, '', '', '#ee1d24', '');
INSERT INTO `pp_items_cate` VALUES (38, '衬衫', NULL, 7, 0, 10627, 1342845101, 30, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (39, 'T恤', NULL, 7, 0, 756118, 1340876264, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (40, '牛仔裤', NULL, 7, 0, 6, 1341628897, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (41, '开衫', NULL, 7, 0, 0, 1341628933, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (42, '情侣装', NULL, 7, 0, 2, 1341629052, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (43, '短裙', NULL, 7, 0, 101683, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (44, '马甲', NULL, 7, 0, 0, 1342845108, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (45, '蕾丝', NULL, 8, 0, 0, 1342672152, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (46, '豹纹', NULL, 8, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (47, '条纹', NULL, 8, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (48, '欧美', NULL, 9, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (49, '日系', NULL, 9, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (50, '甜美', NULL, 9, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (51, 'OL', NULL, 9, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (52, '民族', NULL, 9, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (53, '白色', NULL, 10, 0, 83054, 1342763175, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (54, '宝蓝', NULL, 10, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (55, '黄色', NULL, 10, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (56, '黑色', NULL, 10, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (57, '奶油色', NULL, 10, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (58, '红色', NULL, 10, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (59, '裸色', NULL, 10, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (60, '牛仔', NULL, 11, 0, 186964, 1342763254, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (61, '针织', NULL, 11, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (62, '纯棉', NULL, 11, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (63, '丝绸', NULL, 11, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (64, '雪纺衫', NULL, 7, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (65, '吊带', NULL, 7, 0, 175763, 1342845322, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (66, '长裙', NULL, 7, 0, 43808, 1342847555, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (67, '小脚裤', NULL, 7, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (68, '打底衫', NULL, 7, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (69, '背心', NULL, 7, 0, 12743, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (70, '连体裤', NULL, 7, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (71, '半身裙', NULL, 7, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (72, '短裤', NULL, 7, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (73, '礼服', NULL, 7, 0, 0, 1340874867, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (74, '牛仔短裤', NULL, 7, 0, 0, 1340875212, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (75, '防晒衣', NULL, 7, 0, 0, 1340875359, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (76, '罩衫', NULL, 7, 0, 25, 1341331712, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (77, '背带裤', NULL, 7, 0, 1, 1341628695, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (78, '背心裙', NULL, 7, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (79, '九分裤', NULL, 7, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (80, '蓬蓬裙', NULL, 7, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (81, '打底裤', NULL, 7, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (82, '哈伦裤', NULL, 7, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (83, '阔腿裤', NULL, 7, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (84, '包臀裙', NULL, 7, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (85, '裙裤', NULL, 7, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (86, '运动裤', NULL, 7, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (87, '高腰裤', NULL, 7, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (88, '雪纺', NULL, 8, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (89, '名媛', NULL, 8, 0, 0, 1342678681, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (90, '娃娃领', NULL, 8, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (91, '露肩', NULL, 8, 0, 0, 1342678670, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (92, '碎花', NULL, 8, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (93, '镂空', NULL, 8, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (94, '蝴蝶结', NULL, 8, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (95, '铆钉', NULL, 8, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (96, '透视', NULL, 8, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (97, '泡泡袖', NULL, 8, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (98, '纯色', NULL, 8, 0, 0, 1340874260, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (99, '波点', NULL, 8, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (100, '几何', NULL, 8, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (101, '印花', NULL, 8, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (102, '撞色', NULL, 8, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (103, '渐变', NULL, 8, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (104, '格子', NULL, 8, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (105, '波普', NULL, 8, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (106, 'Boyfriend', NULL, 8, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (107, 'Oversize', NULL, 8, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (108, '高街', NULL, 9, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (109, '复古', NULL, 9, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (110, '英伦', NULL, 9, 0, 0, 1342863025, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (111, '性感', NULL, 9, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (112, '个性', NULL, 9, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (113, '优雅', NULL, 9, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (114, '薄荷绿', NULL, 10, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (115, '粉色', NULL, 10, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (116, '玫红', NULL, 10, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (117, '绿色', NULL, 10, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (118, '单鞋', NULL, 12, 24, 1, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (119, '人字拖', NULL, 12, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (120, '高跟鞋', NULL, 12, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (121, '平底鞋', NULL, 12, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (122, '鱼嘴鞋', NULL, 12, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (123, '凉鞋', NULL, 12, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (124, '粗跟鞋', NULL, 12, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (125, '细跟鞋', NULL, 12, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (126, '雨鞋', NULL, 12, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (127, '厚底鞋', NULL, 12, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (128, '复古鞋', NULL, 12, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (129, '编织凉鞋', NULL, 12, 0, 1, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (130, '豆豆鞋', NULL, 12, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (131, '系带鞋', NULL, 12, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (132, '休闲鞋', NULL, 12, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (133, '帆布鞋', NULL, 12, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (134, '松糕鞋', NULL, 12, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (135, '坡跟鞋', NULL, 12, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (136, '罗马鞋', NULL, 12, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (137, '运动鞋', NULL, 12, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (138, '系带', NULL, 13, 0, 1, 1340876283, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (139, '坡跟', NULL, 13, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (140, '波点', NULL, 13, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (141, '铆钉', NULL, 13, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (142, '蝴蝶结', NULL, 13, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (143, '粗跟', NULL, 13, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (144, '尖头', NULL, 13, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (145, '防水台', NULL, 13, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (146, '拼接', NULL, 13, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (147, '动物纹', NULL, 13, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (148, '豹纹', NULL, 13, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (149, '流苏', NULL, 13, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (150, '玛丽珍鞋', NULL, 13, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (151, '保暖', NULL, 13, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (152, '方头', NULL, 13, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (153, '厚底', NULL, 13, 0, 1, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (154, '碎花', NULL, 13, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (155, '细跟', NULL, 13, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (156, '条纹', NULL, 13, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (157, '男孩', NULL, 14, 0, 14434, 1342763293, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (158, '复古', NULL, 14, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (159, '英伦', NULL, 14, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (160, '甜美', NULL, 14, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (161, '朋克', NULL, 14, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (162, '性感', NULL, 14, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (163, '欧美', NULL, 14, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (164, '日系', NULL, 14, 1, 4, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (165, '优雅', NULL, 14, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (166, '学院', NULL, 14, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (167, '白的', NULL, 15, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (168, '亮色', NULL, 15, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (169, '裸色', NULL, 15, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (170, '纯色', NULL, 15, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (171, '米色', NULL, 15, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (172, '黑色', NULL, 15, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (173, '宝蓝', NULL, 15, 1, 2, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (174, '红色', NULL, 15, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (175, '金色', NULL, 15, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (176, '玫红', NULL, 15, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (177, '皮革', NULL, 16, 0, 0, 1342678697, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (178, '帆布', NULL, 16, 0, 79300, 1342678878, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (179, '漆皮', NULL, 16, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (180, '亮皮', NULL, 16, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (181, 'PU', NULL, 16, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (182, '牛仔', NULL, 16, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (183, '棉麻', NULL, 16, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (184, '真丝', NULL, 16, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (185, '透明', NULL, 16, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (186, '花园', NULL, 6, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (187, '小物', NULL, 6, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (188, '美白', NULL, 19, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (189, '保湿', NULL, 19, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (190, '祛痘', NULL, 19, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (191, '抗敏', NULL, 19, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (192, '遮瑕', NULL, 19, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (193, '祛斑', NULL, 19, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (194, '控油', NULL, 19, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (195, '补水', NULL, 19, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (196, '去黑头', NULL, 19, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (197, '收毛孔', NULL, 19, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (198, '去眼袋', NULL, 19, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (199, '防晒霜', NULL, 23, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (200, '喷雾', NULL, 23, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (201, '卸妆油', NULL, 23, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (202, '洗面奶', NULL, 23, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (203, '面膜', NULL, 23, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (204, '眼霜', NULL, 23, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (205, '化妆水', NULL, 23, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (206, '面霜', NULL, 23, 1, 2, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (207, '隔离霜', NULL, 23, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (208, '吸油面纸', NULL, 23, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (209, '药妆', NULL, 23, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (210, '香水', NULL, 27, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (211, '指甲油', NULL, 27, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (212, '睫毛膏', NULL, 27, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (213, 'BB霜', NULL, 27, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (214, '粉饼', NULL, 27, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (215, '蜜粉', NULL, 27, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (216, '口红', NULL, 27, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (217, '腮红', NULL, 27, 0, 546, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (218, '眼影', NULL, 27, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (219, '眉笔', NULL, 27, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (220, '唇彩', NULL, 27, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (221, '眼线膏', NULL, 27, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (222, '手工皂', NULL, 31, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (223, '沐浴露', NULL, 31, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (224, '美颈霜', NULL, 31, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (225, '身体乳', NULL, 31, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (226, '护手霜', NULL, 31, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (227, '假发', NULL, 31, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (228, '发蜡', NULL, 31, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (229, '弹力素', NULL, 31, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (230, '发膜', NULL, 31, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (231, '蓬蓬粉', NULL, 31, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (232, '染发膏', NULL, 31, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (233, '倩碧', NULL, 35, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (234, 'kose', NULL, 35, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (235, '雅漾', NULL, 35, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (236, '资生堂', NULL, 35, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (237, 'DHC', NULL, 35, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (238, '丝芙兰', NULL, 35, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (239, 'Benefit', NULL, 35, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (240, '植村秀', NULL, 35, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (241, 'the face shop', NULL, 35, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (242, 'MAC', NULL, 35, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (243, '科颜氏', NULL, 35, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (244, 'OPI', NULL, 35, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (245, '欧舒丹', NULL, 35, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (246, '书柜', NULL, 20, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (247, '烛台', NULL, 20, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (248, '墙贴', NULL, 20, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (249, '摆件', NULL, 20, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (250, '桌布', NULL, 20, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (251, '落地灯', NULL, 20, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (252, '台灯', NULL, 20, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (253, '时钟', NULL, 20, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (254, '吊灯', NULL, 20, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (255, '吸顶灯', NULL, 20, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (256, '杯子', NULL, 20, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (257, '置物架', NULL, 20, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (258, '香薰', NULL, 20, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (259, '地毯', NULL, 20, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (260, '收纳', NULL, 20, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (261, '沙发', NULL, 24, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (262, '茶几', NULL, 24, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (263, '搁板', NULL, 24, 0, 0, 0, 0, '', 1, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (264, '电视柜', NULL, 24, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (265, '椅子', NULL, 24, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (266, '桌子', NULL, 24, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (267, '坐垫', NULL, 24, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (268, '沙发垫', NULL, 24, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (269, '照片墙', NULL, 24, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (270, '相框', NULL, 24, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (271, '靠垫', NULL, 24, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (272, '床上用品', NULL, 28, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (273, '床', NULL, 28, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (274, '床头柜', NULL, 28, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (275, '衣柜', NULL, 28, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (276, '斗柜', NULL, 28, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (277, '窗帘', NULL, 28, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (278, '家居鞋', NULL, 28, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (279, '梳妆', NULL, 28, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (280, '盘碟', NULL, 32, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (281, '水壶', NULL, 32, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (282, '茶具', NULL, 32, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (283, '勺', NULL, 32, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (284, '筷子', NULL, 32, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (285, '饭盒', NULL, 32, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (286, '锅具', NULL, 32, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (287, '烘焙', NULL, 32, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (288, '烹饪', NULL, 32, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (289, '储物罐', NULL, 32, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (290, '调味瓶', NULL, 32, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (291, '餐垫', NULL, 32, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (292, '餐巾', NULL, 32, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (293, '毛巾', NULL, 36, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (294, '浴帘', NULL, 36, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (295, '浴室套件', NULL, 36, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (296, '皂液器', NULL, 36, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (297, '浴室垫', NULL, 36, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (298, '皂盒', NULL, 36, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (299, '衣架', NULL, 36, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (300, '马桶刷', NULL, 36, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (301, '挂钩', NULL, 36, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (302, '花瓶', NULL, 186, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (303, '仿真花', NULL, 186, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (304, '园艺工具', NULL, 186, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (305, '迷你植物', NULL, 186, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (306, '水培', NULL, 186, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (307, '多肉植物', NULL, 186, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (308, '花架', NULL, 186, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (309, '花盆', NULL, 186, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (310, '盆栽', NULL, 186, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (311, '遮阳伞', NULL, 187, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (312, '手机壳', NULL, 187, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (313, '马克杯', NULL, 187, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (314, '加湿器', NULL, 187, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (315, '风扇', NULL, 187, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (316, '首饰盒', NULL, 187, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (317, '抱枕', NULL, 187, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (318, '贴纸', NULL, 187, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (319, '玩偶', NULL, 187, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (320, 'LOMO', NULL, 187, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (321, '文具', NULL, 187, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (322, '本子', NULL, 187, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (323, '钥匙扣', NULL, 187, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (327, '发箍', NULL, 18, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (328, '耳环', NULL, 18, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (329, '手链', NULL, 18, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (330, '钥匙链', NULL, 18, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (331, '细腰带', NULL, 18, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (332, '发圈', NULL, 18, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (333, '墨镜', NULL, 18, 24, 1, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (334, '戒指', NULL, 18, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (335, '胸针', NULL, 18, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (336, '镜框', NULL, 18, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (337, '丝袜', NULL, 18, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (338, '腰带', NULL, 18, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (339, '发带', NULL, 22, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (340, '袜套', NULL, 22, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (341, '军帽', NULL, 22, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (342, '草帽', NULL, 22, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (343, '吊坠', NULL, 22, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (344, '锁骨链', NULL, 22, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (345, '头巾', NULL, 22, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (346, '假领', NULL, 22, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (347, '草编帽', NULL, 22, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (348, '遮阳帽', NULL, 22, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (349, '宽沿帽', NULL, 22, 24, 1, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (350, '怀表', NULL, 22, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (351, '日系', NULL, 26, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (352, '个性', NULL, 26, 24, 1, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (353, '朋克', NULL, 26, 24, 1, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (354, '摇滚', NULL, 26, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (355, '欧美', NULL, 26, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (356, '玉', NULL, 30, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (357, '印花', NULL, 30, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (358, '银饰', NULL, 30, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (359, '镶钻', NULL, 30, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (360, '水晶', NULL, 30, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (361, '蕾丝', NULL, 30, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (362, '羽毛', NULL, 30, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (363, '24k金', NULL, 30, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (364, '花朵', NULL, 30, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (365, '玫瑰金', NULL, 30, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (366, '编织包', NULL, 17, 24, 1, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (367, '钱包', NULL, 17, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (368, '方扣包', NULL, 17, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (369, '斜挎包', NULL, 17, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (370, '化妆包', NULL, 17, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (371, '果冻包', NULL, 17, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (372, '单肩包', NULL, 17, 0, 0, 1340871525, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (373, '双肩包', NULL, 17, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (374, '手拿包', NULL, 17, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (375, '手提包', NULL, 17, 1, 1, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (376, '复古包', NULL, 17, 24, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (377, '零钱包', NULL, 17, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (378, '帆布包 ', NULL, 17, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (379, '水桶包', NULL, 17, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (380, '链条包', NULL, 17, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (381, '晚宴包', NULL, 17, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (382, '环保袋', NULL, 17, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (383, '行李箱', NULL, 17, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (384, '机车包', NULL, 17, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (385, '流苏', NULL, 21, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (386, '撞色', NULL, 21, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (387, '外贸', NULL, 21, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (388, '环保', NULL, 21, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (389, '拼接', NULL, 21, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (390, '豹纹', NULL, 21, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (391, '链条', NULL, 21, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (392, '蝴蝶结', NULL, 21, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (393, '铆钉', NULL, 21, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (394, '水钻', NULL, 21, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (395, '复古', NULL, 21, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (396, '菱形格', NULL, 21, 1, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (397, '代购', NULL, 21, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (398, '几何', NULL, 21, 0, 54, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (399, '甜美', NULL, 21, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (400, '动物纹', NULL, 21, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (401, '帆布', NULL, 33, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (402, 'PU', NULL, 33, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (403, '羊皮', NULL, 33, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (404, '牛仔', NULL, 33, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (405, '漆皮', NULL, 33, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (406, '仿皮', NULL, 33, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (407, '牛皮', NULL, 33, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (408, '棉麻', NULL, 33, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (409, '肌理', NULL, 33, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (410, '亮皮', NULL, 33, 0, 0, 0, 0, '', 0, 1, '', '', '', '');
INSERT INTO `pp_items_cate` VALUES (411, '皮革', NULL, 33, 0, 0, 0, 0, '', 0, 1, '', '', '', '');

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_items_likes`
-- 

DROP TABLE IF EXISTS `pp_items_likes`;
CREATE TABLE IF NOT EXISTS `pp_items_likes` (
  `id` int(10) NOT NULL auto_increment,
  `items_id` int(10) NOT NULL default '0',
  `uid` int(10) NOT NULL default '0',
  `add_time` int(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

-- 
-- 导出表中的数据 `pp_items_likes`
-- 

INSERT INTO `pp_items_likes` VALUES (1, 656, 1, 1350027647);
INSERT INTO `pp_items_likes` VALUES (2, 655, 1, 1350028163);
INSERT INTO `pp_items_likes` VALUES (3, 657, 1, 1350028166);
INSERT INTO `pp_items_likes` VALUES (4, 654, 1, 1350028174);
INSERT INTO `pp_items_likes` VALUES (5, 653, 1, 1350028183);
INSERT INTO `pp_items_likes` VALUES (6, 652, 1, 1350028184);
INSERT INTO `pp_items_likes` VALUES (7, 650, 1, 1350028192);
INSERT INTO `pp_items_likes` VALUES (8, 658, 36, 1350033815);
INSERT INTO `pp_items_likes` VALUES (9, 657, 36, 1350033826);
INSERT INTO `pp_items_likes` VALUES (10, 656, 36, 1350033832);
INSERT INTO `pp_items_likes` VALUES (11, 658, 1, 1350268859);
INSERT INTO `pp_items_likes` VALUES (12, 659, 1, 1350291554);
INSERT INTO `pp_items_likes` VALUES (13, 658, 37, 1350375148);
INSERT INTO `pp_items_likes` VALUES (14, 658, 42, 1350383295);
INSERT INTO `pp_items_likes` VALUES (15, 546, 1, 1350441777);

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_items_pics`
-- 

DROP TABLE IF EXISTS `pp_items_pics`;
CREATE TABLE IF NOT EXISTS `pp_items_pics` (
  `id` int(10) NOT NULL auto_increment,
  `item_id` int(10) NOT NULL,
  `url` varchar(255) NOT NULL,
  `add_time` int(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `pp_items_pics`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `pp_items_site`
-- 

DROP TABLE IF EXISTS `pp_items_site`;
CREATE TABLE IF NOT EXISTS `pp_items_site` (
  `id` smallint(4) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `site_domain` varchar(255) NOT NULL,
  `site_logo` varchar(255) NOT NULL,
  `collect_url` varchar(255) NOT NULL,
  `collect_time` int(10) NOT NULL default '0',
  `item_nums` int(10) NOT NULL default '0',
  `type` tinyint(1) NOT NULL default '0',
  `is_dels` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- 导出表中的数据 `pp_items_site`
-- 

INSERT INTO `pp_items_site` VALUES (1, '淘宝', 'taobao', 'http://item.taobao.com,http://item.tmall.com', 'taobao.jpg', '', 0, 0, 1, 1);
INSERT INTO `pp_items_site` VALUES (2, 'PinPHP', 'handel', 'http://www.pinphp.com', 'pinphp.jpg', '', 0, 0, 0, 1);

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_items_tags`
-- 

DROP TABLE IF EXISTS `pp_items_tags`;
CREATE TABLE IF NOT EXISTS `pp_items_tags` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `item_nums` int(11) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '1',
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

-- 
-- 导出表中的数据 `pp_items_tags`
-- 

INSERT INTO `pp_items_tags` VALUES (1, '水电费', 0, 1, '', '', '');
INSERT INTO `pp_items_tags` VALUES (2, '结婚', 0, 1, '', '', '');
INSERT INTO `pp_items_tags` VALUES (3, '问题', 0, 1, '', '', '');
INSERT INTO `pp_items_tags` VALUES (4, '夹层', 0, 1, '', '', '');
INSERT INTO `pp_items_tags` VALUES (5, '手提', 0, 1, '', '', '');
INSERT INTO `pp_items_tags` VALUES (6, '单肩包', 0, 1, '', '', '');
INSERT INTO `pp_items_tags` VALUES (7, 'Cityhoney2012', 0, 1, '', '', '');
INSERT INTO `pp_items_tags` VALUES (8, '复古', 0, 1, '', '', '');
INSERT INTO `pp_items_tags` VALUES (9, '双面', 0, 1, '', '', '');
INSERT INTO `pp_items_tags` VALUES (10, '花边', 0, 1, '', '', '');
INSERT INTO `pp_items_tags` VALUES (11, '欧美', 0, 1, '', '', '');
INSERT INTO `pp_items_tags` VALUES (12, '如法', 0, 1, '', '', '');
INSERT INTO `pp_items_tags` VALUES (13, '奉公', 0, 1, '', '', '');
INSERT INTO `pp_items_tags` VALUES (14, '工人', 0, 1, '', '', '');
INSERT INTO `pp_items_tags` VALUES (15, '身份', 0, 1, '', '', '');
INSERT INTO `pp_items_tags` VALUES (16, '风格', 0, 1, '', '', '');
INSERT INTO `pp_items_tags` VALUES (17, '规范', 0, 1, '', '', '');
INSERT INTO `pp_items_tags` VALUES (18, '个人', 0, 1, '', '', '');

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_items_tags_item`
-- 

DROP TABLE IF EXISTS `pp_items_tags_item`;
CREATE TABLE IF NOT EXISTS `pp_items_tags_item` (
  `item_id` int(10) NOT NULL,
  `tag_id` int(10) NOT NULL,
  KEY `item_id` (`item_id`),
  KEY `tag_id` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `pp_items_tags_item`
-- 

INSERT INTO `pp_items_tags_item` VALUES (656, 1);
INSERT INTO `pp_items_tags_item` VALUES (657, 2);
INSERT INTO `pp_items_tags_item` VALUES (658, 3);
INSERT INTO `pp_items_tags_item` VALUES (659, 4);
INSERT INTO `pp_items_tags_item` VALUES (659, 5);
INSERT INTO `pp_items_tags_item` VALUES (659, 6);
INSERT INTO `pp_items_tags_item` VALUES (659, 7);
INSERT INTO `pp_items_tags_item` VALUES (659, 8);
INSERT INTO `pp_items_tags_item` VALUES (659, 9);
INSERT INTO `pp_items_tags_item` VALUES (659, 10);
INSERT INTO `pp_items_tags_item` VALUES (659, 11);
INSERT INTO `pp_items_tags_item` VALUES (660, 12);
INSERT INTO `pp_items_tags_item` VALUES (660, 13);
INSERT INTO `pp_items_tags_item` VALUES (660, 14);
INSERT INTO `pp_items_tags_item` VALUES (660, 15);
INSERT INTO `pp_items_tags_item` VALUES (661, 16);
INSERT INTO `pp_items_tags_item` VALUES (661, 17);
INSERT INTO `pp_items_tags_item` VALUES (661, 18);

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_nav`
-- 

DROP TABLE IF EXISTS `pp_nav`;
CREATE TABLE IF NOT EXISTS `pp_nav` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `sort_order` smallint(4) NOT NULL,
  `system` tinyint(1) NOT NULL default '0' COMMENT '1-系统 0-自定义',
  `type` tinyint(1) NOT NULL default '1' COMMENT '导航位置1-顶部 2-底部',
  `in_site` tinyint(1) NOT NULL COMMENT '1-本站内 0-站外',
  `is_show` tinyint(1) NOT NULL default '1',
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` text NOT NULL,
  `seo_desc` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- 
-- 导出表中的数据 `pp_nav`
-- 

INSERT INTO `pp_nav` VALUES (1, '逛宝贝', 'cate', '/index.php?m=search', 1, 1, 1, 1, 1, '发现喜欢', '发现喜欢', '发现喜欢');
INSERT INTO `pp_nav` VALUES (2, '专辑', 'yifu', '/index.php?m=album&a=index', 2, 1, 1, 1, 1, '专辑', '专辑', '专辑');
INSERT INTO `pp_nav` VALUES (3, '衣服', 'xiezi', '/index.php?m=cate&a=index&cid=1', 3, 0, 1, 1, 1, '衣服', '衣服', '衣服');
INSERT INTO `pp_nav` VALUES (4, '鞋子', 'baobao', '/index.php?m=cate&a=index&cid=2', 4, 0, 1, 1, 1, '鞋子', '鞋子', '鞋子');
INSERT INTO `pp_nav` VALUES (5, '配饰', 'peishi', '/index.php?m=cate&a=index&cid=4', 5, 0, 1, 1, 1, '欧美街', '欧美街', '欧美街');
INSERT INTO `pp_nav` VALUES (6, '美容', 'meirong', '/index.php?m=cate&a=index&cid=5', 6, 0, 1, 1, 1, '美容', '美容', '美容');
INSERT INTO `pp_nav` VALUES (7, '家居', 'jiaju', '/index.php?m=cate&a=index&cid=6', 7, 0, 2, 1, 1, '淘家居', '淘家居', '淘家居');
INSERT INTO `pp_nav` VALUES (10, '包包', 'peishi', '/index.php?m=cate&a=index&cid=3', 5, 0, 1, 1, 1, '欧美街', '欧美街', '欧美街');

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_node`
-- 

DROP TABLE IF EXISTS `pp_node`;
CREATE TABLE IF NOT EXISTS `pp_node` (
  `id` smallint(6) unsigned NOT NULL auto_increment,
  `module` varchar(255) NOT NULL,
  `module_name` varchar(50) NOT NULL,
  `action` varchar(255) NOT NULL,
  `action_name` varchar(50) default NULL,
  `data` varchar(255) default NULL,
  `status` tinyint(1) default '0',
  `remark` varchar(255) default NULL,
  `sort` smallint(6) unsigned NOT NULL default '0',
  `auth_type` tinyint(1) NOT NULL default '0',
  `group_id` tinyint(3) unsigned default '0',
  `often` tinyint(1) NOT NULL default '0' COMMENT '0-不常用 1-常用',
  `is_show` tinyint(1) NOT NULL default '0' COMMENT '0-不常用 1-常用',
  PRIMARY KEY  (`id`),
  KEY `status` (`status`),
  KEY `name` (`module`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=212 ;

-- 
-- 导出表中的数据 `pp_node`
-- 

INSERT INTO `pp_node` VALUES (1, 'node', '菜单管理', '', '', '', 1, '', 0, 0, 1, 0, 0);
INSERT INTO `pp_node` VALUES (2, 'node', '菜单管理', 'index', '菜单列表', '', 1, '', 0, 1, 1, 0, 0);
INSERT INTO `pp_node` VALUES (3, 'node', '菜单管理', 'add', '添加菜单', '', 1, '', 0, 2, 1, 0, 0);
INSERT INTO `pp_node` VALUES (4, 'node', '菜单管理', 'edit', '编辑菜单', '', 1, '', 0, 2, 1, 0, 0);
INSERT INTO `pp_node` VALUES (5, 'node', '菜单管理', 'delete', '删除菜单', '', 1, '', 0, 2, 1, 0, 0);
INSERT INTO `pp_node` VALUES (6, 'role', '角色管理', '', '', '', 1, '', 370, 0, 1, 0, 0);
INSERT INTO `pp_node` VALUES (7, 'role', '角色管理', 'index', '角色管理', '', 1, '', 0, 1, 1, 0, 0);
INSERT INTO `pp_node` VALUES (8, 'role', '角色管理', 'add', '添加角色', '', 1, '', 0, 2, 1, 0, 0);
INSERT INTO `pp_node` VALUES (9, 'role', '角色管理', 'edit', '编辑角色', '', 1, '', 0, 2, 1, 0, 0);
INSERT INTO `pp_node` VALUES (10, 'role', '角色管理', 'delete', '删除角色', '', 1, '', 0, 2, 1, 0, 0);
INSERT INTO `pp_node` VALUES (11, 'role', '角色管理', 'auth', '角色授权', '', 1, '', 0, 2, 1, 0, 0);
INSERT INTO `pp_node` VALUES (12, 'admin', '管理员管理', '', '', '', 1, '', 380, 0, 1, 0, 0);
INSERT INTO `pp_node` VALUES (13, 'admin', '管理员管理', 'index', '管理员列表', '', 1, '', 0, 1, 1, 0, 0);
INSERT INTO `pp_node` VALUES (14, 'admin', '管理员管理', 'add', '添加管理员', '', 1, '', 0, 2, 1, 0, 0);
INSERT INTO `pp_node` VALUES (15, 'admin', '管理员管理', 'edit', '编辑管理员', '', 1, '', 0, 2, 1, 0, 0);
INSERT INTO `pp_node` VALUES (16, 'admin', '管理员管理', 'delete', '删除管理员', '', 1, '', 0, 2, 1, 0, 0);
INSERT INTO `pp_node` VALUES (50, 'setting', '网站设置', '', '', '', 1, '', 399, 0, 1, 0, 0);
INSERT INTO `pp_node` VALUES (51, 'setting', '网站设置', 'index', '网站设置', '', 1, '', 0, 1, 1, 0, 0);
INSERT INTO `pp_node` VALUES (99, 'flink', '友情链接', '', '', '', 1, '', 98, 0, 4, 0, 0);
INSERT INTO `pp_node` VALUES (100, 'flink', '友情链接', 'index', '友情链接列表', '', 1, '', 0, 1, 4, 0, 0);
INSERT INTO `pp_node` VALUES (101, 'article', '资讯管理', '', '', '', 1, '', 100, 0, 4, 0, 0);
INSERT INTO `pp_node` VALUES (102, 'article', '资讯管理', 'index', '资讯列表', '', 1, '', 0, 1, 4, 0, 0);
INSERT INTO `pp_node` VALUES (103, 'article', '资讯管理', 'add', '添加资讯', '', 1, '', 0, 1, 4, 0, 0);
INSERT INTO `pp_node` VALUES (104, 'article_cate', '资讯分类', '', '', '', 1, '', 99, 0, 4, 0, 0);
INSERT INTO `pp_node` VALUES (105, 'article', '资讯管理', 'edit', '编辑资讯', '', 1, '', 0, 2, 4, 0, 0);
INSERT INTO `pp_node` VALUES (106, 'article', '资讯管理', 'delete', '删除资讯', '', 1, '', 0, 2, 4, 0, 0);
INSERT INTO `pp_node` VALUES (107, 'article_cate', '资讯分类', 'index', '分类列表', '', 1, '', 0, 1, 4, 0, 0);
INSERT INTO `pp_node` VALUES (108, 'article_cate', '资讯分类', 'add', '添加分类', '', 1, '', 0, 2, 4, 0, 0);
INSERT INTO `pp_node` VALUES (109, 'article_cate', '资讯分类', 'edit', '编辑分类', '', 1, '', 0, 2, 4, 0, 0);
INSERT INTO `pp_node` VALUES (110, 'article_cate', '资讯分类', 'delete', '删除分类', '', 1, '', 0, 2, 4, 0, 0);
INSERT INTO `pp_node` VALUES (115, 'items', '商品管理', '', '', '', 1, '', 0, 0, 6, 0, 0);
INSERT INTO `pp_node` VALUES (116, 'items', '商品管理', 'index', '商品列表', '', 1, NULL, 0, 1, 6, 0, 0);
INSERT INTO `pp_node` VALUES (117, 'items_cate', '商品分类', '', NULL, '', 1, NULL, 0, 0, 6, 0, 0);
INSERT INTO `pp_node` VALUES (118, 'items_cate', '商品分类', 'index', '商品分类', '', 1, NULL, 0, 1, 6, 0, 0);
INSERT INTO `pp_node` VALUES (134, 'items_tags', '标签管理', 'index', '标签列表', '', 1, '', 0, 1, 6, 0, 0);
INSERT INTO `pp_node` VALUES (121, 'nav', '导航管理', '', '', '', 1, '', 2, 0, 4, 0, 0);
INSERT INTO `pp_node` VALUES (122, 'nav', '导航管理', 'index', '导航列表', '', 1, '', 0, 1, 4, 0, 0);
INSERT INTO `pp_node` VALUES (123, 'nav', '导航管理', 'add', '添加导航', '', 1, '', 0, 2, 4, 0, 0);
INSERT INTO `pp_node` VALUES (124, 'nav', '导航管理', 'edit', '编辑导航', '', 1, '', 0, 2, 4, 0, 0);
INSERT INTO `pp_node` VALUES (125, 'nav', '导航管理', 'delete', '删除导航', '', 1, '', 0, 2, 4, 0, 0);
INSERT INTO `pp_node` VALUES (133, 'items_tags', '标签管理', '', '', '', 1, '', 0, 0, 6, 0, 0);
INSERT INTO `pp_node` VALUES (132, 'items_cate', '商品管理', 'add', '添加分类', '', 1, '', 0, 1, 6, 0, 0);
INSERT INTO `pp_node` VALUES (131, 'items', '商品管理', 'add', '添加商品', '5', 1, '', 0, 1, 6, 0, 0);
INSERT INTO `pp_node` VALUES (135, 'items_collect', '商品采集', '', '', '', 1, '', 0, 0, 6, 0, 0);
INSERT INTO `pp_node` VALUES (136, 'items_collect', '商品采集', 'index', '商品采集', '', 0, '', 0, 1, 6, 0, 0);
INSERT INTO `pp_node` VALUES (137, 'items_collect', '商品采集', 'taobaoapi', '淘宝客设置', '', 1, '', 0, 1, 6, 0, 0);
INSERT INTO `pp_node` VALUES (139, 'adboard', '广告位置', '', '', '', 1, '', 70, 0, 4, 0, 0);
INSERT INTO `pp_node` VALUES (140, 'adboard', '广告位置', 'index', '广告位置', '', 1, '', 0, 1, 4, 0, 0);
INSERT INTO `pp_node` VALUES (141, 'ad', '广告管理', '', '', '', 1, '', 90, 0, 4, 0, 0);
INSERT INTO `pp_node` VALUES (142, 'ad', '广告管理', 'index', '广告列表', '', 1, '', 0, 1, 4, 0, 0);
INSERT INTO `pp_node` VALUES (143, 'template', '模板管理', '', '', '', 1, '', 0, 0, 1, 0, 0);
INSERT INTO `pp_node` VALUES (144, 'template', '模板管理', 'index', '模板管理', '', 1, '', 0, 1, 1, 0, 0);
INSERT INTO `pp_node` VALUES (145, 'items', '商品管理', 'batch_add', '批量添加', '', 1, '', 0, 1, 6, 0, 0);
INSERT INTO `pp_node` VALUES (146, 'focus', '焦点图管理', 'index', '焦点图列表', '', 1, '', 0, 1, 4, 0, 0);
INSERT INTO `pp_node` VALUES (147, 'focus', '焦点图管理', 'add', '添加焦点图', '', 1, '', 0, 1, 4, 0, 0);
INSERT INTO `pp_node` VALUES (148, 'flink', '友情链接', 'add', '添加友情链接', '', 1, '', 0, 2, 4, 0, 0);
INSERT INTO `pp_node` VALUES (149, 'flink', '友情链接', 'edit', '编辑友情链接', '', 1, '', 0, 2, 4, 0, 0);
INSERT INTO `pp_node` VALUES (150, 'flink', '友情链接', 'del', '删除友情链接', '', 1, '', 0, 2, 4, 0, 0);
INSERT INTO `pp_node` VALUES (151, 'ad', '广告管理', 'add', '添加广告', '', 1, '', 0, 2, 4, 0, 0);
INSERT INTO `pp_node` VALUES (152, 'ad', '广告管理', 'edit', '编辑广告', '', 1, '', 0, 2, 4, 0, 0);
INSERT INTO `pp_node` VALUES (153, 'ad', '广告管理', 'delete', '删除广告', '', 1, '', 0, 2, 4, 0, 0);
INSERT INTO `pp_node` VALUES (154, 'adboard', '广告位置', 'add', '添加广告位置', '', 1, '', 0, 2, 4, 0, 0);
INSERT INTO `pp_node` VALUES (155, 'adboard', '广告位置', 'edit', '编辑广告位置', '', 1, '', 0, 2, 4, 0, 0);
INSERT INTO `pp_node` VALUES (156, 'adboard', '广告位置', 'delete', '删除广告位置', '', 1, '', 0, 2, 4, 0, 0);
INSERT INTO `pp_node` VALUES (157, 'focus', '焦点图管理', '', '', '', 1, '', 101, 0, 4, 0, 0);
INSERT INTO `pp_node` VALUES (158, 'focus', '焦点图管理', 'edit', '编辑焦点图', '', 1, '', 0, 2, 4, 0, 0);
INSERT INTO `pp_node` VALUES (159, 'focus', '焦点图管理', 'delete', '删除焦点图', '', 1, '', 0, 2, 4, 0, 0);
INSERT INTO `pp_node` VALUES (160, 'items', '商品管理', 'edit', '编辑商品', '', 1, NULL, 0, 2, 6, 0, 0);
INSERT INTO `pp_node` VALUES (161, 'items', '商品管理', 'delete', '删除商品', '', 1, '', 0, 2, 6, 0, 0);
INSERT INTO `pp_node` VALUES (162, 'items_cate', '商品管理', 'edit', '编辑分类', '', 1, '', 0, 2, 6, 0, 0);
INSERT INTO `pp_node` VALUES (163, 'items_cate', '商品管理', 'delete', '删除分类', '', 1, '', 0, 2, 6, 0, 0);
INSERT INTO `pp_node` VALUES (164, 'items_tags', '标签管理', 'add', '添加标签', '', 1, '', 0, 2, 1, 0, 0);
INSERT INTO `pp_node` VALUES (165, 'items_tags', '标签管理', 'edit', '编辑标签', '', 1, '', 0, 2, 1, 0, 0);
INSERT INTO `pp_node` VALUES (166, 'items_tags', '标签管理', 'delete', '删除标签', '', 1, '', 0, 2, 1, 0, 0);
INSERT INTO `pp_node` VALUES (167, 'items_tags_cate', '关联标签管理', ' ', '', '', 1, '', 0, 0, 6, 0, 1);
INSERT INTO `pp_node` VALUES (168, 'items_tags_cate', '关联标签管理', 'index', '关联标签列表', '', 1, '', 0, 1, 6, 0, 1);
INSERT INTO `pp_node` VALUES (169, 'items_tags_cate', '关联标签管理', 'add', '添加关联标签', '', 1, '', 0, 1, 6, 0, 1);
INSERT INTO `pp_node` VALUES (181, 'items_tags', '标签管理', 'index', '标签列表', '', 1, '', 0, 2, 1, 0, 0);
INSERT INTO `pp_node` VALUES (171, 'items_tags_cate', '关联标签管理', 'del', '删除关联标签', '', 1, '', 0, 2, 6, 0, 1);
INSERT INTO `pp_node` VALUES (172, 'items_collect', '商品采集管理', 'edit', '编辑采集设置', '', 1, '', 0, 2, 6, 0, 0);
INSERT INTO `pp_node` VALUES (173, 'items_collect', '商品采集管理', 'collect', '采集详情列表', '', 1, '', 0, 2, 6, 0, 0);
INSERT INTO `pp_node` VALUES (174, 'items_collect', '商品采集管理', 'taobao_collect', '采集', '', 1, '', 0, 2, 6, 0, 0);
INSERT INTO `pp_node` VALUES (177, 'cache', '缓存管理', ' ', '', '', 1, '', 0, 0, 1, 0, 1);
INSERT INTO `pp_node` VALUES (178, 'cache', '缓存管理', 'index', '缓存管理', '', 1, '', 0, 2, 1, 0, 1);
INSERT INTO `pp_node` VALUES (179, 'items_collect', '商品采集管理', 'add', '添加来源', '', 1, '', 0, 1, 6, 0, 1);
INSERT INTO `pp_node` VALUES (180, 'items_collect', '商品采集管理', 'delete', '删除来源', '', 1, '', 0, 1, 6, 0, 1);
INSERT INTO `pp_node` VALUES (182, 'shop', '商城管理', '', '', '', 1, '', 399, 0, 7, 0, 0);
INSERT INTO `pp_node` VALUES (183, 'shop', '商城管理', 'index', '商城列表', '', 1, '', 0, 1, 7, 0, 0);
INSERT INTO `pp_node` VALUES (184, 'shop', '商城管理', 'add', '添加商城', '', 1, '', 0, 1, 7, 0, 0);
INSERT INTO `pp_node` VALUES (185, 'shop', '商城管理', 'edit', '编辑商城', '', 1, '', 0, 1, 7, 0, 1);
INSERT INTO `pp_node` VALUES (186, 'shop', '商城管理', 'delete', '删除商城', '', 1, '', 0, 1, 7, 0, 1);
INSERT INTO `pp_node` VALUES (187, 'shop_cate', '商城类别', '', '', '', 1, '', 399, 0, 7, 0, 0);
INSERT INTO `pp_node` VALUES (188, 'shop_cate', '商城类别', 'index', '类别列表', '', 1, '', 0, 1, 7, 0, 0);
INSERT INTO `pp_node` VALUES (189, 'shop_cate', '商城类别', 'add', '添加类别', '', 1, '', 0, 1, 7, 0, 0);
INSERT INTO `pp_node` VALUES (190, 'shop_cate', '商城类别', 'edit', '编辑类别', '', 1, '', 0, 1, 7, 0, 1);
INSERT INTO `pp_node` VALUES (191, 'shop_cate', '商城类别', 'delete', '删除类别', '', 1, '', 0, 1, 7, 0, 1);
INSERT INTO `pp_node` VALUES (192, 'user', '会员管理', '', '', '', 1, '', 399, 0, 8, 0, 0);
INSERT INTO `pp_node` VALUES (193, 'user', '会员管理', 'index', '会员列表', '', 1, '', 0, 1, 8, 0, 0);
INSERT INTO `pp_node` VALUES (194, 'user', '会员管理', 'delete', '删除', '', 1, '', 0, 1, 8, 0, 1);
INSERT INTO `pp_node` VALUES (195, 'items', '商品管理', 'comments', '评论管理', '', 1, '', 0, 1, 6, 0, 0);
INSERT INTO `pp_node` VALUES (196, 'items', '商品管理', 'collect_by_words', '关键词采集', '', 1, '', 0, 1, 6, 0, 0);
INSERT INTO `pp_node` VALUES (197, 'setting', '网站设置', 'index', '第三方登录', 'type=oauth', 1, '', 0, 1, 1, 0, 0);
INSERT INTO `pp_node` VALUES (198, 'setting', '网站设置', 'index', '优化设置', 'type=seo', 1, '', 0, 1, 1, 0, 0);
INSERT INTO `pp_node` VALUES (199, 'setting', '网站设置', 'index', '关注我们', 'type=guanzhu', 1, '', 0, 1, 1, 0, 0);
INSERT INTO `pp_node` VALUES (200, 'album', '专辑管理', '', '', '', 1, '', 399, 0, 8, 0, 0);
INSERT INTO `pp_node` VALUES (201, 'album', '专辑管理', 'index', '专辑列表', '', 1, '', 0, 1, 8, 0, 0);
INSERT INTO `pp_node` VALUES (202, 'album', '专辑管理', 'edit', '编辑专辑', '', 1, '', 0, 2, 8, 0, 0);
INSERT INTO `pp_node` VALUES (203, 'album', '专辑管理', 'delete', '删除专辑', '', 1, '', 0, 2, 8, 0, 0);
INSERT INTO `pp_node` VALUES (204, 'album_cate', '专辑分类管理', 'index', '分类列表', '', 1, '', 0, 1, 8, 0, 0);
INSERT INTO `pp_node` VALUES (205, 'album_cate', '专辑分类管理', 'add', '添加分类', '', 1, '', 0, 1, 8, 0, 0);
INSERT INTO `pp_node` VALUES (206, 'album_cate', '专辑分类管理', 'edit', '编辑分类', '', 1, '', 0, 2, 8, 0, 0);
INSERT INTO `pp_node` VALUES (207, 'album_cate', '专辑分类管理', 'delete', '删除分类', '', 1, '', 0, 2, 8, 0, 0);
INSERT INTO `pp_node` VALUES (208, 'database', '数据库管理', '', '', '', 1, '', 0, 0, 1, 0, 0);
INSERT INTO `pp_node` VALUES (209, 'database', '数据库管理', 'execute', '执行', '', 1, '', 0, 1, 1, 0, 0);
INSERT INTO `pp_node` VALUES (210, 'items', '商品管理', 'delete_search', '一键删除', '', 1, '', 0, 0, 6, 0, 0);
INSERT INTO `pp_node` VALUES (211, 'items_collect', '商品采集', 'collect', '淘宝客采集', 'code=taobao', 1, '', 0, 1, 6, 0, 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_role`
-- 

DROP TABLE IF EXISTS `pp_role`;
CREATE TABLE IF NOT EXISTS `pp_role` (
  `id` smallint(6) unsigned NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `status` tinyint(1) unsigned default NULL,
  `remark` varchar(255) default NULL,
  `create_time` int(11) unsigned NOT NULL,
  `update_time` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- 导出表中的数据 `pp_role`
-- 

INSERT INTO `pp_role` VALUES (1, '管理员', 1, '管理员', 1208784792, 1254325558);
INSERT INTO `pp_role` VALUES (2, '编辑', 1, '编辑', 1208784792, 1254325558);

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_setting`
-- 

DROP TABLE IF EXISTS `pp_setting`;
CREATE TABLE IF NOT EXISTS `pp_setting` (
  `name` varchar(100) NOT NULL,
  `data` text NOT NULL,
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出表中的数据 `pp_setting`
-- 

INSERT INTO `pp_setting` VALUES ('site_name', 'SHX');
INSERT INTO `pp_setting` VALUES ('site_title', 'SHX');
INSERT INTO `pp_setting` VALUES ('site_keyword', 'SHX');
INSERT INTO `pp_setting` VALUES ('site_description', 'SHX');
INSERT INTO `pp_setting` VALUES ('site_status', '1');
INSERT INTO `pp_setting` VALUES ('site_icp', '浙ICP备88888888号');
INSERT INTO `pp_setting` VALUES ('statistics_code', '                                                                                                                                    ');
INSERT INTO `pp_setting` VALUES ('closed_reason', '网站正在维护中......');
INSERT INTO `pp_setting` VALUES ('site_domain', 'http://www.huhongfei.com');
INSERT INTO `pp_setting` VALUES ('taobao_usernick', '蝎子网');
INSERT INTO `pp_setting` VALUES ('taobao_pid', '16185888');
INSERT INTO `pp_setting` VALUES ('taobao_appkey', '12504724');
INSERT INTO `pp_setting` VALUES ('taobao_appsecret', '9d6877190386092d4288dcae32811081');
INSERT INTO `pp_setting` VALUES ('weibo_url', '');
INSERT INTO `pp_setting` VALUES ('qqweibo_url', '');
INSERT INTO `pp_setting` VALUES ('renren_url', '');
INSERT INTO `pp_setting` VALUES ('163_url', '');
INSERT INTO `pp_setting` VALUES ('qqzone_url', '');
INSERT INTO `pp_setting` VALUES ('douban_url', '');
INSERT INTO `pp_setting` VALUES ('default_kw', '懒得逛了，我搜～');
INSERT INTO `pp_setting` VALUES ('template', 'default');
INSERT INTO `pp_setting` VALUES ('taobao_app_key', '12504724');
INSERT INTO `pp_setting` VALUES ('qq_app_key', '801254034');
INSERT INTO `pp_setting` VALUES ('qq_app_Secret', 'ae039fa521291642bcf81b166a0635f8');
INSERT INTO `pp_setting` VALUES ('sina_app_key', '1845762250');
INSERT INTO `pp_setting` VALUES ('sina_app_Secret', 'cee01b709262b72cdb80deb3c2e381ab');
INSERT INTO `pp_setting` VALUES ('taobao_app_secret', '9d6877190386092d4288dcae32811081');
INSERT INTO `pp_setting` VALUES ('url_model', '1');
INSERT INTO `pp_setting` VALUES ('waterfall_sp', '200');
INSERT INTO `pp_setting` VALUES ('waterfall_items_num', '25');
INSERT INTO `pp_setting` VALUES ('client_hash', '');
INSERT INTO `pp_setting` VALUES ('search_words', '         欧美,复古,日系,古典                                                            ');
INSERT INTO `pp_setting` VALUES ('index_pins', '1');
INSERT INTO `pp_setting` VALUES ('index_album', '0');
INSERT INTO `pp_setting` VALUES ('index_items', '2');
INSERT INTO `pp_setting` VALUES ('likes_status', '1');
INSERT INTO `pp_setting` VALUES ('likes_status', '1');

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_user`
-- 

DROP TABLE IF EXISTS `pp_user`;
CREATE TABLE IF NOT EXISTS `pp_user` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL default '0',
  `passwd` varchar(50) NOT NULL default '0',
  `img` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL default '@',
  `phone` bigint(11) unsigned NOT NULL default '0',
  `sex` tinyint(4) NOT NULL default '0',
  `brithday` date NOT NULL,
  `address` varchar(50) NOT NULL,
  `province` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `area` varchar(20) NOT NULL,
  `blog` varchar(200) NOT NULL,
  `info` varchar(500) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `add_time` int(11) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '1',
  `last_time` int(11) NOT NULL default '0',
  `last_ip` varchar(15) default '0',
  `share_num` int(11) default '0',
  `like_num` int(11) default '0',
  `follow_num` int(10) default '0',
  `fans_num` int(10) default '0',
  `album_num` int(10) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

-- 
-- 导出表中的数据 `pp_user`
-- 

INSERT INTO `pp_user` VALUES (1, 'huhongfei', '5ef424347acab1ed291a4503563d79e0', '/data/user/2012-10-11/m_50768cfe27141.jpg', 'erer@ere.cc', 15072412569, 1, '0000-00-00', '', '北京市', '市辖区', '朝阳区', '', '法国恢复到公司的', '127.0.0.1', 1349945992, 1, 1350465388, '127.0.0.1', 0, 10, 0, 0, 1);
INSERT INTO `pp_user` VALUES (2, 'dfdfddf', 'd25f5c06d44b9b5d0aee477ebeaa9c08', '', 'dsad@ds.cn', 15072412566, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1349947896, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (3, 'sdfdsfdf', '5ef424347acab1ed291a4503563d79e0', '', 'erer@ere.cn', 15072412556, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1349948229, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (4, 'dfdfdfd', '5ef424347acab1ed291a4503563d79e0', '', 'erer@ere.cf', 0, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1349949079, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (5, 'dfgfggffg', '5ef424347acab1ed291a4503563d79e0', '', 'dsad@ds.cl', 15072412567, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1349950609, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (6, 'ffefef', '5ef424347acab1ed291a4503563d79e0', '', 'dff@dgfgg.ee', 15236956523, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1349952695, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (7, 'dsfdsfdsf', '5ef424347acab1ed291a4503563d79e0', '', 'dsgrfg@grf.vn', 15245625845, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1349963533, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (8, 'fddffdf', '5ef424347acab1ed291a4503563d79e0', '', 'dgfdfg@rtht.fg', 15245625632, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1349963640, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (9, 'dasdfas', '7a12a47984333222320df4510947fbdd', '', 'qwq@wq.qw', 15072412561, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350008714, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (10, 'gfhfj564', '5ef424347acab1ed291a4503563d79e0', '', 'dfedf@dg.cn', 15025653562, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350010063, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (11, 'dfdgdr899', '5ef424347acab1ed291a4503563d79e0', '', 'fgfg@dff.cn', 15325623562, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350012922, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (12, 'dfd565', '5ef424347acab1ed291a4503563d79e0', '', 'dfgds@dfdf.cn', 15236523652, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350014684, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (13, '46544err', '5ef424347acab1ed291a4503563d79e0', '', 'fgfdg@grf.rfgfrg', 15235625865, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350018607, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (14, 'dsfd85484', '5ef424347acab1ed291a4503563d79e0', '', 'dfdf@55.fdg', 15025623569, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350018724, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (15, 'hyjuyhj5656', '5ef424347acab1ed291a4503563d79e0', '', 'regrg@g.gf', 15025652358, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350018907, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (16, 'grfgrg656', '5ef424347acab1ed291a4503563d79e0', '', 'dfdsdf@fdfdsf.com', 15072412560, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350019241, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (17, 'dsljds56512', '5ef424347acab1ed291a4503563d79e0', '', 'sdfsd@ergreg.cm', 15235625369, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350019588, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (18, 'dfgdgrfgkljh', '5ef424347acab1ed291a4503563d79e0', '', 'dfgg@ddr.vg', 15025658956, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350020072, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (19, 'dfhth4567', '5ef424347acab1ed291a4503563d79e0', '', 'fdghfh@gfdg.fgf', 15072412589, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350020148, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (20, 'rghtrfht', '5ef424347acab1ed291a4503563d79e0', '', 'rhgtrhgt@grfg.gh', 15245658965, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350020211, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (21, 'fgfdgf6554', '5ef424347acab1ed291a4503563d79e0', '', 'dgfdg@ferg6.gj', 15065956258, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350020269, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (22, 'dfdsfd255', '5ef424347acab1ed291a4503563d79e0', '', 'dfd@fgd.cd', 15052365698, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350021549, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (23, 'dfdsfdfd5654', '5ef424347acab1ed291a4503563d79e0', '', 'dfd@fgd6.gd', 15245125452, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350021594, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (24, 'gfgfggf4524', '5ef424347acab1ed291a4503563d79e0', '', 'rfgrfgrfg@dfds.fdg', 15072415896, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350022377, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (25, 'dfdfd2', '5ef424347acab1ed291a4503563d79e0', '', 'fdff@fdf.goj', 15072415689, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350023879, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (26, 'rerewrere5', '5ef424347acab1ed291a4503563d79e0', '', 'dfdsfd@efedf.gg', 15245658652, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350024018, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (27, 'fdfdfd54564', '5ef424347acab1ed291a4503563d79e0', '', 'dsgfds@efef.cvf', 15045125458, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350024233, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (28, 'dfdsfdfbn', '5ef424347acab1ed291a4503563d79e0', '', 'ddsf@rg.gf', 15025635879, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350024391, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (29, 'ewfdef', '5ef424347acab1ed291a4503563d79e0', '', 'dfgds@dsgdf.gh', 15265895623, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350024727, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (30, 'sadfsf4646', '5ef424347acab1ed291a4503563d79e0', '', 'gfreg@464.hjkj', 15325452698, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350024968, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (31, 'dfdfdfdf5', '5ef424347acab1ed291a4503563d79e0', '', 'fgdgf@fgfd.fh', 15025635698, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350030896, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (32, 'dfdffdf8454', '5ef424347acab1ed291a4503563d79e0', '', 'dgg@fbgdgf.fgf', 15236595685, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350031097, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (33, 'dfd545jymj', '5ef424347acab1ed291a4503563d79e0', '', 'dggg@gf.gg', 15212456235, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350031440, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (34, 'ghgthgf', '5ef424347acab1ed291a4503563d79e0', '', 'fgfdg@fdf.dfgd', 15856235623, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350031602, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (35, 'fdfdfdf455', '5ef424347acab1ed291a4503563d79e0', '', 'dffad@dgfdg.dff', 15025652365, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350032013, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (36, 'dfdsf6546', '5ef424347acab1ed291a4503563d79e0', '', 'fdf@dfd.g4r6', 15072416598, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350032066, 1, 0, '0', 0, 3, 0, 0, 0);
INSERT INTO `pp_user` VALUES (37, '6591217', '5ef424347acab1ed291a4503563d79e0', '', 'coffe6591217@yahoo.cn', 15072412564, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350271652, 1, 1350445257, '127.0.0.1', 0, 1, 0, 0, 0);
INSERT INTO `pp_user` VALUES (38, 'gfdgfgfd', '5ef424347acab1ed291a4503563d79e0', '', 'fdgfd@grg.gf', 15254856954, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350273092, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (39, 'retrtrtr', '5ef424347acab1ed291a4503563d79e0', '', 'dsfgdf@yhty.feih', 15245856253, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350273233, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (40, 'dfddffd', '5ef424347acab1ed291a4503563d79e0', '', 'dfgfh@ghtgj.gf', 15325632568, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350273556, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (41, 'trhujtyj454', '5ef424347acab1ed291a4503563d79e0', '', 'fdgf@fgre.vn', 15235657845, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350273600, 1, 0, '0', 0, 0, 0, 0, 0);
INSERT INTO `pp_user` VALUES (42, '汤逊湖边乱飞', '0', 'http://tp4.sinaimg.cn/1673695635/50/1284133371/1', '@', 0, 0, '0000-00-00', '', '', '', '', '', '', '127.0.0.1', 1350381538, 1, 1350383288, '127.0.0.1', 0, 1, 0, 0, 0);

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_user_comments`
-- 

DROP TABLE IF EXISTS `pp_user_comments`;
CREATE TABLE IF NOT EXISTS `pp_user_comments` (
  `id` int(10) NOT NULL auto_increment,
  `uid` int(10) NOT NULL default '0',
  `pid` int(10) NOT NULL default '0',
  `info` text,
  `type` varchar(20) default NULL,
  `orig` varchar(10) NOT NULL,
  `status` tinyint(4) NOT NULL default '1',
  `add_time` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- 导出表中的数据 `pp_user_comments`
-- 

INSERT INTO `pp_user_comments` VALUES (1, 1, 659, '不错的包包,哦', 'item', 'index', 1, 1350291737);
INSERT INTO `pp_user_comments` VALUES (2, 37, 658, 'edfedgegfrgrgrgrf', 'item', 'index', 1, 1350375160);

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_user_follow`
-- 

DROP TABLE IF EXISTS `pp_user_follow`;
CREATE TABLE IF NOT EXISTS `pp_user_follow` (
  `id` int(10) NOT NULL auto_increment,
  `fans_id` int(10) NOT NULL default '0',
  `uid` int(10) NOT NULL default '0',
  `add_time` int(10) NOT NULL default '0',
  `status` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- 导出表中的数据 `pp_user_follow`
-- 


-- --------------------------------------------------------

-- 
-- 表的结构 `pp_user_history`
-- 

DROP TABLE IF EXISTS `pp_user_history`;
CREATE TABLE IF NOT EXISTS `pp_user_history` (
  `id` int(10) NOT NULL auto_increment,
  `uid` int(10) NOT NULL default '0',
  `add_time` int(10) NOT NULL default '0',
  `info` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

-- 
-- 导出表中的数据 `pp_user_history`
-- 

INSERT INTO `pp_user_history` VALUES (1, 1, 1350027647, '喜欢了一个宝贝~<br/><a href=''http://www.mailuo.com/SHX/PinPHP?a=index&m=item&id=656'' target=''_blank''><img src=''/data/items/2012-09-29/m_50669cd213f9e.jpg''/></a>');
INSERT INTO `pp_user_history` VALUES (2, 1, 1350028163, '喜欢了一个宝贝~<br/><a href=''http://www.mailuo.com/SHX/PinPHP?a=index&m=item&id=655'' target=''_blank''><img src=''/data/items/2012-09-25/m_50614655e43c9.jpg''/></a>');
INSERT INTO `pp_user_history` VALUES (3, 1, 1350028166, '喜欢了一个宝贝~<br/><a href=''http://www.mailuo.com/SHX/PinPHP?a=index&m=item&id=657'' target=''_blank''><img src=''/data/items/2012-09-29/m_50669ce570dd5.jpg''/></a>');
INSERT INTO `pp_user_history` VALUES (4, 1, 1350028174, '喜欢了一个宝贝~<br/><a href=''http://www.mailuo.com/SHX/PinPHP?a=index&m=item&id=654'' target=''_blank''><img src=''/data/items/2012-09-25/m_50614640661ef.jpg''/></a>');
INSERT INTO `pp_user_history` VALUES (5, 1, 1350028183, '喜欢了一个宝贝~<br/><a href=''http://www.mailuo.com/SHX/PinPHP?a=index&m=item&id=653'' target=''_blank''><img src=''/data/items/2012-09-25/m_5061462943928.jpg''/></a>');
INSERT INTO `pp_user_history` VALUES (6, 1, 1350028184, '喜欢了一个宝贝~<br/><a href=''http://www.mailuo.com/SHX/PinPHP?a=index&m=item&id=652'' target=''_blank''><img src=''/data/items/2012-09-25/m_5061460bb2ed1.jpg''/></a>');
INSERT INTO `pp_user_history` VALUES (7, 1, 1350028192, '喜欢了一个宝贝~<br/><a href=''http://www.mailuo.com/SHX/PinPHP?a=index&m=item&id=650'' target=''_blank''><img src=''/data/items/2012-09-25/m_506145e59d95a.jpg''/></a>');
INSERT INTO `pp_user_history` VALUES (8, 36, 1350033815, '喜欢了一个宝贝~<br/><a href=''http://www.mailuo.com/SHX/PinPHP?a=index&m=item&id=658'' target=''_blank''><img src=''/data/items/2012-09-29/m_50669cf836a38.jpg''/></a>');
INSERT INTO `pp_user_history` VALUES (9, 36, 1350033826, '喜欢了一个宝贝~<br/><a href=''http://www.mailuo.com/SHX/PinPHP?a=index&m=item&id=657'' target=''_blank''><img src=''/data/items/2012-09-29/m_50669ce570dd5.jpg''/></a>');
INSERT INTO `pp_user_history` VALUES (10, 36, 1350033832, '喜欢了一个宝贝~<br/><a href=''http://www.mailuo.com/SHX/PinPHP?a=index&m=item&id=656'' target=''_blank''><img src=''/data/items/2012-09-29/m_50669cd213f9e.jpg''/></a>');
INSERT INTO `pp_user_history` VALUES (11, 1, 1350268859, '喜欢了一个宝贝~<br/><a href=''http://localhost/SHX/PinPHP?a=index&m=item&id=658'' target=''_blank''><img src=''/data/items/2012-09-29/m_50669cf836a38.jpg''/></a>');
INSERT INTO `pp_user_history` VALUES (12, 1, 1350291537, '分享了了一个宝贝~<br/><a href=''http://www.huhongfei.com/SHX/PinPHP?a=index&m=item&id=659'' target=''_blank''><img src=''http://img08.taobaocdn.com/bao/uploaded/i8/T1ZcHMXelcXXcVuV3Z_030946.jpg_210x1000.jpg''/></a>');
INSERT INTO `pp_user_history` VALUES (13, 1, 1350291554, '喜欢了一个宝贝~<br/><a href=''http://www.huhongfei.com/SHX/PinPHP?a=index&m=item&id=659'' target=''_blank''><img src=''http://img08.taobaocdn.com/bao/uploaded/i8/T1ZcHMXelcXXcVuV3Z_030946.jpg_210x1000.jpg''/></a>');
INSERT INTO `pp_user_history` VALUES (14, 1, 1350291737, '不错的包包,哦');
INSERT INTO `pp_user_history` VALUES (15, 37, 1350375148, '喜欢了一个宝贝~<br/><a href=''http://localhost/SHX/PinPHP/item/index/id/658'' target=''_blank''><img src=''/data/items/2012-09-29/m_50669cf836a38.jpg''/></a>');
INSERT INTO `pp_user_history` VALUES (16, 37, 1350375160, 'edfedgegfrgrgrgrf');
INSERT INTO `pp_user_history` VALUES (17, 42, 1350383295, '喜欢了一个宝贝~<br/><a href=''http://www.huhongfei.com/SHX/PinPHP/item/index/id/658'' target=''_blank''><img src=''/data/items/2012-09-29/m_50669cf836a38.jpg''/></a>');
INSERT INTO `pp_user_history` VALUES (18, 1, 1350441777, '喜欢了一个宝贝~<br/><a href=''http://www.mailuo.com/SHX/PinPHP/item/index/id/546'' target=''_blank''><img src=''/data/items/2012-09-25/m_506145f804462.jpg''/></a>');

-- --------------------------------------------------------

-- 
-- 表的结构 `pp_user_openid`
-- 

DROP TABLE IF EXISTS `pp_user_openid`;
CREATE TABLE IF NOT EXISTS `pp_user_openid` (
  `id` int(10) NOT NULL auto_increment,
  `type` varchar(50) NOT NULL default '0',
  `uid` int(11) NOT NULL default '0',
  `openid` varchar(50) NOT NULL default '0',
  `info` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- 导出表中的数据 `pp_user_openid`
-- 

INSERT INTO `pp_user_openid` VALUES (1, 'sina', 42, '1673695635', 'a:1:{s:9:"user_info";a:33:{s:2:"id";i:1673695635;s:5:"idstr";s:10:"1673695635";s:11:"screen_name";s:18:"汤逊湖边乱飞";s:4:"name";s:18:"汤逊湖边乱飞";s:8:"province";s:2:"11";s:4:"city";s:2:"14";s:8:"location";s:16:"北京 昌平区";s:11:"description";s:0:"";s:3:"url";s:33:"http://t.sina.com.cn/i/1673695635";s:17:"profile_image_url";s:48:"http://tp4.sinaimg.cn/1673695635/50/1284133371/1";s:11:"profile_url";s:13:"huhongfei1987";s:6:"domain";s:13:"huhongfei1987";s:6:"weihao";s:0:"";s:6:"gender";s:1:"m";s:15:"followers_count";i:61;s:13:"friends_count";i:278;s:14:"statuses_count";i:40;s:16:"favourites_count";i:1;s:10:"created_at";s:30:"Fri Sep 10 23:40:38 +0800 2010";s:9:"following";b:0;s:17:"allow_all_act_msg";b:0;s:11:"geo_enabled";b:1;s:8:"verified";b:0;s:13:"verified_type";i:-1;s:6:"remark";s:0:"";s:6:"status";a:17:{s:10:"created_at";s:30:"Tue Oct 16 14:15:14 +0800 2012";s:2:"id";d:3501760041377588;s:3:"mid";s:16:"3501760041377588";s:5:"idstr";s:16:"3501760041377588";s:4:"text";s:302:"【瀑布流masonry结合infinitescroll翻页问题处理】 用infinitescroll下来翻页时，内部切割url的方法有bug，有时切割不正确，导致瀑布流下拉翻页无响应或重复，这个问题可以用pathParse属性解决（jsp页面中的js代码如... http://t.cn/zlHaGgt  @mark";s:6:"source";s:75:"<a href="http://open.weibo.com/sharebutton" rel="nofollow">分享按钮</a>";s:9:"favorited";b:0;s:9:"truncated";b:0;s:21:"in_reply_to_status_id";s:0:"";s:19:"in_reply_to_user_id";s:0:"";s:23:"in_reply_to_screen_name";s:0:"";s:3:"geo";N;s:13:"reposts_count";i:0;s:14:"comments_count";i:0;s:15:"attitudes_count";i:0;s:6:"mlevel";i:0;s:7:"visible";a:2:{s:4:"type";i:0;s:7:"list_id";i:0;}}s:17:"allow_all_comment";b:1;s:12:"avatar_large";s:49:"http://tp4.sinaimg.cn/1673695635/180/1284133371/1";s:15:"verified_reason";s:0:"";s:9:"follow_me";b:0;s:13:"online_status";i:1;s:18:"bi_followers_count";i:44;s:4:"lang";s:5:"zh-cn";}}');
-- 
-- 数据库: `test`
-- 
CREATE DATABASE `test` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `test`;
