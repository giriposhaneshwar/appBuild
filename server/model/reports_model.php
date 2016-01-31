<?php

/**
 * Login Model
 */
class Reports_Model extends Model {

	function __construct() {
		parent::__construct();

		// echo "this is login model\n";
	}

	// Login User
	function getAllReports($postData) {
		// echo "Getting the stats of products";
		$sth = $this->db->prepare("SELECT * FROM dcreport WHERE `user_account`= :user");
		$sth->execute(array(':user' => $postData['userid']));

		$data = $sth->fetchAll(PDO::FETCH_ASSOC);

		// return $data;

		$count = $sth->rowCount();
		if ($count > 0) {
			// Login Success send the data to redirect the page

			foreach ($data as $key => $value) {
				$data[$key]['numWord'] = $this->numToWord($value['grandTotal']);
			}

			$buildObj['status'] = "success";
			$buildObj['page'] = "reports";
			$buildObj['data'] = $data;

			// return $data;
			/* foreach($data as $i=>$k){
				              $ndata[$i] = $k;
				              $ndata[$i]['dcItemList'] = $this->unescape($k['dcItemList']);
			*/

			return $buildObj;
		} else {
			// header('location: ../login');
			echo "No Data to show : " . $count;
		}
	}
	// Deleting a row
	function deleteRecord($postData) {
		// echo "Getting the stats of products";

		$sth = $this->db->prepare("DELETE FROM `dcreport` WHERE `did` = :id");
		$res = $sth->execute(array(':id' => (int) $postData['data']));

		if ($res) {
			$buildObj['status'] = "success";
			$buildObj['message'] = "Record Deleted Successfully";
			// $getData = $this->getAllReports($postData);
			// $buildObj['data'] = $getData;
		} else {
			$buildObj['status'] = "failed";
			$buildObj['message'] = "Failed to delete data! Please try again later.";
			// $getData = $this->getAllReports($postData);
			// $buildObj['data'] = $getData;
		}

		return $buildObj;

	}

	function unescape($string) {

		$search = array("\\x00", "\\n", "\\r", "\\\x1a");

		$replace = array("\x00", "\n", "\r", "\x1a");

		$retString = str_replace($search, $replace, $string);

		$search = array("\'", '\\' . '"');

		$replace = array("'", '"');

		$retString = str_replace($search, $replace, $retString);

		$search = array("\\\\");

		$replace = array("\\");

		$retString = str_replace($search, $replace, $retString);

		return $retString;
	}

	function numToWord($word) {
		$number = $word;
		$no = round($number);
		$point = round($number - $no, 2) * 100;
		$hundred = null;
		$digits_1 = strlen($no);
		$i = 0;
		$str = array();
		$words = array('0' => '', '1' => 'one', '2' => 'two',
			'3' => 'three', '4' => 'four', '5' => 'five', '6' => 'six',
			'7' => 'seven', '8' => 'eight', '9' => 'nine',
			'10' => 'ten', '11' => 'eleven', '12' => 'twelve',
			'13' => 'thirteen', '14' => 'fourteen',
			'15' => 'fifteen', '16' => 'sixteen', '17' => 'seventeen',
			'18' => 'eighteen', '19' => 'nineteen', '20' => 'twenty',
			'30' => 'thirty', '40' => 'forty', '50' => 'fifty',
			'60' => 'sixty', '70' => 'seventy',
			'80' => 'eighty', '90' => 'ninety');
		$digits = array('', 'hundred', 'thousand', 'lakh', 'crore');
		while ($i < $digits_1) {
			$divider = ($i == 2) ? 10 : 100;
			$number = floor($no % $divider);
			$no = floor($no / $divider);
			$i += ($divider == 10) ? 1 : 2;
			if ($number) {
				$plural = (($counter = count($str)) && $number > 9) ? 's' : null;
				$hundred = ($counter == 1 && $str[0]) ? ' and ' : null;
				$str[] = ($number < 21) ? $words[$number] .
				" " . $digits[$counter] . $plural . " " . $hundred
				:
				$words[floor($number / 10) * 10]
					. " " . $words[$number % 10] . " "
					. $digits[$counter] . $plural . " " . $hundred;
			} else {
				$str[] = null;
			}

		}
		$str = array_reverse($str);
		$result = implode('', $str);
		$points = ($point) ?
		"." . $words[$point / 10] . " " .
		$words[$point = $point % 10] : '';
		return ucwords($result);
	}

}

?>