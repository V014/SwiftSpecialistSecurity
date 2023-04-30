<?php
require_once 'connection.php';
require_once 'utils.php'; // holds user defined functions

// escString is a user defined function that escapes SQL injection
$name = escString($connection, $_POST['name']);
$ClientID = escString($connection, $_POST['ClientID']);
$description = escString($connection, $_POST['description']);

// proceed with the query
$query = "INSERT INTO squad (`SquadName`, `ClientID`, `description`) VALUES('$name', '$ClientID', '$description')";
$result = mysqli_query($connection, $query);

if($result != ""){
    echo "<script>alert('Squad added')</script>";
    header("location: ../squads.php");

} else {
    echo "<script>alert('Operation failed')</script>";
    header("location: ../squads.php");
}
?>