<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Gestor_controller extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		$this->load->database();
		$this->load->helper('url');
        $this->load->library("session");
		$this->load->library('Grocery_CRUD');
        $this->load->model('users_model');
		$this->load->helper('url_helper');
		$this->load->helper(array('form', 'url'));
		$this->load->library("form_validation");
		$this->load->library("ion_auth");
        $this->load->model('users_model');
	}

	public function todasLasIncidencias()
    {
        if ($this->ion_auth->in_group('gestor')) {
        $crud = new grocery_CRUD();
		$crud->set_table('incidencia');
		// $crud->columns('id','ip_address','username','email','last_login','active','first_name','last_name','phone');
        // $crud->change_field_type('password','password');

        $output = $crud->render();
        $this->output($output);   
        }
        else{
            $this->session->set_flashdata('access', "¡No tienes permisos para acceder!");
            redirect('');

        }
    }


    public function changePassword()
    {
        
		$data['user'] = $this->ion_auth->user()->row();
		
        $this->load->view('templates/headerInisdeGestor',$data);
        $this->load->view('pages/changePassword.php');		
    }

    



	function output($output = null)
    {
		$data['user']= $this->ion_auth->user()->row();
		$this->load->view('templates/headerInisdeGestor',$data);
        $this->load->view('grocery/index.php',$output);		
    }
}


