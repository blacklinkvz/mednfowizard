document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('medForm'); // Reemplaza 'yourFormId' con el ID de tu formulario
    form.addEventListener('submit', (event) => {
      event.preventDefault();
      const formData = new FormData(form);

      if (confirm('¿Deseas agregar otro medicamento?')) {
        fetch(form.action, {
          method: 'POST',
          body: formData,
        })
        .then(response => response.json())
        .then(data => {
          if (confirm('¿Deseas agregar otro medicamento?')) {
            form.reset(); // Limpiar el formulario para agregar otro registro
          } else {
            window.location.href = '/articles_medicaments/new'; // Reemplaza '/redirect_path' con la ruta a la que quieres redirigir
          }
        })
        .catch(error => {
          console.error('Error:', error);
        });
      } else {
        window.location.href = '/articles_contacts/new'; // Reemplaza '/redirect_path' con la ruta a la que quieres redirigir
      }
    });
  });

