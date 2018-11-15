/*--1--*/
/*Generar una consulta para conocer los jugadores y cuantos puntos , rebotes,
asistencias y faltas hicieron de promedio. Listar los mejores 5 y los peores 5 en base
a un coeficiente (promedio*1 + rebotes*0.5 + asistencias*0.5 + (faltas * -1)) .
Identificar cada grupo diciendo si está entre los mejores 5 o los peores 5.*/

use futbol;
(select 'mejores' as 'Grupo', j.nombre, j.apellido, avg(puntos), (avg(rebotes)*0.5) + (avg(asistencias)*0.5) + (avg(faltas)*-1) as SumaPromedio
from jugadores j
inner join jugadores_x_equipo_x_partido jx
on j.idJugador = jx.idJugador
group by j.apellido, j.nombre
order by SumaPromedio desc
limit 5)
union all
(select 'peores', j.nombre, j.apellido, avg(puntos), (avg(rebotes)*0.5) + (avg(asistencias)*0.5) + (avg(faltas)*-1) as SumaPromedio
from jugadores j
inner join jugadores_x_equipo_x_partido jx
on j.idJugador = jx.idJugador
group by j.apellido, j.nombre
order by SumaPromedio
limit 5)

/*--2--*/
/*Generar la consulta del punto 1 pero tomando en cuenta los puntos.*/

use futbol;
(select 'mejores' as 'Grupo', j.nombre, j.apellido, avg(puntos) + (avg(rebotes)*0.5) + (avg(asistencias)*0.5) + (avg(faltas)*-1) as SumaPromedio
from jugadores j
inner join jugadores_x_equipo_x_partido jx
on j.idJugador = jx.idJugador
group by j.apellido, j.nombre
order by SumaPromedio desc
limit 5)
union all
(select 'peores', j.nombre, j.apellido, avg(puntos) + (avg(rebotes)*0.5) + (avg(asistencias)*0.5) + (avg(faltas)*-1) as SumaPromedio
from jugadores j
inner join jugadores_x_equipo_x_partido jx
on j.idJugador = jx.idJugador
group by j.apellido, j.nombre
order by SumaPromedio
limit 5)

/*--3--*/
/*Generar una consulta que nos devuelva el resultado de un partido.*/
/*dos subconsultas, cada una devuelve lista de jugadores de local y de visitante, una vez hecho eso,
ahi hacer los sum, buscar el equipo poniendo idpartido en el primer select y comparandolo con las subconsultas*/

use futbol;
select e1.equipo as Local, e2.equipo as Visitante, (select sum(puntos)
    from jugadores_x_equipo_x_partido jx2
    inner join jugadores j1
    on jx2.idJugador = j1.idJugador
    where p.idEquipoLocal = j1.idEquipo
    ) as puntosEquipoLocal,
    (select sum(puntos)
    from jugadores_x_equipo_x_partido jx3
    inner join jugadores j2
    on jx3.idJugador = j2.idJugador
    where p.idEquipoVisitante = j2.idEquipo
    ) as puntosEquipoVisitante
from partidos p
inner join equipos e1
on p.idEquipoLocal = e1.idEquipo
inner join equipos e2
on p.idEquipoVisitante = e2.idEquipo
group by p.idEquipoLocal, p.idEquipoVisitante
order by p.idPartido

/*--4--*/
/*Generar​ ​una​ ​consulta​ ​que​ ​nos​ ​permita​ ​visualizar​ ​la​ ​tabla​ ​
de​ ​posiciones​ ​del​ ​torneo. */
/*necesita transacciones*/

use futbol;

/*--5--*/
/*Generar​ ​una​ ​consulta​ ​que​ ​nos​ ​permita​ ​conocer​ ​los​ ​jugadores​ ​con​ ​mejor​ ​promedio​ ​de
puntos​ ​es​ ​decir:​ ​Si​ ​hay​ ​dos​ ​jugadores​ ​que​ ​hicieron​ ​30​ ​puntos​ ​por​ ​partido​ ​listarlos​ ​a
ambos.*/

use futbol;
select j.nombre, j.apellido, ifnull((select avg(puntos)
    from jugadores_x_equipo_x_partido jx_sub
    where j.idJugador = jx_sub.idJugador
    ),0) as promedio
from jugadores j
group by j.nombre, j.apellido
order by promedio desc

/*--6--*/
/*Generar​ ​una​ ​consulta​ ​que​ ​nos​ ​permita​ ​conocer​ ​los​ ​jugadores​ ​que​ ​hicieron​ ​más
puntos​ ​en​ ​un​ ​partido​ ​y​ ​en​ ​qué​ ​partido​ ​lo​ ​hicieron​ ​(Poner​ ​Equipo​ ​Local​ ​y​ ​Equipo
Visitante).*/

use futbol;
select e1.equipo as Local, e2.equipo as Visitante, 
    (select jx_sub.idJugador
    from (select jx_sub.idJugador, max(jx_sub.puntos)
        from jugadores j_sub
        inner join jugadores_x_equipo_x_partido jx_sub
        on j_sub.idJugador = jx_sub.idJugador
        where jx_sub.idPartido = p.idPartido 
        ) as t
    ) as JugadorMax
from partidos p
inner join equipos e1
on p.idEquipoLocal = e1.idEquipo
inner join equipos e2
on p.idEquipoVisitante = e2.idEquipo
group by p.idEquipoLocal, p.idEquipoVisitante

use futbol;
select e1.equipo as Local, e2.equipo as Visitante, 
    (select max(jx_sub.puntos)
        from jugadores j_sub
        inner join jugadores_x_equipo_x_partido jx_sub
        on j_sub.idJugador = jx_sub.idJugador
        where jx_sub.idPartido = p.idPartido 
    ) as JugadorMax
from partidos p
inner join equipos e1
on p.idEquipoLocal = e1.idEquipo
inner join equipos e2
on p.idEquipoVisitante = e2.idEquipo
group by p.idEquipoLocal, p.idEquipoVisitante


use futbol;
select j_sub.nombre, jx_sub.idPartido, jx_sub.puntos
from jugadores j_sub
inner join jugadores_x_equipo_x_partido jx_sub
on j_sub.idJugador = jx_sub.idJugador
inner join partidos p
on jx_sub.idPartido = p.idPartido
order by jx_sub.idPartido
where jx_sub.idPartido = p.idPartido
group by jx_sub.idJugador


where jx_sub.puntos = (select max(jx_sub2.puntos) 
                        from jugadores_x_equipo_x_partido jx_sub2)

use futbol;
select jx.idPartido, e1.equipo as Local, e2.equipo as Visitante, jx.idJugador, j.nombre, j.apellido, max(jx.puntos) as PuntosMax
from jugadores j
inner join jugadores_x_equipo_x_partido jx
on j.idJugador = jx.idJugador
inner join partidos p
on jx.idPartido = p.idPartido
inner join equipos e1
on p.idEquipoLocal = e1.idEquipo
inner join equipos e2
on p.idEquipoVisitante = e2.idEquipo
group by jx.idPartido

/*--7--*/
/*Listar​ ​los​ ​equipos​ ​y​ ​en​ ​el​ ​mismo​ ​registro​ ​listar​ ​cual​ ​es​ ​el​ ​jugador​ ​con​ ​el​ ​mayor
promedio​ ​de​ ​puntos.*/

use futbol;
select jx.idPartido, e1.equipo as Local, e2.equipo as Visitante, jx.idJugador, j.nombre, j.apellido
(select) /*aca poner una subc con la query de abajo, as jugador max avg*/
from jugadores j
inner join jugadores_x_equipo_x_partido jx
on j.idJugador = jx.idJugador
inner join partidos p
on jx.idPartido = p.idPartido
inner join equipos e1
on p.idEquipoLocal = e1.idEquipo
inner join equipos e2
on p.idEquipoVisitante = e2.idEquipo
order by jx.idPartido

group by jx.idPartido

/*query que devuelve jugador max avg*//*falta ver como enlazar por equipo*/
use futbol;
select j.idJugador
from jugadores j
inner join jugadores_x_equipo_x_partido jx
on j.idJugador = jx.idJugador
group by j.idJugador
order by avg(jx.puntos) desc
limit 1



