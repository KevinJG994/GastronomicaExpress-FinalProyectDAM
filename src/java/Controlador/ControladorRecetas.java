package Controlador;

import Include.Receta;
import Modelo.ModeloRecetas;
import java.util.ArrayList;

public class ControladorRecetas {

    public boolean crearReceta(Receta r) {
        ModeloRecetas modeloR = new ModeloRecetas();
        return modeloR.crearReceta(r);
    }

    public String getViewRecetas() {

        String htmlCode = "";

        ModeloRecetas modR = new ModeloRecetas();
        int i = 0;

        for (Receta r : modR.getAllRecetas()) {
            // Cada vez que i sea un múltiplo de 4, abre un nuevo contenedor
            if (i % 4 == 0) {
                htmlCode += "<div class=\"row flex-wrap justify-content-center\">";
            }


            htmlCode += "<div class=\"col-lg-3 col-md-4 col-sm-6 mb-5\">\n"
                    + "   <div class=\"cartaReceta text-center\">\n"
                    + "      <img src=" + r.getImagen() + " class=\"img-fluid\" onclick=\"mostrarVentanaEmergente(" + r.getImagen() + ")\">\n"
                    + "      <h3>" + r.getNombre() + "</h3>\n"
                    + "      <h4>" + r.getNombre_chef() + "</h4>\n"
                    + "      <p class=\"descripcionReceta\">" + r.getIngredientes() + "</p>\n"
                    + "      <p class=\"descripcionReceta\">" + r.getDescripcion() + "</p>\n"
                    + "      <h5 class=\"precio\">" + r.getPrecio() + "€</h5>\n"
                    + "         <form action='AgregarCarritoServlet' method='POST'>\n"
                    + "         <input type='hidden' name='usuarioId' value=''>\n" // Asegúrate de asignar el usuarioId dinámicamente
                    + "         <input type='hidden' name='tipo' value='receta'>\n"
                    + "         <input type='hidden' name='itemId' value='" + r.getId() + "'>\n"
                    + "         <input type='hidden' name='cantidad' value='1'>\n" // Puedes ajustar esto según la necesidad
                    + "         <button type='submit' class='btn btn-info btn-lg'>Agregar al carrito</button>\n"
                    + "      </form>\n"
                    + "   </div>\n"
                    + "</div>\n";

            // Cada vez que i sea un múltiplo de 4 o es el último producto, cierra el contenedor
            if ((i + 1) % 4 == 0 || (i + 1) == modR.getAllRecetas().size()) {
                htmlCode += "</div><br>";
            }

            i++;
        }

        return htmlCode;
    }

    public String getPanelView() {
        String htmlCode = "";
        ModeloRecetas mr = new ModeloRecetas();
        ArrayList<Receta> recetas = mr.getAllRecetas();

        htmlCode += "<table class=\"table table-bordered\" id=\"miTabla\">\n"
                + "    <tr>\n"
                + "        <th>ID</th>\n"
                + "        <th>Receta</th>\n"
                + "        <th>Nombre Chef</th>\n"
                + "        <th>Ingredientes</th>\n"
                + "        <th>Descripción</th>\n"
                + "        <th>Precio</th>\n"
                + "    </tr>\n";

        for (Receta r : recetas) {
            htmlCode += "    <tr>\n"
                    + "        <td id='id_receta'>" + r.getId() + "</td>\n"
                    + "        <td>" + r.getNombre() + "</td>\n"
                    + "        <td>" + r.getNombre_chef() + "</td>\n"
                    + "        <td>" + r.getIngredientes() + "</td>\n"
                    + "        <td>" + r.getDescripcion() + "</td>\n"
                    + "        <td>" + r.getPrecio() + "</td>\n"
                    + "        <td><a id='btnModificar' href='editRecetas.jsp?id=" + r.getId() + "'><i class=\"fa-solid fa-pen-to-square\"></i></a> </td> \n"
                    + "        <td><a id='btnEliminar' href=\"\"><i class=\"fa-solid fa-trash-can\"></i></a></td>\n"
                    + "    </tr>\n";
        }

        htmlCode += "</table>";

        return htmlCode;
    }

    public boolean deleteReceta(int id) {
        ModeloRecetas mr = new ModeloRecetas();
        return mr.deleteReceta(id);
    }

    public String getEditViewReceta(int idReceta) {
        ModeloRecetas mr = new ModeloRecetas();
        Receta re = mr.getReceta(idReceta);

        String htmlCode = "";
        htmlCode += "<div class=\"container mt-5\">\n"
                + "        <h1 class=\"text-center mb-4\">Modificar Recetas</h1>\n"
                + "\n"
                + "        <div class=\"row\">\n"
                + "            <div class=\"col-md-6 mx-auto\">\n"
                + "                    <form action=\"modificarReceta\" id='frmModificar' name='frmModificar' method=\"POST\" enctype=\"multipart/form-data\" class=\"custom-form\">\n"
                + "                    <div class=\"form-group\">\n"
                + "                        <div class=\"input-group\">\n"
                + "                            <div class=\"input-group-prepend\">\n"
                + "                            </div>\n"
                + "                            <input type=\"hidden\" class=\"form-control\" id=\"id\" name=\"id\"  value='" + re.getId() + "'>\n"
                + "                        </div>\n"
                + "                    </div>\n"
                + "\n"
                + "                    <div class=\"form-group\">\n"
                + "                        <div class=\"input-group\">\n"
                + "                            <div class=\"input-group-prepend\">\n"
                + "                                <span class=\"input-group-text\"><i class=\"fas fa-lemon\"></i></span>\n"
                + "                            </div>\n"
                + "                            <input type=\"text\" class=\"form-control\" id=\"nombre\" name=\"nombre\"  value='" + re.getNombre() + "'>\n"
                + "                        </div>\n"
                + "                    </div>\n"
                + "\n"
                + "                    <div class=\"form-group\">\n"
                + "                        <div class=\"input-group\">\n"
                + "                            <div class=\"input-group-prepend\">\n"
                + "                                <span class=\"input-group-text\"><i class=\"fa-solid fa-person-dots-from-line\"></i></span>\n"
                + "                            </div>\n"
                + "                            <input type=\"text\" class=\"form-control\" id=\"nombre_chef\" name=\"nombre_chef\"  value='" + re.getNombre_chef() + "'>\n"
                + "                        </div>\n"
                + "                    </div>\n"
                + "\n"
                + "                    <div class=\"form-group\">\n"
                + "                        <div class=\"input-group\">\n"
                + "                            <div class=\"input-group-prepend\">\n"
                + "                                <span class=\"input-group-text\"><i class=\"fa-solid fa-pepper-hot\"></i></span>\n"
                + "                            </div>\n"
                + "                            <input type=\"text\" class=\"form-control\" id=\"ingredientes\" name=\"ingredientes\"  value='" + re.getIngredientes() + "'>\n"
                + "                        </div>\n"
                + "                    </div>\n"
                + "\n"
                + "                    <div class=\"form-group\">\n"
                + "                        <div class=\"input-group\">\n"
                + "                            <div class=\"input-group-prepend\">\n"
                + "                                <span class=\"input-group-text\"><i class=\"fas fa-info-circle\"></i></span>\n"
                + "                            </div>\n"
                + "                            <input type=\"text\" class=\"form-control\" id=\"descripcion\" name=\"descripcion\" value='" + re.getDescripcion() + "'>\n"
                + "                        </div>\n"
                + "                    </div>\n"
                + "\n"
                + "                    <div class=\"form-group\">\n"
                + "                        <div class=\"input-group\">\n"
                + "                            <div class=\"input-group-prepend\">\n"
                + "                                <span class=\"input-group-text\"><i class=\"fas fa-dollar-sign\"></i></span>\n"
                + "                            </div>\n"
                + "                            <input type=\"number\" class=\"form-control\" id=\"precio\" name=\"precio\" step=\"0.01\"  value='" + re.getPrecio() + "'>\n"
                + "                        </div>\n"
                + "                    </div>\n"
                + "\n"
                + "                    <div class=\"center-buttons\">\n"
                + "                        <button  id=\"btnModificar\" type=\\\"submit\" class=\"btn btn-info\"><i class=\"fa-solid fa-pen-to-square\"></i> Modificar </button>\n"
                + "                        <a id=\"btnVerRegistros\" href=\"registrosRecetas.jsp\" class=\"btn btn-info\"> <i class=\"fa-brands fa-readme\"></i> Ver Registros </a>\n"
                + "                       </div>\n"
                + "                </form>\n"
                + "            </div>\n"
                + "        </div>\n"
                + "    </div>";
        return htmlCode;
    }

    public boolean updateReceta(Receta r) {
        ModeloRecetas mr = new ModeloRecetas();
        return mr.updateReceta(r);
    }
}
