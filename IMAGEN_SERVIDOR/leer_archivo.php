<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>
<style type="text/css">
	div.figure {
		  float: left;
		  width: 175%;
		/*  border: thin blue solid;*/
		  margin: 0.5em;
		  padding: 0.5em;
		}
div.figure p {
		  text-align: left;
		  font-style: italic;
		  font-size: 14px;
		  text-indent: 0;
		}
img.scaled {
  width: 100%;
}
</style>
<?php 


	require "conexion.php";

	$id="";
	$contenido="";
	$tipo="";

	$sql="SELECT  * from archivos";

	$resultado=mysqli_query($con, $sql);

	while ($fila=mysqli_fetch_array($resultado)) {

		$contenido=$fila['CONTENIDO'];
		$visual='<div class="figure">';
		$visual.="<img src='data:image/jpeg; base64,". base64_encode($contenido)."' width='20%'>";
		$visual.="<p>Imagen de: ". $fila['NOMBRE'] ."</p>";
		$visual.="</div>";
		echo $visual;

	}
	

 ?>



</body>
</html>