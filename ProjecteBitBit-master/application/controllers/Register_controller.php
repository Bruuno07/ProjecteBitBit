<?php defined('BASEPATH') or exit('No direct script access allowed');

class Register_controller  extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();

        $this->load->model('users_model');
        $this->load->helper('url_helper');
        $this->load->library("session");
        $this->load->library("form_validation");
        $this->load->library("ion_auth");
    }

    public function index()
    {
        $this->load->view('templates/header');
        $this->load->view('register/index');
        $this->load->view('templates/footer');
    }

    // public function logout()
    // {
    //     //removing session  
    //     $this->session->unset_userdata('user');
    //     redirect(base_url('Login_controller/index'));
    // } 
    public function create_user()
    {

		if (!$this->ion_auth->logged_in() || !$this->ion_auth->is_admin())
		{
			redirect('auth', 'refresh');
		}

		$tables = $this->config->item('tables', 'ion_auth');
	

		// validate form input
		$this->form_validation->set_rules('username', $this->lang->line('create_user_validation_fname_label'), 'trim|required');
		$this->form_validation->set_rules('lastname', $this->lang->line('create_user_validation_lname_label'), 'trim|required');
        $this->form_validation->set_rules('email', $this->lang->line('create_user_validation_email_label'), 'trim|required|valid_email');
        $this->form_validation->set_rules('phone', $this->lang->line('create_user_validation_phone_label'), 'trim');
		$this->form_validation->set_rules('password', $this->lang->line('create_user_validation_password_label'), 'required|min_length[' . $this->config->item('min_password_length', 'ion_auth') . ']|matches[password_confirm]');
		$this->form_validation->set_rules('password_confirm', $this->lang->line('create_user_validation_password_confirm_label'), 'required');

		if ($this->form_validation->run() === TRUE)
		{
			$email = strtolower($this->input->post('email'));
			$identity = $this->input->post('identity');
			$password = $this->input->post('password');

			$additional_data = [
				'first_name' => $this->input->post('username'),
				'last_name' => $this->input->post('lastname'),
				'phone' => $this->input->post('phone'),
			];
		}
		if ($this->form_validation->run() === TRUE && $this->ion_auth->register($identity, $password, $email, $additional_data))
		{
            // redirect them back to the admin page
			// check to see if we are creating the user
			$this->session->set_flashdata('message', $this->ion_auth->messages());
			redirect("auth", 'refresh');
		}
		else
		{
			
			$this->data['message'] = (validation_errors() ? validation_errors() : ($this->ion_auth->errors() ? $this->ion_auth->errors() : $this->session->flashdata('message')));

			$this->data['first_name'] = [
				'name' => 'first_name',
				'id' => 'first_name',
				'type' => 'text',
				'value' => $this->form_validation->set_value('first_name'),
			];
			$this->data['last_name'] = [
				'name' => 'last_name',
				'id' => 'last_name',
				'type' => 'text',
				'value' => $this->form_validation->set_value('last_name'),
			];
			$this->data['identity'] = [
				'name' => 'identity',
				'id' => 'identity',
				'type' => 'text',
				'value' => $this->form_validation->set_value('identity'),
			];
			$this->data['email'] = [
				'name' => 'email',
				'id' => 'email',
				'type' => 'text',
				'value' => $this->form_validation->set_value('email'),
			];
			$this->data['company'] = [
				'name' => 'company',
				'id' => 'company',
				'type' => 'text',
				'value' => $this->form_validation->set_value('company'),
			];
			$this->data['phone'] = [
				'name' => 'phone',
				'id' => 'phone',
				'type' => 'text',
				'value' => $this->form_validation->set_value('phone'),
			];
			$this->data['password'] = [
				'name' => 'password',
				'id' => 'password',
				'type' => 'password',
				'value' => $this->form_validation->set_value('password'),
			];
			$this->data['password_confirm'] = [
				'name' => 'password_confirm',
				'id' => 'password_confirm',
				'type' => 'password',
				'value' => $this->form_validation->set_value('password_confirm'),
			];

			
		}
    }
}
