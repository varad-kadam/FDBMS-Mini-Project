-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Tue 16, 2023 at 03:41 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus_ticket`
--

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `id` int(5) NOT NULL,
  `bname` varchar(25) NOT NULL,
  `bus_no` varchar(25) NOT NULL,
  `owner_id` int(5) NOT NULL,
  `from_loc` varchar(20) NOT NULL,
  `from_time` varchar(8) NOT NULL,
  `to_loc` varchar(20) NOT NULL,
  `to_time` varchar(8) NOT NULL,
  `fare` int(5) NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`id`, `bname`, `bus_no`, `owner_id`, `from_loc`, `from_time`, `to_loc`, `to_time`, `fare`, `approved`) VALUES (1, 'Ashoka', 'MH-17231', 3, 'Pune', '1:40 AM', 'Nashik', '05:50 AM', 800, 1),
(2, 'Maharashtra Travels', 'MH-21396', 3, 'Pune', '08:00 PM', 'Nagpur', '08:30 AM', 1000, 0),
(3, 'Sana Travels', 'MH-12389', 3, 'Pune', '11:30 PM', 'Kohlapur', '05:15 AM', 550, 0),
(4, 'InterCity Smart Bus', 'MH-58752', 3, 'Pune', '11:30 PM', 'Satara', '02:15 AM', 2048, 1);


-- --------------------------------------------------------

--
-- Table structure for table `earnings`
--

CREATE TABLE `earnings` (
  `id` int(5) NOT NULL,
  `bus_id` int(5) NOT NULL,
  `date` varchar(10) NOT NULL,
  `sold` int(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(5) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`) VALUES
(1, 'Nashik'),
(2, 'Nagpur'),
(3, 'Kohlapur'),
(4, 'Satara');

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` int(5) NOT NULL,
  `recep` int(5) NOT NULL,
  `message` varchar(120) NOT NULL,
  `from` int(5) NOT NULL,
  `title` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(5) NOT NULL,
  `passenger_id` int(5) NOT NULL,
  `bus_id` int(5) NOT NULL,
  `jdate` varchar(25) NOT NULL,
  `seats` varchar(120) NOT NULL,
  `fare` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `passenger_id`, `bus_id`, `jdate`, `seats`, `fare`) VALUES
(1, 2, 1, '04/04/2021', 'a:2:{i:0;s:2:\"D1\";i:1;s:2:\"D2\";}', 1050),
(2, 2, 1, '05/05/2021', 'a:1:{i:0;s:2:\"E1\";}', 1050),
(3, 2, 2, '06/06/2022', 'a:2:{i:0;s:2:\"D3\";i:1;s:2:\"D4\";}', 550),
(4, 2, 3, '07/07/2022', 'a:1:{i:0;s:2:\"E4\";}', 550),
(5, 2, 3, '06/08/2022', 'a:2:{i:0;s:2:\"C3\";i:1;s:2:\"C4\";}', 1050),
(6, 2, 4, '03/03/2023', 'a:2:{i:0;s:2:\"E1\";i:1;s:2:\"E2\";}', 1050);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(5) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `name` varchar(25) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(25) NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `utype` enum('Admin','Owner','Passenger') NOT NULL,
  `address` varchar(120) NOT NULL,
  `mobile` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uname`, `name`, `email`, `password`, `gender`, `utype`, `address`, `mobile`) VALUES
(1, 'admin', 'Admin', 'admin@admin.com', 'admin', 'Male', 'Admin', '----', '1234567890'),
(2, 'varad', 'Varad Kadam', 'varadkadam8@gmail.com', '123456', 'Male', 'Passenger', 'Pune, Maharastra', '7666309207'),
(3, 'vishu', 'Vishu Kumar', 'vishu@gmail.com', '123456', 'Male', 'Owner', '', '9856742233'),
(4, 'vedansh', 'Vedash Gohil', 'vedansh@gmail.com', '123456', 'Male', 'Owner', 'Nashik, ', '1758470000'),
(5, 'vedang', 'vedang kshrisagar', 'vedang333@gmail.com', '123456', 'Male', 'Passenger', 'Nagpur', '1722222222');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usr_bus` (`owner_id`);

--
-- Indexes for table `earnings`
--
ALTER TABLE `earnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ear_bus` (`bus_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usrf_not` (`from`),
  ADD KEY `fk_usrt_not` (`recep`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usr_tic` (`passenger_id`),
  ADD KEY `fk_bus_tic` (`bus_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`uname`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buses`
--
ALTER TABLE `buses`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `earnings`
--
ALTER TABLE `earnings`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buses`
--
ALTER TABLE `buses`
  ADD CONSTRAINT `fk_usr_bus` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `earnings`
--
ALTER TABLE `earnings`
  ADD CONSTRAINT `fk_ear_bus` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`id`);

--
-- Constraints for table `notices`
--
ALTER TABLE `notices`
  ADD CONSTRAINT `fk_usrf_not` FOREIGN KEY (`from`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_usrt_not` FOREIGN KEY (`recep`) REFERENCES `users` (`id`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `fk_bus_tic` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`id`),
  ADD CONSTRAINT `fk_usr_tic` FOREIGN KEY (`passenger_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
