"OBTENER TODOS LOS NOMBRES DE LOS BEATLES",
for $beatle in /beatles/beatle
return concat($beatle/name/firstname, ' ', $beatle/name/lastname),

"OBTENER ENLACES DE TODOS LOS BEATLES",
for $beatle in /beatles/beatle
return $beatle/@link,

"CONTAR EL NUMERO DE BEATLES",
count(/beatles/beatle),

"OBTENER NOMBRE Y ENLACE DEL BEATLE CON EL PRIMER NOMBRE PAUL",
for $beatle in /beatles/beatle[name/firstname = "Paul"]
return concat($beatle/name/firstname, ' ', $beatle/name/lastname, ': ', $beatle/@link),

"LISTAR TODOS LOS BEATLES CUYO ENLACE CONTIENE WEB",
for $beatle in /beatles/beatle[contains(@link, 'web')]
return concat($beatle/name/firstname, ' ', $beatle/name/lastname, ': ', $beatle/@link),

"OBTENER TODOS LOS APELLIDOS DE LOS BEATLES",
for $t in /beatles/beatle/name
return $t/lastname,

"OBTENER EL BEATLE CON EL APELLIDO STARR ",
for $beatle in /beatles/beatle[name/lastname = "Starr"]
return concat($beatle/name/firstname, ' ', $beatle/name/lastname),

"LISTAR TODOS LOS BEATLES QUE TIENEN ATRIBUTO REAL",
for $beatle in /beatles/beatle[@real]
return concat($beatle/name/firstname, ' ', $beatle/name/lastname)
