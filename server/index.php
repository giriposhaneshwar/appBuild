<?php


// config db values
include './config.php';
include './libs/Database.php';

// loading main libraries
include './libs/Bootstrap.php';
include './libs/Controller.php';
include './libs/Model.php';


// switched to new branch


header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: *');

$start = new Bootstrap();
$start->init();
?>