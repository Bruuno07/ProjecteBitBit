<?php defined('BASEPATH') or exit('No direct script access allowed');

class Reparaciones_controller  extends CI_Controller
{

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

	
    public function index()
    {
        $crud = new grocery_CRUD();
        $crud->columns('id','ip_address','username','email','last_login','active','first_name','last_name','phone');
		$crud->set_table('incidencia');
        $output = $crud->render('misreparaciones');
 
        $this->output($output);      
    }

	function output($output = null)
    {
		$data['user']= $this->ion_auth->user()->row();
		$this->load->view('templates/headerInisdeClient',$data);
        $this->load->view('grocery/index.php',$output);		
    }


   
}