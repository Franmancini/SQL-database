use Northwind
go
--punto 4 consultas utilizando la sentencia Select entre 2 tablas
select ProductID,ProductName,UnitPrice,UnitsInStock,c.CategoryID
from Products as p,Categories as c
where ProductID=c.CategoryID
go
select ProductID,ProductName,UnitPrice,UnitsInStock,s.SupplierID 
from Products as p,Suppliers as s
where ProductID=s.SupplierID
go
--punto 4 consultas utilizando la sentencia Select entre 3 tablas
select ProductID,ProductName,UnitPrice,UnitsInStock,c.CategoryID, s.SupplierID
from Products as p,Categories as c, Suppliers as s
where ProductID=s.SupplierID and ProductID=c.CategoryID
go
select OrderID,OrderDate,RequiredDate,c.CustomerID, e.EmployeeID
from Orders as o,Customers as c, Employees as e
where OrderID=e.EmployeeID and OrderID=c.CustomerID
go


--punto 5 consultas utilizando la sentencia Select con operadores relacionales
select * from Products
where UnitPrice>20
go
select * from Products
where UnitsInStock>=10 and UnitsInStock<=50
go
select * from Products
where ProductID%2=0
go
select * from Products
where SupplierID%2=0 and CategoryID%2=0
go
select * from Products
where UnitsInStock>=10 or UnitsInStock<=20
go
select count(*) as UnitsInStock 
from Products
go
select sum(UnitsInStock) as stockactual
from Products
go
select avg(UnitPrice) as valorunitario
from Products
go
select max(UnitPrice) as preciomaximo
from Products
go
select min(UnitPrice) as preciominimo
from Products
go
select c.CategoryID,count(p.UnitPrice) as cantidad
from Products as p,Categories as c
where p.CategoryID=c.CategoryID
group by c.CategoryID
having c.CategoryID%2=0

--punto 9 crear un login en la base de datos master utilizando DCL
use master
go
create login operador with password='password123'
go
--punto 10 crear el usuario con el nombre(operador) en la base de datos Northwind y asignar le acceso
use Northwind
go
CREATE USER operador FOR LOGIN operador
go
--punto 11 asignar permisos de solo lectura a la tabla Region utilizando la sentencia Grant
GRANT select ON Region TO operador
go
--punto 12 negar el permiso para insertar datos en la tabla Region utilizando la sentencia Deny
GRANT update ON Region TO operador
GRANT delete ON Region TO operador
go
deny insert to operador
go
insert into Region
values(5,'Sudoeste')
go
delete from Region
where RegionID=5
go
