<?php 
/**
 * Login Model
 */
 class Customers_Model extends Model
 {
 	
 	function __construct()
 	{
        parent::__construct();

 		// echo "this is login model\n";
 	}

    // Login User 
 	function getStats($postData)
    {
        echo "Getting the stats of dashboard";        
    }

    function getList($postData)
    {
        echo "Getting the list of customers";   
    }

    function insertCustomer($postData){
        // print_r($postData);
        // echo "\n\n\t";
        /* input model
        ----------------------
            {
              "company"       : "Techvedika"
              "customer"      : "Giriy"
              "phone"         : "123"
              "email"         : "tech@tech.com"
              "address"       : "madhapur"
              "description"   : "development company"
              "companyType"   : "software company"
            }
        */

        // Inserting the data into database
        $resultData = array();

        try {
            $sth = $this->db->prepare("INSERT INTO 
                                        customermaster(`cName`, `cCompany`, `cAddress`, `cType`, `cDesc`, `user_account`) 
                                        VALUES(:customer, :company, :address, :type, :description, :user)");
           $res = $sth->execute(array(
                ':customer' => $postData['res']['customer'],
                ':company' => $postData['res']['company'],
                ':address' => $postData['res']['address'],
                ':type' => $postData['res']['companyType'],
                ':description' => $postData['res']['description'],
                ':user' => $postData['loggedInUser']['user'],
            ));

           if($res){
                $resultData['status'] = "success";
                $resultData['message'] = "Records inserted successfully";
                echo json_encode($resultData);
            }else{
                echo "failed";
            }
        }catch(PDOException $e){
            $resultData['status'] = "failed";
            $resultData['message'] = "Request failed. Please try again!";
            $resultData['error'] = $e->getMessage();
            echo json_encode($resultData);
            die();
        }
        /*if($res){
            // $resultData['status'] = "success";
            // $resultData['message'] = "Records inserted successfully";
            // echo json_encode($resultData);
            echo "success";
        }else{
            // $resultData['status'] = "failed";
            // $resultData['message'] = "Request failed. Please try again!";
            // echo json_encode($resultData);
            echo "failed";
        }*/

        /*$count =  $sth->rowCount();
        if ($count > 0) {
            // Login Success send the data to redirect the page
            $buildObj['result'] = "success";
            $buildObj['page'] = "dashboard";
            $buildObj['data'] = $data;

            echo json_encode($buildObj);
        } else {
            // header('location: ../login');
            echo "No users to show : ".$count;
        }*/
    }


 } ?>