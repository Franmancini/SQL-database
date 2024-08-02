--activar la bd master
use master
go
--Uso de los DDL de SQL 
create database bdprueba
go
--activar la base de datos bdprueba 
use bdprueba 
go
--crear una tabla 
create table tabla1( 
 id int not null,
 nom varchar(50) null
 )
 go
 --agregar una PK
 alter table tabla1
 add primary key (id)
 go
 --agregar un campo
 alter table tabla1
 add pre money 
 go
 --modificar un campo
 alter table tabla1
 alter column pre float 
 go
 --eliminar un campo
 alter table tabla1
 drop column pre
 --eliminar una pk
 alter table tabla1
 drop PK__tabla1__3213E83FB3E634F1
 --eliminar a la tabla
 drop table tabla1 
 go
 use master 
 go
 --eliminar la bdprueba
 drop database bdprueba 

