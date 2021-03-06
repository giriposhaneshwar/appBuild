<?php 
/**
* Bootstrap Starter page
*/
class Bootstrap
{

	private $_url = null;
	private $_data = null;
    private $_controller = null;

	private $Controller = "controllers/";
	private $Model = "model/";
	
	function init(){
		$this->getUrl();
		
		if(!empty($this->_url[0])){
			$this->_loadController($this->_url[0], $this->_url[1], $this->_data);
		}
	}

	function getUrl(){
		$jsonData = file_get_contents("php://input");

		if(get_magic_quotes_gpc()){
			$d = stripslashes($jsonData);
		}else{
			$d = $jsonData;
		}

		$d = json_decode($d,true);

		// var_dump($d);

		$url = $d['method'];
        $url = rtrim($url, '/');
        $url = filter_var($url, FILTER_SANITIZE_URL);
        $url = explode('/', $url);
		
		// echo "URL : ". $d['method'];
        $this->_url = $url;

        $this->_data = $d['data'];
	}

	// loading the controllers
	function _loadController($url, $method, $data){
		$file = $this->Controller.$url.".php";

		// echo $file. " | ".$method." | ".json_encode($data);

		if(file_exists($file)){
			// getting controller
			require $file;
			// calling the controller
			$this->_controller = new $url();
			$this->_controller->loadModel($url, $this->Model);
			$this->_controller->{$method}($method, $data);
		}else{
			// handeling the error controller here
		}
	}

	


	
}
 ?>