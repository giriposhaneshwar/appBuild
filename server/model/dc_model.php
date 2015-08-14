<?php 
/**
 * Login Model
 */
 class Dc_Model extends Model
 {
 	
 	function __construct()
 	{
        parent::__construct();

 		// echo "this is login model\n";
 	}

    // Login User 
 	function getStats($postData)
    {
        echo "Getting the stats of dashboard";        
    }

    function getList($postData){
    	echo "Data is able to show the dc model data";
    }

    function addReport($postData){
    	// var_dump($postData);

    	// print_r($postData);
    	$rep = array();

    	$rep['status'] = "Success";
    	$rep['message'] = "Data added successfully";
    	echo json_encode($rep);

    	// insert the record into the database
    }


 } ?>