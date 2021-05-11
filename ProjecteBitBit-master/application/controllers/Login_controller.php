<?php defined('BASEPATH') or exit('No direct script access allowed');

class Login_controller  extends CI_Controller
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
        $this->load->view('login/index');
        $this->load->view('templates/footer');
    }

    public function login()
    {

        // validate form input
        $this->form_validation->set_rules('username', 'Usuario', 'required');
        $this->form_validation->set_rules('password', 'Contraseña', 'required');

        if ($this->form_validation->run() === TRUE) {


            if ($this->ion_auth->login($this->input->post('username'), $this->input->post('password'))) {

                $this->session->set_flashdata('message', $this->ion_auth->messages());
                if (!$this->ion_auth->logged_in()) {
                    // redirect them to the login page
                    // if(){

                    // }
                    redirect('auth/login', 'refresh');
                } else if (!$this->ion_auth->is_admin()) // remove this elseif if you want to enable this for non-admins
                {
                    // redirect them to the home page because they must be an administrator to view this
                    show_error('You must be an administrator to view this page.');
                } else {
                    redirect('', 'refresh');
                }
            } else {

                $this->session->set_flashdata('message', $this->ion_auth->errors());
                redirect('login', 'refresh');
            }
        } else {
            $this->load->view('templates/header');
            $this->load->view('login/index');
            $this->load->view('templates/footer');
        }
    }

    public function process()
    {
        $this->session->unset_userdata('error');
        $user = $this->input->post('user');
        $pass = $this->input->post('pass');
        $hashedpass = hash('sha256', $pass);

        $query = $this->users_model->check($user, $hashedpass);
        if (!empty($query[0])) {
            $this->session->set_userdata(array('user' => $user));
            redirect(base_url('Noticies_controller/index'));
        } else {
            $this->session->set_flashdata('error', "Revisa les credencials");
            $this->load->view('templates/header');
            $this->load->view('login/index');
            $this->load->view('templates/footer');
        }
    }


    public function logout()
    {
        //removing session  
        $this->session->unset_userdata('user');
        redirect(base_url('Login_controller/index'));
    }
}
