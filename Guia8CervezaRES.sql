#===================================================
#Realizar las siguientes Consultas con Subconsultas
#===================================================

#1. Mostrar el nombre del ingrediente del que mas 
#cantidad haya.
Select IdIngredienteReceta, Count(*) as Cantidad
from 	 ingredientexrecetas
group by IdIngrediente
order by Cantidad desc
limit 1;

Select IdIngrediente
from 	 ingredientexrecetas
group by IdIngrediente
order by count(*) desc
limit 1;

select 	NombreIngrediente 
from 	ingredientes i
where 	i.IdIngrediente = (
Select IdIngrediente
from 	 ingredientexrecetas
group by IdIngrediente
order by count(*) desc
limit 1
);

#2. Mostrar las Recetas que contengan un numero igual o menor 
#al promedio total de ingredientes

select 	r.IdReceta, NombreReceta, count(*) as Cant
from  	recetas r 
join 	ingredientexrecetas ir
on 		r.IdReceta = ir.IdReceta
group by r.IdReceta, NombreReceta
order by cant desc;

Select  count(*) CantidadIngrediente
from 	 ingredientexrecetas
group by IdReceta;

Select avg(CantidadIngrediente)
from (Select  count(*) as CantidadIngrediente
from 	 ingredientexrecetas
group by IdReceta) cantidades;

select 	r.IdReceta, NombreReceta, count(*) as Cant
from  	recetas r 
join 	ingredientexrecetas ir
on 		r.IdReceta = ir.IdReceta
group by r.IdReceta
having Cant > (Select avg(CantidadIngrediente)
from (Select  count(*) CantidadIngrediente
from 	 ingredientexrecetas
group by IdReceta) cantidades);

#3. Mostrar las Recetas que contengan en si, 
#los primeros 3 ingredientes.
select 	IdIngrediente, count(*) as cant
from 	ingredientexrecetas
group by IdIngrediente 
order by count(*) desc
limit 3;

select 	distinct IdReceta 
from 	ingredientexrecetas ir
join 	(
select 	IdIngrediente, count(*) as cant
from 	ingredientexrecetas
group by IdIngrediente 
order by count(*) desc
limit 3) cantidades
on		ir.IdIngrediente = cantidades.IdIngrediente;

select 	distinct r.NombreReceta
from 	recetas r
join  	ingredientexrecetas ir
on		r.IdReceta = ir.IdReceta
join 	(
select 	IdIngrediente, count(*) as cant
from 	ingredientexrecetas
group by IdIngrediente 
order by count(*) desc
limit 3) cantidades
on		ir.IdIngrediente = cantidades.IdIngrediente;

#4. Listar las Cervezas que en su Receta contengan la mayor 
#cantidad de Ingredientes. Tomamos los 3 primeros.
select 	IdReceta
from 	ingredientexrecetas
group by IdReceta 
order by count(*) desc
limit 3;

select c.*
from 	cervezas c
join 	recetas r
on 		c.IdCerveza = r.IdCerveza
join (
select 	IdReceta
from 	ingredientexrecetas
group by IdReceta 
order by count(*) desc
limit 3) recetasFiltradas
on 		r.IdReceta = recetasFiltradas.IdReceta;

#5. Mostrar las Receta con el ID 3, junto con la cantidad de 
#Ingredientes que posee y en otra columna el promedio de 
#ingredientes General.
select 	r.NombreReceta, Count(*) Cantidad
from 	Recetas r 
join 	ingredientexrecetas ir
on		r.IdReceta = ir.IdReceta
where 	r.IdReceta = 3
group by r.IdReceta;

select 	r.NombreReceta, Count(*) Cantidad, 
((Select avg(CantidadIngrediente)
from (Select  count(*) CantidadIngrediente
from 	 ingredientexrecetas
group by IdIngrediente) cantidades)) PromedioGeneral
from 	Recetas r 
join 	ingredientexrecetas ir
on		r.IdReceta = ir.IdReceta
where 	r.IdReceta = 3
group by r.IdReceta;

#6. Mostrar las Recetas que superen el Promedio de 
#ingredientes general (Simular Having).
#la cantidad de ingredientes por recetas
Select  count(*) CantidadIngrediente
from ingredientexrecetas
group by IdReceta;

# para calcular el promedio de ingredientes por receta
Select avg(CantidadIngrediente)
from (Select  count(*) CantidadIngrediente
from ingredientexrecetas
group by IdReceta) promedio;

#las que superan el promedio usando having

select r.IdReceta, r.NombreReceta, count(*) as cant
from recetas r
join ingredientexrecetas ir
on r.IdReceta = ir.IdReceta
group by r.IdReceta, r.NombreReceta 
having cant > (Select avg(CantidadIngrediente)
from (Select  count(*) CantidadIngrediente
from ingredientexrecetas
group by IdReceta) promedio);

#resolucion utilizando Join
select r.IdReceta, r.NombreReceta, cantidades.cant
from recetas r
join (select ir.IdReceta, count(*) as cant
		from  ingredientexrecetas ir
        group by ir.IdReceta
) cantidades
on r.IdReceta = cantidades.IdReceta
where cantidades.cant > (Select avg(CantidadIngrediente)
from (Select  count(*) CantidadIngrediente
from ingredientexrecetas
group by IdReceta) promedio);


#Ejemplo Union
select nombrereceta from recetas
union 
select nombrecerveza from cervezas;
