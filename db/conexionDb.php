<?php

// COMENTAR LOS DATOS LOCALES, Y DESCOMENTAR LOS DATOS PARA SERVIDOR IAES


$servername = "localhost";
// $servername = "https://iaes.edu.ar/phpmyadmin";
$username = "root";
// $username = "lgi21@iaes.edu.ar";
$password = "";
// $password = "lwBx0c4dPEpKsgA";
$db = "proyecto2021";
// $db = "iaes_lgi21";

$conexion = mysqli_connect($servername, $username, $password, $db);

if (!$conexion) {
  die("conexion fallida, error: " . mysqli_connect_error());
}
?>
