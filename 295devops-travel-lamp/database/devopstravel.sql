-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 07, 2023 at 05:31 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4
USE devopstravel;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
-- create database anywherewindow;
-- use anywherewindow;

--
-- Database: `anywherewindow`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `adults` int(11) DEFAULT NULL,
  `children` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `user_id`, `name`, `email`, `phone`, `address`, `package_id`, `adults`, `children`, `date`) VALUES
(1, 1, 'name1', 'test1@test.com', 123456789, 'home', 3, 2, 1, '2023-09-30'),
(2, 2, 'name2', 'test2@test.com', 123, 'home', 3, 5, 2, '2023-10-21'),
(30, 1, 'name1', 'test1@test.com', 12345, 'adsf', 5, 2, 2, '2023-10-22');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `package_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `destinations` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`package_id`, `package_name`, `description`, `days`, `price`, `destinations`) VALUES
(1, 'Isla de Margarita Package', 'Kochi, Isla de Margarita.', 10, 40000.00, 'Isla de Margarita'),
(2, 'Isla de Coche Package', 'Isla de Coche.', 7, 30000.00, 'Isla de coche'),
(3, 'Calafate Package', 'Calafate.', 11, 37000.00, 'Calafate'),
(4, 'Cataratas Iguazu Package', 'Cataratas de Iguazu', 10, 35000.00, 'Cataratas'),
(5, 'Buenos Aires Package', 'Buenos Aires.', 6, 25000.00, 'Buenos Aires'),
(6, 'Buenos Aires at Night Package', 'Buenos Aires at Night.', 9, 42000.00, 'Buenos Aires');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `regis_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `email`, `password`, `regis_date`) VALUES
(1, 'user1', 'test1@test.com', '$2y$10$Snp9TypJqAy8UcTE6Nf1Qu1JPB.eQnXv0xjJ3KkFg4QMyXlAF5TIW', '2023-09-22 16:30:08'),
(2, 'user2', 'test2@test.com', '$2y$10$nfrL4wW1OqwfUTOGQWmBCu1EamV8HxAsSVrLkRy1z6.SFy81kGjp.', '2023-10-05 01:23:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
