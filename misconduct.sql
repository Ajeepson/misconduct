-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2023 at 10:29 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `misconduct`
--

-- --------------------------------------------------------

--
-- Table structure for table `drivers_meta`
--

CREATE TABLE `drivers_meta` (
  `driver_id` int(30) DEFAULT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `drivers_meta`
--

INSERT INTO `drivers_meta` (`driver_id`, `meta_field`, `meta_value`, `date_updated`) VALUES
(1, 'license_id_no', 'CDM-062314', '2021-08-19 10:53:02'),
(1, 'lastname', 'Smith', '2021-08-19 10:53:02'),
(1, 'firstname', 'Johnny', '2021-08-19 10:53:02'),
(1, 'middlename', 'D', '2021-08-19 10:53:02'),
(1, 'dob', '1997-06-23', '2021-08-19 10:53:02'),
(1, 'present_address', 'Sample Address', '2021-08-19 10:53:02'),
(1, 'permanent_address', 'Sample Address', '2021-08-19 10:53:02'),
(1, 'civil_status', 'Married', '2021-08-19 10:53:02'),
(1, 'nationality', 'Filipino', '2021-08-19 10:53:02'),
(1, 'contact', '09123456789', '2021-08-19 10:53:02'),
(1, 'license_type', 'Professional', '2021-08-19 10:53:02'),
(1, 'image_path', 'uploads/drivers/1.jpg', '2021-08-19 10:53:02'),
(1, 'driver_id', '1', '2021-08-19 10:53:02'),
(4, 'license_id_no', 'GBN-10140715', '2021-08-19 14:56:09'),
(4, 'lastname', 'Blake', '2021-08-19 14:56:09'),
(4, 'firstname', 'Claire', '2021-08-19 14:56:09'),
(4, 'middlename', 'C', '2021-08-19 14:56:09'),
(4, 'dob', '1992-10-14', '2021-08-19 14:56:09'),
(4, 'present_address', 'Sample Address 123', '2021-08-19 14:56:09'),
(4, 'permanent_address', 'Sample Address 123', '2021-08-19 14:56:09'),
(4, 'civil_status', 'Married', '2021-08-19 14:56:09'),
(4, 'nationality', 'Filipino', '2021-08-19 14:56:09'),
(4, 'contact', '09123789456', '2021-08-19 14:56:09'),
(4, 'license_type', 'Non-Professional', '2021-08-19 14:56:09'),
(4, 'image_path', '', '2021-08-19 14:56:09'),
(4, 'driver_id', '4', '2021-08-19 14:56:09'),
(4, 'image_path', 'uploads/drivers/4.jpg', '2021-08-19 14:56:09');

-- --------------------------------------------------------

--
-- Table structure for table `mettings`
--

CREATE TABLE `mettings` (
  `ID` int(11) NOT NULL,
  `OFFENCE_ID` int(11) NOT NULL,
  `OFFENCE_TYPE` varchar(20) NOT NULL,
  `STUDENT_ID` int(11) NOT NULL,
  `STUDENT_REGNO` varchar(20) DEFAULT NULL,
  `REPORT_ID` int(11) DEFAULT NULL,
  `METTING_LINK` varchar(100) DEFAULT NULL,
  `METTING_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `offence`
--

CREATE TABLE `offence` (
  `ID` int(11) NOT NULL,
  `STAFF_ID` int(11) NOT NULL,
  `OFFENCE_TYPE` varchar(50) NOT NULL,
  `STAFF_NAME` varchar(50) DEFAULT NULL,
  `STAFF_POST` varchar(50) DEFAULT NULL,
  `STAFF_UNIT` varchar(20) DEFAULT NULL,
  `OFFENCE_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `offenses`
--

CREATE TABLE `offenses` (
  `id` int(30) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `fine` float NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=Inactive, 1=Active',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `offenses`
--

INSERT INTO `offenses` (`id`, `code`, `name`, `description`, `fine`, `status`, `date_created`, `date_updated`) VALUES
(1, 'OT-1001', 'Driving without License', 'This is a traffic offense for driving without License', 650, 1, '2021-08-19 09:14:43', '2021-08-19 09:17:50'),
(2, 'TO-1002', 'Running Over Speed Limit', '&lt;p&gt;Sample Traffic offense or violation for over speed limit.&lt;/p&gt;', 1000, 1, '2021-08-19 13:54:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `offense_items`
--

CREATE TABLE `offense_items` (
  `driver_offense_id` int(30) NOT NULL,
  `offense_id` int(30) DEFAULT NULL,
  `fine` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending, 1=paid',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `offense_items`
--

INSERT INTO `offense_items` (`driver_offense_id`, `offense_id`, `fine`, `status`, `date_created`) VALUES
(1, 1, 650, 1, '2021-08-18 15:00:00'),
(1, 2, 1000, 1, '2021-08-18 15:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `offense_list`
--

CREATE TABLE `offense_list` (
  `id` int(30) NOT NULL,
  `driver_id` int(30) NOT NULL,
  `officer_name` text NOT NULL,
  `officer_id` text NOT NULL,
  `ticket_no` text NOT NULL,
  `total_amount` float NOT NULL,
  `remarks` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending, 1=paid',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `offense_list`
--

INSERT INTO `offense_list` (`id`, `driver_id`, `officer_name`, `officer_id`, `ticket_no`, `total_amount`, `remarks`, `status`, `date_created`, `date_updated`) VALUES
(1, 1, 'George Wilson', 'OFC-789456123', '123456789', 1650, 'Sample Traffic Offense Record Only.', 1, '2021-08-18 15:00:00', '2021-08-19 14:20:59');

-- --------------------------------------------------------

--
-- Table structure for table `staff_id_tbl`
--

CREATE TABLE `staff_id_tbl` (
  `id` int(30) NOT NULL,
  `staff_id` varchar(100) NOT NULL,
  `staff_email` text NOT NULL,
  `staff_type` varchar(100) NOT NULL,
  `dept/unit` varchar(100) NOT NULL,
  `phone_no` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = active, 2 = suspended, 3 = banned',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `role` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff_id_tbl`
--

INSERT INTO `staff_id_tbl` (`id`, `staff_id`, `staff_email`, `staff_type`, `dept/unit`, `phone_no`, `status`, `date_created`, `date_updated`, `role`) VALUES
(1, 'FPD/SS/0345', 'user@gmail.com', 'ACADEMIC', 'Hostel', 903456355, 1, '2021-08-19 10:45:48', '2023-08-03 20:28:07', 0),
(4, 'FPD/SS/001', 'abc@gmail.com', 'NON-ACADEMIC', 'Computer Science', 813455456, 1, '2021-08-19 14:56:09', '2023-08-03 20:28:30', 0);

-- --------------------------------------------------------

--
-- Table structure for table `staff_tbl`
--

CREATE TABLE `staff_tbl` (
  `ID` int(11) NOT NULL,
  `STAFF_ID` varchar(20) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `UNIT` varchar(20) NOT NULL,
  `DUTY_POST` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student_info_tbl`
--

CREATE TABLE `student_info_tbl` (
  `ID` int(11) NOT NULL,
  `REG_NO` varchar(20) NOT NULL,
  `SNAME` varchar(50) NOT NULL,
  `DEPT` varchar(20) NOT NULL,
  `SLEVEL` varchar(20) NOT NULL,
  `GENDER` varchar(50) NOT NULL,
  `PHONE` varchar(14) NOT NULL,
  `DOB` date NOT NULL,
  `ADDRESSS` varchar(50) NOT NULL,
  `TYPE_OF_OFFENCE` varchar(20) NOT NULL,
  `COMMENT` varchar(20) DEFAULT NULL,
  `REPORTER` varchar(50) DEFAULT NULL,
  `EVIDENCE` varchar(50) DEFAULT NULL,
  `MIS_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_info_tbl`
--

INSERT INTO `student_info_tbl` (`ID`, `REG_NO`, `SNAME`, `DEPT`, `SLEVEL`, `GENDER`, `PHONE`, `DOB`, `ADDRESSS`, `TYPE_OF_OFFENCE`, `COMMENT`, `REPORTER`, `EVIDENCE`, `MIS_DATE`) VALUES
(1, ':regno', ':sname', ':dept', ':level', ':gender', ':phone', '0000-00-00', ':address', '', NULL, NULL, NULL, NULL),
(2, '2020/ND/CS/009', 'AJIBADE BASHIR ADELEKE', 'Accountancy', '100 Level', 'Male', '+234806611200', '2023-08-11', 'sabon fegi', '', NULL, NULL, NULL, NULL),
(3, 'U/19/CS/093', 'BABAGANA ADAMU', 'Computer Science', '200 Level', 'Male', '09085456677', '2023-08-17', 'POMPOMARI', '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Student Misconduct Guide System'),
(6, 'short_name', 'SMGS'),
(11, 'logo', 'uploads/1629334140_traffic_light_logo.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1629334140_traffic_bg.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `upassword` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `upassword`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', 'admin', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2023-02-17 11:55:23'),
(9, 'Rukayya', 'waxiri', 'ruky', '827ccb0eea8a706c4c34a16891f84e7b', 'uploads/1676633160_OIP.jpg', NULL, 2, '2021-08-19 09:24:25', '2023-02-17 12:26:55'),
(10, '', '', 'U/19/CS/093', '12345', NULL, NULL, 0, '0000-00-00 00:00:00', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `drivers_meta`
--
ALTER TABLE `drivers_meta`
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `mettings`
--
ALTER TABLE `mettings`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `offence`
--
ALTER TABLE `offence`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `offenses`
--
ALTER TABLE `offenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offense_items`
--
ALTER TABLE `offense_items`
  ADD KEY `driver_offense_id` (`driver_offense_id`),
  ADD KEY `offense_id` (`offense_id`);

--
-- Indexes for table `offense_list`
--
ALTER TABLE `offense_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `staff_id_tbl`
--
ALTER TABLE `staff_id_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `staff_id` (`staff_id`);

--
-- Indexes for table `staff_tbl`
--
ALTER TABLE `staff_tbl`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `student_info_tbl`
--
ALTER TABLE `student_info_tbl`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
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
-- AUTO_INCREMENT for table `mettings`
--
ALTER TABLE `mettings`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offence`
--
ALTER TABLE `offence`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offenses`
--
ALTER TABLE `offenses`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `offense_list`
--
ALTER TABLE `offense_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `staff_id_tbl`
--
ALTER TABLE `staff_id_tbl`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staff_tbl`
--
ALTER TABLE `staff_tbl`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_info_tbl`
--
ALTER TABLE `student_info_tbl`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `drivers_meta`
--
ALTER TABLE `drivers_meta`
  ADD CONSTRAINT `drivers_meta_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `staff_id_tbl` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `offense_items`
--
ALTER TABLE `offense_items`
  ADD CONSTRAINT `offense_items_ibfk_1` FOREIGN KEY (`driver_offense_id`) REFERENCES `offense_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `offense_items_ibfk_2` FOREIGN KEY (`offense_id`) REFERENCES `offenses` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `offense_list`
--
ALTER TABLE `offense_list`
  ADD CONSTRAINT `offense_list_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `staff_id_tbl` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
