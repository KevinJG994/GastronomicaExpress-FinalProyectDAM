package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    private String userName = "root";
    private String pass = "";
    private String className = "com.mysql.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/gastronomica";
    private Connection con;

    public Conexion() {
        try {
            Class.forName(className);
            con = (Connection) DriverManager.getConnection(url, userName, pass);
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println(e.getMessage());
        }
    }

    public Connection getConnection() {
        return con;
    }
}
