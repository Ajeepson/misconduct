<?php
if(isset($_POST['submit'])){
$con=new mysqli('locahost','root','','msconduct');
if(!$con){
    die("unable to connect to database").$con->connect_error();
}
    if(empty($_POST['regno']) || empty($_POST['sname']) || empty($_POST['phoneno']) || empty($_POST['dept']) || empty($_POST['dob']) || empty($_POST['address'])
    || empty($_POST['lvl'])|| empty($_POST['gender'])){
   echo "<p class='error'> Fill in all the fields </p>";
   $message="fill in all the fields";
   header('location:reg.php');
   exit();
    }
    else{
    $regno= htmlentities($_POST['regno']);
    $fullname=htmlentities($_POST['sname']);
    $phone=htmlentities($_POST['phoneno']);
    $department=htmlentities($_POST['dept']);
    $dob=htmlentities($_POST['dob']);
    $address=htmlentities($_POST['address']);
    $level=htmlentities($_POST['lvl']);
    $gender=htmlentities($_POST['gender']);
    $sql= prepare("INSERT INTO student_info_tbl(REG_NO,NAME,DEPT,LEVEL,GENDER,PHONE,DOB,ADDRESSS)VALUES(?,?,?,?,?,?,?,?)");
    $result=$sql->bind_param("ssssssss",$regno,$fullname,$phone,$department,$level,$gender,$phone,$dob,$address);
    if($result->execute()){
        $message="Record inserted successfully";
        header('location:index.php?message='."'.$message.'");
    }
    $message="smtn went wrong";
}
}
?>