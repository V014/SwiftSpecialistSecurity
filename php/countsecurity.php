<?php
  // Retrieve the number of Payment from the database
  $query = "SELECT COUNT(UnitID) FROM Unit;";
  $result = mysqli_query($connection, $query);
  $row = mysqli_fetch_array($result);
  $num_Payment = $row[0];

  // Convert the result into JSON format
  $Payment_json = json_encode($num_Payment);
?>
