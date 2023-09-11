<?php
  // Retrieve the user ID from the session and store it in a variable for ease of use
  $UserID = $_SESSION['UserID'];
  $queryClient = "SELECT COUNT(ClientID) FROM client WHERE UserID = $UserID";
  $resultClient = mysqli_query($connection, $queryClient);
  $RowClientID = mysqli_fetch_array($resultClient);
  $ClientID = $RowClientID[0];

  // Identify the squad which is related to the client
  $querySquad = "SELECT COUNT(SquadID) FROM squad WHERE ClientID = $ClientID";
  $resultSquad = mysqli_query($connection, $querySquad);
  $RowSquadID = mysqli_fetch_array($resultSquad);
  $SquadID = $RowSquadID[0];
  // Identify the security guards that are related to the client
  $queryUnit = "SELECT COUNT(UnitID) FROM unit WHERE SquadID = $SquadID";
  $resultUnit = mysqli_query($connection, $queryUnit);
  $RowUnitID = mysqli_fetch_array($resultUnit);

  $num_security = $RowUnitID[0];

  // Convert the result into JSON format
  $security_json = json_encode($num_security);
?>

