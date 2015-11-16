<?php 

/// DB Connection
$host = "localhost";
$user = "root";
$pass = "mysql";
$db = "appBuild";
try {
    $dbh = new PDO('mysql:host='.$host.';dbname='.$db, $user, $pass);
    /*foreach($dbh->query('SELECT * from FOO') as $row) {
        print_r($row);
    }
    $dbh = null;*/
    // echo "DB Set";
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}
?>