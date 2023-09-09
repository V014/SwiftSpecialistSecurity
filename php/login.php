<?php
    require_once 'connection.php'; // include the file that contains the database connection code
    require_once 'utils.php'; // holds user defined functions
    
    session_start();
    
    if($_SERVER["REQUEST_METHOD"] == "POST") {
        // escString is a user defined function that escapes SQL injection
        $username = escString($connection, $_POST['username']);
        $password = escString($connection, $_POST['password']);
        $role = escString($connection, $_POST['role']);
        
        // query to check the user credentials
        $query = "SELECT * FROM users WHERE `username`='$username' AND `password`='$password' AND `role`='$role'";
        $result = mysqli_query($connection, $query);
        
        if(mysqli_num_rows($result) == 1) { // user credentials are correct
            $row = mysqli_fetch_assoc($result);
            // store credentials in sessions
            $_SESSION['username'] = $row['username'];
            $_SESSION['role'] = $row['role'];
            $_SESSION['UserID'] = $row['UserID'];
            
            switch ($role) {
                case 'Admin':
                    header("location: ../admin.php");
                    break;

                case 'Squad':
                    header("location: ../squadhome.php");
                    break;

                case 'Client':
                    header("location: ../clienthome.php");
                    break;
                }
        } else { // user credentials are incorrect
            $_SESSION['reply'] = "invalid";
            header("location: ../login.php");
        }
    }
?>