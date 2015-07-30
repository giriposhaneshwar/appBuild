<?php 
/**
* Dashboard Controller
*/
class getdata extends Controller
{
	
	function __construct() {
        parent::__construct();

        // echo "this is login controller"."\n";
    }

    function getStats($method, $postData){
    	$this->loadModelMethod($method, $postData);
    }

    function getList($method, $postData){
    	// echo "\nthis is getdata controller\n";
    	$this->loadModelMethod($method, $postData);
    }
    
}
 ?>