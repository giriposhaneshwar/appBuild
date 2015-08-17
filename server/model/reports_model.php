<?php 
/**
 * Login Model
 */
class Reports_Model extends Model
{

    function __construct(){
        parent::__construct();

 		// echo "this is login model\n";
    }

    // Login User 
    function getAllReports($postData){
        // echo "Getting the stats of products";
        $sth = $this->db->prepare("SELECT * FROM dcreport");
        $sth->execute();

        $data = $sth->fetchAll(PDO::FETCH_ASSOC);

        $count =  $sth->rowCount();
        if ($count > 0) {
            // Login Success send the data to redirect the page
            $buildObj['result'] = "success";
            $buildObj['page'] = "reports";
            $buildObj['data'] = $data;
            /*foreach($data as $i=>$k){
                $ndata[$i] = $k;
                $ndata[$i]['dcItemList'] = $this->unescape($k['dcItemList']);
            }*/

            echo json_encode($buildObj);
        } else {
            // header('location: ../login');
            echo "No Data to show : ".$count;
        }

    }

    function unescape($string)    {

        $search = array("\\x00", "\\n", "\\r", "\\\x1a");

        $replace = array("\x00","\n", "\r", "\x1a");

        $retString = str_replace($search, $replace, $string);

        $search = array("\'", '\\'.'"');

        $replace = array(  "'", '"',);

        $retString = str_replace($search, $replace, $retString);

        $search = array("\\\\");

        $replace = array( "\\");

        $retString = str_replace($search, $replace, $retString);

        return $retString;
    }


} ?>