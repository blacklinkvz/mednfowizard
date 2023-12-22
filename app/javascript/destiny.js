  document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('destinyForm'); // Reemplaza 'yourFormId' con el ID de tu formulario
    form.addEventListener('submit', (event) => {
      event.preventDefault();
      const formData = new FormData(form);

      if (confirm('¿Deseas agregar otro registro?')) {
        fetch(form.action, {
          method: 'POST',
          body: formData,
        })
        .then(response => response.json())
        .then(data => {
          if (confirm('¿Deseas agregar otro registro?')) {
            form.reset(); // Limpiar el formulario para agregar otro registro
          } else {
            window.location.href = '/destinies/new'; // Reemplaza '/redirect_path' con la ruta a la que quieres redirigir
          }
        })
        .catch(error => {
          console.error('Error:', error);
        });
      } else {
        window.location.href = '/articles/new'; // Reemplaza '/redirect_path' con la ruta a la que quieres redirigir
      }
    });
  });

