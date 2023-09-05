1. users 
UserID Int (PK)
Status Text 
Email Text
Password Text

2. Unit 
UnitID int (PK)
UnitName text
SquadID int
Description text
DateAdded TimeStamp

3. Squad 
SquadID int (PK)
SquadName text
Description text
ClinetID int
DateAdded TimeStamp

4. report 
ReportID int (PK)
Report text
ObjectiveID int
UnitID int
Date TimeStamp

5. Objectives 
ObjectiveID int (PK)
Title text
SquadID int (FK)
Location text
FromTime datetime
ToTime datetime
Activity text
DateSet TimeStamp

6. Client 
ClientID int (PK)
Name text
Contact text
Description text
DateAdded TimeStamp
Location POINT
SquadID INT

7. Admin 
AdminID int (PK)
Name text
UserID int (FK)
DateAdded TimeStamp

8. Media 
MediaID int (PK)
ObjectiveID int (FK)
Path text
Date TimeStamp

9. Vehicle 
VehicleID int (PK)
RegistrationNumber int
SquadID int (FK)
DateAdded TimeStamp

10. Payments 
PaymentID int (PK)
UnitID int (FK)
Role text
Amount int
Date TimeStamp

11. K9 
K9ID int (PK)
Breed text
SquadID int (FK)
DateAdded TimeStamp

12. Announcements 
AnnouncementID int (PK)
Title text NOT NULL
Message text
Date TimeStamp

13. Alarm 
AlarmID int (PK)
ClientID int (FK)
Status text
Date TimeStamp

14. Usercode 
UserCodeID int (PK)
ClientID int (FK)
Code text
Date TimeStamp

15. Clientpayments
PaymentID int (PK)
ClientID int (FK)
Amount int
Date TimeStamp