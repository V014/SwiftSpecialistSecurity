<?php
require_once 'connection.php';
require_once 'utils.php'; // holds user defined functions

// escString is a user defined function that escapes SQL injection
$ObjectiveID = escString($connection, $_POST['ObjectiveID']);

// proceed with the query
$query = "DELETE FROM Objectives WHERE ObjectiveID = $ObjectiveID";
$result = mysqli_query($connection, $query);

if($result != ""){
    header("location: ../objectives.php");
    echo "<script>alert('Objective Deleted')</script>";

} else {
    header("location: ../objectives.php");
    echo "<script>alert('Operation failed')</script>";
}
?>