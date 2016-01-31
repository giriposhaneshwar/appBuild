<?php 

// include db connection
include "../config/index.php";



// to get http body data

if(stripos($_SERVER["CONTENT_TYPE"], "application/json") === 0) {
    $_POST = json_decode(file_get_contents("php://input"), true);
}
$arr = array();

if(isset($_POST)){
	// echo $_SERVER['REQUEST_METHOD'];

	foreach($_POST as $k=>$v){
		$arr[$k] = $v;
		// echo $k.", ".$v."\n";
	}

	// echo strlen($arr['username']);

	$stm = $dbh->prepare("SELECT * FROM user_accounts WHERE username = :user AND password=:pass");
	$stm->bindParam(':user', $user);
	$stm->bindParam(':pass', $pass);
	$user = $arr['username'];
	$pass = $arr['password'];
	$stm->execute();

	$count = $stm->rowCount();


	if($count > 0){
		$res = $stm->fetch(PDO::FETCH_ASSOC);
		$res['response'] = "LoggedIn";
		$res['result'] = "true";
		echo json_encode($res);
	}else{
		$res['response'] = "Username or password is invalid";
		$res['result'] = "false";
		echo json_encode($res);
	}


}

// $sendData = json_encode($_POST);

// echo $sendData;
?>