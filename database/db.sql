CREATE DATABASE api collate utf8mb4_unicode_ci;

USE api;

CREATE TABLE `users`
(
    `id`        bigint(20) unsigned                     NOT NULL AUTO_INCREMENT,
    `name`      varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;