'Ejercicio 1: Recupera todos los títulos de las películas de la colección.',

for $peli in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/Ejemplos_xsd/peliculas.xml")/coleccion_peliculas
return $peli/pelicula/titulo/text(),

'Ejercicio 2: Encuentra todas las películas que pertenecen al género "Ciencia Ficción"',
for $pelicula in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/Ejemplos_xsd/peliculas.xml")/coleccion_peliculas/pelicula
where $pelicula/genero = "Ciencia Ficción"
return $pelicula/titulo,

'Ejercicio 3: Cuenta cuántas películas hay en la colección.',

count(//pelicula),

'Ejercicio 4: Obtén todas las películas dirigidas por "Christopher Nolan".',

for $peli in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/Ejemplos_xsd/peliculas.xml")/coleccion_peliculas/pelicula[director = "Christopher Nolan"]
return $peli/titulo,

'Ejercicio 5: Muestra los títulos y años de estreno de las películas estrenadas después de 2000.',

for $peli in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/Ejemplos_xsd/peliculas.xml")/coleccion_peliculas/pelicula
where $peli/anio_estreno >2000
return concat($peli/titulo, " ",$peli/anio_estreno),

'Ejercicio 6:  Calcula la duración promedio de las películas en minutos.',

for $peli in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/Ejemplos_xsd/peliculas.xml")/coleccion_peliculas/pelicula/duracion
let $total := sum($peli)
let $cantidad := count($peli)
return $total div $cantidad,

'Ejercico 7: Recupera una lista de todos los directores que aparecen en la colección, sin repeticiones.',

for $d in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/Ejemplos_xsd/peliculas.xml")//pelicula[distinct-values(director)]
return $d/director,

'Ejercicio 8: Muestra todos los detalles de la película titulada "Titanic"',
for $t in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/Ejemplos_xsd/peliculas.xml")//pelicula[titulo = "Titanic"]
return $t,

'Ejercicio 9: Encuentra los títulos de las películas que tienen una duración superior a 150 minutos.',

for $peli in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/Ejemplos_xsd/peliculas.xml")/coleccion_peliculas/pelicula
where $peli/duracion > 150
return $peli/titulo,

'Ejercicio 10: Recupera todos los títulos de las películas y ordénalos por año de estreno, de más reciente a más antiguo.',

for $peli in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/Ejemplos_xsd/peliculas.xml")/coleccion_peliculas/pelicula
order by $peli/anio_estreno descending
return $peli/titulo




