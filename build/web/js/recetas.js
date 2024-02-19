  // Función para mostrar la ventana emergente con la imagen del producto
  function mostrarVentanaEmergente(imagenSrc) {
    var ventanaEmergente = document.getElementById("ventana-emergente");
    var imagenAmpliada = document.getElementById("imagen-ampliada");
    imagenAmpliada.src = imagenSrc;
    ventanaEmergente.style.display = "block";
  }
  
  // Función para cerrar la ventana emergente
  function cerrarVentanaEmergente() {
    var ventanaEmergente = document.getElementById("ventana-emergente");
    ventanaEmergente.style.display = "none";
  }