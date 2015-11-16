<?php 
/**
* Dashboard Controller
*/
class Customers extends Controller
{
	
	function __construct() {
        parent::__construct();

        // echo "this is login controller"."\n";
    }

    function getStats($method, $postData){
    	$this->loadModelMethod($method, $postData);
    }

    function getList($method, $postData){
    	$this->loadModelMethod($method, $postData);
    }

    function insertCustomer($method, $postData){
        $this->loadModelMethod($method, $postData);
    }
    
}
 ?>