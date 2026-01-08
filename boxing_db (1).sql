-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2026 at 08:32 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `coaches`
--

CREATE TABLE `coaches` (
  `coach_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `experience_years` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coaches`
--

INSERT INTO `coaches` (`coach_id`, `first_name`, `last_name`, `experience_years`) VALUES
(1, 'Freddie', 'Roach', 25),
(2, 'Robert', 'Garcia', 18),
(3, 'Joel', 'Diaz', 15),
(4, 'Teddy', 'Atlas', 30),
(5, 'Nacho', 'Beristain', 35);

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `match_id` int(11) NOT NULL,
  `boxer_id` int(11) NOT NULL,
  `opponent_name` varchar(100) NOT NULL,
  `match_date` date NOT NULL,
  `result` varchar(20) NOT NULL,
  `venue_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`match_id`, `boxer_id`, `opponent_name`, `match_date`, `result`, `venue_id`) VALUES
(1, 1, 'Floyd Mayweather', '2015-05-02', 'Loss', 1),
(2, 1, 'Keith Thurman', '2019-07-20', 'Win', 1),
(3, 3, 'Canelo Alvarez', '2011-12-11', 'Win', 2),
(4, 4, 'Juan Manuel Marquez', '2011-11-12', 'Win', 1),
(5, 5, 'Manny Pacquiao', '2012-12-08', 'Win', 1);

-- --------------------------------------------------------

--
-- Table structure for table `training_records`
--

CREATE TABLE `training_records` (
  `record_id` int(11) NOT NULL,
  `boxer_id` int(11) NOT NULL,
  `session_date` date NOT NULL,
  `duration_minutes` int(11) NOT NULL,
  `focus_area` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `training_records`
--

INSERT INTO `training_records` (`record_id`, `boxer_id`, `session_date`, `duration_minutes`, `focus_area`) VALUES
(1, 1, '2024-12-01', 120, 'Sparring'),
(2, 1, '2024-12-03', 90, 'Cardio'),
(3, 2, '2024-12-02', 110, 'Footwork'),
(4, 3, '2024-12-01', 100, 'Strength'),
(5, 4, '2024-12-04', 95, 'Defense');

-- --------------------------------------------------------

--
-- Table structure for table `venues`
--

CREATE TABLE `venues` (
  `venue_id` int(11) NOT NULL,
  `venue_name` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `venues`
--

INSERT INTO `venues` (`venue_id`, `venue_name`, `city`, `capacity`) VALUES
(1, 'MGM Grand Garden Arena', 'Las Vegas', 17157),
(2, 'Madison Square Garden', 'New York', 20000),
(3, 'Staples Center', 'Los Angeles', 19000),
(4, 'Caesars Palace Arena', 'Las Vegas', 16000),
(5, 'Tokyo Dome', 'Tokyo', 55000);

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
-- Indexes for table `coaches`
--
ALTER TABLE `coaches`
  ADD PRIMARY KEY (`coach_id`);

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`match_id`),
  ADD KEY `boxer_id` (`boxer_id`),
  ADD KEY `venue_id` (`venue_id`);

--
-- Indexes for table `training_records`
--
ALTER TABLE `training_records`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `boxer_id` (`boxer_id`);

--
-- Indexes for table `venues`
--
ALTER TABLE `venues`
  ADD PRIMARY KEY (`venue_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `boxers`
--
ALTER TABLE `boxers`
  MODIFY `boxer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `coaches`
--
ALTER TABLE `coaches`
  MODIFY `coach_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `match_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `training_records`
--
ALTER TABLE `training_records`
  MODIFY `record_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `venues`
--
ALTER TABLE `venues`
  MODIFY `venue_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `boxers`
--
ALTER TABLE `boxers`
  ADD CONSTRAINT `boxers_ibfk_1` FOREIGN KEY (`coach_id`) REFERENCES `coaches` (`coach_id`);

--
-- Constraints for table `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`boxer_id`) REFERENCES `boxers` (`boxer_id`),
  ADD CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`venue_id`);

--
-- Constraints for table `training_records`
--
ALTER TABLE `training_records`
  ADD CONSTRAINT `training_records_ibfk_1` FOREIGN KEY (`boxer_id`) REFERENCES `boxers` (`boxer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
