<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Front_office_CI extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function verify_age($age){
		if ($age<16) {
			throw new Exception("Trop jeune pour suivre un régime");
		} elseif ($age>100) {
			throw new Exception("Très agés pour suivre un régime");
		}
	}

	public function verify_data(){
		$erreur = null;
		$name = $this->input->post('name');
		$email = $this->input->post('email');
		$password = $this->input->post('password');
		$genre = $this->input->post('genre');
		$age = $this->input->post('age');
		$taille = $this->input->post('taille');
		$poids = $this->input->post('poids');
		try {
			$this->verify_age($age);
		} catch (Exception $e) {
			$erreur = $e->getMessage();
		}
		if ($erreur == null) {
			$this->insert_user($name,$email,$password,$genre,$age,$taille,$poids);
		}
		return $erreur;
	}

	
	public function insert_user($name,$email,$password,$genre,$age,$taille,$poids){
		$this->front_office_model->insert_user($name,$email,$password,$genre,$age,$taille,$poids);
		$this->load->view('connexion');
	}	
    
    public function verify_user(){
		$rep = 1;
        $email = $this->input->post('email');
		$password = $this->input->post('password');

		$user = $this->front_office_model->verify_user($email,$password);
        if ($user != null) {
			$this->session->set_userdata('user',$user);
			$rep = null;
        }
		return $rep;
    }

	public function inscription(){
		$this->load->view('inscription');
	}
}
?>