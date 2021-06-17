<?php 
	require "conexion.php";

	$nombre_imagen=$_FILES['imagen']['name'];
	$tipo_imagen=$_FILES['imagen']['type'];
	$tamanio_imagen=$_FILES['imagen']['size'];

	echo var_dump($_POST);
	echo var_dump($_FILES);



	echo $tipo_imagen." tamaño: ".$tamanio_imagen." tipo comparo: ".substr($tipo_imagen, 0, 5);

	if ($tamanio_imagen<=1000000 && substr($tipo_imagen, 0, 5)=="image") {

		$carpeta_destino=$_SERVER['DOCUMENT_ROOT'].'/PROYECTO3/IMAGEN_SERVIDOR/';
		move_uploaded_file($_FILES['imagen']['tmp_name'],$carpeta_destino.$nombre_imagen);
	} else echo " imagen inapropiada ";

	$sql="UPDATE precios SET PRE_FOTO ='$nombre_imagen' WHERE PRE_CODIGO = '001'";

	$resultado=mysqli_query($con, $sql);

	echo "listo";




	mysqli_close($con);

 ?>
