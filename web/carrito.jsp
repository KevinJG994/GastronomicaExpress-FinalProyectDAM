<%@ page import="java.util.List"%>
<%@ page import="Include.CarritoItem"%>
<%@ page import="Controlador.ControladorCarrito"%>
<%@ page session="true" %>
<%
    ControladorCarrito controladorCarrito = new ControladorCarrito();
    int usuarioId = (Integer)session.getAttribute("usuarioId");
    List<CarritoItem> carrito = controladorCarrito.obtenerCarrito(usuarioId);

    // Mensajes de éxito o error
    String mensajeExito = (String) session.getAttribute("mensajeExito");
    String mensajeError = (String) session.getAttribute("mensajeError");

    // Limpiar mensajes después de mostrarlos
    session.removeAttribute("mensajeExito");
    session.removeAttribute("mensajeError");
%>
<html>
<head>
    <title>Carrito de Compras</title>
    <!-- Incluir Bootstrap para estilos aquí, por ejemplo, una referencia a un CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <h2>Carrito de Compras</h2>

    <% if(mensajeExito != null) { %>
    <div class="alert alert-success" role="alert">
        <%= mensajeExito %>
    </div>
    <% } %>

    <% if(mensajeError != null) { %>
    <div class="alert alert-danger" role="alert">
        <%= mensajeError %>
    </div>
    <% } %>

    <table class="table">
        <thead>
            <tr>
                <th>Producto/Receta</th>
                <th>Cantidad</th>
                <th>Precio Unitario</th>
                <th>Subtotal</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <% for(CarritoItem item : carrito) { %>
            <tr>
                <td><%= item.getNombre() %></td>
                <td><%= item.getCantidad() %></td>
                <td><%= item.getPrecio() %></td>
                <td><%= item.getPrecio() * item.getCantidad() %></td>
                <td>
                    <!-- Botón para eliminar del carrito -->
                    <a href="EliminarDelCarrito?itemId=<%= item.getId() %>" class="btn btn-danger">Eliminar</a>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <div class="text-right">
    <a class="btn btn-success" onclick="mostrarAlerta()">Proceder a Pagar</a>
</div>

<script>
    function mostrarAlerta() {
        alert("¡Compra Realizada!");
        // Puedes agregar aquí cualquier otra lógica que desees ejecutar cuando se presiona el botón
    }
</script>
        
</body>
</html>
