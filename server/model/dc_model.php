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

	function dcNumber($postData){        
        $loggedUser = $postData['loggedInUser']['user'];
        // get user by id
        $user = $this->getUserByName($loggedUser);

        // echo $user['uid'];
        
        // sth = $this->db->prepare("SELECT * FROM `billno` WHERE `user_account`= ".$user['uid']);
        // $sth->execute();        
        // $data = $sth->fetchAll();
        // $count =  $sth->rowCount();

        // if ($count > 0) {
        //     // List of products
        //     // $getBill = $data;
        // 	echo json_encode($data);
        // } else {
        //     echo "No product to show : ".$count;
        // }
    }

    function getUserByName($user){
    	$sth = $this->db->prepare("SELECT * FROM `user_accounts` WHERE `username`= :username");
        $sth->execute(array(
        		':username' => $user
        	));        
        $data = $sth->fetchAll();
        $count =  $sth->rowCount();
        
        if ($count > 0) {
            // List of products
            $billno = $data[0];
        } else {
            echo "No product to show : ".$count;
        }
        return $billno;
    }

	function addReport($postData){

    	$rep = array();


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

		$pList = json_encode($postData['productRequirment']);
		$customer = (string)$postData['customerTo']['customer'];
		$dcDate = (string)$postData['customerTo']['date'];
		$total = (string)$postData['grandTotal'];
		$loginUser = (string)$postData['loggedInUser']['user'];


$this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

try {
	$sth = $this->db->prepare("INSERT INTO  `appBuild`.`dcreport` (
								`customer`,
								`billDate`,
								`dcItemList`,
								`grandTotal`,
								`totalAmount`,
								`active`,
								`user_account`
								) VALUES (
								:customer,
								:billDate,
								:dcItemList,
								:grandTotal,
								:totalAmount,
								:active,
								:user_account
								)");

	$sth->execute(array(
		':customer' => (string)$customer,
		':billDate' => (string)$dcDate,
		':dcItemList' => json_encode($pList),
		':grandTotal' => (string)$total,
		':totalAmount' => (string)$total,
		':active' => "1",
		':user_account' => "1"
		));

	// Respongin to the client
	$res['status'] = "success";
	$res['message'] = "Record Inserted Successfully";
	echo json_encode($res);

} catch(PDOException $e) {
	// Respongin to the client
	$res['status'] = "failed";
	$res['message'] = $e->getMessage();
	echo json_encode($res);
}




/*
INSERT INTO  `appBuild`.`dcreport` (
`did` ,
`customer` ,
`company` ,
`address` ,
`billno` ,
`billDate` ,
`dcItemList` ,
`grandTotal` ,
`discount` ,
`vat` ,
`totalAmount` ,
`deliveryAddress` ,
`active` ,
`createdOn` ,
`user_account`
)
VALUES (
NULL ,  'eshwar',  'techvedika',  'madhapur',  '011',  '17/8/2015',  '{"name": "r1", "rate": "12", "qty": "12", "setVatRow": "5", "amt": 151.2}', '577',  '0',  '0',  '577',  'Kondapur',  '1', 
CURRENT_TIMESTAMP ,  '1'
);
*/






    	/*

    	$rep['status'] = "Success";
    	$rep['message'] = "Data added successfully";
    	echo json_encode($rep);*/

    	// insert the record into the database
    }


} ?>