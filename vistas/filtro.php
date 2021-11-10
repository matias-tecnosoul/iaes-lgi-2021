<?php
session_start();
require('../db/conexionDb.php');
    
    // Si no tiene las credenciales no accede
    if(isset($_SESSION['id_user']) && isset($_SESSION['id_rol'])){
        $sql = 'SELECT idrol from roles where descripcion = "admin"';
        $resultado = mysqli_query($conexion, $sql);
        if (!empty($resultado) && mysqli_num_rows($resultado) != 0){
            $row = mysqli_fetch_assoc($resultado);
        }
        if(isset($row['idrol']) && $row['idrol']!=$_SESSION['id_rol']){
            header('location: ../db/logout.php');
        }
        mysqli_close($conexion);
    }else{
        header('location: ../db/logout.php');
    }
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../assets/css/filtro.css">
    <title>Buscar Alumnos</title>
</head>
<body>
    <div class="content">
        <div id="log_img" class="logo">
            <a href="#" class="logo__link">
            <img
                src="http://www.iaes.edu.ar/wp-content/uploads/2014/08/logo-top-1.png"
                alt="Logo del IAES"
            />
            </a>
        </div>
        <header id="header" class="header_dasboard">
            <a class="header_link" href="./editarCredenciales.php">
                <?php  
                 echo $_SESSION['usuario'];
                //  if(isset($row['nombre'])){echo($row['nombre']);}
                ?>
            </a>
            <a class="header_link" href="./dashboardAdmin.php">Volver</a>
            <a class="header_link" href="../db/logout.php">Salir</a>
        </header>
    </div>
    <!-- <nav class="div_nav">
            <a class="main_link" href="./registro.php">Nuevo Usuario</a>
            <a class="main_link" href="#">Editar Usuario</a>
            <a class="main_link" href="#">Borrar Usuario</a>
    </nav> -->
    <main>
        <div class="separatorFilter">
            <form id="filterData" action="" method="post">
                <div class="firstRow">
                    <label class="label-input" for="carrera">Carrera</label>
                    <select name="carrera" id="carrera">
                        <option value="0">---</option>
                        <option value="1">Analista de Sistemas</option>
                        <option value="2">Administración de Empresas</option>
                        <option value="3">Recursos Humanos</option>
                        <option value="4">Turismo y Gestión Hotelera</option>
                        <option value="5">Régimen Aduanero</option>
                    </select>
                    <label class="label-input" for="localidad">Localidad</label>
                    <select name="localidad" id="localidad">
                        <option value="">---</option>
                        <option value="1">Puerto Rico</option>
                        <option value="2">Capioví</option>
                        <option value="3">Garuhapé</option>
                        <option value="4">Jardín América</option>
                        <option value="5">El Alcázar</option>
                        <option value="6">Puerto Leoni</option>
                        <option value="7">Otro</option>
                    </select>
                    <label class="label-input" for="licencia">Licencia</label>
                    <!-- <input value="1" type="radio" name="licencia" id="licenciaSi">
                    <label for="licenciaSi">Si</label>
                    <input checked value="0" type="radio" name="licencia" id="licenciaNo">
                    <label for="licenciaNo">No</label> -->
                    <select name="licencia" id="licencia">
                        <option value="0">---</option>
                        <option value="1">Si</option>
                        <option value="2">No</option>
                    </select>
                    <label class="label-input" for="vehiculo">vehiculo</label>
                    <select name="vehiculo" id="vehiculo">
                        <option value="0">---</option>
                        <option value="1">Si</option>
                        <option value="2">No</option>
                    </select>
                </div>
                <!-- secondRow -->
                <div class="secondRow">
                    <label class="label-input" for="edad">Edad</label>
                    <input placeholder="Inserte Edad" min=18 max=99 type="number" name="edad" id="edad">
                   
                    <label class="label-input" for="modalidad">Modalidad</label>
                    <select name="modalidad" id="modalidad">
                        <option value="0">---</option>
                        <option value="1">Full-Time</option>
                        <option value="2">Part-Time</option>
                    </select>
                    <!-- <label class="label-input" for="area">Area</label>
                    <select name="area" id="area">
                        <option value="0">---</option>
                        <option value="1">Informática</option>
                        <option value="2">Administración</option>
                        <option value="3">Recursos Humanos</option>
                        <option value="4">Turismo/Gastronomia</option>
                        <option value="5">Ventas</option>
                        <option value="6">Educacion</option>
                        <option value="7">Otros</option>
                    </select> -->

                    <label class="label-input" for="genero">Género</label>
                    <select name="genero" id="genero">
                        <option value="0">---</option>
                        <option value="mujer">Mujer</option>
                        <option value="hombre">Hombre</option>
                        <option value="nobinario">No Binarix</option>
                        <option value="otro">Otros</option>
                    </select>
                    <label class="label-input" for="disponible">Disponibilidad</label>
                    <select name="disponible" id="disponible">
                        <option value="0">---</option>
                        <option value="1">Si</option>
                        <option value="2">No</option>
                    </select>
                </div>
                <!-- thirdRow -->
                <div class="thirdRow">
                    <input placeholder="Buscar..." type="search" name="buscador" id="buscador">
                    <label for="buscador"><svg id="lupa" xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                    </svg></label>
                </div>
            </form>
        </div>

        <!-- ---------------------- PONER UN BUSCADOR ----------------------------- -->
        <div class="div-datos">
            <!-- aca van los resultados de la db -->
        </div>
    </main>
</body>
</html>