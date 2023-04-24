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

Squad
SquadID int (PK auto_increment)
SquadName text
Description text
ClinetID int

report
ReportID int (PK auto_increment)
Report text
ObjectiveID int
UnitID int

Objectives
ObjectiveID int (PK auto_increment)
Title text
SquadID int (FK)
Location text
FromTime datetime
ToTime datetime
Activity text

Client 
ClientID int (PK auto_increment)
Name text
Contact text
Description text

Admin 
AdminID int (PK auto_increment)
Name text
UserID int (FK)
