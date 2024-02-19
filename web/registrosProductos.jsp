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
        <div class="col-md-6">
            <div class="table-responsive custom-table">
                <div class="table-wrapper">

                    <% ControladorProductos cp = new ControladorProductos();%>      
                    <%= cp.getPanelView()%>

                </div> 

                <div class="center-buttons">
                    <button type="submit" class="btn btn-info" onclick="window.location.href = 'adminProductos.jsp'"><i class="fa-solid fa-plus"></i> Crear </button>
                </div>
            </div>

        </div>   
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/adminProductos.js"></script>
</html>
