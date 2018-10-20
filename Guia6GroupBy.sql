/*Guia 6 group by*/

/*--1--*/
use museo;
select e.escuela, count(r.idEscuela)
from Escuelas e
inner join Reservas r
on e.idEscuela = r.idEscuela
group by e.escuela
order by e.idEscuela;

/*--2--*/
use museo;
select e.escuela, extract(year_month from fecha) as mes, count(r.idEscuela) as cantReservas
from Escuelas e
inner join Reservas r
on e.idEscuela = r.idEscuela
group by extract(month from fecha), e.escuela
order by e.idEscuela;

/*--3--*/ /*no es necesario group by?*/

/*--4--*/
use museo;
select e.escuela, min(extract(year_month from fecha)) as min, max(extract(year_month from fecha)) as max
from Escuelas e
inner join Reservas r
on e.idEscuela = r.idEscuela
group by e.escuela
order by e.idEscuela desc;

/*--5--*/
use museo;
select g.guia, count(vg.idguia)
from Guias g
inner join VisitasGuias vg
on g.idguia = vg.idguia
group by g.guia;

/*--6--*/
use museo;
select g.guia, count(responsable) /*puede ser count(g.guia) también*/
from Guias g
inner join VisitasGuias vg
on g.idguia = vg.idguia
where vg.responsable = 1
group by g.guia
order by g.idguia;

/*--7--*/
use museo;
select g.guia, count(responsable)
from Guias g
inner join VisitasGuias vg
on g.idguia = vg.idguia
where vg.responsable = 1
group by g.guia
having count(responsable) >= 2 /*2 en vez de 5 pq hay pocos datos cargados*/
order by g.idguia; /*order by no puede ir antes del having*/

/*--8--*/
use museo;
select g.guia, count(g.idguia) as cantidad_visitas
from Guias g
inner join VisitasGuias vg
on g.idguia = vg.idguia
group by g.guia
order by count(g.idguia) desc
limit 1;

/*--9--*/
use museo;
select e.escuela, fecha
from escuelas e
inner join reservas r
on e.idEscuela = r.idEscuela
where extract(month from fecha) = 10
group by e.escuela



