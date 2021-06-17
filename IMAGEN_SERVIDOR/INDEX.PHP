<!DOCTYPE html>
<html>
<head>
	<title></title>
	<script type="text/javascript" src="../proyecto/controlador/jquery/jquery-3.4.1.min.js"></script>
	<style type="text/css">
		table {
			margin:auto;
			width:450px;
			border:2px dotted #FF0000;
		}
	</style>
</head>
<body>
	<body>
		<form  action="datosArchivos.php" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td>
						<label for="imagen">Imagen:</label>
					</td>
					<td><input  type="file" name="archivo" size="20"></td>
				</tr>
				<tr><td colspan="2" style="text-align:center"><input type="submit" value="Enviar Archivo" ></td></tr>
			</table>
		</form>
	
	</body>


</script>

</body>
</html>