'Ejercicio 1: Devuelve nombre de todos los beatles(contenido y elemento)',

for $beatle in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/Ejemplos_xsd/beatles.xml")/beatles/beatle
return concat($beatle/name/firstname," ",$beatle/name/lastname),

for $beatle in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/Ejemplos_xsd/beatles.xml")/beatles/beatle
return $beatle/name/firstname,

'Ejercicio 2: Devuelve el nombre de los beatles con el apellido Lennon, McCartney y Dunn',

for $beatle in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/Ejemplos_xsd/beatles.xml")/beatles/beatle[name/lastname = "McCartney"]
return $beatle/name/firstname/text(),

for $beatle in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/Ejemplos_xsd/beatles.xml")/beatles/beatle[name/lastname = "Lennon"]
return $beatle/name/firstname/text(),

for $beatle in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/Ejemplos_xsd/beatles.xml")/beatles/beatle[name/lastname = "Dunn"]
return $beatle/name/firstname/text(),

'Ejecicio 3: Devuelve todos los apellidos y ordenalos por orden alfabetico',

for $beatle in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/Ejemplos_xsd/beatles.xml")/beatles/beatle
order by $beatle/name/lastname
return $beatle/name/lastname,

for $beatle in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/Ejemplos_xsd/beatles.xml")/beatles/beatle
order by $beatle/name/lastname
return $beatle/name/lastname/text(),

'Ejercicio 4: Hacer un xml sobre la base de datos',

for $beatle in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/Ejemplos_xsd/beatles.xml")/beatles/beatle
return
<beatles>\n
  <beatle>\n
    <nombre>{$beatle/name/firstname}</nombre>\n
    <apellido>{$beatle/name/lastname}</apellido>\n
  </beatle>
</beatles>,

'Ejercicio 5: Hacer lo mismo pero en html',

for $beatle in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/Ejemplos_xsd/beatles.xml")/beatles/beatle
return
<html>
  <head>
    <title>Tabla beatles</title>
  </head>
  <body>
    <table border="7">
      <tr>
        <th>Nombre</th>
        <th>Apellido</th>
      </tr>
      {
        for $beatle in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/Ejemplos_xsd/beatles.xml")/beatles/beatle
        return <tr>
          <td>{$beatle/name/firstname}</td>
          <td>{$beatle/name/lastname}</td>
        </tr>
      }
    </table>
  </body>
</html>




