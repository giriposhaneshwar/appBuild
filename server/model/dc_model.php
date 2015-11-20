<?php

/**
 * Login Model
 */
class Dc_Model extends Model {

    private $billNow;

    function __construct() {
        parent::__construct();

        // echo "this is login model\n";
    }

    // Login User 
    function getStats($postData) {
        echo "Getting the stats of dashboard";
    }

    function getList($postData) {
        echo "Data is able to show the dc model data";
    }

    function dcNumber($postData) {
        $bill = $this->renderBill($postData);
        echo $bill;
    }

    function renderBill($postData) {
        $loggedUser = $postData['loggedInUser']['user'];
        // get user by id
        $user = $this->getUserByName($loggedUser);

//         echo $user['uid'];


        $sth = $this->db->prepare("SELECT * FROM `billno` WHERE `user_account`= " . $user['uid']);
        $sth->execute();
        $data = $sth->fetchAll(PDO::FETCH_ASSOC);
        $count = $sth->rowCount();

        if ($count > 0) {
            // List of products
            // $getBill = $data;
            $this->billNow = $data[0]['dcNum'];
            return $this->billNow;
        } else {
            echo "No product to show : " . $count;
        }
    }

    function getUserByName($user) {
        $sth = $this->db->prepare("SELECT * FROM `user_accounts` WHERE `username`= '" . $user . "'");
        $sth->execute();
        $data = $sth->fetchAll(PDO::FETCH_ASSOC);
        $count = $sth->rowCount();


        if ($count > 0) {
            // getting the user
            return $data[0];
        } else {
            return "No Records " . $count;
        }
    }

    function addReport($postData) {

        $rep = array();


        // var_dump($postData);
        // print_r($postData);

        /*
          {
          "productRequirment": [
          {
          "name": "r",
          "rate": "12",
          "qty": "13",
          "setVatRow": "5",
          "amt": 163.8
          }
          ],
          "customerTo": {
          "date": "14-08-2015",
          "customer": "gy"
          },
          "grandTotal": 186.73200000000003,
          "actionPerform": "p",
          "loggedInUser": {
          "user": "giriy",
          "name": "Giriy Poshaneeshwar"
          },
          "res": ""
          }
         */

        $pList = json_encode($postData['productRequirment']);
        $customer = (string) $postData['customerTo']['customer'];
        $dcDate = (string) $postData['customerTo']['date'];
        $total = (string) $postData['grandTotal'];
        $loginUser = (string) $postData['loggedInUser']['user'];


        $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        try {
            $sth = $this->db->prepare("INSERT INTO  `dcreport` (
								`customer`,
								`billDate`,
								`dcItemList`,
								`grandTotal`,
								`totalAmount`,
								`active`,
								`user_account`
								) VALUES (
								:customer,
								:billDate,
								:dcItemList,
								:grandTotal,
								:totalAmount,
								:active,
								:user_account
								)");

            $sth->execute(array(
                ':customer' => (string) $customer,
                ':billDate' => (string) $dcDate,
                ':dcItemList' => json_encode($pList),
                ':grandTotal' => (string) $total,
                ':totalAmount' => (string) $total,
                ':active' => "1",
                ':user_account' => "1"
            ));

            $this->renderBill($postData);

            // updating the bill number with +1
//            UPDATE  `appBuild`.`billno` SET  `bill` =  '123' WHERE  `billno`.`bid` =1;
//            $bill = $this->db->prepare("SELECT * FROM `billno` WHERE `user_account`= " . $user['uid']);
            
            $billAdd = (int) $this->billNow;
            
            $bill = $this->db->prepare("UPDATE  `appBuild`.`billno` SET  `bill` = :bill WHERE  `billno`.`bid` =1");
            $bill->execute(array(
                ':bill' => $billAdd+1
            ));

            
            // Respongin to the client
            $res['status'] = "success";
            $res['message'] = "Record Inserted Successfully";
            $res['bill'] = $this->billNow;
            echo json_encode($res);
//            echo gettype($this->billNow);
            
        } catch (PDOException $e) {
            // Respongin to the client
            $res['status'] = "failed";
            $res['message'] = $e->getMessage();
            echo json_encode($res);
        }
    }

}

?>