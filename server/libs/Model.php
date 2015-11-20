<?php

/**
 * Model Construction
 */
class Model {

    function __construct() {
        $this->db = new Database(DB_TYPE, DB_HOST, DB_NAME, DB_USER, DB_PASS);
    }
    
    function getIdByName($data){
        $user = $data['user'];        
        $stm = $this->db->prepare('SELECT * FROM `user_accounts` WHERE `username`= "'.$user.'"');
        $stm->execute();        
        $getData = $stm->fetchAll(PDO::FETCH_ASSOC);

        return $getData;
        
    }


}

?>