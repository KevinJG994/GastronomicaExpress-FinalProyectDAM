package Modelo;

import Include.Producto;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ModeloProductos extends Conexion {

    public boolean crearProducto(Producto p) {
        PreparedStatement pst = null;
        boolean flag = false;
        try {
            String sql = "INSERT INTO productos (nombre, descripcion, precio, origen, imagen) VALUES (?, ?, ?, ?, ?)";
            pst = (PreparedStatement) getConnection().prepareStatement(sql);
            pst.setString(1, p.getNombre());
            pst.setString(2, p.getDescripcion());
            pst.setFloat(3, p.getPrecio());
            pst.setString(4, p.getOrigen());
            pst.setString(5, p.getImagen());

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

    public ArrayList<Producto> getAllProductos() {
        ArrayList<Producto> productos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM productos;";
            pst = (PreparedStatement) getConnection().prepareCall(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                productos.add(new Producto(rs.getInt("id"), rs.getString("nombre"), rs.getString("descripcion"), rs.getFloat("precio"),
                        rs.getString("origen"), rs.getString("imagen")));
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

        return productos;
    }

    public Producto getProducto(int idProducto) {
        Producto producto = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM productos WHERE id = ?";
            pst = (PreparedStatement) getConnection().prepareCall(sql);
            pst.setInt(1, idProducto);
            rs = pst.executeQuery();
            while (rs.next()) {
                producto = new Producto(rs.getInt("id"), rs.getString("nombre"), rs.getString("descripcion"), rs.getFloat("precio"),
                        rs.getString("origen"), rs.getString("imagen"));
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

        return producto;
    }

    public boolean deleteProducto(int idProducto) {
        boolean flag = false;
        PreparedStatement pst = null;

        try {
            String sql = "DELETE FROM productos WHERE id = ?";
            pst = (PreparedStatement) getConnection().prepareCall(sql);
            pst.setInt(1, idProducto);
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

    public boolean updateProducto(Producto p) {
        PreparedStatement pst = null;
        boolean flag = false;
        try {
            String sql = "UPDATE productos SET nombre = ?, descripcion = ?, precio = ?, origen = ? WHERE id = ?";
            pst = (PreparedStatement) getConnection().prepareStatement(sql);
            pst.setString(1, p.getNombre());
            pst.setString(2, p.getDescripcion());
            pst.setFloat(3, p.getPrecio());
            pst.setString(4, p.getOrigen());
            pst.setInt(5, p.getId());

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
