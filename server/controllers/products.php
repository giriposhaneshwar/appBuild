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
    
}
 ?>