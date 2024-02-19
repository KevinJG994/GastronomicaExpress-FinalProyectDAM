package Servlet;

import Include.CarritoItem;
import Modelo.ModeloCarrito;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AgregarCarritoServlet", urlPatterns = {"/AgregarCarritoServlet"})
public class AgregarCarritoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        // Verificar si el usuario está logueado
        Integer usuarioId = (Integer) request.getSession().getAttribute("usuarioId");
        if (usuarioId == null) {
            // No hay sesión de usuario, redirigir a página de login
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Obtener los parámetros del formulario
            String tipo = request.getParameter("tipo");
            int itemId = Integer.parseInt(request.getParameter("itemId"));
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));

            // Crear un objeto CarritoItem
            CarritoItem item = new CarritoItem();
            item.setUsuarioId(usuarioId);
            item.setTipo(tipo);
            item.setItemId(itemId);
            item.setCantidad(cantidad);
            // Aquí asumimos que el precio se maneja de otra manera, 
            // ya que normalmente se recuperaría de la base de datos o de una sesión

            // Instanciar el modelo del carrito y agregar el producto al carrito
            ModeloCarrito modelo = new ModeloCarrito();
            boolean agregado = modelo.agregarAlCarrito(item);

            // Redireccionar según el resultado de la operación
            if (agregado) {
                response.sendRedirect("productos.jsp"); // Página a la que redireccionar después de agregar al carrito
            } else {
                response.sendRedirect("error.jsp"); // Página de error si falla la operación
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Página de error en caso de excepción
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

