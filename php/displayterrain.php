<?php
require_once 'connection.php';

$sql = "SELECT * FROM squad";
$result = $connection->query($sql);
$squads = array();

if ($result->num_rows > 0) {
    // Loop through each row of data and add it to the $rows array
    while ($squad = $result->fetch_assoc()) {
        $squads[] = $squad;
    }
}

$sql = "SELECT * FROM client";
$result = $connection->query($sql);
$clients = array();

if ($result->num_rows > 0) {
    // Loop through each row of data and add it to the $rows array
    while ($client = $result->fetch_assoc()) {
        $clients[] = $client;
    }
}

$sql = "SELECT * FROM k9";
$result = $connection->query($sql);
$k9 = array();

if ($result->num_rows > 0) {
    // Loop through each row of data and add it to the $rows array
    while ($row = $result->fetch_assoc()) {
        $k9[] = $client;
    }
}
