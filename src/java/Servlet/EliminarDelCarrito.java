package Servlet;

import Controlador.ControladorCarrito;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EliminarDelCarrito", urlPatterns = {"/EliminarDelCarrito"})
public class EliminarDelCarrito extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener el ID del ítem a eliminar del carrito
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        int usuarioId = (Integer) request.getSession().getAttribute("usuarioId");

        // Instanciar el controlador del carrito
        ControladorCarrito controladorCarrito = new ControladorCarrito();

        // Intentar eliminar el ítem del carrito
        boolean eliminado = controladorCarrito.eliminarDelCarrito(itemId);

        // Redireccionar de vuelta al carrito con un mensaje según el resultado
        if (eliminado) {
            request.getSession().setAttribute("mensajeExito", "Ítem eliminado correctamente.");
        } else {
            request.getSession().setAttribute("mensajeError", "No se pudo eliminar el ítem.");
        }
        response.sendRedirect("carrito.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Servlet para eliminar ítems del carrito de compras";
    }
}
