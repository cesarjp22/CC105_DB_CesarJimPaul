-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2026 at 08:28 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `boxing_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `boxers`
--

CREATE TABLE `boxers` (
  `boxer_id` int(11) NOT NULL,
  `coach_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `weight_class` varchar(30) NOT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `reach_cm` int(11) DEFAULT NULL,
  `stance` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `boxers`
--

INSERT INTO `boxers` (`boxer_id`, `coach_id`, `first_name`, `last_name`, `weight_class`, `nationality`, `reach_cm`, `stance`) VALUES
(1, 1, 'Manny', 'Pacquiao', 'Welterweight', 'Philippines', 170, 'Southpaw'),
(2, 2, 'Brandon', 'Rios', 'Lightweight', 'USA', 180, 'Orthodox'),
(3, 3, 'Amir', 'Khan', 'Welterweight', 'UK', 180, 'Orthodox'),
(4, 4, 'Timothy', 'Bradley', 'Welterweight', 'USA', 175, 'Orthodox'),
(5, 5, 'Juan', 'Marquez', 'Lightweight', 'Mexico', 170, 'Orthodox');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `boxers`
--
ALTER TABLE `boxers`
  ADD PRIMARY KEY (`boxer_id`),
  ADD KEY `coach_id` (`coach_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `boxers`
--
ALTER TABLE `boxers`
  MODIFY `boxer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `boxers`
--
ALTER TABLE `boxers`
  ADD CONSTRAINT `boxers_ibfk_1` FOREIGN KEY (`coach_id`) REFERENCES `coaches` (`coach_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
