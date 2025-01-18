-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2025 at 03:49 PM
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
-- Database: `commondb1`
--

-- --------------------------------------------------------

--
-- Table structure for table `assigntraining`
--

CREATE DATABASE AAKARERP;

USE AAKARERP;

CREATE TABLE `assigntraining` (
  `employeeId` int(10) UNSIGNED DEFAULT NULL,
  `employeeName` varchar(50) NOT NULL,
  `skillName` varchar(50) DEFAULT NULL,
  `skillId` tinyint(3) UNSIGNED DEFAULT NULL,
  `grade` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `employeeId` int(10) UNSIGNED DEFAULT NULL,
  `sessionId` tinyint(3) UNSIGNED DEFAULT NULL,
  `attendanceStatus` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`employeeId`, `sessionId`, `attendanceStatus`) VALUES
(1, 1, 1),
(1, 2, 1),
(2, 1, 1),
(2, 2, 1),
(6, 5, 1),
(6, 6, 1),
(7, 5, 1),
(7, 6, 1),
(11, 9, 1),
(11, 10, 1),
(12, 9, 1),
(12, 10, 1),
(16, 13, 1),
(16, 14, 1),
(17, 13, 1),
(17, 14, 1),
(21, 17, 1),
(21, 18, 1),
(22, 17, 1),
(22, 18, 1);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `departmentId` tinyint(3) UNSIGNED NOT NULL,
  `departmentName` varchar(50) NOT NULL,
  `departmentStartDate` date DEFAULT NULL,
  `departmentEndDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`departmentId`, `departmentName`, `departmentStartDate`, `departmentEndDate`) VALUES
(1, 'HR', NULL, NULL),
(2, 'IT', NULL, NULL),
(3, 'Finance', NULL, NULL),
(4, 'Sales', NULL, NULL),
(5, 'Marketing', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departmentskill`
--

CREATE TABLE `departmentskill` (
  `skillId` tinyint(3) UNSIGNED NOT NULL,
  `departmentId` tinyint(3) UNSIGNED NOT NULL,
  `departmentSkillType` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `departmentSkillStatus` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departmentskill`
--

INSERT INTO `departmentskill` (`skillId`, `departmentId`, `departmentSkillType`, `departmentSkillStatus`) VALUES
(1, 1, 3, 1),
(2, 1, 3, 1),
(3, 1, 3, 1),
(4, 1, 3, 1),
(5, 1, 1, 1),
(6, 2, 1, 1),
(7, 2, 3, 1),
(8, 2, 3, 1),
(9, 2, 2, 1),
(10, 2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `designationId` tinyint(3) UNSIGNED NOT NULL,
  `designationName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`designationId`, `designationName`) VALUES
(1, 'Admin'),
(2, 'HOD'),
(3, 'Executive'),
(4, 'Assignee');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeId` int(10) UNSIGNED NOT NULL,
  `customEmployeeId` varchar(50) NOT NULL,
  `employeeName` varchar(100) NOT NULL,
  `companyName` varchar(100) NOT NULL,
  `employeeQualification` varchar(100) DEFAULT NULL,
  `experienceInYears` int(11) DEFAULT NULL,
  `employeeDOB` date DEFAULT NULL,
  `employeeJoinDate` date DEFAULT NULL,
  `employeeGender` enum('Male','Female','Other') NOT NULL,
  `employeePhone` varchar(20) DEFAULT NULL,
  `employeeEmail` varchar(100) DEFAULT NULL,
  `employeePassword` varchar(255) NOT NULL,
  `employeeAccess` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `employeeRefreshToken` varchar(255) DEFAULT NULL,
  `employeeEndDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employeeId`, `customEmployeeId`, `employeeName`, `companyName`, `employeeQualification`, `experienceInYears`, `employeeDOB`, `employeeJoinDate`, `employeeGender`, `employeePhone`, `employeeEmail`, `employeePassword`, `employeeAccess`, `createdAt`, `employeeRefreshToken`, `employeeEndDate`) VALUES
(1, 'EMP01', 'Aarav Verma', 'Company A', 'MBA', 5, NULL, NULL, 'Male', '1234567890', 'aarav.verma@example.com', '$2a$12$KJmi6f8bKQ6SHZteWdbobe8xsr4B7o7o91pIJQXur.IMD4Mni3Sgu', '11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,00011111111111111111111111111111111111111111111111', '2025-01-16 17:25:22', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjdXN0b21FbXBsb3llZUlkIjoiRU1QMDEiLCJlbXBsb3llZUVtYWlsIjoiYWFyYXYudmVybWFAZXhhbXBsZS5jb20iLCJpYXQiOjE3MzcxMDUwODQsImV4cCI6MTczOTY5NzA4NH0.DCu0AZtF2Z3wJIcxafxbMmeHyC5stuhTNQQKoZ6vDpc', NULL),
(2, 'EMP02', 'Bharat Singh', 'Company A', 'B.Sc', 4, NULL, NULL, 'Male', '1234567891', 'bharat.singh@example.com', '$2a$12$DLUSzfU9lH2enIbucXB.kOClizYio1eLXh9WW8iDpBzS3wFmbbCm6', '11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,00111111111111111111111111111111111111111111111111', '2025-01-16 17:25:22', NULL, NULL),
(3, 'EMP03', 'Chitra Kapoor', 'Company A', 'B.Com', 3, NULL, NULL, 'Female', '1234567892', 'chitra.kapoor@example.com', '$2a$12$9A211otjuwmjTrPq1hSmQeDVWp33SmZjIhFq.tN1jbbVUAgYbBRoK', '11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,01011111111111111111111111111111111111111111111111', '2025-01-16 17:25:22', NULL, NULL),
(4, 'EMP04', 'Devansh Rao', 'Company A', 'B.Tech', 2, NULL, NULL, 'Male', '1234567893', 'devansh.rao@example.com', '$2a$12$Ls3SV9h35m.1wJsdI.jP/.43WQBg9KPqdhxh2nnMydOWcWBgATVgW', '11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,01111111111111111111111111111111111111111111111111', '2025-01-16 17:25:22', NULL, NULL),
(5, 'EMP05', 'Esha Sharma', 'Company A', 'M.Sc', 1, NULL, NULL, 'Female', '1234567894', 'esha.sharma@example.com', '$2a$12$38GDGYNAcK6X1wBLhoPRauyiI8ITzItS/7ImQh2EkGPVIpDWeH5YO', '11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,10011111111111111111111111111111111111111111111111', '2025-01-16 17:25:22', NULL, NULL),
(6, 'EMP06', 'Farhan Khan', 'Company B', 'MBA', 5, NULL, NULL, 'Male', '1234567895', 'farhan.khan@example.com', '$2a$12$wOsb2QDcWb2D5sdzuov/Lu26FaXa37eCKdq2A0okTzQ/.nhr9A5bS', '11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,10111111111111111111111111111111111111111111111111', '2025-01-16 17:25:22', NULL, NULL),
(7, 'EMP07', 'Garima Joshi', 'Company B', 'B.Sc', 4, NULL, NULL, 'Female', '1234567896', 'garima.joshi@example.com', '$2a$12$5aZToBKlDxG8jGcgvXlX9eIrSjLssc7mAoPY6xIDml1b.o/5iLzNa', '11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11011111111111111111111111111111111111111111111111', '2025-01-16 17:25:22', NULL, NULL),
(8, 'EMP08', 'Harshit Patel', 'Company B', 'B.Com', 3, NULL, NULL, 'Male', '1234567897', 'harshit.patel@example.com', '$2a$12$kuNy1l9MkFqUTSWwi2aSRO2CBi7MBDqLuyuOKJzHTe/q153blV40C', '11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111', '2025-01-16 17:25:22', NULL, NULL),
(9, 'EMP09', 'Ishita Nair', 'Company B', 'B.Tech', 2, NULL, NULL, 'Female', '1234567898', 'ishita.nair@example.com', '$2a$12$pVXBXIPELxafQ2VRYmTQnOMah7Pc0DZ6dIfqV8E0oXOB9ag1dS3oe', '11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111', '2025-01-16 17:25:22', NULL, NULL),
(10, 'EMP10', 'Jayant Sen', 'Company B', 'M.Sc', 1, NULL, NULL, 'Male', '1234567899', 'jayant.sen@example.com', '$2a$12$7egRxyahtH5j1joNSGMM0.JPLje9WUxDUhXGzchksnixaXKcuYo4K', '11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111', '2025-01-16 17:25:22', NULL, NULL),
(11, 'EMP11', 'Kabir Das', 'Company C', 'MBA', 5, NULL, NULL, 'Male', '1234567800', 'kabir.das@example.com', '$2a$12$visiX7FOF.evL2LkAv8.Ue6qMyiz4re63oRnFz1evtWopE/Nj8Lme', '11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111', '2025-01-16 17:25:22', NULL, NULL),
(12, 'EMP12', 'Lavanya Pillai', 'Company C', 'B.Sc', 4, NULL, NULL, 'Female', '1234567801', 'lavanya.pillai@example.com', '$2a$12$ShpUQSFC68HqHL7EQqEs.e69.8qOVpUra3GZnYrXXoFyjwVao7TXS', '11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111', '2025-01-16 17:25:22', NULL, NULL),
(13, 'EMP13', 'Meera Krishnan', 'Company C', 'B.Com', 3, NULL, NULL, 'Female', '1234567802', 'meera.krishnan@example.com', '$2a$12$i54KwmdiqvpP1mUBtYx1QuJjUdsuWlMbmJ/5hGz6hX7c2R9HMAUo2', '11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111', '2025-01-16 17:25:22', NULL, NULL),
(14, 'EMP14', 'Nikhil Aggarwal', 'Company C', 'B.Tech', 2, NULL, NULL, 'Male', '1234567803', 'nikhil.aggarwal@example.com', '$2a$12$fRmOAh/Q1yoqxe7VF/QkMe.NvotgP2poBfTEFcvGOLD4FrslJxlRy', '11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111', '2025-01-16 17:25:22', NULL, NULL),
(15, 'EMP15', 'Omkar Jain', 'Company C', 'M.Sc', 1, NULL, NULL, 'Male', '1234567804', 'omkar.jain@example.com', '$2a$12$DZGTRXtv/0U71MOaXQSGqu/T2JboK3z4mC4mD6Ngl2/f3tAOsnN9K', '11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111', '2025-01-16 17:25:22', NULL, NULL),
(16, 'EMP16', 'Arjun Malhotra', 'Company D', 'MBA', 5, NULL, NULL, 'Male', '1234567805', 'arjun.malhotra@example.com', 'arjun', '11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111', '2025-01-16 17:25:22', NULL, NULL),
(17, 'EMP17', 'Rohan Gupta', 'Company D', 'B.Sc', 4, NULL, NULL, 'Male', '1234567806', 'rohan.gupta@example.com', '$2a$12$u4KhwLI1VJy0XrGgG1YixuTKDiSw0mFDoxwfQFE6z/vKlJjTlgWsK', '11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111', '2025-01-16 17:25:22', NULL, NULL),
(18, 'EMP18', 'Sneha Mehta', 'Company D', 'B.Com', 3, NULL, NULL, 'Female', '1234567807', 'sneha.mehta@example.com', '$2a$12$QXH0HHegPWkq5viJKYOUs.vB60mcw1IKiIu1aplcWZaZilHfaPzR2', '11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111', '2025-01-16 17:25:22', NULL, NULL),
(19, 'EMP19', 'Tarun Iyer', 'Company D', 'B.Tech', 2, NULL, NULL, 'Male', '1234567808', 'tarun.iyer@example.com', '$2a$12$SFV3FZ9.3W9yIC8OQyV/cu9pUM8U8dJk409UWPj6Ybn3.onR5IAHC', '11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111', '2025-01-16 17:25:22', NULL, NULL),
(20, 'EMP20', 'Uma Sharma', 'Company D', 'M.Sc', 1, NULL, NULL, 'Female', '1234567809', 'uma.sharma@example.com', '$2a$12$6vAl7uYv0dbSB.GoIoUQPu7KA3sIJLy0Kh2K9sKRMU9vabzkWP6F2', '11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111', '2025-01-16 17:25:22', NULL, NULL),
(21, 'EMP056', 'Krishna Magar', 'VIIT', 'Graduate', 2, '2004-06-24', '2025-01-13', 'Male', ' 4578963245', 'krishna.magar@viit.ac.in', '$2b$10$jThsAoIMblydX7o.qjM7aOHHFg2hYCaU/cz4Mqmnj4VALy2wI8ALO', '11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111', '2025-01-16 17:40:00', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjdXN0b21FbXBsb3llZUlkIjoiRU1QMDU2IiwiZW1wbG95ZWVFbWFpbCI6ImtyaXNobmEubWFnYXJAdmlpdC5hYy5pbiIsImlhdCI6MTczNzExMTk1NCwiZXhwIjoxNzM5NzAzOTU0fQ.7gH466T5QCHE53b-AWebi6y-B5Pl94TN_Fgbfe1Svi0', NULL),
(58, '22', 'Rajesh Verma', 'mahindra', 'Diploma', 12, '1989-01-16', '2024-09-09', 'Male', '321456789', 'rajesh.verma@viit.ac.in', '$2b$10$zu/.TJ/4GEdffaI9dpWUTeUg31Y2EpT8G4DuzMhoIrm1b3nNPn.1u', '1111101110011000000000000000000000000000000000000000,1100101010000000000000000000000000000000000000000000,0000000000000000000000000000000000000000000000000000,0000000000000000000000000000000000000000000000000000', '2025-01-17 05:46:14', NULL, NULL),
(59, '12', 'test', 'mahindra', '10th', 2, '2025-01-08', '2025-01-09', '', '12345', 'rajesh.verma@viit.in', '$2b$10$zyfoXewE7.PFkc57JCpEFei.WVrZ2DCq15/vXKsTJE6IwP2BSCGca', '0000000000000000000000000000000000000000000000000000,1111111110000000000000000000000000000000000000000000,0000000000000000000000000000000000000000000000000000,0000000000000000000000000000000000000000000000000000', '2025-01-17 10:52:58', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjdXN0b21FbXBsb3llZUlkIjoiMTIiLCJlbXBsb3llZUVtYWlsIjoicmFqZXNoLnZlcm1hQHZpaXQuaW4iLCJpYXQiOjE3MzcxMTE1OTUsImV4cCI6MTczOTcwMzU5NX0.6Af3NJkfpNSDJc5xz3Di72NwyVefK7flKDGLkOCTERU', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employeedesignation`
--

CREATE TABLE `employeedesignation` (
  `employeeDesignationId` int(10) UNSIGNED NOT NULL,
  `employeeId` int(10) UNSIGNED DEFAULT NULL,
  `departmentId` tinyint(3) UNSIGNED DEFAULT NULL,
  `designationId` tinyint(3) UNSIGNED DEFAULT NULL,
  `managerId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employeedesignation`
--

INSERT INTO `employeedesignation` (`employeeDesignationId`, `employeeId`, `departmentId`, `designationId`, `managerId`) VALUES
(1, 1, 1, 1, NULL),
(2, 58, 3, 2, 8),
(3, 59, 3, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `employeeskill`
--

CREATE TABLE `employeeskill` (
  `employeeId` int(10) UNSIGNED NOT NULL,
  `skillId` tinyint(3) UNSIGNED NOT NULL,
  `grade` tinyint(3) UNSIGNED DEFAULT NULL,
  `skillTrainingResult` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employeeskill`
--

INSERT INTO `employeeskill` (`employeeId`, `skillId`, `grade`, `skillTrainingResult`) VALUES
(1, 1, 1, 0),
(1, 2, 2, 0),
(1, 3, 3, 0),
(1, 4, 4, 0),
(2, 1, 1, 0),
(2, 2, 2, 0),
(2, 3, 3, 0),
(2, 4, 4, 0),
(3, 1, 1, 0),
(3, 2, 2, 0),
(3, 3, 3, 0),
(3, 4, 4, 0),
(4, 1, 1, 0),
(4, 2, 2, 0),
(4, 3, 3, 0),
(4, 4, 4, 0),
(5, 1, 1, 0),
(5, 2, 2, 0),
(5, 3, 3, 0),
(5, 4, 4, 0),
(6, 5, 1, 0),
(6, 6, 2, 0),
(6, 7, 3, 0),
(6, 8, 4, 0),
(7, 5, 1, 0),
(7, 6, 2, 0),
(7, 7, 3, 0),
(7, 8, 4, 0),
(8, 5, 1, 0),
(8, 6, 2, 0),
(8, 7, 3, 0),
(8, 8, 4, 0),
(9, 5, 1, 0),
(9, 6, 2, 0),
(9, 7, 3, 0),
(9, 8, 4, 0),
(10, 5, 1, 0),
(10, 6, 2, 0),
(10, 7, 3, 0),
(10, 8, 4, 0),
(11, 9, 1, 0),
(11, 10, 2, 0),
(11, 11, 3, 0),
(11, 12, 4, 0),
(12, 9, 1, 0),
(12, 10, 2, 0),
(12, 11, 3, 0),
(12, 12, 4, 0),
(13, 9, 1, 0),
(13, 10, 2, 0),
(13, 11, 3, 0),
(13, 12, 4, 0),
(14, 9, 1, 0),
(14, 10, 2, 0),
(14, 11, 3, 0),
(14, 12, 4, 0),
(15, 9, 1, 0),
(15, 10, 2, 0),
(15, 11, 3, 0),
(15, 12, 4, 0),
(16, 13, 1, 0),
(16, 14, 2, 0),
(16, 15, 3, 0),
(16, 16, 4, 0),
(17, 13, 1, 0),
(17, 14, 2, 0),
(17, 15, 3, 0),
(17, 16, 4, 0),
(18, 13, 1, 0),
(18, 14, 2, 0),
(18, 15, 3, 0),
(18, 16, 4, 0),
(19, 13, 1, 0),
(19, 14, 2, 0),
(19, 15, 3, 0),
(19, 16, 4, 0),
(20, 13, 1, 0),
(20, 14, 2, 0),
(20, 15, 3, 0),
(20, 16, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `projectNumber` int(10) UNSIGNED NOT NULL,
  `companyName` varchar(255) NOT NULL,
  `dieName` varchar(255) NOT NULL,
  `dieNumber` varchar(11) NOT NULL,
  `projectStatus` varchar(255) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `projectType` varchar(255) NOT NULL,
  `projectPOLink` varchar(255) NOT NULL,
  `projectDesignDocLink` varchar(255) NOT NULL,
  `projectCreatedBy` int(10) UNSIGNED DEFAULT NULL,
  `updateReason` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `historyOf` int(10) UNSIGNED DEFAULT NULL,
  `progress` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`projectNumber`, `companyName`, `dieName`, `dieNumber`, `projectStatus`, `startDate`, `endDate`, `projectType`, `projectPOLink`, `projectDesignDocLink`, `projectCreatedBy`, `updateReason`, `timestamp`, `historyOf`, `progress`) VALUES
(1, 'Beta Inc.', 'Die', 'number', 'Pending', '2025-01-01', '2025-01-31', 'Existing Product Update', '1737055363920.pdf', '1737055363921.pdf', 21, NULL, '2025-01-14 23:22:43', NULL, 3),
(3, 'mahindra', 'Die', '1001', 'Pending', '2024-12-01', '2024-12-31', 'Existing Product Update', '1735647430907.png', '1735647430910.png', 1, NULL, '2024-12-28 23:47:10', NULL, 50),
(5, 'HOLD', 'SUPPORT BKT-B MOUNT(LPDC)', 'number', 'Overdue', '2024-08-01', '2024-11-28', 'New Product', '1733107793812.pdf', '1727967611597.docx', 2, '', '2024-08-26 06:40:17', NULL, 53),
(12, 'FLEET GUARD', 'QSK HEAD (GDC)', '1012', 'Completed', '2024-09-01', '2024-09-04', 'New Product', '', '', 3, NULL, '2024-08-30 16:50:29', NULL, 75),
(13, 'Beta Inc.', 'motor', 'Die A', 'Pending', '2024-12-01', '2024-12-31', 'P', '1733198091036.pdf', '1733198091040.docx', 4, NULL, '2024-12-01 07:54:51', NULL, 15),
(14, 'GREAVES', 'CYL HD COVER BS IV(CORE BOX)', '1014', 'Completed', '2024-09-04', '2024-09-07', 'New Product', '', '', 5, NULL, '2024-09-02 14:50:29', NULL, 5),
(15, 'BAJAJ', 'SUPPORT BKT-B MOUNT(LPDC)', '1004', 'Pending', '2024-12-01', '2024-12-31', 'Existing Product Update', '1733112639945.pdf', '1733112639950.pdf', 6, NULL, '2024-12-01 06:10:39', NULL, 20),
(20, 'BAJAJ', 'BRACKET UPPER E101(GDC)', '1020', 'Pending', '2024-09-10', '2024-09-13', 'New Product', '', '', 7, NULL, '2024-09-09 18:20:29', NULL, 0),
(22, 'M&M', 'PIPE WATER PUMP INLET(DIE)', '1022', 'Pending', '2024-09-12', '2024-09-15', 'New Product', '', '', 8, NULL, '2024-09-11 18:20:29', NULL, 0),
(24, 'GREAVES', 'CYL HD COVER (SINGLE CAVITY)', '1024', 'Completed', '2024-09-14', '2024-09-17', 'New Product', '', '', 9, NULL, '2024-09-13 12:50:29', NULL, 100),
(25, 'FLEET GUARD', 'LUBE OIL COOLER (LPDC)', '1025', 'Pending', '2024-09-15', '2024-09-18', 'New Product', '', '', 10, NULL, '2024-09-14 18:20:29', NULL, 0),
(44, 'mahindra', 'motor', '12', 'Overdue', '2024-08-20', '2024-08-22', 'H', '', '', 11, NULL, '2024-08-20 00:25:15', NULL, 0),
(101, 'KB', 'OEF-2 FILTER BOWL (LPDC)', '1010', 'Pending', '2024-08-29', '2024-09-01', 'New Product', '', '', 12, NULL, '2024-08-28 18:20:29', NULL, 0),
(103, 'TML', 'B MOUNT BKT ASSY', '1013', 'Pending', '2024-09-03', '2024-09-06', 'New Product', '', '', 13, NULL, '2024-09-02 18:20:29', NULL, 0),
(123, 'HOLD', 'PIPE WATER PUMP INLET(DIE)', '1005', 'Completed', '2024-09-19', '2024-09-18', 'H', '', '', 14, NULL, '2024-09-19 05:47:44', NULL, 0),
(126, 'fb', 'Die', '1001', 'Overdue', '2024-08-20', '2024-08-23', 'Existing Product Update', '', '', 15, NULL, '2024-08-20 00:35:10', NULL, 0),
(203, 'tata', 'Die B', '1001', 'Pending', '2024-08-20', '2024-08-30', 'p', '', '', 16, NULL, '2024-08-20 00:24:17', NULL, 0),
(1232, 'KOEL', 'SUPPORT BKT-B MOUNT(LPDC)', 'Die WEB', 'Completed', '2024-08-07', '2024-08-12', 'New Product', '', '', 17, NULL, '2024-08-26 00:39:02', NULL, 0),
(1233, 'M&M', 'PIPE WATER PUMP INLET(DIE)', '123', 'Completed', '2024-09-03', '2024-09-06', 'H', '', '', 18, NULL, '2024-09-19 05:32:01', NULL, 0),
(1234, 'xyz', 'test', '12', 'Pending', '2025-01-17', '2025-01-31', 'H', '1737111366417.xlsx', '1737111366419.xlsx', 1, NULL, '2025-01-17 10:56:06', NULL, 0),
(10001, 'M&M', 'SUPPORT BKT-B MOUNT(LPDC)', '123', 'Completed', '2024-08-26', '2024-08-30', 'New Product', '', '', 19, NULL, '2024-08-26 05:41:08', NULL, 0),
(10000001, 'Beta Inc.', 'Die', '1001', 'Pending', '2025-01-01', '2025-01-31', 'Existing Product Update', '1737055363920.pdf', '1737055363921.pdf', 21, 'die changed', '2025-01-16 19:23:08', 1, 50),
(20000001, 'Beta Inc.', 'Die', 'number', 'Pending', '2025-01-01', '2025-01-31', 'Existing Product Update', '1737055363920.pdf', '1737055363921.pdf', 21, 'Progress Updated', '2025-01-16 19:45:05', 1, 50),
(30000001, 'Beta Inc.', 'Die', 'number', 'Pending', '2025-01-01', '2025-01-31', 'Existing Product Update', '1737055363920.pdf', '1737055363921.pdf', 21, 'Progress Updated', '2025-01-16 19:45:25', 1, 50),
(40000001, 'Beta Inc.', 'Die', 'number', 'Pending', '2025-01-01', '2025-01-31', 'Existing Product Update', '1737055363920.pdf', '1737055363921.pdf', 21, 'Progress Updated', '2025-01-16 19:47:50', 1, 50),
(50000001, 'Beta Inc.', 'Die', 'number', 'Pending', '2025-01-01', '2025-01-31', 'Existing Product Update', '1737055363920.pdf', '1737055363921.pdf', 21, 'Stage: Planning, Substage: Design, Reason: new stage; Substage: EWO, Reason: new stage; Substage: DIE CORRECTION, Reason: new substage', '2025-01-16 20:16:32', 1, 40),
(60000001, 'Beta Inc.', 'Die', 'number', 'Pending', '2025-01-01', '2025-01-31', 'Existing Product Update', '1737055363920.pdf', '1737055363921.pdf', 21, 'Stage: Planning, duration extended', '2025-01-16 20:34:22', 1, 36),
(70000001, 'Beta Inc.', 'Die', 'number', 'Pending', '2025-01-01', '2025-01-31', 'Existing Product Update', '1737055363920.pdf', '1737055363921.pdf', 21, 'Progress Updated', '2025-01-17 04:12:34', 1, 36),
(80000001, 'Beta Inc.', 'Die', 'number', 'Pending', '2025-01-01', '2025-01-31', 'Existing Product Update', '1737055363920.pdf', '1737055363921.pdf', 21, 'Stage: Design, Substage: Planning, Reason: new', '2025-01-17 04:28:19', 1, 30);

-- --------------------------------------------------------

--
-- Table structure for table `selectedassigntraining`
--

CREATE TABLE `selectedassigntraining` (
  `employeeId` int(10) UNSIGNED NOT NULL,
  `skillId` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `selectedassigntraining`
--

INSERT INTO `selectedassigntraining` (`employeeId`, `skillId`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(6, 5),
(6, 6),
(7, 5),
(7, 6),
(11, 9),
(11, 10),
(12, 9),
(12, 10),
(16, 13);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `sessionId` tinyint(3) UNSIGNED NOT NULL,
  `sessionName` varchar(55) NOT NULL,
  `sessionDate` date DEFAULT NULL,
  `sessionStartTime` time DEFAULT NULL,
  `sessionEndTime` time DEFAULT NULL,
  `trainingId` int(10) UNSIGNED DEFAULT NULL,
  `sessionDescription` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`sessionId`, `sessionName`, `sessionDate`, `sessionStartTime`, `sessionEndTime`, `trainingId`, `sessionDescription`) VALUES
(1, 'Session 1A', '2023-05-02', '09:00:00', '10:00:00', 1, NULL),
(2, 'Session 1B', '2023-05-03', '11:00:00', '12:00:00', 1, NULL),
(3, 'Session 2A', '2023-07-02', '09:00:00', '10:00:00', 2, NULL),
(4, 'Session 2B', '2023-07-03', '11:00:00', '12:00:00', 2, NULL),
(5, 'Session 3A', '2023-05-02', '09:00:00', '10:00:00', 5, NULL),
(6, 'Session 3B', '2023-05-03', '11:00:00', '12:00:00', 5, NULL),
(7, 'Session 4A', '2023-07-02', '09:00:00', '10:00:00', 6, NULL),
(8, 'Session 4B', '2023-07-03', '11:00:00', '12:00:00', 6, NULL),
(9, 'Session 5A', '2023-05-02', '09:00:00', '10:00:00', 9, NULL),
(10, 'Session 5B', '2023-05-03', '11:00:00', '12:00:00', 9, NULL),
(11, 'Session 6A', '2023-07-02', '09:00:00', '10:00:00', 10, NULL),
(12, 'Session 6B', '2023-07-03', '11:00:00', '12:00:00', 10, NULL),
(13, 'Session 7A', '2023-05-02', '09:00:00', '10:00:00', 13, NULL),
(14, 'Session 7B', '2023-05-03', '11:00:00', '12:00:00', 13, NULL),
(15, 'Session 8A', '2023-07-02', '09:00:00', '10:00:00', 14, NULL),
(16, 'Session 8B', '2023-07-03', '11:00:00', '12:00:00', 14, NULL),
(17, 'Session 9A', '2023-05-02', '09:00:00', '10:00:00', 17, NULL),
(18, 'Session 9B', '2023-05-03', '11:00:00', '12:00:00', 17, NULL),
(19, 'Session 10A', '2023-07-02', '09:00:00', '10:00:00', 18, NULL),
(20, 'Session 10B', '2023-07-03', '11:00:00', '12:00:00', 18, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `skillId` tinyint(3) UNSIGNED NOT NULL,
  `skillName` varchar(50) DEFAULT NULL,
  `departmentId` tinyint(3) UNSIGNED DEFAULT 0,
  `skillAddedBy` varchar(50) DEFAULT NULL,
  `departmentIdGivingTraining` tinyint(3) UNSIGNED DEFAULT 0,
  `skillDescription` varchar(200) DEFAULT NULL,
  `skillStartDate` date DEFAULT NULL,
  `skillEndDate` date DEFAULT NULL,
  `skillActivityStatus` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skill`
--

INSERT INTO `skill` (`skillId`, `skillName`, `departmentId`, `skillAddedBy`, `departmentIdGivingTraining`, `skillDescription`, `skillStartDate`, `skillEndDate`, `skillActivityStatus`) VALUES
(1, 'Recruitment', 1, 'Alice Johnson', 1, 'Skill related to recruitment processes', '2023-01-01', '2023-06-01', 1),
(2, 'Employee Relations', 1, 'Alice Johnson', 1, 'Skill for managing employee relations', '2023-02-01', '2023-07-01', 1),
(3, 'Payroll Management', 1, 'Alice Johnson', 1, 'Skill in payroll processing', '2023-03-01', '2023-08-01', 1),
(4, 'Training & Development', 1, 'Alice Johnson', 1, 'Skill in training employees', '2023-04-01', '2023-09-01', 1),
(5, 'Java Programming', 2, 'Frank White', 2, 'Skill in Java programming', '2023-01-01', '2023-06-01', 1),
(6, 'Web Development', 2, 'Frank White', 2, 'Skill in web development', '2023-02-01', '2023-07-01', 1),
(7, 'Database Management', 2, 'Frank White', 2, 'Skill in database management', '2023-03-01', '2023-08-01', 1),
(8, 'Network Security', 2, 'Frank White', 2, 'Skill in network security', '2023-04-01', '2023-09-01', 1),
(9, 'Financial Analysis', 3, 'Liam Taylor', 3, 'Skill in financial analysis', '2023-01-01', '2023-06-01', 1),
(10, 'Budgeting', 3, 'Liam Taylor', 3, 'Skill in budgeting processes', '2023-02-01', '2023-07-01', 1),
(11, 'Taxation', 3, 'Liam Taylor', 3, 'Skill in taxation regulations', '2023-03-01', '2023-08-01', 1),
(12, 'Investment Strategies', 3, 'Liam Taylor', 3, 'Skill in investment strategies', '2023-04-01', '2023-09-01', 1),
(13, 'Sales Strategies', 4, 'Quinn Martin', 4, 'Skill in sales strategies', '2023-01-01', '2023-06-01', 1),
(14, 'Customer Relationship', 4, 'Quinn Martin', 4, 'Skill in customer relationship management', '2023-02-01', '2023-07-01', 1),
(15, 'Market Research', 4, 'Quinn Martin', 4, 'Skill in market research techniques', '2023-03-01', '2023-08-01', 1),
(16, 'Negotiation Skills', 4, 'Quinn Martin', 4, 'Skill in negotiation techniques', '2023-04-01', '2023-09-01', 1),
(17, 'Digital Marketing', 5, 'Victor Walker', 5, 'Skill in digital marketing', '2023-01-01', '2023-06-01', 1),
(18, 'Content Creation', 5, 'Victor Walker', 5, 'Skill in content creation', '2023-02-01', '2023-07-01', 1),
(19, 'SEO Strategies', 5, 'Victor Walker', 5, 'Skill in SEO strategies', '2023-03-01', '2023-08-01', 1),
(20, 'Social Media Management', 5, 'Victor Walker', 5, 'Skill in social media management', '2023-04-01', '2023-09-01', 1);

-- --------------------------------------------------------

--
-- Table structure for table `stage`
--

CREATE TABLE `stage` (
  `stageId` int(10) UNSIGNED NOT NULL,
  `projectNumber` int(10) UNSIGNED NOT NULL,
  `stageName` varchar(255) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `owner` int(10) UNSIGNED DEFAULT NULL,
  `machine` varchar(255) NOT NULL,
  `duration` int(11) NOT NULL,
  `seqPrevStage` int(10) UNSIGNED DEFAULT NULL,
  `createdBy` int(10) UNSIGNED DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `historyOf` int(10) UNSIGNED DEFAULT NULL,
  `updateReason` text DEFAULT NULL,
  `progress` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stage`
--

INSERT INTO `stage` (`stageId`, `projectNumber`, `stageName`, `startDate`, `endDate`, `owner`, `machine`, `duration`, `seqPrevStage`, `createdBy`, `timestamp`, `historyOf`, `updateReason`, `progress`) VALUES
(2, 1, 'Design', '2025-01-15', '2025-01-31', 15, '', 25, NULL, 21, '2025-01-16 14:17:50', NULL, NULL, 3),
(3, 1, 'Planning', '2025-01-01', '2025-01-15', 12, 'VMC2', 20, NULL, 21, '2025-01-16 20:16:31', 1, 'Substage: Design, Reason: new stage; Substage: EWO, Reason: new stage; Substage: DIE CORRECTION, Reason: new substage', 50),
(4, 1, 'Planning', '2025-01-01', '2025-01-15', 12, 'VMC2', 20, NULL, 21, '2025-01-16 20:34:21', 1, 'duration extended', 42),
(5, 1, 'Design', '2025-01-15', '2025-01-31', 15, '', 25, NULL, 21, '2025-01-17 04:28:19', 2, 'Substage: Planning, Reason: new', 30),
(6, 1234, 'sample', '2025-01-01', '2025-01-10', 59, 'VMC2', 20, NULL, 1, '2025-01-17 10:56:06', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `substage`
--

CREATE TABLE `substage` (
  `substageId` int(10) UNSIGNED NOT NULL,
  `stageId` int(10) UNSIGNED NOT NULL,
  `projectNumber` int(10) UNSIGNED NOT NULL,
  `stageName` varchar(255) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `owner` int(10) UNSIGNED NOT NULL,
  `machine` varchar(255) NOT NULL,
  `duration` int(11) NOT NULL,
  `seqPrevStage` int(10) UNSIGNED DEFAULT NULL,
  `createdBy` int(10) UNSIGNED NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `historyOf` int(10) UNSIGNED DEFAULT NULL,
  `updateReason` text DEFAULT NULL,
  `progress` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `substage`
--

INSERT INTO `substage` (`substageId`, `stageId`, `projectNumber`, `stageName`, `startDate`, `endDate`, `owner`, `machine`, `duration`, `seqPrevStage`, `createdBy`, `timestamp`, `historyOf`, `updateReason`, `progress`) VALUES
(4, 2, 1, 'Planning', '2025-01-17', '2025-01-22', 4, 'Machine W', 4, NULL, 21, '2025-01-17 04:28:19', NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `training`
--

CREATE TABLE `training` (
  `trainingId` int(10) UNSIGNED NOT NULL,
  `trainerId` int(10) UNSIGNED DEFAULT NULL,
  `startTrainingDate` date DEFAULT NULL,
  `endTrainingDate` date DEFAULT NULL,
  `skillId` tinyint(3) UNSIGNED DEFAULT NULL,
  `trainingTitle` varchar(50) DEFAULT NULL,
  `evaluationType` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `training`
--

INSERT INTO `training` (`trainingId`, `trainerId`, `startTrainingDate`, `endTrainingDate`, `skillId`, `trainingTitle`, `evaluationType`) VALUES
(1, 1, '2023-05-01', '2023-05-10', 1, 'Recruitment Training', NULL),
(2, 1, '2023-07-01', '2023-07-10', 2, 'Employee Relations Training', NULL),
(3, 1, '2023-06-01', '2023-06-10', 1, 'Recruitment Training', NULL),
(4, 1, '2023-08-01', '2023-08-10', 2, 'Employee Relations Training', NULL),
(5, 2, '2023-05-01', '2023-05-10', 5, 'Java Programming Training', NULL),
(6, 2, '2023-07-01', '2023-07-10', 6, 'Web Development Training', NULL),
(7, 2, '2023-06-01', '2023-06-10', 5, 'Java Programming Training', NULL),
(8, 2, '2023-08-01', '2023-08-10', 6, 'Web Development Training', NULL),
(9, 3, '2023-05-01', '2023-05-10', 9, 'Financial Analysis Training', NULL),
(10, 3, '2023-07-01', '2023-07-10', 10, 'Budgeting Training', NULL),
(11, 3, '2023-06-01', '2023-06-10', 9, 'Financial Analysis Training', NULL),
(12, 3, '2023-08-01', '2023-08-10', 10, 'Budgeting Training', NULL),
(13, 4, '2023-05-01', '2023-05-10', 13, 'Sales Strategies Training', NULL),
(14, 4, '2023-07-01', '2023-07-10', 14, 'Customer Relationship Training', NULL),
(15, 4, '2023-06-01', '2023-06-10', 13, 'Sales Strategies Training', NULL),
(16, 4, '2023-08-01', '2023-08-10', 14, 'Customer Relationship Training', NULL),
(17, 5, '2023-05-01', '2023-05-10', 17, 'Digital Marketing Training', NULL),
(18, 5, '2023-07-01', '2023-07-10', 18, 'Content Creation Training', NULL),
(19, 5, '2023-06-01', '2023-06-10', 17, 'Digital Marketing Training', NULL),
(20, 5, '2023-08-01', '2023-08-10', 18, 'Content Creation Training', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trainingregistration`
--

CREATE TABLE `trainingregistration` (
  `employeeId` int(10) UNSIGNED NOT NULL,
  `trainingId` int(10) UNSIGNED NOT NULL,
  `trainerFeedback` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trainingregistration`
--

INSERT INTO `trainingregistration` (`employeeId`, `trainingId`, `trainerFeedback`) VALUES
(1, 1, NULL),
(1, 2, NULL),
(2, 1, NULL),
(2, 2, NULL),
(6, 5, NULL),
(6, 6, NULL),
(7, 5, NULL),
(7, 6, NULL),
(11, 9, NULL),
(11, 10, NULL),
(12, 9, NULL),
(12, 10, NULL),
(16, 13, NULL),
(16, 14, NULL),
(17, 13, NULL),
(17, 14, NULL),
(21, 17, NULL),
(21, 18, NULL),
(22, 17, NULL),
(22, 18, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trainingskills`
--

CREATE TABLE `trainingskills` (
  `trainingId` int(10) UNSIGNED DEFAULT NULL,
  `skillId` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trainingskills`
--

INSERT INTO `trainingskills` (`trainingId`, `skillId`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(5, 5),
(5, 6),
(6, 5),
(6, 6),
(9, 9),
(9, 10),
(10, 9),
(10, 10),
(13, 13),
(13, 14),
(14, 13),
(14, 14),
(17, 17),
(17, 18),
(18, 17),
(18, 18);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assigntraining`
--
ALTER TABLE `assigntraining`
  ADD KEY `skillId` (`skillId`),
  ADD KEY `employeeId` (`employeeId`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD UNIQUE KEY `employeeId` (`employeeId`,`sessionId`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`departmentId`);

--
-- Indexes for table `departmentskill`
--
ALTER TABLE `departmentskill`
  ADD PRIMARY KEY (`skillId`,`departmentId`,`departmentSkillType`),
  ADD KEY `departmentId` (`departmentId`);

--
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`designationId`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeId`),
  ADD UNIQUE KEY `employeeEmail` (`employeeEmail`);

--
-- Indexes for table `employeedesignation`
--
ALTER TABLE `employeedesignation`
  ADD PRIMARY KEY (`employeeDesignationId`),
  ADD KEY `employeeId` (`employeeId`),
  ADD KEY `departmentId` (`departmentId`),
  ADD KEY `designationId` (`designationId`);

--
-- Indexes for table `employeeskill`
--
ALTER TABLE `employeeskill`
  ADD PRIMARY KEY (`employeeId`,`skillId`),
  ADD KEY `skillId` (`skillId`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`projectNumber`),
  ADD KEY `projectCreatedByForeign` (`projectCreatedBy`),
  ADD KEY `historyOfForeign` (`historyOf`);

--
-- Indexes for table `selectedassigntraining`
--
ALTER TABLE `selectedassigntraining`
  ADD PRIMARY KEY (`employeeId`,`skillId`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sessionId`),
  ADD KEY `trainingId` (`trainingId`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`skillId`);

--
-- Indexes for table `stage`
--
ALTER TABLE `stage`
  ADD PRIMARY KEY (`stageId`),
  ADD KEY `projectNumberForeign` (`projectNumber`),
  ADD KEY `seqPrevStageForeign` (`seqPrevStage`),
  ADD KEY `createdByForeign` (`createdBy`),
  ADD KEY `ownerForeign` (`owner`);

--
-- Indexes for table `substage`
--
ALTER TABLE `substage`
  ADD PRIMARY KEY (`substageId`),
  ADD KEY `substage_stageId_fk` (`stageId`),
  ADD KEY `substage_projectNumber_fk` (`projectNumber`),
  ADD KEY `substage_seqPrevStage_fk` (`seqPrevStage`),
  ADD KEY `fk_owner` (`owner`),
  ADD KEY `fk_createdBy` (`createdBy`);

--
-- Indexes for table `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`trainingId`),
  ADD KEY `skillId` (`skillId`);

--
-- Indexes for table `trainingregistration`
--
ALTER TABLE `trainingregistration`
  ADD PRIMARY KEY (`employeeId`,`trainingId`);

--
-- Indexes for table `trainingskills`
--
ALTER TABLE `trainingskills`
  ADD KEY `trainingId` (`trainingId`),
  ADD KEY `skillId` (`skillId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `departmentId` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `designationId` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employeeId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `employeedesignation`
--
ALTER TABLE `employeedesignation`
  MODIFY `employeeDesignationId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `sessionId` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `skillId` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `stage`
--
ALTER TABLE `stage`
  MODIFY `stageId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `substage`
--
ALTER TABLE `substage`
  MODIFY `substageId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `training`
--
ALTER TABLE `training`
  MODIFY `trainingId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assigntraining`
--
ALTER TABLE `assigntraining`
  ADD CONSTRAINT `assigntraining_ibfk_1` FOREIGN KEY (`skillId`) REFERENCES `skill` (`skillId`),
  ADD CONSTRAINT `assigntraining_ibfk_2` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`);

--
-- Constraints for table `departmentskill`
--
ALTER TABLE `departmentskill`
  ADD CONSTRAINT `departmentskill_ibfk_1` FOREIGN KEY (`skillId`) REFERENCES `skill` (`skillId`),
  ADD CONSTRAINT `departmentskill_ibfk_2` FOREIGN KEY (`departmentId`) REFERENCES `department` (`departmentId`);

--
-- Constraints for table `employeeskill`
--
ALTER TABLE `employeeskill`
  ADD CONSTRAINT `employeeskill_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`),
  ADD CONSTRAINT `employeeskill_ibfk_2` FOREIGN KEY (`skillId`) REFERENCES `skill` (`skillId`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `historyOfForeign` FOREIGN KEY (`historyOf`) REFERENCES `project` (`projectNumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `projectCreatedByForeign` FOREIGN KEY (`projectCreatedBy`) REFERENCES `employee` (`employeeId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`trainingId`) REFERENCES `training` (`trainingId`);

--
-- Constraints for table `stage`
--
ALTER TABLE `stage`
  ADD CONSTRAINT `createdByForeign` FOREIGN KEY (`createdBy`) REFERENCES `employee` (`employeeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ownerForeign` FOREIGN KEY (`owner`) REFERENCES `employee` (`employeeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `projectNumberForeign` FOREIGN KEY (`projectNumber`) REFERENCES `project` (`projectNumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `seqPrevStageForeign` FOREIGN KEY (`seqPrevStage`) REFERENCES `stage` (`stageId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `substage`
--
ALTER TABLE `substage`
  ADD CONSTRAINT `fk_createdBy` FOREIGN KEY (`createdBy`) REFERENCES `employee` (`employeeId`),
  ADD CONSTRAINT `fk_owner` FOREIGN KEY (`owner`) REFERENCES `employee` (`employeeId`),
  ADD CONSTRAINT `substage_projectNumber_fk` FOREIGN KEY (`projectNumber`) REFERENCES `project` (`projectNumber`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `substage_seqPrevStage_fk` FOREIGN KEY (`seqPrevStage`) REFERENCES `substage` (`substageId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `substage_stageId_fk` FOREIGN KEY (`stageId`) REFERENCES `stage` (`stageId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `training`
--
ALTER TABLE `training`
  ADD CONSTRAINT `training_ibfk_1` FOREIGN KEY (`skillId`) REFERENCES `skill` (`skillId`);

--
-- Constraints for table `trainingskills`
--
ALTER TABLE `trainingskills`
  ADD CONSTRAINT `trainingskills_ibfk_1` FOREIGN KEY (`trainingId`) REFERENCES `training` (`trainingId`),
  ADD CONSTRAINT `trainingskills_ibfk_2` FOREIGN KEY (`skillId`) REFERENCES `skill` (`skillId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
