<?php
if ($this->session->flashdata('error')) {
?>
    <div class="alert alert-danger">
        <?php echo $this->session->flashdata('error'); ?>
    </div>
<?php } ?>
<!DOCTYPE html>
<html>

<head>
    <title>Iniciar sesión</title>
    <link rel="stylesheet" href="<?php echo base_url("assets/css/login.css"); ?>" />
    <link rel="stylesheet" href="<?php echo base_url("assets/css/style.css"); ?>" />
</head>

<body>
    <?php echo isset($error) ? $error : ''; ?>

    <div class="wrapper">
        <div class="containerLogin">
            <div class="col-left">
                <div class="login-text">
                <img style="width:60px;" class="mb-5" src="<?php echo base_url("assets/img/login.png") ?>" />
                <br>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget eros dapibus, ultricies tellus vitae, consectetur tortor. Etiam rutrum placerat
                    </p>
                    <a class="btn btn-outline-info" href="<?php echo site_url('register'); ?>">Regístrate</a>
                </div>
            </div>
            <div class="col-right">
                <div class="login-form">
                    <h2 class="ml-4">Iniciar sesión</h2>
                    <form method="POST" action="login">
                        <p>
                            <input name="username" type="text" placeholder="Usuario" required>
                        </p>
                        <p>
                            <input name="password" type="password" placeholder="Contraseña" required>
                        </p>
                        <p>
                            <input class="btn" type="submit" value="Sing In" />
                        </p>
                       
                    </form>
                </div>
            </div>
        </div>
      
    </div>
    <!-- <div class="login-form">
    <form method="post" action="<?php echo site_url('Login_controller/process'); ?>">
        <h2 class="text-center">Log in</h2>       
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Username" name="user" required="required">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" placeholder="Password" name="pass" required="required">
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block">Log in</button>
        </div>
        <div class="clearfix">
            <!-- <label class="pull-left checkbox-inline"><input type="checkbox"> Remember me</label> -->
    <!-- <a href="#" class="pull-right">Forgot Password?</a> -->
    </div>
    </form>
    <!-- <p class="text-center"><a href="#">Create an Account</a></p> -->
    <!-- </div> -->


</body>

</html>
<script>
    $().alert("close");

    $(".alert").delay(2000).slideUp(200, function() {
        $(this).alert('close');
    });
</script>