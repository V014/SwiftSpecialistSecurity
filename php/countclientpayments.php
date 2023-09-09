<?php
  // Retrieve the number of Payment from the database
  $query = "SELECT COUNT(PaymentID) FROM clientpayments";
  $result = mysqli_query($connection, $query);
  $row = mysqli_fetch_array($result);
  $num_payments = $row[0];

  // Convert the result into JSON format
  $payments_json = json_encode($num_payments);
?>
