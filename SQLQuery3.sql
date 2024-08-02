use master
go
create database tpgrupal1
go
use tpgrupal1
go
create table distrito(
id_distrito int not null,
nombre varchar(50) not null
)
go
create table cliente(
ruc_cliente int not null,
nombre varchar(50) not null,
celular char(9) null,
direccion varchar(50) null,
id_distrito char(18) not null,
)
go
create table factura(
num_fact int not null,
fecha_emi date not null,
fecha_ven date not null,
ruc_cliente char(11) not null,
id_sucursal char(18) not null,
)
go
create table producto(
id_prod int not null,
stock_min char(10) not null,
stock_max char(50) not null,
stock_act char(50) not null,
precio char(5) not null,
id_cat int not null,
)
go
create table categoria(
id_cat int not null,
descripcion varchar(50) not null
)
go
create table sucursal(
id_sucursal int not null,
direccion varchar(50) not null,
telefono char(10) null,
nombre varchar(50) null,
id_distrito char(18) not null,
)
go
create table detallefact(
estado_fact varchar(15) not null,
cantidad char(5) not null,
valor_uni char(4) not null,
valor_total char(7) not null,
guia_rem varchar(20) not null,
num_fact char(18) not null,
id_prod char(18) not null,
)
go
alter table distrito
add primary key(id_distrito)
go
alter table categoria
add primary key(id_cat)
go
alter table cliente
add primary key(ruc_cliente)
go
alter table factura
add primary key(num_fact)
go
alter table producto
add primary key(id_prod)
go
alter table sucursal
add primary key(id_sucursal)
go
alter table producto
add foreign key(id_cat) references categoria(id_cat)
go
drop database bdtpgrupal
go
