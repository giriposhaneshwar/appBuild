<?php 
	$log =  $_SERVER['SERVER_ADDR'];
	$sr = $_SERVER['HTTP_HOST'];

	echo "Server REMOTE_ADDR, HTTP_HOST : ".$sr;

	if($sr == "localhost"){
		// local credentials
		define("DB_TYPE", "mysql");
		define("DB_HOST", "localhost");
		define("DB_USER", "root");
		define("DB_PASS", "mysql");
		define("DB_NAME", "appBuild");
	}else{
		// netword credentaials
		define("DB_TYPE", "mysql");
		define("DB_HOST", "50.28.15.25");
		define("DB_USER", "icsitpar_dcsoft");
		define("DB_PASS", "netgear28");
		define("DB_NAME", "icsitpar_dcsoft");
	}
 ?>