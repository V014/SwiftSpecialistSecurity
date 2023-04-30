<?php
require_once 'connection.php';
require_once 'utils.php'; // holds user defined functions

// escString is a user defined function that escapes SQL injection
$SquadID = escString($connection, $_POST['SquadID']);

// proceed with the query
$query = "DELETE FROM Squad WHERE SquadID = $SquadID";
$result = mysqli_query($connection, $query);

if($result != ""){
    echo "<script>alert('Squad Deleted')</script>";
    header("location: ../squads.php");

} else {
    echo "<script>alert('Operation failed')</script>";
    header("location: ../squads.php");
}
?>