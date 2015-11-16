<?php 
/**
* Dashboard Controller
*/
class Reports extends Controller
{
	
	function __construct() {
        parent::__construct();

        // echo "this is login controller"."\n";
    }

    function getAllReports($method, $postData){
    	$this->loadModelMethod($method, $postData);
    }
    
}
 ?>