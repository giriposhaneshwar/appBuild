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
        $sth = $this->db->prepare("INSERT INTO 
                                    customermaster(`cName`, `cCompany`, `cAddress`, `cType`, `cDesc`, `user_account`) 
                                    VALUES(:customer, :company, :address, :type, :desc, :user)");
        $res = $sth->execute(array(
            ':customer' => $postData['customer'],
            ':company' => $postData['company'],
            ':address' => $postData['address'],
            ':type' => $postData['companyType'],
            ':desc' => $postData['description'],
            ':user' => $postData['loggedUser'],
        ));

        if($res){
            echo "Records inserted successfully";
        }else{
            echo $res;
        }

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