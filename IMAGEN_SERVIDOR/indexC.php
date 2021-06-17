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

<script>
		var sw_ya=false;
			$(document).ready(function() {
			    $("#botonsubir").on('click', function() {
			        var formData = new FormData();
			        var files = $('#image')[0].files[0];
			        formData.append('file',files);

			        $.ajax({
			            url: 'datosArchivosC.php',
			            type: 'post',
			            data: formData,
			            contentType: false,
			            processData: false,
			            success: function(response) {
			                if (response != 0) {
			                    $("#aqui").attr("src", response);
			                   // getElementById("aqui").value=response;
			                } else {
			                    alert('Formato de imagen incorrecto.');
			                }
			            }
			        });
			        return false;
			    });

			    	$("#aqui").on('click', function() {
			       	
			       		if (sw_ya) {

			       				$("#aqui").attr("width", "100%");
			       				sw_ya=false;
			       		} else {
			       				$("#aqui").attr("width", "200%");
			       				sw_ya=true;
			       		}
			    });

			});

</script>
</head>
<body>

		<form method="post" action="#" enctype="multipart/form-data">
		    <div class="card" style="width: 18rem;">
		        <img id ="aqui" width="175%" class="card-img-top" src="/PROYECTO3/IMAGEN_SERVIDOR/tato.jpg">
		        <div class="card-body">
		            <h5 class="card-title">Sube una foto</h5>
		            <p class="card-text">Subid una imagen...</p>
		            <div class="form-group">
		                <label for="image">Nueva imagen</label>
		                <input type="file" class="form-control-file" name="image" id="image">
		            </div>
		            <input type="button" class="btn btn-primary urload" id="botonsubir" value="Subir">
		        </div>
		    </div>
		</form>

</body>

</html>
