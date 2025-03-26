"OBTENER TODOS LOS TITULOS DE LOS LIBROS",
for $t in /catalog/book
return $t/title,

"OBTENER AUTORES Y RESPECTIVOS TITULOS",
for $t in /catalog/book
return concat($t/author,': ',$t/title),

"LISTAR TODOS LOS LIBROS DE UN GENERO (FANTASY)",
for $t in /catalog/book[genre="Fantasy"]
return $t/title,

"OBTENER EL NUMERO TOTAL DE LIBROS",
let $numerolibros := count(/catalog/book)
return $numerolibros,

"OBTENER SUMA DE PRECIO DE TODOS LOS LIBROS",
let $preciototal := sum(/catalog/book/price)
return $preciototal,

"OBTENER PRECIO MEDIO DE LOS LIBROS",
let $numerolibros := count(/catalog/book)
let $preciototal := sum(/catalog/book/price)
return $preciototal div $numerolibros,

"LISTAR LIBROS PUBLICADOS DESPUES DE UNA FECHA",
for $t in /catalog/book[publish_date>"2000-11-01"]
return $t/title,

"OBTENER TODOS LOS LIBROS CON UN PRECIO MENOR A 15",
for $t in /catalog/book[price < 15]
return $t/title,

"OBTENER EL LIBRO CON EL ID=BK105",
for $t in /catalog/book[@id="bk105"]
return $t/title