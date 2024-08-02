--activa la base de datos master
use master
go
--utilizar procedimiento almacenados del sistema
sp_databases
go
use bdmemorykings
go
--visualiza información de la bdmemorykings
sp_helpdb bdmemorykings 
go
--muestar un conjunto de objetos de una bd
sp_help
go
--visualiza las tablas de la bdmemorykings--
sp_tables
go
--verificar la creación de los objetos tipo tabla
execute sp_tables @TABLE_TYPE="'TABLE'"
go
execute sp_tables @TABLE_TYPE="'VIEW'"
go
--visualizar la estructura de la tabla producto
sp_columns producto
go
--cambia el nombre de un objeto tipo tabla
sp_rename 'xcategoria','xxcategoria'
go
sp_tables
go
--visualiza las restricciones(constraint)de una tabla
sp_helpconstraint 'producto'
go
/*
procedimiento almacenado de usuario
sintaxis:
create procedure [nombre_procedimiento]
parametro1 tipo de dato y tipo de parametro in o out,
parametro2 tipo de dato y tipo...
as
  begin
  <sentencias sql>
  end
*/
--sp_columns xxcategoria
--crear un procedimiento almancenado que muestre los datos de la tabla xxcategoria
create procedure mostrarcategorias
as
select codcat,nomcat from xxcategoria
go
--verificar la creación del procedimiento alm
sp_stored_procedures
go
--ejecución 1 del procedimiento almacenado
mostrarcategorias
go
--ejecución 2 del procedimiento almacenado
exec mostrarcategorias
go
--visualizar el contenido del procedimiento
sp_helptext mostrarcategorias
go
--modificar el procedimiento
alter procedure mostrarcategorias
as
select * from xxcategoria
where codcat=1
go
--ejecución 1 del procedimiento almacenado
mostrarcategorias
go
--eliminar el procedimiento
drop procedure mostrarcategorias
go
--verificar la creación del procedimiento alm
sp_stored_procedures
go
/*
crear un procedimiento almacenado que permita mostrar la cantidad de registro
de la tabla producto
*/
create proc cantidadproducto
as
select count(*) as CantidadProductos from producto
go
--ejecución del procedimiento almacenado
cantidadproducto
go
/*
crear un procedimiento que permita mostrar una determinada 
cantidad de registro de la tabla producto
*/
create proc mostrarproductos
@xcanreg int --parametro de entada (in)
as
select top(@xcanreg) *
from producto
go
--ejecución del procedimiento almacenado
exec mostrarproductos 5
go
/*
crear un procedimiento que permita buscar
un registro especifico en la tabla producto
*/
sp_columns producto
go
create proc buscarproductos
@xid int --argumento de entada (input)
as
select idpro,despro,pvpro,stockminpro,stockactpro,codcat
from producto
where idpro=@xid
go
--ejecución del procedimiento almacenado
exec buscarproductos 2
go
/*
crear un procedimiento almacenado que permita buscar
un registro especifico por precio venta mediante un intervalo en la tabla producto
*/
create proc buscarproductosrangoprecio
@xprecio_venta1 money, --argumento de entada (input)
@xprecio_venta2 money
as
select idpro,despro,pvpro,stockminpro
from producto
where pvpro>=@xprecio_venta1 and pvpro<=@xprecio_venta2
go
--ejecución del procedimiento almacenado
exec buscarproductosrangoprecio 100,600
go
--proc alm, que permite recuperar el total de precio de venta de producto
create procedure totalprecioproductos
@total money output --permite devolver total de precio de productos
as
	select @total=sum(pvpro)
	from producto
go
--ejecución del procedimiento a,lmacenado con parametro de salida
declare @t money  --variable local en transact-sql
exec totalprecioproductos @t output
print 'La suma total de los precios de los productos es:' + 
cast(@t as varchar(20))
go
print @@version
go
--proc alm, que permite recuperar el promedio de precio de venta de producto
create procedure promedioprecioproductos
@xpromedio money output --permite devolver total de precio de productos
as
	select @xpromedio=avg(pvpro)
	from producto
go
--ejecución del procedimiento a,lmacenado con parametro de salida
declare @p money  --variable local en transact-sql
exec promedioprecioproductos @p output
print 'El promedio de los precios de los productos es:' +
cast(@p as varchar(20))
go
sp_columns producto
go
--crear un procedimiento almacenado que permita ingresar un producto
create procedure insertarproducto
@xidpro int,
@xdespro varchar(50),
@xpvpro money,
@xstockminpro int,
@xstockactpro int,
@xcodcat int
as
insert into producto
values(@xidpro,@xdespro,@xpvpro,
@xstockminpro,@xstockactpro,@xcodcat)
go
select * from producto
go
--ejecutar el procedimiento almacenado
exec insertarproducto 11,'memoria de 32 gb',120,25,50,3
go
--verificar la ejecución del procedimiento
select * from producto











