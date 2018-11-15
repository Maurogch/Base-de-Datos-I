/**Variables Ejemplo**/
set @var1 = null;
set @var2 = null;

select max(puntos),max(idPartido)
into @var1, @var2
from jugadores_x_equipo_x_partido;

select @var1, @var2;

/*--1--*/
/*Generar un Stored Procedure que permite ingresar un equipo.*/

create procedure futbol.addEquipo(in inEquipo varchar(50))
begin
    insert into Equipos (equipo)
    values (inEquipo);
end

use futbol;
call addEquipo('nuevoEquipoConProcedure')

use futbol;
select * from Equipos

/*--2--*/
/*Generar un Stored Procedure que permita agregar un jugador pero se debe pasar el
nombre del equipo y no el Id. */

create procedure futbol.addJugador(in _equipo varchar(50),in _nombre varchar(50),in _apellido varchar(50))
begin
    declare _idEquipo int;
    select idEquipo into _idEquipo
    from Equipos
    where equipo = _equipo;

    insert into jugadores (idEquipo, nombre, apellido)
    values (_idEquipo,_nombre,_apellido);
end

use futbol;
select * from Equipos

use futbol;
call addJugador('nuevoEquipoConProcedure', 'John', 'Cena');
select * from jugadores

/*--3--*/
/*Generar un Stored Procedure que permita dar de alta un equipo y sus jugadores.
Devolver en un parámetro output el id del equipo.*/
#3 jugadores

create procedure futbol.addEquipoConTresJugadores(in _equipo varchar(50), in _nombre1 varchar(50),
 in _apellido1  varchar(50), in _nombre2 varchar(50), in _apellido2 varchar(50),
 in _nombre3 varchar(50), in _apellido3 varchar(50), out _idEquipo varchar(50))
begin
   insert into Equipos (equipo)
   values (_equipo);

   set _idEquipo = last_insert_id();

   insert into jugadores (idEquipo,nombre,apellido)
   values (_idEquipo,_nombre1,_apellido1),
   (_idEquipo,_nombre2,_apellido2),
   (_idEquipo,_nombre3,_apellido3);
end

use futbol;
call addEquipoConTresJugadores('Jupanki','Juancho','Panza','Cosme','Fulanito','John','Doe',@idEquipo);
select * from Equipos;
select * from jugadores;
select @idEquipo;

/*--4--*/
/*Generar un Stored Procedure que liste los partidos de un mes y año, pasado por
parametro*/

create procedure futbol.listPartidosMonthYear(in _month int, in _year int)
begin

    select e1.equipo as'Equipo Local', e2.equipo as'Equipo Visitante'
    from partidos
    inner join equipos e1
    on idEquipoLocal = e1.idEquipo
    inner join equipos e2
    on idEquipoVisitante = e2.idEquipo
    where month(fecha) = _month
    and year(fecha) = _year
    order by e1.equipo;
end

use futbol;
call listPartidosMonthYear(1,2018)

/*--5--*/
/*Generar un Stored Procedure que devuelva el resultado de un partido pasando por
parámetro los nombres de los equipos. El resultado debe ser devuelto en dos
variables output*/

create procedure futbol.resultadoPartido(in local varchar(50), in visitante varchar(50), 
out rLocal int, out rVisitante int)
begin

    select (select count(puntos)
        from jugadores_x_equipo_x_partido jx
        where jx.idJugador = j1.idJugador
        ) as'Puntos Local',
        (select count(puntos)
        from jugadores_x_equipo_x_partido jx
        where jx.idJugador = j2.idJugador
        ) as'Puntos Visitante'
    into rLocal, rVisitante
    from partidos p
    inner join equipos e1
    on p.idEquipoLocal = e1.idEquipo
    inner join equipos e2
    on p.idEquipoVisitante = e2.idEquipo
    inner join jugadores j1
    on j1.idEquipo = p.idEquipoLocal
    inner join jugadores j2
    on j2.idEquipo = p.idEquipoVisitante
    where e1.equipo = local
    and e2.equipo = visitante
    limit 1;
    #falta implrementación de torneo en el der, deberia de devolver solo 2 partidos
    #por lo que usamos limit 1 y devolvemos el primer resultados solo para testear

end

use futbol;
call resultadoPartido('Racing', 'Boca', @rLocal, @rVisitante);

select @rLocal, @rVisitante;

/*--6--*/
/*Generar un stored procedure que muestre las estadisticas promedio de los jugadores
de un equipo.*/

create procedure futbol.promedioJugadoresEquipo(in _idEquipo int, out pPuntos int,
out pRebotes int, out pAsistencias int, out pMinutos int, out pFaltas int)
begin

    select avg(puntos), avg(rebotes), avg(asistencias), avg(minutos), avg(faltas)
    into pPuntos, pRebotes, pAsistencias, pMinutos, pFaltas
    from jugadores_x_equipo_x_partido jx
    inner join jugadores j
    on jx.idJugador = j.idJugador
    where idEquipo = idEquipo;

end

call promedioJugadoresEquipo(1, @pPuntos, @pRebotes, @pAsistencias, @pMinutos, @pFaltas);

select @pPuntos, @pRebotes, @pAsistencias, @pMinutos, @pFaltas;




