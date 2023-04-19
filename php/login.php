<?php
    require_once 'connection.php'; // include the file that contains the database connection code
    
    session_start();
    
    if($_SERVER["REQUEST_METHOD"] == "POST") {
        $email = $_POST['email'];
        $password = $_POST['password'];
        $role = $_POST['role'];
        
        // query to check the user credentials
        $query = "SELECT * FROM users WHERE `email`='$email' AND `password`='$password' AND `role`='$role'";
        $result = mysqli_query($connection, $query);
        
        if(mysqli_num_rows($result) == 1) { // user credentials are correct
            $row = mysqli_fetch_assoc($result);
            $_SESSION['login_user'] = $row['email'];
            $_SESSION['login_role'] = $row['role'];
            
            switch ($role) {
                case 'Admin':
                    header("location: ../admin.php");
                    break;

                case 'Client':
                    header("location: ../client.php");
                    break;

                case 'Squad':
                    header("location: ../squad.php");
                    break;
                }
        } else { // user credentials are incorrect
            $_SESSION['reply'] = "error";
            header("location: ../login.php");
        }
    }
?>


