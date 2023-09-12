<?php
  // Retrieve the user ID from the session and store it in a variable for ease of use
  $UserID = $_SESSION['UserID'];
  $queryClient = "SELECT ClientID FROM client WHERE UserID = $UserID";
  $resultClient = mysqli_query($connection, $queryClient);
  $RowClientID = mysqli_fetch_array($resultClient);
  $ClientID = $RowClientID[0];

  // Identify the payments that are related to the client
  $queryPayments = "SELECT COUNT(PaymentID) FROM clientpayments WHERE ClientID = $ClientID";
  $resultPayments = mysqli_query($connection, $queryPayments);
  $RowPaymentsID = mysqli_fetch_array($resultPayments);

  $num_payments = $RowPaymentsID[0];

  // Convert the result into JSON format
  $payments_json = json_encode($num_payments);
?>
