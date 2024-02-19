package Servlet;

import Modelo.Conexion;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "RegistroServlet", value = "/RegistroServlet")
public class RegistroServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String userRole = "usuario";

        Conexion db = new Conexion();
        Connection con = db.getConnection();

        try {
            // Prevenir registros duplicados verificando si el email ya existe
            PreparedStatement psCheck = con.prepareStatement("SELECT * FROM usuarios WHERE email = ?");
            psCheck.setString(1, email);
            ResultSet resultSet = psCheck.executeQuery();

            if (!resultSet.next()) {
                PreparedStatement ps = con.prepareStatement("INSERT INTO usuarios (email, password, userRole) VALUES (?, ?, ?)");
                ps.setString(1, email);
                ps.setString(2, password);
                ps.setString(3, userRole);

                int result = ps.executeUpdate();
                if (result > 0) {
                    response.sendRedirect("login.jsp");           
                } else {
                    // Manejo del caso en que la inserción falle
                    request.setAttribute("errorMessage", "No se pudo registrar el usuario.");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("registro.jsp");
                    dispatcher.forward(request, response);
                }
            } else {
                // Manejo del caso en que el email ya existe
                request.setAttribute("errorMessage", "El email ya está registrado.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("registro.jsp");
                dispatcher.forward(request, response);
            }
        } catch (IOException | SQLException | ServletException e) {
            e.printStackTrace();
            // Manejo de errores generales
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
