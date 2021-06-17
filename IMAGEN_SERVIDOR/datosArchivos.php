<?php 
	require "conexion.php";

	$nombre_archivo=$_FILES['archivo']['name'];
	$tipo_archivo=$_FILES['archivo']['type'];
	$tamanio_archivo=$_FILES['archivo']['size'];


	if ($tamanio_archivo<=1000000) {

		$carpeta_destino=$_SERVER['DOCUMENT_ROOT'].'/PROYECTO3/IMAGEN_SERVIDOR/';
		move_uploaded_file($_FILES['archivo']['tmp_name'],$carpeta_destino.$nombre_archivo);

	} else echo " imagen inapropiada ";

	$archivo_objetivo=fopen($carpeta_destino.$nombre_archivo, "r");

	$contenido=fread($archivo_objetivo, $tamanio_archivo);

	$contenido=addslashes($contenido);

	fclose($archivo_objetivo);

	$sql="INSERT INTO archivos (ID, NOMBRE, TIPO, CONTENIDO) VALUES (0, '$nombre_archivo', '$tipo_archivo', '$contenido')";


	//$sql="UPDATE precios SET PRE_FOTO ='$nombre_imagen' WHERE PRE_CODIGO = '001'";

	$resultado=mysqli_query($con, $sql);

	if(mysqli_affected_rows($con)>0) echo " Ok registro de archivo";

	mysqli_close($con);

 ?>
