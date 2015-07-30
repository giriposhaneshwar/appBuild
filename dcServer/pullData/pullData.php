<?php

// include db connection
include "../config/index.php";


$stm = $dbh->prepare("SELECT * FROM customermaster");
$stm->execute();

$count = $stm->rowCount();
$res = $stm->fetch(PDO::FETCH_ASSOC);

echo $res['cName'];

// echo json_encode($res);


// echo "pulling the data from here";
?>