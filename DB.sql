-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 10, 2021 at 11:41 PM
-- Server version: 10.3.28-MariaDB-log-cll-lve
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seanwall_term_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `get/posts` int(11) NOT NULL DEFAULT 0,
  `post/posts` int(11) NOT NULL DEFAULT 0,
  `put/posts` int(11) NOT NULL DEFAULT 0,
  `delete/posts/{postID}` int(11) NOT NULL DEFAULT 0,
  `post/comments` int(11) NOT NULL DEFAULT 0,
  `put/comments` int(11) NOT NULL DEFAULT 0,
  `get/comments/commentsForPost/{postID}` int(11) NOT NULL DEFAULT 0,
  `delete/comments/{commentID}}` int(11) NOT NULL DEFAULT 0,
  `post/user/register` int(11) NOT NULL DEFAULT 0,
  `post/user/login` int(11) NOT NULL DEFAULT 0,
  `get/user/{username}` int(11) NOT NULL DEFAULT 0,
  `put/user` int(11) NOT NULL DEFAULT 0,
  `delete/user/{username}` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`get/posts`, `post/posts`, `put/posts`, `delete/posts/{postID}`, `post/comments`, `put/comments`, `get/comments/commentsForPost/{postID}`, `delete/comments/{commentID}}`, `post/user/register`, `post/user/login`, `get/user/{username}`, `put/user`, `delete/user/{username}`) VALUES
(148, 8, 5, 0, 5, 2, 3, 0, 39, 60, 13, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `content`, `post_id`, `user_id`) VALUES
(2, 'A test of the comments', 2, 2),
(3, 'A test of the comments', 2, 1),
(4, 'Another Comment?', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `title`, `content`, `user_id`) VALUES
(2, 'SUNG OOOOPPPPP', 'HOW IS HE SO GOOD AT INTTINNNGNGG', 1),
(3, 'The big day!!', 'This is the biggest bestest day of my whole life', 1),
(4, 'A big test for us a huge leap for programming kind', 'Does this appear?', 3),
(8, 'testing titles', 'testing', 3),
(9, 'finally', 'it works\n        ', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(64) NOT NULL,
  `permissions` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `permissions`) VALUES
(1, 'seanTest', '$2b$10$rClJnC5yddSZ6O/UZL.WQetDmLk7HPAtzvRGddrmDIPx9EsCJffT.', 'admin'),
(2, 'adminTest', '$2b$10$85qABNjz4OjVohTU02PieeX14m7CkNcUNRN24yZmrMvNfzwyK2W5O', 'user'),
(3, 'bob', '$2b$10$8l7ypnjHhrE6.v3ZkFUbrO6XNt0njALqTERja70g3l0/RziWxKkd6', 'admin'),
(4, 'bobTest', '$2b$10$RT1kN4bdjtueek0WtFy2PeOSSXDtjUPbSTnpl6BtZ6M9KlFMC8bnW', 'user'),
(5, 'testuser', '$2b$10$ByhHHDQnln/w9AOMFOEvVeh/sFQmhYGcGingY8Z/mpnUJ/SfoRAcy', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `fk_postId` (`post_id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `fk_userId` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_postId` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_userId` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
