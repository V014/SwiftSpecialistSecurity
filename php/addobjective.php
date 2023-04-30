<?php
require_once 'connection.php';
require_once 'utils.php'; // holds user defined functions

// escString is a user defined function that escapes SQL injection
$SquadID = escString($connection, $_POST['SquadID']);
$title = escString($connection, $_POST['title']);
$activity = escString($connection, $_POST['activity']);
$fromtime = escString($connection, $_POST['fromtime']);
$totime = escString($connection, $_POST['totime']);
$location = escString($connection, $_POST['location']);

// proceed with the query
$query = "INSERT INTO objectives (SquadID, title, activity, fromtime, totime, `location`) VALUES('$SquadID', '$title', '$activity', '$fromtime', '$totime', '$location')";
$result = mysqli_query($connection, $query);

if($result != ""){
    header("location: ../objectives.php");
    echo '<script>alert("Objective set")</script>';

} else {
    header("location: ../objectives.php");
    echo '<script>alert("Operation failed")</script>';
}
?>