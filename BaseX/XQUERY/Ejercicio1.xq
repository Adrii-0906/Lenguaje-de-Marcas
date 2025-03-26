'Ejercicio 1 - a',
(:Consigue el nombre de los módulos que se imparten en el instituto (elemento).:)
for $modulos in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_1_modulos_informatica.xml")//ies/modulos/modulo/nombre/text()
return $modulos,

'Ejercicio 2 - b',
(:Muestra el nombre de los módulos del ciclo ASIR (contenido).:)

for $modulo in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_1_modulos_informatica.xml")//modulos/modulo
where $modulo/ciclo="ASIR"
return $modulo/nombre/text(),

'Ejercicio 3 - c',
(:Devuelve el nombre de los módulos que se imparten en el segundo curso de cualquier ciclo (elemento).:)

for $modulo in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_1_modulos_informatica.xml")//modulos/modulo
where $modulo/curso=2
return $modulo/nombre,

'Ejercicio 4 - d',
(:Devuelve el nombre de los módulos que se imparten en el primer curso de ASIR (elemento) y ordénalos alfabéticamente.:)
for $modulo in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_1_modulos_informatica.xml")//modulos/modulo
where $modulo/ciclo="ASIR"
where $modulo/curso=1
order by $modulo/nombre
return $modulo/nombre,

'Ejercicio 5 - e',
(:Obtén el nombre de los módulos con menos de 5 horas semanales (contenido).:)
for $modulo in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_1_modulos_informatica.xml")//modulos/modulo
where $modulo/horasSemanales=5
order by $modulo/nombre
return $modulo/nombre/text(),

'Ejercicio 6 - f',
(:Devuelve el número de módulos que se imparten en el primer curso de ASIR (número).:)
count(//modulo[curso=1 and ciclo="ASIR"]),

'Ejercicio 7 - g',
(:Muestra las horas semanales de los módulos con más de 3 horas semanales (contenido).:)
for $modulo in doc("/home/adrian/Documentos/1DAM/Lenguaje de marcas/XQUERY/ejercicio_1_modulos_informatica.xml")//modulos/modulo
where $modulo/horasSemanales > 3
return $modulo/nombre/text()