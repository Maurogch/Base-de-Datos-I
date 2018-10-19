create database banco;

use banco;

create table cuenta(
	numeroCuenta int primary key AUTO_INCREMENT,	
	fkBanco int
);

create table depositos(
	numeroDeposito int primary key AUTO_INCREMENT,
	fecha timestamp default current_timestamp,
	monto double,
	fkNumeroCuenta int,
	foreign key (fkNumeroCuenta) references cuenta (numeroCuenta)
);

create table extracciones(
	numeroExtraccion int primary key AUTO_INCREMENT,
	fecha timestamp default current_timestamp,
	monto double,
	fkNumeroCuenta int,
	foreign key (fkNumeroCuenta) references cuenta (numeroCuenta)
);

insert into cuenta (fkBanco)
values (1),(2),(2),(2),(3),(3),(4),(4),(5),(7);
select * from cuenta;

insert into extracciones(monto,fknumerocuenta) 
values (100,1),(150,1),(200,1),(100,2),(150,2),(200,2);
select * from extracciones;

insert into depositos (monto,fknumerocuenta)
values (2400,2),(4150,7),(3600,5),(10200,2),(6400,3),(5000,7),(4600,2),(10200,2);
select * from depositos;

/*----------------------------------------------------------------------*/


use banco;
select 'Depositos' as'Tipo de movimiento',monto 
from depositos
union    
select 'Extracciones',monto 
from extracciones

use banco;
select 'Depositos' as'Tipo de movimiento',monto 
from depositos
union all    
select 'Extracciones',monto 
from extracciones

use banco;
select 'Depositos' as'Tipo de movimiento',numeroDeposito as'Numero Movimiento',fecha,monto 
from depositos
union all   
select 'Extracciones',numeroExtraccion,fecha,monto 
from extracciones


 /*------------Ejercicios-----------*/

/*-Listar los primeros 3 depositos y las primeras 3 extracciones*/

use banco;
(select 'Depositos' as'Tipo de movimiento',monto, fecha
from depositos
order by fecha
limit 3)
union
(select 'Extracciones',monto,fecha
from extracciones
order by fecha
limit 3)

/*-Listar el total depositado y el total de extracciones*/

use banco;
(select 'Depositos' as'Tipo de movimiento',sum(monto)
from depositos)
union
(select 'Extracciones',sum(monto)
from extracciones)

/*-Listar el promedio de Depositos y de Extracciones*/

use banco;
(select 'Depositos' as'Tipo de movimiento',avg(monto)
from depositos)
union
(select 'Extracciones',avg(monto)
from extracciones)

/*-Listar el Balance de Transferencias (Depositos - Extracciones)*/

use banco;
select sum(balance) as balance /*sum aliases*/
from(
(select sum(monto) as balance
from depositos d)
union
(select (sum(monto)*-1) as balance
from extracciones e)
) as t /*every Subquery needs an alias*/