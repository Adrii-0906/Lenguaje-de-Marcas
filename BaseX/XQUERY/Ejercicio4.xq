'Ejercicio 1 - a',
(:Obtener el número de alumnos de la clase (número).:)
count(//alumno),

'Ejercicio 2 - b',
(:Obtener el número de módulos que se imparten (número).:)
count(//asignatura),

'Ejercicio 3 - c',
(:Obtener el nombre y apellidos de todos los alumnos matriculados en algún módulo, es decir que tenga alguna nota (elemento). Usa el operador unión.:)

for $alumno in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_4_clase.xml")//alumno
where doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_4_clase.xml")//nota/@alum=$alumno/@cod
return $alumno/apenom,

'Ejercicio 4 - d',
(:Obtener las calificaciones del alumno de código "n43483437" en cada uno de sus módulos. Para ello genera el siguiente XML::)

let $codigo := "n43483437"
let $alumno := <alumno cod="n43483437">
  {
    for $nota in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_4_clase.xml")//nota[@alum = $codigo]
    return
    <modulo>\n
      <nombre_modulo>{/clase/asignaturas/asignatura[@cod = $nota/@asig]/@nombre}</nombre_modulo>\n
      <nota>{$nota/@calificacion}</nota>\n
    </modulo>
  }
</alumno>
return $alumno,

'Ejercicio 5 - e',
(:Obtener los nombres de los alumnos matriculados en LMSGI y sus notas. El resultado estará ordenado por notas de forma descendente. Para ello genera el siguiente XML::)
let $codigo := "a4"
let $alumnos := 
  for $nota in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_4_clase.xml")//nota[@asig = $codigo]
  let $alumno := //alumnos/alumno[@cod = $nota/@alum]
  order by $alumno/apenom/text() descending
  return
    <alumno>\n
      <nombre>{$alumno/apenom/text()}</nombre>\n
      <nota>{$nota/@calificacion}</nota>\n
    </alumno>
return
<lmsgi>
  {$alumnos}
</lmsgi>,

'Ejercicio 6 - f',
(:Repite el ejercicio anterior, pero muestra solo los alumnos que hayan aprobado.:)

let $codigo := "a4"
let $alumnos := 
  for $nota in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_4_clase.xml")//nota[@asig = $codigo and @calificacion > 5]
  let $alumno := //alumnos/alumno[@cod = $nota/@alum]
    order by $alumno/apenom/text() descending
  return
    <alumno>\n
      <nombre>{$alumno/apenom/text()}</nombre>\n
      <nota>{$nota/@calificacion}</nota>\n
    </alumno>
return
<lmsgi>
 {$alumnos}
</lmsgi>