<?php
require_once 'connection.php';
require_once 'utils.php'; // holds user defined functions

// escString is a user defined function that escapes SQL injection
$ClientID = escString($connection, $_POST['ClientID']);

// proceed with the query
$query = "DELETE FROM Client WHERE ClientID = $ClientID";
$result = mysqli_query($connection, $query);

if($result != ""){
    echo "<script>alert('Client Deleted')</script>";
    header("location: ../clients.php");

} else {
    echo "<script>alert('Operation failed')</script>";
    header("location: ../clients.php");
}
?>