create database Cervecerias;
use Cervecerias;
CREATE TABLE Cervezas (
IdCerveza INT NOT NULL AUTO_INCREMENT,
NombreCerveza VARCHAR(30) NOT NULL,
GradoAlcohol smallint NOT NULL,
CONSTRAINT `PK-IdCerveza` PRIMARY KEY (IdCerveza));

Alter table Cervezas modify column GradoAlcohol float;

CREATE TABLE Recetas (
IdReceta INT NOT NULL auto_increment,
IdCerveza INT NOT NULL,
NombreReceta VARCHAR(30) NOT NULL,
CONSTRAINT `PK-Receta` PRIMARY KEY (IdReceta),
CONSTRAINT `FK-IdCerveza` FOREIGN KEY (IdCerveza) references Cervezas(IdCerveza));

CREATE TABLE Ingredientes (
IdIngrediente INT NOT NULL AUTO_INCREMENT,
NombreIngrediente VARCHAR(30) NOT NULL,
CONSTRAINT `PK-IdIngrediente` PRIMARY KEY (IdIngrediente));


CREATE TABLE IngredienteXRecetas (
IdIngredienteReceta INT NOT NULL auto_increment,
IdReceta INT NOT NULL,
IdIngrediente INT NOT NULL,
CONSTRAINT `PK-Ingrediente-Receta` PRIMARY KEY (IdIngredienteReceta),
CONSTRAINT `FK-Receta` FOREIGN KEY (IdReceta) references Recetas(IdReceta),
CONSTRAINT `FK-IdIngrediente` FOREIGN KEY (IdIngrediente) references Ingredientes(IdIngrediente));

INSERT INTO `Cervezas` ( `NombreCerveza`, `GradoAlcohol` ) VALUES
('Altbier', 4.7),
('Ahumada', 4.8),
('American Pale Ale', 6.0),
('Barley Wine', 8.5 ),
('Bock', 7.2), 
('Brown', 2.8), 
('English Pale Ale', 3.2),
('Irish Red', 6.5),
('Klosch', 5.1),
('Miel', 2.1), 
('Porter', 5.4),
('Scotch', 3.9),
('Stout', 7.0); 
#carga de datos de Tabla Cervezas

select *
from Cervezas;
#consulta de datos de Cervezas

INSERT INTO `Ingredientes` ( `NombreIngrediente`) VALUES
('Agua'),
('Levadura'),
('Malta'), 
('Lúpulo'), 
('Vino'),
('Irish Red'),
('Whisky'),
('Cereales'), 
('Zumo de fruta'), 
('Jarabe'), 
('Frambuesa'), 
('Cereza'), 
('Lúpulos amargos'),
('Lúpulos aromáticos'),
('Lúpulos mixtos'); 

select *
from Ingredientes;

INSERT INTO `Recetas` ( IdCerveza, `NombreReceta`) VALUES
(1,'Receta 1'),
(1,'Receta 2'),
(2,'Receta 3'),
(3,'Receta 4'),
(4,'Receta 5'),
(5,'Receta 5'),
(6,'Receta 5'),
(6,'Receta 6'),
(7,'Receta 8'),
(8,'Receta 9'),
(9,'Receta 10'),
(12,'Receta 10'),
(13,'Receta 10');

Select *
from Cervezas;

select *
from recetas;

SELECT 
#*
R.IdReceta as 'Cod de Receta', 
R.NombreReceta as 'Nombre de Receta',
R.IdCerveza as 'Cod de Cerveza Tabla Receta', 
C.IdCerveza as 'Cod de Cerveza Tabla Cerveza',
C.NombreCerveza as 'Nombre de la Cerveza', 
C.GradoAlcohol as 'Graduación Alcoholica'
from Recetas as R
join Cervezas as C
on R.IdCerveza=C.IdCerveza;

INSERT INTO `IngredienteXRecetas` ( IdReceta, IdIngrediente) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(7, 1),
(8, 1),
(9, 1),
(13, 1),
(1, 2),
(2, 2),
(3, 3),
(4, 2),
(5, 2),
(7, 4),
(8, 5),
(9, 2),
(13, 2),
(1, 4),
(1, 3),
(1, 5),
(1, 6),
(1, 7),
(13, 1),
(11, 1),
(12, 1),
(10, 1);

Select * 
from IngredienteXRecetas;

SELECT 
#*
R.IdReceta as 'Cod de RECETA',
IR.IdReceta as 'Cod de Receta IngXReceta', 
R.NombreReceta as 'Nombre de Receta',
R.IdCerveza as 'Cod de Cerveza Tabla Receta', 
C.IdCerveza as 'Cod de Cerveza Tabla Cerveza',
C.NombreCerveza as 'Nombre Cerveza', 
C.GradoAlcohol as 'Grad Alcoholica', 
I.NombreIngrediente as 'Nombre Ingrediente'
from Recetas as R
join Cervezas as C
on R.IdCerveza=C.IdCerveza
join IngredienteXRecetas as IR
on R.IdReceta = IR.IdReceta
join Ingredientes I
on IR.IdIngrediente= I.IdIngrediente

