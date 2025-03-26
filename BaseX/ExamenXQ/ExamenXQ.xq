<html>
 {
   for $r in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/ExamenXQ/records.xml")//record
  where $r/country
  order by $r/country
    for $r1 in  doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/ExamenXQ/records.xml")//record/country
    group by $r1
    let $c := count(doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/ExamenXQ/records.xml")//record/country[$r])
    let $n := where //record/name
  return
    <span>El pais {$r1} se repite {$c} con los siguientes nombres <b> {$n} </b>
    </span>

 }
</html>