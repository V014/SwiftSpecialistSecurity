<?php
  // Retrieve the number of clients from the database
  $query = "SELECT COUNT(ObjectiveID) FROM objectives";
  $result = mysqli_query($connection, $query);
  $row = mysqli_fetch_array($result);
  $num_objectives = $row[0];

  // Convert the result into JSON format
  $objectives_json = json_encode($num_objectives);
?>
