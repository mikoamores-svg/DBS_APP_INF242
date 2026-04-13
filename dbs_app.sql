-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2026 at 06:57 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbs_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `author_id` int(10) UNSIGNED NOT NULL,
  `author_firstname` varchar(100) NOT NULL,
  `author_lastname` varchar(100) NOT NULL,
  `author_birth_year` smallint(5) UNSIGNED DEFAULT NULL,
  `author_nationality` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_id`, `author_firstname`, `author_lastname`, `author_birth_year`, `author_nationality`) VALUES
(1, 'Jose', 'Rizal', 1861, 'Filipino'),
(2, 'Amado', 'Hernandez', 1903, 'Filipino'),
(3, 'F. H.', 'Batacan', 1967, 'Filipino'),
(4, 'Lualhati', 'Bautista', 1946, 'Filipino'),
(5, 'Nick', 'Joaquin', 1917, 'Filipino'),
(6, 'Bob', 'Ong', 1979, 'Filipino');

-- --------------------------------------------------------

--
-- Table structure for table `bookauthors`
--

CREATE TABLE `bookauthors` (
  `ba_id` int(10) UNSIGNED NOT NULL,
  `book_id` int(10) UNSIGNED NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookauthors`
--

INSERT INTO `bookauthors` (`ba_id`, `book_id`, `author_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(6, 2, 2),
(3, 3, 2),
(4, 4, 3),
(5, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `bookcopy`
--

CREATE TABLE `bookcopy` (
  `copy_id` int(10) UNSIGNED NOT NULL,
  `book_id` int(10) UNSIGNED NOT NULL,
  `status` enum('AVAILABLE','ON_LOAN','LOST','DAMAGED','REPAIR') NOT NULL DEFAULT 'AVAILABLE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookcopy`
--

INSERT INTO `bookcopy` (`copy_id`, `book_id`, `status`) VALUES
(101, 1, 'AVAILABLE'),
(102, 1, 'ON_LOAN'),
(103, 1, 'ON_LOAN'),
(201, 2, 'AVAILABLE'),
(202, 2, 'AVAILABLE'),
(301, 3, 'AVAILABLE'),
(302, 3, 'REPAIR'),
(401, 4, 'ON_LOAN'),
(402, 4, 'AVAILABLE'),
(501, 5, 'AVAILABLE'),
(502, 5, 'LOST');

-- --------------------------------------------------------

--
-- Table structure for table `bookgenre`
--

CREATE TABLE `bookgenre` (
  `gb_id` int(10) UNSIGNED NOT NULL,
  `genre_id` int(10) UNSIGNED NOT NULL,
  `book_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookgenre`
--

INSERT INTO `bookgenre` (`gb_id`, `genre_id`, `book_id`) VALUES
(1, 1, 1),
(4, 1, 2),
(2, 2, 1),
(11, 2, 5),
(9, 3, 4),
(5, 4, 2),
(7, 4, 3),
(3, 5, 1),
(6, 5, 2),
(8, 5, 3),
(10, 5, 4),
(12, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(10) UNSIGNED NOT NULL,
  `book_title` varchar(255) NOT NULL,
  `book_isbn` varchar(20) DEFAULT NULL,
  `book_publication_year` smallint(5) UNSIGNED DEFAULT NULL,
  `book_edition` varchar(100) DEFAULT NULL,
  `book_publisher` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `book_title`, `book_isbn`, `book_publication_year`, `book_edition`, `book_publisher`) VALUES
(1, 'Noli Me Tangere', '9789710810736', 1887, 'Reprint Edition', 'National Book Store'),
(2, 'El Filibusterismo', '9789710810743', 1891, 'Reprint Edition', 'National Book Store'),
(3, 'Mga Ibong Mandaragit', '9789711000000', 1969, '1st Edition', 'Adarna House'),
(4, 'Smaller and Smaller Circles', '9789712721768', 2002, '1st Edition', 'Ateneo de Manila University Press'),
(5, 'Dekada ’70', '9789712712346', 1983, '2nd Edition', 'Ateneo de Manila University Press'),
(6, 'ABNKKBNPA', '0989700', 2010, 'Edition I', 'Sample Publisher');

-- --------------------------------------------------------

--
-- Table structure for table `borroweraddress`
--

CREATE TABLE `borroweraddress` (
  `ba_id` int(10) UNSIGNED NOT NULL,
  `borrower_id` int(10) UNSIGNED NOT NULL,
  `ba_house_number` varchar(30) DEFAULT NULL,
  `ba_street` varchar(150) DEFAULT NULL,
  `ba_barangay` varchar(150) DEFAULT NULL,
  `ba_city` varchar(150) DEFAULT NULL,
  `ba_province` varchar(150) DEFAULT NULL,
  `ba_postal_code` varchar(20) DEFAULT NULL,
  `ba_country` varchar(80) NOT NULL DEFAULT 'Philippines',
  `is_primary` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borroweraddress`
--

INSERT INTO `borroweraddress` (`ba_id`, `borrower_id`, `ba_house_number`, `ba_street`, `ba_barangay`, `ba_city`, `ba_province`, `ba_postal_code`, `ba_country`, `is_primary`) VALUES
(1, 1, '32', 'Maharlika St.', 'Brgy. Sabang', 'Lipa City', 'Batangas', '4217', 'Philippines', 1),
(2, 2, '145', 'Rizal Ave.', 'Brgy. Balintawak', 'Quezon City', 'Metro Manila', '1100', 'Philippines', 1),
(3, 3, '8', 'Mabini St.', 'Brgy. San Roque', 'Antipolo City', 'Rizal', '1870', 'Philippines', 1),
(4, 4, '21', 'Del Pilar St.', 'Brgy. Poblacion', 'Calamba City', 'Laguna', '4027', 'Philippines', 1),
(5, 5, '77', 'Bonifacio St.', 'Brgy. Talomo', 'Davao City', 'Davao del Sur', '8000', 'Philippines', 1),
(6, 6, '19', 'JP Laurel St.', 'Brgy. Lahug', 'Cebu City', 'Cebu', '6000', 'Philippines', 1);

-- --------------------------------------------------------

--
-- Table structure for table `borrowers`
--

CREATE TABLE `borrowers` (
  `borrower_id` int(10) UNSIGNED NOT NULL,
  `borrower_firstname` varchar(100) NOT NULL,
  `borrower_lastname` varchar(100) NOT NULL,
  `borrower_email` varchar(255) NOT NULL,
  `borrower_phone_number` varchar(20) DEFAULT NULL,
  `borrower_member_since` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrowers`
--

INSERT INTO `borrowers` (`borrower_id`, `borrower_firstname`, `borrower_lastname`, `borrower_email`, `borrower_phone_number`, `borrower_member_since`, `is_active`) VALUES
(1, 'Juan', 'Dela Cruz', 'juan.delacruz@samplemail.com', '09171234567', '2024-06-10', 1),
(2, 'Maria', 'Santos', 'maria.santos@samplemail.com', '09281234567', '2023-09-22', 1),
(3, 'Mark', 'Reyes', 'mark.reyes@samplemail.com', '09061234567', '2025-01-15', 1),
(4, 'Ana', 'Bautista', 'ana.bautista@samplemail.com', '09991234567', '2024-11-05', 1),
(5, 'Paolo', 'Garcia', 'paolo.garcia@samplemail.com', '09351234567', '2022-07-19', 0),
(6, 'Grace', 'Mendoza', 'grace.mendoza@samplemail.com', '09181234567', '2025-07-02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `borroweruser`
--

CREATE TABLE `borroweruser` (
  `bu_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `borrower_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borroweruser`
--

INSERT INTO `borroweruser` (`bu_id`, `user_id`, `borrower_id`) VALUES
(1, 2, 1),
(2, 3, 2),
(3, 4, 3),
(4, 5, 4),
(5, 6, 5),
(6, 7, 6);

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `genre_id` int(10) UNSIGNED NOT NULL,
  `genre_name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES
(1, 'Classic'),
(2, 'Historical Fiction'),
(3, 'Mystery/Crime'),
(5, 'Philippine Literature'),
(4, 'Political Fiction');

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `loan_id` int(10) UNSIGNED NOT NULL,
  `borrower_id` int(10) UNSIGNED NOT NULL,
  `processed_by_user_id` int(10) UNSIGNED NOT NULL,
  `loan_date` datetime NOT NULL DEFAULT current_timestamp(),
  `loan_status` enum('OPEN','CLOSED','CANCELLED') NOT NULL DEFAULT 'OPEN'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`loan_id`, `borrower_id`, `processed_by_user_id`, `loan_date`, `loan_status`) VALUES
(1001, 1, 1, '2025-10-03 00:00:00', 'CLOSED'),
(1002, 2, 1, '2025-12-12 00:00:00', 'CLOSED'),
(1003, 3, 1, '2026-01-10 00:00:00', 'OPEN'),
(1004, 4, 1, '2026-02-15 00:00:00', 'OPEN'),
(1005, 6, 1, '2025-08-20 00:00:00', 'CLOSED'),
(1006, 2, 1, '2025-03-05 00:00:00', 'CLOSED'),
(1008, 1, 1, '2026-03-26 09:35:46', 'OPEN');

-- --------------------------------------------------------

--
-- Table structure for table `loanitem`
--

CREATE TABLE `loanitem` (
  `loan_item_id` int(10) UNSIGNED NOT NULL,
  `loan_id` int(10) UNSIGNED NOT NULL,
  `copy_id` int(10) UNSIGNED NOT NULL,
  `li_duedate` date NOT NULL,
  `li_returned_at` datetime DEFAULT NULL,
  `condition_out` enum('GOOD','DAMAGED') NOT NULL DEFAULT 'GOOD',
  `condition_in` enum('GOOD','DAMAGED') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loanitem`
--

INSERT INTO `loanitem` (`loan_item_id`, `loan_id`, `copy_id`, `li_duedate`, `li_returned_at`, `condition_out`, `condition_in`) VALUES
(5001, 1001, 101, '2025-10-10', '2025-10-09 00:00:00', 'GOOD', 'GOOD'),
(5002, 1001, 201, '2025-10-10', '2025-10-12 00:00:00', 'GOOD', 'DAMAGED'),
(5003, 1002, 402, '2025-12-19', '2025-12-18 00:00:00', 'GOOD', 'GOOD'),
(5004, 1003, 102, '2026-01-17', NULL, 'GOOD', NULL),
(5005, 1004, 401, '2026-02-22', NULL, 'GOOD', NULL),
(5006, 1004, 301, '2026-02-22', '2026-02-20 00:00:00', 'GOOD', 'GOOD'),
(5007, 1005, 202, '2025-08-27', '2025-08-27 00:00:00', 'GOOD', 'GOOD'),
(5008, 1006, 103, '2025-03-12', '2025-03-11 00:00:00', 'GOOD', 'GOOD'),
(5009, 1006, 501, '2025-03-12', '2025-03-16 00:00:00', 'GOOD', 'GOOD'),
(5011, 1008, 103, '2026-04-02', NULL, 'GOOD', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `role_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'ADMIN'),
(2, 'BORROWER');

-- --------------------------------------------------------

--
-- Table structure for table `userroles`
--

CREATE TABLE `userroles` (
  `ur_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `userroles`
--

INSERT INTO `userroles` (`ur_id`, `user_id`, `role_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 2),
(4, 4, 2),
(5, 5, 2),
(6, 6, 2),
(7, 7, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(80) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password_hash`, `is_active`, `created_at`) VALUES
(1, 'admin.library@samplemail.com', '$2y$10$adminDummyHashReplaceInPHP', 1, '2025-01-01 08:00:00'),
(2, 'juan.delacruz@samplemail.com', '$2y$10$juanDummyHashReplaceInPHP', 1, '2024-06-10 09:00:00'),
(3, 'maria.santos@samplemail.com', '$2y$10$mariaDummyHashReplaceInPHP', 1, '2023-09-22 09:00:00'),
(4, 'mark.reyes@samplemail.com', '$2y$10$markDummyHashReplaceInPHP', 1, '2025-01-15 09:00:00'),
(5, 'ana.bautista@samplemail.com', '$2y$10$anaDummyHashReplaceInPHP', 1, '2024-11-05 09:00:00'),
(6, 'paolo.garcia@samplemail.com', '$2y$10$paoloDummyHashReplaceInPHP', 0, '2022-07-19 09:00:00'),
(7, 'grace.mendoza@samplemail.com', '$2y$10$graceDummyHashReplaceInPHP', 1, '2025-07-02 09:00:00'),
(8, 'j@gmail.com', '$2y$10$pATJSFQtjsNC5xkxjSnn/.q1hJu1SQ440fFL6zXKXkT7nzhpB7E/i', 1, '2026-04-06 17:47:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `bookauthors`
--
ALTER TABLE `bookauthors`
  ADD PRIMARY KEY (`ba_id`),
  ADD UNIQUE KEY `uq_bookauthors_book_author` (`book_id`,`author_id`),
  ADD KEY `idx_bookauthors_book` (`book_id`),
  ADD KEY `idx_bookauthors_author` (`author_id`);

--
-- Indexes for table `bookcopy`
--
ALTER TABLE `bookcopy`
  ADD PRIMARY KEY (`copy_id`),
  ADD KEY `idx_bookcopy_book` (`book_id`);

--
-- Indexes for table `bookgenre`
--
ALTER TABLE `bookgenre`
  ADD PRIMARY KEY (`gb_id`),
  ADD UNIQUE KEY `uq_bookgenre_genre_book` (`genre_id`,`book_id`),
  ADD KEY `idx_bookgenre_genre` (`genre_id`),
  ADD KEY `idx_bookgenre_book` (`book_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD UNIQUE KEY `uq_books_isbn` (`book_isbn`);

--
-- Indexes for table `borroweraddress`
--
ALTER TABLE `borroweraddress`
  ADD PRIMARY KEY (`ba_id`),
  ADD KEY `idx_borroweraddress_borrower` (`borrower_id`);

--
-- Indexes for table `borrowers`
--
ALTER TABLE `borrowers`
  ADD PRIMARY KEY (`borrower_id`),
  ADD UNIQUE KEY `uq_borrowers_email` (`borrower_email`);

--
-- Indexes for table `borroweruser`
--
ALTER TABLE `borroweruser`
  ADD PRIMARY KEY (`bu_id`),
  ADD UNIQUE KEY `uq_borroweruser_user` (`user_id`),
  ADD UNIQUE KEY `uq_borroweruser_borrower` (`borrower_id`),
  ADD KEY `idx_borroweruser_user` (`user_id`),
  ADD KEY `idx_borroweruser_borrower` (`borrower_id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genre_id`),
  ADD UNIQUE KEY `uq_genres_name` (`genre_name`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`loan_id`),
  ADD KEY `idx_loan_borrower` (`borrower_id`),
  ADD KEY `idx_loan_processed_by_user` (`processed_by_user_id`);

--
-- Indexes for table `loanitem`
--
ALTER TABLE `loanitem`
  ADD PRIMARY KEY (`loan_item_id`),
  ADD UNIQUE KEY `uq_loanitem_loan_copy` (`loan_id`,`copy_id`),
  ADD KEY `idx_loanitem_loan` (`loan_id`),
  ADD KEY `idx_loanitem_copy` (`copy_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `uq_roles_name` (`role_name`);

--
-- Indexes for table `userroles`
--
ALTER TABLE `userroles`
  ADD PRIMARY KEY (`ur_id`),
  ADD UNIQUE KEY `uq_userroles_user_role` (`user_id`,`role_id`),
  ADD KEY `idx_userroles_user` (`user_id`),
  ADD KEY `idx_userroles_role` (`role_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `uq_users_username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookauthors`
--
ALTER TABLE `bookauthors`
  MODIFY `ba_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookcopy`
--
ALTER TABLE `bookcopy`
  MODIFY `copy_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=503;

--
-- AUTO_INCREMENT for table `bookgenre`
--
ALTER TABLE `bookgenre`
  MODIFY `gb_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `borroweraddress`
--
ALTER TABLE `borroweraddress`
  MODIFY `ba_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `borrowers`
--
ALTER TABLE `borrowers`
  MODIFY `borrower_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `borroweruser`
--
ALTER TABLE `borroweruser`
  MODIFY `bu_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `genre_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `loan_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1009;

--
-- AUTO_INCREMENT for table `loanitem`
--
ALTER TABLE `loanitem`
  MODIFY `loan_item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5012;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `userroles`
--
ALTER TABLE `userroles`
  MODIFY `ur_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookauthors`
--
ALTER TABLE `bookauthors`
  ADD CONSTRAINT `fk_bookauthors_author` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bookauthors_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON UPDATE CASCADE;

--
-- Constraints for table `bookcopy`
--
ALTER TABLE `bookcopy`
  ADD CONSTRAINT `fk_bookcopy_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON UPDATE CASCADE;

--
-- Constraints for table `bookgenre`
--
ALTER TABLE `bookgenre`
  ADD CONSTRAINT `fk_bookgenre_book` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bookgenre_genre` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON UPDATE CASCADE;

--
-- Constraints for table `borroweraddress`
--
ALTER TABLE `borroweraddress`
  ADD CONSTRAINT `fk_borroweraddress_borrower` FOREIGN KEY (`borrower_id`) REFERENCES `borrowers` (`borrower_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `borroweruser`
--
ALTER TABLE `borroweruser`
  ADD CONSTRAINT `fk_borroweruser_borrower` FOREIGN KEY (`borrower_id`) REFERENCES `borrowers` (`borrower_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_borroweruser_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `fk_loan_borrower` FOREIGN KEY (`borrower_id`) REFERENCES `borrowers` (`borrower_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_loan_processed_by_user` FOREIGN KEY (`processed_by_user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `loanitem`
--
ALTER TABLE `loanitem`
  ADD CONSTRAINT `fk_loanitem_copy` FOREIGN KEY (`copy_id`) REFERENCES `bookcopy` (`copy_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_loanitem_loan` FOREIGN KEY (`loan_id`) REFERENCES `loan` (`loan_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userroles`
--
ALTER TABLE `userroles`
  ADD CONSTRAINT `fk_userroles_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_userroles_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
