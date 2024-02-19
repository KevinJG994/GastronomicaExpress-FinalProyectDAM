document.addEventListener("DOMContentLoaded", function () {
    // Manejo del formulario de inicio de sesión
    const loginForm = document.querySelector("form");
    loginForm.addEventListener("submit", function (e) {
        e.preventDefault(); // Evita que el formulario se envíe de la manera tradicional

        // Obtiene los datos del formulario
        const formData = new FormData(loginForm);
        const email = formData.get("email");
        const password = formData.get("password");

        // Determina la acción basada en el texto del botón de envío
        const action = loginForm.getAttribute("action");

        // Envía los datos al servidor de forma asíncrona
        fetch(action, {
            method: "POST",
            body: new URLSearchParams(formData) // Convierte los datos del formulario a un formato adecuado
        }).then(response => {
            if (response.redirected) {
                window.location.href = response.url; // Redirige al usuario si la autenticación es exitosa
            } else {
                // Manejar cómo mostrar el mensaje de error
                alert("Credenciales inválidas. Intente de nuevo.");
            }
        }).catch(error => {
            console.error('Error durante el inicio de sesión:', error);
        });
    });
    


    // Cambiar entre modos de registro e inicio de sesión
    document.getElementById('toggleForm').addEventListener('click', function () {
        var formTitle = document.getElementById('title');
        var formAction = document.getElementById('authForm');
        var submitBtn = document.getElementById('submitBtn');
        var toggleBtn = document.getElementById('toggleForm');

        if (formTitle.textContent.includes("Iniciar Sesión")) {
            formTitle.textContent = "Registro";
            formAction.action = "RegistroServlet"; // Cambiar al servlet de registro
            submitBtn.textContent = "Registrar";
            toggleBtn.textContent = "¿Ya tienes cuenta? Inicia sesión";
        } else {
            formTitle.textContent = "Iniciar Sesión";
            formAction.action = "LoginServlet"; // Volver al servlet de login
            submitBtn.textContent = "Login";
            toggleBtn.textContent = "¿Eres Nuevo? Regístrate";
        }
    });
});
             