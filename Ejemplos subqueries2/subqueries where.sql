select * from cuentas
where numero_cuenta = '1' or numero_cuenta = '3'


select * from cuentas
where numero_cuenta in ('1','3')


select * from cuentas
where id_cliente in (select id_cliente from clientes where nombre_cliente like 'N%')


select * from cuentas
where id_cliente = (select id_cliente from clientes where nombre_cliente like 'N%')


