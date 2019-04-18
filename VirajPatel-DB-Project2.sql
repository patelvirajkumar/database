-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2018 at 02:10 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `college database`
--
CREATE DATABASE IF NOT EXISTS `college database` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `college database`;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--
/*Courses Table where Couese_Id is primary key and dep_id is foreign key*/ 
CREATE TABLE `courses` (
  `Course_Id` int(11) NOT NULL,
  `Course_Name` varchar(200) NOT NULL,
  `Duration(Years)` float NOT NULL,
  `Dep_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--
/*DepartmentTable where Dep_Id is primary key */
CREATE TABLE `department` (
  `Dep_Id` int(11) NOT NULL,
  `Dep_Name` varchar(200) NOT NULL,
  `Location` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hod`
--
/* hod Table where Dep_Id and  Inst_id are foreign key*/
CREATE TABLE `hod` (
  `Dep_Id` int(11) NOT NULL,
  `Inst_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--
/*Instructor Table where Inst_Id is primary key and Dep_Id  and Cour_Id are foreign key*/
CREATE TABLE `instructor` (
  `Inst_Id` int(11) NOT NULL,
  `F_Name` varchar(100) NOT NULL,
  `L_Name` varchar(100) NOT NULL,
  `Phone` varchar(250) NOT NULL,
  `Course_Id` int(11) NOT NULL,
  `Dep_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--
/*Student Table where Stud_Id is primary key and Cour_Id is foreign key*/
CREATE TABLE `student` (
  `Stud_Id` int(11) NOT NULL,
  `First_Name` varchar(150) NOT NULL,
  `Last_Name` varchar(150) NOT NULL,
  `Social_Number` int(11) NOT NULL,
  `Course_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`Course_Id`),
  ADD UNIQUE KEY `Dep_Id` (`Dep_Id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Dep_Id`);

--
-- Indexes for table `hod`
--
ALTER TABLE `hod`
  ADD UNIQUE KEY `Dep_Id` (`Dep_Id`),
  ADD KEY `Inst_Id` (`Inst_Id`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`Inst_Id`),
  ADD UNIQUE KEY `Dep_Id` (`Dep_Id`),
  ADD KEY `Course_Id` (`Course_Id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Stud_Id`),
  ADD KEY `First_Name` (`First_Name`),
  ADD KEY `Course_Id` (`Course_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `instructor`
--
ALTER TABLE `instructor`
  MODIFY `Inst_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`Dep_Id`) REFERENCES `department` (`Dep_Id`);

--
-- Constraints for table `hod`
--
ALTER TABLE `hod`
  ADD CONSTRAINT `hod_ibfk_1` FOREIGN KEY (`Dep_Id`) REFERENCES `department` (`Dep_Id`),
  ADD CONSTRAINT `hod_ibfk_2` FOREIGN KEY (`Inst_Id`) REFERENCES `instructor` (`Inst_Id`);

--
-- Constraints for table `instructor`
--
ALTER TABLE `instructor`
  ADD CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`Course_Id`) REFERENCES `courses` (`Course_Id`),
  ADD CONSTRAINT `instructor_ibfk_2` FOREIGN KEY (`Dep_Id`) REFERENCES `department` (`Dep_Id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Course_Id`) REFERENCES `courses` (`Course_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
