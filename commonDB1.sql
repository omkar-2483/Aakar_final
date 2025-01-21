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

 --------------------------------------------------------

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




INSERT INTO `employee` (`employeeId`, `customEmployeeId`, `employeeName`, `companyName`, `employeeQualification`, `experienceInYears`, `employeeDOB`, `employeeJoinDate`, `employeeGender`, `employeePhone`, `employeeEmail`, `employeePassword`, `employeeAccess`, `createdAt`, `employeeRefreshToken`, `employeeEndDate`) VALUES
(1, 'EMP056', 'Krishna Magar', 'VIIT', 'Graduate', 2, '2004-06-24', '2025-01-13', 'Male', ' 4578963245', 'krishna.magar@viit.ac.in', '$2b$10$jThsAoIMblydX7o.qjM7aOHHFg2hYCaU/cz4Mqmnj4VALy2wI8ALO', '11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111,11111111111111111111111111111111111111111111111111', '2025-01-16 17:40:00', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjdXN0b21FbXBsb3llZUlkIjoiRU1QMDU2IiwiZW1wbG95ZWVFbWFpbCI6ImtyaXNobmEubWFnYXJAdmlpdC5hYy5pbiIsImlhdCI6MTczNzExMTk1NCwiZXhwIjoxNzM5NzAzOTU0fQ.7gH466T5QCHE53b-AWebi6y-B5Pl94TN_Fgbfe1Svi0', NULL);
