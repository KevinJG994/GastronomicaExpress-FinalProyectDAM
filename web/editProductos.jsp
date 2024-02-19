<%@page import="Controlador.ControladorProductos"%>


<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Productos</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/adminProductos.css">
    </head>

    <body>

        <% ControladorProductos cp = new ControladorProductos();
                int idProducto = Integer.parseInt(request.getParameter("id"));%>  

        <%= cp.getEditViewProducto(idProducto)%>

        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/adminProductos.js"></script>
    </body>
</html>