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