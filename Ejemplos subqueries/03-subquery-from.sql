select sum(monto) as total,mov.numero,c.nombre_cliente  from (
select
  'Deposito' as tipo,
   monto,
   fecha,
   numero,
   c.id_cuenta
from
  depositos d
  inner join cuenta c on d.id_cuenta = c.id_cuenta
union all
select
  'Extraccion' as tipo,
   monto*-1,
   fecha,
   numero,
   c.id_cuenta
from
  extracciones e
  inner join cuenta c on e.id_cuenta = c.id_cuenta
order by fecha desc  ) mov inner join cuenta c on c.id_cuenta = mov.id_cuenta
group by mov.numero,c.nombre_cliente;
