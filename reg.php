<?php
session_start();
$con=new mysqli('localhost','root','','misconduct');
if(!$con){
    die("unable to connect to database").$con->connect_error();
}
if(isset($_POST['submit'])){
    if(empty($_POST['sreg']) || empty($_POST['sname']) || empty($_POST['phoneno']) || 
    empty($_POST['dept']) || empty($_POST['dob']) || empty($_POST['addr'])
    || empty($_POST['lvl'])|| empty($_POST['gender'])){
   $message="fill in all the fields";
   header('location:reg.php?message='."$message");
    exit();
    }
    $regno=trim(htmlentities($_POST['sreg']));
    $fullname=trim(htmlentities($_POST['sname']));
    $phone=trim(htmlentities($_POST['phoneno']));
    $department=trim(htmlentities($_POST['dept']));
    $dob=trim(htmlentities($_POST['dob']));
    $address=trim(htmlentities($_POST['addr']));
    $level=trim(htmlentities($_POST['lvl']));
    $gender=trim(htmlentities($_POST['gender']));
    $sql=$con->prepare("INSERT INTO student_info_tbl(REG_NO,SNAME,DEPT,SLEVEL,GENDER,PHONE,DOB,ADDRESSS)VALUES(?,?,?,?,?,?,?,?)");
   if($sql==false){
//$con->errorInfo();
   }
    $sql->bind_param('ssssssss',$regno,$fullname,$department,$level,$gender,$phone,$dob,$address);
    if($sql->execute()){
        $_SESSION['stuserid']=$regno;
        $message="Previous Record inserted successfully";
        $_SESSION['username']=$fullname;
        header('location:reg_userpass.php?message='."$message");
        echo'<div class="msg">';
        $msg=$_GET["message"];echo'<p>'.$msg.'</p>
    </div>';
    }
    $message="smtn went wrong";
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registeration</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link href="startbootstrap-sb-admin-2-master/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
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
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
        <form action="" method="POST" class="user">
        <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
            <input type="text" name="sreg" class="form-control form-control-user" id="exampleRegno"
                                            placeholder="Registration Number" required>
</div>
<div class="col-sm-6">
            <input type="text" name="sname" class="form-control form-control-user" id="exampleFullName"
                                            placeholder="Full Name" required>
</div>
</div>
<div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="text" name="phoneno" class="form-control form-control-user" id="examplePhoneno"
                                            placeholder="Phone Number" required>
</div>
</div>
<div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
        <select name="dept" id="dept" class="form-control rounded">
        <option value="">DEPARTMENT/UNIT</option>
          <option value="Accountancy">Accountancy</option>
          <option value="Architecture">Architecture</option>
          <option value="Agricultural Engineering">
            Agricultural Engineering
          </option>
          <option value="Bussiness Administration and Management">
            Bussiness Administration
          </option>
          <option value="Computer Science">Computer Science</option>
          <option value="Computer Engineering">Computer Engineering</option>
          <option value="Electrical Engineering">Electrical Engineering</option>
          <option value="Estate Management">Estate Management</option>
          <option value="Science Laboratory Technology">Science Laboratory Technology</option>
            <option value="Statistics">Statistics</option>
            Science Laboratory Technology
          </option>
          <option value="Survey and Geo Informatics">
            Survey and Geo Informatics
          </option>
        </select>
    </div>
    <div class="col-sm-6 mb-3 mb-sm-0">
            <select name="lvl" id="lvl" class="form-control rounded">
            <option value="">Level</option>
                <option value="100 Level">100 Level</option>
                <option value="200 Level">200 Level</option>
                <option value="300 Level">300 Level</option>
                <option value="400 Level">400 Level</option>
                <option value="500 Level">500 Level</option>
            </select>
</div>
</div>
<div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
        <input type="date" id="dob" name="dob" class="form-control form-control-user" placeholder="DOB" required>
</div>
<div class="col-sm-6 mb-3 mb-sm-0">
            <select name="gender" id="gen" class="form-control rounded" required>
            <option value="">Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
            </select>
        </div> 
        </div>    
        <div class="form-group">         
            <input type="text" name="addr" id="addr" class="form-control form-control-user" placeholder="NO: 34 Alimarami street, Damaturu Yobe state" required>
</div>
            <input type="submit" value="SUBMIT" name="submit" class="btn btn-primary btn-user btn-block">
        </form>
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