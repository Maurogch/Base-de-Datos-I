/*--1--*/

create procedure databaseName.movimientosCuenta(in _idCuenta int)
begin

(select e.id_cuentas as'Numero de Cuenta', Extraccion as'Tipo de Operación',
    fecha, monto
from cuentas c
inner join extracciones e
on c.id_cuenta = e.id_cuenta
where c.id_cuenta = _idCuenta
)
union all
(select e.id_cuentas as'Numero de Cuenta', Deposito as'Tipo de Operación',
    fecha, monto
from cuentas c
inner join depositos d
on c.id_cuenta = e.id_cuenta
where c.id_cuenta = _idCuenta
);

end

/*--2--*/
/*Realizar un stored procedure para dar de alta un cliente y darle de alta una cuenta. Devolver en un
parámetro de salida el id_cliente generado.*/

create procedure databaseName.nuevoCliente(in razon_social varchar(50), in cuit varchar(15),
in numero int, out _idCuenta int)
begin

insert into clientes (razon_social, cuit)
values (razon_social, cuit);

_idCuenta = last_insert_id();

insert into cuentas (id_cliente, numero)
values (_idCuenta, numero);

end

/*--3--*/

select razon_social as'Razon Social', numero as'Número de Cuenta', sum(monto) as'Monto Total Depositado'
from cuentas cu
inner join clientes cl
on cu.id_cliente = cl.id_cliente
left join depositos d  #para que devuelva 0 si no hay depositos
on cl.id_cuenta = d.id_cuenta
group by razon_social
order by razon_social;

/*--4--*/

select razon_social as'Razon Social', numero as'Número de Cuenta', sum(monto) as'Monto Total Extraído'
from cuentas cu
inner join clientes cl
on cu.id_cliente = cl.id_cliente
left join extracciones e  #para que devuelva 0 si no hay depositos
on cl.id_cuenta = e.id_cuenta
group by razon_social
order by razon_social;

/*--5--*/

select razon_social as'Razon Social', numero as'Número de Cuenta', (sum(d.monto) - (sum(e.monto))) as Saldo
from cuentas cu
inner join clientes cl
on cu.id_cliente = cl.id_cliente
left join depositos d  
on cl.id_cuenta = d.id_cuenta
left join extracciones e  
on cl.id_cuenta = e.id_cuenta
group by razon_social
order by razon_social;

#alt

select razon_social as'Razon Social', numero as'Número de Cuenta', (
    (select sum(monto)
    from cuentas cu
    inner join clientes cl
    on cu.id_cliente = cl.id_cliente
    left join depositos d
    on cl.id_cuenta = d.id_cuenta
    group by razon_social
    order by razon_social)
    union all
    (select sum(monto)*-1
    from cuentas cu
    inner join clientes cl
    on cu.id_cliente = cl.id_cliente
    left join extracciones e
    on cl.id_cuenta = e.id_cuenta
    group by razon_social
    order by razon_social)
) as Saldo
from cuentas cu
inner join clientes 
order by razon_social;

/*--6--*/
/*Listar el número de cuenta y el total depositado en las cuales se haya depositado más de 1000 pesos
en toda la historia*/

select razon_social as'Razon Social', numero as'Número de Cuenta', (sum(d.monto) - sum(e.monto)) as Saldo
from cuentas cu
inner join clientes cl
on cu.id_cliente = cl.id_cliente
left join depositos d  
on cl.id_cuenta = d.id_cuenta
left join extracciones e  
on cl.id_cuenta = e.id_cuenta
where e.monto >= 1000;
group by razon_social;
order by razon_social;

/*--7--*/
/*Describa el procedimiento por el cual se podría generar automáticamente una tabla de saldo por
cuenta, que se actualice cuando se inserten, eliminen o modifiquen registros de las tablas de extracción
y depósito.*/
#NO HACER, uso de triggers
