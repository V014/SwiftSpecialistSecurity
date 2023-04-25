-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2023 at 05:34 PM
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
  `Name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `UserID`, `Name`) VALUES
(1, 1, 'John'),
(2, 2, 'Jane');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `ClientID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Contact` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`ClientID`, `Name`, `Contact`, `Description`) VALUES
(1, 'ABC Corp', '+1 (123) 456-7890', 'ABC Street, New York, A technology company focused on software development.'),
(2, 'XYZ Corp', '+1 (987) 654-3210', 'XYZ Road, San Francisco, A technology company focused on hardware manufacturing.');

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
  `Location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `objectives`
--

INSERT INTO `objectives` (`ObjectiveID`, `SquadID`, `Title`, `Activity`, `FromTime`, `ToTime`, `Location`) VALUES
(2, 1, 'Improve Customer Service', 'Training', '2023-04-15 08:00:00', '2023-04-15 16:00:00', 'Head Office'),
(3, 2, 'Increase Sales', 'Marketing Campaign', '2023-04-16 10:00:00', '2023-04-16 16:00:00', 'Outlet 1'),
(4, 1, 'Reduce Expenses', 'Process Improvement', '2023-04-17 09:00:00', '2023-04-17 17:00:00', 'Warehouse'),
(5, 2, 'Improve Quality', 'Quality Control', '2023-04-18 08:00:00', '2023-04-18 16:00:00', 'Factory'),
(6, 1, 'Develop New Product', 'Research and Development', '2023-04-19 10:00:00', '2023-04-19 18:00:00', 'Research Center');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `ReportID` int(11) NOT NULL,
  `ObjectiveID` int(11) DEFAULT NULL,
  `UnitID` int(11) DEFAULT NULL,
  `Report` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`ReportID`, `ObjectiveID`, `UnitID`, `Report`) VALUES
(1, 2, 1, 'Unit 1 successfully completed the mission'),
(2, 3, 2, 'Unit 2 encountered unexpected issues during the mission'),
(3, 4, 3, 'Unit 3 exceeded mission objectives'),
(4, 5, 4, 'Unit 4 failed to complete mission due to equipment malfunction'),
(5, 6, 1, 'Unit 1 encountered enemy fire, mission objectives not achieved');

-- --------------------------------------------------------

--
-- Table structure for table `squad`
--

CREATE TABLE `squad` (
  `SquadID` int(11) NOT NULL,
  `SquadName` varchar(50) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `ClientID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `squad`
--

INSERT INTO `squad` (`SquadID`, `SquadName`, `Description`, `ClientID`) VALUES
(1, 'Team Alpha', 'Elite team of operatives', 1),
(2, 'Team Bravo', 'Special forces unit', 2),
(3, 'Team Charlie', 'Counter-terrorism unit', 1),
(4, 'Team Delta', 'Intelligence gathering unit', 2),
(5, 'Team Echo', 'Underwater operations team', 1);

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `UnitID` int(11) NOT NULL,
  `UnitName` varchar(50) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `SquadID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`UnitID`, `UnitName`, `Description`, `SquadID`) VALUES
(1, 'Alice Brown', 'Expert in communication', 1),
(2, 'Bob Smith', 'Expert in logistics', 1),
(3, 'Charlie Davis', 'Expert in technology', 2),
(4, 'David Johnson', 'Expert in security', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Email` text DEFAULT NULL,
  `Password` text DEFAULT NULL,
  `LastOnline` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Status` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Email`, `Password`, `LastOnline`, `Status`) VALUES
(1, 'john@mail.com', 'password123', '2023-04-17 14:51:03', 'Online'),
(2, 'jane@mail.com', 'password456', '2023-04-17 14:51:03', 'Offline'),
(3, 'jim@mail.com', 'password789', '2023-04-17 14:51:03', 'Online'),
(4, 'mary@mail.com', 'password012', '2023-04-17 14:51:03', 'Offline');

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
-- Indexes for table `objectives`
--
ALTER TABLE `objectives`
  ADD PRIMARY KEY (`ObjectiveID`),
  ADD KEY `SquadID` (`SquadID`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`ReportID`),
  ADD KEY `ObjectiveID` (`ObjectiveID`),
  ADD KEY `UnitID` (`UnitID`);

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
  MODIFY `ClientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `objectives`
--
ALTER TABLE `objectives`
  MODIFY `ObjectiveID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `ReportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `squad`
--
ALTER TABLE `squad`
  MODIFY `SquadID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
