'Ejercicio 1 - a',
(:Muestra los títulos de todos los libros (contenido).:)

for $bib in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_3_libros.xml")//bib
return $bib/libro/titulo/text(),

'Ejercicio 2 - b',
(:Devuelve todos los títulos de los libros del año 2000. (elemento).:)

for $libro in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_3_libros.xml")//bib/libro
where $libro/@year = 2000
return $libro/titulo,

'Ejercicio 3 - c',
(:Devuelve todos los títulos de los libros entre el año 1995 y 2000. Ambos incluidos.(elemento).:)
for $libro in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_3_libros.xml")//bib/libro
where $libro/@year>=1995 and $libro/@year<=2000
return $libro/titulo,

'Ejercicio 4 - d',
(:Obtén todos los títulos de los libros que tengan algún autor de apellido ‘Stevens’ (contenido).:)

for $libro in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_3_libros.xml")//bib/libro
where $libro/autor/apellido="Stevens"
return $libro/titulo/text(),

'Ejercicio 5 - e',
(:Muestra los títulos de todos los libros almacenados de la editorial "Addison Wesley", primero con una cláusula "for" y, a continuación, con una cláusula "let" (elemento).:)
'Usando for',
for $libro in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_3_libros.xml")//libro[editorial = "Addison-Wesley"]

return $libro/titulo,
'Usando let',
for $libro in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_3_libros.xml")//libro

let $editorial := //libro[editorial = "Addison-Wesley"]
return $editorial/titulo,

'Ejercicio 6 - f',
(:Consigue todos los títulos de los libros que tengan un solo autor ordenados por precio (elemento).:)

for $libro in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_3_libros.xml")//bib/libro[count(autor)= 1]
order by $libro/precio
return $libro/titulo,

'Ejercicio 7 - g',
(:Devuelve todos los títulos de los libros que tengan más de dos autores ordenados por su título (elemento).:)
for $libro in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_3_libros.xml")//bib/libro
where $libro[count(autor) > 2]
return $libro/titulo,

'Ejercicio 8 - h',
(:Devuelve el título y el año de cada uno de los libros junto con el número de autores de cada libro (elemento). ¿Puedes hacerlo directamente?:)
for $libro in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_3_libros.xml")//bib/libro
return concat("Titulo: ", $libro/titulo, " Año: ", $libro/@year, " Numero de autores: ", count($libro/autor)),

'Ejercicio 9 - i',
(:Repite el apartado generando el siguiente fichero XML: :)

for $libro in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_3_libros.xml")//bib/libro
return
<resumen_bib>\n
  <libro>\n
    <titulo>{$libro/titulo}</titulo>\n
    <año>{$libro/@year}</año>\n
    <num_autores>{count($libro/autor)}</num_autores>\n
  </libro>
</resumen_bib>,

'Ejercicio 10 - j',
(:Devuelve los títulos de todos los libros y los apellidos de sus dos primeros autores. En el caso de que existan más de dos autores para un libro, se añade un tercer autor "et al.". Para ello genera el siguiente XML::)
for $libro in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_3_libros.xml")//bib/libro
return
<resumen_bib>\n
{
  for $libro in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_3_libros.xml")//bib/libro
  let $autores := $libro/autor/apellido
  return
  <libro>\n
    <titulo>{$libro/titulo/text()}</titulo>\n
    <autores>\n
      <apellido>{$autores[1]}</apellido>\n
      <apellido>{$autores[2]}</apellido>\n
      {
        if (count($autores)> 2) then
          <apellido>et al.</apellido>
        else ()
      }
    </autores>\n
  </libro>
}
</resumen_bib>,

'Ejercicio 11 - k',
(:Devuelve los títulos de todos los libros, su editorial y los comentarios del mismo, si es que tiene algún comentario. Si no tiene, usarás la etiqueta <sin_comentario/>. Para ello genera el siguiente XML::)
let $libros := doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_3_libros.xml")
let $comentarios := doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_3_libros_comentarios.xml")
return
<resumen_bib_com>\n
    {
        for $libro in $libros//bib/libro
        return
            <libro>\n
                <titulo>{ $libro/titulo/text() }</titulo>\n
                <editorial>{ $libro/editorial/text() }</editorial>\n
                {
                    let $titulo := normalize-space($libro/titulo/text())
                    let $comentario := $comentarios//entrada[titulo = $titulo]/comentario
                    return
                        if (empty($comentario)) 
                        then <sin_comentario/> 
                        else <comentario>{ normalize-space($comentario/text()) }</comentario>
                }
            </libro>
    }
</resumen_bib_com>,

'Ejercicio 12 - l',
(:Consigue los títulos de todos los libros en los que al menos uno de sus autores es 'Stevens' (elemento). Usa "some". Este cuantificador existencial permite definir consultas que devuelvan algún elemento que satisfaga la condición.:)

  for $libro in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_3_libros.xml")//bib/libro
  let $apellido := $libro/autor/apellido
  where some $apellido in $libro satisfies $apellido/autor/apellido = "Stevens"
  return $libro/titulo,

'Ejercicio 13 - m',
(:Devuelve todos los títulos de los libros en los que todos los autores sean 'Stevens'(elemento). Usa "every". Este cuantificador existencial permite devolver los elementos en los que todos sus nodos satisfagan la condición.:)

for $libro in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_3_libros.xml")//bib/libro
let $apellido := $libro/autor/apellido
where every $apellido in $libro/autor satisfies contains($apellido/autor, "Stevens")
return $libro/titulo,

'Ejercicio 14 - n',
(:Devuelve todos los apellidos distintos de los autores (elemento). Usa "distinct-values()". Esta función extrae los valores de una secuencia de nodos y crea una nueva secuencia con valores únicos eliminando los nodos duplicados.:)

for $libro in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_3_libros.xml")//bib/libro
let $apellido := distinct-values($libro/autor/apellido)
return $apellido,

'Ejercicio 15 - o',
(:Usa "empty()" y "exists()" en dos consultas distintas inventadas por ti. La función "empty()" devuelve cierto cuando la expresión entre paréntesis está vacía. La función opuesta a "empty()" es "exists()", la cual devuelve cierto cuando una
secuencia contiene, al menos, un elemento.:)

for $libro in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_3_libros.xml")//bib/libro
let $titulo := empty(($libro/titulo))return true(),
for $libro in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_3_libros.xml")//bib/libro
let $editorial := exists($libro/editor) return ($editorial)


