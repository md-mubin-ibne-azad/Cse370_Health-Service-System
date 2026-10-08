-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2024 at 08:07 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospitalmanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `User_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ambulance`
--

CREATE TABLE `ambulance` (
  `ID` int(11) NOT NULL,
  `Cost` decimal(10,2) DEFAULT NULL,
  `Availability` tinyint(1) DEFAULT NULL,
  `Admin_User_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `ID` int(11) NOT NULL,
  `Patient_User_id` int(11) DEFAULT NULL,
  `Doctor_User_id` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `bloodbank`
--

CREATE TABLE `bloodbank` (
  `ID` int(11) NOT NULL,
  `BloodType` varchar(50) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Admin_User_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `User_id` int(11) NOT NULL,
  `Fee` decimal(10,2) DEFAULT NULL,
  `Specialization` varchar(255) DEFAULT NULL,
  `Admin_User_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `Hospital_id` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Admin_User_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hospital_location`
--

CREATE TABLE `hospital_location` (
  `Hospital_id` int(11) NOT NULL,
  `Location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `others_normal_user`
--

CREATE TABLE `others_normal_user` (
  `User_id` int(11) NOT NULL,
  `BloodBank_id` int(11) DEFAULT NULL,
  `Admin_User_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `User_id` int(11) NOT NULL,
  `Disease` varchar(255) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Appointment_id` int(11) DEFAULT NULL,
  `Ambulance_id` int(11) DEFAULT NULL,
  `BloodBank_id` int(11) DEFAULT NULL,
  `Admin_User_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `User_id` int(11) NOT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Supervisor_id` int(11) DEFAULT NULL,
  `Admin_User_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `User_id` int(11) NOT NULL,
  `Age` int(11) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Mobile` varchar(20) DEFAULT NULL,
  `User_email` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`User_id`);

--
-- Indexes for table `ambulance`
--
ALTER TABLE `ambulance`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Admin_User_id` (`Admin_User_id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Patient_User_id` (`Patient_User_id`),
  ADD KEY `Doctor_User_id` (`Doctor_User_id`);

--
-- Indexes for table `bloodbank`
--
ALTER TABLE `bloodbank`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Admin_User_id` (`Admin_User_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`User_id`),
  ADD KEY `Admin_User_id` (`Admin_User_id`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`Hospital_id`),
  ADD KEY `Admin_User_id` (`Admin_User_id`);

--
-- Indexes for table `hospital_location`
--
ALTER TABLE `hospital_location`
  ADD PRIMARY KEY (`Hospital_id`);

--
-- Indexes for table `others_normal_user`
--
ALTER TABLE `others_normal_user`
  ADD PRIMARY KEY (`User_id`),
  ADD KEY `Admin_User_id` (`Admin_User_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`User_id`),
  ADD KEY `Admin_User_id` (`Admin_User_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`User_id`),
  ADD KEY `Admin_User_id` (`Admin_User_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`);

--
-- Constraints for table `ambulance`
--
ALTER TABLE `ambulance`
  ADD CONSTRAINT `ambulance_ibfk_1` FOREIGN KEY (`Admin_User_id`) REFERENCES `admin` (`User_id`);

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`Patient_User_id`) REFERENCES `patient` (`User_id`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`Doctor_User_id`) REFERENCES `doctor` (`User_id`);

--
-- Constraints for table `bloodbank`
--
ALTER TABLE `bloodbank`
  ADD CONSTRAINT `bloodbank_ibfk_1` FOREIGN KEY (`Admin_User_id`) REFERENCES `admin` (`User_id`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`),
  ADD CONSTRAINT `doctor_ibfk_2` FOREIGN KEY (`Admin_User_id`) REFERENCES `admin` (`User_id`);

--
-- Constraints for table `hospital`
--
ALTER TABLE `hospital`
  ADD CONSTRAINT `hospital_ibfk_1` FOREIGN KEY (`Hospital_id`) REFERENCES `hospital_location` (`Hospital_id`),
  ADD CONSTRAINT `hospital_ibfk_2` FOREIGN KEY (`Admin_User_id`) REFERENCES `users` (`User_id`);

--
-- Constraints for table `others_normal_user`
--
ALTER TABLE `others_normal_user`
  ADD CONSTRAINT `others_normal_user_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`),
  ADD CONSTRAINT `others_normal_user_ibfk_2` FOREIGN KEY (`Admin_User_id`) REFERENCES `admin` (`User_id`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`),
  ADD CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`Admin_User_id`) REFERENCES `admin` (`User_id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `users` (`User_id`),
  ADD CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`Admin_User_id`) REFERENCES `admin` (`User_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
