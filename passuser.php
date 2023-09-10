<?php 
session_start();
include('required/conn.php');
if(isset($_POST['send'])){
$username=$_SESSION['stuserid'];
$password=$_POST['pass'];
$repassword=$_POST['repass'];
if ($password!=$repassword) {
  $message="password does not match";
  header('location:reg_userpass.php?message='."$message");
  //exit();
}
else{
$sql="INSERT INTO users(username,upassword,date_added) VALUES(?,?,?)";
$result=$con->prepare($sql);
$date=date("Y-M-d h:m:s");
$result->bind_param("sss",$username,$password,$date);
if($result->execute()){
    //$_SESSION['pword']=$password;
    $message="record saved sucessfully";
    header('location:index.php?message='."$message");
  //  exit();
}
}
}
    ?>