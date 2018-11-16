/*Guia 6 group by*/

/*Listar la cantidad de Reservas realizadas para cada Escuela, ordenar el 
resultado por identificador de Escuela.*/
/*--1--*/
use museo;
select e.escuela, count(r.idEscuela)
from Escuelas e
inner join Reservas r
on e.idEscuela = r.idEscuela
group by e.escuela
order by e.idEscuela;

/*Listar la cantidad de Reservas realizadas para cada Escuela, en cada mes.*/
/*--2--*/
use museo;
select e.escuela, extract(year_month from fecha) as'Año-Mes', count(r.idEscuela) as cantReservas
from Escuelas e
inner join Reservas r
on e.idEscuela = r.idEscuela
group by e.escuela, extract(year_month from fecha)
order by e.idEscuela, extract(year_month from fecha);

/*Listar para cada Reserva, la cantidad total de Alumnos para los que 
se reservó y la cantidad total de Alumnos que concurrieron en realidad.*/
/*--3--*/ /*no es necesario group by?*/
use museo;
select escuela, r.idreserva, alumnos, alumnosreales
from visitas v
inner join reservas r
on v.idReserva = r.idReserva
inner join escuelas e
on r.idEscuela = e.idEscuela
order by escuela, r.idreserva

/*Listar para cada Escuela, la primera y la última fecha de Reserva, 
ordenar el resultado por identificador de Escuela en forma descendente.*/
/*--4--*/
use museo;
select e.escuela, min(extract(year_month from fecha)) as min, max(extract(year_month from fecha)) as max
from Escuelas e
inner join Reservas r
on e.idEscuela = r.idEscuela
group by e.escuela
order by e.idEscuela desc;

/*Listar para cada Guía, la cantidad de reservas en las que participó.*/
/*--5--*/
use museo;
select guia, ifnull(count(vg.idreserva), 0) as cantReservas
from guias g
left join visitasguias vg
on g.idguia = vg.idguia
group by guia

/*Listar para cada Guía, la cantidad de reservas de día completo 
en las que participó.*/
/*--6--*/
use museo;
select guia, ifnull(count(vg.idreserva), 0) as cantReservas
from guias g
left join visitasguias vg
on g.idguia = vg.idguia
where responsable = 1
group by guia

/*Listar para cada Guía, la cantidad de reservas de día completo en 
las que participó, cuando haya superado las 5 (cinco) participaciones.*/
/*--7--*/
use museo;
select guia, ifnull(count(vg.idreserva), 0) as cantReservas
from guias g
left join visitasguias vg
on g.idguia = vg.idguia
where responsable = 1
group by guia
having cantReservas >= 2 /*2 en vez de 5 pq hay pocos datos cargados*/
order by g.idguia; /*order by no puede ir antes del having*/

/*Listar el Guía que haya participado en mayor cantidad de reservas*/
/*--8--*/
use museo;
select guia, count(vg.idreserva) as cantReservas
from guias g
inner join visitasguias vg
on g.idguia = vg.idguia
group by guia
order by cantReservas desc
limit 1

/*Listar las Escuelas que hayan hecho reservas en el mes de agosto de 2018. 
Tener en cuenta que las Escuelas pueden realizar más de una reserva mensual.*/
/*--9--*/
use museo;
select Escuela
from Escuelas e
inner join reservas r
on e.idescuela = r.idescuela
where year(fecha) = 2018
and month(fecha) = 10
group by escuela



