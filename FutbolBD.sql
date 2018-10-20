/*create database futbol;*/
use futbol;

/*create table equipos(
    idEquipo int auto_increment,
    equipo varchar(50) not null,
    primary key (idEquipo)
);*/

/*insert into equipos(equipo)
values ('River'),('Boca'),('Yupanki'),('Racing'),('Central');*/

/*create table jugadores(
    idJugador int auto_increment,
    idEquipo int,
    nombre varchar(50),
    apellido varchar(50),
    primary key (idJugador),
    foreign key (idEquipo) references equipos (idEquipo)
);*/

/*insert into jugadores(idEquipo, nombre, apellido)
values (1,'Franco','Armani'),(1,'Enrique','Bologna'),(1,'Nahuel','Gallardo'),(1,'Jorge','Moreira'),
(2,'Agustin','Rossi'),(2,'Paolo','Goltz'),(2,'Emanuel','Mas'),(2,'Fernando','Gago'),
(3,'Juan','Perez'),(3,'John','Smith'),
(4,'Arias','Gabriel'),(4,'Alexis','Soto'),(4,'Ivan','Pillud'),
(5,'Marcelo','Miño'),(5,'Josue','Ayala'),(5,'Matias','Caruzzo'),(5,'Elias','Gomez'),
(null,'Jugador','Sin equipo'),(null,'otro jugador','sin equipo');*/

/*create table partidos(
    idPartido int auto_increment,
    idEquipoLocal int not null,
    idEquipoVisitante int not null,
    fecha datetime,
    primary key (idPartido),
    foreign key (idEquipoLocal) references equipos (idEquipo),
    foreign key (idEquipoVisitante) references equipos (idEquipo)
);*/

/*insert into partidos(idEquipoLocal,idEquipoVisitante,fecha)
values (1,2,'2018-10-01'),(1,2,'2018-10-02'),(1,3,'2018-09-01'),(1,4,'2018-08-01'),
(2,4,'2018-10-01'),(5,2,'2018-10-01'),(3,2,'2018-01-01'),(4,2,'2018-01-01'),
(4,2,'2018-02-01'),(4,3,'2018-02-02'),(1,2,'2018-04-01');*/

/*create table jugadores_x_equipo_x_partido(
    idJugador int,
    idPartido int,
    puntos int,
    rebotes int,
    asistencias int,
    minutos int,
    faltas int,
    primary key (idJugador, idPartido),
    foreign key (idJugador) references jugadores (idJugador),
    foreign key (idPartido) references partidos (idPartido)
);*/

/*INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (2,3,4,4,9,85,4);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (3,7,2,7,2,29,3);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (2,8,8,3,8,26,4);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (3,6,10,6,2,69,4);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (12,6,7,1,3,33,3);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (12,1,6,6,7,23,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (18,9,2,8,10,24,4);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (7,3,9,1,2,48,3);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (19,11,4,9,10,42,1);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (10,4,3,10,6,46,1);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (1,9,1,4,6,76,4);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (15,11,10,1,8,50,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (8,7,1,6,7,73,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (12,10,1,8,3,52,4);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (8,5,10,3,1,7,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (8,11,4,6,8,56,1);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (6,6,3,4,6,16,1);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (16,8,3,8,5,46,1);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (7,9,3,2,7,39,3);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (14,10,4,8,8,14,1);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (8,11,8,2,7,29,4);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (13,4,4,9,1,16,3);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (17,9,10,9,2,77,4);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (13,11,5,3,10,33,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (1,5,10,7,4,41,3);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (15,2,7,1,6,70,1);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (1,6,2,6,7,85,4);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (9,11,5,6,6,4,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (1,11,2,2,10,25,3);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (7,4,3,7,7,26,1);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (15,3,2,1,5,6,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (16,9,6,9,1,52,3);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (10,6,5,8,3,23,4);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (14,8,5,1,4,38,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (15,4,4,5,7,36,3);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (11,1,1,1,10,61,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (15,11,6,9,2,1,1);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (18,2,6,10,1,10,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (2,5,9,10,8,37,3);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (2,10,2,1,3,72,4);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (8,4,6,1,5,61,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (18,7,7,1,5,60,4);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (15,8,1,2,3,89,3);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (11,8,8,7,5,15,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (4,2,10,5,6,54,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (8,5,2,2,9,58,1);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (1,8,1,9,3,16,1);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (11,9,7,5,1,23,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (10,4,3,4,1,64,3);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (7,10,2,9,7,46,4);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (10,4,4,9,7,41,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (12,8,5,5,9,72,3);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (18,11,10,2,9,4,3);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (15,11,7,10,7,71,4);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (14,8,8,7,5,45,4);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (4,3,6,7,3,4,1);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (10,3,3,8,10,24,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (13,2,4,3,2,2,3);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (8,4,5,2,4,37,4);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (6,3,3,5,9,6,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (11,4,6,1,10,90,4);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (4,8,6,10,4,4,1);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (10,8,4,6,2,74,4);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (9,2,8,5,7,27,3);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (2,3,2,9,4,81,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (11,10,4,10,2,60,4);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (11,5,5,2,8,25,3);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (19,3,1,9,5,61,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (12,6,8,3,3,41,3);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (14,5,1,5,6,87,4);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (19,8,2,4,10,83,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (7,11,4,8,4,37,1);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (8,9,9,6,3,62,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (6,5,7,3,9,4,1);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (13,7,7,2,5,81,4);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (11,10,10,5,6,28,1);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (8,3,5,6,7,35,4);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (12,8,3,3,1,4,1);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (15,8,6,3,2,44,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (6,7,1,7,2,30,3);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (4,4,1,2,3,14,1);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (11,11,7,4,3,41,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (3,4,10,8,4,45,4);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (5,11,1,3,3,23,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (6,1,5,8,8,59,1);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (15,2,10,1,5,19,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (3,2,5,7,5,52,3);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (15,10,8,1,9,30,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (12,3,9,5,9,32,3);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (9,7,10,1,10,51,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (9,1,2,3,7,7,1);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (14,10,6,9,2,58,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (19,4,5,6,7,11,1);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (1,5,4,6,5,13,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (16,7,4,8,8,59,1);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (18,2,3,5,10,63,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (2,4,4,1,1,87,2);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (14,6,5,2,3,18,1);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (5,8,3,6,7,66,4);
INSERT INTO `jugadores_x_equipo_x_partido` (`idJugador`,`idPartido`,`puntos`,`rebotes`,`asistencias`,`minutos`,`faltas`) VALUES (10,3,1,1,10,19,4);*/
