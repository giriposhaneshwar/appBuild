<?php 
	$log =  $_SERVER['SERVER_ADDR'];

	if($log == "127.0.0.1"){
		// local credentials
		define("DB_TYPE", "mysql");
		define("DB_HOST", "localhost");
		define("DB_USER", "root");
		define("DB_PASS", "");
		define("DB_NAME", "appBuild");

	}else{
		// netword credentaials
		define("DB_TYPE", "");
		define("DB_HOST", "");
		define("DB_USER", "");
		define("DB_PASS", "");
		define("DB_NAME", "");

	}
 ?>