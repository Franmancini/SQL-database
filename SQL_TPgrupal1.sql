use master
go
create database bdtpgrupal
go
use bdtpgrupal
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
id_distrito int not null,
)
go
create table factura(
num_fact int not null,
fecha_emi date not null,
fecha_ven date not null,
ruc_cliente int not null,
id_sucursal int not null,
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
id_distrito int not null,
)
go
create table detallefact(
estado_fact varchar(15) not null,
cantidad char(5) not null,
valor_uni char(4) not null,
valor_total char(7) not null,
guia_rem varchar(20) not null,
num_fact int not null,
id_prod int not null,
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
alter table cliente
add foreign key(id_distrito) references distrito(id_distrito)
go
alter table sucursal
add foreign key(id_distrito) references distrito(id_distrito)
go
alter table factura
add foreign key(ruc_cliente) references cliente(ruc_cliente)
go
alter table factura
add foreign key(id_sucursal) references sucursal(id_sucursal)
go
alter table detallefact
add foreign key (num_fact) references factura(num_fact)
go
alter table detallefact
add foreign key (id_prod) references producto(id_prod)
go
insert into categoria(id_cat,descripcion)
values(1,'chompas de dralom'),(2,'chompas de orlon'),(3,'chompas de lana de alpaca'),(4,'chompas de baby alpaca'),(5,'chompas de cuero')
go
insert into distrito(id_distrito,nombre)
values(1,'Huancayo'),(2,'Miraflores'),(3,'Ayacucho'),(4,'Surco'),(5,'San jose')
go
insert into producto(id_prod,stock_min,stock_max,stock_act,precio)
values(1,'100','500','235','$280'),(2,'100','500','219','$100'),(3,'100','500','187','$600'),(4,'100','300','215','$550'),(5,'chompas de cuero')