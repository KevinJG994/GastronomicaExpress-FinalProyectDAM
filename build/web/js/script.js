//Configuración botones de navegador
document.addEventListener("DOMContentLoaded", function() {
    const navInicio = document.getElementById("index");
    navInicio.addEventListener("click", function(event) {
        event.preventDefault();
        window.location.href = "index.jsp";
    });

    const navProductos = document.getElementById("productos");
    navProductos.addEventListener("click", function(event) {
        event.preventDefault();
        window.location.href = "productos.jsp";
    });

    const navRecetas = document.getElementById("recetas");
    navRecetas.addEventListener("click", function(event) {
        event.preventDefault();
        window.location.href = "recetas.jsp";
    });

    const navContacto = document.getElementById("contacto");
    navContacto.addEventListener("click", function(event) {
        event.preventDefault();
        window.location.href = "contacto.jsp";
    });
});
    
    //Abre el formulario de Registro en una nueva ventana 
    
    const inicioSesion = document.getElementById("login");
    inicioSesion.addEventListener("click", function() {
        const dimensiones = 'width=450, height=520';
        window.open("login.jsp", "_blank", dimensiones);
    });
    
    
     const abrirCarrito = document.getElementById("cesta");
        abrirCarrito.addEventListener("click", function() {
        const dimensiones = 'width=700, height=600';
        window.open("carrito.jsp", "_blank", dimensiones);
    });
    