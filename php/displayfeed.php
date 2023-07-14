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

$sql = "SELECT * FROM objectives";
$result = $connection->query($sql);
$objectives = array();

if ($result->num_rows > 0) {
    // Loop through each row of data and add it to the $rows array
    while ($objective = $result->fetch_assoc()) {
        $objectives[] = $objective;
    }
}

$sql = "SELECT * FROM media";
$result = $connection->query($sql);
$mediaFeeds = array();

if ($result->num_rows > 0) {
    // Loop through each row of data and add it to the $rows array
    while ($mediaFeed = $result->fetch_assoc()) {
        $mediaFeeds[] = $mediaFeed;
    }
}
