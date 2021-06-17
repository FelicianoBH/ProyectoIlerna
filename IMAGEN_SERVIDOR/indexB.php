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
			$(document).ready(function() {
			    $(".upload").on('click', function() {
			        var formData = new FormData();
			        var files = $('#image')[0].files[0];
			        alert(files);
			        formData.append('file',files);

			        $.ajax({
			            url: 'datosArchivosB.php',
			            type: 'post',
			            data: formData,
			            contentType: false,
			            processData: false,
			            success: function(response) {
			            	alert(response);
			                if (response != 0) {
			                    $(".card-img-top").attr("src", response);
			                } else {
			                    alert('Formato de imagen incorrecto.');
			                }
			            }
			        });
			        return false;
			    });
			});

</script>
</head>
<body>

		<form method="post" action="#" enctype="multipart/form-data">
		    <div class="card" style="width: 18rem;">
		        <img id ="aqui" class="card-img-top" src="/PROYECTO3/IMAGEN_SERVIDOR/tato.jpg">
		        <div class="card-body">
		            <h5 class="card-title">Sube una foto</h5>
		            <p class="card-text">Sube una imagen...</p>
		            <div class="form-group">
		                <label for="image">Nueva imagen</label>
		                <input type="file" class="form-control-file" name="image" id="image">
		            </div>
		            <input type="button" class="btn btn-primary upload" value="Subir">
		        </div>
		    </div>
		</form>

</body>

</html>
