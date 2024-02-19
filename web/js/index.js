const botonProductos = document.getElementById("btnProductos");
botonProductos.addEventListener("click", function() {
    window.location.href="productos.jsp";
});

//Carrusel de imágenes en transición

document.addEventListener('DOMContentLoaded', function() {
  var myCarousel = new bootstrap.Carousel(document.getElementById('carouselExample'));
  setInterval(mostrarSiguienteImagen, 7000);
});

function mostrarPortada() {
    carouselImages[currentIndex].classList.add("active");
  }

mostrarPortada();
setInterval(mostrarSiguienteImagen, 7000);

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
