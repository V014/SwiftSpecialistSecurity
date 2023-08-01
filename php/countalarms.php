<?php
  // Retrieve the number of clients from the database
  $query = "SELECT COUNT(AlarmID) FROM alarm;";
  $result = mysqli_query($connection, $query);
  $row = mysqli_fetch_array($result);
  $num_alarm = $row[0];

  // Convert the result into JSON format
  $alarm_json = json_encode($num_alarm);
?>
