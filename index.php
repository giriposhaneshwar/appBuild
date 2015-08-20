<?php

ini_set('display_errors', 1);
// config db values
include './config.php';
include './libs/Database.php';

// loading main libraries
include './libs/Bootstrap.php';
include './libs/Controller.php';
include './libs/Model.php';





$start = new Bootstrap();
$start->init();
?>
