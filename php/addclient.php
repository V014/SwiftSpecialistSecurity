<?php
require_once 'connection.php';
require_once 'utils.php'; // holds user defined functions

// escString is a user defined function that escapes SQL injection
$name = escString($connection, $_POST['name']);
$contact = escString($connection, $_POST['contact']);
$description = escString($connection, $_POST['description']);

// proceed with the query
$query = "INSERT INTO client (`Name`, `contact`, `description`) VALUES('$name', '$contact', '$description')";
$result = mysqli_query($connection, $query);

if($result != ""){
    echo "<script>alert('Client added')</script>";
    header("location: ../clients.php");

} else {
    echo "<script>alert('Operation failed')</script>";
    header("location: ../clients.php");
}
?>