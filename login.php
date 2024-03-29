<?php
session_start();
if(isset($_SESSION['reply'])){
    if($_SESSION['reply'] === "invalid"){
        $reply = "Invalid credentials!";
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Login</title>
    <meta name="description" content="This is a company that delivers security services both physically and virtually to it's clients and enables proper and coordinated security services. If you have an emergency, you can still hit the alert button and we will contact and reach you. On reach, we will request for more details if you wish to be our client.">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&amp;display=swap">
</head>

<body class="bg-gradient-primary">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-9 col-lg-12 col-xl-10">
                <div class="card shadow-lg o-hidden border-0 my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-flex">
                                <div class="flex-grow-1 bg-login-image" style="background: url(&quot;assets/img/login.jpg&quot;) center / cover no-repeat;"></div>
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h4 class="text-dark mb-4">Swift Specialist Secuirty</h4>
                                    </div>
                                    <form class="user" method="POST" action="php/login.php">
                                    <!-- Response to user if credentials are invalid-->
                                    <?php if (isset($_SESSION['reply'])){ ?>
                                        <p style="color: red; text-align: center;"><?= $reply; ?></p>
                                    <?php } else {  /*do nothing*/ }?>
                                        <div class="mb-3">
                                            <input class="form-control form-control-user" type="text" id="Username" required="" placeholder="Username..." name="username">
                                        </div>
                                        <div class="mb-3">
                                            <input class="form-control form-control-user" type="password" id="Password" required="" placeholder="Password" name="password">
                                        </div>
                                        <div class="mb-3">
                                            <div class="form-group">
                                                <!--<label for="Role">Role</label>-->
                                                <select class="form-control form-control-user" id="Role" name="role">
                                                <option value="Admin">Admin</option>
                                                <option value="Squad">Squad</option>
                                                <option value="Client">Client</option>
                                                </select>
                                            </div>
                                        </div>
                                        <button class="btn btn-primary d-block btn-user w-100" type="submit" value="submit">Login</button>
                                        <br>
                                        <a href="index.php" class="btn btn-outline-primary d-block btn-user w-100">Return Home</a>
                                        <?php unset($_SESSION['reply']); ?>
                                        
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>