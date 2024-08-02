use master
go
use bdmemorykings
go
--SQL - DML(Lenguaje de modificación de datos)
/*
  CRUD 
  insert
  update
  delete
  select
*/
/*
sintaxis 1
insert into <tabla>(campo1,campo2,...) 
values(valor1,valor2,...)
*/
insert into categoria(codcat,nomcat)
values(1,'disco duro')
go
/*
sintaxis 2
insert into <tabla> values(valor1,valor2,...)
*/
insert into categoria 
values(2,'microprocesador')
go
/*
Sintaxis 3
INSERT INTO tabla 
values((id1,valor1,valor2,..),
(id2,valor1,valor2,..),
(id2,valor1,valor2,..))
*/
insert into categoria 
values(3,'memoria'),(4,'monitor'),(5,'mainboard'),(6,'parlantes')
go
/*
Sintaxis 4
SELECT *
INTO tabla_destino
FROM tabla_origen
*/
select *
into xcategoria
from categoria
go
--elimina los registros de la tabla
truncate table xcategoria 
go
--Importar datos de un archivo externo csv a sql server
BULK INSERT xcategoria
FROM 'C:\Certus\2023\Base de datos con SQL Server\clase6\Book1.csv'
WITH(
     FIELDTERMINATOR=';',
	 ROWTERMINATOR='\n'
)
go
--Sentencia update
/*
sintaxis 1
update <tabla>
set campo1=valor1,campo2=valor2
where campo1=valor1
*/
--utilizando operadores aritméticos
update xcategoria
set nomcat='registro'
go
update xcategoria
set nomcat='registro actualizado'
where codcat<>3
go
update xcategoria
set nomcat='registro'
go
update xcategoria
set nomcat='registro actualizado'
where codcat>2
go
update xcategoria
set nomcat='registro'
go
--operadores lógicos
update xcategoria
set nomcat='registro actualizado'
where codcat>=2 and codcat<=3
go
update xcategoria
set nomcat='registro'
go
update xcategoria
set nomcat='registro actualizado'
where codcat BETWEEN 2 AND 3
go
update xcategoria
set nomcat='registro'
go
update xcategoria
set nomcat='número par'
where codcat%2=0
go
--SQL - Delete - Truncate
--Eliminar todos los registros
--sintaxis 1
--delete from <tabla>
delete from xcategoria
--sintaxis 2
--truncate table <tabla>
go
drop table xcategoria
go
--copiar los registro de la tabla categoria a la tabla xcategoria
select *
into xcategoria
from categoria
go
--elimina todos los registros de la tabla
truncate table xcategoria
go
BULK INSERT xcategoria
FROM 'C:\Certus\2023\Base de datos con SQL Server\clase6\Book1.csv'
WITH(
     FIELDTERMINATOR=';',
	 ROWTERMINATOR='\n'
)
go
delete from xcategoria
where codcat=3
go
delete from xcategoria
where nomcat='registro4'
go
delete from xcategoria
where codcat>1
go
--eliminar todos los registros de la tabla producto
delete from producto
go
alter table producto
drop column fvenpro
go
delete from producto
go
insert into Producto(idpro,despro,pvpro,stockminpro,stockactpro,codcat) 
values (1, 'Disco duro Sata', 500, 5, 10,1)
go
insert into Producto(idpro,despro,pvpro,stockminpro,stockactpro,codcat) 
values (2, 'microprocesador intel core i7',1500, 3, 9,2)
go
insert into Producto(idpro,despro,pvpro,stockminpro,stockactpro,codcat) 
values (3, 'memoria de 16 gb', 300, 10, 20,3)
go
insert into Producto(idpro,despro,pvpro,stockminpro,stockactpro,codcat)  
values (4, 'monitor let 17 pg', 800, 10, 20,4)
go
insert into Producto(idpro,despro,pvpro,stockminpro,stockactpro,codcat) 
values (5, 'mainboard asus primer', 500, 15, 30,5)
go
insert into Producto(idpro,despro,pvpro,stockminpro,stockactpro,codcat) 
values (6, 'parlantes iblue', 100, 12, 40,6)
go
insert into Producto(idpro,despro,pvpro,stockminpro,stockactpro,codcat)  
values (7, 'Disco duro maxel solido', 600, 10, 40,1)
go
insert into Producto(idpro,despro,pvpro,stockminpro,stockactpro,codcat) 
values (8, 'microprocesador amd ryzen serie 7', 1000, 20, 50,2)
go
insert into Producto(idpro,despro,pvpro,stockminpro,stockactpro,codcat)  
values (9, 'microprocesador amd ryzen serie 9', 1100, 10, 35,2)
go
insert into Producto(idpro,despro,pvpro,stockminpro,stockactpro,codcat) 
values (10, 'memoria de 8 gb',120, 20, 45,3)
go
--sentencia select
/*
select <campo1,campo2,...,*>
from <tabla>
where <campo>=<valor>
order by <campo> [tipo de ordenamiento asc-desc]
group by <campo>
having <campo_agrupado>=<valor>
*/
--mostrar datos de la tabla producto
--forma 1
select * from producto 
--forma 2
select idpro,despro,pvpro
from producto
--forma3
--mostrar datos de los campos con alias
select idpro,despro,pvpro as precioproducto
from producto
/*
mostrar datos de la tabla producto con filtros
utilizando operadores relaciones y lógicos 
*/
select * from producto
go
--mostrar los producto donde su precio de venta sea mayor 500
select * from producto
where pvpro>500
go
--mostrar el stock mínimo menores a 10
select * from producto
where stockminpro<10
go
--mostrar los productos que contengan en su descripción disco duro
select * from producto
where despro like '%disco duro%'
go
--muestra a todos los nombres productos que empiezan con la letra m
select * from producto
where despro like 'm%'
go
--muestra a todos los productos que en su tercera letra de la descripción es c
select * from producto
where despro like '__c%'
go
--muestra todos los producto donde su stock_actual se encuentra entre 10 a 20
select * from producto
where stockactpro>=10 and stockactpro<=20
go
select * from producto
where stockactpro between 10 and 20
go
--ordenar los datos de forma ascendente mediante su descripción
select * from producto
order by despro asc
go
--ordena de forma descendente el precio_venta
select * from producto
order by 3 desc
go
--mostrar datos de la tabla producto y la categoria
select p.idpro,p.despro,p.pvpro,c.nomcat
from producto as p,categoria as c
where p.codcat=c.codcat
go
select p.idpro,p.despro,p.pvpro,c.nomcat
from producto as p inner join categoria as c
on p.codcat=c.codcat