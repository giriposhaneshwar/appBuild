<?php

/**
 * Login Model
 */
class Customers_Model extends Model {

    function __construct() {
        parent::__construct();

        // echo "this is login model\n";
    }

    // Login User 
    function getStats($postData) {
        echo "Getting the stats of dashboard";
    }

    function getList($postData) {
        echo "Getting the list of customers";
    }

    function insertCustomer($postData) {
        // print_r($postData);
        // echo "\n\n\t";
        /* input model
          ----------------------
          address: "secunderabad"
          company: "Indotech Technologies"
          companyType: "sales & services"
          customer: "Ahmed"
          description: "computer sales and services"
          email: "indotech@gmail.com"
          phone: "9876543210"
          tin: "878763983287"
         */

        // Inserting the data into database
        $resultData = array();

        // $resultData = $postData;

        try {
            $sth = $this->db->prepare("INSERT INTO 
                                        customermaster(`name`, `company`, `address`, `type`, `tin`, `phone`, `email`, `desc`, `user_account`) 
                                        VALUES(:customer, :company, :address, :type, :tin, :phone, :email, :description, :user)");
            $res = $sth->execute(array(
                ':customer' => $postData['res']['customer'],
                ':company' => $postData['res']['company'],
                ':address' => $postData['res']['address'],
                ':type' => $postData['res']['companyType'],
                ':tin' => $postData['res']['tin'],
                ':phone' => $postData['res']['phone'],
                ':email' => $postData['res']['email'],
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