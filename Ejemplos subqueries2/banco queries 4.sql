/* Subqueries en el select*/
select
	c.numero_cuenta,
    (select sum(monto) from depositos d where d.id_cuenta = c.id_cuenta) - (select sum(monto) from extracciones e where e.id_cuenta = c.id_cuenta ) as saldo
from
	cuentas c

/* Otra manera*/
select
	numero_cuenta,
    (depositos - extracciones) as saldo
    from (
select
	c.numero_cuenta,
    (select sum(monto) from depositos d where d.id_cuenta = c.id_cuenta) as depositos,
    (select sum(monto) from extracciones e where e.id_cuenta = c.id_cuenta ) as extracciones
from
	cuentas c) a
