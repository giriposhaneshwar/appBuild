<?php 

// Calling the functions
include "../pullData/login.php";

// to get http body data
if(stripos($_SERVER["CONTENT_TYPE"], "application/json") === 0) {
    $_POST = json_decode(file_get_contents("php://input"), true);
}
$arr = array();


if(isset($_POST)){
	// echo $_SERVER['REQUEST_METHOD'];
	// var_dump($_POST);

	foreach($_POST as $k=>$v){
		$arr[$k] = $v;
		// echo $k.", ".$v."\n";
	}

	// Login User
	$arr['method']($arr['data']);

}

// $sendData = json_encode($_POST);

// echo $sendData;
?>