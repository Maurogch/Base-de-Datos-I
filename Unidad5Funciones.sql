/**
 *  1 - Ordena el listado por habitantes de mayor a menor
 **/

use integridad_referencial;
select * 
from ciudades 
order by habitantes desc

/**
 *  2 - Ordena el listado de ciudades por fecha de fundacion ascendente y 
 *  luego por cantidad de habitantes descendente
 **/

use integridad_referencial;
select * 
from ciudades 
order by fundacion asc, habitantes desc

/**
 *  3 - Selecciona las tres ciudades con mas habitantes
 **/

use integridad_referencial;
select * 
from ciudades 
order by habitantes desc 
limit 3

/**
 *  4 - Selecciona la ciudad con más habitantes de cada pais
 **/

use integridad_referencial;
select max(ci.habitantes) as MayorCiudad, pa.nombre_pais as Pais 
from ciudades ci 
join provincias pr 
on ci.id_provincia = pr.id_provincia 
join paises pa on pa.id_pais = pr.id_pais 
group by pa.nombre_pais

/**
 *  5 - Calcula el promedio de habitantes por ciudad por provincia
 **/

use integridad_referencial;
select avg(habitantes) as PromedioHabitantes, pr.nombre_provincia as Provincia 
from provincias pr 
join ciudades ci 
on pr.id_provincia = ci.id_provincia 
group by nombre_provincia

/**
 *  6 - Suma el total de habitantes por provincia
 **/

use integridad_referencial;
select sum(habitantes) as TotalHabitantes, pr.nombre_provincia as Provincia 
from provincias pr 
join ciudades ci 
on pr.id_provincia = ci.id_provincia 
group by nombre_provincia


/**
 *  7 - Cuenta la cantidad total de ciudades y la cantidad total de provincias por pais
 **//*count(DISTINCT column) return count of not null values*/

use integridad_referencial;
select count(DISTINCT nombre_provincia) as TotalProvincias, count(DISTINCT nombre_ciudad) as TotalCiudades, pa.nombre_pais as Pais 
from ciudades ci 
join provincias pr 
on ci.id_provincia = pr.id_provincia 
join paises pa 
on pa.id_pais = pr.id_pais 
group by pa.nombre_pais

/**
 *  8 - Cuenta la cantidad total de ciudades y la cantidad total de provincias por pais, incluyendo aquellos que no tienen ninguno
 **/

use integridad_referencial;
select count(DISTINCT nombre_provincia) as TotalProvincias, count(DISTINCT nombre_ciudad) as TotalCiudades, pa.nombre_pais as Pais 
from paises pa 
left outer join provincias pr 
on pa.id_pais = pr.id_pais  
left outer join ciudades ci 
on ci.id_provincia = pr.id_provincia 
group by pa.nombre_pais

/**
 *  8b - ¿Por qué la siguiente consulta no entrega los mismos resultados que la anterior?
 **/

use integridad_referencial;
select count(DISTINCT nombre_provincia) as TotalProvincias, count(DISTINCT nombre_ciudad) as TotalCiudades, pa.nombre_pais as Pais 
from ciudades ci 
left outer join provincias pr 
on ci.id_provincia = pr.id_provincia 
left outer join paises pa 
on pa.id_pais = pr.id_pais 
group by pa.nombre_pais

/**
 *  9 - Cuenta la cantidad total de ciuddes y provincias por pais, los ordena por ciudad primero y 
 *  luego por provincias y muestra solo el podio
 **/

use integridad_referencial;
select count(DISTINCT nombre_provincia) as TotalProvincias, count(DISTINCT nombre_ciudad) as TotalCiudades, pa.nombre_pais as Pais 
from paises pa 
left outer join provincias pr 
on pa.id_pais = pr.id_pais  
left outer join ciudades ci 
on ci.id_provincia = pr.id_provincia 
group by pa.nombre_pais 
order by count(DISTINCT nombre_ciudad) DESC, count(DISTINCT nombre_provincia) DESC 
LIMIT 3
