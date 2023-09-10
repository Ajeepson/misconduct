<?php
session_start();
include('required/conn.php');
/*if(!isset($_POST['submit'])){
    $message="wrong access!!";
    header('location:index.php?message='."$message");
    exit();
}*/
if(isset($_POST['submit'])){
$username=$_POST['username'];
$password=$_POST['pass'];
$query="SELECT username,upassword FROM users";
$result=$con->query($query);
if ($result->num_rows>0){
    while ($row=$result->fetch_assoc()) {
        if($row['username']==$username && $row['upassword']==$password){
            $_SESSION['userid']=$username;
        header('location:required/leftpannel.php');
    }
    }
}
else{
    $con-close();
    echo"<h3> incorrect username or password</h3>";
}
echo"invalid entry";
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login</title>
    <!--link rel="stylesheet" href="css/bootstrap.min.css"-->
    <!--link rel="stylesheet" href="css/index.css">
    < Custom fonts for this template-->
    <link href="startbootstrap-sb-admin-2-master/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="startbootstrap-sb-admin-2-master/css/sb-admin-2.min.css" rel="stylesheet">

</head>
    <!--div class="msg">
        <?php //$msg=$_GET['message']; ?>
        <p><?php //echo $msg; ?></p>
    </div>
        <h1>LOGIN FORM</h1>
        <form action="" method="POST">
            <div class="row">
            <label for="username">USERNAME
                <input type="text" name="username" id="username" placeholder="2023/--/--/00" required>
            </label>
            </div>
            <br>
            <div class="row">
            <label for="pass">PASSWORD
                <input type="password" name="pass" id="pass" placeholder="****" required>
            </label>
            <br>
</div>
            <input type="submit" name="submit" value="LOGIN">
        </form>
        <p>if you havent Registered please click <a href="reg.php">here</a></p>
    </div>
</div>
    </div-->
    <body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                    <form class="user" action="" Method="POST">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                name="username" placeholder="2023/--/--/00" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="exampleInputPassword" name="pass" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">Remember
                                                    Me</label>
                                            </div>
                                        </div>
                                        <input type="submit" name="submit" value="LOGIN" class="btn btn-primary btn-user btn-block"> 
                                        
        </form>
       <div class="text-center">
                                        <a class="small" href="reg.php">Create an Account!</a>
                                    </div>
</div>
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