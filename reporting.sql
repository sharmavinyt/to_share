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
  `suspend_datetime` datetime DEFAULT null,
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
  `update_time` datetime NOT NULL,
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
  `logout_time` datetime NOT NULL,
  `ip` varchar(20) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `dashboard_login_reset_pwd` (
  `user_name` varchar(100) DEFAULT '',
  `update_time` datetime DEFAULT null,
  `client_ip` varchar(50) DEFAULT ''
) ENGINE=InnoDB;
CREATE TABLE `dashboard_login_otp_req` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT '',
  `mobile_no` bigint(20) DEFAULT '0',
  `email_id` varchar(150) DEFAULT '',
  `otp` varchar(10) DEFAULT '',
  `send_time` datetime DEFAULT null,
  `used_time` datetime DEFAULT null,
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
  `expire_date` datetime DEFAULT null,
  `email_id` text,
  `cc` text,
  `bcc` text,
  `mobile_no` bigint(20) DEFAULT '0',
  `token` varchar(100) DEFAULT '',
  `token_time` datetime DEFAULT null,
  `token_used` tinyint(4) DEFAULT '0',
  `token_used_time` datetime DEFAULT null,
  `otp_enable` tinyint(4) DEFAULT '0',
  `otp_request_id` bigint(20) DEFAULT '0',
  `otp` int(11) DEFAULT '0',
  `otp_sendtime` datetime DEFAULT null,
  `otp_used` tinyint(4) DEFAULT '0',
  `otp_used_time` datetime DEFAULT null,
  `otp_resend` tinyint(4) DEFAULT '0',
  `reset_pwd_flag` tinyint(4) DEFAULT '0',
  `reset_pwd_time` datetime DEFAULT null,
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
  `send_time` datetime DEFAULT null,
  `use_time` datetime DEFAULT null,
  `client_ip` varchar(50) DEFAULT ''
) ENGINE=InnoDB;
CREATE TABLE `dashboard_base_distributor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dashboard_id` varchar(50) NOT NULL DEFAULT '',
  `server_ip` varchar(40) DEFAULT null,
  `server_id` int(11) NOT NULL DEFAULT '0',
  `total_ports` int(11) DEFAULT '0',
  `isactive` tinyint(1) DEFAULT '1',
  `attribute` varchar(50) DEFAULT 'server_ip',
  `added_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_datetime` datetime DEFAULT null,
  PRIMARY KEY (`dashboard_id`,`server_id`),
  KEY `id` (`id`)
) ENGINE=InnoDB;

CREATE TABLE `asset_master` (
   `asset_type` varchar(50) NOT NULL,
   `asset_value` varchar(100) NOT NULL,
   PRIMARY KEY (`asset_type`,`asset_value`)
 ) ENGINE=InnoDB;

CREATE TABLE `employee_master` (
   `val_type` varchar(50) NOT NULL,
   `val_text` varchar(50) NOT NULL,
   `prefer_order` varchar(100) DEFAULT '1',
   PRIMARY KEY (`val_type`,`val_text`)
 ) ENGINE=InnoDB;

CREATE TABLE `assets` (
   `asset_id` int NOT NULL AUTO_INCREMENT,
   `asset_name` varchar(100) DEFAULT '',
   `asset_type` varchar(50) DEFAULT '',
   `purchase_date` date DEFAULT NULL,
   `assigned_date` date DEFAULT NULL,
   `employee_id` int DEFAULT NULL,
   `created_by` varchar(50) DEFAULT '',
   `created_datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
   `updated_by` varchar(50) DEFAULT '',
   `updated_datetime` datetime DEFAULT NULL,
   PRIMARY KEY (`asset_id`),
   KEY `employee_id` (`employee_id`),
   CONSTRAINT `assets_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
 ) ENGINE=InnoDB;

CREATE TABLE `employees` (
   `employee_id` int NOT NULL AUTO_INCREMENT,
   `first_name` varchar(50) DEFAULT '',
   `last_name` varchar(50) DEFAULT '',
   `email` varchar(100) DEFAULT '',
   `phone_number` varchar(15) DEFAULT '',
   `hire_date` date DEFAULT NULL,
   `job_title` varchar(50) DEFAULT '',
   `created_by` varchar(50) DEFAULT '',
   `created_datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
   `updated_by` varchar(50) DEFAULT '',
   `updated_datetime` datetime DEFAULT NULL,
   `file_id` bigint DEFAULT NULL,
   PRIMARY KEY (`employee_id`)
 ) ENGINE=InnoDB;

INSERT INTO `asset_master` (`asset_type`,`asset_value`) VALUES ('Electronic','HP Laptop');
INSERT INTO `asset_master` (`asset_type`,`asset_value`) VALUES ('Electronic','IPad');
INSERT INTO `asset_master` (`asset_type`,`asset_value`) VALUES ('Electronic','Iphone 16 Pro');
INSERT INTO `asset_master` (`asset_type`,`asset_value`) VALUES ('Electronic','MacBook');
INSERT INTO `asset_master` (`asset_type`,`asset_value`) VALUES ('Electronic','Samsung Headphone');

INSERT INTO `employee_master` (`val_type`,`val_text`,`prefer_order`) VALUES ('JOB_TITLE','Ass. Vice President','1');
INSERT INTO `employee_master` (`val_type`,`val_text`,`prefer_order`) VALUES ('JOB_TITLE','Assitant Manager','1');
INSERT INTO `employee_master` (`val_type`,`val_text`,`prefer_order`) VALUES ('JOB_TITLE','Developer','1');
INSERT INTO `employee_master` (`val_type`,`val_text`,`prefer_order`) VALUES ('JOB_TITLE','Director','1');
INSERT INTO `employee_master` (`val_type`,`val_text`,`prefer_order`) VALUES ('JOB_TITLE','Manager','1');
INSERT INTO `employee_master` (`val_type`,`val_text`,`prefer_order`) VALUES ('JOB_TITLE','Senior AVP','1');
INSERT INTO `employee_master` (`val_type`,`val_text`,`prefer_order`) VALUES ('JOB_TITLE','Senior Developer','1');
INSERT INTO `employee_master` (`val_type`,`val_text`,`prefer_order`) VALUES ('JOB_TITLE','Senior Manager','1');
INSERT INTO `employee_master` (`val_type`,`val_text`,`prefer_order`) VALUES ('JOB_TITLE','Vice President','1');

INSERT INTO `employees` (`employee_id`,`first_name`,`last_name`,`email`,`phone_number`,`hire_date`,`job_title`,`created_by`,`created_datetime`,`updated_by`,`updated_datetime`,`file_id`) VALUES (1,'Vineet','Sharma','vineet.sharma@service.com','9911773883','2024-03-04','Manager','vineet','2024-09-18 16:45:01','',NULL,NULL);
INSERT INTO `employees` (`employee_id`,`first_name`,`last_name`,`email`,`phone_number`,`hire_date`,`job_title`,`created_by`,`created_datetime`,`updated_by`,`updated_datetime`,`file_id`) VALUES (2,'Rahul','Kashyap','rahul.kashyap@service.com','9911773888','2023-03-04','Senior Manager','vineet','2024-09-18 16:46:07','',NULL,NULL);
INSERT INTO `employees` (`employee_id`,`first_name`,`last_name`,`email`,`phone_number`,`hire_date`,`job_title`,`created_by`,`created_datetime`,`updated_by`,`updated_datetime`,`file_id`) VALUES (3,'Anil','Bajpai','anil.bajpai@service.com','+119191919','2018-03-04','Senior AVP','vineet','2024-09-18 16:48:08','',NULL,NULL);
INSERT INTO `employees` (`employee_id`,`first_name`,`last_name`,`email`,`phone_number`,`hire_date`,`job_title`,`created_by`,`created_datetime`,`updated_by`,`updated_datetime`,`file_id`) VALUES (4,'Ankit','Aggarwal','ankit.aggarwal@service.com','991177221','2023-08-04','Manager','vineet','2024-09-18 16:49:10','',NULL,NULL);
INSERT INTO `employees` (`employee_id`,`first_name`,`last_name`,`email`,`phone_number`,`hire_date`,`job_title`,`created_by`,`created_datetime`,`updated_by`,`updated_datetime`,`file_id`) VALUES (5,'Vikas','Mishra','vikas.mishra@service.com','9911773881','2023-06-01','Assitant Manager','vineet','2024-09-18 16:51:14','',NULL,NULL);
INSERT INTO `employees` (`employee_id`,`first_name`,`last_name`,`email`,`phone_number`,`hire_date`,`job_title`,`created_by`,`created_datetime`,`updated_by`,`updated_datetime`,`file_id`) VALUES (6,'Yogesh','Vats','yogesh.vats@service.com','987972912','2022-05-20','Developer','vineet','2024-09-18 16:51:14','@LOGINUSER','2024-09-18 18:59:36',NULL);
INSERT INTO `employees` (`employee_id`,`first_name`,`last_name`,`email`,`phone_number`,`hire_date`,`job_title`,`created_by`,`created_datetime`,`updated_by`,`updated_datetime`,`file_id`) VALUES (230386,'Vikas','Sharma','vikas.sharma@service.com','09897720821','2024-09-21','Developer','exl','2024-09-21 00:26:52','exl','2024-09-23 17:15:11',NULL);

INSERT INTO `assets` (`asset_id`,`asset_name`,`asset_type`,`purchase_date`,`assigned_date`,`employee_id`,`created_by`,`created_datetime`,`updated_by`,`updated_datetime`) VALUES (1,'HP Laptop','Electronic','2024-03-01','2024-03-04',1,'vineet','2024-09-18 19:11:41','',NULL);
INSERT INTO `assets` (`asset_id`,`asset_name`,`asset_type`,`purchase_date`,`assigned_date`,`employee_id`,`created_by`,`created_datetime`,`updated_by`,`updated_datetime`) VALUES (2,'HP Laptop','Electronic','2023-01-01','2023-01-10',2,'vineet','2024-09-18 19:14:07','',NULL);
INSERT INTO `assets` (`asset_id`,`asset_name`,`asset_type`,`purchase_date`,`assigned_date`,`employee_id`,`created_by`,`created_datetime`,`updated_by`,`updated_datetime`) VALUES (3,'Iphone 16 Pro','Electronic','2023-01-01','2023-01-15',2,'vineet','2024-09-18 19:14:07','',NULL);
INSERT INTO `assets` (`asset_id`,`asset_name`,`asset_type`,`purchase_date`,`assigned_date`,`employee_id`,`created_by`,`created_datetime`,`updated_by`,`updated_datetime`) VALUES (4,'Samsung Headphone','Electronic','2023-01-01','2023-01-15',2,'vineet','2024-09-18 19:14:07','',NULL);
INSERT INTO `assets` (`asset_id`,`asset_name`,`asset_type`,`purchase_date`,`assigned_date`,`employee_id`,`created_by`,`created_datetime`,`updated_by`,`updated_datetime`) VALUES (5,'MacBook','Electronic','2024-03-01','2024-03-04',3,'vineet','2024-09-18 19:11:41','',NULL);
INSERT INTO `assets` (`asset_id`,`asset_name`,`asset_type`,`purchase_date`,`assigned_date`,`employee_id`,`created_by`,`created_datetime`,`updated_by`,`updated_datetime`) VALUES (6,'Iphone 16 Pro','Electronic','2022-05-03','2022-05-10',3,'vineet','2024-09-18 19:14:07','',NULL);
INSERT INTO `assets` (`asset_id`,`asset_name`,`asset_type`,`purchase_date`,`assigned_date`,`employee_id`,`created_by`,`created_datetime`,`updated_by`,`updated_datetime`) VALUES (7,'IPad','Electronic','2023-01-15','2023-01-20',3,'vineet','2024-09-18 19:14:07','',NULL);
INSERT INTO `assets` (`asset_id`,`asset_name`,`asset_type`,`purchase_date`,`assigned_date`,`employee_id`,`created_by`,`created_datetime`,`updated_by`,`updated_datetime`) VALUES (8,'HP Laptop','Electronic','2023-01-01','2023-01-10',4,'vineet','2024-09-18 19:14:07','',NULL);
INSERT INTO `assets` (`asset_id`,`asset_name`,`asset_type`,`purchase_date`,`assigned_date`,`employee_id`,`created_by`,`created_datetime`,`updated_by`,`updated_datetime`) VALUES (9,'HP Laptop','Electronic','2023-01-01','2024-09-19',5,'vineet','2024-09-18 19:14:07','exl','2024-09-19 23:51:58');
INSERT INTO `assets` (`asset_id`,`asset_name`,`asset_type`,`purchase_date`,`assigned_date`,`employee_id`,`created_by`,`created_datetime`,`updated_by`,`updated_datetime`) VALUES (10,'HP Laptop','Electronic','2023-01-01','2023-01-10',6,'vineet','2024-09-18 19:14:07','',NULL);
INSERT INTO `assets` (`asset_id`,`asset_name`,`asset_type`,`purchase_date`,`assigned_date`,`employee_id`,`created_by`,`created_datetime`,`updated_by`,`updated_datetime`) VALUES (20,'HP Laptop','Electronic','2024-09-21','2024-09-21',230386,'exl','2024-09-21 00:55:05','',NULL);

