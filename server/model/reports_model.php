<?php 
/**
 * Login Model
 */
 class Reports_Model extends Model
 {
 	
 	function __construct()
 	{
        parent::__construct();

 		// echo "this is login model\n";
 	}

    // Login User 
 	function getAllReports($postData)
    {
        echo "Getting the stats of products";
        $sth = $this->db->prepare("SELECT * FROM dcreport");
        $sth->execute();
        
        $data = $sth->fetchAll();

        $count =  $sth->rowCount();
        if ($count > 0) {
            // Login Success send the data to redirect the page
            $buildObj['result'] = "success";
            $buildObj['page'] = "reports";

            foreach($data as $i=>$k){
                // $data['dcItemList'] = stripslashes($k['dcItemList']);
                $data['dcItemList'] = "";
            }
            $buildObj['data'] = $data;

            echo json_encode($buildObj);
        } else {
            // header('location: ../login');
            echo "No Data to show : ".$count;
        }
        
    }


 } ?>