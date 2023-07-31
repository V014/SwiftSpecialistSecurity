<?php
require_once 'connection.php';
require_once 'utils.php'; // holds user defined functions

// escString is a user defined function that escapes SQL injection
$usercode = escString($connection, $_POST['usercode']);
// query to check the user code
$query = "SELECT ClientID FROM usercode WHERE `code`='$usercode'";
$result = mysqli_query($connection, $query);

if(mysqli_num_rows($result) != "") { // user credentials are correct
    $row = mysqli_fetch_assoc($result);
    // store ClientID
    $ClientID = $row['ClientID'];
    // save the alert
    $query = "INSERT INTO alarm (`ClientID`, `Status`) VALUES('$ClientID', 'Alert!')";
    $result = mysqli_query($connection, $query);
    // reply to the user
    $_SESSION['reply'] = "Alarm Ringing!!";
    header("location: ../index.php");

} else { // user credentials are incorrect
    $_SESSION['reply'] = "Operation Failed!";
    header("location: ../index.php");
}

?>