/*--1--*/
/*Mostrar el nombre del ingrediente del que mas cantidad haya.*/
#Ingrediente más usado?

use Cervecerias;
select NombreIngrediente, max(t.cant)
from ingredientes i
left join (select idingrediente,count(idingrediente) as cant
    from ingredientexrecetas ir
    group by idingrediente) as t
on i.IdIngrediente = t.IdIngrediente

/*--2--*/ #igual a la 6 pero al revez?
/*Mostrar las Recetas que contengan un numero igual o menor al 
promedio total.*/
#promedio de ingredientes, hecho en el punto 6 aca solo saque el avg

#cantidad de ingredientes por cerveza
use Cervecerias;
select idreceta, count(idreceta) as'Cantidad ingredientes'
from ingredientexrecetas
group by idreceta

#avg de los ingredientes por cerveza
use Cervecerias;
select avg(t.count)
from (
select idreceta, count(idreceta) as count
from ingredientexrecetas
group by idreceta
) t

/*--3--*/
/*Mostrar las Recetas que contengan en si, los primeros 3 ingredientes.*/

/*devuelve todas las recetas que contienen al menos uno de los 3 primeros
deberia devoler la que tengas todos*/

use Cervecerias;
select idreceta
from ingredientexrecetas
where IdIngrediente in (select * from #double subquery because it doesn't like a limit there
                        (select IdIngrediente
                        from ingredientes
                        order by IdIngrediente
                        limit 3
                        )as t)
group by idreceta;

#alt
use Cervecerias;
select *
from ingredientexrecetas
join (select IdIngrediente
    from ingredientes
    order by IdIngrediente
    limit 6) as t
group by idreceta
use Cervecerias;

#chequear ingredienter por receta
use Cervecerias;
select i.IdIngrediente, NombreIngrediente
from ingredientexrecetas ir
inner join ingredientes i
on ir.IdIngrediente = i.IdIngrediente
where idreceta = 3

#query inclusive in
use Cervecerias;
select idreceta
from ingredientexrecetas
where IdIngrediente = (select * from 
                        (select IdIngrediente
                        from ingredientes
                        order by IdIngrediente
                        limit 1
                        )as t)
and IdIngrediente = (select * from 
                        (select IdIngrediente
                        from ingredientes
                        order by IdIngrediente
                        limit 1,1
                        )as t)
and IdIngrediente = (select * from 
                        (select IdIngrediente
                        from ingredientes
                        order by IdIngrediente
                        limit 2,1
                        )as t)
group by idreceta;

#query inclusive in
use Cervecerias;
select idreceta
from ingredientexrecetas
where IdIngrediente = 1
and IdIngrediente = 2
and 3

/*--4--*/
/*Listar las Cervezas que en su Receta contengan la mayor 
cantidad de Ingredientes.*/

use Cervecerias;
select c.idcerveza, nombreCerveza, idreceta, (select count(idreceta)
    from ingredientexrecetas ir
    where r.idreceta = ir.idreceta
    group by idreceta
    ) as'Cantidad Ingredientes'
from cervezas c
inner join recetas r
on c.idcerveza = r.idcerveza
group by c.idcerveza

/*alt method that enables to use order by, as you cant use it if
you make the subquery in the select, so you join a new table(subquery)
with the count in it, and replace the where with on, be careful as 
the ON now requires to use the name of the table (t.idreceta)*/
use Cervecerias;
select c.idcerveza, nombreCerveza, r.idreceta, ifnull(t.cantidad,0) as'Cantidad Ingredientes'
from cervezas c
inner join recetas r
on c.idcerveza = r.idcerveza
left join (select ir.idreceta,count(idreceta) as cantidad #left join because we want to list the ones that don't have ingredients
    from ingredientexrecetas ir
    group by ir.idreceta
    ) t on r.idreceta = t.idreceta 
group by c.idcerveza
order by t.cantidad desc

/*--5--*/
/*Mostrar las Receta con el ID 3, junto con la cantidad de Ingredientes
 que posee y en otra columna el promedio de ingredientes General.*/

use Cervecerias;
select r.idreceta, nombrereceta, t2.count as'Cantidad Ingredientes',(select avg(t.count)
from (select idreceta, count(idreceta) as count
from ingredientexrecetas
group by idreceta
) t) as promedio
from recetas r
join (select idreceta, count(idreceta) as count
from ingredientexrecetas ir
group by idreceta
) as t2 
on r.idreceta = t2.idreceta
where r.idreceta = 3

/*--6--*/
/*Mostrar las Recetas que superen el Promedio de ingredientes 
general (Simular Having).*/

select r.idreceta, r.nombrereceta, t.cant
from recetas r
left join (select idreceta, count(idreceta) as cant #cant as a subquery as you cant use count in where clause
    from ingredientexrecetas
    group by idreceta) t
on r.idreceta = t.idreceta
where cant >= (select avg(t2.count)
from (
select idreceta, count(idreceta) as count
from ingredientexrecetas
group by idreceta
) t2)

use Cervecerias;
select nombreCerveza, nombrereceta
from cervezas c
inner join (select r.idcerveza, nombrereceta
    from recetas r) t
on c.idcerveza = t.idcerveza