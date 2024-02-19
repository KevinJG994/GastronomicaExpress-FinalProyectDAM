<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registro || Gastronómica Express</title>
        <link rel="icon" href="Imagenes/Gastronómica-icono.ico" type="image/x-icon">
        <link rel="stylesheet" href="css/login.css"> <!-- Asegúrate de que el CSS sea adecuado para este formulario también -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>
    <body>
        <div class="container">
            <div class="form-content">
                <h1>Registro</h1>
                <form action="RegistroServlet" method="post">
                    <div class="input-group">
                        <div class="input-field">
                            <i class="fa-solid fa-envelope"></i>
                            <input type="email" placeholder="Email" name="email" required>
                        </div>
                        <div class="input-field">
                            <i class="fa-solid fa-lock"></i>
                            <input type="password" placeholder="Contraseña" name="password" required>
                        </div>
                    </div>
                    <div class="btn-field">
                        <button type="submit">Registrar</button>
                        <button type="button"><a href="login.jsp">¿Ya tienes cuenta? Inicia sesión </button>
                    </div>
                </form>

            </div>
        </div>
    <script>
        // Verifica si la página fue redirigida desde el servlet
        var urlParams = new URLSearchParams(window.location.search);
        var registroExitoso = urlParams.get('registroExitoso');

        // Si el parámetro está presente y es true, muestra el alert
        if (registroExitoso === 'true') {
            alert('Usuario registrado correctamente.');
        }
    </script>
</body>
</html>
