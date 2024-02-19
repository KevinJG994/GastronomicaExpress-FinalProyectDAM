package Controlador;

import Include.Producto;
import Modelo.ModeloProductos;
import java.util.ArrayList;

public class ControladorProductos {

    public boolean crearProducto(Producto p) {
        ModeloProductos modeloP = new ModeloProductos();
        return modeloP.crearProducto(p);
    }

    public String getViewProductos() {

        String htmlCode = "";

        ModeloProductos modP = new ModeloProductos();
        int i = 0;
        for (Producto p : modP.getAllProductos()) {

            // Cada vez que i sea un múltiplo de 4, abre un nuevo contenedor
            if (i % 4 == 0) {
                htmlCode += "<div class=\"row flex-wrap justify-content-center\">\n" +
"        <div id=\"ventana-emergente\" class=\"ventana-emergente\">\n" +
"          <span class=\"cerrar\" onclick=\"cerrarVentanaEmergente()\">&times;</span>\n" +
"          <img src=\"\" id=\"imagen-ampliada\" alt=\"Producto Ampliado\">\n" +
"        </div>";
            }
            
            
            htmlCode += "<div class=\"col-lg-3 col-md-4 col-sm-6 mb-5\">\n"
                    + "   <div class=\"cartaProducto text-center\">\n"
                    + "      <img src="+p.getImagen()+" class=\"img-fluid\" onclick=\"mostrarVentanaEmergente('"+p.getImagen()+"')\">\n"
                    + "      <h3>" + p.getNombre() + "</h3>\n"
                    + "      <p class=\"descripcionProducto\">" + p.getDescripcion() + "</p>\n"
                    + "      <h5 class=\"precio\">" + p.getPrecio() + "€</h5>\n"
                    + "      <p class=\"origenProducto\">" + p.getOrigen() + "</p>\n"
                    + "      <form action='AgregarCarritoServlet' method='POST'>\n"
                    + "         <input type='hidden' name='usuarioId' value=''>\n"
                    + "         <input type='hidden' name='tipo' value='producto'>\n"
                    + "         <input type='hidden' name='itemId' value='" + p.getId() + "'>\n"
                    + "         <input type='hidden' name='cantidad' value='1'> <!-- Puedes modificar esto para aceptar cantidades diferentes -->\n"
                    + "         <button type='submit' class='btn btn-info btn-lg'>Agregar al carrito</button>\n"
                    + "      </form>\n"
                    + "   </div>\n"
                    + "</div>\n";
            
            // Cada vez que i sea un múltiplo de 4 o es el último producto, cierra el contenedor
            if ((i + 1) % 4 == 0 || (i + 1) == modP.getAllProductos().size()) {
                htmlCode += "</div><br>";
            }
            i++;
        }
        return htmlCode;
    }

    public String getPanelView() {
        String htmlCode = "";
        ModeloProductos mp = new ModeloProductos();
        ArrayList<Producto> productos = mp.getAllProductos();

        htmlCode += "<table class=\"table table-bordered\" id=\"miTabla\">\n"
                + "    <tr>\n"
                + "        <th>ID</th>\n"
                + "        <th>Producto</th>\n"
                + "        <th>Descripción</th>\n"
                + "        <th>Precio</th>\n"
                + "        <th>Origen</th>\n"
                + "    </tr>\n";

        for (Producto p : productos) {
            htmlCode += "    <tr>\n"
                    + "        <td id='id_producto'>" + p.getId() + "</td>\n"
                    + "        <td>" + p.getNombre() + "</td>\n"
                    + "        <td>" + p.getDescripcion() + "</td>\n"
                    + "        <td>" + p.getPrecio() + "</td>\n"
                    + "        <td>" + p.getOrigen() + "</td>\n"
                    + "        <td><a id='btnModificar' href='editProductos.jsp?id=" + p.getId() + "'><i class=\"fa-solid fa-pen-to-square\"></i></a> </td> \n"
                    + "        <td><a id='btnEliminar' href=\"\"><i class=\"fa-solid fa-trash-can\"></i></a></td>\n"
                    + "    </tr>\n";
        }

        htmlCode += "</table>";

        return htmlCode;
    }

    public boolean deleteProducto(int id) {
        ModeloProductos mp = new ModeloProductos();
        return mp.deleteProducto(id);
    }

    public String getEditViewProducto(int idProducto) {
        ModeloProductos mp = new ModeloProductos();
        Producto pr = mp.getProducto(idProducto);

        String htmlCode = "";
        htmlCode += "<div class=\"container mt-5\">\n"
                + "        <h1 class=\"text-center mb-4\">Modificar Productos</h1>\n"
                + "\n"
                + "        <div class=\"row\">\n"
                + "            <div class=\"col-md-6 mx-auto\">\n"
                + "                    <form action=\"modificarProducto\" id='frmModificar' name='frmModificar' method=\"POST\" enctype=\"multipart/form-data\" class=\"custom-form\">\n"
                + "                    <div class=\"form-group\">\n"
                + "                        <div class=\"input-group\">\n"
                + "                            <div class=\"input-group-prepend\">\n"
                + "                            </div>\n"
                + "                            <input type=\"hidden\" class=\"form-control\" id=\"id\" name=\"id\"  value='" + pr.getId() + "'>\n"
                + "                        </div>\n"
                + "                    </div>\n"
                + "\n"
                + "                    <div class=\"form-group\">\n"
                + "                        <div class=\"input-group\">\n"
                + "                            <div class=\"input-group-prepend\">\n"
                + "                                <span class=\"input-group-text\"><i class=\"fas fa-lemon\"></i></span>\n"
                + "                            </div>\n"
                + "                            <input type=\"text\" class=\"form-control\" id=\"nombre\" name=\"nombre\"  value='" + pr.getNombre() + "'>\n"
                + "                        </div>\n"
                + "                    </div>\n"
                + "\n"
                + "                    <div class=\"form-group\">\n"
                + "                        <div class=\"input-group\">\n"
                + "                            <div class=\"input-group-prepend\">\n"
                + "                                <span class=\"input-group-text\"><i class=\"fas fa-info-circle\"></i></span>\n"
                + "                            </div>\n"
                + "                            <input type=\"text\" class=\"form-control\" id=\"descripcion\" name=\"descripcion\" value='" + pr.getDescripcion() + "'>\n"
                + "                        </div>\n"
                + "                    </div>\n"
                + "\n"
                + "                    <div class=\"form-group\">\n"
                + "                        <div class=\"input-group\">\n"
                + "                            <div class=\"input-group-prepend\">\n"
                + "                                <span class=\"input-group-text\"><i class=\"fas fa-dollar-sign\"></i></span>\n"
                + "                            </div>\n"
                + "                            <input type=\"number\" class=\"form-control\" id=\"precio\" name=\"precio\" step=\"0.01\"  value='" + pr.getPrecio() + "'>\n"
                + "                        </div>\n"
                + "                    </div>\n"
                + "\n"
                + "                    <div class=\"form-group\">\n"
                + "                        <div class=\"input-group\">\n"
                + "                            <div class=\"input-group-prepend\">\n"
                + "                                <span class=\"input-group-text\"><i class=\"fas fa-globe\"></i></span>\n"
                + "                            </div>\n"
                + "                            <input type=\"text\" class=\"form-control\" id=\"origen\" name=\"origen\"  value='" + pr.getOrigen() + "'>\n"
                + "                        </div>\n"
                + "                    </div>\n"
                + "\n"
                + "                    <div class=\"center-buttons\">\n"
                + "                        <button id=\"btnModificar\" type=\"submit\" class=\"btn btn-info\"><i class=\"fa-solid fa-pen-to-square\"></i> Modificar </button>\n"
                + "                        <a id=\"btnVerRegistros\" href=\"registrosProductos.jsp\" class=\"btn btn-info\"> <i class=\"fa-brands fa-readme\"></i> Ver Registros </a>\n"
                + "                       </div>\n"
                + "                </form>\n"
                + "            </div>\n"
                + "        </div>\n"
                + "    </div>";
        return htmlCode;
    }

    public boolean updateProducto(Producto p) {
        ModeloProductos mp = new ModeloProductos();
        return mp.updateProducto(p);
    }
}
