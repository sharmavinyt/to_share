CREATE TABLE `user_activity_details_xml` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL DEFAULT '',
  `login_id` bigint(20) DEFAULT NULL,
  `uploaded_zip_file` varchar(200) NOT NULL DEFAULT '',
  `wav_files` varchar(200) NOT NULL DEFAULT '',
  `org_csv_file` varchar(200) NOT NULL DEFAULT '',
  `success_csv_file` varchar(200) NOT NULL DEFAULT '',
  `fail_csv_file` varchar(200) NOT NULL DEFAULT '',
  `org_count` int(11) NOT NULL DEFAULT '-1',
  `success_count` int(11) NOT NULL DEFAULT '-1',
  `fail_count` int(11) NOT NULL DEFAULT '-1',
  `validation` int(11) NOT NULL DEFAULT '0',
  `addparams` text,
  `activity_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activity` varchar(100) NOT NULL DEFAULT '',
  `suspend_base` tinyint(1) DEFAULT '0',
  `suspend_datetime` datetime DEFAULT '0000-00-00 00:00:00',
  `dbname` varchar(100) DEFAULT '',
  `tblname` varchar(100) DEFAULT '',
  `email_flag` tinyint(4) NOT NULL DEFAULT '0',
  `base_status` varchar(50) NOT NULL DEFAULT 'RUNNING',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB;
CREATE TABLE `tbl_obd_config` (
  `auto_id` bigint(14) NOT NULL AUTO_INCREMENT,
  `servlet_id` bigint(20) NOT NULL,
  `dbname` varchar(30) NOT NULL DEFAULT '',
  `update_table` varchar(30) NOT NULL DEFAULT 'no2dial',
  `insert_table` varchar(30) NOT NULL DEFAULT 'outlog',
  `insert_parameters` varchar(255) NOT NULL DEFAULT '',
  `update_parameters` varchar(255) NOT NULL DEFAULT '',
  `no_of_obdretry` varchar(10) NOT NULL DEFAULT '3',
  `Obd_Retry_Time` varchar(20) NOT NULL DEFAULT '60',
  `add_parameters` varchar(255) NOT NULL DEFAULT 'No Parameters',
  `misFrom` varchar(30) NOT NULL DEFAULT 'start_time',
  `is_req` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1-fail log updater req/0-not req',
  `filePath` varchar(100) NOT NULL DEFAULT '' COMMENT 'path of the fail log file ',
  `map_value` varchar(50) NOT NULL DEFAULT '' COMMENT 'string to be searched in the fail logs',
  `where_clause` varchar(50) NOT NULL DEFAULT '' COMMENT 'clause in no2dial',
  `destination` varchar(100) NOT NULL DEFAULT '' COMMENT 'destination where the fail log file goes after processing',
  `folder_format` varchar(50) NOT NULL DEFAULT '' COMMENT 'folder format of the fail log file',
  PRIMARY KEY (`auto_id`),
  UNIQUE KEY `servlet_id` (`servlet_id`)
) ENGINE=InnoDB;
CREATE TABLE `tbl_dnd_file_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-Not process,1-processing,2-success',
  `max_try` tinyint(4) NOT NULL DEFAULT '0',
  `db_name` varchar(255) NOT NULL DEFAULT '',
  `main_table` varchar(255) NOT NULL DEFAULT '',
  `tmp_table` varchar(255) NOT NULL DEFAULT 'no2dial_dnd',
  `not_id_dnd` bigint(20) NOT NULL DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `org_count` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM;
CREATE TABLE `login_details_failed` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `login_try_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `failure_reason` varchar(250) NOT NULL DEFAULT '',
  `c_date` date DEFAULT '0000-00-00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
CREATE TABLE `login_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `client_ip` varchar(20) NOT NULL DEFAULT '',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logout_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(20) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `dashboard_login_reset_pwd` (
  `user_name` varchar(100) DEFAULT '',
  `update_time` datetime DEFAULT '0000-00-00 00:00:00',
  `client_ip` varchar(50) DEFAULT ''
) ENGINE=InnoDB;
CREATE TABLE `dashboard_login_otp_req` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT '',
  `mobile_no` bigint(20) DEFAULT '0',
  `email_id` varchar(150) DEFAULT '',
  `otp` varchar(10) DEFAULT '',
  `send_time` datetime DEFAULT '0000-00-00 00:00:00',
  `used_time` datetime DEFAULT '0000-00-00 00:00:00',
  `used` tinyint(4) DEFAULT '0',
  `client_ip` varchar(50) DEFAULT '',
  `c_date` date DEFAULT '0000-00-00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;
CREATE TABLE `dashboard_login_master` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tp_user` varchar(50) NOT NULL DEFAULT '',
  `tp_password` varchar(50) NOT NULL DEFAULT '',
  `system_xml` varchar(50) NOT NULL DEFAULT '',
  `appen_query` text,
  `isActive` tinyint(1) DEFAULT '1',
  `added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expire_date` datetime DEFAULT '0000-00-00 00:00:00',
  `email_id` text,
  `cc` text,
  `bcc` text,
  `mobile_no` bigint(20) DEFAULT '0',
  `token` varchar(100) DEFAULT '',
  `token_time` datetime DEFAULT '0000-00-00 00:00:00',
  `token_used` tinyint(4) DEFAULT '0',
  `token_used_time` datetime DEFAULT '0000-00-00 00:00:00',
  `otp_enable` tinyint(4) DEFAULT '0',
  `otp_request_id` bigint(20) DEFAULT '0',
  `otp` int(11) DEFAULT '0',
  `otp_sendtime` datetime DEFAULT '0000-00-00 00:00:00',
  `otp_used` tinyint(4) DEFAULT '0',
  `otp_used_time` datetime DEFAULT '0000-00-00 00:00:00',
  `otp_resend` tinyint(4) DEFAULT '0',
  `reset_pwd_flag` tinyint(4) DEFAULT '0',
  `reset_pwd_time` datetime DEFAULT '0000-00-00 00:00:00',
  `lang` varchar(20) NOT NULL DEFAULT '',
  `param1` varchar(100) NOT NULL DEFAULT '',
  `param2` varchar(50) NOT NULL DEFAULT '',
  `param3` varchar(50) NOT NULL DEFAULT '',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `push_flag` tinyint(2) NOT NULL DEFAULT '0',
  `whitelisted_ip` varchar(300) DEFAULT '' COMMENT ', seperated list of ip from which you want to access this login',
  `pass_backup` varchar(50) DEFAULT '',
  `client_ip` varchar(20) DEFAULT '',
  PRIMARY KEY (`id`,`tp_user`)
) ENGINE=InnoDB;
CREATE TABLE `dashboard_login_forgot_pwd` (
  `user_name` varchar(50) DEFAULT '',
  `mobile_no` bigint(20) DEFAULT '0',
  `email_id` varchar(150) DEFAULT '',
  `token` varchar(100) DEFAULT '',
  `send_time` datetime DEFAULT '0000-00-00 00:00:00',
  `use_time` datetime DEFAULT '0000-00-00 00:00:00',
  `client_ip` varchar(50) DEFAULT ''
) ENGINE=InnoDB;
CREATE TABLE `dashboard_base_distributor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dashboard_id` varchar(50) NOT NULL DEFAULT '',
  `server_ip` varchar(40) DEFAULT '000.000.000.000',
  `server_id` int(11) NOT NULL DEFAULT '0',
  `total_ports` int(11) DEFAULT '0',
  `isactive` tinyint(1) DEFAULT '1',
  `attribute` varchar(50) DEFAULT 'server_ip',
  `added_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_datetime` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`dashboard_id`,`server_id`),
  KEY `id` (`id`)
) ENGINE=InnoDB;