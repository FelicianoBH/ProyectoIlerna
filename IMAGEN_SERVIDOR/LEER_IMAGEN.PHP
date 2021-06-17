<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>

<?php 

	require "conexion.php";

	$sql="SELECT   PRE_FOTO from precios WHERE PRE_CODIGO = '001'";

	$resultado=mysqli_query($con, $sql);

	while ($fila=mysqli_fetch_array($resultado)) {

		$ruta_img=$fila["PRE_FOTO"];

	}

 ?>

<div>
	
	<img src="/PROYECTO3/IMAGEN_SERVIDOR/<?php echo $ruta_img; ?>" width="10%">

</div>



</body>
</html>