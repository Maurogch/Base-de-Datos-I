/*5.1 HAVING PRELIMINAR*/

/*--5--*/
/*Listar las escuelas que tengan más de 5 reservas.*/
use museo;
select escuela, count(idReserva) as cantReservas
from escuelas e
inner join reservas r
on e.idEscuela = r.idEscuela
group by e.idEscuela
having cantReservas >= 5

/*--6--*/
use museo;
select e.escuela, sum(alumnosReales)
from escuelas e
inner join reservas r
on e.idEscuela = r.idEscuela
inner join visitas v
on r.idReserva = v.idReserva
inner join VisitasGuias vg
on v.idReserva = vg.idReserva and v.idTipoVisita = vg.idTipoVisita
inner join guias g
on vg.idGuia = g.idGuia
group by e.escuela
having sum(alumnosReales) >= 500;

/*Guia 5.2 Clausula Having*/

/*--1--*/
/*Listar las escuelas que tengan más de 5 reservas en el último mes.*/
use museo;
select escuela, count(idReserva) as cantReservas
from escuelas e
inner join reservas r
on e.idEscuela = r.idEscuela
where month(fecha) = month(now())
group by e.idEscuela
having cantReservas >= 5

/*--2--*/ /*Couldn't use having*/
/*Listar las 3 escuelas que hayan asistido con la mayor cantidad de
alumnos reales.*/
use museo;
select escuela, sum(AlumnosReales) as'Suma alumnos reales'
from escuelas e
inner join reservas r
on e.idEscuela = r.idEscuela
inner join Visitas v
on r.idReserva =  v.idReserva
group by e.idEscuela
order by sum(AlumnosReales) desc
limit 3

/*--3--*/
/*Listar los tipos de visita más realizados en los últimos 2 meses en 
orden ascendente.*/
use museo;
select tv.tipoVisita, count(v.idTipoVisita)
from visitas v
inner join TipoVisitas tv
on v.idTipoVisita = tv.idTipoVisita
inner join reservas r
on v.idReserva = r.idReserva
where fecha >= now() - interval 2 month
group by tv.tipoVisita
order by count(v.idTipoVisita) desc;

/*Listar los guías con menor cantidad de visitas guiadas en cada escuela.*/
/*--4--*/ /*buggy*/
use museo;
select escuela, guia, (select count(vgs.idGuia)
    from VisitasGuias vgs
    where vgs.idGuia = g.idGuia
    group by vgs.idGuia
    order by count(idGuia)
    limit 1) as'cantVisitas'
from VisitasGuias vg
inner join guias g
on vg.idGuia = g.idGuia
inner join (select *
    from reservas) as r
on r.idReserva = vg.idReserva
inner join escuelas e
on e.idEscuela = r.idEscuela
group by escuela,guia

/*Listar las escuelas con gastos superiores a los $200 en los últimos 3 meses*/
/*--5--*/ /*tv.arancel usado, ya que r.arance esta en null*/
use museo;
select e.escuela, sum(tv.arancel)
from visitas v
inner join reservas r
on v.idReserva = r.idReserva
inner join escuelas e
on r.idEscuela = e.idEscuela
inner join TipoVisitas tv
on v.idTipoVisita = tv.idTipoVisita
where fecha >= now() - interval 3 month
group by e.escuela
having sum(tv.arancel) >= 200
