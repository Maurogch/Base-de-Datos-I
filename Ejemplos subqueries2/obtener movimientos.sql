select 
	* 
from (
	select 
		'Depósito' as tipo_operacion,
		id_cuenta,
		monto,
		fecha 
	from 
		depositos where id_cuenta = 1 
	UNION ALL
	select 
		'Extracción' as tipo_operacion,
		id_cuenta,
		monto,
		fecha 
	from 
		extracciones where id_cuenta = 1) a

