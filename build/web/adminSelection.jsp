<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Selección de Administrador || Gastronómica Express</title>
        <link rel="icon" href="Imagenes/Gastronómica-icono.ico" type="image/x-icon">
        <link rel="stylesheet" href="css/login.css"> <!-- Asegúrate de que la ruta sea correcta -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>

        <div class="container">
            <div class="form-content">

                <h1 id="title">Selección de Administrador</h1>
                <div class="selection-links">
                    <a href="adminProductos.jsp" target="_blank" class="btn-link" rel="noopener noreferrer"><i class="fas fa-box"></i> Gestionar Productos</a>
                    <a href="adminRecetas.jsp" target="_blank" class="btn-link" rel="noopener noreferrer"><i class="fas fa-utensils"></i> Gestionar Recetas</a>
                </div>
                <div class="logout-link">
                    <a href="LogoutServlet" class="btn-link"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a>
                </div>
            </div>
        </div>

        <style>
            .selection-links, .logout-link {
                text-align: center;
                margin-top: 20px;
            }
            .btn-link {
                display: inline-block;
                background-color: #007bff;
                color: white;
                padding: 10px 20px;
                border-radius: 5px;
                text-decoration: none;
                font-weight: bold;
                margin: 10px;
                transition: background-color 0.3s;
            }
            .btn-link:hover {
                background-color: #0056b3;
            }
            .btn-link i {
                margin-right: 8px;
            }
        </style>

        <script src="js/login.js"></script> <!-- Si necesitas algún JavaScript específico -->
    </body>
</html>
