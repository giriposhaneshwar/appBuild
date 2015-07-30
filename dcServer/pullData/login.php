<?php
// Data base Connection
include '../config/index.php';

//Call when the login form is triggered
function loginUser($data){
		// echo "This is the login user method";

		var_dump($data);
		// echo strlen($arr['username']);

	$stm = $dbh->prepare("SELECT * FROM user_accounts WHERE username = :user AND password=:pass");
	$stm->bindParam(':user', $user);
	$stm->bindParam(':pass', $pass);
	$user = $data['username'];
	$pass = $data['password'];
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

?>