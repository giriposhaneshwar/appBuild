<?php 
/**
* Main Controller
*/
class Controller
{
    private $model;
    private $modelMethod = null;
	
	function __construct()
	{
		// echo "this is the main controller";
	}

	public function loadModel($name, $modelPath = 'models/') {
        
        $path = $modelPath . $name.'_model.php';
        // echo $path."\n";

        
        if (file_exists($path)) {
            require $modelPath .$name.'_model.php';
            
            $modelName = $name . '_Model';
            $this->model = new $modelName();
        }      
    }

    public function loadModelMethod($mth, $data){
    	// calling the method to run
    	$this->model->{$mth}($data);
    }
}
 ?>