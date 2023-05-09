<?php
require_once 'connection.php';
require_once 'utils.php'; // holds user defined functions

// escString is a user defined function that escapes SQL injection
$ObjectiveID = escString($connection, $_POST['ObjectiveID']);
$report = escString($connection, $_POST['report']);

// proceed with the query
$query = "INSERT INTO report (ObjectiveID, report) VALUES('$ObjectiveID', '$report')";
$result = mysqli_query($connection, $query);

if($result != ""){
    header("location: ../squadreports.php");
    echo "<script>alert('Report Submitted!')</script>";
} else {
    header("location: ../squadreports.php");
    echo "<script>alert('Operation failed!')</script>";
}
?>