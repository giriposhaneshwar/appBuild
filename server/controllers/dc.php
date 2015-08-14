<?php 
/**
* Deliver Challan Controller
*/
class Dc extends Controller
{
	
	function __construct() {
        parent::__construct();

        // echo "this is login controller"."\n";
    }

    function getList($method, $postData){
    	$this->loadModelMethod($method, $postData);
    }

    function addReport($method, $postData){
    	$this->loadModelMethod($method, $postData);
    }
    
}
 ?>