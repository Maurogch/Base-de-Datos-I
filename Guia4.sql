/*--1--*/
use museo;
select e.escuela, t.idtelefono
from escuelas e
inner join telefonos t
on e.idEscuela = t.idEscuela

/*--2--*/
use museo;
select e.escuela, count(r.idEscuela)
from escuelas e
inner join reservas r
on e.idEscuela = r.idEscuela
where extract(year from fecha) = extract(year from now())
group by e.escuela;

/*--3--*/ /*No puedo listar escuelas que no tienen reserva cuando uso where*/
use museo;
select e.escuela, count(r.idEscuela)
from escuelas e
left join reservas r
on e.idEscuela = r.idEscuela
/*where extract(year from fecha) = extract(year from now())*/
group by e.escuela;

/*--4--*/
use museo;
select g.guia
from guias g
inner join VisitasGuias vg
on g.idGuia = vg.idGuia
where responsable = 0;

/*--5--*/
use museo;
select g.guia, vg.idGuia
from guias g
left join VisitasGuias vg
on g.idGuia = vg.idGuia
where vg.idGuia is null /*notar que nunca se puede usar = null*/

/*--6--*/
use museo;
select e.escuela, g.guia, v.alumnosReales, fecha
from visitas v
inner join reservas r
on v.idReserva = r.idReserva
inner join escuelas e
on r.idEscuela = e.idEscuela
inner join VisitasGuias vg
on v.idReserva = vg.idReserva and v.idTipoVisita = vg.idTipoVisita /*notar como hay un on con and cuando es un doble fk*/
inner join guias g
on vg.idGuia = g.idGuia

/*--7--*/
use museo;
select e.escuela, ifNull(l.localidad, 'Sin Localidad') as localidad
from escuelas e
left join localidades l
on e.idLocalidad = l.idLocalidad