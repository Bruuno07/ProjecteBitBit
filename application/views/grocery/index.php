
<?php 
foreach($css_files as $file): ?>
    <link type="text/css" rel="stylesheet" href="<?php echo $file; ?>" />
 
<?php endforeach; ?>
<?php foreach($js_files as $file): ?>
 
    <script src="<?php echo $file; ?>"></script>
<?php endforeach; ?>
<style>
    .mt100{
        margin-top:150px;
        margin-bottom:150px;
    }
</style>

<div class="container-fluid mt100">    
<?php 
echo $output; 
?>
<a  href="<?php echo base_url(''); ?>"><button class="btn btn-primary">Volver al menú principal</button></a>
</div>
