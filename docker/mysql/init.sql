
-- users
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(200) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idx_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'tarou', 'tarou@example.com', 'password'),
(2, 'hanako', 'hanako@example.com', 'password');

-- posts
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `content` varchar(200) NOT NULL DEFAULT '',
  `photo_path` varchar(50) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  INDEX `idx_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `posts` (`id`, `user_id`, `title`, `content`, `photo_path`) VALUES
(1, 1, '森林に行きました', '森林にピクニックに行った時の写真です', 'example.com/tarou/image1'),
(2, 1, '釣り', '友人と釣りに行った時の写真です', 'example.com/tarou/image2'),
(3, 2, 'オムライス', '今日の夕飯はオムライス', 'example.com/hanako/image1'),
(4, 2, '肉じゃが', '今日の夕飯は肉じゃが', 'example.com/hanako/image2');


-- likes
DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
  `user_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`, `post_id`),
  FOREIGN KEY(`user_id`) REFERENCES `users` (`id`),
  FOREIGN KEY(`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `likes` (`user_id`, `post_id`) VALUES
(1, 3),
(2, 1);


-- follows
DROP TABLE IF EXISTS `follows`;
CREATE TABLE `follows` (
  `follower_id` bigint unsigned NOT NULL,
  `followee_id` bigint unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`follower_id`, `followee_id`),
  FOREIGN KEY(`follower_id`) REFERENCES `users` (`id`),
  FOREIGN KEY(`followee_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `follows` (`follower_id`, `followee_id`) VALUES
(1, 2),
(2, 1);
