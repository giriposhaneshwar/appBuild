<?php 

// include db connection
include "../config/index.php";

// to get http body data

if(stripos($_SERVER["CONTENT_TYPE"], "application/json") === 0) {
    $_POST = json_decode(file_get_contents("php://input"), true);
}
// echo json_encode($_POST);


$decodedText = html_entity_decode($_POST);
$myArray = json_decode($decodedText, true);

print_r($decodedText);


$json = @file_get_contents('php://input');
// $json = file_get_contents($json_url);
// $json=str_replace('},]',"}]",$json);
// $data = json_decode($json);

// $sendData = json_encode($_POST);

// echo $sendData;

$stm = $dbh->prepare("SELECT * FROM user_accounts");
$stm->execute();

$res = $stm->fetch(PDO::FETCH_ASSOC);

// print_r($res);

// echo json_encode($res);
// echo "\nSend Data : ";

// var_dump(json_decode($json, TRUE));
// echo  "\nerros is ". json_last_error();


// echo "\n<br>".$res;



?>