<?php
  // Retrieve the user ID from the session and store it in a variable for ease of use
  $UserID = $_SESSION['UserID'];
  $queryClient = "SELECT ClientID FROM client WHERE UserID = $UserID";
  $resultClient = mysqli_query($connection, $queryClient);
  $RowClientID = mysqli_fetch_array($resultClient);
  $ClientID = $RowClientID[0];

  // Identify the squad which is related to the client
  $querySquad = "SELECT SquadID FROM squad WHERE ClientID = $ClientID";
  $resultSquad = mysqli_query($connection, $querySquad);
  $RowSquadID = mysqli_fetch_array($resultSquad);
  $SquadID = $RowSquadID[0];
  
  // Retrieve the number of clients from the database
  $query = "SELECT COUNT(r.ReportID) FROM Report AS r INNER JOIN objectives As o ON o.ObjectiveID = r.ObjectiveID WHERE o.SquadID = $SquadID";
  $result = mysqli_query($connection, $query);
  $row = mysqli_fetch_array($result);
  $num_report = $row[0];

  // Convert the result into JSON format
  $report_json = json_encode($num_report);
?>
