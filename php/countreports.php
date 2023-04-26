<?php
  // Retrieve the number of clients from the database
  $query = "SELECT COUNT(ReportID) FROM report";
  $result = mysqli_query($connection, $query);
  $row = mysqli_fetch_array($result);
  $num_report = $row[0];

  // Convert the result into JSON format
  $report_json = json_encode($num_report);
?>
