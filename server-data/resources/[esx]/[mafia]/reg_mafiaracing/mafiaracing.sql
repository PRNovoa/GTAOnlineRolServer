USE `essentialmode`;
CREATE TABLE `races_checkpoints` (
	`id` int NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (id),
	`race` VARCHAR(30),
	`x` FLOAT,
	`y` FLOAT,
	`z` FLOAT
);