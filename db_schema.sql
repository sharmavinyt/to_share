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
 CREATE TABLE `employee_master` (
  `val_type` varchar(50) NOT NULL,
  `val_text` varchar(50) NOT NULL,
  `prefer_order` varchar(100) DEFAULT '1',
  PRIMARY KEY (`val_type`,`val_text`)
) ENGINE=InnoDB;
INSERT INTO employee_master (val_type,val_text,prefer_order) VALUES
	 ('JOB_TITLE','Ass. Vice President','1'),
	 ('JOB_TITLE','Assitant Manager','1'),
	 ('JOB_TITLE','Developer','1'),
	 ('JOB_TITLE','Director','1'),
	 ('JOB_TITLE','Manager','1'),
	 ('JOB_TITLE','Senior AVP','1'),
	 ('JOB_TITLE','Senior Developer','1'),
	 ('JOB_TITLE','Senior Manager','1'),
	 ('JOB_TITLE','Vice President','1');
	 
 CREATE TABLE `asset_master` (
  `asset_type` varchar(50) NOT NULL,
  `asset_value` varchar(100) NOT NULL,
  PRIMARY KEY (`asset_type`,`asset_value`)
) ENGINE=InnoDB;

INSERT INTO asset_master (asset_type,asset_value) VALUES
	 ('Electronic','HP Laptop'),
	 ('Electronic','IPad'),
	 ('Electronic','Iphone 16 Pro'),
	 ('Electronic','MacBook'),
	 ('Electronic','Samsung Headphone');


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
) ENGINE=InnoDB
INSERT INTO employees (first_name,last_name,email,phone_number,hire_date,job_title,created_by,created_datetime,updated_by,updated_datetime,file_id) VALUES
	 ('Vineet','Sharma','vineet.sharma@exlservice.com','9911773883','2024-03-04','Manager','vineet','2024-09-18 16:45:01','',NULL,NULL),
	 ('Rahul','Kashyap','rahul.kashyap@exlservice.com','9911773888','2023-03-04','Senior Manager','vineet','2024-09-18 16:46:07','',NULL,NULL),
	 ('Anil','Bajpai','anil.bajpai@exlservice.com','+119191919','2018-03-04','Senior AVP','vineet','2024-09-18 16:48:08','',NULL,NULL),
	 ('Ankit','Aggarwal','ankit.aggarwal@exlservice.com','991177221','2023-08-04','Manager','vineet','2024-09-18 16:49:10','',NULL,NULL),
	 ('Vikas','Mishra','vikas.mishra@exlservice.com','9911773881','2023-06-01','Assitant Manager','vineet','2024-09-18 16:51:14','',NULL,NULL),
	 ('Yogesh','Vats','yogesh.vats@exlservice.com','987972912','2022-05-20','Developer','vineet','2024-09-18 16:51:14','@LOGINUSER','2024-09-18 18:59:36',NULL),
	 ('Vikas','Sharma','vikas.sharma@exlservice.com','09897720821','2024-09-21','Developer','exl','2024-09-21 00:26:52','exl','2024-09-23 17:15:11',NULL);
	 
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
INSERT INTO assets (asset_name,asset_type,purchase_date,assigned_date,employee_id,created_by,created_datetime,updated_by,updated_datetime) VALUES
	 ('HP Laptop','Electronic','2024-03-01','2024-03-04',1,'vineet','2024-09-18 19:11:41','',NULL),
	 ('HP Laptop','Electronic','2023-01-01','2023-01-10',2,'vineet','2024-09-18 19:14:07','',NULL),
	 ('Iphone 16 Pro','Electronic','2023-01-01','2023-01-15',2,'vineet','2024-09-18 19:14:07','',NULL),
	 ('Samsung Headphone','Electronic','2023-01-01','2023-01-15',2,'vineet','2024-09-18 19:14:07','',NULL),
	 ('MacBook','Electronic','2024-03-01','2024-03-04',3,'vineet','2024-09-18 19:11:41','',NULL),
	 ('Iphone 16 Pro','Electronic','2022-05-03','2022-05-10',3,'vineet','2024-09-18 19:14:07','',NULL),
	 ('IPad','Electronic','2023-01-15','2023-01-20',3,'vineet','2024-09-18 19:14:07','',NULL),
	 ('HP Laptop','Electronic','2023-01-01','2023-01-10',4,'vineet','2024-09-18 19:14:07','',NULL),
	 ('HP Laptop','Electronic','2023-01-01','2024-09-19',5,'vineet','2024-09-18 19:14:07','exl','2024-09-19 23:51:58'),
	 ('HP Laptop','Electronic','2023-01-01','2023-01-10',6,'vineet','2024-09-18 19:14:07','',NULL);
