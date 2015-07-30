<?php 

// include db connection
// include "../config/index.php";
include "../pullData/pullData.php";



// to get http body data

if(stripos($_SERVER["CONTENT_TYPE"], "application/json") === 0) {
    $_POST = json_decode(file_get_contents("php://input"), true);
}
$arr = array();

if(isset($_POST)){
	// echo $_SERVER['REQUEST_METHOD'];

	echo $_POST;


}

// $sendData = json_encode($_POST);

// echo $sendData;
?>