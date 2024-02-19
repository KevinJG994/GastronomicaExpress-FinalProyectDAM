$(function () {

    function validarFields(nombre, nombre_chef, ingredientes, descripcion, precio, archivos) {
        if (!(nombre.length > 1 && nombre.length <= 255)) {
            alert("Ingrese un nombre válido.");
            return false;
        }

        if (!(nombre_chef.length > 1 && nombre_chef.length <= 255)) {
            alert("Ingrese el nombre del chef.");
            return false;
        }

        if (!(ingredientes.length > 1 && ingredientes.length <= 255)) {
            alert("Ingrese los ingredientes.");
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

        // Validar campo de tipo File
        if (archivos.length === 0) {
            alert("Seleccione una imagen.");
            return false;
        }

        // Si todas las validaciones son correctas
        return true;
    }

    $('#btnCrearReceta').click(function (e) {
        e.preventDefault();
        var nombre = $('#nombre').val();
        var nombre_chef = $('#nombre_chef').val();
        var ingredientes = $('#ingredientes').val();
        var descripcion = $('#descripcion').val();
        var precio = $('#precio').val();
        var archivos = $('#archivos')[0].files;

        // Implementación de AJAX para agregar los datos una vez validados
        if (validarFields(nombre, nombre_chef, ingredientes, descripcion, precio, archivos)) {
            var data = new FormData($('#frm_recetas')[0]);
            $.ajax({
                url: "crearReceta",
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
        var opcion = confirm("¿Desea Eliminar la receta?")

        if (opcion) {
            var fila = $(this).parent().parent();

            var idReceta = fila.find('#id_receta').text();
            var data = { idreceta: idReceta };
            $.post("deleteReceta", data, function (res, est, jqXHR) {
                alert(res);
                fila.remove();
            });
        }
    });

    $('#btnModificar').click(function (e) {
        e.preventDefault();
        var data = $('#frmModificar').serialize();
        $.post("updateReceta", data, function (res, est, jqXHR) {
            alert(res);
        });
    });
});