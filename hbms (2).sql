-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2024 at 06:56 AM
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
-- Database: `hbms`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE `about` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`id`, `title`, `description`) VALUES
(3, 'About Us', 'We have 72 comfortably equipped rooms, including two suites: The President Suite and The Ambassador Suite, with one hundred meters of surface area, which are sure to awe even the most demanding Guests. We offer 7 rooms, where we have preparing family and business meetings already for 15 years.');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobileNumber` bigint(10) UNSIGNED NOT NULL,
  `gender` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `mobileNumber`, `gender`, `password`) VALUES
(1, 'GAURAV SHARMA', 'admin@gmail.com', 7014274820, 'Male', '$2a$12$Anc.fHD9/Mj1fS8MUakeK.0JWQxjAaEYno.RTuVPMH3C5YcOLsZlG');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `bookingNumber` bigint(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mobileNumber` bigint(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `idType` varchar(25) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(150) NOT NULL,
  `bookingDate` date NOT NULL DEFAULT current_timestamp(),
  `checkInDate` date NOT NULL,
  `checkOutDate` date NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `remarks` varchar(100) NOT NULL DEFAULT 'Not Updated Yet',
  `roomID` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `bookingNumber`, `name`, `mobileNumber`, `email`, `idType`, `gender`, `address`, `bookingDate`, `checkInDate`, `checkOutDate`, `status`, `remarks`, `roomID`, `userID`) VALUES
(1, 202404011442, 'Gaurav Sharma', 7014274820, 'user@gmail.com', 'Voter ID', 'Male', 'sddsfdsfxdzsfdsfdsfdsf', '2024-04-03', '2024-04-04', '2024-04-06', 0, 'Cancelled', 27, 1),
(8, 20240403090433, 'gaurav', 1234567890, 'gaurav@gmail.com', 'Voter Card', 'Male', 'sdsfsdf', '2024-04-03', '2024-04-03', '2024-04-05', 2, 'Booking Approved', 27, 3),
(9, 20240403100433, 'cdSDf', 1234567890, 'user@gmail.com', 'Aadhar Card', 'Male', 'jgfjtftycrtyfmjmhkj  gthftj  j\r\n f tftfy kbhvky', '2024-04-03', '2024-04-03', '2024-04-14', 1, 'Not Updated Yet', 30, 1),
(10, 20240404070404, 'GAURAV SHARMA', 1234567890, 'gaurav@gmail.com', 'Driving Licence Card', 'Male', '3/27 H|B Balotra', '2024-04-04', '2024-04-05', '2024-04-10', 2, 'Approved', 29, 1),
(11, 20240405090423, 'Ayush Verma', 9461436268, 'ayush@gmail.com', 'Aadhar Card', 'Male', 'ratanada', '2024-04-05', '2024-04-06', '2024-04-07', 0, 'Could not approve your booking', 27, 14),
(12, 20240405090445, 'Ayush Verma', 9461436268, 'ayush@gmail.com', 'Aadhar Card', 'Male', 'Ratanada', '2024-04-05', '2024-04-06', '2024-04-07', 2, 'Approved', 27, 14),
(13, 20240409100459, 'user', 1234123412, 'user@gmail.com', 'Aadhar Card', 'Male', 'asdfgasdgfdsgxcvdsfgdf', '2024-04-09', '2024-04-19', '2024-04-20', 2, 'booking approved', 28, 1),
(14, 20240409110419, 'queen room', 1234567890, 'qq@gmail.com', 'Driving Licence Card', 'Male', 'qq', '2024-04-09', '2024-04-11', '2024-04-11', 1, 'Not Updated Yet', 32, 16),
(15, 20240409110451, '16', 1234567890, 'test2@gmail.com', 'Passport', 'Male', 'dfgZAdaS', '2024-04-09', '2024-04-11', '2024-04-11', 1, 'Not Updated Yet', 31, 16);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`, `description`, `price`) VALUES
(65, 'Single Room', 'A single room is for one person', 800),
(66, 'Double Rooms', 'A double room is a room intended for two people', 1100),
(67, 'Triple Rooms', 'A triple room is a hotel room that is made to comfortably accommodate three people.', 1200),
(68, 'Quad Rooms', 'A quad, when referring to hotel rooms, is a room that can accommodate four people', 1800),
(69, 'Queen Rooms', 'A room with a queen-size bed', 2000);

--
-- Triggers `category`
--
DELIMITER $$
CREATE TRIGGER `onDeleteCategory` BEFORE DELETE ON `category` FOR EACH ROW DELETE FROM rooms WHERE category=OLD.title
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `onUpdateCategory` AFTER UPDATE ON `category` FOR EACH ROW UPDATE rooms SET category = NEW.title WHERE price = NEW.price
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobileNumber` bigint(10) NOT NULL,
  `description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `title`, `email`, `mobileNumber`, `description`) VALUES
(1, 'Contact Us', 'info@gmail.com', 8529631236, 'D-204, Hole Town South West,Delhi-110096 India');

-- --------------------------------------------------------

--
-- Table structure for table `enquiry`
--

CREATE TABLE `enquiry` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobileNumber` bigint(10) NOT NULL,
  `message` varchar(100) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enquiry`
--

INSERT INTO `enquiry` (`id`, `name`, `email`, `mobileNumber`, `message`, `date`, `status`) VALUES
(1, 'user', 'user@gmail.com', 1234567890, 'judbhfudhasfuhsxnHSNcdhbasdlhdbabxhzs', '2024-03-18', 1),
(2, 'gaurav sharma', 'gaurav@gmail.com', 1234567890, 'I want to stay in hotel.', '2024-03-24', 1),
(3, 'test', 'test@gmail.com', 1234567890, 'testing@123', '2024-03-25', 1),
(4, 'gaurav', 'gaurav@gmail.com', 1234567890, 'testing', '2024-04-03', 1),
(5, 'gaurav', 'gaurav@gmail.com', 1234567890, 'testing', '2024-04-03', 1),
(6, 'gaurav', 'user@gmail.com', 1234567890, 'dfdfvgdzvz', '2024-04-03', 1),
(7, 'Ayush Verma', 'ayush@gmail.com', 9461436268, 'its urgent', '2024-04-05', 1),
(8, 'testing2', 'test2@gmail.com', 3453456673, 'hello ', '2024-04-09', 0);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `category` varchar(25) NOT NULL,
  `name` varchar(255) NOT NULL,
  `maxAdult` int(11) NOT NULL,
  `maxChild` int(11) NOT NULL,
  `description` varchar(750) NOT NULL,
  `beds` int(11) NOT NULL,
  `imageName` varchar(200) NOT NULL,
  `imagePath` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `category`, `name`, `maxAdult`, `maxChild`, `description`, `beds`, `imageName`, `imagePath`, `price`) VALUES
(27, 'Single Room', 'A single room is for one person and contains a single bed, and will usually be quite small', 1, 2, 'A single room is for one person and contains a single bed, and will usually be quite small', 1, '2870b3543f2550c16a4551f03a0b84ac1582975994_1ve9evxfcl8mg.jpg', 'includes\\images\\rooms', 800),
(28, 'Single Room', 'A single room is for one person', 1, 2, 'Each room is equipped with satellite TV, minibar and a tea/coffee maker. Ironing facilities are provided in all rooms. Treebo Select Royal Garden offers a well-equipped business centre. Guests can make travel arrangements at the tour desk. Checkers Restaurant serves a variety of Indian, Chinese and Continental dishes.', 1, 'ca3de1cf40a0af9351083d4b0e95736c1583047692_163xuelswbv2y.jpg', 'includes\\images\\rooms', 800),
(29, 'Double Rooms', 'A double room is a room intended for two people', 2, 2, 'A double room is a room intended for two people, usually a couple, to stay in. One person occupying a double room has to pay a supplement.', 2, '74375080377499ab76dad37484ee7f151582982180.jpg', 'includes\\images\\rooms', 1100),
(30, 'Triple Rooms', 'A triple room is a hotel room that is made to comfortably accommodate three people.', 4, 2, 'A triple room is a hotel room that is made to comfortably accommodate three people. The triple room , simply called a triple, at times, may be configured with different bed sizes to ensure three hotel guests can be accommodated comfortably.', 3, '5ebc75f329d3b6f84d44c2c2e9764d4f1582976638.jpg', 'includes\\images\\rooms', 1200),
(31, 'Quad Rooms', 'A quad, when referring to hotel rooms, is a room that can accommodate four people.', 6, 3, 'A quad, when referring to hotel rooms, is a room that can accommodate four people. The quad room may be configured with different bed sizes to ensure four hotel guests can be accommodated comfortably.', 4, '0cdcf50ea65522a6e15d4e0ac383a30e1582976749.jpg', 'includes\\images\\rooms', 1800),
(32, 'Queen Rooms', 'A room with a queen-size bed. It may be occupied by one or more people', 2, 1, 'A room with a queen-size bed. It may be occupied by one or more people (Size: 153 x 203 cm). ', 1, '7edd3d2f392c4a07d107f07cbe764fa51582977081.jpg', 'includes\\images\\rooms', 2000);

--
-- Triggers `rooms`
--
DELIMITER $$
CREATE TRIGGER `onDeleteRoom` BEFORE DELETE ON `rooms` FOR EACH ROW DELETE FROM booking WHERE roomID=OLD.id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobileNumber` bigint(10) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `mobileNumber`, `password`) VALUES
(1, 'user', 'user@gmail.com', 1234567890, '$2a$12$FuBlH.HAlmaQs93e56GvMOsTIMuHxxkINpX71uf0EiHyOGDXvqySK'),
(3, 'gaurav ', 'gaurav@gmail.com', 12345678900, '$2a$12$ZpsSKT2rJVbkZKrmt9LuMeip.bxhS2a7Wz0lgmWkpeCJfEbKDbCgO'),
(5, 'testing', 'test@gmail', 1234567890, '$2a$12$CJ/URTS.43MnzCoWxVtw7.9UFEi/LgfxHkECu9N/VZccyChB2rF4i'),
(14, 'Ayush Verma', 'ayush@gmail.com', 9461436268, '$2a$12$pNDt3jQ1zwzBiqe7tfsgnOZJYMeV8.CVxNCDDPU30w5ToFPdVwVvW'),
(15, 'Ayush', 'ayush.verma@gmail.com', 7894561230, '$2a$12$Sgp104OIGo.YbAOiFFao1.62bEJIfBKgx.pVZO/iD.eW3ke/0i.4y'),
(16, 'testing2', 'test2@gmail.com', 1234567890, '$2a$12$y9BmILtc0228QJBaZydDcO6Wha2661YcodPRgBe.tsNCLZ4oenFQy');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `onDeleteUser` BEFORE DELETE ON `users` FOR EACH ROW DELETE FROM booking WHERE userID=OLD.id
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enquiry`
--
ALTER TABLE `enquiry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about`
--
ALTER TABLE `about`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `enquiry`
--
ALTER TABLE `enquiry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
