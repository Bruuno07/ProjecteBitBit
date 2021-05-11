<html>

<head>
        <title>CodeIgniter Tutorial</title>
        <script type="text/javascript" src="<?php echo base_url("assets/js/jquery-3.5.1.js"); ?>"></script>
        <script type="text/javascript" src="<?php echo base_url("assets/js/popper.min.js"); ?>"></script>
        <script type="text/javascript" src="<?php echo base_url("assets/js/bootstrap.js"); ?>"></script>
        <link rel="stylesheet" href="<?php echo base_url("assets/css/bootstrap.css"); ?>" />
        <link rel="stylesheet" href="<?php echo base_url("assets/css/css.css"); ?>" />
        <link rel="stylesheet" href="<?php echo base_url("assets/css/all.css"); ?>" />
</head>

<body>

        <nav class="navbar navbar-expand-md navbar-dark bg-dark navbar-fixed-top">
                <a href="<?php echo site_url('Home/index') ?>" class="navbar-brand">Intranet</a>
                        
                <span style="color:white;margin-left:50px;"></span>
                <a style="text-decoration:none;color:white" href="<?php echo site_url('Noticies_controller/index') ?>" >Administrar</a>
                
                <span style="color:white;margin-left:50px;"></span>
                <a style="text-decoration:none;color:white" href="<?php echo site_url('GroceryNoticies_controller/noticies') ?>" >Administrar amb GroceryCRUD</a>
        </span>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse float-right" id="navbarCollapse">
                        <div class="navbar-nav ml-auto"><span style="color:white;margin-right:20px;margin-top:8px">Usuari: <?php echo $this->session->userdata('user'); ?> </span><a href="<?php echo site_url('Login_controller/logout') ?>"><button class="btn btn-light">Log out</button></a></div>
                </div>
        </nav>
        <!-- final del header.php -->