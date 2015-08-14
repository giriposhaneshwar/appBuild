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

	/*
    	{
		    "productRequirment": [
		        {
		            "name": "r",
		            "rate": "12",
		            "qty": "13",
		            "setVatRow": "5",
		            "amt": 163.8
		        }
		    ],
		    "customerTo": {
		        "date": "14-08-2015",
		        "customer": "gy"
		    },
		    "grandTotal": 186.73200000000003,
		    "actionPerform": "p",
		    "loggedInUser": {
		        "user": "giriy",
		        "name": "Giriy Poshaneeshwar"
		    },
		    "res": ""
		}
	*/

		$pList = $postData['productRequirment'];
		$customer = $postData['customerTo']['customer'];
		$dcDate = $postData['customerTo']['date'];
		$total = $postData['grandTotal'];
		$loginUser = $postData['loggedInUser']['user'];



    	/*
    	$rep = array();

    	$rep['status'] = "Success";
    	$rep['message'] = "Data added successfully";
    	echo json_encode($rep);*/

    	// insert the record into the database
    }


 } ?>