// Creamos una funcion para que cuando pulsemos el boton se muestre la lista de productos
function mostrarProductos() {
    fetch('productos.xml')
        .then(response => response.text())
        .then(xmlString => {
            const parser = new DOMParser();
            const xml = parser.parseFromString(xmlString, "application/xml");
            const productos = xml.querySelectorAll('Producto'); // Con querySelectorAll hacemos q nos devuelva una lista con todos los productos
            const contenedor = document.getElementById('listaProductos');

            // Aqui limpiamos para evitar duplicados
            contenedor.innerHTML = '';

            productos.forEach(producto => {
                const nombre = producto.querySelector('Nombre').textContent;
                const precio = producto.querySelector('Precio').textContent;
                const etiquetas = producto.querySelectorAll('Etiqueta');

                // Aqui creamos el div principal el del producto
                const divProducto = document.createElement('div');
                divProducto.className = 'producto';

                // Creamos la variable nombre y luego la anadimos
                const divNombre = document.createElement('div');
                divNombre.className = 'nombre';
                const strongNombre = document.createElement('strong');
                strongNombre.textContent = `Nombre:  ${nombre}`;
                divNombre.appendChild(strongNombre);

                // Creamos la variable de precio y la anadimos
                const divPrecio = document.createElement('div');
                divPrecio.className = 'precio';
                divPrecio.textContent = `Precio: $${precio}`;

                // Aqui creamos el contendor de etiquetas
                const divEtiquetas = document.createElement('div');
                divEtiquetas.className = 'etiquetas';

                // Aqui hacemos q anadimos las etiquetas, para que aparezcan  cada una en una linea distinta
                etiquetas.forEach(etiqueta => {
                    const spanEtiqueta = document.createElement('span');
                    spanEtiqueta.textContent = etiqueta.textContent;

                    // Aqui metemos la etiqueta en otro div separado para q se muestre en otra linea
                    const divEtiqueta = document.createElement('div');
                    divEtiqueta.appendChild(spanEtiqueta);

                    divEtiquetas.appendChild(divEtiqueta);
                });

                // Creamos la variable del boton para eliminar un producto
                const botonEliminar = document.createElement('button');
                botonEliminar.textContent = 'Eliminar';
                botonEliminar.className = 'eliminar';

                // Añadir evento al botón de eliminar
                botonEliminar.addEventListener('click', () => {
                    divProducto.remove();  // Eliminar el producto de la pantalla
                });

                // Ahora lo q hacemos es q anadimos todo los datos al div donde se va a ver
                divProducto.appendChild(divNombre);
                divProducto.appendChild(divPrecio);
                divProducto.appendChild(divEtiquetas);
                divProducto.appendChild(botonEliminar);

                // Por ultimo anadimos el producto al contenedor principal
                contenedor.appendChild(divProducto);
            });
        })
        .catch(error => {
            console.error('Error al cargar el XML:', error);
        });
}
