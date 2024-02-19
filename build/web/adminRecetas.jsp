<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Recetas</title>

        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/adminProductos.css">
    </head>
    <body>
        <div class="container mt-5">
            <h1 class="text-center mb-4">Inventario de Recetas</h1>

            <div class="row">
                <div class="col-md-6 mx-auto">           
                    <form action="crearReceta" name="frmRecetas" method="POST" enctype="multipart/form-data" id="frm_recetas" class="custom-form">
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-lemon"></i></span>
                                </div>
                                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Receta">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fa-solid fa-person-dots-from-line"></i></span>
                                </div>
                                <input type="text" class="form-control" id="nombre_chef" name="nombre_chef" placeholder="Chef">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fa-solid fa-pepper-hot"></i></span>
                                </div>
                                <input type="text" class="form-control" id="ingredientes" name="ingredientes" placeholder="Ingredientes">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-info-circle"></i></span>
                                </div>
                                <input type="text" class="form-control" id="descripcion" name="descripcion" placeholder="Descripción">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                                </div>
                                <input type="number" class="form-control" id="precio" name="precio" step="0.01" placeholder="Precio">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-file"></i></span>
                                </div>
                                <input type="file" class="form-control-file" id="archivos" name="archivos" accept=".jpg, .jpeg, .png">
                            </div>
                        </div>
                        <div class="center-buttons">
                            <button id="btnCrearReceta" type="submit" class="btn btn-info"><i class="fa-solid fa-plus"></i> Crear </button>
                            <button  id="btnVerRecetas" type="button" class="btn btn-info" onclick="window.location.href = 'registrosRecetas.jsp'"><i class="fa-brands fa-readme"></i> Ver Registros </button>
                            <button id="btnLimpiar" type="button" class="btn btn-info"><i class="fa-solid fa-broom"></i> Limpiar </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/adminRecetas.js"></script>
        <script type="text/javascript">
                                // Esperar a que el DOM se haya cargado completamente
                                document.addEventListener('DOMContentLoaded', function () {
                                    document.getElementById('btnLimpiar').addEventListener('click', function () {
                                        document.getElementById('frm_recetas').reset();
                                    });
                                });
        </script>
    </body>
</html>