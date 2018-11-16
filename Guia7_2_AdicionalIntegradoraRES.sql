/* VERSION HACK */

#1) Sacar id_jugador con mejor promedio por equipo 

(select 
    CONCAT(j.nombre_jugador,' ', j.apellido) as jugador   
from 
    jugadores j inner join jugadores_x_equipo_x_partido jxp on j.id_jugador = jxp.id_jugador
where 
    j.id_equipo = 2
group by CONCAT(j.nombre_jugador,' ', j.apellido)
order by avg(jxp.puntos) desc
limit 1)  


SELECT 
    nombre_equipo,
    (select 
        CONCAT(j.nombre_jugador,' ', j.apellido) as jugador   
    from 
        jugadores j inner join jugadores_x_equipo_x_partido jxp on j.id_jugador = jxp.id_jugador
    where 
        j.id_equipo = e.id_equipo
    group by CONCAT(j.nombre_jugador,' ', j.apellido)
    order by avg(jxp.puntos) desc
    limit 1) as goleador 
from 
    equipos e



/* 2 VAMOS A HACERLA BIEN*/

select 
    prom_jug.nombre_jugador,
    prom_jug.apellido,
    max_equipo.nombre_equipo
from 
    (select 
        jxp.id_jugador,
        j.nombre_jugador, 
        j.apellido,
        j.id_equipo,
        avg(jxp.puntos) as promedio
    from        
                jugadores_x_equipo_x_partido jxp 
                inner join jugadores j on jxp.id_jugador = j.id_jugador
    group by jxp.id_jugador, j.id_equipo, j.nombre_jugador, j.apellido
    ) prom_jug 
    inner join 
        (select 
            promedios.id_equipo, 
            promedios.nombre_equipo,
            max(promedios.promedio) as promedio
        from (
                    select 
                        jxp.id_jugador,
                        j.id_equipo,
                        e.nombre_equipo,
                        avg(jxp.puntos) as promedio
                    from        
                        jugadores_x_equipo_x_partido jxp 
                        inner join jugadores j on jxp.id_jugador = j.id_jugador
                        inner join equipos e on e.id_equipo = j.id_equipo
                    group by jxp.id_jugador, j.id_equipo,e.nombre_equipo
        ) promedios 
        group by id_equipo,nombre_equipo) max_equipo 
        on prom_jug.id_equipo = max_equipo.id_equipo and prom_jug.promedio = max_equipo.promedio


/* 6)  Generar una consulta que genere los jugadores que hicieron mas puntos en un  partido*/

select 
    p.id_partido,
    el.nombre_equipo,
    ev.nombre_equipo,
    maxima.puntos,
    p.fecha,
    j.nombre_jugador,
    j.apellido
from 
    partidos p 
    inner join equipos el on el.id_equipo = p.id_equipo_local
    inner join equipos ev on ev.id_equipo = p.id_equipo_visitante
    inner join (select 
                    id_partido, 
                    max(puntos) as puntos
                from   
                    jugadores_x_equipo_x_partido jxp
                group by id_partido) as maxima on p.id_partido = maxima.id_partido
    inner join jugadores_x_equipo_x_partido jxp on jxp.id_partido = p.id_partido and jxp.puntos = maxima.puntos
    inner join jugadores j on jxp.id_jugador = j.id_jugador