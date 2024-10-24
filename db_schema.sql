 CREATE TABLE `login_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `client_ip` varchar(20) NOT NULL DEFAULT '',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logout_time` datetime DEFAULT NULL,
  `ip` varchar(20) DEFAULT '',
  PRIMARY KEY (`id`)
);

CREATE TABLE `user_activity_details_xml` (
  `file_id` bigint NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL DEFAULT '',
  `login_id` bigint DEFAULT NULL,
  `uploaded_zip_file` varchar(200) NOT NULL DEFAULT '',
  `wav_files` varchar(200) NOT NULL DEFAULT '',
  `org_csv_file` varchar(200) NOT NULL DEFAULT '',
  `success_csv_file` varchar(200) NOT NULL DEFAULT '',
  `fail_csv_file` varchar(200) NOT NULL DEFAULT '',
  `org_count` int NOT NULL DEFAULT '-1',
  `success_count` int NOT NULL DEFAULT '-1',
  `fail_count` int NOT NULL DEFAULT '-1',
  `validation` int NOT NULL DEFAULT '0',
  `addparams` text,
  `activity_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activity` varchar(100) NOT NULL DEFAULT '',
  `suspend_base` tinyint(1) DEFAULT '0',
  `suspend_datetime` datetime DEFAULT NULL,
  `dbname` varchar(100) DEFAULT '',
  `tblname` varchar(100) DEFAULT '',
  `email_flag` tinyint NOT NULL DEFAULT '0',
  `base_status` varchar(50) NOT NULL DEFAULT 'RUNNING',
  PRIMARY KEY (`file_id`)
);