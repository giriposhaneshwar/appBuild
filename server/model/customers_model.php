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
        // getting the customer list
        $stm = $this->db->prepare('SELECT * FROM `customermaster` WHERE `user_account`="' . $postData['userid'] . '"');
        $stm->execute();
        $res = $stm->fetchAll(PDO::FETCH_ASSOC);
        $count = $stm->rowCount(PDO::FETCH_ASSOC);
        $resObj = array();

        if ($count > 0) {
            $resObj['data'] = $res;
            $resObj['status'] = 'success';
            return $resObj;
        }else{
            $resObj['status'] = 'failed';
            $resObj['data'] = 'No Result Found';
            return $resObj;
        }
    }

    function insertCustomer($postData) {
//         print_r($postData);
        // echo "\n\n\t";
        // Inserting the data into database
        $resultData = array();

        // $resultData = $postData;

        try {
            $sth = $this->db->prepare("INSERT INTO 
                                        customermaster(
                                            `cid`, 
                                            `name`, 
                                            `company`, 
                                            `address`, 
                                            `tin`, 
                                            `mobile`, 
                                            `phone`, 
                                            `fax`, 
                                            `email`, 
                                            `type`, 
                                            `desc`, 
                                            `active`, 
                                            `user_account`) 
                                        VALUES(
                                            NULL, 
                                            :name, 
                                            :company, 
                                            :address, 
                                            :tin, 
                                            :mobile, 
                                            :phone, 
                                            :fax, 
                                            :email, 
                                            :type, 
                                            :description, 
                                            :active, 
                                            :user)");
            $res = $sth->execute(array(
                ':name' => $postData['data']['name'],
                ':company' => $postData['data']['company'],
                ':address' => $postData['data']['address'],
                ':tin' => $postData['data']['tin'],
                ':mobile' => $postData['data']['mobile'],
                ':phone' => $postData['data']['phone'],
                ':fax' => $postData['data']['fax'],
                ':email' => $postData['data']['email'],
                ':type' => $postData['data']['type'],
                ':description' => $postData['data']['desc'],
                ':active' => '1',
                ':user' => $postData['userid']
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
    }
    
    function updateCustomer($postData){
        print_r($postData);
    }

}

?>