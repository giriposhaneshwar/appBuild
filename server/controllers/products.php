<?php 
/**
* Dashboard Controller
*/
class Products extends Controller
{
	
	function __construct() {
        parent::__construct();

        // echo "this is login controller"."\n";
    }

    function getStats($method, $postData){
    	$this->loadModelMethod($method, $postData);
    }

    // Adding Product
    function insertProduct($method, $postData){
        
        // getting the user id by using the name
        $user = $this->getIdByName($postData['loggedInUser']);

        $toSendData['userid'] = $user[0]['uid'];
        $toSendData['data'] = $postData['res'];
        
//        pid, name, type, code, price, qty, unit, vat, desc, active, addedOn, user,
//        
//        pid, name, type, code, price, qty, unit, vat, desc, active, addedOn, user_account
        
        
        // Sending the Created object to model object
    	$response = $this->loadModelMethod($method, $toSendData);
        
        echo json_encode($response);
    }
    
}
 ?>