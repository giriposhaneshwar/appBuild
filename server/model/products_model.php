<?php

/**
 * Login Model
 */
class Products_Model extends Model {

    function __construct() {
        parent::__construct();

        // echo "this is login model\n";
    }

    // Adding Product
    function insertProduct($postData) {
//        print_r($postData);

        // Inserting the data into database
        $resultData = array();


        try {
            $sth = $this->db->prepare("INSERT INTO itemmaster VALUES(NULL, :name, :type, :code, :price, :qty, :unit, :vat, :desc, :active, :addedOn, :user)");
            $sth->bindValue(':name', $postData['data']['name']);
            $sth->bindValue(':type', $postData['data']['type']);
            $sth->bindValue(':code', $postData['data']['code']);
            $sth->bindValue(':price', $postData['data']['price']);
            $sth->bindValue(':qty', $postData['data']['qty']);
            $sth->bindValue(':unit', $postData['data']['unit']);
            $sth->bindValue(':vat', $postData['data']['vat']);
            $sth->bindValue(':desc', $postData['data']['desc']);
            $sth->bindValue(':active', '1');
            $sth->bindValue(':addedOn', date("Y-m-d H:i:s", time()));
            $sth->bindValue(':user', $postData['userid']);

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
            echo json_encode($resultData);
            die();
        }
    }

}

?>