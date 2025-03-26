'Ejercicio 1 - a',
(:Muestra el nombre de todos los bailes (contenido).:)

for $baile in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_2_bailes.xml")//bailes/baile
return $baile/nombre/text(),

'Ejercicio 2 - b',
(:Consigue el nombre de todos los bailes que se realizan en la sala número uno (elemento).:)
for $baile in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_2_bailes.xml")//bailes/baile
where $baile/sala=1
return $baile/nombre,

'Ejercicio 3 - c',
(:Muestra todos los bailes con toda su información que se imparten en la sala número dos y cuyo precio sea menor que 35,00 EUROS (elemento).:)

for $baile in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_2_bailes.xml")//bailes/baile
where $baile/sala=2
where $baile/precio < 35
return $baile,

'Ejercicio 4 - d',
(:Obtén el nombre de todos los profesores que dan clase con cuotas mensuales (contenido).:)

for $baile in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_2_bailes.xml")//bailes/baile
where $baile/precio/@cuota="mensual"
return $baile/profesor/text(),

'Ejercicio 5 - e',
(:Genera un nuevo documento XML que almacena la información de los bailes que imparte el profesor "Jesús Lozano" con la siguiente estructura::)

for $baile at $i in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_2_bailes.xml")//bailes/baile
where $baile/profesor="Jesús Lozano"
return 
<bailes_lozano profesor="Jesús Lozano">
  <baile num='{$i}'>
    <nombre>{$baile/nombre/text()}</nombre>
    <plazas>{$baile/plazas/text()}</plazas>
    <duracion>De {$baile/comienzo/text()} A {$baile/fin/text()}</duracion>
  </baile>
</bailes_lozano>,

'Ejercicio 6 - f',
(:Genera un documento HTML con una tabla HTML que muestre el nombre del baile, el profesor que lo imparte y el número de plazas ofertadas, pero estableciendo la condición de ser bailes con cuota trimestral. Además, se ordenarán de menor a mayor los bailes según el número de plazas disponibles.:)

<html>

  <head>
    <title>Tabla Bailes Trimestrales</title>
  </head>
  
  <body>
    <table border="6">
      <tr>
        <th>Baile</th>
        <th>Profesor</th>
        <th>Plazas</th>
      </tr>
      {
        for $baile in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_2_bailes.xml")//bailes/baile
         where $baile/precio/@cuota="trimestral"
         order by $baile/plazas
         return <tr>
                   <td>{$baile/nombre/text()}</td>
                   <td>{$baile/profesor/text()}</td>
                   <td>{$baile/plazas/text()}</td>
                </tr>
       }
    </table>
  </body>
</html>