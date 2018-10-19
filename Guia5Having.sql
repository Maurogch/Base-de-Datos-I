/*5.1 HAVING PRELIMINAR*/

/*--5--*/
use museo;
select e.escuela, count(r.idEscuela)
from escuelas e
inner join reservas r
on e.idEscuela = r.idEscuela
group by e.escuela
having count(r.idEscuela) > 4;

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

/*--3--*/
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

/*--5--*/
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
having sum(tv.arancel) > 300
