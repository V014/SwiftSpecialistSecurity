<?php
$sql = "SELECT SquadID FROM squad ORDER BY SquadID ASC";
$result = $connection->query($sql);
$rows = array();

if ($result->num_rows > 0) {
  // Loop through each row of data and add it to the $rows array
  while($row = $result->fetch_assoc()) {
    $rows[] = $row;
  }
}
?>