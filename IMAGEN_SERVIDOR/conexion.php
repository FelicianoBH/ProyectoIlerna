<?php 
 
	$mysql_host='localhost';
	$mysql_user='feliciano';
	$mysql_pass='feliciano1945';
	$mysql_db='arnet';

	$con = mysqli_connect($mysql_host, $mysql_user, $mysql_pass, $mysql_db);
	if (mysqli_connect_errno()) {

		echo "Error de conexión a la Base de Datos" . mysqli_connect_error();
	}
	@mysqli_query("SET NAMES 'utf8'");

 ?>

