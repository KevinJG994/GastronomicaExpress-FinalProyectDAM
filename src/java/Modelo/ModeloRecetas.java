package Modelo;

import Include.Receta;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ModeloRecetas extends Conexion {

    public boolean crearReceta(Receta r) {
        PreparedStatement pst = null;
        boolean flag = false;
        try {
            String sql = "INSERT INTO recetas (nombre, nombre_chef, ingredientes, descripcion, precio, imagen) VALUES (?, ?, ?, ?, ?, ?)";
            pst = (PreparedStatement) getConnection().prepareStatement(sql);
            pst.setString(1, r.getNombre());
            pst.setString(2, r.getNombre_chef());
            pst.setString(3, r.getIngredientes());
            pst.setString(4, r.getDescripcion());
            pst.setFloat(5, r.getPrecio());
            pst.setString(6, r.getImagen());

            if (pst.executeUpdate() == 1) {
                flag = true;
            }

        } catch (SQLException e) {
        } finally {
            try {
                if (getConnection() != null) {
                    getConnection().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
            }
        }
        return flag;

    }

    public ArrayList<Receta> getAllRecetas() {
        ArrayList<Receta> recetas = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM recetas;";
            pst = (PreparedStatement) getConnection().prepareCall(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                recetas.add(new Receta(rs.getInt("id"), rs.getString("nombre"), rs.getString("nombre_chef"), rs.getString("ingredientes"), rs.getString("descripcion"), rs.getFloat("precio"), rs.getString("imagen")));
            }

        } catch (SQLException e) {
        } finally {
            try {
                if (getConnection() != null) {
                    getConnection().close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
            }

        }

        return recetas;
    }

    public Receta getReceta(int idReceta) {
        Receta receta = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM recetas WHERE id = ?";
            pst = (PreparedStatement) getConnection().prepareCall(sql);
            pst.setInt(1, idReceta);
            rs = pst.executeQuery();
            while (rs.next()) {
                receta = new Receta(rs.getInt("id"), rs.getString("nombre"), rs.getString("nombre_chef"), rs.getString("ingredientes"), rs.getString("descripcion"), rs.getFloat("precio"), rs.getString("imagen"));
            }

        } catch (SQLException e) {
        } finally {
            try {
                if (getConnection() != null) {
                    getConnection().close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
            }

        }

        return receta;
    }

    public boolean deleteReceta(int idReceta) {
        boolean flag = false;
        PreparedStatement pst = null;

        try {
            String sql = "DELETE FROM recetas WHERE id = ?";
            pst = (PreparedStatement) getConnection().prepareCall(sql);
            pst.setInt(1, idReceta);
            if (pst.executeUpdate() == 1) {
                flag = true;
            }

        } catch (SQLException e) {
        } finally {
            try {
                if (getConnection() != null) {
                    getConnection().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
            }

        }
        return flag;
    }

    public boolean updateReceta(Receta r) {
        PreparedStatement pst = null;
        boolean flag = false;
        try {
            String sql = "UPDATE recetas SET nombre = ?, nombre_chef = ?, ingredientes = ?, descripcion = ?, precio = ? WHERE id = ?";
            pst = (PreparedStatement) getConnection().prepareStatement(sql);
            pst.setString(1, r.getNombre());
            pst.setString(2, r.getNombre_chef());
            pst.setString(3, r.getIngredientes());
            pst.setString(4, r.getDescripcion());
            pst.setFloat(5, r.getPrecio());
            pst.setInt(6, r.getId());

            if (pst.executeUpdate() == 1) {
                flag = true;
            }

        } catch (SQLException e) {
        } finally {
            try {
                if (getConnection() != null) {
                    getConnection().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
            }
        }
        return flag;
    }
}
