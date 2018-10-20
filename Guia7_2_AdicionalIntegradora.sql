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
ahi hacer los sum, buscar el equipo poniendo idpartido en el primer select y comparandolo con las subconsultas
use futbol;
select p.idEquipoLocal, p.idEquipoVisitante, (select sum(puntos)
    from jugadores_x_equipo_x_partido jx2
    inner join jugadores j1
    on jx2.idJugador = j1.idJugador
    ) as puntosEquipoLocal,
from partidos p
inner join jugadores_x_equipo_x_partido jx
on p.idPartido = jx.idPartido
group by p.idEquipoLocal, p.idEquipoVisitante
order by p.idPartido