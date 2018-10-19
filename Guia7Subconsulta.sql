/*--1--*/
/*Listar Código y Nombre de cada Escuela, y obtener la cantidad de Reservas 
realizadas con una subconsulta.*/

use museo;
select e.idEscuela, escuela, (select count(*)
    from reservas r
    WHERE r.idEscuela = e.idEscuela
    ) as CantReservas
from escuelas e

/*--2--*/
/*Listar Código y Nombre de cada Escuela, y obtener la cantidad de Reservas 
realizadas durante el presente año, con una subconsuta. En caso de no haber
realizado Reservas, mostrar el número cero*/

use museo;
select e.idEscuela, e.escuela, (select ifNull(count(*),0)
    from reservas r
    where r.idEscuela = e.idEscuela
    and month(fecha) = month(now())    /*cambiado year(fecha) por month(fecha)*/
    ) as cantReservas
from escuelas e

/*--3--*/
/*Para cada Tipo de Visita, listar el nombre y obtener con una subconsulta 
como tabla derivada la cantidad de Reservas realizadas*/

use museo;
select tv.tipoVisita, cantidad
from TipoVisitas tv
inner join (select v.idTipoVisita, count(*) as cantidad
    from visitas v
    group by idTipoVisita) cant
on tv.idTipoVisita = cant.idTipoVisita

/*alt method without subquery*/
use museo;
select tv.tipoVisita, count(v.idTipoVisita) as cantidad
from visitas v
inner join TipoVisitas tv
on v.idTipoVisita = tv.idTipoVisita
group by tv.tipoVisita
order by tv.idTipoVisita

/*--4--*/
/*Para cada Guía, listar el nombre y obtener con una subconsulta como tabla 
derivada la cantidad de Visitas en las que participó como Responsable. En 
caso de no haber participado en ninguna, mostrar el número cero.*/

use museo;
select g.guia, (select ifNull(count(*),0)
    from VisitasGuias vg
    where g.idGuia = vg.idGuia
    and Responsable = 1
    ) as cantVisitas
from guias g

/*alt method*/
use museo;
SELECT Guia, ifnull(Cantidad, 0) as Cantidad
FROM Guias G 
LEFT JOIN (SELECT IdGuia, count(*) as 'Cantidad'
	FROM VisitasGuias VG 
    WHERE Responsable = 1 
    GROUP BY IdGuia) Cantidades 
ON G.IdGuia = Cantidades.IdGuia;

/*--5--*/
/*Para cada Escuela, mostrar el nombre y la cantidad de Reservas realizadas 
el último año que visitaron el Museo. Resolver con subconsulta correlacionada.*/

use museo;
select e.escuela, count(r.idEscuela)
from escuelas e
inner join reservas r
on e.idEscuela = r.idEscuela
where r.fecha = (select max(year(fecha))
    from reservas r
    where e.idEscuela = r.idEscuela)
group by e.escuela


use museo;
select max(year(fecha))
from reservas