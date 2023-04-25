<?php
  // Retrieve the number of clients from the database
  $query = "SELECT COUNT(SquadID) FROM squad";
  $result = mysqli_query($connection, $query);
  $row = mysqli_fetch_array($result);
  $num_squad = $row[0];

  // Convert the result into JSON format
  $squad_json = json_encode($num_squad);
?>
