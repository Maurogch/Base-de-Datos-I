/*--1--*/

create procedure databaseName.movimientosCuenta(in _idCuenta int)
begin

(select e.id_cuentas as'Numero de Cuenta', 'Extracción' as'Tipo de Operación',
    fecha, monto
from cuentas c
inner join extracciones e
on c.id_cuenta = e.id_cuenta
where c.id_cuenta = _idCuenta
)
union all
(select e.id_cuentas as'Numero de Cuenta', 'Deposito', fecha, monto
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
group by numero
order by razon_social;

/*--4--*/

select razon_social as'Razon Social', numero as'Número de Cuenta', sum(monto) as'Monto Total Extraído'
from cuentas cu
inner join clientes cl
on cu.id_cliente = cl.id_cliente
left join extracciones e  #para que devuelva 0 si no hay extracciónes
on cl.id_cuenta = e.id_cuenta
group by numero
order by razon_social;

/*--5--*/

select t.razon_social as'Razon Social', t.numero as'Número de Cuenta', ifnull(sum(t.balance),0) as Saldo     
from (select razon_social,numero,sum(monto) as balance
        from cuentas cu
        inner join clientes cl
        on cu.id_cliente = cl.id_cliente
        left join depositos d
        on cl.id_cuenta = d.id_cuenta
        group by razon_social
        order by razon_social)
        union all
        (select razon_social,numero,(sum(monto)*-1) as balance
        from cuentas cu
        inner join clientes cl
        on cu.id_cliente = cl.id_cliente
        left join extracciones e
        on cl.id_cuenta = e.id_cuenta
        group by razon_social
        order by razon_social)
    ) as t
group by numero
order by razon_social;

/*--6--*/
/*Listar el número de cuenta y el total depositado en las cuales se haya depositado más de 1000 pesos
en toda la historia*/

select razon_social as'Razon Social', numero as'Número de Cuenta', sum(monto) as'Monto Total Depositado'
from cuentas c
left join depositos d  
on c.id_cuenta = d.id_cuenta
left join extracciones e  
on c.id_cuenta = e.id_cuenta
group by numero
having sum(monto) >= 1000
order by razon_social;

/*--7--*/
/*Describa el procedimiento por el cual se podría generar automáticamente una tabla de saldo por
cuenta, que se actualice cuando se inserten, eliminen o modifiquen registros de las tablas de extracción
y depósito.*/
#NO HACER, uso de triggers
