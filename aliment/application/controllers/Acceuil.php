<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Acceuil extends CI_Controller {

    public function index () {
        $this->load->view('pages/Acceuil');
    }

    public function getligne ($ligne) {
        header("Content-type:application/json");
        $value = $this -> ligne ->getligne($ligne);   
        echo json_encode($value);  
    }

    
    public function getcordonneeLigne($ligne) {
        $value = $this -> ligne ->getarret($ligne);
        header("Content-type:application/json");
        echo json_encode($value);  
    }
}
 