CREATE TABLE `rolevotes` (
	`id` int NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (id),
	`emisor` VARCHAR(40),
	`receptor` VARCHAR(40),
	`tiempo` BIGINT,
	`voto` FLOAT,
	`justificacion` VARCHAR(160)
);

ALTER TABLE `users` ADD `rolelevel` FLOAT NULL DEFAULT 0;