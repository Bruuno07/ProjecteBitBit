<?php defined('BASEPATH') or exit('No direct script access allowed');

class UpdatePassword_controller  extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();

		$this->load->model('users_model');
		$this->load->helper('url_helper');
		$this->load->helper(array('form', 'url'));
		$this->load->library("session");
		$this->load->library("form_validation");
		$this->load->library("ion_auth");
	}

	public function index()
	{
		if (!$this->ion_auth->logged_in()) {
			$this->load->view('templates/header');
			$this->load->view('pages/home');
			$this->load->view('templates/footer');
			return;
		}



		$data['user'] = $this->ion_auth->user()->row();
		
		
		$groupClient = 'client';
		$groupTecnico = 'tecnico';
		$groupGestor = 'gestor';

		if($this->ion_auth->in_group($groupClient)) {
			$this->load->view('templates/headerInisdeClient', $data);
			$this->load->view('pages/changePassword');
		}
		else if($this->ion_auth->in_group($groupTecnico)) {
			$this->load->view('templates/headerInisdeTecnico', $data);
			$this->load->view('pages/changePassword');
		}
		else if($this->ion_auth->in_group($groupGestor)) {
			$this->load->view('templates/headerInisdeGestor', $data);
			$this->load->view('pages/changePassword');
		}
	
		$this->load->view('templates/footer');
	
	}

    
public function updatePassword()
	{
		$this->form_validation->set_rules('password', $this->lang->line('create_user_validation_password_label'), 'required|min_length[' . $this->config->item('min_password_length', 'ion_auth') . ']|matches[password_confirm]');
		$this->form_validation->set_rules('password_confirm', $this->lang->line('create_user_validation_password_confirm_label'), 'required');

		$len = $this->input->post('password');

		if(!preg_match_all("/\b[a-zA-Z0-9]{4,}\b/", $len)){
			$this->session->set_flashdata('error', "Revisa las credenciales, recuerda que la contraseña debe contener mas de 4 carácteres");
			redirect('passwdchange');
		}
		
		if ($this->form_validation->run() === TRUE) {
			$password = $this->input->post('password');
		}


		$user = $this->ion_auth->user()->row();
		$query =  $this->db->query("SELECT id FROM users WHERE id =".$user->id);
        $result = $query->result_array();  
        
        $passwordHashed = $this->ion_auth_model->hash_password($password,FALSE,FALSE);
        $this->db->set('password', $passwordHashed);
        $this->db->where('id', $result[0]['id']);
        $this->db->update('users');
		
		redirect('');
	}
}