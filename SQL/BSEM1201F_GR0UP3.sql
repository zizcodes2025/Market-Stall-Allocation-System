-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2026 at 02:37 PM
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
-- Database: `marketstalldb`
--
CREATE DATABASE IF NOT EXISTS `marketstalldb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `marketstalldb`;
--
-- Database: `market_stall_database`
--
CREATE DATABASE IF NOT EXISTS `market_stall_database` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `market_stall_database`;

-- --------------------------------------------------------

--
-- Table structure for table `allocation`
--

CREATE TABLE `allocation` (
  `allocation_id` int(11) NOT NULL,
  `trader_id` int(11) NOT NULL,
  `stall_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `allocation_status` enum('active','expired','cancelled') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `allocation`
--

INSERT INTO `allocation` (`allocation_id`, `trader_id`, `stall_id`, `start_date`, `end_date`, `allocation_status`) VALUES
(1, 1, 1, '2026-01-12', NULL, 'active'),
(2, 2, 2, '2026-01-20', NULL, 'active'),
(3, 3, 4, '2026-02-05', NULL, 'active'),
(5, 5, 7, '2026-03-01', NULL, 'active'),
(6, 6, 9, '2026-03-05', NULL, 'active'),
(7, 7, 3, '2026-03-10', '2026-05-10', 'expired'),
(8, 8, 5, '2026-03-15', NULL, 'active'),
(9, 9, 8, '2026-03-20', NULL, 'active'),
(10, 10, 10, '2026-03-25', NULL, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `registration_id` int(11) NOT NULL,
  `trader_id` int(11) NOT NULL,
  `allocation_id` int(11) NOT NULL,
  `registration_date` date NOT NULL,
  `fee_amount` decimal(10,2) NOT NULL,
  `payment_status` enum('paid','unpaid','partial') DEFAULT 'unpaid',
  `payment_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`registration_id`, `trader_id`, `allocation_id`, `registration_date`, `fee_amount`, `payment_status`, `payment_date`) VALUES
(1, 1, 1, '2026-01-12', 250.00, 'paid', '2026-01-12'),
(2, 2, 2, '2026-01-20', 350.00, 'paid', '2026-01-20'),
(3, 3, 3, '2026-02-05', 400.00, 'partial', '2026-02-05'),
(5, 5, 5, '2026-03-01', 250.00, 'paid', '2026-04-20'),
(6, 6, 6, '2026-03-05', 550.00, 'paid', '2026-03-05'),
(7, 7, 7, '2026-03-10', 500.00, 'unpaid', NULL),
(8, 8, 8, '2026-03-15', 200.00, 'paid', '2026-03-15'),
(9, 9, 9, '2026-03-20', 350.00, 'partial', '2026-03-20'),
(10, 10, 10, '2026-03-25', 300.00, 'paid', '2026-03-25');

-- --------------------------------------------------------

--
-- Table structure for table `stall`
--

CREATE TABLE `stall` (
  `stall_id` int(11) NOT NULL,
  `stall_number` varchar(20) NOT NULL,
  `market_name` varchar(100) NOT NULL,
  `location` varchar(255) NOT NULL,
  `stall_size` enum('small','medium','large') NOT NULL,
  `status` enum('available','occupied','maintenance') DEFAULT 'available',
  `monthly_fee` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stall`
--

INSERT INTO `stall` (`stall_id`, `stall_number`, `market_name`, `location`, `stall_size`, `status`, `monthly_fee`) VALUES
(1, 'ST001', 'Dovecot Market', 'Central Block', 'small', 'occupied', 250.00),
(2, 'ST002', 'Dovecot Market', 'East Wing', 'medium', 'occupied', 350.00),
(3, 'ST003', 'Dovecot Market', 'West Wing', 'large', 'available', 500.00),
(4, 'ST004', 'Congo Market', 'Section A', 'medium', 'occupied', 400.00),
(5, 'ST005', 'Congo Market', 'Section B', 'small', 'available', 200.00),
(6, 'ST006', 'Congo Market', 'Section C', 'large', 'occupied', 600.00),
(7, 'ST007', 'Big Market', 'North Wing', 'small', 'occupied', 250.00),
(8, 'ST008', 'Big Market', 'South Wing', 'medium', 'available', 350.00),
(9, 'ST009', 'Big Market', 'Central Wing', 'large', 'occupied', 550.00),
(10, 'ST010', 'Big Market', 'Extension Block', 'medium', 'available', 300.00);

-- --------------------------------------------------------

--
-- Table structure for table `trader`
--

CREATE TABLE `trader` (
  `trader_id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `trader_type` varchar(50) NOT NULL,
  `date_registered` date NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trader`
--

INSERT INTO `trader` (`trader_id`, `full_name`, `phone_number`, `address`, `trader_type`, `date_registered`, `email`) VALUES
(1, 'Mohamed Kamara', '076123456', 'Kissy, Freetown', 'Food Vendor', '2026-01-10', 'mohamed@gmail.com'),
(2, 'Fatmata Sesay', '078234567', 'Lumley, Freetown', 'Clothing Trader', '2026-01-15', 'fatmata@gmail.com'),
(3, 'Ibrahim Koroma', '079345678', 'Waterloo', 'Electronics Seller', '2026-02-01', 'ibrahim@gmail.com'),
(4, 'Hawa Bangura', '077456789', 'Calaba Town', 'Vegetable Seller', '2026-02-10', 'hawa@gmail.com'),
(5, 'Mariama Conteh', '075567890', 'Allen Town', 'Cosmetics Trader', '2026-02-20', 'mariama@gmail.com'),
(6, 'Abdul Kargbo', '074111222', 'Wellington', 'Phone Accessories', '2026-03-01', 'abdul@gmail.com'),
(7, 'Isatu Turay', '076333444', 'Murray Town', 'Fruit Seller', '2026-03-05', 'isatu@gmail.com'),
(8, 'Joseph Johnson', '078555666', 'Goderich', 'Hardware Dealer', '2026-03-10', 'joseph@gmail.com'),
(9, 'Aminata Kamara', '077777888', 'Jui', 'Fashion Trader', '2026-03-15', 'aminata@gmail.com'),
(10, 'Alusine Bangura', '075999000', 'Congo Cross', 'General Merchandise', '2026-03-20', 'alusine@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allocation`
--
ALTER TABLE `allocation`
  ADD PRIMARY KEY (`allocation_id`),
  ADD KEY `trader_id` (`trader_id`),
  ADD KEY `stall_id` (`stall_id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`registration_id`),
  ADD KEY `trader_id` (`trader_id`),
  ADD KEY `allocation_id` (`allocation_id`);

--
-- Indexes for table `stall`
--
ALTER TABLE `stall`
  ADD PRIMARY KEY (`stall_id`),
  ADD UNIQUE KEY `stall_number` (`stall_number`);

--
-- Indexes for table `trader`
--
ALTER TABLE `trader`
  ADD PRIMARY KEY (`trader_id`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allocation`
--
ALTER TABLE `allocation`
  MODIFY `allocation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `registration_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `stall`
--
ALTER TABLE `stall`
  MODIFY `stall_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `trader`
--
ALTER TABLE `trader`
  MODIFY `trader_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `allocation`
--
ALTER TABLE `allocation`
  ADD CONSTRAINT `allocation_ibfk_1` FOREIGN KEY (`trader_id`) REFERENCES `trader` (`trader_id`),
  ADD CONSTRAINT `allocation_ibfk_2` FOREIGN KEY (`stall_id`) REFERENCES `stall` (`stall_id`);

--
-- Constraints for table `registration`
--
ALTER TABLE `registration`
  ADD CONSTRAINT `registration_ibfk_1` FOREIGN KEY (`trader_id`) REFERENCES `trader` (`trader_id`),
  ADD CONSTRAINT `registration_ibfk_2` FOREIGN KEY (`allocation_id`) REFERENCES `allocation` (`allocation_id`);
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
