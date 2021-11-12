-- Secondary/Mafia jobs

USE `essentialmode`;

ALTER TABLE `users`
	ADD COLUMN `job2` VARCHAR(20) NULL DEFAULT 'unemployed' AFTER `job_grade`,
	ADD COLUMN `job2_grade` INT NULL DEFAULT 0 AFTER `job2`
;

CREATE TABLE `job2_grades` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`job_name` VARCHAR(50) DEFAULT NULL,
	`grade` INT NOT NULL,
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) NOT NULL,
	`salary` INT NOT NULL,
	`skin_male` LONGTEXT NOT NULL,
	`skin_female` LONGTEXT NOT NULL,

	PRIMARY KEY (`id`)
);

INSERT INTO `job2_grades` VALUES (1,'unemployed',0,'unemployed','Unemployed',200,'{}','{}');

CREATE TABLE `jobs2` (
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) DEFAULT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `jobs2` VALUES ('unemployed','Unemployed');