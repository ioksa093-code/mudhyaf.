CREATE TABLE `users` (
  `id` bigint PRIMARY KEY AUTO_INCREMENT,
  `full_name` varchar(255),
  `email` varchar(255) UNIQUE,
  `password_hash` varchar(255),
  `role` varchar(255),
  `created_at` datetime
);

CREATE TABLE `business_categories` (
  `id` bigint PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255)
);

CREATE TABLE `businesses` (
  `id` bigint PRIMARY KEY AUTO_INCREMENT,
  `owner_id` bigint,
  `category_id` bigint,
  `name` varchar(255),
  `description` text,
  `address` varchar(255),
  `latitude` decimal,
  `longitude` decimal,
  `phone` varchar(255),
  `working_hours` varchar(255),
  `price_level` varchar(255),
  `status` varchar(255),
  `created_at` datetime
);

CREATE TABLE `attractions` (
  `id` bigint PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `description` text,
  `address` varchar(255),
  `latitude` decimal,
  `longitude` decimal,
  `created_by` bigint,
  `created_at` datetime
);

CREATE TABLE `events` (
  `id` bigint PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `description` text,
  `address` varchar(255),
  `latitude` decimal,
  `longitude` decimal,
  `start_time` datetime,
  `end_time` datetime,
  `created_by` bigint,
  `approved_by` bigint,
  `status` varchar(255),
  `created_at` datetime
);

CREATE TABLE `reviews` (
  `id` bigint PRIMARY KEY AUTO_INCREMENT,
  `user_id` bigint,
  `entity_type` varchar(255),
  `entity_id` bigint,
  `rating` int,
  `comment` text,
  `created_at` datetime
);

CREATE TABLE `favorites` (
  `id` bigint PRIMARY KEY AUTO_INCREMENT,
  `user_id` bigint,
  `entity_type` varchar(255),
  `entity_id` bigint,
  `created_at` datetime
);

CREATE INDEX `reviews_index_0` ON `reviews` (`entity_type`, `entity_id`);

CREATE INDEX `reviews_index_1` ON `reviews` (`user_id`);

CREATE INDEX `favorites_index_2` ON `favorites` (`entity_type`, `entity_id`);

CREATE INDEX `favorites_index_3` ON `favorites` (`user_id`);

ALTER TABLE `businesses` ADD FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`);

ALTER TABLE `businesses` ADD FOREIGN KEY (`category_id`) REFERENCES `business_categories` (`id`);

ALTER TABLE `attractions` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `events` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `events` ADD FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`);

ALTER TABLE `reviews` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `favorites` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
