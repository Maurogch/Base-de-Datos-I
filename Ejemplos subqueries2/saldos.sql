select
		a.id_cuenta, 
    c.numero_cuenta,
    cli.nombre_cliente,
    sum(monto) as saldo
from (
	select
		id_cuenta,
		monto,
		fecha
	from
		depositos
	UNION ALL
	select
		id_cuenta,
		monto*-1,
		fecha
	from
		extracciones) a inner join cuentas c on a.id_cuenta = c.id_cuenta
						inner join clientes cli on cli.id_cliente = c.id_cliente
group by a.id_cuenta
