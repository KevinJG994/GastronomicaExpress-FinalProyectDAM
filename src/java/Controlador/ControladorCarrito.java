package Controlador;

import Include.CarritoItem;
import Modelo.ModeloCarrito;
import java.util.List;

public class ControladorCarrito {

    ModeloCarrito modeloCarrito = new ModeloCarrito();

    public boolean agregarAlCarrito(CarritoItem item) {
        return modeloCarrito.agregarAlCarrito(item);
    }

    public List<CarritoItem> obtenerCarrito(int usuarioId) {
        return modeloCarrito.obtenerCarritoPorUsuario(usuarioId);
    }

    public boolean eliminarDelCarrito(int carritoId) {
        return modeloCarrito.eliminarDelCarrito(carritoId);
    }

    public boolean realizarCompra(int usuarioId) {
        List<CarritoItem> itemsCarrito = obtenerCarrito(usuarioId);
        boolean compraExitosa = true;

        // Iniciar transacción de base de datos
        modeloCarrito.iniciarTransaccion();

        for (CarritoItem item : itemsCarrito) {
            if (item.getTipo().equals("producto")) {
                compraExitosa &= modeloCarrito.comprarProducto(item, usuarioId);
            } else if (item.getTipo().equals("receta")) {
                compraExitosa &= modeloCarrito.comprarReceta(item, usuarioId);
            }

            if (!compraExitosa) {
                modeloCarrito.revertirTransaccion();
                return false;
            }
        }

        modeloCarrito.vaciarCarrito(usuarioId);
        modeloCarrito.confirmarTransaccion();
        return true;
    }

}
