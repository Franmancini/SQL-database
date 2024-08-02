--Comentarios en el lenguaje transact-sql
--comentario de una línea
/*
  línea 1
  línea 2
  línea 3
*/
/*
actvivar la base de datos del sistema y 
principal del sqlserver master
*/
use master
go
/*
crear una base de datos utilizando los DDL 
de SQL dentro SQL Server utilizando el Leng T-SQL
*/
/*
 create:crea objetos
 alter:modificar los objetos
 drop:eliminar los objetos
*/
--SQL - DDL
create database bdmemorykings
go
use bdmemorykings
go
--crear las tabla a la bd
create table distrito(
  iddis int not null,
  nomdis varchar(50) not null 
)
go
create table categoria(
 codcat int not null,
 nomcat varchar(50) not null
)
go
create table cargo(
  codcargo int not null,
  nomcargo char(20) not null
)
go
create table cliente(
 idcli int not null,
 nomcli varchar(50) not null,
 apelcli varchar(50) not null,
 dircli varchar(100) null,
 telcli char(9) null,
 correocli varchar(50) null,
 iddis int not null
)
go
--creando la restrinción de tipo primary key 
alter table distrito
add primary key(iddis)
go
alter table cliente
add primary key(idcli)
go
--crear la restricción(relación) tipo foreign key
alter table cliente
add foreign key(iddis) references distrito(iddis) 
go
create table producto(
  idpro int not null,
  despro varchar(50) not null,
  pvpro money null,
  stockminpro int null,
  stockactpro int null,
  fvenpro datetime null,
  codcat int not null
)
go
--crear la restricción primary key
alter table producto
add primary key(idpro)
go
alter table categoria
add primary key(codcat)
go
--crear la restrincción tipo foreign key
alter table producto
add foreign key(codcat) references categoria(codcat)
go
--crear la tabla empleado
create table empleado(
  codemp int not null,
  nomemp varchar(50) not null,
  apelemp varchar(50) not null,
  diremp varchar(100) null,
  ecemp char(1) null,
  neduemp char(15) null,
  iddis int not null,
  codcargo int not null
)
go
--agregar primary key a la cargo y empleado
alter table cargo
add primary key(codcargo)
go
alter table empleado
add primary key(codemp)
go
--agregar la relación entre la tabla cargo y empleado
alter table empleado
add foreign key(codcargo) references cargo(codcargo)
go
use master
go
use bdmemorykings
go
--eliminar una tabla
drop table distrito
go
drop table cliente
go
drop table categoria
go
drop table producto
go
alter table producto
drop FK__producto__codcat__49C3F6B7
go
--modificando un campo a la tabla
alter table distrito
alter column nomdis char(15) not null
go
--agregar un campo a la tabla
alter table distrito
add poblacion int null
go
--eliminar un campo a la tabla
alter table distrito
drop column poblacion
go
create database bdprueba
go
use bdprueba
go
create table prueba
(
 id int NOT NULL identity,
 nom varchar(10) null
)
use master
--eliminar la base de datos
drop database bdmemorykings









