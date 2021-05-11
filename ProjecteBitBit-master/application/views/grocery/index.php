
<?php 
foreach($css_files as $file): ?>
    <link type="text/css" rel="stylesheet" href="<?php echo $file; ?>" />
 
<?php endforeach; ?>
<?php foreach($js_files as $file): ?>
 
    <script src="<?php echo $file; ?>"></script>
<?php endforeach; ?>

<div class="container-fluid">    
<?php 
echo $output; 
?>
<a  href="<?php echo base_url('noticies_controller/index'); ?>"><button class="btn btn-primary">Tornar al menú principal</button></a>
</div>
