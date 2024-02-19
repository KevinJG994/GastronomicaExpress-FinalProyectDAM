$(function () {

    function validarFields(nombre, descripcion, precio, origen, archivos) {
        if (!(nombre.length > 1 && nombre.length <= 255)) {
            alert("Ingrese un nombre válido.");
            return false;
        }

        if (!(descripcion.length > 1 && descripcion.length <= 255)) {
            alert("Ingrese una descripción válida.");
            return false;
        }

        if (!(precio.length > 0 && precio.length < 10 && $.isNumeric(precio))) {
            alert("Ingrese un precio válido.");
            return false;
        }

        if (!(origen.length > 1 && origen.length <= 255)) {
            alert("Ingrese un origen válido.");
            return false;
        }

        // Validar campo de tipo File
        if (archivos.length === 0) {
            alert("Seleccione una imagen.");
            return false;
        }

        // Si todas las validaciones son correctas
        return true;
    }

    $('#btnCrearProducto').click(function (e) {
        e.preventDefault();
        var nombre = $('#nombre').val();
        var descripcion = $('#descripcion').val();
        var precio = $('#precio').val();
        var origen = $('#origen').val();
        var archivos = $('#archivos')[0].files;

        // Implementación de AJAX para agregar los datos una vez validados
        if (validarFields(nombre, descripcion, precio, origen, archivos)) {
            var data = new FormData($('#frm_productos')[0]);
            $.ajax({
                url: "crearProducto",
                type: "post",
                data: data,
                contentType: false,
                processData: false,
                success: function (data) {
                    alert(data);
                }
            });
        }
    });

    $('tr #btnEliminar').click(function (e) {
        e.preventDefault();
        var opcion = confirm("¿Desea Eliminar el producto?")

        if (opcion) {
            var fila = $(this).parent().parent();

            var idProducto = fila.find('#id_producto').text();
            var data = { idproducto: idProducto };
            $.post("deleteProducto", data, function (res, est, jqXHR) {
                alert(res);
                fila.remove();
            });
        }
    });

    $('#btnModificar').click(function (e) {
        e.preventDefault();
        var data = $('#frmModificar').serialize();
        $.post("updateProducto", data, function (res, est, jqXHR) {
            alert(res);
        });
    });
});