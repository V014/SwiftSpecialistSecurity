<?php
  // Retrieve the number of clients from the database
  $query = "SELECT COUNT(ClientID) FROM client";
  $result = mysqli_query($connection, $query);
  $row = mysqli_fetch_array($result);
  $num_clients = $row[0];

  // Convert the result into JSON format
  $result_json = json_encode($num_clients);
?>
