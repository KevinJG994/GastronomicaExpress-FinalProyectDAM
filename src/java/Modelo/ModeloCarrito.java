package Modelo;

import Include.CarritoItem;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ModeloCarrito extends Conexion {

    // Método para agregar un ítem al carrito
    public boolean agregarAlCarrito(CarritoItem item) {
        Connection con = null;
        PreparedStatement pst = null;
        String sql = "INSERT INTO carrito (usuarioId, tipo, itemId, cantidad, fecha) VALUES (?, ?, ?, ?, NOW())";
        try {
            con = getConnection();
            pst = con.prepareStatement(sql);
            pst.setInt(1, item.getUsuarioId());
            pst.setString(2, item.getTipo());
            pst.setInt(3, item.getItemId());
            pst.setInt(4, item.getCantidad());

            int res = pst.executeUpdate();
            return res > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Método para obtener el carrito de un usuario
    public List<CarritoItem> obtenerCarritoPorUsuario(int usuarioId) {
    List<CarritoItem> carrito = new ArrayList<>();
    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    String sql = "SELECT c.carritoId, c.tipo, c.itemId, c.cantidad, p.nombre AS productoNombre, p.precio AS productoPrecio, r.nombre AS recetaNombre, r.precio AS recetaPrecio " +
                 "FROM carrito c " +
                 "LEFT JOIN productos p ON c.itemId = p.id AND c.tipo = 'producto' " +
                 "LEFT JOIN recetas r ON c.itemId = r.id AND c.tipo = 'receta' " +
                 "WHERE c.usuarioId = ?";
    try {
        con = getConnection(); // Asume que tienes un método getConnection que te da una conexión a la base de datos
        pst = con.prepareStatement(sql);
        pst.setInt(1, usuarioId);
        rs = pst.executeQuery();

        while (rs.next()) {
            CarritoItem item = new CarritoItem();
            item.setId(rs.getInt("carritoId"));
            item.setTipo(rs.getString("tipo"));
            item.setItemId(rs.getInt("itemId"));
            item.setCantidad(rs.getInt("cantidad"));
            item.setUsuarioId(usuarioId);
            if ("producto".equals(item.getTipo())) {
                item.setNombre(rs.getString("productoNombre"));
                item.setPrecio(rs.getDouble("productoPrecio"));
            } else if ("receta".equals(item.getTipo())) {
                item.setNombre(rs.getString("recetaNombre"));
                item.setPrecio(rs.getDouble("recetaPrecio"));
            }
            carrito.add(item);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (pst != null) pst.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    return carrito;
}

    // Método para eliminar un ítem del carrito
    public boolean eliminarDelCarrito(int carritoId) {
        Connection con = null;
        PreparedStatement pst = null;
        String sql = "DELETE FROM carrito WHERE carritoId = ?";
        try {
            con = getConnection();
            pst = con.prepareStatement(sql);
            pst.setInt(1, carritoId);

            int res = pst.executeUpdate();
            return res > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Método para vaciar el carrito de un usuario
    public boolean vaciarCarrito(int usuarioId) {
        String sql = "DELETE FROM carrito WHERE usuarioId = ?";
        try (Connection con = getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setInt(1, usuarioId);
            return pst.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Continuación de los métodos existentes...
// Método para iniciar una transacción de base de datos
    public void iniciarTransaccion() {
        Connection con = null;
        try {
            con = getConnection();
            con.setAutoCommit(false); // Inicia la transacción
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

// Método para confirmar (commit) una transacción
    public void confirmarTransaccion() {
        Connection con = null;
        try {
            con = getConnection();
            con.commit(); // Confirma la transacción
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.setAutoCommit(true);
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

// Método para revertir (rollback) una transacción
    public void revertirTransaccion() {
        Connection con = null;
        try {
            con = getConnection();
            con.rollback(); // Revierte la transacción
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.setAutoCommit(true);
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

// Método para comprar un producto, añadiendo a la tabla de compras de productos
    public boolean comprarProducto(CarritoItem item, int usuarioId) {
        Connection con = null;
        PreparedStatement pst = null;
        String sql = "INSERT INTO compras_productos (idUsuario, idProducto, fecha, cantidad, precio) VALUES (?, ?, NOW(), ?, ?)";
        try {
            con = getConnection();
            pst = con.prepareStatement(sql);
            pst.setInt(1, usuarioId);
            pst.setInt(2, item.getItemId());
            pst.setInt(3, item.getCantidad());
            pst.setDouble(4, item.getPrecio());

            int res = pst.executeUpdate();
            return res > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

// Método para comprar una receta, añadiendo a la tabla de compras de recetas
    public boolean comprarReceta(CarritoItem item, int usuarioId) {
        Connection con = null;
        PreparedStatement pst = null;
        String sql = "INSERT INTO compras_recetas (idUsuario, idReceta, fecha, cantidad, precio) VALUES (?, ?, NOW(), ?, ?)";
        try {
            con = getConnection();
            pst = con.prepareStatement(sql);
            pst.setInt(1, usuarioId);
            pst.setInt(2, item.getItemId());
            pst.setInt(3, item.getCantidad());
            pst.setDouble(4, item.getPrecio());

            int res = pst.executeUpdate();
            return res > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

// Asegúrate de cerrar la conexión en los métodos donde abres una nueva conexión.
}
