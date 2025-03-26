<html>\n
 {
   for $b in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/ExamenXQ/beatles.xml")//beatle
   return
   <span>El beatle {$b/name/fisrtname/text()} {$b/name/lastname/text()} tiene una web llamada {data($b/@link)}</span>
 }
</html>