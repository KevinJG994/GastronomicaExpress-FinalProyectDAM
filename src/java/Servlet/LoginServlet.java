package Servlet;

import Modelo.Conexion;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Intenta verificar al usuario y establecer su rol en la sesión
        if (checkUser(email, password, request.getSession())) {
            navigateUserBasedOnRole(request, response);
        } else {
            // Usuario no válido, enviar mensaje de error
            request.setAttribute("errorMessage", "Credenciales inválidas");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private boolean checkUser(String email, String password, HttpSession session) {
        boolean status = false;
        try (Connection conn = new Conexion().getConnection(); PreparedStatement pstmt = conn.prepareStatement("SELECT idUsuario, userRole FROM usuarios WHERE email = ? AND password = ?")) {

            pstmt.setString(1, email);
            pstmt.setString(2, password);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    // Almacenar tanto el userRole como el idUsuario en la sesión
                    session.setAttribute("userRole", rs.getString("userRole"));
                    session.setAttribute("usuarioId", rs.getInt("idUsuario"));
                    status = true;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error LoginServlet: " + e.getMessage());
            e.printStackTrace();
        }
        return status;
    }

    private void navigateUserBasedOnRole(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String userRole = (String) request.getSession().getAttribute("userRole");
        if (null == userRole) {
            response.sendRedirect("login.jsp");
        } else {
            switch (userRole) {
                case "admin":
                    response.sendRedirect("adminSelection.jsp");
                    break;
                case "usuario":
                    response.sendRedirect("userSelection.jsp");
                    break;
                default:
                    response.sendRedirect("login.jsp");
                    break;
            }
        }
    }

}
