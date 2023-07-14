users
UserID Int (PK auto_increment)
Status Text (Online/Offline)
Email Text
Password Text

Unit
UnitID int (PK auto_increment)
UnitName text
SquadID int
Description text
DateAdded TimeStamp

Squad
SquadID int (PK auto_increment)
SquadName text
Description text
ClinetID int
DateAdded TimeStamp

report
ReportID int (PK auto_increment)
Report text
ObjectiveID int
UnitID int
Date TimeStamp

Objectives
ObjectiveID int (PK auto_increment)
Title text
SquadID int (FK)
Location text
FromTime datetime
ToTime datetime
Activity text
DateSet TimeStamp

Client
ClientID int (PK auto_increment)
Name text
Contact text
Description text
DateAdded TimeStamp
Location POINT
SquadID INT

Admin
AdminID int (PK auto_increment)
Name text
UserID int (FK)
DateAdded TimeStamp

Media
MediaID int (PK auto_increment)
ObjectiveID int (FK)
Path text
Date TimeStamp

Vehicle
VehicleID int (PK auto_increment)
RegistrationNumber int
SquadID int (FK)
DateAdded TimeStamp

Payments
PaymentID int (PK auto_increment)
UnitID int (FK)
Role text
Amount int
Date TimeStamp

K9
K9ID int (PK auto_increment)
Breed text
SquadID int (FK)
DateAdded TimeStamp
