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
        } else {
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
            $sth = $this->db->prepare("INSERT INTO `customermaster`(
                                `cid`, `name`, `company`, `address`, `tin`, `mobile`, `phone`, `fax`, `email`, `type`, `description`, `active`, `addedOn`, `user_account`)
                         VALUES (NULL, :name, :company,  :address,  :tin,  :mobile,  :phone,  :fax,  :email,  :type,  :desc,  :active,  :addedOn, :user)");
//            $sth->bindValue(":cid", $postData['data']['cid']);
            $sth->bindValue(":name", $postData['data']['name']);
            $sth->bindValue(":company", $postData['data']['company']);
            $sth->bindValue(":address", $postData['data']['address']);
            $sth->bindValue(":tin", $postData['data']['tin']);
            $sth->bindValue(":mobile", $postData['data']['mobile']);
            $sth->bindValue(":phone", $postData['data']['phone']);
            $sth->bindValue(":fax", $postData['data']['fax']);
            $sth->bindValue(":email", $postData['data']['email']);
            $sth->bindValue(":type", $postData['data']['type']);
            $sth->bindValue(":desc", $postData['data']['desc']);
            $sth->bindValue(":active", '1');
            $sth->bindValue(":addedOn", date("Y-m-d H:i:s", time()));
            $sth->bindValue(":user", $postData['userid']);
            
            if ($sth->execute()) {
                $resultData['status'] = "success";
                $resultData['message'] = "Records inserted successfully";
                return $resultData;
            } else {
                $resultData['status'] = "failed";
                $resultData['message'] = "Failed to Insert";
                return $resultData;
            }
        } catch (PDOException $e) {
            $resultData['status'] = "failed";
            $resultData['message'] = "Request failed. Please try again!";
            $resultData['error'] = $e->getMessage();
            return $resultData;
            die();
        }
    }

    function updateCustomer($postData) {

        try {

            $sth = $this->db->prepare("UPDATE  customermaster SET  `name` =  :name,
                                        `company` =  :company,
                                        `address` =  :address,
                                        `tin` =  :tin,
                                        `mobile` =  :mobile,
                                        `phone` =  :phone,
                                        `email` =  :email,
                                        `type` =  :type,
                                        `fax` =  :fax,
                                        `active` =  :active,
                                        `user_account` =  :user,
                                        `addedOn` =  :addedOn,
                                        `description` =  :description WHERE  `cid` = :cid");


            $sth->bindValue(":cid", $postData['data']['cid']);
            $sth->bindValue(":name", $postData['data']['name']);
            $sth->bindValue(":company", $postData['data']['company']);
            $sth->bindValue(":address", $postData['data']['address']);
            $sth->bindValue(":tin", $postData['data']['tin']);
            $sth->bindValue(":mobile", $postData['data']['mobile']);
            $sth->bindValue(":phone", $postData['data']['phone']);
            $sth->bindValue(":fax", $postData['data']['fax']);
            $sth->bindValue(":email", $postData['data']['email']);
            $sth->bindValue(":type", $postData['data']['type']);
            $sth->bindValue(":description", $postData['data']['desc']);
            $sth->bindValue(":active", $postData['data']['active']);
            $sth->bindValue(":addedOn", date("Y-m-d H:i:s", time()));
            $sth->bindValue(":user", $postData['userid']);
            $res = $sth->execute();

//        print_r($res);

            if ($res) {
                $resultData['status'] = "success";
                $resultData['message'] = "Records Updated successfully";
                return $resultData;
            } else {
                $resultData['status'] = "failed";
                $resultData['message'] = "Failed to Insert";
                return $resultData;
            }
        } catch (PDOException $e) {
            $resultData['status'] = "failed";
            $resultData['message'] = "Request failed. Please try again!";
            $resultData['error'] = $e->getMessage();
            return $resultData;
            die();
        }
    }

    function deleteCustomer($postData) {
        $user = $postData['userid'];
        $record = $postData['data']['cid'];
//        print_r($record);

        try {
            // Deleting the record based on the "cid" and "user_account" value
            $stm = $this->db->prepare("DELETE FROM customermaster WHERE `cid`=:cid AND `user_account` = :user");
            $res = $stm->execute(array(
                ':cid' => $record,
                ':user' => $user
            ));

            if ($res) {
                $resultData['status'] = "success";
                $resultData['message'] = "Records Deleted successfully";
                return $resultData;
            } else {
                $resultData['status'] = "failed";
                $resultData['message'] = "Failed to Insert";
                return $resultData;
            }
        } catch (PDOException $e) {
            $resultData['status'] = "failed";
            $resultData['message'] = "Request failed. Please try again!";
            $resultData['error'] = $e->getMessage();
            return $resultData;
            die();
        }
    }

}

?>