<%@page import="Controlador.ControladorRecetas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Recetas ||Gastronómica Express</title>
        <link rel="icon" href="Imagenes/Gastronómica-icono.ico" type="image/x-icon">

        <!-- Enlaces a los archivos CSS y JavaScript de Bootstrap desde un CDN --> 
        <link rel="stylesheet" type="text/css" href="css/recetas.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    </head>

    <body>

        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-dark text-center py-3">
                <div class="container-fluid">
                    <div class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                         aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </div>
                    <img src="Imagenes/Gastronómica.png" id="gastro">
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav mx-auto">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" id="index" href="#">Inicio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="productos" href="#">Productos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="recetas" href="#">Recetas</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="contacto" href="#">Contacto</a>
                            </li>
                        </ul>
                    </div>
                    <div>                
                        <input type="checkbox" id="carrito-checkbox" class="carrito-checkbox">
                        <label for="carrito-checkbox" class="carrito-label">
                            <h1><i class="bi bi-basket2-fill" id="cesta"></i>
                            <i class="bi bi-person-fill" id="login"></i></h1>
                        </label>        
                    </div>
                </div>
            </nav>
        </header>

        <div class="contenido">
            <div class="panelPortada">
                <img src="Imagenes/verduras.jpg" id="img-portada" > 
            </div>
            <div class="descripcion"> 
                <img src="Imagenes/comoFunciona.jpg" id="img-panelInformativo"> 
                <img src="Imagenes/comoFunciona2.jpg" id="img-panelInformativo2"> 
            </div>
        </div>


        <div class="container mt-5">

            <hr class="hr hr-blurry" />

            <h2 class="text-center mb-2" id="titulo">Recetas disponibles esta semana</h2>

            <hr class="hr hr-blurry" />
            <div id="contenedor-recetas" class="container mt-5">
                <% ControladorRecetas cr = new ControladorRecetas();%>
                <%= cr.getViewRecetas()%>

            </div> 
        </div>

        <footer class="bg-dark text-light text-center py-3">
            <p>Gastronómica Express || Todos los derechos reservados &copy; 2024</p>
            <p>Buscanos en las redes sociales</p>
            <div class="redes-sociales">
                <ul> 
                    <li><h1><a href="https://facebook.com/" target="_blank" id="icono"><i class="bi bi-facebook"></i></a></h1></li>
                    <li><h1><a href="https://instagram.com/" target="_blank" id="icono"><i class="bi bi-instagram"></i></a></h1></li>
                    <li><h1><a href="https://twitter.com/" target="_blank" id="icono"><i class="bi bi-twitter-x"></i></a></h1></li>
                </ul>
            </div>   
        </footer>

        <script src="js/recetas.js"></script>
        <script src="js/script.js"></script>
    </body>
</html>
