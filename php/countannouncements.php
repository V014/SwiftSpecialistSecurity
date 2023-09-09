<?php
  // Retrieve the number of announcements from the database
  $query = "SELECT COUNT(AnnouncementID) FROM announcements";
  $result = mysqli_query($connection, $query);
  $row = mysqli_fetch_array($result);
  $num_announcements = $row[0];

  // Convert the result into JSON format
  $announcements_json = json_encode($num_announcements);
?>
