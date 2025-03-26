for $libro in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/ExamenXQ/books.xml")/catalog/book
where $libro/genre != "Computer"
where $libro/price < 5
return $libro/title/text(),
for $libro in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/ExamenXQ/books.xml")/catalog/book
where $libro/genre != "Computer"
where $libro/price < 5
return count($libro)