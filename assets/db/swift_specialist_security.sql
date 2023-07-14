-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2023 at 11:49 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `swift_specialist_security`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `UserID`, `Name`, `DateAdded`) VALUES
(1, 1, 'John', '2023-06-06 07:31:22'),
(2, 2, 'Jane', '2023-06-06 07:31:22');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `ClientID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Contact` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Location` POINT,
  `SquadID` int(11)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`ClientID`, `Name`, `Contact`, `Description`, `DateAdded`) VALUES
(1, 'ABC Corp', '+1 (123) 456-7890', 'ABC Street, New York, A technology company focused on software development.', '2023-04-30 13:16:29'),
(2, 'XYZ Corp', '+1 (987) 654-3210', 'XYZ Road, San Francisco, A technology company focused on hardware manufacturing.', '2023-04-30 13:16:29'),
(4, 'LOOP', '+1 (123) 443-4495', 'LOOP Street, Florida, A technology company focused on Artificial Intelligence.', '2023-04-30 13:39:28');

-- --------------------------------------------------------

--
-- Table structure for table `k9`
--

CREATE TABLE `k9` (
  `k9ID` int(11) NOT NULL,
  `Breed` text NOT NULL,
  `SquadID` int(11) NOT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `MediaID` int(11) NOT NULL,
  `path` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ObjectiveID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `objectives`
--

CREATE TABLE `objectives` (
  `ObjectiveID` int(11) NOT NULL,
  `SquadID` int(11) DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `Activity` varchar(255) DEFAULT NULL,
  `FromTime` datetime DEFAULT NULL,
  `ToTime` datetime DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `DateSet` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `objectives`
--

INSERT INTO `objectives` (`ObjectiveID`, `SquadID`, `Title`, `Activity`, `FromTime`, `ToTime`, `Location`, `DateSet`) VALUES
(2, 1, 'Improve Customer Service', 'Training', '2023-04-15 08:00:00', '2023-04-15 16:00:00', 'Head Office', '2023-04-27 18:59:12'),
(3, 2, 'Increase Sales', 'Marketing Campaign', '2023-04-16 10:00:00', '2023-04-16 16:00:00', 'Outlet 1', '2023-04-27 18:59:12'),
(4, 1, 'Reduce Expenses', 'Process Improvement', '2023-04-17 09:00:00', '2023-04-17 17:00:00', 'Warehouse', '2023-04-27 18:59:12'),
(5, 2, 'Improve Quality', 'Quality Control', '2023-04-18 08:00:00', '2023-04-18 16:00:00', 'Factory', '2023-04-27 18:59:12'),
(6, 1, 'Develop New Product', 'Research and Development', '2023-04-19 10:00:00', '2023-04-19 18:00:00', 'Research Center', '2023-04-27 18:59:12'),
(7, 1, 'Inspection', 'Look around the perimeter for suspecious activity', '2023-05-01 00:00:00', '2023-05-02 00:00:00', 'Client residence', '2023-04-30 07:26:03');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `PaymentID` int(11) NOT NULL,
  `UnitID` int(11) NOT NULL,
  `Role` text NOT NULL,
  `Amount` int(11) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `ReportID` int(11) NOT NULL,
  `ObjectiveID` int(11) DEFAULT NULL,
  `Report` text DEFAULT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`ReportID`, `ObjectiveID`, `Report`, `Date`) VALUES
(1, 2, 'Unit 1 successfully completed the mission', '2023-04-26 14:56:31'),
(2, 3, 'Unit 2 encountered unexpected issues during the mission', '2023-04-26 14:56:31'),
(3, 4, 'Unit 3 exceeded mission objectives', '2023-04-26 14:56:31'),
(4, 5, 'Unit 4 failed to complete mission due to equipment malfunction', '2023-04-26 14:56:31'),
(5, 6, 'Unit 1 encountered enemy fire, mission objectives not achieved', '2023-04-26 14:56:31');

-- --------------------------------------------------------

--
-- Table structure for table `squad`
--

CREATE TABLE `squad` (
  `SquadID` int(11) NOT NULL,
  `SquadName` varchar(50) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `ClientID` int(11) DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `squad`
--

INSERT INTO `squad` (`SquadID`, `SquadName`, `Description`, `ClientID`, `DateAdded`) VALUES
(1, 'Team Alpha', 'Elite team of operatives', 1, '2023-04-30 15:10:42'),
(2, 'Team Bravo', 'Special forces unit', 2, '2023-04-30 15:10:42'),
(3, 'Team Charlie', 'Counter-terrorism unit', 1, '2023-04-30 15:10:42'),
(4, 'Team Delta', 'Intelligence gathering unit', 2, '2023-04-30 15:10:42'),
(5, 'Team Echo', 'Underwater operations team', 1, '2023-04-30 15:10:42');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `UnitID` int(11) NOT NULL,
  `UnitName` varchar(50) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `SquadID` int(11) DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`UnitID`, `UnitName`, `Description`, `SquadID`, `DateAdded`) VALUES
(1, 'Alice Brown', 'Expert in communication', 1, '2023-06-06 07:31:53'),
(2, 'Bob Smith', 'Expert in logistics', 1, '2023-06-06 07:31:53'),
(3, 'Charlie Davis', 'Expert in technology', 2, '2023-06-06 07:31:53'),
(4, 'David Johnson', 'Expert in security', 2, '2023-06-06 07:31:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Username` text DEFAULT NULL,
  `Password` text DEFAULT NULL,
  `LastOnline` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `role` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Username`, `Password`, `LastOnline`, `role`) VALUES
(1, 'john', 'john123', '2023-04-26 09:38:31', 'Admin'),
(2, 'jane', 'jane123', '2023-04-26 09:38:31', 'Admin'),
(3, 'alpha', 'alpha123', '2023-04-26 09:38:57', 'Squad'),
(4, 'beta', 'Beta123', '2023-04-26 09:38:57', 'Squad');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `VehicleID` int(11) NOT NULL,
  `RegistrationNumber` int(11) DEFAULT NULL,
  `SquadID` int(11) DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ClientID`);

--
-- Indexes for table `k9`
--
ALTER TABLE `k9`
  ADD PRIMARY KEY (`k9ID`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`MediaID`),
  ADD KEY `ObjectiveID` (`ObjectiveID`) USING BTREE;

--
-- Indexes for table `objectives`
--
ALTER TABLE `objectives`
  ADD PRIMARY KEY (`ObjectiveID`),
  ADD KEY `SquadID` (`SquadID`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`PaymentID`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`ReportID`),
  ADD KEY `ObjectiveID` (`ObjectiveID`) USING BTREE;

--
-- Indexes for table `squad`
--
ALTER TABLE `squad`
  ADD PRIMARY KEY (`SquadID`),
  ADD KEY `ClientID` (`ClientID`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`UnitID`),
  ADD KEY `SquadID` (`SquadID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`VehicleID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `ClientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `k9`
--
ALTER TABLE `k9`
  MODIFY `k9ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `MediaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `objectives`
--
ALTER TABLE `objectives`
  MODIFY `ObjectiveID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `PaymentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `ReportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `squad`
--
ALTER TABLE `squad`
  MODIFY `SquadID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `UnitID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `VehicleID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `objectives`
--
ALTER TABLE `objectives`
  ADD CONSTRAINT `objectives_ibfk_1` FOREIGN KEY (`SquadID`) REFERENCES `squad` (`SquadID`);

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`ObjectiveID`) REFERENCES `objectives` (`ObjectiveID`),
  ADD CONSTRAINT `report_ibfk_2` FOREIGN KEY (`UnitID`) REFERENCES `unit` (`UnitID`);

--
-- Constraints for table `squad`
--
ALTER TABLE `squad`
  ADD CONSTRAINT `squad_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ClientID`);

--
-- Constraints for table `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `unit_ibfk_1` FOREIGN KEY (`SquadID`) REFERENCES `squad` (`SquadID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
