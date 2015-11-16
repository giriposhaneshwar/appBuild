<?php

/**
 * Login Model
 */
class Getdata_Model extends Model {

    function __construct() {
        parent::__construct();

        // echo "this is getdata model\n";
    }

    // Login User 
    public function getList($postData) {
        // echo "this is getdata/getList Model\n";
        $buildObj = array();
        // pulling the product list
        $sth = $this->db->prepare("SELECT * FROM itemmaster");
        $sth->execute();
        $data = $sth->fetchAll(PDO::FETCH_ASSOC);
        $count = $sth->rowCount();

        if ($count > 0) {
            // List of products
            $buildObj['productList'] = $data;
        } else {
            echo "No product to show : " . $count;
        }

        // Pulling the customer list
        $cList = $this->db->prepare("SELECT * FROM customermaster");
        $cList->execute();
        $customer = $cList->fetchAll(PDO::FETCH_ASSOC);
        $cCount = $cList->rowCount(PDO::FETCH_ASSOC);


        if ($cCount > 0) {
            // List of Customers
            $buildObj['customerList'] = $customer;
        } else {
            echo "No Customer to Show : " . $cCount;
        }

        echo json_encode($buildObj);
    }

}

?>