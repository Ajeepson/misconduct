<?php
session_start();
include('required/conn.php');
if($_SESSION['stuserid']){
    $regno=$_SESSION['stuserid'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>username and password</title>
    <!--link rel="stylesheet" href="css/bootstrap.min.css"-->
    <link href="startbootstrap-sb-admin-2-master/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="startbootstrap-sb-admin-2-master/css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                        <div class="msg">
        <?php if(!empty($_GET['message'])){
            $msg=$_GET['message']; ?>
            <p><?php echo $msg; } ?></p>
       
    </div>
    <form action="passuser.php" method="POST">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                            <form class="user">
                                <div class="form-group row">
   
            
            <div class="form-group">
                                    <input type="text" class="form-control form-control-user" id="exampleInputEmail"
                                     name="user" id="user" value="<?php echo htmlentities($regno) ?>" required>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" class="form-control form-control-user"
                                            id="exampleInputPassword" placeholder="Password" name="pass" id="pass" required>
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="password" class="form-control form-control-user"
                                            id="exampleRepeatPassword" placeholder="Repeat Password" name="repass" id="repass" required>
                                    </div>
                                </div>
            <!--label for="user">Username</label>
            <input type="text" name="user" id="user" value="<?php echo $regno ?>" require>
        </div>
        <div class="row">
            <label for="pass">Password</label-->
            <!--input type="password" name="pass" id="pass" require>
        </div>
        <div class="row">
            <label for="repass">Confirm Password</label>
            <input type="password" name="repass" id="repass" require>
        </div-->
        <input type="submit" name="send" value="submit" class="btn btn-facebook btn-user btn-block">
        </form>
                        <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div-->
                            <div class="text-center">
                                <a class="small" href="login.html">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="startbootstrap-sb-admin-2-master/vendor/jquery/jquery.min.js"></script>
    <script src="startbootstrap-sb-admin-2-master/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="startbootstrap-sb-admin-2-master/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="startbootstrap-sb-admin-2-master/js/sb-admin-2.min.js"></script>

</body>
</html>
<?php
}
else{
    header('Location:index.php?message='."$message");
}
?>