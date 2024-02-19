<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contacto || Gastronómica Express</title>
        <link rel="icon" href="Imagenes/Gastronómica-icono.ico" type="image/x-icon">

        <!-- Enlaces a los archivos CSS y JavaScript de Bootstrap desde un CDN --> 
        <link rel="stylesheet" type="text/css" href="css/contacto.css">
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



        <div class="container">
            <div class="row">
                <div class="col-lg-6 vertical-separator">
                    <div class="container-izquierda">
                        <section id="informacion">
                            <h3>Dirección de Almacén</h3>
                            <p>Poligono industrial el Sebadal, </p>
                            <p>Calle Sao Paulo, 1</p>

                            <hr class="hr hr-blurry" />

                            <h3>Nuestro horario</h3>
                            <p>Lunes a viernes: 9:00 - 19:00</p>
                            <p>Sábados: 09:00 - 13:00</p>

                            <hr class="hr hr-blurry" />

                            <h3>Dirección de email</h3>
                            <p><a href="mailto:informacion@gastronomica.es">informacion@gastronomica.es</a></p>

                            <hr class="hr hr-blurry" />

                            <h3>Número telefónico</h3>
                            <p>928 66 88 44</p>

                            <hr class="hr hr-blurry" />

                            <p>Encuéntranos también en:</p>

                            <div class="redes-sociales">
                                <ul>
                                    <li><h1><a href="https://facebook.com/" target="_blank" id="icono"><i class="bi bi-facebook"></i></a></h1></li>
                                    <li><h1><a href="https://instagram.com/" target="_blank" id="icono"><i class="bi bi-instagram"></i></a></h1></li>
                                    <li><h1><a href="https://twitter.com/" target="_blank" id="icono"><i class="bi bi-twitter-x"></i></a></h1></li>
                                </ul>
                            </div>
                        </section>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="container-derecha">        
                        <h3>¿Dónde nos encontramos?</h3>
                        <section id="mapa">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3517.5715168199863!2d-15.413484114080052!3d28.159529465334515!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xc409553ddb456cd%3A0xa54423247dafd16c!2sSebasti%C3%A1n%20Salazar%20S.L.!5e0!3m2!1ses!2ses!4v1702384924673!5m2!1ses!2ses" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </section>
                    </div>
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
        <script src="js/script.js"></script>
    </body>
</html>
