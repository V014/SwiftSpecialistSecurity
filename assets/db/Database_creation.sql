-- users table --
CREATE TABLE `users` (
  `UserID` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Username` text DEFAULT NULL,
  `Password` text DEFAULT NULL,
  `LastOnline` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `role` text DEFAULT NULL
);

INSERT INTO `users` (`UserID`, `Username`, `Password`, `LastOnline`, `role`) VALUES
(1, 'john', 'john123', '2023-04-26 09:38:31', 'Admin'),
(2, 'jane', 'jane123', '2023-04-26 09:38:31', 'Admin'),
(3, 'alpha', 'alpha123', '2023-04-26 09:38:57', 'Squad'),
(4, 'beta', 'Beta123', '2023-04-26 09:38:57', 'Squad');

-- admin table --
CREATE TABLE `admin` (
  `AdminID` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `UserID` int(11) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  FOREIGN KEY (UserID) REFERENCES users(UserID)
);

INSERT INTO `admin` (`AdminID`, `UserID`, `Name`, `DateAdded`) VALUES
(1, 1, 'John', '2023-06-06 07:31:22'),
(2, 2, 'Jane', '2023-06-06 07:31:22');

-- client table --
CREATE TABLE `client` (
  `ClientID` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `UserID` int(11) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Contact` varchar(255) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Location` POINT,
  FOREIGN KEY (UserID) REFERENCES users (UserID)
); 

INSERT INTO `client` (`ClientID`, `Name`, `Contact`, `Description`, `DateAdded`, `Location`) VALUES
(1, 'ABC Corp', '+1 (123) 456-7890', 'ABC Street, New York, A technology company focused on software development.', '2023-04-30 13:16:29', ST_GeomFromText('POINT(-15.791887 35.005147)')),
(2, 'XYZ Corp', '+1 (987) 654-3210', 'XYZ Road, San Francisco, A technology company focused on hardware manufacturing.', '2023-04-30 13:16:29', ST_GeomFromText('POINT(-15.791495 35.007271)')),
(4, 'LOOP', '+1 (123) 443-4495', 'LOOP Street, Florida, A technology company focused on Artificial Intelligence.', '2023-04-30 13:39:28', ST_GeomFromText('POINT(-15.788243 35.004224)'));

-- squad table --
CREATE TABLE `squad` (
  `SquadID` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `SquadName` varchar(50) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `ClientID` int(11) DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  FOREIGN KEY (ClientID) REFERENCES client(ClientID)
); 

INSERT INTO `squad` (`SquadID`, `SquadName`, `Description`, `ClientID`, `DateAdded`) VALUES
(1, 'Team Alpha', 'Elite team of operatives', 1, '2023-04-30 15:10:42'),
(2, 'Team Bravo', 'Special forces unit', 2, '2023-04-30 15:10:42'),
(3, 'Team Charlie', 'Counter-terrorism unit', 1, '2023-04-30 15:10:42'),
(4, 'Team Delta', 'Intelligence gathering unit', 2, '2023-04-30 15:10:42'),
(5, 'Team Echo', 'Underwater operations team', 1, '2023-04-30 15:10:42');

-- vehicle table --
CREATE TABLE `vehicle` (
  `VehicleID` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `RegistrationNumber` int(11) DEFAULT NULL,
  `SquadID` int(11) DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  FOREIGN KEY (SquadID) REFERENCES squad (SquadID)
);

-- k9 table --
CREATE TABLE `k9` (
  `k9ID` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Breed` text NOT NULL,
  `SquadID` int(11) NOT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  FOREIGN KEY (SquadID) REFERENCES squad (SquadID)
);

-- objectives table --
CREATE TABLE `objectives` (
  `ObjectiveID` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `SquadID` int(11) DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `Activity` varchar(255) DEFAULT NULL,
  `FromTime` datetime DEFAULT NULL,
  `ToTime` datetime DEFAULT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `DateSet` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  FOREIGN KEY (SquadID) REFERENCES squad (SquadID)
);

INSERT INTO `objectives` (`ObjectiveID`, `SquadID`, `Title`, `Activity`, `FromTime`, `ToTime`, `Location`, `DateSet`) VALUES
(2, 1, 'Improve Customer Service', 'Training', '2023-04-15 08:00:00', '2023-04-15 16:00:00', 'Head Office', '2023-04-27 18:59:12'),
(3, 2, 'Increase Sales', 'Marketing Campaign', '2023-04-16 10:00:00', '2023-04-16 16:00:00', 'Outlet 1', '2023-04-27 18:59:12'),
(4, 1, 'Reduce Expenses', 'Process Improvement', '2023-04-17 09:00:00', '2023-04-17 17:00:00', 'Warehouse', '2023-04-27 18:59:12'),
(5, 2, 'Improve Quality', 'Quality Control', '2023-04-18 08:00:00', '2023-04-18 16:00:00', 'Factory', '2023-04-27 18:59:12'),
(6, 1, 'Develop New Product', 'Research and Development', '2023-04-19 10:00:00', '2023-04-19 18:00:00', 'Research Center', '2023-04-27 18:59:12'),
(7, 1, 'Inspection', 'Look around the perimeter for suspecious activity', '2023-05-01 00:00:00', '2023-05-02 00:00:00', 'Client residence', '2023-04-30 07:26:03');

-- unit table --
CREATE TABLE `unit` (
  `UnitID` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `UnitName` varchar(50) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `SquadID` int(11) DEFAULT NULL,
  `DateAdded` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  FOREIGN KEY (SquadID) REFERENCES squad (SquadID)
);

-- report table --
CREATE TABLE `report` (
  `ReportID` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `ObjectiveID` int(11) DEFAULT NULL,
  `Report` text DEFAULT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  FOREIGN KEY (ObjectiveID) REFERENCES objectives (ObjectiveID)
);

INSERT INTO `report` (`ReportID`, `ObjectiveID`, `Report`, `Date`) VALUES
(1, 2, 'Unit 1 successfully completed the mission', '2023-04-26 14:56:31'),
(2, 3, 'Unit 2 encountered unexpected issues during the mission', '2023-04-26 14:56:31'),
(3, 4, 'Unit 3 exceeded mission objectives', '2023-04-26 14:56:31'),
(4, 5, 'Unit 4 failed to complete mission due to equipment malfunction', '2023-04-26 14:56:31'),
(5, 6, 'Unit 1 encountered enemy fire, mission objectives not achieved', '2023-04-26 14:56:31');

-- payments table --
CREATE TABLE `payments` (
  `PaymentID` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `UnitID` int(11) NOT NULL,
  `Role` text NOT NULL,
  `Amount` int(11) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  FOREIGN KEY (UnitID) REFERENCES unit (UnitID)
); 

-- media table -- 
CREATE TABLE `media` (
  `MediaID` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `path` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ObjectiveID` int(11) NOT NULL,
  FOREIGN KEY (ObjectiveID) REFERENCES objectives (ObjectiveID)
);

-- Alarm table --
CREATE TABLE `alarm` (
  `AlarmID` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `ClientID` int(11) NOT NULL,
  `Status` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  FOREIGN KEY (ClientID) REFERENCES client (ClientID)
);

-- user code table --
CREATE TABLE `usercode` (
  `UsercodeID`int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `ClientID` int(11) NOT NULL,
  `Code` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  FOREIGN KEY (ClientID) REFERENCES client (ClientID)
);