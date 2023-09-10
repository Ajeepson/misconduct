<?php
session_destroy();
$_SESSION['stuserid']=false;
$_SESSION['userid']=false;
$_SESSION['username']=false;
header('location:index.php');
?>