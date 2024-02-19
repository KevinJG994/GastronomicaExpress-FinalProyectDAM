
<%@page import="Controlador.ControladorRecetas"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gastronómica Express</title>
        <link rel="icon" href="Imagenes/Gastronómica-icono.ico" type="image/x-icon">

        <!-- Enlaces a los archivos CSS y JavaScript de Bootstrap desde un CDN --> 
        <link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/style.css">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    </head>

    <body>
        <!-- Encabezado (Header) con barra de navegación -->
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

        <!-- Cuerpo (Body) de la página -->
        <div class="container mt-5">
            <section id="principal">
                <div class="carousel-container">
                    <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
                        <h2 class="text-center m-4" id="titulo"> Bienvenido a nuestra web</h2>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="Imagenes/platos.jpg" class="d-block w-100 img-fluid">
                            </div>
                            <div class="carousel-item">
                                <img src="Imagenes/platos2.jpg" class="d-block w-100 img-fluid">
                            </div>
                            <div class="carousel-item">
                                <img src="Imagenes/ingredientes-funcionales.jpg" class="d-block w-100 img-fluid">
                            </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                    <a href="#" type="button" class="btn btn-info btn-lg" id="btnProductos">Ver productos</a>
                </div>
            </section>

            <hr class="hr hr-blurry" />

            <div class="info-container">
                <div class="row">
                    <div class="col-md-3 border-end">
                        <h1><i class="bi bi-clipboard2-pulse-fill"></i> Recetas</h1>
                        <h5>Recetas unicas de reconocidos Chefs</h5>
                    </div>
                    <div class="col-md-3 border-end">
                        <h1><i class="bi bi-cup-hot-fill"></i> Productos</h1>
                        <h5>Productos frescos para tus elaboraciones</h5>
                    </div>
                    <div class="col-md-3 border-end">
                        <h1><i class="bi bi-calendar-week"></i> Novedades</h1>
                        <h5>Nuevas recetas cada semana</h5>
                    </div>
                    <div class="col-md-3">
                        <h1><i class="bi bi-box-seam-fill"></i> Envios</h1>
                        <h5>Envios y pagos seguros</h5>
                    </div>
                </div>
            </div>

            <hr class="hr hr-blurry" />

            <h2 class="text-center mb-2" id="titulo">Descubre nuestras recetas</h2>

            <hr class="hr hr-blurry" />

            <div id="productos-destacados mt-5">
                <div id="contenedor-productos" class="container mt-5">
                    <% ControladorRecetas cr = new ControladorRecetas();%>
                    <%= cr.getViewRecetas()%>

                </div>  
            </div>

        </div>

        <!-- Pie de página (Footer) -->
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
        <script src="js/index.js"></script>
        <script src="js/script.js"></script>
    </body>
</html>