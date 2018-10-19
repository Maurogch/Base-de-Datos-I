use museo;

/*
CREATE TABLE Escuelas (
  idEscuela int AUTO_INCREMENT,
  escuela varchar(50),
  domicilio varchar(50),
  PRIMARY KEY (idEscuela)
);*/

/*insert into Escuelas (escuela)
values ('escuela1'),('escuela2'),('escuela3'),('escuela4');*/

/*CREATE TABLE Telefonos (
  idTelefono int,
  idEscuela int,
  PRIMARY KEY (idTelefono),
  FOREIGN KEY (idEscuela) REFERENCES Escuelas (idEscuela)
);*/

/*insert into telefonos (idTelefono,idEscuela)
values (111,1),(222,1),(333,2);*/

/*CREATE TABLE Reservas(
idReserva int AUTO_INCREMENT,
idEscuela int,
fecha date,
 PRIMARY KEY (idReserva),
 FOREIGN KEY (idEscuela) references Escuelas (idEscuela)
);*/

/*insert into Reservas(idEscuela,fecha)
values (1,'2018-01-01'),(1,'2018-02-01'),(1,'2018-09-01'),(1,'2018-10-01'),(2,'2018-10-01'),(1,'2018-01-02'),(2,'2018-03-02'),(2,'2018-10-02');*/

/*create table TipoVisitas(
    idTipoVisita int auto_increment,
    tipoVisita varchar(50),
    arancel DECIMAL(6,2),
    primary key (idTipoVisita)
);*/

/*insert into TipoVisitas(tipoVisita,arancel)
values ('Común', 100.5),('Extendida', 150.7),('Completa', 210.8);*/

/*create table Visitas(
    idReserva int,
    idTipoVisita int,
    grado varchar(5),
    alumnos int,
    alumnosReales int,
    arancel decimal(6,2),
    primary key (idReserva, idTipoVisita),
    foreign key (idReserva) references Reservas (idReserva),
    foreign key (idTipoVisita) references TipoVisitas (idTipoVisita)
);*/

/*insert into Visitas(idReserva,idTipoVisita,grado,alumnos,alumnosReales)
values (1,1,'1a',200,150),(2,1,'1b',200,160),(3,2,'1c',200,120),(4,3,'2a',100,80),(5,1,'1a',80,50),(6,1,'1a',232,123),(7,1,'1a',210,130),(8,1,'1a',213,50);*/

/*create table Guias(
    idGuia int auto_increment,
    guia varchar(50) not null,
    primary key (idGuia)
);*/

/*insert into Guias(guia)
values ('Juan'),('John'),('Marcelo'),('Nadia');*/

/*create table VisitasGuias(
    idReserva int,
    idTipoVisita int,
    idGuia int,
    responsable smallint not null,
    primary key (idReserva, idTipoVisita, idGuia),
    foreign key (idReserva) references Reservas (idReserva),
    foreign key (idTipoVisita) references TipoVisitas (idTipoVisita),
    foreign key (idGuia) references Guias (idGuia)
);*/

/*insert into VisitasGuias(idReserva,idTipoVisita,idGuia,responsable)
values (1,1,1,1),(1,1,2,0),(2,1,1,0),(2,1,2,1),(3,2,3,1),(4,3,1,1),(5,1,1,1);*/

/*create table Localidades(
    idLocalidad int auto_increment,
    localidad varchar(50) not null,
    primary key (idLocalidad)
);*/

/*insert into localidades(localidad)
values ('Buenos Aires'),('Gran Buenos Aires')*/

/*ALTER TABLE Escuelas
ADD  idLocalidad int */

/*ALTER TABLE Escuelas
add constraint foreign key (idLocalidad) references localidades (idLocalidad)*/

/*update escuelas
set idLocalidad = 1
where idEscuela = 1;

update escuelas
set idLocalidad = 1
where idEscuela = 2;*/








