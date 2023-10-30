window.onload = function() {
    // Obtenemos el nombre de la página actual (sin extensión)
    var pageName = window.location.pathname.split('/').pop().split('.').shift();

    // Creamos el iframe
    var iframe = document.createElement('iframe');
    iframe.src = 'http://localhost:5173/results?page=' + pageName;
    iframe.width = '100%';
    iframe.height = '400px';
    iframe.style.position = 'fixed';      // Fijamos el iframe
    iframe.style.bottom = '0';            // A pie de página
    iframe.style.left = '0';              // Alineado a la izquierda
    iframe.style.border = 'none';         // Sin bordes
    iframe.style.zIndex = '1000';         // Para asegurarnos de que esté por encima de otros elementos

    // Incrustamos el iframe en el body de la página
    document.body.appendChild(iframe);
}
