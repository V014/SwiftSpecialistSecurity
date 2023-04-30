<?php
require_once 'connection.php';
require_once 'utils.php'; // holds user defined functions

// escString is a user defined function that escapes SQL injection
$ReportID = escString($connection, $_POST['ReportID']);

// proceed with the query
$query = "DELETE FROM Report WHERE ReportID = $ReportID";
$result = mysqli_query($connection, $query);

if($result != ""){
    header("location: ../reports.php");
    echo "<script>alert('Report Deleted')</script>";

} else {
    header("location: ../reports.php");
    echo "<script>alert('Operation failed')</script>";
}
?>