<?php
session_start();
require('./conexionDb.php');

function validar_input($data)
{	
	$data = stripslashes($data);
	$data = htmlspecialchars($data);
	return $data;
}
$update = false;
$idloc = $_SESSION['id_user'];
$error = false;

$usuario = validar_input($_POST["usuario"]);
$apellido = validar_input($_POST["apellido"]);
$fechanacimiento = validar_input($_POST["fechanacimiento"]);
$progs = validar_input($_POST["progs"]);
$correo =  validar_input($_POST["email"]);
$contacto = validar_input($_POST["contacto"]);
$domicilio = validar_input($_POST["domicilio"]);
$cursos = validar_input($_POST["cursos"]);
$discapacidades = validar_input($_POST["discapacidades"]);
$dni = $_POST["dni"];
$ecivil = $_POST["ecivil"];
$localidad = $_POST["localidad"];
$departamento = $_POST["departamento"];
$provincia = $_POST["provincia"];
$idpais = $_POST["pais"];
$situacionlab = $_POST["slaboral"];
$area = $_POST["area"];
$salariomin	= $_POST["salariomin"];
$habilidades = $_POST["habilidades"];
$modalidad = $_POST["modalidad"];
$genero = $_POST["genero"];
$licencia = $_POST["licencia"];
$carrera = $_POST["carh"];
$dispoviajar = $_POST["dv"];
$dispomuda = $_POST["dcr"];
if (isset($_POST["auto"])) {
	$auto = $_POST["auto"];
} else {
	$auto = 2;
}
//-------------------------------------------------------------------------------------------IDIOMAS
if (isset($_POST["idiomas"])) {
	$idiomas = $_POST["idiomas"];
	//Trae los idiomas guardados del usuario segun id usuario
	$datos = mysqli_query($conexion, "SELECT idi FROM idioxuser WHERE iduser='$idloc'");
	if(!$datos){
		$error = 1;
	}
	//comprueba si no hay idiomas guardados
	if (mysqli_num_rows($datos) == 0) {
		//se guardan los idiomas ingresados
		for ($y = 0; $y < count($idiomas); $y++) {
			$aux = $idiomas[$y];
			$x = mysqli_query($conexion, "INSERT INTO idioxuser (iduser, idi) VALUES ('$idloc','$aux')");
			if(!$x){
				$error = 2;
			}
		}
	} else {
		$b = 0;
		// For de los idiomas ingresados
		for ($y = 0; $y < count($idiomas); $y++) {
			while ($fila = mysqli_fetch_row($datos)) {
				if ($idiomas[$y] == $fila[0]) {
					$b = 1;
				}
			}
			if ($b == 0) {
				$aux = $idiomas[$y];
				$x = mysqli_query($conexion, "INSERT INTO idioxuser (iduser, idi) VALUES ('$idloc','$aux')");
				if(!$x){
					$error = 3;
				}

			} else {
				$b = 0;
				$datos = mysqli_query($conexion, "SELECT idi FROM idioxuser WHERE iduser='$idloc'");
				if(!$datos){
					$error = 4;
				}
			}
		}
		$datos = mysqli_query($conexion, "SELECT idi FROM idioxuser WHERE iduser='$idloc'");
		if(!$datos){
			$error = 5;
		}
		while ($fila = mysqli_fetch_row($datos)) {
			$b = 0;
			//For de los idiomas guardados
			for ($y = 0; $y < count($idiomas); $y++) {

				//Busca en los registro si ya existe el idioma a cargar	
				if ($idiomas[$y] == $fila[0]) {
					$b = 1;
				}
			}
			if ($b != 1) {
				$borrar = mysqli_query($conexion, "DELETE FROM `idioxuser` WHERE iduser='$idloc' AND idi='$fila[0]'");
				if(!$borrar){
					$error = 6;
				}
			}
		}
	}
}
//-------------------------------------------------------------------------------FOTO
if (isset($_FILES["foto"])) {
	$fotobd = mysqli_query($conexion, "SELECT foto FROM usuario WHERE idloc='$idloc'");
	if(!$fotobd){
		$error = 7;
	}
	$row = mysqli_fetch_array($fotobd);
	if ($row[0]) {
		if (!unlink('../db/images/' . $row[0])) {
			$error = 8;
		}
	}
	$foto = $_FILES['foto']['name'];
	$temp = $_FILES['foto']['tmp_name'];
	if (!move_uploaded_file($temp, "../db/images/" . $foto)) {
		$error = 9;
	}
} else {
	$fotobd = mysqli_query($conexion, "SELECT foto FROM usuario WHERE idloc='$idloc'");
	if(!$fotobd){
		$error = 10;
	}
	$row = mysqli_fetch_array($fotobd);
	if ($row) {
		$foto = $row[0];
	} else {
		$foto = NULL;
	}
}
//-------------------------------------------------------------------------------CV
if (isset($_FILES["pdf"]) && $_FILES["pdf"]['name'] != '') {

	$cvbd = mysqli_query($conexion, "SELECT pdf FROM usuario WHERE idloc='$idloc'");
	if(!$cvbd){
		$error = 11;
	}
	$rowcv = mysqli_fetch_array($cvbd);

	if ($rowcv[0]) {
		if (!unlink('../db/cv/' . $rowcv[0])) {
			$error = 12;
		}
	}
	$pdf = $_FILES['pdf']['name'];
	$temp = $_FILES['pdf']['tmp_name'];
	if (!move_uploaded_file($temp, '../db/cv/' . $pdf)) {
		$error = 13;
	}
} else {
	$cvbd = mysqli_query($conexion, "SELECT pdf FROM usuario WHERE idloc='$idloc'");
	if(!$cvbd){
		$error = 14;
	}
	$rowcv = mysqli_fetch_array($cvbd);

	if ($rowcv) {
		$pdf = $rowcv[0];
	} else {
		$pdf = NULL;
	}
}

//-------------------------------------------------------------------------------------------CARRERA
$x = mysqli_query($conexion, "SELECT * FROM carxuser WHERE iduser='$idloc'");
if(!$x){
	$error = 15;
}
if ($carrera != 0) {
	if (mysqli_num_rows($x) == 0) {

		if (mysqli_query($conexion, "INSERT INTO carxuser (iduser, idcar) VALUES ('$idloc','$carrera')")) {
		} else {
			$error = 16;
		}
	} else {

		if (mysqli_query($conexion, "UPDATE `carxuser` SET `idcar`='$carrera' WHERE iduser='$idloc'")) {
		} else {
			$error = 17;
		}
	}
} else {
	mysqli_query($conexion, "DELETE FROM `carxuser` WHERE iduser='$idloc'");
}

//---------------------------------------------------------------------------------------------TODOS LOS DEMAS DATOS
$query = mysqli_query($conexion, "SELECT * FROM usuario WHERE idloc='$idloc'");
if(!$query){
	$error = 18;
}
if (mysqli_num_rows($query) == 0) {
	$result = mysqli_query($conexion, "INSERT INTO `usuario`(`usuario`, `apellido`, `fechanacimiento`, `dni`, `genero`, `discapacidades`, `correo`, `contacto`, `domicilio`, `localidad`, `departamento`, `provincia`, `idpais`, `idloc`, `cursos`, `pdf`, `licencia`, `auto`, `situacionlab`, `modalidad`, `area`, `salariomin`, `dispoviajar`, `dispomuda`, `habilidades`, `foto`,`progs`,`ecivil`) VALUES ('$usuario', '$apellido', '$fechanacimiento','$dni','$genero','$discapacidades','$correo','$contacto','$domicilio','$localidad','$departamento','$provincia','$idpais','$idloc','$cursos','$pdf','$licencia','$auto','$situacionlab','$modalidad','$area','$salariomin','$dispoviajar','$dispomuda','$habilidades','$foto','$progs','$ecivil')");
	if (!$result) {
		$error = 19;
	}
} else {
	$result = mysqli_query($conexion, "UPDATE `usuario` SET `usuario`='$usuario',`apellido`='$apellido',`fechanacimiento`='$fechanacimiento',`dni`='$dni',`genero`='$genero',`discapacidades`='$discapacidades',`correo`='$correo',`contacto`='$contacto',`domicilio`='$domicilio',`localidad`='$localidad',`departamento`='$departamento',`provincia`='$provincia',`idpais`='$idpais',`idloc`='$idloc',`cursos`='$cursos',`pdf`='$pdf',`licencia`='$licencia',`auto`='$auto',`situacionlab`='$situacionlab',`modalidad`='$modalidad',`area`='$area',`salariomin`='$salariomin',`dispoviajar`='$dispoviajar',`dispomuda`='$dispomuda',`habilidades`='$habilidades',`foto`='$foto',`progs`='$progs',`ecivil`='$ecivil' WHERE idloc = $idloc");
	if (!$result) {
		$error = 20;
	}
}
print json_encode($error);
mysqli_close($conexion);
