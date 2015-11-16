<?php 
// to get http body data

if(stripos($_SERVER["CONTENT_TYPE"], "application/json") === 0) {
    $_POST = json_decode(file_get_contents("php://input"), true);
}
// echo json_encode($_POST);

$sendData = json_encode($_POST);

echo $sendData;



?>