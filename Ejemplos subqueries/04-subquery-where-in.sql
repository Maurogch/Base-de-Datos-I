select 
  *
from
  depositos d
where
  d.id_cuenta in (select * from cuenta where numero in ('3','4','5'));
