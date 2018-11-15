CREATE table clientes(id_cliente bigint auto_increment primary key,
					  nombre_cliente varchar(50) not null,
                      cuit varchar(12) unique);
CREATE TABLE cuentas(id_cuenta bigint auto_increment primary key,
					 numero_cuenta varchar(10) unique,
					 id_cliente bigint,
                     constraint fk_clientes_id_cliente foreign key (id_cliente) references clientes(id_cliente));
CREATE TABLE depositos (id_deposito bigint auto_increment primary key,
						fecha datetime,
                        id_cuenta bigint,
                        monto float,
                        constraint fk_depositos_id_cuenta foreign key (id_cuenta) references cuentas(id_cuenta));
CREATE TABLE extracciones (id_extracciones bigint auto_increment primary key,
						fecha datetime,
                        id_cuenta bigint,
                        monto float,
                        constraint fk_extracciones_id_cuenta foreign key (id_cuenta) references cuentas(id_cuenta));


INSERT INTO clientes(nombre_cliente, cuit)
values  ('Navarro David','38831211'),
	    ('Manescau Micaela','38831550');

insert into clientes(nombre_cliente,cuit)
values ('Naira Wanda','3333333333')

INSERT INTO cuentas(numero_cuenta,id_cliente)
values ('1',1),('2',1),('3',2);


insert into depositos(id_cuenta,fecha,monto) values
(1,now(),5000),(2,now(),3000),(3,now(),112);

insert into extracciones(id_cuenta,fecha,monto) values
(1,'2017-10-20 12:22:22',2000),
(2,'2017-10-21 12:22:22',1020),
(3,'2017-10-25 12:21:22',25),
(3,'2017-10-26 12:22:23',30);

insert into extracciones(id_cuenta,fecha,monto) values
(1,'2017-10-13 08:46:16',5000);

insert into depositos(id_cuenta,fecha,monto) values (1,now(),1233);
