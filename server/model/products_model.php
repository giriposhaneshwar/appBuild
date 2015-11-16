<?php

/**
 * Login Model
 */
class Products_Model extends Model {

    function __construct() {
        parent::__construct();

        // echo "this is login model\n";
    }

    // Login User 
    function getStats($postData) {
        echo "Getting the stats of products";
        /* $sth = $this->db->prepare("SELECT * FROM user_accounts WHERE 
          username = :login AND password = :password LIMIT 1");
          $sth->execute(array(
          ':login' => $postData['username'],
          // ':password' => Hash::create('sha256', $_POST['password'], HASH_PASSWORD_KEY)
          ':password' => $postData['password']
          ));

          $data = $sth->fetch();

          $count =  $sth->rowCount();
          if ($count > 0) {
          // Login Success send the data to redirect the page
          $buildObj['result'] = "success";
          $buildObj['page'] = "dashboard";
          $buildObj['data'] = $data;

          echo json_encode($buildObj);
          } else {
          // header('location: ../login');
          echo "No users to show : ".$count;
          } */
    }

    // Adding Product
    function insertProduct($postData) {
        // print_r($postData);
        // echo "\n\n\t";
        /* input model
          ----------------------
          code: "asdf"
          description: "adsf"
          name: "sadf"
          price: "asdf"
          qty: "asdf"
          type: "asdf"
         */

        // Inserting the data into database
        $resultData = array();


        // $resultData = $postData;

        try {
            $sth = $this->db->prepare("INSERT INTO 
                                        itemmaster 
                                        VALUES( NULL, :name, :type, :code, :price, :qty, :description, :user)");
            $res = $sth->execute(array(
                ':name' => $postData['res']['name'],
                ':type' => $postData['res']['type'],
                ':code' => $postData['res']['code'],
                ':price' => $postData['res']['price'],
                ':qty' => $postData['res']['qty'],
                ':description' => $postData['res']['description'],
                ':user' => $postData['loggedInUser']['user'],
            ));



            if ($res) {
                $resultData['status'] = "success";
                $resultData['message'] = "Records inserted successfully";
                echo json_encode($resultData);
            } else {
                echo "failed";
            }
        } catch (PDOException $e) {
            $resultData['status'] = "failed";
            $resultData['message'] = "Request failed. Please try again!";
            $resultData['error'] = $e->getMessage();
            echo json_encode($resultData);
            die();
        }


        /* if($res){
          // $resultData['status'] = "success";
          // $resultData['message'] = "Records inserted successfully";
          // echo json_encode($resultData);
          echo "success";
          }else{
          // $resultData['status'] = "failed";
          // $resultData['message'] = "Request failed. Please try again!";
          // echo json_encode($resultData);
          echo "failed";
          } */

        /* $count =  $sth->rowCount();
          if ($count > 0) {
          // Login Success send the data to redirect the page
          $buildObj['result'] = "success";
          $buildObj['page'] = "dashboard";
          $buildObj['data'] = $data;

          echo json_encode($buildObj);
          } else {
          // header('location: ../login');
          echo "No users to show : ".$count;
          } */
    }

}

?>