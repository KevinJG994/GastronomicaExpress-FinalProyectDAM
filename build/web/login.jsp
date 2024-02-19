<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login || Gastronómica Express</title>
        <link rel="icon" href="Imagenes/Gastronómica-icono.ico" type="image/x-icon">
        <link rel="stylesheet" href="css/login.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>

        <div class="container">
            <div class="form-content">

                <h1 id="title">Iniciar Sesión</h1>
                <!-- Cambiar el action del formulario según el modo (login o registro) -->
                <form id="authForm" action="LoginServlet" method="post">
                    <div class="input-group">
                        <div class="input-field">
                            <i class="fa-solid fa-envelope"></i>
                            <input type="email" placeholder="Email" name="email" required>
                        </div>
                        <div class="input-field">
                            <i class="fa-solid fa-lock"></i>
                            <input type="password" placeholder="Contraseña" name="password" required>
                        </div>
                        <p>Bienvenido a la familia<a href="#">Gastrónomica Express</a></p>
                        <img src="Imagenes/Gastronómica.png" id="gastro">
                    </div>
                    <div class="btn-field">
                        <button type="button" id="toggleForm"><a href="registro.jsp">¿Eres Nuevo? Regístrate</a></button>
                        <button type="submit" id="submitBtn">Login</button>
                    </div>
                </form>
            </div>
        </div>

        <script src="js/login.js"></script>
    </body>
</html>
